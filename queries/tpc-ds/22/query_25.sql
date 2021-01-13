-- start query 25 in stream 22 using template query28.tpl
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 95 and 95+10 
             or ss_coupon_amt between 8469 and 8469+1000
             or ss_wholesale_cost between 26 and 26+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 190 and 190+10
          or ss_coupon_amt between 9931 and 9931+1000
          or ss_wholesale_cost between 44 and 44+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 73 and 73+10
          or ss_coupon_amt between 5645 and 5645+1000
          or ss_wholesale_cost between 18 and 18+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 76 and 76+10
          or ss_coupon_amt between 9743 and 9743+1000
          or ss_wholesale_cost between 31 and 31+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 1 and 1+10
          or ss_coupon_amt between 3513 and 3513+1000
          or ss_wholesale_cost between 71 and 71+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 156 and 156+10
          or ss_coupon_amt between 3640 and 3640+1000
          or ss_wholesale_cost between 21 and 21+20)) B6
 limit 100;