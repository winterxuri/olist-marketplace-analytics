SELECT
    p.product_category_name,

    SUM(oi.price) AS category_gmv,

    COUNT(*) AS items_sold,

    ROUND(AVG(oi.price)::numeric, 2) AS avg_item_price

FROM products p

JOIN order_items oi
    ON p.product_id = oi.product_id

JOIN orders o
    ON oi.order_id = o.order_id

WHERE o.order_status = 'delivered'

GROUP BY p.product_category_name

ORDER BY category_gmv DESC;
