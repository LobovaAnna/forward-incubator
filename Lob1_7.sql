/*7. ������� ������������� ��������������� ������ ���� � ������� ������.
���������_: ������������ ����� - ���������� ������������� ���������������
*/
SELECT 
   count(*) 
         from (select l.sid, count(*) 
                  FROM FW_PROCESS_LOG l 
                   group by sid 
                   having count(*)>1);
