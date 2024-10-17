-- Active: 1721240126074@@127.0.0.1@5432@g_dwh@public
--drop at first
DROP TABLE IF EXISTS sales_fact;
DROP TABLE IF EXISTS branch_dim;
DROP TABLE IF EXISTS producrtdim;
DROP TABLE IF EXISTS time_dimension;
DROP TABLE IF EXISTS customer_dim;
DROP TABLE IF EXISTS sales_dim;


----------------------------------------------------------------------------------------------
-- table branch_dim 
--from RDMS(postgres)

CREATE TABLE branch_dim(
    branch_id integer NOT NULL,
    branch_name varchar(255),
    branch_manager varchar(255),
    branch_phone_number varchar(255),
    branch_opening_date date,
    branch_type varchar(255),
    branch_stock_market varchar(255),
    branch_stock_symbol varchar(255),
    branch_country_code varchar(255),
    PRIMARY KEY(branch_id)
);

-- table product dim
-- from rdms(mysql) 
CREATE TABLE producrtdim(
    product_id integer NOT NULL,
    product_name varchar(255),
    brand varchar(255),
    category varchar(255),
    price double precision,
    quantity_in_stock integer,
    release_date date,
    expiration_date date,
    weight double precision,
    dimensions varchar(255),
    product_age_days integer,
    dimension_size integer,
    PRIMARY KEY(product_id)
);

-- table time dim
--from xml file 
CREATE TABLE time_dimension(
    time_id integer NOT NULL,
    year integer,
    month integer,
    day integer,
    hour integer,
    minute integer,
    second integer,
    quarter varchar(255),
    season varchar(255),
    is_weekend boolean,
    PRIMARY KEY(time_id)
);

-- table customer dim
-- from txt file
CREATE TABLE customer_dim(
    customer_id integer NOT NULL,
    first_name varchar(255),
    last_name varchar(255),
    age integer,
    email varchar(255),
    gender varchar(255),
    membership_status varchar(255),
    join_date varchar(255),
    country varchar(255),
    phone_number varchar(255),
    month integer,
    day integer,
    year integer,
    PRIMARY KEY(customer_id)
);




-- table sales dim 
--from json file 
CREATE TABLE sales_dim(
    sales_person_id  SERIAL ,
    first_name varchar(255),
    last_name varchar(255),
    age integer,
    email varchar(255),
    country varchar(255),
    city varchar(255),
    postal_code varchar(255),
    commission_rate numeric(5,2),
    total_sales numeric(15,2),
    commission_earned numeric(15,2),
    target_met boolean,
    product_category varchar(255),
    payment_method varchar(255),
    PRIMARY KEY(sales_person_id)
);


-- -----------------
-- create fact 
CREATE TABLE sales_fact(
    fact_id SERIAL PRIMARY KEY,
    branch_id INTEGER REFERENCES branch_dim(branch_id),  -- Foreign key to branch_dim
    time_id INTEGER REFERENCES time_dimension(time_id),   -- Foreign key to time_dimension
    product_id INTEGER REFERENCES producrtdim(product_id), -- Foreign key to producrtdim
    customer_id INTEGER REFERENCES customer_dim(customer_id), -- Foreign key to customer_dim
    salesperson_id INTEGER REFERENCES sales_dim(sales_person_id), -- Foreign key to sales_dim
    total_sales NUMERIC(15, 2),
    quantity_sold INTEGER,
    discount_given NUMERIC(15, 2),
    sales_target_achieved BOOLEAN,
    profit_margin NUMERIC(15, 2)
);
