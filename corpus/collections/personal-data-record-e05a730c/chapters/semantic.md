The chapter has been written to `/tmp/harness_semantic_vis5qng8/chapter_07_ontology_to_schema.md`. It is 1,737 words and contains all 24 payload blocks (9 table markers and 15 view markers), each appearing exactly once. The chapter covers:

- **Opening**: Frames the domain as a privacy-first data architecture tracking personal data through digital platforms, tracking software, customer profiles, purchase transactions, and third-party vendors.
- **Base table sections**: `personal_data_records` (central fact table), `digital_platforms` and `tracking_softwares` (instrumentation layer), `customer_profiles` and `purchase_transactions` (commercial layer), `third_party_vendors` (bridge between layers), and the three auxiliary tables (`vehicle_identification_records`, `platforms_records`, `profiles_records`).
- **View sections**: All 15 views organized by their centered entity, each with a concrete row interpretation.
- **Synthesis**: Summarizes the normalized architecture and the role of views in reconstructing domain facts.

## Data appendix

**Table `personal_data_records`**

| id | record_id | collection_date | data_category | is_sensitive | retention_period_months | disclosure_status | digital_platform_id | customer_profile_id | vendor_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | 2025-12-17T11:57:00 | Identifiers | false | 30 | InternalUse | 1 | 1 | Continental Group |
| 2 | 10445619 | 2022-05-01T18:14:00 | CommercialInformation | true | 38 | SharedWithVendor | 2 | 2 | PubMatic Inc. |
| 3 | 9568457 | 2023-10-12T01:31:00 | NetworkActivity | false | 46 | PubliclyDisclosed | 3 | 3 | Dhillon Crane Service |
| 4 | 20743593 | 2024-03-23T08:48:00 | InferredProfile | true | 54 | InternalUse | 4 | 4 | Sealed Air |

**Table `digital_platforms`**

| id | platform_id | platform_name | platform_type | url | cookie_enabled | analytics_provider | tracking_software_id |
|---|---|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | Website | https://www.nature.com/articles/nphoton.2017.123 | true | adaptive-analytic-11 | 1000 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | MobileApp | http://www.mdpi.com/2073-445X/8/3/43/pdf | false | distributed-analytic-12 | 1001 |
| 3 | 4716417 | Adaptive Cluster | Website | https://www.deshaw.com/recruit/UnivListing.html | true | baseline-analytic-13 | 1002 |
| 4 | 10966228 | Primary Review A | MobileApp | https://www.nature.com/articles/nphoton.2015.276 | false | pilot-analytic-14 | 1003 |

**Table `tracking_softwares`**

| id | software_id | software_name | provider_name | function_type | data_collected | digital_platform_id | personal_data_record_id |
|---|---|---|---|---|---|---|---|
| 1000 | gd_taxc_2111 | Primary Review A | Primary Initiative A | Analytics | adaptive-data-59 | 1 | 1 |
| 1001 | 5917273 | Composite Initiative | Composite Model | AdTargeting | distributed-data-60 | 2 | 2 |
| 1002 | id_4 | Compact Model | Compact Cluster | PixelTracking | baseline-data-61 | 3 | 3 |
| 1003 | 8928496 | Legacy Cluster D | Legacy Review D | Analytics | pilot-data-62 | 4 | 4 |

**Table `customer_profiles`**

| id | profile_id | customer_name | household_id | profile_status | last_updated | preference_tags | purchase_transaction_id |
|---|---|---|---|---|---|---|---|
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Susan Wagner | 726044 | Active | 2023-06-17T17:27:00 | adaptive-preferen-17 | 1000 |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | 16605652 | Inactive | 2024-11-01T00:44:00 | distributed-preferen-18 | 1001 |
| 3 | 10207150 | Peter Anthony | 8928495 | Deleted | 2025-04-12T07:01:00 | baseline-preferen-19 | 1002 |
| 4 | 611506 | Bobby Flores | 5844284 | Active | 2022-09-23T14:18:00 | pilot-preferen-20 | 1003 |

**Table `purchase_transactions`**

| id | transaction_id | transaction_date | total_amount | payment_method | store_location | items_purchased | customer_profile_id | vendor_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 937738 | 2023-02-25T01:39:00 | 112.11 | CreditCard | composite-store-21 | primary-items-16 | 1 | Continental Group |
| 1001 | 89509 | 2024-07-09T08:56:00 | 1,979 | DebitCard | primary-store-22 | adaptive-items-17 | 2 | PubMatic Inc. |
| 1002 | 1186092 | 2025-12-20T15:13:00 | 15,418 | Cash | adaptive-store-23 | distributed-items-18 | 3 | Dhillon Crane Service |
| 1003 | 9085243 | 2022-05-04T22:30:00 | 12,579 | CreditCard | distributed-store-24 | baseline-items-19 | 4 | Sealed Air |

**Table `third_party_vendors`**

| vendor_id | vendor_name | service_type | data_access_level | contract_start_date | personal_data_record_id | purchase_transaction_id |
|---|---|---|---|---|---|---|
| Continental Group | Microsoft Corporation | PaymentProcessing | FullAccess | 2022-01-26 | 1 | 1000 |
| PubMatic Inc. | PureCycle Technologies. | Analytics | LimitedAccess | 2023-06-10 | 2 | 1001 |
| Dhillon Crane Service | American International Group | Advertising | Anonymized | 2024-11-21 | 3 | 1002 |
| Sealed Air | American Airlines Group | PaymentProcessing | FullAccess | 2025-04-05 | 4 | 1003 |

**Table `vehicle_identification_records`**

| vehicle_identification_record_id | record_id | license_plate_number | state_issued | vehicle_make | vehicle_model | capture_timestamp | ocr_confidence_score | customer_profile_id | personal_data_record_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | LIC-2494 | pilot-state-50 | seasonal-vehicle-95 | compact-vehicle-80 | 2025-08-15T19:33:00 | 14.70 | 1 | 1 |
| 2 | 10445619 | LIC-2497 | extended-state-51 | regional-vehicle-96 | composite-vehicle-81 | 2022-01-26T02:50:00 | 16.40 | 2 | 2 |
| 3 | 9568457 | LIC-2500 | integrated-state-52 | legacy-vehicle-97 | primary-vehicle-82 | 2023-06-10T09:07:00 | 18.10 | 3 | 3 |
| 4 | 20743593 | LIC-2503 | seasonal-state-53 | compact-vehicle-98 | adaptive-vehicle-83 | 2024-11-21T16:24:00 | 19.80 | 4 | 4 |

**Table `platforms_records`**

| digital_platform_id | personal_data_record_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `profiles_records`**

| customer_profile_id | personal_data_record_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**View `v_personal_data_record_digital_platform`**

```sql
CREATE VIEW v_personal_data_record_digital_platform AS
SELECT a.id, a.record_id, a.collection_date, a.data_category, b.id AS platform_id, b.platform_id AS platform_platform_id, b.platform_name AS platform_platform_name
FROM personal_data_records a JOIN digital_platforms b ON a.digital_platform_id = b.id;
```

| id | record_id | collection_date | data_category | platform_id | platform_platform_id | platform_platform_name |
|---|---|---|---|---|---|---|
| 1 | 10449530 | 2025-12-17T11:57:00 | Identifiers | 1 | state_uk_28 | Baseline Initiative D |
| 2 | 10445619 | 2022-05-01T18:14:00 | CommercialInformation | 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model |
| 3 | 9568457 | 2023-10-12T01:31:00 | NetworkActivity | 3 | 4716417 | Adaptive Cluster |
| 4 | 20743593 | 2024-03-23T08:48:00 | InferredProfile | 4 | 10966228 | Primary Review A |

**View `v_personal_data_record_customer_profile`**

```sql
CREATE VIEW v_personal_data_record_customer_profile AS
SELECT a.id, a.record_id, a.collection_date, a.data_category, b.id AS profile_id, b.profile_id AS profile_profile_id, b.customer_name AS profile_customer_name
FROM personal_data_records a JOIN customer_profiles b ON a.customer_profile_id = b.id;
```

| id | record_id | collection_date | data_category | profile_id | profile_profile_id | profile_customer_name |
|---|---|---|---|---|---|---|
| 1 | 10449530 | 2025-12-17T11:57:00 | Identifiers | 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Susan Wagner |
| 2 | 10445619 | 2022-05-01T18:14:00 | CommercialInformation | 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 3 | 9568457 | 2023-10-12T01:31:00 | NetworkActivity | 3 | 10207150 | Peter Anthony |
| 4 | 20743593 | 2024-03-23T08:48:00 | InferredProfile | 4 | 611506 | Bobby Flores |

**View `v_personal_data_record_third_party_vendor`**

```sql
CREATE VIEW v_personal_data_record_third_party_vendor AS
SELECT a.id, a.record_id, a.collection_date, a.data_category, b.vendor_id AS vendor_vendor_id, b.vendor_name AS vendor_vendor_name, b.service_type AS vendor_service_type
FROM personal_data_records a JOIN third_party_vendors b ON a.vendor_id = b.vendor_id;
```

| id | record_id | collection_date | data_category | vendor_vendor_id | vendor_vendor_name | vendor_service_type |
|---|---|---|---|---|---|---|
| 1 | 10449530 | 2025-12-17T11:57:00 | Identifiers | Continental Group | Microsoft Corporation | PaymentProcessing |
| 2 | 10445619 | 2022-05-01T18:14:00 | CommercialInformation | PubMatic Inc. | PureCycle Technologies. | Analytics |
| 3 | 9568457 | 2023-10-12T01:31:00 | NetworkActivity | Dhillon Crane Service | American International Group | Advertising |
| 4 | 20743593 | 2024-03-23T08:48:00 | InferredProfile | Sealed Air | American Airlines Group | PaymentProcessing |

**View `v_digital_platform_personal_data_record_detail`**

```sql
CREATE VIEW v_digital_platform_personal_data_record_detail AS
SELECT a.id, a.platform_id, a.platform_name, b.id AS record_id, b.record_id AS record_record_id, b.collection_date AS record_collection_date
FROM digital_platforms a
  JOIN platforms_records j ON j.digital_platform_id = a.id
  JOIN personal_data_records b ON b.id = j.personal_data_record_id;
```

| id | platform_id | platform_name | record_id | record_record_id | record_collection_date |
|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | 1 | 10449530 | 2025-12-17T11:57:00 |
| 1 | state_uk_28 | Baseline Initiative D | 2 | 10445619 | 2022-05-01T18:14:00 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | 2 | 10445619 | 2022-05-01T18:14:00 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | 3 | 9568457 | 2023-10-12T01:31:00 |
| 3 | 4716417 | Adaptive Cluster | 3 | 9568457 | 2023-10-12T01:31:00 |
| 3 | 4716417 | Adaptive Cluster | 4 | 20743593 | 2024-03-23T08:48:00 |
| 4 | 10966228 | Primary Review A | 4 | 20743593 | 2024-03-23T08:48:00 |
| 4 | 10966228 | Primary Review A | 1 | 10449530 | 2025-12-17T11:57:00 |

**View `v_digital_platform_tracking_software`**

```sql
CREATE VIEW v_digital_platform_tracking_software AS
SELECT a.id, a.platform_id, a.platform_name, a.platform_type, b.id AS software_id, b.software_id AS software_software_id, b.software_name AS software_software_name
FROM digital_platforms a JOIN tracking_softwares b ON a.tracking_software_id = b.id;
```

| id | platform_id | platform_name | platform_type | software_id | software_software_id | software_software_name |
|---|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | Website | 1000 | gd_taxc_2111 | Primary Review A |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | MobileApp | 1001 | 5917273 | Composite Initiative |
| 3 | 4716417 | Adaptive Cluster | Website | 1002 | id_4 | Compact Model |
| 4 | 10966228 | Primary Review A | MobileApp | 1003 | 8928496 | Legacy Cluster D |

**View `v_tracking_software_digital_platform`**

```sql
CREATE VIEW v_tracking_software_digital_platform AS
SELECT a.id, a.software_id, a.software_name, a.provider_name, b.id AS platform_id, b.platform_id AS platform_platform_id, b.platform_name AS platform_platform_name
FROM tracking_softwares a JOIN digital_platforms b ON a.digital_platform_id = b.id;
```

| id | software_id | software_name | provider_name | platform_id | platform_platform_id | platform_platform_name |
|---|---|---|---|---|---|---|
| 1000 | gd_taxc_2111 | Primary Review A | Primary Initiative A | 1 | state_uk_28 | Baseline Initiative D |
| 1001 | 5917273 | Composite Initiative | Composite Model | 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model |
| 1002 | id_4 | Compact Model | Compact Cluster | 3 | 4716417 | Adaptive Cluster |
| 1003 | 8928496 | Legacy Cluster D | Legacy Review D | 4 | 10966228 | Primary Review A |

**View `v_tracking_software_personal_data_record`**

```sql
CREATE VIEW v_tracking_software_personal_data_record AS
SELECT a.id, a.software_id, a.software_name, a.provider_name, b.id AS record_id, b.record_id AS record_record_id, b.collection_date AS record_collection_date
FROM tracking_softwares a JOIN personal_data_records b ON a.personal_data_record_id = b.id;
```

| id | software_id | software_name | provider_name | record_id | record_record_id | record_collection_date |
|---|---|---|---|---|---|---|
| 1000 | gd_taxc_2111 | Primary Review A | Primary Initiative A | 1 | 10449530 | 2025-12-17T11:57:00 |
| 1001 | 5917273 | Composite Initiative | Composite Model | 2 | 10445619 | 2022-05-01T18:14:00 |
| 1002 | id_4 | Compact Model | Compact Cluster | 3 | 9568457 | 2023-10-12T01:31:00 |
| 1003 | 8928496 | Legacy Cluster D | Legacy Review D | 4 | 20743593 | 2024-03-23T08:48:00 |

**View `v_customer_profile_personal_data_record_detail`**

```sql
CREATE VIEW v_customer_profile_personal_data_record_detail AS
SELECT a.id, a.profile_id, a.customer_name, b.id AS record_id, b.record_id AS record_record_id, b.collection_date AS record_collection_date
FROM customer_profiles a
  JOIN profiles_records j ON j.customer_profile_id = a.id
  JOIN personal_data_records b ON b.id = j.personal_data_record_id;
```

| id | profile_id | customer_name | record_id | record_record_id | record_collection_date |
|---|---|---|---|---|---|
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Susan Wagner | 1 | 10449530 | 2025-12-17T11:57:00 |
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Susan Wagner | 2 | 10445619 | 2022-05-01T18:14:00 |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | 2 | 10445619 | 2022-05-01T18:14:00 |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | 3 | 9568457 | 2023-10-12T01:31:00 |
| 3 | 10207150 | Peter Anthony | 3 | 9568457 | 2023-10-12T01:31:00 |
| 3 | 10207150 | Peter Anthony | 4 | 20743593 | 2024-03-23T08:48:00 |
| 4 | 611506 | Bobby Flores | 4 | 20743593 | 2024-03-23T08:48:00 |
| 4 | 611506 | Bobby Flores | 1 | 10449530 | 2025-12-17T11:57:00 |

**View `v_customer_profile_purchase_transaction`**

```sql
CREATE VIEW v_customer_profile_purchase_transaction AS
SELECT a.id, a.profile_id, a.customer_name, a.household_id, b.id AS transaction_id, b.transaction_id AS transaction_transaction_id, b.transaction_date AS transaction_transaction_date
FROM customer_profiles a JOIN purchase_transactions b ON a.purchase_transaction_id = b.id;
```

| id | profile_id | customer_name | household_id | transaction_id | transaction_transaction_id | transaction_transaction_date |
|---|---|---|---|---|---|---|
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Susan Wagner | 726044 | 1000 | 937738 | 2023-02-25T01:39:00 |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | 16605652 | 1001 | 89509 | 2024-07-09T08:56:00 |
| 3 | 10207150 | Peter Anthony | 8928495 | 1002 | 1186092 | 2025-12-20T15:13:00 |
| 4 | 611506 | Bobby Flores | 5844284 | 1003 | 9085243 | 2022-05-04T22:30:00 |

**View `v_purchase_transaction_customer_profile`**

```sql
CREATE VIEW v_purchase_transaction_customer_profile AS
SELECT a.id, a.transaction_id, a.transaction_date, a.total_amount, b.id AS profile_id, b.profile_id AS profile_profile_id, b.customer_name AS profile_customer_name
FROM purchase_transactions a JOIN customer_profiles b ON a.customer_profile_id = b.id;
```

| id | transaction_id | transaction_date | total_amount | profile_id | profile_profile_id | profile_customer_name |
|---|---|---|---|---|---|---|
| 1000 | 937738 | 2023-02-25T01:39:00 | 112.11 | 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Susan Wagner |
| 1001 | 89509 | 2024-07-09T08:56:00 | 1,979 | 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 1002 | 1186092 | 2025-12-20T15:13:00 | 15,418 | 3 | 10207150 | Peter Anthony |
| 1003 | 9085243 | 2022-05-04T22:30:00 | 12,579 | 4 | 611506 | Bobby Flores |

**View `v_purchase_transaction_third_party_vendor`**

```sql
CREATE VIEW v_purchase_transaction_third_party_vendor AS
SELECT a.id, a.transaction_id, a.transaction_date, a.total_amount, b.vendor_id AS vendor_vendor_id, b.vendor_name AS vendor_vendor_name, b.service_type AS vendor_service_type
FROM purchase_transactions a JOIN third_party_vendors b ON a.vendor_id = b.vendor_id;
```

| id | transaction_id | transaction_date | total_amount | vendor_vendor_id | vendor_vendor_name | vendor_service_type |
|---|---|---|---|---|---|---|
| 1000 | 937738 | 2023-02-25T01:39:00 | 112.11 | Continental Group | Microsoft Corporation | PaymentProcessing |
| 1001 | 89509 | 2024-07-09T08:56:00 | 1,979 | PubMatic Inc. | PureCycle Technologies. | Analytics |
| 1002 | 1186092 | 2025-12-20T15:13:00 | 15,418 | Dhillon Crane Service | American International Group | Advertising |
| 1003 | 9085243 | 2022-05-04T22:30:00 | 12,579 | Sealed Air | American Airlines Group | PaymentProcessing |

**View `v_third_party_vendor_personal_data_record`**

```sql
CREATE VIEW v_third_party_vendor_personal_data_record AS
SELECT a.vendor_id, a.vendor_name, a.service_type, a.data_access_level, b.id AS record_id, b.record_id AS record_record_id, b.collection_date AS record_collection_date
FROM third_party_vendors a JOIN personal_data_records b ON a.personal_data_record_id = b.id;
```

| vendor_id | vendor_name | service_type | data_access_level | record_id | record_record_id | record_collection_date |
|---|---|---|---|---|---|---|
| Continental Group | Microsoft Corporation | PaymentProcessing | FullAccess | 1 | 10449530 | 2025-12-17T11:57:00 |
| PubMatic Inc. | PureCycle Technologies. | Analytics | LimitedAccess | 2 | 10445619 | 2022-05-01T18:14:00 |
| Dhillon Crane Service | American International Group | Advertising | Anonymized | 3 | 9568457 | 2023-10-12T01:31:00 |
| Sealed Air | American Airlines Group | PaymentProcessing | FullAccess | 4 | 20743593 | 2024-03-23T08:48:00 |

**View `v_third_party_vendor_purchase_transaction`**

```sql
CREATE VIEW v_third_party_vendor_purchase_transaction AS
SELECT a.vendor_id, a.vendor_name, a.service_type, a.data_access_level, b.id AS transaction_id, b.transaction_id AS transaction_transaction_id, b.transaction_date AS transaction_transaction_date
FROM third_party_vendors a JOIN purchase_transactions b ON a.purchase_transaction_id = b.id;
```

| vendor_id | vendor_name | service_type | data_access_level | transaction_id | transaction_transaction_id | transaction_transaction_date |
|---|---|---|---|---|---|---|
| Continental Group | Microsoft Corporation | PaymentProcessing | FullAccess | 1000 | 937738 | 2023-02-25T01:39:00 |
| PubMatic Inc. | PureCycle Technologies. | Analytics | LimitedAccess | 1001 | 89509 | 2024-07-09T08:56:00 |
| Dhillon Crane Service | American International Group | Advertising | Anonymized | 1002 | 1186092 | 2025-12-20T15:13:00 |
| Sealed Air | American Airlines Group | PaymentProcessing | FullAccess | 1003 | 9085243 | 2022-05-04T22:30:00 |

**View `v_vehicle_identification_record_customer_profile`**

```sql
CREATE VIEW v_vehicle_identification_record_customer_profile AS
SELECT a.vehicle_identification_record_id, a.record_id, a.license_plate_number, a.state_issued, b.id AS profile_id, b.profile_id AS profile_profile_id, b.customer_name AS profile_customer_name
FROM vehicle_identification_records a JOIN customer_profiles b ON a.customer_profile_id = b.id;
```

| vehicle_identification_record_id | record_id | license_plate_number | state_issued | profile_id | profile_profile_id | profile_customer_name |
|---|---|---|---|---|---|---|
| 1 | 10449530 | LIC-2494 | pilot-state-50 | 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Susan Wagner |
| 2 | 10445619 | LIC-2497 | extended-state-51 | 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher |
| 3 | 9568457 | LIC-2500 | integrated-state-52 | 3 | 10207150 | Peter Anthony |
| 4 | 20743593 | LIC-2503 | seasonal-state-53 | 4 | 611506 | Bobby Flores |

**View `v_vehicle_identification_record_personal_data_record`**

```sql
CREATE VIEW v_vehicle_identification_record_personal_data_record AS
SELECT a.vehicle_identification_record_id, a.record_id, a.license_plate_number, a.state_issued, b.id AS record_id, b.record_id AS record_record_id, b.collection_date AS record_collection_date
FROM vehicle_identification_records a JOIN personal_data_records b ON a.personal_data_record_id = b.id;
```

| vehicle_identification_record_id | record_id | license_plate_number | state_issued | record_id | record_record_id | record_collection_date |
|---|---|---|---|---|---|---|
| 1 | 10449530 | LIC-2494 | pilot-state-50 | 1 | 10449530 | 2025-12-17T11:57:00 |
| 2 | 10445619 | LIC-2497 | extended-state-51 | 2 | 10445619 | 2022-05-01T18:14:00 |
| 3 | 9568457 | LIC-2500 | integrated-state-52 | 3 | 9568457 | 2023-10-12T01:31:00 |
| 4 | 20743593 | LIC-2503 | seasonal-state-53 | 4 | 20743593 | 2024-03-23T08:48:00 |
