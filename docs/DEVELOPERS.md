# Scoop 公式テンプレートを使った GitHub 設定手順

以下は `ScoopInstaller/BucketTemplate` を使って作った自分専用 bucket リポジトリの GitHub 側設定の流れです。

## 1. テンプレートからリポジトリを作る

1. ブラウザで `ScoopInstaller/BucketTemplate` のページを開く。
2. 右上の「Use this template」ボタンを押す。
3. 次の項目を設定して「Create repository from template」。
   - Repository name: 好きな bucket 名（例: `my-bucket`）
   - Owner: 自分のアカウント
   - Public / Private: 好みで

## 2. GitHub Actions を有効化する

1. 自分の bucket リポジトリを開く。
2. 上部タブから `Settings` → `Actions` → `General` に移動。
3. 「Actions permissions」セクションで
   `Allow all actions and reusable workflows` を選択して `Save`。

## 3. Workflow の書き込み権限を許可する

1. 同じ画面 (`Settings` → `Actions` → `General`) の下の方にある
   「Workflow permissions」セクションを探す。
2. `Read and write permissions` を選択して `Save`。

これで GitHub Actions からリポジトリへの push / PR 作成などができるようになります。

## 4. README を自分用に書き換える

1. リポジトリトップにある `README.md` を開く。
2. 「Edit」ボタンから、bucket の説明やインストール方法を自分用に修正する。例:

```powershell
scoop bucket add my-bucket https://github.com/<your-id>/my-bucket
scoop install my-app
```

## 5. `bin/auto-pr.ps1` の設定を直す（任意）

1. `bin/auto-pr.ps1` を開く。
2. 中にあるリポジトリ名のプレースホルダを、自分のリポジトリに置き換える。

```powershell
$repo = "<your-name>/<your-bucket-repo>"
```

これにより、自動更新系のワークフローが正しく自分の bucket に対して PR を出せるようになります。

## 6. manifest を追加する

1. `bucket/` フォルダ内に `<app-name>.json` を作成する（テンプレートがあればそれをコピーしてリネーム）。
2. `version`, `url`, `hash`, `bin` などを自分のアプリに合わせて編集する。
3. コミット & push:

```powershell
git add bucket/my-app.json
git commit -m "Add my-app manifest"
git push
```

## 7. GitHub Actions が動くことを確認する

1. GitHub の `Actions` タブを開き、テスト用 / 自動更新用の workflow が実行されているか確認する。
2. 失敗していたらログを開き、manifest や設定ファイルを修正して再度 push する。

## 8. bucket をローカルから使う

1. Windows 側で PowerShell を開き、以下を実行:

```powershell
scoop bucket add my-bucket https://github.com/<your-id>/my-bucket
scoop install my-app
```

2. インストールできれば、GitHub 設定と manifest が正しく機能している。

## 9. Scoop Directory に載せたい場合（任意）

1. GitHub リポジトリのトップページ右側の「About」付近にある「Topics」を編集する。
2. `scoop-bucket` というトピックを追加する。

これで Scoop 関連の検索からも bucket を見つけてもらいやすくなります。
