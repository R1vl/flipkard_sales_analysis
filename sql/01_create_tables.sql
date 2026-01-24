-- 1. Удаляем таблицу, если она уже существует
DROP TABLE IF EXISTS products;

-- 2. Создаем таблицу products на основе структуры CSV
CREATE TABLE products (
    product_id TEXT,
    product_name TEXT,
    category TEXT,
    brand TEXT,
    seller TEXT,
    seller_city TEXT,
    price NUMERIC,
    discount_percent NUMERIC,
    final_price NUMERIC,
    rating REAL,
    review_count INTEGER,
    stock_available INTEGER,
    units_sold INTEGER,
    listing_date DATE,
    delivery_days INTEGER,
    weight_g REAL,
    warranty_months INTEGER,
    color TEXT,
    size TEXT,
    return_policy_days INTEGER,
    is_returnable BOOLEAN,
    payment_modes TEXT,
    shipping_weight_g REAL,
    product_score REAL,
    seller_rating REAL
);

-- 3. Загружаем данные из CSV в таблицу
COPY products
FROM ''
DELIMITER ','
CSV HEADER
NULL '';

