-- Create CarDealership database if it doesn't exist
CREATE DATABASE IF NOT EXISTS CarDealership;

-- Use the CarDealership database
USE CarDealership;

-- Table for dealerships
CREATE TABLE dealerships ( 
    dealership_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each dealership
    name VARCHAR(50), -- Name of the dealership
    address VARCHAR(50), -- Address of the dealership
    phone VARCHAR(12) -- Phone number of the dealership
    );
    
    -- Table for vehicles
CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY, -- Vehicle Identification Number, unique identifier for each vehicle
    make VARCHAR(50), -- Make of the vehicle (e.g., Toyota, Honda)
    model VARCHAR(50), -- Model of the vehicle (e.g., Camry, Civic)
    year INT, -- Year of the vehicle
    price DECIMAL(10, 2), -- Price of the vehicle
    SOLD BOOLEAN DEFAULT FALSE -- Indicates whether the vehicle is sold or not, default value is FALSE
);

-- Table for inventory
CREATE TABLE inventory (
    dealership_id INT, -- Foreign key referencing the dealership where the vehicle is located
    VIN VARCHAR(17), -- Foreign key referencing the vehicle
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id), -- Constraint to ensure dealership_id references valid entry in dealerships table
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN) -- Constraint to ensure VIN references valid entry in vehicles table
);

-- Table for sales contracts
CREATE TABLE sales_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each sales contract
    VIN VARCHAR(17), -- Foreign key referencing the vehicle
    customer_name VARCHAR(100), -- Name of the customer
    sale_date DATE, -- Date of the sale
    price DECIMAL(10, 2), -- Price of the sale
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN) -- Constraint to ensure VIN references valid entry in vehicles table
);

-- Table for lease contracts
CREATE TABLE lease_contracts (
    lease_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each lease contract
    VIN VARCHAR(17), -- Foreign key referencing the vehicle
    customer_name VARCHAR(100), -- Name of the customer
    lease_start_date DATE, -- Start date of the lease
    lease_end_date DATE, -- End date of the lease
    monthly_payment DECIMAL(10, 2), -- Monthly payment for the lease
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN) -- Constraint to ensure VIN references valid entry in vehicles table
);


-- inset into 


-- Pre-populate sample data for dealerships (Optional)
INSERT INTO dealerships (name, address, phone) VALUES
('ABC Auto Sales', '123 Main St, Anytown', '555-123-4567'), -- Sample dealership 1
('XYZ Motors', '456 Elm St, Othertown', '555-987-6543'); -- Sample dealership 2

-- Pre-populate sample data for vehicles (Optional)
INSERT INTO vehicles (VIN, make, model, year, price) VALUES
('1HGBH41JXMN109186', 'Toyota', 'Camry', 2022, 25000.00), -- Sample vehicle 1
('2ABCD1234EFG56789', 'Honda', 'Civic', 2021, 22000.00); -- Sample vehicle 2

-- Pre-populate sample data for inventory (Optional)
INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGBH41JXMN109186'), -- Vehicle 1 is in dealership 1
(2, '2ABCD1234EFG56789'); -- Vehicle 2 is in dealership 2

-- Pre-populate sample data for sales contracts
INSERT INTO sales_contracts (VIN, customer_name, sale_date, price) VALUES
    ('1HGBH41JXMN109186', 'John Doe', '2024-06-01', 25000.00), -- John Doe bought a Toyota Camry on June 1, 2024, for $25,000
    ('2ABCD1234EFG56789', 'Jane Smith', '2024-06-02', 22000.00); -- Jane Smith bought a Honda Civic on June 2, 2024, for $22,000

-- Pre-populate sample data for lease contracts
INSERT INTO lease_contracts (VIN, customer_name, lease_start_date, lease_end_date, monthly_payment) VALUES
    ('1HGBH41JXMN109186', 'Michael Johnson', '2024-06-01', '2026-06-01', 400.00), -- Michael Johnson leased a Toyota Camry from June 1, 2024, to June 1, 2026, with a monthly payment of $400
    ('2ABCD1234EFG56789', 'Emily Brown', '2024-06-02', '2026-06-02', 350.00); -- Emily Brown leased a Honda Civic from June 2, 2024, to June 2, 2026, with a monthly payment of $350
    