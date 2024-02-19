FROM php:apache
RUN apt-get update && \
    apt-get install -y
RUN apt-get install -y curl
RUN apt-get install -y build-essential libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev
RUN apt-get install -y libicu-dev libpq-dev libzip-dev libonig-dev
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer
RUN docker-php-ext-install pgsql pdo pdo_pgsql
COPY server.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
RUN service apache2 restart