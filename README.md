# Инструкция по работе с PostgreSQL в Docker

## 1. Запуск PostgreSQL в контейнере

```bash
docker-compose up -d
```
```bash
docker exec -it postgres_db psql -U app_user -d app_db -c "SELECT * FROM employee;"
```

Результат (ожидаемый вывод):
 id |       name       |   position   |  salary  | hire_date  
----+------------------+--------------+----------+------------
  1 | Иван Петров      | Разработчик  | 120000.00 | 2020-05-15
  2 | Алексей Сидоров  | Менеджер     |  95000.00 | 2019-11-20
