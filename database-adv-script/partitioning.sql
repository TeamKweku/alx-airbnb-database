-- Partitioning Strategy for Bookings Table
-- This implementation uses RANGE partitioning based on start_date to optimize query performance
-- The table is partitioned by year, allowing efficient access to booking records within specific date ranges

-- Drop existing bookings table if it exists
-- This ensures a clean slate for our partitioned table implementation
DROP TABLE IF EXISTS bookings;

-- Create partitioned bookings table with start_date in PRIMARY KEY
-- Including start_date in the PRIMARY KEY is crucial for partition pruning optimization
-- The table is partitioned by RANGE on start_date for efficient date-based queries
CREATE TABLE bookings (
    booking_id UUID,
    start_date DATE NOT NULL,
    property_id UUID,
    user_id UUID,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status booking_status NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- Create partition for each year
-- Each partition will contain bookings for a specific year
-- This allows for efficient querying of bookings within a particular year
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Add foreign key constraints after partitioning
-- These constraints ensure referential integrity with related tables
-- Added after partition creation to maintain proper table relationships
ALTER TABLE bookings 
    ADD CONSTRAINT fk_bookings_property 
    FOREIGN KEY (property_id) 
    REFERENCES properties(property_id);

ALTER TABLE bookings 
    ADD CONSTRAINT fk_bookings_user 
    FOREIGN KEY (user_id) 
    REFERENCES users(user_id);

-- Example Insert to demonstrate partitioning
-- This insert will automatically route to the appropriate partition based on start_date
INSERT INTO bookings (
    booking_id, 
    start_date, 
    property_id, 
    user_id, 
    end_date, 
    total_price, 
    status
) VALUES (
    uuid_generate_v4(),
    '2024-07-15',
    (SELECT property_id FROM properties LIMIT 1),
    (SELECT user_id FROM users LIMIT 1),
    '2024-07-20',
    1250.00,
    'confirmed'
);

-- Performance Test Query
-- This query demonstrates partition pruning by accessing only the 2024 partition
-- EXPLAIN ANALYZE shows the execution plan and actual timing information
EXPLAIN ANALYZE
SELECT * FROM bookings 
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
