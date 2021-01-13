-- start query 37 in stream 17 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 788 and 788+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'metallic' or i_color = 'steel') and 
        (i_units = 'Unknown' or i_units = 'Box') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'lavender' or i_color = 'bisque') and
        (i_units = 'Case' or i_units = 'Tsp') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'moccasin' or i_color = 'orange') and
        (i_units = 'Dozen' or i_units = 'Gross') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'blue' or i_color = 'lace') and
        (i_units = 'N/A' or i_units = 'Pound') and
        (i_size = 'petite' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'slate' or i_color = 'black') and 
        (i_units = 'Oz' or i_units = 'Carton') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'almond' or i_color = 'thistle') and
        (i_units = 'Dram' or i_units = 'Tbl') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'salmon' or i_color = 'blush') and
        (i_units = 'Gram' or i_units = 'Pallet') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'dark' or i_color = 'antique') and
        (i_units = 'Ounce' or i_units = 'Bundle') and
        (i_size = 'petite' or i_size = 'economy')
        )))) > 0
 order by i_product_name
  limit 100;