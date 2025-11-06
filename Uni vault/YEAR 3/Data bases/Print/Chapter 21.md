
# 21.1 Defining Legal and Ethical Issues in IT
#### **Summary**

This section establishes why legal and ethical issues are critical in the field of database systems and IT.

**Why This Matters:** IT professionals are no longer just technical implementers; they are under increasing scrutiny due to their power to manage vast amounts of data. This data is a tempting target for misuse, and the rapid pace of technological change often outstrips the ability of laws to regulate it. Therefore, understanding ethical conduct is essential.

**Key Definitions and Concepts:**

*   **Ethics:** A set of moral principles that guide correct conduct. In a professional context, it can be thought of as "doing what is right" according to societal standards.
*   **Ethical vs. Legal Behavior:** These are not the same.
    *   **Legal behavior** is what is permitted by law.
    *   **Ethical behavior** is what is morally right.
    *   **Not all unethical behavior is illegal** (e.g., a DBA snooping on client data for personal reasons may not break a law but is highly unethical).
    *   **Not all ethical behavior is legal** (e.g., a financial trader might have an ethical duty to get the best price for a client, but a specific regulation might legally forbid the method required to achieve it).
*   **The Relationship:** Ethics often precedes law. Ethical debates help determine what new laws are needed to govern new technologies. Ethics fills the gap between technological innovation and legal regulation.

----

**The IT Ethical Challenge:**

*   **Pressure:** A significant number of IT workers report being asked by supervisors to do something unethical. Common unethical (and often illegal) requests involve using unlicensed software, accessing personal data without authorization, and sharing trade secrets.
*   **Power of Technology:** Modern data mining and warehousing tools allow for incredibly detailed analysis of human behavior. While this power has ethical uses (e.g., solving crimes), it also creates strong temptation for unethical ones (e.g., implementing a loan application system that uses race as a factor, or correlating personal data from various sources without consent).
*   **The Governance Gap:** The ability to collect and analyze data often exists in a legal gray area. The decision of whether to use these capabilities unethically is often left to the organization's internal culture, as laws have not yet caught up.


---

**IT Governance:**

*   **Definition:** A framework that specifies decision rights and accountability to encourage desirable behavior in the use of IT.
*   **Purpose:** To ensure that IT investments and resources are aligned with business objectives, managed transparently, and used responsibly. It has become a major concern for executive management, especially after major corporate scandals, and involves adhering to both legislative regulations and voluntary best practices to manage risk and ensure efficiency.

---

### **21.1 Explain the motives behind organizational ethics and legislations.**

The motives behind organizational ethics and legislation stem from several interrelated goals aimed at ensuring accountability, transparency, and fairness in business operations. These include:

1. **Promoting Ethical Behavior:**  
   Ethics guide individuals and organizations to act in ways that are morally right and socially responsible. They help build trust with stakeholders, including customers, employees, and the public.

2. **Ensuring Legal Compliance:**  
   Legislation provides a legal framework to enforce ethical standards. It helps prevent and penalize unethical practices such as fraud, corruption, and data misuse.

3. **Protecting Stakeholder Interests:**  
   Laws and ethical guidelines safeguard the rights and interests of shareholders, customers, employees, and the public. For example, data protection laws ensure personal information is handled responsibly.

4. **Enhancing Corporate Governance:**  
   Legislation like the Sarbanes-Oxley Act (SOX) and frameworks like COBIT and COSO promote strong internal controls, risk management, and accountability within organizations.

5. **Fostering Public Confidence:**  
   Ethical behavior and legal compliance help maintain and restore public trust in businesses, especially after corporate scandals or data breaches.

6. **Encouraging Fair Competition:**  
   Intellectual property laws and antitrust regulations ensure that businesses compete fairly and that innovations are protected and rewarded.

7. **Mitigating Risks:**  
   Adherence to ethical and legal standards helps organizations avoid legal penalties, reputational damage, and operational disruptions.

In summary, ethics and legislation work together to create a responsible, transparent, and sustainable business environment that benefits both organizations and society at large.


-----


# **21.2 Legislation and Its Impact on the IT Function**



#### **Summary**

This section explores how specific laws and regulations directly impact the IT function, particularly data management. Legislation often blurs the line between what is merely ethical and what is legally required, forcing organizations to implement new systems and controls.

**Key Legislation and Its IT Impact:**

1.  **SEC Regulation NMS (U.S. Financial Markets):**
    *   **Requirement:** Mandates that trades must be executed at the best available price across all markets.
    *   **IT Impact:**
			- Financial firms must collect and store real-time market dat
			Must develop databases linking internal trading activity with external market data

2.  **Sarbanes-Oxley Act (SOX - U.S.):**
    - **Purpose:** Improve financial reporting accuracy and corporate governance after Enron/WorldCom scandals
    
- **SOX Impact on IT:**
    
    - Companies must certify accuracy of financial data
    - Increased requirements for security and auditing of financial da
		- **Control Frameworks:**
		    - **COBIT 5:** Comprehensive IT governance framework with 37 processes across:
		        
		        - Governance of Enterprise IT (Evaluate, Direct, Monitor - 5 processes
		        - Management of Enterprise IT (Align Plan Organize - 13, Build Acquire Implement - 10, Deliver Service Support - 6, Monitor Evaluate Assess - 3 processes)
		            
		    - **COSO:** Internal control framework with 5 components
		        - Control Environment, Risk Assessment, Control Activities, Information & Communications, Monitoring

3.  **HIPAA (U.S. Healthcare):**
    *   **Purpose:** Protects patient health information.
    *   **IT Impact:** Mandates strict rules for:
        *   **Privacy:** Systems must track and enforce patient consent for data sharing.
        *   **Standardization:** Health records and transactions must use specific electronic formats, requiring updates to data models and systems.
        *   **Security:** Patient data must be encrypted and secure, both in databases and during transmission. Failure can result in large fines.
        *   **Identifiers:** Requires the use of standardized national identifiers for patients, providers, and insurers, affecting database design.

4.  **EU Data Protection Directive (1995) & Upcoming Law:**
    *   **Foundation:** Based on core principles: Notice, Purpose, Consent, Security, Disclosure, Access, and Accountability.
    *   **Scope:** Extremely broad definition of "personal data" and "processing." Applies to any company processing EU citizen data, even if based outside the EU.
    *   **IT Impact:** Forces organizations to fundamentally rethink how they collect, store, and use personal data. Requires mechanisms for user consent, access, correction, and data erasure ("right to be forgotten").
    *   **Proposed Changes (2012):** Stricter rules including obligatory opt-in consent, 24-hour breach notification, and harsh penalties (up to 2% of global turnover).

5.  **UK Data Protection Act (1998):**
    *   **Principles:** Largely based on the EU directive, it outlines 8 principles for fair and lawful processing of personal data. These govern how data is obtained, used, stored, secured, and shared.
    *   **IT Impact:** Systems must be designed to support these principles, including allowing individuals to access and correct their data.

6.  **Freedom of Information (FOI) Laws (e.g., UK):**
    *   **Purpose:** Grants the public the right to access information held by public authorities.
    *   **IT Impact:** Creates a major administrative burden. Organizations must be able to locate, retrieve, and redact information from their systems quickly to meet legal deadlines. This influences policies on data recording, storage, and management to ensure information is accessible.

7.  **Basel Accords (International Banking):**
    *   **Purpose:** International standards to ensure banks hold enough capital to cover their risks (credit, market, operational risk).
    *   **IT Impact:** **Extremely data-intensive.** Banks must aggregate vast amounts of historical and real-time data from all operations to feed complex risk calculation models (e.g., Value at Risk). This requires robust data warehouses and analytics capabilities. Basel III further increases these data quality and reporting demands.

**Overall Impact on IT:** Legislation transforms IT from a support function into a key player in **legal compliance, risk management, and corporate governance.** IT must work closely with legal and business teams to design systems that are not just efficient but also **auditable, secure, and transparent by design.**

----

# **21.3 Establishing a Culture of Legal and Ethical Data Stewardship**

#### **Summary**

This section provides a practical guide for organizations to build a culture that prioritizes legal compliance and ethical behavior in data management, especially in the face of increasing legal liabilities for senior management.

**Key Steps to Develop an Organization-Wide Policy:**

1.  **Management Awareness & Assessment:**
    *   Senior management (board, CIOs, data administrators) must first be aware of relevant legislation and industry practices.
    *   Conduct an assessment to understand how these laws affect the organization's data flow—from collection and storage to security and access (both internal and external).

2.  **Develop Explicit Rules & Ethical Principles:**
    *   Create clear, documented operating procedures for conducting business within legal boundaries.
    *   Develop a complementary set of **ethical principles**, often starting from an existing corporate ethics statement. This policy must be communicated seriously to all employees.

3.  **Enforcement and Evolution:**
    *   Deal with legal and ethical lapses **swiftly, fairly, and transparently**, according to the pre-defined guidelines known to all employees.
    *   Use these incidents to refine and evolve policies to adapt to new business and technological landscapes.

**Leveraging Professional Codes of Ethics:**
Organizations can use established codes from professional bodies as a blueprint. Two prominent examples are:

*   **ACM (Association for Computing Machinery) Code of Ethics:** A comprehensive code with 24 statements organized into four categories:
    1.  **Fundamental Ethical Considerations:** Contribute to society, avoid harm, be honest, respect privacy, honor confidentiality.
    2.  **Professional Conduct:** Strive for quality, maintain competence, know the law, honor contracts.
    3.  **Leadership Responsibilities:** Articulate social duties, manage resources to enhance quality of life, protect user dignity.
    4.  **Compliance:** Uphold and promote the code.

*   **BCS (British Computer Society) Code of Conduct:** Focuses on four main duties:
    1.  **Public Interest:** Promote public well-being, privacy, and equality.
    2.  **Professional Competence & Integrity:** Only work within your competence, continue learning, comply with law, reject bribery.
    3.  **Duty to Relevant Authority:** Act with due care, avoid conflicts of interest, maintain confidentiality.
    4.  **Duty to the Profession:** Uphold the profession's reputation, act with integrity.

**Example: Applying this to DreamHome**
For a company like DreamHome, which handles sensitive client rental and payment data, a policy should explicitly address:

*   **Respectful Interactions:** Guidelines for staff behavior with clients and partners.
*   **Data Security:** Awareness and procedures for protecting sensitive client data. Clear protocols for handling data requests from internal staff, owners, partners, and law enforcement.
*   **Use of Company Resources:** Rules on hardware, software (no unapproved installations or piracy), and internet use.
*   **Consequences:** A clear, tiered system of sanctions for violations, from dismissal for malicious acts to a review by an oversight board for other breaches. The policy should be reviewed annually.
----

# **21.4 Intellectual Property**

**Definition:** The product of human creativity in industrial, scientific, literary, and artistic fields. It includes inventions, designs, patents, trademarks, written work (including software), and know-how.

**Key Concept:** IP generated during employment typically belongs to the employer unless otherwise agreed. IP rights give owners exclusivity to license, sell, or give away their property, though these rights have limitations.

---

#### **21.4.1 Patent**

*   **Definition:** An exclusive legal right for a set period to make, use, sell, or import an invention.
*   **Requirements for Grant:**
    *   The invention must be **new**.
    *   The invention must be **useful**.
    *   The invention must involve an **inventive step**.
*   **Key Feature:** The patent application must disclose how the invention works, enriching public knowledge.
*   **Exclusions:** Artistic creations, mathematical models, plans, or purely mental processes cannot be patented.

---

#### **21.4.2 Copyright**

*   **Definition:** An exclusive legal right for a set period to reproduce and distribute a literary, musical, audiovisual, or other "work" of authorship.
*   **Scope:** Covers books, music, films, and extends to **software, databases, technical drawings, and multimedia**.
*   **Acquisition:** Automatically in effect as soon as a work takes a fixed form (e.g., written down); no formal registration is required.
*   **Moral Rights:** Gives the creator the right to be identified as such and to object to distortion of their work.
*   **Exceptions:** Allows for limited use for non-commercial research, private study, and teaching.

---

#### **21.4.3 Trademark**

*   **Definition:** An exclusive legal right to use a distinctive word, symbol, image, or sound that identifies the source of goods or services.
*   **Purpose:** Helps consumers identify the nature and quality of products.
*   **Registration:** Unlike copyright, a trademark does not have to be registered, but registration is advisable to strengthen legal protection.

---

#### **21.4.4 Intellectual Property Rights Issues for Software**

**Importance of Understanding IPR:**
*   To protect your own or your organization's original work.
*   To recognize the value of original works.
*   To understand protection and exploitation procedures.
*   To know legal defense measures against illegal use.
*   To be fair about legitimate non-profit use.

**Software and Patentability:**
*   **Historical View:** Software was protected by copyright, while apparatus using software was protected by patent.
*   **Current View:** Less clear. The U.S. grants "business method" and software patents, while the U.K. generally excludes software unless it produces a "technical effect."
*   **Modern Context:** Smartphones and tablets have led to fierce patent battles among tech giants (e.g., Google, Apple, Samsung) over operating systems and innovations.

**Software and Copyright (License Types):**
*   **Commercial Software (Perpetual Use):** Paid once for perpetual use, usually on one machine. Backups allowed.
*   **Commercial Software (Annual Fee):** Annual payment required (e.g., site licenses, server software). Stops working if unpaid.
*   **Shareware:** Free for a trial period, then requires a fee to continue using.
*   **Freeware:** Free for certain uses, but with restrictions:
    *   **Proprietary Freeware:** Distributed without source code.
    *   **Open Source Software (OSS):** Source code included, often under licenses like GNU GPL. Allows modification but improvements must be shared back; cannot be used for commercial purposes.

**General Rule:** Users cannot modify, reverse-engineer, or remove copyright messages from software. All software has license conditions, and failure to comply is copyright infringement.

---

#### **21.4.5 Intellectual Property Rights Issues for Data**

*   **Data Licensing:** Organizations must define policies for when and how data can be shared. If data is shared for revenue, appropriate licensing must prevent unauthorized "re-sharing."
*   **Cloud Computing & Transnational Issues:** Storing data in the cloud or across borders complicates control.
    *   **Example:** The **USA Patriot Act** can force U.S. companies (and their foreign subsidiaries) to release data, even if it violates local privacy laws (like EU regulations). Frameworks like the **U.S.-EU Safe Harbour** have been reported as ineffective in some cases.
