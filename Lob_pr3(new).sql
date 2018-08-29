WITH sum_contr_dep AS
( SELECT sum(sc.N_cost_period) summ,
         c.id_contract_inst,
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
                
   group by c.id_contract_inst, d.id_department, c.v_ext_ident
) ,
avg_dep AS
( SELECT id_department
       , AVG(summ) AS avg_summ
    FROM sum_contr_dep
GROUP BY id_department
)
SELECT *
  FROM avg_dep
