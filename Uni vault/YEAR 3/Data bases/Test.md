
```mermaid
erDiagram
    Staff {
        int staff_id PK
        string first_name
        string last_name
        string email
        string employee_type enum (Lecturer, Technician)
        date hire_date
    }

    Lecturer {
        int staff_id PK,FK
        string department
        string research_area
    }

    Technician {
        int staff_id PK,FK
        string specialization
        string lab_location
    }

    Qualification {
        int qualification_id PK
        string qualification_name
        string qualification_code
        string description
    }

    Course {
        int course_id PK
        string course_code
        string course_name
        int credits
        int qualification_id FK
    }

    Assessment {
        int assessment_id PK
        int course_id FK
        string assessment_type enum(Exam, Assignment, Lab, Project, Presentation)
        string assessment_name
        decimal weighting
        date due_date
    }

    Student {
        int student_id PK
        string first_name
        string last_name
        date date_of_birth
        string email
        int qualification_id FK
    }

    Attendance {
        int student_id FK
        int course_id FK
        int staff_id FK
        date date
        string attendance_status
        PRIMARY KEY (student_id, course_id, staff_id, date)
    }

    Staff ||--o{ Lecturer : "is a"
    Staff ||--o{ Technician : "is a"
    Qualification }o--|| Course : "contains"
    Course ||--o{ Assessment : "has"
    Student }o--|| Qualification : "enrols in"
    Attendance ||--o{ Student : "attends"
    Attendance ||--o{ Course : "is part of"
    Attendance ||--o{ Staff : "is delivered by"
    Course ||--o{ Qualification : "is part of"

    Lecturer -- Staff : inherits
    Technician -- Staff : inherits
```
