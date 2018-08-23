/*4.Вывести количество платежей на контрактах. Результат: 
количество платежей, 
дата последнего платежа, 
номер лицевого счета контракта, 
имя пользователя, создавшего платеж*/ 
----не выводится имя пользователя, создавшего платеж, почему пустое?
--- какое поле нужно выводить c.v_username или c.v_description?
select COUNT(te.id_trans) pay_count 
     , MAX(te.dt_event) last_pay_date 
     , c.v_ext_ident 
     , u.v_username 
     , c.v_description
  from trans_external te 
     , fw_contracts c 
     , ci_users u 
    where te.id_contract = c.id_contract_inst 
    AND te.dt_event BETWEEN c.dt_start AND c.dt_stop 
    AND te.id_manager = u.id_user (+) 
GROUP BY c.v_ext_ident 
       , u.v_username
       , c.v_description;
