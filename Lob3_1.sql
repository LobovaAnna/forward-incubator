  /*1.  ����������� ��������� saveSigners, ����������� �� ���� ��� ����������(pV_FIO),
   ��� ������������(pID_MANAGER) � ��������(pACTION).
  � ���������: �) ����������� �������� ������������� � ������� ci_users 
  ������� � ����� ������������(ci_users.id_user = pID_MANAGER).
  � ������, ���� ������������ �� ������, ������ ������ 
  (������� raise_application_error, ��� ������ -20020) "������������ �� ������".
  ������������ - ���� ������������ count � if, ���� ��������� ������
  begin ... exception when no_data found ... end; �) � ����������� �� �������� pACTION:
  ���� pACTION = 1, ����� ����������� ���������� � ������� scd_signers ������� (pV_FIO, pID_MANAGER).
  � ������, ���� ������ � ������ id_manager ��� ������������, ������ ������. ���� pACTION = 2,
  ����� ����������� �������������� � ������� scd_signers ��������� V_FIO ������� � ������ id_manager. 
  ���� pACTION = 3, ����������� �������� ������ � ������ id_manager. 
  ������������ - ������������ ������� case.*/

-- �� ������ ������ ��� ��� �� ����� v_count �������.. ��, ���, �����, �� ��������...

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
--exception WHEN no_data_found THEN raise_application_error(-20020, '������������ �� ������');
END;
