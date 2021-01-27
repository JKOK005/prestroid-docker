-- start query 29 in stream 20 using template query32.tpl
select  sum(cs_ext_discount_amt)  as "excess discount amount" 
from 
   catalog_sales 
   ,item 
   ,date_dim
where
i_manufact_id = 828
and i_item_sk = cs_item_sk 
and d_date between '2001-02-17' and 
        DATE_ADD('2001-02-17', INTERVAL 90 DAY)
and d_date_sk = cs_sold_date_sk 
and cs_ext_discount_amt  
     > ( 
         select 
            1.3 * avg(cs_ext_discount_amt) 
         from 
            catalog_sales 
           ,date_dim
         where 
              cs_item_sk = i_item_sk 
          and d_date between '2001-02-17' and
                             DATE_ADD('2001-02-17', INTERVAL 90 DAY)
          and d_date_sk = cs_sold_date_sk 
      ) 
 limit 100;