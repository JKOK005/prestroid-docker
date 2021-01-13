-- start query 37 in stream 9 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 984 and 984+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'cream' or i_color = 'rosy') and 
        (i_units = 'Pallet' or i_units = 'Each') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'plum' or i_color = 'linen') and
        (i_units = 'Pound' or i_units = 'Gram') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'metallic' or i_color = 'yellow') and
        (i_units = 'Oz' or i_units = 'Unknown') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'antique' or i_color = 'turquoise') and
        (i_units = 'Tbl' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'misty' or i_color = 'drab') and 
        (i_units = 'Bundle' or i_units = 'Box') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'royal' or i_color = 'firebrick') and
        (i_units = 'Tsp' or i_units = 'Cup') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'ivory' or i_color = 'white') and
        (i_units = 'N/A' or i_units = 'Dram') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'pink' or i_color = 'maroon') and
        (i_units = 'Ton' or i_units = 'Dozen') and
        (i_size = 'petite' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
  limit 100;