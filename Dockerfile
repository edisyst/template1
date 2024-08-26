# Usa un'immagine base di PHP
FROM php:8.1-fpm

# Installa le estensioni richieste
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Imposta la cartella di lavoro
WORKDIR /var/www

# Copia i file dell'applicazione
COPY . .

# Installa Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Installa le dipendenze PHP
RUN composer install

# Espone la porta 9000 e avvia il server PHP-FPM
EXPOSE 9000
CMD ["php-fpm"]
