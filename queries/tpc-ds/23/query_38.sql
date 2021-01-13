-- start query 37 in stream 23 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 922 and 922+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'medium' or i_color = 'firebrick') and 
        (i_units = 'Lb' or i_units = 'Ton') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'papaya' or i_color = 'beige') and
        (i_units = 'N/A' or i_units = 'Pound') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'gainsboro' or i_color = 'burnished') and
        (i_units = 'Tbl' or i_units = 'Gram') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'pink' or i_color = 'peru') and
        (i_units = 'Oz' or i_units = 'Bundle') and
        (i_size = 'petite' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'chiffon' or i_color = 'brown') and 
        (i_units = 'Bunch' or i_units = 'Unknown') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'aquamarine' or i_color = 'salmon') and
        (i_units = 'Cup' or i_units = 'Box') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'bisque' or i_color = 'lemon') and
        (i_units = 'Each' or i_units = 'Pallet') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'sky' or i_color = 'metallic') and
        (i_units = 'Tsp' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'small')
        )))) > 0
 order by i_product_name
  limit 100;