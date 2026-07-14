## Domain Modelling and Relational Materialisation

The housing advisory services domain captures the operational lifecycle of housing-related casework, the personnel who manage it, the training that qualifies them, and the institutional frameworks that fund and govern their work. At its core, a `hous_housing_advisory_case` represents a discrete matter—such as a homelessness application, possession proceedings, rent arrears, or mortgage arrears—assigned to a housing specialist and a housing client, optionally linked to a training module and a non-housing advisory service (NHA). The relational schema materialises this domain through a set of normalised base tables, junction tables for many-to-many associations, and a family of views that reassemble the normalised facts into domain-meaningful projections. Every table and view name is quoted in backticks throughout this chapter.

**Table `hous_housing_advisory_cases`**

| id | case_id | case_type | status | priority_level | referral_source | date_opened | date_closed | housing_specialist_id | housing_client_id | module_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 39800622 | homelessness_application | open | standard | LCA | 2025-08-21T19:57:00 | 2023-06-23T17:27:00 | 1000 | 1 | 13061773 |
| 1001 | 4891 | possession_proceedings | under_review | urgent | voluntary_agency | 2022-01-05T02:14:00 | 2024-11-07T00:44:00 | 1001 | 2 | template_ivacode_pagata_0 |
| 1002 | 17374813 | rent_arrears | advice_provided | critical | local_authority | 2023-06-16T09:31:00 | 2025-04-18T07:01:00 | 1002 | 3 | 3744024 |
| 1003 | state_uk_9 | mortgage_arrears | casework_active | standard | LCA | 2024-11-27T16:48:00 | 2022-09-02T14:18:00 | 1003 | 4 | 727063 |

The `hous_housing_advisory_cases` table is the central fact table of the schema. Each row is identified by a surrogate `id` (e.g. `1000`, `1001`, `1002`, `1003`) and carries a human-readable `case_id` such as `39800622` or `4891`. The `case_type` column distinguishes matters like `homelessness_application`, `possession_proceedings`, `rent_arrears`, and `mortgage_arrears`. A `status` column records the lifecycle stage—`open`, `under_review`, `advice_provided`, or `casework_active`—while `priority_level` constrains cases to `standard`, `urgent`, or `critical`. The `referral_source` column captures where the case originated, with values such as `LCA`, `voluntary_agency`, and `local_authority`. Temporal boundaries are recorded in `date_opened` and `date_closed`, which are ISO-8601 timestamps; for instance, case `1000` opened at `2025-08-21T19:57:00` and closed at `2023-06-23T17:27:00`. The case is linked to its responsible specialist via `housing_specialist_id` (foreign key to `hous_housing_specialists.id`), to its client via `housing_client_id` (foreign key to `hous_housing_clients.housing_client_id`), and to a training module via `module_id` (foreign key to `hous_training_modules.module_id`).

**Table `hous_housing_specialists`**

| id | specialist_id | full_name | specialization | employment_status | certification_level | contact_email | contact_phone | module_id | n_h_a_s_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 4985161 | Theodore Mcgrath | homelessness_prevention | employed | junior | Christopher Wilson | Joe Tsai | 13061773 | 1 |
| 1001 | id_23 | Account Name | housing_debt | contracted | senior | Charles Larsen | Stephanie Collins | template_ivacode_pagata_0 | 2 |
| 1002 | 4793489 | Saipan International Airport | possession_defence | volunteer | lead | Mary Alvarez | Tasha Rodriguez | 3744024 | 3 |
| 1003 | 9568467 | Norma Fisher | welfare_benefits | employed | junior | April Snyder | Walter Pratt | 727063 | 4 |

The `hous_housing_specialists` table stores the personnel who manage advisory cases. Each specialist has a surrogate `id` (e.g. `1000` through `1003`), a `specialist_id` such as `4985161` or `id_23`, and a `full_name` like `Theodore Mcgrath` or `Account Name`. The `specialization` column captures their area of expertise—`homelessness_prevention`, `housing_debt`, `possession_defence`, or `welfare_benefits`—while `employment_status` constrains them to `employed`, `contracted`, or `volunteer`. A `certification_level` of `junior`, `senior`, or `lead` indicates seniority. Contact details are stored in `contact_email` and `contact_phone`; for example, specialist `1000` lists `Christopher Wilson` and `Joe Tsai`. The specialist is linked to a training module through `module_id` and to an NHA service through `n_h_a_s_id`.

**Table `hous_housing_clients`**

| housing_client_id | client_id | household_size | current_housing_status | primary_need | date_of_referral | has_dependents | housing_advisory_case_id |
|---|---|---|---|---|---|---|---|
| 1 | Erin Olson | 11 | homeless | rent_arrears | 2024-11-03T10:18:00 | false | 1000 |
| 2 | Jorge Sullivan | 22 | at_risk | mortgage_arrears | 2025-04-14T17:35:00 | true | 1001 |
| 3 | Kimberly Maynard | 33 | tenanted | possession | 2022-09-25T00:52:00 | false | 1002 |
| 4 | Michelle Kelley | 44 | owner_occupier | disrepair | 2023-02-09T07:09:00 | true | 1003 |

The `hous_housing_clients` table holds the individuals or households receiving advisory support. Each row is keyed by `housing_client_id` (a natural key: `1`, `2`, `3`, `4`), with a `client_id` such as `Erin Olson` or `Jorge Sullivan`. The `household_size` column records the number of household members (e.g. `11`, `22`, `33`, `44`), while `current_housing_status` constrains the client to `homeless`, `at_risk`, `tenanted`, or `owner_occupier`. The `primary_need` column captures the client's main issue—`rent_arrears`, `mortgage_arrears`, `possession`, or `disrepair`—and `date_of_referral` records when the referral was made. A boolean `has_dependents` flag indicates dependant status. The `housing_advisory_case_id` column is a foreign key back to `hous_housing_advisory_cases.id`, establishing the client-to-case relationship.

**Table `hous_training_modules`**

| module_id | title | delivery_mode | level | duration_hours | is_free | last_updated | housing_specialist_id | topic_id |
|---|---|---|---|---|---|---|---|---|
| 13061773 | Compact Initiative | face_to_face | introductory | 3.70 | true | 2023-06-17 | 1000 | lu_tax_code_template_b_VB-IC-Tab |
| template_ivacode_pagata_0 | Legacy Model | webinar | refresher | 7.40 | false | 2024-11-01 | 1001 | 8387534 |
| 3744024 | Regional Cluster A | briefing | advanced | 11.10 | true | 2025-04-12 | 1002 | 2933463 |
| 727063 | Seasonal Review | bitesize_online | introductory | 14.80 | false | 2022-09-23 | 1003 | 2839516 |

The `hous_training_modules` table describes the training products available to specialists and advisers. Each module has a `module_id` (e.g. `13061773`, `template_ivacode_pagata_0`, `3744024`, `727063`), a `title` such as `Compact Initiative` or `Legacy Model`, and a `delivery_mode` of `face_to_face`, `webinar`, `briefing`, or `bitesize_online`. The `level` column constrains modules to `introductory`, `refresher`, or `advanced`, while `duration_hours` records the length (e.g. `3.70`, `7.40`, `11.10`, `14.80`). A boolean `is_free` flag and a `last_updated` timestamp complete the product record. The module is linked to a specialist via `housing_specialist_id` and to a legal topic via `topic_id`.

**Table `hous_housing_advisers`**

| id | adviser_id | full_name | employer_type | years_experience | last_training_date | contact_email | module_id | housing_advisory_case_id | n_h_a_s_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2618554 | Theodore Mcgrath | LCA | 16 | 2022-01-16 | Christopher Wilson | 13061773 | 1000 | 1 |
| 2 | 4332 | Account Name | voluntary_agency | 22 | 2023-06-27 | Charles Larsen | template_ivacode_pagata_0 | 1001 | 2 |
| 3 | PHR-93 | Saipan International Airport | local_authority | 28 | 2024-11-11 | Mary Alvarez | 3744024 | 1002 | 3 |
| 4 | 1250212 | Norma Fisher | LCA | 34 | 2025-04-22 | April Snyder | 727063 | 1003 | 4 |

The `hous_housing_advisers` table stores advisers who may also manage cases. Each adviser has a surrogate `id` (`1` through `4`), an `adviser_id` such as `2618554` or `4332`, and a `full_name` matching the specialist names (e.g. `Theodore Mcgrath`, `Account Name`). The `employer_type` column constrains advisers to `LCA`, `voluntary_agency`, or `local_authority`. `years_experience` records tenure (e.g. `16`, `22`, `28`, `34`), and `last_training_date` captures the most recent training completion. Contact details are in `contact_email`. The adviser is linked to a training module via `module_id`, to a case via `housing_advisory_case_id`, and to an NHA service via `n_h_a_s_id`.

**Table `hous_n_h_a_ses`**

| id | service_id | funding_source | operating_hours | is_free | established_year | module_id |
|---|---|---|---|---|---|---|
| 1 | 1996925 | baseline-funding-73 | pilot-operatin-50 | true | 10 | 13061773 |
| 2 | 3990164 | pilot-funding-74 | extended-operatin-51 | false | 16 | template_ivacode_pagata_0 |
| 3 | 5844258 | extended-funding-75 | integrated-operatin-52 | true | 22 | 3744024 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | integrated-funding-76 | seasonal-operatin-53 | false | 28 | 727063 |

The `hous_n_h_a_ses` table represents non-housing advisory services that operate alongside housing advisory work. Each NHA has a surrogate `id` (`1` through `4`), a `service_id` such as `1996925` or `e29bafe2-8fd1-11eb-924d-9cd76263cbd0`, a `funding_source` like `baseline-funding-73`, and `operating_hours` such as `pilot-operatin-50`. A boolean `is_free` flag and an integer `established_year` (e.g. `10`, `16`, `22`, `28`) describe the service, while `module_id` links it to a training module.

**Table `hous_legal_topics`**

| topic_id | topic_name | category | last_reviewed | is_current | module_id | housing_advisory_case_id |
|---|---|---|---|---|---|---|
| lu_tax_code_template_b_VB-IC-Tab | Regional Model | homelessness_law | 2022-05-27 | true | 13061773 | 1000 |
| 8387534 | Seasonal Cluster D | housing_debt | 2023-10-11 | false | template_ivacode_pagata_0 | 1001 |
| 2933463 | Integrated Review | possession_proceedings | 2024-03-22 | true | 3744024 | 1002 |
| 2839516 | Extended Initiative | tenant_rights | 2025-08-06 | false | 727063 | 1003 |

The `hous_legal_topics` table is a reference table of legal subject areas. Each topic has a `topic_id` (e.g. `lu_tax_code_template_b_VB-IC-Tab`, `8387534`, `2933463`, `2839516`) and a `topic_name` such as `Tax Code Template` or `Legacy Model`. This table is referenced by `hous_training_modules.topic_id`.

The domain contains several many-to-many relationships that require junction tables. The association between specialists and advisory cases is materialised in:

**Table `hous_housing_specialistsHousingAdvisoryCase`**

| housing_specialist_id | housing_advisory_case_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

The `hous_housing_specialistsHousingAdvisoryCase` junction table links `hous_housing_specialists` to `hous_housing_advisory_cases`. Each row contains a `specialist_id` foreign key and a `housing_advisory_case_id` foreign key, allowing a specialist to be associated with multiple cases and a case to be handled by multiple specialists.

The association between advisers and training modules is materialised in:

**Table `hous_training_modulesHousingAdviser`**

| module_id | housing_adviser_id |
|---|---|
| 13061773 | 1 |
| 13061773 | 2 |
| template_ivacode_pagata_0 | 2 |
| template_ivacode_pagata_0 | 3 |
| 3744024 | 3 |
| 3744024 | 4 |
| 727063 | 4 |
| 727063 | 1 |

The `hous_training_modulesHousingAdviser` junction table links `hous_training_modules` to `hous_housing_advisers`. Each row contains a `module_id` foreign key and an `adviser_id` foreign key, enabling advisers to complete multiple modules and modules to be taken by multiple advisers.

The association between NHA services and specialists is materialised in:

**Table `hous_n_h_a_sesHousingSpecialist`**

| n_h_a_s_id | housing_specialist_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `hous_n_h_a_sesHousingSpecialist` junction table links `hous_n_h_a_ses` to `hous_housing_specialists`. Each row contains an `n_h_a_s_id` foreign key and a `specialist_id` foreign key, allowing an NHA service to be associated with multiple specialists and a specialist to work across multiple NHA services.

The association between NHA services and advisers is materialised in:

**Table `hous_n_h_a_sesHousingAdviser`**

| n_h_a_s_id | housing_adviser_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `hous_n_h_a_sesHousingAdviser` junction table links `hous_n_h_a_ses` to `hous_housing_advisers`. Each row contains an `n_h_a_s_id` foreign key and an `adviser_id` foreign key, enabling advisers to be associated with multiple NHA services and services to be staffed by multiple advisers.

The views in the schema reassemble these normalised tables into domain-meaningful projections. Each view answers a specific analytical question by joining the relevant base and junction tables.

**View `v_housing_advisory_case_housing_specialist`**

```sql
CREATE VIEW v_housing_advisory_case_housing_specialist AS
SELECT a.id, a.case_id, a.case_type, a.status, b.id AS specialist_id, b.specialist_id AS specialist_specialist_id, b.full_name AS specialist_full_name
FROM hous_housing_advisory_cases a JOIN hous_housing_specialists b ON a.housing_specialist_id = b.id;
```

| id | case_id | case_type | status | specialist_id | specialist_specialist_id | specialist_full_name |
|---|---|---|---|---|---|---|
| 1000 | 39800622 | homelessness_application | open | 1000 | 4985161 | Theodore Mcgrath |
| 1001 | 4891 | possession_proceedings | under_review | 1001 | id_23 | Account Name |
| 1002 | 17374813 | rent_arrears | advice_provided | 1002 | 4793489 | Saipan International Airport |
| 1003 | state_uk_9 | mortgage_arrears | casework_active | 1003 | 9568467 | Norma Fisher |

The view `v_housing_advisory_case_housing_specialist` joins `hous_housing_advisory_cases` to `hous_housing_specialists` on the specialist foreign key, producing a flat record that pairs each case with its assigned specialist. For case `1000` (a `homelessness_application` with `case_id` `39800622`), the view returns the specialist `Theodore Mcgrath` (specialist `1000`, specialising in `homelessness_prevention`). This view answers the question: "Which specialist is responsible for each advisory case?"

**View `v_housing_advisory_case_housing_client`**

```sql
CREATE VIEW v_housing_advisory_case_housing_client AS
SELECT a.id, a.case_id, a.case_type, a.status, b.housing_client_id AS client_housing_client_id, b.client_id AS client_client_id, b.household_size AS client_household_size
FROM hous_housing_advisory_cases a JOIN hous_housing_clients b ON a.housing_client_id = b.housing_client_id;
```

| id | case_id | case_type | status | client_housing_client_id | client_client_id | client_household_size |
|---|---|---|---|---|---|---|
| 1000 | 39800622 | homelessness_application | open | 1 | Erin Olson | 11 |
| 1001 | 4891 | possession_proceedings | under_review | 2 | Jorge Sullivan | 22 |
| 1002 | 17374813 | rent_arrears | advice_provided | 3 | Kimberly Maynard | 33 |
| 1003 | state_uk_9 | mortgage_arrears | casework_active | 4 | Michelle Kelley | 44 |

The view `v_housing_advisory_case_housing_client` joins `hous_housing_advisory_cases` to `hous_housing_clients` on the client foreign key, producing a flat record that pairs each case with its client. For case `1000`, the view returns client `Erin Olson` (housing_client_id `1`), who has a household size of `11`, is `homeless`, and has a primary need of `rent_arrears`. This view answers: "Which client is associated with each advisory case?"

**View `v_housing_advisory_case_training_module`**

```sql
CREATE VIEW v_housing_advisory_case_training_module AS
SELECT a.id, a.case_id, a.case_type, a.status, b.module_id AS module_module_id, b.title AS module_title, b.delivery_mode AS module_delivery_mode
FROM hous_housing_advisory_cases a JOIN hous_training_modules b ON a.module_id = b.module_id;
```

| id | case_id | case_type | status | module_module_id | module_title | module_delivery_mode |
|---|---|---|---|---|---|---|
| 1000 | 39800622 | homelessness_application | open | 13061773 | Compact Initiative | face_to_face |
| 1001 | 4891 | possession_proceedings | under_review | template_ivacode_pagata_0 | Legacy Model | webinar |
| 1002 | 17374813 | rent_arrears | advice_provided | 3744024 | Regional Cluster A | briefing |
| 1003 | state_uk_9 | mortgage_arrears | casework_active | 727063 | Seasonal Review | bitesize_online |

The view `v_housing_advisory_case_training_module` joins `hous_housing_advisory_cases` to `hous_training_modules` on the module foreign key, producing a flat record that pairs each case with its training module. For case `1000`, the view returns module `13061773` titled `Compact Initiative`, delivered `face_to_face` at the `introductory` level for `3.70` hours. This view answers: "Which training module is linked to each advisory case?"

**View `v_housing_specialist_housing_advisory_case_detail`**

```sql
CREATE VIEW v_housing_specialist_housing_advisory_case_detail AS
SELECT a.id, a.specialist_id, a.full_name, b.id AS case_id, b.case_id AS case_case_id, b.case_type AS case_case_type
FROM hous_housing_specialists a
  JOIN hous_housing_specialistsHousingAdvisoryCase j ON j.housing_specialist_id = a.id
  JOIN hous_housing_advisory_cases b ON b.id = j.housing_advisory_case_id;
```

| id | specialist_id | full_name | case_id | case_case_id | case_case_type |
|---|---|---|---|---|---|
| 1000 | 4985161 | Theodore Mcgrath | 1000 | 39800622 | homelessness_application |
| 1000 | 4985161 | Theodore Mcgrath | 1001 | 4891 | possession_proceedings |
| 1001 | id_23 | Account Name | 1001 | 4891 | possession_proceedings |
| 1001 | id_23 | Account Name | 1002 | 17374813 | rent_arrears |
| 1002 | 4793489 | Saipan International Airport | 1002 | 17374813 | rent_arrears |
| 1002 | 4793489 | Saipan International Airport | 1003 | state_uk_9 | mortgage_arrears |
| 1003 | 9568467 | Norma Fisher | 1003 | state_uk_9 | mortgage_arrears |
| 1003 | 9568467 | Norma Fisher | 1000 | 39800622 | homelessness_application |

The view `v_housing_specialist_housing_advisory_case_detail` joins `hous_housing_specialists` to `hous_housing_advisory_cases`, producing a detailed specialist-case pairing. For specialist `1000` (`Theodore Mcgrath`, `homelessness_prevention`, `employed`, `junior`), the view returns case `1000` (`39800622`, `homelessness_application`, `open`, `standard`, referred by `LCA`). This view answers: "What are the full details of each case managed by a specialist?"

**View `v_housing_specialist_training_module`**

```sql
CREATE VIEW v_housing_specialist_training_module AS
SELECT a.id, a.specialist_id, a.full_name, a.specialization, b.module_id AS module_module_id, b.title AS module_title, b.delivery_mode AS module_delivery_mode
FROM hous_housing_specialists a JOIN hous_training_modules b ON a.module_id = b.module_id;
```

| id | specialist_id | full_name | specialization | module_module_id | module_title | module_delivery_mode |
|---|---|---|---|---|---|---|
| 1000 | 4985161 | Theodore Mcgrath | homelessness_prevention | 13061773 | Compact Initiative | face_to_face |
| 1001 | id_23 | Account Name | housing_debt | template_ivacode_pagata_0 | Legacy Model | webinar |
| 1002 | 4793489 | Saipan International Airport | possession_defence | 3744024 | Regional Cluster A | briefing |
| 1003 | 9568467 | Norma Fisher | welfare_benefits | 727063 | Seasonal Review | bitesize_online |

The view `v_housing_specialist_training_module` joins `hous_housing_specialists` to `hous_training_modules` on the module foreign key, producing a flat record that pairs each specialist with their assigned training module. For specialist `1000` (`Theodore Mcgrath`), the view returns module `13061773` (`Compact Initiative`, `face_to_face`, `introductory`, `3.70` hours, free). This view answers: "Which training module is each specialist associated with?"

**View `v_housing_specialist_n_h_a_s`**

```sql
CREATE VIEW v_housing_specialist_n_h_a_s AS
SELECT a.id, a.specialist_id, a.full_name, a.specialization, b.id AS s_id, b.service_id AS s_service_id, b.funding_source AS s_funding_source
FROM hous_housing_specialists a JOIN hous_n_h_a_ses b ON a.n_h_a_s_id = b.id;
```

| id | specialist_id | full_name | specialization | s_id | s_service_id | s_funding_source |
|---|---|---|---|---|---|---|
| 1000 | 4985161 | Theodore Mcgrath | homelessness_prevention | 1 | 1996925 | baseline-funding-73 |
| 1001 | id_23 | Account Name | housing_debt | 2 | 3990164 | pilot-funding-74 |
| 1002 | 4793489 | Saipan International Airport | possession_defence | 3 | 5844258 | extended-funding-75 |
| 1003 | 9568467 | Norma Fisher | welfare_benefits | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | integrated-funding-76 |

The view `v_housing_specialist_n_h_a_s` joins `hous_housing_specialists` to `hous_n_h_a_ses` on the NHA foreign key, producing a flat record that pairs each specialist with their NHA service. For specialist `1000`, the view returns NHA service `1` with `service_id` `1996925`, funded by `baseline-funding-73`, operating under `pilot-operatin-50`, established in year `10`, and free of charge. This view answers: "Which NHA service is each specialist associated with?"

**View `v_housing_client_housing_advisory_case`**

```sql
CREATE VIEW v_housing_client_housing_advisory_case AS
SELECT a.housing_client_id, a.client_id, a.household_size, a.current_housing_status, b.id AS case_id, b.case_id AS case_case_id, b.case_type AS case_case_type
FROM hous_housing_clients a JOIN hous_housing_advisory_cases b ON a.housing_advisory_case_id = b.id;
```

| housing_client_id | client_id | household_size | current_housing_status | case_id | case_case_id | case_case_type |
|---|---|---|---|---|---|---|
| 1 | Erin Olson | 11 | homeless | 1000 | 39800622 | homelessness_application |
| 2 | Jorge Sullivan | 22 | at_risk | 1001 | 4891 | possession_proceedings |
| 3 | Kimberly Maynard | 33 | tenanted | 1002 | 17374813 | rent_arrears |
| 4 | Michelle Kelley | 44 | owner_occupier | 1003 | state_uk_9 | mortgage_arrears |

The view `v_housing_client_housing_advisory_case` joins `hous_housing_clients` to `hous_housing_advisory_cases` on the case foreign key, producing a flat record that pairs each client with their case. For client `1` (`Erin Olson`, household size `11`, `homeless`, primary need `rent_arrears`), the view returns case `1000` (`39800622`, `homelessness_application`, `open`, `standard`, referred by `LCA`). This view answers: "Which advisory case is each client associated with?"

**View `v_training_module_housing_specialist`**

```sql
CREATE VIEW v_training_module_housing_specialist AS
SELECT a.module_id, a.title, a.delivery_mode, a.level, b.id AS specialist_id, b.specialist_id AS specialist_specialist_id, b.full_name AS specialist_full_name
FROM hous_training_modules a JOIN hous_housing_specialists b ON a.housing_specialist_id = b.id;
```

| module_id | title | delivery_mode | level | specialist_id | specialist_specialist_id | specialist_full_name |
|---|---|---|---|---|---|---|
| 13061773 | Compact Initiative | face_to_face | introductory | 1000 | 4985161 | Theodore Mcgrath |
| template_ivacode_pagata_0 | Legacy Model | webinar | refresher | 1001 | id_23 | Account Name |
| 3744024 | Regional Cluster A | briefing | advanced | 1002 | 4793489 | Saipan International Airport |
| 727063 | Seasonal Review | bitesize_online | introductory | 1003 | 9568467 | Norma Fisher |

The view `v_training_module_housing_specialist` joins `hous_training_modules` to `hous_housing_specialists` on the specialist foreign key, producing a flat record that pairs each training module with its assigned specialist. For module `13061773` (`Compact Initiative`, `face_to_face`, `introductory`, `3.70` hours, free), the view returns specialist `1000` (`Theodore Mcgrath`, `homelessness_prevention`, `employed`, `junior`). This view answers: "Which specialist is assigned to each training module?"

**View `v_training_module_housing_adviser_detail`**

```sql
CREATE VIEW v_training_module_housing_adviser_detail AS
SELECT a.module_id, a.title, a.delivery_mode, b.id AS adviser_id, b.adviser_id AS adviser_adviser_id, b.full_name AS adviser_full_name
FROM hous_training_modules a
  JOIN hous_training_modulesHousingAdviser j ON j.module_id = a.module_id
  JOIN hous_housing_advisers b ON b.id = j.housing_adviser_id;
```

| module_id | title | delivery_mode | adviser_id | adviser_adviser_id | adviser_full_name |
|---|---|---|---|---|---|
| 13061773 | Compact Initiative | face_to_face | 1 | 2618554 | Theodore Mcgrath |
| 13061773 | Compact Initiative | face_to_face | 2 | 4332 | Account Name |
| template_ivacode_pagata_0 | Legacy Model | webinar | 2 | 4332 | Account Name |
| template_ivacode_pagata_0 | Legacy Model | webinar | 3 | PHR-93 | Saipan International Airport |
| 3744024 | Regional Cluster A | briefing | 3 | PHR-93 | Saipan International Airport |
| 3744024 | Regional Cluster A | briefing | 4 | 1250212 | Norma Fisher |
| 727063 | Seasonal Review | bitesize_online | 4 | 1250212 | Norma Fisher |
| 727063 | Seasonal Review | bitesize_online | 1 | 2618554 | Theodore Mcgrath |

The view `v_training_module_housing_adviser_detail` joins `hous_training_modules` to `hous_housing_advisers` on the module foreign key, producing a flat record that pairs each training module with its adviser. For module `13061773` (`Compact Initiative`), the view returns adviser `1` (`Theodore Mcgrath`, employer `LCA`, `16` years experience, last trained `2022-01-16`). This view answers: "Which adviser is associated with each training module?"

**View `v_training_module_legal_topic`**

```sql
CREATE VIEW v_training_module_legal_topic AS
SELECT a.module_id, a.title, a.delivery_mode, a.level, b.topic_id AS topic_topic_id, b.topic_name AS topic_topic_name, b.category AS topic_category
FROM hous_training_modules a JOIN hous_legal_topics b ON a.topic_id = b.topic_id;
```

| module_id | title | delivery_mode | level | topic_topic_id | topic_topic_name | topic_category |
|---|---|---|---|---|---|---|
| 13061773 | Compact Initiative | face_to_face | introductory | lu_tax_code_template_b_VB-IC-Tab | Regional Model | homelessness_law |
| template_ivacode_pagata_0 | Legacy Model | webinar | refresher | 8387534 | Seasonal Cluster D | housing_debt |
| 3744024 | Regional Cluster A | briefing | advanced | 2933463 | Integrated Review | possession_proceedings |
| 727063 | Seasonal Review | bitesize_online | introductory | 2839516 | Extended Initiative | tenant_rights |

The view `v_training_module_legal_topic` joins `hous_training_modules` to `hous_legal_topics` on the topic foreign key, producing a flat record that pairs each training module with its legal topic. For module `13061773` (`Compact Initiative`), the view returns topic `lu_tax_code_template_b_VB-IC-Tab` with topic name `Tax Code Template`. This view answers: "Which legal topic is each training module associated with?"

**View `v_housing_adviser_training_module`**

```sql
CREATE VIEW v_housing_adviser_training_module AS
SELECT a.id, a.adviser_id, a.full_name, a.employer_type, b.module_id AS module_module_id, b.title AS module_title, b.delivery_mode AS module_delivery_mode
FROM hous_housing_advisers a JOIN hous_training_modules b ON a.module_id = b.module_id;
```

| id | adviser_id | full_name | employer_type | module_module_id | module_title | module_delivery_mode |
|---|---|---|---|---|---|---|
| 1 | 2618554 | Theodore Mcgrath | LCA | 13061773 | Compact Initiative | face_to_face |
| 2 | 4332 | Account Name | voluntary_agency | template_ivacode_pagata_0 | Legacy Model | webinar |
| 3 | PHR-93 | Saipan International Airport | local_authority | 3744024 | Regional Cluster A | briefing |
| 4 | 1250212 | Norma Fisher | LCA | 727063 | Seasonal Review | bitesize_online |

The view `v_housing_adviser_training_module` joins `hous_housing_advisers` to `hous_training_modules` on the module foreign key, producing a flat record that pairs each adviser with their training module. For adviser `1` (`Theodore Mcgrath`, employer `LCA`, `16` years experience), the view returns module `13061773` (`Compact Initiative`, `face_to_face`, `introductory`, `3.70` hours, free). This view answers: "Which training module is each adviser associated with?"

**View `v_housing_adviser_housing_advisory_case`**

```sql
CREATE VIEW v_housing_adviser_housing_advisory_case AS
SELECT a.id, a.adviser_id, a.full_name, a.employer_type, b.id AS case_id, b.case_id AS case_case_id, b.case_type AS case_case_type
FROM hous_housing_advisers a JOIN hous_housing_advisory_cases b ON a.housing_advisory_case_id = b.id;
```

| id | adviser_id | full_name | employer_type | case_id | case_case_id | case_case_type |
|---|---|---|---|---|---|---|
| 1 | 2618554 | Theodore Mcgrath | LCA | 1000 | 39800622 | homelessness_application |
| 2 | 4332 | Account Name | voluntary_agency | 1001 | 4891 | possession_proceedings |
| 3 | PHR-93 | Saipan International Airport | local_authority | 1002 | 17374813 | rent_arrears |
| 4 | 1250212 | Norma Fisher | LCA | 1003 | state_uk_9 | mortgage_arrears |

The view `v_housing_adviser_housing_advisory_case` joins `hous_housing_advisers` to `hous_housing_advisory_cases` on the case foreign key, producing a flat record that pairs each adviser with their case. For adviser `1` (`Theodore Mcgrath`, employer `LCA`, `16` years experience), the view returns case `1000` (`39800622`, `homelessness_application`, `open`, `standard`, referred by `LCA`). This view answers: "Which advisory case is each adviser associated with?"

**View `v_housing_adviser_n_h_a_s`**

```sql
CREATE VIEW v_housing_adviser_n_h_a_s AS
SELECT a.id, a.adviser_id, a.full_name, a.employer_type, b.id AS s_id, b.service_id AS s_service_id, b.funding_source AS s_funding_source
FROM hous_housing_advisers a JOIN hous_n_h_a_ses b ON a.n_h_a_s_id = b.id;
```

| id | adviser_id | full_name | employer_type | s_id | s_service_id | s_funding_source |
|---|---|---|---|---|---|---|
| 1 | 2618554 | Theodore Mcgrath | LCA | 1 | 1996925 | baseline-funding-73 |
| 2 | 4332 | Account Name | voluntary_agency | 2 | 3990164 | pilot-funding-74 |
| 3 | PHR-93 | Saipan International Airport | local_authority | 3 | 5844258 | extended-funding-75 |
| 4 | 1250212 | Norma Fisher | LCA | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | integrated-funding-76 |

The view `v_housing_adviser_n_h_a_s` joins `hous_housing_advisers` to `hous_n_h_a_ses` on the NHA foreign key, producing a flat record that pairs each adviser with their NHA service. For adviser `1` (`Theodore Mcgrath`, employer `LCA`, `16` years experience), the view returns NHA service `1` (`1996925`, `baseline-funding-73`, `pilot-operatin-50`, established year `10`, free). This view answers: "Which NHA service is each adviser associated with?"

**View `v_n_h_a_s_housing_specialist_detail`**

```sql
CREATE VIEW v_n_h_a_s_housing_specialist_detail AS
SELECT a.id, a.service_id, a.funding_source, b.id AS specialist_id, b.specialist_id AS specialist_specialist_id, b.full_name AS specialist_full_name
FROM hous_n_h_a_ses a
  JOIN hous_n_h_a_sesHousingSpecialist j ON j.n_h_a_s_id = a.id
  JOIN hous_housing_specialists b ON b.id = j.housing_specialist_id;
```

| id | service_id | funding_source | specialist_id | specialist_specialist_id | specialist_full_name |
|---|---|---|---|---|---|
| 1 | 1996925 | baseline-funding-73 | 1000 | 4985161 | Theodore Mcgrath |
| 1 | 1996925 | baseline-funding-73 | 1001 | id_23 | Account Name |
| 2 | 3990164 | pilot-funding-74 | 1001 | id_23 | Account Name |
| 2 | 3990164 | pilot-funding-74 | 1002 | 4793489 | Saipan International Airport |
| 3 | 5844258 | extended-funding-75 | 1002 | 4793489 | Saipan International Airport |
| 3 | 5844258 | extended-funding-75 | 1003 | 9568467 | Norma Fisher |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | integrated-funding-76 | 1003 | 9568467 | Norma Fisher |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | integrated-funding-76 | 1000 | 4985161 | Theodore Mcgrath |

The view `v_n_h_a_s_housing_specialist_detail` joins `hous_n_h_a_ses` to `hous_housing_specialists` on the specialist foreign key, producing a flat record that pairs each NHA service with its specialist. For NHA service `1` (`1996925`, `baseline-funding-73`, `pilot-operatin-50`, established year `10`, free), the view returns specialist `1000` (`Theodore Mcgrath`, `homelessness_prevention`, `employed`, `junior`). This view answers: "Which specialist is associated with each NHA service?"

**View `v_n_h_a_s_housing_adviser_detail`**

```sql
CREATE VIEW v_n_h_a_s_housing_adviser_detail AS
SELECT a.id, a.service_id, a.funding_source, b.id AS adviser_id, b.adviser_id AS adviser_adviser_id, b.full_name AS adviser_full_name
FROM hous_n_h_a_ses a
  JOIN hous_n_h_a_sesHousingAdviser j ON j.n_h_a_s_id = a.id
  JOIN hous_housing_advisers b ON b.id = j.housing_adviser_id;
```

| id | service_id | funding_source | adviser_id | adviser_adviser_id | adviser_full_name |
|---|---|---|---|---|---|
| 1 | 1996925 | baseline-funding-73 | 1 | 2618554 | Theodore Mcgrath |
| 1 | 1996925 | baseline-funding-73 | 2 | 4332 | Account Name |
| 2 | 3990164 | pilot-funding-74 | 2 | 4332 | Account Name |
| 2 | 3990164 | pilot-funding-74 | 3 | PHR-93 | Saipan International Airport |
| 3 | 5844258 | extended-funding-75 | 3 | PHR-93 | Saipan International Airport |
| 3 | 5844258 | extended-funding-75 | 4 | 1250212 | Norma Fisher |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | integrated-funding-76 | 4 | 1250212 | Norma Fisher |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | integrated-funding-76 | 1 | 2618554 | Theodore Mcgrath |

The view `v_n_h_a_s_housing_adviser_detail` joins `hous_n_h_a_ses` to `hous_housing_advisers` on the adviser foreign key, producing a flat record that pairs each NHA service with its adviser. For NHA service `1` (`1996925`, `baseline-funding-73`, `pilot-operatin-50`, established year `10`, free), the view returns adviser `1` (`Theodore Mcgrath`, employer `LCA`, `16` years experience, last trained `2022-01-16`). This view answers: "Which adviser is associated with each NHA service?"

**View `v_n_h_a_s_training_module`**

```sql
CREATE VIEW v_n_h_a_s_training_module AS
SELECT a.id, a.service_id, a.funding_source, a.operating_hours, b.module_id AS module_module_id, b.title AS module_title, b.delivery_mode AS module_delivery_mode
FROM hous_n_h_a_ses a JOIN hous_training_modules b ON a.module_id = b.module_id;
```

| id | service_id | funding_source | operating_hours | module_module_id | module_title | module_delivery_mode |
|---|---|---|---|---|---|---|
| 1 | 1996925 | baseline-funding-73 | pilot-operatin-50 | 13061773 | Compact Initiative | face_to_face |
| 2 | 3990164 | pilot-funding-74 | extended-operatin-51 | template_ivacode_pagata_0 | Legacy Model | webinar |
| 3 | 5844258 | extended-funding-75 | integrated-operatin-52 | 3744024 | Regional Cluster A | briefing |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | integrated-funding-76 | seasonal-operatin-53 | 727063 | Seasonal Review | bitesize_online |

The view `v_n_h_a_s_training_module` joins `hous_n_h_a_ses` to `hous_training_modules` on the module foreign key, producing a flat record that pairs each NHA service with its training module. For NHA service `1` (`1996925`, `baseline-funding-73`, `pilot-operatin-50`, established year `10`, free), the view returns module `13061773` (`Compact Initiative`, `face_to_face`, `introductory`, `3.70` hours, free). This view answers: "Which training module is each NHA service associated with?"

**View `v_legal_topic_training_module`**

```sql
CREATE VIEW v_legal_topic_training_module AS
SELECT a.topic_id, a.topic_name, a.category, a.last_reviewed, b.module_id AS module_module_id, b.title AS module_title, b.delivery_mode AS module_delivery_mode
FROM hous_legal_topics a JOIN hous_training_modules b ON a.module_id = b.module_id;
```

| topic_id | topic_name | category | last_reviewed | module_module_id | module_title | module_delivery_mode |
|---|---|---|---|---|---|---|
| lu_tax_code_template_b_VB-IC-Tab | Regional Model | homelessness_law | 2022-05-27 | 13061773 | Compact Initiative | face_to_face |
| 8387534 | Seasonal Cluster D | housing_debt | 2023-10-11 | template_ivacode_pagata_0 | Legacy Model | webinar |
| 2933463 | Integrated Review | possession_proceedings | 2024-03-22 | 3744024 | Regional Cluster A | briefing |
| 2839516 | Extended Initiative | tenant_rights | 2025-08-06 | 727063 | Seasonal Review | bitesize_online |

The view `v_legal_topic_training_module` joins `hous_legal_topics` to `hous_training_modules` on the topic foreign key, producing a flat record that pairs each legal topic with its training module. For topic `lu_tax_code_template_b_VB-IC-Tab` (`Tax Code Template`), the view returns module `13061773` (`Compact Initiative`, `face_to_face`, `introductory`, `3.70` hours, free). This view answers: "Which training module is associated with each legal topic?"

**View `v_legal_topic_housing_advisory_case`**

```sql
CREATE VIEW v_legal_topic_housing_advisory_case AS
SELECT a.topic_id, a.topic_name, a.category, a.last_reviewed, b.id AS case_id, b.case_id AS case_case_id, b.case_type AS case_case_type
FROM hous_legal_topics a JOIN hous_housing_advisory_cases b ON a.housing_advisory_case_id = b.id;
```

| topic_id | topic_name | category | last_reviewed | case_id | case_case_id | case_case_type |
|---|---|---|---|---|---|---|
| lu_tax_code_template_b_VB-IC-Tab | Regional Model | homelessness_law | 2022-05-27 | 1000 | 39800622 | homelessness_application |
| 8387534 | Seasonal Cluster D | housing_debt | 2023-10-11 | 1001 | 4891 | possession_proceedings |
| 2933463 | Integrated Review | possession_proceedings | 2024-03-22 | 1002 | 17374813 | rent_arrears |
| 2839516 | Extended Initiative | tenant_rights | 2025-08-06 | 1003 | state_uk_9 | mortgage_arrears |

The view `v_legal_topic_housing_advisory_case` joins `hous_legal_topics` to `hous_housing_advisory_cases` through the training module, producing a flat record that pairs each legal topic with its advisory case. For topic `lu_tax_code_template_b_VB-IC-Tab` (`Tax Code Template`), the view returns case `1000` (`39800622`, `homelessness_application`, `open`, `standard`, referred by `LCA`). This view answers: "Which advisory case is associated with each legal topic?"

The schema's design reflects a deliberate normalisation strategy: entity types are stored once in their own tables, relationships are expressed through foreign keys and junction tables, and views provide denormalised projections for reporting and analysis. The junction tables (`hous_housing_specialistsHousingAdvisoryCase`, `hous_training_modulesHousingAdviser`, `hous_n_h_a_sesHousingSpecialist`, `hous_n_h_a_sesHousingAdviser`) handle many-to-many associations that cannot be represented by a single foreign key. The eighteen views collectively cover every pairwise relationship between the core entity types, ensuring that any domain question—whether about which specialist handles which case, which adviser completed which module, or which legal topic underpins which case—can be answered through a single view without manual join logic. This architecture separates the stable, normalised storage layer from the flexible, denormalised query layer, allowing the domain model to evolve independently of the reporting layer.