The software licensing ecosystem described here captures the lifecycle of licensed products from issuance through activation, assignment, and active use. At its core, the domain revolves around five entity types: activation keys that gate access, licensed software products that are governed by those keys, customers who hold the registrations, authorised users who consume the software, and user sessions that record each active engagement. The relational schema normalises these entities into five base tables, each carrying a primary key and a set of foreign keys that encode the cardinality-bounded relationships between them. Twelve materialised views then reconstruct the most common domain facts by joining two tables at a time, allowing downstream consumers to query a single logical entity without writing joins themselves.

## Base Tables and Their Structural Roles

The foundation of the schema is the `ActivationKey` table, which stores the gatekeeping records that unlock software for use. Each row carries a surrogate primary key `id`, a human-readable `keyString` such as `pilot-key-20` or `extended-key-21`, an `issuedDate` timestamp, a `licenseType` that is either `SUSM` or `Concurrent`, and a licensing window defined by `licensePeriodStart` and `licensePeriodEnd`. The column `maxConcurrentSessions` caps how many simultaneous sessions a key permits — values in the data range from 36 to 60. Two foreign keys anchor the key to the rest of the domain: `softwareId` points to a row in `LicensedSoftware`, and `customerRegistrationNumber` points to a row in `Customer`. The table is captured in its entirety below.

**Table `ActivationKey`**

| id | keyString | issuedDate | licenseType | licensePeriodStart | licensePeriodEnd | maxConcurrentSessions | softwareId | customerRegistrationNumber |
|---|---|---|---|---|---|---|---|---|
| 1 | pilot-key-20 | 2022-09-24T20:24:00 | SUSM | 2025-08-27 | 2023-10-22 | 36 | 1 | REG-2136 |
| 2 | extended-key-21 | 2023-02-08T03:41:00 | Concurrent | 2022-01-11 | 2024-03-06 | 44 | 2 | REG-2142 |
| 3 | integrated-key-22 | 2024-07-19T10:58:00 | SUSM | 2023-06-22 | 2025-08-17 | 52 | 3 | REG-2148 |
| 4 | seasonal-key-23 | 2025-12-03T17:15:00 | Concurrent | 2024-11-06 | 2022-01-01 | 60 | 4 | REG-2154 |

The `LicensedSoftware` table describes the products themselves. Its primary key is `id`, and each row carries a `softwareName` (for example, `Primary Review A` or `Compact Model`), a `versionNumber` such as `VER-2245`, a boolean `isCloudService` flag, a `lastUpdated` timestamp, and a `createdAt` timestamp. Two foreign keys link the product to its licensing context: `keyId` references `ActivationKey.id`, and `userId` references `AuthorisedUser.id`. The table appears in full below.

**Table `LicensedSoftware`**

| id | softwareName | versionNumber | isCloudService | lastUpdated | keyId | userId | createdAt |
|---|---|---|---|---|---|---|---|
| 1 | Primary Review A | VER-2245 | true | 2023-06-17T17:27:00 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | Composite Initiative | VER-2249 | false | 2024-11-01T00:44:00 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | Compact Model | VER-2253 | true | 2025-04-12T07:01:00 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | Legacy Cluster D | VER-2257 | false | 2022-09-23T14:18:00 | 4 | 4 | 2025-04-16 09:14:00 |

The `Customer` table holds the registration records for the entities or individuals that purchase licenses. Its columns are `customerType` (either `Individual` or `Entity`), `legalName` (such as `Jorge Sullivan` or `Walter Pratt`), `registrationNumber` (a natural key like `REG-2136`), `registeredAddress` (for instance, `regional-register-36`), and two foreign keys: `keyId` pointing to `ActivationKey.id` and `userId` pointing to `AuthorisedUser.id`. The complete table is shown below.

**Table `Customer`**

| customerType | legalName | registrationNumber | registeredAddress | keyId | userId |
|---|---|---|---|---|---|
| Individual | Jorge Sullivan | REG-2136 | regional-register-36 | 1 | 1 |
| Entity | Walter Pratt | REG-2142 | legacy-register-37 | 2 | 2 |
| Individual | Home Medix Oxygen | REG-2148 | compact-register-38 | 3 | 3 |
| Entity | Hector Garcia | REG-2154 | composite-register-39 | 4 | 4 |

The `AuthorisedUser` table records the people who are permitted to use the software. Its primary key is `id`, and each row carries a `userName` (e.g. `Desiree Cain` or `Nicole Todd`), a `userRole` (`Employee`, `Student`, or `Individual`), a boolean `isConcurrent` flag indicating whether the user is allowed concurrent logins, and two foreign keys: `customerRegistrationNumber` referencing `Customer.registrationNumber` and `softwareId` referencing `LicensedSoftware.id`. A third foreign key, `sessionId`, points to `UserSession.id`. The full table is presented below.

**Table `AuthorisedUser`**

| id | userName | userRole | isConcurrent | customerRegistrationNumber | softwareId | sessionId |
|---|---|---|---|---|---|---|
| 1 | Desiree Cain | Employee | true | REG-2136 | 1 | 1 |
| 2 | Jennifer Summers | Student | false | REG-2142 | 2 | 2 |
| 3 | Nicole Todd | Individual | true | REG-2148 | 3 | 3 |
| 4 | Rebekah Mueller | Employee | false | REG-2154 | 4 | 4 |

The `UserSession` table logs each active usage session. Its primary key is `id`, and each row records a `sessionStart` timestamp, a `sessionEnd` timestamp, a boolean `isCurrent` flag, and two foreign keys: `userId` referencing `AuthorisedUser.id` and `keyId` referencing `ActivationKey.id`. The complete table is shown below.

**Table `UserSession`**

| id | sessionStart | sessionEnd | isCurrent | userId | keyId |
|---|---|---|---|---|---|
| 1 | 2022-05-04T16:00:00 | 2024-03-27T02:54:00 | true | 1 | 1 |
| 2 | 2023-10-15T23:17:00 | 2025-08-11T09:11:00 | false | 2 | 2 |
| 3 | 2024-03-26T06:34:00 | 2022-01-22T16:28:00 | true | 3 | 3 |
| 4 | 2025-08-10T13:51:00 | 2023-06-06T23:45:00 | false | 4 | 4 |

## View-Based Reconstitution of Domain Facts

Each view materialises a single binary relationship by joining two base tables on the appropriate foreign key. The following sections describe what question each view answers and illustrate the answer with concrete rows from the data.

### `vw_activation_key_licensed_software`

This view answers the question: *which software product is governed by which activation key?* It joins `ActivationKey` to `LicensedSoftware` on `a.softwareId = b.id`, projecting the key's identifying columns alongside the software's name and version. The result is a one-to-one mapping in this dataset: the key `pilot-key-20` governs `Primary Review A` at version `VER-2245`, while `seasonal-key-23` governs `Legacy Cluster D` at version `VER-2257`.

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

### `vw_activation_key_customer`

This view answers: *which customer registration is associated with which activation key?* It joins `ActivationKey` to `Customer` on the registration number, producing rows such as `pilot-key-20` linked to `Jorge Sullivan` (registration `REG-2136`) and `extended-key-21` linked to `Walter Pratt` (registration `REG-2142`).

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

### `vw_licensed_software_activation_key`

This view answers the inverse of the first view: *which activation key governs a given software product?* It joins `LicensedSoftware` to `ActivationKey` on `b.keyId = a.id`. The row for `Compact Model` (version `VER-2253`) maps to the key `integrated-key-22`, and `Composite Initiative` (version `VER-2249`) maps to `extended-key-21`.

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

### `vw_licensed_software_authorised_user`

This view answers: *which authorised user is assigned to which software product?* It joins `LicensedSoftware` to `AuthorisedUser` on `b.userId = u.id`. The product `Primary Review A` is assigned to `Desiree Cain` (an Employee), while `Compact Model` is assigned to `Nicole Todd` (an Individual).

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

### `vw_customer_activation_key`

This view answers: *which activation key is held by which customer?* It joins `Customer` to `ActivationKey` on `c.keyId = a.id`. The customer `Home Medix Oxygen` (registration `REG-2148`) holds the key `integrated-key-22`, and `Hector Garcia` (registration `REG-2154`) holds `seasonal-key-23`.

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

### `vw_customer_authorised_user`

This view answers: *which authorised user is linked to which customer?* It joins `Customer` to `AuthorisedUser` on `c.userId = u.id`. The customer `Jorge Sullivan` is linked to the user `Desiree Cain`, and `Walter Pratt` is linked to `Jennifer Summers`.

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

### `vw_authorised_user_customer`

This view answers the inverse: *which customer is associated with a given authorised user?* It joins `AuthorisedUser` to `Customer` on `u.customerRegistrationNumber = c.registrationNumber`. The user `Rebekah Mueller` (an Employee) is associated with the customer `Hector Garcia` (registration `REG-2154`), and `Nicole Todd` (an Individual) is associated with `Home Medix Oxygen` (registration `REG-2148`).

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

### `vw_authorised_user_licensed_software`

This view answers: *which software product is assigned to a given authorised user?* It joins `AuthorisedUser` to `LicensedSoftware` on `u.softwareId = b.id`. The user `Desiree Cain` is assigned `Primary Review A` (version `VER-2245`), and `Jennifer Summers` is assigned `Composite Initiative` (version `VER-2249`).

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

### `vw_authorised_user_user_session`

This view answers: *which user session is associated with a given authorised user?* It joins `AuthorisedUser` to `UserSession` on `u.sessionId = s.id`. The user `Desiree Cain` is linked to session `1`, which started on `2022-05-04T16:00:00` and ended on `2024-03-27T02:54:00`, and the user `Nicole Todd` is linked to session `3`, which started on `2024-03-26T06:34:00`.

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

### `vw_user_session_authorised_user`

This view answers the inverse: *which authorised user is linked to a given user session?* It joins `UserSession` to `AuthorisedUser` on `s.userId = u.id`. Session `2` (started `2023-10-15T23:17:00`, ended `2025-08-11T09:11:00`) is linked to `Jennifer Summers`, and session `4` (started `2025-08-10T13:51:00`, ended `2023-06-06T23:45:00`) is linked to `Rebekah Mueller`.

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

### `vw_user_session_activation_key`

This view answers: *which activation key is associated with a given user session?* It joins `UserSession` to `ActivationKey` on `s.keyId = a.id`. Session `1` is associated with the key `pilot-key-20` (license type `SUSM`, max 36 concurrent sessions), and session `2` is associated with `extended-key-21` (license type `Concurrent`, max 44 concurrent sessions).

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

## Closing Synthesis

The schema models a software licensing domain through five normalised base tables whose foreign keys encode a web of one-to-one and one-to-many relationships between keys, products, customers, users, and sessions. Each of the twelve views materialises a single binary relationship, allowing a consumer to ask a focused question — *which software does this key govern?* or *which session did this user run?* — without writing a join. The concrete data values, from the key string `pilot-key-20` to the user `Desiree Cain` and the session spanning `2022-05-04` to `2024-03-27`, ground the abstract schema in a tangible scenario that can be queried, audited, and extended.