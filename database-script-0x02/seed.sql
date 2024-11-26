-- Insert Users
INSERT INTO "users" ("first_name", "last_name", "email", "password_hash", "phone_number", "role")
VALUES 
    ('John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '+1234567890', 'host'),
    ('Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '+0987654321', 'guest'),
    ('Mike', 'Johnson', 'mike.johnson@example.com', 'hashed_password_3', '+1122334455', 'admin'),
    ('Emily', 'Brown', 'emily.brown@example.com', 'hashed_password_4', '+5544332211', 'host'),
    ('David', 'Wilson', 'david.wilson@example.com', 'hashed_password_5', '+9988776655', 'guest');

-- Insert Properties
INSERT INTO "properties" ("host_id", "name", "description", "location", "pricepernight")
VALUES 
    ((SELECT "user_id" FROM "users" WHERE "email" = 'john.doe@example.com'), 
     'Cozy Downtown Apartment', 
     'Spacious 2-bedroom apartment in the heart of the city', 
     'New York, NY', 150.00),
    ((SELECT "user_id" FROM "users" WHERE "email" = 'emily.brown@example.com'), 
     'Beachfront Villa', 
     'Luxurious villa with stunning ocean views', 
     'Miami, FL', 350.00),
    ((SELECT "user_id" FROM "users" WHERE "email" = 'john.doe@example.com'), 
     'Mountain Cabin Retreat', 
     'Rustic cabin perfect for nature lovers', 
     'Denver, CO', 200.00);

-- Insert Bookings
INSERT INTO "bookings" ("property_id", "user_id", "start_date", "end_date", "total_price", "status")
VALUES 
    ((SELECT "property_id" FROM "properties" WHERE "name" = 'Cozy Downtown Apartment'), 
     (SELECT "user_id" FROM "users" WHERE "email" = 'jane.smith@example.com'), 
     '2024-07-15', '2024-07-20', 750.00, 'confirmed'),
    ((SELECT "property_id" FROM "properties" WHERE "name" = 'Beachfront Villa'), 
     (SELECT "user_id" FROM "users" WHERE "email" = 'david.wilson@example.com'), 
     '2024-08-01', '2024-08-07', 2450.00, 'pending'),
    ((SELECT "property_id" FROM "properties" WHERE "name" = 'Mountain Cabin Retreat'), 
     (SELECT "user_id" FROM "users" WHERE "email" = 'jane.smith@example.com'), 
     '2024-09-10', '2024-09-15', 1000.00, 'confirmed');

-- Insert Payments
INSERT INTO "payments" ("booking_id", "amount", "payment_method")
VALUES 
    ((SELECT "booking_id" FROM "bookings" WHERE "start_date" = '2024-07-15'), 
     750.00, 'credit_card'),
    ((SELECT "booking_id" FROM "bookings" WHERE "start_date" = '2024-08-01'), 
     2450.00, 'paypal'),
    ((SELECT "booking_id" FROM "bookings" WHERE "start_date" = '2024-09-10'), 
     1000.00, 'stripe');

-- Insert Reviews
INSERT INTO "reviews" ("property_id", "user_id", "rating", "comment")
VALUES 
    ((SELECT "property_id" FROM "properties" WHERE "name" = 'Cozy Downtown Apartment'), 
     (SELECT "user_id" FROM "users" WHERE "email" = 'jane.smith@example.com'), 
     5, 'Amazing apartment, great location and very clean!'),
    ((SELECT "property_id" FROM "properties" WHERE "name" = 'Beachfront Villa'), 
     (SELECT "user_id" FROM "users" WHERE "email" = 'david.wilson@example.com'), 
     4, 'Beautiful villa, slightly overpriced but worth the experience'),
    ((SELECT "property_id" FROM "properties" WHERE "name" = 'Mountain Cabin Retreat'), 
     (SELECT "user_id" FROM "users" WHERE "email" = 'jane.smith@example.com'), 
     5, 'Perfect getaway, loved the peaceful environment');

-- Insert Messages
INSERT INTO "messages" ("sender_id", "recipient_id", "message_body")
VALUES 
    ((SELECT "user_id" FROM "users" WHERE "email" = 'jane.smith@example.com'), 
     (SELECT "user_id" FROM "users" WHERE "email" = 'john.doe@example.com'), 
     'Hi, I have a question about the downtown apartment.'),
    ((SELECT "user_id" FROM "users" WHERE "email" = 'david.wilson@example.com'), 
     (SELECT "user_id" FROM "users" WHERE "email" = 'emily.brown@example.com'), 
     'Is the beachfront villa available for these dates?'),
    ((SELECT "user_id" FROM "users" WHERE "email" = 'mike.johnson@example.com'), 
     (SELECT "user_id" FROM "users" WHERE "email" = 'john.doe@example.com'), 
     'Can you provide more details about your properties?');