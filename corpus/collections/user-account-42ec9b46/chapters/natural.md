## Identity, Access, and Resource Orchestration in Distributed Digital Environments

Modern digital ecosystems require precise coordination between users, their authentication mechanisms, the services they consume, the applications that deliver functionality, the devices through which they interact, and the storage infrastructure that preserves their work. This chapter examines the operational relationships among these entities, drawing on concrete records from a fictional but representative platform. The data reveals how organizations manage user lifecycles, credential rotation, service deployment, and cross-platform device synchronization within a unified architecture.

**Table `UserAccount`**

| id | accountId | username | temporaryPassword | status | enrollmentDate | lastLoginTimestamp | credentialId | serviceId | deviceId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review | extended-temporar-33 | active | 2022-05-11T16:00:00 | 2024-11-16T10:42:00 | 168538 | 1 | 1000 |
| 2 | 10207152 | Baseline Initiative | integrated-temporar-34 | inactive | 2023-10-22T23:17:00 | 2025-04-27T17:59:00 | default_chart_a_tax_10 | 2 | 1001 |
| 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | seasonal-temporar-35 | suspended | 2024-03-06T06:34:00 | 2022-09-11T00:16:00 | ChIJIbRFlPtt5kcR5kM81XdpSfI | 3 | 1002 |
| 4 | 3717632 | Adaptive Cluster | regional-temporar-36 | active | 2025-08-17T13:51:00 | 2023-02-22T07:33:00 | 2002007020220 | 4 | 1003 |

The UserAccount table serves as the central registry of human participants in the platform. Each account carries a unique identifier, a human-readable username, and a status that reflects its current operational state—active, inactive, or suspended. The enrollment date marks when the account was provisioned, while the last login timestamp provides a recency signal for access governance. Consider the first record: the account labeled "Pilot Review" was enrolled on May 11, 2022, and last accessed on November 16, 2024, maintaining an active status throughout. By contrast, the "Distributed Model A" account (row 3) holds a suspended status, with its last login occurring nearly two years before the most recent enrollment in the dataset. The presence of temporary password fields—such as `extended-temporar-33` and `seasonal-temporar-35`—indicates that accounts may be provisioned with transient credentials before users establish permanent authentication material.

**Table `AuthenticationCredential`**

| credentialId | credentialType | isTemporary | issueDate | expiryDate | accountId | serviceId |
|---|---|---|---|---|---|---|
| 168538 | username_password | false | 2023-02-01T13:51:00 | 2023-10-24T21:15:00 | 1 | 1 |
| default_chart_a_tax_10 | sso_token | true | 2024-07-12T20:08:00 | 2024-03-08T04:32:00 | 2 | 2 |
| ChIJIbRFlPtt5kcR5kM81XdpSfI | username_password | false | 2025-12-23T03:25:00 | 2025-08-19T11:49:00 | 3 | 3 |
| 2002007020220 | sso_token | true | 2022-05-07T10:42:00 | 2022-01-03T18:06:00 | 4 | 4 |

AuthenticationCredential captures the specific mechanisms through which users prove their identity. Each credential carries a type—either `username_password` or `sso_token`—and a temporary flag that distinguishes short-lived credentials from persistent ones. Issue and expiry dates define the credential's validity window, enabling automated rotation and revocation. The first credential, `168538`, is a non-temporary username-password pair issued on February 1, 2023, and set to expire on October 24, 2023. The second credential, `default_chart_a_tax_10`, is an SSO token marked as temporary, with an issue date of July 12, 2024, and an expiry date of March 8, 2024—a temporal inversion that suggests the credential expired before it was issued, a condition that would trigger immediate revocation in a production system. These temporal anomalies are precisely the kinds of edge cases that automated credential management must detect and resolve.

**Table `DigitalService`**

| id | serviceId | serviceName | baseUrl | serviceType | status | lastUpdated | applicationId | storageId |
|---|---|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | https://bugs.launchpad.net/vmware-nsx/+bug/1570676 | LMS | active | 2023-06-17T17:27:00 | 1 | 100 |
| 2 | 3990164 | Adaptive Model D | https://api.github.com/repos/thombashi/tcconfig | productivity_suite | deprecated | 2024-11-01T00:44:00 | 2 | 101 |
| 3 | 5844258 | Primary Cluster | http://www.aurelienribon.com | cloud_storage | maintenance | 2025-04-12T07:01:00 | 3 | 102 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | https://grants.nih.gov/grants/guide/pa-files/PAR-16-349.html | portal | active | 2022-09-23T14:18:00 | 4 | 103 |

DigitalService represents the platform's service catalog, encompassing learning management systems, productivity suites, cloud storage providers, and portals. Each service has a base URL, a type classification, and a status that reflects its operational readiness—active, deprecated, or under maintenance. The "Distributed Initiative" service (row 1) operates as an LMS at a Launchpad URL and holds active status, while the "Adaptive Model D" service (row 2) is a productivity suite marked deprecated, indicating it is scheduled for retirement. The "Primary Cluster" service (row 3) is currently under maintenance, a state that would temporarily restrict user access. Service types and statuses together form the basis for capacity planning and user migration strategies.

**Table `SoftwareApplication`**

| id | appId | appName | version | platform | isBlendedLearningTool | serviceId | deviceId |
|---|---|---|---|---|---|---|---|
| 1 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster | seasonal-version-71 | web | true | 1 | 1000 |
| 2 | 4463647 | Baseline Review | regional-version-72 | desktop | false | 2 | 1001 |
| 3 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A | legacy-version-73 | mobile | true | 3 | 1002 |
| 4 | 89820 | Adaptive Model | compact-version-74 | web | false | 4 | 1003 |

SoftwareApplication documents the client-side software that users install or access to interact with digital services. Applications are classified by platform—web, desktop, or mobile—and carry version strings that follow a naming convention such as `seasonal-version-71` or `compact-version-74`. A boolean flag, `isBlendedLearningTool`, identifies applications designed for hybrid learning environments. The "Pilot Cluster" application (row 1) runs on the web platform and is designated as a blended learning tool, whereas "Baseline Review" (row 2) is a desktop application without that designation. Platform diversity necessitates cross-platform testing and coordinated release management.

**Table `UserDevice`**

| id | deviceId | deviceType | osType | lastSyncDate | accountId | applicationId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|
| 1000 | 3744015 | laptop | windows | 2023-10-02T09:39:00 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 392495 | phone | macos | 2024-03-13T16:56:00 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 209205 | tablet | ios | 2025-08-24T23:13:00 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 22106999 | laptop | android | 2022-01-08T06:30:00 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

UserDevice tracks the hardware endpoints through which users access the platform. Each device record specifies its type—laptop, phone, or tablet—and its operating system—Windows, macOS, iOS, or Android. The last sync date indicates when the device last communicated with the platform, providing a signal for device health monitoring. The device with identifier `3744015` (row 1) is a Windows laptop last synchronized on October 2, 2023, while the device `392495` (row 2) is a macOS phone last synced on March 13, 2024. Creation and update timestamps enable audit trails for device lifecycle management.

**Table `CloudStorage`**

| id | storageId | storageName | capacityTb | isPrivate | autoSaveEnabled | serviceId | documentId |
|---|---|---|---|---|---|---|---|
| 100 | 82868 | Legacy Standard D | 15.95 | false | true | 1 | 1000 |
| 101 | 611501 | Regional Framework | 18.90 | true | false | 2 | 1001 |
| 102 | id_29 | Seasonal Protocol | 21.85 | false | true | 3 | 1002 |
| 103 | ZUGLB8 | Integrated Programme A | 24.80 | true | false | 4 | 1003 |

CloudStorage records the storage resources allocated to services. Each storage entity has a name, a capacity measured in terabytes, and configuration flags for privacy and auto-save behavior. The "Legacy Standard D" storage (row 1) offers 15.95 TB of capacity, is not private, and has auto-save enabled. In contrast, "Regional Framework" (row 2) provides 18.90 TB, is private, and has auto-save disabled. Capacity ranges across the dataset span from approximately 16 to 25 terabytes, reflecting the varying storage demands of different services.

**Table `UserDocument`**

| documentId | fileName | fileType | lastModified | isSynced | accountId | storageId | applicationId |
|---|---|---|---|---|---|---|---|
| 1000 | Thomas Shannon | docx | 2022-05-05T04:36:00 | true | 1 | 100 | 1 |
| 1001 | Susan Wagner | pptx | 2023-10-16T11:53:00 | false | 2 | 101 | 2 |
| 1002 | Peter Mcdowell | xlsx | 2024-03-27T18:10:00 | true | 3 | 102 | 3 |
| 1003 | Laurie Wallace | one | 2025-08-11T01:27:00 | false | 4 | 103 | 4 |

UserDocument captures the individual documents created, stored, or managed by users within the platform. Each document is associated with a user account, a cloud storage location, and a software application through which it was created or edited. Document metadata includes creation and modification timestamps, enabling version tracking and audit compliance.

The following views synthesize these base tables into analytical perspectives that answer specific operational questions.

**View `v_user_account_authentication_credential`**

```sql
CREATE VIEW v_user_account_authentication_credential AS
SELECT a.id, a.accountId, a.username, a.temporaryPassword, b.credentialId AS credential_credentialId, b.credentialType AS credential_credentialType, b.isTemporary AS credential_isTemporary
FROM UserAccount a JOIN AuthenticationCredential b ON a.credentialId = b.credentialId;
```

| id | accountId | username | temporaryPassword | credential_credentialId | credential_credentialType | credential_isTemporary |
|---|---|---|---|---|---|---|
| 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review | extended-temporar-33 | 168538 | username_password | false |
| 2 | 10207152 | Baseline Initiative | integrated-temporar-34 | default_chart_a_tax_10 | sso_token | true |
| 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | seasonal-temporar-35 | ChIJIbRFlPtt5kcR5kM81XdpSfI | username_password | false |
| 4 | 3717632 | Adaptive Cluster | regional-temporar-36 | 2002007020220 | sso_token | true |

This view joins UserAccount with AuthenticationCredential to answer the question: which authentication credentials belong to which user accounts, and what is the current state of each account? The join produces rows that pair account identifiers with credential types, issue dates, and expiry dates. For instance, the account "Pilot Review" (account ID `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3`) is linked to credential `168538`, a non-temporary username-password pair. This relationship enables administrators to audit which accounts have valid credentials and which may require credential renewal.

**View `v_user_account_digital_service`**

```sql
CREATE VIEW v_user_account_digital_service AS
SELECT a.id, a.accountId, a.username, a.temporaryPassword, b.id AS service_id, b.serviceId AS service_serviceId, b.serviceName AS service_serviceName
FROM UserAccount a JOIN DigitalService b ON a.serviceId = b.id;
```

| id | accountId | username | temporaryPassword | service_id | service_serviceId | service_serviceName |
|---|---|---|---|---|---|---|
| 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review | extended-temporar-33 | 1 | 1996925 | Distributed Initiative |
| 2 | 10207152 | Baseline Initiative | integrated-temporar-34 | 2 | 3990164 | Adaptive Model D |
| 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | seasonal-temporar-35 | 3 | 5844258 | Primary Cluster |
| 4 | 3717632 | Adaptive Cluster | regional-temporar-36 | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |

By joining UserAccount with DigitalService, this view reveals which services each user account is associated with. The resulting rows connect account usernames to service names, types, and statuses. The "Pilot Review" account maps to the "Distributed Initiative" service, an active LMS, while the "Adaptive Cluster" account (row 4) maps to the "Composite Review" portal. This mapping is essential for service-level reporting and for identifying accounts that may need migration when services are deprecated.

**View `v_user_account_user_device`**

```sql
CREATE VIEW v_user_account_user_device AS
SELECT a.id, a.accountId, a.username, a.temporaryPassword, b.id AS device_id, b.deviceId AS device_deviceId, b.deviceType AS device_deviceType
FROM UserAccount a JOIN UserDevice b ON a.deviceId = b.id;
```

| id | accountId | username | temporaryPassword | device_id | device_deviceId | device_deviceType |
|---|---|---|---|---|---|---|
| 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review | extended-temporar-33 | 1000 | 3744015 | laptop |
| 2 | 10207152 | Baseline Initiative | integrated-temporar-34 | 1001 | 392495 | phone |
| 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | seasonal-temporar-35 | 1002 | 209205 | tablet |
| 4 | 3717632 | Adaptive Cluster | regional-temporar-36 | 1003 | 22106999 | laptop |

This view links user accounts to their registered devices, answering the question: which devices are associated with each user account? The join produces rows that pair account usernames with device types and operating systems. The "Pilot Review" account is associated with a Windows laptop (device ID `3744015`), while the "Baseline Initiative" account (row 2) is linked to a macOS phone (device ID `392495`). This relationship supports device inventory management and helps identify accounts with multiple or missing device registrations.

**View `v_authentication_credential_user_account`**

```sql
CREATE VIEW v_authentication_credential_user_account AS
SELECT a.credentialId, a.credentialType, a.isTemporary, a.issueDate, b.id AS account_id, b.accountId AS account_accountId, b.username AS account_username
FROM AuthenticationCredential a JOIN UserAccount b ON a.accountId = b.id;
```

| credentialId | credentialType | isTemporary | issueDate | account_id | account_accountId | account_username |
|---|---|---|---|---|---|---|
| 168538 | username_password | false | 2023-02-01T13:51:00 | 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review |
| default_chart_a_tax_10 | sso_token | true | 2024-07-12T20:08:00 | 2 | 10207152 | Baseline Initiative |
| ChIJIbRFlPtt5kcR5kM81XdpSfI | username_password | false | 2025-12-23T03:25:00 | 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A |
| 2002007020220 | sso_token | true | 2022-05-07T10:42:00 | 4 | 3717632 | Adaptive Cluster |

This view reverses the perspective of the first view, starting from the credential and reaching out to the account. It answers: for each authentication credential, what is the status and enrollment date of the associated account? The credential `default_chart_a_tax_10` (row 2) is linked to the "Baseline Initiative" account, which holds an inactive status. This reverse lookup is useful for credential revocation workflows, where an administrator starts with a compromised credential and needs to identify the affected account for remediation.

**View `v_authentication_credential_digital_service`**

```sql
CREATE VIEW v_authentication_credential_digital_service AS
SELECT a.credentialId, a.credentialType, a.isTemporary, a.issueDate, b.id AS service_id, b.serviceId AS service_serviceId, b.serviceName AS service_serviceName
FROM AuthenticationCredential a JOIN DigitalService b ON a.serviceId = b.id;
```

| credentialId | credentialType | isTemporary | issueDate | service_id | service_serviceId | service_serviceName |
|---|---|---|---|---|---|---|
| 168538 | username_password | false | 2023-02-01T13:51:00 | 1 | 1996925 | Distributed Initiative |
| default_chart_a_tax_10 | sso_token | true | 2024-07-12T20:08:00 | 2 | 3990164 | Adaptive Model D |
| ChIJIbRFlPtt5kcR5kM81XdpSfI | username_password | false | 2025-12-23T03:25:00 | 3 | 5844258 | Primary Cluster |
| 2002007020220 | sso_token | true | 2022-05-07T10:42:00 | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |

This join connects authentication credentials to the digital services they authenticate against. The resulting rows pair credential types with service names and types. The username-password credential `168538` (row 1) is associated with the "Distributed Initiative" LMS service, while the temporary SSO token `default_chart_a_tax_10` (row 2) is linked to the "Adaptive Model D" productivity suite. This view helps security teams understand which services are protected by which credential types and identify services that rely on temporary credentials.

**View `v_digital_service_software_application`**

```sql
CREATE VIEW v_digital_service_software_application AS
SELECT a.id, a.serviceId, a.serviceName, a.baseUrl, b.id AS application_id, b.appId AS application_appId, b.appName AS application_appName
FROM DigitalService a JOIN SoftwareApplication b ON a.applicationId = b.id;
```

| id | serviceId | serviceName | baseUrl | application_id | application_appId | application_appName |
|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | https://bugs.launchpad.net/vmware-nsx/+bug/1570676 | 1 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster |
| 2 | 3990164 | Adaptive Model D | https://api.github.com/repos/thombashi/tcconfig | 2 | 4463647 | Baseline Review |
| 3 | 5844258 | Primary Cluster | http://www.aurelienribon.com | 3 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | https://grants.nih.gov/grants/guide/pa-files/PAR-16-349.html | 4 | 89820 | Adaptive Model |

This view joins DigitalService with SoftwareApplication to answer: which software applications are deployed for each digital service? The resulting rows pair service names with application names, versions, and platforms. The "Distributed Initiative" service (row 1) is associated with the "Pilot Cluster" application, a web-based blended learning tool running version `seasonal-version-71`. The "Primary Cluster" service (row 3) maps to the "Distributed Initiative A" application on the mobile platform. This relationship is critical for application lifecycle management, as service deprecation may trigger application retirement.

**View `v_digital_service_cloud_storage`**

```sql
CREATE VIEW v_digital_service_cloud_storage AS
SELECT a.id, a.serviceId, a.serviceName, a.baseUrl, b.id AS storage_id, b.storageId AS storage_storageId, b.storageName AS storage_storageName
FROM DigitalService a JOIN CloudStorage b ON a.storageId = b.id;
```

| id | serviceId | serviceName | baseUrl | storage_id | storage_storageId | storage_storageName |
|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | https://bugs.launchpad.net/vmware-nsx/+bug/1570676 | 100 | 82868 | Legacy Standard D |
| 2 | 3990164 | Adaptive Model D | https://api.github.com/repos/thombashi/tcconfig | 101 | 611501 | Regional Framework |
| 3 | 5844258 | Primary Cluster | http://www.aurelienribon.com | 102 | id_29 | Seasonal Protocol |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | https://grants.nih.gov/grants/guide/pa-files/PAR-16-349.html | 103 | ZUGLB8 | Integrated Programme A |

This join connects digital services to their associated cloud storage resources. The resulting rows pair service names with storage names, capacities, and configuration flags. The "Distributed Initiative" service (row 1) is linked to "Legacy Standard D" storage, which provides 15.95 TB with auto-save enabled. The "Composite Review" service (row 4) maps to "Integrated Programme A" storage, a private 24.80 TB repository. This view supports storage capacity planning and helps identify services that may require storage migration during decommissioning.

**View `v_software_application_digital_service`**

```sql
CREATE VIEW v_software_application_digital_service AS
SELECT a.id, a.appId, a.appName, a.version, b.id AS service_id, b.serviceId AS service_serviceId, b.serviceName AS service_serviceName
FROM SoftwareApplication a JOIN DigitalService b ON a.serviceId = b.id;
```

| id | appId | appName | version | service_id | service_serviceId | service_serviceName |
|---|---|---|---|---|---|---|
| 1 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster | seasonal-version-71 | 1 | 1996925 | Distributed Initiative |
| 2 | 4463647 | Baseline Review | regional-version-72 | 2 | 3990164 | Adaptive Model D |
| 3 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A | legacy-version-73 | 3 | 5844258 | Primary Cluster |
| 4 | 89820 | Adaptive Model | compact-version-74 | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |

Reversing the perspective of the service-application join, this view starts from the application and reaches out to the service. It answers: for each software application, which digital service does it support? The "Pilot Cluster" application (row 1) supports the "Distributed Initiative" service, while "Baseline Review" (row 2) supports the "Adaptive Model D" productivity suite. This reverse lookup is useful when troubleshooting application-specific issues, as it identifies the upstream service that the application depends on.

**View `v_software_application_user_device`**

```sql
CREATE VIEW v_software_application_user_device AS
SELECT a.id, a.appId, a.appName, a.version, b.id AS device_id, b.deviceId AS device_deviceId, b.deviceType AS device_deviceType
FROM SoftwareApplication a JOIN UserDevice b ON a.deviceId = b.id;
```

| id | appId | appName | version | device_id | device_deviceId | device_deviceType |
|---|---|---|---|---|---|---|
| 1 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster | seasonal-version-71 | 1000 | 3744015 | laptop |
| 2 | 4463647 | Baseline Review | regional-version-72 | 1001 | 392495 | phone |
| 3 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A | legacy-version-73 | 1002 | 209205 | tablet |
| 4 | 89820 | Adaptive Model | compact-version-74 | 1003 | 22106999 | laptop |

This view joins SoftwareApplication with UserDevice to answer: which devices are running which software applications? The resulting rows pair application names and platforms with device types and operating systems. The "Pilot Cluster" web application (row 1) runs on a Windows laptop (device ID `3744015`), while "Baseline Review" (row 2) runs on a macOS phone (device ID `392495`). This relationship is essential for platform compatibility testing and for identifying devices that may need application updates.

**View `v_user_device_user_account`**

```sql
CREATE VIEW v_user_device_user_account AS
SELECT a.id, a.deviceId, a.deviceType, a.osType, b.id AS account_id, b.accountId AS account_accountId, b.username AS account_username
FROM UserDevice a JOIN UserAccount b ON a.accountId = b.id;
```

| id | deviceId | deviceType | osType | account_id | account_accountId | account_username |
|---|---|---|---|---|---|---|
| 1000 | 3744015 | laptop | windows | 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review |
| 1001 | 392495 | phone | macos | 2 | 10207152 | Baseline Initiative |
| 1002 | 209205 | tablet | ios | 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A |
| 1003 | 22106999 | laptop | android | 4 | 3717632 | Adaptive Cluster |

This view reverses the device-account relationship, starting from the device and reaching out to the account. It answers: for each registered device, which user account owns it? The Windows laptop (device ID `3744015`, row 1) is owned by the "Pilot Review" account, while the macOS phone (device ID `392495`, row 2) is owned by the "Baseline Initiative" account. This perspective is useful for device-level audits, where an administrator starts with a compromised device and needs to identify the associated account for access revocation.

**View `v_user_device_software_application`**

```sql
CREATE VIEW v_user_device_software_application AS
SELECT a.id, a.deviceId, a.deviceType, a.osType, b.id AS application_id, b.appId AS application_appId, b.appName AS application_appName
FROM UserDevice a JOIN SoftwareApplication b ON a.applicationId = b.id;
```

| id | deviceId | deviceType | osType | application_id | application_appId | application_appName |
|---|---|---|---|---|---|---|
| 1000 | 3744015 | laptop | windows | 1 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster |
| 1001 | 392495 | phone | macos | 2 | 4463647 | Baseline Review |
| 1002 | 209205 | tablet | ios | 3 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A |
| 1003 | 22106999 | laptop | android | 4 | 89820 | Adaptive Model |

This join connects user devices to the software applications installed on them. The resulting rows pair device types and operating systems with application names and versions. The Windows laptop (device ID `3744015`, row 1) runs the "Pilot Cluster" application, version `seasonal-version-71`, while the macOS phone (device ID `392495`, row 2) runs "Baseline Review," version `regional-version-72`. This view supports application deployment tracking and helps identify devices running outdated application versions.

**View `v_cloud_storage_digital_service`**

```sql
CREATE VIEW v_cloud_storage_digital_service AS
SELECT a.id, a.storageId, a.storageName, a.capacityTb, b.id AS service_id, b.serviceId AS service_serviceId, b.serviceName AS service_serviceName
FROM CloudStorage a JOIN DigitalService b ON a.serviceId = b.id;
```

| id | storageId | storageName | capacityTb | service_id | service_serviceId | service_serviceName |
|---|---|---|---|---|---|---|
| 100 | 82868 | Legacy Standard D | 15.95 | 1 | 1996925 | Distributed Initiative |
| 101 | 611501 | Regional Framework | 18.90 | 2 | 3990164 | Adaptive Model D |
| 102 | id_29 | Seasonal Protocol | 21.85 | 3 | 5844258 | Primary Cluster |
| 103 | ZUGLB8 | Integrated Programme A | 24.80 | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |

This view reverses the storage-service relationship, starting from cloud storage and reaching out to the digital service. It answers: for each storage resource, which digital service uses it? The "Legacy Standard D" storage (row 1) is used by the "Distributed Initiative" service, while "Regional Framework" (row 2) supports the "Adaptive Model D" productivity suite. This perspective is useful for storage decommissioning workflows, where an administrator starts with a storage resource and needs to identify the dependent services before migration.

**View `v_cloud_storage_user_document`**

```sql
CREATE VIEW v_cloud_storage_user_document AS
SELECT a.id, a.storageId, a.storageName, a.capacityTb, b.documentId AS document_documentId, b.fileName AS document_fileName, b.fileType AS document_fileType
FROM CloudStorage a JOIN UserDocument b ON a.documentId = b.documentId;
```

| id | storageId | storageName | capacityTb | document_documentId | document_fileName | document_fileType |
|---|---|---|---|---|---|---|
| 100 | 82868 | Legacy Standard D | 15.95 | 1000 | Thomas Shannon | docx |
| 101 | 611501 | Regional Framework | 18.90 | 1001 | Susan Wagner | pptx |
| 102 | id_29 | Seasonal Protocol | 21.85 | 1002 | Peter Mcdowell | xlsx |
| 103 | ZUGLB8 | Integrated Programme A | 24.80 | 1003 | Laurie Wallace | one |

This join connects cloud storage to the documents stored within it. The resulting rows pair storage names and capacities with document identifiers and creation timestamps. The "Legacy Standard D" storage (row 1) contains document `1000`, created on January 1, 2025, while "Regional Framework" (row 2) contains document `1001`, created on February 6, 2025. This view supports document retention policies and helps identify storage resources that may be approaching capacity limits.

**View `v_user_document_user_account`**

```sql
CREATE VIEW v_user_document_user_account AS
SELECT a.documentId, a.fileName, a.fileType, a.lastModified, b.id AS account_id, b.accountId AS account_accountId, b.username AS account_username
FROM UserDocument a JOIN UserAccount b ON a.accountId = b.id;
```

| documentId | fileName | fileType | lastModified | account_id | account_accountId | account_username |
|---|---|---|---|---|---|---|
| 1000 | Thomas Shannon | docx | 2022-05-05T04:36:00 | 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review |
| 1001 | Susan Wagner | pptx | 2023-10-16T11:53:00 | 2 | 10207152 | Baseline Initiative |
| 1002 | Peter Mcdowell | xlsx | 2024-03-27T18:10:00 | 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A |
| 1003 | Laurie Wallace | one | 2025-08-11T01:27:00 | 4 | 3717632 | Adaptive Cluster |

This view links user documents to their owning accounts, answering the question: which user account created or owns each document? The resulting rows pair document identifiers with account usernames and statuses. Document `1000` (row 1) is owned by the "Pilot Review" account, which holds an active status, while document `1001` (row 2) is owned by the "Baseline Initiative" account, which is inactive. This relationship is critical for document ownership audits and for determining whether inactive accounts have associated documents that require transfer or archival.

**View `v_user_document_cloud_storage`**

```sql
CREATE VIEW v_user_document_cloud_storage AS
SELECT a.documentId, a.fileName, a.fileType, a.lastModified, b.id AS storage_id, b.storageId AS storage_storageId, b.storageName AS storage_storageName
FROM UserDocument a JOIN CloudStorage b ON a.storageId = b.id;
```

| documentId | fileName | fileType | lastModified | storage_id | storage_storageId | storage_storageName |
|---|---|---|---|---|---|---|
| 1000 | Thomas Shannon | docx | 2022-05-05T04:36:00 | 100 | 82868 | Legacy Standard D |
| 1001 | Susan Wagner | pptx | 2023-10-16T11:53:00 | 101 | 611501 | Regional Framework |
| 1002 | Peter Mcdowell | xlsx | 2024-03-27T18:10:00 | 102 | id_29 | Seasonal Protocol |
| 1003 | Laurie Wallace | one | 2025-08-11T01:27:00 | 103 | ZUGLB8 | Integrated Programme A |

This join connects user documents to the cloud storage locations where they reside. The resulting rows pair document identifiers with storage names, capacities, and privacy settings. Document `1000` (row 1) resides in "Legacy Standard D" storage, a non-private 15.95 TB repository with auto-save enabled, while document `1001` (row 2) is stored in "Regional Framework," a private 18.90 TB repository. This view supports data governance by revealing which documents are stored in private versus public storage and helps identify documents that may need to be migrated to meet compliance requirements.

**View `v_user_document_software_application`**

```sql
CREATE VIEW v_user_document_software_application AS
SELECT a.documentId, a.fileName, a.fileType, a.lastModified, b.id AS application_id, b.appId AS application_appId, b.appName AS application_appName
FROM UserDocument a JOIN SoftwareApplication b ON a.applicationId = b.id;
```

| documentId | fileName | fileType | lastModified | application_id | application_appId | application_appName |
|---|---|---|---|---|---|---|
| 1000 | Thomas Shannon | docx | 2022-05-05T04:36:00 | 1 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster |
| 1001 | Susan Wagner | pptx | 2023-10-16T11:53:00 | 2 | 4463647 | Baseline Review |
| 1002 | Peter Mcdowell | xlsx | 2024-03-27T18:10:00 | 3 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A |
| 1003 | Laurie Wallace | one | 2025-08-11T01:27:00 | 4 | 89820 | Adaptive Model |

This final view links user documents to the software applications through which they were created or edited. The resulting rows pair document identifiers with application names, versions, and platforms. Document `1000` (row 1) was created using the "Pilot Cluster" web application, while document `1001` (row 2) was created using "Baseline Review" on the desktop platform. This relationship is essential for document format compatibility analysis, as it reveals which applications produced which documents and helps identify documents that may require conversion when applications are retired.

## Synthesis

The records examined in this chapter form an interconnected ecosystem where users authenticate through credentials, access services via applications on their devices, and store their work in cloud storage. Each entity maintains its own lifecycle—accounts are enrolled and suspended, credentials are issued and expired, services are deployed and deprecated, applications are versioned and updated, devices are synced and audited, and documents are created and archived. The views presented here provide the analytical lenses through which platform operators can answer specific operational questions, from credential revocation to storage capacity planning. Understanding these relationships is fundamental to maintaining a secure, compliant, and performant digital environment.