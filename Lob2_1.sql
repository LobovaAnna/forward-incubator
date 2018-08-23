/* 1.  Создать отчет по платежам за последний месяц в разрезе департаментов
 Результат: наименование департамента, сумма платежей в этом департаменте 
 за последний месяц, количество платежей в этом департаменте за последний месяц,
  количество контрактов в этом департаменте.
  */
 
SELECT v_name
     , sm
     , te_cnt
     , con_cnt
  FROM (SELECT v_name
             , mm
             , sm
             , te_cnt
             , con_cnt
             , RANK() OVER (PARTITION BY v_name ORDER BY mm DESC) rnk
          FROM (SELECT d.v_name
                     , trunc(te.dt_event,'MM')     mm
                     , sum(te.f_sum)               sm
                     , COUNT(DISTINCT te.id_trans)          te_cnt
                     , COUNT(DISTINCT con.id_contract_inst) con_cnt
                  FROM (SELECT c.id_contract_inst
                             , c.id_department
                          FROM FW_CONTRACTS c
                         GROUP BY c.id_contract_inst
                                , c.id_department
                       ) con
                  JOIN TRANS_EXTERNAL te
                    ON con.id_contract_inst = te.id_contract
                  JOIN fw_departments d
                    ON d.id_department = con.id_department
                GROUP BY d.v_name, trunc(te.dt_event,'MM')
               ) 
       )
 WHERE rnk = 1;
