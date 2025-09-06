# Optimization Report

## Initial Query

The initial query retrieved all bookings with user details, property details, and payment details:

```sql
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.username,
    u.email,
    p.property_id,
    p.title,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
```
