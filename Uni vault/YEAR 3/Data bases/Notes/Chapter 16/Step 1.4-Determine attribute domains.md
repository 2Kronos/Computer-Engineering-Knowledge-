
### **Objective**: Define value sets and constraints for all attributes in the conceptual model.

#### What is a Domain?
A named pool of values that:
- Specifies **allowable values** for attributes
- Defines **data formats** and **constraints**
- Acts as a "type system" for the conceptual model



#### DreamHome Domain Examples:
| Attribute       | Domain Definition                          | Implementation Notes          |
|-----------------|-------------------------------------------|-------------------------------|
| `Staff.staffNo` | Pattern: `LLNNN`<br>(2 letters + 3 digits)| Regex: `^[A-Z]{2}\d{3}$`      |
| `Staff.sex`     | Enum: {'M', 'F'}                          | Single char                   |
| `Property.rent` | Range: £100–£2000                         | Decimal(7,2)                  |
| `Lease.rentStart`| Date ≥ today                             | CHECK constraint              |

#### Documentation Standards:
**Data Dictionary Update**:

| Attribute | Domain Name       | Domain Description                          |
|-----------|-------------------|--------------------------------------------|
| staffNo   | STAFF_ID_DOMAIN   | 5 chars: 2 letters + 3 digits (e.g., SL21)  |
| sex       | GENDER_DOMAIN     | Single char: 'M' or 'F'                     |
| rent      | RENTAL_VALUE_DOM  | £100–£2000, 2 decimal places               |


#### Key Benefits:
1. **Data Quality**: Prevents invalid data entry
2. **Consistency**: Uniform formats across attributes
3. **Documentation**: Clear specifications for implementation
4. **Validation**: Basis for future CHECK constraints

**Implementation Notes**:
- Domains are **conceptual** (physical implementation occurs later)
- Some DBMSs support explicit domain types (e.g., PostgreSQL)
- For legacy systems, domains map to column definitions in physical design
