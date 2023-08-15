-- 1. Вывести ко-во поставщиков не из UK и не из China

 SELECT
    COUNT(*) AS Suppliers
 FROM
       suppliers
 WHERE
       Country NOT IN ('UK', 'China');
  
-- 2. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

 SELECT
    COUNT(*) AS Number_of_Products,
    AVG (Price) AS AVG_Price,
    MIN (Price) AS MIN_Price,
    MAX (Price) AS MAX_Price
 FROM
       Products
 WHERE 
       CategoryID IN (3, 5);

-- 3. Вывести общую сумму проданных товаров

 SELECT
    SUM(Products.Price * Quantity) AS TotalSales
 FROM
       OrderDetails
 LEFT JOIN 
       Products ON
       OrderDetails.ProductID = Products.ProductID;

-- 4. Вывести ко-во стран, которые поставляют напитки

 SELECT 
    COUNT(DISTINCT Suppliers.Country)
 FROM 
       Suppliers
 JOIN 
       Categories ON 
       Products.CategoryID = Categories.CategoryID
 JOIN 
       Products ON 
       Suppliers.SupplierID = Products.SupplierID
 WHERE 
       Categories.CategoryName = 'Beverages';

-- 5. Вывести сумму, на которую было отправлено товаров клиентам в USA

 SELECT 
    SUM(Products.price * OrderDetails.quantity)
 FROM 
       Orders
 JOIN 
       OrderDetails ON 
       Orders.OrderID = OrderDetails.OrderID
 JOIN 
       Customers ON
       Customers.CustomerID = Orders.CustomerID
 JOIN 
       Products ON
       OrderDetails.ProductID = Product.ProductID
 WHERE
       Customers.Country = 'USA'
