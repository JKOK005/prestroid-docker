-- start query 37 in stream 24 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 793 and 793+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'misty' or i_color = 'pink') and 
        (i_units = 'Gram' or i_units = 'Bundle') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'peru' or i_color = 'hot') and
        (i_units = 'Box' or i_units = 'Carton') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'wheat' or i_color = 'burlywood') and
        (i_units = 'Dozen' or i_units = 'Ton') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'black' or i_color = 'aquamarine') and
        (i_units = 'N/A' or i_units = 'Tbl') and
        (i_size = 'small' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'rose' or i_color = 'red') and 
        (i_units = 'Lb' or i_units = 'Cup') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'violet' or i_color = 'blush') and
        (i_units = 'Unknown' or i_units = 'Each') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'dodger' or i_color = 'lime') and
        (i_units = 'Tsp' or i_units = 'Ounce') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'drab' or i_color = 'magenta') and
        (i_units = 'Pallet' or i_units = 'Dram') and
        (i_size = 'small' or i_size = 'medium')
        )))) > 0
 order by i_product_name
  limit 100;