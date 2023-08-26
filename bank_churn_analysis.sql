SELECT * FROM bank_churn

/*Firstly, let's find the total churn %*/
  
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    (SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END::FLOAT) / COUNT(*)) * 100 AS churn_rate_percentage
FROM
    bank_churn
	
/*Next, we are looking at the churn % by gender*/

SELECT
    gender,
	COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    (SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END::FLOAT) / COUNT(*)) * 100 AS churn_rate_percentage
FROM
    bank_churn
GROUP BY gender

/*Now, let's calculate churn rate by age groups*/

SELECT
    CASE
        WHEN age < 18 THEN 'Under 18'
        WHEN age >= 18 AND age < 30 THEN '18-29'
        WHEN age >= 30 AND age < 40 THEN '30-39'
        WHEN age >= 40 AND age < 50 THEN '40-49'
        WHEN age >= 50 THEN '50 and Above'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    (SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END::FLOAT) / COUNT(*)) * 100 AS churn_rate_percentage
FROM
    bank_churn
GROUP BY
    age_group
ORDER BY
    age_group;
	
	
/*Churn rate by country*/	

SELECT
    country,
	COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    (SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END::FLOAT) / COUNT(*)) * 100 AS churn_rate_percentage
FROM
    bank_churn
GROUP BY country

/*Churn raper by credit card ownership*/

SELECT
    credit_card,
	COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    (SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END::FLOAT) / COUNT(*)) * 100 AS churn_rate_percentage
FROM
    bank_churn
GROUP BY credit_card

/*Churn rate by number of products*/

SELECT
    products_number,
	COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    (SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END::FLOAT) / COUNT(*)) * 100 AS churn_rate_percentage
FROM
    bank_churn
GROUP BY products_number
ORDER BY products_number desc
-------------------------------------------------------------------------------------------------------

/*Let's see how tenure affects the churn rate*/

SELECT
    CASE
        WHEN tenure < 3 THEN 'Short Tenure'
        ELSE 'Long Tenure'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    (SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END::FLOAT) / COUNT(*)) * 100 AS churn_rate_percentage
FROM
    bank_churn
GROUP BY
    tenure_group
ORDER BY
    churn_rate_percentage DESC;


WITH tenure_ranges AS (
    SELECT
        CASE
            WHEN tenure < 3 THEN '0-3 years'
            WHEN tenure >= 5 AND tenure < 24 THEN '3-5 years'
            WHEN tenure >= 10 AND tenure < 60 THEN '5-10 years'
            ELSE '10+ years'
        END AS tenure_range,
        churn
    FROM
        bank_churn
)
SELECT
    tenure_range,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    (SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END::FLOAT) / COUNT(*)) * 100 AS churn_rate_percentage
FROM
    tenure_ranges
GROUP BY
    tenure_range
ORDER BY
    churn_rate_percentage DESC;

SELECT
    churn,
    AVG(tenure) AS average_tenure
FROM
    bank_churn
GROUP BY
    churn;
	
/*Next we are checking the relationship between estimated salaries, account balance and churn rate*/

SELECT
    churn,
    AVG(balance) AS avg_account_balance
FROM
    bank_churn
GROUP BY
    churn
ORDER BY
    avg_account_balance
	
SELECT balance, estimated_salary, churn
FROM bank_churn
ORDER BY balance

/*Checking to see the percentage of customers who have account balance 0*/

SELECT COUNT(*) AS zero_balance
FROM bank_churn
WHERE balance = 0;

SELECT 
	COUNT (*) AS zero_balance,
	(COUNT (*) * 100 / (SELECT COUNT(*) FROM bank_churn)) AS zero_balance_percentage
FROM bank_churn
WHERE balance = 0

/*Let's create balance brackets and compare the churn rate against them
First, we check how many customers are in each bracket*/

SELECT
    balance_bracket,
    COUNT(*) AS customer_count
FROM
    (SELECT
        CASE
            WHEN balance = 0 THEN 'zero_balance'
            WHEN balance < 50000 THEN '1-50K'
            WHEN balance > 50000 AND balance < 100000 THEN '50K-100K'
            WHEN balance > 100000 AND balance < 200000 THEN '100K-200K'
            ELSE '200K+'
        END AS balance_bracket
    FROM bank_churn) AS subquery
GROUP BY
    balance_bracket
ORDER BY
    balance_bracket;



/*Now let's see the churn percentage based on customer balance*/
SELECT
	balance_bracket,
	COUNT(*) AS customer_count,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
	(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END::FLOAT) / COUNT (*)) *100 AS churn_percentage
FROM
(SELECT
	CASE
	WHEN balance = 0 THEN 'zero_balance'
	WHEN balance < 50000 THEN '1-50K'
	WHEN balance > 50000 AND balance < 100000 THEN '50K-100K'
	WHEN balance > 100000 AND balance < 200000 THEN '100K-200K'
	ELSE '200K+'
	END AS balance_bracket, churn
FROM bank_churn) AS subquery
GROUP BY balance_bracket
ORDER BY customer_count



/*Now let's check estimated salary brackets*/

SELECT

	salary_bracket,
	COUNT(*) AS customer_count,
	SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
	(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END::FLOAT) / COUNT (*)) *100 AS churn_percentage
FROM
(SELECT
 CASE
 	WHEN estimated_salary < 50000 THEN 'below 50k'
 	WHEN estimated_salary > 50000 and estimated_salary < 100000 THEN '50K - 100K'
 	WHEN estimated_salary > 100000 AND estimated_salary < 150000 THEN '100K - 150K'
 ELSE '150K+'
 END AS salary_bracket, churn
FROM bank_churn) AS subquery
GROUP BY salary_bracket
ORDER BY customer_count

