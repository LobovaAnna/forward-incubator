/*6. Сколько было завершённых процессов продвижения заказов в таблице аудита в марте 2018.
Результат_: единственное число - количество завершённых процессов
*/
SELECT   
count(*)
  FROM FW_PROCESS_LOG l 
      WHERE l.v_message LIKE 'Процесс продвижения заказов завершен %'
      and  
      trunc(l.dt_timestamp) between to_date('01.03.2018','dd.mm.yyyy') and to_date('31.03.2018','dd.mm.yyyy');


