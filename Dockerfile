FROM ubuntu:14.04

ENV githubToken=0
RUN apt-get update -y
RUN apt-get install software-properties-common -y --force-yes
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update -y
RUN apt-get install apache2 make build-essential zip -y --force-yes
RUN apt-get install mysql-server libapache2-mod-auth-mysql php7.0-mysql curl wget git -y --force-yes
RUN apt-get install php7.0 libapache2-mod-php7.0 php7.0-mcrypt php7.0-mbstring php7.0-mysql php7.0-curl php7.0-gd php7.0-intl php7.0-zip php-pear php7.0-imagick php7.0-imap php7.0-mcrypt php7.0-memcache php7.0-ps php7.0-pspell php7.0-recode php7.0-sqlite php7.0-tidy php7.0-xmlrpc php7.0-xsl -y --force-yes
RUN apt-get install build-essential chrpath libssl-dev libxft-dev -y --force-yes
RUN apt-get install libfreetype6 libfreetype6-dev -y --force-yes
RUN apt-get install libfontconfig1 libfontconfig1-dev -y --force-yes
RUN apt-get install phantomjs -y --force-yes

RUN export DEBIAN_FRONTEND=noninteractive
RUN curl -sS https://getcomposer.org/installer | php
RUN php /composer.phar config --global github-oauth.github.com $githubToken

RUN service mysql restart
RUN service mysql start

EXPOSE 22 80
CMD ["/usr/sbin/apache2ctl -D FOREGROUND"]

