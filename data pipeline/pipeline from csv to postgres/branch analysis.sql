-- anther method to doing data pipeline 
create table public ."branch_analysis"(branch_id int, branch_name varchar(100), branch_manager text, branch_phone_number varchar(100), branch_opening_date date, branch_type text, branch_stock_market text, branch_stock_symbol varchar(100), branch_country_code text)

select*from public ."branch_analysis"

SET datestyle = 'ISO, MDY';

copy public ."branch_analysis" from 'D:\Documents\Desktop\Branch_Dimension_new.csv'  csv header;

-- Query 1: Calculate the total number of branches for each country.
-- Uses COUNT(branch_id) to count the number of branches grouped by branch_country_code.
SELECT 
    branch_country_code, 
    COUNT(branch_id) AS Total_Branches
FROM branch_dim
GROUP BY branch_country_code
ORDER BY Total_Branches DESC;


-- Query 2: Calculate the total number of branches by branch type.
-- Groups the branches by branch_type to count how many branches exist for each type.
SELECT 
    branch_type, 
    COUNT(branch_id) AS Total_Branches
FROM branch_dim
GROUP BY branch_type
ORDER BY Total_Branches DESC;

-- Query 3: Find branches opened after the year 2020.
-- Extracts the year from branch_opening_date and filters branches that opened after 2020.
SELECT 
    branch_id, 
    branch_name, 
    branch_opening_date
FROM branch_dim
WHERE EXTRACT(YEAR FROM branch_opening_date) > 2020
ORDER BY branch_opening_date ASC;

-- Query 4: Count the number of branches listed on each stock market.
-- Groups branches by branch_stock_market to see how many branches are listed in each market.
SELECT 
    branch_stock_market, 
    COUNT(branch_id) AS Total_Branches
FROM branch_dim
GROUP BY branch_stock_market
ORDER BY Total_Branches DESC;

-- Query 5: Identify branches that have a specific stock symbol.
-- Filters the branches based on the given stock symbol to find matching branches.
SELECT 
    branch_id, 
    branch_name, 
    branch_stock_symbol
FROM branch_dim
WHERE branch_stock_symbol = 'XYZ'
ORDER BY branch_name;

-- Query 6: Calculate the total number of branches managed by each branch manager.
-- Groups the data by branch_manager to count the number of branches managed by each person.
SELECT 
    branch_manager, 
    COUNT(branch_id) AS Total_Branches_Managed
FROM branch_dim
GROUP BY branch_manager
ORDER BY Total_Branches_Managed DESC;

-- Query 7: List branches located in a specific country.
-- Filters the data to show branches located in the given country (e.g., country code = 'US').
SELECT 
    branch_id, 
    branch_name, 
    branch_country_code
FROM branch_dim
WHERE branch_country_code = 'US'
ORDER BY branch_name;

-- Query 8: Calculate the average number of branches for each country.
-- Uses COUNT and AVG to determine the average number of branches by country code.
SELECT 
    branch_country_code, 
    AVG(COUNT(branch_id)) OVER () AS Avg_Branches_Per_Country
FROM branch_dim
GROUP BY branch_country_code
ORDER BY Avg_Branches_Per_Country DESC;

-- Query 9: Calculate the number of branches by branch type for each country.
-- Uses a combination of branch_type and branch_country_code to see distribution by type and country.
SELECT 
    branch_country_code, 
    branch_type, 
    COUNT(branch_id) AS Total_Branches
FROM branch_dim
GROUP BY branch_country_code, branch_type
ORDER BY branch_country_code, branch_type;

-- Query 10: List branches managed by a specific branch manager.
-- Filters the branches based on the name of the branch manager to find all branches they manage.
SELECT 
    branch_id, 
    branch_name, 
    branch_manager
FROM branch_dim
WHERE branch_manager = 'John Doe'
ORDER BY branch_name;

