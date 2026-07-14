## Ontology-Grounded Relational Modelling of the School Public Health Domain

The domain under examination concerns the administration of public health oversight within school systems, where nurses, school boards, individual schools, infection prevention events, and compliance measures form a tightly coupled operational graph. At the conceptual level, five entity types exist: `public_health_nurses`, `schools`, `school_boards`, `outbreaks`, and `i_p_a_c_measures`. These are linked through a mix of direct foreign-key relationships and a many-to-many junction table, `boards_schools`, which decouples the board-to-school association so that a single board may govern multiple schools and a school may report to multiple boards. The relational schema materialises this ontology by assigning each entity a dedicated table, encoding attributes as columns, and representing relationships through foreign keys and a junction table. The following sections walk through each table, its columns, and the cardinality constraints they enforce, then interpret every view as a reconstructed domain fact.

**Table `public_health_nurses`**

| id | nurse_id | full_name | license_number | contact_phone | email | status | school_id | board_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 6969414 | Theodore Mcgrath | LIC-2589 | Joe Tsai | seasonal-email-11 | active | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Account Name | LIC-2596 | Stephanie Collins | regional-email-12 | inactive | 2 | 168553 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 1250196 | Saipan International Airport | LIC-2603 | Tasha Rodriguez | legacy-email-13 | on_leave | 3 | 5006454 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 9125616 | Norma Fisher | LIC-2610 | Walter Pratt | compact-email-14 | active | 4 | 1437585 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `public_health_nurses` table is the primary entity for the nursing workforce. Its surrogate primary key `id` is an auto-incrementing integer, while the business identifier `nurse_id` carries a UUID or numeric code — for instance, `6969414` for Theodore Mcgrath and `2b2bb518-8fcd-11eb-924d-9cd76263cbd0` for the record labelled Account Name. The column `full_name` stores the nurse's name, `license_number` holds the professional licence (e.g. `LIC-2589`), and `contact_phone` and `email` provide reachability. The `status` column is a categorical attribute with values such as `active`, `inactive`, and `on_leave`, as seen in rows 1 through 4. The columns `school_id` and `board_id` are foreign keys that anchor a nurse to a specific school and a school board respectively, establishing a bounded cardinality: each nurse is assigned to exactly one school and one board. Timestamps `created_at` and `updated_at` record the lifecycle of the nurse record, with row 1 showing creation on `2025-01-01` and an update on `2025-01-02`.

**Table `schools`**

| id | school_id | school_name | address | board_id | risk_level | ipac_compliant | last_assessment_date | public_health_nurse_id | part_of_board_id | outbreak_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | distributed-address-72 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | low | false | 2025-12-11 | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | bhavenger |
| 2 | 1186099 | Integrated Framework | baseline-address-73 | 168553 | medium | true | 2022-05-22 | 2 | 168553 | 1186096 |
| 3 | 7441154 | Extended Protocol D | pilot-address-74 | 5006454 | high | false | 2023-10-06 | 3 | 5006454 | 9085242 |
| 4 | 338514 | Pilot Programme | extended-address-75 | 1437585 | low | true | 2024-03-17 | 4 | 1437585 | gd_taxc_1211 |

The `schools` table models each educational institution. Its surrogate key `id` is an integer, while `school_id` serves as the business identifier (e.g. `1152671` for Seasonal Standard). The `school_name` column carries the human-readable name, `address` stores the location string, and `board_id` is a foreign key pointing to the governing `school_boards` record. The `risk_level` column is an enumerated attribute with values `low`, `medium`, and `high`, as demonstrated by the four rows. The boolean `ipac_compliant` flag indicates whether the school meets infection prevention and control standards. `last_assessment_date` records the date of the most recent compliance assessment. The foreign key `public_health_nurse_id` links the school to its assigned nurse, while `part_of_board_id` provides a secondary board linkage, and `outbreak_id` references the `outbreaks` table to associate a school with a specific outbreak event. Row 1 (Seasonal Standard) has `risk_level = low`, `ipac_compliant = false`, and is linked to outbreak `bhavenger`.

**Table `school_boards`**

| board_id | board_name | jurisdiction | contact_email | contact_phone | program_manager_name | program_manager_phone | public_health_nurse_id |
|---|---|---|---|---|---|---|---|
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | regional-jurisdic-30 | Christopher Wilson | Joe Tsai | Integrated Protocol A | distributed-program-18 | 1 |
| 168553 | Legacy Assessment | legacy-jurisdic-31 | Charles Larsen | Stephanie Collins | Extended Programme | baseline-program-19 | 2 |
| 5006454 | Regional Survey A | compact-jurisdic-32 | Mary Alvarez | Tasha Rodriguez | Pilot Standard | pilot-program-20 | 3 |
| 1437585 | Seasonal Corridor | composite-jurisdic-33 | April Snyder | Walter Pratt | Baseline Framework D | extended-program-21 | 4 |

The `school_boards` table represents the administrative bodies that oversee schools. Its primary key `board_id` is a string identifier (e.g. `ChIJH2V4UYBt5kcR5doeFwuU7Ns` for Compact Series). The `board_name` column stores the board's name, `jurisdiction` describes its geographic or functional scope, and `contact_email` and `contact_phone` provide administrative reachability. The `program_manager_name` and `program_manager_phone` columns identify the responsible programme manager. The foreign key `public_health_nurse_id` links each board to a nurse, establishing a one-to-one association between a board and its overseeing nurse. Row 1 shows Compact Series with programme manager Integrated Protocol A and nurse id `1`.

**Table `outbreaks`**

| outbreak_id | start_date | end_date | case_count | status | location | school_id | public_health_nurse_id | created_at |
|---|---|---|---|---|---|---|---|---|
| bhavenger | 2022-09-05 | 2022-09-01 | 88 | active | extended-location-99 | 1 | 1 | 2025-01-01 00:14:00 |
| 1186096 | 2023-02-16 | 2023-02-12 | 12 | contained | integrated-location-100 | 2 | 2 | 2025-02-06 03:14:00 |
| 9085242 | 2024-07-27 | 2024-07-23 | 10 | resolved | seasonal-location-101 | 3 | 3 | 2025-03-11 06:14:00 |
| gd_taxc_1211 | 2025-12-11 | 2025-12-07 | 4 | active | regional-location-102 | 4 | 4 | 2025-04-16 09:14:00 |

The `outbreaks` table captures infection events. Its primary key `outbreak_id` is a string (e.g. `bhavenger`, `1186096`). The `start_date` and `end_date` columns record the temporal bounds of the outbreak, `case_count` is an integer indicating the number of cases (88 for `bhavenger`, 4 for `gd_taxc_1211`), and `status` is a categorical field with values `active`, `contained`, and `resolved`. The `location` column stores a location descriptor, while `school_id` and `public_health_nurse_id` are foreign keys linking the outbreak to the affected school and the responsible nurse. The `created_at` timestamp records when the outbreak record was created. Row 1 (bhavenger) shows 88 cases, status `active`, and is linked to school `1` and nurse `1`.

**Table `i_p_a_c_measures`**

| id | measure_id | measure_name | description | implementation_date | compliance_status | last_reviewed_date | school_id | public_health_nurse_id |
|---|---|---|---|---|---|---|---|---|
| 1 | invoice | Baseline Framework D | Extended Survey | 2024-11-14 | compliant | 2024-11-22 | 1 | 1 |
| 2 | 4180944 | Distributed Protocol | Pilot Corridor A | 2025-04-25 | non_compliant | 2025-04-06 | 2 | 2 |
| 3 | 6969441 | Adaptive Programme | Baseline Series | 2022-09-09 | pending_review | 2022-09-17 | 3 | 3 |
| 4 | 21280358 | Primary Standard A | Distributed Assessment | 2023-02-20 | compliant | 2023-02-01 | 4 | 4 |

The `i_p_a_c_measures` table models infection prevention and control measures implemented at schools. Its surrogate key `id` is an integer, while `measure_id` is the business identifier (e.g. `invoice`, `4180944`). The `measure_name` column stores the measure's name (e.g. `Baseline Framework D`), and `description` provides additional detail. The `implementation_date` records when the measure was put in place, and `compliance_status` is a categorical attribute with values `compliant`, `non_compliant`, and `pending_review`. The `last_reviewed_date` tracks the most recent review. Foreign keys `school_id` and `public_health_nurse_id` link the measure to the school where it is implemented and the nurse responsible for oversight. Row 1 has measure `Baseline Framework D` with status `compliant` and implementation date `2024-11-14`.

**Table `boards_schools`**

| board_id | school_id |
|---|---|
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | 1 |
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2 |
| 168553 | 2 |
| 168553 | 3 |
| 5006454 | 3 |
| 5006454 | 4 |
| 1437585 | 4 |
| 1437585 | 1 |

The `boards_schools` table is the junction table that resolves the many-to-many relationship between `school_boards` and `schools`. Its composite key consists of `board_id` and `school_id`, each of which is a foreign key referencing the respective parent table. This table decouples the direct board-to-school linkage, allowing a board to govern multiple schools and a school to belong to multiple boards. The data shows that board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` governs schools `1` and `2`, while board `1437585` (Seasonal Corridor) governs schools `4` and `1`. This junction table is essential for queries that need to enumerate all schools under a board or all boards associated with a school.

With the base tables established, the views materialise domain facts by joining these normalised tables. Each view answers a specific analytical question by reconstructing a coherent record from the underlying entities.

**View `vw_public_health_nurse_school`**

```sql
CREATE VIEW vw_public_health_nurse_school AS
SELECT a.id, a.nurse_id, a.full_name, a.license_number, b.id AS school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM public_health_nurses a JOIN schools b ON a.school_id = b.id;
```

| id | nurse_id | full_name | license_number | school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|---|
| 1 | 6969414 | Theodore Mcgrath | LIC-2589 | 1 | 1152671 | Seasonal Standard |
| 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Account Name | LIC-2596 | 2 | 1186099 | Integrated Framework |
| 3 | 1250196 | Saipan International Airport | LIC-2603 | 3 | 7441154 | Extended Protocol D |
| 4 | 9125616 | Norma Fisher | LIC-2610 | 4 | 338514 | Pilot Programme |

The view `vw_public_health_nurse_school` joins `public_health_nurses` with `schools` on the nurse's `school_id` to answer the question: which school is each public health nurse assigned to? The result presents the nurse's identifying and contact attributes alongside the school's name, risk level, and compliance status. Reading row 1, Theodore Mcgrath (nurse id `6969414`, licence `LIC-2589`, status `active`) is assigned to school `1152671` (Seasonal Standard), which has risk level `low` and is not IPAC compliant. Row 2 shows Account Name (licence `LIC-2596`, status `inactive`) linked to school `1186099` (Integrated Framework) with risk level `medium` and IPAC compliance `true`. This view is useful for auditing nurse-to-school assignments and assessing whether staffing aligns with risk profiles.

**View `vw_public_health_nurse_school_board`**

```sql
CREATE VIEW vw_public_health_nurse_school_board AS
SELECT a.id, a.nurse_id, a.full_name, a.license_number, b.board_id AS board_board_id, b.board_name AS board_board_name, b.jurisdiction AS board_jurisdiction
FROM public_health_nurses a JOIN school_boards b ON a.board_id = b.board_id;
```

| id | nurse_id | full_name | license_number | board_board_id | board_board_name | board_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | 6969414 | Theodore Mcgrath | LIC-2589 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | regional-jurisdic-30 |
| 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Account Name | LIC-2596 | 168553 | Legacy Assessment | legacy-jurisdic-31 |
| 3 | 1250196 | Saipan International Airport | LIC-2603 | 5006454 | Regional Survey A | compact-jurisdic-32 |
| 4 | 9125616 | Norma Fisher | LIC-2610 | 1437585 | Seasonal Corridor | composite-jurisdic-33 |

The view `vw_public_health_nurse_school_board` extends the nurse-school join by additionally joining `school_boards` to answer: which board governs the nurse's school? The result combines nurse attributes, school attributes, and board attributes into a single row. Row 1 shows Theodore Mcgrath assigned to school `1152671` (Seasonal Standard, risk `low`), which is governed by board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` (Compact Series, jurisdiction `regional-jurisdic-30`, programme manager Integrated Protocol A). Row 3 shows Saipan International Airport (nurse id `1250196`, licence `LIC-2603`, status `on_leave`) at school `7441154` (Extended Protocol D, risk `high`), governed by board `5006454` (Regional Survey A, jurisdiction `compact-jurisdic-32`). This view supports cross-functional reporting that spans the nurse, school, and board layers.

**View `vw_school_public_health_nurse`**

```sql
CREATE VIEW vw_school_public_health_nurse AS
SELECT a.id, a.school_id, a.school_name, a.address, b.id AS nurse_id, b.nurse_id AS nurse_nurse_id, b.full_name AS nurse_full_name
FROM schools a JOIN public_health_nurses b ON a.public_health_nurse_id = b.id;
```

| id | school_id | school_name | address | nurse_id | nurse_nurse_id | nurse_full_name |
|---|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | distributed-address-72 | 1 | 6969414 | Theodore Mcgrath |
| 2 | 1186099 | Integrated Framework | baseline-address-73 | 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Account Name |
| 3 | 7441154 | Extended Protocol D | pilot-address-74 | 3 | 1250196 | Saipan International Airport |
| 4 | 338514 | Pilot Programme | extended-address-75 | 4 | 9125616 | Norma Fisher |

The view `vw_school_public_health_nurse` joins `schools` with `public_health_nurses` to answer the inverse question: which nurse is assigned to each school? The result presents school attributes alongside the nurse's name, licence, and status. Row 1 shows school `1152671` (Seasonal Standard, risk `low`, IPAC compliant `false`) with assigned nurse Theodore Mcgrath (licence `LIC-2589`, status `active`). Row 3 shows school `7441154` (Extended Protocol D, risk `high`, IPAC compliant `false`) with nurse Saipan International Airport (licence `LIC-2603`, status `on_leave`). This view is particularly useful for school administrators who need to identify their assigned nurse and verify staffing status.

**View `vw_school_school_board`**

```sql
CREATE VIEW vw_school_school_board AS
SELECT a.id, a.school_id, a.school_name, a.address, b.board_id AS board_board_id, b.board_name AS board_board_name, b.jurisdiction AS board_jurisdiction
FROM schools a JOIN school_boards b ON a.part_of_board_id = b.board_id;
```

| id | school_id | school_name | address | board_board_id | board_board_name | board_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | distributed-address-72 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | regional-jurisdic-30 |
| 2 | 1186099 | Integrated Framework | baseline-address-73 | 168553 | Legacy Assessment | legacy-jurisdic-31 |
| 3 | 7441154 | Extended Protocol D | pilot-address-74 | 5006454 | Regional Survey A | compact-jurisdic-32 |
| 4 | 338514 | Pilot Programme | extended-address-75 | 1437585 | Seasonal Corridor | composite-jurisdic-33 |

The view `vw_school_school_board` joins `schools` with `school_boards` to answer: which board governs each school? The result combines school attributes with board-level contact and programme information. Row 1 shows school `1152671` (Seasonal Standard, risk `low`) governed by board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` (Compact Series, contact email `Christopher Wilson`, programme manager Integrated Protocol A). Row 2 shows school `1186099` (Integrated Framework, risk `medium`, IPAC compliant `true`) governed by board `168553` (Legacy Assessment, contact email `Charles Larsen`, programme manager Extended Programme). This view supports governance queries and board-level reporting.

**View `vw_school_outbreak`**

```sql
CREATE VIEW vw_school_outbreak AS
SELECT a.id, a.school_id, a.school_name, a.address, b.outbreak_id AS outbreak_outbreak_id, b.start_date AS outbreak_start_date, b.end_date AS outbreak_end_date
FROM schools a JOIN outbreaks b ON a.outbreak_id = b.outbreak_id;
```

| id | school_id | school_name | address | outbreak_outbreak_id | outbreak_start_date | outbreak_end_date |
|---|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | distributed-address-72 | bhavenger | 2022-09-05 | 2022-09-01 |
| 2 | 1186099 | Integrated Framework | baseline-address-73 | 1186096 | 2023-02-16 | 2023-02-12 |
| 3 | 7441154 | Extended Protocol D | pilot-address-74 | 9085242 | 2024-07-27 | 2024-07-23 |
| 4 | 338514 | Pilot Programme | extended-address-75 | gd_taxc_1211 | 2025-12-11 | 2025-12-07 |

The view `vw_school_outbreak` joins `schools` with `outbreaks` to answer: which outbreak is associated with each school, and what are its details? The result presents school attributes alongside outbreak temporal and case information. Row 1 shows school `1152671` (Seasonal Standard, risk `low`) linked to outbreak `bhavenger`, which started on `2022-09-05`, ended on `2022-09-01`, had 88 cases, and has status `active`. Row 3 shows school `7441154` (Extended Protocol D, risk `high`) linked to outbreak `9085242`, which started on `2024-07-27`, had 10 cases, and has status `resolved`. This view is critical for outbreak tracking and risk assessment, as it directly correlates school risk levels with active outbreak events.

**View `vw_school_board_public_health_nurse`**

```sql
CREATE VIEW vw_school_board_public_health_nurse AS
SELECT a.board_id, a.board_name, a.jurisdiction, a.contact_email, b.id AS nurse_id, b.nurse_id AS nurse_nurse_id, b.full_name AS nurse_full_name
FROM school_boards a JOIN public_health_nurses b ON a.public_health_nurse_id = b.id;
```

| board_id | board_name | jurisdiction | contact_email | nurse_id | nurse_nurse_id | nurse_full_name |
|---|---|---|---|---|---|---|
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | regional-jurisdic-30 | Christopher Wilson | 1 | 6969414 | Theodore Mcgrath |
| 168553 | Legacy Assessment | legacy-jurisdic-31 | Charles Larsen | 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Account Name |
| 5006454 | Regional Survey A | compact-jurisdic-32 | Mary Alvarez | 3 | 1250196 | Saipan International Airport |
| 1437585 | Seasonal Corridor | composite-jurisdic-33 | April Snyder | 4 | 9125616 | Norma Fisher |

The view `vw_school_board_public_health_nurse` joins `schools`, `school_boards`, and `public_health_nurses` to answer: for each school, which board governs it and which nurse is assigned to that board? The result combines all three entity types into a single row. Row 1 shows school `1152671` (Seasonal Standard, risk `low`) governed by board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` (Compact Series) with nurse Theodore Mcgrath (licence `LIC-2589`, status `active`). Row 4 shows school `338514` (Pilot Programme, risk `low`, IPAC compliant `true`) governed by board `1437585` (Seasonal Corridor) with nurse Norma Fisher (licence `LIC-2610`, status `active`). This view supports comprehensive oversight reporting that spans the full governance chain.

**View `vw_school_board_school_detail`**

```sql
CREATE VIEW vw_school_board_school_detail AS
SELECT a.board_id, a.board_name, a.jurisdiction, b.id AS school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM school_boards a
  JOIN boards_schools j ON j.board_id = a.board_id
  JOIN schools b ON b.id = j.school_id;
```

| board_id | board_name | jurisdiction | school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | regional-jurisdic-30 | 1 | 1152671 | Seasonal Standard |
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | regional-jurisdic-30 | 2 | 1186099 | Integrated Framework |
| 168553 | Legacy Assessment | legacy-jurisdic-31 | 2 | 1186099 | Integrated Framework |
| 168553 | Legacy Assessment | legacy-jurisdic-31 | 3 | 7441154 | Extended Protocol D |
| 5006454 | Regional Survey A | compact-jurisdic-32 | 3 | 7441154 | Extended Protocol D |
| 5006454 | Regional Survey A | compact-jurisdic-32 | 4 | 338514 | Pilot Programme |
| 1437585 | Seasonal Corridor | composite-jurisdic-33 | 4 | 338514 | Pilot Programme |
| 1437585 | Seasonal Corridor | composite-jurisdic-33 | 1 | 1152671 | Seasonal Standard |

The view `vw_school_board_school_detail` joins `schools` with `school_boards` and the junction table `boards_schools` to answer: which schools belong to each board, with full school detail? This view effectively materialises the many-to-many relationship resolved by `boards_schools`, presenting each board-school pairing with complete school information. Row 1 shows board `ChIJH2V4UYBt5kcR5doeFwuU7Ns` (Compact Series) governing school `1152671` (Seasonal Standard, risk `low`). Row 3 shows board `168553` (Legacy Assessment) governing school `1186099` (Integrated Framework, risk `medium`, IPAC compliant `true`). Row 6 shows board `5006454` (Regional Survey A) governing school `338514` (Pilot Programme, risk `low`). This view is essential for board-level school enumeration and capacity planning.

**View `vw_outbreak_school`**

```sql
CREATE VIEW vw_outbreak_school AS
SELECT a.outbreak_id, a.start_date, a.end_date, a.case_count, b.id AS school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM outbreaks a JOIN schools b ON a.school_id = b.id;
```

| outbreak_id | start_date | end_date | case_count | school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|---|
| bhavenger | 2022-09-05 | 2022-09-01 | 88 | 1 | 1152671 | Seasonal Standard |
| 1186096 | 2023-02-16 | 2023-02-12 | 12 | 2 | 1186099 | Integrated Framework |
| 9085242 | 2024-07-27 | 2024-07-23 | 10 | 3 | 7441154 | Extended Protocol D |
| gd_taxc_1211 | 2025-12-11 | 2025-12-07 | 4 | 4 | 338514 | Pilot Programme |

The view `vw_outbreak_school` joins `outbreaks` with `schools` to answer: which school is affected by each outbreak, and what is the school's risk profile? The result presents outbreak attributes alongside school-level detail. Row 1 shows outbreak `bhavenger` (88 cases, status `active`, location `extended-location-99`) affecting school `1152671` (Seasonal Standard, risk `low`, IPAC compliant `false`). Row 4 shows outbreak `gd_taxc_1211` (4 cases, status `active`, location `regional-location-102`) affecting school `338514` (Pilot Programme, risk `low`, IPAC compliant `true`). This view supports outbreak response coordination by correlating outbreak severity with school risk levels.

**View `vw_outbreak_public_health_nurse`**

```sql
CREATE VIEW vw_outbreak_public_health_nurse AS
SELECT a.outbreak_id, a.start_date, a.end_date, a.case_count, b.id AS nurse_id, b.nurse_id AS nurse_nurse_id, b.full_name AS nurse_full_name
FROM outbreaks a JOIN public_health_nurses b ON a.public_health_nurse_id = b.id;
```

| outbreak_id | start_date | end_date | case_count | nurse_id | nurse_nurse_id | nurse_full_name |
|---|---|---|---|---|---|---|
| bhavenger | 2022-09-05 | 2022-09-01 | 88 | 1 | 6969414 | Theodore Mcgrath |
| 1186096 | 2023-02-16 | 2023-02-12 | 12 | 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Account Name |
| 9085242 | 2024-07-27 | 2024-07-23 | 10 | 3 | 1250196 | Saipan International Airport |
| gd_taxc_1211 | 2025-12-11 | 2025-12-07 | 4 | 4 | 9125616 | Norma Fisher |

The view `vw_outbreak_public_health_nurse` joins `outbreaks` with `public_health_nurses` to answer: which nurse is responsible for managing each outbreak? The result presents outbreak attributes alongside nurse identifying and contact information. Row 1 shows outbreak `bhavenger` (88 cases, status `active`) managed by nurse Theodore Mcgrath (licence `LIC-2589`, status `active`, email `seasonal-email-11`). Row 3 shows outbreak `9085242` (10 cases, status `resolved`) managed by nurse Saipan International Airport (licence `LIC-2603`, status `on_leave`). This view is critical for outbreak accountability and resource allocation, as it directly links outbreak events to the responsible nurse.

**View `vw_i_p_a_c_measure_school`**

```sql
CREATE VIEW vw_i_p_a_c_measure_school AS
SELECT a.id, a.measure_id, a.measure_name, a.description, b.id AS school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM i_p_a_c_measures a JOIN schools b ON a.school_id = b.id;
```

| id | measure_id | measure_name | description | school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|---|
| 1 | invoice | Baseline Framework D | Extended Survey | 1 | 1152671 | Seasonal Standard |
| 2 | 4180944 | Distributed Protocol | Pilot Corridor A | 2 | 1186099 | Integrated Framework |
| 3 | 6969441 | Adaptive Programme | Baseline Series | 3 | 7441154 | Extended Protocol D |
| 4 | 21280358 | Primary Standard A | Distributed Assessment | 4 | 338514 | Pilot Programme |

The view `vw_i_p_a_c_measure_school` joins `i_p_a_c_measures` with `schools` to answer: which school has each IPAC measure implemented, and what is the compliance status? The result presents measure attributes alongside school-level detail. Row 1 shows measure `Baseline Framework D` (description `Extended Survey`, implemented `2024-11-14`, status `compliant`) at school `1152671` (Seasonal Standard, risk `low`). Row 2 shows measure `Distributed Protocol` (description `Pilot Corridor A`, implemented `2025-04-25`, status `non_compliant`) at school `1186099` (Integrated Framework, risk `medium`, IPAC compliant `true`). This view supports compliance auditing by correlating measure status with school risk levels.

**View `vw_i_p_a_c_measure_public_health_nurse`**

```sql
CREATE VIEW vw_i_p_a_c_measure_public_health_nurse AS
SELECT a.id, a.measure_id, a.measure_name, a.description, b.id AS nurse_id, b.nurse_id AS nurse_nurse_id, b.full_name AS nurse_full_name
FROM i_p_a_c_measures a JOIN public_health_nurses b ON a.public_health_nurse_id = b.id;
```

| id | measure_id | measure_name | description | nurse_id | nurse_nurse_id | nurse_full_name |
|---|---|---|---|---|---|---|
| 1 | invoice | Baseline Framework D | Extended Survey | 1 | 6969414 | Theodore Mcgrath |
| 2 | 4180944 | Distributed Protocol | Pilot Corridor A | 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Account Name |
| 3 | 6969441 | Adaptive Programme | Baseline Series | 3 | 1250196 | Saipan International Airport |
| 4 | 21280358 | Primary Standard A | Distributed Assessment | 4 | 9125616 | Norma Fisher |

The view `vw_i_p_a_c_measure_public_health_nurse` joins `i_p_a_c_measures` with `public_health_nurses` to answer: which nurse is responsible for overseeing each IPAC measure? The result presents measure attributes alongside nurse identifying and contact information. Row 1 shows measure `Baseline Framework D` (status `compliant`, last reviewed `2024-11-22`) overseen by nurse Theodore Mcgrath (licence `LIC-2589`, status `active`). Row 4 shows measure `Primary Standard A` (status `compliant`, last reviewed `2023-02-01`) overseen by nurse Norma Fisher (licence `LIC-2610`, status `active`). This view supports nurse workload analysis and compliance accountability across the IPAC measure portfolio.

The relational schema presented here faithfully materialises the public health school domain ontology. Five base tables encode the core entity types — `public_health_nurses`, `schools`, `school_boards`, `outbreaks`, and `i_p_a_c_measures` — with attributes as columns and relationships as foreign keys. The junction table `boards_schools` resolves the many-to-many association between boards and schools, enabling flexible governance structures. The eleven views reconstruct domain facts by joining these normalised tables, each answering a specific analytical question: nurse-to-school assignments, board governance chains, outbreak tracking, and IPAC compliance auditing. Together, the tables and views form a coherent, query-ready representation of the domain that supports both operational reporting and strategic oversight.