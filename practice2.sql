# 取得每个company中最高薪水的人员名字
# 输出结果包含公司名称和人员名称：companyName name
select table1.companyName, table1.name from
    (select e.name, e.companyId, e.salary,c.companyName
     from Employee e
              left join Company c on e.companyId = c.id) table1
right join (
     select companyId, max(salary) as maxsal
     from Employee group by companyId) table2
on table2.maxsal = table1.salary
and table1.companyId = table2.companyId;

 +-------------+------------+
 | companyName | name       |
 +-------------+------------+
 | 'baidu'     | 'xiaoming' |
 | 'alibaba'   | 'xiaohong' |
 | 'tengxun'   | 'xiaozhi'  |
 +-------------+------------+