-- start query 37 in stream 2 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 711 and 711+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'navy' or i_color = 'coral') and 
        (i_units = 'Each' or i_units = 'Oz') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'moccasin' or i_color = 'slate') and
        (i_units = 'Gram' or i_units = 'Gross') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'salmon' or i_color = 'gainsboro') and
        (i_units = 'Cup' or i_units = 'Ton') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'green' or i_color = 'burnished') and
        (i_units = 'Tbl' or i_units = 'Pallet') and
        (i_size = 'small' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'lawn' or i_color = 'firebrick') and 
        (i_units = 'Carton' or i_units = 'Dram') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'metallic' or i_color = 'ivory') and
        (i_units = 'Bunch' or i_units = 'Case') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'tan' or i_color = 'azure') and
        (i_units = 'N/A' or i_units = 'Box') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'snow' or i_color = 'khaki') and
        (i_units = 'Tsp' or i_units = 'Ounce') and
        (i_size = 'small' or i_size = 'medium')
        )))) > 0
 order by i_product_name
  limit 100;