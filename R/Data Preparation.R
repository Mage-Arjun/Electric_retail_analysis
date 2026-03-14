library(dplyr)
mydata <- DatafinitiElectronicsProductData
str(mydata)

head(mydata)
colnames(mydata)

summary(mydata$reviews.rating)
table(mydata$reviews.doRecommend)
length(unique(mydata$brand))
summary.default(mydata)

missing_summary <- sapply(mydata, function(x) sum(is.na(x)))
missing_summary

colSums(is.na(mydata[, c("reviews.rating", "reviews.doRecommend", 
                         "reviews.text", "reviews.date")]))
mydata_clean <- subset(mydata, !is.na(reviews.rating))
mydata_clean$reviews.date <- as.Date(
  substr(mydata_clean$reviews.date, 1, 10)
)

mydata_clean$dateAdded <- as.Date(
  substr(mydata_clean$dateAdded, 1, 10)
)

mydata_clean$dateUpdated <- as.Date(
  substr(mydata_clean$dateUpdated, 1, 10)
)

# -----------------------------
# 5. Standardize Categorical Variables
# -----------------------------
mydata_clean$brand <- trimws(tolower(mydata_clean$brand))
mydata_clean$primaryCategories <- trimws(tolower(mydata_clean$primaryCategories))

mydata_clean$reviews.doRecommend <- as.factor(mydata_clean$reviews.doRecommend)

# -----------------------------
# 6. Validate Rating Distribution
# -----------------------------
table(mydata_clean$reviews.rating)
prop.table(table(mydata_clean$reviews.rating))

# -----------------------------
# 7. Recommendation vs Rating Check
# -----------------------------
table(mydata_clean$reviews.rating, mydata_clean$reviews.doRecommend)

# -----------------------------
# 8. Create Derived Variables
# -----------------------------

# Binary sentiment label based on rating
mydata_clean$sentiment_label <- ifelse(
  mydata_clean$reviews.rating >= 4, "Positive",
  ifelse(mydata_clean$reviews.rating == 3, "Neutral", "Negative")
)

mydata_clean$sentiment_label <- factor(
mydata_clean$sentiment_label,levels = c("Negative", "Neutral", "Positive"))
  
# Review length feature
mydata_clean$review_length <- nchar(mydata_clean$reviews.text)
  
# Year and Month for time analysis
mydata_clean$review_year <- format(mydata_clean$reviews.date, "%Y")
mydata_clean$review_month <- format(mydata_clean$reviews.date, "%Y-%m")
  
# -----------------------------
# 9. Brand-Level Review Count Check
# -----------------------------
brand_review_counts <- sort(table(mydata_clean$brand), decreasing = TRUE)
brand_review_counts

# Optional: keep brands with sufficient data
major_brands <- names(brand_review_counts[brand_review_counts >= 50])
mydata_final <- subset(mydata_clean, brand %in% major_brands)

dim(mydata_final)
str(mydata_final)
summary(mydata_final)

write.csv(mydata_final, r"(C:\Users\arjun\OneDrive\Desktop\Data Analysis\Projects\2.Electronics_Retail_Project\data cleaned\cleaned_data.csv)", row.names = FALSE)
