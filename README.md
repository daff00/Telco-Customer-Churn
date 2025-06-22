# 📡 Telco Customer Churn Prediction

This repository contains an **end-to-end data science project** focused on predicting customer churn for a fictional telecommunications company. Our goal is to leverage customer data to identify key drivers of churn and build a robust machine learning model that predicts customers who are most at risk — allowing for proactive and targeted retention strategies.

---

## 📊 Project Workflow

This project follows a structured and reproducible data science pipeline, including:

✅ **Database Setup & Initial Profiling (SQL)**  
- Built a normalized schema in **MySQL**  
- Conducted initial data exploration and hypothesis generation via SQL queries  

✅ **Exploratory Data Analysis (EDA)**  
- Explored feature distributions and key relationships  
- Visualized churn rates across different customer segments (e.g. contract types, internet service)

✅ **Data Preprocessing & Feature Engineering**  
- Developed a preprocessing function to handle data cleaning, outlier capping (IQR), and encoding  
- Engineered predictive features like `TotalSpent` and `IsLongContract`

✅ **Handling Class Imbalance**  
- Applied **SMOTE** (Synthetic Minority Over-sampling Technique) inside a Scikit-learn pipeline to address class imbalance and reduce model bias

✅ **Automated Modeling & Hyperparameter Tuning**  
- Trained four classifiers (**Logistic Regression**, **Decision Tree**, **Random Forest**, **XGBoost**)  
- Leveraged **Optuna** for automated hyperparameter tuning using **AUC-ROC** as the optimization metric

✅ **Evaluation & Insights**  
- Selected the best model (**XGBoost**) with **78% accuracy** and **71% recall** on the churn class  
- Provided actionable business recommendations for targeted retention campaigns

---

## 🛠️ Tech Stack

| Component         | Technology                                 |
|-------------------|--------------------------------------------|
| **Database**       | MySQL                                      |
| **Language**       | Python                                     |
| **Core Libraries** | Pandas, NumPy, Scikit-learn, Matplotlib, Seaborn |
| **Advanced Tools** | SMOTE (imblearn), Optuna (Hyperparameter Tuning) |

---

## 🚀 Getting Started

### 1️⃣ Dataset
- Download the **Telco Customer Churn** dataset from Kaggle:  
[WA_Fn-UseC_-Telco-Customer-Churn.csv](https://www.kaggle.com/blastchar/telco-customer-churn)  
- Place the file where your MySQL server can access it.

---

### 2️⃣ Database Setup (MySQL)
Use the SQL scripts provided in this order:
1. `Database and Table Creation.sql` — Creates `telco_churn` database and all tables  
2. `Insert Data Into Table.sql` — Loads data into a staging table and final tables  

> ⚠️ Don’t forget to update the file path inside the script to point to your local CSV file!

---

### 3️⃣ Data Analysis & Modeling (Jupyter Notebook)
- Set up a **Python environment** and install dependencies (`requirements.txt` recommended).  
- Edit the `db_config` dictionary inside the notebook with your MySQL credentials.  
- Run all cells sequentially in `notebook.ipynb` to:
  - Perform EDA
  - Preprocess the data
  - Tune models
  - Evaluate and extract business insights

---

## 📈 Key Findings & Impact

💡 **Top Churn Drivers:**  
- Month-to-Month contracts  
- Short tenure  
- Fiber Optic internet service

🏆 **Best Model:**  
- **XGBoost**, tuned with Optuna  
- **Test Accuracy:** 78%  
- **Recall (Churn Class):** 71%

🎯 **Business Impact:**  
The model enables proactive intervention for customers most at risk of leaving — allowing the business to deploy targeted retention strategies and reduce churn rates.

---

## 📝 License
This project is provided for educational purposes under the MIT License.

---

✨ **Enjoy exploring and improving this project!**  
Feel free to fork, contribute, or suggest enhancements.  
Your feedback and ideas are always welcome!

---

*Happy Coding! 🎉*