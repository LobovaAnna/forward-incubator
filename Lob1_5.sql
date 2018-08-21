/*5. ����� ��������� ����������������� ����������� ������� � ����� �������
 (���� ������� ��� "+000000000 00:00:00.063924000" = 63924000) � ������� ������.
���������_: ������������ �����
*/
SELECT numtodsinterval( 
     sum( 
         extract(day from duration) * 86400 + 
         extract(hour from duration) * 3600 + 
         extract(minute from duration) * 60 + 
         extract(second from duration) 
         ),'second' 
                   ) 
     FROM ( 
            SELECT to_dsinterval(SUBSTR(l.v_message,INSTR(l.v_message,'����� ����� ���������� : ')+length('����� ����� ���������� : ')+1)) duration 
              � , l.v_message 
               FROM FW_PROCESS_LOG l 
                 WHERE l.n_action = 11 
                 AND l.n_status = 100 
                 AND l.id_error_code = 0 
                 AND l.v_message LIKE '������� ����������� ������� ��������%'
