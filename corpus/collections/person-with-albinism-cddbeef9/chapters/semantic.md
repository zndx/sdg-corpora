The domain of albinism support in educational settings is a multi-faceted ecosystem in which persons with albinism interact with structured educational programs, mainstream schools, environmental accommodations, and social stigmas — each entity carrying its own attributes and each relationship between them materializing as a join in the relational layer. The schema is organized around five core entity tables, four many-to-many junction tables, and a suite of twelve views that reassemble normalized facts into domain-meaningful rows. Understanding this architecture requires tracing the path from ontology concepts through foreign-key constraints to the denormalized views that analysts query.

## Core Entity Tables

The backbone of the schema consists of five entity tables, each representing a distinct concept in the albinism-support domain. The `person_with_albinisms` table stores individual records for persons with albinism. Its primary key is `person_with_albinism_id`, an auto-incrementing integer. The table carries a `name` column (holding values such as *George Bernard Shaw*, *Maria Rodriguez*, *Sarah Villanueva*, and *Susan Wagner*), a `date_of_birth` column with dates ranging from 2022 to 2024, and two clinical attributes: `vision_level`, which takes values like `low`, `severe`, and `blind`, and `skin_sensitivity`, which takes `high`, `moderate`, or `low`. The `current_location` column stores location identifiers such as `baseline-current-43` and `pilot-current-44`. A boolean flag `enrolled_in_program` indicates whether the person is currently participating in an educational program. The table also carries four foreign-key columns — `education_program_id`, `social_stigma_id`, and `environmental_accommodation_id` — that point to the primary keys of their respective entity tables, plus a `person_id` column that serves as a secondary identifier.

**Table `person_with_albinisms`**

| person_with_albinism_id | person_id | name | date_of_birth | vision_level | skin_sensitivity | current_location | enrolled_in_program | education_program_id | social_stigma_id | environmental_accommodation_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Dana Nguyen | 2025-04-02 | low | high | baseline-current-43 | true | 100 | 1 | 100 |
| 2 | Maria Rodriguez | Kimberly Myers | 2022-09-13 | severe | moderate | pilot-current-44 | false | 101 | 2 | 101 |
| 3 | Sarah Villanueva | Kimberly Myers | 2023-02-24 | blind | low | extended-current-45 | true | 102 | 3 | 102 |
| 4 | Susan Wagner | Guam International Airport | 2024-07-08 | low | high | integrated-current-46 | false | 103 | 4 | 103 |

The `education_programs` table models educational interventions. Its primary key is `id`, and it carries a `program_id` column (values like `103176`, `2986219`, `1186079`, `1562855`) that serves as a business identifier. The `program_name` column holds descriptive names such as *Extended Review*, *Pilot Initiative A*, *Baseline Model*, and *Distributed Cluster*. Temporal attributes include `start_date` and `end_date`, both stored as ISO-8601 timestamps. The `status` column takes values from the domain `{active, inactive, planned}`, while `target_demographic` stores strings like `regional-target-84` and `legacy-target-85`. The `funding_source` column carries identifiers such as `baseline-funding-73` and `pilot-funding-74`. Two foreign-key columns — `mainstream_school_id` and `environmental_accommodation_id` — link each program to the school that hosts it and the accommodation that supports it.

**Table `education_programs`**

| id | program_id | program_name | start_date | end_date | status | target_demographic | funding_source | mainstream_school_id | environmental_accommodation_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | active | regional-target-84 | baseline-funding-73 | 1 | 100 |
| 101 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | inactive | legacy-target-85 | pilot-funding-74 | 2 | 101 |
| 102 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | planned | compact-target-86 | extended-funding-75 | 3 | 102 |
| 103 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | active | composite-target-87 | integrated-funding-76 | 4 | 103 |

The `mainstream_schools` table represents physical or organizational school entities. Its primary key is `id`, and it carries a `school_id` column (values like `1152671`, `1186099`, `7441154`, `338514`) as a business identifier. The `school_name` column holds names such as *Seasonal Standard*, *Integrated Framework*, *Extended Protocol D*, and *Pilot Programme*. The `location` column stores location identifiers like `extended-location-99` and `integrated-location-100`. The `academic_standard` column takes values from `{above_average, average, below_average}`, and `enrollment_capacity` is an integer (47, 57, 67, 77). A boolean `has_inclusive_policy` indicates whether the school has an inclusive policy. The `last_inspection_date` stores a date, and the table carries two foreign-key columns — `environmental_accommodation_id` and `social_stigma_id` — plus `created_at` and `updated_at` audit timestamps.

**Table `mainstream_schools`**

| id | school_id | school_name | location | academic_standard | enrollment_capacity | has_inclusive_policy | last_inspection_date | environmental_accommodation_id | social_stigma_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | extended-location-99 | above_average | 47 | false | 2025-04-12 | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 1186099 | Integrated Framework | integrated-location-100 | average | 57 | true | 2022-09-23 | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 7441154 | Extended Protocol D | seasonal-location-101 | below_average | 67 | false | 2023-02-07 | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 338514 | Pilot Programme | regional-location-102 | above_average | 77 | true | 2024-07-18 | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `environmental_accommodations` table models physical or procedural accommodations provided to support persons with albinism. Its primary key is `environmental_accommodation_id`, and it carries an `accommodation_id` column (values like `4277036`, `5917290`, `9229485c-9bad-11eb-a8a2-19ed5c03f8d3`, `1186097`). The `accommodation_type` column takes categorical values from the domain `{lighting, seating, sun_protection, visual_aid}`. The `implementation_date` stores an ISO-8601 timestamp, and `effectiveness_rating` is a numeric value (4.20, 7.40, 10.60, 13.80). The `status` column takes values from `{active, pending, removed}`, and the `description` column holds free-text labels such as *Extended Survey*, *Pilot Corridor A*, *Baseline Series*, and *Distributed Assessment*. Two foreign-key columns — `mainstream_school_id` and `education_program_id` — link each accommodation to the school and program it serves.

**Table `environmental_accommodations`**

| environmental_accommodation_id | accommodation_id | accommodation_type | implementation_date | effectiveness_rating | status | description | mainstream_school_id | education_program_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 4277036 | lighting | 2024-11-14T10:06:00 | 4.20 | active | Extended Survey | 1 | 100 |
| 101 | 5917290 | seating | 2025-04-25T17:23:00 | 7.40 | pending | Pilot Corridor A | 2 | 101 |
| 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection | 2022-09-09T00:40:00 | 10.60 | removed | Baseline Series | 3 | 102 |
| 103 | 1186097 | visual_aid | 2023-02-20T07:57:00 | 13.80 | active | Distributed Assessment | 4 | 103 |

The `social_stigmas` table records instances of social stigma experienced by persons with albinism. Its primary key is `id`, and it carries a `stigma_id` column (values like `2002007020160`, `505987`, `5844262`, `10207160`). The `stigma_type` column takes values from `{segregation, discrimination, isolation, myth_based}`, and `severity_level` is an integer (29, 40, 51, 62). The `location` column stores location identifiers, and `date_reported` holds a date. The `source` column carries identifiers such as `seasonal-source-65` and `regional-source-66`. Two foreign-key columns — `mainstream_school_id` and `education_program_id` — link each stigma to the school and program context in which it was reported, and `created_at` provides an audit timestamp.

**Table `social_stigmas`**

| id | stigma_id | stigma_type | severity_level | location | date_reported | source | mainstream_school_id | education_program_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020160 | segregation | 29 | extended-location-99 | 2023-06-04 | seasonal-source-65 | 1 | 100 | 2025-01-01 00:14:00 |
| 2 | 505987 | discrimination | 40 | integrated-location-100 | 2024-11-15 | regional-source-66 | 2 | 101 | 2025-02-06 03:14:00 |
| 3 | 5844262 | isolation | 51 | seasonal-location-101 | 2025-04-26 | legacy-source-67 | 3 | 102 | 2025-03-11 06:14:00 |
| 4 | 10207160 | myth_based | 62 | regional-location-102 | 2022-09-10 | compact-source-68 | 4 | 103 | 2025-04-16 09:14:00 |

## Junction Tables and Many-to-Many Relationships

The five entity tables above are connected through four junction tables that materialize many-to-many relationships. In the ontology, a person with albinism may be enrolled in multiple education programs, and a program may serve multiple persons. This relationship is captured in the `programs_albinisms` junction table, which has two columns: `education_program_id` and `person_with_albinism_id`. Each row represents one enrollment link. The data shows that program 100 enrolls persons 1 and 2, program 101 enrolls persons 2 and 3, program 102 enrolls persons 3 and 4, and program 103 enrolls persons 4 and 1 — forming a cyclic enrollment pattern where each person participates in exactly two programs.

**Table `programs_albinisms`**

| education_program_id | person_with_albinism_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `schools_albinisms` junction table links persons with albinism to mainstream schools. Its two columns — `mainstream_school_id` and `person_with_albinism_id` — encode the relationship between a school entity and a person. Similarly, the `accommodations_albinisms` junction table links persons with albinism to environmental accommodations via `environmental_accommodation_id` and `person_with_albinism_id`, and the `stigmas_albinisms` junction table links persons with albinism to social stigmas via `social_stigma_id` and `person_with_albinism_id`. These four junction tables ensure that the normalized schema can represent the combinatorial complexity of the domain — a single person may experience multiple stigmas, receive multiple accommodations, attend multiple programs, and be associated with multiple schools — without data duplication in the entity tables themselves.

**Table `schools_albinisms`**

| mainstream_school_id | person_with_albinism_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |
**Table `accommodations_albinisms`**

| environmental_accommodation_id | person_with_albinism_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |
**Table `stigmas_albinisms`**

| social_stigma_id | person_with_albinism_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

## Foreign-Key Topology and Referential Integrity

The referential structure of the schema forms a directed graph. The `person_with_albinisms` table carries three direct foreign keys — `education_program_id`, `social_stigma_id`, and `environmental_accommodation_id` — that point to the primary keys of their respective entity tables. The `education_programs` table carries `mainstream_school_id` and `environmental_accommodation_id`. The `mainstream_schools` table carries `environmental_accommodation_id` and `social_stigma_id`. The `environmental_accommodations` table carries `mainstream_school_id` and `education_program_id`. The `social_stigmas` table carries `mainstream_school_id` and `education_program_id`. This creates a tightly interwoven web of dependencies: every entity table references at least one other, and the cycle of references ensures that no entity exists in isolation. For example, the accommodation with `environmental_accommodation_id` 100 (type `lighting`, effectiveness 4.20, description *Extended Survey*) is referenced by education program 100 (*Extended Review*), by mainstream school 1 (*Seasonal Standard*), and by person 1 (*George Bernard Shaw*). The stigma with `id` 1 (type `segregation`, severity 29) is referenced by mainstream school 1, education program 100, and person 1.

## View-Based Reassembly of Domain Facts

The twelve views in the schema serve as denormalized lenses that reassemble normalized rows into domain-meaningful records. Each view answers a specific analytical question by joining two or more entity tables along their foreign-key relationships.

The view `vw_person_with_albinism_education_program` joins `person_with_albinisms` to `education_programs` on `education_program_id`, answering the question: *Which education programs is each person with albinism enrolled in?* A row from this view might show person *George Bernard Shaw* (person_with_albinism_id 1, vision_level `low`, skin_sensitivity `high`) enrolled in program 100 (*Extended Review*, status `active`, target_demographic `regional-target-84`). Another row might show *Maria Rodriguez* (person_with_albinism_id 2, vision_level `severe`, skin_sensitivity `moderate`) enrolled in program 100 as well, demonstrating that multiple persons share a program.

**View `vw_person_with_albinism_education_program`**

```sql
CREATE VIEW vw_person_with_albinism_education_program AS
SELECT a.person_with_albinism_id, a.person_id, a.name, a.date_of_birth, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM person_with_albinisms a JOIN education_programs b ON a.education_program_id = b.id;
```

| person_with_albinism_id | person_id | name | date_of_birth | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Dana Nguyen | 2025-04-02 | 100 | 103176 | Extended Review |
| 2 | Maria Rodriguez | Kimberly Myers | 2022-09-13 | 101 | 2986219 | Pilot Initiative A |
| 3 | Sarah Villanueva | Kimberly Myers | 2023-02-24 | 102 | 1186079 | Baseline Model |
| 4 | Susan Wagner | Guam International Airport | 2024-07-08 | 103 | 1562855 | Distributed Cluster |

The view `vw_person_with_albinism_social_stigma` joins `person_with_albinisms` to `social_stigmas` on `social_stigma_id`, answering: *Which social stigmas does each person with albinism experience?* A row might show *Sarah Villanueva* (person_with_albinism_id 3, vision_level `blind`) associated with stigma id 3 (type `isolation`, severity 51, location `seasonal-location-101`). Another row might show *Susan Wagner* (person_with_albinism_id 4) associated with stigma id 4 (type `myth_based`, severity 62).

**View `vw_person_with_albinism_social_stigma`**

```sql
CREATE VIEW vw_person_with_albinism_social_stigma AS
SELECT a.person_with_albinism_id, a.person_id, a.name, a.date_of_birth, b.id AS stigma_id, b.stigma_id AS stigma_stigma_id, b.stigma_type AS stigma_stigma_type
FROM person_with_albinisms a JOIN social_stigmas b ON a.social_stigma_id = b.id;
```

| person_with_albinism_id | person_id | name | date_of_birth | stigma_id | stigma_stigma_id | stigma_stigma_type |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Dana Nguyen | 2025-04-02 | 1 | 2002007020160 | segregation |
| 2 | Maria Rodriguez | Kimberly Myers | 2022-09-13 | 2 | 505987 | discrimination |
| 3 | Sarah Villanueva | Kimberly Myers | 2023-02-24 | 3 | 5844262 | isolation |
| 4 | Susan Wagner | Guam International Airport | 2024-07-08 | 4 | 10207160 | myth_based |

The view `vw_person_with_albinism_environmental_accommodation` joins `person_with_albinisms` to `environmental_accommodations` on `environmental_accommodation_id`, answering: *Which environmental accommodations support each person with albinism?* A row might show *George Bernard Shaw* associated with accommodation 100 (type `lighting`, effectiveness 4.20, status `active`, description *Extended Survey*). Another row might show *Maria Rodriguez* associated with accommodation 101 (type `seating`, effectiveness 7.40, status `pending`, description *Pilot Corridor A*).

**View `vw_person_with_albinism_environmental_accommodation`**

```sql
CREATE VIEW vw_person_with_albinism_environmental_accommodation AS
SELECT a.person_with_albinism_id, a.person_id, a.name, a.date_of_birth, b.environmental_accommodation_id AS accommodation_environmental_accommodation_id, b.accommodation_id AS accommodation_accommodation_id, b.accommodation_type AS accommodation_accommodation_type
FROM person_with_albinisms a JOIN environmental_accommodations b ON a.environmental_accommodation_id = b.environmental_accommodation_id;
```

| person_with_albinism_id | person_id | name | date_of_birth | accommodation_environmental_accommodation_id | accommodation_accommodation_id | accommodation_accommodation_type |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Dana Nguyen | 2025-04-02 | 100 | 4277036 | lighting |
| 2 | Maria Rodriguez | Kimberly Myers | 2022-09-13 | 101 | 5917290 | seating |
| 3 | Sarah Villanueva | Kimberly Myers | 2023-02-24 | 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection |
| 4 | Susan Wagner | Guam International Airport | 2024-07-08 | 103 | 1186097 | visual_aid |

The view `vw_education_program_person_with_albinism_detail` joins `education_programs` to `person_with_albinisms` on `education_program_id`, answering the inverse question: *Which persons with albinism are served by each education program?* A row might show program 100 (*Extended Review*, status `active`, funding `baseline-funding-73`) serving person *George Bernard Shaw* (vision_level `low`). Another row might show the same program serving *Maria Rodriguez* (vision_level `severe`), illustrating the program's multi-person enrollment.

**View `vw_education_program_person_with_albinism_detail`**

```sql
CREATE VIEW vw_education_program_person_with_albinism_detail AS
SELECT a.id, a.program_id, a.program_name, b.person_with_albinism_id AS albinism_person_with_albinism_id, b.person_id AS albinism_person_id, b.name AS albinism_name
FROM education_programs a
  JOIN programs_albinisms j ON j.education_program_id = a.id
  JOIN person_with_albinisms b ON b.person_with_albinism_id = j.person_with_albinism_id;
```

| id | program_id | program_name | albinism_person_with_albinism_id | albinism_person_id | albinism_name |
|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | 1 | George Bernard Shaw | Dana Nguyen |
| 100 | 103176 | Extended Review | 2 | Maria Rodriguez | Kimberly Myers |
| 101 | 2986219 | Pilot Initiative A | 2 | Maria Rodriguez | Kimberly Myers |
| 101 | 2986219 | Pilot Initiative A | 3 | Sarah Villanueva | Kimberly Myers |
| 102 | 1186079 | Baseline Model | 3 | Sarah Villanueva | Kimberly Myers |
| 102 | 1186079 | Baseline Model | 4 | Susan Wagner | Guam International Airport |
| 103 | 1562855 | Distributed Cluster | 4 | Susan Wagner | Guam International Airport |
| 103 | 1562855 | Distributed Cluster | 1 | George Bernard Shaw | Dana Nguyen |

The view `vw_education_program_mainstream_school` joins `education_programs` to `mainstream_schools` on `mainstream_school_id`, answering: *Which mainstream school hosts each education program?* A row might show program 100 (*Extended Review*) hosted at school 1 (*Seasonal Standard*, academic_standard `above_average`, enrollment_capacity 47, has_inclusive_policy `false`). Another row might show program 101 (*Pilot Initiative A*) hosted at school 2 (*Integrated Framework*, academic_standard `average`, has_inclusive_policy `true`).

**View `vw_education_program_mainstream_school`**

```sql
CREATE VIEW vw_education_program_mainstream_school AS
SELECT a.id, a.program_id, a.program_name, a.start_date, b.id AS school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM education_programs a JOIN mainstream_schools b ON a.mainstream_school_id = b.id;
```

| id | program_id | program_name | start_date | school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | 2022-09-05T20:24:00 | 1 | 1152671 | Seasonal Standard |
| 101 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | 2 | 1186099 | Integrated Framework |
| 102 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | 3 | 7441154 | Extended Protocol D |
| 103 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | 4 | 338514 | Pilot Programme |

The view `vw_education_program_environmental_accommodation` joins `education_programs` to `environmental_accommodations` on `environmental_accommodation_id`, answering: *Which environmental accommodation supports each education program?* A row might show program 100 (*Extended Review*) supported by accommodation 100 (type `lighting`, effectiveness 4.20, status `active`). Another row might show program 103 (*Distributed Cluster*) supported by accommodation 103 (type `visual_aid`, effectiveness 13.80, status `active`, description *Distributed Assessment*).

**View `vw_education_program_environmental_accommodation`**

```sql
CREATE VIEW vw_education_program_environmental_accommodation AS
SELECT a.id, a.program_id, a.program_name, a.start_date, b.environmental_accommodation_id AS accommodation_environmental_accommodation_id, b.accommodation_id AS accommodation_accommodation_id, b.accommodation_type AS accommodation_accommodation_type
FROM education_programs a JOIN environmental_accommodations b ON a.environmental_accommodation_id = b.environmental_accommodation_id;
```

| id | program_id | program_name | start_date | accommodation_environmental_accommodation_id | accommodation_accommodation_id | accommodation_accommodation_type |
|---|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | 2022-09-05T20:24:00 | 100 | 4277036 | lighting |
| 101 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | 101 | 5917290 | seating |
| 102 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection |
| 103 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | 103 | 1186097 | visual_aid |

The view `vw_mainstream_school_person_with_albinism_detail` joins `mainstream_schools` to `person_with_albinisms` on the junction path through `schools_albinisms`, answering: *Which persons with albinism are associated with each mainstream school?* A row might show school 1 (*Seasonal Standard*) associated with person *George Bernard Shaw* (vision_level `low`, skin_sensitivity `high`). Another row might show school 2 (*Integrated Framework*) associated with person *Maria Rodriguez* (vision_level `severe`).

**View `vw_mainstream_school_person_with_albinism_detail`**

```sql
CREATE VIEW vw_mainstream_school_person_with_albinism_detail AS
SELECT a.id, a.school_id, a.school_name, b.person_with_albinism_id AS albinism_person_with_albinism_id, b.person_id AS albinism_person_id, b.name AS albinism_name
FROM mainstream_schools a
  JOIN schools_albinisms j ON j.mainstream_school_id = a.id
  JOIN person_with_albinisms b ON b.person_with_albinism_id = j.person_with_albinism_id;
```

| id | school_id | school_name | albinism_person_with_albinism_id | albinism_person_id | albinism_name |
|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | 1 | George Bernard Shaw | Dana Nguyen |
| 1 | 1152671 | Seasonal Standard | 2 | Maria Rodriguez | Kimberly Myers |
| 2 | 1186099 | Integrated Framework | 2 | Maria Rodriguez | Kimberly Myers |
| 2 | 1186099 | Integrated Framework | 3 | Sarah Villanueva | Kimberly Myers |
| 3 | 7441154 | Extended Protocol D | 3 | Sarah Villanueva | Kimberly Myers |
| 3 | 7441154 | Extended Protocol D | 4 | Susan Wagner | Guam International Airport |
| 4 | 338514 | Pilot Programme | 4 | Susan Wagner | Guam International Airport |
| 4 | 338514 | Pilot Programme | 1 | George Bernard Shaw | Dana Nguyen |

The view `vw_mainstream_school_environmental_accommodation` joins `mainstream_schools` to `environmental_accommodations` on `environmental_accommodation_id`, answering: *Which environmental accommodations are available at each mainstream school?* A row might show school 1 (*Seasonal Standard*) offering accommodation 100 (type `lighting`, effectiveness 4.20). Another row might show school 4 (*Pilot Programme*) offering accommodation 103 (type `visual_aid`, effectiveness 13.80).

**View `vw_mainstream_school_environmental_accommodation`**

```sql
CREATE VIEW vw_mainstream_school_environmental_accommodation AS
SELECT a.id, a.school_id, a.school_name, a.location, b.environmental_accommodation_id AS accommodation_environmental_accommodation_id, b.accommodation_id AS accommodation_accommodation_id, b.accommodation_type AS accommodation_accommodation_type
FROM mainstream_schools a JOIN environmental_accommodations b ON a.environmental_accommodation_id = b.environmental_accommodation_id;
```

| id | school_id | school_name | location | accommodation_environmental_accommodation_id | accommodation_accommodation_id | accommodation_accommodation_type |
|---|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | extended-location-99 | 100 | 4277036 | lighting |
| 2 | 1186099 | Integrated Framework | integrated-location-100 | 101 | 5917290 | seating |
| 3 | 7441154 | Extended Protocol D | seasonal-location-101 | 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection |
| 4 | 338514 | Pilot Programme | regional-location-102 | 103 | 1186097 | visual_aid |

The view `vw_mainstream_school_social_stigma` joins `mainstream_schools` to `social_stigmas` on `social_stigma_id`, answering: *Which social stigmas are reported at each mainstream school?* A row might show school 1 (*Seasonal Standard*) reporting stigma id 1 (type `segregation`, severity 29, source `seasonal-source-65`). Another row might show school 2 (*Integrated Framework*) reporting stigma id 2 (type `discrimination`, severity 40, source `regional-source-66`).

**View `vw_mainstream_school_social_stigma`**

```sql
CREATE VIEW vw_mainstream_school_social_stigma AS
SELECT a.id, a.school_id, a.school_name, a.location, b.id AS stigma_id, b.stigma_id AS stigma_stigma_id, b.stigma_type AS stigma_stigma_type
FROM mainstream_schools a JOIN social_stigmas b ON a.social_stigma_id = b.id;
```

| id | school_id | school_name | location | stigma_id | stigma_stigma_id | stigma_stigma_type |
|---|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | extended-location-99 | 1 | 2002007020160 | segregation |
| 2 | 1186099 | Integrated Framework | integrated-location-100 | 2 | 505987 | discrimination |
| 3 | 7441154 | Extended Protocol D | seasonal-location-101 | 3 | 5844262 | isolation |
| 4 | 338514 | Pilot Programme | regional-location-102 | 4 | 10207160 | myth_based |

The view `vw_environmental_accommodation_mainstream_school` joins `environmental_accommodations` to `mainstream_schools` on `mainstream_school_id`, answering the inverse: *At which mainstream school is each environmental accommodation implemented?* A row might show accommodation 100 (type `lighting`, description *Extended Survey*) implemented at school 1 (*Seasonal Standard*, academic_standard `above_average`). Another row might show accommodation 102 (type `sun_protection`, status `removed`, description *Baseline Series*) implemented at school 3 (*Extended Protocol D*, academic_standard `below_average`).

**View `vw_environmental_accommodation_mainstream_school`**

```sql
CREATE VIEW vw_environmental_accommodation_mainstream_school AS
SELECT a.environmental_accommodation_id, a.accommodation_id, a.accommodation_type, a.implementation_date, b.id AS school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM environmental_accommodations a JOIN mainstream_schools b ON a.mainstream_school_id = b.id;
```

| environmental_accommodation_id | accommodation_id | accommodation_type | implementation_date | school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|---|
| 100 | 4277036 | lighting | 2024-11-14T10:06:00 | 1 | 1152671 | Seasonal Standard |
| 101 | 5917290 | seating | 2025-04-25T17:23:00 | 2 | 1186099 | Integrated Framework |
| 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection | 2022-09-09T00:40:00 | 3 | 7441154 | Extended Protocol D |
| 103 | 1186097 | visual_aid | 2023-02-20T07:57:00 | 4 | 338514 | Pilot Programme |

The view `vw_environmental_accommodation_person_with_albinism_detail` joins `environmental_accommodations` to `person_with_albinisms` on the junction path through `accommodations_albinisms`, answering: *Which persons with albinism benefit from each environmental accommodation?* A row might show accommodation 100 (type `lighting`, effectiveness 4.20) benefiting person *George Bernard Shaw* (vision_level `low`). Another row might show accommodation 101 (type `seating`, effectiveness 7.40) benefiting person *Maria Rodriguez* (vision_level `severe`).

**View `vw_environmental_accommodation_person_with_albinism_detail`**

```sql
CREATE VIEW vw_environmental_accommodation_person_with_albinism_detail AS
SELECT a.environmental_accommodation_id, a.accommodation_id, a.accommodation_type, b.person_with_albinism_id AS albinism_person_with_albinism_id, b.person_id AS albinism_person_id, b.name AS albinism_name
FROM environmental_accommodations a
  JOIN accommodations_albinisms j ON j.environmental_accommodation_id = a.environmental_accommodation_id
  JOIN person_with_albinisms b ON b.person_with_albinism_id = j.person_with_albinism_id;
```

| environmental_accommodation_id | accommodation_id | accommodation_type | albinism_person_with_albinism_id | albinism_person_id | albinism_name |
|---|---|---|---|---|---|
| 100 | 4277036 | lighting | 1 | George Bernard Shaw | Dana Nguyen |
| 100 | 4277036 | lighting | 2 | Maria Rodriguez | Kimberly Myers |
| 101 | 5917290 | seating | 2 | Maria Rodriguez | Kimberly Myers |
| 101 | 5917290 | seating | 3 | Sarah Villanueva | Kimberly Myers |
| 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection | 3 | Sarah Villanueva | Kimberly Myers |
| 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection | 4 | Susan Wagner | Guam International Airport |
| 103 | 1186097 | visual_aid | 4 | Susan Wagner | Guam International Airport |
| 103 | 1186097 | visual_aid | 1 | George Bernard Shaw | Dana Nguyen |

The view `vw_environmental_accommodation_education_program` joins `environmental_accommodations` to `education_programs` on `education_program_id`, answering: *Which education program is each environmental accommodation supporting?* A row might show accommodation 100 (type `lighting`, status `active`) supporting program 100 (*Extended Review*, status `active`, target_demographic `regional-target-84`). Another row might show accommodation 102 (type `sun_protection`, status `removed`) supporting program 102 (*Baseline Model*, status `planned`, target_demographic `compact-target-86`).

**View `vw_environmental_accommodation_education_program`**

```sql
CREATE VIEW vw_environmental_accommodation_education_program AS
SELECT a.environmental_accommodation_id, a.accommodation_id, a.accommodation_type, a.implementation_date, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM environmental_accommodations a JOIN education_programs b ON a.education_program_id = b.id;
```

| environmental_accommodation_id | accommodation_id | accommodation_type | implementation_date | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 100 | 4277036 | lighting | 2024-11-14T10:06:00 | 100 | 103176 | Extended Review |
| 101 | 5917290 | seating | 2025-04-25T17:23:00 | 101 | 2986219 | Pilot Initiative A |
| 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection | 2022-09-09T00:40:00 | 102 | 1186079 | Baseline Model |
| 103 | 1186097 | visual_aid | 2023-02-20T07:57:00 | 103 | 1562855 | Distributed Cluster |

The view `vw_social_stigma_person_with_albinism_detail` joins `social_stigmas` to `person_with_albinisms` on the junction path through `stigmas_albinisms`, answering: *Which persons with albinism are affected by each social stigma?* A row might show stigma id 1 (type `segregation`, severity 29) affecting person *George Bernard Shaw* (vision_level `low`, skin_sensitivity `high`). Another row might show stigma id 3 (type `isolation`, severity 51) affecting person *Sarah Villanueva* (vision_level `blind`).

**View `vw_social_stigma_person_with_albinism_detail`**

```sql
CREATE VIEW vw_social_stigma_person_with_albinism_detail AS
SELECT a.id, a.stigma_id, a.stigma_type, b.person_with_albinism_id AS albinism_person_with_albinism_id, b.person_id AS albinism_person_id, b.name AS albinism_name
FROM social_stigmas a
  JOIN stigmas_albinisms j ON j.social_stigma_id = a.id
  JOIN person_with_albinisms b ON b.person_with_albinism_id = j.person_with_albinism_id;
```

| id | stigma_id | stigma_type | albinism_person_with_albinism_id | albinism_person_id | albinism_name |
|---|---|---|---|---|---|
| 1 | 2002007020160 | segregation | 1 | George Bernard Shaw | Dana Nguyen |
| 1 | 2002007020160 | segregation | 2 | Maria Rodriguez | Kimberly Myers |
| 2 | 505987 | discrimination | 2 | Maria Rodriguez | Kimberly Myers |
| 2 | 505987 | discrimination | 3 | Sarah Villanueva | Kimberly Myers |
| 3 | 5844262 | isolation | 3 | Sarah Villanueva | Kimberly Myers |
| 3 | 5844262 | isolation | 4 | Susan Wagner | Guam International Airport |
| 4 | 10207160 | myth_based | 4 | Susan Wagner | Guam International Airport |
| 4 | 10207160 | myth_based | 1 | George Bernard Shaw | Dana Nguyen |

The view `vw_social_stigma_mainstream_school` joins `social_stigmas` to `mainstream_schools` on `mainstream_school_id`, answering: *At which mainstream school is each social stigma reported?* A row might show stigma id 1 (type `segregation`, severity 29, location `extended-location-99`) reported at school 1 (*Seasonal Standard*, enrollment_capacity 47). Another row might show stigma id 4 (type `myth_based`, severity 62, location `regional-location-102`) reported at school 4 (*Pilot Programme*, enrollment_capacity 77, has_inclusive_policy `true`).

**View `vw_social_stigma_mainstream_school`**

```sql
CREATE VIEW vw_social_stigma_mainstream_school AS
SELECT a.id, a.stigma_id, a.stigma_type, a.severity_level, b.id AS school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM social_stigmas a JOIN mainstream_schools b ON a.mainstream_school_id = b.id;
```

| id | stigma_id | stigma_type | severity_level | school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|---|
| 1 | 2002007020160 | segregation | 29 | 1 | 1152671 | Seasonal Standard |
| 2 | 505987 | discrimination | 40 | 2 | 1186099 | Integrated Framework |
| 3 | 5844262 | isolation | 51 | 3 | 7441154 | Extended Protocol D |
| 4 | 10207160 | myth_based | 62 | 4 | 338514 | Pilot Programme |

The view `vw_social_stigma_education_program` joins `social_stigmas` to `education_programs` on `education_program_id`, answering: *In which education program context is each social stigma reported?* A row might show stigma id 1 (type `segregation`, source `seasonal-source-65`) reported in program 100 (*Extended Review*, funding `baseline-funding-73`). Another row might show stigma id 4 (type `myth_based`, source `compact-source-68`) reported in program 103 (*Distributed Cluster*, funding `integrated-funding-76`).

**View `vw_social_stigma_education_program`**

```sql
CREATE VIEW vw_social_stigma_education_program AS
SELECT a.id, a.stigma_id, a.stigma_type, a.severity_level, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM social_stigmas a JOIN education_programs b ON a.education_program_id = b.id;
```

| id | stigma_id | stigma_type | severity_level | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | 2002007020160 | segregation | 29 | 100 | 103176 | Extended Review |
| 2 | 505987 | discrimination | 40 | 101 | 2986219 | Pilot Initiative A |
| 3 | 5844262 | isolation | 51 | 102 | 1186079 | Baseline Model |
| 4 | 10207160 | myth_based | 62 | 103 | 1562855 | Distributed Cluster |

## Synthesis

The schema models the albinism-support domain as a network of five entity types connected through four many-to-many junction tables and a dense web of foreign-key relationships. Each entity table captures the intrinsic attributes of its concept — clinical characteristics for persons, temporal and funding metadata for programs, physical and policy attributes for schools, categorical and effectiveness data for accommodations, and typological and severity data for stigmas. The junction tables (`programs_albinisms`, `schools_albinisms`, `accommodations_albinisms`, `stigmas_albinisms`) ensure that the combinatorial relationships between entities are represented without duplication. The twelve views then reassemble these normalized facts into domain-meaningful records, each answering a specific analytical question by joining along the foreign-key paths. Together, the base tables and views provide a complete relational representation of the domain: the base tables store the facts, the junction tables encode the relationships, and the views present the facts in the contexts in which they are actually experienced.