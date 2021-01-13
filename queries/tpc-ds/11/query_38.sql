-- start query 37 in stream 11 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 767 and 767+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'sky' or i_color = 'midnight') and 
        (i_units = 'Gross' or i_units = 'Unknown') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'chartreuse' or i_color = 'linen') and
        (i_units = 'Tsp' or i_units = 'Pallet') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornsilk' or i_color = 'lemon') and
        (i_units = 'Case' or i_units = 'Tbl') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'slate' or i_color = 'peach') and
        (i_units = 'Lb' or i_units = 'N/A') and
        (i_size = 'economy' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'dark' or i_color = 'light') and 
        (i_units = 'Ounce' or i_units = 'Ton') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'lime' or i_color = 'cornflower') and
        (i_units = 'Box' or i_units = 'Oz') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'green' or i_color = 'honeydew') and
        (i_units = 'Bunch' or i_units = 'Dram') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'cream' or i_color = 'drab') and
        (i_units = 'Gram' or i_units = 'Pound') and
        (i_size = 'economy' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
  limit 100;