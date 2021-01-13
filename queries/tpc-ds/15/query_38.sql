-- start query 37 in stream 15 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 816 and 816+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'almond' or i_color = 'orchid') and 
        (i_units = 'Case' or i_units = 'Carton') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'floral' or i_color = 'turquoise') and
        (i_units = 'Unknown' or i_units = 'N/A') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'honeydew' or i_color = 'dodger') and
        (i_units = 'Pallet' or i_units = 'Cup') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'light' or i_color = 'frosted') and
        (i_units = 'Oz' or i_units = 'Ounce') and
        (i_size = 'extra large' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'misty' or i_color = 'magenta') and 
        (i_units = 'Bundle' or i_units = 'Gram') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'gainsboro' or i_color = 'goldenrod') and
        (i_units = 'Tbl' or i_units = 'Dozen') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'green' or i_color = 'blush') and
        (i_units = 'Ton' or i_units = 'Lb') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'blanched' or i_color = 'tan') and
        (i_units = 'Bunch' or i_units = 'Gross') and
        (i_size = 'extra large' or i_size = 'small')
        )))) > 0
 order by i_product_name
  limit 100;