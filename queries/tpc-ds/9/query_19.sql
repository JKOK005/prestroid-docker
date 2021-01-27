-- start query 20 in stream 9 using template query22.tpl
select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from inventory
           ,date_dim
           ,item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1210 and 1210 + 11
       group by i_product_name, i_brand, i_class, i_category WITH ROLLUP
order by qoh, i_product_name, i_brand, i_class, i_category
 limit 100;