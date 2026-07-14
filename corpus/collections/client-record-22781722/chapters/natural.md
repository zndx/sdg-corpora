# Client Care and Service Delivery: A Reference Guide

Community health and social service organizations operate at the intersection of clinical care, logistical coordination, and financial sustainability. Every interaction between a client and a service provider generates a trail of records that must be tracked, correlated, and audited. This chapter documents the core data entities that support these operations: client records, service deliveries, staff records, donor records, donation transactions, and consent records. Together, these entities form the operational backbone of a service organization, enabling it to deliver care, compensate staff, track funding, and maintain regulatory compliance.

## Client Records

**Table `client_records`**

| client_identifier | full_name | date_of_birth | home_address | phone_number | email_address | health_history_summary | emergency_contact_name | emergency_contact_phone | client_record_phone_number | service_delivery_id | consent_record_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Peter Holt | Theodore Mcgrath | 2025-04-02 | distributed-home-60 | PHO-2092 | primary-email-70 | pilot-health-20 | Elizabeth Woods | Jennifer Summers | PHO-2092 | 1 | 1 |
| Lori Evans | Account Name | 2022-09-13 | baseline-home-61 | PHO-2093 | adaptive-email-71 | extended-health-21 | Apache Commons Net | Cheryl Bradley | PHO-2093 | 2 | 2 |
| Tasha Rodriguez | Saipan International Airport | 2023-02-24 | pilot-home-62 | PHO-2094 | distributed-email-72 | integrated-health-22 | Desiree Cain | Sheila Lane | PHO-2094 | 3 | 3 |
| Janice Johnston | Norma Fisher | 2024-07-08 | extended-home-63 | PHO-2095 | baseline-email-73 | seasonal-health-23 | Heavy Torpedo | Stephanie Collins | PHO-2095 | 4 | 4 |

Client records serve as the primary identity anchor for every individual receiving services. Each entry captures demographic information, contact details, and clinical context. The `client_identifier` column holds a unique organizational code such as `PHO-2092` for Peter Holt, while the `full_name` field stores the individual's legal name. Dates of birth range from `2022-09-13` to `2025-07-08` across the sample, reflecting a diverse client population. Home addresses are stored as coded references like `distributed-home-60` and `baseline-home-61`, which likely resolve to geocoded locations in the operational system.

Contact information is captured through both `phone_number` and `email_address` fields. Phone numbers follow the pattern `PHO-2092` through `PHO-2095`, and email addresses use descriptive prefixes such as `primary-email-70` and `adaptive-email-71`. The `health_history_summary` column provides a high-level clinical context, with entries like `pilot-health-20` and `extended-health-21` summarizing each client's medical background. Emergency contact details are recorded separately, with names such as `Elizabeth Woods` and `Cheryl Bradley` paired with phone numbers like `Jennifer Summers` and `Sheila Lane`.

Each client record also maintains foreign-key references to related service and consent records through `service_delivery_id` and `consent_record_id`. In the sample data, these identifiers are sequential from 1 to 4, establishing a one-to-one correspondence between clients and their initial service engagements and consent agreements.

## Service Deliveries

**Table `service_deliveries`**

| id | service_type | delivery_date | service_status | provider_staff_id | interaction_notes | client_record_phone_number | staff_record_id |
|---|---|---|---|---|---|---|---|
| 1 | personal care | 2022-09-10T08:48:00 | scheduled | 10445645 | composite-interact-93 | PHO-2092 | 1 |
| 2 | transportation | 2023-02-21T15:05:00 | in progress | 2933462 | primary-interact-94 | PHO-2093 | 2 |
| 3 | counseling | 2024-07-05T22:22:00 | completed | 2087734 | adaptive-interact-95 | PHO-2094 | 3 |
| 4 | care coordination | 2025-12-16T05:39:00 | cancelled | DR-AT1 | distributed-interact-96 | PHO-2095 | 4 |

Service deliveries document the actual provision of care or support to clients. Each row represents a discrete service event, identified by an integer `id` and characterized by a `service_type` such as `personal care`, `transportation`, `counseling`, or `care coordination`. The `delivery_date` field records when the service was scheduled or completed, using ISO 8601 timestamps like `2022-09-10T08:48:00` and `2025-12-16T05:39:00`.

The `service_status` column tracks the lifecycle of each delivery, with values including `scheduled`, `in progress`, `completed`, and `cancelled`. This status progression allows organizations to monitor service throughput and identify bottlenecks. Interaction notes, stored in `interaction_notes`, provide qualitative context for each encounter, with entries like `composite-interact-93` and `primary-interact-94` summarizing the nature of the service provided.

Staffing is captured through the `provider_staff_id` field, which references the staff member who delivered the service. In most cases, this is a numeric identifier such as `10445645` or `2933462`, though one entry uses the code `DR-AT1`, suggesting a different provider classification. The `staff_record_id` column provides a secondary linkage to the `staff_records` table, with values ranging from 1 to 4. The `client_record_phone_number` field ties each delivery back to the client, using the same phone identifier scheme found in the client records.

## Staff Records

**Table `staff_records`**

| id | staff_identifier | full_name | home_address | date_of_birth | social_insurance_number | bank_account_number | employment_status | performance_rating | service_delivery_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | STA-2659 | Theodore Mcgrath | distributed-home-60 | 2025-04-02 | SOC-2068 | BAN-2488 | active | 15.95 | 1 |
| 2 | STA-2661 | Account Name | baseline-home-61 | 2022-09-13 | SOC-2075 | BAN-2492 | inactive | 18.90 | 2 |
| 3 | STA-2663 | Saipan International Airport | pilot-home-62 | 2023-02-24 | SOC-2082 | BAN-2496 | terminated | 21.85 | 3 |
| 4 | STA-2665 | Norma Fisher | extended-home-63 | 2024-07-08 | SOC-2089 | BAN-2500 | active | 24.80 | 4 |

Staff records maintain the personnel directory for the organization. Each staff member is assigned a unique `id` and a `staff_identifier` code such as `STA-2659` and `STA-2661`. The `full_name` field stores the employee's name, which in the sample data includes entries like `Theodore Mcgrath` and `Account Name`. Home addresses and dates of birth are recorded alongside sensitive employment data, including the `social_insurance_number` (e.g., `SOC-2068`) and `bank_account_number` (e.g., `BAN-2488`) for payroll processing.

Employment status is tracked through the `employment_status` column, which takes values of `active`, `inactive`, or `terminated`. In the sample, staff member `STA-2659` is active, `STA-2661` is inactive, and `STA-2663` has been terminated. Performance is quantified by the `performance_rating` field, with scores ranging from `15.95` to `24.80` across the four staff records. These ratings likely feed into compensation decisions and professional development planning.

The `service_delivery_id` column creates a direct link between staff members and the services they have provided, enabling workload analysis and accountability tracking. Each staff record in the sample corresponds to exactly one service delivery, with identifiers from 1 to 4.

## Donor Records

**Table `donor_records`**

| id | donor_identifier | full_name | home_address | email_address | total_donation_amount | tax_receipt_issued | donation_transaction_id |
|---|---|---|---|---|---|---|---|
| 1 | DON-2650 | Theodore Mcgrath | distributed-home-60 | primary-email-70 | 434.86 | true | 1 |
| 2 | DON-2654 | Account Name | baseline-home-61 | adaptive-email-71 | 12,025 | false | 2 |
| 3 | DON-2658 | Saipan International Airport | pilot-home-62 | distributed-email-72 | 66.14 | true | 3 |
| 4 | DON-2662 | Norma Fisher | extended-home-63 | baseline-email-73 | 3,069 | false | 4 |

Donor records support the financial sustainability of the organization by tracking individuals and entities that contribute funds. Each donor is assigned a unique `id` and a `donor_identifier` code such as `DON-2650` and `DON-2654`. The `full_name` field captures the donor's name, which may represent an individual or an organization, as seen with entries like `Saipan International Airport`.

Financial contributions are summarized in the `total_donation_amount` column, which records cumulative giving. The sample shows a wide range of donation totals, from `66.14` for donor `DON-2658` to `12,025` for donor `DON-2654`. The `tax_receipt_issued` column is a boolean flag indicating whether a tax receipt has been generated for the donor's contributions, with values of `true` and `false` distributed across the records.

Contact information is stored in the `email_address` field, using the same naming convention as client records. The `donation_transaction_id` column links each donor to their most recent or primary transaction, creating a bridge between the donor identity and the financial event.

## Donation Transactions

**Table `donation_transactions`**

| donation_transaction_id | transaction_id | transaction_date | amount | payment_method | tax_receipt_number | donor_record_id | staff_record_id |
|---|---|---|---|---|---|---|---|
| 1 | 937738 | 2023-02-25T01:39:00 | 13.49 | credit card | TAX-2225 | 1 | 1 |
| 2 | 89509 | 2024-07-09T08:56:00 | 25.47 | bank transfer | TAX-2231 | 2 | 2 |
| 3 | 1186092 | 2025-12-20T15:13:00 | 19.72 | check | TAX-2237 | 3 | 3 |
| 4 | 9085243 | 2022-05-04T22:30:00 | 12.74 | cash | TAX-2243 | 4 | 4 |

Donation transactions record the specific financial events through which donors contribute to the organization. Each transaction is identified by a `donation_transaction_id` and a `transaction_id` such as `937738` and `89509`. The `transaction_date` field uses ISO 8601 timestamps, with dates ranging from `2022-05-04T22:30:00` to `2025-12-20T15:13:00`.

The `amount` column records the monetary value of each transaction, with sample values of `13.49`, `25.47`, `19.72`, and `12.74`. Payment methods vary across `credit card`, `bank transfer`, `check`, and `cash`, providing flexibility for donors and reconciliation options for accounting. The `tax_receipt_number` field, with values like `TAX-2225` and `TAX-2231`, provides a unique identifier for each tax receipt issued.

Each transaction is linked to both a donor and a staff member through the `donor_record_id` and `staff_record_id` columns. These foreign keys enable the organization to track which staff member processed or acknowledged each donation, supporting accountability and donor relationship management.

## Consent Records

**Table `consent_records`**

| id | consent_id | consent_date | consent_status | scope_of_consent | client_record_phone_number | service_delivery_id |
|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T09:15:00 | active | full | PHO-2092 | 1 |
| 2 | 790462 | 2024-03-14T16:32:00 | withdrawn | limited | PHO-2093 | 2 |
| 3 | 4277037 | 2025-08-25T23:49:00 | expired | specific purpose | PHO-2094 | 3 |
| 4 | 3990176 | 2022-01-09T06:06:00 | active | full | PHO-2095 | 4 |

Consent records document the legal agreements that authorize service delivery and data processing. Each consent entry is identified by a `consent_id`, which uses UUIDs such as `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3` for the first record and shorter numeric identifiers like `790462` and `4277037` for subsequent entries. The `consent_date` field records when the consent was given, with dates ranging from `2022-01-09T06:06:00` to `2025-08-25T23:49:00`.

The `consent_status` column tracks the current validity of each consent, taking values of `active`, `withdrawn`, or `expired`. In the sample, two records are active, one has been withdrawn, and one has expired. The `scope_of_consent` field specifies the breadth of the authorization, with values including `full`, `limited`, and `specific purpose`. This granularity allows clients to control which aspects of their care and data sharing are permitted.

Consent records are linked to both clients and service deliveries through the `client_record_phone_number` and `service_delivery_id` columns, ensuring that every service event can be verified against an appropriate consent agreement.

## Cross-Entity Relationships

The operational integrity of the system depends on the relationships between these entities. The following views provide the joined perspectives needed for reporting, auditing, and day-to-day management.

### Client-Centric Views

**View `v_client_record_client_record`**

```sql
CREATE VIEW v_client_record_client_record AS
SELECT a.client_identifier, a.full_name, a.date_of_birth, a.home_address, b.client_identifier AS record_client_identifier, b.full_name AS record_full_name, b.date_of_birth AS record_date_of_birth
FROM client_records a JOIN client_records b ON a.client_record_phone_number = b.phone_number;
```

| client_identifier | full_name | date_of_birth | home_address | record_client_identifier | record_full_name | record_date_of_birth |
|---|---|---|---|---|---|---|
| Peter Holt | Theodore Mcgrath | 2025-04-02 | distributed-home-60 | Peter Holt | Theodore Mcgrath | 2025-04-02 |
| Lori Evans | Account Name | 2022-09-13 | baseline-home-61 | Lori Evans | Account Name | 2022-09-13 |
| Tasha Rodriguez | Saipan International Airport | 2023-02-24 | pilot-home-62 | Tasha Rodriguez | Saipan International Airport | 2023-02-24 |
| Janice Johnston | Norma Fisher | 2024-07-08 | extended-home-63 | Janice Johnston | Norma Fisher | 2024-07-08 |

The self-join on client records reinforces the primary key structure and ensures data integrity within the client identity table. Each row maps to itself, confirming that the `client_identifier` uniquely identifies a single individual. For Peter Holt (`PHO-2092`), the record confirms the full name `Theodore Mcgrath`, date of birth `2025-04-02`, and emergency contact `Elizabeth Woods`.

**View `v_client_record_service_delivery`**

```sql
CREATE VIEW v_client_record_service_delivery AS
SELECT a.client_identifier, a.full_name, a.date_of_birth, a.home_address, b.id AS delivery_id, b.service_type AS delivery_service_type, b.delivery_date AS delivery_delivery_date
FROM client_records a JOIN service_deliveries b ON a.service_delivery_id = b.id;
```

| client_identifier | full_name | date_of_birth | home_address | delivery_id | delivery_service_type | delivery_delivery_date |
|---|---|---|---|---|---|---|
| Peter Holt | Theodore Mcgrath | 2025-04-02 | distributed-home-60 | 1 | personal care | 2022-09-10T08:48:00 |
| Lori Evans | Account Name | 2022-09-13 | baseline-home-61 | 2 | transportation | 2023-02-21T15:05:00 |
| Tasha Rodriguez | Saipan International Airport | 2023-02-24 | pilot-home-62 | 3 | counseling | 2024-07-05T22:22:00 |
| Janice Johnston | Norma Fisher | 2024-07-08 | extended-home-63 | 4 | care coordination | 2025-12-16T05:39:00 |

This view joins client records with their associated service deliveries, answering the question of which services each client has received. The join aligns `client_record_phone_number` with the corresponding delivery records. For the client with phone number `PHO-2092`, the view reveals a `personal care` service delivered on `2022-09-10T08:48:00` with status `scheduled`. The client `PHO-2093` received `transportation` services on `2023-02-21T15:05:00`, which was marked `in progress`. This perspective is essential for care coordinators who need to see the complete service history for each client.

**View `v_client_record_consent_record`**

```sql
CREATE VIEW v_client_record_consent_record AS
SELECT a.client_identifier, a.full_name, a.date_of_birth, a.home_address, b.id AS record_id, b.consent_id AS record_consent_id, b.consent_date AS record_consent_date
FROM client_records a JOIN consent_records b ON a.consent_record_id = b.id;
```

| client_identifier | full_name | date_of_birth | home_address | record_id | record_consent_id | record_consent_date |
|---|---|---|---|---|---|---|
| Peter Holt | Theodore Mcgrath | 2025-04-02 | distributed-home-60 | 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T09:15:00 |
| Lori Evans | Account Name | 2022-09-13 | baseline-home-61 | 2 | 790462 | 2024-03-14T16:32:00 |
| Tasha Rodriguez | Saipan International Airport | 2023-02-24 | pilot-home-62 | 3 | 4277037 | 2025-08-25T23:49:00 |
| Janice Johnston | Norma Fisher | 2024-07-08 | extended-home-63 | 4 | 3990176 | 2022-01-09T06:06:00 |

This view links clients to their consent agreements, enabling compliance verification. The join on `client_record_phone_number` connects each client to their consent status and scope. Client `PHO-2092` holds an `active` consent with `full` scope, dated `2023-10-03T09:15:00`. In contrast, client `PHO-2093` has a `withdrawn` consent with `limited` scope, dated `2024-03-14T16:32:00`. This view is critical for legal and compliance teams verifying that services are delivered under valid consent.

### Service Delivery Views

**View `v_service_delivery_client_record`**

```sql
CREATE VIEW v_service_delivery_client_record AS
SELECT a.id, a.service_type, a.delivery_date, a.service_status, b.client_identifier AS record_client_identifier, b.full_name AS record_full_name, b.date_of_birth AS record_date_of_birth
FROM service_deliveries a JOIN client_records b ON a.client_record_phone_number = b.phone_number;
```

| id | service_type | delivery_date | service_status | record_client_identifier | record_full_name | record_date_of_birth |
|---|---|---|---|---|---|---|
| 1 | personal care | 2022-09-10T08:48:00 | scheduled | Peter Holt | Theodore Mcgrath | 2025-04-02 |
| 2 | transportation | 2023-02-21T15:05:00 | in progress | Lori Evans | Account Name | 2022-09-13 |
| 3 | counseling | 2024-07-05T22:22:00 | completed | Tasha Rodriguez | Saipan International Airport | 2023-02-24 |
| 4 | care coordination | 2025-12-16T05:39:00 | cancelled | Janice Johnston | Norma Fisher | 2024-07-08 |

This view reverses the perspective, starting from service deliveries and resolving the client identity. It answers the question of which client each service was provided to. For service delivery `id` 1 (`personal care`), the view resolves the client as `Theodore Mcgrath` with phone number `PHO-2092`. Service delivery `id` 3 (`counseling`) is linked to the client with phone `PHO-2094`, who received the service on `2024-07-05T22:22:00` with status `completed`. This view supports billing and service verification workflows.

**View `v_service_delivery_staff_record`**

```sql
CREATE VIEW v_service_delivery_staff_record AS
SELECT a.id, a.service_type, a.delivery_date, a.service_status, b.id AS record_id, b.staff_identifier AS record_staff_identifier, b.full_name AS record_full_name
FROM service_deliveries a JOIN staff_records b ON a.staff_record_id = b.id;
```

| id | service_type | delivery_date | service_status | record_id | record_staff_identifier | record_full_name |
|---|---|---|---|---|---|---|
| 1 | personal care | 2022-09-10T08:48:00 | scheduled | 1 | STA-2659 | Theodore Mcgrath |
| 2 | transportation | 2023-02-21T15:05:00 | in progress | 2 | STA-2661 | Account Name |
| 3 | counseling | 2024-07-05T22:22:00 | completed | 3 | STA-2663 | Saipan International Airport |
| 4 | care coordination | 2025-12-16T05:39:00 | cancelled | 4 | STA-2665 | Norma Fisher |

This view connects service deliveries to the staff members who provided them, enabling workload and performance analysis. The join on `staff_record_id` maps each delivery to the corresponding staff record. Service delivery `id` 1 was provided by staff member `STA-2659` (`Theodore Mcgrath`), who has an `active` employment status and a performance rating of `15.95`. Service delivery `id` 3 was handled by `STA-2663` (`Saipan International Airport`), whose status is `terminated` with a performance rating of `21.85`. This view supports staffing decisions and quality assurance reviews.

**View `v_staff_record_service_delivery`**

```sql
CREATE VIEW v_staff_record_service_delivery AS
SELECT a.id, a.staff_identifier, a.full_name, a.home_address, b.id AS delivery_id, b.service_type AS delivery_service_type, b.delivery_date AS delivery_delivery_date
FROM staff_records a JOIN service_deliveries b ON a.service_delivery_id = b.id;
```

| id | staff_identifier | full_name | home_address | delivery_id | delivery_service_type | delivery_delivery_date |
|---|---|---|---|---|---|---|
| 1 | STA-2659 | Theodore Mcgrath | distributed-home-60 | 1 | personal care | 2022-09-10T08:48:00 |
| 2 | STA-2661 | Account Name | baseline-home-61 | 2 | transportation | 2023-02-21T15:05:00 |
| 3 | STA-2663 | Saipan International Airport | pilot-home-62 | 3 | counseling | 2024-07-05T22:22:00 |
| 4 | STA-2665 | Norma Fisher | extended-home-63 | 4 | care coordination | 2025-12-16T05:39:00 |

This view inverts the relationship, starting from staff records and listing the services they have delivered. It answers the question of what services each staff member has been assigned. Staff member `STA-2659` is linked to service delivery `id` 1 (`personal care`, `scheduled`). Staff member `STA-2665` is linked to service delivery `id` 4 (`care coordination`, `cancelled`). This perspective is useful for capacity planning and identifying staff who may need additional assignments or reassignment.

### Donor and Transaction Views

**View `v_donor_record_donation_transaction`**

```sql
CREATE VIEW v_donor_record_donation_transaction AS
SELECT a.id, a.donor_identifier, a.full_name, a.home_address, b.donation_transaction_id AS transaction_donation_transaction_id, b.transaction_id AS transaction_transaction_id, b.transaction_date AS transaction_transaction_date
FROM donor_records a JOIN donation_transactions b ON a.donation_transaction_id = b.donation_transaction_id;
```

| id | donor_identifier | full_name | home_address | transaction_donation_transaction_id | transaction_transaction_id | transaction_transaction_date |
|---|---|---|---|---|---|---|
| 1 | DON-2650 | Theodore Mcgrath | distributed-home-60 | 1 | 937738 | 2023-02-25T01:39:00 |
| 2 | DON-2654 | Account Name | baseline-home-61 | 2 | 89509 | 2024-07-09T08:56:00 |
| 3 | DON-2658 | Saipan International Airport | pilot-home-62 | 3 | 1186092 | 2025-12-20T15:13:00 |
| 4 | DON-2662 | Norma Fisher | extended-home-63 | 4 | 9085243 | 2022-05-04T22:30:00 |

This view joins donor records with their associated donation transactions, providing a complete picture of each donor's giving history. The join on `donation_transaction_id` links donors to their transaction details. Donor `DON-2650` (`Theodore Mcgrath`) has a total donation amount of `434.86` and a tax receipt issued status of `true`. The associated transaction shows an amount of `13.49` paid by `credit card` on `2023-02-25T01:39:00`. This view supports donor stewardship and financial reporting.

**View `v_donation_transaction_donor_record`**

```sql
CREATE VIEW v_donation_transaction_donor_record AS
SELECT a.donation_transaction_id, a.transaction_id, a.transaction_date, a.amount, b.id AS record_id, b.donor_identifier AS record_donor_identifier, b.full_name AS record_full_name
FROM donation_transactions a JOIN donor_records b ON a.donor_record_id = b.id;
```

| donation_transaction_id | transaction_id | transaction_date | amount | record_id | record_donor_identifier | record_full_name |
|---|---|---|---|---|---|---|
| 1 | 937738 | 2023-02-25T01:39:00 | 13.49 | 1 | DON-2650 | Theodore Mcgrath |
| 2 | 89509 | 2024-07-09T08:56:00 | 25.47 | 2 | DON-2654 | Account Name |
| 3 | 1186092 | 2025-12-20T15:13:00 | 19.72 | 3 | DON-2658 | Saipan International Airport |
| 4 | 9085243 | 2022-05-04T22:30:00 | 12.74 | 4 | DON-2662 | Norma Fisher |

This view reverses the donor-transaction relationship, starting from transactions and resolving the donor identity. It answers the question of which donor made each contribution. Transaction `937738` (amount `13.49`, paid by `credit card`) is linked to donor `DON-2650` (`Theodore Mcgrath`), who has a total donation amount of `434.86`. Transaction `89509` (amount `25.47`, paid by `bank transfer`) is linked to donor `DON-2654` (`Account Name`), whose total donations reach `12,025`. This view is essential for transaction reconciliation and donor acknowledgment.

**View `v_donation_transaction_staff_record`**

```sql
CREATE VIEW v_donation_transaction_staff_record AS
SELECT a.donation_transaction_id, a.transaction_id, a.transaction_date, a.amount, b.id AS record_id, b.staff_identifier AS record_staff_identifier, b.full_name AS record_full_name
FROM donation_transactions a JOIN staff_records b ON a.staff_record_id = b.id;
```

| donation_transaction_id | transaction_id | transaction_date | amount | record_id | record_staff_identifier | record_full_name |
|---|---|---|---|---|---|---|
| 1 | 937738 | 2023-02-25T01:39:00 | 13.49 | 1 | STA-2659 | Theodore Mcgrath |
| 2 | 89509 | 2024-07-09T08:56:00 | 25.47 | 2 | STA-2661 | Account Name |
| 3 | 1186092 | 2025-12-20T15:13:00 | 19.72 | 3 | STA-2663 | Saipan International Airport |
| 4 | 9085243 | 2022-05-04T22:30:00 | 12.74 | 4 | STA-2665 | Norma Fisher |

This view connects donation transactions to the staff members who processed or acknowledged them. The join on `staff_record_id` maps each transaction to the responsible staff member. Transaction `937738` was handled by staff member `id` 1, who has a performance rating of `15.95` and `active` employment status. Transaction `89509` was handled by staff member `id` 2, who is `inactive` with a performance rating of `18.90`. This view supports accountability in financial operations and can flag transactions handled by inactive staff.

### Consent Views

**View `v_consent_record_client_record`**

```sql
CREATE VIEW v_consent_record_client_record AS
SELECT a.id, a.consent_id, a.consent_date, a.consent_status, b.client_identifier AS record_client_identifier, b.full_name AS record_full_name, b.date_of_birth AS record_date_of_birth
FROM consent_records a JOIN client_records b ON a.client_record_phone_number = b.phone_number;
```

| id | consent_id | consent_date | consent_status | record_client_identifier | record_full_name | record_date_of_birth |
|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T09:15:00 | active | Peter Holt | Theodore Mcgrath | 2025-04-02 |
| 2 | 790462 | 2024-03-14T16:32:00 | withdrawn | Lori Evans | Account Name | 2022-09-13 |
| 3 | 4277037 | 2025-08-25T23:49:00 | expired | Tasha Rodriguez | Saipan International Airport | 2023-02-24 |
| 4 | 3990176 | 2022-01-09T06:06:00 | active | Janice Johnston | Norma Fisher | 2024-07-08 |

This view links consent records back to their associated clients, providing a compliance-focused perspective. The join on `client_record_phone_number` connects each consent to the client's identity. Consent `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3` is associated with client `PHO-2092` (`Theodore Mcgrath`), who has an `active` consent with `full` scope. Consent `790462` is associated with client `PHO-2093`, whose consent status is `withdrawn` with `limited` scope. This view is essential for audits and regulatory reporting.

**View `v_consent_record_service_delivery`**

```sql
CREATE VIEW v_consent_record_service_delivery AS
SELECT a.id, a.consent_id, a.consent_date, a.consent_status, b.id AS delivery_id, b.service_type AS delivery_service_type, b.delivery_date AS delivery_delivery_date
FROM consent_records a JOIN service_deliveries b ON a.service_delivery_id = b.id;
```

| id | consent_id | consent_date | consent_status | delivery_id | delivery_service_type | delivery_delivery_date |
|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T09:15:00 | active | 1 | personal care | 2022-09-10T08:48:00 |
| 2 | 790462 | 2024-03-14T16:32:00 | withdrawn | 2 | transportation | 2023-02-21T15:05:00 |
| 3 | 4277037 | 2025-08-25T23:49:00 | expired | 3 | counseling | 2024-07-05T22:22:00 |
| 4 | 3990176 | 2022-01-09T06:06:00 | active | 4 | care coordination | 2025-12-16T05:39:00 |

This final view connects consent records to service deliveries, answering the critical question of whether each service was delivered under valid consent. The join on `service_delivery_id` aligns consents with their corresponding services. Consent `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3` (`active`, `full` scope) is linked to service delivery `id` 1 (`personal care`, `scheduled`). Consent `790462` (`withdrawn`, `limited` scope) is linked to service delivery `id` 2 (`transportation`, `in progress`). This view enables real-time compliance checks, ensuring that no service is delivered without appropriate authorization.

## Synthesis

The six base tables and eleven joined views described in this chapter form a coherent operational data model for a community health and social service organization. Client records anchor the system, providing identity and clinical context. Service deliveries capture the actual care events, linked to both clients and staff. Staff records maintain the personnel directory with employment and performance data. Donor records and donation transactions track the financial contributions that sustain the organization. Consent records ensure that all activities are conducted under valid legal authorization. The views weave these entities together, enabling cross-functional reporting and compliance verification. Together, they support the organization's mission of delivering care responsibly, compensating staff fairly, and maintaining the trust of donors and clients alike.