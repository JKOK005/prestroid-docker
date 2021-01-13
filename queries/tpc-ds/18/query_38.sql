-- start query 37 in stream 18 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 973 and 973+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'sky' or i_color = 'purple') and 
        (i_units = 'Lb' or i_units = 'Each') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'smoke' or i_color = 'moccasin') and
        (i_units = 'Tbl' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'saddle' or i_color = 'lime') and
        (i_units = 'N/A' or i_units = 'Gross') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'yellow' or i_color = 'firebrick') and
        (i_units = 'Dozen' or i_units = 'Bundle') and
        (i_size = 'petite' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'rose' or i_color = 'aquamarine') and 
        (i_units = 'Gram' or i_units = 'Carton') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'blush' or i_color = 'powder') and
        (i_units = 'Ton' or i_units = 'Oz') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'coral' or i_color = 'wheat') and
        (i_units = 'Case' or i_units = 'Unknown') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'brown' or i_color = 'maroon') and
        (i_units = 'Tsp' or i_units = 'Pallet') and
        (i_size = 'petite' or i_size = 'small')
        )))) > 0
 order by i_product_name
  limit 100;