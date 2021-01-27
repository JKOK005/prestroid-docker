select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 787 and 787+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'sienna' or i_color = 'royal') and 
        (i_units = 'Unknown' or i_units = 'Each') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'cornflower' or i_color = 'chocolate') and
        (i_units = 'Gross' or i_units = 'N/A') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'rose' or i_color = 'snow') and
        (i_units = 'Tbl' or i_units = 'Gram') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'orange' or i_color = 'wheat') and
        (i_units = 'Oz' or i_units = 'Box') and
        (i_size = 'petite' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'powder' or i_color = 'gainsboro') and 
        (i_units = 'Carton' or i_units = 'Ton') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'cornsilk' or i_color = 'red') and
        (i_units = 'Case' or i_units = 'Cup') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'pink' or i_color = 'medium') and
        (i_units = 'Pound' or i_units = 'Bunch') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'indian' or i_color = 'navy') and
        (i_units = 'Lb' or i_units = 'Tsp') and
        (i_size = 'petite' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;