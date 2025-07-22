-- Создаем таблицу
CREATE TABLE IF NOT EXISTS employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    hire_date DATE NOT NULL
);

-- Наполняем данными
INSERT INTO employee (name, position, salary, hire_date) VALUES
    ('Иван Петров', 'Разработчик', 120000.00, '2020-05-15'),
    ('Алексей Сидоров', 'Менеджер', 95000.00, '2019-11-20');

-- Даем права пользователю app_user (важно!)
GRANT ALL PRIVILEGES ON DATABASE app_db TO app_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO app_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO app_user;
