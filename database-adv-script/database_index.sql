-- Performance Analysis Before Indexes
-- Query 1: Analyze user booking lookup performance
EXPLAIN ANALYZE
SELECT u.user_id, u.email, COUNT(b.booking_id) as booking_count
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.email;

-- Query 2: Analyze property booking date range lookup
EXPLAIN ANALYZE
SELECT p.property_id, p.name, b.start_date, b.end_date
FROM properties p
JOIN bookings b ON p.property_id = b.property_id
WHERE b.start_date >= '2024-01-01' AND b.end_date <= '2024-12-31';

-- Indexes for Users Table
CREATE INDEX idx_users_email ON users (email);

-- Indexes for Bookings Table
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_bookings_start_date ON bookings (start_date);
CREATE INDEX idx_bookings_end_date ON bookings (end_date);

-- Indexes for Properties Table
CREATE INDEX idx_properties_host_id ON properties (host_id);

-- After creating indexes, analyze the same queries
-- Query 1 with indexes
EXPLAIN ANALYZE
SELECT u.user_id, u.email, COUNT(b.booking_id) as booking_count
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.email;

-- Query 2 with indexes
EXPLAIN ANALYZE
SELECT p.property_id, p.name, b.start_date, b.end_date
FROM properties p
JOIN bookings b ON p.property_id = b.property_id
WHERE b.start_date >= '2024-01-01' AND b.end_date <= '2024-12-31';
