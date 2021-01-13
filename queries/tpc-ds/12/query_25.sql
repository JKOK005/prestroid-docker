-- start query 25 in stream 12 using template query28.tpl
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 86 and 86+10 
             or ss_coupon_amt between 15705 and 15705+1000
             or ss_wholesale_cost between 52 and 52+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 123 and 123+10
          or ss_coupon_amt between 6211 and 6211+1000
          or ss_wholesale_cost between 71 and 71+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 141 and 141+10
          or ss_coupon_amt between 225 and 225+1000
          or ss_wholesale_cost between 45 and 45+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 144 and 144+10
          or ss_coupon_amt between 11096 and 11096+1000
          or ss_wholesale_cost between 75 and 75+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 28 and 28+10
          or ss_coupon_amt between 4282 and 4282+1000
          or ss_wholesale_cost between 40 and 40+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 145 and 145+10
          or ss_coupon_amt between 14400 and 14400+1000
          or ss_wholesale_cost between 34 and 34+20)) B6
 limit 100;