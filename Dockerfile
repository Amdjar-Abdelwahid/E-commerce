FROM php:8.1-apache

# Installer les extensions nécessaires
RUN docker-php-ext-install mysqli

# Installer Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copier le code de l'application
WORKDIR /var/www/html
COPY . /var/www/html/

# Installer les dépendances PHP (PHPMailer)
WORKDIR /var/www/html/mail
RUN composer install --no-scripts --no-plugins --no-interaction || true

# Droits sur les fichiers (optionnel)
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80 