# API Documentation

Questa documentazione descrive le API RESTful disponibili nel progetto.

## Autenticazione

L'autenticazione viene gestita tramite token JWT. Ogni richiesta deve includere un header `Authorization` con il token JWT.

```bash
Authorization: Bearer your-jwt-token
```

## Endpoints

### 1. Utenti

GET /api/v1/users

Descrizione: Recupera una lista di tutti gli utenti.

Request:

```http
GET /api/v1/users HTTP/1.1
Host: api.yourdomain.com
Authorization: Bearer your-jwt-token
```

Response:

```json
[
  {
    "id": 1,
    "name": "John Doe",
    "email": "johndoe@example.com"
  },
  {
    "id": 2,
    "name": "Jane Doe",
    "email": "janedoe@example.com"
  }
]
```

POST /api/v1/users

Descrizione: Crea un nuovo utente.

Request:

```http
POST /api/v1/users HTTP/1.1
Host: api.yourdomain.com
Content-Type: application/json
Authorization: Bearer your-jwt-token

{
  "name": "New User",
  "email": "newuser@example.com",
  "password": "securepassword"
}
```

Response:

```json
{
  "id": 3,
  "name": "New User",
  "email": "newuser@example.com"
}
```

### 2. Post

GET /api/v1/posts

Descrizione: Recupera una lista di tutti i post.

Request:

```http
GET /api/v1/posts HTTP/1.1
Host: api.yourdomain.com
Authorization: Bearer your-jwt-token
```

Response:

```json
[
  {
    "id": 1,
    "title": "First Post",
    "content": "This is the content of the first post."
  },
  {
    "id": 2,
    "title": "Second Post",
    "content": "This is the content of the second post."
  }
]
```

### 3. Errori

Le API seguono la seguente struttura per gli errori:

Response:

```json
{
  "error": {
    "code": 401,
    "message": "Unauthorized"
  }
}
```

### 4. Rate Limiting

L'API impone un limite di 60 richieste al minuto per ogni IP. Se superi questo limite, riceverai una risposta 429 Too Many Requests.
