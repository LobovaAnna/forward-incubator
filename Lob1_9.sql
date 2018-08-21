/*9. ¬ывести количество записей в таблице аудита по мес€цам. 
–езультат:_ название мес€ца и количество записей аудита в нЄм
*/
select 
   to_char(l.dt_timestamp,'Month'), count(*) 
       from fw_process_log l 
       group by to_char(l.dt_timestamp,'Month')
