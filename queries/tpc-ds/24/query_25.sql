-- start query 25 in stream 24 using template query28.tpl
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 57 and 57+10 
             or ss_coupon_amt between 11765 and 11765+1000
             or ss_wholesale_cost between 78 and 78+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 54 and 54+10
          or ss_coupon_amt between 4138 and 4138+1000
          or ss_wholesale_cost between 11 and 11+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 113 and 113+10
          or ss_coupon_amt between 151 and 151+1000
          or ss_wholesale_cost between 50 and 50+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 86 and 86+10
          or ss_coupon_amt between 17406 and 17406+1000
          or ss_wholesale_cost between 14 and 14+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 27 and 27+10
          or ss_coupon_amt between 7613 and 7613+1000
          or ss_wholesale_cost between 51 and 51+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 135 and 135+10
          or ss_coupon_amt between 4228 and 4228+1000
          or ss_wholesale_cost between 80 and 80+20)) B6
 limit 100;