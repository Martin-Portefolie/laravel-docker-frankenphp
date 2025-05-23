# 🐳 A Laravel Setup with Docker, FrankenPHP, and Caddy

This is a lightweight and modern Laravel development environment using:

- **Docker** with `docker-compose`
- **FrankenPHP** (fast, built-in PHP server)
- **Caddy** as the web server with automatic HTTPS/config
- **MariaDB** as the database

Ideal for rapid local development, clean architecture, and easy deployment later.

---

##  Local Setup

Run this to build and start the full stack:

```sh
docker compose up -d --build
```

Once it's up, generate the Laravel app key:

```sh
docker exec -it laravel-app php artisan key:generate
```

If you're using the database session driver, add the session table:

```sh

docker exec -it laravel-app php artisan session:table
docker exec -it laravel-app php artisan migrate
```
Then open http://localhost in your browser. You should see the Laravel welcome page.
