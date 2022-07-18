


set serveroutput on ;

--3
create or replace FUNCTION Staz (rok in date) return number as 
begin
return floor((sysdate -rok)/365);
end;

begin 
dbms_output.put_line(Staz('1999-03-30'));
end;

--4

create or replace function Silnia (n in number )return number as 
suma number :=1;
BEGIN
for i in 1..n loop

suma := suma*i; 

end loop;
RETURN suma;
end;

begin
dbms_output.put_line(Silnia(5));
end;

--5

create or replace procedure podwyzka_ant (wydzial in number,procent in number DEFAULT 15) is
begin
update pracownicy set salary =salary +( salary *procent)/100 where department_id=wydzial;
if SQL%rowcount=0 then dbms_output.put_line('nie znaleziono podanego departamentu');
end if;
end;


begin 
podwyzka_ant(700909);
end;


update pracownicy set salary=1000 where employee_id=204;

select * from pracownicy where employee_id=204;



--6


create or replace function funkcjazad6 (x in number)return number is 
begin
if x>0 AND x<5 then return  3*x-2;
else return 5*x+1;
end if;
end;



begin
dbms_output.put_line(funkcjazad6(5));
end;









