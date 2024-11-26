-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Drop existing tables if they exist
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS properties;
DROP TABLE IF EXISTS users;

CREATE TYPE "user_role" AS ENUM (
  'guest',
  'host',
  'admin'
);

CREATE TYPE "booking_status" AS ENUM (
  'pending',
  'confirmed',
  'canceled'
);

CREATE TYPE "payment_method" AS ENUM (
  'credit_card',
  'paypal',
  'stripe'
);

CREATE TABLE "users" (
  "user_id" uuid PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "first_name" varchar(30) NOT NULL,
  "last_name" varchar(30) NOT NULL,
  "email" varchar(60) UNIQUE NOT NULL,
  "password_hash" varchar NOT NULL,
  "phone_number" varchar,
  "role" user_role NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "properties" (
  "property_id" uuid PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "host_id" uuid NOT NULL,
  "name" varchar NOT NULL,
  "description" text NOT NULL,
  "location" varchar NOT NULL,
  "pricepernight" decimal NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "bookings" (
  "booking_id" uuid PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "property_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "start_date" date NOT NULL,
  "end_date" date NOT NULL,
  "total_price" decimal NOT NULL,
  "status" booking_status NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "payments" (
  "payment_id" uuid PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "booking_id" uuid NOT NULL,
  "amount" decimal NOT NULL,
  "payment_date" timestamp DEFAULT (now()),
  "payment_method" payment_method NOT NULL
);

CREATE TABLE "reviews" (
  "review_id" uuid PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "property_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "rating" integer NOT NULL CHECK (rating >= 1 AND rating <= 5),
  "comment" text NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "messages" (
  "message_id" uuid PRIMARY KEY DEFAULT (uuid_generate_v4()),
  "sender_id" uuid NOT NULL,
  "recipient_id" uuid NOT NULL,
  "message_body" text NOT NULL,
  "sent_at" timestamp DEFAULT (now())
);

CREATE UNIQUE INDEX ON "users" ("email");

CREATE INDEX ON "properties" ("property_id");

CREATE INDEX ON "bookings" ("property_id");

CREATE INDEX ON "bookings" ("booking_id");

CREATE INDEX ON "payments" ("booking_id");

COMMENT ON COLUMN "reviews"."rating" IS 'Rating must be between 1 and 5';

ALTER TABLE "properties" ADD FOREIGN KEY ("host_id") REFERENCES "users" ("user_id");

ALTER TABLE "bookings" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "bookings" ADD FOREIGN KEY ("property_id") REFERENCES "properties" ("property_id");

ALTER TABLE "payments" ADD FOREIGN KEY ("booking_id") REFERENCES "bookings" ("booking_id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("property_id") REFERENCES "properties" ("property_id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "messages" ADD FOREIGN KEY ("sender_id") REFERENCES "users" ("user_id");

ALTER TABLE "messages" ADD FOREIGN KEY ("recipient_id") REFERENCES "users" ("user_id");