-- start query 25 in stream 11 using template query28.tpl
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 69 and 69+10 
             or ss_coupon_amt between 16374 and 16374+1000
             or ss_wholesale_cost between 5 and 5+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 97 and 97+10
          or ss_coupon_amt between 13370 and 13370+1000
          or ss_wholesale_cost between 43 and 43+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 71 and 71+10
          or ss_coupon_amt between 4668 and 4668+1000
          or ss_wholesale_cost between 35 and 35+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 90 and 90+10
          or ss_coupon_amt between 13083 and 13083+1000
          or ss_wholesale_cost between 30 and 30+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 140 and 140+10
          or ss_coupon_amt between 5587 and 5587+1000
          or ss_wholesale_cost between 64 and 64+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 15 and 15+10
          or ss_coupon_amt between 7683 and 7683+1000
          or ss_wholesale_cost between 26 and 26+20)) B6
 limit 100;