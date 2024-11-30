# Advanced Database Scripts - Complex Joins

This directory contains SQL queries demonstrating the use of different types of JOIN operations.

## File Description

`joins_queries.sql` - Contains three complex SQL queries using:
1. INNER JOIN - To retrieve all bookings and their respective users
2. LEFT JOIN - To retrieve all properties and their reviews
3. FULL OUTER JOIN - To retrieve all users and bookings, including unmatched records

## Query Details

### 1. INNER JOIN Query
- Retrieves all bookings and the users who made them
- Shows the relationship between users and their bookings

### 2. LEFT JOIN Query
- Shows all properties and their reviews
- Includes properties that have no reviews
- Helps identify properties without any reviews

### 3. FULL OUTER JOIN Query
- Displays all users and all bookings
- Includes users with no bookings and bookings not linked to users
- Useful for identifying data inconsistencies
