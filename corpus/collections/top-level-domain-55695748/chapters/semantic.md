## Domain Ontology and Relational Materialization

The namespace governance ecosystem tracks how top-level domains (TLDs) are delegated, operated, and monitored for abuse across a distributed registry infrastructure. At the centre of the model sits the `top_level_domains` table, which anchors every other entity through a set of cardinality-bounded foreign-key relationships. Each TLD record carries a unique surrogate key, a human-readable `tld_identifier` such as `legacy` or `new`, a `delegation_date` marking when the registry was authorised, the name of the `registry_operator` (for example, `distributed-registry-18` or `baseline-registry-19`), a boolean `is_delegated` flag, a `total_registered_names` counter, a `retail_price` for domain registration, and two foreign keys — `abuse_rate_id` and `security_protocol_id` — that bind the TLD to its abuse-metrics and security-posture records respectively.

**Table `top_level_domains`**

| top_level_domain_id | tld_identifier | delegation_date | registry_operator | is_delegated | total_registered_names | retail_price | abuse_rate_id | security_protocol_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | legacy | 2025-04-25 | distributed-registry-18 | true | 8603 | 18.59 | 100 | 1 |
| 1001 | new | 2022-09-09 | baseline-registry-19 | false | 4 | 43.25 | 101 | 2 |
| 1002 | legacy | 2023-02-20 | pilot-registry-20 | true | 7 | 29.99 | 102 | 3 |
| 1003 | new | 2024-07-04 | extended-registry-21 | false | 4 | 13.49 | 103 | 4 |

The `top_level_domains` table is the principal entity. Its primary key, `top_level_domain_id`, is a four-digit integer (1000–1003 in the sample) that other tables reference to associate their records with a specific TLD. The `tld_identifier` column stores a short categorical label, while `delegation_date` records the calendar date of delegation. The `registry_operator` column names the organisation running the registry, and `is_delegated` is a boolean indicating whether the TLD is currently active in the root zone. The `total_registered_names` column counts active registrations, and `retail_price` stores the registration fee as a decimal. The two foreign keys, `abuse_rate_id` and `security_protocol_id`, point into the `abuse_rates` and `security_protocols` tables respectively, establishing one-to-one or one-to-few relationships that are materialised as integer columns in the same row.

Domain registrations are captured in the `domain_names` table, which stores individual domain labels alongside their lifecycle metadata. Each row carries a `domain_name_id`, a `domain_label` such as `Primary Initiative A` or `Compact Cluster`, a `registration_date` in ISO-8601 format, an `expiration_date`, a `registrant_id` identifying the owner, a `status` column with values like `active`, `expired`, `pending`, or `suspended`, a boolean `is_privacy_protected` flag, and a foreign key `top_level_domain_id` that links the domain to its parent TLD.

**Table `domain_names`**

| domain_name_id | domain_label | registration_date | expiration_date | registrant_id | status | is_privacy_protected | top_level_domain_id |
|---|---|---|---|---|---|---|---|
| 1 | Primary Initiative A | 2023-06-19T17:27:00 | 2025-08-18 | 790465 | active | true | 1000 |
| 2 | Composite Model | 2024-11-03T00:44:00 | 2022-01-02 | 1996914 | expired | false | 1001 |
| 3 | Compact Cluster | 2025-04-14T07:01:00 | 2023-06-13 | 4793492 | pending | true | 1002 |
| 4 | Legacy Review D | 2022-09-25T14:18:00 | 2024-11-24 | 1336171 | suspended | false | 1003 |

The `domain_names` table models the many-to-one relationship between domains and TLDs: many domain rows reference a single `top_level_domain_id`. For instance, the domain `Primary Initiative A` (id 1) is registered under TLD 1000, while `Composite Model` (id 2) belongs to TLD 1001. The `status` column constrains domains to a finite set of lifecycle states, and `is_privacy_protected` indicates whether WHOIS privacy masking is enabled. The `registrant_id` is a large integer (e.g., 790465) that references an external entity table not shown here.

Abuse monitoring is modelled through two interrelated tables: `abuse_rates` and `abuse_types`. The `abuse_rates` table records statistical measurements of abuse activity per TLD at a point in time. Each row has an `id` (the abuse-rate surrogate key, e.g., 100–103), a `measurement_date`, a numeric `rate_value` (e.g., 23.20 or 35.80), a `sample_size` (e.g., 31 or 52), a `confidence_interval` width (e.g., 8.70 or 16.80), a `data_source` label such as `pilot-data-38`, and two foreign keys — `top_level_domain_id` and `zone_file_id` — that bind the measurement to its TLD and the zone file from which it was derived.

**Table `abuse_rates`**

| id | measurement_date | rate_value | sample_size | confidence_interval | data_source | top_level_domain_id | zone_file_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2024-07-01T18:54:00 | 23.20 | 31 | 8.70 | pilot-data-38 | 1000 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 2025-12-12T01:11:00 | 27.40 | 38 | 11.40 | extended-data-39 | 1001 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 2022-05-23T08:28:00 | 31.60 | 45 | 14.10 | integrated-data-40 | 1002 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 2023-10-07T15:45:00 | 35.80 | 52 | 16.80 | seasonal-data-41 | 1003 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `abuse_rates` table is a fact table in the dimensional sense: it stores quantitative measurements (`rate_value`, `sample_size`, `confidence_interval`) and their provenance (`data_source`, `measurement_date`). The `top_level_domain_id` foreign key creates a many-to-one link back to `top_level_domains`, meaning a single TLD can accumulate multiple abuse-rate measurements over time. The `zone_file_id` foreign key links each measurement to a specific zone file snapshot. The `abuse_rate_id` column in `top_level_domains` is a denormalised shortcut that points to the most recent or canonical abuse-rate record for that TLD.

The `abuse_types` table classifies the kinds of abuse observed. Each row carries an `id`, a UUID or numeric `abuse_code`, a human-readable `description` (e.g., `Extended Survey`, `Pilot Corridor A`, `Baseline Series`, `Distributed Assessment`), a numeric `severity_level` (ranging from 29 to 62 in the sample), a boolean `is_mitigated` flag, a `created_at` timestamp, an `updated_at` timestamp, and a foreign key `abuse_rate_id` that links the abuse type to its parent measurement.

**Table `abuse_types`**

| id | abuse_code | description | severity_level | is_mitigated | abuse_rate_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 1 | c747f9a8-8fcc-11eb-924d-9cd76263cbd0 | Extended Survey | 29 | false | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 4447035 | Pilot Corridor A | 40 | true | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 8189490 | Baseline Series | 51 | false | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 4bbb5d4c-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Assessment | 62 | true | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `abuse_types` table implements a one-to-many relationship with `abuse_rates`: each abuse-rate measurement can be annotated with multiple abuse-type classifications. The `abuse_code` column stores either a UUID (e.g., `c747f9a8-8fcc-11eb-924d-9cd76263cbd0`) or a plain numeric identifier (e.g., `4447035`). The `severity_level` is an integer where higher values indicate more severe abuse. The `is_mitigated` boolean tracks whether the abuse has been remediated. The `abuse_rate_id` foreign key creates the link back to the `abuse_rates` fact table.

Zone files — the authoritative DNS zone snapshots — are tracked in the `zone_files` table. Each row has a `zone_file_id`, a `file_id` (a UUID or alphanumeric string such as `68f46afd953b4de8824b596a1bff565c` or `state_et_5`), a `capture_date`, a `record_count` of DNS records in the file, a boolean `is_complete` flag, a `storage_location` string (e.g., `distributed-storage-48`), and two foreign keys: `top_level_domain_id` and `abuse_rate_id`.

**Table `zone_files`**

| zone_file_id | file_id | capture_date | record_count | is_complete | storage_location | top_level_domain_id | abuse_rate_id |
|---|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | 2022-01-15 | 50 | false | distributed-storage-48 | 1000 | 100 |
| 101 | state_et_5 | 2023-06-26 | 17 | true | baseline-storage-49 | 1001 | 101 |
| 102 | 922b9d78-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-11-10 | 19 | false | pilot-storage-50 | 1002 | 102 |
| 103 | lu_tax_code_template_m22 | 2025-04-21 | 17 | true | extended-storage-51 | 1003 | 103 |

The `zone_files` table models the infrastructure layer of DNS governance. The `file_id` is the unique identifier for the actual zone file blob, while `capture_date` records when the snapshot was taken. The `record_count` column stores the number of DNS resource records (e.g., 50, 17, 19, 17). The `is_complete` boolean indicates whether the capture was a full zone transfer. The `storage_location` names the storage system holding the file. The `top_level_domain_id` foreign key links the zone file to its TLD, and the `abuse_rate_id` foreign key links it to the abuse-rate measurement derived from it.

Security posture is captured in the `security_protocols` table, which records the DNS security extensions deployed for each TLD. Each row has an `id`, a `protocol_name` (e.g., `Baseline Initiative D`, `Distributed Model`, `Adaptive Cluster`, `Primary Review A`), a `version` string (e.g., `seasonal-version-71`, `regional-version-72`), a `deployment_status` with values `deployed`, `pending`, or `not_deployed`, a `last_verified` date, and two foreign keys: `top_level_domain_id` and `abuse_rate_id`.

**Table `security_protocols`**

| id | protocol_name | version | deployment_status | last_verified | top_level_domain_id | abuse_rate_id |
|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | seasonal-version-71 | deployed | 2022-05-10 | 1000 | 100 |
| 2 | Distributed Model | regional-version-72 | pending | 2023-10-21 | 1001 | 101 |
| 3 | Adaptive Cluster | legacy-version-73 | not_deployed | 2024-03-05 | 1002 | 102 |
| 4 | Primary Review A | compact-version-74 | deployed | 2025-08-16 | 1003 | 103 |

The `security_protocols` table tracks DNSSEC and related security mechanisms. The `protocol_name` column names the security initiative, and `version` stores the protocol version string. The `deployment_status` column constrains the deployment state to one of three values. The `last_verified` date records when the deployment was last validated. The `top_level_domain_id` foreign key binds the protocol to its TLD, and the `abuse_rate_id` foreign key creates a cross-reference to the abuse-rate measurement.

The schema also includes four lookup tables that normalise categorical values: `domains_names`, `types_names`, `rates_types`, and `files_names`. These tables store reference enumerations for domain name categories, abuse type classifications, rate type classifications, and file type classifications respectively. They are referenced by the domain, abuse, rate, and zone-file tables to ensure consistency of categorical values across the schema.

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

## Materialised Views as Domain-Fact Reconstructors

The relational schema is materialised through a set of twelve views that join the normalised tables back into domain-level facts. Each view answers a specific analytical question by reassembling the pieces that were separated during normalisation.

The view `vw_top_level_domain_domain_name_detail` joins `top_level_domains` with `domain_names` on `top_level_domain_id` to answer the question: "Which domains are registered under each TLD, and what are their lifecycle states?" A row from this view might show the TLD with identifier `legacy` (id 1000) alongside the domain `Primary Initiative A` (id 1), which has status `active` and is privacy-protected. Another row could pair the TLD `new` (id 1001) with the domain `Composite Model` (id 2), which has status `expired` and is not privacy-protected.

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

The view `vw_top_level_domain_abuse_rate` joins `top_level_domains` with `abuse_rates` on `top_level_domain_id` to answer: "What is the current abuse rate for each TLD, and how was it measured?" A representative row shows the TLD `legacy` (id 1000) with an abuse rate of 23.20, measured on 2024-07-01 from a sample of 31 records with a confidence interval of 8.70, sourced from `pilot-data-38`. Another row pairs the TLD `new` (id 1001) with a rate of 27.40, measured on 2025-12-12 from 38 samples.

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

The view `vw_top_level_domain_security_protocol` joins `top_level_domains` with `security_protocols` on `top_level_domain_id` to answer: "What security protocols are deployed for each TLD?" A row might show the TLD `legacy` (id 1000) with the protocol `Baseline Initiative D` at version `seasonal-version-71`, status `deployed`, last verified on 2022-05-10. Another row pairs the TLD `new` (id 1001) with `Distributed Model` at version `regional-version-72`, status `pending`.

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

The view `vw_domain_name_top_level_domain` is the inverse of the first view, joining `domain_names` with `top_level_domains` to answer: "Which TLD does each domain belong to?" A row shows the domain `Primary Initiative A` (id 1) under the TLD with identifier `legacy` (id 1000), while another shows `Compact Cluster` (id 3) under the TLD `legacy` (id 1002).

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

The view `vw_abuse_type_domain_name_detail` joins `abuse_types` with `domain_names` through the `abuse_rates` fact table, answering: "Which abuse classifications are associated with domains under each TLD?" A row might pair the abuse type `Extended Survey` (code `c747f9a8-8fcc-11eb-924d-9cd76263cbd0`, severity 29, not mitigated) with the domain `Primary Initiative A` (id 1) under TLD 1000.

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

The view `vw_abuse_type_abuse_rate` joins `abuse_types` with `abuse_rates` on `abuse_rate_id` to answer: "What abuse classifications apply to each measurement?" A representative row shows the abuse type `Pilot Corridor A` (code `4447035`, severity 40, mitigated) linked to abuse-rate id 101 with a rate value of 27.40. Another row pairs `Baseline Series` (code `8189490`, severity 51, not mitigated) with abuse-rate id 102 at rate 31.60.

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

The view `vw_abuse_rate_top_level_domain` joins `abuse_rates` with `top_level_domains` on `top_level_domain_id` to answer: "Which TLD does each abuse-rate measurement belong to?" A row shows abuse-rate id 100 (rate 23.20, sample 31) under the TLD `legacy` (id 1000), while another shows abuse-rate id 103 (rate 35.80, sample 52) under the TLD `new` (id 1003).

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

The view `vw_abuse_rate_abuse_type_detail` joins `abuse_rates` with `abuse_types` on `abuse_rate_id` to answer: "What are the detailed abuse classifications for each measurement?" A row pairs abuse-rate id 100 (rate 23.20) with the abuse type `Extended Survey` (severity 29, not mitigated). Another row pairs abuse-rate id 103 (rate 35.80) with `Distributed Assessment` (severity 62, mitigated).

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

The view `vw_abuse_rate_zone_file` joins `abuse_rates` with `zone_files` on `zone_file_id` (or `abuse_rate_id`) to answer: "Which zone file was used to derive each abuse-rate measurement?" A row shows abuse-rate id 100 (rate 23.20) derived from zone file id 100 (file `68f46afd953b4de8824b596a1bff565c`, 50 records, incomplete, stored at `distributed-storage-48`). Another row pairs abuse-rate id 103 (rate 35.80) with zone file id 103 (file `lu_tax_code_template_m22`, 17 records, complete, stored at `extended-storage-51`).

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

The view `vw_zone_file_top_level_domain` joins `zone_files` with `top_level_domains` on `top_level_domain_id` to answer: "Which TLD does each zone file belong to?" A row shows zone file id 100 (file `68f46afd953b4de8824b596a1bff565c`, 50 records) under the TLD `legacy` (id 1000). Another row pairs zone file id 101 (file `state_et_5`, 17 records, complete) under the TLD `new` (id 1001).

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

The view `vw_zone_file_domain_name_detail` joins `zone_files` with `domain_names` through `top_level_domains` to answer: "Which domains are covered by each zone file?" A row might show zone file id 100 (50 records) alongside domain `Primary Initiative A` (id 1), both under TLD 1000. Another row pairs zone file id 102 (19 records) with domain `Compact Cluster` (id 3) under TLD 1002.

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

The view `vw_zone_file_abuse_rate` joins `zone_files` with `abuse_rates` on `abuse_rate_id` to answer: "Which abuse-rate measurement is associated with each zone file?" A row shows zone file id 100 (file `68f46afd953b4de8824b596a1bff565c`) linked to abuse-rate id 100 (rate 23.20, sample 31). Another row pairs zone file id 103 (file `lu_tax_code_template_m22`) with abuse-rate id 103 (rate 35.80, sample 52).

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

The view `vw_security_protocol_top_level_domain` joins `security_protocols` with `top_level_domains` on `top_level_domain_id` to answer: "Which security protocol is deployed for each TLD?" A row shows the protocol `Baseline Initiative D` (version `seasonal-version-71`, deployed) under the TLD `legacy` (id 1000). Another row pairs `Primary Review A` (version `compact-version-74`, deployed) under the TLD `new` (id 1003).

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

The view `vw_security_protocol_abuse_rate` joins `security_protocols` with `abuse_rates` on `abuse_rate_id` to answer: "Which security protocol corresponds to each abuse-rate measurement?" A row shows the protocol `Baseline Initiative D` (deployed) linked to abuse-rate id 100 (rate 23.20). Another row pairs `Adaptive Cluster` (not deployed) with abuse-rate id 102 (rate 31.60).

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

## Synthesis

The schema models the namespace governance domain as a star-like structure centred on `top_level_domains`, with `domain_names` as a many-to-one child, and `abuse_rates` as a fact table linked to both TLDs and `zone_files`. The `abuse_types` table classifies abuse measurements, while `security_protocols` records the security posture of each TLD. Four lookup tables (`domains_names`, `types_names`, `rates_types`, `files_names`) normalise categorical enumerations. The twelve materialised views reassemble these normalised pieces into domain-level facts, each answering a specific analytical question by joining the appropriate tables. The foreign keys — `top_level_domain_id` in `domain_names`, `abuse_rates`, `zone_files`, and `security_protocols`; `zone_file_id` in `abuse_rates`; `abuse_rate_id` in `top_level_domains`, `abuse_types`, `zone_files`, and `security_protocols`; and `abuse_rate_id` in `abuse_types` — form a tightly coupled graph that ensures referential integrity across the entire namespace governance model.