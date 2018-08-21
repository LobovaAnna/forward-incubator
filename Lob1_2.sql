 /*2. ¬ таблице аудита найти дату/врем€ последней попытки продвижени€ заказа 2520123, 
 закончившейс€ ошибкой.
 –езультат_: дата/врем€ попытки в формате dd.mon.yyyy и номер заказа
 */
 select 
   *
    from fw_process_log I
   WHERE I.v_message LIKE '%2520123%' 
   and to_date(I.Dt_Timestamp,'mon') = ( select max(I.Dt_Timestamp) from fw_process_log);
