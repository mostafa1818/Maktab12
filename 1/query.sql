--      select   c.id,c.Name_firstname,c.Name_lastname,max(sc.salary)  as m
--            from  
--            salaryofcoach sc  join coach c
--            on sc.id=c.id 
--         group by c.id
--              order by m desc
--              limit 1;
--            
           
           
           


  

--   /*********************/

           
               
            select (select p.Name_firstname  from player p where id =s1.id) firstname,
            (select p.Name_lastname  from player p where id =s1.id) lastname,s1.season,s1.salary
            from 
           (  select   sp.season,max(salary)  as m
                 from salaryofplayer  sp      
                 group by season
                 order by salary) newsalary join salaryofplayer s1
                 on newsalary.season=s1.season and m=s1.salary
                 group by s1.season
                 order by s1.season
               ;
             
             
            

--   /*************************/

--        select c.name,count(*)
--                  from team t join city c on c.id=t.idcity
--                  group by t.idcity;
--         
--   /*************************/


          select team1id,(select t.name from team t where t.id=team1id) as team_name,sum(s1) as sum from 
                ( select m.team1id, sum( m.team1score ) as s1
                from matching m where m.season=1398
                group by m.team1id 
        		 union 
                select m.team2id, sum( m.team2score) as s2
          	    from matching m where m.season=1398
                group by m.team2id ) as sum
                group by team1id
                order by team1id asc
                 ;


-- -- /******************************/


               select team1id,(select t.name from team t where t.id=team1id) as team_name,sum(s1) as sum1 from 
              ( select m.team1id, sum( m.team1score ) as s1
                from matching m where m.season=1398
                group by m.team1id 
      		  union 
                
                select m.team2id, sum( m.team2score) as s2
        	      from matching m where m.season=1398
                group by m.team2id ) as sum
                group by team1id
                order by sum1 desc
                limit 1
              ;


-- /***********************************/



        select m2.*,count(*) as counting from matching m2 join goals g on m2.id=g. idofmatching where m2.id in 
         ( select m.id  from matching m join team t1 join team t2 on m.team1id=t1.id and m.team2id=t2.id
          where t1.idcity=t2.idcity and m.season=1398)
          group by g.idofmatching
          order by counting desc
          limit 1;
          
 