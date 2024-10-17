use dbproduct ;
-- #1. Find the Total Number of Products for Each Category
SELECT category, COUNT(*) AS total_products
FROM producrtdim
GROUP BY category
ORDER BY total_products DESC;

-- #2. Calculate the Average Price of Products in Each Category

SELECT category, AVG(price) AS average_price
FROM  producrtdim
GROUP BY category
ORDER BY average_price DESC;


-- #3. List Products that are Currently in Stock
SELECT product_name, brand, quantity_in_stock
FROM producrtdim
WHERE quantity_in_stock > 0
ORDER BY quantity_in_stock DESC;

-- #4. Find the Top 5 Most Expensive Products
SELECT product_name, price, brand
FROM  producrtdim
ORDER BY price DESC
LIMIT 5;

-- #5. Calculate the Total Value of Stock for Each Product
 

SELECT product_name, price, quantity_in_stock, (price * quantity_in_stock) AS total_stock_value
FROM  producrtdim
ORDER BY total_stock_value DESC;

-- #6. Identify the Products with the Lowest Stock Quantity
 
SELECT product_name, quantity_in_stock
FROM   producrtdim
ORDER BY quantity_in_stock ASC
LIMIT 10;

-- #7. Get the Average Weight of Products by Dimension Type

SELECT dimensions, AVG(weight) AS average_weight
FROM  producrtdim
GROUP BY dimensions
ORDER BY average_weight DESC;

-- #8. Find Products Released Before a Specific Date (e.g., 2010)
SELECT product_name, release_date
FROM  producrtdim
WHERE release_date < '2010-01-01'
ORDER BY release_date;

-- #9. Identify the Top 5 Brands with the Highest Total Stock Value
SELECT brand, SUM(price * quantity_in_stock) AS total_stock_value
FROM  producrtdim
GROUP BY brand
ORDER BY total_stock_value DESC
LIMIT 5;

-- #10. Find Categories with More Than 1000 Total Products in Stock
SELECT category, SUM(quantity_in_stock) AS total_quantity
FROM  producrtdim
GROUP BY category
HAVING total_quantity > 1000
ORDER BY total_quantity DESC;

