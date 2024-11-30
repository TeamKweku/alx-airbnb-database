-- Query 1: Non-correlated Subquery
-- Purpose: Find properties with average rating > 4.0
-- Description: This query:
--   - Calculates the average rating for each property
--   - Returns property details where avg rating exceeds 4.0
--   - Helps identify top-rated properties
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.description,
    p.pricepernight,
    (SELECT AVG(rating)::DECIMAL(10,2) 
     FROM reviews r 
     WHERE r.property_id = p.property_id) as avg_rating
FROM 
    properties p
WHERE 
    property_id IN (
        SELECT property_id 
        FROM reviews 
        GROUP BY property_id 
        HAVING AVG(rating) > 4.0
    );

-- Query 2: Correlated Subquery
-- Purpose: Find users who have made more than 3 bookings
-- Description: This query:
--   - Counts bookings for each user
--   - Returns user details for those with > 3 bookings
--   - Helps identify frequent customers
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    (SELECT COUNT(*) 
     FROM bookings b 
     WHERE b.user_id = u.user_id) as booking_count
FROM 
    users u
WHERE 
    (SELECT COUNT(*) 
     FROM bookings b 
     WHERE b.user_id = u.user_id) > 3;
