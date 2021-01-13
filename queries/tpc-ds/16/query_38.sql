-- start query 37 in stream 16 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 712 and 712+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'salmon' or i_color = 'green') and 
        (i_units = 'Cup' or i_units = 'Unknown') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'puff' or i_color = 'bisque') and
        (i_units = 'N/A' or i_units = 'Pallet') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'seashell' or i_color = 'goldenrod') and
        (i_units = 'Bundle' or i_units = 'Tbl') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'magenta' or i_color = 'antique') and
        (i_units = 'Ounce' or i_units = 'Case') and
        (i_size = 'large' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'peach' or i_color = 'snow') and 
        (i_units = 'Box' or i_units = 'Gram') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'lemon' or i_color = 'sky') and
        (i_units = 'Dram' or i_units = 'Bunch') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'misty' or i_color = 'almond') and
        (i_units = 'Gross' or i_units = 'Carton') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'khaki' or i_color = 'black') and
        (i_units = 'Ton' or i_units = 'Tsp') and
        (i_size = 'large' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
  limit 100;