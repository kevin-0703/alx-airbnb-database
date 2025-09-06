# Database Performance Monitoring and Refinement

## Objective

The goal of this task was to monitor query execution performance, identify bottlenecks, and refine the schema for optimal efficiency.

---

## Step 1: Monitoring Queries

We monitored three frequently used queries:

### Query 1: Retrieve bookings by user

```sql
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.end_date, p.title
FROM Booking b
JOIN Property p ON b.property_id = p.property_id
WHERE b.user_id = 101;
```
