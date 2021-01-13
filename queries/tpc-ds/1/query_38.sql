-- start query 37 in stream 1 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 890 and 890+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'navajo' or i_color = 'gainsboro') and 
        (i_units = 'Ounce' or i_units = 'Each') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'firebrick' or i_color = 'mint') and
        (i_units = 'Pound' or i_units = 'Box') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'papaya' or i_color = 'smoke') and
        (i_units = 'Bundle' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'powder' or i_color = 'dodger') and
        (i_units = 'Cup' or i_units = 'Carton') and
        (i_size = 'medium' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'antique' or i_color = 'misty') and 
        (i_units = 'Case' or i_units = 'Tbl') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'aquamarine' or i_color = 'blanched') and
        (i_units = 'Gross' or i_units = 'Oz') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'plum' or i_color = 'beige') and
        (i_units = 'Unknown' or i_units = 'Lb') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'linen' or i_color = 'rosy') and
        (i_units = 'Bunch' or i_units = 'Ton') and
        (i_size = 'medium' or i_size = 'petite')
        )))) > 0
 order by i_product_name
  limit 100;