  /*1.  Реализовать процедуру saveSigners, принимающую на вход ФИО подписанта(pV_FIO),
   код пользователя(pID_MANAGER) и действие(pACTION).
  В процедуре: а) Реализовать проверку существования в таблице ci_users 
  строчки с кодом пользователя(ci_users.id_user = pID_MANAGER).
  В случае, если пользователь не найден, выдать ошибку 
  (команда raise_application_error, код ошибки -20020) "Пользователь не найден".
  Рекомендация - либо использовать count и if, либо обработку ошибок
  begin ... exception when no_data found ... end; б) В зависимости от действия pACTION:
  если pACTION = 1, тогда реализовать добавление в таблицу scd_signers строчки (pV_FIO, pID_MANAGER).
  В случае, если запись с данным id_manager уже присутствует, выдать ошибку. если pACTION = 2,
  тогда реализовать редактирование в таблице scd_signers параметра V_FIO строчки с данным id_manager. 
  если pACTION = 3, реализовать удаление строки с данным id_manager. 
  Рекомендация - использовать команду case.*/

-- не совсем поняла как это не через v_count сделать.. ну, это, вроде, не работает...

  CREATE OR REPLACE PROCEDURE saveSigners(pV_FIO      in scd_signers.v_fio%type,
                                          pID_MANAGER in scd_signers.id_manager%type,
                                          pACTION     is number) is
  v_count number;
begin
  select pV_FIO
    into v_count
    from ci_users
   where ci_users.id_user = scd_signers.pID_MANAGER 
   case WHEN pACTION = 1 then INSERT
    INTO scd_signers(pV_FIO, pID_MANAGER) 
    VALUES(pV_FIO, pID_MANAGER);
  when pACTION = 2 then update scd_signers 
     where  ci_users.id_user = scd_signers.ID_MANAGER;
    when pACTION = 3 then DELETE from scd_signers.id_manager
end case;
--exception WHEN no_data_found THEN raise_application_error(-20020, 'Пользователь не найден');
END;
