/*8. ����� ������������ � ��������� ���� ��� ����� �� ������� ������ ��� ���� ������������ = 11136.
���������_: ����/����� � ����� ������������
*/

select 
     dt_timestamp ,os_username 
   from (select * 
         from fw_process_log l 
         WHERE l.id_user = 11136 
         order by l.dt_timestamp DESC ) 
   WHERE ROWNUM = 1;

 
