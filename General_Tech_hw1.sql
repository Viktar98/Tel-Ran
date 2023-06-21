
-- 1)   Бизнес процессы:

    1. Приём сырья от поставщика (create,update)
    2. Выплата дивидентов акционнерам (read,update,create)
    3. Оплата ежемесячной подписки в приложении (read,update)
    4. Производство изделий из сырья (update, create, delete)
    5. Транспортировка товара (update, create)
    6. Доставка товара клиенту (update, delete)
    7. Оценка кредитоспособности клиента (read)
    8. Регистрация пользователя (create)
    9. Пополнение баланса (read, update)
    10. Бизнес-аналитика (read)

--    // неоднозначный CRUD, надо больше водных данных о реализации процесса в каждом частном случаи
    
-- 2)   Вывести название и стоимость товаров от 20 до 200 EUR.
    
        SELECT 
        	ProductName, Price
        FROM 
    	    Products
        WHERE
	        Price >= 20
	        AND
	        Price <= 200 

-- 3)    Вывести товары от поставщиков 2 и 4 в порядке убывания цены.

        SELECT 
	        * 
        FROM 
	        [Products]
        WHERE
	        SupplierID IN (2,4)
        ORDER BY
	        Price DESC	

-- 4)    Вывести товары, добавив поле "ценасоскидкой" в 12.5%.

        SELECT 
	        *, Price * 1.25 AS "-25%" 
        FROM 
	        [Products]

-- 5)    У поставщиков 3 и 5 изменить тел/номера на произвольные значения.

            UPDATE 
        	    Suppliers
            SET 
	            Phone = '9379992'
            WHERE 
	            SupplierID IN (3,5)
