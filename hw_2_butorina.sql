USE hw27_1_butorina;

SELECT * 
FROM users 
WHERE firstName LIKE '%am%';

SELECT MAX(mileage - initialMilleage) AS max_expense 
FROM cars 
WHERE carBrandId = (SELECT id FROM car_brands WHERE title = 'Audi');

SELECT carBrandId AS car_id, COUNT(*) AS count_models
FROM car_models 
WHERE carBrandId IN (
    SELECT id FROM car_brands WHERE title IN ('Audi', 'BMW')
)
GROUP BY carBrandId;

SELECT 
    cm.title AS car_model, 
    cb.title AS car_brand, 
    COUNT(c.userId) AS user_count
FROM cars c
JOIN car_models cm ON c.carModelId = cm.id
JOIN car_brands cb ON c.carBrandId = cb.id
GROUP BY c.carModelId, c.carBrandId;

SELECT DISTINCT u.firstName, u.lastName
FROM users u
JOIN cars c ON u.id = c.userId;