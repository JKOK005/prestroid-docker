-- start query 37 in stream 28 using template query41.tpl
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 864 and 864+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'slate' or i_color = 'pale') and 
        (i_units = 'Case' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'green' or i_color = 'chiffon') and
        (i_units = 'Pound' or i_units = 'Gram') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'white' or i_color = 'tan') and
        (i_units = 'Tsp' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'papaya' or i_color = 'cyan') and
        (i_units = 'Ton' or i_units = 'N/A') and
        (i_size = 'medium' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'red' or i_color = 'frosted') and 
        (i_units = 'Oz' or i_units = 'Bunch') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'dark' or i_color = 'royal') and
        (i_units = 'Dozen' or i_units = 'Cup') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'black' or i_color = 'brown') and
        (i_units = 'Lb' or i_units = 'Dram') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'violet' or i_color = 'maroon') and
        (i_units = 'Each' or i_units = 'Box') and
        (i_size = 'medium' or i_size = 'small')
        )))) > 0
 order by i_product_name
  limit 100;