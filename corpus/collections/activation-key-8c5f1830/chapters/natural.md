## Software Licensing and Access Management

Organizations that distribute software products must track the full lifecycle of a license: from the moment an activation key is issued, through the software it unlocks, to the customers who purchase it, the users who are authorised to operate it, and the sessions in which those users actually connect. This chapter describes the data structures that record each stage of that lifecycle, the relationships that bind them together, and the analytical views that surface actionable information for administrators and auditors.

**Table `ActivationKey`**

| id | keyString | issuedDate | licenseType | licensePeriodStart | licensePeriodEnd | maxConcurrentSessions | softwareId | customerRegistrationNumber |
|---|---|---|---|---|---|---|---|---|
| 1 | pilot-key-20 | 2022-09-24T20:24:00 | SUSM | 2025-08-27 | 2023-10-22 | 36 | 1 | REG-2136 |
| 2 | extended-key-21 | 2023-02-08T03:41:00 | Concurrent | 2022-01-11 | 2024-03-06 | 44 | 2 | REG-2142 |
| 3 | integrated-key-22 | 2024-07-19T10:58:00 | SUSM | 2023-06-22 | 2025-08-17 | 52 | 3 | REG-2148 |
| 4 | seasonal-key-23 | 2025-12-03T17:15:00 | Concurrent | 2024-11-06 | 2022-01-01 | 60 | 4 | REG-2154 |

An activation key is the primary instrument of license distribution. Each key carries a unique string identifier—`pilot-key-20`, `extended-key-21`, `integrated-key-22`, `seasonal-key-23`—along with the date it was issued, the license type (either `SUSM` or `Concurrent`), and a validity window defined by a start and end date. The key `extended-key-21`, for instance, was issued on 2023-02-08 under a Concurrent model with a session ceiling of 44 concurrent users. Every key is tied to a specific software product via `softwareId` and to a customer through `customerRegistrationNumber`, creating the first link in the chain from product to purchaser.

**Table `LicensedSoftware`**

| id | softwareName | versionNumber | isCloudService | lastUpdated | keyId | userId | createdAt |
|---|---|---|---|---|---|---|---|
| 1 | Primary Review A | VER-2245 | true | 2023-06-17T17:27:00 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | Composite Initiative | VER-2249 | false | 2024-11-01T00:44:00 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | Compact Model | VER-2253 | true | 2025-04-12T07:01:00 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | Legacy Cluster D | VER-2257 | false | 2022-09-23T14:18:00 | 4 | 4 | 2025-04-16 09:14:00 |

Licensed software records the products themselves. Each entry includes a human-readable name such as `Primary Review A` or `Compact Model`, a version string like `VER-2245`, and a flag indicating whether the product is a cloud service. The record for `Legacy Cluster D` (version `VER-2257`) is marked as a non-cloud product, while `Compact Model` (version `VER-2253`) is delivered as a cloud service. Each software record references an activation key through `keyId` and an authorised user through `userId`, anchoring the product to both its license and its operator.

**Table `Customer`**

| customerType | legalName | registrationNumber | registeredAddress | keyId | userId |
|---|---|---|---|---|---|
| Individual | Jorge Sullivan | REG-2136 | regional-register-36 | 1 | 1 |
| Entity | Walter Pratt | REG-2142 | legacy-register-37 | 2 | 2 |
| Individual | Home Medix Oxygen | REG-2148 | compact-register-38 | 3 | 3 |
| Entity | Hector Garcia | REG-2154 | composite-register-39 | 4 | 4 |

Customers are the purchasing entities, classified as either `Individual` or `Entity`. The customer `Jorge Sullivan` (registration `REG-2136`) is an individual whose registered address is recorded as `regional-register-36`. By contrast, `Walter Pratt` (registration `REG-2142`) is classified as an Entity with address `legacy-register-37`. Each customer record carries a `keyId` and `userId`, connecting the purchaser to both the activation key they received and the authorised user who manages it on their behalf.

**Table `AuthorisedUser`**

| id | userName | userRole | isConcurrent | customerRegistrationNumber | softwareId | sessionId |
|---|---|---|---|---|---|---|
| 1 | Desiree Cain | Employee | true | REG-2136 | 1 | 1 |
| 2 | Jennifer Summers | Student | false | REG-2142 | 2 | 2 |
| 3 | Nicole Todd | Individual | true | REG-2148 | 3 | 3 |
| 4 | Rebekah Mueller | Employee | false | REG-2154 | 4 | 4 |

Authorised users are the people granted permission to operate the software. Their records include a `userName` (for example, `Desiree Cain` or `Nicole Todd`), a `userRole` such as `Employee` or `Student`, and a boolean flag `isConcurrent` that indicates whether the user is permitted concurrent sessions. `Desiree Cain` holds the role of Employee and has concurrent access enabled, while `Jennifer Summers`, a Student, does not. Each user is linked to a customer via `customerRegistrationNumber`, to a software product via `softwareId`, and to a session via `sessionId`.

**Table `UserSession`**

| id | sessionStart | sessionEnd | isCurrent | userId | keyId |
|---|---|---|---|---|---|
| 1 | 2022-05-04T16:00:00 | 2024-03-27T02:54:00 | true | 1 | 1 |
| 2 | 2023-10-15T23:17:00 | 2025-08-11T09:11:00 | false | 2 | 2 |
| 3 | 2024-03-26T06:34:00 | 2022-01-22T16:28:00 | true | 3 | 3 |
| 4 | 2025-08-10T13:51:00 | 2023-06-06T23:45:00 | false | 4 | 4 |

User sessions capture the actual periods of access. A session record contains a `sessionStart` timestamp, a `sessionEnd` timestamp, and an `isCurrent` flag indicating whether the session is still active. The session for user 1 began on 2022-05-04 and is marked as current, while the session for user 2, which started on 2023-10-15, has ended. Each session is associated with a specific user (`userId`) and an activation key (`keyId`), providing a direct audit trail from session to license.

### Activation Key and Licensed Software

**View `vw_activation_key_licensed_software`**

```sql
CREATE VIEW vw_activation_key_licensed_software AS
SELECT a.id, a.keyString, a.issuedDate, a.licenseType, b.id AS software_id, b.softwareName AS software_softwareName, b.versionNumber AS software_versionNumber
FROM ActivationKey a JOIN LicensedSoftware b ON a.softwareId = b.id;
```

| id | keyString | issuedDate | licenseType | software_id | software_softwareName | software_versionNumber |
|---|---|---|---|---|---|---|
| 1 | pilot-key-20 | 2022-09-24T20:24:00 | SUSM | 1 | Primary Review A | VER-2245 |
| 2 | extended-key-21 | 2023-02-08T03:41:00 | Concurrent | 2 | Composite Initiative | VER-2249 |
| 3 | integrated-key-22 | 2024-07-19T10:58:00 | SUSM | 3 | Compact Model | VER-2253 |
| 4 | seasonal-key-23 | 2025-12-03T17:15:00 | Concurrent | 4 | Legacy Cluster D | VER-2257 |

This view joins activation keys to their corresponding software products, answering the question: which software does each activation key unlock? The result pairs each key string with the software name and version it activates. Row 1 shows that `pilot-key-20` unlocks `Primary Review A` at version `VER-2245` under a SUSM license. Row 2 reveals that `extended-key-21` is tied to `Composite Initiative` at version `VER-2249` under a Concurrent license. Administrators use this view to verify that every issued key maps to a valid software product and to audit license-type distribution across the portfolio.

**View `vw_licensed_software_activation_key`**

```sql
CREATE VIEW vw_licensed_software_activation_key AS
SELECT a.id, a.softwareName, a.versionNumber, a.isCloudService, b.id AS key_id, b.keyString AS key_keyString, b.issuedDate AS key_issuedDate
FROM LicensedSoftware a JOIN ActivationKey b ON a.keyId = b.id;
```

| id | softwareName | versionNumber | isCloudService | key_id | key_keyString | key_issuedDate |
|---|---|---|---|---|---|---|
| 1 | Primary Review A | VER-2245 | true | 1 | pilot-key-20 | 2022-09-24T20:24:00 |
| 2 | Composite Initiative | VER-2249 | false | 2 | extended-key-21 | 2023-02-08T03:41:00 |
| 3 | Compact Model | VER-2253 | true | 3 | integrated-key-22 | 2024-07-19T10:58:00 |
| 4 | Legacy Cluster D | VER-2257 | false | 4 | seasonal-key-23 | 2025-12-03T17:15:00 |

The inverse join—software to activation key—answers the complementary question: which activation keys are associated with each software product? This perspective is useful when a software product needs to be audited for its active licenses. The view surfaces the key string, issue date, and license type alongside the software identifier, enabling administrators to trace from a product like `Compact Model` back to the `integrated-key-22` key issued on 2024-07-19 under a SUSM model.

### Activation Key and Customer

**View `vw_activation_key_customer`**

```sql
CREATE VIEW vw_activation_key_customer AS
SELECT a.id, a.keyString, a.issuedDate, a.licenseType, b.customerType AS customer_customerType, b.legalName AS customer_legalName, b.registrationNumber AS customer_registrationNumber
FROM ActivationKey a JOIN Customer b ON a.customerRegistrationNumber = b.registrationNumber;
```

| id | keyString | issuedDate | licenseType | customer_customerType | customer_legalName | customer_registrationNumber |
|---|---|---|---|---|---|---|
| 1 | pilot-key-20 | 2022-09-24T20:24:00 | SUSM | Individual | Jorge Sullivan | REG-2136 |
| 2 | extended-key-21 | 2023-02-08T03:41:00 | Concurrent | Entity | Walter Pratt | REG-2142 |
| 3 | integrated-key-22 | 2024-07-19T10:58:00 | SUSM | Individual | Home Medix Oxygen | REG-2148 |
| 4 | seasonal-key-23 | 2025-12-03T17:15:00 | Concurrent | Entity | Hector Garcia | REG-2154 |

This view links activation keys to the customers who hold them, answering: which customer owns which activation key? Each row presents the key string, its license type, and the customer's registration number and legal name. For example, the key `seasonal-key-23` is associated with the customer `Hector Garcia` (registration `REG-2154`), classified as an Entity. This join supports billing reconciliation and customer-facing license reports.

### Licensed Software and Authorised User

**View `vw_licensed_software_authorised_user`**

```sql
CREATE VIEW vw_licensed_software_authorised_user AS
SELECT a.id, a.softwareName, a.versionNumber, a.isCloudService, b.id AS user_id, b.userName AS user_userName, b.userRole AS user_userRole
FROM LicensedSoftware a JOIN AuthorisedUser b ON a.userId = b.id;
```

| id | softwareName | versionNumber | isCloudService | user_id | user_userName | user_userRole |
|---|---|---|---|---|---|---|
| 1 | Primary Review A | VER-2245 | true | 1 | Desiree Cain | Employee |
| 2 | Composite Initiative | VER-2249 | false | 2 | Jennifer Summers | Student |
| 3 | Compact Model | VER-2253 | true | 3 | Nicole Todd | Individual |
| 4 | Legacy Cluster D | VER-2257 | false | 4 | Rebekah Mueller | Employee |

By joining licensed software to authorised users, this view answers: which users are authorised to operate each software product? The result includes the software name, version, and the user's name, role, and concurrent access status. Row 1 shows that `Primary Review A` (version `VER-2245`) is operated by `Desiree Cain`, an Employee with concurrent access enabled. Row 3 links `Compact Model` (version `VER-2253`) to `Nicole Todd`, an Individual user who also has concurrent access. This view is essential for capacity planning and role-based access reviews.

### Customer and Activation Key

**View `vw_customer_activation_key`**

```sql
CREATE VIEW vw_customer_activation_key AS
SELECT a.customerType, a.legalName, a.registrationNumber, a.registeredAddress, b.id AS key_id, b.keyString AS key_keyString, b.issuedDate AS key_issuedDate
FROM Customer a JOIN ActivationKey b ON a.keyId = b.id;
```

| customerType | legalName | registrationNumber | registeredAddress | key_id | key_keyString | key_issuedDate |
|---|---|---|---|---|---|---|
| Individual | Jorge Sullivan | REG-2136 | regional-register-36 | 1 | pilot-key-20 | 2022-09-24T20:24:00 |
| Entity | Walter Pratt | REG-2142 | legacy-register-37 | 2 | extended-key-21 | 2023-02-08T03:41:00 |
| Individual | Home Medix Oxygen | REG-2148 | compact-register-38 | 3 | integrated-key-22 | 2024-07-19T10:58:00 |
| Entity | Hector Garcia | REG-2154 | composite-register-39 | 4 | seasonal-key-23 | 2025-12-03T17:15:00 |

This view presents the customer-to-key relationship from the customer's perspective, answering: which activation keys does each customer hold? The joined result includes the customer's legal name, registration number, and type alongside the key string, license type, and issue date. A customer such as `Home Medix Oxygen` (registration `REG-2148`, type Individual) holds the key `integrated-key-22`, issued on 2024-07-19 under a SUSM license. This view supports customer account management and license portfolio summaries.

### Customer and Authorised User

**View `vw_customer_authorised_user`**

```sql
CREATE VIEW vw_customer_authorised_user AS
SELECT a.customerType, a.legalName, a.registrationNumber, a.registeredAddress, b.id AS user_id, b.userName AS user_userName, b.userRole AS user_userRole
FROM Customer a JOIN AuthorisedUser b ON a.userId = b.id;
```

| customerType | legalName | registrationNumber | registeredAddress | user_id | user_userName | user_userRole |
|---|---|---|---|---|---|---|
| Individual | Jorge Sullivan | REG-2136 | regional-register-36 | 1 | Desiree Cain | Employee |
| Entity | Walter Pratt | REG-2142 | legacy-register-37 | 2 | Jennifer Summers | Student |
| Individual | Home Medix Oxygen | REG-2148 | compact-register-38 | 3 | Nicole Todd | Individual |
| Entity | Hector Garcia | REG-2154 | composite-register-39 | 4 | Rebekah Mueller | Employee |

This join connects customers to their authorised users, answering: which users are authorised on behalf of each customer? The result pairs the customer's legal name and registration number with the user's name, role, and concurrent access flag. For instance, the customer `Jorge Sullivan` (registration `REG-2136`) has `Desiree Cain` as an authorised Employee with concurrent sessions enabled. The customer `Walter Pratt` (registration `REG-2142`) has `Jennifer Summers`, a Student without concurrent access. This view is critical for understanding the human layer of the licensing chain.

### Authorised User and Customer

**View `vw_authorised_user_customer`**

```sql
CREATE VIEW vw_authorised_user_customer AS
SELECT a.id, a.userName, a.userRole, a.isConcurrent, b.customerType AS customer_customerType, b.legalName AS customer_legalName, b.registrationNumber AS customer_registrationNumber
FROM AuthorisedUser a JOIN Customer b ON a.customerRegistrationNumber = b.registrationNumber;
```

| id | userName | userRole | isConcurrent | customer_customerType | customer_legalName | customer_registrationNumber |
|---|---|---|---|---|---|---|
| 1 | Desiree Cain | Employee | true | Individual | Jorge Sullivan | REG-2136 |
| 2 | Jennifer Summers | Student | false | Entity | Walter Pratt | REG-2142 |
| 3 | Nicole Todd | Individual | true | Individual | Home Medix Oxygen | REG-2148 |
| 4 | Rebekah Mueller | Employee | false | Entity | Hector Garcia | REG-2154 |

The inverse of the previous view, this perspective starts from the authorised user and surfaces the customer they represent. It answers: which customer does each authorised user serve? The result includes the user's name, role, and concurrent access status alongside the customer's legal name, registration number, and type. `Nicole Todd`, an Individual user, serves the customer `Home Medix Oxygen` (registration `REG-2148`). This view is useful for user-facing dashboards and support ticket routing.

### Authorised User and Licensed Software

**View `vw_authorised_user_licensed_software`**

```sql
CREATE VIEW vw_authorised_user_licensed_software AS
SELECT a.id, a.userName, a.userRole, a.isConcurrent, b.id AS software_id, b.softwareName AS software_softwareName, b.versionNumber AS software_versionNumber
FROM AuthorisedUser a JOIN LicensedSoftware b ON a.softwareId = b.id;
```

| id | userName | userRole | isConcurrent | software_id | software_softwareName | software_versionNumber |
|---|---|---|---|---|---|---|
| 1 | Desiree Cain | Employee | true | 1 | Primary Review A | VER-2245 |
| 2 | Jennifer Summers | Student | false | 2 | Composite Initiative | VER-2249 |
| 3 | Nicole Todd | Individual | true | 3 | Compact Model | VER-2253 |
| 4 | Rebekah Mueller | Employee | false | 4 | Legacy Cluster D | VER-2257 |

This view joins authorised users to the software they are permitted to operate, answering: which software products is each authorised user entitled to use? The result includes the user's name, role, and concurrent access flag alongside the software name and version. `Desiree Cain` (Employee, concurrent enabled) is authorised for `Primary Review A` at version `VER-2245`. `Rebekah Mueller` (Employee, concurrent disabled) is authorised for `Legacy Cluster D` at version `VER-2257`. This view supports entitlement audits and software deployment planning.

### Authorised User and User Session

**View `vw_authorised_user_user_session`**

```sql
CREATE VIEW vw_authorised_user_user_session AS
SELECT a.id, a.userName, a.userRole, a.isConcurrent, b.id AS session_id, b.sessionStart AS session_sessionStart, b.sessionEnd AS session_sessionEnd
FROM AuthorisedUser a JOIN UserSession b ON a.sessionId = b.id;
```

| id | userName | userRole | isConcurrent | session_id | session_sessionStart | session_sessionEnd |
|---|---|---|---|---|---|---|
| 1 | Desiree Cain | Employee | true | 1 | 2022-05-04T16:00:00 | 2024-03-27T02:54:00 |
| 2 | Jennifer Summers | Student | false | 2 | 2023-10-15T23:17:00 | 2025-08-11T09:11:00 |
| 3 | Nicole Todd | Individual | true | 3 | 2024-03-26T06:34:00 | 2022-01-22T16:28:00 |
| 4 | Rebekah Mueller | Employee | false | 4 | 2025-08-10T13:51:00 | 2023-06-06T23:45:00 |

This join connects authorised users to their session records, answering: which sessions has each authorised user opened? The result includes the user's name, role, and concurrent access status alongside the session start and end timestamps and the current-session flag. `Desiree Cain` has a session that started on 2022-05-04 and is currently active. `Jennifer Summers` has a session that started on 2023-10-15 and has since ended. This view is essential for usage analytics and session management.

### User Session and Authorised User

**View `vw_user_session_authorised_user`**

```sql
CREATE VIEW vw_user_session_authorised_user AS
SELECT a.id, a.sessionStart, a.sessionEnd, a.isCurrent, b.id AS user_id, b.userName AS user_userName, b.userRole AS user_userRole
FROM UserSession a JOIN AuthorisedUser b ON a.userId = b.id;
```

| id | sessionStart | sessionEnd | isCurrent | user_id | user_userName | user_userRole |
|---|---|---|---|---|---|---|
| 1 | 2022-05-04T16:00:00 | 2024-03-27T02:54:00 | true | 1 | Desiree Cain | Employee |
| 2 | 2023-10-15T23:17:00 | 2025-08-11T09:11:00 | false | 2 | Jennifer Summers | Student |
| 3 | 2024-03-26T06:34:00 | 2022-01-22T16:28:00 | true | 3 | Nicole Todd | Individual |
| 4 | 2025-08-10T13:51:00 | 2023-06-06T23:45:00 | false | 4 | Rebekah Mueller | Employee |

The inverse perspective starts from the session and surfaces the authorised user who opened it. It answers: which authorised user is associated with each session? The result pairs the session start and end times, the current-session flag, and the activation key with the user's name, role, and concurrent access status. A session that began on 2024-03-26 and is currently active is linked to `Nicole Todd`, an Individual user with concurrent access enabled. This view supports session-level auditing and troubleshooting.

### User Session and Activation Key

**View `vw_user_session_activation_key`**

```sql
CREATE VIEW vw_user_session_activation_key AS
SELECT a.id, a.sessionStart, a.sessionEnd, a.isCurrent, b.id AS key_id, b.keyString AS key_keyString, b.issuedDate AS key_issuedDate
FROM UserSession a JOIN ActivationKey b ON a.keyId = b.id;
```

| id | sessionStart | sessionEnd | isCurrent | key_id | key_keyString | key_issuedDate |
|---|---|---|---|---|---|---|
| 1 | 2022-05-04T16:00:00 | 2024-03-27T02:54:00 | true | 1 | pilot-key-20 | 2022-09-24T20:24:00 |
| 2 | 2023-10-15T23:17:00 | 2025-08-11T09:11:00 | false | 2 | extended-key-21 | 2023-02-08T03:41:00 |
| 3 | 2024-03-26T06:34:00 | 2022-01-22T16:28:00 | true | 3 | integrated-key-22 | 2024-07-19T10:58:00 |
| 4 | 2025-08-10T13:51:00 | 2023-06-06T23:45:00 | false | 4 | seasonal-key-23 | 2025-12-03T17:15:00 |

This final view joins user sessions to their activation keys, answering: which activation key is each session using? The result includes the session start and end timestamps, the current-session flag, and the user identifier alongside the key string, license type, and issue date. A session that started on 2025-08-10 and has ended is associated with the key `seasonal-key-23`, issued on 2025-12-03 under a Concurrent license. This view enables administrators to correlate session activity with specific licenses, supporting compliance reporting and license utilisation analysis.

### Synthesis

The five base tables—ActivationKey, LicensedSoftware, Customer, AuthorisedUser, and UserSession—form a coherent record of software licensing from issuance through consumption. Each table captures a distinct stage: the key defines the license terms, the software defines the product, the customer defines the purchaser, the authorised user defines the operator, and the session defines the actual access. The eleven views join these tables in every meaningful pairwise combination, producing a complete set of analytical lenses through which administrators can audit entitlements, track usage, reconcile billing, and manage capacity. Together, the tables and views provide a structured, queryable account of the entire licensing lifecycle.