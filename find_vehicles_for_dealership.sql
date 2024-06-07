SELECT v.* 
FROM vehicles v
INNER JOIN inventory i ON v.VIN = i.VIN
WHERE i.dealership_id = ?; -- Replace ? with the dealership_id
