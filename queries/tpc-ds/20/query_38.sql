-- start query 37 in stream 20 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 947 and 947+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'deep' or i_color = 'brown') and 
        (i_units = 'Carton' or i_units = 'N/A') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'turquoise' or i_color = 'plum') and
        (i_units = 'Box' or i_units = 'Bundle') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'light' or i_color = 'goldenrod') and
        (i_units = 'Dram' or i_units = 'Pound') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'black' or i_color = 'powder') and
        (i_units = 'Tsp' or i_units = 'Each') and
        (i_size = 'petite' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'slate' or i_color = 'blush') and 
        (i_units = 'Case' or i_units = 'Lb') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'dim' or i_color = 'cream') and
        (i_units = 'Gram' or i_units = 'Tbl') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'aquamarine' or i_color = 'burnished') and
        (i_units = 'Dozen' or i_units = 'Bunch') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'frosted' or i_color = 'white') and
        (i_units = 'Ton' or i_units = 'Oz') and
        (i_size = 'petite' or i_size = 'small')
        )))) > 0
 order by i_product_name
  limit 100;