## Domain Modelling and Relational Materialisation

This chapter documents the relational schema that materialises a community services and charitable giving domain. The domain encompasses four principal entity types—clients receiving services, service deliveries themselves, staff who provide those services, and donors who fund the operation—alongside two supporting entity types: consent records that capture the legal scope under which client data is processed, and donation transactions that record the financial flows from donors to the organisation. The schema is normalised into six base tables and twelve materialised views. Each base table corresponds to a single entity type; each view joins two or more base tables to reconstruct a domain fact that spans entity boundaries. The following sections walk through the entity types, their attributes, the foreign-key relationships that bind them, and the join logic that each view encodes.

### Base Tables and Entity Types

The `client_records` table is the central entity for the service-delivery side of the domain. It stores one row per client, with a natural key in `client_identifier` and a composite of personal and contact attributes. The column `full_name` holds values such as `Theodore Mcgrath` and `Account Name`; `date_of_birth` is stored as a date (e.g. `2025-04-02`); `home_address` carries a short code like `distributed-home-60`; `phone_number` and `client_record_phone_number` both carry the prefix `PHO-` (for example `PHO-2092`); `email_address` uses prefixes like `primary-email-70` and `adaptive-email-71`; `health_history_summary` stores a free-text descriptor such as `pilot-health-20`; and the emergency contact fields `emergency_contact_name` and `emergency_contact_phone` hold names like `Elizabeth Woods` and `Jennifer Summers`. Two additional columns, `service_delivery_id` and `consent_record_id`, serve as foreign keys pointing into the `service_deliveries` and `consent_records` tables respectively. The table is shown in full below.

**Table `client_records`**

| client_identifier | full_name | date_of_birth | home_address | phone_number | email_address | health_history_summary | emergency_contact_name | emergency_contact_phone | client_record_phone_number | service_delivery_id | consent_record_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Peter Holt | Theodore Mcgrath | 2025-04-02 | distributed-home-60 | PHO-2092 | primary-email-70 | pilot-health-20 | Elizabeth Woods | Jennifer Summers | PHO-2092 | 1 | 1 |
| Lori Evans | Account Name | 2022-09-13 | baseline-home-61 | PHO-2093 | adaptive-email-71 | extended-health-21 | Apache Commons Net | Cheryl Bradley | PHO-2093 | 2 | 2 |
| Tasha Rodriguez | Saipan International Airport | 2023-02-24 | pilot-home-62 | PHO-2094 | distributed-email-72 | integrated-health-22 | Desiree Cain | Sheila Lane | PHO-2094 | 3 | 3 |
| Janice Johnston | Norma Fisher | 2024-07-08 | extended-home-63 | PHO-2095 | baseline-email-73 | seasonal-health-23 | Heavy Torpedo | Stephanie Collins | PHO-2095 | 4 | 4 |

The `service_deliveries` table captures each instance of a service being rendered. Its primary key is the integer column `id`. The column `service_type` enumerates the kind of service—`personal care`, `transportation`, `counseling`, and `care coordination` appear in the sample data. `delivery_date` is a timestamp (e.g. `2022-09-10T08:48:00`), and `service_status` records the lifecycle state: `scheduled`, `in progress`, `completed`, or `cancelled`. The column `interaction_notes` holds a short code such as `composite-interact-93`. Two foreign-key columns anchor this table to the rest of the schema: `provider_staff_id` references `staff_records.id`, and `staff_record_id` also references `staff_records.id` (the schema stores the staff reference redundantly for query convenience). The column `client_record_phone_number` carries the same `PHO-` prefix as the client table's phone fields (e.g. `PHO-2092`), acting as a logical pointer back to the client.

**Table `service_deliveries`**

| id | service_type | delivery_date | service_status | provider_staff_id | interaction_notes | client_record_phone_number | staff_record_id |
|---|---|---|---|---|---|---|---|
| 1 | personal care | 2022-09-10T08:48:00 | scheduled | 10445645 | composite-interact-93 | PHO-2092 | 1 |
| 2 | transportation | 2023-02-21T15:05:00 | in progress | 2933462 | primary-interact-94 | PHO-2093 | 2 |
| 3 | counseling | 2024-07-05T22:22:00 | completed | 2087734 | adaptive-interact-95 | PHO-2094 | 3 |
| 4 | care coordination | 2025-12-16T05:39:00 | cancelled | DR-AT1 | distributed-interact-96 | PHO-2095 | 4 |

The `staff_records` table stores one row per employee or contractor. Its primary key is `id`. The natural key `staff_identifier` carries the prefix `STA-` (e.g. `STA-2659`). Personal attributes mirror those in `client_records`: `full_name` (e.g. `Theodore Mcgrath`), `home_address` (e.g. `distributed-home-60`), and `date_of_birth` (e.g. `2025-04-02`). Employment-specific columns include `social_insurance_number` (prefix `SOC-`, e.g. `SOC-2068`), `bank_account_number` (prefix `BAN-`, e.g. `BAN-2488`), `employment_status` (values `active`, `inactive`, `terminated`), and `performance_rating` (a decimal such as `15.95`). The column `service_delivery_id` is a foreign key into `service_deliveries.id`, establishing a one-to-many relationship from staff to the services they have delivered.

**Table `staff_records`**

| id | staff_identifier | full_name | home_address | date_of_birth | social_insurance_number | bank_account_number | employment_status | performance_rating | service_delivery_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | STA-2659 | Theodore Mcgrath | distributed-home-60 | 2025-04-02 | SOC-2068 | BAN-2488 | active | 15.95 | 1 |
| 2 | STA-2661 | Account Name | baseline-home-61 | 2022-09-13 | SOC-2075 | BAN-2492 | inactive | 18.90 | 2 |
| 3 | STA-2663 | Saipan International Airport | pilot-home-62 | 2023-02-24 | SOC-2082 | BAN-2496 | terminated | 21.85 | 3 |
| 4 | STA-2665 | Norma Fisher | extended-home-63 | 2024-07-08 | SOC-2089 | BAN-2500 | active | 24.80 | 4 |

The `donor_records` table models the charitable-giving side of the domain. Its primary key is `id`. The natural key `donor_identifier` carries the prefix `DON-` (e.g. `DON-2650`). Personal attributes include `full_name` (e.g. `Theodore Mcgrath`), `home_address` (e.g. `distributed-home-60`), and `email_address` (e.g. `primary-email-70`). The column `total_donation_amount` stores a running total (e.g. `434.86`, `12,025`), and `tax_receipt_issued` is a boolean (`true` or `false`). The foreign-key column `donation_transaction_id` points into `donation_transactions`, linking each donor to their most recent transaction.

**Table `donor_records`**

| id | donor_identifier | full_name | home_address | email_address | total_donation_amount | tax_receipt_issued | donation_transaction_id |
|---|---|---|---|---|---|---|---|
| 1 | DON-2650 | Theodore Mcgrath | distributed-home-60 | primary-email-70 | 434.86 | true | 1 |
| 2 | DON-2654 | Account Name | baseline-home-61 | adaptive-email-71 | 12,025 | false | 2 |
| 3 | DON-2658 | Saipan International Airport | pilot-home-62 | distributed-email-72 | 66.14 | true | 3 |
| 4 | DON-2662 | Norma Fisher | extended-home-63 | baseline-email-73 | 3,069 | false | 4 |

The `donation_transactions` table records individual financial events. Its primary key is `donation_transaction_id`. The column `transaction_id` carries a numeric identifier (e.g. `937738`), and `transaction_date` is a timestamp (e.g. `2023-02-25T01:39:00`). The `amount` column stores the monetary value (e.g. `13.49`), and `payment_method` enumerates `credit card`, `bank transfer`, `check`, and `cash`. The column `tax_receipt_number` carries the prefix `TAX-` (e.g. `TAX-2225`). Two foreign-key columns anchor this table: `donor_record_id` references `donor_records.id`, and `staff_record_id` references `staff_records.id`, indicating which staff member processed or facilitated the donation.

**Table `donation_transactions`**

| donation_transaction_id | transaction_id | transaction_date | amount | payment_method | tax_receipt_number | donor_record_id | staff_record_id |
|---|---|---|---|---|---|---|---|
| 1 | 937738 | 2023-02-25T01:39:00 | 13.49 | credit card | TAX-2225 | 1 | 1 |
| 2 | 89509 | 2024-07-09T08:56:00 | 25.47 | bank transfer | TAX-2231 | 2 | 2 |
| 3 | 1186092 | 2025-12-20T15:13:00 | 19.72 | check | TAX-2237 | 3 | 3 |
| 4 | 9085243 | 2022-05-04T22:30:00 | 12.74 | cash | TAX-2243 | 4 | 4 |

The `consent_records` table captures the legal consent given by clients for data processing and service delivery. Its primary key is `id`. The column `consent_id` holds a UUID (e.g. `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3`) or a numeric code (e.g. `790462`). `consent_date` is a timestamp (e.g. `2023-10-03T09:15:00`), and `consent_status` enumerates `active`, `withdrawn`, and `expired`. The column `scope_of_consent` records the breadth of consent: `full`, `limited`, or `specific purpose`. The column `client_record_phone_number` carries the `PHO-` prefix (e.g. `PHO-2092`), acting as a logical pointer to the client. The foreign-key column `service_delivery_id` references `service_deliveries.id`, linking each consent to the service it authorises.

**Table `consent_records`**

| id | consent_id | consent_date | consent_status | scope_of_consent | client_record_phone_number | service_delivery_id |
|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T09:15:00 | active | full | PHO-2092 | 1 |
| 2 | 790462 | 2024-03-14T16:32:00 | withdrawn | limited | PHO-2093 | 2 |
| 3 | 4277037 | 2025-08-25T23:49:00 | expired | specific purpose | PHO-2094 | 3 |
| 4 | 3990176 | 2022-01-09T06:06:00 | active | full | PHO-2095 | 4 |

### Foreign-Key Relationships and Normalisation

The schema enforces referential integrity through six foreign-key relationships distributed across the base tables. In `client_records`, the column `service_delivery_id` is a foreign key into `service_deliveries(id)`, and `consent_record_id` is a foreign key into `consent_records(id)`. In `service_deliveries`, the column `provider_staff_id` is a foreign key into `staff_records(id)`, and `staff_record_id` is a second foreign key into `staff_records(id)` (the schema stores the staff reference redundantly). In `staff_records`, the column `service_delivery_id` is a foreign key into `service_deliveries(id)`. In `donor_records`, the column `donation_transaction_id` is a foreign key into `donation_transactions(donation_transaction_id)`. In `donation_transactions`, the column `donor_record_id` is a foreign key into `donor_records(id)`, and `staff_record_id` is a foreign key into `staff_records(id)`. In `consent_records`, the column `service_delivery_id` is a foreign key into `service_deliveries(id)`.

These relationships form a bipartite structure on the service-delivery side: clients connect to service deliveries, service deliveries connect to staff, and consent records sit between clients and service deliveries. On the charitable-giving side, donors connect to donation transactions, and donation transactions connect to staff. The schema avoids a many-to-many junction table between donors and staff because each transaction is processed by exactly one staff member and attributed to exactly one donor, making the foreign keys in `donation_transactions` sufficient.

### Views and Domain-Fact Reconstruction

Materialised views in this schema join two or more base tables to reconstruct domain facts that span entity boundaries. Each view answers a specific analytical question by denormalising the normalised schema. The following sections describe each view and interpret its joined result using concrete rows from the sample data.

The view `v_client_record_client_record` is a self-join on `client_records`. It reconstructs the full client profile by joining the table to itself on the `client_identifier` key, effectively producing a denormalised copy of the client table with all personal, contact, and health attributes in a single row. This view is useful for reporting that requires the complete client record without navigating foreign keys.

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

The view `v_client_record_service_delivery` joins `client_records` to `service_deliveries` on the relationship established by `client_records.service_delivery_id = service_deliveries.id`. It answers the question: "Which service was delivered to which client, and what are the details of that service?" Reading the first row as evidence, the join produces a combined record showing that client `Peter Holt` (with `full_name` `Theodore Mcgrath`, `date_of_birth` `2025-04-02`, and `home_address` `distributed-home-60`) received a `personal care` service on `2022-09-10T08:48:00` with status `scheduled` and interaction notes `composite-interact-93`. The second row shows that client `Lori Evans` (with `full_name` `Account Name`) received a `transportation` service on `2023-02-21T15:05:00` with status `in progress`.

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

The view `v_client_record_consent_record` joins `client_records` to `consent_records` on the relationship established by `client_records.consent_record_id = consent_records.id`. It answers the question: "What consent does each client hold, and what is its scope and status?" The first row shows that client `Peter Holt` (with `full_name` `Theodore Mcgrath`) holds consent `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3`, granted on `2023-10-03T09:15:00`, with status `active` and scope `full`. The second row shows that client `Lori Evans` (with `full_name` `Account Name`) holds consent `790462`, granted on `2024-03-14T16:32:00`, with status `withdrawn` and scope `limited`.

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

The view `v_service_delivery_client_record` joins `service_deliveries` to `client_records` on the reverse direction: `service_deliveries` is the driving table, and the join retrieves the client details for each service delivery. It answers the question: "For each service delivery, who is the recipient client?" The first row shows that service delivery `id` 1, a `personal care` service on `2022-09-10T08:48:00` with status `scheduled`, was delivered to client `Peter Holt` (with `full_name` `Theodore Mcgrath`, `date_of_birth` `2025-04-02`, and `home_address` `distributed-home-60`). The third row shows that service delivery `id` 3, a `counseling` service on `2024-07-05T22:22:00` with status `completed`, was delivered to client `Tasha Rodriguez` (with `full_name` `Saipan International Airport`).

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

The view `v_service_delivery_staff_record` joins `service_deliveries` to `staff_records` on `service_deliveries.provider_staff_id = staff_records.id`. It answers the question: "Which staff member provided each service delivery?" The first row shows that service delivery `id` 1, a `personal care` service on `2022-09-10T08:48:00`, was provided by staff member `Theodore Mcgrath` (with `staff_identifier` `STA-2659`, `home_address` `distributed-home-60`, and `employment_status` `active`). The second row shows that service delivery `id` 2, a `transportation` service on `2023-02-21T15:05:00`, was provided by staff member `Account Name` (with `staff_identifier` `STA-2661` and `employment_status` `inactive`).

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

The view `v_staff_record_service_delivery` joins `staff_records` to `service_deliveries` on `staff_records.service_delivery_id = service_deliveries.id`. It answers the question: "What service deliveries has each staff member been associated with?" The first row shows that staff member `Theodore Mcgrath` (with `staff_identifier` `STA-2659`, `employment_status` `active`, and `performance_rating` `15.95`) is associated with service delivery `id` 1, a `personal care` service on `2022-09-10T08:48:00` with status `scheduled`. The third row shows that staff member `Saipan International Airport` (with `staff_identifier` `STA-2663`, `employment_status` `terminated`, and `performance_rating` `21.85`) is associated with service delivery `id` 3, a `counseling` service on `2024-07-05T22:22:00` with status `completed`.

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

The view `v_donor_record_donation_transaction` joins `donor_records` to `donation_transactions` on `donor_records.donation_transaction_id = donation_transactions.donation_transaction_id`. It answers the question: "What donation transaction is associated with each donor, and what are the financial details?" The first row shows that donor `Theodore Mcgrath` (with `donor_identifier` `DON-2650`, `home_address` `distributed-home-60`, and `total_donation_amount` `434.86`) is associated with donation transaction `donation_transaction_id` 1, which has `transaction_id` `937738`, `transaction_date` `2023-02-25T01:39:00`, `amount` `13.49`, `payment_method` `credit card`, and `tax_receipt_number` `TAX-2225`. The second row shows that donor `Account Name` (with `donor_identifier` `DON-2654` and `total_donation_amount` `12,025`) is associated with donation transaction `donation_transaction_id` 2, which has `transaction_id` `89509`, `transaction_date` `2024-07-09T08:56:00`, `amount` `25.47`, `payment_method` `bank transfer`, and `tax_receipt_number` `TAX-2231`.

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

The view `v_donation_transaction_donor_record` joins `donation_transactions` to `donor_records` on the reverse direction: `donation_transactions` is the driving table, and the join retrieves the donor details for each transaction. It answers the question: "For each donation transaction, who is the donor?" The first row shows that donation transaction `donation_transaction_id` 1, with `transaction_id` `937738` on `2023-02-25T01:39:00` for `13.49` paid by `credit card`, was made by donor `Theodore Mcgrath` (with `donor_identifier` `DON-2650`, `home_address` `distributed-home-60`, and `total_donation_amount` `434.86`). The third row shows that donation transaction `donation_transaction_id` 3, with `transaction_id` `1186092` on `2025-12-20T15:13:00` for `19.72` paid by `check`, was made by donor `Saipan International Airport` (with `donor_identifier` `DON-2658` and `total_donation_amount` `66.14`).

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

The view `v_donation_transaction_staff_record` joins `donation_transactions` to `staff_records` on `donation_transactions.staff_record_id = staff_records.id`. It answers the question: "Which staff member processed each donation transaction?" The first row shows that donation transaction `donation_transaction_id` 1, with `transaction_id` `937738` on `2023-02-25T01:39:00` for `13.49`, was processed by staff member `Theodore Mcgrath` (with `staff_identifier` `STA-2659`, `home_address` `distributed-home-60`, and `employment_status` `active`). The second row shows that donation transaction `donation_transaction_id` 2, with `transaction_id` `89509` on `2024-07-09T08:56:00` for `25.47`, was processed by staff member `Account Name` (with `staff_identifier` `STA-2661` and `employment_status` `inactive`).

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

The view `v_consent_record_client_record` joins `consent_records` to `client_records` on the relationship established by `consent_records.client_record_phone_number = client_records.phone_number` (or equivalently via the `client_records.consent_record_id` foreign key). It answers the question: "Which client holds each consent record, and what are the client's personal details?" The first row shows that consent record `id` 1, with `consent_id` `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3`, `consent_date` `2023-10-03T09:15:00`, status `active`, and scope `full`, belongs to client `Peter Holt` (with `full_name` `Theodore Mcgrath`, `date_of_birth` `2025-04-02`, and `home_address` `distributed-home-60`). The fourth row shows that consent record `id` 4, with `consent_id` `3990176`, `consent_date` `2022-01-09T06:06:00`, status `active`, and scope `full`, belongs to client `Janice Johnston` (with `full_name` `Norma Fisher`, `date_of_birth` `2024-07-08`, and `home_address` `extended-home-63`).

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

The view `v_consent_record_service_delivery` joins `consent_records` to `service_deliveries` on `consent_records.service_delivery_id = service_deliveries.id`. It answers the question: "Which service delivery does each consent record authorise?" The first row shows that consent record `id` 1, with `consent_id` `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3`, status `active`, and scope `full`, authorises service delivery `id` 1, a `personal care` service on `2022-09-10T08:48:00` with status `scheduled` and interaction notes `composite-interact-93`. The third row shows that consent record `id` 3, with `consent_id` `4277037`, status `expired`, and scope `specific purpose`, authorises service delivery `id` 3, a `counseling` service on `2024-07-05T22:22:00` with status `completed` and interaction notes `adaptive-interact-95`.

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

### Closing Synthesis

The schema models a community services domain with six base tables and twelve views. The base tables capture clients, service deliveries, staff, donors, donation transactions, and consent records as normalised entities. Foreign keys bind clients to their service deliveries and consents, service deliveries to their providers, donors to their transactions, and transactions to their processing staff. The twelve views denormalise these relationships in every pairwise combination that yields a meaningful domain fact: client-to-service, client-to-consent, service-to-client, service-to-staff, staff-to-service, donor-to-transaction, transaction-to-donor, transaction-to-staff, consent-to-client, and consent-to-service. Each view answers a specific analytical question—such as "which staff member processed which donation?" or "what consent does each client hold?"—by joining the relevant base tables and projecting the columns needed for the answer. The result is a schema that is both normalised for data integrity and denormalised for query convenience through its view layer.