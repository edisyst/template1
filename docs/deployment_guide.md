# Deployment Guide

Questa guida descrive come distribuire l'applicazione su un server di produzione.

## Requisiti di Produzione

Assicurati che il server di produzione soddisfi i seguenti requisiti:

- **PHP** >= 8.1
- **Composer** >= 2.x
- **MySQL** >= 8.x
- **Nginx** o **Apache**

## 1. Preparazione del Server

### 1.1 Aggiornamento del Sistema

```bash
sudo apt-get update && sudo apt-get upgrade -y
```

### 1.2 Installazione di PHP e Estensioni

```bash
sudo apt-get install php8.1 php8.1-fpm php8.1-mysql
```

### 1.3 Configurazione di MySQL
Assicurati di avere un database configurato:

```sql
CREATE DATABASE my_database;
CREATE USER 'my_user'@'localhost' IDENTIFIED BY 'my_password';
GRANT ALL PRIVILEGES ON my_database.* TO 'my_user'@'localhost';
FLUSH PRIVILEGES;
```

## 2. Distribuzione dell'Applicazione
   
### 2.1 Clona il Repository

```bash
git clone https://github.com/username/repository-name.git /var/www/html
cd /var/www/html
```

### 2.2 Installa le Dipendenze

```bash
composer install --no-dev --optimize-autoloader
npm install && npm run production
```

### 2.3 Configura l'Ambiente
Copia il file .env.example e configuralo per l'ambiente di produzione:

```bash

cp .env.example .env
php artisan key:generate
```

### 2.4 Esegui le Migrazioni e Seeding

```bash
php artisan migrate --force
php artisan db:seed --force
```

## 3. Configurazione del Web Server

### 3.1 Configurazione di Nginx

Esempio di configurazione per Nginx:

```nginx
server {
    listen 80;
    server_name yourdomain.com;
    root /var/www/html/public;

    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

## 4. Ottimizzazione per la Produzione

### 4.1 Cache delle Configurazioni

```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

### 4.2 Imposta i Permessi

```bash
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 775 /var/www/html/storage
```

L'applicazione dovrebbe ora essere pronta per essere distribuita in produzione.
