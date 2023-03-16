select * ,
--from raw orders 
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.customerid as order_customerid,
o.ORDERSELLINGPRIICE,
o.ORDERCOSTPRICE,
o.ORDERSELLINGPRIICE - o.ORDERCOSTPRICE as orderprofit,

c.customername,
c.segment,
c.country,

p.category,
p.productname,
p.subcategory
from {{ ref('raw_orders') }} as o
left join {{ref('raw_customer')}} as c
on o.customerid = c.customerid
left join {{ref('raw_product')}} as p
on o.productid=p.productid