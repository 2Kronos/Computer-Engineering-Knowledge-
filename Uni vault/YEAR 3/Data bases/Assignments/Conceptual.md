**Database Systems 3 – Part 4: Methodology – Conceptual ERD**

---

**(a) Supervises:**  
A `Supervisor (a)`  supervises `Staff (b)` members therefore creating a creating a 1:M relationship. This shows that senior staff oversee or manage the work of other staff.

**(b) Registers:**  
A `Staff` member registers a `Client`. This means staff are responsible for enrolling new clients in the system.

**(c) Owns:**  
An `Owner` owns a `PropertyForRent`. This shows the ownership link between landlords and the rental properties they offer.

**(d) Manages:**  
A `Staff` member manages a `PropertyForRent`. This means staff are assigned responsibility for managing properties on behalf of the agency.

**(e) Registers:**  
A `Staff` member registers a `PropertyForRent`. This shows that staff add new property listings to the database.

**(f) Manages:**  
A repeat pathway showing that `Staff` members are responsible for managing properties — reinforcing that multiple properties can be managed by one staff member.

**(g) Owns:**  
Shows that an `Owner` can own multiple `PropertyForRent` records. This complements pathway (c) and reflects that owners can have more than one rental property.

**(h) Views:**  
A `Client` views a `PropertyForRent`. This pathway shows that clients can express interest by viewing properties.

**(i) Views:**  
A `PropertyForRent` can be viewed by many `Clients`. This is the other side of the viewing relationship — one property may be viewed by multiple potential renters.

**(j) Holds:**  
A `Client` holds a `Lease`. This means that a client has signed a lease agreement for a property.

**(k) AssociatedWith:**  
A `Lease` is associated with a `PropertyForRent`. This records which property the lease agreement refers to.

**(l) AssociatedWith:**  
A `PropertyForRent` is associated with a `Lease`. This shows that a property can have one or more leases tied to it over time.

**(m) States:**  
A `Client` states a `Preference`. This records what a client is looking for in a property, such as type, location, or features.

**(m) States:**  
The `Preference` is linked back to the `Client` who made it. This shows that preferences belong to specific clients.