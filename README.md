# MySQL SQL Analysis Practice — Computer Store

## Overview

This project contains a series of SQL exercises based on a **Computer Store** dataset. The exercises focus on using MySQL to query, analyze, and manipulate product and manufacturer data.

The purpose of this project is to strengthen practical SQL skills used in data analysis, including filtering, aggregation, sorting, joins, subqueries, and data modification.

**Source:** [SQL Exercises — The Computer Store](https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store)

---

## Dataset

The database contains two primary tables:

### Products

Contains information about products available in the store.

Key fields include:

* `Code` — Product identifier
* `Name` — Product name
* `Price` — Product price
* `Manufacturer` — Manufacturer code

### Manufacturers

Contains information about product manufacturers.

Key fields include:

* `Code` — Manufacturer identifier
* `Name` — Manufacturer name

The `Products.Manufacturer` column is related to `Manufacturers.Code`.

---

## SQL Concepts Practiced

### 1. Basic Data Retrieval

* `SELECT`
* Selecting specific columns
* Selecting complete datasets using `SELECT *`

### 2. Filtering Data

* `WHERE`
* Comparison operators
* `BETWEEN`
* Filtering based on numerical conditions

### 3. Data Transformation

* Arithmetic calculations
* Creating calculated columns
* Column aliases using `AS`

Example:

```sql
SELECT Name, (Price * 100) AS PriceInCents
FROM Products;
```

### 4. Aggregations

Used aggregate functions to analyze product data:

* `AVG()`
* `COUNT()`
* `MIN()`
* `MAX()`

### 5. Sorting

Used `ORDER BY` to organize query results:

* Ascending order
* Descending order
* Multiple-column sorting

### 6. Joins

Used joins to combine product and manufacturer information:

* `INNER JOIN`
* `LEFT JOIN`

Example:

```sql
SELECT Products.Name,
       Products.Price,
       Manufacturers.Name
FROM Products
LEFT JOIN Manufacturers
ON Products.Manufacturer = Manufacturers.Code;
```

### 7. Grouped Analysis

Used:

* `GROUP BY`
* `HAVING`

to calculate and filter manufacturer-level metrics.

Example:

```sql
SELECT Manufacturers.Name,
       AVG(Products.Price)
FROM Manufacturers
INNER JOIN Products
ON Manufacturers.Code = Products.Manufacturer
GROUP BY Manufacturers.Name
HAVING AVG(Products.Price) >= 150;
```

### 8. Subqueries

Used nested queries to answer analytical questions such as:

* Finding the cheapest product
* Finding the most expensive product for each manufacturer

### 9. Data Modification

Practiced basic database modification operations:

* `INSERT`
* `UPDATE`

Examples included adding a new product, updating a product name, and applying discounts.

---

## Analysis Performed

The exercises answer questions such as:

* What products are available?
* Which products fall within a particular price range?
* What is the average product price?
* How many products cost at least $180?
* Which products are the most expensive?
* Which manufacturer has products with a higher average price?
* What is the cheapest product?
* What is the most expensive product for each manufacturer?
* How can product prices be modified using SQL?

---

## Skills Demonstrated

* MySQL
* SQL querying
* Data filtering
* Data aggregation
* Data transformation
* Relational data analysis
* SQL joins
* Subqueries
* Grouped analysis
* Basic data manipulation

---

## Project Structure

```text
SQL_execise_practice-2 5/
│
├── SQL_Exercises.sql
└── README.md
```

---

## Learning Outcome

This project helped develop practical SQL skills for working with relational datasets and answering business-style analytical questions.

The main focus was not only writing SQL syntax, but understanding how to use SQL to **retrieve, transform, aggregate, compare, and analyze data**.

---

## Next Steps

The next stage of the SQL learning roadmap will build on these concepts with:

* Common Table Expressions (CTEs)
* Window Functions
* Advanced subqueries
* `CASE` statements
* Date and time analysis
* Data cleaning using SQL
* More complex business analytics problems
* Query optimization
