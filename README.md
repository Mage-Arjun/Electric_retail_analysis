# Electronics Product Reviews Analysis
### Product Performance, Brand Benchmarking & Customer Sentiment Insights

This analysis evaluates customer review data (~6,900 reviews) for electronics products to understand product performance, customer satisfaction, and brand perception trends between 2015 and 2018. By combining ratings, recommendation behavior, and sentiment analysis, the study provides a holistic view of how customers perceive brands—particularly **Microsoft**—against its competitors.

## 🎯 Business Objectives
The analysis was designed to answer key business questions:
* Which products perform best in terms of customer satisfaction and engagement?
* How does Microsoft compare to other electronics brands?
* What factors drive high or low customer ratings?
* How does customer perception change over time?
* Are there cases where sentiment and ratings disagree?

## 🛠️ Methodology
The project followed a structured analytics workflow:
1. **Data Preparation**: Removed non-informative fields, handled missing values, and engineered features like review length.
2. **Exploratory Analysis**: Examined rating distributions, brand coverage, and recommendation patterns.
3. **SQL-Based Analysis**: Computed performance metrics and analyzed sentiment/time-based trends.
4. **Visualization**: Built four interactive dashboards in Tableau.

## 📂 Project Resources
* **Interactive Workbook**: [Download Electric_retail.twbx](tableau/Electric_retail.twbx)
* **Dataset Size**: ~6,905 reviews covering 38 brands.

## 🔍 Key Findings & Insights

### 1. Executive Overview
* Customer ratings are heavily skewed toward 4–5 stars.
* Over 75% of customers recommend the products they review.
* Sentiment analysis reinforces the positive bias observed in ratings.

![Executive Overview](tableau/1.Electronics%20Product%20Reviews%20-%20Executive%20Overview.png)

### 2. Product Performance
* High ratings do not always correspond to high review volume.
* Review length alone does not guarantee "helpfulness".
* Product success depends on quality, popularity, and usefulness evaluated together.

![Product Performance](tableau/2.Product%20performance.png)

### 3. Brand Comparison: Microsoft vs Competitors
* Microsoft products maintain competitive average ratings.
* Sustained differentiation depends on customer advocacy and sentiment consistency.
* A small number of brands dominate total customer engagement.

![Brand Comparison](tableau/3.Brand%20Comparison.png)

### 4. Sentiment & Time-Based Trends
* Average ratings remain stable over time.
* Negative or neutral sentiment shifts often precede rating declines.
* Contradictory cases (high rating + negative sentiment) reveal nuanced customer experiences.

![Sentiment & Time Trends](tableau/4.Sentiment%20and%20Time%20analysis.png)

## 💡 Strategic Implications
* **Beyond Ratings**: Recommendation behavior is a stronger indicator of true satisfaction.
* **Early Signals**: Sentiment trends act as early risk warnings for brand health.
* **Consistency**: Brands should focus on experience consistency, not just average scores.

---
**Tools Used**: Excel • R • SQL (MySQL) • Tableau  
**Analysis by**: Arjun MM
