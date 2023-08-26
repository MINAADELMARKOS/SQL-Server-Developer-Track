USE ITI2;

SELECT *,
       LEN(ST_FNAME) AS LEN_NAME
FROM students

-- CHARINDEX()
-- CHARINDEX (expression_to_find, expression_to_search [, start_location])
-- >> LOOKS for a chracter expression in a given string.
-- >> Return its strating position.

SELECT
CHARINDEX('chocolate','White chocolate is not real chocolate'),
CHARINDEX('W','White chocolate is not real chocolate'),
CHARINDEX('chocolate','White chocolate is not real chocolate',10),
CHARINDEX('chocolates','White chocolate is not real chocolate');


-- PATINDEX()
-- PATINDEX ('%pattern%', expression_to_search [, start_location])
-- >> LIKE CHARINDEX().
-- >> Return THE Strating Position of a pattern in an expression.

SELECT
PATINDEX('%chocolate%','White chocolate is not real chocolate') AS position1,
PATINDEX('%ch_c%','White chocolate is not real chocolate') AS position2;

-- ==>> CONCAT() and CONCAT_WS()
-- CONCAT(string1, string2 [, stringN ])
-- CONCAT_WS(separator, string1, string2 [, stringN ])
SELECT
CONCAT('Apples','and','oranges') AS result_concat,
CONCAT_WS(' ','Apples','and','oranges') AS result_concat_ws,
CONCAT_WS('***','Apples','and','oranges') AS result_concat_ws2;

-- ==>> STRING_AGG()
-- STRING_AGG(expression, separator) [ <order_clause> ]
-- Concatenates the values of string expressions and places separator values between them.
SELECT
STRING_AGG(st_fname,',') AS list_of_names
FROM students;

SELECT 
      STRING_AGG(CONCAT(St_Fname,' ', St_Lname,'(', St_Address,')'), CHAR(10)) AS list_of_names
FROM students;


SELECT Dept_Id,
       STRING_AGG(st_fname,',') AS list_of_names
FROM students
GROUP BY Dept_Id;



SELECT Dept_Id,
      STRING_AGG(CONCAT(St_Fname,' ', St_Lname,'(', St_Address,')'), CHAR(10)) AS list_of_names
FROM students
GROUP BY Dept_Id;

-- STRING_SPLIT()
-- ==> STRING_SPLIT(string, separator)
-- Divides a string into smaller pieces, based on a separator.
-- Returns a single column table.

SELECT *
FROM STRING_SPLIT('1,2,3,4',',')

-- Mask the last two digits of the year
-- Mask the year part from the birthdate column, by replacing the last two digits with "XX" (1986-03-26 becomes 19XX-03-26).
declare @birthdate date = '1986-03-26'

select
REPLACE(@birthdate, SUBSTRING(CAST(@birthdate AS varchar), 3, 2), 'XX') AS birthdate;