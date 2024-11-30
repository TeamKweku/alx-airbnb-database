-- Query 1: INNER JOIN
-- Purpose: Retrieves booking information along with the corresponding user details
-- Description: This query demonstrates a basic INNER JOIN that:
--   - Matches bookings with their respective users
--   - Only returns records where both booking and user data exist
--   - Useful for analyzing confirmed bookings with user information
SELECT 
    b.booking_id, 
    b.start_date, 
    b.end_date, 
    b.total_price, 
    b.status,
    u.first_name, 
    u.last_name, 
    u.email
FROM 
    bookings b
INNER JOIN 
    users u ON b.user_id = u.user_id;

-- Query 2: LEFT JOIN
-- Purpose: Lists all properties with their reviews (if any exist)
-- Description: This query demonstrates a LEFT JOIN that:
--   - Returns ALL properties regardless of whether they have reviews
--   - Properties without reviews will show NULL values in review columns
--   - Helps identify properties that may need review encouragement
SELECT 
    p.property_id, 
    p.name AS property_name,
    p.location,
    p.description, 
    r.review_id, 
    r.rating, 
    r.comment
FROM 
    properties p
LEFT JOIN 
    reviews r ON p.property_id = r.property_id;

-- Query 3: FULL OUTER JOIN (Using UNION of LEFT and RIGHT JOINs)
-- Purpose: Complete view of users and bookings relationship
-- Description: This implementation:
--   - Simulates a FULL OUTER JOIN using UNION of LEFT and RIGHT JOINs
--   - Shows ALL users (even those without bookings)
--   - Shows ALL bookings (even if user data is missing)
--   - Helps identify:
--     * Users who haven't made any bookings
--     * Bookings that might have corrupted user references
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM 
    users u
LEFT JOIN 
    bookings b ON u.user_id = b.user_id
UNION
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM 
    bookings b
RIGHT JOIN 
    users u ON u.user_id = b.user_id
WHERE u.user_id IS NULL;
