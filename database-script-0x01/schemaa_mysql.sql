CREATE TABLE `users` (
  `user_id` uuid PRIMARY KEY DEFAULT (UUID()),
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(60) UNIQUE NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone_number` varchar(255),
  `role` ENUM ('guest', 'host', 'admin') NOT NULL,
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `properties` (
  `property_id` uuid PRIMARY KEY DEFAULT (UUID()),
  `host_id` uuid NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(255) NOT NULL,
  `pricepernight` decimal NOT NULL,
  `created_at` timestamp DEFAULT (now()),
  `updated_at` timestamp DEFAULT (now())
);

CREATE TABLE `bookings` (
  `booking_id` uuid PRIMARY KEY DEFAULT (UUID()),
  `property_id` uuid NOT NULL,
  `user_id` uuid NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_price` decimal NOT NULL,
  `status` ENUM ('pending', 'confirmed', 'canceled') NOT NULL,
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `payments` (
  `payment_id` uuid PRIMARY KEY DEFAULT (UUID()),
  `booking_id` uuid NOT NULL,
  `amount` decimal NOT NULL,
  `payment_date` timestamp DEFAULT (now()),
  `payment_method` ENUM ('credit_card', 'paypal', 'stripe') NOT NULL
);

CREATE TABLE `reviews` (
  `review_id` uuid PRIMARY KEY DEFAULT (UUID()),
  `property_id` uuid NOT NULL,
  `user_id` uuid NOT NULL,
  `rating` integer NOT NULL CHECK (rating >= 1 AND rating <= 5) COMMENT 'Rating must be between 1 and 5',
  `comment` text NOT NULL,
  `created_at` timestamp DEFAULT (now())
);

CREATE TABLE `messages` (
  `message_id` uuid PRIMARY KEY DEFAULT (UUID()),
  `sender_id` uuid NOT NULL,
  `recipient_id` uuid NOT NULL,
  `message_body` text NOT NULL,
  `sent_at` timestamp DEFAULT (now())
);

CREATE UNIQUE INDEX `users_index_0` ON `users` (`email`);

CREATE INDEX `properties_index_1` ON `properties` (`property_id`);

CREATE INDEX `bookings_index_2` ON `bookings` (`property_id`);

CREATE INDEX `bookings_index_3` ON `bookings` (`booking_id`);

CREATE INDEX `payments_index_4` ON `payments` (`booking_id`);

ALTER TABLE `properties` ADD FOREIGN KEY (`host_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `bookings` ADD FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`);

ALTER TABLE `payments` ADD FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `messages` ADD FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `messages` ADD FOREIGN KEY (`recipient_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`review_id`) REFERENCES `reviews` (`rating`);
