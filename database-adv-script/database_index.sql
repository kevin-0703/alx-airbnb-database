-- Create indexes on high-usage columns
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);


-- Measure query performance BEFORE indexes
-- (Assume this is run before creating indexes)
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.end_date, u.username, p.title
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2023-01-01' AND '2023-12-31';


-- Measure query performance AFTER indexes
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.end_date, u.username, p.title
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2023-01-01' AND '2023-12-31';
