/*1*/
select *
from department d 

/*2*/
select last_name as "nom", hiring_date, superior_id, department_id, salary
from employee e;

/*3*/
select  title
from employee e;

/*4*/
select distinct title
from employee e;

/*5*/
select *
from employee
where salary > 25000;

/*6*/
select last_name, id, department_id
from employee
where title = 'secrétaire';

/*7*/
select name, id
from department d 
where id>40;

/*8*/
select last_name, first_name
from employee 
where last_name < first_name;

/*9*/
select last_name, salary, department_id 
from employee 
where title = 'représentant'
and department_id = 35 
and salary >20000;

/*10*/
select last_name, title, salary 
from employee 
where title like 'représentant' 
or title like 'président'


/*11*/
select title, department_id, salary 
from employee 
where  department_id = 34
and (title like 'représentant' 
or title like 'secrétaire');

/*12*/
select title, department_id, salary 
from employee 
where title like 'représentant' 
or (title like 'secrétaire' and department_id= 34);

/*13*/
select last_name, salary 
from employee 
where salary >20000 and salary < 30000;

/*14*/
select last_name as first_letter
from employee 
where last_name like 'h%'
or last_name like 'H%'

/*15*/
select last_name as first_letter
from employee 
where last_name like '%n'

/*16*/
select last_name as first_letter
from employee 
where last_name like '__u%';

/*17*/
select salary, last_name
from employee 
where department_id = 41
order by salary asc;

/*18*/
select salary, last_name
from employee 
where department_id = 41
order by salary desc;

/*19*/
select title,last_name, salary
from employee 
order by title asc, salary desc;

/*20 a reverifier */
select commission_rate null, salary, last_name 
from employee 
order by commission_rate asc;

/*21*/
select last_name, salary, commission_rate  
from employee 
where commission_rate is null;

/*22*/
select last_name, salary, commission_rate  
from employee e 
where commission_rate is not null;

/*23*/
select last_name, salary, commission_rate, title
from employee e 
where commission_rate  < 15;

/*24*/
select last_name, salary, commission_rate, title
from employee e 
where commission_rate > 15;

/*25*/
select last_name, salary, commission_rate,
(commission_rate*salary/100) as commision
from employee e 
where commission_rate is not null;

/*26*/
select last_name, salary, commission_rate,
(commission_rate*salary/100) as commision
from employee e 
where commission_rate is not null
order by commission_rate asc;

/*27*/
select concat(last_name,' ', first_name) as complete_name
from employee e ;

/*28*/
select SUBSTRING(last_name ,  1,  5)
from employee e ;

/*29*/
select position('r' in last_name), last_name 
from employee e;

/*30*/
select last_name, upper(last_name), lower(first_name) 
from employee e
where last_name = 'vrante';

/*31*/
select last_name, LENGTH(last_name)  
from employee e


