SELECT * FROM electronics_retail.electronics_reviews;
SHOW VARIABLES LIKE 'secure_file_priv';

(
  SELECT
    'brand',
    'name',
    'manufacturer',
    'primaryCategories',
    'reviews_date',
    'review_year',
    'review_month',
    'reviews_rating',
    'reviews_doRecommend',
    'reviews_numHelpful',
    'reviews_text',
    'reviews_title',
    'sentiment_label',
    'review_length'
)
UNION ALL
(
  SELECT
    brand,
    name,
    manufacturer,
    primaryCategories,
    reviews_date,
    review_year,
    review_month,
    reviews_rating,
    reviews_doRecommend,
    reviews_numHelpful,
    reviews_text,
    reviews_title,
    sentiment_label,
    review_length
  FROM electronics_retail.electronics_reviews
)
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/electronics_reviews_clean.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n';

