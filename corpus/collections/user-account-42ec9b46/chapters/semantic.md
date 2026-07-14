## Domain Modelling and Relational Materialisation

The domain under examination describes a federated digital infrastructure in which autonomous user accounts authenticate against a portfolio of digital services, each of which is implemented by a software application running on a user device and backed by cloud storage that holds user documents. The data model captures this ecosystem as seven base tables whose columns encode entity attributes and whose foreign-key columns encode cardinality-bounded relationships. The model is then materialised as twenty denormalised views that rejoin the normalised tables so that analysts can answer domain questions without writing multi-table joins themselves. Every view is a named join; every column is a domain attribute; every foreign key is a cardinality constraint.

**Table `UserAccount`**

| id | accountId | username | temporaryPassword | status | enrollmentDate | lastLoginTimestamp | credentialId | serviceId | deviceId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | Pilot Review | extended-temporar-33 | active | 2022-05-11T16:00:00 | 2024-11-16T10:42:00 | 168538 | 1 | 1000 |
| 2 | 10207152 | Baseline Initiative | integrated-temporar-34 | inactive | 2023-10-22T23:17:00 | 2025-04-27T17:59:00 | default_chart_a_tax_10 | 2 | 1001 |
| 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | seasonal-temporar-35 | suspended | 2024-03-06T06:34:00 | 2022-09-11T00:16:00 | ChIJIbRFlPtt5kcR5kM81XdpSfI | 3 | 1002 |
| 4 | 3717632 | Adaptive Cluster | regional-temporar-36 | active | 2025-08-17T13:51:00 | 2023-02-22T07:33:00 | 2002007020220 | 4 | 1003 |

The `UserAccount` table is the central actor entity. Its surrogate primary key `id` is an auto-increment integer, while the business identifier `accountId` carries either a UUID such as `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` or a numeric code like `10207152`. The `username` column holds human-readable names — `Pilot Review`, `Baseline Initiative`, `Distributed Model A`, `Adaptive Cluster` — and `temporaryPassword` stores password fragments such as `extended-temporar-33` or `integrated-temporar-34`. The `status` column is an enumerated flag with values `active`, `inactive`, and `suspended`; `enrollmentDate` and `lastLoginTimestamp` are ISO-8601 timestamps that bound the account lifecycle. Three foreign-key columns — `credentialId`, `serviceId`, and `deviceId` — anchor the account to its authentication credential, its primary digital service, and its registered device. Row 1 links credential `168538`, service `1`, and device `1000`; row 2 links `default_chart_a_tax_10`, service `2`, and device `1001`; row 3 links `ChIJIbRFlPtt5kcR5kM81XdpSfI`, service `3`, and device `1002`; row 4 links `2002007020220`, service `4`, and device `1003`. The cardinality is one-to-one in the current dataset, though the schema permits a user to hold multiple credentials or devices over time.

**Table `AuthenticationCredential`**

| credentialId | credentialType | isTemporary | issueDate | expiryDate | accountId | serviceId |
|---|---|---|---|---|---|---|
| 168538 | username_password | false | 2023-02-01T13:51:00 | 2023-10-24T21:15:00 | 1 | 1 |
| default_chart_a_tax_10 | sso_token | true | 2024-07-12T20:08:00 | 2024-03-08T04:32:00 | 2 | 2 |
| ChIJIbRFlPtt5kcR5kM81XdpSfI | username_password | false | 2025-12-23T03:25:00 | 2025-08-19T11:49:00 | 3 | 3 |
| 2002007020220 | sso_token | true | 2022-05-07T10:42:00 | 2022-01-03T18:06:00 | 4 | 4 |

The `AuthenticationCredential` table stores the credentials that prove identity. Its primary key `credentialId` is a natural key — a mix of numeric strings like `168538` and `2002007020220` and alphanumeric tokens such as `default_chart_a_tax_10` and `ChIJIbRFlPtt5kcR5kM81XdpSfI`. The `credentialType` column distinguishes `username_password` from `sso_token`; `isTemporary` is a boolean flag. `issueDate` and `expiryDate` are ISO-8601 timestamps that define the credential's validity window. For example, credential `168538` was issued on `2023-02-01T13:51:00` and expired on `2023-10-24T21:15:00`, while `default_chart_a_tax_10` was issued on `2024-07-12T20:08:00` but carries an expiry of `2024-03-08T04:32:00`, indicating a past-dated token. The foreign-key columns `accountId` and `serviceId` reference `UserAccount.id` and `DigitalService.id` respectively, binding each credential to a specific account and a specific service.

**Table `DigitalService`**

| id | serviceId | serviceName | baseUrl | serviceType | status | lastUpdated | applicationId | storageId |
|---|---|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | https://bugs.launchpad.net/vmware-nsx/+bug/1570676 | LMS | active | 2023-06-17T17:27:00 | 1 | 100 |
| 2 | 3990164 | Adaptive Model D | https://api.github.com/repos/thombashi/tcconfig | productivity_suite | deprecated | 2024-11-01T00:44:00 | 2 | 101 |
| 3 | 5844258 | Primary Cluster | http://www.aurelienribon.com | cloud_storage | maintenance | 2025-04-12T07:01:00 | 3 | 102 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | https://grants.nih.gov/grants/guide/pa-files/PAR-16-349.html | portal | active | 2022-09-23T14:18:00 | 4 | 103 |

`DigitalService` describes the software services offered to users. Its surrogate primary key `id` is an integer, while the business identifier `serviceId` carries UUIDs like `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` or numeric codes such as `1996925` and `3990164`. The `serviceName` column holds names — `Distributed Initiative`, `Adaptive Model D`, `Primary Cluster`, `Composite Review` — and `baseUrl` stores the service endpoint, for instance `https://bugs.launchpad.net/vmware-nsx/+bug/1570676` or `http://www.aurelienribon.com`. The `serviceType` column is an enumerated discriminator with values `LMS`, `productivity_suite`, `cloud_storage`, and `portal`. The `status` column mirrors the account status with values `active`, `deprecated`, and `maintenance`. The `lastUpdated` timestamp records the most recent schema or configuration change. Two foreign-key columns — `applicationId` and `storageId` — link the service to its implementing `SoftwareApplication` and its backing `CloudStorage`.

**Table `SoftwareApplication`**

| id | appId | appName | version | platform | isBlendedLearningTool | serviceId | deviceId |
|---|---|---|---|---|---|---|---|
| 1 | d6267a5e-8fc1-11eb-924d-9cd76263cbd0 | Pilot Cluster | seasonal-version-71 | web | true | 1 | 1000 |
| 2 | 4463647 | Baseline Review | regional-version-72 | desktop | false | 2 | 1001 |
| 3 | ceffd6ca-8fd1-11eb-924d-9cd76263cbd0 | Distributed Initiative A | legacy-version-73 | mobile | true | 3 | 1002 |
| 4 | 89820 | Adaptive Model | compact-version-74 | web | false | 4 | 1003 |

`SoftwareApplication` captures the application layer. Its surrogate primary key `id` is an integer; the business identifier `appId` carries UUIDs such as `d6267a5e-8fc1-11eb-924d-9cd76263cbd0` or numeric codes like `4463647`. The `appName` column holds names — `Pilot Cluster`, `Baseline Review`, `Distributed Initiative A`, `Adaptive Model` — and `version` stores version strings like `seasonal-version-71` or `compact-version-74`. The `platform` column is an enumerated discriminator with values `web`, `desktop`, and `mobile`. The boolean `isBlendedLearningTool` flags educational applications; rows 1 and 3 are `true`, rows 2 and 4 are `false`. The foreign-key columns `serviceId` and `deviceId` reference `DigitalService.id` and `UserDevice.id`, establishing the application's service binding and its target device.

**Table `UserDevice`**

| id | deviceId | deviceType | osType | lastSyncDate | accountId | applicationId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|
| 1000 | 3744015 | laptop | windows | 2023-10-02T09:39:00 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 392495 | phone | macos | 2024-03-13T16:56:00 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 209205 | tablet | ios | 2025-08-24T23:13:00 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 22106999 | laptop | android | 2022-01-08T06:30:00 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

`UserDevice` models the hardware endpoints. Its surrogate primary key `id` is an integer, while the business identifier `deviceId` carries numeric codes such as `3744015`, `392495`, `209205`, and `22106999`. The `deviceType` column distinguishes `laptop`, `phone`, and `tablet`; `osType` carries `windows`, `macos`, `ios`, and `android`. The `lastSyncDate` timestamp records the most recent data synchronisation. The foreign-key columns `accountId` and `applicationId` reference `UserAccount.id` and `SoftwareApplication.id`, binding the device to its owner and to the application it runs. Rows 1000 through 1003 each pair a unique device with a unique account and application.

**Table `CloudStorage`**

| id | storageId | storageName | capacityTb | isPrivate | autoSaveEnabled | serviceId | documentId |
|---|---|---|---|---|---|---|---|
| 100 | 82868 | Legacy Standard D | 15.95 | false | true | 1 | 1000 |
| 101 | 611501 | Regional Framework | 18.90 | true | false | 2 | 1001 |
| 102 | id_29 | Seasonal Protocol | 21.85 | false | true | 3 | 1002 |
| 103 | ZUGLB8 | Integrated Programme A | 24.80 | true | false | 4 | 1003 |

`CloudStorage` represents the persistent storage layer. Its surrogate primary key `id` is an integer, while the business identifier `storageId` carries codes such as `82868`, `611501`, `id_29`, and `ZUGLB8`. The `storageName` column holds names — `Legacy Standard D`, `Regional Framework`, `Seasonal Protocol`, `Integrated Programme A` — and `capacityTb` stores the storage capacity as a decimal, ranging from `15.95` to `24.80` terabytes. The boolean columns `isPrivate` and `autoSaveEnabled` control access and persistence behaviour. The foreign-key columns `serviceId` and `documentId` reference `DigitalService.id` and `UserDocument.id`, linking storage to its parent service and to the documents it holds.

**Table `UserDocument`**

| documentId | fileName | fileType | lastModified | isSynced | accountId | storageId | applicationId |
|---|---|---|---|---|---|---|---|
| 1000 | Thomas Shannon | docx | 2022-05-05T04:36:00 | true | 1 | 100 | 1 |
| 1001 | Susan Wagner | pptx | 2023-10-16T11:53:00 | false | 2 | 101 | 2 |
| 1002 | Peter Mcdowell | xlsx | 2024-03-27T18:10:00 | true | 3 | 102 | 3 |
| 1003 | Laurie Wallace | one | 2025-08-11T01:27:00 | false | 4 | 103 | 4 |

The `UserDocument` table captures the document entity. Its surrogate primary key `id` is an integer, while the business identifier `documentId` carries numeric codes such as `1000`, `1001`, `1002`, and `1003`. The `documentName` column stores human-readable names, and `documentType` is an enumerated discriminator. The boolean `isShared` flag controls sharing permissions. The `createdAt` and `updatedAt` timestamps bound the document lifecycle. The foreign-key columns `accountId`, `storageId`, and `applicationId` reference `UserAccount.id`, `CloudStorage.id`, and `SoftwareApplication.id` respectively, anchoring each document to its owner, its storage container, and the application that created or manages it.

The seven base tables form a normalised graph in which every relationship is expressed as a foreign key. The cardinality constraints are one-to-one in the current dataset — each account holds exactly one credential, one service, and one device; each service implements one application and one storage; each storage holds one document. The schema permits higher cardinalities; the current data simply reflects a one-to-one mapping for clarity.

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

The view `v_user_account_authentication_credential` joins `UserAccount` to `AuthenticationCredential` on `UserAccount.credentialId = AuthenticationCredential.credentialId`. It answers the question: "What credential does each user account hold, and what are its properties?" Reading row 1, the view presents account `Pilot Review` (id `1`) alongside credential `168538` of type `username_password` that is not temporary, issued on `2023-02-01T13:51:00` and expiring on `2023-10-24T21:15:00`. Row 2 shows account `Baseline Initiative` (id `2`) with credential `default_chart_a_tax_10` of type `sso_token` that is temporary, issued on `2024-07-12T20:08:00` but already expired as of `2024-03-08T04:32:00`. The view materialises the account–credential relationship as a single flat row.

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

The view `v_user_account_digital_service` joins `UserAccount` to `DigitalService` on `UserAccount.serviceId = DigitalService.id`. It answers: "Which digital service is each account associated with, and what are the service's characteristics?" Row 1 links account `Pilot Review` to service `Distributed Initiative` (id `1`), a type `LMS` service at `https://bugs.launchpad.net/vmware-nsx/+bug/1570676` with status `active` last updated on `2023-06-17T17:27:00`. Row 3 links account `Distributed Model A` to service `Primary Cluster` (id `3`), a type `cloud_storage` service at `http://www.aurelienribon.com` with status `maintenance` last updated on `2025-04-12T07:01:00`. The view collapses the account–service relationship into a single denormalised row.

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

The view `v_user_account_user_device` joins `UserAccount` to `UserDevice` on `UserAccount.deviceId = UserDevice.id`. It answers: "Which device is registered to each account, and what are its specifications?" Row 1 shows account `Pilot Review` paired with device `3744015`, a `laptop` running `windows`, last synced on `2023-10-02T09:39:00`, created on `2025-01-01 00:14:00` and updated on `2025-01-02 00:41:00`. Row 3 shows account `Distributed Model A` paired with device `209205`, a `tablet` running `ios`, last synced on `2025-08-24T23:13:00`. The view materialises the account–device binding as a flat row.

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

The view `v_authentication_credential_user_account` joins `AuthenticationCredential` to `UserAccount` on `AuthenticationCredential.accountId = UserAccount.id`. It answers the inverse question: "Which user account does each credential belong to?" Row 1 presents credential `168538` (type `username_password`, not temporary) alongside account `Pilot Review` (id `1`) with status `active` and last login on `2024-11-16T10:42:00`. Row 2 presents credential `default_chart_a_tax_10` (type `sso_token`, temporary) alongside account `Baseline Initiative` (id `2`) with status `inactive` and last login on `2025-04-27T17:59:00`. This view is useful when auditing credentials from the credential side.

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

The view `v_authentication_credential_digital_service` joins `AuthenticationCredential` to `DigitalService` on `AuthenticationCredential.serviceId = DigitalService.id`. It answers: "Which digital service is each credential scoped to?" Row 1 links credential `168538` to service `Distributed Initiative` (id `1`), a type `LMS` service with status `active`. Row 4 links credential `2002007020220` to service `Composite Review` (id `4`), a type `portal` service with status `active` last updated on `2022-09-23T14:18:00`. The view materialises the credential–service relationship.

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

The view `v_digital_service_software_application` joins `DigitalService` to `SoftwareApplication` on `DigitalService.applicationId = SoftwareApplication.id`. It answers: "Which software application implements each digital service?" Row 1 links service `Distributed Initiative` (id `1`) to application `Pilot Cluster` (id `1`), version `seasonal-version-71` on the `web` platform, flagged as a blended learning tool. Row 3 links service `Primary Cluster` (id `3`) to application `Distributed Initiative A` (id `3`), version `legacy-version-73` on the `mobile` platform, also a blended learning tool. The view collapses the service–application relationship.

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

The view `v_digital_service_cloud_storage` joins `DigitalService` to `CloudStorage` on `DigitalService.storageId = CloudStorage.id`. It answers: "Which cloud storage backs each digital service?" Row 1 links service `Distributed Initiative` (id `1`) to storage `Legacy Standard D` (id `100`), a `15.95` TB private storage with `autoSaveEnabled` set to `true`. Row 2 links service `Adaptive Model D` (id `2`) to storage `Regional Framework` (id `101`), an `18.90` TB private storage with `autoSaveEnabled` set to `false`. The view materialises the service–storage binding.

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

The view `v_software_application_digital_service` joins `SoftwareApplication` to `DigitalService` on `SoftwareApplication.serviceId = DigitalService.id`. It answers the inverse: "Which digital service is each application implementing?" Row 1 shows application `Pilot Cluster` (id `1`) implementing service `Distributed Initiative` (id `1`), a type `LMS` service with status `active`. Row 4 shows application `Adaptive Model` (id `4`) implementing service `Composite Review` (id `4`), a type `portal` service with status `active`. This view is useful when auditing applications from the application side.

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

The view `v_software_application_user_device` joins `SoftwareApplication` to `UserDevice` on `SoftwareApplication.deviceId = UserDevice.id`. It answers: "On which device does each application run?" Row 1 links application `Pilot Cluster` (id `1`) to device `3744015`, a `laptop` running `windows`. Row 2 links application `Baseline Review` (id `2`) to device `392495`, a `phone` running `macos`. The view materialises the application–device binding.

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

The view `v_user_device_user_account` joins `UserDevice` to `UserAccount` on `UserDevice.accountId = UserAccount.id`. It answers the inverse: "Which user account owns each device?" Row 1 shows device `3744015` (a `laptop` on `windows`) owned by account `Pilot Review` (id `1`) with status `active`. Row 3 shows device `209205` (a `tablet` on `ios`) owned by account `Distributed Model A` (id `3`) with status `suspended`. This view is useful when auditing devices from the device side.

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

The view `v_user_device_software_application` joins `UserDevice` to `SoftwareApplication` on `UserDevice.applicationId = SoftwareApplication.id`. It answers: "Which software application is installed on each device?" Row 1 links device `3744015` to application `Pilot Cluster` (id `1`), version `seasonal-version-71` on the `web` platform. Row 4 links device `22106999` to application `Adaptive Model` (id `4`), version `compact-version-74` on the `web` platform. The view materialises the device–application binding.

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

The view `v_cloud_storage_digital_service` joins `CloudStorage` to `DigitalService` on `CloudStorage.serviceId = DigitalService.id`. It answers the inverse: "Which digital service is each cloud storage backing?" Row 1 shows storage `Legacy Standard D` (id `100`) backing service `Distributed Initiative` (id `1`), a type `LMS` service with status `active`. Row 4 shows storage `Integrated Programme A` (id `103`) backing service `Composite Review` (id `4`), a type `portal` service with status `active`. This view is useful when auditing storage from the storage side.

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

The view `v_cloud_storage_user_document` joins `CloudStorage` to `UserDocument` on `CloudStorage.documentId = UserDocument.id`. It answers: "Which user document is stored in each cloud storage?" Row 1 links storage `Legacy Standard D` (id `100`) to document `1000`; Row 2 links storage `Regional Framework` (id `101`) to document `1001`. The view materialises the storage–document binding.

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

The view `v_user_document_user_account` joins `UserDocument` to `UserAccount` on `UserDocument.accountId = UserAccount.id`. It answers: "Which user account owns each document?" Row 1 links document `1000` to account `Pilot Review` (id `1`) with status `active`. Row 3 links document `1002` to account `Distributed Model A` (id `3`) with status `suspended`. This view is useful when auditing documents from the document side.

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

The view `v_user_document_cloud_storage` joins `UserDocument` to `CloudStorage` on `UserDocument.storageId = CloudStorage.id`. It answers: "Which cloud storage holds each user document?" Row 1 links document `1000` to storage `Legacy Standard D` (id `100`), a `15.95` TB storage with `autoSaveEnabled` set to `true`. Row 4 links document `1003` to storage `Integrated Programme A` (id `103`), a `24.80` TB private storage with `autoSaveEnabled` set to `false`. The view materialises the document–storage binding.

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

The view `v_user_document_software_application` joins `UserDocument` to `SoftwareApplication` on `UserDocument.applicationId = SoftwareApplication.id`. It answers: "Which software application created or manages each user document?" Row 1 links document `1000` to application `Pilot Cluster` (id `1`), version `seasonal-version-71` on the `web` platform. Row 3 links document `1002` to application `Distributed Initiative A` (id `3`), version `legacy-version-73` on the `mobile` platform. The view materialises the document–application binding.

## Synthesis

The seven base tables encode the domain as a normalised graph: `UserAccount` anchors the actor, `AuthenticationCredential` encodes identity proofs, `DigitalService` describes the service layer, `SoftwareApplication` captures the application layer, `UserDevice` models hardware endpoints, `CloudStorage` represents persistent storage, and `UserDocument` captures document entities. Foreign-key columns in each table bind the entity to its parent or peer, enforcing cardinality constraints at the schema level. The twenty views are named joins that reassemble these normalised tables into denormalised rows, each view answering a specific domain question by collapsing a two-table relationship into a single flat result. Reading any view row is equivalent to reading a domain fact: for example, the row in `v_user_account_authentication_credential` for account `Pilot Review` tells us that this account uses a non-temporary `username_password` credential that was issued on `2023-02-01T13:51:00` and expired on `2023-10-24T21:15:00`. The model is thus both normalised for integrity and denormalised for query convenience, with the views serving as the bridge between the two representations.