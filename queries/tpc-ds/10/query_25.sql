-- start query 25 in stream 10 using template query28.tpl
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 164 and 164+10 
             or ss_coupon_amt between 3091 and 3091+1000
             or ss_wholesale_cost between 38 and 38+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 90 and 90+10
          or ss_coupon_amt between 15340 and 15340+1000
          or ss_wholesale_cost between 26 and 26+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 11 and 11+10
          or ss_coupon_amt between 3204 and 3204+1000
          or ss_wholesale_cost between 60 and 60+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 27 and 27+10
          or ss_coupon_amt between 7482 and 7482+1000
          or ss_wholesale_cost between 71 and 71+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 153 and 153+10
          or ss_coupon_amt between 7780 and 7780+1000
          or ss_wholesale_cost between 45 and 45+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 136 and 136+10
          or ss_coupon_amt between 5954 and 5954+1000
          or ss_wholesale_cost between 27 and 27+20)) B6
 limit 100;