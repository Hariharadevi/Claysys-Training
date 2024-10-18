CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    sale_date DATE,
    quantity INT,
    price DECIMAL(10, 2),
    total_amount DECIMAL(10, 2)
);

SELECT *
FROM (
    SELECT sale_id,product_name,sale_date,quantity,price,total_amount,
           YEAR(sale_date) AS sale_year
    FROM sales
) AS SourceTable
PIVOT (
    SUM(total_amount) FOR sale_year IN ([2022], [2023])
) AS PivotTable;

SELECT sale_id, product_name, sale_date, quantity, price, SaleYear, TotalAmount
FROM (
    SELECT sale_id, product_name, sale_date, quantity, price, [2022], [2023]
    FROM (
        SELECT sale_id, product_name, sale_date, quantity, price, total_amount,
               YEAR(sale_date) AS sale_year
        FROM sales
    ) AS SourceTable
    PIVOT (
        SUM(total_amount) FOR sale_year IN ([2022], [2023])
    ) AS PivotTable
) AS PivotedData
UNPIVOT (
    TotalAmount FOR SaleYear IN ([2022], [2023])
) AS UnpivotedData;