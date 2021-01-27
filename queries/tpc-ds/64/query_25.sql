select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 173 and 173+10 
             or ss_coupon_amt between 8687 and 8687+1000
             or ss_wholesale_cost between 42 and 42+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 17 and 17+10
          or ss_coupon_amt between 16133 and 16133+1000
          or ss_wholesale_cost between 9 and 9+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 68 and 68+10
          or ss_coupon_amt between 12687 and 12687+1000
          or ss_wholesale_cost between 19 and 19+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 132 and 132+10
          or ss_coupon_amt between 3252 and 3252+1000
          or ss_wholesale_cost between 6 and 6+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 64 and 64+10
          or ss_coupon_amt between 7283 and 7283+1000
          or ss_wholesale_cost between 5 and 5+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 41 and 41+10
          or ss_coupon_amt between 3494 and 3494+1000
          or ss_wholesale_cost between 53 and 53+20)) B6
limit 100;