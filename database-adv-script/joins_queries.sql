-- 1. INNER JOIN: Retrieve all bookings and their respective users
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

-- 2. LEFT JOIN: Retrieve all properties and their reviews (including properties without reviews)
SELECT 
    p.property_id,
    p.title,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM Property p
LEFT JOIN Review r 
    ON p.property_id = r.property_id;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM User u
FULL OUTER JOIN Booking b
    ON u.user_id = b.user_id;
