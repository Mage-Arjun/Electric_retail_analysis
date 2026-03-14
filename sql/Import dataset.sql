DROP TABLE IF EXISTS electronics_reviews;

CREATE TABLE electronics_reviews (
    brand VARCHAR(100),
    name TEXT,
    manufacturer VARCHAR(255),
    primaryCategories VARCHAR(255),

    reviews_date DATETIME,
    review_year INT,
    review_month INT,

    reviews_rating INT,
    reviews_doRecommend VARCHAR(10),
    reviews_numHelpful INT DEFAULT 0,

    reviews_text TEXT,
    reviews_title TEXT,

    sentiment_label VARCHAR(20),
    review_length INT
);

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/arjun/OneDrive/Desktop/Data Analysis/Projects/2.Electronics_Retail_Project/data cleaned/cleaned_data.csv'
INTO TABLE electronics_reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    @id,
    @asins,
    brand,
    @categories,
    @colors,
    @dateAdded,
    @dateUpdated,
    @dimension,
    @imageURLs,
    @keys,
    manufacturer,
    @manufacturerNumber,
    name,
    primaryCategories,
    reviews_date,
    @reviews_dateSeen,
    reviews_doRecommend,
    reviews_numHelpful,
    reviews_rating,
    @reviews_sourceURLs,
    reviews_text,
    reviews_title,
    @reviews_username,
    @sourceURLs,
    @upc,
    @weight,
    sentiment_label,
    review_length,
    review_year,
    @review_year_duplicate,
    review_month
);
