Horse breeding and competition management is a domain where lineage, performance, and ownership intersect across multiple institutional processes. A breeding program tracks which horses are selected for genetic improvement, performance tests record objective evaluations of athletic and breeding potential, competitions document competitive results, and pedigrees encode parentage. The relational schema captures these concepts through a set of normalized base tables linked by foreign keys, while a collection of views materializes the most common analytical joins so that queries can reconstruct domain facts without repeating join logic. This chapter explains the entity types, their attributes, the cardinality-bounded relationships that become columns and junction tables, and how each view answers a specific question about the data.

## Base Tables and Their Attributes

The foundation of the model consists of seven base tables. Each table represents a distinct entity type and stores its attributes in columns, with a surrogate `id` column serving as the primary key.

**Table `breeding_programs`**

| id | program_id | program_name | start_date | status |
|---|---|---|---|---|
| 1 | 103176 | Extended Review | 2022-09-05T20:24:00 | active |
| 2 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | inactive |
| 3 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | pending |
| 4 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | active |

The `breeding_programs` table captures institutional breeding initiatives. Each row identifies a program by `program_id` (a business key such as `103176` or `2986219`) and `program_name` (e.g., *Extended Review*, *Pilot Initiative A*, *Baseline Model*, *Distributed Cluster*). The `start_date` column records when the program began, using ISO 8601 timestamps like `2022-09-05T20:24:00`. The `status` column constrains the lifecycle state to one of `active`, `inactive`, or `pending`. A program with `id` 1 holds the *Extended Review* program, which is currently `active`, while `id` 2 holds *Pilot Initiative A* in an `inactive` state.

**Table `horses`**

| id | horse_id | horse_name | registration_number | date_of_birth | sex | breed | status | breeding_program_id | owner_id | has_sire_horse_id | has_dam_horse_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Integrated Programme A | REG-2136 | 2025-04-02 | stallion | compact-breed-80 | selected | 1 | 1 | 100 | 100 |
| 101 | 3001009030160 | Extended Standard | REG-2142 | 2022-09-13 | mare | composite-breed-81 | rejected | 2 | 2 | 101 | 101 |
| 102 | 5006443 | Pilot Framework | REG-2148 | 2023-02-24 | stallion | primary-breed-82 | pending | 3 | 3 | 102 | 102 |
| 103 | 2933481 | Baseline Protocol D | REG-2154 | 2024-07-08 | mare | adaptive-breed-83 | selected | 4 | 4 | 103 | 103 |

The `horses` table is the central entity. Each horse is identified by a surrogate `id` (100 through 103 in the sample), a `horse_id` business key (such as `ChIJt4hBkzhu5kcRJJDUNqGUpso` or `3001009030160`), and a `horse_name` (e.g., *Integrated Programme A*, *Extended Standard*, *Pilot Framework*, *Baseline Protocol D*). The `registration_number` column stores alphanumeric identifiers like `REG-2136`. The `date_of_birth` column uses date values such as `2025-04-02`. The `sex` column is constrained to `stallion` or `mare`, the `breed` column carries values like `compact-breed-80` and `composite-breed-81`, and the `status` column records the horse's selection state (`selected`, `rejected`, or `pending`).

Two foreign keys in `horses` create self-referencing relationships: `has_sire_horse_id` and `has_dam_horse_id` both reference `horses(id)`. In the sample data, horse 100 (*Integrated Programme A*) lists itself as both sire and dam, which is a data artifact; in a production pedigree, these columns would point to distinct parent horses. Two additional foreign keys link horses to other entities: `breeding_program_id` references `breeding_programs(id)`, and `owner_id` references `owners(owner_id)`. Horse 100 belongs to breeding program 1 and owner 1; horse 103 belongs to breeding program 4 and owner 4.

**Table `owners`**

| owner_id | owner_name | address | city | state | zip_code | phone | email | horse_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Craig Childs | distributed-address-72 | integrated-city-34 | distributed-state-84 | 69434 | compact-phone-26 | seasonal-email-11 | 100 |
| 2 | Kimberly Smith | baseline-address-73 | seasonal-city-35 | baseline-state-85 | 13589 | composite-phone-27 | regional-email-12 | 101 |
| 3 | Michelle Kelley | pilot-address-74 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | primary-phone-28 | legacy-email-13 | 102 |
| 4 | Jorge Sullivan | extended-address-75 | legacy-city-37 | extended-state-87 | 1250214 | adaptive-phone-29 | compact-email-14 | 103 |

The `owners` table stores contact and address information for horse owners. The primary key is `owner_id` (1 through 4), and each row includes `owner_name` (e.g., *Craig Childs*, *Kimberly Smith*, *Michelle Kelley*, *Jorge Sullivan*), `address`, `city`, `state`, `zip_code`, `phone`, and `email`. The `horse_id` column in `owners` is a foreign key referencing `horses(id)`, establishing a one-to-one or one-to-many ownership relationship. Owner 1, Craig Childs, is associated with horse 100; owner 4, Jorge Sullivan, with horse 103.

**Table `performance_tests`**

| test_id | test_date | jumping_score | breeding_value | test_type | horse_id | evaluator_id |
|---|---|---|---|---|---|---|
| 2106696 | 2024-11-13T22:42:00 | 17.45 | 19.45 | stallion | 100 | 1 |
| 7119774 | 2025-04-24T05:59:00 | 20.90 | 23.90 | mare | 101 | 2 |
| 7441144 | 2022-09-08T12:16:00 | 24.35 | 28.35 | stallion | 102 | 3 |
| 8350010 | 2023-02-19T19:33:00 | 27.80 | 32.80 | mare | 103 | 4 |

The `performance_tests` table records objective evaluations of a horse's athletic and genetic merit. Each test is identified by `test_id` (e.g., `2106696`, `7119774`, `7441144`, `8350010`) and includes a `test_date` (such as `2024-11-13T22:42:00`), a numeric `jumping_score` (ranging from `17.45` to `27.80` in the sample), a numeric `breeding_value` (ranging from `19.45` to `32.80`), and a `test_type` constrained to `stallion` or `mare`. Two foreign keys link each test to its subject and its assessor: `horse_id` references `horses(id)`, and `evaluator_id` references `evaluators(id)`. Test `2106696` was performed on horse 100 by evaluator 1; test `8350010` was performed on horse 103 by evaluator 4.

**Table `evaluators`**

| id | evaluator_id | evaluator_name | organization | role | test_id |
|---|---|---|---|---|---|
| 1 | 338533 | Distributed Survey | Whirlpool Corporation | judge | 2106696 |
| 2 | id_22 | Adaptive Corridor D | Poshmark Inc. | committee_member | 7119774 |
| 3 | f2098a7a-8fcd-11eb-924d-9cd76263cbd0 | Primary Series | Whirlpool Corporation | official | 7441144 |
| 4 | 10207165 | Composite Assessment | Alexandria Real Estate Equities | judge | 8350010 |

The `evaluators` table stores information about the individuals or panels that conduct performance tests and competitions. Each evaluator has a surrogate `id` (1 through 4), an `evaluator_id` business key (e.g., `338533`, `id_22`, `f2098a7a-8fcd-11eb-924d-9cd76263cbd0`), an `evaluator_name` (such as *Distributed Survey*, *Adaptive Corridor D*, *Primary Series*, *Composite Assessment*), an `organization` (e.g., *Whirlpool Corporation*, *Poshmark Inc.*, *Alexandria Real Estate Equities*), and a `role` constrained to `judge`, `committee_member`, or `official`. The `test_id` column is a foreign key referencing `performance_tests(test_id)`, linking each evaluator to the specific test they conducted. Evaluator 1, *Distributed Survey* from *Whirlpool Corporation* with role `judge`, conducted test `2106696`; evaluator 2, *Adaptive Corridor D* from *Poshmark Inc.* with role `committee_member`, conducted test `7119774`.

**Table `competition_records`**

| id | record_id | competition_name | competition_level | competition_date | result | competition_type | horse_id | evaluator_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | Compact Model | 23 | 2024-07-02 | successful | show_jumping | 100 | 1 |
| 2 | 10445619 | Legacy Cluster | 27 | 2025-12-13 | unsuccessful | eventing | 101 | 2 |
| 3 | 9568457 | Regional Review A | 31 | 2022-05-24 | successful | hunter | 102 | 3 |
| 4 | 20743593 | Seasonal Initiative | 35 | 2023-10-08 | unsuccessful | show_jumping | 103 | 4 |

The `competition_records` table documents competitive events in which horses participated. Each record has a surrogate `id` (1 through 4), a `record_id` business key (e.g., `10449530`, `10445619`, `9568457`, `20743593`), a `competition_name` (such as *Compact Model*, *Legacy Cluster*, *Regional Review A*, *Seasonal Initiative*), a numeric `competition_level` (values `23`, `27`, `31`, `35`), a `competition_date` (e.g., `2024-07-02`, `2025-12-13`), a `result` constrained to `successful` or `unsuccessful`, and a `competition_type` constrained to `show_jumping`, `eventing`, or `hunter`. Two foreign keys link each record to its subject and its assessor: `horse_id` references `horses(id)`, and `evaluator_id` references `evaluators(id)`. Record 1 documents a `successful` *Compact Model* show_jumping result for horse 100 at level 23; record 2 documents an `unsuccessful` *Legacy Cluster* eventing result for horse 101 at level 27.

**Table `pedigrees`**

| id | pedigree_id | sire_name | dam_name | grand_sire_name | grand_dam_name | jumping_sire_count | horse_id | includes_sire_horse_id | includes_dam_horse_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 4074 | Primary Survey A | Legacy Assessment D | Composite Series | Legacy Review D | 14 | 100 | 100 | 100 |
| 2 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Corridor | Regional Survey | Compact Assessment A | Regional Initiative | 15 | 101 | 101 | 101 |
| 3 | 1250214 | Compact Series | Seasonal Corridor | Legacy Survey | Seasonal Model | 7 | 102 | 102 | 102 |
| 4 | 5844276 | Legacy Assessment D | Integrated Series A | Regional Corridor | Integrated Cluster A | 5 | 103 | 103 | 103 |

The `pedigrees` table encodes parentage relationships between horses. In this schema, the pedigree information is also captured directly in the `horses` table through the `has_sire_horse_id` and `has_dam_horse_id` columns, which are self-referencing foreign keys pointing back to `horses(id)`. The `pedigrees` table serves as a denormalized or alternative representation of the same parentage data, allowing queries that treat sire and dam as separate rows rather than as two columns on the horse entity. In the sample data, horse 100 lists itself as both sire and dam, and the same self-reference pattern holds for horses 101, 102, and 103.

## Views and Their Interpretations

Views in this schema materialize the most common analytical joins, each answering a specific question by combining columns from two or more base tables.

**View `v_horse_breeding_program`**

```sql
CREATE VIEW v_horse_breeding_program AS
SELECT a.id, a.horse_id, a.horse_name, a.registration_number, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM horses a JOIN breeding_programs b ON a.breeding_program_id = b.id;
```

| id | horse_id | horse_name | registration_number | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 100 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Integrated Programme A | REG-2136 | 1 | 103176 | Extended Review |
| 101 | 3001009030160 | Extended Standard | REG-2142 | 2 | 2986219 | Pilot Initiative A |
| 102 | 5006443 | Pilot Framework | REG-2148 | 3 | 1186079 | Baseline Model |
| 103 | 2933481 | Baseline Protocol D | REG-2154 | 4 | 1562855 | Distributed Cluster |

The view `v_horse_breeding_program` joins `horses` to `breeding_programs` on `horses.breeding_program_id = breeding_programs.id`, producing a flat row per horse that includes both the horse's attributes and the name and status of its breeding program. This view answers the question: *Which horses belong to which breeding programs, and what is the status of each program?* For example, a row from this view would show horse 100 (*Integrated Programme A*, breed `compact-breed-80`, status `selected`) alongside breeding program 1 (*Extended Review*, status `active`), making it immediately clear that a selected horse is enrolled in an active program.

**View `v_horse_owner`**

```sql
CREATE VIEW v_horse_owner AS
SELECT a.id, a.horse_id, a.horse_name, a.registration_number, b.owner_id AS owner_owner_id, b.owner_name AS owner_owner_name, b.address AS owner_address
FROM horses a JOIN owners b ON a.owner_id = b.owner_id;
```

| id | horse_id | horse_name | registration_number | owner_owner_id | owner_owner_name | owner_address |
|---|---|---|---|---|---|---|
| 100 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Integrated Programme A | REG-2136 | 1 | Craig Childs | distributed-address-72 |
| 101 | 3001009030160 | Extended Standard | REG-2142 | 2 | Kimberly Smith | baseline-address-73 |
| 102 | 5006443 | Pilot Framework | REG-2148 | 3 | Michelle Kelley | pilot-address-74 |
| 103 | 2933481 | Baseline Protocol D | REG-2154 | 4 | Jorge Sullivan | extended-address-75 |

The view `v_horse_owner` joins `horses` to `owners` on `horses.owner_id = owners.owner_id`, producing a flat row per horse that includes the owner's name, address, and contact information. This view answers the question: *Who owns each horse, and how can they be contacted?* A row from this view would show horse 100 (*Integrated Programme A*) alongside owner 1 (Craig Childs, located at *distributed-address-72* in *integrated-city-34*, with email `seasonal-email-11`), providing a complete ownership record in a single row.

**View `v_horse_horse`**

```sql
CREATE VIEW v_horse_horse AS
SELECT a.id, a.horse_id, a.horse_name, a.registration_number, b.id AS horse_id, b.horse_id AS horse_horse_id, b.horse_name AS horse_horse_name
FROM horses a JOIN horses b ON a.has_sire_horse_id = b.id;
```

| id | horse_id | horse_name | registration_number | horse_id | horse_horse_id | horse_horse_name |
|---|---|---|---|---|---|---|
| 100 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Integrated Programme A | REG-2136 | 100 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Integrated Programme A |
| 101 | 3001009030160 | Extended Standard | REG-2142 | 101 | 3001009030160 | Extended Standard |
| 102 | 5006443 | Pilot Framework | REG-2148 | 102 | 5006443 | Pilot Framework |
| 103 | 2933481 | Baseline Protocol D | REG-2154 | 103 | 2933481 | Baseline Protocol D |

The view `v_horse_horse` joins `horses` to itself through the self-referencing `has_sire_horse_id` and `has_dam_horse_id` columns, producing a row per horse that includes the names of its sire and dam. This view answers the question: *What is the parentage of each horse?* A row from this view would show horse 100 (*Integrated Programme A*) with both its sire and dam listed as itself (*Integrated Programme A*), reflecting the self-referencing data in the sample. In a production pedigree, this view would display distinct parent names, reconstructing the family tree from the normalized self-join.

**View `v_owner_horse`**

```sql
CREATE VIEW v_owner_horse AS
SELECT a.owner_id, a.owner_name, a.address, a.city, b.id AS horse_id, b.horse_id AS horse_horse_id, b.horse_name AS horse_horse_name
FROM owners a JOIN horses b ON a.horse_id = b.id;
```

| owner_id | owner_name | address | city | horse_id | horse_horse_id | horse_horse_name |
|---|---|---|---|---|---|---|
| 1 | Craig Childs | distributed-address-72 | integrated-city-34 | 100 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Integrated Programme A |
| 2 | Kimberly Smith | baseline-address-73 | seasonal-city-35 | 101 | 3001009030160 | Extended Standard |
| 3 | Michelle Kelley | pilot-address-74 | regional-city-36 | 102 | 5006443 | Pilot Framework |
| 4 | Jorge Sullivan | extended-address-75 | legacy-city-37 | 103 | 2933481 | Baseline Protocol D |

The view `v_owner_horse` is the inverse of `v_horse_owner`: it joins `owners` to `horses` on `owners.horse_id = horses.id`, producing a flat row per ownership relationship that includes the owner's details followed by the horse's attributes. This view answers the question: *Which horses does each owner hold, and what are their characteristics?* A row from this view would show owner 4 (Jorge Sullivan, at *extended-address-75* in *extended-state-87*) alongside horse 103 (*Baseline Protocol D*, a `mare` of breed `adaptive-breed-83` with status `selected`), enabling queries that start from the owner and drill down to the horse.

**View `v_performance_test_horse`**

```sql
CREATE VIEW v_performance_test_horse AS
SELECT a.test_id, a.test_date, a.jumping_score, a.breeding_value, b.id AS horse_id, b.horse_id AS horse_horse_id, b.horse_name AS horse_horse_name
FROM performance_tests a JOIN horses b ON a.horse_id = b.id;
```

| test_id | test_date | jumping_score | breeding_value | horse_id | horse_horse_id | horse_horse_name |
|---|---|---|---|---|---|---|
| 2106696 | 2024-11-13T22:42:00 | 17.45 | 19.45 | 100 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Integrated Programme A |
| 7119774 | 2025-04-24T05:59:00 | 20.90 | 23.90 | 101 | 3001009030160 | Extended Standard |
| 7441144 | 2022-09-08T12:16:00 | 24.35 | 28.35 | 102 | 5006443 | Pilot Framework |
| 8350010 | 2023-02-19T19:33:00 | 27.80 | 32.80 | 103 | 2933481 | Baseline Protocol D |

The view `v_performance_test_horse` joins `performance_tests` to `horses` on `performance_tests.horse_id = horses.id`, producing a flat row per test that includes the horse's name, breed, sex, and status alongside the test's scores and date. This view answers the question: *What are the performance test results for each horse?* A row from this view would show test `2106696` (date `2024-11-13T22:42:00`, `jumping_score` `17.45`, `breeding_value` `19.45`, type `stallion`) alongside horse 100 (*Integrated Programme A*, a `stallion` of breed `compact-breed-80` with status `selected`), allowing direct comparison of a horse's attributes against its test scores.

**View `v_performance_test_evaluator`**

```sql
CREATE VIEW v_performance_test_evaluator AS
SELECT a.test_id, a.test_date, a.jumping_score, a.breeding_value, b.id AS evaluator_id, b.evaluator_id AS evaluator_evaluator_id, b.evaluator_name AS evaluator_evaluator_name
FROM performance_tests a JOIN evaluators b ON a.evaluator_id = b.id;
```

| test_id | test_date | jumping_score | breeding_value | evaluator_id | evaluator_evaluator_id | evaluator_evaluator_name |
|---|---|---|---|---|---|---|
| 2106696 | 2024-11-13T22:42:00 | 17.45 | 19.45 | 1 | 338533 | Distributed Survey |
| 7119774 | 2025-04-24T05:59:00 | 20.90 | 23.90 | 2 | id_22 | Adaptive Corridor D |
| 7441144 | 2022-09-08T12:16:00 | 24.35 | 28.35 | 3 | f2098a7a-8fcd-11eb-924d-9cd76263cbd0 | Primary Series |
| 8350010 | 2023-02-19T19:33:00 | 27.80 | 32.80 | 4 | 10207165 | Composite Assessment |

The view `v_performance_test_evaluator` joins `performance_tests` to `evaluators` on `performance_tests.evaluator_id = evaluators.id`, producing a flat row per test that includes the evaluator's name, organization, and role alongside the test's scores and date. This view answers the question: *Which evaluator conducted each performance test, and what were the results?* A row from this view would show evaluator 2 (*Adaptive Corridor D* from *Poshmark Inc.*, role `committee_member`) alongside test `7119774` (date `2025-04-24T05:59:00`, `jumping_score` `20.90`, `breeding_value` `23.90`, type `mare`), enabling analysis of evaluator performance and scoring patterns.

**View `v_evaluator_performance_test`**

```sql
CREATE VIEW v_evaluator_performance_test AS
SELECT a.id, a.evaluator_id, a.evaluator_name, a.organization, b.test_id AS test_test_id, b.test_date AS test_test_date, b.jumping_score AS test_jumping_score
FROM evaluators a JOIN performance_tests b ON a.test_id = b.test_id;
```

| id | evaluator_id | evaluator_name | organization | test_test_id | test_test_date | test_jumping_score |
|---|---|---|---|---|---|---|
| 1 | 338533 | Distributed Survey | Whirlpool Corporation | 2106696 | 2024-11-13T22:42:00 | 17.45 |
| 2 | id_22 | Adaptive Corridor D | Poshmark Inc. | 7119774 | 2025-04-24T05:59:00 | 20.90 |
| 3 | f2098a7a-8fcd-11eb-924d-9cd76263cbd0 | Primary Series | Whirlpool Corporation | 7441144 | 2022-09-08T12:16:00 | 24.35 |
| 4 | 10207165 | Composite Assessment | Alexandria Real Estate Equities | 8350010 | 2023-02-19T19:33:00 | 27.80 |

The view `v_evaluator_performance_test` is the inverse of `v_performance_test_evaluator`: it joins `evaluators` to `performance_tests` on `evaluators.test_id = performance_tests.test_id`, producing a flat row per evaluator-test assignment that includes the evaluator's details followed by the test's scores and horse association. This view answers the question: *What tests has each evaluator conducted, and what were the outcomes?* A row from this view would show evaluator 3 (*Primary Series* from *Whirlpool Corporation*, role `official`) alongside test `7441144` (date `2022-09-08T12:16:00`, `jumping_score` `24.35`, `breeding_value` `28.35`, type `stallion`, horse `5006443`), enabling queries that start from the evaluator and enumerate their assignments.

**View `v_competition_record_horse`**

```sql
CREATE VIEW v_competition_record_horse AS
SELECT a.id, a.record_id, a.competition_name, a.competition_level, b.id AS horse_id, b.horse_id AS horse_horse_id, b.horse_name AS horse_horse_name
FROM competition_records a JOIN horses b ON a.horse_id = b.id;
```

| id | record_id | competition_name | competition_level | horse_id | horse_horse_id | horse_horse_name |
|---|---|---|---|---|---|---|
| 1 | 10449530 | Compact Model | 23 | 100 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Integrated Programme A |
| 2 | 10445619 | Legacy Cluster | 27 | 101 | 3001009030160 | Extended Standard |
| 3 | 9568457 | Regional Review A | 31 | 102 | 5006443 | Pilot Framework |
| 4 | 20743593 | Seasonal Initiative | 35 | 103 | 2933481 | Baseline Protocol D |

The view `v_competition_record_horse` joins `competition_records` to `horses` on `competition_records.horse_id = horses.id`, producing a flat row per competition that includes the horse's name, breed, and status alongside the competition's name, level, date, result, and type. This view answers the question: *How did each horse perform in competition?* A row from this view would show record 1 (competition *Compact Model*, level `23`, date `2024-07-02`, result `successful`, type `show_jumping`) alongside horse 100 (*Integrated Programme A*, a `stallion` of breed `compact-breed-80` with status `selected`), providing a complete competitive history per horse.

**View `v_competition_record_evaluator`**

```sql
CREATE VIEW v_competition_record_evaluator AS
SELECT a.id, a.record_id, a.competition_name, a.competition_level, b.id AS evaluator_id, b.evaluator_id AS evaluator_evaluator_id, b.evaluator_name AS evaluator_evaluator_name
FROM competition_records a JOIN evaluators b ON a.evaluator_id = b.id;
```

| id | record_id | competition_name | competition_level | evaluator_id | evaluator_evaluator_id | evaluator_evaluator_name |
|---|---|---|---|---|---|---|
| 1 | 10449530 | Compact Model | 23 | 1 | 338533 | Distributed Survey |
| 2 | 10445619 | Legacy Cluster | 27 | 2 | id_22 | Adaptive Corridor D |
| 3 | 9568457 | Regional Review A | 31 | 3 | f2098a7a-8fcd-11eb-924d-9cd76263cbd0 | Primary Series |
| 4 | 20743593 | Seasonal Initiative | 35 | 4 | 10207165 | Composite Assessment |

The view `v_competition_record_evaluator` joins `competition_records` to `evaluators` on `competition_records.evaluator_id = evaluators.id`, producing a flat row per competition that includes the evaluator's name, organization, and role alongside the competition's details and result. This view answers the question: *Which evaluator oversaw each competition, and what was the outcome?* A row from this view would show evaluator 4 (*Composite Assessment* from *Alexandria Real Estate Equities*, role `judge`) alongside record 4 (competition *Seasonal Initiative*, level `35`, date `2023-10-08`, result `unsuccessful`, type `show_jumping`, horse `2933481`), enabling analysis of evaluator assignments across competitive events.

**View `v_pedigree_horse`**

```sql
CREATE VIEW v_pedigree_horse AS
SELECT a.id, a.pedigree_id, a.sire_name, a.dam_name, b.id AS horse_id, b.horse_id AS horse_horse_id, b.horse_name AS horse_horse_name
FROM pedigrees a JOIN horses b ON a.horse_id = b.id;
```

| id | pedigree_id | sire_name | dam_name | horse_id | horse_horse_id | horse_horse_name |
|---|---|---|---|---|---|---|
| 1 | 4074 | Primary Survey A | Legacy Assessment D | 100 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Integrated Programme A |
| 2 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Corridor | Regional Survey | 101 | 3001009030160 | Extended Standard |
| 3 | 1250214 | Compact Series | Seasonal Corridor | 102 | 5006443 | Pilot Framework |
| 4 | 5844276 | Legacy Assessment D | Integrated Series A | 103 | 2933481 | Baseline Protocol D |

The view `v_pedigree_horse` joins `pedigrees` to `horses` on the parentage foreign keys, producing a flat row per pedigree entry that includes the horse's attributes alongside its sire and dam information. This view answers the question: *What is the full pedigree of each horse, including the names and breeds of its parents?* A row from this view would show horse 100 (*Integrated Programme A*, breed `compact-breed-80`, status `selected`) with its sire and dam both listed as *Integrated Programme A* (breed `compact-breed-80`), reflecting the self-referencing data. In production, this view would display distinct sire and dam names, enabling queries that trace lineage across generations by joining the view to itself.

## Synthesis

The schema models the horse breeding and competition domain through seven base tables that normalize entity types into their own structures, linked by foreign keys that enforce referential integrity. The `horses` table sits at the center, connected to `breeding_programs` via `breeding_program_id`, to `owners` via `owner_id`, and to itself via `has_sire_horse_id` and `has_dam_horse_id` for pedigree. The `performance_tests` and `competition_records` tables each link to `horses` and `evaluators`, capturing the dual relationship between subjects and assessors. The eleven views materialize the most common analytical joins, each answering a specific question by flattening two or more tables into a single result set. Together, the base tables and views provide a complete, queryable representation of the domain, where every row in a view can be traced back to its constituent tables and the foreign keys that bind them.