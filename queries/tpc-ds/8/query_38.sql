-- start query 37 in stream 8 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 773 and 773+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'burlywood' or i_color = 'cream') and 
        (i_units = 'Dram' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'sandy' or i_color = 'sky') and
        (i_units = 'Carton' or i_units = 'Each') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'lavender' or i_color = 'navy') and
        (i_units = 'Cup' or i_units = 'Lb') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'smoke' or i_color = 'beige') and
        (i_units = 'Gram' or i_units = 'Pound') and
        (i_size = 'medium' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'orange' or i_color = 'tan') and 
        (i_units = 'Box' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'steel' or i_color = 'linen') and
        (i_units = 'Gross' or i_units = 'N/A') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'violet' or i_color = 'drab') and
        (i_units = 'Tbl' or i_units = 'Pallet') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'dark' or i_color = 'firebrick') and
        (i_units = 'Oz' or i_units = 'Bunch') and
        (i_size = 'medium' or i_size = 'large')
        )))) > 0
 order by i_product_name
  limit 100;