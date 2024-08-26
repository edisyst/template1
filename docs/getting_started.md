# Getting Started

Benvenuto nel progetto! Questa guida ti aiuterà a configurare l'ambiente di sviluppo e a comprendere le basi del progetto.

## Prerequisiti

Assicurati di avere installato i seguenti strumenti:
- **PHP** >= 8.1
- **Composer** >= 2.x
- **Node.js** >= 16.x
- **MySQL** >= 8.x

## Configurazione dell'Ambiente

### 1. Clona il Repository

```bash
git clone https://github.com/username/repository-name.git
cd repository-name
```

### 2. Installa le Dipendenze
```bash
composer install
npm install
```
### 3. Configura il File .env
Copia il file .env.example e rinominalo in .env:

```bash
cp .env.example .env
```
Genera la chiave dell'applicazione:
```bash
php artisan key:generate
```

### 4. Configura il Database
Esegui le migrazioni per configurare il database:

```bash
php artisan migrate
```
### 5. Avvia il Server di Sviluppo
```bash
php artisan serve
```
Ora puoi accedere all'applicazione tramite http://localhost:8000.

## Struttura del Progetto

Il progetto è organizzato in modo da seguire il pattern MVC (Model-View-Controller). Ecco le principali cartelle:

- app/Models/: Contiene i modelli Eloquent.
- app/Http/Controllers/: Contiene i controller.
- resources/views/: Contiene le viste Blade.
- routes/: Contiene i file di routing.

## Contribuire

Consulta il file CONTRIBUTING.md per le linee guida su come contribuire al progetto.
