-- start query 37 in stream 10 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 879 and 879+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'ghost' or i_color = 'gainsboro') and 
        (i_units = 'Dram' or i_units = 'Oz') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'chiffon' or i_color = 'aquamarine') and
        (i_units = 'Lb' or i_units = 'Gross') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'slate' or i_color = 'coral') and
        (i_units = 'Bundle' or i_units = 'Dozen') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'moccasin' or i_color = 'purple') and
        (i_units = 'Bunch' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'smoke' or i_color = 'peach') and 
        (i_units = 'Pound' or i_units = 'Pallet') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'khaki' or i_color = 'firebrick') and
        (i_units = 'Carton' or i_units = 'Gram') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'peru' or i_color = 'sky') and
        (i_units = 'Ton' or i_units = 'Ounce') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'beige' or i_color = 'cornflower') and
        (i_units = 'N/A' or i_units = 'Each') and
        (i_size = 'medium' or i_size = 'large')
        )))) > 0
 order by i_product_name
  limit 100;