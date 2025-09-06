# Partitioning Performance Report

## Objective

The Booking table was becoming very large, leading to slow query performance when filtering by date ranges. To address this, we implemented **range partitioning** based on the `start_date` column.

---

## Implementation

We restructured the Booking table into multiple partitions:

- Booking_2022 (2022 bookings)
- Booking_2023 (2023 bookings)
- Booking_2024 (2024 bookings)
- Booking_default (fallback for other years)

Queries filtering by date ranges now target only the relevant partition rather than scanning the entire Booking table.

---

## Performance Testing

### Query Before Partitioning

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking_old
WHERE start_date BETWEEN '2023-05-01' AND '2023-05-31';
```
