-- WHERE AND

-- Initial Complex Query
-- Purpose: Retrieve comprehensive booking information
-- Description: This query joins multiple tables to get booking details
-- including user information, property details, and payment data
-- Note: This version shows potential areas for optimization
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    p.name AS property_name,
    p.description AS property_description,
    pay.amount AS payment_amount,
    pay.payment_method
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
LEFT JOIN 
    payments pay ON b.booking_id = pay.booking_id;

-- Optimized Query using Common Table Expression (CTE)
-- Purpose: Improve query performance and readability
-- Improvements:
--   1. Uses CTE to separate booking data retrieval
--   2. Clearer column aliasing for better readability
--   3. Structured join sequence for better optimization
WITH BookingDetails AS (
    SELECT 
        b.booking_id,
        b.user_id,
        b.property_id,
        b.start_date,
        b.end_date,
        b.total_price
    FROM 
        bookings b
)
SELECT 
    bd.booking_id,
    bd.start_date,
    bd.end_date,
    bd.total_price,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    p.name AS property_name,
    p.description AS property_description,
    pay.amount AS payment_amount,
    pay.payment_method
FROM 
    BookingDetails bd
JOIN 
    users u ON bd.user_id = u.user_id
JOIN 
    properties p ON bd.property_id = p.property_id
LEFT JOIN 
    payments pay ON bd.booking_id = pay.booking_id;

-- Performance Analysis Query
-- Purpose: Analyze query execution performance
-- Usage: Run this with EXPLAIN ANALYZE to compare 
-- the performance of different query versions
EXPLAIN ANALYZE SELECT * FROM bookings;