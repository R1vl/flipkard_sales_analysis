-- 1. Сколько всего товаров 
SELECT COUNT(*) AS total_prducts 
FROM products;
-- Итог: в базе 80_000 товаров 

-- 2. Топ-5 категорий по количеству товаров
SELECT category, COUNT(*) as total_products
FROM products
GROUP BY category
ORDER BY total_products DESC
LIMIT 5;
-- Итог: в топ 5 категорий входят: 'Toys', 'Beauty', 'Fashion', 'Electronics', 'Sports'

-- 3. Средняя цена и рейтинг по брендам 
SELECT
	brand,
	AVG(price) AS avg_price,
	AVG(rating) AS avg_rating
FROM products
GROUP BY brand
ORDER BY avg_price DESC
LIMIT 5;
-- ИТОГ: средние цены примерно одинаковые (~30,000), рейтинг около 3.0, рынок конкурентный

-- 4. Пропущенные данные 
SELECT
	SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS missing_prices,
	SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS missing_rating
FROM products;
-- Итог: в столбцах price и rating пропущенных данных нет

--5. Минимальная и максимальная цена
SELECT MIN(price) AS min_price, MAX(price) AS max_price
FROM products;
-- Итог: минимальная цена – 200,14; максимальная – 59995,8