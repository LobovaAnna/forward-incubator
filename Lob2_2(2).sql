/*2.	Найти контракты, на которые в 2017 году было совершено более 3 платежей 
Результат: номер лицевого счета, статус контракта, количество платежей на этом контракте за 2017 году
*/
SELECT * 
   FROM 
       (select c.v_ext_ident 
             , c.v_status 
             , COUNT(*) cnt 
          from trans_external te 
             , fw_contracts c 
                  where trunc(te.dt_event,'yyyy') = to_date('01.01.2017', 'dd.mm.yyyy')
                  AND te.id_contract = c.id_contract_inst 
                  AND te.dt_event BETWEEN c.dt_start AND c.dt_stop 
                       GROUP BY c.v_ext_ident 
                              , c.v_status 
       ) 
   WHERE cnt > 3
   order by cnt desc
