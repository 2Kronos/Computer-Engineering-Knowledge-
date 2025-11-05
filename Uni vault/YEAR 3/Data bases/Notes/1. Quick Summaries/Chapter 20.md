# Chapter 20 Summary: Security and Administration

## Key Security Concepts

**Database Security** = Protecting databases against intentional/accidental threats through hardware, software, people, and data controls.

### Five Critical Security Areas:
1. **Theft and Fraud** - Unauthorized access for illegal purposes
2. **Loss of Confidentiality** - Unauthorized disclosure of sensitive data
3. **Loss of Privacy** - Breach of personal/individual data
4. **Loss of Integrity** - Data corruption or invalidation
5. **Loss of Availability** - System/database becomes inaccessible

## Essential Security Countermeasures

### Access Control Systems:
- **DAC (Discretionary Access Control)** - Uses SQL GRANT/REVOKE commands
- **MAC (Mandatory Access Control)** - System-wide policies with security classifications (Top Secret, Secret, etc.)

### Critical Security Mechanisms:
- **Authorization & Authentication** - Verify user identity and access rights
- **Views** - Hide sensitive data by showing only authorized portions
- **Encryption** - Protect data using symmetric (DES, AES) and asymmetric (RSA) encryption
- **Backup & Recovery** - Regular backups with journaling for disaster recovery
- **RAID Technology** - Hardware redundancy for fault tolerance

## Web Security Essentials

### Key Web Protection Methods:
- **Firewalls** - Barrier between internal/external networks
- **Digital Certificates** - Verify identities through Certificate Authorities
- **SSL/TLS** - Encrypt web communications (HTTPS)
- **Digital Signatures** - Ensure message authenticity and non-repudiation

### Client-Side Security Models:
- **Java Sandbox** - Restricts applet capabilities for safety
- **ActiveX** - Relies on digital signatures and user trust decisions

## Administrative Roles

### Data Administration (DA):
- **Strategic focus** - Data planning, policies, standards
- **Managerial role** - DBMS-independent, business-oriented
- **Responsible for** corporate data model, requirements, security policies

### Database Administration (DBA):
- **Technical focus** - Physical implementation, performance tuning
- **Hands-on role** - DBMS-dependent, technology-oriented
- **Responsible for** backup/recovery, security implementation, DBMS maintenance

## Most Important Takeaways

1. **Security is multi-layered** - Requires technical controls, policies, and administrative oversight
2. **Threats are diverse** - Include human error, malicious attacks, and system failures
3. **Defense in depth** - Combine authentication, access control, encryption, and monitoring
4. **Administrative separation** - DA handles strategy, DBA handles implementation
5. **Web introduces complexity** - Requires additional security measures beyond traditional database controls
