# Milestone（Sprint）命名規則と運用ルール

このプロジェクトでは **Milestone = Sprint** と定義する。  
Milestone は進捗管理・作業管理のためにのみ使用し、  
Epic やリリース管理には使用しない。

---

## 1. 命名規則

### 形式

Sprint-YYYY-MM-DD

### 意味

- `YYYY-MM-DD` は **Sprint 開始日**
- Sprint 番号は使用しない

### 例

- Sprint-2026-01-01
- Sprint-2026-01-15

#### この命名規則を採用する理由

- 並び順が自動で保証される
- 過去 Sprint を日付で追える
- 番号管理という無駄な作業を排除できる

---

## 2. Sprint 期間

- 原則：**1週間**
- 最大：**2週間まで**
- 3週間以上は禁止

理由：

- 個人開発では集中力が持続しない
- フィードバックサイクルを短く保つため

---

## 3. Milestone 作成タイミング

- **Sprint Planning の開始時に作成する**
- Planning が完了するまで Issue を入れない

Milestone は  
「今回の Sprint でやることが決まったあと」に完成する。

---

## 4. Milestone に含めてよい Issue

以下の Issue のみ含めてよい。

- Feature
- Task
- Bug
- Spike

### 条件

- size ラベルが付与されている
- priority ラベルが付与されている
- 今 Sprint 中に Close する覚悟がある

---

## 5. Milestone に含めてはいけないもの

- User Story（md）
- 将来やるか未確定な Issue
- 調査だけで終わる Issue
- 依存関係が未解決な Issue

---

## 6. Sprint 中の運用ルール

- Sprint 開始後は以下を行わない
  - Milestone の変更
  - Issue の追加

### 例外

- 緊急度の高いバグ修正のみ許可
- 原則 1 件まで
- 追加理由を Issue に明記する

---

## 7. Sprint 終了時の扱い

### Milestone を Close する条件

- Sprint 期間が終了した
- Issue がすべて Done  
  **または**
- 未完了 Issue の扱いを決定した

---

### 未完了 Issue の扱い（必須）

Sprint 終了時、未完了 Issue は必ず以下のいずれかを選択する。

- 次 Sprint に入れ直す
- Scope を削って Close する
- Milestone を外して Backlog に戻す
- Issue 自体を破棄する

※ 放置は禁止

---

## 8. Sprint 終了後に必ずやること

- Milestone を Close する
- Close できた Issue 数を確認する
- Close できなかった理由を一言メモする

※ 詳細な振り返りは Sprint Retro で行う

---

## 9. この運用の狙い

- Sprint を「約束」にする
- やり切る感覚を作る
- 個人開発を惰性にしない

Milestone を Close することが  
**Sprint 完了の合図**である。
