-- start query 37 in stream 3 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 709 and 709+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'mint' or i_color = 'metallic') and 
        (i_units = 'Carton' or i_units = 'Dram') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'beige' or i_color = 'snow') and
        (i_units = 'Pallet' or i_units = 'Pound') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'ivory' or i_color = 'royal') and
        (i_units = 'Ounce' or i_units = 'N/A') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'misty' or i_color = 'thistle') and
        (i_units = 'Cup' or i_units = 'Tbl') and
        (i_size = 'petite' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'blue' or i_color = 'navy') and 
        (i_units = 'Dozen' or i_units = 'Case') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'grey' or i_color = 'seashell') and
        (i_units = 'Bunch' or i_units = 'Each') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'deep' or i_color = 'plum') and
        (i_units = 'Ton' or i_units = 'Gross') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'ghost' or i_color = 'light') and
        (i_units = 'Bundle' or i_units = 'Unknown') and
        (i_size = 'petite' or i_size = 'economy')
        )))) > 0
 order by i_product_name
  limit 100;