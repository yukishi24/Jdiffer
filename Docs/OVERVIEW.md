# Scrum Development Overview

このドキュメントは  
**このリポジトリで採用しているスクラム運用の全体像を一目で把握するための資料**である。

詳細は各ドキュメントに委ね、  
ここでは「流れ」と「役割」だけを整理する。

---

## 全体像（結論）

```
Product Vision
↓
Roadmap
↓
User Story（md）
↓
Sprint Planning
↓
Sprint（Milestone）
↓
Issue（Feature / Task）
↓
Sprint Retro
↺ 改善
```

---

## 1. 各要素の役割対応表

| 要素            | 管理場所                  | 役割               |
| --------------- | ------------------------- | ------------------ |
| Product Vision  | `docs/product-vision.md`  | なぜ作るか         |
| Roadmap         | `docs/roadmap.md`         | どこへ向かうか     |
| User Story      | `docs/user-stories/`      | 何を提供するか     |
| Sprint Planning | `docs/sprint-planning.md` | 何をやるか決める   |
| Sprint          | GitHub Milestone          | いつやるか         |
| Feature / Task  | GitHub Issue              | どう作るか         |
| Retro           | `docs/sprint-retro.md`    | どう改善するか     |
| ADR             | `docs/adr/`               | なぜそう設計したか |

---

## 2. 開発の基本ルール（超要約）

- GitHub で管理するのは **Sprint Backlog のみ**
- 中長期の構想は **すべて md 管理**
- Sprint 中にスコープは増やさない
- 迷ったら Vision → Roadmap → Story の順で戻る

---

## 3. スクラムイベントと成果物

### Product Vision

- 作成：プロジェクト開始時
- 更新：Sprint 境界のみ
- 目的：判断軸の固定

---

### Roadmap

- 単位：フェーズ
- 詳細日付：書かない
- 目的：方向性の共有

---

### User Story

- 管理：Markdown
- Issue にはしない
- Feature の親概念

---

### Sprint Planning

- 所要時間：最大30分
- 成果物：
  - Sprint Milestone
  - Sprint Backlog（Issue）

---

### Sprint

- 単位：Milestone
- 期間：1〜2週間
- 開始後は変更しない

---

### Issue（Feature / Task）

- Sprint 中に Close する前提
- size / priority は必須
- Sprint Backlog の最小単位

---

### Sprint Retro

- 所要時間：10分
- Try は 1つだけ
- 毎 Sprint 必ず実施

---

### ADR

- 迷った設計判断のみ記録
- 実装内容は書かない
- 判断の履歴として残す

---

## 4. GitHub 上での見え方

- Issue = 今やる作業
- Milestone = 今の Sprint
- Label = 状態・種別・見積の唯一の真実
- Project Board = 作業中の可視化

---

## 5. 判断に迷ったときの戻り先

| 迷いの種類     | 見るべきもの   |
| -------------- | -------------- |
| この機能いる？ | Product Vision |
| 今やるべき？   | Roadmap        |
| 何を作る？     | User Story     |
| どう作る？     | Issue          |
| なぜこの設計？ | ADR            |
| 進め方が悪い   | Retro          |

---

## 6. このスクラム基盤の狙い

- 考えるコストを減らす
- 継続できる形にする
- 個人開発を破綻させない

この仕組みは  
**速さよりも「続くこと」を優先している**。

---

## 最後に

この Overview を読んで  
全体像が思い出せないなら、運用は複雑すぎる。

迷ったら削れ。
