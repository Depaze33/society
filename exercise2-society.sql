/*--Clé étrangère c'est l'id qui pointe vers quelqu'un d'autre--*/

/* JOINTURE LEFT/RIGHT
ramener ellement pas dans la jointure
CONNEXION PAR CLE ETRANGERE PAS PRESENTE
right recupere ce qui est a droite*/

/*WHERE permet de filtrer close de restriction --mettre en dernier--*/
/*IN si dans la liste*/
/* = strictement =*/
/* Commencer avec étoile*/
/*Contrainte d'integrité = regle qui va forcer une donnée dans la base de donnnée
null/notnull
clée etrangère fait refernece a clé primaire*/

/* AVG (moyenne), MIN (minimum), MAX (maximum), SUM (somme), COUNT (dénombrement).*/

/*-----------------------------------------------------------------------------*/

/*1*/
select * from employee e 
join department d 
on e.department_id = d.id;

/*2*/
select d.id, 
d.name, 
e.last_name 
from department d
JOIN employee e ON d.id = e.department_id
order by d.id;
/*3*/
select e.last_name as "name", d.id as department number , d.name as "department name"
from employee e 
join department d on e.department_id = d.id
where d.name = 'distribution';

/*4*/
e1.last_name  as "name employee", e1.salary  as "employee salary",
e2.last_name as "name superior", e2.salary as "superior salary" 
from employee e1
join employee e2
on e1.superior_id = e2.id 
where e1.salary > e2.salary;

/*5*/
select *
from employee e
where department_id in 
(select id from department where name like 'finance');

/*6*/
select last_name, salary, department_id 
from employee e
where salary >
any (select salary from employee where department_id = 31)
and department_id != 31;

/*7*/
select last_name, salary, department_id
from employee
where salary > (SELECT MAX(salary) FROM employee WHERE department_id = 31)
order by department_id, salary
/*8*/
select last_name, salary, department_id
from employee
where salary > (SELECT MAX(salary) FROM employee WHERE department_id = 31)
order by department_id, salary;

/*9*/
select last_name, title, department_id 
from employee 
where department_id != 31
and title
in (select title from employee where department_id = 32);

/*10*/
select last_name, title, department_id 
from employee 
where department_id != 31
and title
 not in (select title from employee where department_id = 32);

 /*11*/
select last_name, title, salary 
from employee 
where salary 
= (select salary from employee where last_name = 'fairent')
and last_name != 'fairent'
and title 
= (select title from employee where last_name = 'fairent');

/*12*/
select d.id, d.name, e.last_name
from department d left join employee e on 
d.id = e.department_id;

/*13*/
select AVG(salary) 
from employee 
where title like 'secrétaire';

/*14*/
select title, count (*) as total_employee
from employee 
group by title; 

/*15*/
select avg(salary) 
from employee 
group by department_id; 

/*16*/
select department_id , count(last_name)
from employee 
group by department_id
having count (*) = 3;

/*17*/
select substring(last_name, 1,1) as first_letter, count(last_name)
from employee e 
group by first_letter 
order by first_letter asc

/*18*/
select  id, min(salary) as min_salary 
from employee e
group by id


/*19*/
select count( distinct title) as number_title
from employee e 
group by title;

/*20*/


/*21*/
select max(department_id) title
from employee 
group by department_id, title 
order by department_id 

/*22*/
select title, avg(salary) as moy_salary
from employee 
group by title
having avg(salary) > (select avg(salary)
from employee e 
group by title 
having title like 'représentant')