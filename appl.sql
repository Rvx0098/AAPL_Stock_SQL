-- Create Table

DROP TABLE IF EXISTS apple_stock;

CREATE TABLE apple_stock (
    stock_date DATE,
    open NUMERIC(12,6),
    high NUMERIC(12,6),
    low NUMERIC(12,6),
    close NUMERIC(12,6),
    adj_close NUMERIC(12,6),
    volume BIGINT
);

-- Query 1: Total Trading Days

SELECT COUNT(*) AS trading_days
FROM apple_stock;

-- Query 2: Dataset Date Range

SELECT
    MIN(stock_date) AS first_day,
    MAX(stock_date) AS last_day
FROM apple_stock;

-- Query 3: Highest Closing Price

SELECT
    stock_date,
    close
FROM apple_stock
ORDER BY close DESC
LIMIT 1;

-- Query 4: Highest Trading Volume Days

SELECT
    stock_date,
    volume
FROM apple_stock
ORDER BY volume DESC
LIMIT 10;

-- Query 5: Largest Daily Gains

SELECT
    stock_date,
    ROUND(close - open, 2) AS gain
FROM apple_stock
ORDER BY gain DESC
LIMIT 10;

-- Query 6: Largest Daily Losses

SELECT
    stock_date,
    ROUND(close - open, 2) AS loss
FROM apple_stock
ORDER BY loss ASC
LIMIT 10;

-- Query 7: Average Closing Price by Year

SELECT
    EXTRACT(YEAR FROM stock_date) AS year,
    ROUND(AVG(close), 2) AS avg_close
FROM apple_stock
GROUP BY year
ORDER BY year;

-- Query 8: Top Performing Years

SELECT
    EXTRACT(YEAR FROM stock_date) AS year,
    ROUND(AVG(close), 2) AS avg_close
FROM apple_stock
GROUP BY year
ORDER BY avg_close DESC
LIMIT 10;

-- Query 9: Monthly Average Closing Price

SELECT
    DATE_TRUNC('month', stock_date) AS month,
    ROUND(AVG(close), 2) AS avg_close
FROM apple_stock
GROUP BY month
ORDER BY month;

-- Query 10: Stock Price Ranking

SELECT
    stock_date,
    close,
    RANK() OVER (
        ORDER BY close DESC
    ) AS rank
FROM apple_stock
LIMIT 20;