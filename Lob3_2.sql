  /*2.  ����������� ������� getDecoder, ����������� �� ���� id_equip_kits_inst. 
  � ������, ���� � scd_equip_kits � ���������� ������ ���������� ��������, 
  � �������� � scd_contracts ���������� ������� b_agency = 1, ����� ������� scd_equip_kits.v_cas_id,
   ����� scd_equip_kits.v_ext_ident. 
  ���� ������������ �� �������, �� ������ ������ "������������ �� �������".
  */

  CREATE OR REPLACE function getDecoder(id_equip_kits_inst in scd_equip_kits.v_cas_id%type
                                         ) is
    pid_service number;
begin
  select v_cas_id, v_ext_ident
    into pid_service
    from scd_contracts
    join scd_equip_kits on scd_contracts.id_contract_inst = scd_equip_kits.id_contract_inst
    where  scd_contracts.id_contract_inst = scd_equip_kits.id_contract_inst;
    case when scd_equip_kits.id_contract_inst is not null 
      and b_agency = 1 then return scd_equip_kits.v_cas_id 
      else return scd_equip_kits.v_ext_ident
end case;

exception
  when no_data_found then raise_application_error(-20020, '������������ �� �������');
end;

  --- �������, ��� ����� ����������...
