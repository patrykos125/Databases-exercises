
--2
declare
cursor top_five_earners is select first_name ,last_name ,salary from hr.employees order by salary desc;

begin
for prac in top_five_earners loop
DBMS_OUTPUT.PUT_line(prac.first_name||' '||prac.last_name||' zarabia '||prac.salary);
if top_five_earners%rowcount>4 then exit ;
end if;
end loop;
null;
end;

--3
declare 
potega integer:='&podaj_potege';
wynik number:=1;
begin 
for i in 1..potega loop
wynik :=wynik *3;
end loop;
dbms_output.put_line('wynik 3 do potegi '||potega||' wynosi '||wynik);
end;

--5
declare

cursor first_char_in_last_name  is select * from hr.employees where last_name like '&litera%';
begin
for wiersz in first_char_in_last_name loop
dbms_output.put_line(wiersz.first_name||' '||wiersz.last_name);
end loop;

end;

--8
DECLARE
    ilosc_znalezionych NUMBER(3);
    CURSOR cur_prac is
    select employee_id, first_name, last_name, department_name, job_id from hr.employees e 
    join hr.departments d on e.department_id=d.department_id 
    where hire_date<'2000/01/01';
    
BEGIN
   
    FOR v_prac in cur_prac
    LOOP
    ilosc_znalezionych:=cur_prac%rowcount;
    DBMS_OUTPUT.PUT_LINE(v_prac.employee_id||' '||v_prac.first_name||' '||v_prac.last_name||' '||v_prac.department_name||' '||v_prac.job_id);
    
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Znaleziono '||ilosc_znalezionych||' pracowników do usuniêcia');

    DELETE FROM HR.employees where hire_date<'2000/01/01';
END;

--9

declare 
departament departamenty_Antoniak.department_name%type:='&podaj_departament';
cursor kursor(dep departamenty_Antoniak.department_name%type) is select * from departamenty_antoniak join pracownicy_antoniak using(department_id) where department_name=dep;
begin 
for wiersz in kursor(departament) loop
update pracownicy_antoniak set salary=salary*1.15 where employee_id=wiersz.employee_id;

end loop;
end;

--10




begin

for i in 1..9 loop

    for j in 1..9 loop
    if i!=j then DBMS_OUTPUT.PUT_LINE(i||j);
    end if;
     end loop;

end loop;


end;















