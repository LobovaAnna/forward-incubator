/*4.������� ���������� �������� �� ����������. ���������: 
���������� ��������, 
���� ���������� �������, 
����� �������� ����� ���������, 
��� ������������, ���������� ������*/ 
----�� ��������� ��� ������������, ���������� ������, ������ ������?
--- ����� ���� ����� �������� c.v_username ��� c.v_description?
select COUNT(te.id_trans) pay_count 
     , MAX(te.dt_event) last_pay_date 
     , c.v_ext_ident 
     , u.v_username 
     , c.v_description
  from trans_external te 
     , fw_contracts c 
     , ci_users u 
    where te.id_contract = c.id_contract_inst 
    AND te.dt_event BETWEEN c.dt_start AND c.dt_stop 
    AND te.id_manager = u.id_user (+) 
GROUP BY c.v_ext_ident 
       , u.v_username
       , c.v_description;
