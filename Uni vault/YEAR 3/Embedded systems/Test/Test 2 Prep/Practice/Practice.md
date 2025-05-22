
# DC Motor & H-Bridge

# Approach

- Use the motor direction notes
- We want to gradually increase the speed so we need a for 
- Use the `millis()` to stop the code at 5 second 

## **🔄 Motor Control Pins (H-Bridge Logic)**  

### **Motor A (Pins 2,3,6,7)**
| **Pin** | **Name** | **Purpose**                           | **Truth Table**               |
| ------- | -------- | ------------------------------------- | ----------------------------- |
| **2**   | Input 1  | Controls Motor A direction (HIGH/LOW) | `IN1=HIGH, IN2=LOW` → Foward  |
| **7**   | Input 2  | Controls Motor A direction (HIGH/LOW) | `IN1=LOW, IN2=HIGH` → reverse |
| **3**   | Output 1 | Connects to Motor A’s **+ terminal**  | Motor A Wire (+)              |
| **6**   | Output 2 | Connects to Motor A’s **- terminal**  | Motor A Wire (-)              |

### **Motor B (Pins 10,11,14,15)**
| **Pin** | **Name** | **Purpose**                           | **Truth Table**               |
| ------- | -------- | ------------------------------------- | ----------------------------- |
| **10**  | Input 3  | Controls Motor B direction (HIGH/LOW) | `IN3=HIGH, IN4=LOW` → Forward |
| **15**  | Input 4  | Controls Motor B direction (HIGH/LOW) | `IN3=LOW, IN4=HIGH` → Reverse |
| **11**  | Output 3 | Connects to Motor B’s **+ terminal**  | Motor B Wire (+)              |
| **14**  | Output 4 | Connects to Motor B’s **- terminal**  | Motor B Wire (-)              |

🔹 **How Direction Control Works (H-Bridge Logic)**  
- **Forward**: `IN1=HIGH, IN2=LOW` → Current flows **Output 1 → Output 2**  
- **Reverse**: `IN1=LOW, IN2=HIGH` → Current flows **Output 2 → Output 1**  
- **Brake**: `IN1=IN2=HIGH` (or `LOW`) → Motor stops  
