FROM ubuntu/apache2:2.4-20.04_beta

# upload.cgiはrubyで動く
RUN apt-get update && apt-get install -y wget \
    ruby

# apache2のcgiモジュールの有効化    
RUN a2enmod cgi

# apache2の設定ファイル内でcgiを読み込むように設定する
RUN sed -i "s/#AddHandler cgi-script .cgi/AddHandler cgi-script .cgi/" /etc/apache2/mods-available/mime.conf
RUN sed -i "1,/Options Indexes FollowSymLinks/s/Options Indexes FollowSymLinks/Options Indexes FollowSymLinks ExecCGI/" /etc/apache2/apache2.conf

# スクリーンショットを保存するディレクトリを作成する
# 公式からcgiをもってくる
RUN install -d -m 755 -g www-data -o www-data /var/www/html/data
RUN install -d -m 755 -g www-data -o www-data /var/www/html/db
RUN wget -O /var/www/html/upload.cgi https://raw.githubusercontent.com/gyazo/Gyazo/master/Server/upload.cgi
RUN chown www-data:www-data /var/www/html/upload.cgi
RUN chmod +x /var/www/html/upload.cgi

# http://gyazo.comを自分のサーバアドレスに変更する
RUN sed -i "s/\"http:\/\/gyazo.com/\"http:\/\/localhost\/data/" /var/www/html/upload.cgi
RUN service apache2 restart