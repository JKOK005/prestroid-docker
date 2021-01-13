-- start query 25 in stream 3 using template query28.tpl
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 176 and 176+10 
             or ss_coupon_amt between 727 and 727+1000
             or ss_wholesale_cost between 75 and 75+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 59 and 59+10
          or ss_coupon_amt between 15409 and 15409+1000
          or ss_wholesale_cost between 25 and 25+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 137 and 137+10
          or ss_coupon_amt between 696 and 696+1000
          or ss_wholesale_cost between 73 and 73+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 162 and 162+10
          or ss_coupon_amt between 10654 and 10654+1000
          or ss_wholesale_cost between 0 and 0+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 148 and 148+10
          or ss_coupon_amt between 17396 and 17396+1000
          or ss_wholesale_cost between 64 and 64+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 31 and 31+10
          or ss_coupon_amt between 3019 and 3019+1000
          or ss_wholesale_cost between 7 and 7+20)) B6
 limit 100;