## Registry Operations and Domain Governance

The modern DNS ecosystem relies on a layered architecture of top-level domains, registered names, abuse monitoring, zone file management, and security protocol deployment. Each component generates structured records that together form the operational backbone of domain name administration. Registry operators delegate top-level domains, manage registration lifecycles, measure abuse rates, maintain zone files, and deploy security protocols—all tracked through interconnected data records. Understanding how these records relate is essential for practitioners who monitor domain health, assess risk, and ensure compliance across the namespace.

**Table `top_level_domains`**

| top_level_domain_id | tld_identifier | delegation_date | registry_operator | is_delegated | total_registered_names | retail_price | abuse_rate_id | security_protocol_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | legacy | 2025-04-25 | distributed-registry-18 | true | 8603 | 18.59 | 100 | 1 |
| 1001 | new | 2022-09-09 | baseline-registry-19 | false | 4 | 43.25 | 101 | 2 |
| 1002 | legacy | 2023-02-20 | pilot-registry-20 | true | 7 | 29.99 | 102 | 3 |
| 1003 | new | 2024-07-04 | extended-registry-21 | false | 4 | 13.49 | 103 | 4 |

Top-level domains serve as the foundational delegation units within the DNS hierarchy. Each TLD record captures its identifier, the date it was delegated to a registry operator, and whether it remains actively delegated. The registry operator manages the namespace and sets retail pricing for registrations. For example, the TLD identified as `legacy` (ID 1000) was delegated on 2025-04-25 to `distributed-registry-18`, carries a retail price of $18.59, and hosts 8,603 registered names. By contrast, the TLD labeled `new` (ID 1001) was delegated on 2022-09-09 to `baseline-registry-19`, priced at $43.25, and holds only four registered names. The delegation status—true or false—indicates whether the TLD is currently active in the root zone. Two of the four TLDs in this dataset are delegated; the other two remain undelegated, suggesting they are either in pre-delegation phases or have been withdrawn.

**Table `domain_names`**

| domain_name_id | domain_label | registration_date | expiration_date | registrant_id | status | is_privacy_protected | top_level_domain_id |
|---|---|---|---|---|---|---|---|
| 1 | Primary Initiative A | 2023-06-19T17:27:00 | 2025-08-18 | 790465 | active | true | 1000 |
| 2 | Composite Model | 2024-11-03T00:44:00 | 2022-01-02 | 1996914 | expired | false | 1001 |
| 3 | Compact Cluster | 2025-04-14T07:01:00 | 2023-06-13 | 4793492 | pending | true | 1002 |
| 4 | Legacy Review D | 2022-09-25T14:18:00 | 2024-11-24 | 1336171 | suspended | false | 1003 |

Domain names represent the individual registrations within each top-level domain. Each record includes a domain label, registration and expiration dates, a registrant identifier, the current status, and whether privacy protection is enabled. The domain labeled `Primary Initiative A` (ID 1) was registered on 2023-06-19 and expires on 2025-08-18, with registrant ID 790465 and an active status. Privacy protection is enabled for this name. The domain `Composite Model` (ID 2) shows an expired status and an expiration date of 2022-01-02, indicating it has lapsed. Registrant ID 1996914 is associated with this name, and privacy protection is not enabled. The `Compact Cluster` domain (ID 3) carries a pending status with privacy protection active, while `Legacy Review D` (ID 4) is suspended. These statuses—active, expired, pending, and suspended—reflect the lifecycle state of each registration and determine whether the domain resolves in the DNS.

**Table `abuse_types`**

| id | abuse_code | description | severity_level | is_mitigated | abuse_rate_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Extended Survey | 29 | false | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 4447035 | Pilot Corridor A | 40 | true | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 8189490 | Baseline Series | 51 | false | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Assessment | 62 | true | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Abuse classification records categorize the types of malicious or non-compliant activity observed within the namespace. Each abuse type carries a unique abuse code, a human-readable description, a severity level on a numeric scale, and a mitigation flag indicating whether the abuse has been addressed. The abuse code `c747f9a8-8fcc-11eb-924d-9cd76263cbd0` corresponds to an "Extended Survey" with a severity level of 29 and is currently unmitigated. The abuse labeled "Pilot Corridor A" (code `4447035`) has a severity of 40 and is marked as mitigated. The "Baseline Series" abuse (code `8189490`) reaches a severity of 51 and remains unmitigated, while "Distributed Assessment" (code `4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3`) carries the highest severity at 62 and has been mitigated. These classifications enable registry operators to prioritize remediation efforts based on severity and mitigation status.

**Table `abuse_rates`**

| id | measurement_date | rate_value | sample_size | confidence_interval | data_source | top_level_domain_id | zone_file_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2024-07-01T18:54:00 | 23.20 | 31 | 8.70 | pilot-data-38 | 1000 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 2025-12-12T01:11:00 | 27.40 | 38 | 11.40 | extended-data-39 | 1001 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 2022-05-23T08:28:00 | 31.60 | 45 | 14.10 | integrated-data-40 | 1002 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 2023-10-07T15:45:00 | 35.80 | 52 | 16.80 | seasonal-data-41 | 1003 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Abuse rate measurements quantify the volume and statistical confidence of abuse observations over time. Each measurement record includes a measurement date, a rate value, a sample size, a confidence interval, a data source identifier, and references to the associated top-level domain and zone file. The measurement taken on 2024-07-01 recorded a rate value of 23.20 from a sample of 31 observations, with a confidence interval of 8.70, sourced from `pilot-data-38`. The measurement from 2025-12-12 shows a rate of 27.40 with 38 samples and a confidence interval of 11.40, drawn from `extended-data-39`. The 2022-05-23 measurement reached 31.60 with 45 samples and a confidence interval of 14.10, while the 2023-10-07 measurement recorded the highest rate at 35.80 with 52 samples and a confidence interval of 16.80. These rates provide a quantitative basis for comparing abuse levels across TLDs and over time.

**Table `zone_files`**

| zone_file_id | file_id | capture_date | record_count | is_complete | storage_location | top_level_domain_id | abuse_rate_id |
|---|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | 2022-01-15 | 50 | false | distributed-storage-48 | 1000 | 100 |
| 101 | state_et_5 | 2023-06-26 | 17 | true | baseline-storage-49 | 1001 | 101 |
| 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-11-10 | 19 | false | pilot-storage-50 | 1002 | 102 |
| 103 | lu_tax_code_template_m22 | 2025-04-21 | 17 | true | extended-storage-51 | 1003 | 103 |

Zone files are the authoritative DNS data snapshots for each top-level domain. Each zone file record includes a file identifier, a capture date, the number of DNS records contained, a completeness flag, and a storage location. The zone file with identifier `68f46afd953b4de8824b596a1bff565c` was captured on 2022-01-15, contains 50 records, is marked as incomplete, and is stored in `distributed-storage-48`. The file named `state_et_5` was captured on 2023-06-26, holds 17 records, is complete, and resides in `baseline-storage-49`. The file `922b9d78-9bad-11eb-a8a2-19ed5c03f8d3` (captured 2024-11-10, 19 records, incomplete) is stored in `pilot-storage-50`, while `lu_tax_code_template_m22` (captured 2025-04-21, 17 records, complete) is in `extended-storage-51`. The completeness flag indicates whether the zone file represents a full snapshot of the TLD's DNS state.

**Table `security_protocols`**

| id | protocol_name | version | deployment_status | last_verified | top_level_domain_id | abuse_rate_id |
|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | seasonal-version-71 | deployed | 2022-05-10 | 1000 | 100 |
| 2 | Distributed Model | regional-version-72 | pending | 2023-10-21 | 1001 | 101 |
| 3 | Adaptive Cluster | legacy-version-73 | not_deployed | 2024-03-05 | 1002 | 102 |
| 4 | Primary Review A | compact-version-74 | deployed | 2025-08-16 | 1003 | 103 |

Security protocols track the deployment of DNS security extensions and related mechanisms within each top-level domain. Each protocol record includes a protocol name, a version identifier, a deployment status, the date of last verification, and references to the associated TLD and abuse rate. The "Baseline Initiative D" protocol uses version `seasonal-version-71`, is deployed, and was last verified on 2022-05-10. "Distributed Model" (version `regional-version-72`) is in a pending deployment state with a last verification date of 2023-10-21. "Adaptive Cluster" (version `legacy-version-73`) is marked as not deployed and was last verified on 2024-03-05. "Primary Review A" (version `compact-version-74`) is deployed and was last verified on 2025-08-16. Deployment status—deployed, pending, or not deployed—indicates the operational readiness of each security protocol.

The domain's supporting reference tables provide categorical context for the primary records.

**Table `domains_names`**

| top_level_domain_id | domain_name_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `types_names`**

| abuse_type_id | domain_name_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `rates_types`**

| abuse_rate_id | abuse_type_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `files_names`**

| zone_file_id | domain_name_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

These reference tables enumerate the domain labels, type classifications, rate categories, and file designations used throughout the dataset. They serve as lookup structures that normalize the values appearing in the primary tables, ensuring consistent categorization across all records.

The views in this dataset synthesize the base tables into analytical joins that answer specific operational questions. Each view combines related records to provide a unified perspective on a particular aspect of registry operations.

**View `vw_top_level_domain_domain_name_detail`**

```sql
CREATE VIEW vw_top_level_domain_domain_name_detail AS
SELECT a.top_level_domain_id, a.tld_identifier, a.delegation_date, b.domain_name_id AS name_domain_name_id, b.domain_label AS name_domain_label, b.registration_date AS name_registration_date
FROM top_level_domains a
  JOIN domains_names j ON j.top_level_domain_id = a.top_level_domain_id
  JOIN domain_names b ON b.domain_name_id = j.domain_name_id;
```

| top_level_domain_id | tld_identifier | delegation_date | name_domain_name_id | name_domain_label | name_registration_date |
|---|---|---|---|---|---|
| 1000 | legacy | 2025-04-25 | 1 | Primary Initiative A | 2023-06-19T17:27:00 |
| 1000 | legacy | 2025-04-25 | 2 | Composite Model | 2024-11-03T00:44:00 |
| 1001 | new | 2022-09-09 | 2 | Composite Model | 2024-11-03T00:44:00 |
| 1001 | new | 2022-09-09 | 3 | Compact Cluster | 2025-04-14T07:01:00 |
| 1002 | legacy | 2023-02-20 | 3 | Compact Cluster | 2025-04-14T07:01:00 |
| 1002 | legacy | 2023-02-20 | 4 | Legacy Review D | 2022-09-25T14:18:00 |
| 1003 | new | 2024-07-04 | 4 | Legacy Review D | 2022-09-25T14:18:00 |
| 1003 | new | 2024-07-04 | 1 | Primary Initiative A | 2023-06-19T17:27:00 |

This view joins top-level domains with their associated domain names, answering the question of which domains are registered under each TLD. It reveals the relationship between a TLD's delegation status and the lifecycle states of its registered names. For instance, the TLD `legacy` (ID 1000) is delegated and hosts the active domain `Primary Initiative A`, while the undelegated TLD `new` (ID 1001) contains the expired domain `Composite Model`. This join allows operators to assess whether undelegated TLDs still hold registrations in various states.

**View `vw_top_level_domain_abuse_rate`**

```sql
CREATE VIEW vw_top_level_domain_abuse_rate AS
SELECT a.top_level_domain_id, a.tld_identifier, a.delegation_date, a.registry_operator, b.id AS rate_id, b.measurement_date AS rate_measurement_date, b.rate_value AS rate_rate_value
FROM top_level_domains a JOIN abuse_rates b ON a.abuse_rate_id = b.id;
```

| top_level_domain_id | tld_identifier | delegation_date | registry_operator | rate_id | rate_measurement_date | rate_rate_value |
|---|---|---|---|---|---|---|
| 1000 | legacy | 2025-04-25 | distributed-registry-18 | 100 | 2024-07-01T18:54:00 | 23.20 |
| 1001 | new | 2022-09-09 | baseline-registry-19 | 101 | 2025-12-12T01:11:00 | 27.40 |
| 1002 | legacy | 2023-02-20 | pilot-registry-20 | 102 | 2022-05-23T08:28:00 | 31.60 |
| 1003 | new | 2024-07-04 | extended-registry-21 | 103 | 2023-10-07T15:45:00 | 35.80 |

This view links top-level domains to their abuse rate measurements, enabling comparison of abuse levels across TLDs. The TLD `legacy` (ID 1000) is associated with an abuse rate of 23.20 measured on 2024-07-01, while the TLD `new` (ID 1001) shows a higher rate of 27.40 from 2025-12-12. The TLD `legacy` (ID 1002) records a rate of 31.60, and `new` (ID 1003) reaches 35.80. These pairings allow operators to identify which TLDs require heightened monitoring based on their measured abuse rates.

**View `vw_top_level_domain_security_protocol`**

```sql
CREATE VIEW vw_top_level_domain_security_protocol AS
SELECT a.top_level_domain_id, a.tld_identifier, a.delegation_date, a.registry_operator, b.id AS protocol_id, b.protocol_name AS protocol_protocol_name, b.version AS protocol_version
FROM top_level_domains a JOIN security_protocols b ON a.security_protocol_id = b.id;
```

| top_level_domain_id | tld_identifier | delegation_date | registry_operator | protocol_id | protocol_protocol_name | protocol_version |
|---|---|---|---|---|---|---|
| 1000 | legacy | 2025-04-25 | distributed-registry-18 | 1 | Baseline Initiative D | seasonal-version-71 |
| 1001 | new | 2022-09-09 | baseline-registry-19 | 2 | Distributed Model | regional-version-72 |
| 1002 | legacy | 2023-02-20 | pilot-registry-20 | 3 | Adaptive Cluster | legacy-version-73 |
| 1003 | new | 2024-07-04 | extended-registry-21 | 4 | Primary Review A | compact-version-74 |

This view associates top-level domains with their deployed security protocols, revealing the security posture of each TLD. The TLD `legacy` (ID 1000) has the "Baseline Initiative D" protocol deployed, while the TLD `new` (ID 1001) has "Distributed Model" in a pending state. The TLD `legacy` (ID 1002) has "Adaptive Cluster" marked as not deployed, and the TLD `new` (ID 1003) has "Primary Review A" deployed. This join helps operators verify that all active TLDs have appropriate security protocols in place.

**View `vw_domain_name_top_level_domain`**

```sql
CREATE VIEW vw_domain_name_top_level_domain AS
SELECT a.domain_name_id, a.domain_label, a.registration_date, a.expiration_date, b.top_level_domain_id AS domain_top_level_domain_id, b.tld_identifier AS domain_tld_identifier, b.delegation_date AS domain_delegation_date
FROM domain_names a JOIN top_level_domains b ON a.top_level_domain_id = b.top_level_domain_id;
```

| domain_name_id | domain_label | registration_date | expiration_date | domain_top_level_domain_id | domain_tld_identifier | domain_delegation_date |
|---|---|---|---|---|---|---|
| 1 | Primary Initiative A | 2023-06-19T17:27:00 | 2025-08-18 | 1000 | legacy | 2025-04-25 |
| 2 | Composite Model | 2024-11-03T00:44:00 | 2022-01-02 | 1001 | new | 2022-09-09 |
| 3 | Compact Cluster | 2025-04-14T07:01:00 | 2023-06-13 | 1002 | legacy | 2023-02-20 |
| 4 | Legacy Review D | 2022-09-25T14:18:00 | 2024-11-24 | 1003 | new | 2024-07-04 |

This view connects individual domain names to their parent top-level domains, providing a complete picture of domain ownership within the TLD hierarchy. The domain `Primary Initiative A` is registered under the delegated TLD `legacy` (ID 1000), while `Composite Model` falls under the undelegated TLD `new` (ID 1001). The domain `Compact Cluster` is associated with the delegated TLD `legacy` (ID 1002), and `Legacy Review D` is under the undelegated TLD `new` (ID 1003). This relationship is fundamental for understanding namespace structure and for tracing domain registrations back to their governing TLDs.

**View `vw_abuse_type_domain_name_detail`**

```sql
CREATE VIEW vw_abuse_type_domain_name_detail AS
SELECT a.id, a.abuse_code, a.description, b.domain_name_id AS name_domain_name_id, b.domain_label AS name_domain_label, b.registration_date AS name_registration_date
FROM abuse_types a
  JOIN types_names j ON j.abuse_type_id = a.id
  JOIN domain_names b ON b.domain_name_id = j.domain_name_id;
```

| id | abuse_code | description | name_domain_name_id | name_domain_label | name_registration_date |
|---|---|---|---|---|---|
| 1 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Extended Survey | 1 | Primary Initiative A | 2023-06-19T17:27:00 |
| 1 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Extended Survey | 2 | Composite Model | 2024-11-03T00:44:00 |
| 2 | 4447035 | Pilot Corridor A | 2 | Composite Model | 2024-11-03T00:44:00 |
| 2 | 4447035 | Pilot Corridor A | 3 | Compact Cluster | 2025-04-14T07:01:00 |
| 3 | 8189490 | Baseline Series | 3 | Compact Cluster | 2025-04-14T07:01:00 |
| 3 | 8189490 | Baseline Series | 4 | Legacy Review D | 2022-09-25T14:18:00 |
| 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Assessment | 4 | Legacy Review D | 2022-09-25T14:18:00 |
| 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Assessment | 1 | Primary Initiative A | 2023-06-19T17:27:00 |

This view cross-references abuse types with domain name details, enabling operators to identify which domains are associated with specific abuse classifications. The "Extended Survey" abuse type (severity 29, unmitigated) can be correlated with domains such as `Primary Initiative A` and `Compact Cluster`, while "Pilot Corridor A" (severity 40, mitigated) links to `Composite Model` and `Legacy Review D`. This join supports targeted remediation by connecting abuse categories to the specific names they affect.

**View `vw_abuse_type_abuse_rate`**

```sql
CREATE VIEW vw_abuse_type_abuse_rate AS
SELECT a.id, a.abuse_code, a.description, a.severity_level, b.id AS rate_id, b.measurement_date AS rate_measurement_date, b.rate_value AS rate_rate_value
FROM abuse_types a JOIN abuse_rates b ON a.abuse_rate_id = b.id;
```

| id | abuse_code | description | severity_level | rate_id | rate_measurement_date | rate_rate_value |
|---|---|---|---|---|---|---|
| 1 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Extended Survey | 29 | 100 | 2024-07-01T18:54:00 | 23.20 |
| 2 | 4447035 | Pilot Corridor A | 40 | 101 | 2025-12-12T01:11:00 | 27.40 |
| 3 | 8189490 | Baseline Series | 51 | 102 | 2022-05-23T08:28:00 | 31.60 |
| 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Assessment | 62 | 103 | 2023-10-07T15:45:00 | 35.80 |

This view pairs abuse types with their corresponding abuse rate measurements, allowing operators to assess whether certain abuse categories correlate with higher measured rates. The "Extended Survey" abuse type (ID 1) is linked to the abuse rate of 23.20, while "Pilot Corridor A" (ID 2) corresponds to the rate of 27.40. "Baseline Series" (ID 3) maps to the rate of 31.60, and "Distributed Assessment" (ID 4) to the rate of 35.80. This relationship helps identify whether specific abuse classifications are associated with elevated abuse levels.

**View `vw_abuse_rate_top_level_domain`**

```sql
CREATE VIEW vw_abuse_rate_top_level_domain AS
SELECT a.id, a.measurement_date, a.rate_value, a.sample_size, b.top_level_domain_id AS domain_top_level_domain_id, b.tld_identifier AS domain_tld_identifier, b.delegation_date AS domain_delegation_date
FROM abuse_rates a JOIN top_level_domains b ON a.top_level_domain_id = b.top_level_domain_id;
```

| id | measurement_date | rate_value | sample_size | domain_top_level_domain_id | domain_tld_identifier | domain_delegation_date |
|---|---|---|---|---|---|---|
| 100 | 2024-07-01T18:54:00 | 23.20 | 31 | 1000 | legacy | 2025-04-25 |
| 101 | 2025-12-12T01:11:00 | 27.40 | 38 | 1001 | new | 2022-09-09 |
| 102 | 2022-05-23T08:28:00 | 31.60 | 45 | 1002 | legacy | 2023-02-20 |
| 103 | 2023-10-07T15:45:00 | 35.80 | 52 | 1003 | new | 2024-07-04 |

This view connects abuse rate measurements to their parent top-level domains, providing a clear mapping between TLDs and their measured abuse levels. The abuse rate of 23.20 (measured 2024-07-01) is attributed to the TLD `legacy` (ID 1000), while the rate of 27.40 (measured 2025-12-12) belongs to the TLD `new` (ID 1001). The rate of 31.60 (measured 2022-05-23) is associated with TLD `legacy` (ID 1002), and the rate of 35.80 (measured 2023-10-07) with TLD `new` (ID 1003). This join is essential for TLD-level risk assessment and for comparing abuse trends across the namespace.

**View `vw_abuse_rate_abuse_type_detail`**

```sql
CREATE VIEW vw_abuse_rate_abuse_type_detail AS
SELECT a.id, a.measurement_date, a.rate_value, b.id AS type_id, b.abuse_code AS type_abuse_code, b.description AS type_description
FROM abuse_rates a
  JOIN rates_types j ON j.abuse_rate_id = a.id
  JOIN abuse_types b ON b.id = j.abuse_type_id;
```

| id | measurement_date | rate_value | type_id | type_abuse_code | type_description |
|---|---|---|---|---|---|
| 100 | 2024-07-01T18:54:00 | 23.20 | 1 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Extended Survey |
| 100 | 2024-07-01T18:54:00 | 23.20 | 2 | 4447035 | Pilot Corridor A |
| 101 | 2025-12-12T01:11:00 | 27.40 | 2 | 4447035 | Pilot Corridor A |
| 101 | 2025-12-12T01:11:00 | 27.40 | 3 | 8189490 | Baseline Series |
| 102 | 2022-05-23T08:28:00 | 31.60 | 3 | 8189490 | Baseline Series |
| 102 | 2022-05-23T08:28:00 | 31.60 | 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Assessment |
| 103 | 2023-10-07T15:45:00 | 35.80 | 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Assessment |
| 103 | 2023-10-07T15:45:00 | 35.80 | 1 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Extended Survey |

This view merges abuse rate measurements with their associated abuse type classifications, combining quantitative rates with qualitative abuse categories. The abuse rate of 23.20 is linked to the "Extended Survey" abuse type (severity 29), the rate of 27.40 to "Pilot Corridor A" (severity 40), the rate of 31.60 to "Baseline Series" (severity 51), and the rate of 35.80 to "Distributed Assessment" (severity 62). This synthesis allows operators to evaluate whether higher-severity abuse types correspond to higher measured rates.

**View `vw_abuse_rate_zone_file`**

```sql
CREATE VIEW vw_abuse_rate_zone_file AS
SELECT a.id, a.measurement_date, a.rate_value, a.sample_size, b.zone_file_id AS file_zone_file_id, b.file_id AS file_file_id, b.capture_date AS file_capture_date
FROM abuse_rates a JOIN zone_files b ON a.zone_file_id = b.zone_file_id;
```

| id | measurement_date | rate_value | sample_size | file_zone_file_id | file_file_id | file_capture_date |
|---|---|---|---|---|---|---|
| 100 | 2024-07-01T18:54:00 | 23.20 | 31 | 100 | 68f46afd953b4de8824b596a1bff565c | 2022-01-15 |
| 101 | 2025-12-12T01:11:00 | 27.40 | 38 | 101 | state_et_5 | 2023-06-26 |
| 102 | 2022-05-23T08:28:00 | 31.60 | 45 | 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-11-10 |
| 103 | 2023-10-07T15:45:00 | 35.80 | 52 | 103 | lu_tax_code_template_m22 | 2025-04-21 |

This view associates abuse rate measurements with their corresponding zone files, linking quantitative abuse data to the DNS snapshots from which they were derived. The abuse rate of 23.20 is tied to the zone file `68f46afd953b4de8824b596a1bff565c` (50 records, incomplete), while the rate of 27.40 corresponds to `state_et_5` (17 records, complete). The rate of 31.60 is linked to `922b9d78-9bad-11eb-a8a2-19ed5c03f8d3` (19 records, incomplete), and the rate of 35.80 to `lu_tax_code_template_m22` (17 records, complete). This relationship helps operators assess whether zone file completeness correlates with abuse measurement accuracy.

**View `vw_zone_file_top_level_domain`**

```sql
CREATE VIEW vw_zone_file_top_level_domain AS
SELECT a.zone_file_id, a.file_id, a.capture_date, a.record_count, b.top_level_domain_id AS domain_top_level_domain_id, b.tld_identifier AS domain_tld_identifier, b.delegation_date AS domain_delegation_date
FROM zone_files a JOIN top_level_domains b ON a.top_level_domain_id = b.top_level_domain_id;
```

| zone_file_id | file_id | capture_date | record_count | domain_top_level_domain_id | domain_tld_identifier | domain_delegation_date |
|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | 2022-01-15 | 50 | 1000 | legacy | 2025-04-25 |
| 101 | state_et_5 | 2023-06-26 | 17 | 1001 | new | 2022-09-09 |
| 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-11-10 | 19 | 1002 | legacy | 2023-02-20 |
| 103 | lu_tax_code_template_m22 | 2025-04-21 | 17 | 1003 | new | 2024-07-04 |

This view connects zone files to their parent top-level domains, showing which TLDs each zone file represents. The zone file `68f46afd953b4de8824b596a1bff565c` belongs to the TLD `legacy` (ID 1000), `state_et_5` to the TLD `new` (ID 1001), `922b9d78-9bad-11eb-a8a2-19ed5c03f8d3` to the TLD `legacy` (ID 1002), and `lu_tax_code_template_m22` to the TLD `new` (ID 1003). This join is critical for verifying that each TLD has an associated zone file and for tracking zone file freshness across the namespace.

**View `vw_zone_file_domain_name_detail`**

```sql
CREATE VIEW vw_zone_file_domain_name_detail AS
SELECT a.zone_file_id, a.file_id, a.capture_date, b.domain_name_id AS name_domain_name_id, b.domain_label AS name_domain_label, b.registration_date AS name_registration_date
FROM zone_files a
  JOIN files_names j ON j.zone_file_id = a.zone_file_id
  JOIN domain_names b ON b.domain_name_id = j.domain_name_id;
```

| zone_file_id | file_id | capture_date | name_domain_name_id | name_domain_label | name_registration_date |
|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | 2022-01-15 | 1 | Primary Initiative A | 2023-06-19T17:27:00 |
| 100 | 68f46afd953b4de8824b596a1bff565c | 2022-01-15 | 2 | Composite Model | 2024-11-03T00:44:00 |
| 101 | state_et_5 | 2023-06-26 | 2 | Composite Model | 2024-11-03T00:44:00 |
| 101 | state_et_5 | 2023-06-26 | 3 | Compact Cluster | 2025-04-14T07:01:00 |
| 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-11-10 | 3 | Compact Cluster | 2025-04-14T07:01:00 |
| 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-11-10 | 4 | Legacy Review D | 2022-09-25T14:18:00 |
| 103 | lu_tax_code_template_m22 | 2025-04-21 | 4 | Legacy Review D | 2022-09-25T14:18:00 |
| 103 | lu_tax_code_template_m22 | 2025-04-21 | 1 | Primary Initiative A | 2023-06-19T17:27:00 |

This view links zone files to the domain names within their associated TLDs, providing a comprehensive view of which domains are represented in each zone file snapshot. The zone file `68f46afd953b4de8824b596a1bff565c` (TLD `legacy`, ID 1000) contains the domain `Primary Initiative A`, while `state_et_5` (TLD `new`, ID 1001) contains `Composite Model`. The file `922b9d78-9bad-11eb-a8a2-19ed5c03f8d3` (TLD `legacy`, ID 1002) includes `Compact Cluster`, and `lu_tax_code_template_m22` (TLD `new`, ID 1003) includes `Legacy Review D`. This relationship enables operators to verify that zone files accurately reflect the current set of registered domains.

**View `vw_zone_file_abuse_rate`**

```sql
CREATE VIEW vw_zone_file_abuse_rate AS
SELECT a.zone_file_id, a.file_id, a.capture_date, a.record_count, b.id AS rate_id, b.measurement_date AS rate_measurement_date, b.rate_value AS rate_rate_value
FROM zone_files a JOIN abuse_rates b ON a.abuse_rate_id = b.id;
```

| zone_file_id | file_id | capture_date | record_count | rate_id | rate_measurement_date | rate_rate_value |
|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | 2022-01-15 | 50 | 100 | 2024-07-01T18:54:00 | 23.20 |
| 101 | state_et_5 | 2023-06-26 | 17 | 101 | 2025-12-12T01:11:00 | 27.40 |
| 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-11-10 | 19 | 102 | 2022-05-23T08:28:00 | 31.60 |
| 103 | lu_tax_code_template_m22 | 2025-04-21 | 17 | 103 | 2023-10-07T15:45:00 | 35.80 |

This view pairs zone files with their corresponding abuse rate measurements, allowing operators to correlate zone file characteristics with abuse levels. The zone file `68f46afd953b4de8824b596a1bff565c` (50 records, incomplete) is associated with the abuse rate of 23.20, while `state_et_5` (17 records, complete) corresponds to the rate of 27.40. The file `922b9d78-9bad-11eb-a8a2-19ed5c03f8d3` (19 records, incomplete) links to the rate of 31.60, and `lu_tax_code_template_m22` (17 records, complete) to the rate of 35.80. This join supports analysis of whether zone file completeness or record count influences abuse measurement outcomes.

**View `vw_security_protocol_top_level_domain`**

```sql
CREATE VIEW vw_security_protocol_top_level_domain AS
SELECT a.id, a.protocol_name, a.version, a.deployment_status, b.top_level_domain_id AS domain_top_level_domain_id, b.tld_identifier AS domain_tld_identifier, b.delegation_date AS domain_delegation_date
FROM security_protocols a JOIN top_level_domains b ON a.top_level_domain_id = b.top_level_domain_id;
```

| id | protocol_name | version | deployment_status | domain_top_level_domain_id | domain_tld_identifier | domain_delegation_date |
|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | seasonal-version-71 | deployed | 1000 | legacy | 2025-04-25 |
| 2 | Distributed Model | regional-version-72 | pending | 1001 | new | 2022-09-09 |
| 3 | Adaptive Cluster | legacy-version-73 | not_deployed | 1002 | legacy | 2023-02-20 |
| 4 | Primary Review A | compact-version-74 | deployed | 1003 | new | 2024-07-04 |

This view associates security protocols with their parent top-level domains, showing the security posture of each TLD. The TLD `legacy` (ID 1000) has the "Baseline Initiative D" protocol deployed, the TLD `new` (ID 1001) has "Distributed Model" pending, the TLD `legacy` (ID 1002) has "Adaptive Cluster" not deployed, and the TLD `new` (ID 1003) has "Primary Review A" deployed. This join enables operators to verify that all active TLDs have security protocols and to identify TLDs with pending or absent security measures.

**View `vw_security_protocol_abuse_rate`**

```sql
CREATE VIEW vw_security_protocol_abuse_rate AS
SELECT a.id, a.protocol_name, a.version, a.deployment_status, b.id AS rate_id, b.measurement_date AS rate_measurement_date, b.rate_value AS rate_rate_value
FROM security_protocols a JOIN abuse_rates b ON a.abuse_rate_id = b.id;
```

| id | protocol_name | version | deployment_status | rate_id | rate_measurement_date | rate_rate_value |
|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | seasonal-version-71 | deployed | 100 | 2024-07-01T18:54:00 | 23.20 |
| 2 | Distributed Model | regional-version-72 | pending | 101 | 2025-12-12T01:11:00 | 27.40 |
| 3 | Adaptive Cluster | legacy-version-73 | not_deployed | 102 | 2022-05-23T08:28:00 | 31.60 |
| 4 | Primary Review A | compact-version-74 | deployed | 103 | 2023-10-07T15:45:00 | 35.80 |

This view links security protocols to their corresponding abuse rate measurements, allowing operators to assess whether security protocol deployment status correlates with abuse levels. The "Baseline Initiative D" protocol (deployed) is associated with the abuse rate of 23.20, "Distributed Model" (pending) with the rate of 27.40, "Adaptive Cluster" (not deployed) with the rate of 31.60, and "Primary Review A" (deployed) with the rate of 35.80. This relationship provides insight into whether deployed security protocols are associated with lower or higher abuse rates, informing decisions about security investment and protocol prioritization.

## Synthesis

The domain of DNS registry operations is defined by the interplay between top-level domain delegations, domain name registrations, abuse monitoring, zone file management, and security protocol deployment. Each base table captures a distinct operational dimension, while the views synthesize these dimensions into actionable analytical joins. The TLD serves as the central organizing entity, anchoring domain names, abuse rates, zone files, and security protocols through foreign-key relationships. Registry operators use these records to monitor registration lifecycles, assess abuse risk, verify zone file integrity, and ensure security protocol coverage. The data reveals patterns—such as the correlation between deployment status and abuse rates, or between zone file completeness and measurement confidence—that inform operational decisions across the namespace.