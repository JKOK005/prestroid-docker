select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 182 and 182+10 
             or ss_coupon_amt between 9451 and 9451+1000
             or ss_wholesale_cost between 17 and 17+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 146 and 146+10
          or ss_coupon_amt between 10497 and 10497+1000
          or ss_wholesale_cost between 37 and 37+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 91 and 91+10
          or ss_coupon_amt between 10260 and 10260+1000
          or ss_wholesale_cost between 12 and 12+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 163 and 163+10
          or ss_coupon_amt between 5107 and 5107+1000
          or ss_wholesale_cost between 22 and 22+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 48 and 48+10
          or ss_coupon_amt between 2276 and 2276+1000
          or ss_wholesale_cost between 26 and 26+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 30 and 30+10
          or ss_coupon_amt between 7136 and 7136+1000
          or ss_wholesale_cost between 4 and 4+20)) B6
limit 100;