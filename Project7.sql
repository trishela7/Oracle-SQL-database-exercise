SELECT 5, 2.5, -0.12345678E+01, 'Patricia Shatz' from dual;
SELECT 'Your first and last names' from dual;

--Arithmetic expressions with whole numbers.  This is a one line comment.
SELECT 2*5, 2/5, 5+2, 5-2 from dual;

--Arithmetic expressions with fixed-point numbers
SELECT 2.3*4.5, 6.7/8.9, 2.4+3.5, 1.7-2.6 from dual;

--Arithmetic expression (a multiplication) with floating-point numbers
SELECT -1.234E+001 * -2.345E+002 from dual;

--Date expressions
SELECT sysdate, sysdate - 2, sysdate + 7, sysdate + 10000, sysdate + 0.75,
  sysdate + 1/24
  from dual;

/* The following command with a string expression uses the concatenation operator 
(two pipelines above the backslash on your keyboard, ||) to bring three strings 
together (concatenate pieces of words and other strings of characters) to form 
one longer string.  The middle string (' ') is a blank surrounded by two 
single-quote marks. This is a string expression.  Use your first and last names. 
*/

SELECT 'Patricia' || ' ' || 'Shatz' from dual;

/* So that we can keep this series of commands separated from the earlier ones, 
add this as an executable command: */

SELECT 'I am in the SQL Developer GUI' from dual;

DROP TABLE SAP_TestSQL;


CREATE TABLE SAP_TestSQL
  (C1        char,
   LASTNAME  varchar2(25),
   FIRSTNAME varchar2(25),
   DATETODAY date,
   CONSTRAINT PK_SAP_TestSQL PRIMARY KEY (C1));

INSERT INTO SAP_TestSQL
  (C1, LASTNAME, FIRSTNAME, DATETODAY)
  values
  ('A', 'Last', 'First', sysdate);

/* The time in the following date is midnight for 1-MAY-2017 (the beginning 
of the day 1 May 2017) */

INSERT INTO SAP_TestSQL
  (C1, LASTNAME, FIRSTNAME, DATETODAY)
  values
  ('B', 'Shatz', 'Patricia', '1 May 2017');

/* The following allows you to explicitly enter a time rather than accepting 
midnight */

INSERT INTO SAP_TestSQL
  (C1, LASTNAME, FIRSTNAME, DATETODAY)
  values
  ('C','Last', 'First', TO_DATE('1-MAY-2017 7:12:34 PM', 
   'DD-MON-YYYY HH:MI:SS AM'));

/* Select the data from your table by typing and executing the following:
  The asterisk denotes that you’re selecting all columns. */

SELECT * FROM SAP_TestSQL;

SELECT C1, LASTNAME, FIRSTNAME, TO_CHAR(DATETODAY, 'DD Month YYYY HH:MI:SS AM')
   FROM SAP_TestSQL;
   
   --Update one row to make the date correspond to tomorrow (actually tonight 
   --at midnight):

UPDATE SAP_TestSQL
   SET DATETODAY = DATETODAY + 1
   WHERE C1 = 'B';

SELECT * FROM SAP_TestSQL;

--Delete one row from your table:

DELETE FROM SAP_TestSQL
   WHERE C1 = 'B';
   
commit;  

   


