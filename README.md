# Flutter Shop Admin Backend

Local backend environment for the [Flutter Shop Admin](https://github.com/RaulEstevezA/Flutter_Shop_Admin) application.

This repository provides a compiled NestJS backend, a PostgreSQL database with demo data, and product images. The complete environment runs with Docker Compose.

> The original TypeScript source code is not included. This repository contains the compiled NestJS distribution required to run the demo API.

## Requirements

- Git
- Docker
- Docker Compose

## Setup and run

Clone the repository and enter its directory:

```bash
git clone https://github.com/RaulEstevezA/Flutter_Shop_Admin_Backend.git
cd Flutter_Shop_Admin_Backend
```

Build and start the backend and database:

```bash
docker compose up -d --build
```

Once the services are ready, the backend is available at:

- API base URL: `http://localhost:3000/api`
- Backend URL: `http://localhost:3000`

To check the running services:

```bash
docker compose ps
```

To stop them:

```bash
docker compose down
```

## Restore the demo data

To reset the database and restore the original demo dataset:

```bash
curl http://localhost:3000/api/seed
```

This command removes any modified demo data and reloads the original dataset.

## Full documentation

- 🇬🇧 [English documentation](README_en.md)
- 🇪🇸 [Documentación en español](README_es.md)

## License

See the [LICENSE](LICENSE) file for details.
