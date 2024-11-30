-- Query 1: Aggregation with GROUP BY
-- Purpose: Calculate total bookings per user
-- Description: This query:
--   - Counts bookings for each user
--   - Includes user details
--   - Orders by booking count descending
SELECT 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    u.email,
    COUNT(b.booking_id) AS total_bookings
FROM 
    users u
LEFT JOIN 
    bookings b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    u.email
ORDER BY 
    total_bookings DESC;

-- Query 2: Window Functions
-- Purpose: Rank properties by booking frequency
-- Description: This query:
--   - Uses multiple window functions (ROW_NUMBER, RANK, DENSE_RANK)
--   - Ranks properties based on booking count
--   - Includes property details and booking statistics
WITH property_bookings AS (
    SELECT 
        p.property_id,
        p.name AS property_name,
        COUNT(b.booking_id) AS total_bookings
    FROM 
        properties p
    LEFT JOIN 
        bookings b ON p.property_id = b.property_id
    GROUP BY 
        p.property_id, p.name
)
SELECT 
    property_id,
    property_name,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_row_number,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM 
    property_bookings
ORDER BY 
    total_bookings DESC;
