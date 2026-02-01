#!/usr/bin/env bash
set -e

#######################################
# 定数
#######################################
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ENV_FILE="$SCRIPT_DIR/GITHUB.env"
LABEL_JSON="$SCRIPT_DIR/labels.json"

#######################################
# ログ
#######################################
log() {
  echo "[INFO] $*"
}

log_error() {
  echo "[ERROR] $*" >&2
}

#######################################
# コマンド存在チェック
#######################################
check_command() {
  local cmd="$1"
  log "check command: $cmd"

  if ! command -v "$cmd" >/dev/null 2>&1; then
    log_error "$cmd がインストールされていない"
    exit 1
  fi

  log "$cmd OK"
}

#######################################
# env 読み込み
#######################################
load_env() {
  log "load env: $ENV_FILE"

  if [[ ! -f $ENV_FILE ]]; then
    log_error "$ENV_FILE が存在しない"
    exit 1
  fi

  set -a
  source "$ENV_FILE"
  set +a

  log "env loaded"
}

#######################################
# 必須 env チェック
#######################################
require_env() {
  local var="$1"
  log "check env: $var"

  if [[ -z ${!var} ]]; then
    log_error "$var が $ENV_FILE に定義されていない"
    exit 1
  fi

  log "$var OK"
}

#######################################
# GitHub 接続確認
#######################################
check_github_connection() {
  log "check GitHub connection"

  if ! gh auth status >/dev/null 2>&1; then
    log_error "GitHub に接続できない（認証失敗）"
    exit 1
  fi

  log "GitHub connection OK"
}

#######################################
# 全 Issue Label 削除（完全版）
#######################################
delete_all_issue_labels() {
  local repo="$GITHUB_ACCOUNT/$GITHUB_REPO"
  log "delete all issue labels: $repo"

  while :; do
    log "fetch label count"

    local response
    response=$(curl -s \
      -H "Authorization: Bearer $GITHUB_TOKEN" \
      -H "Accept: application/vnd.github+json" \
      "https://api.github.com/repos/$repo/labels?per_page=1")

    local count
    count=$(echo "$response" | jq 'length')

    log "current label count: $count"

    [[ "$count" -eq 0 ]] && break

    local label
    label=$(echo "$response" | jq -r '.[0].name')

    [[ -z "$label" ]] && break

    local encoded
    encoded=$(jq -rn --arg v "$label" '$v|@uri')

    log "delete label: $label"

    local http_code
    http_code=$(curl -s -o /dev/null -w "%{http_code}" \
      -X DELETE \
      -H "Authorization: Bearer $GITHUB_TOKEN" \
      -H "Accept: application/vnd.github+json" \
      "https://api.github.com/repos/$repo/labels/$encoded")

    if [[ "$http_code" == "204" ]]; then
      log "  ✅ $label deleted"
    else
      log_error "  ❌ $label delete failed (HTTP $http_code)"
      exit 1
    fi
  done

  log "all labels deleted"
}

#######################################
# Issue Label 一覧取得
#######################################
list_issue_labels() {
  log "fetch issue labels: $GITHUB_ACCOUNT/$GITHUB_REPO"
  gh label list --repo "$GITHUB_ACCOUNT/$GITHUB_REPO"
}

#######################################
# labels.json から Issue Label 作成
#######################################
create_issue_labels_from_json() {
  local repo="$GITHUB_ACCOUNT/$GITHUB_REPO"
  log "create issue labels from json: $LABEL_JSON"

  [[ ! -f "$LABEL_JSON" ]] && {
    log_error "$LABEL_JSON が存在しない"
    exit 1
  }

  local total
  total=$(jq 'length' "$LABEL_JSON")
  log "labels to create: $total"

  for i in $(seq 0 $((total - 1))); do
    local name color desc
    name=$(jq -r ".[$i].name" "$LABEL_JSON")
    color=$(jq -r ".[$i].color" "$LABEL_JSON")
    desc=$(jq -r ".[$i].description" "$LABEL_JSON")

    log "create label: $name"

    local http_code
    http_code=$(curl -s -o /dev/null -w "%{http_code}" \
      -X POST \
      -H "Authorization: Bearer $GITHUB_TOKEN" \
      -H "Accept: application/vnd.github+json" \
      "https://api.github.com/repos/$repo/labels" \
      -d "$(jq -n \
        --arg name "$name" \
        --arg color "$color" \
        --arg desc "$desc" \
        '{name:$name,color:$color,description:$desc}')")

    case "$http_code" in
      201) log "  ✅ $name created" ;;
      422) log "  ⚠️  $name already exists (skip)" ;;
      *)   log_error "  ❌ $name create failed (HTTP $http_code)"; exit 1 ;;
    esac
  done

  log "label creation finished"
}

#######################################
# main
#######################################
main() {
  log "start"

  check_command gh
  check_command jq

  load_env

  require_env GITHUB_TOKEN
  require_env GITHUB_ACCOUNT
  require_env GITHUB_REPO

  check_github_connection

  list_issue_labels
  delete_all_issue_labels
  create_issue_labels_from_json
  list_issue_labels

  log "end"
}

main "$@"
