/*8. Найти пользователя и последнюю дату его входа по таблице аудита для кода пользователя = 11136.
Результат_: дата/время и логин пользователя
*/

select 
     dt_timestamp ,os_username 
   from (select * 
         from fw_process_log l 
         WHERE l.id_user = 11136 
         order by l.dt_timestamp DESC ) 
   WHERE ROWNUM = 1;

 
