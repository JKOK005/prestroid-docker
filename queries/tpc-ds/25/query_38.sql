-- start query 37 in stream 25 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 760 and 760+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'deep' or i_color = 'sandy') and 
        (i_units = 'Bunch' or i_units = 'Lb') and
        (i_size = 'petite' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'chartreuse' or i_color = 'misty') and
        (i_units = 'Dram' or i_units = 'N/A') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'puff' or i_color = 'almond') and
        (i_units = 'Each' or i_units = 'Tsp') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'tomato' or i_color = 'goldenrod') and
        (i_units = 'Dozen' or i_units = 'Ton') and
        (i_size = 'petite' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'chiffon' or i_color = 'gainsboro') and 
        (i_units = 'Pallet' or i_units = 'Unknown') and
        (i_size = 'petite' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'beige' or i_color = 'magenta') and
        (i_units = 'Ounce' or i_units = 'Box') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornflower' or i_color = 'green') and
        (i_units = 'Tbl' or i_units = 'Case') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'saddle' or i_color = 'mint') and
        (i_units = 'Pound' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
  limit 100;