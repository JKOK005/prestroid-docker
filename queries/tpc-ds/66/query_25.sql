select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 4 and 4+10 
             or ss_coupon_amt between 13123 and 13123+1000
             or ss_wholesale_cost between 57 and 57+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 78 and 78+10
          or ss_coupon_amt between 7541 and 7541+1000
          or ss_wholesale_cost between 44 and 44+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 113 and 113+10
          or ss_coupon_amt between 15396 and 15396+1000
          or ss_wholesale_cost between 71 and 71+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 140 and 140+10
          or ss_coupon_amt between 2929 and 2929+1000
          or ss_wholesale_cost between 53 and 53+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 159 and 159+10
          or ss_coupon_amt between 4931 and 4931+1000
          or ss_wholesale_cost between 9 and 9+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 146 and 146+10
          or ss_coupon_amt between 16515 and 16515+1000
          or ss_wholesale_cost between 46 and 46+20)) B6
limit 100;