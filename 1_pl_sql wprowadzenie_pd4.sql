--3
declare 
v_r number:=&podaj_promien;
c_pi constant number:= 3.1413;
begin
DBMS_OUTPUT.PUT_LINE('pole kola wynosi '||round(c_pi*(v_r*v_r),2)||' obwod kola wynosi '||round((2*c_pi*v_r),2));
end;

--6

declare 
v_x number:=&podaj_liczbe;

begin
    if mod(round(v_x),2)=0 then dbms_output.put_line((2*v_x)-1);

    ELSE dbms_output.put_line((3*v_x)-1);
    end if;

end;



--7
DECLARE
tekst string(30) := '&podaj_tekst_do_sprawdzenia';
bufor string(30);
odwrocony string(30);

BEGIN

tekst:=REPLACE(tekst,' ');
tekst:=UPPER(tekst);

FOR i IN REVERSE 1..Length(tekst) 
LOOP
    bufor:=Substr(tekst,i,1);
    odwrocony:=odwrocony||''||bufor;
END LOOP;

IF tekst = odwrocony THEN
dbms_output.put_line('Tekst jest palindromem');
ELSE
dbms_output.put_line('Tekst nie jest palindromem');
END IF;

END;

--8

DECLARE
liczba number(10) :='&x';
suma number(15):=0;
pom number(15) := liczba;
BEGIN

IF liczba-round(liczba)=0 THEN

    while pom>0 LOOP
    
        suma:=suma+MOD(pom,10);
        pom:=trunc(pom/10);
    END LOOP;


            IF liczba>0 AND MOD(liczba,suma)=0 THEN
        dbms_output.put_line('Liczba jest naturalna oraz dzieli sie przez sume swoich cyfr');
        ELSE
        dbms_output.put_line('Liczba nie jest naturalna lub nie dzieli sie przez sume swoich cyfr');
    END IF;
END IF;


END;

--9
DECLARE
nazwa_departamentu hr.departments.department_name%type;
ilosc_pracownikow number(10);
BEGIN
select * INTO nazwa_departamentu, ilosc_pracownikow from (select d.department_name nazwa, count(e.employee_id) ile from HR.employees e join hr.departments d on e.department_id=d.department_id group by d.department_name order by ile DESC) where rownum=1;

dbms_output.put_line('Najwiecej pracownikow pracuje w dziale '||nazwa_departamentu||'. Ich liczba wynosi '||ilosc_pracownikow);
END;

--10
DECLARE
    v_pracownik hr.employees%rowtype;
BEGIN
select * into v_pracownik from HR.employees where hire_date=(select min(hire_date) from hr.employees);

dbms_output.put_line('Najwczesniej zatrudniony jest '||v_pracownik.first_name||' '||v_pracownik.last_name||'. Zostal zatrudniony '||v_pracownik.hire_date);

END;















