/*9. ������� ���������� ������� � ������� ������ �� �������. 
���������:_ �������� ������ � ���������� ������� ������ � ��
*/
select 
   to_char(l.dt_timestamp,'Month'), count(*) 
       from fw_process_log l 
       group by to_char(l.dt_timestamp,'Month')
