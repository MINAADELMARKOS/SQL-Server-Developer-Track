SELECT *, 
       MAX(St_Age) over(partition by dept_id order by St_Age desc) as max_age
FROM students


SELECT *, 
       MAX(St_Age) over(partition by dept_id order by dept_id desc) as max_age
FROM students


SELECT *, 
       first_value(St_Age) over(partition by dept_id order by dept_id desc) as first_age,
	   last_value(St_Age) over(partition by dept_id order by dept_id desc) as last_age,
	   lead(St_Age) over(partition by dept_id order by dept_id desc) as last_age,
	   lag(St_Age) over(partition by dept_id order by dept_id desc) as last_age
FROM students

select * ,
      isnull(St_Address,'N/A'),
	  coalesce(St_Address,'ff')
from students
