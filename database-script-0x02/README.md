# Database Seed Data

This directory contains SQL scripts to populate the Airbnb clone database with sample data.

## Overview

The seed data provides a realistic dataset for testing and development, including:

- Users (hosts, guests, and admin)
- Properties with various types and locations
- Bookings with different statuses
- Payments using different payment methods
- Reviews with ratings and comments
- Messages between users

## Sample Data Details

### Users
- 2 Hosts
- 2 Guests
- 1 Admin
- All users have secure password hashes and contact information

### Properties
- 5 different properties
- Various locations (beach, city, mountain, desert, lake)
- Price range: $180-$350 per night
- Detailed descriptions and locations

### Bookings
- 5 bookings with different statuses
- Mix of confirmed, pending, and canceled
- Future dates (2024)
- Realistic pricing based on duration

### Payments
- Multiple payment methods (credit card, PayPal, Stripe)
- Amounts matching booking totals
- Timestamps for payment tracking

### Reviews
- 4 reviews with ratings and comments
- Ratings range from 4-5 stars
- Detailed feedback from guests

### Messages
- Communication between hosts and guests
- Inquiries about properties
- Responses from hosts

## Usage

To populate the database with sample data:

```bash
mysql -u your_username -p your_database < seed.sql
# or
psql -U your_username -d your_database -f seed.sql
```

## Notes

- All UUIDs are generated automatically
- Timestamps use current time (NOW())
- Foreign key relationships are maintained using variables
- Data is consistent across all tables
