-- start query 37 in stream 14 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 872 and 872+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'papaya' or i_color = 'chiffon') and 
        (i_units = 'Cup' or i_units = 'Ounce') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'light' or i_color = 'peach') and
        (i_units = 'Pallet' or i_units = 'Tbl') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'misty' or i_color = 'chocolate') and
        (i_units = 'Case' or i_units = 'Bundle') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'sienna' or i_color = 'burlywood') and
        (i_units = 'Carton' or i_units = 'N/A') and
        (i_size = 'small' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'dark' or i_color = 'turquoise') and 
        (i_units = 'Pound' or i_units = 'Tsp') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'green' or i_color = 'honeydew') and
        (i_units = 'Dram' or i_units = 'Unknown') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'purple' or i_color = 'linen') and
        (i_units = 'Dozen' or i_units = 'Gross') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'ivory' or i_color = 'dim') and
        (i_units = 'Box' or i_units = 'Oz') and
        (i_size = 'small' or i_size = 'petite')
        )))) > 0
 order by i_product_name
  limit 100;