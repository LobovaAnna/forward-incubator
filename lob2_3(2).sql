/*3.Ќайти такие департаменты, к которым не прив€зано ни одного контракта 
–езультат: наименование департаментов
*/ 
SELECT d.v_name 
  FROM fw_departments d 
    WHERE NOT EXISTS 
                    (SELECT * 
                       FROM fw_contracts c 
                         WHERE c.id_department = d.id_department 
                     )
