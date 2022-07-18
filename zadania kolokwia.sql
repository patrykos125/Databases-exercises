
set SERVEROUTPUT ON;

--zad1

declare
liczba number :='&podaj_liczbe';
begin
if mod(liczba,7)=0 then dbms_output.put_line(liczba||' dzieli sie przez 7');
else dbms_output.put_line(liczba||' nie dzieli sie przez 7');
end if;
end;

--2
declare 
liczba number :='&podaj_liczbe';
begin
if liczba >0 then dbms_output.put_line(8*liczba-2);
else dbms_output.put_line(3*liczba+3);
end if;
end;

--3

declare 
litera CHAR:='&podaj_litere';
procent number :='&podaj_procent';

begin
if procent not BETWEEN 1 and 100 then raise_application_error(-20001,'podano nie prawidlowy procent');

end if;
update pracownicy set salary=salary +(salary*procent/100) where job_id like litera||'%';

EXCEPTION
when
no_data_found then dbms_output.put_line('nie znaleziono pracownika');
end;

--zad4

declare 
cursor kursor is select * from pracownicy order by salary desc;

begin
for wiersz in kursor loop
dbms_output.put_line(wiersz.first_name||' '||wiersz.last_name||' zarabia '||wiersz.salary);
if kursor%rowcount =7 then exit;
end if;
end loop;
end;

--5

declare
liczba number:='&podaj_liczbe';
counter integer:=0;
cursor kursor is select * from pracownicy where length(first_name)=liczba;
begin
for wiersz in kursor loop

dbms_output.put_line(wiersz.first_name);
delete from pracownicy where employee_id = wiersz.employee_id;
counter := counter +1;
end loop;
dbms_output.put_line('usunieto '||counter ||'wierszy');

end;

--part 2


--zad1
declare
cursor kursor is select * from pracownicy order by salary; 
begin
for wiersz in kursor loop
DBMS_OUTPUT.PUT_LINE(wiersz.first_name||' '||wiersz.last_name||' '||wiersz.hire_date);
if kursor%rowcount=5 then exit;
end if;
end loop;

end;

--zad2
declare
liczba number :='&podaj_liczbe';
begin
if liczba >0 then dbms_output.put_line(10*liczba -1);
else dbms_output.put_line(5*liczba+2);
end if;
end;

--3

declare 
dlugosc number:='&podaj_dlugosc';
counter integer :=0; 
cursor kursor is select * from pracownicy where length(last_name)=dlugosc;
begin
for wiersz in kursor loop
delete from pracownicy where wiersz.employee_id=employee_id;
counter := counter +1;
end loop;
dbms_output.put_line('usunieto'||counter);
end;

--4
declare
liczba integer:='&podaj_liczbe';
begin
if mod(liczba,5)=0 then dbms_output.put_line('liczba jest podzielna przez 5');
else dbms_output.put_line('liczba nie jest podzielna przez 5');
end if;

end;

--5
declare
litera char :='&podaj_pierwsza_litere';
procent integer :='&podaj_procent';
cursor kursor is select * from pracownicy where job_id like litera ||'%';
begin
if procent not between 1 and 100 then raise_application_error(-20001,'procent nie miesci sie w zakresie');
end if;
for wiersz in kursor loop

update pracownicy set salary=salary + (salary*procent/100) where wiersz.employee_id=employee_id;
end loop;
exception
when no_data_found then dbms_output.put_line('nie znaleziono pracownicka');


end;






































































