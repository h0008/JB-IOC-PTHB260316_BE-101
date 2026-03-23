-- 1 - Create a database named "HotelDB".
CREATE DATABASE HotelDB;
-- Connect to HotelDB database after creating
\c HotelDB
-- 2 - Create a schema named "hotel"
CREATE SCHEMA hotel;
-- 3 - Create a table named "RoomTypes" in the "hotel" schema with the following columns:
CREATE TABLE hotel.RoomTypes (
                                 room_type_id SERIAL PRIMARY KEY,
                                 type_name VARCHAR(50) NOT NULL UNIQUE,
                                 price_per_night NUMERIC(10, 2) CHECK ( price_per_night > 0 ),
                                 max_capacity INT CHECK ( max_capacity > 0 )
);
-- 4 - Create a table named "Rooms" in the "hotel" schema with the following columns:
CREATE TABLE hotel.Rooms (
                             room_id SERIAL PRIMARY KEY,
                             room_number VARCHAR(10) NOT NULL UNIQUE,
                             room_type_id INT REFERENCES hotel.RoomTypes(room_type_id),
                             status VARCHAR(20) CHECK ( status IN ('available', 'occupied', 'maintenance') )
);
-- 5 - Create a table named "Customers" in the "hotel" schema with the following columns:
CREATE TABLE hotel.Customers (
                                 customer_id SERIAL PRIMARY KEY,
                                 full_name VARCHAR(100) NOT NULL,
                                 email VARCHAR(100) NOT NULL UNIQUE,
                                 phone VARCHAR(15)
);
-- 6 - Create a table named "Bookings" in the "hotel" schema with the following columns:
CREATE TABLE hotel.Bookings (
                                booking_id SERIAL PRIMARY KEY,
                                customer_id INT REFERENCES hotel.Customers(customer_id),
                                room_id INT REFERENCES hotel.Rooms(room_id),
                                check_in DATE NOT NULL,
                                check_out DATE NOT NULL,
                                status VARCHAR(20) CHECK ( status IN ('Pending', 'Confirmed', 'Cancelled') )
);
-- 7 - Create a table named "Payments" in the "hotel" schema with the following columns:
CREATE TABLE hotel.Payments
(
    payment_id   SERIAL PRIMARY KEY,
    booking_id   INT REFERENCES hotel.Bookings (booking_id),
    amount       NUMERIC(10, 2) CHECK ( amount > 0 ),
    payment_date DATE NOT NULL,
    method       VARCHAR(20) CHECK ( method IN ('Credit Card', 'Cash', 'Bank Transfer') )
);
