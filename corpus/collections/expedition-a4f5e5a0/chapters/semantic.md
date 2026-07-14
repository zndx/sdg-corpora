The domain under examination is a polar and deep-sea expedition management system, where each expedition is a bounded temporal event carrying a team of explorers, specialized equipment, scientific observations, and geographic scope. The data model captures not only the logistics of planning and executing these missions but also the scholarly output they generate—awards, documents, and humanitarian actions—tying individual careers to institutional memory. At the conceptual level, the domain revolves around eight entity types: `expeditions`, `explorers`, `equipments`, `observations`, `geographic_areas`, `awards`, `documents`, and `humanitarian_actions`. Each entity type materializes as a base table whose primary key is a surrogate identifier, and relationships between them are expressed through foreign keys that propagate from the parent entity into the child table. The model also defines sixteen derived views that reassemble normalized rows into domain-level facts, each view answering a specific analytical question by joining two or more base tables.

**Table `expeditions`**

| expedition_id | start_date | end_date | duration_days | objective | status | team_size | region | explorer_id | equipment_id | observation_id | geographic_area_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 8189498 | 2022-09-05 | 2022-09-01 | 38 | distributed-objectiv-36 | planned | 19 | distributed-region-12 | 100 | 1 | 2986222 | 1 |
| 8387552 | 2023-02-16 | 2023-02-12 | 49 | baseline-objectiv-37 | ongoing | 23 | baseline-region-13 | 101 | 2 | 605970 | 2 |
| 6926365 | 2024-07-27 | 2024-07-23 | 60 | pilot-objectiv-38 | completed | 27 | pilot-region-14 | 102 | 3 | 6564399 | 3 |
| 3355779 | 2025-12-11 | 2025-12-07 | 71 | extended-objectiv-39 | abandoned | 31 | extended-region-15 | 103 | 4 | 9125614 | 4 |

The `expeditions` table is the central event entity. Its surrogate primary key, `expedition_id`, is a large integer such as `8189498` or `3355779`. Temporal boundaries are captured by `start_date` and `end_date` (ISO-8601 dates like `2022-09-05` and `2022-09-01`), and the computed `duration_days` column stores the span in days—`38` for the first row, `71` for the last. The `objective` column holds a short code such as `distributed-objectiv-36` or `baseline-objectiv-37`, while `status` classifies the expedition as `planned`, `ongoing`, `completed`, or `abandoned`. The `team_size` column records headcount (`19`, `23`, `27`, `31`), and `region` provides a free-text label like `distributed-region-12`. The remaining columns—`explorer_id`, `equipment_id`, `observation_id`, and `geographic_area_id`—are foreign keys that point into the `explorers`, `equipments`, `observations`, and `geographic_areas` tables respectively, establishing a one-to-one or one-to-many linkage depending on the cardinality constraints of the underlying ontology.

**Table `explorers`**

| explorer_id | full_name | birth_date | death_date | nationality | specialization | skills | expedition_id | award_id | document_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | 2023-10-18 | 2022-01-12 | composite-national-39 | zoology | legacy-skills-31 | 8189498 | 1000 | 1000 |
| 101 | Account Name | 2024-03-02 | 2023-06-23 | primary-national-40 | oceanography | compact-skills-32 | 8387552 | 1001 | 1001 |
| 102 | Saipan International Airport | 2025-08-13 | 2024-11-07 | adaptive-national-41 | exploration | composite-skills-33 | 6926365 | 1002 | 1002 |
| 103 | Norma Fisher | 2022-01-24 | 2025-04-18 | distributed-national-42 | zoology | primary-skills-34 | 3355779 | 1003 | 1003 |

The `explorers` table stores person records. Its primary key `explorer_id` (values `100` through `103`) is a compact integer. The `full_name` column carries human-readable identifiers such as `Theodore Mcgrath` and `Norma Fisher`, while `birth_date` and `death_date` are ISO dates (`2023-10-18`, `2022-01-12`). Nationality is captured in `nationality` with synthetic values like `composite-national-39`, and `specialization` records the explorer's discipline—`zoology`, `oceanography`, or `exploration`. The `skills` column holds a coded string (`legacy-skills-31`, `compact-skills-32`). Foreign keys `expedition_id`, `award_id`, and `document_id` link each explorer to their assigned expedition, any award they have received, and a document that references them.

**Table `equipments`**

| equipment_id | name | type | weight_kg | designer | status | expedition_id |
|---|---|---|---|---|---|---|
| 1 | Extended Review | sled | 1.48 | pilot-designer-50 | designed | 8189498 |
| 2 | Pilot Initiative A | sleepingBag | 0.385 | extended-designer-51 | manufactured | 8387552 |
| 3 | Baseline Model | clothing | 0.5465680900000001 | integrated-designer-52 | deployed | 6926365 |
| 4 | Distributed Cluster | cookingStove | 0.9 | seasonal-designer-53 | lost | 3355779 |

Equipment items are cataloged in `equipments`. The surrogate key `equipment_id` runs from `1` to `4`. The `name` column gives a descriptive label—`Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`—while `type` classifies the item as `sled`, `sleepingBag`, `clothing`, or `cookingStove`. The `weight_kg` column stores a decimal value (`1.48`, `0.385`, `0.5465680900000001`, `0.9`). The `designer` column holds a synthetic identifier (`pilot-designer-50`, `extended-designer-51`), and `status` tracks the lifecycle state (`designed`, `manufactured`, `deployed`, `lost`). A single foreign key `expedition_id` ties each equipment item to the expedition that deployed it.

**Table `observations`**

| observation_id | timestamp | parameter | value | unit | status | expedition_id | equipment_id |
|---|---|---|---|---|---|---|---|
| 2986222 | 2024-07-08T18:18:00 | temperature | 19.95 | distributed-unit-18 | recorded | 8189498 | 1 |
| 605970 | 2025-12-19T01:35:00 | pressure | 21.90 | baseline-unit-19 | verified | 8387552 | 2 |
| 6564399 | 2022-05-03T08:52:00 | salinity | 23.85 | pilot-unit-20 | analyzed | 6926365 | 3 |
| 9125614 | 2023-10-14T15:09:00 | location | 25.80 | extended-unit-21 | recorded | 3355779 | 4 |

Scientific observations are recorded in `observations`. The primary key `observation_id` is a large integer (`2986222`, `605970`, `6564399`, `9125614`). The `timestamp` column stores an ISO-8601 datetime (`2024-07-08T18:18:00`, `2025-12-19T01:35:00`). The `parameter` column names the measured quantity—`temperature`, `pressure`, `salinity`, `location`—and `value` holds the numeric reading (`19.95`, `21.90`, `23.85`, `25.80`). The `unit` column provides a synthetic unit label (`distributed-unit-18`, `baseline-unit-19`), while `status` records the processing state (`recorded`, `verified`, `analyzed`). Foreign keys `expedition_id` and `equipment_id` link each observation to the expedition that produced it and the instrument that measured it.

**Table `geographic_areas`**

| id | area_id | name | type | latitude | longitude | description | expedition_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | default_chart_a_tax_19 | Extended Review | coast | 13.95 | 21.20 | Extended Survey | 8189498 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | fro | Pilot Initiative A | interior | 17.90 | 25.40 | Pilot Corridor A | 8387552 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | account_pymes_296 | Baseline Model | ocean | 21.85 | 29.60 | Baseline Series | 6926365 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | port | 25.80 | 33.80 | Distributed Assessment | 3355779 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Geographic areas are stored in `geographic_areas`. The table uses a composite surrogate key consisting of `id` (an integer `1`–`4`) and `area_id` (a string such as `default_chart_a_tax_19` or `fro`). The `name` column repeats the area label (`Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`), and `type` classifies the geography as `coast`, `interior`, `ocean`, or `port`. The `latitude` and `longitude` columns store decimal coordinates (`13.95`, `21.20`, `17.90`, `25.40`). The `description` column provides a free-text summary (`Extended Survey`, `Pilot Corridor A`). Timestamps `created_at` and `updated_at` record the metadata lifecycle (`2025-01-01 00:14:00`, `2025-01-02 00:41:00`). A foreign key `expedition_id` ties each area to the expedition that mapped it.

**Table `awards`**

| id | award_id | name | year | category | reason | explorer_id | created_at |
|---|---|---|---|---|---|---|---|
| 1000 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Extended Review | 12 | Peace | distributed-reason-66 | 100 | 2025-01-01 00:14:00 |
| 1001 | 3012811 | Pilot Initiative A | 21 | Science | baseline-reason-67 | 101 | 2025-02-06 03:14:00 |
| 1002 | 15493350 | Baseline Model | 30 | Exploration | pilot-reason-68 | 102 | 2025-03-11 06:14:00 |
| 1003 | state_uk_17 | Distributed Cluster | 39 | Peace | extended-reason-69 | 103 | 2025-04-16 09:14:00 |

Awards are cataloged in `awards`. The surrogate key `id` runs from `1000` to `1003`. The `award_id` column holds a secondary identifier (`e02275d4-8fd1-11eb-924d-9cd76263cbd0`, `3012811`). The `name` column repeats the award title (`Extended Review`, `Pilot Initiative A`), and `year` stores an integer (`12`, `21`, `30`, `39`). The `category` column classifies the award as `Peace`, `Science`, or `Exploration`. The `reason` column holds a synthetic justification (`distributed-reason-66`, `baseline-reason-67`). The `explorer_id` foreign key links the award to the recipient, and `created_at` records the timestamp (`2025-01-01 00:14:00`).

**Table `documents`**

| id | document_id | name | type | issue_date | issuing_authority | recognized_by | explorer_id | action_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | IVC10I | Extended Review | passport | 2023-02-01 | extended-issuing-33 | 23 | 100 | 8250 |
| 1001 | 605943 | Pilot Initiative A | report | 2024-07-12 | integrated-issuing-34 | 32 | 101 | 450 |
| 1002 | 10449525 | Baseline Model | thesis | 2025-12-23 | seasonal-issuing-35 | 41 | 102 | 21005921 |
| 1003 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | passport | 2022-05-07 | regional-issuing-36 | 50 | 103 | 1437589 |

Documents are stored in the `documents` table. Its structure mirrors the awards table: a surrogate `id` (`1000`–`1003`), a secondary `document_id` (`e02275d4-8fd1-11eb-924d-9cd76263cbd0`, `3012811`), a `name` column (`Extended Review`, `Pilot Initiative A`), a `year` integer (`12`, `21`), a `category` (`Peace`, `Science`), a `reason` (`distributed-reason-66`, `baseline-reason-67`), an `explorer_id` foreign key, and a `created_at` timestamp. Documents serve as the scholarly output of expeditions and explorers, and they also link to humanitarian actions through the `v_document_humanitarian_action` view.

**Table `humanitarian_actions`**

| action_id | start_date | end_date | type | beneficiaries_count | status | explorer_id | document_id |
|---|---|---|---|---|---|---|---|
| 8250 | 2022-09-05 | 2022-09-01 | repatriation | 18 | planned | 100 | 1000 |
| 450 | 2023-02-16 | 2023-02-12 | refugeeAssistance | 2 | ongoing | 101 | 1001 |
| 21005921 | 2024-07-27 | 2024-07-23 | repatriation | 0 | completed | 102 | 1002 |
| 1437589 | 2025-12-11 | 2025-12-07 | refugeeAssistance | 5 | planned | 103 | 1003 |

The `humanitarian_actions` table records relief and aid activities associated with expeditions. Its structure includes a surrogate `id`, a `name` column, a `year` integer, a `category` string, a `reason` string, an `explorer_id` foreign key, and a `created_at` timestamp. Humanitarian actions are linked to explorers and to documents, enabling cross-referencing between field relief efforts and their scholarly documentation.

The foreign-key topology of the model can be summarized as follows. The `expeditions` table holds four foreign keys—`explorer_id`, `equipment_id`, `observation_id`, and `geographic_area_id`—that point into the respective entity tables. The `explorers` table holds three foreign keys—`expedition_id`, `award_id`, and `document_id`—creating a bidirectional link between expeditions and their personnel. The `equipments` table holds a single foreign key `expedition_id`. The `observations` table holds two foreign keys—`expedition_id` and `equipment_id`—forming a ternary relationship between expedition, instrument, and measurement. The `geographic_areas` table holds `expedition_id`. The `awards` and `documents` tables each hold `explorer_id`. The `humanitarian_actions` table holds `explorer_id`. This design ensures that every fact can be reconstructed by joining the appropriate tables.

The sixteen views materialize these joins into domain-level facts. Each view answers a specific analytical question by combining two or more base tables.

**View `v_expedition_explorer`**

```sql
CREATE VIEW v_expedition_explorer AS
SELECT a.expedition_id, a.start_date, a.end_date, a.duration_days, b.explorer_id AS explorer_explorer_id, b.full_name AS explorer_full_name, b.birth_date AS explorer_birth_date
FROM expeditions a JOIN explorers b ON a.explorer_id = b.explorer_id;
```

| expedition_id | start_date | end_date | duration_days | explorer_explorer_id | explorer_full_name | explorer_birth_date |
|---|---|---|---|---|---|---|
| 8189498 | 2022-09-05 | 2022-09-01 | 38 | 100 | Theodore Mcgrath | 2023-10-18 |
| 8387552 | 2023-02-16 | 2023-02-12 | 49 | 101 | Account Name | 2024-03-02 |
| 6926365 | 2024-07-27 | 2024-07-23 | 60 | 102 | Saipan International Airport | 2025-08-13 |
| 3355779 | 2025-12-11 | 2025-12-07 | 71 | 103 | Norma Fisher | 2022-01-24 |

The view `v_expedition_explorer` joins `expeditions` to `explorers` on `expedition_id = explorer_id`, producing a flat row that pairs each expedition with its assigned explorer. For example, the row with `expedition_id = 8189498` and `explorer_id = 100` tells us that Theodore Mcgrath was assigned to the expedition whose objective code is `distributed-objectiv-36` and whose status is `planned`. This view answers the question: "Which explorer is associated with which expedition?"

**View `v_expedition_equipment`**

```sql
CREATE VIEW v_expedition_equipment AS
SELECT a.expedition_id, a.start_date, a.end_date, a.duration_days, b.equipment_id AS equipment_equipment_id, b.name AS equipment_name, b.type AS equipment_type
FROM expeditions a JOIN equipments b ON a.equipment_id = b.equipment_id;
```

| expedition_id | start_date | end_date | duration_days | equipment_equipment_id | equipment_name | equipment_type |
|---|---|---|---|---|---|---|
| 8189498 | 2022-09-05 | 2022-09-01 | 38 | 1 | Extended Review | sled |
| 8387552 | 2023-02-16 | 2023-02-12 | 49 | 2 | Pilot Initiative A | sleepingBag |
| 6926365 | 2024-07-27 | 2024-07-23 | 60 | 3 | Baseline Model | clothing |
| 3355779 | 2025-12-11 | 2025-12-07 | 71 | 4 | Distributed Cluster | cookingStove |

The view `v_expedition_equipment` joins `expeditions` to `equipments` on `expedition_id`, yielding a row per expedition-equipment pair. The row showing `expedition_id = 8189498` paired with `equipment_id = 1` (name `Extended Review`, type `sled`, weight `1.48` kg) tells us that a sled was deployed on that expedition. This view answers: "What equipment was assigned to each expedition?"

**View `v_expedition_observation`**

```sql
CREATE VIEW v_expedition_observation AS
SELECT a.expedition_id, a.start_date, a.end_date, a.duration_days, b.observation_id AS observation_observation_id, b.timestamp AS observation_timestamp, b.parameter AS observation_parameter
FROM expeditions a JOIN observations b ON a.observation_id = b.observation_id;
```

| expedition_id | start_date | end_date | duration_days | observation_observation_id | observation_timestamp | observation_parameter |
|---|---|---|---|---|---|---|
| 8189498 | 2022-09-05 | 2022-09-01 | 38 | 2986222 | 2024-07-08T18:18:00 | temperature |
| 8387552 | 2023-02-16 | 2023-02-12 | 49 | 605970 | 2025-12-19T01:35:00 | pressure |
| 6926365 | 2024-07-27 | 2024-07-23 | 60 | 6564399 | 2022-05-03T08:52:00 | salinity |
| 3355779 | 2025-12-11 | 2025-12-07 | 71 | 9125614 | 2023-10-14T15:09:00 | location |

The view `v_expedition_observation` joins `expeditions` to `observations` on `expedition_id`. The row with `expedition_id = 8189498` and `observation_id = 2986222` records a `temperature` measurement of `19.95` taken on `2024-07-08T18:18:00` with status `recorded`. This view answers: "Which observations were produced during each expedition?"

**View `v_expedition_geographic_area`**

```sql
CREATE VIEW v_expedition_geographic_area AS
SELECT a.expedition_id, a.start_date, a.end_date, a.duration_days, b.id AS area_id, b.area_id AS area_area_id, b.name AS area_name
FROM expeditions a JOIN geographic_areas b ON a.geographic_area_id = b.id;
```

| expedition_id | start_date | end_date | duration_days | area_id | area_area_id | area_name |
|---|---|---|---|---|---|---|
| 8189498 | 2022-09-05 | 2022-09-01 | 38 | 1 | default_chart_a_tax_19 | Extended Review |
| 8387552 | 2023-02-16 | 2023-02-12 | 49 | 2 | fro | Pilot Initiative A |
| 6926365 | 2024-07-27 | 2024-07-23 | 60 | 3 | account_pymes_296 | Baseline Model |
| 3355779 | 2025-12-11 | 2025-12-07 | 71 | 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster |

The view `v_expedition_geographic_area` joins `expeditions` to `geographic_areas` on `expedition_id`. The row with `expedition_id = 8189498` and `area_id = default_chart_a_tax_19` describes a `coast` area named `Extended Review` at latitude `13.95`, longitude `21.20`. This view answers: "Which geographic areas were mapped by each expedition?"

**View `v_explorer_expedition`**

```sql
CREATE VIEW v_explorer_expedition AS
SELECT a.explorer_id, a.full_name, a.birth_date, a.death_date, b.expedition_id AS expedition_expedition_id, b.start_date AS expedition_start_date, b.end_date AS expedition_end_date
FROM explorers a JOIN expeditions b ON a.expedition_id = b.expedition_id;
```

| explorer_id | full_name | birth_date | death_date | expedition_expedition_id | expedition_start_date | expedition_end_date |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | 2023-10-18 | 2022-01-12 | 8189498 | 2022-09-05 | 2022-09-01 |
| 101 | Account Name | 2024-03-02 | 2023-06-23 | 8387552 | 2023-02-16 | 2023-02-12 |
| 102 | Saipan International Airport | 2025-08-13 | 2024-11-07 | 6926365 | 2024-07-27 | 2024-07-23 |
| 103 | Norma Fisher | 2022-01-24 | 2025-04-18 | 3355779 | 2025-12-11 | 2025-12-07 |

The view `v_explorer_expedition` is the inverse of `v_expedition_explorer`: it joins `explorers` to `expeditions` on `explorer_id = expedition_id`. The row with `explorer_id = 100` (Theodore Mcgrath, specialization `zoology`) paired with `expedition_id = 8189498` tells us that this explorer participated in the expedition with objective `distributed-objectiv-36`. This view answers: "Which expeditions did each explorer participate in?"

**View `v_explorer_award`**

```sql
CREATE VIEW v_explorer_award AS
SELECT a.explorer_id, a.full_name, a.birth_date, a.death_date, b.id AS award_id, b.award_id AS award_award_id, b.name AS award_name
FROM explorers a JOIN awards b ON a.award_id = b.id;
```

| explorer_id | full_name | birth_date | death_date | award_id | award_award_id | award_name |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | 2023-10-18 | 2022-01-12 | 1000 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Extended Review |
| 101 | Account Name | 2024-03-02 | 2023-06-23 | 1001 | 3012811 | Pilot Initiative A |
| 102 | Saipan International Airport | 2025-08-13 | 2024-11-07 | 1002 | 15493350 | Baseline Model |
| 103 | Norma Fisher | 2022-01-24 | 2025-04-18 | 1003 | state_uk_17 | Distributed Cluster |

The view `v_explorer_award` joins `explorers` to `awards` on `explorer_id`. The row with `explorer_id = 100` and `award_id = e02275d4-8fd1-11eb-924d-9cd76263cbd0` (name `Extended Review`, category `Peace`, year `12`) tells us that Theodore Mcgrath received this award. This view answers: "Which awards has each explorer received?"

**View `v_explorer_document`**

```sql
CREATE VIEW v_explorer_document AS
SELECT a.explorer_id, a.full_name, a.birth_date, a.death_date, b.id AS document_id, b.document_id AS document_document_id, b.name AS document_name
FROM explorers a JOIN documents b ON a.document_id = b.id;
```

| explorer_id | full_name | birth_date | death_date | document_id | document_document_id | document_name |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | 2023-10-18 | 2022-01-12 | 1000 | IVC10I | Extended Review |
| 101 | Account Name | 2024-03-02 | 2023-06-23 | 1001 | 605943 | Pilot Initiative A |
| 102 | Saipan International Airport | 2025-08-13 | 2024-11-07 | 1002 | 10449525 | Baseline Model |
| 103 | Norma Fisher | 2022-01-24 | 2025-04-18 | 1003 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster |

The view `v_explorer_document` joins `explorers` to `documents` on `explorer_id`. The row with `explorer_id = 100` and `document_id = 1000` (name `Extended Review`, year `12`, category `Peace`) tells us that Theodore Mcgrath authored or is associated with this document. This view answers: "Which documents are linked to each explorer?"

**View `v_equipment_expedition`**

```sql
CREATE VIEW v_equipment_expedition AS
SELECT a.equipment_id, a.name, a.type, a.weight_kg, b.expedition_id AS expedition_expedition_id, b.start_date AS expedition_start_date, b.end_date AS expedition_end_date
FROM equipments a JOIN expeditions b ON a.expedition_id = b.expedition_id;
```

| equipment_id | name | type | weight_kg | expedition_expedition_id | expedition_start_date | expedition_end_date |
|---|---|---|---|---|---|---|
| 1 | Extended Review | sled | 1.48 | 8189498 | 2022-09-05 | 2022-09-01 |
| 2 | Pilot Initiative A | sleepingBag | 0.385 | 8387552 | 2023-02-16 | 2023-02-12 |
| 3 | Baseline Model | clothing | 0.5465680900000001 | 6926365 | 2024-07-27 | 2024-07-23 |
| 4 | Distributed Cluster | cookingStove | 0.9 | 3355779 | 2025-12-11 | 2025-12-07 |

The view `v_equipment_expedition` is the inverse of `v_expedition_equipment`: it joins `equipments` to `expeditions` on `expedition_id`. The row with `equipment_id = 1` (name `Extended Review`, type `sled`) paired with `expedition_id = 8189498` tells us that this sled was deployed on that expedition. This view answers: "Which expedition deployed each piece of equipment?"

**View `v_observation_expedition`**

```sql
CREATE VIEW v_observation_expedition AS
SELECT a.observation_id, a.timestamp, a.parameter, a.value, b.expedition_id AS expedition_expedition_id, b.start_date AS expedition_start_date, b.end_date AS expedition_end_date
FROM observations a JOIN expeditions b ON a.expedition_id = b.expedition_id;
```

| observation_id | timestamp | parameter | value | expedition_expedition_id | expedition_start_date | expedition_end_date |
|---|---|---|---|---|---|---|
| 2986222 | 2024-07-08T18:18:00 | temperature | 19.95 | 8189498 | 2022-09-05 | 2022-09-01 |
| 605970 | 2025-12-19T01:35:00 | pressure | 21.90 | 8387552 | 2023-02-16 | 2023-02-12 |
| 6564399 | 2022-05-03T08:52:00 | salinity | 23.85 | 6926365 | 2024-07-27 | 2024-07-23 |
| 9125614 | 2023-10-14T15:09:00 | location | 25.80 | 3355779 | 2025-12-11 | 2025-12-07 |

The view `v_observation_expedition` is the inverse of `v_expedition_observation`: it joins `observations` to `expeditions` on `expedition_id`. The row with `observation_id = 2986222` (parameter `temperature`, value `19.95`) paired with `expedition_id = 8189498` tells us that this measurement was produced during that expedition. This view answers: "Which expedition produced each observation?"

**View `v_observation_equipment`**

```sql
CREATE VIEW v_observation_equipment AS
SELECT a.observation_id, a.timestamp, a.parameter, a.value, b.equipment_id AS equipment_equipment_id, b.name AS equipment_name, b.type AS equipment_type
FROM observations a JOIN equipments b ON a.equipment_id = b.equipment_id;
```

| observation_id | timestamp | parameter | value | equipment_equipment_id | equipment_name | equipment_type |
|---|---|---|---|---|---|---|
| 2986222 | 2024-07-08T18:18:00 | temperature | 19.95 | 1 | Extended Review | sled |
| 605970 | 2025-12-19T01:35:00 | pressure | 21.90 | 2 | Pilot Initiative A | sleepingBag |
| 6564399 | 2022-05-03T08:52:00 | salinity | 23.85 | 3 | Baseline Model | clothing |
| 9125614 | 2023-10-14T15:09:00 | location | 25.80 | 4 | Distributed Cluster | cookingStove |

The view `v_observation_equipment` joins `observations` to `equipments` on `equipment_id`. The row with `observation_id = 2986222` (parameter `temperature`, value `19.95`) paired with `equipment_id = 1` (name `Extended Review`, type `sled`) tells us that this measurement was taken using the sled instrument. This view answers: "Which equipment was used to produce each observation?"

**View `v_geographic_area_expedition`**

```sql
CREATE VIEW v_geographic_area_expedition AS
SELECT a.id, a.area_id, a.name, a.type, b.expedition_id AS expedition_expedition_id, b.start_date AS expedition_start_date, b.end_date AS expedition_end_date
FROM geographic_areas a JOIN expeditions b ON a.expedition_id = b.expedition_id;
```

| id | area_id | name | type | expedition_expedition_id | expedition_start_date | expedition_end_date |
|---|---|---|---|---|---|---|
| 1 | default_chart_a_tax_19 | Extended Review | coast | 8189498 | 2022-09-05 | 2022-09-01 |
| 2 | fro | Pilot Initiative A | interior | 8387552 | 2023-02-16 | 2023-02-12 |
| 3 | account_pymes_296 | Baseline Model | ocean | 6926365 | 2024-07-27 | 2024-07-23 |
| 4 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | port | 3355779 | 2025-12-11 | 2025-12-07 |

The view `v_geographic_area_expedition` is the inverse of `v_expedition_geographic_area`: it joins `geographic_areas` to `expeditions` on `expedition_id`. The row with `area_id = default_chart_a_tax_19` (name `Extended Review`, type `coast`) paired with `expedition_id = 8189498` tells us that this area was mapped by that expedition. This view answers: "Which expedition mapped each geographic area?"

**View `v_award_explorer`**

```sql
CREATE VIEW v_award_explorer AS
SELECT a.id, a.award_id, a.name, a.year, b.explorer_id AS explorer_explorer_id, b.full_name AS explorer_full_name, b.birth_date AS explorer_birth_date
FROM awards a JOIN explorers b ON a.explorer_id = b.explorer_id;
```

| id | award_id | name | year | explorer_explorer_id | explorer_full_name | explorer_birth_date |
|---|---|---|---|---|---|---|
| 1000 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Extended Review | 12 | 100 | Theodore Mcgrath | 2023-10-18 |
| 1001 | 3012811 | Pilot Initiative A | 21 | 101 | Account Name | 2024-03-02 |
| 1002 | 15493350 | Baseline Model | 30 | 102 | Saipan International Airport | 2025-08-13 |
| 1003 | state_uk_17 | Distributed Cluster | 39 | 103 | Norma Fisher | 2022-01-24 |

The view `v_award_explorer` is the inverse of `v_explorer_award`: it joins `awards` to `explorers` on `explorer_id`. The row with `award_id = e02275d4-8fd1-11eb-924d-9cd76263cbd0` (name `Extended Review`, category `Peace`, year `12`) paired with `explorer_id = 100` (Theodore Mcgrath) tells us that this award was given to Theodore Mcgrath. This view answers: "Which explorer received each award?"

**View `v_document_explorer`**

```sql
CREATE VIEW v_document_explorer AS
SELECT a.id, a.document_id, a.name, a.type, b.explorer_id AS explorer_explorer_id, b.full_name AS explorer_full_name, b.birth_date AS explorer_birth_date
FROM documents a JOIN explorers b ON a.explorer_id = b.explorer_id;
```

| id | document_id | name | type | explorer_explorer_id | explorer_full_name | explorer_birth_date |
|---|---|---|---|---|---|---|
| 1000 | IVC10I | Extended Review | passport | 100 | Theodore Mcgrath | 2023-10-18 |
| 1001 | 605943 | Pilot Initiative A | report | 101 | Account Name | 2024-03-02 |
| 1002 | 10449525 | Baseline Model | thesis | 102 | Saipan International Airport | 2025-08-13 |
| 1003 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | passport | 103 | Norma Fisher | 2022-01-24 |

The view `v_document_explorer` is the inverse of `v_explorer_document`: it joins `documents` to `explorers` on `explorer_id`. The row with `document_id = 1000` (name `Extended Review`, year `12`, category `Peace`) paired with `explorer_id = 100` (Theodore Mcgrath) tells us that this document is associated with Theodore Mcgrath. This view answers: "Which explorer is linked to each document?"

**View `v_document_humanitarian_action`**

```sql
CREATE VIEW v_document_humanitarian_action AS
SELECT a.id, a.document_id, a.name, a.type, b.action_id AS action_action_id, b.start_date AS action_start_date, b.end_date AS action_end_date
FROM documents a JOIN humanitarian_actions b ON a.action_id = b.action_id;
```

| id | document_id | name | type | action_action_id | action_start_date | action_end_date |
|---|---|---|---|---|---|---|
| 1000 | IVC10I | Extended Review | passport | 8250 | 2022-09-05 | 2022-09-01 |
| 1001 | 605943 | Pilot Initiative A | report | 450 | 2023-02-16 | 2023-02-12 |
| 1002 | 10449525 | Baseline Model | thesis | 21005921 | 2024-07-27 | 2024-07-23 |
| 1003 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster | passport | 1437589 | 2025-12-11 | 2025-12-07 |

The view `v_document_humanitarian_action` joins `documents` to `humanitarian_actions` on a shared key (typically `document_id` or `id`). This view answers the question: "Which humanitarian actions are documented by each document?" It bridges the scholarly output of expeditions with the field relief activities they supported, enabling cross-referencing between published reports and humanitarian interventions.

**View `v_humanitarian_action_explorer`**

```sql
CREATE VIEW v_humanitarian_action_explorer AS
SELECT a.action_id, a.start_date, a.end_date, a.type, b.explorer_id AS explorer_explorer_id, b.full_name AS explorer_full_name, b.birth_date AS explorer_birth_date
FROM humanitarian_actions a JOIN explorers b ON a.explorer_id = b.explorer_id;
```

| action_id | start_date | end_date | type | explorer_explorer_id | explorer_full_name | explorer_birth_date |
|---|---|---|---|---|---|---|
| 8250 | 2022-09-05 | 2022-09-01 | repatriation | 100 | Theodore Mcgrath | 2023-10-18 |
| 450 | 2023-02-16 | 2023-02-12 | refugeeAssistance | 101 | Account Name | 2024-03-02 |
| 21005921 | 2024-07-27 | 2024-07-23 | repatriation | 102 | Saipan International Airport | 2025-08-13 |
| 1437589 | 2025-12-11 | 2025-12-07 | refugeeAssistance | 103 | Norma Fisher | 2022-01-24 |

The view `v_humanitarian_action_explorer` joins `humanitarian_actions` to `explorers` on `explorer_id`. This view answers: "Which explorer was involved in each humanitarian action?" It links individual explorers to the relief and aid activities they participated in, providing a career-level view of humanitarian engagement alongside scientific work.

**View `v_humanitarian_action_document`**

```sql
CREATE VIEW v_humanitarian_action_document AS
SELECT a.action_id, a.start_date, a.end_date, a.type, b.id AS document_id, b.document_id AS document_document_id, b.name AS document_name
FROM humanitarian_actions a JOIN documents b ON a.document_id = b.id;
```

| action_id | start_date | end_date | type | document_id | document_document_id | document_name |
|---|---|---|---|---|---|---|
| 8250 | 2022-09-05 | 2022-09-01 | repatriation | 1000 | IVC10I | Extended Review |
| 450 | 2023-02-16 | 2023-02-12 | refugeeAssistance | 1001 | 605943 | Pilot Initiative A |
| 21005921 | 2024-07-27 | 2024-07-23 | repatriation | 1002 | 10449525 | Baseline Model |
| 1437589 | 2025-12-11 | 2025-12-07 | refugeeAssistance | 1003 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | Distributed Cluster |

The view `v_humanitarian_action_document` joins `humanitarian_actions` to `documents` on a shared key. This view answers: "Which document covers each humanitarian action?" It enables tracing from a humanitarian intervention back to its scholarly or administrative documentation, closing the loop between field activity and institutional record.

The materialization of this ontology into a relational schema follows a standard normalization pattern: each entity type becomes a table with a surrogate primary key, attributes become columns, and relationships become foreign keys. The cardinality of each relationship is bounded by the presence or absence of a foreign key column. A one-to-many relationship (such as one expedition to many observations) is expressed by placing the parent key (`expedition_id`) in the child table (`observations`). A many-to-one relationship (such as many observations to one equipment) is expressed similarly. The views then reassemble these normalized facts into denormalized rows that answer specific analytical questions. For example, `v_expedition_observation` joins `expeditions` and `observations` to answer "What observations were produced during expedition 8189498?" by producing a row with `expedition_id = 8189498`, `observation_id = 2986222`, `parameter = temperature`, and `value = 19.95`. This pattern of normalization followed by view-based denormalization is the core design principle of the schema: it preserves data integrity through foreign-key constraints while providing convenient analytical interfaces through the sixteen views.

In summary, the domain model captures expeditions as temporal events linked to explorers, equipment, observations, and geographic areas through foreign keys. Awards and documents are attached to explorers, and humanitarian actions are linked to both explorers and documents. The eight base tables store the normalized facts, and the sixteen views reconstruct domain-level narratives by joining these tables. Every row in every view can be traced back to specific values in the base tables—`expedition_id = 8189498`, `explorer_id = 100`, `equipment_id = 1`, `observation_id = 2986222`—ensuring that the schema is both queryable and auditable. This design supports both operational queries (e.g., "list all equipment for expedition 8189498") and analytical queries (e.g., "which explorers received Peace-category awards"), making it suitable for a comprehensive expedition management and research documentation system.