# User Stories 運用ルール

このディレクトリは **Product Backlog（要求・仕様）の正** を管理する場所である。  
GitHub Issue は作業管理専用であり、User Story は **ここ（md）でのみ管理する**。

---

## 1. User Story の位置づけ

- User Story は **ユーザー価値・意図・仕様** を表す
- 実装・進捗・完了状態は持たない
- **Close / Done の概念は存在しない**

User Story は「生きた仕様書」であり、作業チケットではない。

---

## 2. ファイル作成ルール（重要）

### 作成方法

- 新しい User Story は **必ず `TEMPLATE.md` を複製して作成する**
- 直接ゼロから書いてはいけない

### 手順

1. `TEMPLATE.md` をコピーする
2. ファイル名を `US-XXX.md` に変更する
3. Story ID / Title / 各項目を埋める

目的：

- 記述粒度を揃える
- 必須項目の抜け漏れを防ぐ
- Story の品質を安定させる

---

## 3. ファイル命名規則

- 形式：`US-XXX.md`
- 例：
  - `US-001.md`
  - `US-002.md`

### ルール

- ファイル名の ID は一意であること
- ID は **Issue / PR / Commit から参照可能**にする

---

## 4. 記述ルール

### 必須項目

User Story には最低限、以下を含める。

- User Story（As a / I want / So that）
- Background / Context
- Acceptance Criteria（High-level）

### 任意項目

- Constraints / Non-goals
- Related Features
- Change Log

---

## 5. User Story に書いてはいけないこと

以下は **書かない**。

- 実装方法
- 技術詳細
- タスク分解
- Sprint 情報
- 進捗状態（Doing / Done 等）

これらは **GitHub Issue の責務**。

---

## 6. GitHub Issue との関係

### 原則

- Feature Issue / Task Issue は **必ず対応する User Story を参照する**
- Issue 側に Story ID（US-XXX）を明記する

### 関係性

- 1 User Story → 複数 Feature：OK
- 1 Feature → 複数 User Story：NG（価値が混ざるため）

---

## 7. Sprint との関係

- User Story は **Sprint に属さない**
- Sprint 開始時に：
  1. User Story を確認する
  2. 今回 Sprint で実装する範囲を決める
  3. Feature Issue を起票 or 選定する

GitHub に現れるのは **Sprint Backlog のみ**。

---

## 8. 更新ポリシー

- User Story は **いつでも更新してよい**
- 実装後に気づいた仕様の修正も反映する
- 更新した場合は Change Log に簡単に記録する（任意）

---

## 9. この設計の意図

- 仕様（Why / What）と作業（How）を分離する
- Backlog を腐らせない
- 個人開発でも全体像を見失わない

**User Story = 思考の置き場**  
**GitHub Issue = 手を動かす場所**

この役割分担を崩さないこと。
