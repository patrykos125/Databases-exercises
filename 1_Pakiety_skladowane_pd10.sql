
--2
create or replace package depart_pa is 
procedure wyswietl (lokalizacja number);
procedure NowyDep(department_id number,department_name varchar2,manager_id number ,location_id number);
function LiczbaDepLok(lokalizacja number )return number ;
procedure infoDep(numer number) ;
procedure wyswietlDep(jak varchar2);
procedure UsunDep(numer number);


end depart_pa;





create or replace package body depart_pa is 
procedure wyswietl (lokalizacja number)is 
cursor kursor  is select department_id ,department_name from departamenty_antoniak where location_id =lokalizacja;
begin 
for wiersz in kursor loop
dbms_output.put_line(wiersz.department_id|| '  '||wiersz.department_name);
end loop;
end;

procedure NowyDep(department_id number,department_name varchar2,manager_id number ,location_id number)is 
begin
insert into departamenty_antoniak values(department_id,department_name,manager_id,location_id);
end;

function LiczbaDepLok(lokalizacja number )return number is 
suma number;
begin
 select count(1) into suma from departamenty_antoniak where lokalizacja =location_id group by location_id;
 return suma;
end;

procedure infoDep(numer number) is 
departament departamenty_antoniak%rowtype;
begin
select * into departament from departamenty_antoniak where department_id =numer;
dbms_output.put_line(departament.department_id||' '||departament.department_name);

end;
procedure wyswietlDep(jak varchar2) is
cursor kursor is select * from departamenty_antoniak order by department_name asc;
cursor kursor1 is select * from departamenty_antoniak order by department_name desc;

begin
if jak ='rosnaco' then 
for wiersz in kursor loop
dbms_output.put_line(wiersz.department_id||' '||wiersz.department_name);
end loop;
elsif jak='malejaco' then
for wiersz in kursor1 loop
dbms_output.put_line(wiersz.department_id||' '||wiersz.department_name);
end loop;
end if;
end;

procedure UsunDep(numer number)is 
begin
delete from departamenty_antoniak  where numer=department_id;
end;



end depart_pa;

grant execute on   depart_pa to student12;



begin 
--depart_pa.wyswietl(1700);
--depart_pa.NowyDep(28,'Patrykowo',200,200);
--DBMS_OUTPUT.PUT_LINE(depart_pa.LiczbaDepLok(1700));
--depart_pa.infoDep(60);
--depart_pa.wyswietlDep('rosnaco');
depart_pa.UsunDep(28);

end;


set SERVEROUTPUT ON

--3
create table pracownicy as select * from hr.employees;



create or replace trigger nieWieksza before update of salary on pracownicy 
for each row
declare

begin

if zarobki(:old.employee_id)<= :new.salary then raise_application_error(-20001,'pensja wieksza od przelozonego');
end if;
end;



create or replace function zarobki(numer_pracownika in number)return number  is
zarobki_przelozonego number;
begin
select salary into zarobki_przelozonego from pracownicy 
where employee_id=(select manager_id from pracownicy where employee_id=numer_pracownika );
return zarobki_przelozonego;


end;


--test
update pracownicy set salary=25000 where employee_id=206;
select salary from pracownicy where employee_id =206;
--koniec
--4
create or replace trigger valid_date before update or insert   on pracownicy
for each row 
begin
if :new.hire_date <sysdate then raise_application_error(-20020,'nie mozna wstawic daty pozniejszej niz biezaca');
end if;

end;


--test
update pracownicy set hire_date =sysdate-300 where employee_id=110;
--






