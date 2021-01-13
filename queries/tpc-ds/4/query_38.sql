-- start query 37 in stream 4 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 742 and 742+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'blanched' or i_color = 'cream') and 
        (i_units = 'Cup' or i_units = 'Carton') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'light' or i_color = 'azure') and
        (i_units = 'Oz' or i_units = 'Bundle') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornflower' or i_color = 'chiffon') and
        (i_units = 'N/A' or i_units = 'Unknown') and
        (i_size = 'large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'peach' or i_color = 'ivory') and
        (i_units = 'Ton' or i_units = 'Ounce') and
        (i_size = 'N/A' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'peru' or i_color = 'sienna') and 
        (i_units = 'Tbl' or i_units = 'Bunch') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'lace' or i_color = 'blue') and
        (i_units = 'Box' or i_units = 'Each') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'medium' or i_color = 'yellow') and
        (i_units = 'Gram' or i_units = 'Dram') and
        (i_size = 'large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'green' or i_color = 'orchid') and
        (i_units = 'Pallet' or i_units = 'Case') and
        (i_size = 'N/A' or i_size = 'petite')
        )))) > 0
 order by i_product_name
  limit 100;