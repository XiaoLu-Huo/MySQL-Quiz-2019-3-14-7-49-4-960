# 找出薪水在公司的平均薪水之上的人员名字
# 输出标准中包含Employee中所有字段和该employee所在公司名称以及该公司平均薪资：
# id | name | age | gender | companyId | salary | companyName | avgsal
select * from
    (select e.*, c.avgsal from
        (select employee.*, company.companyName
         from Employee employee
                  left join Company company
                            on employee.companyId = company.id) e
            left join (select companyId, avg(salary) as avgsal
                       from Employee
                       group by companyId) c
                      on e.companyId = c.companyId
    ) t
where t.salary >= t.avgsal

 +----+------------+-----+----------+-----------+--------+-------------+-----------+
 | id | name       | age | gender   | companyId | salary | companyName | avgsal    |
 +----+------------+-----+----------+-----------+--------+-------------+-----------+
 |  0 | 'xiaoming' |  20 | 'male'   |         0 |   6000 | 'baidu'     | 5000.0000 |
 |  1 | 'xiaohong' |  19 | 'female' |         1 |   7000 | 'alibaba'   | 6500.0000 |
 |  2 | 'xiaozhi'  |  15 | 'male'   |         2 |   8000 | 'tengxun'   | 8000.0000 |
 +----+------------+-----+----------+-----------+--------+-------------+-----------+