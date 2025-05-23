# Dockerfile
FROM dunglas/frankenphp

RUN apt-get update && apt-get install -y \
    libicu-dev \
    unzip \
    git \
    curl \
    zlib1g-dev \
    libzip-dev \
    libpq-dev \
    mariadb-client \
    && docker-php-ext-install intl zip pdo_mysql

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
COPY . /app

ARG APP_ENV=dev
ENV APP_ENV=${APP_ENV}

# Laravel dependency installation
RUN if [ "$APP_ENV" = "prod" ]; then \
        composer install --no-dev --optimize-autoloader && \
        php artisan config:cache && \
        php artisan route:cache && \
        php artisan view:cache; \
    else \
        composer install; \
    fi
