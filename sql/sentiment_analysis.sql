-- Sentiment Analysis

-- Overall Sentiment Distribution
SELECT
    sentiment_label,
    COUNT(*) AS review_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM electronics_reviews
GROUP BY sentiment_label
ORDER BY review_count DESC;

-- Average Rating by sentiment
SELECT
    sentiment_label,
    ROUND(AVG(reviews_rating), 2) AS avg_rating,
    COUNT(*) AS total_reviews
FROM electronics_reviews
GROUP BY sentiment_label
ORDER BY avg_rating DESC;

-- Recommendation Rate by Sentiment
SELECT
    sentiment_label,
    COUNT(*) AS total_reviews,
    SUM(CASE WHEN reviews_doRecommend = 'TRUE' THEN 1 ELSE 0 END) AS recommended_reviews,
    ROUND(
        SUM(CASE WHEN reviews_doRecommend = 'TRUE' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS recommendation_rate
FROM electronics_reviews
GROUP BY sentiment_label
ORDER BY recommendation_rate DESC;

-- Sentiment Breakdown by Brand (Ms vs others)
SELECT
    CASE 
        WHEN brand = 'Microsoft' THEN 'Microsoft'
        ELSE 'Other Brands'
    END AS brand_group,
    sentiment_label,
    COUNT(*) AS review_count
FROM electronics_reviews
GROUP BY brand_group, sentiment_label
ORDER BY brand_group, review_count DESC;

-- Average Rating by Brand + Sentiment
SELECT
    brand,
    sentiment_label,
    ROUND(AVG(reviews_rating), 2) AS avg_rating,
    COUNT(*) AS total_reviews
FROM electronics_reviews
GROUP BY brand, sentiment_label
HAVING COUNT(*) >= 10
ORDER BY brand, avg_rating DESC;

-- High rating but Negative Sentiment (contradictions) Verification
SELECT
    name AS product_name,
    brand,
    reviews_rating,
    sentiment_label,
    reviews_title
FROM electronics_reviews
WHERE reviews_rating >= 4
  AND sentiment_label = 'Negative'
LIMIT 20;

-- Low-Rating but Positive Sentiment (Opposite Case) Verification
SELECT
    name AS product_name,
    brand,
    reviews_rating,
    sentiment_label,
    reviews_title
FROM electronics_reviews
WHERE reviews_rating <= 2
  AND sentiment_label = 'Positive'
LIMIT 20;





