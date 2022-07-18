create or replace  package proceduryIFunkcje is 
procedure podwyzka(departament number ,procent number default 15) ;
function placaNetto(placa number ,procent number default 20)return number;
function staz (numerPracownika number )return number ;


end proceduryIFunkcje;









create or replace package body  proceduryIFunkcje is 
procedure podwyzka(departament number,procent number default 15) is 
begin

update pracownicy set salary =salary +( salary *procent /100)where department_id=departament;
if SQL%rowcount =0 then raise_application_error(-20010,'nie znaleziono departamentu');
end if;
end ;

function placaNetto(placa number ,procent number default 20)return number is
begin
return placa- (placa*procent/100);
end;

function staz (numerPracownika number )return number is 
staz number ;
begin
select extract (year from (select hire_date from pracownicy where employee_id=numerPracownika))into staz from dual;
return extract (year from sysdate )- staz;
end;

end proceduryIFunkcje;

--test
execute proceduryIFunkcje.podwyzka(110,10);

execute dbms_output.put_line(proceduryIFunkcje.placaNetto(1000,50))

execute   dbms_output.put_line(proceduryifunkcje.staz(201))




select * from pracownicy;

set serveroutput on;

select salary, hire_date from pracownicy where employee_id =201;


select extract(day  from (select hire_date from pracownicy where employee_id =201) ) as dzien from dual ; 

select extract (year from sysdate ) from dual;






create or replace function PracDep (id_departamentu in number) return number is
cursor kursor is select count (1 )as liczba from pracownicy where department_id =id_departamentu;
begin 
for wiersz in kursor loop
return wiersz.liczba;
end loop;
end PracDep;


execute dbms_output.put_line(PracDep(80)) ;



set serveroutput on;


insert into pracownicy (employee_id,first_name,last_name,hire_date,salary,job_id) values(15,'patryk','kowalski',sysdate,15,15);
select * from pracownicy where employee_id=15;
--triger

create or replace trigger triger1 after insert on pracownicy for each row  

insert into historia1 (:new.)
begin

null;
end;











































