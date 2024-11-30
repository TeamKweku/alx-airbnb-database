# Airbnb Clone Database Project

A comprehensive SQL database implementation for an Airbnb clone application. This project provides a robust database schema with sample seed data to support core Airbnb-like functionalities.

## Project Structure

```
alx-airbnb-database/
├── database-script-0x01/
│   └── schema.sql        # Core database schema definitions
├── database-script-0x02/
│   └── seed.sql         # Sample data for testing and development
```

## Database Schema

The database schema (`database-script-0x01/schema.sql`) includes the following tables:

- **Users**: Stores user information including hosts and guests
- **Properties**: Contains property listings with details and pricing
- **Bookings**: Manages property booking records
- **Payments**: Tracks payment transactions for bookings
- **Reviews**: Stores property reviews from guests
- **Messages**: Handles communication between users

## Sample Data

The seed data (`database-script-0x02/seed.sql`) provides realistic test data including:

- Sample users with different roles (host, guest, admin)
- Property listings with varied locations and prices
- Booking records with different statuses
- Payment transactions with various payment methods
- Property reviews with ratings and comments
- User messages for property inquiries

## Data Types and Enums

The database uses several custom types:
- `user_role`: guest, host, admin
- `booking_status`: pending, confirmed, canceled
- `payment_method`: credit_card, paypal, stripe

## Getting Started

1. Ensure you have PostgreSQL installed
2. Create a new database
3. Run the schema script:
   ```sql
   psql -d your_database < database-script-0x01/schema.sql
   ```
4. Load the sample data:
   ```sql
   psql -d your_database < database-script-0x02/seed.sql
   ```

## Features

- **Robust Schema Design**: Properly defined relationships and constraints
- **Realistic Sample Data**: Carefully crafted test data that maintains referential integrity
- **Extensible Structure**: Easy to modify and expand for additional features
- **Production-Ready**: Includes proper indexing and data validation

## Best Practices Implemented

- UUID primary keys for better distribution and security
- Proper foreign key constraints for data integrity
- Timestamp tracking for record creation and updates
- Appropriate data types and field lengths
- Comprehensive sample data for testing

## Contributing

Feel free to submit issues and enhancement requests.
