# Sprint Planning チェックリスト

このチェックリストは **Sprint 開始時に必ず上から順に実施する**。  
所要時間は **最大30分**。これ以上かけない。

---

## 0. Sprint の前提確認

- [ ] 今回の Sprint 期間を決めた（1週 or 2週）
- [ ] Milestone を作成した
  - 命名規則：`Sprint-YYYY-MM-DD`
- [ ] 前 Sprint の Milestone は Close した

---

## 1. User Story の確認（GitHubは見ない）

場所：`docs/user-stories/`

- [ ] 今回 Sprint で進めたい User Story を読む
- [ ] 目的・価値を理解した
- [ ] Acceptance Criteria を再確認した
- [ ] 今 Sprint で「どこまでやるか」を決めた

※ Story 全体を完了させる必要はない  
※ **やらない部分を明確にする**

---

## 2. Feature Issue の準備

- [ ] 対応する Feature Issue を起票 or 選定した
- [ ] Feature Issue に User Story ID（US-XXX）が書かれている
- [ ] Scope が「今回 Sprint の範囲」になっている
- [ ] Acceptance Criteria が Feature レベルで定義されている

---

## 3. Task への分解（必要な場合のみ）

- [ ] Feature が大きすぎないか確認した
- [ ] 1日以上かかるものは Task に分解した
- [ ] Task は Feature Issue に紐づいている

※ 無理に分解しない  
※ 1 Feature = そのまま作れるなら Task は不要

---

## 4. 見積・優先度付け

- [ ] すべての Issue に size を付けた
- [ ] すべての Issue に priority を付けた
- [ ] 今 Sprint に詰め込みすぎていない

判断基準：

- **余裕があるくらいが正解**
- 個人開発で詰め込みは事故る

---

## 5. Sprint Backlog の確定

- [ ] 今回 Sprint に入れる Issue を決めた
- [ ] Milestone に紐付けた
- [ ] status を `status:ready` にした

この時点で：

- GitHub Issue = Sprint Backlog
- それ以外は「存在しないもの」として扱う

---

## 6. Project Board の確認

- [ ] Board に Issue が表示されている
- [ ] 列が正しい（Backlog / Doing / Review / Done）
- [ ] 今日やる最初の Issue が決まった

---

## 7. 最終確認（超重要）

- [ ] 今 Sprint のゴールを一言で言える
- [ ] 「やらないこと」を把握している
- [ ] この Sprint を楽しめそうか

※ 楽しくなさそうなら詰め込みすぎ  
※ 1つ Issue を外せ

---

## 原則

- Sprint 中に Issue を追加しない
- 追加したくなったら Backlog（次 Sprint）へ
- Sprint は守る、スコープを守る

---

## このチェックリストの目的

- 考えることを減らす
- 迷わず始める
- 個人開発を継続させる

Sprint Planning は「考える場」ではなく  
**「決める場」**である。
