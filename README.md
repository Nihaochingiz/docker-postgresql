# Инструкция по работе с PostgreSQL в Docker

## 1. Запуск PostgreSQL в контейнере

Создайте `docker-compose.yml` со следующим содержимым:

```yaml
version: '3.8'

services:
  postgres:
    image: postgres:latest
    container_name: postgres_container
    environment:
      POSTGRES_USER: myuser
      POSTGRES_PASSWORD: mypassword
      POSTGRES_DB: mydatabase
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
    restart: unless-stopped

volumes:
  postgres_data:
```

**Запустите контейнер**
```bash
docker-compose up -d
```

**Подключение к базе данных**

*Через psql внутри контейнера*

```bash
docker exec -it postgres_container psql -U myuser -d mydatabase
```
*Опционально*

**Создание таблицы users**

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(100) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);
```
**Добавление данных**
```sql
INSERT INTO users (username, email, password_hash) 
VALUES ('admin', 'admin@example.com', 'hashed_password_123');
```

**Просмотр данных**
```sql
SELECT * FROM users;
```