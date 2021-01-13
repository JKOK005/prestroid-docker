-- start query 37 in stream 6 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 905 and 905+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'burnished' or i_color = 'white') and 
        (i_units = 'N/A' or i_units = 'Case') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'lace' or i_color = 'puff') and
        (i_units = 'Pound' or i_units = 'Each') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'papaya' or i_color = 'lavender') and
        (i_units = 'Tbl' or i_units = 'Ounce') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'moccasin' or i_color = 'smoke') and
        (i_units = 'Dozen' or i_units = 'Bunch') and
        (i_size = 'large' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'cornsilk' or i_color = 'rose') and 
        (i_units = 'Gram' or i_units = 'Pallet') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'navy' or i_color = 'antique') and
        (i_units = 'Ton' or i_units = 'Box') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'lime' or i_color = 'pale') and
        (i_units = 'Carton' or i_units = 'Unknown') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'tan' or i_color = 'burlywood') and
        (i_units = 'Cup' or i_units = 'Dram') and
        (i_size = 'large' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
  limit 100;