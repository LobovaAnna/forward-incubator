  /*1. � ������� ������ ����� ���������� ������� ����������� ������ 2520123,
   ������������� �������.<br> _���������_: ���������� �������
   */
  
 SELECT COUNT(*) 
FROM fw_process_log l 
WHERE l.v_message LIKE '%2520123%' 
AND l.n_status = 500
