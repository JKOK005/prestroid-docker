-- start query 25 in stream 17 using template query28.tpl
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 177 and 177+10 
             or ss_coupon_amt between 12598 and 12598+1000
             or ss_wholesale_cost between 58 and 58+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 20 and 20+10
          or ss_coupon_amt between 15886 and 15886+1000
          or ss_wholesale_cost between 8 and 8+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 159 and 159+10
          or ss_coupon_amt between 8958 and 8958+1000
          or ss_wholesale_cost between 18 and 18+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 176 and 176+10
          or ss_coupon_amt between 15712 and 15712+1000
          or ss_wholesale_cost between 43 and 43+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 64 and 64+10
          or ss_coupon_amt between 8461 and 8461+1000
          or ss_wholesale_cost between 56 and 56+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 111 and 111+10
          or ss_coupon_amt between 4472 and 4472+1000
          or ss_wholesale_cost between 35 and 35+20)) B6
 limit 100;