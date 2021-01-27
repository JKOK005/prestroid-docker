select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 30 and 30+10 
             or ss_coupon_amt between 7235 and 7235+1000
             or ss_wholesale_cost between 76 and 76+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 28 and 28+10
          or ss_coupon_amt between 16535 and 16535+1000
          or ss_wholesale_cost between 55 and 55+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 99 and 99+10
          or ss_coupon_amt between 16144 and 16144+1000
          or ss_wholesale_cost between 0 and 0+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 7 and 7+10
          or ss_coupon_amt between 13699 and 13699+1000
          or ss_wholesale_cost between 42 and 42+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 6 and 6+10
          or ss_coupon_amt between 5361 and 5361+1000
          or ss_wholesale_cost between 62 and 62+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 182 and 182+10
          or ss_coupon_amt between 5679 and 5679+1000
          or ss_wholesale_cost between 18 and 18+20)) B6
limit 100;