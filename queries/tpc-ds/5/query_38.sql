-- start query 37 in stream 5 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 988 and 988+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'midnight' or i_color = 'smoke') and 
        (i_units = 'Case' or i_units = 'Tsp') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'aquamarine' or i_color = 'blue') and
        (i_units = 'Oz' or i_units = 'Unknown') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'chartreuse' or i_color = 'hot') and
        (i_units = 'Pound' or i_units = 'Dozen') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'azure' or i_color = 'ghost') and
        (i_units = 'Gram' or i_units = 'Box') and
        (i_size = 'extra large' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'navy' or i_color = 'grey') and 
        (i_units = 'Bunch' or i_units = 'Dram') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'white' or i_color = 'navajo') and
        (i_units = 'Pallet' or i_units = 'Ounce') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'dodger' or i_color = 'coral') and
        (i_units = 'Bundle' or i_units = 'N/A') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'black' or i_color = 'drab') and
        (i_units = 'Lb' or i_units = 'Carton') and
        (i_size = 'extra large' or i_size = 'medium')
        )))) > 0
 order by i_product_name
  limit 100;