#取得平均薪水最高的公司
#输出公司名称和平均薪水：companyName avgSalary

select c.companyName, table1.avgsal
from (
         select companyId, avg(salary) as avgsal
         from Employee group by companyId
     ) table1
join Company c
on table1.companyId = c.id;

 +-------------+-----------+
 | companyName | avgsal    |
 +-------------+-----------+
 | 'baidu'     | 5000.0000 |
 | 'alibaba'   | 6500.0000 |
 | 'tengxun'   | 8000.0000 |
 +-------------+-----------+