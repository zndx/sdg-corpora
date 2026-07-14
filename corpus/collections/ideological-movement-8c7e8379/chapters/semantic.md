The domain under examination concerns the mapping of ideological movements to their strategic operations, territorial ambitions, and the religious, political, and intellectual ecosystems that surround them. At its core, the model captures how movements such as the one identified as `MOV-2489`—founded in year 43 under the founder name `Distributed Assessment`—pursue ultimate goals like `tamkin` across operational territories such as the `arab_islamic_world`. Each movement is linked to a strategic operation (for instance, operation `4221`, named `tawtin`, which employs `mosque_building` as its implementation method) and is situated within a geopolitical region (region `REG-2093`, a `country`-type entity with `high` current influence). Religious organizations like `ORG-2637` (`Extended Review`, affiliated with `muslim_brotherhood`) anchor themselves to movements and regions, while individuals such as `Theodore Mcgrath` (person identifier `Block Magic`) connect to organizations, regions, and publications. The relational schema materializes this network through six base tables and fourteen derived views, each view representing a specific join that reconstructs a domain fact from the normalized tables.

## The Base Tables

The foundation of the schema consists of six tables, each representing a distinct entity type in the domain. The first table, `ideological_movements`, stores the high-level movement entities. Its primary key is `ideological_movement_id`, a surrogate integer identifier. The column `movement_identifier` holds human-readable codes such as `MOV-2489`, `MOV-2496`, `MOV-2503`, and `MOV-2510`. Additional columns capture `founding_year` (43 through 58 in the sample), `founder_name` (e.g., `Distributed Assessment`, `Adaptive Survey D`), `strategic_phase` (one of `birth`, `ascent`, `apogee`, `decline`), `ultimate_goal` (values include `tamkin`, `tawtin`, `caliphate_restoration`), `operational_territory` (such as `arab_islamic_world`, `europe`, `west`), and a boolean flag `is_political`. Two foreign-key columns, `strategic_operation_id` and `geopolitical_region_id`, link each movement to its associated operation and region respectively.

**Table `ideological_movements`**

| ideological_movement_id | movement_identifier | founding_year | founder_name | strategic_phase | ultimate_goal | operational_territory | is_political | strategic_operation_id | geopolitical_region_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | MOV-2489 | 43 | Distributed Assessment | birth | tamkin | arab_islamic_world | false | 100 | 1 |
| 101 | MOV-2496 | 48 | Adaptive Survey D | ascent | tawtin | europe | true | 101 | 2 |
| 102 | MOV-2503 | 53 | Primary Corridor | apogee | caliphate_restoration | west | false | 102 | 3 |
| 103 | MOV-2510 | 58 | Composite Series | decline | tamkin | arab_islamic_world | true | 103 | 4 |

The second table, `strategic_operations`, records the tactical actions taken in the name of—or against—these movements. Its primary key is `id`, an integer that in the sample ranges from 100 to 103. The column `operation_code` holds a mix of short numeric codes (`4221`, `468`) and UUIDs (`e29bafe2-8fd1-11eb-924d-9cd76263cbd0`). The `operation_name` column contains values like `tawtin` and `tamkin`, while `description` holds longer labels such as `Extended Survey` and `Pilot Corridor A`. The `target_region` column stores identifiers like `extended-target-87` and `integrated-target-88`. The `implementation_method` column enumerates tactics including `mosque_building`, `property_purchase`, `school_establishment`, and `political_infiltration`. A boolean `is_coercive` flag distinguishes coercive from non-coercive operations. Foreign keys `ideological_movement_id` and `geopolitical_region_id` tie each operation to its parent movement and target region.

**Table `strategic_operations`**

| id | operation_code | operation_name | description | target_region | implementation_method | is_coercive | ideological_movement_id | geopolitical_region_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 4221 | tawtin | Extended Survey | extended-target-87 | mosque_building | true | 100 | 1 |
| 101 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | tamkin | Pilot Corridor A | integrated-target-88 | property_purchase | false | 101 | 2 |
| 102 | 468 | tawtin | Baseline Series | seasonal-target-89 | school_establishment | true | 102 | 3 |
| 103 | 5f90e206-8fcd-11eb-924d-9cd76263cbd0 | tamkin | Distributed Assessment | regional-target-90 | political_infiltration | false | 103 | 4 |

The third table, `geopolitical_regions`, models the geographic-political entities where these dynamics unfold. Its primary key is `id`, and the column `region_identifier` holds codes such as `REG-2093` and `REG-2100`. The `region_name` column mirrors some of the movement and operation names (e.g., `Distributed Assessment`, `Adaptive Survey D`), while `region_type` classifies the entity as `country`, `continent`, or `city`. The `current_influence_level` column takes values like `high`, `medium`, `low`, and `none`. The `historical_status` column records whether a region is an `acquired_territory`, `target_territory`, or `neutral`. Foreign keys `strategic_operation_id` and `religious_organization_id` link each region to an operation and an organization.

**Table `geopolitical_regions`**

| id | region_identifier | region_name | region_type | current_influence_level | historical_status | strategic_operation_id | religious_organization_id |
|---|---|---|---|---|---|---|---|
| 1 | REG-2093 | Distributed Assessment | country | high | acquired_territory | 100 | 1 |
| 2 | REG-2100 | Adaptive Survey D | continent | medium | target_territory | 101 | 2 |
| 3 | REG-2107 | Primary Corridor | city | low | neutral | 102 | 3 |
| 4 | REG-2114 | Composite Series | country | none | acquired_territory | 103 | 4 |

The fourth table, `religious_organizations`, captures faith-based and political organizations. Its primary key is `religious_organization_id`, and the column `org_identifier` holds codes such as `ORG-2637` and `ORG-2643`. The `org_name` column contains names like `Extended Review` and `Pilot Initiative A`. The `affiliation` column enumerates affiliations including `muslim_brotherhood`, `independent`, `sufi`, and `apolitical`. The `founding_date` column stores ISO timestamps (e.g., `2023-06-24T05:03:00`), and `headquarters_location` holds identifiers such as `composite-headquar-63`. The boolean `is_political` flag and the integer `membership_count` (ranging from 77 to 601) provide organizational attributes. Foreign keys `ideological_movement_id`, `geopolitical_region_id`, and `individual_id` link each organization to its movement, region, and a representative individual. The columns `created_at` and `updated_at` record audit timestamps.

**Table `religious_organizations`**

| religious_organization_id | org_identifier | org_name | affiliation | founding_date | headquarters_location | is_political | membership_count | ideological_movement_id | geopolitical_region_id | individual_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ORG-2637 | Extended Review | muslim_brotherhood | 2023-06-24T05:03:00 | composite-headquar-63 | false | 242 | 100 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ORG-2643 | Pilot Initiative A | independent | 2024-11-08T12:20:00 | primary-headquar-64 | true | 77 | 101 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | ORG-2649 | Baseline Model | sufi | 2025-04-19T19:37:00 | adaptive-headquar-65 | false | 601 | 102 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | ORG-2655 | Distributed Cluster | apolitical | 2022-09-03T02:54:00 | distributed-headquar-66 | true | 300 | 103 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The fifth table, `individuals`, models persons involved in the domain. Its primary key is `individual_id`, and the column `person_identifier` holds values such as `Block Magic`, `Susan Butler`, `Guam International Airport`, and `Norma Fisher`. The `full_name` column contains names like `Theodore Mcgrath` and `Norma Fisher`. The columns `birth_country` and `current_residence` store location identifiers (e.g., `legacy-birth-19`, `integrated-current-34`). The `former_affiliation` column records past organizational ties (`muslim_brotherhood` or `none`), and `current_stance` captures the person's position (`critical`, `supportive`, `neutral`, `apolitical`). The integer `publications_count` (22, 7, 14, 316) indicates the number of works authored. Foreign keys `religious_organization_id`, `geopolitical_region_id`, and `publication_id` link each individual to an organization, a region, and a publication.

**Table `individuals`**

| individual_id | person_identifier | full_name | birth_country | current_residence | former_affiliation | current_stance | publications_count | religious_organization_id | geopolitical_region_id | publication_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Block Magic | Theodore Mcgrath | legacy-birth-19 | integrated-current-34 | muslim_brotherhood | critical | 22 | 1 | 1 | 1000 |
| 2 | Susan Butler | Account Name | compact-birth-20 | seasonal-current-35 | none | supportive | 7 | 2 | 2 | 1001 |
| 3 | Guam International Airport | Saipan International Airport | composite-birth-21 | regional-current-36 | muslim_brotherhood | neutral | 14 | 3 | 3 | 1002 |
| 4 | Norma Fisher | Norma Fisher | primary-birth-22 | legacy-current-37 | none | apolitical | 316 | 4 | 4 | 1003 |

The sixth table, `publications`, stores written works. Its primary key is `publication_id`, and the column `pub_identifier` holds codes such as `PUB-2198` and `PUB-2202`. The `title` column contains names like `Compact Initiative` and `Legacy Model`. The `publication_date` column stores dates (e.g., `2025-12-01`), and `publisher` holds identifiers such as `pilot-publishe-50`. The `language` column stores codes like `composite-language-45`, and `subject_matter` classifies the work as `autobiography`, `political_critique`, or `theological_analysis`. The boolean `is_critical_of_movement` indicates whether the publication critiques an ideological movement. Foreign keys `individual_id` and `ideological_movement_id` link each publication to its author and its subject movement. The `created_at` column records the creation timestamp.

**Table `publications`**

| publication_id | pub_identifier | title | publication_date | publisher | language | subject_matter | is_critical_of_movement | individual_id | ideological_movement_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | PUB-2198 | Compact Initiative | 2025-12-01 | pilot-publishe-50 | composite-language-45 | autobiography | false | 1 | 100 | 2025-01-01 00:14:00 |
| 1001 | PUB-2202 | Legacy Model | 2022-05-12 | extended-publishe-51 | primary-language-46 | political_critique | true | 2 | 101 | 2025-02-06 03:14:00 |
| 1002 | PUB-2206 | Regional Cluster A | 2023-10-23 | integrated-publishe-52 | adaptive-language-47 | theological_analysis | false | 3 | 102 | 2025-03-11 06:14:00 |
| 1003 | PUB-2210 | Seasonal Review | 2024-03-07 | seasonal-publishe-53 | distributed-language-48 | autobiography | true | 4 | 103 | 2025-04-16 09:14:00 |

## Foreign-Key Relationships and Cardinality

The foreign-key columns embedded in each base table encode the cardinality-bounded relationships of the domain. In `ideological_movements`, the columns `strategic_operation_id` and `geopolitical_region_id` each enforce a many-to-one relationship: many movements may reference the same operation or region, but each movement references exactly one of each. The sample data confirms this—movement `MOV-2489` (id 100) references operation 100 and region 1, while movement `MOV-2496` (id 101) references operation 101 and region 2.

In `strategic_operations`, the foreign keys `ideological_movement_id` and `geopolitical_region_id` similarly enforce many-to-one relationships. Operation `4221` (id 100) is linked to movement 100 and region 1, establishing that the `tawtin` operation is a tactical instantiation of the `MOV-2489` movement within the `REG-2093` region.

The `geopolitical_regions` table carries foreign keys `strategic_operation_id` and `religious_organization_id`. Region `REG-2093` (id 1) references operation 100 and organization 1, meaning the `Extended Review` organization operates within a region targeted by the `tawtin` operation.

In `religious_organizations`, the foreign keys `ideological_movement_id`, `geopolitical_region_id`, and `individual_id` create a three-way linkage. Organization `ORG-2637` (id 1) references movement 100, region 1, and individual 1, binding the `Extended Review` organization to the `MOV-2489` movement, the `REG-2093` region, and the person `Theodore Mcgrath`.

The `individuals` table carries foreign keys `religious_organization_id`, `geopolitical_region_id`, and `publication_id`. Individual 1 (`Theodore Mcgrath`) references organization 1, region 1, and publication 1000, meaning this person is affiliated with `Extended Review`, resides in region `REG-2093`, and authored the publication `Compact Initiative`.

Finally, `publications` carries foreign keys `individual_id` and `ideological_movement_id`. Publication `PUB-2198` (id 1000) references individual 1 and movement 100, confirming that `Compact Initiative` was authored by `Theodore Mcgrath` and concerns the `MOV-2489` movement.

## The Derived Views

Each view materializes a specific join across two base tables, answering a focused question about the domain. The first view, `v_ideological_movement_strategic_operation`, joins `ideological_movements` to `strategic_operations` on the `strategic_operation_id` foreign key. It answers the question: "Which strategic operation is associated with each ideological movement?" Reading the sample, the row for movement `MOV-2489` reveals its associated operation `4221` (`tawtin`), showing that the movement founded in year 43 pursues its `tamkin` goal through the `mosque_building` method.

**View `v_ideological_movement_strategic_operation`**

```sql
CREATE VIEW v_ideological_movement_strategic_operation AS
SELECT a.ideological_movement_id, a.movement_identifier, a.founding_year, a.founder_name, b.id AS operation_id, b.operation_code AS operation_operation_code, b.operation_name AS operation_operation_name
FROM ideological_movements a JOIN strategic_operations b ON a.strategic_operation_id = b.id;
```

| ideological_movement_id | movement_identifier | founding_year | founder_name | operation_id | operation_operation_code | operation_operation_name |
|---|---|---|---|---|---|---|
| 100 | MOV-2489 | 43 | Distributed Assessment | 100 | 4221 | tawtin |
| 101 | MOV-2496 | 48 | Adaptive Survey D | 101 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | tamkin |
| 102 | MOV-2503 | 53 | Primary Corridor | 102 | 468 | tawtin |
| 103 | MOV-2510 | 58 | Composite Series | 103 | 5f90e206-8fcd-11eb-924d-9cd76263cbd0 | tamkin |

The second view, `v_ideological_movement_geopolitical_region`, joins `ideological_movements` to `geopolitical_regions` on `geopolitical_region_id`. It answers: "In which geopolitical region does each movement operate?" The row for movement `MOV-2496` (`Adaptive Survey D`) shows it operates in region `REG-2100`, a `continent`-type entity with `medium` influence and `target_territory` status, indicating that this movement's `tawtin` goal is pursued within a continent-level target zone.

**View `v_ideological_movement_geopolitical_region`**

```sql
CREATE VIEW v_ideological_movement_geopolitical_region AS
SELECT a.ideological_movement_id, a.movement_identifier, a.founding_year, a.founder_name, b.id AS region_id, b.region_identifier AS region_region_identifier, b.region_name AS region_region_name
FROM ideological_movements a JOIN geopolitical_regions b ON a.geopolitical_region_id = b.id;
```

| ideological_movement_id | movement_identifier | founding_year | founder_name | region_id | region_region_identifier | region_region_name |
|---|---|---|---|---|---|---|
| 100 | MOV-2489 | 43 | Distributed Assessment | 1 | REG-2093 | Distributed Assessment |
| 101 | MOV-2496 | 48 | Adaptive Survey D | 2 | REG-2100 | Adaptive Survey D |
| 102 | MOV-2503 | 53 | Primary Corridor | 3 | REG-2107 | Primary Corridor |
| 103 | MOV-2510 | 58 | Composite Series | 4 | REG-2114 | Composite Series |

The third view, `v_strategic_operation_ideological_movement`, performs the inverse join: it starts from `strategic_operations` and links to `ideological_movements`. It answers: "Which ideological movement drives each strategic operation?" The row for operation `e29bafe2-8fd1-11eb-924d-9cd76263cbd0` (`tamkin`, `Pilot Corridor A`) reveals its parent movement `MOV-2496` (`Adaptive Survey D`), establishing that this UUID-coded operation is a tactical instantiation of the movement's `tawtin` ultimate goal.

**View `v_strategic_operation_ideological_movement`**

```sql
CREATE VIEW v_strategic_operation_ideological_movement AS
SELECT a.id, a.operation_code, a.operation_name, a.description, b.ideological_movement_id AS movement_ideological_movement_id, b.movement_identifier AS movement_movement_identifier, b.founding_year AS movement_founding_year
FROM strategic_operations a JOIN ideological_movements b ON a.ideological_movement_id = b.ideological_movement_id;
```

| id | operation_code | operation_name | description | movement_ideological_movement_id | movement_movement_identifier | movement_founding_year |
|---|---|---|---|---|---|---|
| 100 | 4221 | tawtin | Extended Survey | 100 | MOV-2489 | 43 |
| 101 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | tamkin | Pilot Corridor A | 101 | MOV-2496 | 48 |
| 102 | 468 | tawtin | Baseline Series | 102 | MOV-2503 | 53 |
| 103 | 5f90e206-8fcd-11eb-924d-9cd76263cbd0 | tamkin | Distributed Assessment | 103 | MOV-2510 | 58 |

The fourth view, `v_strategic_operation_geopolitical_region`, joins `strategic_operations` to `geopolitical_regions` on `geopolitical_region_id`. It answers: "Which geopolitical region is targeted by each strategic operation?" The row for operation `468` (`tawtin`, `Baseline Series`) shows it targets region `REG-2107`, a `city`-type entity with `low` influence and `neutral` historical status, indicating a non-coercive `school_establishment` operation aimed at a low-influence urban center.

**View `v_strategic_operation_geopolitical_region`**

```sql
CREATE VIEW v_strategic_operation_geopolitical_region AS
SELECT a.id, a.operation_code, a.operation_name, a.description, b.id AS region_id, b.region_identifier AS region_region_identifier, b.region_name AS region_region_name
FROM strategic_operations a JOIN geopolitical_regions b ON a.geopolitical_region_id = b.id;
```

| id | operation_code | operation_name | description | region_id | region_region_identifier | region_region_name |
|---|---|---|---|---|---|---|
| 100 | 4221 | tawtin | Extended Survey | 1 | REG-2093 | Distributed Assessment |
| 101 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | tamkin | Pilot Corridor A | 2 | REG-2100 | Adaptive Survey D |
| 102 | 468 | tawtin | Baseline Series | 3 | REG-2107 | Primary Corridor |
| 103 | 5f90e206-8fcd-11eb-924d-9cd76263cbd0 | tamkin | Distributed Assessment | 4 | REG-2114 | Composite Series |

The fifth view, `v_geopolitical_region_strategic_operation`, performs the inverse join from `geopolitical_regions` to `strategic_operations`. It answers: "Which strategic operation is associated with each geopolitical region?" The row for region `REG-2093` (`Distributed Assessment`, a `country` with `high` influence and `acquired_territory` status) reveals its associated operation `4221` (`tawtin`), confirming that this high-influence acquired territory is the operational theater for the `mosque_building` tactic.

**View `v_geopolitical_region_strategic_operation`**

```sql
CREATE VIEW v_geopolitical_region_strategic_operation AS
SELECT a.id, a.region_identifier, a.region_name, a.region_type, b.id AS operation_id, b.operation_code AS operation_operation_code, b.operation_name AS operation_operation_name
FROM geopolitical_regions a JOIN strategic_operations b ON a.strategic_operation_id = b.id;
```

| id | region_identifier | region_name | region_type | operation_id | operation_operation_code | operation_operation_name |
|---|---|---|---|---|---|---|
| 1 | REG-2093 | Distributed Assessment | country | 100 | 4221 | tawtin |
| 2 | REG-2100 | Adaptive Survey D | continent | 101 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | tamkin |
| 3 | REG-2107 | Primary Corridor | city | 102 | 468 | tawtin |
| 4 | REG-2114 | Composite Series | country | 103 | 5f90e206-8fcd-11eb-924d-9cd76263cbd0 | tamkin |

The sixth view, `v_geopolitical_region_religious_organization`, joins `geopolitical_regions` to `religious_organizations` on `religious_organization_id`. It answers: "Which religious organization operates within each geopolitical region?" The row for region `REG-2100` (`Adaptive Survey D`, a `continent` with `medium` influence) reveals its organization `ORG-2643` (`Pilot Initiative A`, affiliated with `independent`, membership 77), showing that an independent faith-based group with a small membership operates within this medium-influence continent.

**View `v_geopolitical_region_religious_organization`**

```sql
CREATE VIEW v_geopolitical_region_religious_organization AS
SELECT a.id, a.region_identifier, a.region_name, a.region_type, b.religious_organization_id AS organization_religious_organization_id, b.org_identifier AS organization_org_identifier, b.org_name AS organization_org_name
FROM geopolitical_regions a JOIN religious_organizations b ON a.religious_organization_id = b.religious_organization_id;
```

| id | region_identifier | region_name | region_type | organization_religious_organization_id | organization_org_identifier | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | REG-2093 | Distributed Assessment | country | 1 | ORG-2637 | Extended Review |
| 2 | REG-2100 | Adaptive Survey D | continent | 2 | ORG-2643 | Pilot Initiative A |
| 3 | REG-2107 | Primary Corridor | city | 3 | ORG-2649 | Baseline Model |
| 4 | REG-2114 | Composite Series | country | 4 | ORG-2655 | Distributed Cluster |

The seventh view, `v_religious_organization_ideological_movement`, joins `religious_organizations` to `ideological_movements` on `ideological_movement_id`. It answers: "Which ideological movement is each religious organization affiliated with?" The row for organization `ORG-2637` (`Extended Review`, `muslim_brotherhood` affiliation, 242 members) reveals its movement `MOV-2489` (`Distributed Assessment`, strategic phase `birth`, ultimate goal `tamkin`), establishing that this small Muslim Brotherhood-affiliated organization is ideologically aligned with a nascent movement pursuing territorial consolidation.

**View `v_religious_organization_ideological_movement`**

```sql
CREATE VIEW v_religious_organization_ideological_movement AS
SELECT a.religious_organization_id, a.org_identifier, a.org_name, a.affiliation, b.ideological_movement_id AS movement_ideological_movement_id, b.movement_identifier AS movement_movement_identifier, b.founding_year AS movement_founding_year
FROM religious_organizations a JOIN ideological_movements b ON a.ideological_movement_id = b.ideological_movement_id;
```

| religious_organization_id | org_identifier | org_name | affiliation | movement_ideological_movement_id | movement_movement_identifier | movement_founding_year |
|---|---|---|---|---|---|---|
| 1 | ORG-2637 | Extended Review | muslim_brotherhood | 100 | MOV-2489 | 43 |
| 2 | ORG-2643 | Pilot Initiative A | independent | 101 | MOV-2496 | 48 |
| 3 | ORG-2649 | Baseline Model | sufi | 102 | MOV-2503 | 53 |
| 4 | ORG-2655 | Distributed Cluster | apolitical | 103 | MOV-2510 | 58 |

The eighth view, `v_religious_organization_geopolitical_region`, joins `religious_organizations` to `geopolitical_regions` on `geopolitical_region_id`. It answers: "In which geopolitical region is each religious organization located?" The row for organization `ORG-2649` (`Baseline Model`, `sufi` affiliation, 601 members) reveals its region `REG-2107` (`Primary Corridor`, a `city` with `low` influence and `neutral` status), indicating that this largest organization in the sample (601 members) operates within a low-influence neutral city.

**View `v_religious_organization_geopolitical_region`**

```sql
CREATE VIEW v_religious_organization_geopolitical_region AS
SELECT a.religious_organization_id, a.org_identifier, a.org_name, a.affiliation, b.id AS region_id, b.region_identifier AS region_region_identifier, b.region_name AS region_region_name
FROM religious_organizations a JOIN geopolitical_regions b ON a.geopolitical_region_id = b.id;
```

| religious_organization_id | org_identifier | org_name | affiliation | region_id | region_region_identifier | region_region_name |
|---|---|---|---|---|---|---|
| 1 | ORG-2637 | Extended Review | muslim_brotherhood | 1 | REG-2093 | Distributed Assessment |
| 2 | ORG-2643 | Pilot Initiative A | independent | 2 | REG-2100 | Adaptive Survey D |
| 3 | ORG-2649 | Baseline Model | sufi | 3 | REG-2107 | Primary Corridor |
| 4 | ORG-2655 | Distributed Cluster | apolitical | 4 | REG-2114 | Composite Series |

The ninth view, `v_religious_organization_individual`, joins `religious_organizations` to `individuals` on `individual_id`. It answers: "Which individual is associated with each religious organization?" The row for organization `ORG-2643` (`Pilot Initiative A`, `independent`, 77 members) reveals its individual `Susan Butler` (person identifier `Account Name`, current stance `supportive`, 7 publications), showing that a supportive individual with a modest publication record is linked to this independent organization.

**View `v_religious_organization_individual`**

```sql
CREATE VIEW v_religious_organization_individual AS
SELECT a.religious_organization_id, a.org_identifier, a.org_name, a.affiliation, b.individual_id AS individual_individual_id, b.person_identifier AS individual_person_identifier, b.full_name AS individual_full_name
FROM religious_organizations a JOIN individuals b ON a.individual_id = b.individual_id;
```

| religious_organization_id | org_identifier | org_name | affiliation | individual_individual_id | individual_person_identifier | individual_full_name |
|---|---|---|---|---|---|---|
| 1 | ORG-2637 | Extended Review | muslim_brotherhood | 1 | Block Magic | Theodore Mcgrath |
| 2 | ORG-2643 | Pilot Initiative A | independent | 2 | Susan Butler | Account Name |
| 3 | ORG-2649 | Baseline Model | sufi | 3 | Guam International Airport | Saipan International Airport |
| 4 | ORG-2655 | Distributed Cluster | apolitical | 4 | Norma Fisher | Norma Fisher |

The tenth view, `v_individual_religious_organization`, performs the inverse join from `individuals` to `religious_organizations`. It answers: "Which religious organization is each individual affiliated with?" The row for individual `Norma Fisher` (person identifier `Norma Fisher`, birth country `primary-birth-22`, current stance `apolitical`, 316 publications) reveals her organization `ORG-2655` (`Distributed Cluster`, `apolitical` affiliation, 300 members), indicating that this highly prolific author (316 publications) is affiliated with an apolitical organization of moderate size.

**View `v_individual_religious_organization`**

```sql
CREATE VIEW v_individual_religious_organization AS
SELECT a.individual_id, a.person_identifier, a.full_name, a.birth_country, b.religious_organization_id AS organization_religious_organization_id, b.org_identifier AS organization_org_identifier, b.org_name AS organization_org_name
FROM individuals a JOIN religious_organizations b ON a.religious_organization_id = b.religious_organization_id;
```

| individual_id | person_identifier | full_name | birth_country | organization_religious_organization_id | organization_org_identifier | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | Block Magic | Theodore Mcgrath | legacy-birth-19 | 1 | ORG-2637 | Extended Review |
| 2 | Susan Butler | Account Name | compact-birth-20 | 2 | ORG-2643 | Pilot Initiative A |
| 3 | Guam International Airport | Saipan International Airport | composite-birth-21 | 3 | ORG-2649 | Baseline Model |
| 4 | Norma Fisher | Norma Fisher | primary-birth-22 | 4 | ORG-2655 | Distributed Cluster |

The eleventh view, `v_individual_geopolitical_region`, joins `individuals` to `geopolitical_regions` on `geopolitical_region_id`. It answers: "In which geopolitical region is each individual located?" The row for individual `Guam International Airport` (full name `Saipan International Airport`, former affiliation `muslim_brotherhood`, current stance `neutral`, 14 publications) reveals his region `REG-2107` (`Primary Corridor`, a `city` with `low` influence), showing that a neutral individual with a Muslim Brotherhood background resides in a low-influence urban center.

**View `v_individual_geopolitical_region`**

```sql
CREATE VIEW v_individual_geopolitical_region AS
SELECT a.individual_id, a.person_identifier, a.full_name, a.birth_country, b.id AS region_id, b.region_identifier AS region_region_identifier, b.region_name AS region_region_name
FROM individuals a JOIN geopolitical_regions b ON a.geopolitical_region_id = b.id;
```

| individual_id | person_identifier | full_name | birth_country | region_id | region_region_identifier | region_region_name |
|---|---|---|---|---|---|---|
| 1 | Block Magic | Theodore Mcgrath | legacy-birth-19 | 1 | REG-2093 | Distributed Assessment |
| 2 | Susan Butler | Account Name | compact-birth-20 | 2 | REG-2100 | Adaptive Survey D |
| 3 | Guam International Airport | Saipan International Airport | composite-birth-21 | 3 | REG-2107 | Primary Corridor |
| 4 | Norma Fisher | Norma Fisher | primary-birth-22 | 4 | REG-2114 | Composite Series |

The twelfth view, `v_individual_publication`, joins `individuals` to `publications` on `publication_id`. It answers: "Which publication is associated with each individual?" The row for individual `Theodore Mcgrath` (person identifier `Block Magic`, birth country `legacy-birth-19`, current stance `critical`, 22 publications) reveals his publication `PUB-2198` (`Compact Initiative`, published `2025-12-01`, subject `autobiography`, not critical of the movement), indicating that this critical individual authored an autobiographical work that does not critique the movement it concerns.

**View `v_individual_publication`**

```sql
CREATE VIEW v_individual_publication AS
SELECT a.individual_id, a.person_identifier, a.full_name, a.birth_country, b.publication_id AS publication_publication_id, b.pub_identifier AS publication_pub_identifier, b.title AS publication_title
FROM individuals a JOIN publications b ON a.publication_id = b.publication_id;
```

| individual_id | person_identifier | full_name | birth_country | publication_publication_id | publication_pub_identifier | publication_title |
|---|---|---|---|---|---|---|
| 1 | Block Magic | Theodore Mcgrath | legacy-birth-19 | 1000 | PUB-2198 | Compact Initiative |
| 2 | Susan Butler | Account Name | compact-birth-20 | 1001 | PUB-2202 | Legacy Model |
| 3 | Guam International Airport | Saipan International Airport | composite-birth-21 | 1002 | PUB-2206 | Regional Cluster A |
| 4 | Norma Fisher | Norma Fisher | primary-birth-22 | 1003 | PUB-2210 | Seasonal Review |

The thirteenth view, `v_publication_individual`, performs the inverse join from `publications` to `individuals`. It answers: "Who authored each publication?" The row for publication `PUB-2202` (`Legacy Model`, published `2022-05-12`, publisher `extended-publishe-51`, subject `political_critique`, critical of the movement) reveals its author `Susan Butler` (person identifier `Account Name`, current stance `supportive`, 7 publications), showing that a supportive individual authored a critical political critique.

**View `v_publication_individual`**

```sql
CREATE VIEW v_publication_individual AS
SELECT a.publication_id, a.pub_identifier, a.title, a.publication_date, b.individual_id AS individual_individual_id, b.person_identifier AS individual_person_identifier, b.full_name AS individual_full_name
FROM publications a JOIN individuals b ON a.individual_id = b.individual_id;
```

| publication_id | pub_identifier | title | publication_date | individual_individual_id | individual_person_identifier | individual_full_name |
|---|---|---|---|---|---|---|
| 1000 | PUB-2198 | Compact Initiative | 2025-12-01 | 1 | Block Magic | Theodore Mcgrath |
| 1001 | PUB-2202 | Legacy Model | 2022-05-12 | 2 | Susan Butler | Account Name |
| 1002 | PUB-2206 | Regional Cluster A | 2023-10-23 | 3 | Guam International Airport | Saipan International Airport |
| 1003 | PUB-2210 | Seasonal Review | 2024-03-07 | 4 | Norma Fisher | Norma Fisher |

The fourteenth and final view, `v_publication_ideological_movement`, joins `publications` to `ideological_movements` on `ideological_movement_id`. It answers: "Which ideological movement is each publication about?" The row for publication `PUB-2210` (`Seasonal Review`, published `2024-03-07`, subject `autobiography`, critical of the movement) reveals its subject movement `MOV-2510` (`Composite Series`, strategic phase `decline`, ultimate goal `tamkin`, operational territory `arab_islamic_world`), indicating that this critical autobiographical work concerns a movement in its decline phase pursuing territorial consolidation in the Arab-Islamic world.

**View `v_publication_ideological_movement`**

```sql
CREATE VIEW v_publication_ideological_movement AS
SELECT a.publication_id, a.pub_identifier, a.title, a.publication_date, b.ideological_movement_id AS movement_ideological_movement_id, b.movement_identifier AS movement_movement_identifier, b.founding_year AS movement_founding_year
FROM publications a JOIN ideological_movements b ON a.ideological_movement_id = b.ideological_movement_id;
```

| publication_id | pub_identifier | title | publication_date | movement_ideological_movement_id | movement_movement_identifier | movement_founding_year |
|---|---|---|---|---|---|---|
| 1000 | PUB-2198 | Compact Initiative | 2025-12-01 | 100 | MOV-2489 | 43 |
| 1001 | PUB-2202 | Legacy Model | 2022-05-12 | 101 | MOV-2496 | 48 |
| 1002 | PUB-2206 | Regional Cluster A | 2023-10-23 | 102 | MOV-2503 | 53 |
| 1003 | PUB-2210 | Seasonal Review | 2024-03-07 | 103 | MOV-2510 | 58 |

## Synthesis

The schema models a domain where ideological movements, strategic operations, geopolitical regions, religious organizations, individuals, and publications form a tightly interwoven network. Each base table normalizes a distinct entity type, and the foreign-key columns encode cardinality-bounded relationships that constrain how entities can be associated. The fourteen views materialize specific binary joins across these tables, each view answering a focused analytical question by reconstructing a domain fact from the normalized structure. Together, the base tables and views provide a complete relational representation of the domain, enabling queries that traverse from movements to operations to regions to organizations to individuals to publications and back again, preserving the integrity of the underlying relationships through the foreign-key constraints.