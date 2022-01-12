## Cau 1

SELECT title, description, length, special_features, rating  
FROM `film`  
WHERE rating = 'PG'  
AND special_features = 'Deleted Scenes'   
AND rental_rate < 2.99

---

## Cau 2

SELECT title, description, length, special_features, rating  
FROM `film`  
WHERE rating = 'G'  
AND rental_rate > (SELECT AVG(rental_rate) FROM film)

---

## Cau 3

SELECT *  
FROM film  
WHERE special_features NOT LIKE '%Deleted Scenes%'

---
