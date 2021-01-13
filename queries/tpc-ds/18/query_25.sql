-- start query 25 in stream 18 using template query28.tpl
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 142 and 142+10 
             or ss_coupon_amt between 10006 and 10006+1000
             or ss_wholesale_cost between 27 and 27+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 123 and 123+10
          or ss_coupon_amt between 1027 and 1027+1000
          or ss_wholesale_cost between 46 and 46+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 101 and 101+10
          or ss_coupon_amt between 5909 and 5909+1000
          or ss_wholesale_cost between 18 and 18+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 2 and 2+10
          or ss_coupon_amt between 16870 and 16870+1000
          or ss_wholesale_cost between 76 and 76+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 149 and 149+10
          or ss_coupon_amt between 852 and 852+1000
          or ss_wholesale_cost between 15 and 15+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 156 and 156+10
          or ss_coupon_amt between 14056 and 14056+1000
          or ss_wholesale_cost between 24 and 24+20)) B6
 limit 100;