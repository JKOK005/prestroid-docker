-- start query 37 in stream 0 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 934 and 934+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'rosy' or i_color = 'powder') and 
        (i_units = 'Pallet' or i_units = 'Oz') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'navy' or i_color = 'thistle') and
        (i_units = 'Dozen' or i_units = 'Box') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'frosted' or i_color = 'almond') and
        (i_units = 'N/A' or i_units = 'Dram') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'lavender' or i_color = 'puff') and
        (i_units = 'Unknown' or i_units = 'Ounce') and
        (i_size = 'small' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'red' or i_color = 'mint') and 
        (i_units = 'Bundle' or i_units = 'Lb') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'cornflower' or i_color = 'cornsilk') and
        (i_units = 'Tsp' or i_units = 'Tbl') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'hot' or i_color = 'bisque') and
        (i_units = 'Carton' or i_units = 'Gross') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'pink' or i_color = 'yellow') and
        (i_units = 'Pound' or i_units = 'Cup') and
        (i_size = 'small' or i_size = 'medium')
        )))) > 0
 order by i_product_name
  limit 100;