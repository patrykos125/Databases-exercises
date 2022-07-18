drop table pracownicy_antoniak;
create table pracownicy_antoniak as select employee_id,first_name,last_name,hire_date,salary,job_id,department_id from HR.employees ;
set SERVEROUTPUT ON;


create or replace package Kadry is
procedure NowyPracownik(employee_id in number,first_name in varchar2,last_name in varchar2,hire_date in date,salary in number,job_id in number,department_id in number);
function PracDep (id_departamentu in number) return number ;
function LiczbaPracStanow (stanowisko in varchar2) return number ;
function LiczbaPracRokZatr (rok in number) return number;
FUNCTION LiczbaLatPracy(prac_id IN NUMBER) RETURN NUMBER;
PROCEDURE InfoPrac(prac_id IN NUMBER);
PROCEDURE UsunPrac(prac_id IN NUMBER);


end Kadry;


create or replace package body Kadry is 
procedure NowyPracownik (employee_id in number,first_name in varchar2,last_name in varchar2,hire_date in date,salary in number,job_id in number,department_id in number) is  


begin
insert into pracownicy_antoniak values(employee_id,first_name,last_name,hire_date,salary,job_id,department_id);
end NowyPracownik;



function PracDep (id_departamentu in number) return number is
cursor kursor is select count (1 )as liczba from pracownicy_antoniak where department_id =id_departamentu;
begin 
for wiersz in kursor loop
return wiersz.liczba;
end loop;
end PracDep;


function LiczbaPracStanow (stanowisko in varchar2) return number is
liczba number;
begin
select count (1) into liczba from pracownicy_antoniak where stanowisko=job_id group by job_id;
return liczba;
end LiczbaPracStanow;



function LiczbaPracRokZatr (rok in number) return number is
wynik number:=0;
cursor kursor is select * from pracownicy_antoniak;
begin
for wiersz in kursor loop

if to_char(wiersz.hire_date,'yyyy')=rok then wynik :=wynik +1;
end if;

end loop;
return wynik;
end LiczbaPracRokZatr;


FUNCTION LiczbaLatPracy(prac_id IN NUMBER) RETURN NUMBER IS
v_data date;
ile NUMBER;
BEGIN
select hire_date into v_data from pracownicy_antoniak where employee_id = prac_id;
select EXTRACT(YEAR FROM sysdate) - EXTRACT(YEAR FROM v_data) into ile FROM dual;
RETURN ile;
END LiczbaLatPracy;

PROCEDURE InfoPrac(prac_id IN NUMBER) IS
v_prac pracownicy_antoniak%rowtype;
BEGIN
select * into v_prac from pracownicy_antoniak where employee_id=prac_id;
dbms_output.put_line(v_prac.first_name||' '||v_prac.last_name||' '||v_prac.hire_date||' '||v_prac.salary||' '||v_prac.job_id||' '||v_prac.department_id);
END InfoPrac;

PROCEDURE UsunPrac(prac_id IN NUMBER) IS
BEGIN
DELETE FROM pracownicy_antoniak where employee_id=prac_id;
END UsunPrac;


end Kadry;


begin 
kadry.nowypracownik(1,'patyy','antoniak',sysdate,10000,15,30);
end;

begin 
DBMS_OUTPUT.PUT_LINE(kadry.pracdep(60));
end;

begin 
DBMS_OUTPUT.PUT_LINE(kadry.liczbapracstanow('FI_ACCOUNT'));
end;

begin 
DBMS_OUTPUT.PUT_LINE(kadry.liczbapracrokzatr('2004'));
end;

begin 
DBMS_OUTPUT.PUT_LINE(kadry.liczbalatpracy(110));
end;

begin 
kadry.infoprac(110);
end;

begin
kadry.usunprac(110);
end;



commit;
