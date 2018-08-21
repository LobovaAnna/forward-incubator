/*7. —колько повтор€ющихс€ идентификаторов сессии есть в таблице аудита.
–езультат_: единственное число - количество повтор€ющихс€ идентификаторов
*/
SELECT 
   count(*) 
         from (select l.sid, count(*) 
                  FROM FW_PROCESS_LOG l 
                   group by sid 
                   having count(*)>1);
