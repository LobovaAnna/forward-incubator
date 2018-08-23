/*6.Вывести отчет по сумме активных платежей на контракте за каждый год. Результат: 
Сумма платежей на контракте, 
идентификатор контракта, 
наименование департамента, 
дата начала года*/ 

select SUM(te.f_sum) f_sum 
     , c.id_contract_inst 
     , d.v_name 
     , TRUNC(te.dt_event, 'YYYY') 
  from trans_external te 
     , fw_contracts c 
     , fw_departments d 
    where te.id_contract = c.id_contract_inst 
    AND te.dt_event BETWEEN c.dt_start AND c.dt_stop 
    AND te.v_status = 'A' 
    AND d.id_department = c.id_department 
GROUP BY c.id_contract_inst 
       , d.v_name 
       , TRUNC(te.dt_event, 'YYYY') 
ORDER BY 4,3
