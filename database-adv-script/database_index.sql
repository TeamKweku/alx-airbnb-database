-- Indexes for Users Table
CREATE INDEX idx_users_email ON users (email);

-- Indexes for Bookings Table
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_bookings_start_date ON bookings (start_date);
CREATE INDEX idx_bookings_end_date ON bookings (end_date);

-- Indexes for Properties Table
CREATE INDEX idx_properties_host_id ON properties (host_id);
