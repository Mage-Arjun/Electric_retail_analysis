-- Time-Based Sentiment Trend

-- Sentiment Distribution Over Time (Yearly): Sentiment count by year
SELECT
    review_year,
    sentiment_label,
    COUNT(*) AS review_count
FROM electronics_reviews
WHERE review_year IS NOT NULL
GROUP BY review_year, sentiment_label
ORDER BY review_year, sentiment_label;

-- Sentiment Trend by Year (Percent Distribution)
SELECT
    review_year,
    sentiment_label,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY review_year),
        2
    ) AS sentiment_percentage
FROM electronics_reviews
WHERE review_year IS NOT NULL
GROUP BY review_year, sentiment_label
ORDER BY review_year, sentiment_label;

-- Rating Trend Over Time (Baseline Check)
SELECT
    review_year,
    ROUND(AVG(reviews_rating), 2) AS avg_rating,
    COUNT(*) AS total_reviews
FROM electronics_reviews
WHERE review_year IS NOT NULL
GROUP BY review_year
ORDER BY review_year;

-- Sentiment vs Rating Over Time (Combined View)
SELECT
    review_year,
    sentiment_label,
    ROUND(AVG(reviews_rating), 2) AS avg_rating,
    COUNT(*) AS review_count
FROM electronics_reviews
WHERE review_year IS NOT NULL
GROUP BY review_year, sentiment_label
ORDER BY review_year, sentiment_label;

-- Brand-Specific Sentiment Trend (Microsoft Example)
SELECT
    review_year,
    sentiment_label,
    COUNT(*) AS review_count
FROM electronics_reviews
WHERE brand = 'Microsoft'
  AND review_year IS NOT NULL
GROUP BY review_year, sentiment_label
ORDER BY review_year, sentiment_label;

-- Microsoft vs Others — Sentiment Trend
SELECT
    review_year,
    CASE 
        WHEN brand = 'Microsoft' THEN 'Microsoft'
        ELSE 'Other Brands'
    END AS brand_group,
    sentiment_label,
    COUNT(*) AS review_count
FROM electronics_reviews
WHERE review_year IS NOT NULL
GROUP BY review_year, brand_group, sentiment_label
ORDER BY review_year, brand_group, sentiment_label;








