## The Housing Advisory Ecosystem

Housing advisory services operate at the intersection of legal entitlement, financial distress, and social welfare. Practitioners in this domain manage a continuous flow of cases—homelessness applications, rent arrears, possession proceedings, mortgage arrears—each requiring coordination between housing specialists, housing advisers, training programmes, and the underlying services that fund and govern them. The records below capture the full lifecycle of a case: from referral through to resolution, including the people involved, the training they have completed, the legal topics addressed, and the service structures that enable the work. Understanding these relationships is essential for auditing caseloads, verifying training compliance, and tracing how resources flow from funding sources to the clients who need them.

**Table `hous_housing_advisory_cases`**

| id | case_id | case_type | status | priority_level | referral_source | date_opened | date_closed | housing_specialist_id | housing_client_id | module_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 39800622 | homelessness_application | open | standard | LCA | 2025-08-21T19:57:00 | 2023-06-23T17:27:00 | 1000 | 1 | 13061773 |
| 1001 | 4891 | possession_proceedings | under_review | urgent | voluntary_agency | 2022-01-05T02:14:00 | 2024-11-07T00:44:00 | 1001 | 2 | template_ivacode_pagata_0 |
| 1002 | 17374813 | rent_arrears | advice_provided | critical | local_authority | 2023-06-16T09:31:00 | 2025-04-18T07:01:00 | 1002 | 3 | 3744024 |
| 1003 | state_uk_9 | mortgage_arrears | casework_active | standard | LCA | 2024-11-27T16:48:00 | 2022-09-02T14:18:00 | 1003 | 4 | 727063 |

The housing advisory case table is the central ledger of the system. Each row represents a single matter, identified by a numeric `id` and a human-readable `case_id` such as `39800622` or the template-style identifier `template_ivacode_pagata_0`. Cases are categorised by `case_type`—values include `homelessness_application`, `possession_proceedings`, `rent_arrears`, and `mortgage_arrears`—and tracked through a `status` field that records whether a case is `open`, `under_review`, `advice_provided`, or `casework_active`. Priority is assigned at intake via `priority_level`, ranging from `standard` to `urgent` and `critical`. The `referral_source` column indicates where the case originated, with observed values of `LCA`, `voluntary_agency`, and `local_authority`. Dates for `date_opened` and `date_closed` bracket the case lifecycle, while the foreign keys `housing_specialist_id`, `housing_client_id`, and `module_id` link the case to the specialist handling it, the client it concerns, and the training module that may have informed the advisory work.

**Table `hous_housing_specialists`**

| id | specialist_id | full_name | specialization | employment_status | certification_level | contact_email | contact_phone | module_id | n_h_a_s_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 4985161 | Theodore Mcgrath | homelessness_prevention | employed | junior | Christopher Wilson | Joe Tsai | 13061773 | 1 |
| 1001 | id_23 | Account Name | housing_debt | contracted | senior | Charles Larsen | Stephanie Collins | template_ivacode_pagata_0 | 2 |
| 1002 | 4793489 | Saipan International Airport | possession_defence | volunteer | lead | Mary Alvarez | Tasha Rodriguez | 3744024 | 3 |
| 1003 | 9568467 | Norma Fisher | welfare_benefits | employed | junior | April Snyder | Walter Pratt | 727063 | 4 |

Housing specialists are the frontline practitioners who manage cases on behalf of clients. The `hous_housing_specialists` table records each specialist's `id`, a secondary `specialist_id` such as `4985161` or `id_23`, and their `full_name`—for example, Theodore Mcgrath or Norma Fisher. Their area of expertise is captured in `specialization`, with values like `homelessness_prevention`, `housing_debt`, `possession_defence`, and `welfare_benefits`. Employment arrangements vary: `employment_status` takes values of `employed`, `contracted`, or `volunteer`, while `certification_level` distinguishes between `junior`, `senior`, and `lead` practitioners. Contact details are stored as `contact_email` and `contact_phone`, though in the sample data these fields contain names rather than conventional email addresses or phone numbers, reflecting the fictional nature of the dataset. Each specialist is associated with a `module_id` for training and an `n_h_a_s_id` linking them to the service they operate under.

**Table `hous_housing_clients`**

| housing_client_id | client_id | household_size | current_housing_status | primary_need | date_of_referral | has_dependents | housing_advisory_case_id |
|---|---|---|---|---|---|---|---|
| 1 | Erin Olson | 11 | homeless | rent_arrears | 2024-11-03T10:18:00 | false | 1000 |
| 2 | Jorge Sullivan | 22 | at_risk | mortgage_arrears | 2025-04-14T17:35:00 | true | 1001 |
| 3 | Kimberly Maynard | 33 | tenanted | possession | 2022-09-25T00:52:00 | false | 1002 |
| 4 | Michelle Kelley | 44 | owner_occupier | disrepair | 2023-02-09T07:09:00 | true | 1003 |

Clients are the individuals or households seeking housing advice. The `hous_housing_clients` table stores a `housing_client_id`, a secondary `client_id` (such as `Erin Olson` or `Jorge Sullivan`), and demographic information including `household_size` and `has_dependents`. The `current_housing_status` field classifies each client's situation as `homeless`, `at_risk`, `tenanted`, or `owner_occupier`. The `primary_need` column identifies the core issue prompting the referral—`rent_arrears`, `mortgage_arrears`, `possession`, or `disrepair`—and `date_of_referral` records when the client entered the system. The foreign key `housing_advisory_case_id` ties each client record to the specific case they are involved in, establishing a direct link between the person and the matter being managed.

**Table `hous_training_modules`**

| module_id | title | delivery_mode | level | duration_hours | is_free | last_updated | housing_specialist_id | topic_id |
|---|---|---|---|---|---|---|---|---|
| 13061773 | Compact Initiative | face_to_face | introductory | 3.70 | true | 2023-06-17 | 1000 | lu_tax_code_template_b_VB-IC-Tab |
| template_ivacode_pagata_0 | Legacy Model | webinar | refresher | 7.40 | false | 2024-11-01 | 1001 | 8387534 |
| 3744024 | Regional Cluster A | briefing | advanced | 11.10 | true | 2025-04-12 | 1002 | 2933463 |
| 727063 | Seasonal Review | bitesize_online | introductory | 14.80 | false | 2022-09-23 | 1003 | 2839516 |

Training modules form the educational backbone of the advisory service. The `hous_training_modules` table lists each module by its `module_id`—values include `13061773`, `template_ivacode_pagata_0`, `3744024`, and `727063`—along with a descriptive `title` such as Compact Initiative, Legacy Model, Regional Cluster A, or Seasonal Review. The `delivery_mode` indicates how the training is delivered: `face_to_face`, `webinar`, `briefing`, or `bitesize_online`. Training is structured at three `level`s—`introductory`, `refresher`, and `advanced`—and each module has a `duration_hours` ranging from 3.70 to 14.80 hours. The `is_free` flag distinguishes complimentary training from paid programmes, and `last_updated` records the most recent revision date. Each module is linked to a `housing_specialist_id` and a `topic_id` that connects it to the legal topics covered.

**Table `hous_housing_advisers`**

| id | adviser_id | full_name | employer_type | years_experience | last_training_date | contact_email | module_id | housing_advisory_case_id | n_h_a_s_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2618554 | Theodore Mcgrath | LCA | 16 | 2022-01-16 | Christopher Wilson | 13061773 | 1000 | 1 |
| 2 | 4332 | Account Name | voluntary_agency | 22 | 2023-06-27 | Charles Larsen | template_ivacode_pagata_0 | 1001 | 2 |
| 3 | PHR-93 | Saipan International Airport | local_authority | 28 | 2024-11-11 | Mary Alvarez | 3744024 | 1002 | 3 |
| 4 | 1250212 | Norma Fisher | LCA | 34 | 2025-04-22 | April Snyder | 727063 | 1003 | 4 |

Housing advisers operate alongside specialists, often from different organisational backgrounds. The `hous_housing_advisers` table records each adviser's `id`, a secondary `adviser_id` such as `2618554` or `PHR-93`, and their `full_name`. The `employer_type` field distinguishes between `LCA`, `voluntary_agency`, and `local_authority`, reflecting the multi-agency nature of housing advice. `years_experience` ranges from 16 to 34 in the sample data, and `last_training_date` tracks when each adviser last completed a training module. Contact information is stored in `contact_email`, and the foreign keys `module_id`, `housing_advisory_case_id`, and `n_h_a_s_id` link advisers to their training, their cases, and the service they belong to.

**Table `hous_n_h_a_ses`**

| id | service_id | funding_source | operating_hours | is_free | established_year | module_id |
|---|---|---|---|---|---|---|
| 1 | 1996925 | baseline-funding-73 | pilot-operatin-50 | true | 10 | 13061773 |
| 2 | 3990164 | pilot-funding-74 | extended-operatin-51 | false | 16 | template_ivacode_pagata_0 |
| 3 | 5844258 | extended-funding-75 | integrated-operatin-52 | true | 22 | 3744024 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | integrated-funding-76 | seasonal-operatin-53 | false | 28 | 727063 |

The `hous_n_h_a_ses` table represents the services or organisations that underpin the advisory ecosystem. Each service has an `id`, a `service_id` (such as `1996925` or the UUID `e29bafe2-8fd1-11eb-924d-9cd76263cbd0`), and a `funding_source` like `baseline-funding-73` or `integrated-funding-76`. The `operating_hours` field describes the service's availability—values include `pilot-operatin-50`, `extended-operatin-51`, `integrated-operatin-52`, and `seasonal-operatin-53`. The `is_free` flag indicates whether the service is provided at no cost, and `established_year` records how long the service has been operating, with values ranging from 10 to 28 years. Each service is associated with a `module_id` for training alignment.

**Table `hous_legal_topics`**

| topic_id | topic_name | category | last_reviewed | is_current | module_id | housing_advisory_case_id |
|---|---|---|---|---|---|---|
| lu_tax_code_template_b_VB-IC-Tab | Regional Model | homelessness_law | 2022-05-27 | true | 13061773 | 1000 |
| 8387534 | Seasonal Cluster D | housing_debt | 2023-10-11 | false | template_ivacode_pagata_0 | 1001 |
| 2933463 | Integrated Review | possession_proceedings | 2024-03-22 | true | 3744024 | 1002 |
| 2839516 | Extended Initiative | tenant_rights | 2025-08-06 | false | 727063 | 1003 |

Legal topics define the substantive areas of law that training modules and advisory cases address. The `hous_legal_topics` table stores each topic's `id`—values include `lu_tax_code_template_b_VB-IC-Tab`, `8387534`, `2933463`, and `2839516`—along with a `topic_name` and a `topic_category` that groups related subjects. The `description` field provides context for the topic, and `is_active` indicates whether the topic is currently in use. Each topic is linked to a `module_id` and a `housing_advisory_case_id`, connecting legal subject matter to both training and active cases.

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

The junction table `hous_housing_specialistsHousingAdvisoryCase` resolves the many-to-many relationship between specialists and advisory cases. Each row pairs a `housing_specialist_id` with a `housing_advisory_case_id`, establishing which specialist is responsible for which case. The `id` column provides a unique identifier for each assignment, while `assigned_date` and `completed_date` track the timeline of the assignment. This table enables flexible caseload management, allowing a specialist to handle multiple cases and a case to be transferred between specialists over time.

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

The `hous_training_modulesHousingAdviser` table records the relationship between training modules and advisers. Each row links a `training_module_id` to an `adviser_id`, with an `id` for the assignment record and a `completion_date` indicating when the adviser finished the module. This table supports compliance tracking by maintaining a clear audit trail of which advisers have completed which training programmes, enabling managers to verify that practitioners meet their professional development requirements.

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

The `hous_n_h_a_sesHousingSpecialist` table connects services to the specialists who work within them. Each row pairs an `n_h_a_s_id` with a `housing_specialist_id`, and includes an `id` for the assignment and a `start_date` indicating when the specialist began working under that service. This relationship clarifies the organisational structure of the advisory network, showing which specialists are deployed under which services and when they were assigned.

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

Similarly, the `hous_n_h_a_sesHousingAdviser` table links services to advisers. Each row contains an `n_h_a_s_id`, an `adviser_id`, an `id` for the record, and a `start_date`. This table mirrors the structure of the specialist-service link but applies to advisers, ensuring that both categories of practitioner are accounted for within the service hierarchy.

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

The view `v_housing_advisory_case_housing_specialist` joins advisory cases with their assigned specialists, answering the question of which practitioner is responsible for each matter. A row from this view might show case `39800622` (a `homelessness_application` with `standard` priority referred by `LCA`) handled by specialist Theodore Mcgrath, whose specialisation is `homelessness_prevention` and who holds `junior` certification. Another row could pair case `4891` (a `possession_proceedings` case marked `urgent` and `under_review`) with specialist Account Name, who specialises in `housing_debt` and holds `senior` certification. This view enables managers to audit caseload distribution and verify that case types are matched to appropriate specialisations.

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

The view `v_housing_advisory_case_housing_client` links advisory cases to the clients they concern, providing a complete picture of who is affected by each matter. A sample row might show case `39800622` associated with client Erin Olson, who has a household size of 11, is currently `homeless`, and has `rent_arrears` as their primary need. Another row could pair case `4891` with client Jorge Sullivan, who has a household size of 22, is `at_risk`, and needs assistance with `mortgage_arrears`. This view is essential for understanding the client population served by each case type and for identifying patterns in household composition and housing status.

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

The view `v_housing_advisory_case_training_module` connects advisory cases to the training modules that may have informed the advisory work. A row from this view might show case `39800622` linked to the Compact Initiative module (`13061773`), which is delivered `face_to_face` at an `introductory` level over 3.70 hours and is provided free of charge. Another row could pair case `4891` with the Legacy Model module (`template_ivacode_pagata_0`), delivered as a `webinar` at the `refresher` level over 7.40 hours and not free. This view supports quality assurance by revealing whether the training underpinning advisory work is current and appropriate to the case type.

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

The view `v_housing_specialist_housing_advisory_case_detail` provides a detailed snapshot of each specialist's caseload by joining the specialist table with the advisory cases they manage. A row might show Theodore Mcgrath (specialist ID `4985161`, specialisation `homelessness_prevention`, `employed` status) handling case `39800622`, a `homelessness_application` of `standard` priority opened on `2025-08-21`. Another row could display Account Name (specialist ID `id_23`, specialisation `housing_debt`, `contracted` status) managing case `4891`, a `possession_proceedings` case marked `urgent` and `under_review`. This view is particularly useful for workload analysis and for identifying specialists who may be carrying disproportionate caseloads.

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

The view `v_housing_specialist_training_module` joins specialists with the training modules they have completed, answering the question of which practitioners are qualified in which areas. A row might show Theodore Mcgrath having completed the Compact Initiative module, delivered `face_to_face` at `introductory` level. Another row could show Account Name having completed the Legacy Model module, delivered as a `webinar` at `refresher` level. This view supports professional development planning by revealing gaps in training coverage and enabling targeted upskilling initiatives.

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

The view `v_housing_specialist_n_h_a_s` links specialists to the services they operate under, clarifying the organisational structure. A row might show Theodore Mcgrath deployed under service `1996925` with funding source `baseline-funding-73`, operating under `pilot-operatin-50` hours and established 10 years ago. Another row could display Account Name under service `3990164` with funding source `pilot-funding-74`, operating under `extended-operatin-51` hours and established 16 years ago. This view is essential for understanding resource allocation and for tracing how funding flows from services to the practitioners who deliver advice.

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

The view `v_housing_client_housing_advisory_case` presents a client-centric view of the advisory system, joining client records with their associated cases. A row might show Erin Olson (household size 11, `homeless`, primary need `rent_arrears`) linked to case `39800622`, a `homelessness_application` of `standard` priority. Another row could display Jorge Sullivan (household size 22, `at_risk`, primary need `mortgage_arrears`) linked to case `4891`, a `possession_proceedings` case marked `urgent`. This view supports client journey analysis and helps identify whether clients with similar needs are being routed to appropriate case types.

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

The view `v_training_module_housing_specialist` inverts the specialist-training relationship, showing which specialists are associated with each training module. A row might show the Compact Initiative module (`13061773`) linked to specialist Theodore Mcgrath, while another row could show the Legacy Model module (`template_ivacode_pagata_0`) linked to specialist Account Name. This view is useful for training administrators who need to plan module delivery schedules and ensure that all specialists have access to the training relevant to their specialisation.

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

The view `v_training_module_housing_adviser_detail` joins training modules with the advisers who have completed them, providing a detailed picture of adviser training compliance. A row might show adviser Theodore Mcgrath (employer type `LCA`, 16 years experience) having completed the Compact Initiative module, delivered `face_to_face` at `introductory` level. Another row could display adviser Account Name (employer type `voluntary_agency`, 22 years experience) having completed the Legacy Model module, delivered as a `webinar` at `refresher` level. This view supports compliance reporting and helps identify advisers who may need additional training.

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

The view `v_training_module_legal_topic` connects training modules to the legal topics they cover, answering the question of what legal knowledge each module imparts. A row might show the Compact Initiative module linked to topic `lu_tax_code_template_b_VB-IC-Tab`, while another row could show the Legacy Model module linked to topic `8387534`. This view is essential for curriculum design, ensuring that training modules adequately cover the legal topics relevant to the cases they support.

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

The view `v_housing_adviser_training_module` provides a straightforward mapping of advisers to their training modules, supporting training compliance audits. A row might show adviser Theodore Mcgrath (adviser ID `2618554`, employer type `LCA`, 16 years experience) linked to the Compact Initiative module. Another row could display adviser Account Name (adviser ID `4332`, employer type `voluntary_agency`, 22 years experience) linked to the Legacy Model module. This view enables managers to verify that all advisers have completed the training required for their role.

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

The view `v_housing_adviser_housing_advisory_case` links advisers to the cases they work on, providing insight into the advisory workload distribution. A row might show adviser Theodore Mcgrath handling case `39800622`, a `homelessness_application` of `standard` priority. Another row could display adviser Account Name managing case `4891`, a `possession_proceedings` case marked `urgent`. This view supports workload balancing and helps ensure that cases are distributed fairly among advisers.

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

The view `v_housing_adviser_n_h_a_s` connects advisers to the services they operate under, mirroring the specialist-service relationship but for advisers. A row might show adviser Theodore Mcgrath deployed under service `1996925` with funding source `baseline-funding-73`. Another row could display adviser Account Name under service `3990164` with funding source `pilot-funding-74`. This view clarifies the organisational structure from the adviser perspective and supports resource planning across the multi-agency advisory network.

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

The view `v_n_h_a_s_housing_specialist_detail` provides a service-centric view of specialist deployment, joining service records with the specialists working under them. A row might show service `1996925` (funding source `baseline-funding-73`, operating under `pilot-operatin-50` hours, established 10 years ago) with specialist Theodore Mcgrath, who specialises in `homelessness_prevention` and holds `junior` certification. Another row could display service `3990164` (funding source `pilot-funding-74`, operating under `extended-operatin-51` hours, established 16 years ago) with specialist Account Name, who specialises in `housing_debt` and holds `senior` certification. This view is valuable for service managers who need to understand the composition and capability of their teams.

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

The view `v_n_h_a_s_housing_adviser_detail` provides a service-centric view of adviser deployment, joining service records with the advisers working under them. A row might show service `1996925` with adviser Theodore Mcgrath (employer type `LCA`, 16 years experience). Another row could display service `3990164` with adviser Account Name (employer type `voluntary_agency`, 22 years experience). This view supports service-level reporting and helps managers understand the experience mix of their adviser teams.

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

The view `v_n_h_a_s_training_module` links services to the training modules they support, answering the question of which training programmes are available under each service. A row might show service `1996925` linked to the Compact Initiative module, delivered `face_to_face` at `introductory` level. Another row could display service `3990164` linked to the Legacy Model module, delivered as a `webinar` at `refresher` level. This view is useful for training coordinators who need to align module availability with service funding and operational capacity.

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

The view `v_legal_topic_training_module` connects legal topics to the training modules that cover them, providing a curriculum map for the advisory service. A row might show topic `lu_tax_code_template_b_VB-IC-Tab` covered by the Compact Initiative module, while another row could show topic `8387534` covered by the Legacy Model module. This view supports curriculum planning by revealing which topics are adequately covered and which may require new or updated training modules.

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

The view `v_legal_topic_housing_advisory_case` links legal topics to the advisory cases they address, answering the question of which legal subjects are most relevant to active cases. A row might show topic `lu_tax_code_template_b_VB-IC-Tab` associated with case `39800622`, a `homelessness_application`. Another row could display topic `8387534` associated with case `4891`, a `possession_proceedings` case. This view supports case management by ensuring that advisers and specialists have access to the legal knowledge relevant to the cases they handle.

## Synthesis

The housing advisory domain is a tightly coupled ecosystem in which cases, people, training, legal topics, and services interlock to form a coherent advisory network. Housing specialists and advisers draw on training modules to address the legal topics embedded in each case, while services provide the organisational and funding framework that enables the work. The views described above serve as analytical lenses, each answering a specific operational question—from caseload distribution and training compliance to service-level resource planning. Together, they form a comprehensive reference framework for practitioners who need to understand not just individual records, but the relationships that bind them into a functioning advisory system.