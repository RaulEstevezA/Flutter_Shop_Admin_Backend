# Flutter Shop Admin Backend

Local backend for the **Flutter Shop Admin** project, used as a demo environment for the application developed during the Flutter course.

This repository contains everything required to start the environment with Docker Compose, including the backend, PostgreSQL, demo data, and product images.

> **Note:** the original TypeScript source code for the backend is not included in this repository. The compiled NestJS distribution (`backend/dist`) required to run the API and keep the demo functional is provided instead.

## Technologies

- NestJS
- Node.js
- PostgreSQL
- TypeORM
- Docker
- Docker Compose
- JWT Authentication

## Project structure

```text
Flutter_Shop_Admin_Backend/
├── backend/
│   ├── dist/                   # Compiled NestJS backend
│   └── static/                 # Product images
│
├── database/
│   └── flutter_shop_admin_bd.sql
│
├── Dockerfile
├── docker-compose.yml
├── package.json
├── package-lock.json
└── README.md
```

## Getting started

Docker and Docker Compose must be installed.

Clone the repository and enter its directory:

```bash
git clone https://github.com/RaulEstevezA/Flutter_Shop_Admin_Backend.git
cd Flutter_Shop_Admin_Backend
```

Start the complete environment:

```bash
docker compose up -d --build
```

Docker Compose will:

- Build the backend image.
- Install the Node.js dependencies with `npm ci`.
- Create the PostgreSQL container.
- Create the `flutter_shop_admin_bd` database.
- Import the demo data automatically.
- Start the API.
- Serve the product images.

## Services

### Backend

```text
http://localhost:3000
```

API:

```text
http://localhost:3000/api
```

### PostgreSQL

```text
Host: localhost
Port: 5433
Database: flutter_shop_admin_bd
User: postgres
Password: postgres
```

## Demo users

These users contain fictional data and are intended only for testing the application.

### User 1

```text
Email: test1@google.com
Password: Abc123
```

### User 2

```text
Email: test2@google.com
Password: Abc123
```

## Main endpoints

```text
POST   /api/auth/login
POST   /api/auth/register
GET    /api/auth/check-status

GET    /api/products
GET    /api/products/:idOrSlug
GET    /api/products/all/:term
POST   /api/products
PATCH  /api/products/:id
DELETE /api/products/:id

GET    /api/files/product/:imageName
POST   /api/files/product

GET    /api/seed
```

Some endpoints require JWT authentication.

## Database

The demo database is located at:

```text
database/flutter_shop_admin_bd.sql
```

When Docker creates the PostgreSQL volume for the first time, the file is imported automatically through `/docker-entrypoint-initdb.d/`.

The initial dataset contains:

```text
Products:       52
Users:           2
Product images: 104
```

The data is intended exclusively for demonstration purposes.

## Useful commands

Check the status of the services:

```bash
docker compose ps
```

View the backend logs:

```bash
docker compose logs -f backend
```

Stop the services:

```bash
docker compose down
```

### Restore the demo data

Products can be created, updated, or deleted from Flutter Shop Admin during testing.

To quickly restore the original dataset:

```bash
curl http://localhost:3000/api/seed
```

The seed process removes the modified data and reloads the original dataset:

```text
Products:       52
Users:           2
Product images: 104
```

### Rebuild the database completely

To delete the database stored in the Docker volume:

```bash
docker compose down -v
```

The next time you run:

```bash
docker compose up -d --build
```

Docker will create a new database and automatically import the initial dataset from:

```text
database/flutter_shop_admin_bd.sql
```

## Relationship with Flutter Shop Admin

This repository provides the backend and data used by the [Flutter Shop Admin](https://github.com/RaulEstevezA/Flutter_Shop_Admin) application.

Its purpose is to provide a reproducible environment for running and demonstrating the application without depending on external services to host the API, database, or demo images.

## License

See the [LICENSE](LICENSE) file included in this repository.

---

[Back to the main README](README.md)
