  select * 
  from employee where dno in
  (select d.Dnumber from employee e2 join department d  on e2.dno = d.Dnumber where e2.salary in 
  ( select max(e1.salary) from employee e1));

/***********************/

  select e.dno, count(*) number_of_employees,(select d.dname from department d where d.Dnumber = e.dno) 'name of department'
  from employee e
  group by e.dno
  order by number_of_employees desc limit 1;

/***********************/

  select * from employee where ssn not in               
  (select e1.ssn from employee as e1 join  employee as e2 where e2.Super_ssn=e1.ssn);

/***********************/

   select * from department d join employee e on d.mgr_ssn = e.Ssn; 

/***********************/

  select e.fname,e.lname,count(*) as number_of_p                  
  from project p 
  join works_on w 
  join employee e               
  on  p.Pnumber = w.pno and w.essn = e.ssn                 
  group by w.Essn
  order by number_of_p desc limit 1;
  
/**********************/

select e.fname,e.lname,count(*) as number_of_p                  
from project p 
join works_on w 
join employee e               
on  p.Pnumber = w.pno and w.essn = e.ssn                 
group by w.Essn
order by number_of_p desc 
