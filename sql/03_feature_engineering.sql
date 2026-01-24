-- 1. Топ 10 товаров по выручке
SELECT product_id, product_name, (final_price * units_sold) AS revenue 
FROM products
ORDER BY revenue DESC
LIMIT 10;
-- Итог: Nike Series 426 приносит наибольшую выручку 

-- 2. Выручка по категории
SELECT category, SUM(final_price * units_sold) AS total_revenue
FROM products
GROUP BY category
ORDER BY total_revenue DESC;
-- Итог: наибольшую выручку приносит категория Toys

-- 3. Сравнение средней цены между брендами
SELECT 
	brand,
	AVG(final_price) AS avg_final_price,
	AVG(rating) AS avg_rating
FROM products
GROUP BY brand;
-- Итог: средние цены и рейтинги брендов схожи, разброс небольшой, конкуренция равномерная

-- 4. Средний рейтинг и выручка по ценовым сегметнам 
WITH price_segments AS (
    SELECT
        *,
        NTILE(3) OVER (ORDER BY price) AS price_quantile
    FROM products
)
SELECT
    CASE price_quantile
        WHEN 1 THEN 'low'
        WHEN 2 THEN 'mid'
        WHEN 3 THEN 'high'
    END AS price_segment,
    AVG(rating) AS avg_rating,
    AVG(final_price * units_sold) AS avg_revenue
FROM price_segments
GROUP BY price_segment
ORDER BY avg_revenue DESC, avg_rating DESC;
-- Итог: high-price сегмент приносит наибольшую выручку, рейтинг примерно одинаков во всех сегментах
		