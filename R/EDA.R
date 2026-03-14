library(dplyr)
library(ggplot2)
library(lubridate)

dim(mydata_final)
colnames(mydata_final)

ggplot(mydata_final, aes(x = reviews.rating)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Distribution of Customer Ratings",
    x = "Rating (1–5)",
    y = "Number of Reviews"
  ) +
  theme_minimal()


ggplot(mydata_final, aes(x = reviews.rating, fill = reviews.doRecommend)) +
  geom_bar(position = "fill") +
  scale_y_continuous(labels = scales::percent) +
  labs(
    title = "Recommendation Rate by Rating",
    x = "Rating",
    y = "Proportion",
    fill = "Recommended"
  ) +
  theme_minimal()

brand_summary <- mydata_final %>%
  group_by(brand) %>%
  summarise(
    avg_rating = mean(reviews.rating, na.rm = TRUE),
    review_count = n()
  ) %>%
  filter(review_count >= 50) %>%   # remove small/noisy brands
  arrange(desc(avg_rating))

ggplot(brand_summary, aes(x = reorder(brand, avg_rating), y = avg_rating)) +
  geom_col(fill = "darkgreen") +
  coord_flip() +
  labs(
    title = "Average Rating by Brand (Min 50 Reviews)",
    x = "Brand",
    y = "Average Rating"
  ) +
  theme_minimal()


mydata_final %>%
  filter(brand %in% c("Microsoft")) %>%
  summarise(
    avg_rating = mean(reviews.rating, na.rm = TRUE),
    recommend_rate = mean(reviews.doRecommend, na.rm = TRUE)
  )

mydata_final$reviews.date <- as.Date(substr(mydata_final$reviews.date, 1, 10))

monthly_trend <- mydata_final%>%
  mutate(month = floor_date(reviews.date, "month")) %>%
  group_by(month) %>%
  summarise(avg_rating = mean(reviews.rating, na.rm = TRUE))

ggplot(monthly_trend, aes(x = month, y = avg_rating)) +
  geom_line(color = "purple") +
  labs(
    title = "Average Rating Trend Over Time",
    x = "Month",
    y = "Average Rating"
  ) +
  theme_minimal()

mydata <- mydata_final %>%
  mutate(review_length = nchar(reviews.text))

ggplot(mydata, aes(x = factor(reviews.rating), y = review_length)) +
  geom_boxplot(fill = "orange", outlier.alpha = 0.3) +
  scale_y_log10() +
  labs(
    title = "Review Length by Rating (Log Scale)",
    x = "Rating",
    y = "Number of Characters (log scale)"
  ) +
  theme_minimal()




