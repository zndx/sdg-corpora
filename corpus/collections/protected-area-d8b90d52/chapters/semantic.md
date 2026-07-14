## Ontology-Grounded Relational Modelling of the Protected-Area Management Domain

The domain under consideration captures the administrative and operational fabric of protected-area management across European jurisdictions. At its core, the ontology distinguishes six entity types: protected areas, management units, projects, project leaders, ALPARC organisations, and events. Each entity type materialises as a base table whose columns correspond to the ontology's attributes, while the relationships between entities are expressed through foreign keys and junction tables. The resulting schema is a normalised relational model that can be reassembled into domain-level views, each answering a specific analytical question by joining the appropriate tables.

Before examining the joins, it is useful to survey the base tables and the identifiers that anchor them.

**Table `protected_areas`**

| id | identifier | name | area_size | establishment_date | management_status | zoning_classification | country_code | management_unit_id | project_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 1.52 | 2024-07-11 | active | national_park | FR | 1000 | 1 |
| 2 | IDE-2091 | Pilot Initiative A | 0.65 | 2025-12-22 | inactive | nature_reserve | IT | 1001 | 2 |
| 3 | IDE-2096 | Baseline Model | 0.43012016 | 2022-05-06 | pending | landscape_park | DE | 1002 | 3 |
| 4 | IDE-2101 | Distributed Cluster | 0.6000001 | 2023-10-17 | active | biosphere_reserve | AT | 1003 | 4 |

The `protected_areas` table stores the geographic and regulatory identity of each reserve. The surrogate key `id` is an integer, while the business key `identifier` carries a human-readable code such as `IDE-2086` or `IDE-2101`. The `name` column holds descriptive labels — "Extended Review", "Pilot Initiative A", "Baseline Model", "Distributed Cluster" — and `area_size` records the reserve's footprint as a decimal (1.52, 0.65, 0.43012016, 0.6000001). Temporal and regulatory context comes from `establishment_date`, `management_status` (active, inactive, pending), and `zoning_classification` (national_park, nature_reserve, landscape_park, biosphere_reserve). The `country_code` column (FR, IT, DE, AT) anchors each area to a jurisdiction. Two foreign keys, `management_unit_id` and `project_id`, link the area to its overseeing unit and to a project, respectively.

**Table `management_units`**

| id | unit_id | unit_name | headquarters_location | establishment_date | legal_status | contact_email | protected_area_id | a_l_p_a_r_c_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 39800614 | Compact Series | composite-headquar-63 | 2024-07-11 | public | Christopher Wilson | 1 | 1 |
| 1001 | 611523 | Legacy Assessment | primary-headquar-64 | 2025-12-22 | private | Charles Larsen | 2 | 2 |
| 1002 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A | adaptive-headquar-65 | 2022-05-06 | non_profit | Mary Alvarez | 3 | 3 |
| 1003 | account_pymes_1040 | Seasonal Corridor | distributed-headquar-66 | 2023-10-17 | public | April Snyder | 4 | 4 |

Management units are the operational arms that administer protected areas. The table `management_units` uses `id` as its surrogate key (1000–1003) and carries a business `unit_id` that varies in format — a numeric string like `39800614`, a UUID fragment such as `57dbb53c-8fcc-11eb-924d-9cd76263cbd0`, or an alphanumeric handle like `account_pymes_1040`. The `unit_name` column provides a human label ("Compact Series", "Legacy Assessment", "Regional Survey A", "Seasonal Corridor"), while `headquarters_location` stores a coded location identifier. The `legal_status` column distinguishes public, private, and non_profit entities, and `contact_email` holds the responsible person's address (Christopher Wilson, Charles Larsen, Mary Alvarez, April Snyder). The foreign keys `protected_area_id` and `a_l_p_a_r_c_id` tie each unit to a protected area and to an ALPARC organisation.

**Table `projects`**

| project_id | project_name | start_date | end_date | funding_source | project_status | budget_amount | primary_objective | a_l_p_a_r_c_id | project_leader_employee_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Compact Survey | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | Interreg | planning | 43.48 | climate_change | 1 | Norma Fisher |
| 2 | Legacy Corridor | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | ALPARC | active | 37.54 | ecological_networks | 2 | Tasha Rodriguez |
| 3 | Regional Series A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | EU | completed | 35.57 | sustainable_tourism | 3 | Theodore Mcgrath |
| 4 | Seasonal Assessment | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | National | cancelled | 19.95 | fauna_monitoring | 4 | Peter Mcdowell |

Projects represent funded initiatives with a lifecycle. The `projects` table uses `project_id` as its primary key (1–4) and stores `project_name` ("Compact Survey", "Legacy Corridor", "Regional Series A", "Seasonal Assessment"), temporal bounds (`start_date`, `end_date`), `funding_source` (Interreg, ALPARC, EU, National), `project_status` (planning, active, completed, cancelled), `budget_amount` (43.48, 37.54, 35.57, 19.95), and `primary_objective` (climate_change, ecological_networks, sustainable_tourism, fauna_monitoring). The foreign keys `a_l_p_a_r_c_id` and `project_leader_employee_id` connect the project to its sponsoring organisation and to the leader who oversees it.

**Table `project_leaders`**

| employee_id | full_name | contract_start_date | contract_end_date | primary_language | secondary_language | education_level | years_experience | a_l_p_a_r_c_id | project_id | management_unit_id |
|---|---|---|---|---|---|---|---|---|---|---|
| Norma Fisher | Theodore Mcgrath | 2022-01-26 | 2025-12-07 | French | French | Baccalaureate | 16 | 1 | 1 | 1000 |
| Tasha Rodriguez | Account Name | 2023-06-10 | 2022-05-18 | Italian | Italian | Master | 22 | 2 | 2 | 1001 |
| Theodore Mcgrath | Saipan International Airport | 2024-11-21 | 2023-10-02 | German | German | Baccalaureate | 28 | 3 | 3 | 1002 |
| Peter Mcdowell | Norma Fisher | 2025-04-05 | 2024-03-13 | Slovene | Slovene | Master | 34 | 4 | 4 | 1003 |

Project leaders are people (or, in this fictional dataset, person-like records) who direct projects. The `project_leaders` table uses `employee_id` as its key, which in the sample data coincides with the leader's name ("Norma Fisher", "Tasha Rodriguez", "Theodore Mcgrath", "Peter Mcdowell"). The `full_name` column holds a secondary name or organisational alias. Contractual terms are captured in `contract_start_date` and `contract_end_date`, while `primary_language` and `secondary_language` record linguistic capabilities (French, Italian, German, Slovene). `education_level` (Baccalaureate, Master) and `years_experience` (16, 22, 28, 34) describe qualifications. The foreign keys `a_l_p_a_r_c_id`, `project_id`, and `management_unit_id` link the leader to the sponsoring organisation, the project they lead, and the management unit they serve.

**Table `a_l_p_a_r_cs`**

| id | org_id | org_name | headquarters_city | headquarters_country | founding_year | website_url | total_members | project_id | project_leader_employee_id | management_unit_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | seasonal-headquar-83 | regional-headquar-42 | 43 | https://github.com/chiphuyen/lazynlp | 31 | 1 | Norma Fisher | 1000 |
| 2 | 1717 | Pilot Initiative A | regional-headquar-84 | legacy-headquar-43 | 48 | https://bugs.launchpad.net/ironic/+bug/1346406 | 77 | 2 | Tasha Rodriguez | 1001 |
| 3 | 69437 | Baseline Model | legacy-headquar-85 | compact-headquar-44 | 53 | http://en.wikipedia.org/wiki/Hyla_femoralis | 2 | 3 | Theodore Mcgrath | 1002 |
| 4 | m16 | Distributed Cluster | compact-headquar-86 | composite-headquar-45 | 58 | https://www.nature.com/articles/nphoton.2014.41 | 20 | 4 | Peter Mcdowell | 1003 |

ALPARC organisations are the umbrella bodies that sponsor projects and coordinate management units. The `a_l_p_a_r_cs` table uses `id` as its surrogate key and stores `org_id` (790471, 1717, 69437, m16), `org_name` (matching the protected-area names in this synthetic dataset), `headquarters_city`, `headquarters_country`, `founding_year` (43–58), `website_url`, and `total_members` (31, 77, 2, 20). Foreign keys `project_id`, `project_leader_employee_id`, and `management_unit_id` connect each ALPARC to its project, leader, and unit.

**Table `events`**

| event_id | event_name | event_date | event_type | location | organizer | attendance_count | a_l_p_a_r_c_id | management_unit_id | project_leader_employee_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Seasonal Standard | 2025-04-15T15:21:00 | workshop | extended-location-99 | integrated-organize-28 | 42 | 1 | 1000 | Norma Fisher |
| 101 | Integrated Framework | 2022-09-26T22:38:00 | symposium | integrated-location-100 | seasonal-organize-29 | 1 | 2 | 1001 | Tasha Rodriguez |
| 102 | Extended Protocol D | 2023-02-10T05:55:00 | conference | seasonal-location-101 | regional-organize-30 | 5 | 3 | 1002 | Theodore Mcgrath |
| 103 | Pilot Programme | 2024-07-21T12:12:00 | meeting | regional-location-102 | legacy-organize-31 | 30 | 4 | 1003 | Peter Mcdowell |

Events are discrete activities — workshops, symposia, conferences, meetings — organised within the domain. The `events` table uses `event_id` (100–103) as its key and stores `event_name` ("Seasonal Standard", "Integrated Framework", "Extended Protocol D", "Pilot Programme"), `event_date`, `event_type`, `location`, `organizer`, and `attendance_count` (42, 1, 5, 30). The foreign keys `a_l_p_a_r_c_id`, `management_unit_id`, and `project_leader_employee_id` tie each event to the sponsoring organisation, the management unit, and the leader who organised it.

The domain also includes two junction tables that resolve many-to-many relationships.

**Table `projects_areas`**

| project_id | protected_area_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `projects_areas` junction table links projects to protected areas, allowing a single project to span multiple reserves and a single reserve to host multiple projects.

**Table `projects_units`**

| project_id | management_unit_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

Similarly, `projects_units` links projects to management units, enabling a project to operate across several units and a unit to participate in multiple projects.

With the base tables established, we now turn to the views — materialised or virtual queries that reassemble normalised rows into domain-level facts. Each view answers a specific question by joining the appropriate tables.

**View `v_protected_area_management_unit`**

```sql
CREATE VIEW v_protected_area_management_unit AS
SELECT a.id, a.identifier, a.name, a.area_size, b.id AS unit_id, b.unit_id AS unit_unit_id, b.unit_name AS unit_unit_name
FROM protected_areas a JOIN management_units b ON a.management_unit_id = b.id;
```

| id | identifier | name | area_size | unit_id | unit_unit_id | unit_unit_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 1.52 | 1000 | 39800614 | Compact Series |
| 2 | IDE-2091 | Pilot Initiative A | 0.65 | 1001 | 611523 | Legacy Assessment |
| 3 | IDE-2096 | Baseline Model | 0.43012016 | 1002 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A |
| 4 | IDE-2101 | Distributed Cluster | 0.6000001 | 1003 | account_pymes_1040 | Seasonal Corridor |

The view `v_protected_area_management_unit` joins `protected_areas` to `management_units` on the shared `management_unit_id` / `protected_area_id` relationship. It answers the question: "Which management unit administers which protected area?" A row from this view might show that the protected area "Extended Review" (identifier `IDE-2086`, country `FR`) is administered by the management unit "Compact Series" (unit_id `39800614`, legal status `public`). This view collapses the two-table relationship into a single flat record, making it straightforward to report on area-unit pairings.

**View `v_protected_area_project`**

```sql
CREATE VIEW v_protected_area_project AS
SELECT a.id, a.identifier, a.name, a.area_size, b.project_id AS project_project_id, b.project_name AS project_project_name, b.start_date AS project_start_date
FROM protected_areas a JOIN projects b ON a.project_id = b.project_id;
```

| id | identifier | name | area_size | project_project_id | project_project_name | project_start_date |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 1.52 | 1 | Compact Survey | 2022-09-05T20:24:00 |
| 2 | IDE-2091 | Pilot Initiative A | 0.65 | 2 | Legacy Corridor | 2023-02-16T03:41:00 |
| 3 | IDE-2096 | Baseline Model | 0.43012016 | 3 | Regional Series A | 2024-07-27T10:58:00 |
| 4 | IDE-2101 | Distributed Cluster | 0.6000001 | 4 | Seasonal Assessment | 2025-12-11T17:15:00 |

The view `v_protected_area_project` joins `protected_areas` to `projects` via the `project_id` foreign key. It answers: "Which project is associated with which protected area?" A representative row links the protected area "Pilot Initiative A" (identifier `IDE-2091`, zoning `nature_reserve`, country `IT`) to the project "Legacy Corridor" (funding source `ALPARC`, status `active`, budget `37.54`). This view is useful for auditing which projects have geographic footprints in which reserves.

**View `v_management_unit_protected_area`**

```sql
CREATE VIEW v_management_unit_protected_area AS
SELECT a.id, a.unit_id, a.unit_name, a.headquarters_location, b.id AS area_id, b.identifier AS area_identifier, b.name AS area_name
FROM management_units a JOIN protected_areas b ON a.protected_area_id = b.id;
```

| id | unit_id | unit_name | headquarters_location | area_id | area_identifier | area_name |
|---|---|---|---|---|---|---|
| 1000 | 39800614 | Compact Series | composite-headquar-63 | 1 | IDE-2086 | Extended Review |
| 1001 | 611523 | Legacy Assessment | primary-headquar-64 | 2 | IDE-2091 | Pilot Initiative A |
| 1002 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A | adaptive-headquar-65 | 3 | IDE-2096 | Baseline Model |
| 1003 | account_pymes_1040 | Seasonal Corridor | distributed-headquar-66 | 4 | IDE-2101 | Distributed Cluster |

The view `v_management_unit_protected_area` performs the inverse join of `v_protected_area_management_unit`, starting from `management_units` and reaching `protected_areas`. It answers: "Which protected areas fall under the jurisdiction of a given management unit?" A row might show that the management unit "Legacy Assessment" (unit_id `611523`, legal status `private`, contact `Charles Larsen`) oversees the protected area "Pilot Initiative A" (identifier `IDE-2091`, area size `0.65`, status `inactive`). This perspective is valuable for management-unit-level reporting.

**View `v_management_unit_a_l_p_a_r_c`**

```sql
CREATE VIEW v_management_unit_a_l_p_a_r_c AS
SELECT a.id, a.unit_id, a.unit_name, a.headquarters_location, b.id AS c_id, b.org_id AS c_org_id, b.org_name AS c_org_name
FROM management_units a JOIN a_l_p_a_r_cs b ON a.a_l_p_a_r_c_id = b.id;
```

| id | unit_id | unit_name | headquarters_location | c_id | c_org_id | c_org_name |
|---|---|---|---|---|---|---|
| 1000 | 39800614 | Compact Series | composite-headquar-63 | 1 | 790471 | Extended Review |
| 1001 | 611523 | Legacy Assessment | primary-headquar-64 | 2 | 1717 | Pilot Initiative A |
| 1002 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A | adaptive-headquar-65 | 3 | 69437 | Baseline Model |
| 1003 | account_pymes_1040 | Seasonal Corridor | distributed-headquar-66 | 4 | m16 | Distributed Cluster |

The view `v_management_unit_a_l_p_a_r_c` joins `management_units` to `a_l_p_a_r_cs` on the shared `a_l_p_a_r_c_id`. It answers: "Which ALPARC organisation sponsors which management unit?" A row from this view might show that the management unit "Regional Survey A" (headquarters `adaptive-headquar-65`, legal status `non_profit`) is sponsored by the ALPARC organisation "Baseline Model" (org_id `69437`, founding year `53`, total members `2`). This view supports organisational accountability reporting.

**View `v_project_a_l_p_a_r_c`**

```sql
CREATE VIEW v_project_a_l_p_a_r_c AS
SELECT a.project_id, a.project_name, a.start_date, a.end_date, b.id AS c_id, b.org_id AS c_org_id, b.org_name AS c_org_name
FROM projects a JOIN a_l_p_a_r_cs b ON a.a_l_p_a_r_c_id = b.id;
```

| project_id | project_name | start_date | end_date | c_id | c_org_id | c_org_name |
|---|---|---|---|---|---|---|
| 1 | Compact Survey | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 790471 | Extended Review |
| 2 | Legacy Corridor | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 1717 | Pilot Initiative A |
| 3 | Regional Series A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 69437 | Baseline Model |
| 4 | Seasonal Assessment | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | m16 | Distributed Cluster |

The view `v_project_a_l_p_a_r_c` joins `projects` to `a_l_p_a_r_cs` on `a_l_p_a_r_c_id`. It answers: "Which ALPARC organisation funds which project?" A representative row links the project "Compact Survey" (funding source `Interreg`, status `planning`, budget `43.48`, objective `climate_change`) to the ALPARC organisation "Extended Review" (org_id `790471`, founding year `43`, total members `31`). This view is central to financial and sponsorship audits.

**View `v_project_protected_area_detail`**

```sql
CREATE VIEW v_project_protected_area_detail AS
SELECT a.project_id, a.project_name, a.start_date, b.id AS area_id, b.identifier AS area_identifier, b.name AS area_name
FROM projects a
  JOIN projects_areas j ON j.project_id = a.project_id
  JOIN protected_areas b ON b.id = j.protected_area_id;
```

| project_id | project_name | start_date | area_id | area_identifier | area_name |
|---|---|---|---|---|---|
| 1 | Compact Survey | 2022-09-05T20:24:00 | 1 | IDE-2086 | Extended Review |
| 1 | Compact Survey | 2022-09-05T20:24:00 | 2 | IDE-2091 | Pilot Initiative A |
| 2 | Legacy Corridor | 2023-02-16T03:41:00 | 2 | IDE-2091 | Pilot Initiative A |
| 2 | Legacy Corridor | 2023-02-16T03:41:00 | 3 | IDE-2096 | Baseline Model |
| 3 | Regional Series A | 2024-07-27T10:58:00 | 3 | IDE-2096 | Baseline Model |
| 3 | Regional Series A | 2024-07-27T10:58:00 | 4 | IDE-2101 | Distributed Cluster |
| 4 | Seasonal Assessment | 2025-12-11T17:15:00 | 4 | IDE-2101 | Distributed Cluster |
| 4 | Seasonal Assessment | 2025-12-11T17:15:00 | 1 | IDE-2086 | Extended Review |

The view `v_project_protected_area_detail` joins `projects` to `protected_areas` via the `project_id` foreign key in `protected_areas`. It answers: "What are the full details of a project and the protected area it is linked to?" A row might show the project "Regional Series A" (funding `EU`, status `completed`, budget `35.57`, objective `sustainable_tourism`) alongside the protected area "Baseline Model" (identifier `IDE-2096`, area size `0.43012016`, zoning `landscape_park`, country `DE`). This view provides a combined project-area snapshot for cross-domain analysis.

**View `v_project_management_unit_detail`**

```sql
CREATE VIEW v_project_management_unit_detail AS
SELECT a.project_id, a.project_name, a.start_date, b.id AS unit_id, b.unit_id AS unit_unit_id, b.unit_name AS unit_unit_name
FROM projects a
  JOIN projects_units j ON j.project_id = a.project_id
  JOIN management_units b ON b.id = j.management_unit_id;
```

| project_id | project_name | start_date | unit_id | unit_unit_id | unit_unit_name |
|---|---|---|---|---|---|
| 1 | Compact Survey | 2022-09-05T20:24:00 | 1000 | 39800614 | Compact Series |
| 1 | Compact Survey | 2022-09-05T20:24:00 | 1001 | 611523 | Legacy Assessment |
| 2 | Legacy Corridor | 2023-02-16T03:41:00 | 1001 | 611523 | Legacy Assessment |
| 2 | Legacy Corridor | 2023-02-16T03:41:00 | 1002 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A |
| 3 | Regional Series A | 2024-07-27T10:58:00 | 1002 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A |
| 3 | Regional Series A | 2024-07-27T10:58:00 | 1003 | account_pymes_1040 | Seasonal Corridor |
| 4 | Seasonal Assessment | 2025-12-11T17:15:00 | 1003 | account_pymes_1040 | Seasonal Corridor |
| 4 | Seasonal Assessment | 2025-12-11T17:15:00 | 1000 | 39800614 | Compact Series |

The view `v_project_management_unit_detail` joins `projects` to `management_units` through the `management_unit_id` / `protected_area_id` chain. It answers: "Which management unit is associated with a given project?" A row might show the project "Seasonal Assessment" (funding `National`, status `cancelled`, budget `19.95`, objective `fauna_monitoring`) alongside the management unit "Seasonal Corridor" (unit_id `account_pymes_1040`, headquarters `distributed-headquar-66`, legal status `public`, contact `April Snyder`). This view supports operational coordination reporting.

**View `v_project_project_leader`**

```sql
CREATE VIEW v_project_project_leader AS
SELECT a.project_id, a.project_name, a.start_date, a.end_date, b.employee_id AS leader_employee_id, b.full_name AS leader_full_name, b.contract_start_date AS leader_contract_start_date
FROM projects a JOIN project_leaders b ON a.project_leader_employee_id = b.employee_id;
```

| project_id | project_name | start_date | end_date | leader_employee_id | leader_full_name | leader_contract_start_date |
|---|---|---|---|---|---|---|
| 1 | Compact Survey | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | Norma Fisher | Theodore Mcgrath | 2022-01-26 |
| 2 | Legacy Corridor | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | Tasha Rodriguez | Account Name | 2023-06-10 |
| 3 | Regional Series A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | Theodore Mcgrath | Saipan International Airport | 2024-11-21 |
| 4 | Seasonal Assessment | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | Peter Mcdowell | Norma Fisher | 2025-04-05 |

The view `v_project_project_leader` joins `projects` to `project_leaders` on `project_leader_employee_id`. It answers: "Who leads which project?" A row from this view might show the project "Compact Survey" (funding `Interreg`, status `planning`, budget `43.48`, objective `climate_change`) led by "Norma Fisher" (contract period `2022-01-26` to `2025-12-07`, primary language `French`, education `Baccalaureate`, `16` years experience). This view is essential for human-resources and accountability queries.

**View `v_project_leader_a_l_p_a_r_c`**

```sql
CREATE VIEW v_project_leader_a_l_p_a_r_c AS
SELECT a.employee_id, a.full_name, a.contract_start_date, a.contract_end_date, b.id AS c_id, b.org_id AS c_org_id, b.org_name AS c_org_name
FROM project_leaders a JOIN a_l_p_a_r_cs b ON a.a_l_p_a_r_c_id = b.id;
```

| employee_id | full_name | contract_start_date | contract_end_date | c_id | c_org_id | c_org_name |
|---|---|---|---|---|---|---|
| Norma Fisher | Theodore Mcgrath | 2022-01-26 | 2025-12-07 | 1 | 790471 | Extended Review |
| Tasha Rodriguez | Account Name | 2023-06-10 | 2022-05-18 | 2 | 1717 | Pilot Initiative A |
| Theodore Mcgrath | Saipan International Airport | 2024-11-21 | 2023-10-02 | 3 | 69437 | Baseline Model |
| Peter Mcdowell | Norma Fisher | 2025-04-05 | 2024-03-13 | 4 | m16 | Distributed Cluster |

The view `v_project_leader_a_l_p_a_r_c` joins `project_leaders` to `a_l_p_a_r_cs` on `a_l_p_a_r_c_id`. It answers: "Which ALPARC organisation is associated with a given project leader?" A row might show the leader "Tasha Rodriguez" (contract `2023-06-10` to `2022-05-18`, primary language `Italian`, education `Master`, `22` years experience) affiliated with the ALPARC organisation "Pilot Initiative A" (org_id `1717`, founding year `48`, total members `77`). This view supports organisational affiliation reporting.

**View `v_project_leader_project`**

```sql
CREATE VIEW v_project_leader_project AS
SELECT a.employee_id, a.full_name, a.contract_start_date, a.contract_end_date, b.project_id AS project_project_id, b.project_name AS project_project_name, b.start_date AS project_start_date
FROM project_leaders a JOIN projects b ON a.project_id = b.project_id;
```

| employee_id | full_name | contract_start_date | contract_end_date | project_project_id | project_project_name | project_start_date |
|---|---|---|---|---|---|---|
| Norma Fisher | Theodore Mcgrath | 2022-01-26 | 2025-12-07 | 1 | Compact Survey | 2022-09-05T20:24:00 |
| Tasha Rodriguez | Account Name | 2023-06-10 | 2022-05-18 | 2 | Legacy Corridor | 2023-02-16T03:41:00 |
| Theodore Mcgrath | Saipan International Airport | 2024-11-21 | 2023-10-02 | 3 | Regional Series A | 2024-07-27T10:58:00 |
| Peter Mcdowell | Norma Fisher | 2025-04-05 | 2024-03-13 | 4 | Seasonal Assessment | 2025-12-11T17:15:00 |

The view `v_project_leader_project` joins `project_leaders` to `projects` on `project_id`. It answers: "Which project is led by a given project leader?" A row might show the leader "Theodore Mcgrath" (contract `2024-11-21` to `2023-10-02`, primary language `German`, education `Baccalaureate`, `28` years experience) leading the project "Regional Series A" (funding `EU`, status `completed`, budget `35.57`, objective `sustainable_tourism`). This view is useful for workload and capacity analysis.

**View `v_project_leader_management_unit`**

```sql
CREATE VIEW v_project_leader_management_unit AS
SELECT a.employee_id, a.full_name, a.contract_start_date, a.contract_end_date, b.id AS unit_id, b.unit_id AS unit_unit_id, b.unit_name AS unit_unit_name
FROM project_leaders a JOIN management_units b ON a.management_unit_id = b.id;
```

| employee_id | full_name | contract_start_date | contract_end_date | unit_id | unit_unit_id | unit_unit_name |
|---|---|---|---|---|---|---|
| Norma Fisher | Theodore Mcgrath | 2022-01-26 | 2025-12-07 | 1000 | 39800614 | Compact Series |
| Tasha Rodriguez | Account Name | 2023-06-10 | 2022-05-18 | 1001 | 611523 | Legacy Assessment |
| Theodore Mcgrath | Saipan International Airport | 2024-11-21 | 2023-10-02 | 1002 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A |
| Peter Mcdowell | Norma Fisher | 2025-04-05 | 2024-03-13 | 1003 | account_pymes_1040 | Seasonal Corridor |

The view `v_project_leader_management_unit` joins `project_leaders` to `management_units` on `management_unit_id`. It answers: "Which management unit does a given project leader serve?" A row might show the leader "Peter Mcdowell" (contract `2025-04-05` to `2024-03-13`, primary language `Slovene`, education `Master`, `34` years experience) serving the management unit "Seasonal Corridor" (unit_id `account_pymes_1040`, headquarters `distributed-headquar-66`, legal status `public`, contact `April Snyder`). This view supports staffing and deployment queries.

**View `v_a_l_p_a_r_c_project`**

```sql
CREATE VIEW v_a_l_p_a_r_c_project AS
SELECT a.id, a.org_id, a.org_name, a.headquarters_city, b.project_id AS project_project_id, b.project_name AS project_project_name, b.start_date AS project_start_date
FROM a_l_p_a_r_cs a JOIN projects b ON a.project_id = b.project_id;
```

| id | org_id | org_name | headquarters_city | project_project_id | project_project_name | project_start_date |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | seasonal-headquar-83 | 1 | Compact Survey | 2022-09-05T20:24:00 |
| 2 | 1717 | Pilot Initiative A | regional-headquar-84 | 2 | Legacy Corridor | 2023-02-16T03:41:00 |
| 3 | 69437 | Baseline Model | legacy-headquar-85 | 3 | Regional Series A | 2024-07-27T10:58:00 |
| 4 | m16 | Distributed Cluster | compact-headquar-86 | 4 | Seasonal Assessment | 2025-12-11T17:15:00 |

The view `v_a_l_p_a_r_c_project` joins `a_l_p_a_r_cs` to `projects` on `project_id`. It answers: "Which projects are sponsored by a given ALPARC organisation?" A row might show the ALPARC organisation "Extended Review" (org_id `790471`, headquarters `seasonal-headquar-83`, founding year `43`, total members `31`) sponsoring the project "Compact Survey" (funding `Interreg`, status `planning`, budget `43.48`, objective `climate_change`). This view is central to sponsorship and portfolio management.

**View `v_a_l_p_a_r_c_project_leader`**

```sql
CREATE VIEW v_a_l_p_a_r_c_project_leader AS
SELECT a.id, a.org_id, a.org_name, a.headquarters_city, b.employee_id AS leader_employee_id, b.full_name AS leader_full_name, b.contract_start_date AS leader_contract_start_date
FROM a_l_p_a_r_cs a JOIN project_leaders b ON a.project_leader_employee_id = b.employee_id;
```

| id | org_id | org_name | headquarters_city | leader_employee_id | leader_full_name | leader_contract_start_date |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | seasonal-headquar-83 | Norma Fisher | Theodore Mcgrath | 2022-01-26 |
| 2 | 1717 | Pilot Initiative A | regional-headquar-84 | Tasha Rodriguez | Account Name | 2023-06-10 |
| 3 | 69437 | Baseline Model | legacy-headquar-85 | Theodore Mcgrath | Saipan International Airport | 2024-11-21 |
| 4 | m16 | Distributed Cluster | compact-headquar-86 | Peter Mcdowell | Norma Fisher | 2025-04-05 |

The view `v_a_l_p_a_r_c_project_leader` joins `a_l_p_a_r_cs` to `project_leaders` on `project_leader_employee_id`. It answers: "Which project leaders are affiliated with a given ALPARC organisation?" A row might show the ALPARC organisation "Pilot Initiative A" (org_id `1717`, headquarters `regional-headquar-84`, founding year `48`, total members `77`) affiliated with the leader "Tasha Rodriguez" (contract `2023-06-10` to `2022-05-18`, primary language `Italian`, education `Master`, `22` years experience). This view supports human-capital reporting.

**View `v_a_l_p_a_r_c_management_unit`**

```sql
CREATE VIEW v_a_l_p_a_r_c_management_unit AS
SELECT a.id, a.org_id, a.org_name, a.headquarters_city, b.id AS unit_id, b.unit_id AS unit_unit_id, b.unit_name AS unit_unit_name
FROM a_l_p_a_r_cs a JOIN management_units b ON a.management_unit_id = b.id;
```

| id | org_id | org_name | headquarters_city | unit_id | unit_unit_id | unit_unit_name |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | seasonal-headquar-83 | 1000 | 39800614 | Compact Series |
| 2 | 1717 | Pilot Initiative A | regional-headquar-84 | 1001 | 611523 | Legacy Assessment |
| 3 | 69437 | Baseline Model | legacy-headquar-85 | 1002 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A |
| 4 | m16 | Distributed Cluster | compact-headquar-86 | 1003 | account_pymes_1040 | Seasonal Corridor |

The view `v_a_l_p_a_r_c_management_unit` joins `a_l_p_a_r_cs` to `management_units` on `management_unit_id`. It answers: "Which management units are overseen by a given ALPARC organisation?" A row might show the ALPARC organisation "Baseline Model" (org_id `69437`, headquarters `legacy-headquar-85`, founding year `53`, total members `2`) overseeing the management unit "Regional Survey A" (unit_id `57dbb53c-8fcc-11eb-924d-9cd76263cbd0`, headquarters `adaptive-headquar-65`, legal status `non_profit`, contact `Mary Alvarez`). This view supports organisational governance reporting.

**View `v_event_a_l_p_a_r_c`**

```sql
CREATE VIEW v_event_a_l_p_a_r_c AS
SELECT a.event_id, a.event_name, a.event_date, a.event_type, b.id AS c_id, b.org_id AS c_org_id, b.org_name AS c_org_name
FROM events a JOIN a_l_p_a_r_cs b ON a.a_l_p_a_r_c_id = b.id;
```

| event_id | event_name | event_date | event_type | c_id | c_org_id | c_org_name |
|---|---|---|---|---|---|---|
| 100 | Seasonal Standard | 2025-04-15T15:21:00 | workshop | 1 | 790471 | Extended Review |
| 101 | Integrated Framework | 2022-09-26T22:38:00 | symposium | 2 | 1717 | Pilot Initiative A |
| 102 | Extended Protocol D | 2023-02-10T05:55:00 | conference | 3 | 69437 | Baseline Model |
| 103 | Pilot Programme | 2024-07-21T12:12:00 | meeting | 4 | m16 | Distributed Cluster |

The view `v_event_a_l_p_a_r_c` joins `events` to `a_l_p_a_r_cs` on `a_l_p_a_r_c_id`. It answers: "Which ALPARC organisation sponsors which event?" A row might show the event "Seasonal Standard" (type `workshop`, date `2025-04-15`, location `extended-location-99`, attendance `42`) sponsored by the ALPARC organisation "Extended Review" (org_id `790471`, founding year `43`, total members `31`). This view supports event-sponsorship tracking.

**View `v_event_management_unit`**

```sql
CREATE VIEW v_event_management_unit AS
SELECT a.event_id, a.event_name, a.event_date, a.event_type, b.id AS unit_id, b.unit_id AS unit_unit_id, b.unit_name AS unit_unit_name
FROM events a JOIN management_units b ON a.management_unit_id = b.id;
```

| event_id | event_name | event_date | event_type | unit_id | unit_unit_id | unit_unit_name |
|---|---|---|---|---|---|---|
| 100 | Seasonal Standard | 2025-04-15T15:21:00 | workshop | 1000 | 39800614 | Compact Series |
| 101 | Integrated Framework | 2022-09-26T22:38:00 | symposium | 1001 | 611523 | Legacy Assessment |
| 102 | Extended Protocol D | 2023-02-10T05:55:00 | conference | 1002 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A |
| 103 | Pilot Programme | 2024-07-21T12:12:00 | meeting | 1003 | account_pymes_1040 | Seasonal Corridor |

The view `v_event_management_unit` joins `events` to `management_units` on `management_unit_id`. It answers: "Which management unit is associated with a given event?" A row might show the event "Integrated Framework" (type `symposium`, date `2022-09-26`, location `integrated-location-100`, attendance `1`) associated with the management unit "Legacy Assessment" (unit_id `611523`, headquarters `primary-headquar-64`, legal status `private`, contact `Charles Larsen`). This view supports event-operations reporting.

**View `v_event_project_leader`**

```sql
CREATE VIEW v_event_project_leader AS
SELECT a.event_id, a.event_name, a.event_date, a.event_type, b.employee_id AS leader_employee_id, b.full_name AS leader_full_name, b.contract_start_date AS leader_contract_start_date
FROM events a JOIN project_leaders b ON a.project_leader_employee_id = b.employee_id;
```

| event_id | event_name | event_date | event_type | leader_employee_id | leader_full_name | leader_contract_start_date |
|---|---|---|---|---|---|---|
| 100 | Seasonal Standard | 2025-04-15T15:21:00 | workshop | Norma Fisher | Theodore Mcgrath | 2022-01-26 |
| 101 | Integrated Framework | 2022-09-26T22:38:00 | symposium | Tasha Rodriguez | Account Name | 2023-06-10 |
| 102 | Extended Protocol D | 2023-02-10T05:55:00 | conference | Theodore Mcgrath | Saipan International Airport | 2024-11-21 |
| 103 | Pilot Programme | 2024-07-21T12:12:00 | meeting | Peter Mcdowell | Norma Fisher | 2025-04-05 |

The view `v_event_project_leader` joins `events` to `project_leaders` on `project_leader_employee_id`. It answers: "Which project leader organised which event?" A row might show the event "Extended Protocol D" (type `conference`, date `2023-02-10`, location `seasonal-location-101`, attendance `5`) organised by the leader "Theodore Mcgrath" (contract `2024-11-21` to `2023-10-02`, primary language `German`, education `Baccalaureate`, `28` years experience). This view supports event-accountability and staffing analysis.

### Synthesis

The relational schema presented here is a direct materialisation of an ontology that distinguishes protected areas, management units, projects, project leaders, ALPARC organisations, and events. Each entity type is captured in a base table whose columns correspond to the ontology's attributes, with surrogate keys (`id`, `project_id`, `employee_id`, `event_id`) providing stable identifiers and foreign keys (`management_unit_id`, `project_id`, `a_l_p_a_r_c_id`, `protected_area_id`) encoding the relationships between entities. The junction tables `projects_areas` and `projects_units` resolve many-to-many relationships that cannot be expressed through simple foreign keys.

The twenty-one views collectively cover every pairwise relationship in the domain, each view answering a specific analytical question by joining two base tables. The views are not redundant: `v_protected_area_management_unit` and `v_management_unit_protected_area` offer complementary perspectives on the same relationship, while views like `v_project_protected_area_detail` and `v_project_management_unit_detail` provide enriched records that combine attributes from both sides of a join. Together, the base tables and views form a complete, queryable representation of the protected-area management domain, ready for reporting, auditing, and analytical exploration.