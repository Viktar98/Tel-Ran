   -- 1) Вывести информацию о заказах клиентов не из Germany и не из China

      SELECT 
      	Orders.*
      FROM 
      	Orders
      JOIN 
      	Customers ON
        Orders.CustomerID = Customers.CustomerID
      WHERE 
      	Customers.Country NOT IN ('Germany', 'China');

   -- 2) Вывести два самых дорогих товара из категории Beverages

      SELECT 
      	Products.*
      FROM 
      	Products
      JOIN 
      	Categories ON 
        Products.CategoryID = Categories.CategoryID
      WHERE 
      	Categories.CategoryName = 'Beverages'
      ORDER BY 
      	Products.Price DESC
      LIMIT 2;

   -- 3) Удалить поставщиков из China

      DELETE 
      FROM 
	      Suppliers
      WHERE 
	      Country = 'China';

   -- 4) Вывести все заказы клиента 10, которые повезет Federal Shipping

      SELECT 
      	Orders.*
      FROM 
      	Orders
      JOIN 
      	Shippers ON
        Orders.ShipperID = Shippers.ShipperID
      WHERE 
      	CustomerID = 10 
      	AND 
      	Shippers.ShipperName = 'Federal Shipping';

   -- 5) Вывести два самых дорогих напитка из UK

      SELECT 
      	Products.*      
      FROM 
      	Products
      JOIN 
      	Categories ON 
        Products.CategoryID = Categories.CategoryID
      JOIN
      	Suppliers ON
        Products.SupplierID = Suppliers.SupplierID
      WHERE 
      	Products.CategoryID = 1 
    	  AND 
      	Suppliers.Country = 'UK'
      ORDER BY 
      	Products.Price DESC
      LIMIT 2;

   -- 6) Вывести страны-поставщики напитков

      SELECT DISTINCT 
      	Country
      FROM 
      	Suppliers
      WHERE 
      	SupplierID IN 
            (
            SELECT 
          	SupplierID
            FROM 
          	Products
            WHERE 
          	CategoryID = 1
    	      );


