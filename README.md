# Electronics Product Reviews Analysis
### Product Performance, Brand Benchmarking & Customer Sentiment Insights

[cite_start]This analysis evaluates customer review data (~6,900 reviews) for electronics products to understand product performance, customer satisfaction, and brand perception trends between 2015 and 2018[cite: 3, 21]. [cite_start]By combining ratings, recommendation behavior, and sentiment analysis, the study provides a holistic view of how customers perceive brands—particularly **Microsoft**—against its competitors[cite: 6].

## 🎯 Business Objectives
The analysis was designed to answer key business questions:
* [cite_start]Which products perform best in terms of customer satisfaction and engagement? [cite: 14]
* [cite_start]How does Microsoft compare to other electronics brands? [cite: 15]
* [cite_start]What factors drive high or low customer ratings? [cite: 16]
* [cite_start]How does customer perception change over time? [cite: 17]
* [cite_start]Are there cases where sentiment and ratings disagree? [cite: 18]

## 🛠️ Methodology
The project followed a structured analytics workflow:
1. [cite_start]**Data Preparation**: Removed non-informative fields, handled missing values, and engineered features like review length[cite: 33, 34, 35, 36].
2. [cite_start]**Exploratory Analysis**: Examined rating distributions, brand coverage, and recommendation patterns[cite: 37, 38].
3. [cite_start]**SQL-Based Analysis**: Computed performance metrics and analyzed sentiment/time-based trends[cite: 40, 41, 42].
4. [cite_start]**Visualization**: Built four interactive dashboards in Tableau[cite: 44].

## 📂 Project Resources
* **Interactive Workbook**: [Download Electric_retail.twbx](tableau/Electric_retail.twbx)
* [cite_start]**Dataset Size**: ~6,905 reviews covering 38 brands[cite: 21, 22].

## 🔍 Key Findings & Insights

### 1. Executive Overview
* [cite_start]Customer ratings are heavily skewed toward 4–5 stars[cite: 48].
* [cite_start]Over 75% of customers recommend the products they review[cite: 53].
* [cite_start]Sentiment analysis reinforces the positive bias observed in ratings[cite: 50].

![Executive Overview](tableau/1.Electronics%20Product%20Reviews%20-%20Executive%20Overview.png)

### 2. Product Performance
* [cite_start]High ratings do not always correspond to high review volume[cite: 55].
* [cite_start]Review length alone does not guarantee "helpfulness"[cite: 58].
* [cite_start]Product success depends on quality, popularity, and usefulness evaluated together[cite: 60].

![Product Performance](tableau/2.Product%20performance.png)

### 3. Brand Comparison: Microsoft vs Competitors
* [cite_start]Microsoft products maintain competitive average ratings[cite: 62].
* [cite_start]Sustained differentiation depends on customer advocacy and sentiment consistency[cite: 67].
* [cite_start]A small number of brands dominate total customer engagement[cite: 65].

![Brand Comparison](tableau/3.Brand%20Comparison.png)

### 4. Sentiment & Time-Based Trends
* [cite_start]Average ratings remain stable over time[cite: 69].
* [cite_start]Negative or neutral sentiment shifts often precede rating declines[cite: 70].
* [cite_start]Contradictory cases (high rating + negative sentiment) reveal nuanced customer experiences[cite: 72].

![Sentiment & Time Trends](tableau/4.Sentiment%20and%20Time%20analysis.png)

## 💡 Strategic Implications
* [cite_start]**Beyond Ratings**: Recommendation behavior is a stronger indicator of true satisfaction[cite: 78].
* [cite_start]**Early Signals**: Sentiment trends act as early risk warnings for brand health[cite: 79].
* [cite_start]**Consistency**: Brands should focus on experience consistency, not just average scores[cite: 80].

---
[cite_start]**Tools Used**: Excel • R • SQL (MySQL) • Tableau [cite: 3]  
[cite_start]**Analysis by**: Arjun MM [cite: 3]
