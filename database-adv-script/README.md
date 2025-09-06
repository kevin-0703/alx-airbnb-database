# Complex Queries with Joins

## Project Overview

This task is part of the **ALX Airbnb Database Module (Week 2: Advanced SQL)**.  
The objective is to demonstrate mastery of SQL joins by writing complex queries that combine data across multiple tables in the Airbnb schema.

The queries are written based on the following core entities from the ER diagram:

- **User**: Represents users of the platform (hosts and guests).
- **Property**: Represents listed properties available for booking.
- **Booking**: Represents reservations made by users.
- **Review**: Represents feedback left by users for properties.

The focus of this task is on **INNER JOIN, LEFT JOIN, and FULL OUTER JOIN**.

---

## Learning Objectives

By completing this task, you will:

- Understand how to use SQL joins to combine data from related tables.
- Apply different join types to solve real-world data retrieval problems.
- Recognize the differences between INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.
- Prepare queries that support common Airbnb use cases, such as viewing bookings, reviews, and users.

---

## Queries Implemented

### 1. INNER JOIN – Retrieve all bookings and the respective users

```sql
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Booking b
INNER JOIN User u
    ON b.user_id = u.user_id;
```

# Practice Subqueries

## Project Overview

This task is part of the **ALX Airbnb Database Module (Week 2: Advanced SQL)**.  
The objective is to gain proficiency in using **subqueries**, both correlated and non-correlated, to retrieve meaningful insights from the Airbnb schema.

---

## Learning Objectives

By completing this task, you will:

- Understand the difference between correlated and non-correlated subqueries.
- Use subqueries to calculate aggregated values such as averages and counts.
- Apply subqueries to solve real-world Airbnb use cases, such as filtering properties by rating and identifying highly active users.

---

## Queries Implemented

### 1. Non-Correlated Subquery – Properties with Average Rating > 4.0

```sql
SELECT
    p.property_id,
    p.title,
    p.location
FROM Property p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM Review r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);
```

# Apply Aggregations and Window Functions

## Project Overview

This task is part of the **ALX Airbnb Database Module (Week 2: Advanced SQL)**.  
The objective is to practice **aggregation functions** and **window functions** for analyzing booking and property data.

---

## Learning Objectives

By completing this task, you will:

- Use aggregation functions (`COUNT`, `SUM`, etc.) to summarize data.
- Apply `GROUP BY` to group results for meaningful insights.
- Use window functions (`ROW_NUMBER`, `RANK`) to rank or order data within partitions.
- Analyze booking activity across users and properties.

---

## Queries Implemented

### 1. Aggregation – Total Bookings by Each User

```sql
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;
```
