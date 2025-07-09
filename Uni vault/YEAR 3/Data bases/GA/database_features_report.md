## 4. Stored Procedure Implementation

### 4.1 Stored Procedure Overview

Stored procedures are precompiled SQL blocks stored in the database that perform specific operations. They promote modularity, reusability, and encapsulation. The syntax for creating a procedure in MySQL is:

```sql
CREATE PROCEDURE procedure_name(IN param1 DATATYPE, OUT param2 DATATYPE)
BEGIN
   -- SQL logic
END;
```

### 4.2 Demonstration

**Procedure:** `sp_Raya_Tshiwaya_222170972_UpdateInventory`

**Purpose:** This stored procedure manages inventory changes by increasing or decreasing medication stock levels. It includes transaction control, error handling, and logging.

**Code:**

```sql
DELIMITER //
CREATE PROCEDURE sp_Raya_Tshiwaya_222170972_UpdateInventory(
    IN p_MedicationID INT,
    IN p_QuantityChange INT,
    OUT p_Status VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_Status = 'Error: Could not update inventory';
    END;

    START TRANSACTION;

        UPDATE HospitalMedications
        SET StockQuantity = StockQuantity + p_QuantityChange
        WHERE MedicationID = p_MedicationID;

        IF (SELECT StockQuantity FROM HospitalMedications WHERE MedicationID = p_MedicationID) < 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient stock available';
        END IF;

        INSERT INTO InventoryLogs (MedicationID, ChangeAmount, Timestamp)
        VALUES (p_MedicationID, p_QuantityChange, NOW());

        SET p_Status = CONCAT('Success: Updated ', p_QuantityChange, ' units');

    COMMIT;
END //
DELIMITER ;
```

**Execution Result:**

```sql
CALL sp_Raya_Tshiwaya_222170972_UpdateInventory(101, -5, @status);
SELECT @status;
```

### 4.3 Additional Opportunities

- **Parameterization**: Allows reuse with different inventory actions by changing only the input values.
- **Error Handling**: Ensures failed updates are rolled back, maintaining data integrity.
- **Modularity**: Can be reused by triggers or applications needing inventory logic.
- **Extension**: Could include validation for medication existence, low-stock alerts, or integration with supply orders.

---

## 5. Trigger Implementation

### 5.1 Trigger Overview

Triggers automatically execute in response to certain database events. MySQL supports:

- `BEFORE INSERT`, `AFTER INSERT`
- `BEFORE UPDATE`, `AFTER UPDATE`
- `BEFORE DELETE`, `AFTER DELETE`

### 5.2 Demonstration

**Trigger:** `trg_Tshiwaya_AuditLog`

**Purpose:** Automatically logs all INSERT actions on the Appointments table into a dedicated audit table.

**Code:**

```sql
CREATE TABLE AppointmentAudit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    ActionTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    ActionType VARCHAR(10),
    AppointmentID INT,
    PatientID INT,
    DoctorID INT,
    ScheduledTime DATETIME
);

DELIMITER //
CREATE TRIGGER trg_Tshiwaya_AuditLog
AFTER INSERT ON Raya_Tshiwaya_222170972_Appointments
FOR EACH ROW
BEGIN
    INSERT INTO AppointmentAudit (ActionType, AppointmentID, PatientID, DoctorID, ScheduledTime)
    VALUES ('INSERT', NEW.AppointmentID, NEW.PatientID, NEW.DoctorID, NEW.DateTime);
END;//
DELIMITER ;
```

**Testing Scenario:**

```sql
INSERT INTO Raya_Tshiwaya_222170972_Appointments (PatientID, DoctorID, DateTime, Purpose, Status)
VALUES (2, 3, '2023-11-10 09:00:00', 'General Follow-Up', 'Scheduled');

SELECT * FROM AppointmentAudit ORDER BY ActionTime DESC;
```

### 5.3 Adaptation to New Situations

- **Data Validation**: BEFORE triggers can check data rules before allowing changes.
- **Auditing**: AFTER triggers can log inserts, updates, and deletes for accountability.
- **Business Rules**: Automate tasks like default value setting, backup copies, or syncs.
- **Example Use Case**: Automatically disable expired prescriptions or flag abnormal appointment gaps.

---

## 6. Cursor, Function, and Event Implementation

### 6.1 Cursor

**Use Case:** Batch processing of overdue appointments

```sql
DECLARE done INT DEFAULT FALSE;
DECLARE v_AppointmentID INT;
DECLARE cur CURSOR FOR SELECT AppointmentID FROM Raya_Tshiwaya_222170972_Appointments WHERE DateTime < NOW() AND Status = 'Scheduled';
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

OPEN cur;
read_loop: LOOP
    FETCH cur INTO v_AppointmentID;
    IF done THEN
        LEAVE read_loop;
    END IF;
    UPDATE Raya_Tshiwaya_222170972_Appointments SET Status = 'Missed' WHERE AppointmentID = v_AppointmentID;
END LOOP;
CLOSE cur;
```

### 6.2 Function

**Example:** `fn_Tshiwaya_CalculateTax`

```sql
CREATE FUNCTION fn_Tshiwaya_CalculateTax(amount DECIMAL(10,2)) RETURNS DECIMAL(10,2)
BEGIN
    RETURN amount * 0.15; -- 15% tax
END;
```

### 6.3 Event

**Example:** Daily cleanup of old audit logs

```sql
CREATE EVENT evt_Tshiwaya_CleanupLogs
ON SCHEDULE EVERY 1 DAY
DO
DELETE FROM AppointmentAudit WHERE ActionTime < NOW() - INTERVAL 90 DAY;
```

### 6.4 Current Trends

Modern DBMS platforms increasingly support automation and real-time processing. Stored procedures, triggers, and events:

- **Automate** routine tasks like logging or validation
- **Scale** better when logic runs server-side
- **Integrate with cloud** platforms via functions-as-a-service (FaaS)
- Are essential in healthcare and finance where data integrity and reactivity are critical

