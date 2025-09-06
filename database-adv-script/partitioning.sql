-- Step 1: Rename original table (backup)
ALTER TABLE Booking RENAME TO Booking_old;

-- Step 2: Create a new partitioned Booking table
CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES User(user_id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES Property(property_id)
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions based on year ranges
CREATE TABLE Booking_2022 PARTITION OF Booking
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Optional: Default partition for other years
CREATE TABLE Booking_default PARTITION OF Booking
    DEFAULT;

-- Step 4: Copy data from old table into the new partitioned structure
INSERT INTO Booking (booking_id, user_id, property_id, start_date, end_date, status)
SELECT booking_id, user_id, property_id, start_date, end_date, status
FROM Booking_old;

-- Step 5: Example query before/after testing
-- Fetch bookings within a date range (should now scan only relevant partitions)
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2023-05-01' AND '2023-05-31';
