

### **Your Corrected Database Structure**

1. **Student Table**  
   - `Student_ID` (PK)  
   - `First_Name`  
   - `Last_Name`  
   - `Phone_Number`  
   - `Qualification_ID` (FK) *(links student to their qualification)*  

2. **Qualification Table**  
   - `Qualification_ID` (PK)  
   - `Name` (e.g., "BEng Tech in Computer Science")  
   - `Duration`  
   - `Year_Introduced`  
   - `Department`  

3. **Subject Table**  
   - `Subject_ID` (PK)  
   - `Name` (e.g., "Database Systems")  
   - `Code` (e.g., "CS101")  
   - `Credits`  
   - `Description`  

4. **Qualification_Subject (Junction Table)** *(Links qualifications to their required subjects)*  
   - `Qualification_ID` (FK)  
   - `Subject_ID` (FK)  
   - `Year_Recommended` (e.g., 1st, 2nd, 3rd year)  
   - `Is_Core` (True/False)  
   *(Composite PK: Qualification_ID + Subject_ID)*  

5. **Student_Subject (Junction Table)** *(Tracks which students take which subjects)*  
   - `Student_ID` (FK)  
   - `Subject_ID` (FK)  
   - `Enrollment_Date`  
   - `Grade`  
   - `Status`  
   *(Composite PK: Student_ID + Subject_ID)*  

---

### **How This Solves Your Problem**

1. **Qualification-Subject Relationship**  
   - The **Qualification_Subject** table defines which 10 subjects belong to each qualification  
   - Example:  
     ```
     Qualification_ID | Subject_ID
     ----------------------------
     1 (BEng Tech)    | CS101
     1 (BEng Tech)    | CS102
     ... (up to 10 subjects)
     ```
   - *This is entered ONCE per qualification, not per student!*

2. **Student-Subject Relationship**  
   - The **Student_Subject** table tracks actual enrollments  
   - A student automatically qualifies for their qualification's 10 subjects, but only enrolls when ready  

3. **No Redundancy**  
   - Subject details (name, credits) are stored once in the Subject table  
   - Qualification requirements are stored once in Qualification_Subject  
   - Actual enrollments are tracked separately in Student_Subject  

---

### **Key Benefits**
✅ **Single Source of Truth**: Each subject's details exist only once  
✅ **Flexibility**: Can add/remove subjects from qualifications without touching student records  
✅ **Tracking**: Can see which students completed which subjects  
✅ **Compliance**: Meets the "10 subjects per qualification" rule without duplication  

Would you like me to generate the SQL CREATE TABLE statements for this structure