## アプリ名
### Fodmaplab（フォドマップラボ）
URL: http://35.72.117.112/

## 概要
過敏性腸症候群を持つ人に適した食事療法を「低FODMAP食」と呼びます。このサイトは誰もがFODMAP食のレシピを投稿し、シェアする場として作成されています。<br>
その他にも記事の投稿やFodmap食品の一覧など、過敏性腸症候群を持つ人に役立つWebアプリケーションとして構成されています。

## 開発のきっかけ
日本では成人の５人に１人が過敏性腸症候群と言われており、この食事療法（FODMAP）は75～80％の人に効果があるという研究があります。<br>
私自身、長年過敏性腸症候群に悩まされており、一番改善に効果があったのがこの食事療法でした。この食事療法は食べていい食材、ダメな食材があり、その情報がまとまっているサイトに需要があると考えました。<br>
さらに、この食事療法を扱うレシピサイトが他に存在しなかったため、過敏性腸症候群に苦しむ人が独自のレシピをシェアできる場として価値があると考えました。<br>
現在は、日本ではまだまだ認知度の低い食事療法ですが、認知度が高まるにつれこのサイトのPVも高まると考えています。

## AWS 構成図
![AWS構成図](./AWS構成図.png)
### ※金銭的な都合上、現在一部機能停止中です。

## ER図
![Fodmap](./fodmaplab_er.png)

## 使用技術
* HTML/CSS
* Ruby 2.6.6
* JavaScript/jQuery/Ajax
* Ruby on Rails 6.0.3.4
* SQLite3
* Bootstrap 5
* AWS EC2 (Amazon Linux2)/RDS(Mysql)/S3/VPC/IAM
* Linux(各種コマンド操作)
* Nginx(Web Server)
* Unicorn(Application Server)

## 機能
### レシピ投稿機能
* 新規投稿機能
* レシピ写真投稿（javascript/gem(carrierwava)
* 食材や作業工程を複数投稿(gem(cocoon))
* 投稿編集/削除

### ユーザー機能
* ログイン/ログアウト機能（Gem(devise))
* Googleログイン機能
* ゲストログイン機能
* ユーザー削除機能
* ユーザー詳細ページ

### 検索機能
* キーワード検索機能

### いいね機能
* いいね機能(Ajax)
* いいね数表示

### 今後実装予定
* 広告表示
* 記事投稿機能
* 検索サジェスト機能
* 検索結果ソート機能


