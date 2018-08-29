/*6. Вывести самый прибыльный ТП с точки зрения суммарной АП за доп.услуги пофилиально.
Результат_: название филиала, название ТП, величина АП.
*/
WITH sum_tp_dep AS
 (SELECT sum(sc.N_cost_period) summ,
         d.v_name dep_name,
         d.id_department,
         tp.v_name tarif_name
    from fw_contracts c
    join fw_services_cost sc
      on sc.id_contract_inst = c.id_contract_inst
    join fw_departments d
      on c.id_department = d.id_department
      and d.b_deleted = 0
    JOIN fw_services sss
      ON sss.id_contract_inst = sc.id_contract_inst
     AND sss.id_service_inst = sc.id_service_inst
    JOIN fw_service s
      ON s.id_service = sss.id_service
     AND s.b_add_service = 1
    JOIN fw_tariff_plan tp
      ON tp.id_tariff_plan = sss.id_tariff_plan
   where sc.dt_start <= current_timestamp
     and sc.dt_stop > current_timestamp
     and c.dt_start <= current_timestamp
     and c.dt_stop > current_timestamp
   GROUP BY d.v_name, d.id_department, tp.v_name),
max_dep AS
 (SELECT id_department, MAX(summ) AS max_summ
    FROM sum_tp_dep
   group by id_department)
SELECT sum_tp_dep.dep_name, sum_tp_dep.tarif_name, sum_tp_dep.summ
  FROM sum_tp_dep
  JOIN max_dep
    ON sum_tp_dep.id_department = max_dep.id_department
   AND sum_tp_dep.summ = max_dep.max_summ;

