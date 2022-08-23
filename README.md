# ながのCAKE

長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイトです。


# 案件の背景

元々近隣住民が顧客様でしたが、昨年始めたInstagramから人気となり、全国から注文が来るようになりました。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至りました。

# 通販について

-   通販では注文に応じて製作する受注生産型としています。
    
-   現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けません。
    
-   送料は1配送につき全国一律800円です。
    
-   本来は軽減税率により宅配物は税率8%ですが、今回は10%で統一します。
    
-   友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できます。
    
-   支払方法はクレジットカード、銀行振込から選択できます。

# 用語の定義
- 顧客<br>ながのCAKEの商品を購入する人（客）。

- 会員　<br>ECサイトにユーザ登録している顧客。
- ECサイト<br>顧客が利用するサイト。
- 管理サイト<br>店で働く事務員・パティシエ等が利用するサイト（管理者用サイト）。
- 注文ステータス<br>　注文の状態遷移を表します。<br>「入金待ち」「入金確認」「製作中」「発送準備中」「発送済み」の５パターンがあります。
- 製作ステータス<br>注文に紐付く注文商品の状態遷移を表します。<br>「着手不可」「製作待ち」「製作中」「製作完了」の４パターンがあります。
- 販売ステータス<br>商品の販売状況を表し、「販売中」「売切れ」の2パターンがあります。<br>販売停止商品は「売切れ」をセットします。
- 会員ステータス<br>「有効」「退会」の2パターンがあります。
- ジャンル<br>商品の種類で、「ケーキ」「プリン」「焼き菓子」「キャンディ」の4ジャンルあります。
- 注文個数<br>1回の注文に紐付く注文個数の合計。<br>例）商品Aを3個、商品Bを2個注文→注文個数は5。
- 商品小計<br>商品単価（税込）×個数。<br>例）1,200円（税込）の商品を2個購入＝商品小計は2,400円。

# 実装機能

## 会員側

-   顧客様は会員登録、ログイン・ログアウト、退会ができます。
    
-   会員のログインはメールアドレスとパスワードで行います。
    
-   会員がログインしている状態かどうか、ページのヘッダーにユーザ名を表示するなどして判断できるようにします。
    
-   サイトの閲覧はログインなしで行えます。
    
-   商品をカートに入れ、1度に複数種類、複数商品の購入ができます。また、カート内の商品は個数変更・削除ができます。
    
-   カートへの商品追加はログインなしでは行えません。
    
-   クレジットカード情報はシステム上保持しません。
    
-   会員は配送先を複数登録しておくことが可能です。
    
-   会員はマイページから下記が行えます。
     <br>★ユーザ情報の閲覧・編集
     <br>★注文履歴の閲覧
     <br>★配送先の閲覧・編集
    

-   注文履歴一覧には下記の情報が表示されます。
     <br>★注文日
     <br>★配送先
     <br>★支払金額（商品合計＋送料）
     <Br>★注文ステータス
    
-   注文履歴詳細には下記の情報が表示されます。
    <br>★注文日
    <br>★配送先
    <br>★支払方法
    <br>★注文ステータス
    <br>★商品の注文内容詳細（商品名、単価、個数、小計）
    <br>★請求情報（商品合計、送料、支払金額）
    

-   会員登録時、下記の情報をユーザ情報として入力できます。
    <br>★名前（姓・名）
    <br>★名前（カナ姓・カナ名）
    <br>★郵便番号
    <br>★住所
    <br>★電話番号
    <br>★メールアドレス
    <br>★パスワード

-   商品は税込価格で表示されます。
    
-   ジャンルごとに商品が表示できる機能があります。

## 管理者側（店側）

-   管理者用メールアドレスとパスワードでログインできます。
    
-   商品について、下記が行えます。
    <br>★新規追加、編集、閲覧
    <br>★販売停止（売切表示）
    
- 商品情報は下記のものを持ちます。
    <br>★商品名
    <br>★商品説明文
    <br>★ジャンル
    <br>★税抜価格
    <br>★商品画像
    <br>★販売ステータス
    
-   会員登録されているユーザ情報の閲覧、編集、退会処理が行えます。
    
-  ユーザの注文履歴が一覧・詳細表示でき、下記の情報が表示されます。  
  【注文履歴一覧】
    <br>★購入日時
    <br>★購入者
    <br>★注文個数
    <br>★注文ステータス
    
【注文履歴詳細】
 　<br>★購入者
 　　<br>★注文日
 　　<br>★配送先
 　　<br>★支払方法
 　　<br>★料金（商品合計、送料、請求金額合計）
 　　<br>★注文ステータス
 　　<br>★各注文商品詳細（商品名、単価(税込)、数量、小計）
 　　<br>★各注文商品の製作ステータス
  
-   注文ごとに注文ステータスの更新、注文商品ごとに製作ステータスの更新ができます。

# 使用言語

・HTML&CSS  
・Ruby  
・JavaScript  
・フレームワーク  
⚪︎Ruby on Rails (6.1.6)


# Gem

・bootstrap  
・devise  
・jquery
<br>・kaminari  
・pry-byebug

# 作成者

浅井美樹(https://github.com/mmm1616/nagano_cake)
