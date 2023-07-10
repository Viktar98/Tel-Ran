-- 1) Вывести клиентов из Germany, у которых в имени есть вхождение a,
--  и клиентов из France, у которых в имени есть вхождение b

SELECT 
  * 
FROM 
  Customers
WHERE 
  Country = 'Germany' AND CustomerName LIKE '%a%'
  OR 
  Country = 'France' AND CustomerName LIKE '%b%';

-- 2) Вывести два самых дешевых товара, названия которых заканчиваются на u.

SELECT 
  * 
FROM 
  Products
WHERE 
  ProductName LIKE '%u'
ORDER BY Price
LIMIT 2;

-- 3) Применить постоянную скидку к товарам из категорий 1 и 3, причем:

-- для категории 1 - скидка 29%

-- для категории 3 - 0.5%

UPDATE 
  Products
SET 
  Price = 
CASE
    WHEN CategoryID = 1 THEN 0.71
    WHEN CategoryID = 3 THEN 0.995
  END
WHERE
   CategoryID IN (1, 3);

-- 4) Вывести данные о компаниях-перевозчиках, причем скрыть номера телефонов тех компаний, 
--  которые из Australia (проекция: название_компании, номер_телефона)

SELECT 
	SupplierName,
    CASE 
        WHEN Country = 'Australia' THEN '***' 
        ELSE Phone
    END AS Phone
FROM 
		Suppliers;

-- 5) Вывести города клиентов не из Germany и города поставщиков не из USA

SELECT 
  City
FROM 
  Customers
WHERE 
  Country != 'Germany'

UNION

SELECT 
  City
FROM 
  Suppliers
WHERE 
  Country != 'USA';
