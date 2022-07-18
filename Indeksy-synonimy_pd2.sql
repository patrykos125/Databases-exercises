--3
create index prac_antoniak_index on pracownicy_antoniak(first_name,last_name);
--6
create bitmap index prac_premia_antoniak on pracownicy_antoniak(commission_pct);
--commission_pct zawiera wartosci null
--7
create index hire_date_antoniak_index on pracownicy_antoniak(hire_date);
--hire date zawiera wartosci raczej unikalne
--8
create index prac_upper_antoniak_ind on pracownicy_antoniak(upper(last_name));

insert into pracownicy_antoniak values('','Patryk','Antoniak','patryk@wp.pl','123.123.123','22/06/17','PREZES','12000','','','90');

--9
create bitmap index prac_stan_antoniak_index on pracownicy_antoniak(job_id);
--job_id zawiera wartosci powtarzajace sie malo zró¿nicowane

--14
--zad2
create index prac_placa on pracownicy_antoniak(salary);
alter index prac_placa rename to prac_patryk_antoniak_index;

--15
drop index prac_antoniak_index;

--16
select * from user_indexes where index_name like('PRAC_%');
drop index PRAC_IMIE_IND ;
drop index PRAC_PATRYK_ANTONIAK_INDEX;
