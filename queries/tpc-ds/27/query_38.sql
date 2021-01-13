-- start query 37 in stream 27 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 859 and 859+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'blue' or i_color = 'spring') and 
        (i_units = 'Ounce' or i_units = 'Carton') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'wheat' or i_color = 'blanched') and
        (i_units = 'N/A' or i_units = 'Lb') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'ivory' or i_color = 'peach') and
        (i_units = 'Pound' or i_units = 'Unknown') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'pink' or i_color = 'sienna') and
        (i_units = 'Gross' or i_units = 'Tsp') and
        (i_size = 'N/A' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'tomato' or i_color = 'violet') and 
        (i_units = 'Tbl' or i_units = 'Each') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'sandy' or i_color = 'almond') and
        (i_units = 'Case' or i_units = 'Ton') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'midnight' or i_color = 'drab') and
        (i_units = 'Bundle' or i_units = 'Dram') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'salmon' or i_color = 'antique') and
        (i_units = 'Cup' or i_units = 'Dozen') and
        (i_size = 'N/A' or i_size = 'economy')
        )))) > 0
 order by i_product_name
  limit 100;