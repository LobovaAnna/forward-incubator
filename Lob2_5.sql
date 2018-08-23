/*5.Найти те контракты, у которых менялась валюта, например, была указана валюта рубль, потом появилась новая запись с валютой уже доллар Результат: 
код контракта, 
лицевой счет, 
статус, 
наименование валюты 

Данные вывести на текущий день
*/ 
SELECT c.id_contract_inst 
     , c.v_ext_ident 
     , decode(c.v_status 
     ,'A','активен' 
     ,'B','заблокирован' 
     ,'C','расторжен' 
     ,'D','удален' 
     ,c.v_status 
             ) status 
     , cc.v_name 
   FROM fw_contracts c 
      , fw_currency cc 
     WHERE EXISTS 
                 (SELECT * 
                    FROM fw_contracts c1 
                      WHERE c1.id_contract_inst = c.id_contract_inst 
                      AND c1.id_rec <> c.id_rec 
                      AND (c1.id_currency <> c.id_currency OR 
                           c1.id_currency IS NULL AND c.id_currency IS NOT NULL OR 
                           c1.id_currency IS NOT NULL AND c.id_currency IS NULL 
                           ) 
                   ) 
     AND SYSDATE BETWEEN c.dt_start AND c.dt_stop 
     AND c.id_currency = cc.id_currency (+)