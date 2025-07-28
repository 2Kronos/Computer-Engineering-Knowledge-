
# **Database Normalization: Department of Electrical, Electronic and Computer Engineering**

## Scenario

At the Department of Electrical, Electronic and Computer Engineering, we have a number of undergraduate qualifications that students can pursue. A student can enroll for one qualification at a time.

---

##  a) Unnormalized Table (10 marks)

|Student_ID|Student_Name|Qualification|Course_Codes|Course_Names|
|---|---|---|---|---|
|2221709700|Kenny Bitumba|BEng Electrical|EEE1001,EEE1002,EEE2001|Circuits,Digital Systems,Power|
|2221709701|Guy Kalonji|BEng Electronic|ECE1001,ECE1002,ECE2001|Electronics,Circuit Analysis,Microelectronics|
|2221709702|Arton Mulumba|BEng Computer|CSE1001,CSE1002|Programming,Data Structures|
|2221709703|Benedict Illunga|BEng Electrical|EEE1001,EEE1002|Circuits,Digital Systems|

This table has problems because it puts multiple values in single cells (like having many courses in one cell). This makes it hard to search and update the data properly.

---

##  b) First Normal Form (1NF) - 10 marks

|Student_ID|Student_Name|Qualification|Course_Code|Course_Name|
|---|---|---|---|---|
|2221709700|Kenny Bitumba|BEng Electrical|EEE1001|Circuits|
|2221709700|Kenny Bitumba|BEng Electrical|EEE1002|Digital Systems|
|2221709700|Kenny Bitumba|BEng Electrical|EEE2001|Power|
|2221709701|Guy Kalonji|BEng Electronic|ECE1001|Electronics|
|2221709701|Guy Kalonji|BEng Electronic|ECE1002|Circuit Analysis|
|2221709701|Guy Kalonji|BEng Electronic|ECE2001|Microelectronics|
|2221709702|Arton Mulumba|BEng Computer|CSE1001|Programming|
|2221709702|Arton Mulumba|BEng Computer|CSE1002|Data Structures|
|2221709703|Benedict Illunga|BEng Electrical|EEE1001|Circuits|
|2221709703|Benedict Illunga|BEng Electrical|EEE1002|Digital Systems|

In 1NF, each cell now contains only one value instead of multiple values separated by commas. This makes the data easier to work with, but we still have lots of repeated information like student details appearing many times.

---

##  c) Second Normal Form (2NF) - 15 marks

**Students Table:**

|Student_ID|Student_Name|Qualification|
|---|---|---|
|2221709700|Kenny Bitumba|BEng Electrical|
|2221709701|Guy Kalonji|BEng Electronic|
|2221709702|Arton Mulumba|BEng Computer|
|2221709703|Benedict Illunga|BEng Electrical|

**Courses Table:**

|Course_Code|Course_Name|
|---|---|
|EEE1001|Circuits|
|EEE1002|Digital Systems|
|EEE2001|Power|
|ECE1001|Electronics|
|ECE1002|Circuit Analysis|
|ECE2001|Microelectronics|
|CSE1001|Programming|
|CSE1002|Data Structures|

**Enrollment Table:**

|Student_ID|Course_Code|
|---|---|
|2221709700|EEE1001|
|2221709700|EEE1002|
|2221709700|EEE2001|
|2221709701|ECE1001|
|2221709701|ECE1002|
|2221709701|ECE2001|
|2221709702|CSE1001|
|2221709702|CSE1002|
|2221709703|EEE1001|
|2221709703|EEE1002|

In 2NF, we split the big table into smaller tables. Student information goes in one table, course information in another, and we have a simple table showing which students take which courses. This removes most of the repeated data.

---

## d) Third Normal Form (3NF) - 15 marks

**Students Table:**

|Student_ID|Student_Name|Qualification_Code|
|---|---|---|
|2221709700|Kenny Bitumba|BENG_EE|
|2221709701|Guy Kalonji|BENG_ECE|
|2221709702|Arton Mulumba|BENG_CE|
|2221709703|Benedict Illunga|BENG_EE|

**Qualifications Table:**

|Qualification_Code|Qualification_Name|
|---|---|
|BENG_EE|BEng Electrical|
|BENG_ECE|BEng Electronic|
|BENG_CE|BEng Computer|

**Courses Table:**

|Course_Code|Course_Name|
|---|---|
|EEE1001|Circuits|
|EEE1002|Digital Systems|
|EEE2001|Power|
|ECE1001|Electronics|
|ECE1002|Circuit Analysis|
|ECE2001|Microelectronics|
|CSE1001|Programming|
|CSE1002|Data Structures|

**Enrollment Table:**

|Student_ID|Course_Code|
|---|---|
|2221709700|EEE1001|
|2221709700|EEE1002|
|2221709700|EEE2001|
|2221709701|ECE1001|
|2221709701|ECE1002|
|2221709701|ECE2001|
|2221709702|CSE1001|
|2221709702|CSE1002|
|2221709703|EEE1001|
|2221709703|EEE1002|

In 3NF, we separated the qualifications and departments into their own tables. Now each piece of information is stored only once, which saves space and makes updates easier. For example, if the department head changes, we only need to update one place instead of many rows.
