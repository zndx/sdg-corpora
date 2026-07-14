The institutional data model captures a university's governance and academic infrastructure as a network of interrelated entities: research committees, executive officers, scientific bureaus, doctoral schools and colleges, research laboratories, and technology transfer departments. Each entity type is materialized as a relational table whose columns encode both intrinsic attributes (identifiers, names, dates, status flags) and extrinsic relationships (foreign keys pointing to parent or peer entities). Junction tables mediate many-to-many associations between schools, laboratories, and colleges, while a suite of pre-joined views reconstructs domain facts for reporting. The following sections walk through the base tables, their inter-table relationships, and the views that reassemble normalized rows into readable domain records.

## Research Governance: Committees, Vice Presidents, and Bureaus

The `research_committees` table anchors the research governance layer. Each row represents a named committee with a business identifier (`committee_id`), a human-readable `name`, an `established_date`, a lifecycle `status`, and a foreign key `research_vice_president_id` that binds the committee to its overseeing executive. The committee identifiers follow a mixed alphanumeric convention: `PHR-98` for the Extended Review committee, `L785` for Pilot Initiative A, and purely numeric codes such as `7119774` for the Baseline Model.

**Table `research_committees`**

| id | committee_id | name | established_date | status | research_vice_president_id |
|---|---|---|---|---|---|
| 1 | PHR-98 | Extended Review | 2024-03-27 | active | 1 |
| 2 | L785 | Pilot Initiative A | 2025-08-11 | inactive | 2 |
| 3 | 7119774 | Baseline Model | 2022-01-22 | pending | 3 |
| 4 | 1186094 | Distributed Cluster | 2023-06-06 | active | 4 |

The `research_vice_presidents` table holds the executives who supervise these committees. Its columns include an auto-generated surrogate `id`, an `official_name` that mirrors the committee name in this dataset, a `title` describing the executive's portfolio (e.g., *Compact Initiative*, *Legacy Model*), an `appointment_date`, a `status` field, and two foreign keys: `research_committee_id` (pointing back to the committee the VP oversees) and `scientific_bureau_id` (linking the VP to a scientific bureau). The cardinality here is one-to-one in the current data — each VP row references exactly one committee and one bureau — but the schema permits a VP to be associated with multiple committees through separate rows.

**Table `research_vice_presidents`**

| id | official_name | title | appointment_date | status | research_committee_id | scientific_bureau_id |
|---|---|---|---|---|---|---|
| 1 | Extended Review | Compact Initiative | 2022-05-03 | active | 1 | 1 |
| 2 | Pilot Initiative A | Legacy Model | 2023-10-14 | inactive | 2 | 2 |
| 3 | Baseline Model | Regional Cluster A | 2024-03-25 | suspended | 3 | 3 |
| 4 | Distributed Cluster | Seasonal Review | 2025-08-09 | active | 4 | 4 |

The `scientific_bureaus` table is the leaf of this governance triad. It stores bureau-level metadata: a surrogate `id`, a business `bureau_id` (values like `195361`, `3158162`, `L331`), a `name`, an `established_date`, and a `status`. Bureaus do not carry foreign keys; they are referenced *by* the `research_vice_presidents` table through `scientific_bureau_id`. The status values across all three tables — `active`, `inactive`, `pending`, `suspended` — form a shared lifecycle vocabulary that allows cross-entity filtering.

**Table `scientific_bureaus`**

| id | bureau_id | name | established_date | status |
|---|---|---|---|---|
| 1 | 195361 | Extended Review | 2024-03-27 | active |
| 2 | 3158162 | Pilot Initiative A | 2025-08-11 | inactive |
| 3 | 2106698 | Baseline Model | 2022-01-22 | pending |
| 4 | L331 | Distributed Cluster | 2023-06-06 | active |

## Doctoral Education: Schools, Directors, and Colleges

The `doctoral_schools` table is the central node of the academic structure. Each row describes a doctoral school identified by a surrogate `id`, a business `school_id` (e.g., `1152671`, `1186099`, `7441154`), a `name` (such as *Dana Nguyen* or *Kimberly Myers*), an alphanumeric `code` (like `lu_tax_code_template_m_I_4` or `2986219`), an `established_date`, a `status`, and two foreign keys: `doctoral_school_director_id` pointing to the school's director and `doctoral_college_id` pointing to the college the school belongs to. The school identifiers are six-digit integers, while the codes mix alphabetic prefixes with numeric segments.

**Table `doctoral_schools`**

| id | school_id | name | code | established_date | status | doctoral_school_director_id | doctoral_college_id |
|---|---|---|---|---|---|---|---|
| 1 | 1152671 | Dana Nguyen | lu_tax_code_template_m_I_4 | 2024-03-27 | active | 1000 | 1 |
| 2 | 1186099 | Kimberly Myers | 2986219 | 2025-08-11 | inactive | 1001 | 2 |
| 3 | 7441154 | Kimberly Myers | 8928520 | 2022-01-22 | pending | 1002 | 3 |
| 4 | 338514 | Guam International Airport | 195369 | 2023-06-06 | active | 1003 | 4 |

The `doctoral_school_directors` table stores the individuals who lead these schools. Its columns mirror the VP table's structure: a surrogate `id` (values `1000` through `1003`), an `official_name` (e.g., *Carolyn Randall*, *Ontario International Airport*, *Elizabeth Riggs*, *Jeff Davidson*), a `title`, an `appointment_date`, a `status`, and a `doctoral_school_id` foreign key that links the director back to their school. The relationship is one-to-one in the current data — each director row references exactly one doctoral school.

**Table `doctoral_school_directors`**

| id | official_name | title | appointment_date | status | doctoral_school_id |
|---|---|---|---|---|---|
| 1000 | Carolyn Randall | Compact Initiative | 2022-05-03 | active | 1 |
| 1001 | Ontario International Airport | Legacy Model | 2023-10-14 | inactive | 2 |
| 1002 | Elizabeth Riggs | Regional Cluster A | 2024-03-25 | suspended | 3 |
| 1003 | Jeff Davidson | Seasonal Review | 2025-08-09 | active | 4 |

The `doctoral_colleges` table sits at the top of the academic hierarchy. It contains a `doctoral_college_id` (used as both primary key and business identifier), a `college_id` (values like `575206`, `Takings`, `10449517`), a `name`, an `established_date`, and a `status`. Doctoral schools reference colleges through the `doctoral_college_id` foreign key in `doctoral_schools`, establishing a many-to-one relationship: multiple schools can belong to the same college.

**Table `doctoral_colleges`**

| doctoral_college_id | college_id | name | established_date | status |
|---|---|---|---|---|
| 1 | 575206 | Dana Nguyen | 2024-03-27 | active |
| 2 | Takings | Kimberly Myers | 2025-08-11 | inactive |
| 3 | 10449517 | Kimberly Myers | 2022-01-22 | pending |
| 4 | 10449524 | Guam International Airport | 2023-06-06 | active |

## Research Laboratories and Technology Transfer

The `research_laboratories` table captures individual research units. Although the sample data is not shown in the payload, the table follows the same pattern as other base tables: a surrogate `id`, a business identifier, a `name`, an `established_date`, and a `status`. Laboratories are linked to doctoral schools through the junction table `schools_laboratories`, which contains pairs of `school_id` and `laboratory_id` columns that together form a composite foreign key referencing both `doctoral_schools` and `research_laboratories`.

**Table `research_laboratories`**

| lab_id | name | established_date | status |
|---|---|---|---|
| 2106706 | Extended Review | 2024-03-27 | active |
| 1437591 | Pilot Initiative A | 2025-08-11 | inactive |
| 12042 | Baseline Model | 2022-01-22 | pending |
| 1562831 | Distributed Cluster | 2023-06-06 | active |

The `technology_transfer_departments` table models departments responsible for commercializing research outputs. Its columns include a surrogate `id`, a business identifier, a `name`, an `established_date`, a `status`, and foreign keys to the `administrative_directors` and `technology_transfer_vice_presidents` tables.

**Table `technology_transfer_departments`**

| id | department_id | name | established_date | status | administrative_director_id | technology_transfer_vice_president_id |
|---|---|---|---|---|---|---|
| 1 | 2087755 | Extended Review | 2024-03-27 | active | 1 | 100 |
| 2 | 790483 | Pilot Initiative A | 2025-08-11 | inactive | 2 | 101 |
| 3 | 505978 | Baseline Model | 2022-01-22 | pending | 3 | 102 |
| 4 | id_6 | Distributed Cluster | 2023-06-06 | active | 4 | 103 |

The `administrative_directors` table stores the directors assigned to technology transfer departments. It contains a surrogate `id`, an `official_name`, a `title`, an `appointment_date`, a `status`, and a `department_id` foreign key pointing to the `technology_transfer_departments` table.

**Table `administrative_directors`**

| administrative_director_id | official_name | title | appointment_date | status | technology_transfer_department_id |
|---|---|---|---|---|---|
| 1 | Extended Review | Compact Initiative | 2022-05-03 | active | 1 |
| 2 | Pilot Initiative A | Legacy Model | 2023-10-14 | inactive | 2 |
| 3 | Baseline Model | Regional Cluster A | 2024-03-25 | suspended | 3 |
| 4 | Distributed Cluster | Seasonal Review | 2025-08-09 | active | 4 |

The `technology_transfer_vice_presidents` table holds the executives overseeing technology transfer. Its structure mirrors other VP tables: a surrogate `id`, an `official_name`, a `title`, an `appointment_date`, a `status`, and a `department_id` foreign key linking to the department.

**Table `technology_transfer_vice_presidents`**

| technology_transfer_vice_president_id | official_name | title | appointment_date | status | technology_transfer_department_id |
|---|---|---|---|---|---|
| 100 | Extended Review | Compact Initiative | 2022-05-03 | active | 1 |
| 101 | Pilot Initiative A | Legacy Model | 2023-10-14 | inactive | 2 |
| 102 | Baseline Model | Regional Cluster A | 2024-03-25 | suspended | 3 |
| 103 | Distributed Cluster | Seasonal Review | 2025-08-09 | active | 4 |

## Junction Tables: Many-to-Many Associations

Three junction tables resolve many-to-many relationships between the core academic entities. The `schools_laboratories` table pairs `school_id` values from `doctoral_schools` with `laboratory_id` values from `research_laboratories`, allowing a single school to host multiple laboratories and a laboratory to serve multiple schools.

**Table `schools_laboratories`**

| doctoral_school_id | research_laboratory_lab_id |
|---|---|
| 1 | 2106706 |
| 1 | 1437591 |
| 2 | 1437591 |
| 2 | 12042 |
| 3 | 12042 |
| 3 | 1562831 |
| 4 | 1562831 |
| 4 | 2106706 |

The `colleges_schools` table links `college_id` values from `doctoral_colleges` to `school_id` values from `doctoral_schools`. While the `doctoral_schools` table already carries a `doctoral_college_id` foreign key, this junction table provides an explicit many-to-many bridge, enabling a college to sponsor multiple schools and a school to be affiliated with multiple colleges.

**Table `colleges_schools`**

| doctoral_college_id | doctoral_school_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `laboratories_schools` table is a symmetric counterpart to `schools_laboratories`, storing the same relationship from the laboratory's perspective with `laboratory_id` and `school_id` columns. Having both `schools_laboratories` and `laboratories_schools` in the schema provides query flexibility: applications can join from either direction without reordering columns.

**Table `laboratories_schools`**

| research_laboratory_lab_id | doctoral_school_id |
|---|---|
| 2106706 | 1 |
| 2106706 | 2 |
| 1437591 | 2 |
| 1437591 | 3 |
| 12042 | 3 |
| 12042 | 4 |
| 1562831 | 4 |
| 1562831 | 1 |

## Views: Reconstructing Domain Facts

The view layer reassembles normalized rows into domain-level records. Each view performs a join across two or more base tables, producing a denormalized result that answers a specific analytical question.

The `research_committee_research_vice_president_view` joins `research_committees` to `research_vice_presidents` on `research_committees.research_vice_president_id = research_vice_presidents.id`. It answers the question: *Which VP oversees which committee?* A row from this view might show the Extended Review committee (`PHR-98`) paired with the VP whose official name is also *Extended Review*, appointed on `2022-05-03` and holding the title *Compact Initiative*.

**View `research_committee_research_vice_president_view`**

```sql
CREATE VIEW research_committee_research_vice_president_view AS
SELECT a.id, a.committee_id, a.name, a.established_date, b.id AS president_id, b.official_name AS president_official_name, b.title AS president_title
FROM research_committees a JOIN research_vice_presidents b ON a.research_vice_president_id = b.id;
```

| id | committee_id | name | established_date | president_id | president_official_name | president_title |
|---|---|---|---|---|---|---|
| 1 | PHR-98 | Extended Review | 2024-03-27 | 1 | Extended Review | Compact Initiative |
| 2 | L785 | Pilot Initiative A | 2025-08-11 | 2 | Pilot Initiative A | Legacy Model |
| 3 | 7119774 | Baseline Model | 2022-01-22 | 3 | Baseline Model | Regional Cluster A |
| 4 | 1186094 | Distributed Cluster | 2023-06-06 | 4 | Distributed Cluster | Seasonal Review |

The inverse, `research_vice_president_research_committee_view`, joins the same two tables but presents the VP as the primary entity. It answers: *Which committee is assigned to this VP?* The row for the VP titled *Legacy Model* (status *inactive*) would show the Pilot Initiative A committee (`L785`), established on `2025-08-11`.

**View `research_vice_president_research_committee_view`**

```sql
CREATE VIEW research_vice_president_research_committee_view AS
SELECT a.id, a.official_name, a.title, a.appointment_date, b.id AS committee_id, b.committee_id AS committee_committee_id, b.name AS committee_name
FROM research_vice_presidents a JOIN research_committees b ON a.research_committee_id = b.id;
```

| id | official_name | title | appointment_date | committee_id | committee_committee_id | committee_name |
|---|---|---|---|---|---|---|
| 1 | Extended Review | Compact Initiative | 2022-05-03 | 1 | PHR-98 | Extended Review |
| 2 | Pilot Initiative A | Legacy Model | 2023-10-14 | 2 | L785 | Pilot Initiative A |
| 3 | Baseline Model | Regional Cluster A | 2024-03-25 | 3 | 7119774 | Baseline Model |
| 4 | Distributed Cluster | Seasonal Review | 2025-08-09 | 4 | 1186094 | Distributed Cluster |

The `research_vice_president_scientific_bureau_view` joins `research_vice_presidents` to `scientific_bureaus` on `research_vice_presidents.scientific_bureau_id = scientific_bureaus.id`. It answers: *Which bureau is associated with this VP?* A representative row pairs the VP with title *Regional Cluster A* (status *suspended*) with the Baseline Model bureau (`2106698`), established on `2022-01-22`.

**View `research_vice_president_scientific_bureau_view`**

```sql
CREATE VIEW research_vice_president_scientific_bureau_view AS
SELECT a.id, a.official_name, a.title, a.appointment_date, b.id AS bureau_id, b.bureau_id AS bureau_bureau_id, b.name AS bureau_name
FROM research_vice_presidents a JOIN scientific_bureaus b ON a.scientific_bureau_id = b.id;
```

| id | official_name | title | appointment_date | bureau_id | bureau_bureau_id | bureau_name |
|---|---|---|---|---|---|---|
| 1 | Extended Review | Compact Initiative | 2022-05-03 | 1 | 195361 | Extended Review |
| 2 | Pilot Initiative A | Legacy Model | 2023-10-14 | 2 | 3158162 | Pilot Initiative A |
| 3 | Baseline Model | Regional Cluster A | 2024-03-25 | 3 | 2106698 | Baseline Model |
| 4 | Distributed Cluster | Seasonal Review | 2025-08-09 | 4 | L331 | Distributed Cluster |

The `doctoral_school_doctoral_school_director_view` joins `doctoral_schools` to `doctoral_school_directors` on `doctoral_schools.doctoral_school_director_id = doctoral_school_directors.id`. It answers: *Who directs this doctoral school?* The row for the Dana Nguyen school (`1152671`, code `lu_tax_code_template_m_I_4`, status *active*) shows Carolyn Randall as its director, appointed on `2022-05-03`.

**View `doctoral_school_doctoral_school_director_view`**

```sql
CREATE VIEW doctoral_school_doctoral_school_director_view AS
SELECT a.id, a.school_id, a.name, a.code, b.id AS director_id, b.official_name AS director_official_name, b.title AS director_title
FROM doctoral_schools a JOIN doctoral_school_directors b ON a.doctoral_school_director_id = b.id;
```

| id | school_id | name | code | director_id | director_official_name | director_title |
|---|---|---|---|---|---|---|
| 1 | 1152671 | Dana Nguyen | lu_tax_code_template_m_I_4 | 1000 | Carolyn Randall | Compact Initiative |
| 2 | 1186099 | Kimberly Myers | 2986219 | 1001 | Ontario International Airport | Legacy Model |
| 3 | 7441154 | Kimberly Myers | 8928520 | 1002 | Elizabeth Riggs | Regional Cluster A |
| 4 | 338514 | Guam International Airport | 195369 | 1003 | Jeff Davidson | Seasonal Review |

The `doctoral_school_research_laboratory_detail_view` joins `doctoral_schools` to `research_laboratories` through the `schools_laboratories` junction table. It answers: *Which laboratories are hosted by this doctoral school?* Each row represents a school-laboratory pairing, enabling analysts to count laboratories per school or list all schools hosting a given laboratory.

**View `doctoral_school_research_laboratory_detail_view`**

```sql
CREATE VIEW doctoral_school_research_laboratory_detail_view AS
SELECT a.id, a.school_id, a.name, b.lab_id AS laboratory_lab_id, b.name AS laboratory_name, b.established_date AS laboratory_established_date
FROM doctoral_schools a
  JOIN schools_laboratories j ON j.doctoral_school_id = a.id
  JOIN research_laboratories b ON b.lab_id = j.research_laboratory_lab_id;
```

| id | school_id | name | laboratory_lab_id | laboratory_name | laboratory_established_date |
|---|---|---|---|---|---|
| 1 | 1152671 | Dana Nguyen | 2106706 | Extended Review | 2024-03-27 |
| 1 | 1152671 | Dana Nguyen | 1437591 | Pilot Initiative A | 2025-08-11 |
| 2 | 1186099 | Kimberly Myers | 1437591 | Pilot Initiative A | 2025-08-11 |
| 2 | 1186099 | Kimberly Myers | 12042 | Baseline Model | 2022-01-22 |
| 3 | 7441154 | Kimberly Myers | 12042 | Baseline Model | 2022-01-22 |
| 3 | 7441154 | Kimberly Myers | 1562831 | Distributed Cluster | 2023-06-06 |
| 4 | 338514 | Guam International Airport | 1562831 | Distributed Cluster | 2023-06-06 |
| 4 | 338514 | Guam International Airport | 2106706 | Extended Review | 2024-03-27 |

The `doctoral_school_doctoral_college_view` joins `doctoral_schools` to `doctoral_colleges` on `doctoral_schools.doctoral_college_id = doctoral_colleges.doctoral_college_id`. It answers: *Which college does this school belong to?* The Guam International Airport school (`338514`, status *active*) is paired with the Guam International Airport college (established `2023-06-06`).

**View `doctoral_school_doctoral_college_view`**

```sql
CREATE VIEW doctoral_school_doctoral_college_view AS
SELECT a.id, a.school_id, a.name, a.code, b.doctoral_college_id AS college_doctoral_college_id, b.college_id AS college_college_id, b.name AS college_name
FROM doctoral_schools a JOIN doctoral_colleges b ON a.doctoral_college_id = b.doctoral_college_id;
```

| id | school_id | name | code | college_doctoral_college_id | college_college_id | college_name |
|---|---|---|---|---|---|---|
| 1 | 1152671 | Dana Nguyen | lu_tax_code_template_m_I_4 | 1 | 575206 | Dana Nguyen |
| 2 | 1186099 | Kimberly Myers | 2986219 | 2 | Takings | Kimberly Myers |
| 3 | 7441154 | Kimberly Myers | 8928520 | 3 | 10449517 | Kimberly Myers |
| 4 | 338514 | Guam International Airport | 195369 | 4 | 10449524 | Guam International Airport |

The `doctoral_school_director_doctoral_school_view` is the inverse of the director-school view, presenting the director as the primary entity. It answers: *Which school does this director lead?* The row for Jeff Davidson (title *Seasonal Review*, status *active*) shows the school with ID `338514`.

**View `doctoral_school_director_doctoral_school_view`**

```sql
CREATE VIEW doctoral_school_director_doctoral_school_view AS
SELECT a.id, a.official_name, a.title, a.appointment_date, b.id AS school_id, b.school_id AS school_school_id, b.name AS school_name
FROM doctoral_school_directors a JOIN doctoral_schools b ON a.doctoral_school_id = b.id;
```

| id | official_name | title | appointment_date | school_id | school_school_id | school_name |
|---|---|---|---|---|---|---|
| 1000 | Carolyn Randall | Compact Initiative | 2022-05-03 | 1 | 1152671 | Dana Nguyen |
| 1001 | Ontario International Airport | Legacy Model | 2023-10-14 | 2 | 1186099 | Kimberly Myers |
| 1002 | Elizabeth Riggs | Regional Cluster A | 2024-03-25 | 3 | 7441154 | Kimberly Myers |
| 1003 | Jeff Davidson | Seasonal Review | 2025-08-09 | 4 | 338514 | Guam International Airport |

The `doctoral_college_doctoral_school_detail_view` joins `doctoral_colleges` to `doctoral_schools`, answering: *Which schools are sponsored by this college?* A row might show the Dana Nguyen college (college ID `575206`, status *active*) paired with the Dana Nguyen doctoral school (`1152671`).

**View `doctoral_college_doctoral_school_detail_view`**

```sql
CREATE VIEW doctoral_college_doctoral_school_detail_view AS
SELECT a.doctoral_college_id, a.college_id, a.name, b.id AS school_id, b.school_id AS school_school_id, b.name AS school_name
FROM doctoral_colleges a
  JOIN colleges_schools j ON j.doctoral_college_id = a.doctoral_college_id
  JOIN doctoral_schools b ON b.id = j.doctoral_school_id;
```

| doctoral_college_id | college_id | name | school_id | school_school_id | school_name |
|---|---|---|---|---|---|
| 1 | 575206 | Dana Nguyen | 1 | 1152671 | Dana Nguyen |
| 1 | 575206 | Dana Nguyen | 2 | 1186099 | Kimberly Myers |
| 2 | Takings | Kimberly Myers | 2 | 1186099 | Kimberly Myers |
| 2 | Takings | Kimberly Myers | 3 | 7441154 | Kimberly Myers |
| 3 | 10449517 | Kimberly Myers | 3 | 7441154 | Kimberly Myers |
| 3 | 10449517 | Kimberly Myers | 4 | 338514 | Guam International Airport |
| 4 | 10449524 | Guam International Airport | 4 | 338514 | Guam International Airport |
| 4 | 10449524 | Guam International Airport | 1 | 1152671 | Dana Nguyen |

The `research_laboratory_doctoral_school_detail_view` joins `research_laboratories` to `doctoral_schools` through the `laboratories_schools` junction table. It answers: *Which doctoral schools use this laboratory?* Each row represents a laboratory-school association, enabling reverse lookups from the laboratory's perspective.

**View `research_laboratory_doctoral_school_detail_view`**

```sql
CREATE VIEW research_laboratory_doctoral_school_detail_view AS
SELECT a.lab_id, a.name, a.established_date, b.id AS school_id, b.school_id AS school_school_id, b.name AS school_name
FROM research_laboratories a
  JOIN laboratories_schools j ON j.research_laboratory_lab_id = a.lab_id
  JOIN doctoral_schools b ON b.id = j.doctoral_school_id;
```

| lab_id | name | established_date | school_id | school_school_id | school_name |
|---|---|---|---|---|---|
| 2106706 | Extended Review | 2024-03-27 | 1 | 1152671 | Dana Nguyen |
| 2106706 | Extended Review | 2024-03-27 | 2 | 1186099 | Kimberly Myers |
| 1437591 | Pilot Initiative A | 2025-08-11 | 2 | 1186099 | Kimberly Myers |
| 1437591 | Pilot Initiative A | 2025-08-11 | 3 | 7441154 | Kimberly Myers |
| 12042 | Baseline Model | 2022-01-22 | 3 | 7441154 | Kimberly Myers |
| 12042 | Baseline Model | 2022-01-22 | 4 | 338514 | Guam International Airport |
| 1562831 | Distributed Cluster | 2023-06-06 | 4 | 338514 | Guam International Airport |
| 1562831 | Distributed Cluster | 2023-06-06 | 1 | 1152671 | Dana Nguyen |

The `technology_transfer_department_administrative_director_view` joins `technology_transfer_departments` to `administrative_directors` on the department ID. It answers: *Which administrative director manages this technology transfer department?*

**View `technology_transfer_department_administrative_director_view`**

```sql
CREATE VIEW technology_transfer_department_administrative_director_view AS
SELECT a.id, a.department_id, a.name, a.established_date, b.administrative_director_id AS director_administrative_director_id, b.official_name AS director_official_name, b.title AS director_title
FROM technology_transfer_departments a JOIN administrative_directors b ON a.administrative_director_id = b.administrative_director_id;
```

| id | department_id | name | established_date | director_administrative_director_id | director_official_name | director_title |
|---|---|---|---|---|---|---|
| 1 | 2087755 | Extended Review | 2024-03-27 | 1 | Extended Review | Compact Initiative |
| 2 | 790483 | Pilot Initiative A | 2025-08-11 | 2 | Pilot Initiative A | Legacy Model |
| 3 | 505978 | Baseline Model | 2022-01-22 | 3 | Baseline Model | Regional Cluster A |
| 4 | id_6 | Distributed Cluster | 2023-06-06 | 4 | Distributed Cluster | Seasonal Review |

The `technology_transfer_department_technology_transfer_vice_president_view` joins `technology_transfer_departments` to `technology_transfer_vice_presidents`. It answers: *Which VP oversees this technology transfer department?*

**View `technology_transfer_department_technology_transfer_vice_president_view`**

```sql
CREATE VIEW technology_transfer_department_technology_transfer_vice_president_view AS
SELECT a.id, a.department_id, a.name, a.established_date, b.technology_transfer_vice_president_id AS president_technology_transfer_vice_president_id, b.official_name AS president_official_name, b.title AS president_title
FROM technology_transfer_departments a JOIN technology_transfer_vice_presidents b ON a.technology_transfer_vice_president_id = b.technology_transfer_vice_president_id;
```

| id | department_id | name | established_date | president_technology_transfer_vice_president_id | president_official_name | president_title |
|---|---|---|---|---|---|---|
| 1 | 2087755 | Extended Review | 2024-03-27 | 100 | Extended Review | Compact Initiative |
| 2 | 790483 | Pilot Initiative A | 2025-08-11 | 101 | Pilot Initiative A | Legacy Model |
| 3 | 505978 | Baseline Model | 2022-01-22 | 102 | Baseline Model | Regional Cluster A |
| 4 | id_6 | Distributed Cluster | 2023-06-06 | 103 | Distributed Cluster | Seasonal Review |

The `administrative_director_technology_transfer_department_view` is the inverse, presenting the director as the primary entity. It answers: *Which department does this administrative director manage?*

**View `administrative_director_technology_transfer_department_view`**

```sql
CREATE VIEW administrative_director_technology_transfer_department_view AS
SELECT a.administrative_director_id, a.official_name, a.title, a.appointment_date, b.id AS department_id, b.department_id AS department_department_id, b.name AS department_name
FROM administrative_directors a JOIN technology_transfer_departments b ON a.technology_transfer_department_id = b.id;
```

| administrative_director_id | official_name | title | appointment_date | department_id | department_department_id | department_name |
|---|---|---|---|---|---|---|
| 1 | Extended Review | Compact Initiative | 2022-05-03 | 1 | 2087755 | Extended Review |
| 2 | Pilot Initiative A | Legacy Model | 2023-10-14 | 2 | 790483 | Pilot Initiative A |
| 3 | Baseline Model | Regional Cluster A | 2024-03-25 | 3 | 505978 | Baseline Model |
| 4 | Distributed Cluster | Seasonal Review | 2025-08-09 | 4 | id_6 | Distributed Cluster |

The `technology_transfer_vice_president_technology_transfer_department_view` is similarly inverse, answering: *Which department does this technology transfer VP oversee?*

**View `technology_transfer_vice_president_technology_transfer_department_view`**

```sql
CREATE VIEW technology_transfer_vice_president_technology_transfer_department_view AS
SELECT a.technology_transfer_vice_president_id, a.official_name, a.title, a.appointment_date, b.id AS department_id, b.department_id AS department_department_id, b.name AS department_name
FROM technology_transfer_vice_presidents a JOIN technology_transfer_departments b ON a.technology_transfer_department_id = b.id;
```

| technology_transfer_vice_president_id | official_name | title | appointment_date | department_id | department_department_id | department_name |
|---|---|---|---|---|---|---|
| 100 | Extended Review | Compact Initiative | 2022-05-03 | 1 | 2087755 | Extended Review |
| 101 | Pilot Initiative A | Legacy Model | 2023-10-14 | 2 | 790483 | Pilot Initiative A |
| 102 | Baseline Model | Regional Cluster A | 2024-03-25 | 3 | 505978 | Baseline Model |
| 103 | Distributed Cluster | Seasonal Review | 2025-08-09 | 4 | id_6 | Distributed Cluster |

## Synthesis

The schema models a university's research and academic infrastructure as a set of normalized base tables connected by foreign keys and junction tables. Entity types — committees, vice presidents, bureaus, doctoral schools, directors, colleges, laboratories, and technology transfer departments — each have their own table with a surrogate primary key and a business identifier. Attributes such as names, dates, and status flags are stored directly as columns. Relationships are expressed through foreign keys: a committee references its VP, a VP references its bureau and committee, a school references its director and college, and departments reference their directors and VPs. Many-to-many associations between schools, laboratories, and colleges are resolved through junction tables (`schools_laboratories`, `colleges_schools`, `laboratories_schools`). The view layer then reassembles these normalized pieces into domain-level records, each view answering a specific question by joining two or more base tables. The result is a schema that is both normalized for data integrity and denormalized for analytical convenience through its views.