-- start query 37 in stream 26 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 985 and 985+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'rosy' or i_color = 'almond') and 
        (i_units = 'Pallet' or i_units = 'Tsp') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'lemon' or i_color = 'yellow') and
        (i_units = 'Pound' or i_units = 'Carton') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'gainsboro' or i_color = 'blue') and
        (i_units = 'Unknown' or i_units = 'Lb') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'ivory' or i_color = 'drab') and
        (i_units = 'Ton' or i_units = 'Gram') and
        (i_size = 'extra large' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'mint' or i_color = 'lime') and 
        (i_units = 'Ounce' or i_units = 'Case') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'deep' or i_color = 'antique') and
        (i_units = 'N/A' or i_units = 'Box') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'orchid' or i_color = 'spring') and
        (i_units = 'Oz' or i_units = 'Bundle') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'light' or i_color = 'floral') and
        (i_units = 'Each' or i_units = 'Cup') and
        (i_size = 'extra large' or i_size = 'small')
        )))) > 0
 order by i_product_name
  limit 100;