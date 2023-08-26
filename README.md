# Banking Customer Churn Data Analysis #

This repository contains a comprehensive data analysis project focused on understanding customer churn in the banking industry. The analysis involves data cleaning using Excel, data manipulation and exploration in PostgreSQL, and data visualization using Tableau. The project provides insights into customer attrition patterns and demographic trends that impact churn rates.
### Dataset used: 
https://www.kaggle.com/datasets/gauravtopre/bank-customer-churn-dataset

## Project Definition ##
### Objective: Clean, analyze, and visualize customer churn data to gain insights into factors affecting churn rates in the banking industry. ###

#### Key Questions: ####

##### What is the overall churn rate for the bank's customers? #####
This will provide an initial understanding of the customer attrition rate and the potential impact on the bank's business.

#### Are there specific demographics that exhibit higher churn rates? ####
Analyzing churn rates by demographic factors like age, gender, and country can help identify any patterns or segments with higher attrition.

#### How does customer tenure relate to churn? ####
Analyze whether longer-tenured customers are less likely to churn compared to newer ones and understand the implications.

#### Is there a correlation between churn and account balance or estimated salary? ####
Explore whether customers with lower balances or salaries are more likely to churn, which might indicate potential issues.

## Data Collection ## 
The dataset used for this analysis contains the following columns: customer_id, credit_score, country, gender, age, tenure, balance, products_number, credit_card, active_member, estimated_salary, churn. Please see the dataset attached.

## Data Cleaning and Preprocessing ##

Step 1: Using COUNTBLANK to identify any blank cells and addressing them to ensure data accuracy. 

Step 2: Changing the following columns from text to numeric: credit_score, age, tenure, balance, credit_score, estimated_salary, products_number.

Step 3: Converting binary values to “Yes” and “No” in the following columns: credit_card, active_member, churn.

Step 4: Using the Filter function to check unique values in each column and handling any inconsistencies.

Step 5: Data is further cleaned and preprocessed in PostgreSQL, including handling missing values, duplicates, and outliers.

## Data Analysis in PostgreSQL ##

Step 1: The cleaned dataset was imported into a PostgreSQL database for advanced analysis.

Step 2: Various SQL queries were executed to explore the dataset's characteristics, including total customers and churn percentages.

Step 3: Customer demographics, such as gender, country, and annual income, were analyzed to identify patterns that might influence churn rates.

Step 4: Customer tenure was examined to determine its relationship with churn rates.

Step 5: Churn rates were further investigated with respect to account balance, revealing insights into the impact of financial standing on churn.

Please see .sql file attached

## Data Visualization in Tableau ##

Step 1: The PostgreSQL analysis results were imported into Tableau for interactive visualization.

Step 2: Key findings were transformed into engaging visualizations, allowing for easy understanding of the insights.

Step 3: The Tableau dashboards and visualizations were organized to tell a cohesive story about customer churn trends.

Please see Tableau Dashboard here: https://public.tableau.com/views/BankCustomerChurnDashboard_16930885057770/Dashboard1?:language=en-GB&publish=yes&:display_count=n&:origin=viz_share_link 

## Key Findings ## 

After a comprehensive analysis of the banking customer churn data, the following key findings were observed:

#### Overall Churn Rate: 
The overall churn rate for the bank's customers was calculated to be approximately 20.37%. This initial understanding of customer attrition provides insight into the potential impact on the bank's business.

#### Demographics and Churn Rates: 
Demographic analysis revealed interesting insights. Older age groups exhibited higher churn rates compared to younger age groups. This suggests that the bank should pay particular attention to retaining its older customers.

#### Tenure and Churn: 
Customer tenure was observed to be related to churn. Customers with longer tenure are less likely to churn compared to newer customers. This indicates the importance of building strong, long-term relationships with customers.

#### Account Balance and Churn: 
Churn rates varied based on the account balance. Accounts with higher balances (200K+) exhibited the highest churn rate, while zero-balance accounts had the lowest churn rate. This underscores the importance of catering to the needs of different balance brackets.

#### Churn by Country: 
The churn rate was found to differ across countries. Germany had the highest churn rate among all countries. This suggests a need for targeted strategies to reduce churn in specific regions.

#### Gender and Churn: 
Gender analysis indicated that women are more likely to cancel their accounts compared to men. This insight can inform personalized communication strategies to retain female customers.

#### Annual Income and Churn: 
Churn rates appeared to have a correlation with annual income. Higher earners had a slightly higher churn rate, suggesting that financial stability might not be the sole factor influencing churn.

## Conclusion ##
This project successfully explores and visualizes customer churn trends within a banking context. By combining data cleaning, SQL analysis, and Tableau visualization, valuable insights were gained into the factors influencing customer attrition. The findings can guide strategic decisions to retain customers and improve the overall business performance.
