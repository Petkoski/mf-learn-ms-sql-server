USE FudgemartPracticingDB

/*
Stored procedures and business logic encapsulation
	- CREATE
	- EXECUTE
*/

--Their main use is to take complicated database logic and make it easier to 
--execute.


--Part I:
--{{ Lab9b.sql }}


--Part II: Running (executing) a procedure:
EXECUTE dbo.p_give_employee_raise 33, 0.50

--Or:
EXEC dbo.p_give_employee_raise 33, 0.50
--Output: The raise occured for employee name: Michael Fudge

EXEC dbo.p_give_employee_raise 333, 0.50
--Output: The raise did not occur, no employee with id=333


--Part III:
DECLARE @empid int;
SET @empid = (SELECT employee_id 
				FROM fudgemart_employees
				WHERE employee_lastname='Fudge'
					AND employee_firstname='Michael')
EXEC p_give_employee_raise @empid, 0.50


--Part IV: Rewriting it to take names (first & last) as input params:
--{{ Lab9c.sql }}
EXEC p_give_employee_raise_by_name 'Fudge', 'Michael', 1.00
EXEC p_give_employee_raise_by_name 'Petkoski', 'Jovan', 1.00