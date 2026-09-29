# Flutter Shop Admin Backend

Backend local para el proyecto **Flutter Shop Admin**, utilizado como entorno de demostración para la aplicación desarrollada durante el curso de Flutter.

El repositorio contiene todo lo necesario para levantar el entorno mediante Docker Compose, incluyendo el backend, PostgreSQL, los datos de demostración y las imágenes de los productos.

> **Nota:** el código fuente TypeScript original del backend no forma parte de este repositorio. Se conserva la distribución compilada de NestJS (`backend/dist`) necesaria para ejecutar la API y mantener funcional la demo.

## Tecnologías

- NestJS
- Node.js
- PostgreSQL
- TypeORM
- Docker
- Docker Compose
- JWT Authentication

## Estructura

```text
Flutter_Shop_Admin_Backend/
├── backend/
│   ├── dist/                   # Backend NestJS compilado
│   └── static/                 # Imágenes de productos
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

## Puesta en marcha

Es necesario tener instalados Docker y Docker Compose.

Clona el repositorio y entra en el directorio:

```bash
git clone https://github.com/RaulEstevezA/Flutter_Shop_Admin_Backend.git
cd Flutter_Shop_Admin_Backend
```

Levanta todo el entorno:

```bash
docker compose up -d --build
```

Docker Compose se encargará de:

- Construir la imagen del backend.
- Instalar las dependencias de Node mediante `npm ci`.
- Crear el contenedor PostgreSQL.
- Crear la base de datos `flutter_shop_admin_bd`.
- Importar automáticamente los datos de demostración.
- Levantar la API.
- Servir las imágenes de los productos.

## Servicios

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

## Usuarios de demostración

Estos usuarios contienen únicamente datos ficticios para probar la aplicación.

### Usuario 1

```text
Email: test1@google.com
Password: Abc123
```

### Usuario 2

```text
Email: test2@google.com
Password: Abc123
```

## Endpoints principales

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

Algunos endpoints requieren autenticación mediante JWT.

## Base de datos

La base de datos de demostración se encuentra en:

```text
database/flutter_shop_admin_bd.sql
```

Cuando Docker crea por primera vez el volumen de PostgreSQL, el archivo se importa automáticamente mediante `/docker-entrypoint-initdb.d/`.

El dataset inicial contiene:

```text
Products:       52
Users:           2
Product images: 104
```

Los datos son exclusivamente de demostración.

## Comandos útiles

Ver el estado de los servicios:

```bash id="u3p1ac"
docker compose ps
```

Ver los logs del backend:

```bash id="py1q4u"
docker compose logs -f backend
```

Detener los servicios:

```bash id="rphs5w"
docker compose down
```

### Restaurar los datos de demostración

Durante las pruebas se pueden crear, modificar o eliminar productos desde Flutter Shop Admin.

Para restaurar rápidamente el dataset original:

```bash id="pqyxm4"
curl http://localhost:3000/api/seed
```

El seed elimina los datos modificados y vuelve a cargar el dataset original:

```text id="52bbq9"
Products:       52
Users:           2
Product images: 104
```

### Reconstruir completamente la base de datos

Para eliminar la base de datos almacenada en el volumen:

```bash id="kthm6i"
docker compose down -v
```

La próxima ejecución de:

```bash id="1cn30w"
docker compose up -d --build
```

creará una nueva base de datos e importará automáticamente el dataset inicial desde:

```text id="87ws3q"
database/flutter_shop_admin_bd.sql
```

## Relación con Flutter Shop Admin

Este repositorio proporciona el backend y los datos utilizados por la aplicación [Flutter Shop Admin](https://github.com/RaulEstevezA/Flutter_Shop_Admin).

La finalidad es disponer de un entorno reproducible para ejecutar y demostrar la aplicación sin depender de servicios externos para conservar la API, la base de datos o las imágenes de demostración.

## Licencia

Consulta el archivo [LICENSE](LICENSE) incluido en el repositorio.

---

[Volver al README principal](README.md)
