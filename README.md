# gyazo in docker
## 概要
ローカルにgyazoサーバを建てることができるコンテナです。

## 使い方
1. このレポジトリをdockerホストにクローンする`git clone https://github.com/gitnira/gyazo_in_docker`
2. `./Dockerfile`内のサーバアドレスを自前のサーバアドレスに変更する
3. ビルドする`docker build -t gind:1.0 .`
4. 開けたいポートを指定してdocker runする`docker run -d -p 80:80 gind:1.0`

## gyazoクライアント側の設定
Windowsは[これ](https://github.com/k725/GyazoPlus)を使えば楽にできます