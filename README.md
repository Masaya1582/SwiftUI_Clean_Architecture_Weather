# ☀️ SwiftUI Clean Architecture Weather（日本語版）

このアプリは、**SwiftUI × Clean Architecture** を使ったシンプルな天気アプリです。  
クリーンな構造とテストしやすい設計を意識して最低限の構成で作ってます。  
勉強用にどうぞ。

---

## 📱 主な機能

- 🌍 都市名で天気を検索
- 🌡️ 現在の気温と天気情報を表示
- 🎨 天気に応じてUIの色やアイコンを自動変更
- 🧼 Clean Architecture で構成を明確に分離
- 🔄 async/await + OpenWeather API 使用

---

## 🧠 アーキテクチャ構成

```
Presentation
├── View              ← SwiftUI画面
├── ViewModel         ← 状態管理＆ロジック
└── UIComponent       ← 共通UIパーツ

Domain
├── Model             ← アプリ内部で使うデータ型
├── UseCase           ← ビジネスロジック（処理の中核）
└── Repository        ← データ取得用プロトコル

Data
├── RepositoryImpl    ← Repositoryの実装
├── APIClient         ← ネットワーク通信処理
└── DTO               ← APIレスポンスを受け取る構造体
```

> ✅ 単方向の依存関係なので、**上位レイヤは下位レイヤの詳細を知らなくてOK**。  
> → テストしやすく、メンテナンスも超ラク。

---

## 🔧 使い方

1. このリポジトリをクローン  
2. `WeatherAPIClient.swift` の中にAPIキーを記入：

   ```swift
   private let apiKey = "YOUR_API_KEY"
   ```

3. Xcodeでビルドして実行！

---

## 🧪 テストしやすい理由

このプロジェクトではプロトコルベースのDI（依存性注入）を使っているため：

- モックを使った単体テストが簡単
- SwiftUIのプレビューでもモック表示できる
- 上位レイヤが下位レイヤの実装を意識しなくていい

---

## 🌈 スクリーンショット
<img src="https://github.com/user-attachments/assets/8a61abce-0f88-4410-aaa6-72b9ae39a113" width="300" />

---

## 🤔 なぜClean Architecture？

- UIとロジックをしっかり分離できる
- 機能追加や拡張がラク
- テストしやすい
- 規模が大きくなっても耐えられる

---

## ✅ 拡張機能の案

- [ ] モックを使ったUnit Test追加
- [ ] SwiftUIプレビュー用のモック表示
- [ ] 天気予報（週間）機能の追加

---

## 📄 ライセンス

MIT
