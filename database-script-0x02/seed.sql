-- =========================================
-- Airbnb Database Seeding
-- =========================================

-- ------------------------
-- 1. Users
-- ------------------------
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_password1', '555-1234', 'guest'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_password2', '555-5678', 'host'),
('33333333-3333-3333-3333-333333333333', 'Carol', 'Williams', 'carol@example.com', 'hashed_password3', NULL, 'admin');

-- ------------------------
-- 2. Properties
-- ------------------------
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Cozy Cottage', 'A small cozy cottage near the lake.', 'Lakeview', 120.00),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', 'Downtown Apartment', 'Modern apartment in the city center.', 'Downtown', 200.00);

-- ------------------------
-- 3. Bookings
-- ------------------------
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('aaaa1111-aaaa-1111-aaaa-111111aaaa11', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-09-01', '2025-09-05', 480.00, 'confirmed'),
('bbbb2222-bbbb-2222-bbbb-222222bbbb22', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', '2025-10-10', '2025-10-12', 400.00, 'pending');

-- ------------------------
-- 4. Payments
-- ------------------------
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('pay1111-pay1-1111-pay1-111111111111', 'aaaa1111-aaaa-1111-aaaa-111111aaaa11', 480.00, 'credit_card'),
('pay2222-pay2-2222-pay2-222222222222', 'bbbb2222-bbbb-2222-bbbb-222222bbbb22', 400.00, 'paypal');

-- ------------------------
-- 5. Reviews
-- ------------------------
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('rev1111-rev1-1111-rev1-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay! Very cozy and clean.'),
('rev2222-rev2-2222-rev2-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', 4, 'Great location, comfortable apartment.');

-- ------------------------
-- 6. Messages
-- ------------------------
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('msg1111-msg1-1111-msg1-111111111111', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hello, I would like to confirm my booking.'),
('msg2222-msg2-2222-msg2-222222222222', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Alice, your booking is confirmed!');
