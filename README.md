# 🏥📈 Predictive Analytics in R: Healthcare & Banking

A dual-focus data analytics project demonstrating the application of Multiple Linear Regression and Decision Tree Classification to solve real-world problems in the healthcare and banking sectors.

## 📖 Overview
In today's data-driven economy, companies rely heavily on predictive analytics for informed decision-making. This repository contains R scripts developed to estimate medical billing costs for insurance purposes and to predict customer conversion rates for bank term deposits. It was originally developed as part of an academic module on Big Data and Analytics.

## 🎯 Objectives
1. **Healthcare Cost Estimation:** Utilize Multiple Linear Regression to examine the impact of patient demographics (age, BMI, dependents) and lifestyle choices (smoking) on medical insurance charges.
2. **Bank Deposit Subscriptions:** Apply Decision Tree Classification to predict whether a client will subscribe to a term deposit based on their financial history and marketing campaign interactions.

## 🛠️ Technology Stack
- **Language:** R
- **Libraries/Packages:** `caret`, `rpart`, `rpart.plot`, `ggplot2`, `dplyr`
- **Environment:** RStudio

## 📂 Project Structure
```text
predictive-analytics-r/
├── src/
│   ├── Insurance Regression Report.R        # Regression model script
│   └── Bank Deposite Decision Tree Report.R # Classification model script
├── data/
│   ├── insurance.csv                        # Healthcare dataset
│   └── bank.csv                             # Marketing/banking dataset
└── docs/
    └── IS4S765_W2_Report_Abdullah.docx      # Original detailed methodology report
```

## 📈 Methodology
- **Healthcare Regression:** The dataset is split into training and testing sets. A linear model (`lm()`) is fitted. Residuals are analyzed for homoscedasticity and normality. The model's R-squared and RMSE are calculated to validate predictive accuracy.
- **Bank Classification:** The dataset is cleaned and balanced. A recursive partitioning tree (`rpart()`) is trained. The tree is pruned to prevent overfitting, and a confusion matrix is generated to evaluate accuracy, sensitivity, and specificity.

## 🚀 Usage
To run the analysis, ensure R is installed, open your terminal or RStudio, and execute:
```bash
Rscript "src/Insurance Regression Report.R"
Rscript "src/Bank Deposite Decision Tree Report.R"
```



## 👨‍💻 Author
**Agha Abdullah**
- GitHub: [@AGHAABDULLAH](https://github.com/AGHAABDULLAH)
## ⚖️ License
This project is licensed under the MIT License.
