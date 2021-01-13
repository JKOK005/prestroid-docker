-- start query 25 in stream 1 using template query28.tpl
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 88 and 88+10 
             or ss_coupon_amt between 9930 and 9930+1000
             or ss_wholesale_cost between 71 and 71+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 1 and 1+10
          or ss_coupon_amt between 6819 and 6819+1000
          or ss_wholesale_cost between 10 and 10+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 29 and 29+10
          or ss_coupon_amt between 3565 and 3565+1000
          or ss_wholesale_cost between 37 and 37+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 27 and 27+10
          or ss_coupon_amt between 2081 and 2081+1000
          or ss_wholesale_cost between 69 and 69+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 98 and 98+10
          or ss_coupon_amt between 1115 and 1115+1000
          or ss_wholesale_cost between 18 and 18+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 63 and 63+10
          or ss_coupon_amt between 7739 and 7739+1000
          or ss_wholesale_cost between 20 and 20+20)) B6
 limit 100;