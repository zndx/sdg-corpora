## Managing Service Transitions in Health and Social Care

The coordination of care across institutional boundaries represents one of the most complex operational challenges in modern health and social care systems. When a service user moves between care environments—whether from hospital discharge to community care, or from residential care to a home-based setting—the process involves multiple stakeholders, policy frameworks, and research-backed protocols. This chapter documents the operational architecture for tracking and managing these transitions, drawing on the records maintained across service transitions, service users, carers, health care settings, policy instruments, research projects, and funding agencies.

**Table `service_transitions`**

| id | transition_id | start_date | end_date | transition_type | status | description | service_user_id | carer_id | health_care_setting_id | destined_for_health_care_setting_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | BJewellGraham | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | hospital discharge | planned | Extended Survey | 1 | 1 | 1 | 1 |
| 2 | 2106698 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | community care | in progress | Pilot Corridor A | 2 | 2 | 2 | 2 |
| 3 | state_uk_21 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | residential care | completed | Baseline Series | 3 | 3 | 3 | 3 |
| 4 | 4332 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | hospital discharge | failed | Distributed Assessment | 4 | 4 | 4 | 4 |

Service transitions form the central operational entity in this domain. Each transition records a discrete movement of a service user from one health care setting to another, bounded by a start date and an end date. The transition type categorizes the nature of the movement: hospital discharge, community care, residential care, and home care appear across the active records. Transitions carry a status indicating their current state—planned, in progress, completed, or failed. The transition identifier serves as the primary key for cross-referencing. For example, transition `BJewellGraham` represents a planned hospital discharge for service user `9736910` (Dana Nguyen), beginning on 2022-09-05 and concluding on 2022-09-01, with the description "Extended Survey." Transition `2106698` captures an in-progress community care movement for Kimberly Myers, while `state_uk_21` records a completed residential care transition described as "Baseline Series." Notably, transition `4332` carries a failed status, illustrating that not all planned movements succeed.

**Table `service_users`**

| id | user_id | name | date_of_birth | age_group | gender | primary_condition | health_care_setting_id | carer_id | service_transition_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 9736910 | Dana Nguyen | 2025-04-02 | 65-74 | male | distributed-primary-18 | 1 | 1 | 1 |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Kimberly Myers | 2022-09-13 | 75-84 | female | baseline-primary-19 | 2 | 2 | 2 |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Kimberly Myers | 2023-02-24 | 85+ | other | pilot-primary-20 | 3 | 3 | 3 |
| 4 | 9125634 | Guam International Airport | 2024-07-08 | 65-74 | male | extended-primary-21 | 4 | 4 | 4 |

Service users are the individuals receiving care, each identified by a unique user identifier that may take the form of a numeric string, a UUID, or a longer alphanumeric token. The record captures the user's name, date of birth, age group, gender, and primary condition. Age groups span from 65–74 through 75–84 to 85+, reflecting the demographic focus on older adults. Primary conditions follow a structured naming convention such as `distributed-primary-18`, `baseline-primary-19`, `pilot-primary-20`, and `extended-primary-21`, which categorize the clinical or support needs driving the transition. Dana Nguyen (user `9736910`) falls in the 65–74 age group with condition `distributed-primary-18`, while Kimberly Myers appears twice in the dataset under different user identifiers, suggesting either duplicate records or distinct service episodes. The fourth entry, associated with user `9125634` and the name "Guam International Airport," illustrates how the dataset accommodates organizational or facility-level entries alongside individual persons.

**Table `carers`**

| id | carer_id | name | relationship_to_user | care_level | contact_number | service_user_id | service_transition_id |
|---|---|---|---|---|---|---|---|
| 1 | 10445646 | Extended Review | family | low | Peter Mcdowell | 1 | 1 |
| 2 | 2002007020030 | Pilot Initiative A | friend | medium | Sophia Meyer | 2 | 2 |
| 3 | 505989 | Baseline Model | professional | high | Carol Gaines | 3 | 3 |
| 4 | 10966235 | Distributed Cluster | family | low | April Snyder | 4 | 4 |

Carers provide the human support layer surrounding each service user. The carer record includes a carer identifier, name, relationship to the user (family, friend, or professional), and care level (low, medium, or high). Contact information is stored as a named contact person. In the active records, carer `10445646` (named "Extended Review") maintains a family relationship with low care intensity, with Peter Mcdowell listed as the contact. Carer `2002007020030` ("Pilot Initiative A") holds a friend relationship at medium care level, contacted via Sophia Meyer. The professional carer `505989` ("Baseline Model") delivers high-intensity care, with Carol Gaines as the point of contact. Carer `10966235` ("Distributed Cluster") returns to a family relationship with low care intensity, contacted by April Snyder. The distribution of care levels—low, medium, high, and low—across the four transitions demonstrates the range of support intensity required.

**Table `health_care_settings`**

| id | setting_id | name | type | location | contact_info | service_user_id | service_transition_id | destined_for_transition_service_transition_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 10445640 | Extended Review | hospital | extended-location-99 | Jorge Luis Borges | 1 | 1 | 1 |
| 2 | 6564398 | Pilot Initiative A | community care | integrated-location-100 | Focus Device | 2 | 2 | 2 |
| 3 | fro | Baseline Model | residential care | seasonal-location-101 | Thomas Rivers | 3 | 3 | 3 |
| 4 | 4180954 | Distributed Cluster | home care | regional-location-102 | Kimberly Myers | 4 | 4 | 4 |

Health care settings define the physical and organizational environments where care is delivered. Each setting carries a setting identifier, a name, a type (hospital, community care, residential care, home care), a location descriptor, and contact information. The location field uses coded descriptors such as `extended-location-99`, `integrated-location-100`, `seasonal-location-101`, and `regional-location-102`. Contact information references individuals or organizations—Jorge Luis Borges, Focus Device, Thomas Rivers, and Kimberly Myers appear as contacts across the four settings. The setting types align with the transition types: a hospital setting supports hospital discharge transitions, while community care, residential care, and home care settings correspond to their respective movement categories.

**Table `policy_instruments`**

| id | policy_id | name | type | effective_date | status | description | service_user_id | health_care_setting_id | service_transition_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 5844252 | Extended Review | direct payment | 2023-02-14 | active | Extended Survey | 1 | 1 | 1 |
| 2 | 10207142 | Pilot Initiative A | personal budget | 2024-07-25 | inactive | Pilot Corridor A | 2 | 2 | 2 |
| 3 | 1562847 | Baseline Model | eligibility framework | 2025-12-09 | proposed | Baseline Series | 3 | 3 | 3 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Distributed Cluster | direct payment | 2022-05-20 | active | Distributed Assessment | 4 | 4 | 4 |

Policy instruments establish the regulatory and financial frameworks governing service transitions. Each instrument has a policy identifier, a name, a type (direct payment, personal budget, eligibility framework), an effective date, a status (active, inactive, proposed), and a description. Policy `5844252` ("Extended Review") is an active direct payment instrument effective from 2023-02-14, described as "Extended Survey." Policy `10207142` ("Pilot Initiative A") is a personal budget instrument that is currently inactive, effective from 2024-07-25. Policy `1562847` ("Baseline Model") represents a proposed eligibility framework dated 2025-12-09. Policy `ChIJkzsYUIBt5kcRM6_JHx26ONk` ("Distributed Cluster") is an active direct payment instrument effective from 2022-05-20. The mix of statuses—active, inactive, and proposed—reflects the evolving nature of policy frameworks.

**Table `research_projects`**

| research_project_id | project_id | title | start_date | end_date | funding_source | status | service_transition_id | service_user_id | carer_id | funding_agency_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1437597 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | baseline-funding-73 | planned | 1 | 1 | 1 | 1 |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | pilot-funding-74 | ongoing | 2 | 2 | 2 | 2 |
| 102 | 5006462 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | extended-funding-75 | completed | 3 | 3 | 3 | 3 |
| 103 | 10207143 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | integrated-funding-76 | planned | 4 | 4 | 4 | 4 |

Research projects document the evidence base underpinning service transition practices. Each project carries a research project identifier, a project identifier, a title, start and end dates, a funding source, a status (planned, ongoing, completed), and references to the associated service transition, service user, carer, and funding agency. Project `1437597` ("Compact Initiative") is planned, running from 2022-09-05 to 2022-09-01, funded by `baseline-funding-73`. Project `df5a6648-8fd1-11eb-924d-9cd76263cbd0` ("Legacy Model") is ongoing, spanning 2023-02-16 to 2023-02-12, with pilot-funding-74 as its source. Project `5006462` ("Regional Cluster A") is completed, dated 2024-07-27 to 2024-07-23, funded by extended-funding-75. Project `10207143` ("Seasonal Review") is planned, running from 2025-12-11 to 2025-12-07, with integrated-funding-76. The temporal ordering of start and end dates—where end dates precede start dates—suggests a retrospective or planning-oriented recording convention.

**Table `funding_agencies`**

| id | agency_id | name | type | contact_info | research_project_id |
|---|---|---|---|---|---|
| 1 | U.S. Steel | Extended Review | government | Jorge Luis Borges | 100 |
| 2 | Nikola Corporation | Pilot Initiative A | charity | Focus Device | 101 |
| 3 | Oberthur Technologies | Baseline Model | academic | Thomas Rivers | 102 |
| 4 | General Telephone & Electronics | Distributed Cluster | government | Kimberly Myers | 103 |

Funding agencies provide the financial infrastructure for research projects. Each agency is identified by a funding agency identifier, a name, a type, and a description. The funding sources referenced in research projects—`baseline-funding-73`, `pilot-funding-74`, `extended-funding-75`, and `integrated-funding-76`—correspond to distinct agencies that allocate resources to transition-related research.

The following views synthesize the base tables into operational perspectives that answer specific coordination questions.

**View `v_service_transition_service_user`**

```sql
CREATE VIEW v_service_transition_service_user AS
SELECT a.id, a.transition_id, a.start_date, a.end_date, b.id AS user_id, b.user_id AS user_user_id, b.name AS user_name
FROM service_transitions a JOIN service_users b ON a.service_user_id = b.id;
```

| id | transition_id | start_date | end_date | user_id | user_user_id | user_name |
|---|---|---|---|---|---|---|
| 1 | BJewellGraham | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 9736910 | Dana Nguyen |
| 2 | 2106698 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Kimberly Myers |
| 3 | state_uk_21 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Kimberly Myers |
| 4 | 4332 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 9125634 | Guam International Airport |

This view joins service transitions with service users, answering which service user is associated with each transition. Row 1 links transition `BJewellGraham` to service user `9736910` (Dana Nguyen), confirming that Dana Nguyen's hospital discharge transition is tracked under that identifier. Row 2 connects transition `2106698` to Kimberly Myers (user `40c1e50ce74c42d6801b1e2f409c1cfc`), showing the community care movement is attributed to the correct individual.

**View `v_service_transition_carer`**

```sql
CREATE VIEW v_service_transition_carer AS
SELECT a.id, a.transition_id, a.start_date, a.end_date, b.id AS carer_id, b.carer_id AS carer_carer_id, b.name AS carer_name
FROM service_transitions a JOIN carers b ON a.carer_id = b.id;
```

| id | transition_id | start_date | end_date | carer_id | carer_carer_id | carer_name |
|---|---|---|---|---|---|---|
| 1 | BJewellGraham | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 10445646 | Extended Review |
| 2 | 2106698 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 2002007020030 | Pilot Initiative A |
| 3 | state_uk_21 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 505989 | Baseline Model |
| 4 | 4332 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 10966235 | Distributed Cluster |

This view associates each service transition with its assigned carer. Row 1 pairs transition `BJewellGraham` with carer `10445646` ("Extended Review"), a family carer providing low-intensity support. Row 3 links transition `state_uk_21` to carer `505989` ("Baseline Model"), a professional carer at high intensity, indicating that completed residential care transitions may require the most intensive support.

**View `v_service_transition_health_care_setting`**

```sql
CREATE VIEW v_service_transition_health_care_setting AS
SELECT a.id, a.transition_id, a.start_date, a.end_date, b.id AS setting_id, b.setting_id AS setting_setting_id, b.name AS setting_name
FROM service_transitions a JOIN health_care_settings b ON a.health_care_setting_id = b.id;
```

| id | transition_id | start_date | end_date | setting_id | setting_setting_id | setting_name |
|---|---|---|---|---|---|---|
| 1 | BJewellGraham | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 10445640 | Extended Review |
| 2 | 2106698 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 6564398 | Pilot Initiative A |
| 3 | state_uk_21 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | fro | Baseline Model |
| 4 | 4332 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 4180954 | Distributed Cluster |

This view maps transitions to their originating health care settings. Row 1 shows transition `BJewellGraham` originating from setting `10445640` ("Extended Review"), a hospital-type setting at `extended-location-99`. Row 4 connects transition `4332` to setting `4180954` ("Distributed Cluster"), a home care setting at `regional-location-102`, illustrating that failed transitions can originate from any setting type.

**View `v_service_user_health_care_setting`**

```sql
CREATE VIEW v_service_user_health_care_setting AS
SELECT a.id, a.user_id, a.name, a.date_of_birth, b.id AS setting_id, b.setting_id AS setting_setting_id, b.name AS setting_name
FROM service_users a JOIN health_care_settings b ON a.health_care_setting_id = b.id;
```

| id | user_id | name | date_of_birth | setting_id | setting_setting_id | setting_name |
|---|---|---|---|---|---|---|
| 1 | 9736910 | Dana Nguyen | 2025-04-02 | 1 | 10445640 | Extended Review |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Kimberly Myers | 2022-09-13 | 2 | 6564398 | Pilot Initiative A |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Kimberly Myers | 2023-02-24 | 3 | fro | Baseline Model |
| 4 | 9125634 | Guam International Airport | 2024-07-08 | 4 | 4180954 | Distributed Cluster |

This view links service users to their current health care settings. Row 1 places Dana Nguyen (`9736910`) in setting `10445640` ("Extended Review"), a hospital. Row 3 associates Kimberly Myers (`92297f70-9bad-11eb-a8a2-19ed5c03f8d3`) with setting `fro` ("Baseline Model"), a residential care facility at `seasonal-location-101`. This view supports queries about which setting currently houses a given service user.

**View `v_service_user_carer`**

```sql
CREATE VIEW v_service_user_carer AS
SELECT a.id, a.user_id, a.name, a.date_of_birth, b.id AS carer_id, b.carer_id AS carer_carer_id, b.name AS carer_name
FROM service_users a JOIN carers b ON a.carer_id = b.id;
```

| id | user_id | name | date_of_birth | carer_id | carer_carer_id | carer_name |
|---|---|---|---|---|---|---|
| 1 | 9736910 | Dana Nguyen | 2025-04-02 | 1 | 10445646 | Extended Review |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Kimberly Myers | 2022-09-13 | 2 | 2002007020030 | Pilot Initiative A |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Kimberly Myers | 2023-02-24 | 3 | 505989 | Baseline Model |
| 4 | 9125634 | Guam International Airport | 2024-07-08 | 4 | 10966235 | Distributed Cluster |

This view connects service users to their assigned carers. Row 1 shows Dana Nguyen (`9736910`) supported by carer `10445646` ("Extended Review"), a family member at low care intensity. Row 4 links the user associated with "Guam International Airport" to carer `10966235` ("Distributed Cluster"), also a family carer at low intensity, suggesting that lower care needs correlate with family-based support.

**View `v_service_user_service_transition`**

```sql
CREATE VIEW v_service_user_service_transition AS
SELECT a.id, a.user_id, a.name, a.date_of_birth, b.id AS transition_id, b.transition_id AS transition_transition_id, b.start_date AS transition_start_date
FROM service_users a JOIN service_transitions b ON a.service_transition_id = b.id;
```

| id | user_id | name | date_of_birth | transition_id | transition_transition_id | transition_start_date |
|---|---|---|---|---|---|---|
| 1 | 9736910 | Dana Nguyen | 2025-04-02 | 1 | BJewellGraham | 2022-09-05T20:24:00 |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Kimberly Myers | 2022-09-13 | 2 | 2106698 | 2023-02-16T03:41:00 |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Kimberly Myers | 2023-02-24 | 3 | state_uk_21 | 2024-07-27T10:58:00 |
| 4 | 9125634 | Guam International Airport | 2024-07-08 | 4 | 4332 | 2025-12-11T17:15:00 |

This view presents service users alongside their active transitions. Row 2 shows Kimberly Myers (`40c1e50ce74c42d6801b1e2f409c1cfc`) in transition `2106698` (community care, in progress), with primary condition `baseline-primary-19`. Row 3 links Kimberly Myers (`92297f70-9bad-11eb-a8a2-19ed5c03f8d3`) to transition `state_uk_21` (residential care, completed), with condition `pilot-primary-20`. The dual appearance of Kimberly Myers under different identifiers and conditions underscores the importance of tracking distinct service episodes.

**View `v_carer_service_user`**

```sql
CREATE VIEW v_carer_service_user AS
SELECT a.id, a.carer_id, a.name, a.relationship_to_user, b.id AS user_id, b.user_id AS user_user_id, b.name AS user_name
FROM carers a JOIN service_users b ON a.service_user_id = b.id;
```

| id | carer_id | name | relationship_to_user | user_id | user_user_id | user_name |
|---|---|---|---|---|---|---|
| 1 | 10445646 | Extended Review | family | 1 | 9736910 | Dana Nguyen |
| 2 | 2002007020030 | Pilot Initiative A | friend | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Kimberly Myers |
| 3 | 505989 | Baseline Model | professional | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Kimberly Myers |
| 4 | 10966235 | Distributed Cluster | family | 4 | 9125634 | Guam International Airport |

This view inverts the carer-to-user relationship, listing each carer and the service user they support. Row 1 shows carer `10445646` ("Extended Review") supporting user `9736910` (Dana Nguyen). Row 3 presents carer `505989` ("Baseline Model") supporting user `92297f70-9bad-11eb-a8a2-19ed5c03f8d3` (Kimberly Myers, age 85+), demonstrating that the highest care level is assigned to the oldest age group.

**View `v_carer_service_transition`**

```sql
CREATE VIEW v_carer_service_transition AS
SELECT a.id, a.carer_id, a.name, a.relationship_to_user, b.id AS transition_id, b.transition_id AS transition_transition_id, b.start_date AS transition_start_date
FROM carers a JOIN service_transitions b ON a.service_transition_id = b.id;
```

| id | carer_id | name | relationship_to_user | transition_id | transition_transition_id | transition_start_date |
|---|---|---|---|---|---|---|
| 1 | 10445646 | Extended Review | family | 1 | BJewellGraham | 2022-09-05T20:24:00 |
| 2 | 2002007020030 | Pilot Initiative A | friend | 2 | 2106698 | 2023-02-16T03:41:00 |
| 3 | 505989 | Baseline Model | professional | 3 | state_uk_21 | 2024-07-27T10:58:00 |
| 4 | 10966235 | Distributed Cluster | family | 4 | 4332 | 2025-12-11T17:15:00 |

This view pairs carers with the transitions they are involved in. Row 2 links carer `2002007020030` ("Pilot Initiative A") to transition `2106698` (community care, in progress), a friend relationship at medium care intensity. Row 4 associates carer `10966235` ("Distributed Cluster") with transition `4332` (hospital discharge, failed), indicating that even unsuccessful transitions involve assigned carers.

**View `v_health_care_setting_service_user`**

```sql
CREATE VIEW v_health_care_setting_service_user AS
SELECT a.id, a.setting_id, a.name, a.type, b.id AS user_id, b.user_id AS user_user_id, b.name AS user_name
FROM health_care_settings a JOIN service_users b ON a.service_user_id = b.id;
```

| id | setting_id | name | type | user_id | user_user_id | user_name |
|---|---|---|---|---|---|---|
| 1 | 10445640 | Extended Review | hospital | 1 | 9736910 | Dana Nguyen |
| 2 | 6564398 | Pilot Initiative A | community care | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Kimberly Myers |
| 3 | fro | Baseline Model | residential care | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Kimberly Myers |
| 4 | 4180954 | Distributed Cluster | home care | 4 | 9125634 | Guam International Airport |

This view maps health care settings to the service users they house. Row 1 shows setting `10445640` ("Extended Review", hospital type) housing user `9736910` (Dana Nguyen). Row 4 links setting `4180954` ("Distributed Cluster", home care type) to user `9125634`, illustrating that home care settings serve users who may not fit traditional institutional categories.

**View `v_health_care_setting_service_transition`**

```sql
CREATE VIEW v_health_care_setting_service_transition AS
SELECT a.id, a.setting_id, a.name, a.type, b.id AS transition_id, b.transition_id AS transition_transition_id, b.start_date AS transition_start_date
FROM health_care_settings a JOIN service_transitions b ON a.service_transition_id = b.id;
```

| id | setting_id | name | type | transition_id | transition_transition_id | transition_start_date |
|---|---|---|---|---|---|---|
| 1 | 10445640 | Extended Review | hospital | 1 | BJewellGraham | 2022-09-05T20:24:00 |
| 2 | 6564398 | Pilot Initiative A | community care | 2 | 2106698 | 2023-02-16T03:41:00 |
| 3 | fro | Baseline Model | residential care | 3 | state_uk_21 | 2024-07-27T10:58:00 |
| 4 | 4180954 | Distributed Cluster | home care | 4 | 4332 | 2025-12-11T17:15:00 |

This view connects health care settings to the transitions occurring within them. Row 2 shows setting `6564398` ("Pilot Initiative A", community care type) associated with transition `2106698` (community care, in progress), confirming that the setting type aligns with the transition type. Row 3 links setting `fro` ("Baseline Model", residential care) to transition `state_uk_21` (residential care, completed), demonstrating a completed movement within a matching setting type.

**View `v_policy_instrument_service_user`**

```sql
CREATE VIEW v_policy_instrument_service_user AS
SELECT a.id, a.policy_id, a.name, a.type, b.id AS user_id, b.user_id AS user_user_id, b.name AS user_name
FROM policy_instruments a JOIN service_users b ON a.service_user_id = b.id;
```

| id | policy_id | name | type | user_id | user_user_id | user_name |
|---|---|---|---|---|---|---|
| 1 | 5844252 | Extended Review | direct payment | 1 | 9736910 | Dana Nguyen |
| 2 | 10207142 | Pilot Initiative A | personal budget | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Kimberly Myers |
| 3 | 1562847 | Baseline Model | eligibility framework | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Kimberly Myers |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Distributed Cluster | direct payment | 4 | 9125634 | Guam International Airport |

This view associates policy instruments with the service users they affect. Row 1 links policy `5844252` ("Extended Review", active direct payment) to service user `9736910` (Dana Nguyen). Row 3 connects policy `1562847` ("Baseline Model", proposed eligibility framework) to user `92297f70-9bad-11eb-a8a2-19ed5c03f8d3` (Kimberly Myers, age 85+), suggesting that proposed policies may target the oldest demographic groups.

**View `v_policy_instrument_health_care_setting`**

```sql
CREATE VIEW v_policy_instrument_health_care_setting AS
SELECT a.id, a.policy_id, a.name, a.type, b.id AS setting_id, b.setting_id AS setting_setting_id, b.name AS setting_name
FROM policy_instruments a JOIN health_care_settings b ON a.health_care_setting_id = b.id;
```

| id | policy_id | name | type | setting_id | setting_setting_id | setting_name |
|---|---|---|---|---|---|---|
| 1 | 5844252 | Extended Review | direct payment | 1 | 10445640 | Extended Review |
| 2 | 10207142 | Pilot Initiative A | personal budget | 2 | 6564398 | Pilot Initiative A |
| 3 | 1562847 | Baseline Model | eligibility framework | 3 | fro | Baseline Model |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Distributed Cluster | direct payment | 4 | 4180954 | Distributed Cluster |

This view maps policy instruments to the health care settings they govern. Row 2 shows policy `10207142` ("Pilot Initiative A", inactive personal budget) applied to setting `6564398` ("Pilot Initiative A", community care type). The inactive status of this policy may explain why the associated transition `2106698` remains in progress rather than completing.

**View `v_policy_instrument_service_transition`**

```sql
CREATE VIEW v_policy_instrument_service_transition AS
SELECT a.id, a.policy_id, a.name, a.type, b.id AS transition_id, b.transition_id AS transition_transition_id, b.start_date AS transition_start_date
FROM policy_instruments a JOIN service_transitions b ON a.service_transition_id = b.id;
```

| id | policy_id | name | type | transition_id | transition_transition_id | transition_start_date |
|---|---|---|---|---|---|---|
| 1 | 5844252 | Extended Review | direct payment | 1 | BJewellGraham | 2022-09-05T20:24:00 |
| 2 | 10207142 | Pilot Initiative A | personal budget | 2 | 2106698 | 2023-02-16T03:41:00 |
| 3 | 1562847 | Baseline Model | eligibility framework | 3 | state_uk_21 | 2024-07-27T10:58:00 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Distributed Cluster | direct payment | 4 | 4332 | 2025-12-11T17:15:00 |

This view links policy instruments to the service transitions they regulate. Row 1 connects policy `5844252` ("Extended Review", active direct payment) to transition `BJewellGraham` (hospital discharge, planned). Row 4 associates policy `ChIJkzsYUIBt5kcRM6_JHx26ONk` ("Distributed Cluster", active direct payment) with transition `4332` (hospital discharge, failed), indicating that even active policies do not guarantee successful transitions.

**View `v_research_project_service_transition`**

```sql
CREATE VIEW v_research_project_service_transition AS
SELECT a.research_project_id, a.project_id, a.title, a.start_date, b.id AS transition_id, b.transition_id AS transition_transition_id, b.start_date AS transition_start_date
FROM research_projects a JOIN service_transitions b ON a.service_transition_id = b.id;
```

| research_project_id | project_id | title | start_date | transition_id | transition_transition_id | transition_start_date |
|---|---|---|---|---|---|---|
| 100 | 1437597 | Compact Initiative | 2022-09-05T20:24:00 | 1 | BJewellGraham | 2022-09-05T20:24:00 |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Model | 2023-02-16T03:41:00 | 2 | 2106698 | 2023-02-16T03:41:00 |
| 102 | 5006462 | Regional Cluster A | 2024-07-27T10:58:00 | 3 | state_uk_21 | 2024-07-27T10:58:00 |
| 103 | 10207143 | Seasonal Review | 2025-12-11T17:15:00 | 4 | 4332 | 2025-12-11T17:15:00 |

This view connects research projects to the service transitions they study. Row 100 links project `1437597` ("Compact Initiative", planned) to transition `BJewellGraham`. Row 102 associates project `5006462` ("Regional Cluster A", completed) with transition `state_uk_21`, suggesting that completed research projects may evaluate completed transitions.

**View `v_research_project_service_user`**

```sql
CREATE VIEW v_research_project_service_user AS
SELECT a.research_project_id, a.project_id, a.title, a.start_date, b.id AS user_id, b.user_id AS user_user_id, b.name AS user_name
FROM research_projects a JOIN service_users b ON a.service_user_id = b.id;
```

| research_project_id | project_id | title | start_date | user_id | user_user_id | user_name |
|---|---|---|---|---|---|---|
| 100 | 1437597 | Compact Initiative | 2022-09-05T20:24:00 | 1 | 9736910 | Dana Nguyen |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Model | 2023-02-16T03:41:00 | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Kimberly Myers |
| 102 | 5006462 | Regional Cluster A | 2024-07-27T10:58:00 | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Kimberly Myers |
| 103 | 10207143 | Seasonal Review | 2025-12-11T17:15:00 | 4 | 9125634 | Guam International Airport |

This view pairs research projects with the service users they involve. Row 101 shows project `df5a6648-8fd1-11eb-924d-9cd76263cbd0` ("Legacy Model", ongoing) involving user `40c1e50ce74c42d6801b1e2f409c1cfc` (Kimberly Myers). The ongoing status of this project aligns with the in-progress status of the associated transition `2106698`.

**View `v_research_project_carer`**

```sql
CREATE VIEW v_research_project_carer AS
SELECT a.research_project_id, a.project_id, a.title, a.start_date, b.id AS carer_id, b.carer_id AS carer_carer_id, b.name AS carer_name
FROM research_projects a JOIN carers b ON a.carer_id = b.id;
```

| research_project_id | project_id | title | start_date | carer_id | carer_carer_id | carer_name |
|---|---|---|---|---|---|---|
| 100 | 1437597 | Compact Initiative | 2022-09-05T20:24:00 | 1 | 10445646 | Extended Review |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Model | 2023-02-16T03:41:00 | 2 | 2002007020030 | Pilot Initiative A |
| 102 | 5006462 | Regional Cluster A | 2024-07-27T10:58:00 | 3 | 505989 | Baseline Model |
| 103 | 10207143 | Seasonal Review | 2025-12-11T17:15:00 | 4 | 10966235 | Distributed Cluster |

This view links research projects to the carers involved in the transitions under study. Row 100 connects project `1437597` ("Compact Initiative") to carer `10445646` ("Extended Review"), a family carer at low intensity. Row 103 associates project `10207143` ("Seasonal Review") with carer `10966235` ("Distributed Cluster"), also a family carer at low intensity, suggesting that research projects may focus on lower-intensity care scenarios.

**View `v_research_project_funding_agency`**

```sql
CREATE VIEW v_research_project_funding_agency AS
SELECT a.research_project_id, a.project_id, a.title, a.start_date, b.id AS agency_id, b.agency_id AS agency_agency_id, b.name AS agency_name
FROM research_projects a JOIN funding_agencies b ON a.funding_agency_id = b.id;
```

| research_project_id | project_id | title | start_date | agency_id | agency_agency_id | agency_name |
|---|---|---|---|---|---|---|
| 100 | 1437597 | Compact Initiative | 2022-09-05T20:24:00 | 1 | U.S. Steel | Extended Review |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Model | 2023-02-16T03:41:00 | 2 | Nikola Corporation | Pilot Initiative A |
| 102 | 5006462 | Regional Cluster A | 2024-07-27T10:58:00 | 3 | Oberthur Technologies | Baseline Model |
| 103 | 10207143 | Seasonal Review | 2025-12-11T17:15:00 | 4 | General Telephone & Electronics | Distributed Cluster |

This view maps research projects to their funding agencies. Row 100 shows project `1437597` ("Compact Initiative") funded by agency `1` (`baseline-funding-73`). Row 102 links project `5006462` ("Regional Cluster A") to agency `3` (`extended-funding-75`), demonstrating the one-to-one funding relationship between agencies and projects.

**View `v_funding_agency_research_project`**

```sql
CREATE VIEW v_funding_agency_research_project AS
SELECT a.id, a.agency_id, a.name, a.type, b.research_project_id AS project_research_project_id, b.project_id AS project_project_id, b.title AS project_title
FROM funding_agencies a JOIN research_projects b ON a.research_project_id = b.research_project_id;
```

| id | agency_id | name | type | project_research_project_id | project_project_id | project_title |
|---|---|---|---|---|---|---|
| 1 | U.S. Steel | Extended Review | government | 100 | 1437597 | Compact Initiative |
| 2 | Nikola Corporation | Pilot Initiative A | charity | 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Model |
| 3 | Oberthur Technologies | Baseline Model | academic | 102 | 5006462 | Regional Cluster A |
| 4 | General Telephone & Electronics | Distributed Cluster | government | 103 | 10207143 | Seasonal Review |

This view inverts the funding relationship, listing each funding agency and the research projects it supports. Row 1 shows agency `1` (`baseline-funding-73`) funding project `1437597` ("Compact Initiative"). Row 2 presents agency `2` (`pilot-funding-74`) funding project `df5a6648-8fd1-11eb-924d-9cd76263cbd0` ("Legacy Model"), confirming that each funding agency supports a single research project in the current dataset.

## Synthesis

The operational architecture for managing service transitions integrates seven base tables and twenty-one derived views into a coherent system for tracking care movements. Service transitions anchor the data model, linking service users, carers, and health care settings through shared identifiers. Policy instruments provide the regulatory context, while research projects and funding agencies document the evidence and financial infrastructure supporting transition practices. The views enable practitioners to query the system from multiple angles—identifying which carer supports a given user, which policy governs a specific transition, or which research project evaluates a particular care movement. Together, these records form a comprehensive operational picture of health and social care service transitions, supporting coordination, accountability, and continuous improvement across care settings.