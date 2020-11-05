FROM php:7.4-fpm

RUN docker-php-ext-install pdo_mysql

RUN pecl install apcu
RUN apt-get update && \
apt-get install -y \
libzip-dev

#RUN docker-php-ext-install zip
#RUN docker-php-ext-enable apcu

#RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" 
#RUN php composer-setup.php --filename=composer \
##  && php -r "unlink('composer-setup.php');" \
##  && mv composer /usr/local/bin/composer    


#RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
#    && php composer-setup.php --filename=composer \
#    && php -r "unlink('composer-setup.php');" \
#    && mv composer /usr/local/bin/composer


RUN apt update

RUN DEBIAN_FRONTEND=noninteractive apt install unzip ffmpeg gulp npm icecast2 liquidsoap incron members yarn gnupg2  apache2 -y
#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update
#RUN apt install yarn -y
WORKDIR /usr/src/app
RUN adduser --disabled-password --gecos "" hcplayer
RUN usermod -a -G hcplayer www-data
RUN mkdir -p /app/

#COPY --chown=1000:1000 /apps/hcplayer /usr/src/app
#COPY --chown=1000:1000 /docker/php/.env /usr/src/app
#COPY --chown=1000:1000 /docker/php/apache-conf /etc/apache2/sites-available
COPY --chown=1000:1000 /docker/app/icecast/icecast.xml /etc/icecast2/icecast.xml
COPY --chown=1000:1000 /docker/app/liquidsoap/channel1.liq /app/liquidsoap/channel1.liq
COPY --chown=1000:1000 /docker/conf/start.sh /
RUN chmod +x /start.sh
RUN chmod +x /app/liquidsoap/channel1.liq

RUN touch touch /var/log/icecast2/access.log /var/log/icecast2/error.log /var/log/liquidsoap/channel1.log
RUN chgrp hcplayer /var/log/icecast2/access.log /var/log/icecast2/error.log
RUN chmod g+rw /var/log/icecast2/access.log /var/log/icecast2/error.log
RUN chown hcplayer  /var/log/liquidsoap/channel1.log
RUN chgrp icecast  /etc/icecast2/icecast.xml

#RUN PATH=$PATH:/usr/src/apps/vendor/bin:bin



#RUN a2enmod proxy proxy_http rewrite proxy_fcgi
#RUN a2ensite sautiyaumoja.lp-umoja.com.conf radio.lp-umoja.com.conf
#RUN /etc/init.d/apache2 restart
CMD sh -x /start.sh


