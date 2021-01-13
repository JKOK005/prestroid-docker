-- start query 37 in stream 29 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 1000 and 1000+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'tan' or i_color = 'wheat') and 
        (i_units = 'Cup' or i_units = 'Lb') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'blue' or i_color = 'magenta') and
        (i_units = 'Gram' or i_units = 'Carton') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'snow' or i_color = 'floral') and
        (i_units = 'Dozen' or i_units = 'Pound') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'almond' or i_color = 'pale') and
        (i_units = 'Ounce' or i_units = 'Bunch') and
        (i_size = 'economy' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'cornflower' or i_color = 'powder') and 
        (i_units = 'Gross' or i_units = 'Pallet') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'rosy' or i_color = 'salmon') and
        (i_units = 'Oz' or i_units = 'Tsp') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'green' or i_color = 'smoke') and
        (i_units = 'Tbl' or i_units = 'Bundle') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'ivory' or i_color = 'navy') and
        (i_units = 'Dram' or i_units = 'Each') and
        (i_size = 'economy' or i_size = 'small')
        )))) > 0
 order by i_product_name
  limit 100;