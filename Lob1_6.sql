/*6. ������� ���� ����������� ��������� ����������� ������� � ������� ������ � ����� 2018.
���������_: ������������ ����� - ���������� ����������� ���������
*/
SELECT   
count(*)
  FROM FW_PROCESS_LOG l 
      WHERE l.v_message LIKE '������� ����������� ������� �������� %'
      and  
      trunc(l.dt_timestamp) between to_date('01.03.2018','dd.mm.yyyy') and to_date('31.03.2018','dd.mm.yyyy');


