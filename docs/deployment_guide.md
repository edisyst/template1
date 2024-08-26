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
Copia codice
cp .env.example .env
php artisan key:generate
```

### 2.4 Esegui le Migrazioni e Seeding

```bash
Copia codice
php artisan migrate --force
php artisan db:seed --force
```
