# Database Index Performance Analysis

## Identified High-Usage Columns and Their Indexes

### Users Table
- `email`: Authentication and user lookups
  ```sql
  CREATE INDEX idx_users_email ON users (email);
  ```

### Bookings Table
- `user_id`: Used in JOIN operations with users table
- `property_id`: Used in JOIN operations with properties table
- `start_date` and `end_date`: Date range queries
  ```sql
  CREATE INDEX idx_bookings_user_id ON bookings (user_id);
  CREATE INDEX idx_bookings_property_id ON bookings (property_id);
  CREATE INDEX idx_bookings_start_date ON bookings (start_date);
  CREATE INDEX idx_bookings_end_date ON bookings (end_date);
  ```

### Properties Table
- `host_id`: JOIN operations with users table
  ```sql
  CREATE INDEX idx_properties_host_id ON properties (host_id);
  ```

## Performance Analysis

### Query 1: User Booking Statistics
```sql
EXPLAIN ANALYZE
SELECT 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    COUNT(b.booking_id) AS total_bookings
FROM 
    users u
LEFT JOIN 
    bookings b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name
ORDER BY 
    total_bookings DESC;
```

#### Before Indexing
- Full table scan on users table
- Full table scan on bookings table
- Expensive sort operation for ORDER BY
- Higher I/O operations

#### After Indexing
- Index scan using idx_users_email for users table
- Index scan using idx_bookings_user_id for bookings table
- Improved JOIN performance
- Reduced I/O operations

### Query 2: Property Bookings Ranking
```sql
EXPLAIN ANALYZE
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
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM 
    property_bookings
ORDER BY 
    booking_rank;
```

#### Before Indexing
- Full table scan on properties table
- Full table scan on bookings table
- Expensive sort operation for window function
- Higher memory usage for ranking

#### After Indexing
- Index scan using idx_properties_host_id
- Index scan using idx_bookings_property_id
- Improved JOIN performance
- More efficient sorting operation

## Index Design Considerations

1. **Simple Single-Column Indexes**
   - Created for frequently used JOIN columns
   - Optimizes basic WHERE clauses and JOIN operations
   - Balances performance gain with maintenance overhead

2. **Date-Based Indexes**
   - Separate indexes for start_date and end_date
   - Improves date range query performance
   - Useful for availability searches

3. **Foreign Key Indexes**
   - Indexes on user_id and property_id
   - Enhances referential integrity checks
   - Improves JOIN performance

## Maintenance Guidelines

1. **Regular Monitoring**
   - Check index usage statistics
   - Monitor query performance
   - Review execution plans

2. **Index Size Management**
   - Keep track of index sizes
   - Consider storage impact
   - Remove unused indexes if necessary

3. **Update Strategy**
   - Minimal index set for essential queries
   - Balance between read and write performance
   - Regular performance testing
