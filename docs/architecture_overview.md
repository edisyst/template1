# Architecture Overview

Questo documento descrive l'architettura del progetto, evidenziando le principali decisioni di design e componenti.

## Panoramica

Il progetto è una web application basata su Laravel, organizzata secondo i principi del pattern MVC (Model-View-Controller).

### Struttura Principale

- **Backend**: Laravel gestisce l'API RESTful e la logica di business.
- **Frontend**: Blade Templates per la generazione dinamica di pagine, con integrazione di componenti Vue.js per funzionalità interattive.
- **Database**: MySQL è utilizzato come sistema di gestione del database relazionale.

## Componenti Principali

### 1. **Autenticazione**

L'autenticazione è gestita dal pacchetto Laravel Jetstream, con supporto per la registrazione, il login, e il recupero della password.

### 2. **Gestione Utenti**

Il sistema di gestione utenti include ruoli e permessi, implementati tramite il pacchetto Spatie Laravel-Permission.

### 3. **API**

Le API sono organizzate in base alle risorse principali, seguendo i principi RESTful:

- **/api/v1/users**: Gestisce la CRUD per gli utenti.
- **/api/v1/posts**: Gestisce la CRUD per i post.

### 4. **Caching**

Per migliorare le performance, vengono utilizzati i seguenti meccanismi di caching:

- **Cache di query**: Utilizza Redis per memorizzare i risultati delle query più frequenti.
- **Cache delle viste**: Compila le viste Blade in file statici per ridurre i tempi di risposta.

## Diagramma dell'Architettura

Immagine del 
![Diagramma dell'Architettura](./architecture_diagram.png)

## Considerazioni di Sicurezza

Le seguenti pratiche di sicurezza sono state implementate:

- **Protezione CSRF**: Tutte le richieste POST sono protette da token CSRF.
- **Validazione Input**: Tutti gli input degli utenti vengono validati sul server per prevenire attacchi di injection.

