# 🏠 Airbnb Clone Database Project

A comprehensive database project that implements a complete database solution for an Airbnb-like application. The project covers database design, schema implementation, data population, and advanced optimization techniques.

## 📁 Project Structure

```
alx-airbnb-database/
├── database-script-0x01/      # Database Design and Schema Implementation
│   ├── schema.sql            # Core database schema with tables and constraints
│   ├── queries.sql           # Basic database operations
│   └── README.md            # Schema documentation
├── database-script-0x02/      # Database Population and Testing
│   ├── seed.sql             # Sample data for development
│   ├── test_queries.sql     # Data validation queries
│   └── README.md            # Seed data documentation
├── database-adv-script/       # Advanced Database Operations
│   ├── joins_queries.sql     # Complex JOIN implementations
│   ├── subqueries.sql       # Subquery operations
│   ├── aggregations_and_window_functions.sql
│   ├── database_index.sql   # Index optimizations
│   ├── performance.sql      # Performance tuning
│   ├── partitioning.sql    # Table partitioning
│   └── README.md           # Advanced features documentation
├── ERD/                      # Database Design Documentation
│   └── airbnb_erd.png       # Entity Relationship Diagram
└── normalization.md         # Database normalization analysis
```

## 🔧 Project Components

### 1. Database Design and Schema (database-script-0x01) 📊
- Complete database schema design
- Implementation of tables with proper relationships
- Primary and foreign key constraints
- Custom data types and enums
- Basic query operations

### 2. Data Population (database-script-0x02) 📝
- Comprehensive sample data for testing
- Multiple user roles (host, guest, admin)
- Various property types and locations
- Realistic booking scenarios
- Test data validation

### 3. Advanced Database Operations (database-adv-script) ⚡
- Complex query implementations
- Performance optimization techniques
- Database indexing strategies
- Table partitioning
- Query monitoring and analysis

### 4. Design Documentation 📚
- Entity Relationship Diagrams
- Database normalization documentation
- Schema optimization analysis

## 🌟 Core Features

### Database Schema 🗄️
- Users (hosts, guests, admins)
- Properties (listings with details)
- Bookings (reservations)
- Payments (transactions)
- Reviews (ratings and comments)
- Messages (user communication)

### Data Types and Enums 📋
- user_role (guest, host, admin)
- booking_status (pending, confirmed, canceled)
- payment_method (credit_card, paypal, stripe)

### Implementation Features ⚙️
- UUID for primary keys
- Timestamp tracking
- Referential integrity
- Data validation
- Performance optimization

## 🚀 Getting Started

1. Database Setup:
   ```bash
   # Create and populate core database
   psql -d your_database < database-script-0x01/schema.sql
   psql -d your_database < database-script-0x02/seed.sql
   
   # Implement advanced features
   psql -d your_database < database-adv-script/joins_queries.sql
   ```

2. Review Documentation:
   - Check ERD for database structure
   - Review normalization.md for design decisions
   - See individual directory READMEs for specific components

## 📋 Prerequisites
- PostgreSQL 12 or higher
- psql command-line tool
- Basic SQL knowledge

## 🤝 Contributing
Contributions are welcome! Please read the contributing guidelines before making changes.

## 📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
