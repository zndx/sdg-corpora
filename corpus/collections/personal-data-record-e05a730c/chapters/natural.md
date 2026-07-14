## Data Governance in Digital Commerce Ecosystems

Modern digital commerce operates across a complex web of platforms, tracking mechanisms, customer profiles, and third-party vendors. Organizations must maintain rigorous oversight of personal data as it flows through this ecosystem—collecting identifiers, commercial information, network activity, and inferred profiles across websites and mobile applications. Each data element carries specific retention requirements, sensitivity classifications, and disclosure constraints that determine how it may be stored, shared, and ultimately disposed of. The records below document a representative snapshot of this governance landscape, capturing the relationships between digital platforms, the software that monitors user behavior, the customer profiles that emerge from aggregated signals, and the external vendors who process transactions and provide ancillary services.

**Table `personal_data_records`**

| id | record_id | collection_date | data_category | is_sensitive | retention_period_months | disclosure_status | digital_platform_id | customer_profile_id | vendor_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | 2025-12-17T11:57:00 | Identifiers | false | 30 | InternalUse | 1 | 1 | Continental Group |
| 2 | 10445619 | 2022-05-01T18:14:00 | CommercialInformation | true | 38 | SharedWithVendor | 2 | 2 | PubMatic Inc. |
| 3 | 9568457 | 2023-10-12T01:31:00 | NetworkActivity | false | 46 | PubliclyDisclosed | 3 | 3 | Dhillon Crane Service |
| 4 | 20743593 | 2024-03-23T08:48:00 | InferredProfile | true | 54 | InternalUse | 4 | 4 | Sealed Air |

Personal data records form the foundational ledger of this ecosystem. Each record carries a unique identifier—such as `10449530` or `20743593`—and a collection timestamp that anchors the data to a specific moment in time. The `data_category` field classifies what kind of information was captured: Identifiers, CommercialInformation, NetworkActivity, or InferredProfile. Sensitivity is explicitly flagged; records with `is_sensitive` set to true, such as the CommercialInformation entry collected on 2022-05-01, trigger stricter handling protocols. Retention periods range from 30 to 54 months, dictating how long the organization may lawfully store the data before deletion. The `disclosure_status` column—InternalUse, SharedWithVendor, or PubliclyDisclosed—encodes the permitted scope of sharing. Each record is also linked to a digital platform, a customer profile, and a third-party vendor, establishing the chain of custody from collection through processing.

**Table `digital_platforms`**

| id | platform_id | platform_name | platform_type | url | cookie_enabled | analytics_provider | tracking_software_id |
|---|---|---|---|---|---|---|---|
| 1 | state_uk_28 | Baseline Initiative D | Website | https://www.nature.com/articles/nphoton.2017.123 | true | adaptive-analytic-11 | 1000 |
| 2 | e6ce01fe-8fc3-11eb-924d-9cd76263cbd0 | Distributed Model | MobileApp | http://www.mdpi.com/2073-445X/8/3/43/pdf | false | distributed-analytic-12 | 1001 |
| 3 | 4716417 | Adaptive Cluster | Website | https://www.deshaw.com/recruit/UnivListing.html | true | baseline-analytic-13 | 1002 |
| 4 | 10966228 | Primary Review A | MobileApp | https://www.nature.com/articles/nphoton.2015.276 | false | pilot-analytic-14 | 1003 |

Digital platforms serve as the primary collection surfaces. They appear as either Websites or MobileApps, each identified by a platform identifier such as `state_uk_28` or the UUID `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0`. The platform name—Baseline Initiative D, Distributed Model, Adaptive Cluster, Primary Review A—provides an internal label for the property. A URL points to the web address where the platform resides, and the `cookie_enabled` flag indicates whether cookie-based tracking is active. Analytics providers like `adaptive-analytic-11` or `distributed-analytic-12` are assigned to each platform, and a `tracking_software_id` ties the platform to the specific software component responsible for data capture.

**Table `tracking_softwares`**

| id | software_id | software_name | provider_name | function_type | data_collected | digital_platform_id | personal_data_record_id |
|---|---|---|---|---|---|---|---|
| 1000 | gd_taxc_2111 | Primary Review A | Primary Initiative A | Analytics | adaptive-data-59 | 1 | 1 |
| 1001 | 5917273 | Composite Initiative | Composite Model | AdTargeting | distributed-data-60 | 2 | 2 |
| 1002 | id_4 | Compact Model | Compact Cluster | PixelTracking | baseline-data-61 | 3 | 3 |
| 1003 | 8928496 | Legacy Cluster D | Legacy Review D | Analytics | pilot-data-62 | 4 | 4 |

Tracking software implements the actual data collection logic on each platform. The software identifier—`gd_taxc_2111`, `5917273`, `id_4`, `8928496`—uniquely names each instance. Software names such as Primary Review A, Composite Initiative, Compact Model, and Legacy Cluster D correspond to internal project labels. The `provider_name` field identifies the originating initiative or model, while `function_type` specifies the operational role: Analytics, AdTargeting, or PixelTracking. The `data_collected` column records the type of signal captured, for example `adaptive-data-59` or `pilot-data-62`. Each tracking software instance is bound to a single digital platform and a single personal data record, creating a direct lineage from the software's output to the governed data asset.

**Table `customer_profiles`**

| id | profile_id | customer_name | household_id | profile_status | last_updated | preference_tags | purchase_transaction_id |
|---|---|---|---|---|---|---|---|
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Susan Wagner | 726044 | Active | 2023-06-17T17:27:00 | adaptive-preferen-17 | 1000 |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | 16605652 | Inactive | 2024-11-01T00:44:00 | distributed-preferen-18 | 1001 |
| 3 | 10207150 | Peter Anthony | 8928495 | Deleted | 2025-04-12T07:01:00 | baseline-preferen-19 | 1002 |
| 4 | 611506 | Bobby Flores | 5844284 | Active | 2022-09-23T14:18:00 | pilot-preferen-20 | 1003 |

Customer profiles aggregate behavioral and transactional signals into a coherent representation of an individual. Profile identifiers include UUIDs like `72623baa-9bad-11eb-a8a2-19ed5c03f8d3` and numeric codes such as `10207150`. Customer names—Susan Wagner, Norma Fisher, Peter Anthony, Bobby Flores—provide the human-readable anchor. A `household_id` groups related profiles, while `profile_status` indicates the lifecycle state: Active, Inactive, or Deleted. The `last_updated` timestamp records the most recent modification, and `preference_tags` such as `adaptive-preferen-17` or `pilot-preferen-20` encode inferred interests. Each profile is linked to a purchase transaction, connecting behavioral data to commercial outcomes.

**Table `purchase_transactions`**

| id | transaction_id | transaction_date | total_amount | payment_method | store_location | items_purchased | customer_profile_id | vendor_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 937738 | 2023-02-25T01:39:00 | 112.11 | CreditCard | composite-store-21 | primary-items-16 | 1 | Continental Group |
| 1001 | 89509 | 2024-07-09T08:56:00 | 1,979 | DebitCard | primary-store-22 | adaptive-items-17 | 2 | PubMatic Inc. |
| 1002 | 1186092 | 2025-12-20T15:13:00 | 15,418 | Cash | adaptive-store-23 | distributed-items-18 | 3 | Dhillon Crane Service |
| 1003 | 9085243 | 2022-05-04T22:30:00 | 12,579 | CreditCard | distributed-store-24 | baseline-items-19 | 4 | Sealed Air |

Purchase transactions document the commercial exchange that concludes the customer journey. Transaction identifiers like `937738` and `89509` uniquely reference each event. The `transaction_date` anchors the purchase in time, and `total_amount` records the monetary value—ranging from $112.11 to $15,418.00. Payment methods include CreditCard, DebitCard, and Cash. Store locations such as `composite-store-21` and `primary-store-22` identify the point of sale, while `items_purchased` fields like `primary-items-16` describe the goods involved. Each transaction is associated with a customer profile and a third-party vendor, completing the commercial loop.

**Table `third_party_vendors`**

| vendor_id | vendor_name | service_type | data_access_level | contract_start_date | personal_data_record_id | purchase_transaction_id |
|---|---|---|---|---|---|---|
| Continental Group | Microsoft Corporation | PaymentProcessing | FullAccess | 2022-01-26 | 1 | 1000 |
| PubMatic Inc. | PureCycle Technologies. | Analytics | LimitedAccess | 2023-06-10 | 2 | 1001 |
| Dhillon Crane Service | American International Group | Advertising | Anonymized | 2024-11-21 | 3 | 1002 |
| Sealed Air | American Airlines Group | PaymentProcessing | FullAccess | 2025-04-05 | 4 | 1003 |

Third-party vendors provide external services that process data on behalf of the organization. The `vendor_id` and `vendor_name` fields identify the entity—Continental Group, PubMatic Inc., Dhillon Crane Service, Sealed Air. The `service_type` column specifies the nature of the engagement: PaymentProcessing, Analytics, or Advertising. Data access levels—FullAccess, LimitedAccess, Anonymized—define the scope of information the vendor may receive. Contract start dates such as 2022-01-26 and 2025-04-05 establish the temporal boundary of the relationship. Each vendor record is linked to a personal data record and a purchase transaction, documenting the data flow and commercial context of the engagement.

**Table `vehicle_identification_records`**

| vehicle_identification_record_id | record_id | license_plate_number | state_issued | vehicle_make | vehicle_model | capture_timestamp | ocr_confidence_score | customer_profile_id | personal_data_record_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | LIC-2494 | pilot-state-50 | seasonal-vehicle-95 | compact-vehicle-80 | 2025-08-15T19:33:00 | 14.70 | 1 | 1 |
| 2 | 10445619 | LIC-2497 | extended-state-51 | regional-vehicle-96 | composite-vehicle-81 | 2022-01-26T02:50:00 | 16.40 | 2 | 2 |
| 3 | 9568457 | LIC-2500 | integrated-state-52 | legacy-vehicle-97 | primary-vehicle-82 | 2023-06-10T09:07:00 | 18.10 | 3 | 3 |
| 4 | 20743593 | LIC-2503 | seasonal-state-53 | compact-vehicle-98 | adaptive-vehicle-83 | 2024-11-21T16:24:00 | 19.80 | 4 | 4 |

Vehicle identification records capture data related to connected vehicle systems, which may serve as additional data collection surfaces in automotive-integrated commerce environments. These records provide a bridge between physical asset identification and digital data governance, ensuring that vehicle-derived signals are tracked with the same rigor as web and mobile platform data.

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

Platforms records maintain an auxiliary registry of platform metadata, supplementing the primary digital platforms table with additional operational attributes. This secondary registry supports reconciliation and audit workflows by providing a parallel view of platform properties.

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

Profiles records serve as a supplementary registry for customer profile metadata, mirroring and extending the customer_profiles table. This parallel structure enables independent auditing of profile attributes and supports data lineage verification across systems.

## Cross-Entity Relationships

The power of this data model lies in its ability to answer specific governance questions through joined views. Each view combines tables to reveal relationships that are not visible when examining individual records in isolation.

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

This view answers the question: which digital platform is responsible for collecting each personal data record? By joining personal_data_records with digital_platforms, the view reveals that record `10449530` was collected via the platform identified as `state_uk_28` (Baseline Initiative D), while record `10445619` originated from the platform `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0` (Distributed Model). The join preserves the data category, sensitivity flag, and disclosure status alongside the platform name and type, enabling auditors to assess whether the platform's capabilities align with the sensitivity of the data it collects.

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

This view maps personal data records to the customer profiles they inform. Record `10449530` (category: Identifiers, retention: 30 months) is associated with customer profile `72623baa-9bad-11eb-a8a2-19ed5c03f8d3` (Susan Wagner, status: Active). Record `9568457` (category: NetworkActivity, retention: 46 months) links to profile `10207150` (Peter Anthony, status: Deleted). This relationship is critical for data subject access requests: when a customer requests deletion, the view identifies all personal data records that feed into their profile, ensuring comprehensive erasure.

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

This view exposes the vendor chain for each personal data record. Record `10449530` flows to Continental Group, which provides PaymentProcessing services with FullAccess. Record `10445619` is shared with PubMatic Inc. (Analytics, LimitedAccess), and record `9568457` is disclosed to Dhillon Crane Service (Advertising, Anonymized). The disclosure_status field from the personal data record—InternalUse, SharedWithVendor, PubliclyDisclosed—can be cross-referenced against the vendor's data_access_level to verify compliance with the organization's sharing policies.

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

This view provides a detailed breakdown of personal data collected through each digital platform. Platform `state_uk_28` (Baseline Initiative D, Website, cookies enabled) collected record `10449530` (Identifiers, not sensitive, 30-month retention, InternalUse). Platform `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0` (Distributed Model, MobileApp, cookies disabled) collected record `10445619` (CommercialInformation, sensitive, 38-month retention, SharedWithVendor). This view is essential for platform-level risk assessments: it reveals whether sensitive data is being collected through platforms with limited tracking capabilities, or whether high-retention data is stored on platforms with weaker security postures.

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

This view links digital platforms to the tracking software instances deployed on them. Platform `state_uk_28` runs tracking software `gd_taxc_2111` (Primary Review A, function: Analytics, provider: Primary Initiative A). Platform `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0` runs `5917273` (Composite Initiative, function: AdTargeting, provider: Composite Model). Platform `4716417` (Adaptive Cluster) uses `id_4` (Compact Model, function: PixelTracking). Platform `10966228` (Primary Review A, MobileApp) uses `8928496` (Legacy Cluster D, function: Analytics). This mapping is vital for software lifecycle management: when a tracking software component is deprecated or found to have vulnerabilities, the view identifies every platform that depends on it.

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

This view presents the same platform-to-software relationship from the software's perspective. Tracking software `gd_taxc_2111` is deployed on platform `state_uk_28` (Baseline Initiative D, Website). Software `5917273` (Composite Initiative) operates on platform `e6ce01fe-8fc3-11eb-924d-9cd76263cbd0` (Distributed Model, MobileApp). Software `id_4` (Compact Model) runs on platform `4716417` (Adaptive Cluster, Website). Software `8928496` (Legacy Cluster D) is installed on platform `10966228` (Primary Review A, MobileApp). This orientation is useful for software vendors and internal engineering teams who need to understand the deployment footprint of each tracking component.

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

This view connects tracking software to the personal data records it produces. Software `gd_taxc_2111` (Primary Review A, Analytics) generates record `10449530` (Identifiers, InternalUse). Software `5917273` (Composite Initiative, AdTargeting) generates `10445619` (CommercialInformation, SharedWithVendor). Software `id_4` (Compact Model, PixelTracking) generates `9568457` (NetworkActivity, PubliclyDisclosed). Software `8928496` (Legacy Cluster D, Analytics) generates `20743593` (InferredProfile, InternalUse). This relationship enables data lineage tracing: when a data quality issue is discovered in a personal data record, the view identifies the exact software component responsible, accelerating root cause analysis.

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

This view reveals which personal data records contribute to each customer profile. Profile `72623baa-9bad-11eb-a8a2-19ed5c03f8d3` (Susan Wagner, Active) is informed by record `10449530` (Identifiers, 30-month retention, InternalUse). Profile `d9d925ce-8fcc-11eb-924d-9cd76263cbd0` (Norma Fisher, Inactive) is informed by `10445619` (CommercialInformation, 38-month retention, SharedWithVendor). Profile `10207150` (Peter Anthony, Deleted) is informed by `9568457` (NetworkActivity, 46-month retention, PubliclyDisclosed). Profile `611506` (Bobby Flores, Active) is informed by `20743593` (InferredProfile, 54-month retention, InternalUse). This view supports retention management: when a profile is marked Deleted or Inactive, the associated personal data records can be evaluated for early disposal based on their retention periods.

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

This view links customer profiles to their purchase transactions. Profile `72623baa-9bad-11eb-a8a2-19ed5c03f8d3` (Susan Wagner) made transaction `937738` on 2023-02-25 for $112.11 via CreditCard at composite-store-21. Profile `d9d925ce-8fcc-11eb-924d-9cd76263cbd0` (Norma Fisher) made transaction `89509` on 2024-07-09 for $1,979.00 via DebitCard at primary-store-22. Profile `10207150` (Peter Anthony) made transaction `1186092` on 2025-12-20 for $15,418.00 via Cash at adaptive-store-23. Profile `611506` (Bobby Flores) made transaction `9085243` on 2022-05-04 for $12,579.00 via CreditCard at distributed-store-24. This relationship enables revenue attribution to customer segments and supports fraud detection by correlating profile status with transaction patterns.

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

This view maps purchase transactions to the third-party vendors that process them. Transaction `937738` ($112.11) is processed by Continental Group (PaymentProcessing, FullAccess). Transaction `89509` ($1,979.00) is processed by PubMatic Inc. (Analytics, LimitedAccess). Transaction `1186092` ($15,418.00) is processed by Dhillon Crane Service (Advertising, Anonymized). Transaction `9085243` ($12,579.00) is processed by Sealed Air (PaymentProcessing, FullAccess). This view is critical for vendor risk management: it reveals which vendors handle high-value transactions and whether their data access levels are appropriate for the sensitivity of the information they process.

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

This view connects third-party vendors to the personal data records they access. Continental Group accesses record `10449530` (Identifiers, InternalUse). PubMatic Inc. accesses `10445619` (CommercialInformation, SharedWithVendor). Dhillon Crane Service accesses `9568457` (NetworkActivity, PubliclyDisclosed). Sealed Air accesses `20743593` (InferredProfile, InternalUse). The vendor's service_type and data_access_level can be compared against the record's disclosure_status to verify that data sharing complies with the organization's privacy commitments and regulatory obligations.

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

This view links third-party vendors to the purchase transactions they process. Continental Group processes transaction `937738` ($112.11, CreditCard, composite-store-21). PubMatic Inc. processes `89509` ($1,979.00, DebitCard, primary-store-22). Dhillon Crane Service processes `1186092` ($15,418.00, Cash, adaptive-store-23). Sealed Air processes `9085243` ($12,579.00, CreditCard, distributed-store-24). This view supports financial reconciliation and vendor performance evaluation by providing a complete picture of each vendor's transactional footprint.

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

This view bridges vehicle identification data with customer profiles, enabling organizations that operate connected vehicle platforms to correlate vehicle-derived signals with established customer records. The join supports unified customer views that incorporate both digital platform behavior and physical asset usage patterns, which is particularly relevant for automotive manufacturers and mobility service providers.

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

This view connects vehicle identification records to personal data records, establishing the data lineage from vehicle sensors and telematics to governed data assets. It ensures that vehicle-derived personal data—such as location history, driving behavior, and cabin environment data—is tracked with the same retention, sensitivity, and disclosure controls as data collected through web and mobile platforms.

## Synthesis

The data model presented here captures the full lifecycle of personal data in a digital commerce ecosystem: from collection through digital platforms and tracking software, through aggregation into customer profiles, through commercial exchange via purchase transactions, and through processing by third-party vendors. Each table serves a distinct governance function, and each view answers a specific operational question about the relationships between these entities. The identifiers, timestamps, sensitivity flags, retention periods, and disclosure statuses embedded in the records provide the granular controls necessary for compliance. The fictional organizations, people, and products documented in these records illustrate the scale and complexity of modern data governance, where every data point must be traced to its origin, its handler, and its eventual disposition. Practitioners who internalize these relationships will be better equipped to design privacy-by-default architectures, conduct effective data audits, and respond to regulatory inquiries with precision.

## Data appendix

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
