WITH LatestDate AS (
    SELECT
        product_id,
        warehouse_id,
        date,
        quantity,
        ROW_NUMBER() OVER (PARTITION BY product_id, warehouse_id ORDER BY date DESC) AS row_num
    FROM
        inventory
)

SELECT
    product_id,
    warehouse_id,
    date,
    quantity
FROM
    LatestDate
WHERE
    row_num = 1;
