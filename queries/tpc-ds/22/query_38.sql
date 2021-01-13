-- start query 37 in stream 22 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 672 and 672+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'peach' or i_color = 'red') and 
        (i_units = 'Cup' or i_units = 'Dram') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'spring' or i_color = 'chartreuse') and
        (i_units = 'Ton' or i_units = 'Ounce') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'indian' or i_color = 'seashell') and
        (i_units = 'Pallet' or i_units = 'Box') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'firebrick' or i_color = 'green') and
        (i_units = 'Tsp' or i_units = 'Bunch') and
        (i_size = 'extra large' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'dodger' or i_color = 'blanched') and 
        (i_units = 'Gram' or i_units = 'Bundle') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'metallic' or i_color = 'coral') and
        (i_units = 'Case' or i_units = 'Lb') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'drab' or i_color = 'burnished') and
        (i_units = 'Gross' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'papaya' or i_color = 'cream') and
        (i_units = 'Each' or i_units = 'Unknown') and
        (i_size = 'extra large' or i_size = 'petite')
        )))) > 0
 order by i_product_name
  limit 100;