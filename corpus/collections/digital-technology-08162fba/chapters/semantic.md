The domain under examination is a privacy-data governance ecosystem in which digital technologies collect personal information about individuals, governed by privacy policies, with consent records documenting the legal basis for processing. The relational schema models this ecosystem as a set of normalized base tables linked by foreign keys and junction tables, and materializes analytical views that reconstruct domain facts across the normalized structure. The data contains fictional organizations, people, and products — for example, *Dana Nguyen* (individual identifier `IND-2716`) and *Guam International Airport* (individual identifier `IND-2737`) — and fictional platform names such as *Baseline Initiative D* and *Distributed Model*.

## Core entity tables

The schema centres on six principal entity tables. The `digital_technologies` table stores each technology platform as a row identified by a surrogate `id` (e.g. `1000`–`1003`) and a business key `platform_identifier` (e.g. `PLA-2037`). Each row carries a `platform_name` such as *Baseline Initiative D*, a `platform_type` drawn from the values `website`, `mobile_application`, `online_form`, and `producer_website`, an `effective_date` (e.g. `2023-02-14`), and a `privacy_policy_u_r_l` referencing a policy slug like `compact-privacy-74`.

**Table `digital_technologies`**

| id | platform_identifier | platform_name | platform_type | effective_date | privacy_policy_u_r_l |
|---|---|---|---|---|---|
| 1000 | PLA-2037 | Baseline Initiative D | website | 2023-02-14 | compact-privacy-74 |
| 1001 | PLA-2041 | Distributed Model | mobile_application | 2024-07-25 | composite-privacy-75 |
| 1002 | PLA-2045 | Adaptive Cluster | online_form | 2025-12-09 | primary-privacy-76 |
| 1003 | PLA-2049 | Primary Review A | producer_website | 2022-05-20 | adaptive-privacy-77 |

The `personal_informations` table records individual data-collection events. Each row has a surrogate `personal_information_id` (e.g. `1000`), an `information_type` (`contact`, `professional`, `identity`, `financial`), a `data_field` (`email_address`, `physical_address`, `telephone_number`, `occupational_history`), a `collection_method` (`direct_provision`, `social_media_interaction`, `mobile_application`, `survey`), a boolean `is_sensitive` flag, a `retention_period` code (e.g. `baseline-retentio-91`), and two foreign keys: `digital_technology_id` linking to `digital_technologies.id` and `individual_id` linking to `individuals.id`. A `created_at` timestamp (e.g. `2025-01-01 00:14:00`) anchors the row chronologically.

**Table `personal_informations`**

| personal_information_id | information_type | data_field | collection_method | is_sensitive | retention_period | digital_technology_id | individual_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | contact | email_address | direct_provision | false | baseline-retentio-91 | 1000 | 1 | 2025-01-01 00:14:00 |
| 1001 | professional | physical_address | social_media_interaction | true | pilot-retentio-92 | 1001 | 2 | 2025-02-06 03:14:00 |
| 1002 | identity | telephone_number | mobile_application | false | extended-retentio-93 | 1002 | 3 | 2025-03-11 06:14:00 |
| 1003 | financial | occupational_history | survey | true | integrated-retentio-94 | 1003 | 4 | 2025-04-16 09:14:00 |

The `individuals` table holds one row per person or organization. The surrogate `id` (1–4) maps to a natural `individual_i_d` (`IND-2716`, `IND-2723`, etc.), a `name` (e.g. *Dana Nguyen*, *Kimberly Myers*, *Guam International Airport*), a `date_of_birth`, a `nationality` code (e.g. `composite-national-39`), a `gender` code (e.g. `compact-gender-62`), an `account_type` (`individual` or `business_representative`), and a foreign key `privacy_policy_id` pointing to `privacy_policies.id`.

**Table `individuals`**

| id | individual_i_d | name | date_of_birth | nationality | gender | account_type | privacy_policy_id |
|---|---|---|---|---|---|---|---|
| 1 | IND-2716 | Dana Nguyen | 2025-04-02 | composite-national-39 | compact-gender-62 | individual | 1000 |
| 2 | IND-2723 | Kimberly Myers | 2022-09-13 | primary-national-40 | composite-gender-63 | business_representative | 1001 |
| 3 | IND-2730 | Kimberly Myers | 2023-02-24 | adaptive-national-41 | primary-gender-64 | individual | 1002 |
| 4 | IND-2737 | Guam International Airport | 2024-07-08 | distributed-national-42 | adaptive-gender-65 | business_representative | 1003 |

The `privacy_policies` table defines the legal framework. Each row has a surrogate `id` (1000–1003), a business key `policy_i_d` (e.g. `POL-2680`), a `policy_title` matching the technology name (e.g. *Baseline Initiative D*), an `effective_date`, an `issuing_entity` code (e.g. `pilot-issuing-14`), and a `jurisdiction` (`general` or `EEA`).

**Table `privacy_policies`**

| id | policy_i_d | policy_title | effective_date | issuing_entity | jurisdiction |
|---|---|---|---|---|---|
| 1000 | POL-2680 | Baseline Initiative D | 2023-02-14 | pilot-issuing-14 | general |
| 1001 | POL-2685 | Distributed Model | 2024-07-25 | extended-issuing-15 | EEA |
| 1002 | POL-2690 | Adaptive Cluster | 2025-12-09 | integrated-issuing-16 | general |
| 1003 | POL-2695 | Primary Review A | 2022-05-20 | seasonal-issuing-17 | EEA |

The `social_media_platforms` table captures third-party platforms that feed data into the ecosystem. Its surrogate key is `social_media_platform_id` (1–4), and it carries a `platform_name`, a `platform_u_r_l` (e.g. `integrated-platform-76`), a `data_collection_policy` code (e.g. `adaptive-data-77`), a boolean `is_external` flag, and a foreign key `digital_technology_id` linking back to `digital_technologies.id`.

**Table `social_media_platforms`**

| social_media_platform_id | platform_name | platform_u_r_l | data_collection_policy | is_external | digital_technology_id |
|---|---|---|---|---|---|
| 1 | Baseline Initiative D | integrated-platform-76 | adaptive-data-77 | true | 1000 |
| 2 | Distributed Model | seasonal-platform-77 | distributed-data-78 | false | 1001 |
| 3 | Adaptive Cluster | regional-platform-78 | baseline-data-79 | true | 1002 |
| 4 | Primary Review A | legacy-platform-79 | pilot-data-80 | false | 1003 |

The `consent_records` table documents the legal basis for processing. Each row has a surrogate `id` (1–4), a business key `consent_i_d` (e.g. `CON-2383`), a `consent_date` with time (e.g. `2023-10-03T09:15:00`), a `consent_method` (`implied_by_usage` or `explicit_click`), a boolean `is_withdrawable`, an optional `withdrawal_date` (e.g. `2024-07-20T18:18:00`), and two foreign keys: `individual_id` pointing to `individuals.id` and `privacy_policy_id` pointing to `privacy_policies.id`.

**Table `consent_records`**

| id | consent_i_d | consent_date | consent_method | is_withdrawable | withdrawal_date | individual_id | privacy_policy_id |
|---|---|---|---|---|---|---|---|
| 1 | CON-2383 | 2023-10-03T09:15:00 | implied_by_usage | false | 2024-07-20T18:18:00 | 1 | 1000 |
| 2 | CON-2386 | 2024-03-14T16:32:00 | explicit_click | true | 2025-12-04T01:35:00 | 2 | 1001 |
| 3 | CON-2389 | 2025-08-25T23:49:00 | implied_by_usage | false | 2022-05-15T08:52:00 | 3 | 1002 |
| 4 | CON-2392 | 2022-01-09T06:06:00 | explicit_click | true | 2023-10-26T15:09:00 | 4 | 1003 |

## Junction and auxiliary tables

Beyond the six core entities, the schema includes five junction tables that resolve many-to-many relationships and two auxiliary tables that store enriched metadata. The `technologies_informations` table stores supplementary attributes about digital technologies, while `individuals_informations` stores supplementary attributes about individuals. The `policies_technologies` junction table links `privacy_policies` to `digital_technologies`, the `policies_individuals` junction table links `privacy_policies` to `individuals`, and the `platforms_individuals` junction table links `social_media_platforms` to `individuals`. These junction tables ensure that a single privacy policy can govern multiple technologies and individuals, and that a single social media platform can be associated with multiple individuals, without violating first normal form.

**Table `technologies_informations`**

| digital_technology_id | personal_information_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

**Table `individuals_informations`**

| individual_id | personal_information_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `policies_technologies`**

| privacy_policy_id | digital_technology_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

**Table `policies_individuals`**

| privacy_policy_id | individual_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `platforms_individuals`**

| social_media_platform_id | individual_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

## Relational cardinality and foreign-key topology

The foreign-key topology forms a star-like graph anchored on `personal_informations`. Each row in `personal_informations` carries exactly one `digital_technology_id` and one `individual_id`, enforcing a many-to-one relationship from personal information to both the collecting technology and the affected individual. The `individuals` table itself carries a `privacy_policy_id` foreign key, meaning each individual is associated with exactly one privacy policy at the entity level. The `consent_records` table independently links individuals to privacy policies through its own pair of foreign keys (`individual_id`, `privacy_policy_id`), allowing consent to be tracked separately from the individual's default policy assignment. The `social_media_platforms` table links each platform to exactly one `digital_technology_id`, establishing a one-to-many relationship from digital technologies to social media platforms.

The cardinality constraints are bounded: a digital technology collects many personal information records, but each personal information record belongs to exactly one technology and one individual. An individual can have many personal information records and many consent records, but each consent record belongs to exactly one individual and one privacy policy. The junction tables (`policies_technologies`, `policies_individuals`, `platforms_individuals`) exist to support scenarios where the many-to-many relationship is not captured by a single foreign key on an entity table — for instance, when a privacy policy governs multiple technologies independently of the individual's assigned policy.

## Analytical views and their join semantics

The schema provides eleven materialized views that reconstruct domain facts by joining the normalized tables. Each view answers a specific analytical question by pulling together attributes from multiple entity tables.

The view `vw_personal_information_digital_technology` joins `personal_informations` to `digital_technologies` on `personal_information_id` → `digital_technology_id`, answering the question: *which digital technology collected which personal information?* Reading row `1000` from `personal_informations` (information type `contact`, data field `email_address`, collected via `direct_provision`) alongside `digital_technologies.id = 1000` (platform name *Baseline Initiative D*, type `website`) reveals that Dana Nguyen's email was collected directly through the Baseline Initiative D website.

**View `vw_personal_information_digital_technology`**

```sql
CREATE VIEW vw_personal_information_digital_technology AS
SELECT a.personal_information_id, a.information_type, a.data_field, a.collection_method, b.id AS technology_id, b.platform_identifier AS technology_platform_identifier, b.platform_name AS technology_platform_name
FROM personal_informations a JOIN digital_technologies b ON a.digital_technology_id = b.id;
```

| personal_information_id | information_type | data_field | collection_method | technology_id | technology_platform_identifier | technology_platform_name |
|---|---|---|---|---|---|---|
| 1000 | contact | email_address | direct_provision | 1000 | PLA-2037 | Baseline Initiative D |
| 1001 | professional | physical_address | social_media_interaction | 1001 | PLA-2041 | Distributed Model |
| 1002 | identity | telephone_number | mobile_application | 1002 | PLA-2045 | Adaptive Cluster |
| 1003 | financial | occupational_history | survey | 1003 | PLA-2049 | Primary Review A |

The view `vw_personal_information_individual` joins `personal_informations` to `individuals`, answering: *which individual does a given personal information record belong to?* Row `1001` in `personal_informations` (information type `professional`, data field `physical_address`, `is_sensitive = true`, collected via `social_media_interaction`) links to `individuals.id = 2` (Kimberly Myers, account type `business_representative`), showing that Kimberly's physical address was collected through social media interaction and flagged as sensitive.

**View `vw_personal_information_individual`**

```sql
CREATE VIEW vw_personal_information_individual AS
SELECT a.personal_information_id, a.information_type, a.data_field, a.collection_method, b.id AS individual_id, b.individual_i_d AS individual_individual_i_d, b.name AS individual_name
FROM personal_informations a JOIN individuals b ON a.individual_id = b.id;
```

| personal_information_id | information_type | data_field | collection_method | individual_id | individual_individual_i_d | individual_name |
|---|---|---|---|---|---|---|
| 1000 | contact | email_address | direct_provision | 1 | IND-2716 | Dana Nguyen |
| 1001 | professional | physical_address | social_media_interaction | 2 | IND-2723 | Kimberly Myers |
| 1002 | identity | telephone_number | mobile_application | 3 | IND-2730 | Kimberly Myers |
| 1003 | financial | occupational_history | survey | 4 | IND-2737 | Guam International Airport |

The view `vw_individual_personal_information_detail` joins `individuals` to `personal_informations`, inverting the perspective to answer: *what personal information does a given individual have?* Row `1` in `individuals` (Dana Nguyen, DOB `2025-04-02`, nationality `composite-national-39`, gender `compact-gender-62`) joins to `personal_information_id = 1000` (contact, email_address, direct_provision, non-sensitive, retention `baseline-retentio-91`), giving a complete picture of Dana's single recorded data point.

**View `vw_individual_personal_information_detail`**

```sql
CREATE VIEW vw_individual_personal_information_detail AS
SELECT a.id, a.individual_i_d, a.name, b.personal_information_id AS information_personal_information_id, b.information_type AS information_information_type, b.data_field AS information_data_field
FROM individuals a
  JOIN individuals_informations j ON j.individual_id = a.id
  JOIN personal_informations b ON b.personal_information_id = j.personal_information_id;
```

| id | individual_i_d | name | information_personal_information_id | information_information_type | information_data_field |
|---|---|---|---|---|---|
| 1 | IND-2716 | Dana Nguyen | 1000 | contact | email_address |
| 1 | IND-2716 | Dana Nguyen | 1001 | professional | physical_address |
| 2 | IND-2723 | Kimberly Myers | 1001 | professional | physical_address |
| 2 | IND-2723 | Kimberly Myers | 1002 | identity | telephone_number |
| 3 | IND-2730 | Kimberly Myers | 1002 | identity | telephone_number |
| 3 | IND-2730 | Kimberly Myers | 1003 | financial | occupational_history |
| 4 | IND-2737 | Guam International Airport | 1003 | financial | occupational_history |
| 4 | IND-2737 | Guam International Airport | 1000 | contact | email_address |

The view `vw_digital_technology_personal_information_detail` joins `digital_technologies` to `personal_informations`, answering: *what personal information has a given digital technology collected?* Technology `1000` (Baseline Initiative D, website, effective `2023-02-14`, URL `compact-privacy-74`) joins to personal information `1000` (contact, email_address, direct_provision), showing the technology's data-collection footprint.

**View `vw_digital_technology_personal_information_detail`**

```sql
CREATE VIEW vw_digital_technology_personal_information_detail AS
SELECT a.id, a.platform_identifier, a.platform_name, b.personal_information_id AS information_personal_information_id, b.information_type AS information_information_type, b.data_field AS information_data_field
FROM digital_technologies a
  JOIN technologies_informations j ON j.digital_technology_id = a.id
  JOIN personal_informations b ON b.personal_information_id = j.personal_information_id;
```

| id | platform_identifier | platform_name | information_personal_information_id | information_information_type | information_data_field |
|---|---|---|---|---|---|
| 1000 | PLA-2037 | Baseline Initiative D | 1000 | contact | email_address |
| 1000 | PLA-2037 | Baseline Initiative D | 1001 | professional | physical_address |
| 1001 | PLA-2041 | Distributed Model | 1001 | professional | physical_address |
| 1001 | PLA-2041 | Distributed Model | 1002 | identity | telephone_number |
| 1002 | PLA-2045 | Adaptive Cluster | 1002 | identity | telephone_number |
| 1002 | PLA-2045 | Adaptive Cluster | 1003 | financial | occupational_history |
| 1003 | PLA-2049 | Primary Review A | 1003 | financial | occupational_history |
| 1003 | PLA-2049 | Primary Review A | 1000 | contact | email_address |

The view `vw_individual_privacy_policy` joins `individuals` to `privacy_policies`, answering: *which privacy policy governs a given individual?* Individual `1` (Dana Nguyen, individual `IND-2716`, account type `individual`) links to privacy policy `1000` (policy ID `POL-2680`, title *Baseline Initiative D*, issuing entity `pilot-issuing-14`, jurisdiction `general`), establishing the legal framework for Dana's data.

**View `vw_individual_privacy_policy`**

```sql
CREATE VIEW vw_individual_privacy_policy AS
SELECT a.id, a.individual_i_d, a.name, a.date_of_birth, b.id AS policy_id, b.policy_i_d AS policy_policy_i_d, b.policy_title AS policy_policy_title
FROM individuals a JOIN privacy_policies b ON a.privacy_policy_id = b.id;
```

| id | individual_i_d | name | date_of_birth | policy_id | policy_policy_i_d | policy_policy_title |
|---|---|---|---|---|---|---|
| 1 | IND-2716 | Dana Nguyen | 2025-04-02 | 1000 | POL-2680 | Baseline Initiative D |
| 2 | IND-2723 | Kimberly Myers | 2022-09-13 | 1001 | POL-2685 | Distributed Model |
| 3 | IND-2730 | Kimberly Myers | 2023-02-24 | 1002 | POL-2690 | Adaptive Cluster |
| 4 | IND-2737 | Guam International Airport | 2024-07-08 | 1003 | POL-2695 | Primary Review A |

The view `vw_privacy_policy_individual_detail` joins `privacy_policies` to `individuals`, inverting the perspective: *which individuals are governed by a given privacy policy?* Policy `1000` (Baseline Initiative D, effective `2023-02-14`, issuing entity `pilot-issuing-14`, jurisdiction `general`) joins to individual `1` (Dana Nguyen, DOB `2025-04-02`, nationality `composite-national-39`, gender `compact-gender-62`, account type `individual`), showing the policy's scope of application.

**View `vw_privacy_policy_individual_detail`**

```sql
CREATE VIEW vw_privacy_policy_individual_detail AS
SELECT a.id, a.policy_i_d, a.policy_title, b.id AS individual_id, b.individual_i_d AS individual_individual_i_d, b.name AS individual_name
FROM privacy_policies a
  JOIN policies_individuals j ON j.privacy_policy_id = a.id
  JOIN individuals b ON b.id = j.individual_id;
```

| id | policy_i_d | policy_title | individual_id | individual_individual_i_d | individual_name |
|---|---|---|---|---|---|
| 1000 | POL-2680 | Baseline Initiative D | 1 | IND-2716 | Dana Nguyen |
| 1000 | POL-2680 | Baseline Initiative D | 2 | IND-2723 | Kimberly Myers |
| 1001 | POL-2685 | Distributed Model | 2 | IND-2723 | Kimberly Myers |
| 1001 | POL-2685 | Distributed Model | 3 | IND-2730 | Kimberly Myers |
| 1002 | POL-2690 | Adaptive Cluster | 3 | IND-2730 | Kimberly Myers |
| 1002 | POL-2690 | Adaptive Cluster | 4 | IND-2737 | Guam International Airport |
| 1003 | POL-2695 | Primary Review A | 4 | IND-2737 | Guam International Airport |
| 1003 | POL-2695 | Primary Review A | 1 | IND-2716 | Dana Nguyen |

The view `vw_privacy_policy_digital_technology_detail` joins `privacy_policies` to `digital_technologies`, answering: *which digital technologies are associated with a given privacy policy?* Policy `1000` (Baseline Initiative D, issuing entity `pilot-issuing-14`, jurisdiction `general`) joins to technology `1000` (platform name *Baseline Initiative D*, type `website`, effective `2023-02-14`, URL `compact-privacy-74`), revealing the technology-policy pairing.

**View `vw_privacy_policy_digital_technology_detail`**

```sql
CREATE VIEW vw_privacy_policy_digital_technology_detail AS
SELECT a.id, a.policy_i_d, a.policy_title, b.id AS technology_id, b.platform_identifier AS technology_platform_identifier, b.platform_name AS technology_platform_name
FROM privacy_policies a
  JOIN policies_technologies j ON j.privacy_policy_id = a.id
  JOIN digital_technologies b ON b.id = j.digital_technology_id;
```

| id | policy_i_d | policy_title | technology_id | technology_platform_identifier | technology_platform_name |
|---|---|---|---|---|---|
| 1000 | POL-2680 | Baseline Initiative D | 1000 | PLA-2037 | Baseline Initiative D |
| 1000 | POL-2680 | Baseline Initiative D | 1001 | PLA-2041 | Distributed Model |
| 1001 | POL-2685 | Distributed Model | 1001 | PLA-2041 | Distributed Model |
| 1001 | POL-2685 | Distributed Model | 1002 | PLA-2045 | Adaptive Cluster |
| 1002 | POL-2690 | Adaptive Cluster | 1002 | PLA-2045 | Adaptive Cluster |
| 1002 | POL-2690 | Adaptive Cluster | 1003 | PLA-2049 | Primary Review A |
| 1003 | POL-2695 | Primary Review A | 1003 | PLA-2049 | Primary Review A |
| 1003 | POL-2695 | Primary Review A | 1000 | PLA-2037 | Baseline Initiative D |

The view `vw_social_media_platform_individual_detail` joins `social_media_platforms` to `individuals`, answering: *which individuals are associated with a given social media platform?* Platform `1` (name *Baseline Initiative D*, URL `integrated-platform-76`, data collection policy `adaptive-data-77`, `is_external = true`) joins to individual `1` (Dana Nguyen, DOB `2025-04-02`, nationality `composite-national-39`, gender `compact-gender-62`, account type `individual`), showing the platform-individual linkage.

**View `vw_social_media_platform_individual_detail`**

```sql
CREATE VIEW vw_social_media_platform_individual_detail AS
SELECT a.social_media_platform_id, a.platform_name, a.platform_u_r_l, b.id AS individual_id, b.individual_i_d AS individual_individual_i_d, b.name AS individual_name
FROM social_media_platforms a
  JOIN platforms_individuals j ON j.social_media_platform_id = a.social_media_platform_id
  JOIN individuals b ON b.id = j.individual_id;
```

| social_media_platform_id | platform_name | platform_u_r_l | individual_id | individual_individual_i_d | individual_name |
|---|---|---|---|---|---|
| 1 | Baseline Initiative D | integrated-platform-76 | 1 | IND-2716 | Dana Nguyen |
| 1 | Baseline Initiative D | integrated-platform-76 | 2 | IND-2723 | Kimberly Myers |
| 2 | Distributed Model | seasonal-platform-77 | 2 | IND-2723 | Kimberly Myers |
| 2 | Distributed Model | seasonal-platform-77 | 3 | IND-2730 | Kimberly Myers |
| 3 | Adaptive Cluster | regional-platform-78 | 3 | IND-2730 | Kimberly Myers |
| 3 | Adaptive Cluster | regional-platform-78 | 4 | IND-2737 | Guam International Airport |
| 4 | Primary Review A | legacy-platform-79 | 4 | IND-2737 | Guam International Airport |
| 4 | Primary Review A | legacy-platform-79 | 1 | IND-2716 | Dana Nguyen |

The view `vw_social_media_platform_digital_technology` joins `social_media_platforms` to `digital_technologies`, answering: *which social media platform is associated with a given digital technology?* Platform `1` (name *Baseline Initiative D*, URL `integrated-platform-76`, data collection policy `adaptive-data-77`, `is_external = true`) joins to technology `1000` (platform name *Baseline Initiative D*, type `website`, effective `2023-02-14`, URL `compact-privacy-74`), confirming the platform-technology relationship.

**View `vw_social_media_platform_digital_technology`**

```sql
CREATE VIEW vw_social_media_platform_digital_technology AS
SELECT a.social_media_platform_id, a.platform_name, a.platform_u_r_l, a.data_collection_policy, b.id AS technology_id, b.platform_identifier AS technology_platform_identifier, b.platform_name AS technology_platform_name
FROM social_media_platforms a JOIN digital_technologies b ON a.digital_technology_id = b.id;
```

| social_media_platform_id | platform_name | platform_u_r_l | data_collection_policy | technology_id | technology_platform_identifier | technology_platform_name |
|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | integrated-platform-76 | adaptive-data-77 | 1000 | PLA-2037 | Baseline Initiative D |
| 2 | Distributed Model | seasonal-platform-77 | distributed-data-78 | 1001 | PLA-2041 | Distributed Model |
| 3 | Adaptive Cluster | regional-platform-78 | baseline-data-79 | 1002 | PLA-2045 | Adaptive Cluster |
| 4 | Primary Review A | legacy-platform-79 | pilot-data-80 | 1003 | PLA-2049 | Primary Review A |

The view `vw_consent_record_individual` joins `consent_records` to `individuals`, answering: *which individual gave a given consent record?* Consent `1` (consent ID `CON-2383`, date `2023-10-03T09:15:00`, method `implied_by_usage`, `is_withdrawable = false`, withdrawal date `2024-07-20T18:18:00`) links to individual `1` (Dana Nguyen, DOB `2025-04-02`, nationality `composite-national-39`, gender `compact-gender-62`, account type `individual`), showing that Dana's consent was implied by usage and later withdrawn.

**View `vw_consent_record_individual`**

```sql
CREATE VIEW vw_consent_record_individual AS
SELECT a.id, a.consent_i_d, a.consent_date, a.consent_method, b.id AS individual_id, b.individual_i_d AS individual_individual_i_d, b.name AS individual_name
FROM consent_records a JOIN individuals b ON a.individual_id = b.id;
```

| id | consent_i_d | consent_date | consent_method | individual_id | individual_individual_i_d | individual_name |
|---|---|---|---|---|---|---|
| 1 | CON-2383 | 2023-10-03T09:15:00 | implied_by_usage | 1 | IND-2716 | Dana Nguyen |
| 2 | CON-2386 | 2024-03-14T16:32:00 | explicit_click | 2 | IND-2723 | Kimberly Myers |
| 3 | CON-2389 | 2025-08-25T23:49:00 | implied_by_usage | 3 | IND-2730 | Kimberly Myers |
| 4 | CON-2392 | 2022-01-09T06:06:00 | explicit_click | 4 | IND-2737 | Guam International Airport |

The view `vw_consent_record_privacy_policy` joins `consent_records` to `privacy_policies`, answering: *which privacy policy was consented to in a given record?* Consent `1` (consent ID `CON-2383`, date `2023-10-03T09:15:00`, method `implied_by_usage`, `is_withdrawable = false`, withdrawal date `2024-07-20T18:18:00`) links to privacy policy `1000` (policy ID `POL-2680`, title *Baseline Initiative D*, issuing entity `pilot-issuing-14`, jurisdiction `general`), establishing the legal basis for the consent.

**View `vw_consent_record_privacy_policy`**

```sql
CREATE VIEW vw_consent_record_privacy_policy AS
SELECT a.id, a.consent_i_d, a.consent_date, a.consent_method, b.id AS policy_id, b.policy_i_d AS policy_policy_i_d, b.policy_title AS policy_policy_title
FROM consent_records a JOIN privacy_policies b ON a.privacy_policy_id = b.id;
```

| id | consent_i_d | consent_date | consent_method | policy_id | policy_policy_i_d | policy_policy_title |
|---|---|---|---|---|---|---|
| 1 | CON-2383 | 2023-10-03T09:15:00 | implied_by_usage | 1000 | POL-2680 | Baseline Initiative D |
| 2 | CON-2386 | 2024-03-14T16:32:00 | explicit_click | 1001 | POL-2685 | Distributed Model |
| 3 | CON-2389 | 2025-08-25T23:49:00 | implied_by_usage | 1002 | POL-2690 | Adaptive Cluster |
| 4 | CON-2392 | 2022-01-09T06:06:00 | explicit_click | 1003 | POL-2695 | Primary Review A |

## Synthesis

The relational schema models the privacy-data governance domain as a set of six core entity tables connected by foreign keys that enforce bounded cardinality: each personal information record belongs to exactly one technology and one individual; each individual is governed by exactly one privacy policy at the entity level; each consent record links one individual to one policy; and each social media platform belongs to one digital technology. Five junction tables (`technologies_informations`, `individuals_informations`, `policies_technologies`, `policies_individuals`, `platforms_individuals`) support many-to-many relationships that cannot be captured by a single foreign key. The eleven analytical views reconstruct domain facts by joining these normalized tables, each view answering a specific question — from "which technology collected which data?" to "which individuals are governed by which policy?" — and each view's result can be verified against concrete rows such as Dana Nguyen's email address collected via the Baseline Initiative D website under the general-jurisdiction policy POL-2680.