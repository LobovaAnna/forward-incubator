 /*2. � ������� ������ ����� ����/����� ��������� ������� ����������� ������ 2520123, 
 ������������� �������.
 ���������_: ����/����� ������� � ������� dd.mon.yyyy � ����� ������
 */
 select 
   *
    from fw_process_log I
   WHERE I.v_message LIKE '%2520123%' 
   and to_date(I.Dt_Timestamp,'mon') = ( select max(I.Dt_Timestamp) from fw_process_log);
