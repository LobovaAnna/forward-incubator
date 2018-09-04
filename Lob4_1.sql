/*1.  Реализовать справочник коммутаторов. Необходимо обеспечить уникальность IP и MAC адресов. 
В случае, если remote_id должен использоваться в hex формате, поле REMOTE_ID_HEX становится 
обязательным к заполнению. Параметры доступов на чтение и запись, IP, MAC, remote_id являются 
обязательными для заполнения параметрами. Кроме того, необходимо проверять валидность IP. 
Результат: как минимум методы getCOMMUTATOR и saveCOMMUTATOR (при создании записи использовать 
s_incb_commutator.nextval для кода коммутатора) для справочника с учётом бизнес-ограничений и 
скрипт с примерами их использования (заполнение справочника, изменение записей, удаление записей,
 получение записей).*/
 
 -- пыталась сразу пакет написать, но что-то пошло не так
create or replace package pkg_incb_commutator_api 
as 
procedure getCOMMUTATOR 
( IP_ADDRESS IP IN incb_commutator.IP_ADDRESS%type
, ID_COMMUTATOR_TYPE IN incb_commutator.ID_COMMUTATOR_TYPE%type
, V_DESCRIPTION IN incb_commutator.V_DESCRIPTION%type
, B_DELETED IN incb_commutator.B_DELETED%type 
, V_MAC_ADDRESS IN incb_commutator.V_MAC_ADDRESS%type 
, V_COMMUNITY_READ IN incb_commutator.V_COMMUNITY_READ%type  
, V_COMMUNITY_WRITE IN incb_commutator.V_COMMUNITY_WRITE%type 
, REMOTE_ID IN incb_commutator.REMOTE_ID%type 
, B_NEED_CONVERT_HEX IN incb_commutator.B_NEED_CONVERT_HEX%type 
, ID_COMMUTATOR OUT incb_commutator.ID_COMMUTATOR%type  out ID_COMMUTATOR
); 
procedure saveCOMMUTATOR 
( ID_COMMUTATOR IN incb_commutator.ID_COMMUTATOR%type 
, IP_ADDRESS IP IN incb_commutator.IP_ADDRESS%type
, ID_COMMUTATOR_TYPE IN incb_commutator.ID_COMMUTATOR_TYPE%type 
, V_DESCRIPTION IN incb_commutator.V_DESCRIPTION%type 
, B_DELETED IN incb_commutator.B_DELETED%type 
, V_MAC_ADDRESS IN incb_commutator.V_MAC_ADDRESS%type  
, V_COMMUNITY_READ IN incb_commutator.V_COMMUNITY_READ%type 
, V_COMMUNITY_WRITE IN incb_commutator.V_COMMUNITY_WRITE%type 
, REMOTE_ID IN incb_commutator.REMOTE_ID%type 
, B_NEED_CONVERT_HEX IN incb_commutator.B_NEED_CONVERT_HEX%type 
); 

end pkg_incb_commutator_api; 
/ 
create or replace package body pkg_incb_commutator_api 
as 
procedure getCOMMUTATOR 
( IP_ADDRESS IP IN incb_commutator.IP_ADDRESS%type
, ID_COMMUTATOR_TYPE IN incb_commutator.ID_COMMUTATOR_TYPE%type 
, V_DESCRIPTION IN incb_commutator.V_DESCRIPTION%type 
, B_DELETED IN incb_commutator.B_DELETED%type 
, V_MAC_ADDRESS IN incb_commutator.V_MAC_ADDRESS%type  
, V_COMMUNITY_READ IN incb_commutator.V_COMMUNITY_READ%type  
, V_COMMUNITY_WRITE IN incb_commutator.V_COMMUNITY_WRITE%type
, REMOTE_ID IN incb_commutator.REMOTE_ID%type
, B_NEED_CONVERT_HEX IN incb_commutator.B_NEED_CONVERT_HEX%type 
, ID_COMMUTATOR OUT incb_commutator.ID_COMMUTATOR%type out ID_COMMUTATOR
) 
is 
begin 
--здесь будет какой-то код 
-- проверка на валидность IP (не нашла как проверить)
end getCOMMUTATOR; 

procedure saveCOMMUTATOR 
( ID_COMMUTATOR IN incb_commutator.ID_COMMUTATOR%type 
, IP_ADDRESS IP IN incb_commutator.IP_ADDRESS%type 
, ID_COMMUTATOR_TYPE IN incb_commutator.ID_COMMUTATOR_TYPE%type 
, V_DESCRIPTION IN incb_commutator.V_DESCRIPTION%type 
, B_DELETED IN incb_commutator.B_DELETED%type 
, V_MAC_ADDRESS IN incb_commutator.V_MAC_ADDRESS%type 
, V_COMMUNITY_READ IN incb_commutator.V_COMMUNITY_READ%type 
, V_COMMUNITY_WRITE IN incb_commutator.V_COMMUNITY_WRITE%type
, REMOTE_ID IN incb_commutator.REMOTE_ID%type
, B_NEED_CONVERT_HEX IN incb_commutator.B_NEED_CONVERT_HEX%type  
) 
is 
begin 
select
ID_COMMUTATOR,IP_ADDRESS,ID_COMMUTATOR_TYPE,V_DESCRIPTION,B_DELETED,V_MAC_ADDRESS,V_COMMUNITY_READ, 
V_COMMUNITY_WRITE,REMOTE_ID, B_NEED_CONVERT_HEX  
from  incb_commutator
when no_data_found then raise_application_error(-20020, 'записи нет')
  then INSERT
    INTO incb_commutator(ID_COMMUTATOR,IP_ADDRESS,ID_COMMUTATOR_TYPE,V_DESCRIPTION,B_DELETED,V_MAC_ADDRESS,V_COMMUNITY_READ, 
V_COMMUNITY_WRITE,REMOTE_ID, B_NEED_CONVERT_HEX) 
    VALUES(ID_COMMUTATOR,IP_ADDRESS,ID_COMMUTATOR_TYPE,V_DESCRIPTION,B_DELETED,V_MAC_ADDRESS,V_COMMUNITY_READ, 
V_COMMUNITY_WRITE,REMOTE_ID, B_NEED_CONVERT_HEX);
when some_condition
  then update incb_commutator ;
  when ID_COMMUTATOR = ID_COMMUTATOR,IP_ADDRESS = IP_ADDRESS,ID_COMMUTATOR_TYPE = ID_COMMUTATOR_TYPE,
    V_DESCRIPTION = V_DESCRIPTION,B_DELETED = B_DELETED,V_MAC_ADDRESS = V_MAC_ADDRESS,
     B_NEED_CONVERT_HEXthen = B_NEED_CONVERT_HEXthen
     then DELETE from incb_commutator.;
case
  end case;
end saveCOMMUTATOR; 

end pkg_incb_commutator_api;
