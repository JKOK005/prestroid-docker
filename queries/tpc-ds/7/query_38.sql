-- start query 37 in stream 7 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 971 and 971+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'green' or i_color = 'khaki') and 
        (i_units = 'Cup' or i_units = 'Gross') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'cyan' or i_color = 'burnished') and
        (i_units = 'Carton' or i_units = 'Each') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'sandy' or i_color = 'orange') and
        (i_units = 'Box' or i_units = 'Ounce') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'lace' or i_color = 'smoke') and
        (i_units = 'Bunch' or i_units = 'Bundle') and
        (i_size = 'large' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'light' or i_color = 'deep') and 
        (i_units = 'Lb' or i_units = 'Ton') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'royal' or i_color = 'mint') and
        (i_units = 'Gram' or i_units = 'Unknown') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'yellow' or i_color = 'misty') and
        (i_units = 'Pallet' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'purple' or i_color = 'seashell') and
        (i_units = 'Dram' or i_units = 'N/A') and
        (i_size = 'large' or i_size = 'petite')
        )))) > 0
 order by i_product_name
  limit 100;