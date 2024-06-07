SELECT s.*, v.make, v.model, v.year
FROM sales_contracts s
JOIN vehicles v ON s.VIN = v.VIN
JOIN inventory i ON s.VIN = i.VIN
JOIN dealerships d ON i.dealership_id = d.dealership_id
WHERE d.name = ? -- Replace ? with the dealership name
AND s.sale_date BETWEEN ? AND ?; -- Replace the first ? with the start date and the second ? with the end date
