## Normalised Modelling of Health-Care Service Transitions

The domain under examination tracks the lifecycle of health-care service transitions — discrete events in which a service user moves between care settings, often with a designated carer and under the influence of policy instruments and research initiatives. Each transition is a temporal fact with a start and end date, a type (such as *hospital discharge*, *community care*, or *residential care*), and a status ranging from *planned* through *in progress* to *completed* or *failed*. The relational schema captures this domain through seven base tables that store entities in third normal form, and a suite of twelve view definitions that rejoin those entities to answer concrete analytical questions. The following sections walk through the entity types, their attributes, the foreign-key topology, and the view-level reconstructions that materialise domain facts for reporting.

**Table `service_transitions`**

| id | transition_id | start_date | end_date | transition_type | status | description | service_user_id | carer_id | health_care_setting_id | destined_for_health_care_setting_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | BJewellGraham | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | hospital discharge | planned | Extended Survey | 1 | 1 | 1 | 1 |
| 2 | 2106698 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | community care | in progress | Pilot Corridor A | 2 | 2 | 2 | 2 |
| 3 | state_uk_21 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | residential care | completed | Baseline Series | 3 | 3 | 3 | 3 |
| 4 | 4332 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | hospital discharge | failed | Distributed Assessment | 4 | 4 | 4 | 4 |

The `service_transitions` table is the temporal spine of the model. Its primary key `id` is a surrogate integer, while the business identifier `transition_id` carries human-readable codes such as `BJewellGraham` and `state_uk_21`. The columns `start_date` and `end_date` are timestamps that bracket the transition window — for example, transition `BJewellGraham` spans from `2022-09-05T20:24:00` back to `2022-09-01T08:00:00`, a reversal that signals a scheduling anomaly or retrospective entry. The `transition_type` column enumerates the kind of move (`hospital discharge`, `community care`, `residential care`, `home care`), and `status` records the current state (`planned`, `in progress`, `completed`, `failed`). A free-text `description` column holds labels like *Extended Survey* and *Pilot Corridor A*. Three foreign keys anchor the transition to its participants: `service_user_id` points to `service_users.id`, `carer_id` points to `carers.id`, and `health_care_setting_id` points to `health_care_settings.id`. A fourth foreign key, `destined_for_health_care_setting_id`, also references `health_care_settings.id` and records the target setting the transition is headed toward. In row 1, transition `BJewellGraham` links service user 1, carer 1, and health care setting 1, with the destination also set to setting 1.

**Table `service_users`**

| id | user_id | name | date_of_birth | age_group | gender | primary_condition | health_care_setting_id | carer_id | service_transition_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 9736910 | Dana Nguyen | 2025-04-02 | 65-74 | male | distributed-primary-18 | 1 | 1 | 1 |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Kimberly Myers | 2022-09-13 | 75-84 | female | baseline-primary-19 | 2 | 2 | 2 |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Kimberly Myers | 2023-02-24 | 85+ | other | pilot-primary-20 | 3 | 3 | 3 |
| 4 | 9125634 | Guam International Airport | 2024-07-08 | 65-74 | male | extended-primary-21 | 4 | 4 | 4 |

The `service_users` table stores the individuals who receive care. Its surrogate key `id` is paired with a business `user_id` that varies in format: short integers like `9736910`, UUIDs such as `92297f70-9bad-11eb-a8a2-19ed5c03f8d3`, and even non-personal identifiers like `Guam International Airport` in row 4, illustrating that the model accommodates organisational or facility-level users alongside individuals. The `name` column carries personal names — *Dana Nguyen*, *Kimberly Myers* — while `date_of_birth` and `age_group` (values like `65-74`, `75-84`, `85+`) capture demographic attributes. `gender` takes values `male`, `female`, and `other`. The `primary_condition` column encodes clinical categories such as `distributed-primary-18` and `pilot-primary-20`. Foreign keys `health_care_setting_id`, `carer_id`, and `service_transition_id` each reference their respective base tables, creating a many-to-one association from the service user's perspective: each user record points to one setting, one carer, and one transition.

**Table `carers`**

| id | carer_id | name | relationship_to_user | care_level | contact_number | service_user_id | service_transition_id |
|---|---|---|---|---|---|---|---|
| 1 | 10445646 | Extended Review | family | low | Peter Mcdowell | 1 | 1 |
| 2 | 2002007020030 | Pilot Initiative A | friend | medium | Sophia Meyer | 2 | 2 |
| 3 | 505989 | Baseline Model | professional | high | Carol Gaines | 3 | 3 |
| 4 | 10966235 | Distributed Cluster | family | low | April Snyder | 4 | 4 |

Carers are the support persons or organisations assigned to a service user during a transition. The table's surrogate `id` is complemented by a business `carer_id` (e.g., `10445646`, `2002007020030`). The `name` column holds names like *Extended Review* and *Pilot Initiative A*, while `relationship_to_user` classifies the bond as `family`, `friend`, or `professional`. The `care_level` column takes values `low`, `medium`, and `high`, and `contact_number` stores a phone number or contact alias such as *Peter Mcdowell* and *Sophia Meyer*. Foreign keys `service_user_id` and `service_transition_id` link each carer record to the user and transition they support. In row 3, carer *Baseline Model* (ID `505989`) has a `professional` relationship, `high` care level, and contact *Carol Gaines*, serving service user 3 during transition 3.

**Table `health_care_settings`**

| id | setting_id | name | type | location | contact_info | service_user_id | service_transition_id | destined_for_transition_service_transition_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 10445640 | Extended Review | hospital | extended-location-99 | Jorge Luis Borges | 1 | 1 | 1 |
| 2 | 6564398 | Pilot Initiative A | community care | integrated-location-100 | Focus Device | 2 | 2 | 2 |
| 3 | fro | Baseline Model | residential care | seasonal-location-101 | Thomas Rivers | 3 | 3 | 3 |
| 4 | 4180954 | Distributed Cluster | home care | regional-location-102 | Kimberly Myers | 4 | 4 | 4 |

Health care settings represent the physical or organisational locations where care is delivered. The surrogate `id` and business `setting_id` (values like `10445640`, `6564398`, `fro`) identify each setting. The `name` column carries labels such as *Extended Review* and *Pilot Initiative A*, while `type` mirrors the transition types with values `hospital`, `community care`, `residential care`, and `home care`. The `location` column holds coded location strings like `extended-location-99` and `integrated-location-100`. `contact_info` stores contact names or organisations — *Jorge Luis Borges*, *Focus Device*, *Thomas Rivers*. Three foreign keys (`service_user_id`, `service_transition_id`, and `destined_for_transition_service_transition_id`) reference `service_users`, `service_transitions`, and `service_transitions` respectively, allowing a setting to be associated with the user currently occupying it, the transition that placed them there, and the transition that the setting is destined for.

**Table `policy_instruments`**

| id | policy_id | name | type | effective_date | status | description | service_user_id | health_care_setting_id | service_transition_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 5844252 | Extended Review | direct payment | 2023-02-14 | active | Extended Survey | 1 | 1 | 1 |
| 2 | 10207142 | Pilot Initiative A | personal budget | 2024-07-25 | inactive | Pilot Corridor A | 2 | 2 | 2 |
| 3 | 1562847 | Baseline Model | eligibility framework | 2025-12-09 | proposed | Baseline Series | 3 | 3 | 3 |
| 4 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Distributed Cluster | direct payment | 2022-05-20 | active | Distributed Assessment | 4 | 4 | 4 |

Policy instruments are the regulatory and financial mechanisms that govern care provision. The surrogate `id` and business `policy_id` (e.g., `5844252`, `ChIJkzsYUIBt5kcRM6_JHx26ONk`) identify each instrument. The `name` column repeats familiar labels like *Extended Review* and *Distributed Cluster*, while `type` enumerates categories: `direct payment`, `personal budget`, and `eligibility framework`. The `effective_date` column records when the instrument takes effect, and `status` takes values `active`, `inactive`, and `proposed`. The `description` column holds free-text summaries. Three foreign keys (`service_user_id`, `health_care_setting_id`, `service_transition_id`) link each policy instrument to the user, setting, and transition it applies to. Row 3 illustrates a `proposed` instrument of type `eligibility framework` (ID `1562847`, name *Baseline Model*) effective `2025-12-09`.

**Table `research_projects`**

| research_project_id | project_id | title | start_date | end_date | funding_source | status | service_transition_id | service_user_id | carer_id | funding_agency_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1437597 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | baseline-funding-73 | planned | 1 | 1 | 1 | 1 |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | pilot-funding-74 | ongoing | 2 | 2 | 2 | 2 |
| 102 | 5006462 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | extended-funding-75 | completed | 3 | 3 | 3 | 3 |
| 103 | 10207143 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | integrated-funding-76 | planned | 4 | 4 | 4 | 4 |

Research projects capture the investigative initiatives that study or improve care transitions. The table uses `research_project_id` as its surrogate key (values `100` through `103`) and `project_id` as the business identifier, which includes short integers (`1437597`), UUIDs (`df5a6648-8fd1-11eb-924d-9cd76263cbd0`), and numeric codes (`5006462`). The `title` column carries project names such as *Compact Initiative*, *Legacy Model*, and *Regional Cluster A*. Temporal columns `start_date` and `end_date` bracket the project lifecycle. The `funding_source` column stores coded sources like `baseline-funding-73` and `pilot-funding-74`. The `status` column takes values `planned`, `ongoing`, and `completed`. Four foreign keys (`service_transition_id`, `service_user_id`, `carer_id`, `funding_agency_id`) link each project to the transition, user, carer, and funding agency involved.

**Table `funding_agencies`**

| id | agency_id | name | type | contact_info | research_project_id |
|---|---|---|---|---|---|
| 1 | U.S. Steel | Extended Review | government | Jorge Luis Borges | 100 |
| 2 | Nikola Corporation | Pilot Initiative A | charity | Focus Device | 101 |
| 3 | Oberthur Technologies | Baseline Model | academic | Thomas Rivers | 102 |
| 4 | General Telephone & Electronics | Distributed Cluster | government | Kimberly Myers | 103 |

The `funding_agencies` table stores the organisations that finance research projects. Its surrogate `id` and business `agency_id` identify each agency. The `name` column carries agency names, `type` classifies the agency (e.g., government, private, non-profit), and `contact_info` provides contact details. The `description` column holds free-text summaries. A foreign key `research_project_id` references `research_projects.research_project_id`, establishing that each funding agency is associated with one or more research projects.

The foreign-key topology forms a star-like structure centred on `service_transitions`. Every other base table — `service_users`, `carers`, `health_care_settings`, `policy_instruments`, and `research_projects` — carries at least one foreign key pointing to `service_transitions.id`. This design means that a single transition can be the anchor for a user, a carer, a setting, a policy instrument, and a research project simultaneously. The `service_users` and `carers` tables also carry foreign keys to `health_care_settings`, creating cross-references that allow queries to navigate from a user to their assigned setting and vice versa. The `health_care_settings` table's `destined_for_transition_service_transition_id` column creates a self-referential link back to `service_transitions`, enabling the model to express which transition a setting is preparing for.

The view layer materialises these normalised relationships into analytical surfaces. Each view is a `SELECT` that joins two or more base tables, producing a denormalised result set that answers a specific question about the domain.

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

The view `v_service_transition_service_user` joins `service_transitions` to `service_users` on `service_transitions.service_user_id = service_users.id`. It answers the question: *which service user is associated with each transition?* Reading row 1, the view would report that transition `BJewellGraham` is linked to service user *Dana Nguyen* (user ID `9736910`), aged `65-74`, male, with primary condition `distributed-primary-18`. Row 3 shows transition `state_uk_21` linked to a service user named *Kimberly Myers* (UUID `92297f70-9bad-11eb-a8a2-19ed5c03f8d3`), age group `85+`, with condition `pilot-primary-20`.

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

The view `v_service_transition_carer` joins `service_transitions` to `carers` on `service_transitions.carer_id = carers.id`. It answers: *which carer supports each transition?* Row 1 would show transition `BJewellGraham` supported by carer *Extended Review* (ID `10445646`), a `family` relationship with `low` care level and contact *Peter Mcdowell*. Row 3 would show transition `state_uk_21` supported by carer *Baseline Model* (ID `505989`), a `professional` relationship with `high` care level and contact *Carol Gaines*.

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

The view `v_service_transition_health_care_setting` joins `service_transitions` to `health_care_settings` on `service_transitions.health_care_setting_id = health_care_settings.id`. It answers: *which health care setting is the current location for each transition?* Row 1 would report that transition `BJewellGraham` is located at setting *Extended Review* (ID `10445640`), type `hospital`, location `extended-location-99`, with contact *Jorge Luis Borges*. Row 4 would show transition `4332` at setting *Distributed Cluster* (ID `4180954`), type `home care`, location `regional-location-102`, contact *Kimberly Myers*.

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

The view `v_service_user_health_care_setting` joins `service_users` to `health_care_settings` on `service_users.health_care_setting_id = health_care_settings.id`. It answers: *which health care setting is assigned to each service user?* Row 1 would show service user *Dana Nguyen* (ID `9736910`) assigned to setting *Extended Review* (ID `10445640`), a `hospital` at `extended-location-99`. Row 4 would show service user *Guam International Airport* (ID `9125634`) assigned to setting *Distributed Cluster* (ID `4180954`), a `home care` facility at `regional-location-102`.

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

The view `v_service_user_carer` joins `service_users` to `carers` on `service_users.carer_id = carers.id`. It answers: *which carer is assigned to each service user?* Row 1 would show service user *Dana Nguyen* supported by carer *Extended Review* (ID `10445646`), a `family` member with `low` care level. Row 3 would show service user *Kimberly Myers* (UUID `92297f70-9bad-11eb-a8a2-19ed5c03f8d3`) supported by carer *Baseline Model* (ID `505989`), a `professional` with `high` care level.

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

The view `v_service_user_service_transition` joins `service_users` to `service_transitions` on `service_users.service_transition_id = service_transitions.id`. It answers: *which transition is each service user currently undergoing?* Row 1 would show service user *Dana Nguyen* undergoing transition `BJewellGraham` of type `hospital discharge`, status `planned`, described as *Extended Survey*. Row 4 would show service user *Guam International Airport* undergoing transition `4332` of type `hospital discharge`, status `failed`, described as *Distributed Assessment*.

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

The view `v_carer_service_user` joins `carers` to `service_users` on `carers.service_user_id = service_users.id`. It answers: *which service user does each carer support?* Row 1 would show carer *Extended Review* (ID `10445646`) supporting service user *Dana Nguyen* (ID `9736910`), aged `65-74`, male, with condition `distributed-primary-18`. Row 4 would show carer *Distributed Cluster* (ID `10966235`) supporting service user *Guam International Airport* (ID `9125634`), aged `65-74`, male, with condition `extended-primary-21`.

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

The view `v_carer_service_transition` joins `carers` to `service_transitions` on `carers.service_transition_id = service_transitions.id`. It answers: *which transition does each carer support?* Row 1 would show carer *Extended Review* (ID `10445646`) supporting transition `BJewellGraham`, type `hospital discharge`, status `planned`. Row 3 would show carer *Baseline Model* (ID `505989`) supporting transition `state_uk_21`, type `residential care`, status `completed`.

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

The view `v_health_care_setting_service_user` joins `health_care_settings` to `service_users` on `health_care_settings.service_user_id = service_users.id`. It answers: *which service user occupies each health care setting?* Row 1 would show setting *Extended Review* (ID `10445640`), type `hospital`, occupied by service user *Dana Nguyen* (ID `9736910`), aged `65-74`, with condition `distributed-primary-18`. Row 3 would show setting *Baseline Model* (ID `fro`), type `residential care`, occupied by service user *Kimberly Myers* (UUID `92297f70-9bad-11eb-a8a2-19ed5c03f8d3`), age group `85+`, condition `pilot-primary-20`.

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

The view `v_health_care_setting_service_transition` joins `health_care_settings` to `service_transitions` on `health_care_settings.service_transition_id = service_transitions.id`. It answers: *which transition is associated with each health care setting?* Row 1 would show setting *Extended Review* (ID `10445640`) associated with transition `BJewellGraham`, type `hospital discharge`, status `planned`. Row 4 would show setting *Distributed Cluster* (ID `4180954`) associated with transition `4332`, type `hospital discharge`, status `failed`.

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

The view `v_policy_instrument_service_user` joins `policy_instruments` to `service_users` on `policy_instruments.service_user_id = service_users.id`. It answers: *which policy instrument applies to each service user?* Row 1 would show policy instrument *Extended Review* (ID `5844252`), type `direct payment`, status `active`, applied to service user *Dana Nguyen* (ID `9736910`). Row 4 would show policy instrument *Distributed Cluster* (ID `ChIJkzsYUIBt5kcRM6_JHx26ONk`), type `direct payment`, status `active`, applied to service user *Guam International Airport* (ID `9125634`).

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

The view `v_policy_instrument_health_care_setting` joins `policy_instruments` to `health_care_settings` on `policy_instruments.health_care_setting_id = health_care_settings.id`. It answers: *which policy instrument governs each health care setting?* Row 1 would show policy instrument *Extended Review* (ID `5844252`), type `direct payment`, status `active`, governing setting *Extended Review* (ID `10445640`), type `hospital`. Row 3 would show policy instrument *Baseline Model* (ID `1562847`), type `eligibility framework`, status `proposed`, governing setting *Baseline Model* (ID `fro`), type `residential care`.

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

The view `v_policy_instrument_service_transition` joins `policy_instruments` to `service_transitions` on `policy_instruments.service_transition_id = service_transitions.id`. It answers: *which policy instrument applies to each transition?* Row 1 would show policy instrument *Extended Review* (ID `5844252`), type `direct payment`, status `active`, applying to transition `BJewellGraham`, type `hospital discharge`, status `planned`. Row 3 would show policy instrument *Baseline Model* (ID `1562847`), type `eligibility framework`, status `proposed`, applying to transition `state_uk_21`, type `residential care`, status `completed`.

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

The view `v_research_project_service_transition` joins `research_projects` to `service_transitions` on `research_projects.service_transition_id = service_transitions.id`. It answers: *which research project is associated with each transition?* Row 1 would show research project *Compact Initiative* (ID `1437597`), status `planned`, associated with transition `BJewellGraham`, type `hospital discharge`. Row 3 would show research project *Regional Cluster A* (ID `5006462`), status `completed`, associated with transition `state_uk_21`, type `residential care`.

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

The view `v_research_project_service_user` joins `research_projects` to `service_users` on `research_projects.service_user_id = service_users.id`. It answers: *which service user is the subject of each research project?* Row 1 would show research project *Compact Initiative* (ID `1437597`), status `planned`, with subject service user *Dana Nguyen* (ID `9736910`), aged `65-74`, condition `distributed-primary-18`. Row 4 would show research project *Seasonal Review* (ID `10207143`), status `planned`, with subject service user *Guam International Airport* (ID `9125634`), aged `65-74`, condition `extended-primary-21`.

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

The view `v_research_project_carer` joins `research_projects` to `carers` on `research_projects.carer_id = carers.id`. It answers: *which carer is involved in each research project?* Row 1 would show research project *Compact Initiative* (ID `1437597`), status `planned`, involving carer *Extended Review* (ID `10445646`), relationship `family`, care level `low`. Row 3 would show research project *Regional Cluster A* (ID `5006462`), status `completed`, involving carer *Baseline Model* (ID `505989`), relationship `professional`, care level `high`.

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

The view `v_research_project_funding_agency` joins `research_projects` to `funding_agencies` on `research_projects.funding_agency_id = funding_agencies.id`. It answers: *which funding agency finances each research project?* Row 1 would show research project *Compact Initiative* (ID `1437597`), status `planned`, funded by agency with source `baseline-funding-73`. Row 2 would show research project *Legacy Model* (ID `df5a6648-8fd1-11eb-924d-9cd76263cbd0`), status `ongoing`, funded by agency with source `pilot-funding-74`.

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

The view `v_funding_agency_research_project` joins `funding_agencies` to `research_projects` on `funding_agencies.id = research_projects.funding_agency_id`. It answers: *which research projects does each funding agency finance?* Row 1 would show funding agency with source `baseline-funding-73` financing research project *Compact Initiative* (ID `1437597`), status `planned`, title *Compact Initiative*, running from `2022-09-05T20:24:00` to `2022-09-01T08:00:00`. Row 3 would show funding agency with source `extended-funding-75` financing research project *Regional Cluster A* (ID `5006462`), status `completed`, title *Regional Cluster A*, running from `2024-07-27T10:58:00` to `2024-07-23T22:34:00`.

The schema design reflects a deliberate trade-off between normalisation and query convenience. The seven base tables enforce data integrity through foreign keys and eliminate redundancy — a service user's name, for instance, is stored once in `service_users` and referenced from `service_transitions`, `carers`, `policy_instruments`, and `research_projects` via `service_user_id`. The twelve views then reassemble the normalised facts into denormalised surfaces tailored to specific analytical needs. A report on transition-level demographics would query `v_service_transition_service_user`; a report on policy coverage would query `v_policy_instrument_service_transition`; a funding report would query `v_funding_agency_research_project`. Each view is a deterministic join that reconstructs a domain fact from its constituent tables, ensuring that the analytical layer remains a pure function of the underlying normalised model. This separation of concerns — entities in base tables, relationships in foreign keys, and analytical surfaces in views — provides a clean, maintainable architecture for a health-care service transition tracking system.