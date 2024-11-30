# Advanced Database Scripts

This directory contains SQL queries demonstrating advanced database operations including JOINs and Subqueries.

## Files Description

### 1. `joins_queries.sql`
Contains three complex SQL queries using:
- INNER JOIN - To retrieve all bookings and their respective users
- LEFT JOIN - To retrieve all properties and their reviews
- FULL OUTER JOIN - To retrieve all users and bookings, including unmatched records

### 2. `subqueries.sql`
Contains advanced SQL queries demonstrating:
- Non-correlated subquery to find highly-rated properties (avg rating > 4.0)
- Correlated subquery to identify frequent customers (> 3 bookings)

## Query Details

### Join Queries
1. **INNER JOIN Query**
   - Retrieves booking information with user details
   - Shows the relationship between users and their bookings

2. **LEFT JOIN Query**
   - Shows all properties and their reviews
   - Includes properties that have no reviews

3. **FULL OUTER JOIN Query**
   - Displays all users and all bookings
   - Includes users with no bookings and bookings not linked to users

### Subqueries
1. **Properties with High Ratings**
   - Uses a non-correlated subquery
   - Finds properties with average rating above 4.0
   - Includes property details and calculated average rating

2. **Frequent Customers**
   - Uses a correlated subquery
   - Identifies users who have made more than 3 bookings
   - Shows user details and total booking count
