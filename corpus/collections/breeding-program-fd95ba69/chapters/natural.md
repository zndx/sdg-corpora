## Equine Breeding and Performance Evaluation Systems

The management of thoroughbred and sport horse breeding programs requires rigorous documentation across multiple operational domains: lineage tracking, owner registration, performance testing, competitive evaluation, and program administration. This chapter describes the data architecture that supports these operations, examining how individual records interlock to form a coherent picture of each horse's pedigree, competitive history, and breeding eligibility. The system captures horses as primary entities, each linked to an owner, a breeding program, a sire and dam, and a series of performance evaluations conducted by certified judges.

**Table `horses`**

| id | horse_id | horse_name | registration_number | date_of_birth | sex | breed | status | breeding_program_id | owner_id | has_sire_horse_id | has_dam_horse_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Integrated Programme A | REG-2136 | 2025-04-02 | stallion | compact-breed-80 | selected | 1 | 1 | 100 | 100 |
| 101 | 3001009030160 | Extended Standard | REG-2142 | 2022-09-13 | mare | composite-breed-81 | rejected | 2 | 2 | 101 | 101 |
| 102 | 5006443 | Pilot Framework | REG-2148 | 2023-02-24 | stallion | primary-breed-82 | pending | 3 | 3 | 102 | 102 |
| 103 | 2933481 | Baseline Protocol D | REG-2154 | 2024-07-08 | mare | adaptive-breed-83 | selected | 4 | 4 | 103 | 103 |

Each horse record carries a unique internal identifier alongside a human-readable name and a registration number such as REG-2136 or REG-2142. The sex field distinguishes stallions from mares, while the breed column classifies animals into categories like compact-breed-80 or composite-breed-81. The status field tracks the horse's current standing within the breeding program, with values including selected, rejected, and pending. Every horse is assigned to a breeding program via the breeding_program_id column and registered to an owner through the owner_id column. The pedigree is captured through self-referential links: has_sire_horse_id and has_dam_horse_id point to other horse records, enabling multi-generational lineage tracing.

**Table `owners`**

| owner_id | owner_name | address | city | state | zip_code | phone | email | horse_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Craig Childs | distributed-address-72 | integrated-city-34 | distributed-state-84 | 69434 | compact-phone-26 | seasonal-email-11 | 100 |
| 2 | Kimberly Smith | baseline-address-73 | seasonal-city-35 | baseline-state-85 | 13589 | composite-phone-27 | regional-email-12 | 101 |
| 3 | Michelle Kelley | pilot-address-74 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | primary-phone-28 | legacy-email-13 | 102 |
| 4 | Jorge Sullivan | extended-address-75 | legacy-city-37 | extended-state-87 | 1250214 | adaptive-phone-29 | compact-email-14 | 103 |

Owner records provide the contact and geographic context for each horse. The owners table stores the owner's full name, mailing address, city, state, postal code, phone number, and email address. In the current dataset, Craig Childs of integrated-city-34 owns the horse registered as REG-2136, while Kimberly Smith of seasonal-city-35 is registered to REG-2142. The horse_id column in the owners table establishes the ownership relationship, linking each person to their specific animal. This design ensures that every horse has exactly one registered owner on file, and that owner contact information is maintained in a single normalized record.

**Table `breeding_programs`**

| id | program_id | program_name | start_date | status |
|---|---|---|---|---|
| 1 | 103176 | Extended Review | 2022-09-05T20:24:00 | active |
| 2 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | inactive |
| 3 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | pending |
| 4 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | active |

Breeding programs represent the organizational framework within which horses are evaluated and managed. Each program has a unique program_id, a descriptive name, a start date, and a status indicating whether it is active, inactive, or pending. The Extended Review program (program_id 103176) began on 2022-09-05 and remains active, while the Pilot Initiative A (program_id 2986219) started on 2023-02-16 and is now inactive. The Distributed Cluster program (program_id 1562855) is scheduled to begin on 2025-12-11. Horses are assigned to programs through the breeding_program_id foreign key, and the program's status influences which horses are eligible for selection.

## Performance Testing and Evaluation

Performance testing forms the core assessment mechanism for determining a horse's breeding value and competitive readiness. Each test records a date, a jumping score, a breeding value estimate, the test type corresponding to the horse's sex, and references both the evaluated horse and the evaluator who conducted the assessment.

**Table `performance_tests`**

| test_id | test_date | jumping_score | breeding_value | test_type | horse_id | evaluator_id |
|---|---|---|---|---|---|---|
| 2106696 | 2024-11-13T22:42:00 | 17.45 | 19.45 | stallion | 100 | 1 |
| 7119774 | 2025-04-24T05:59:00 | 20.90 | 23.90 | mare | 101 | 2 |
| 7441144 | 2022-09-08T12:16:00 | 24.35 | 28.35 | stallion | 102 | 3 |
| 8350010 | 2023-02-19T19:33:00 | 27.80 | 32.80 | mare | 103 | 4 |

The performance_tests table captures quantitative assessments with precision. Test 2106696, conducted on 2024-11-13, evaluated a stallion and produced a jumping score of 17.45 and a breeding value of 19.45. Test 7119774, administered on 2025-04-24 to a mare, yielded a jumping score of 20.90 and a breeding value of 23.90. The test_type column mirrors the horse's sex designation, ensuring consistency between the animal's record and its evaluation. Each test is linked to a specific horse through the horse_id column and to a specific evaluator through the evaluator_id column, creating a traceable chain of accountability from assessment to evaluator.

**Table `evaluators`**

| id | evaluator_id | evaluator_name | organization | role | test_id |
|---|---|---|---|---|---|
| 1 | 338533 | Distributed Survey | Whirlpool Corporation | judge | 2106696 |
| 2 | id_22 | Adaptive Corridor D | Poshmark Inc. | committee_member | 7119774 |
| 3 | f2098a7a-8fcd-11eb-924d-9cd76263cbd0 | Primary Series | Whirlpool Corporation | official | 7441144 |
| 4 | 10207165 | Composite Assessment | Alexandria Real Estate Equities | judge | 8350010 |

Evaluators are the certified individuals who conduct performance tests and competition assessments. The evaluators table stores each evaluator's identifier, full name, affiliated organization, and role designation. Evaluators hold one of three role levels: judge, committee_member, or official. The Distributed Survey evaluator (evaluator_id 338533) serves as a judge affiliated with Whirlpool Corporation, while the Adaptive Corridor D evaluator (evaluator_id id_22) serves as a committee member with Poshmark Inc. The test_id column in the evaluators table links each evaluator to the specific performance test they conducted, establishing a direct relationship between the assessor and the assessment.

## Competition Records

Beyond controlled performance tests, horses participate in formal competitions that generate additional performance data. Competition records document the event name, level, date, outcome, and discipline type.

**Table `competition_records`**

| id | record_id | competition_name | competition_level | competition_date | result | competition_type | horse_id | evaluator_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 10449530 | Compact Model | 23 | 2024-07-02 | successful | show_jumping | 100 | 1 |
| 2 | 10445619 | Legacy Cluster | 27 | 2025-12-13 | unsuccessful | eventing | 101 | 2 |
| 3 | 9568457 | Regional Review A | 31 | 2022-05-24 | successful | hunter | 102 | 3 |
| 4 | 20743593 | Seasonal Initiative | 35 | 2023-10-08 | unsuccessful | show_jumping | 103 | 4 |

Competition records capture the results of formal equestrian events. The Compact Model competition (record_id 10449530) held on 2024-07-02 was a show_jumping event at level 23 that resulted in a successful outcome for horse 100. The Legacy Cluster competition (record_id 10445619) on 2025-12-13 was an eventing competition at level 27 that produced an unsuccessful result for horse 101. Competition types include show_jumping, eventing, and hunter disciplines. Each record is associated with a specific horse and an evaluator who oversaw or judged the competition, ensuring that competitive outcomes are attributed to both the animal and the official responsible for the assessment.

## Pedigree Management

The pedigree system tracks the lineage of each horse by recording its sire and dam through self-referential links in the horses table. The pedigrees table provides a normalized view of these relationships, enabling clear genealogical queries.

**Table `pedigrees`**

| id | pedigree_id | sire_name | dam_name | grand_sire_name | grand_dam_name | jumping_sire_count | horse_id | includes_sire_horse_id | includes_dam_horse_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 4074 | Primary Survey A | Legacy Assessment D | Composite Series | Legacy Review D | 14 | 100 | 100 | 100 |
| 2 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | Composite Corridor | Regional Survey | Compact Assessment A | Regional Initiative | 15 | 101 | 101 | 101 |
| 3 | 1250214 | Compact Series | Seasonal Corridor | Legacy Survey | Seasonal Model | 7 | 102 | 102 | 102 |
| 4 | 5844276 | Legacy Assessment D | Integrated Series A | Regional Corridor | Integrated Cluster A | 5 | 103 | 103 | 103 |

Pedigree records formalize the parentage relationships that define a horse's genetic background. Each pedigree entry links a horse to its sire and dam, creating a directed graph of ancestry that can be traversed across multiple generations. The self-referential nature of the pedigree system means that any horse with recorded parents can itself serve as a sire or dam for future generations, building a continuous lineage chain.

## View-Based Data Integration

The system provides a set of materialized views that join base tables to answer common operational questions. Each view combines data from two or more tables to present a unified record that supports reporting and analysis.

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

The v_horse_breeding_program view joins the horses table with the breeding_programs table, answering the question of which breeding program each horse is enrolled in and what the program's current status is. For example, the horse named Integrated Programme A (horse_id 100) is enrolled in the Extended Review program (program_id 103176), which has an active status. This view enables program administrators to quickly identify which horses are associated with active programs versus inactive or pending ones, supporting resource allocation and eligibility decisions.

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

The v_horse_owner view joins the horses table with the owners table, providing a complete picture of each horse's registration and its owner's contact information. The horse Integrated Programme A (horse_id 100) is owned by Craig Childs, whose address is in integrated-city-34 with postal code 69434. This view is essential for administrative correspondence, health record management, and legal documentation, as it consolidates the animal's identity with its owner's full contact details in a single queryable record.

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

The v_horse_horse view joins the horses table to itself through the sire and dam relationships, producing a view where each horse's record is augmented with the names and details of its parents. When a horse's has_sire_horse_id and has_dam_horse_id both reference its own record (as seen with horse_id 100), it indicates that the sire and dam are the same animal, which may represent a special breeding scenario or a data entry convention. This view enables breeders to trace lineage directly from any horse's record without requiring recursive queries.

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

The v_owner_horse view joins the owners table with the horses table, presenting the relationship from the owner's perspective. This view answers the question of which horses are registered to a given owner. Craig Childs (owner_id 1) is registered to horse Integrated Programme A (horse_id 100), which is a stallion of compact-breed-80 with selected status. This perspective is useful for owners who need to review all their registered animals, for veterinarians managing multiple patients under one owner, and for breeding program coordinators tracking ownership distributions across programs.

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

The v_performance_test_horse view joins the performance_tests table with the horses table, linking each test result to the full identity and characteristics of the evaluated animal. Test 2106696, conducted on 2024-11-13, evaluated Integrated Programme A (horse_id 100), a stallion of compact-breed-80, producing a jumping score of 17.45 and a breeding value of 19.45. This view is critical for performance analysis, as it allows breeders to correlate test scores with breed, sex, and program membership, identifying patterns in performance across different horse categories.

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

The v_performance_test_evaluator view joins the performance_tests table with the evaluators table, connecting each test result to the evaluator who conducted it. Test 2106696 was administered by the Distributed Survey evaluator (evaluator_id 338533), who holds the role of judge at Whirlpool Corporation. This view supports quality assurance and evaluator performance tracking, enabling program managers to review which evaluators have assessed which horses and to identify any patterns in scoring that might warrant further investigation.

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

The v_evaluator_performance_test view joins the evaluators table with the performance_tests table, presenting the relationship from the evaluator's perspective. This view answers the question of which performance tests each evaluator has conducted. The Distributed Survey evaluator (evaluator_id 338533) conducted test 2106696 on 2024-11-13, which produced a jumping score of 17.45 and a breeding value of 19.45 for a stallion. This perspective is valuable for workload management, evaluator certification tracking, and historical review of an evaluator's assessment record.

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

The v_competition_record_horse view joins the competition_records table with the horses table, linking each competition result to the full identity of the competing animal. The Compact Model competition (record_id 10449530) was a show_jumping event at level 23 held on 2024-07-02, in which Integrated Programme A (horse_id 100) achieved a successful result. This view enables competition historians and breeders to analyze a horse's competitive record across different disciplines and levels, identifying strengths and areas for improvement.

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

The v_competition_record_evaluator view joins the competition_records table with the evaluators table, connecting each competition result to the evaluator who oversaw the event. The Compact Model competition (record_id 10449530) was overseen by evaluator 1 (evaluator_id 338533), the Distributed Survey judge from Whirlpool Corporation. This view supports competition administration by tracking which evaluators have been assigned to which events, ensuring proper coverage and enabling review of evaluator assignments across the competition calendar.

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

The v_pedigree_horse view joins the pedigrees table with the horses table, providing a comprehensive view of each horse's lineage with full details about both parents. This view answers the question of what genetic background each horse carries, presenting the sire and dam names, breeds, and statuses alongside the offspring's own record. The pedigree view is foundational for breeding decisions, as it allows breeders to evaluate genetic diversity, inbreeding coefficients, and the performance history of ancestors when selecting mating pairs.