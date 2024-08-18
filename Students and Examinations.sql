/*Table: Students

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+
student_id is the primary key (column with unique values) for this table.
Each row of this table contains the ID and the name of one student in the school.
 

Table: Subjects

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| subject_name | varchar |
+--------------+---------+
subject_name is the primary key (column with unique values) for this table.
Each row of this table contains the name of one subject in the school.
 

Table: Examinations

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| student_id   | int     |
| subject_name | varchar |
+--------------+---------+
There is no primary key (column with unique values) for this table. It may contain duplicates.
Each student from the Students table takes every course from the Subjects table.
Each row of this table indicates that a student with ID student_id attended the exam of subject_name.
 

Write a solution to find the number of times each student attended each exam.

Return the result table ordered by student_id and subject_name.*/

SELECT S.STUDENT_ID,S.STUDENT_NAME, S1.SUBJECT_NAME, COUNT(E.SUBJECT_NAME) AS 'attended_exams'
From students s
cross join subjects s1
LEFT JOIN EXAMINATIONS E
ON S.STUDENT_ID = E.STUDENT_ID AND S1.SUBJECT_NAME = E.SUBJECT_NAME
GROUP BY S.STUDENT_ID , S.STUDENT_NAME, S1.SUBJECT_NAME
ORDER BY S.STUDENT_ID , S1.SUBJECT_NAME
