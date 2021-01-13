-- start query 25 in stream 20 using template query28.tpl
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 77 and 77+10 
             or ss_coupon_amt between 13318 and 13318+1000
             or ss_wholesale_cost between 24 and 24+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 59 and 59+10
          or ss_coupon_amt between 1827 and 1827+1000
          or ss_wholesale_cost between 59 and 59+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 157 and 157+10
          or ss_coupon_amt between 11108 and 11108+1000
          or ss_wholesale_cost between 65 and 65+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 103 and 103+10
          or ss_coupon_amt between 4638 and 4638+1000
          or ss_wholesale_cost between 46 and 46+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 25 and 25+10
          or ss_coupon_amt between 14939 and 14939+1000
          or ss_wholesale_cost between 50 and 50+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 104 and 104+10
          or ss_coupon_amt between 5818 and 5818+1000
          or ss_wholesale_cost between 7 and 7+20)) B6
 limit 100;