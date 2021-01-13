-- start query 37 in stream 12 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 834 and 834+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'blanched' or i_color = 'dim') and 
        (i_units = 'Dozen' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'mint' or i_color = 'gainsboro') and
        (i_units = 'Case' or i_units = 'Bundle') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'red' or i_color = 'ghost') and
        (i_units = 'Gram' or i_units = 'Tbl') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'lawn' or i_color = 'goldenrod') and
        (i_units = 'Unknown' or i_units = 'Box') and
        (i_size = 'small' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'saddle' or i_color = 'antique') and 
        (i_units = 'Dram' or i_units = 'Each') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'medium' or i_color = 'almond') and
        (i_units = 'Gross' or i_units = 'Cup') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'purple' or i_color = 'cream') and
        (i_units = 'Tsp' or i_units = 'Carton') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'lemon' or i_color = 'rosy') and
        (i_units = 'Ounce' or i_units = 'Pallet') and
        (i_size = 'small' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
  limit 100;