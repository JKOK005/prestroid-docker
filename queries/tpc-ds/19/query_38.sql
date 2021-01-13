-- start query 37 in stream 19 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 789 and 789+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'ghost' or i_color = 'pink') and 
        (i_units = 'Ton' or i_units = 'Tsp') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'moccasin' or i_color = 'chartreuse') and
        (i_units = 'Lb' or i_units = 'Ounce') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'plum' or i_color = 'seashell') and
        (i_units = 'Oz' or i_units = 'Bundle') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'firebrick' or i_color = 'chocolate') and
        (i_units = 'Box' or i_units = 'Pallet') and
        (i_size = 'large' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'gainsboro' or i_color = 'peach') and 
        (i_units = 'Gross' or i_units = 'Carton') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'purple' or i_color = 'cyan') and
        (i_units = 'Each' or i_units = 'Pound') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'sienna' or i_color = 'aquamarine') and
        (i_units = 'Gram' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'mint' or i_color = 'cream') and
        (i_units = 'Dram' or i_units = 'Case') and
        (i_size = 'large' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
  limit 100;