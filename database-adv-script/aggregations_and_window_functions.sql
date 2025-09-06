-- Query 1: Find the total number of bookings made by each user
SELECT 
    u.user_id,
    u.username,
    COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.username
ORDER BY total_bookings DESC;


-- Query 2: Rank properties based on the total number of bookings they have received
SELECT 
    p.property_id,
    p.title AS property_title,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rownum
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.title
ORDER BY total_bookings DESC;
