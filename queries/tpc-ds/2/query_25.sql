-- start query 25 in stream 2 using template query28.tpl
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 83 and 83+10 
             or ss_coupon_amt between 10197 and 10197+1000
             or ss_wholesale_cost between 64 and 64+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 128 and 128+10
          or ss_coupon_amt between 8061 and 8061+1000
          or ss_wholesale_cost between 13 and 13+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 166 and 166+10
          or ss_coupon_amt between 6670 and 6670+1000
          or ss_wholesale_cost between 20 and 20+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 4 and 4+10
          or ss_coupon_amt between 11346 and 11346+1000
          or ss_wholesale_cost between 57 and 57+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 45 and 45+10
          or ss_coupon_amt between 8743 and 8743+1000
          or ss_wholesale_cost between 26 and 26+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 162 and 162+10
          or ss_coupon_amt between 2465 and 2465+1000
          or ss_wholesale_cost between 22 and 22+20)) B6
 limit 100;