/*3. Найти всех абонентов, чья абон.плата больше средней абон.платы (пофилиально). 
Результат_: номер договора и величина АП.
*/
select aaa.Id_contract_inst, aaa.n_cost_period
  from (select avg(summ) sr_sum, fw.v_name
          from (select sum(sc.N_cost_period) summ,
                       d.id_department,
                       c.v_ext_ident
                  from fw_contracts c
                
                  join fw_services_cost sc
                    on sc.id_contract_inst = c.id_contract_inst
                  join fw_departments d
                    on c.id_department = d.id_department
                
                 where sc.dt_start <= current_timestamp
                   and sc.dt_stop > current_timestamp
                   and c.dt_start <= current_timestamp
                   and c.dt_stop > current_timestamp
                
                 group by d.id_department, c.v_ext_ident) nam
          join fw_departments fw
            on nam.id_department = fw.id_department
           and fw.b_deleted = 0
          join fw_services_cost fwsc
            on nam.id_contract_inst = fwsc.id_contract_inst
         group by fw.v_name) doc
--- не понятно почему ругается на doc.id_contract_inst
  join fw_services_cost aaa
    on aaa.id_contract_inst = doc.id_contract_inst
 where doc.n_cost_period > nam.sr_sum
   and aaa.dt_start <= current_timestamp
   and aaa.dt_stop > current_timestamp

 group by aaa.id_contract_inst;
