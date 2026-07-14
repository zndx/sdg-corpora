The domain under examination is an educational-administration ecosystem in which persons hold positions within organizations, organizations operate campuses, campuses run programs, and programs are governed by policies — all while awards are conferred on persons and organizations and tracked through a lifecycle of statuses. The relational schema captures this ecosystem through seven base tables and seventeen derived views, each view materializing a specific domain fact by joining the normalized tables.

## Base Tables and Entity Types

The schema centers on seven entity types, each persisted as a base table. The `awards` table records recognitions and initiatives with columns `award_id` (primary key), `award_name`, `award_year`, `award_description`, `award_status`, `person_id`, and `organization_id`. The `award_status` column carries values such as `pending`, `awarded`, and `revoked`, reflecting the lifecycle of each award. For example, row `1` stores the award named `Primary Review A` from year `36` with status `pending`, assigned to person `100` and organization `1`. Row `2` holds `Composite Initiative` (year `43`, status `awarded`) linked to person `101` and organization `2`. Row `3` records `Compact Model` (year `50`, status `revoked`) for person `102` and organization `3`, while row `4` captures `Legacy Cluster D` (year `57`, status `pending`) for person `103` and organization `4`.

**Table `awards`**

| award_id | award_name | award_year | award_description | award_status | person_id | organization_id |
|---|---|---|---|---|---|---|
| 1 | Primary Review A | 36 | Composite Cluster | pending | 100 | 1 |
| 2 | Composite Initiative | 43 | Compact Review A | awarded | 101 | 2 |
| 3 | Compact Model | 50 | Legacy Initiative | revoked | 102 | 3 |
| 4 | Legacy Cluster D | 57 | Regional Model | pending | 103 | 4 |

The `persons` table stores individual records with `person_id` as the primary key, along with `first_name`, `last_name`, `degree`, `certification`, `birth_date`, `position_id`, `award_id`, and `organization_id`. Person `100` is `Stephanie Collins Paul Allen`, holding `legacy-degree-61` and `seasonal-certific-29`, born on `2023-10-18`, with foreign keys pointing to position `1000`, award `1`, and organization `1`. Person `101` is `Janice Johnston Heather Beasley` with `compact-degree-62` and `regional-certific-30`, born `2024-03-02`, linked to position `1001`, award `2`, and organization `2`. Person `102` is `Upal Saha Audrey Taylor` with `composite-degree-63` and `legacy-certific-31`, born `2025-08-13`, connected to position `1002`, award `3`, and organization `3`. Person `103` is `Katherine Snyder Susan Wagner` with `primary-degree-64` and `compact-certific-32`, born `2022-01-24`, tied to position `1003`, award `4`, and organization `4`.

**Table `persons`**

| person_id | first_name | last_name | degree | certification | birth_date | position_id | award_id | organization_id |
|---|---|---|---|---|---|---|---|---|
| 100 | Stephanie Collins | Paul Allen | legacy-degree-61 | seasonal-certific-29 | 2023-10-18 | 1000 | 1 | 1 |
| 101 | Janice Johnston | Heather Beasley | compact-degree-62 | regional-certific-30 | 2024-03-02 | 1001 | 2 | 2 |
| 102 | Upal Saha | Audrey Taylor | composite-degree-63 | legacy-certific-31 | 2025-08-13 | 1002 | 3 | 3 |
| 103 | Katherine Snyder | Susan Wagner | primary-degree-64 | compact-certific-32 | 2022-01-24 | 1003 | 4 | 4 |

The `positions` table captures role definitions through `id` (primary key), `position_id`, `position_title`, `start_date`, `end_date`, `responsibilities`, `person_id`, and `organization_id`. The `position_id` column carries a mix of integer and UUID-style identifiers: row `1000` has `position_id` `14477856` with title `Extended Model`, spanning from `2022-09-05` to `2022-09-01`, with responsibilities `integrated-responsi-58`, assigned to person `100` at organization `1`. Row `1001` carries UUID `gd_acc_260002`, title `Pilot Cluster A`, dates `2023-02-16` to `2023-02-12`, responsibilities `seasonal-responsi-59`, for person `101` at organization `2`. Row `1002` holds UUID `3e41f384-9bac-11eb-a8a2-19ed5c03f8d3`, title `Baseline Review`, dates `2024-07-27` to `2024-07-23`, responsibilities `regional-responsi-60`, for person `102` at organization `3`. Row `1003` has `position_id` `82871`, title `Distributed Initiative`, dates `2025-12-11` to `2025-12-07`, responsibilities `legacy-responsi-61`, for person `103` at organization `4`.

**Table `positions`**

| id | position_id | position_title | start_date | end_date | responsibilities | person_id | organization_id |
|---|---|---|---|---|---|---|---|
| 1000 | 14477856 | Extended Model | 2022-09-05 | 2022-09-01 | integrated-responsi-58 | 100 | 1 |
| 1001 | gd_acc_260002 | Pilot Cluster A | 2023-02-16 | 2023-02-12 | seasonal-responsi-59 | 101 | 2 |
| 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Review | 2024-07-27 | 2024-07-23 | regional-responsi-60 | 102 | 3 |
| 1003 | 82871 | Distributed Initiative | 2025-12-11 | 2025-12-07 | legacy-responsi-61 | 103 | 4 |

The `organizations` table stores institutional records with `id` (primary key), `org_id`, `org_name`, `org_type`, `founding_date`, `headquarters_location`, `person_id`, `award_id`, and `campus_id`. Organization `1` is `Extended Review`, type `school_district`, founded `2023-06-24`, headquartered at `composite-headquar-63`, linked to person `100`, award `1`, and campus `1`. Organization `2` is `Pilot Initiative A`, type `professional_society`, founded `2024-11-08`, at `primary-headquar-64`, connected to person `101`, award `2`, and campus `2`. Organization `3` is `Baseline Model`, type `university`, founded `2025-04-19`, at `adaptive-headquar-65`, tied to person `102`, award `3`, and campus `3`. Organization `4` is `Distributed Cluster`, type `school_district`, founded `2022-09-03`, at `distributed-headquar-66`, linked to person `103`, award `4`, and campus `4`.

**Table `organizations`**

| id | org_id | org_name | org_type | founding_date | headquarters_location | person_id | award_id | campus_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | school_district | 2023-06-24 | composite-headquar-63 | 100 | 1 | 1 |
| 2 | 1717 | Pilot Initiative A | professional_society | 2024-11-08 | primary-headquar-64 | 101 | 2 | 2 |
| 3 | 69437 | Baseline Model | university | 2025-04-19 | adaptive-headquar-65 | 102 | 3 | 3 |
| 4 | m16 | Distributed Cluster | school_district | 2022-09-03 | distributed-headquar-66 | 103 | 4 | 4 |

The `campuses` table records educational sites with `campus_id` (primary key), `campus_name`, `campus_level`, `enrollment`, `location`, `organization_id`, `program_id`, `created_at`, and `updated_at`. Campus `1` is `Integrated Assessment A`, level `elementary`, enrollment `13`, located at `extended-location-99`, belonging to organization `1`, running program `1`, created `2025-01-01 00:14:00` and updated `2025-01-02 00:41:00`. Campus `2` is `Extended Survey`, level `middle`, enrollment `21`, at `integrated-location-100`, under organization `2`, program `2`, created `2025-02-06 03:14:00`, updated `2025-02-09 05:41:00`. Campus `3` is `Pilot Corridor`, level `high`, enrollment `29`, at `seasonal-location-101`, under organization `3`, program `3`, created `2025-03-11 06:14:00`, updated `2025-03-16 10:41:00`. Campus `4` is `Baseline Series D`, level `k12`, enrollment `37`, at `regional-location-102`, under organization `4`, program `4`, created `2025-04-16 09:14:00`, updated `2025-04-23 15:41:00`.

**Table `campuses`**

| campus_id | campus_name | campus_level | enrollment | location | organization_id | program_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | Integrated Assessment A | elementary | 13 | extended-location-99 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Extended Survey | middle | 21 | integrated-location-100 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Pilot Corridor | high | 29 | seasonal-location-101 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Baseline Series D | k12 | 37 | regional-location-102 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `programs` table captures programmatic offerings with `id` (primary key), `program_id`, `program_name`, `program_type`, `start_date`, `end_date`, `budget`, `campus_id`, `person_id`, and `policy_id`. Program `1` has `program_id` `103176`, name `Extended Review`, type `child_nutrition`, running `2022-09-05` to `2022-09-01`, budget `35.45`, at campus `1`, led by person `100`, governed by policy `1000`. Program `2` has `program_id` `2986219`, name `Pilot Initiative A`, type `food_service`, running `2023-02-16` to `2023-02-12`, budget `18.47`, at campus `2`, led by person `101`, governed by policy `1001`. Program `3` has `program_id` `1186079`, name `Baseline Model`, type `child_nutrition`, running `2024-07-27` to `2024-07-23`, budget `26.25`, at campus `3`, led by person `102`, governed by policy `1002`. Program `4` has `program_id` `1562855`, name `Distributed Cluster`, type `food_service`, running `2025-12-11` to `2025-12-07`, budget `17.12`, at campus `4`, led by person `103`, governed by policy `1003`.

**Table `programs`**

| id | program_id | program_name | program_type | start_date | end_date | budget | campus_id | person_id | policy_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | child_nutrition | 2022-09-05 | 2022-09-01 | 35.45 | 1 | 100 | 1000 |
| 2 | 2986219 | Pilot Initiative A | food_service | 2023-02-16 | 2023-02-12 | 18.47 | 2 | 101 | 1001 |
| 3 | 1186079 | Baseline Model | child_nutrition | 2024-07-27 | 2024-07-23 | 26.25 | 3 | 102 | 1002 |
| 4 | 1562855 | Distributed Cluster | food_service | 2025-12-11 | 2025-12-07 | 17.12 | 4 | 103 | 1003 |

The `policies` table stores governance rules. Each policy is referenced by programs through the `policy_id` foreign key, establishing a cardinality-bounded relationship where a program is governed by exactly one policy. The policy entity type carries its own identifier and descriptive attributes that define the regulatory framework under which programs operate.

**Table `policies`**

| id | policy_id | policy_name | policy_type | effective_date | status | program_id | campus_id |
|---|---|---|---|---|---|---|---|
| 1000 | 5844252 | Regional Series | operating | 2023-02-14 | active | 1 | 1 |
| 1001 | 10207142 | Seasonal Assessment D | procurement | 2024-07-25 | inactive | 2 | 2 |
| 1002 | 1562847 | Integrated Survey | menu | 2025-12-09 | draft | 3 | 3 |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | operating | 2022-05-20 | active | 4 | 4 |

## Foreign-Key Relationships and Normalization

The schema employs a star-and-spoke normalization pattern. The `persons` table carries three foreign keys — `position_id` referencing `positions`, `award_id` referencing `awards`, and `organization_id` referencing `organizations` — thereby binding each person to a single position, a single award, and a single organization. This design enforces a one-to-one cardinality between a person and each of these entities in the current dataset: person `100` (Stephanie Collins Paul Allen) is simultaneously the holder of position `1000` (Extended Model), the recipient of award `1` (Primary Review A), and a member of organization `1` (Extended Review).

The `positions` table similarly carries `person_id` and `organization_id` foreign keys, creating a bidirectional link: position `1000` (Extended Model, UUID `14477856`) is assigned to person `100` at organization `1`. The `organizations` table carries `person_id`, `award_id`, and `campus_id` foreign keys, so organization `1` (Extended Review, type `school_district`) is associated with person `100`, award `1`, and campus `1` (Integrated Assessment A).

The `campuses` table carries `organization_id` and `program_id` foreign keys, binding each campus to one organization and one program. Campus `1` (Integrated Assessment A, elementary level, enrollment `13`) belongs to organization `1` and runs program `1` (Extended Review, child_nutrition type, budget `35.45`). The `programs` table carries `campus_id`, `person_id`, and `policy_id` foreign keys, so program `1` operates at campus `1`, is led by person `100`, and is governed by policy `1000`.

This chain of foreign keys — persons → positions, persons → awards, persons → organizations, organizations → campuses, campuses → programs, programs → policies — forms a connected graph where every entity type is reachable from every other through at most two hops. The normalization eliminates redundancy: the organization name `Extended Review` appears once in `organizations` and is referenced by `persons`, `positions`, `campuses`, and `programs` through `organization_id` rather than being repeated.

## View-Based Reconstitution of Domain Facts

The seventeen views materialize the normalized graph into denormalized result sets that answer specific analytical questions. Each view is a `SELECT` with `JOIN` clauses that reconstruct a domain fact from the base tables.

The `award_person_view` joins `awards` to `persons` on `award_id`, answering the question "which person received which award?" The result for award `1` (Primary Review A, year `36`, status `pending`) shows person `100` (Stephanie Collins Paul Allen, degree `legacy-degree-61`). Award `2` (Composite Initiative, year `43`, status `awarded`) maps to person `101` (Janice Johnston Heather Beasley, degree `compact-degree-62`).

**View `award_person_view`**

```sql
CREATE VIEW award_person_view AS
SELECT a.award_id, a.award_name, a.award_year, a.award_description, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM awards a JOIN persons b ON a.person_id = b.person_id;
```

| award_id | award_name | award_year | award_description | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | Primary Review A | 36 | Composite Cluster | 100 | Stephanie Collins | Paul Allen |
| 2 | Composite Initiative | 43 | Compact Review A | 101 | Janice Johnston | Heather Beasley |
| 3 | Compact Model | 50 | Legacy Initiative | 102 | Upal Saha | Audrey Taylor |
| 4 | Legacy Cluster D | 57 | Regional Model | 103 | Katherine Snyder | Susan Wagner |

The `award_organization_view` joins `awards` to `organizations` on `organization_id`, answering "which organization is associated with which award?" Award `1` (Primary Review A) links to organization `1` (Extended Review, type `school_district`). Award `2` (Composite Initiative) links to organization `2` (Pilot Initiative A, type `professional_society`).

**View `award_organization_view`**

```sql
CREATE VIEW award_organization_view AS
SELECT a.award_id, a.award_name, a.award_year, a.award_description, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM awards a JOIN organizations b ON a.organization_id = b.id;
```

| award_id | award_name | award_year | award_description | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | Primary Review A | 36 | Composite Cluster | 1 | 790471 | Extended Review |
| 2 | Composite Initiative | 43 | Compact Review A | 2 | 1717 | Pilot Initiative A |
| 3 | Compact Model | 50 | Legacy Initiative | 3 | 69437 | Baseline Model |
| 4 | Legacy Cluster D | 57 | Regional Model | 4 | m16 | Distributed Cluster |

The `person_position_view` joins `persons` to `positions` on `person_id`, answering "what position does each person hold?" Person `100` (Stephanie Collins Paul Allen) holds position `1000` (Extended Model, UUID `14477856`, responsibilities `integrated-responsi-58`, dates `2022-09-05` to `2022-09-01`). Person `101` (Janice Johnston Heather Beasley) holds position `1001` (Pilot Cluster A, UUID `gd_acc_260002`, responsibilities `seasonal-responsi-59`).

**View `person_position_view`**

```sql
CREATE VIEW person_position_view AS
SELECT a.person_id, a.first_name, a.last_name, a.degree, b.id AS position_id, b.position_id AS position_position_id, b.position_title AS position_position_title
FROM persons a JOIN positions b ON a.position_id = b.id;
```

| person_id | first_name | last_name | degree | position_id | position_position_id | position_position_title |
|---|---|---|---|---|---|---|
| 100 | Stephanie Collins | Paul Allen | legacy-degree-61 | 1000 | 14477856 | Extended Model |
| 101 | Janice Johnston | Heather Beasley | compact-degree-62 | 1001 | gd_acc_260002 | Pilot Cluster A |
| 102 | Upal Saha | Audrey Taylor | composite-degree-63 | 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Review |
| 103 | Katherine Snyder | Susan Wagner | primary-degree-64 | 1003 | 82871 | Distributed Initiative |

The `person_award_view` joins `persons` to `awards` on `award_id`, answering "which award does each person hold?" Person `100` (Stephanie Collins Paul Allen) holds award `1` (Primary Review A, year `36`, status `pending`). Person `103` (Katherine Snyder Susan Wagner) holds award `4` (Legacy Cluster D, year `57`, status `pending`).

**View `person_award_view`**

```sql
CREATE VIEW person_award_view AS
SELECT a.person_id, a.first_name, a.last_name, a.degree, b.award_id AS award_award_id, b.award_name AS award_award_name, b.award_year AS award_award_year
FROM persons a JOIN awards b ON a.award_id = b.award_id;
```

| person_id | first_name | last_name | degree | award_award_id | award_award_name | award_award_year |
|---|---|---|---|---|---|---|
| 100 | Stephanie Collins | Paul Allen | legacy-degree-61 | 1 | Primary Review A | 36 |
| 101 | Janice Johnston | Heather Beasley | compact-degree-62 | 2 | Composite Initiative | 43 |
| 102 | Upal Saha | Audrey Taylor | composite-degree-63 | 3 | Compact Model | 50 |
| 103 | Katherine Snyder | Susan Wagner | primary-degree-64 | 4 | Legacy Cluster D | 57 |

The `person_organization_view` joins `persons` to `organizations` on `organization_id`, answering "which organization does each person belong to?" Person `100` (Stephanie Collins Paul Allen) belongs to organization `1` (Extended Review, type `school_district`, founded `2023-06-24`). Person `102` (Upal Saha Audrey Taylor) belongs to organization `3` (Baseline Model, type `university`, founded `2025-04-19`).

**View `person_organization_view`**

```sql
CREATE VIEW person_organization_view AS
SELECT a.person_id, a.first_name, a.last_name, a.degree, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM persons a JOIN organizations b ON a.organization_id = b.id;
```

| person_id | first_name | last_name | degree | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 100 | Stephanie Collins | Paul Allen | legacy-degree-61 | 1 | 790471 | Extended Review |
| 101 | Janice Johnston | Heather Beasley | compact-degree-62 | 2 | 1717 | Pilot Initiative A |
| 102 | Upal Saha | Audrey Taylor | composite-degree-63 | 3 | 69437 | Baseline Model |
| 103 | Katherine Snyder | Susan Wagner | primary-degree-64 | 4 | m16 | Distributed Cluster |

The `position_person_view` joins `positions` to `persons` on `person_id`, answering "which person holds each position?" Position `1000` (Extended Model, UUID `14477856`) is held by person `100` (Stephanie Collins Paul Allen). Position `1002` (Baseline Review, UUID `3e41f384-9bac-11eb-a8a2-19ed5c03f8d3`) is held by person `102` (Upal Saha Audrey Taylor).

**View `position_person_view`**

```sql
CREATE VIEW position_person_view AS
SELECT a.id, a.position_id, a.position_title, a.start_date, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM positions a JOIN persons b ON a.person_id = b.person_id;
```

| id | position_id | position_title | start_date | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1000 | 14477856 | Extended Model | 2022-09-05 | 100 | Stephanie Collins | Paul Allen |
| 1001 | gd_acc_260002 | Pilot Cluster A | 2023-02-16 | 101 | Janice Johnston | Heather Beasley |
| 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Review | 2024-07-27 | 102 | Upal Saha | Audrey Taylor |
| 1003 | 82871 | Distributed Initiative | 2025-12-11 | 103 | Katherine Snyder | Susan Wagner |

The `position_organization_view` joins `positions` to `organizations` on `organization_id`, answering "which organization does each position belong to?" Position `1000` (Extended Model) belongs to organization `1` (Extended Review). Position `1003` (Distributed Initiative, UUID `82871`) belongs to organization `4` (Distributed Cluster, type `school_district`).

**View `position_organization_view`**

```sql
CREATE VIEW position_organization_view AS
SELECT a.id, a.position_id, a.position_title, a.start_date, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM positions a JOIN organizations b ON a.organization_id = b.id;
```

| id | position_id | position_title | start_date | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1000 | 14477856 | Extended Model | 2022-09-05 | 1 | 790471 | Extended Review |
| 1001 | gd_acc_260002 | Pilot Cluster A | 2023-02-16 | 2 | 1717 | Pilot Initiative A |
| 1002 | 3e41f384-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Review | 2024-07-27 | 3 | 69437 | Baseline Model |
| 1003 | 82871 | Distributed Initiative | 2025-12-11 | 4 | m16 | Distributed Cluster |

The `organization_person_view` joins `organizations` to `persons` on `organization_id`, answering "which persons are associated with each organization?" Organization `1` (Extended Review) is associated with person `100` (Stephanie Collins Paul Allen). Organization `4` (Distributed Cluster) is associated with person `103` (Katherine Snyder Susan Wagner).

**View `organization_person_view`**

```sql
CREATE VIEW organization_person_view AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM organizations a JOIN persons b ON a.person_id = b.person_id;
```

| id | org_id | org_name | org_type | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | school_district | 100 | Stephanie Collins | Paul Allen |
| 2 | 1717 | Pilot Initiative A | professional_society | 101 | Janice Johnston | Heather Beasley |
| 3 | 69437 | Baseline Model | university | 102 | Upal Saha | Audrey Taylor |
| 4 | m16 | Distributed Cluster | school_district | 103 | Katherine Snyder | Susan Wagner |

The `organization_award_view` joins `organizations` to `awards` on `organization_id`, answering "which awards are associated with each organization?" Organization `1` (Extended Review) is associated with award `1` (Primary Review A, year `36`). Organization `3` (Baseline Model) is associated with award `3` (Compact Model, year `50`, status `revoked`).

**View `organization_award_view`**

```sql
CREATE VIEW organization_award_view AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.award_id AS award_award_id, b.award_name AS award_award_name, b.award_year AS award_award_year
FROM organizations a JOIN awards b ON a.award_id = b.award_id;
```

| id | org_id | org_name | org_type | award_award_id | award_award_name | award_award_year |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | school_district | 1 | Primary Review A | 36 |
| 2 | 1717 | Pilot Initiative A | professional_society | 2 | Composite Initiative | 43 |
| 3 | 69437 | Baseline Model | university | 3 | Compact Model | 50 |
| 4 | m16 | Distributed Cluster | school_district | 4 | Legacy Cluster D | 57 |

The `organization_campus_view` joins `organizations` to `campuses` on `organization_id`, answering "which campuses belong to each organization?" Organization `1` (Extended Review) operates campus `1` (Integrated Assessment A, elementary level, enrollment `13`). Organization `3` (Baseline Model) operates campus `3` (Pilot Corridor, high level, enrollment `29`).

**View `organization_campus_view`**

```sql
CREATE VIEW organization_campus_view AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.campus_id AS campus_campus_id, b.campus_name AS campus_campus_name, b.campus_level AS campus_campus_level
FROM organizations a JOIN campuses b ON a.campus_id = b.campus_id;
```

| id | org_id | org_name | org_type | campus_campus_id | campus_campus_name | campus_campus_level |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | school_district | 1 | Integrated Assessment A | elementary |
| 2 | 1717 | Pilot Initiative A | professional_society | 2 | Extended Survey | middle |
| 3 | 69437 | Baseline Model | university | 3 | Pilot Corridor | high |
| 4 | m16 | Distributed Cluster | school_district | 4 | Baseline Series D | k12 |

The `campus_organization_view` joins `campuses` to `organizations` on `organization_id`, answering "which organization does each campus belong to?" Campus `1` (Integrated Assessment A) belongs to organization `1` (Extended Review). Campus `4` (Baseline Series D, k12 level, enrollment `37`) belongs to organization `4` (Distributed Cluster).

**View `campus_organization_view`**

```sql
CREATE VIEW campus_organization_view AS
SELECT a.campus_id, a.campus_name, a.campus_level, a.enrollment, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM campuses a JOIN organizations b ON a.organization_id = b.id;
```

| campus_id | campus_name | campus_level | enrollment | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | Integrated Assessment A | elementary | 13 | 1 | 790471 | Extended Review |
| 2 | Extended Survey | middle | 21 | 2 | 1717 | Pilot Initiative A |
| 3 | Pilot Corridor | high | 29 | 3 | 69437 | Baseline Model |
| 4 | Baseline Series D | k12 | 37 | 4 | m16 | Distributed Cluster |

The `campus_program_view` joins `campuses` to `programs` on `campus_id`, answering "which program does each campus run?" Campus `1` (Integrated Assessment A) runs program `1` (Extended Review, child_nutrition type, budget `35.45`). Campus `3` (Pilot Corridor) runs program `3` (Baseline Model, child_nutrition type, budget `26.25`).

**View `campus_program_view`**

```sql
CREATE VIEW campus_program_view AS
SELECT a.campus_id, a.campus_name, a.campus_level, a.enrollment, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM campuses a JOIN programs b ON a.program_id = b.id;
```

| campus_id | campus_name | campus_level | enrollment | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | Integrated Assessment A | elementary | 13 | 1 | 103176 | Extended Review |
| 2 | Extended Survey | middle | 21 | 2 | 2986219 | Pilot Initiative A |
| 3 | Pilot Corridor | high | 29 | 3 | 1186079 | Baseline Model |
| 4 | Baseline Series D | k12 | 37 | 4 | 1562855 | Distributed Cluster |

The `program_campus_view` joins `programs` to `campuses` on `campus_id`, answering "at which campus does each program operate?" Program `1` (Extended Review, child_nutrition, budget `35.45`) operates at campus `1` (Integrated Assessment A). Program `4` (Distributed Cluster, food_service, budget `17.12`) operates at campus `4` (Baseline Series D).

**View `program_campus_view`**

```sql
CREATE VIEW program_campus_view AS
SELECT a.id, a.program_id, a.program_name, a.program_type, b.campus_id AS campus_campus_id, b.campus_name AS campus_campus_name, b.campus_level AS campus_campus_level
FROM programs a JOIN campuses b ON a.campus_id = b.campus_id;
```

| id | program_id | program_name | program_type | campus_campus_id | campus_campus_name | campus_campus_level |
|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | child_nutrition | 1 | Integrated Assessment A | elementary |
| 2 | 2986219 | Pilot Initiative A | food_service | 2 | Extended Survey | middle |
| 3 | 1186079 | Baseline Model | child_nutrition | 3 | Pilot Corridor | high |
| 4 | 1562855 | Distributed Cluster | food_service | 4 | Baseline Series D | k12 |

The `program_person_view` joins `programs` to `persons` on `person_id`, answering "which person leads each program?" Program `1` (Extended Review) is led by person `100` (Stephanie Collins Paul Allen). Program `4` (Distributed Cluster) is led by person `103` (Katherine Snyder Susan Wagner).

**View `program_person_view`**

```sql
CREATE VIEW program_person_view AS
SELECT a.id, a.program_id, a.program_name, a.program_type, b.person_id AS person_person_id, b.first_name AS person_first_name, b.last_name AS person_last_name
FROM programs a JOIN persons b ON a.person_id = b.person_id;
```

| id | program_id | program_name | program_type | person_person_id | person_first_name | person_last_name |
|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | child_nutrition | 100 | Stephanie Collins | Paul Allen |
| 2 | 2986219 | Pilot Initiative A | food_service | 101 | Janice Johnston | Heather Beasley |
| 3 | 1186079 | Baseline Model | child_nutrition | 102 | Upal Saha | Audrey Taylor |
| 4 | 1562855 | Distributed Cluster | food_service | 103 | Katherine Snyder | Susan Wagner |

The `program_policy_view` joins `programs` to `policies` on `policy_id`, answering "which policy governs each program?" Program `1` (Extended Review) is governed by policy `1000`. Program `3` (Baseline Model) is governed by policy `1002`.

**View `program_policy_view`**

```sql
CREATE VIEW program_policy_view AS
SELECT a.id, a.program_id, a.program_name, a.program_type, b.id AS policy_id, b.policy_id AS policy_policy_id, b.policy_name AS policy_policy_name
FROM programs a JOIN policies b ON a.policy_id = b.id;
```

| id | program_id | program_name | program_type | policy_id | policy_policy_id | policy_policy_name |
|---|---|---|---|---|---|---|
| 1 | 103176 | Extended Review | child_nutrition | 1000 | 5844252 | Regional Series |
| 2 | 2986219 | Pilot Initiative A | food_service | 1001 | 10207142 | Seasonal Assessment D |
| 3 | 1186079 | Baseline Model | child_nutrition | 1002 | 1562847 | Integrated Survey |
| 4 | 1562855 | Distributed Cluster | food_service | 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor |

The `policy_program_view` joins `policies` to `programs` on `policy_id`, answering "which programs are governed by each policy?" Policy `1000` governs program `1` (Extended Review, child_nutrition type, budget `35.45`). Policy `1003` governs program `4` (Distributed Cluster, food_service type, budget `17.12`).

**View `policy_program_view`**

```sql
CREATE VIEW policy_program_view AS
SELECT a.id, a.policy_id, a.policy_name, a.policy_type, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM policies a JOIN programs b ON a.program_id = b.id;
```

| id | policy_id | policy_name | policy_type | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | 5844252 | Regional Series | operating | 1 | 103176 | Extended Review |
| 1001 | 10207142 | Seasonal Assessment D | procurement | 2 | 2986219 | Pilot Initiative A |
| 1002 | 1562847 | Integrated Survey | menu | 3 | 1186079 | Baseline Model |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | operating | 4 | 1562855 | Distributed Cluster |

The `policy_campus_view` joins `policies` to `campuses` through `programs`, answering "which campuses host programs governed by each policy?" Policy `1000` governs program `1`, which operates at campus `1` (Integrated Assessment A, elementary level). Policy `1002` governs program `3`, which operates at campus `3` (Pilot Corridor, high level).

**View `policy_campus_view`**

```sql
CREATE VIEW policy_campus_view AS
SELECT a.id, a.policy_id, a.policy_name, a.policy_type, b.campus_id AS campus_campus_id, b.campus_name AS campus_campus_name, b.campus_level AS campus_campus_level
FROM policies a JOIN campuses b ON a.campus_id = b.campus_id;
```

| id | policy_id | policy_name | policy_type | campus_campus_id | campus_campus_name | campus_campus_level |
|---|---|---|---|---|---|---|
| 1000 | 5844252 | Regional Series | operating | 1 | Integrated Assessment A | elementary |
| 1001 | 10207142 | Seasonal Assessment D | procurement | 2 | Extended Survey | middle |
| 1002 | 1562847 | Integrated Survey | menu | 3 | Pilot Corridor | high |
| 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | operating | 4 | Baseline Series D | k12 |

## Synthesis

The schema models an educational-administration domain through seven base tables whose foreign keys form a connected graph: persons hold positions and receive awards within organizations; organizations operate campuses; campuses run programs; and programs are governed by policies. Each of the seventeen views materializes a specific slice of this graph by joining the relevant tables, transforming the normalized structure into denormalized result sets that answer concrete analytical questions. The record identifiers — UUIDs like `gd_acc_260002` and `3e41f384-9bac-11eb-a8a2-19ed5c03f8d3`, integer IDs like `100` and `14477856`, and descriptive values like `school_district`, `elementary`, and `pending` — ground the abstract schema in concrete domain facts. The normalization eliminates redundancy while the views restore readability, together providing both storage efficiency and analytical clarity.