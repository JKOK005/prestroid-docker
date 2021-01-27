select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 732 and 732+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'blanched' or i_color = 'chartreuse') and 
        (i_units = 'Bundle' or i_units = 'Unknown') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'peru' or i_color = 'ivory') and
        (i_units = 'Tbl' or i_units = 'Each') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'slate' or i_color = 'forest') and
        (i_units = 'Oz' or i_units = 'Pallet') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'chocolate' or i_color = 'cornflower') and
        (i_units = 'Gram' or i_units = 'Pound') and
        (i_size = 'N/A' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'floral' or i_color = 'midnight') and 
        (i_units = 'N/A' or i_units = 'Box') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'mint' or i_color = 'dim') and
        (i_units = 'Ton' or i_units = 'Tsp') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'orchid' or i_color = 'light') and
        (i_units = 'Carton' or i_units = 'Cup') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'olive' or i_color = 'navy') and
        (i_units = 'Lb' or i_units = 'Dozen') and
        (i_size = 'N/A' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;