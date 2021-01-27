-- start query 37 in stream 13 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 909 and 909+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'rose' or i_color = 'sky') and 
        (i_units = 'N/A' or i_units = 'Box') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'indian' or i_color = 'almond') and
        (i_units = 'Unknown' or i_units = 'Cup') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'firebrick' or i_color = 'drab') and
        (i_units = 'Tsp' or i_units = 'Each') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornflower' or i_color = 'wheat') and
        (i_units = 'Gram' or i_units = 'Case') and
        (i_size = 'petite' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'papaya' or i_color = 'rosy') and 
        (i_units = 'Lb' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'tomato' or i_color = 'royal') and
        (i_units = 'Ton' or i_units = 'Tbl') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'powder' or i_color = 'sienna') and
        (i_units = 'Pound' or i_units = 'Dram') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'azure' or i_color = 'maroon') and
        (i_units = 'Pallet' or i_units = 'Ounce') and
        (i_size = 'petite' or i_size = 'economy')
        )))) > 0
 order by i_product_name
  limit 100;