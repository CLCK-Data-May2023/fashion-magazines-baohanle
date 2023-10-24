select customers.customer_name as "Customer",
    PRINTF( "$%.2f", SUM(price_per_month * subscription_length)) as "Amount Due"
from orders
join customers
    on (customers.customer_id = orders.customer_id)
join subscriptions
    on (subscriptions.subscription_id = orders.subscription_id)
where order_status = 'unpaid' 
    and subscriptions.description = 'Fashion Magazine'
group by customers.customer_id