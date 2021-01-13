-- start query 25 in stream 27 using template query28.tpl
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 169 and 169+10 
             or ss_coupon_amt between 5573 and 5573+1000
             or ss_wholesale_cost between 56 and 56+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 31 and 31+10
          or ss_coupon_amt between 11029 and 11029+1000
          or ss_wholesale_cost between 21 and 21+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 65 and 65+10
          or ss_coupon_amt between 1779 and 1779+1000
          or ss_wholesale_cost between 4 and 4+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 127 and 127+10
          or ss_coupon_amt between 5203 and 5203+1000
          or ss_wholesale_cost between 35 and 35+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 35 and 35+10
          or ss_coupon_amt between 12571 and 12571+1000
          or ss_wholesale_cost between 5 and 5+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 55 and 55+10
          or ss_coupon_amt between 9978 and 9978+1000
          or ss_wholesale_cost between 13 and 13+20)) B6
 limit 100;