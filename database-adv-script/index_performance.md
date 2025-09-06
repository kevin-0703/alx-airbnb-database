# Index Performance Optimization

## Project Overview

This task is part of the **ALX Airbnb Database Module (Week 2: Advanced SQL)**.  
The objective is to identify high-usage columns in the User, Booking, and Property tables and create indexes to optimize query performance. Performance is measured using `EXPLAIN` or `ANALYZE` before and after index creation.

---

## Identified High-Usage Columns

Based on typical queries and relationships in the Airbnb schema:

- **User Table**

  - `email`: Frequently used in authentication queries.
  - `user_id`: Used in joins with the Booking table.

- **Booking Table**

  - `user_id`: Used to link bookings to users.
  - `property_id`: Used to link bookings to properties.
  - `start_date, end_date`: Frequently used for availability and date range queries.

- **Property Table**
  - `location`: Common filter in property search queries.
  - `property_id`: Used in joins with Booking and Review.
  - `price_per_night`: Used in filtering and ordering search results.

---

## Index Creation

SQL commands for index creation are stored in **`database_index.sql`**:

```sql
-- User Table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_id ON User(user_id);

-- Booking Table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);

-- Property Table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_id ON Property(property_id);
CREATE INDEX idx_property_price ON Property(price_per_night);
```
