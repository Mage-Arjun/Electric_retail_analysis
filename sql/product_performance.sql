select * 
from electronics_reviews
limit 6905;

-- Average Rating per product
SELECT
    name AS product_name,
    ROUND(AVG(reviews_rating), 2) AS avg_rating,
    COUNT(*) AS total_reviews
FROM electronics_reviews
GROUP BY name
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC;
-- Product performance

-- Recommendation Percentage per Product
SELECT
    name AS product_name,
    COUNT(*) AS total_reviews,
    SUM(CASE WHEN reviews_doRecommend = 'TRUE' THEN 1 ELSE 0 END) AS recommend_count,
    ROUND(
        SUM(CASE WHEN reviews_doRecommend = 'TRUE' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS recommend_percentage
FROM electronics_reviews
GROUP BY name
ORDER BY recommend_percentage DESC;

-- Combined Product Performance View (Most Important)

SELECT
    name AS product_name,
    COUNT(*) AS total_reviews,
    ROUND(AVG(reviews_rating), 2) AS avg_rating,
    ROUND(
        SUM(CASE WHEN reviews_doRecommend = 'TRUE' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS recommend_percentage,
    ROUND(AVG(reviews_numHelpful), 2) AS avg_helpful_votes
FROM electronics_reviews
GROUP BY name
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC, recommend_percentage DESC;

-- Brand-Level Product Performance (Benchmarking)
SELECT
    brand,
    COUNT(DISTINCT name) AS total_products,
    COUNT(*) AS total_reviews,
    ROUND(AVG(reviews_rating), 2) AS avg_brand_rating,
    ROUND(
        SUM(CASE WHEN reviews_doRecommend = 'TRUE' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS brand_recommend_percentage
FROM electronics_reviews
GROUP BY brand
ORDER BY avg_brand_rating DESC;

-- Top Products by Satisfaction (High Rating + High Volume)
SELECT
    name AS product_name,
    COUNT(*) AS total_reviews,
    ROUND(AVG(reviews_rating), 2) AS avg_rating
FROM electronics_reviews
GROUP BY name
HAVING COUNT(*) >= 50
   AND AVG(reviews_rating) >= 4.5
ORDER BY total_reviews DESC;