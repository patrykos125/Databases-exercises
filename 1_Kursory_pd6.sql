--5
declare
stanowisko hr.employees.job_id%type:='&podaj_stanowisko';
cursor kursor(stan  varchar2 ) is select * from hr.employees where job_id =stan;
begin 
for wiersz in kursor(stanowisko) loop
if(wiersz.commission_pct is not null) then dbms_output.put_line('Pracownik '||wiersz.first_name||' '||wiersz.last_name||' posiada premie w wysokosci'|| wiersz.commission_pct );
else dbms_output.put_line('Pracownik '||wiersz.first_name||' '||wiersz.last_name||'nie posiada premij');
end if;
end loop;
end;
set SERVEROUTPUT on;

--6

declare
stanowisko hr.employees.job_id%type:='&podaj_stanowisko';
begin 
update pracownicy set salary=salary + salary*0.05 where job_id=stanowisko;

EXCEPTION
when
no_data_found then  dbms_output.put_line('nie znaleziono stanowiska');
end;

--7

declare
kwartal char:='&podaj_kwartal';
cursor kursor(liczba number) is select job_id ,count(job_id) suma from hr.employees where TO_char(hire_date ,'Q')=liczba group by job_id; 
begin 
if to_number(kwartal) not BETWEEN 1 and 4 then raise_application_error (-20010,'nie poprawny kwartal');
end if;
for wiersz in kursor(kwartal) loop

dbms_output.put_line(wiersz.job_id||' '||wiersz.suma);
end loop;
EXCEPTION when
no_data_found then dbms_output.put_line('nie znaleziono danych');
end;


 --8
 declare
 counter integer :=0;
 cursor kursor is select department_name ,avg(salary)as  avg_salary from hr.employees join hr.departments using(department_id) group by department_name;
 begin 
 for wiersz in kursor loop

 if wiersz.avg_salary >20000 then dbms_output.put_line(wiersz.department_name);counter:=1;
 end if;
 end loop;
if(counter=0)then raise_application_error(-20100,'nie znaleziono depatamentów w których zarobki przekraczaja 20k');
 end if;
 end;
 set SERVEROUTPUT ON;
 
 
 
 
 
 
 
 
 