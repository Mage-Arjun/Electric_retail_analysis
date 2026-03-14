-- Overall Brand-Level Performance : Average Rating, Review Volume, Recommendation Rate

SELECT
    brand,
    ROUND(AVG(reviews_rating), 2) AS avg_rating,
    COUNT(*) AS total_reviews,
    ROUND(
        SUM(CASE WHEN reviews_doRecommend = 'TRUE' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS recommend_percentage
FROM electronics_reviews
GROUP BY brand
ORDER BY avg_rating DESC, total_reviews DESC;

-- Microsoft vs All Other Brands (Side-by-Side): Binary Comparison

SELECT
    CASE 
        WHEN brand = 'Microsoft' THEN 'Microsoft'
        ELSE 'Other Brands'
    END AS brand_group,
    ROUND(AVG(reviews_rating), 2) AS avg_rating,
    COUNT(*) AS total_reviews,
    ROUND(
        SUM(CASE WHEN reviews_doRecommend = 'TRUE' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS recommend_percentage
FROM electronics_reviews
GROUP BY brand_group;

-- Product-Level Comparison (Microsoft vs Others): Top Products (Minimum Review Threshold)

SELECT
    brand,
    name AS product_name,
    manufacturer,
    ROUND(AVG(reviews_rating), 2) AS avg_rating,
    COUNT(*) AS total_reviews
FROM electronics_reviews
GROUP BY brand, name, manufacturer
HAVING COUNT(*) >= 20
ORDER BY avg_rating DESC, total_reviews DESC;

-- Recommendation Behavior Comparison: Microsoft vs Others – Recommendation Split
SELECT
    brand,
    reviews_doRecommend,
    COUNT(*) AS review_count
FROM electronics_reviews
WHERE brand = 'Microsoft'
GROUP BY brand, reviews_doRecommend;

SELECT
    reviews_doRecommend,
    COUNT(*) AS review_count
FROM electronics_reviews
WHERE brand <> 'Microsoft'
GROUP BY reviews_doRecommend;

-- Time-Based Brand Trend (Microsoft Focus):  Rating Trend Over Time
-- Title: Brand Comparison

-- Overall Brand-Level Performance: Average Rating, Review Volume, Recommendation Rate
SELECT
    review_year,
    ROUND(AVG(reviews_rating), 2) AS avg_rating,
    COUNT(*) AS total_reviews
FROM electronics_reviews
WHERE brand = 'Microsoft'
GROUP BY review_year
ORDER BY review_year;

-- Manufacturer vs Brand Consistency Check
SELECT
    brand,
    manufacturer,
    COUNT(*) AS total_reviews,
    ROUND(AVG(reviews_rating), 2) AS avg_rating
FROM electronics_reviews
GROUP BY brand, manufacturer
ORDER BY avg_rating DESC;
