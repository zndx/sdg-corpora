## Protected Area Governance and Cross-Border Collaboration

Conservation management across European borders relies on coordinated networks of protected areas, administrative units, funded projects, and the people who lead them. The data model underpinning this ecosystem captures the full lifecycle of a protected area—from its establishment and zoning classification through its management by a dedicated unit, its association with a broader ALPARC organization, and its participation in funded projects with defined objectives and budgets. Events serve as operational touchpoints, linking leaders, units, and organizations into a coherent picture of who does what, where, and when.

**Table `protected_areas`**

| id | identifier | name | area_size | establishment_date | management_status | zoning_classification | country_code | management_unit_id | project_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 1.52 | 2024-07-11 | active | national_park | FR | 1000 | 1 |
| 2 | IDE-2091 | Pilot Initiative A | 0.65 | 2025-12-22 | inactive | nature_reserve | IT | 1001 | 2 |
| 3 | IDE-2096 | Baseline Model | 0.43012016 | 2022-05-06 | pending | landscape_park | DE | 1002 | 3 |
| 4 | IDE-2101 | Distributed Cluster | 0.6000001 | 2023-10-17 | active | biosphere_reserve | AT | 1003 | 4 |

Protected areas form the foundational layer of the conservation network. Each record carries a unique identifier such as `IDE-2086` or `IDE-2101`, a human-readable name like "Extended Review" or "Distributed Cluster," and an `area_size` measured in hectares—values ranging from 0.43 to 1.52 in the current dataset. The `establishment_date` anchors each area in time, with dates spanning from 2022 through 2025. The `management_status` field tracks whether an area is `active`, `inactive`, or `pending`, while `zoning_classification` distinguishes between categories such as `national_park`, `nature_reserve`, `landscape_park`, and `biosphere_reserve`. Geographic context is provided by `country_code`, with entries for France (`FR`), Italy (`IT`), Germany (`DE`), and Austria (`AT`). Each protected area is linked to a `management_unit_id` and a `project_id`, establishing its administrative and operational affiliations.

**Table `management_units`**

| id | unit_id | unit_name | headquarters_location | establishment_date | legal_status | contact_email | protected_area_id | a_l_p_a_r_c_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 39800614 | Compact Series | composite-headquar-63 | 2024-07-11 | public | Christopher Wilson | 1 | 1 |
| 1001 | 611523 | Legacy Assessment | primary-headquar-64 | 2025-12-22 | private | Charles Larsen | 2 | 2 |
| 1002 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Survey A | adaptive-headquar-65 | 2022-05-06 | non_profit | Mary Alvarez | 3 | 3 |
| 1003 | account_pymes_1040 | Seasonal Corridor | distributed-headquar-66 | 2023-10-17 | public | April Snyder | 4 | 4 |

Management units are the operational engines behind protected areas. Each unit has a `unit_id` that can take various formats—a numeric string like `39800614`, a UUID fragment such as `57dbb53c-8fcc-11eb-924d-9cd76263cbd0`, or an account-based identifier like `account_pymes_1040`. The `unit_name` provides a descriptive label, with examples including "Compact Series," "Legacy Assessment," "Regional Survey A," and "Seasonal Corridor." The `headquarters_location` field uses coded location names such as `composite-headquar-63` or `adaptive-headquar-65`. The `legal_status` distinguishes between `public`, `private`, and `non_profit` entities. A `contact_email` field provides a point of contact, with names like Christopher Wilson, Charles Larsen, Mary Alvarez, and April Snyder. Each management unit is associated with a `protected_area_id` and an `a_l_p_a_r_c_id`, tying it to both a specific area and a broader organizational umbrella.

**Table `projects`**

| project_id | project_name | start_date | end_date | funding_source | project_status | budget_amount | primary_objective | a_l_p_a_r_c_id | project_leader_employee_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Compact Survey | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | Interreg | planning | 43.48 | climate_change | 1 | Norma Fisher |
| 2 | Legacy Corridor | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | ALPARC | active | 37.54 | ecological_networks | 2 | Tasha Rodriguez |
| 3 | Regional Series A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | EU | completed | 35.57 | sustainable_tourism | 3 | Theodore Mcgrath |
| 4 | Seasonal Assessment | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | National | cancelled | 19.95 | fauna_monitoring | 4 | Peter Mcdowell |

Projects represent the funded initiatives that drive conservation work. Each project has a `project_id`, a `project_name` such as "Compact Survey" or "Legacy Corridor," and a `start_date` alongside an `end_date`. The `funding_source` identifies the financier—values include `Interreg`, `ALPARC`, `EU`, and `National`. The `project_status` tracks the lifecycle stage with values like `planning`, `active`, `completed`, and `cancelled`. The `budget_amount` is recorded as a decimal figure, ranging from 19.95 to 43.48 in the current data. The `primary_objective` field captures the conservation focus, with entries such as `climate_change`, `ecological_networks`, `sustainable_tourism`, and `fauna_monitoring`. Each project is linked to an `a_l_p_a_r_c_id` and a `project_leader_employee_id`, connecting it to both an organization and a person.

**Table `project_leaders`**

| employee_id | full_name | contract_start_date | contract_end_date | primary_language | secondary_language | education_level | years_experience | a_l_p_a_r_c_id | project_id | management_unit_id |
|---|---|---|---|---|---|---|---|---|---|---|
| Norma Fisher | Theodore Mcgrath | 2022-01-26 | 2025-12-07 | French | French | Baccalaureate | 16 | 1 | 1 | 1000 |
| Tasha Rodriguez | Account Name | 2023-06-10 | 2022-05-18 | Italian | Italian | Master | 22 | 2 | 2 | 1001 |
| Theodore Mcgrath | Saipan International Airport | 2024-11-21 | 2023-10-02 | German | German | Baccalaureate | 28 | 3 | 3 | 1002 |
| Peter Mcdowell | Norma Fisher | 2025-04-05 | 2024-03-13 | Slovene | Slovene | Master | 34 | 4 | 4 | 1003 |

Project leaders are the individuals responsible for steering conservation initiatives. The `employee_id` serves as the primary key, with entries like "Norma Fisher," "Tasha Rodriguez," "Theodore Mcgrath," and "Peter Mcdowell." The `full_name` field provides an additional name reference, which in some records diverges from the employee identifier—for instance, Norma Fisher's full name is listed as "Theodore Mcgrath," and Peter Mcdowell's as "Norma Fisher." This apparent cross-referencing reflects the interconnected nature of the dataset. The `contract_start_date` and `contract_end_date` define the employment window, while `primary_language` and `secondary_language` capture linguistic capabilities, with values including French, Italian, German, and Slovene. The `education_level` ranges from `Baccalaureate` to `Master`, and `years_experience` spans from 16 to 34 years. Each leader is associated with an `a_l_p_a_r_c_id`, a `project_id`, and a `management_unit_id`.

**Table `a_l_p_a_r_cs`**

| id | org_id | org_name | headquarters_city | headquarters_country | founding_year | website_url | total_members | project_id | project_leader_employee_id | management_unit_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | seasonal-headquar-83 | regional-headquar-42 | 43 | https://github.com/chiphuyen/lazynlp | 31 | 1 | Norma Fisher | 1000 |
| 2 | 1717 | Pilot Initiative A | regional-headquar-84 | legacy-headquar-43 | 48 | https://bugs.launchpad.net/ironic/+bug/1346406 | 77 | 2 | Tasha Rodriguez | 1001 |
| 3 | 69437 | Baseline Model | legacy-headquar-85 | compact-headquar-44 | 53 | http://en.wikipedia.org/wiki/Hyla_femoralis | 2 | 3 | Theodore Mcgrath | 1002 |
| 4 | m16 | Distributed Cluster | compact-headquar-86 | composite-headquar-45 | 58 | https://www.nature.com/articles/nphoton.2014.41 | 20 | 4 | Peter Mcdowell | 1003 |

ALPARC organizations serve as the overarching institutional framework. Each organization has an `id`, an `org_id` that may be numeric (such as `790471` or `1717`) or alphanumeric (such as `m16`), and an `org_name` that mirrors the protected area names—"Extended Review," "Pilot Initiative A," "Baseline Model," and "Distributed Cluster." The `headquarters_city` and `headquarters_country` fields use coded location identifiers like `seasonal-headquar-83` and `regional-headquar-42`. The `founding_year` is recorded as a two-digit number ranging from 43 to 58. A `website_url` provides an external reference, with entries pointing to domains such as GitHub, Launchpad, Wikipedia, and Nature. The `total_members` field captures organizational size, with values of 31, 77, 2, and 20. Each ALPARC organization is linked to a `project_id`, a `project_leader_employee_id`, and a `management_unit_id`.

**Table `events`**

| event_id | event_name | event_date | event_type | location | organizer | attendance_count | a_l_p_a_r_c_id | management_unit_id | project_leader_employee_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Seasonal Standard | 2025-04-15T15:21:00 | workshop | extended-location-99 | integrated-organize-28 | 42 | 1 | 1000 | Norma Fisher |
| 101 | Integrated Framework | 2022-09-26T22:38:00 | symposium | integrated-location-100 | seasonal-organize-29 | 1 | 2 | 1001 | Tasha Rodriguez |
| 102 | Extended Protocol D | 2023-02-10T05:55:00 | conference | seasonal-location-101 | regional-organize-30 | 5 | 3 | 1002 | Theodore Mcgrath |
| 103 | Pilot Programme | 2024-07-21T12:12:00 | meeting | regional-location-102 | legacy-organize-31 | 30 | 4 | 1003 | Peter Mcdowell |

Events are the operational gatherings that bring the network into action. Each event has an `event_id`, an `event_name` such as "Seasonal Standard" or "Integrated Framework," and an `event_date` with full timestamp precision. The `event_type` distinguishes between `workshop`, `symposium`, `conference`, and `meeting`. The `location` field uses coded location names like `extended-location-99` or `integrated-location-100`. The `organizer` field identifies the coordinating entity with codes such as `integrated-organize-28` or `seasonal-organize-29`. The `attendance_count` records participation, ranging from 1 to 42 attendees. Each event is associated with an `a_l_p_a_r_c_id`, a `management_unit_id`, and a `project_leader_employee_id`.

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

The relationship between projects and protected areas is captured through a dedicated association table. This structure allows a single protected area to participate in multiple projects and a single project to span multiple areas, reflecting the complex, overlapping nature of conservation work.

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

Similarly, the link between projects and management units is maintained in its own association table. This separation ensures that the many-to-many relationships between projects, areas, and units can be tracked independently, preserving data integrity while supporting flexible operational configurations.

### Cross-Referential Views

The views in this system synthesize the base tables into focused lenses that answer specific operational questions. Each view joins multiple tables to produce a unified record that tells a complete story about a particular relationship.

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

This view joins protected areas with their corresponding management units, answering the question: which administrative unit governs which protected area? A row from this view might show the protected area "Extended Review" (`IDE-2086`, a `national_park` in France with an area of 1.52 hectares) managed by the unit "Compact Series" (`39800614`), a public entity headquartered at `composite-headquar-63` and contacted by Christopher Wilson. The establishment dates align—both the protected area and its management unit were established on 2024-07-11—suggesting a coordinated launch.

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

This view connects protected areas to the projects that operate within them. It reveals, for example, that the protected area "Pilot Initiative A" (`IDE-2091`, a `nature_reserve` in Italy) is associated with the project "Legacy Corridor," which has a status of `active`, a budget of 37.54, and a primary objective of `ecological_networks`. The funding source for this project is `ALPARC`, indicating direct organizational support.

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

The inverse of the first view, this perspective starts from the management unit and surfaces the protected areas under its purview. A representative row might show the management unit "Legacy Assessment" (`611523`), a private entity with contact Charles Larsen, overseeing the protected area "Pilot Initiative A" (`IDE-2091`), which has a status of `inactive` and a zoning classification of `nature_reserve`.

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

This view links management units to their parent ALPARC organizations. It answers: which organization provides the institutional umbrella for a given management unit? A row could show the management unit "Regional Survey A" (`57dbb53c-8fcc-11eb-924d-9cd76263cbd0`), a `non_profit` entity with headquarters at `adaptive-headquar-65`, operating under the ALPARC organization "Baseline Model" (`org_id: 69437`), which was founded in year 53 and has 2 total members.

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

This view associates projects with their sponsoring ALPARC organizations. It clarifies the funding and governance chain. For instance, the project "Regional Series A" (status `completed`, budget 35.57, objective `sustainable_tourism`) is linked to the ALPARC organization "Baseline Model" (`org_id: 69437`), with a founding year of 53 and a website pointing to a Wikipedia article on *Hyla femoralis*.

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

This view provides a detailed snapshot of a project as it relates to a specific protected area. It combines project-level data (name, dates, budget, objective) with area-level data (identifier, name, area size, zoning, country). A row might show the project "Compact Survey" (funding source `Interreg`, objective `climate_change`, budget 43.48) operating within the protected area "Extended Review" (`IDE-2086`, a `national_park` in France covering 1.52 hectares).

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

This view pairs project information with management unit details. It answers: which management unit is responsible for the area where this project operates? A representative row could show the project "Seasonal Assessment" (status `cancelled`, budget 19.95, objective `fauna_monitoring`) linked to the management unit "Seasonal Corridor" (`account_pymes_1040`), a public entity with contact April Snyder.

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

This view connects projects to the people leading them. It surfaces the leader's name, experience, and education alongside the project's status and objective. For example, the project "Compact Survey" (status `planning`, objective `climate_change`) is led by Norma Fisher, who has 16 years of experience and a Baccalaureate education level.

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

This view links project leaders to their affiliated ALPARC organizations. It answers: which organization does this leader belong to? A row might show the leader Theodore Mcgrath (28 years of experience, German as both primary and secondary language, Baccalaureate education) affiliated with the ALPARC organization "Baseline Model" (`org_id: 69437`), which has 2 total members.

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

This view presents a leader-centric view of their projects. It surfaces the leader's details alongside the project they lead. For instance, the leader Tasha Rodriguez (22 years of experience, Master's degree, Italian as both primary and secondary language) leads the project "Legacy Corridor" (status `active`, budget 37.54, objective `ecological_networks`, funded by `ALPARC`).

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

This view associates project leaders with the management units they work within. It clarifies the administrative context of a leader's work. A row could show the leader Peter Mcdowell (34 years of experience, Master's degree, Slovene as both primary and secondary language) operating within the management unit "Seasonal Corridor" (`account_pymes_1040`), a public entity with contact April Snyder.

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

This view presents the ALPARC organization as the starting point, showing the projects it sponsors. It answers: which projects does this organization fund or govern? A representative row might show the ALPARC organization "Extended Review" (`org_id: 790471`, founded in year 43, with 31 members and a website on GitHub) sponsoring the project "Compact Survey" (status `planning`, budget 43.48, objective `climate_change`).

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

This view links ALPARC organizations to the project leaders they employ or sponsor. It surfaces the organizational hierarchy from the top down. For example, the ALPARC organization "Pilot Initiative A" (`org_id: 1717`, founded in year 48, with 77 members) is associated with the project leader Tasha Rodriguez (22 years of experience, Master's degree).

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

This view connects ALPARC organizations to the management units under their umbrella. It clarifies the administrative chain of command. A row might show the ALPARC organization "Baseline Model" (`org_id: 69437`, founded in year 53, with 2 members) overseeing the management unit "Regional Survey A" (`57dbb53c-8fcc-11eb-924d-9cd76263cbd0`), a `non_profit` entity with headquarters at `adaptive-headquar-65`.

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

This view links events to their affiliated ALPARC organizations. It answers: which organization is associated with this event? A representative row could show the event "Seasonal Standard" (a `workshop` held on 2025-04-15 at `extended-location-99` with 42 attendees) associated with the ALPARC organization "Extended Review" (`org_id: 790471`).

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

This view connects events to the management units that host or coordinate them. It clarifies the operational responsibility for each gathering. For instance, the event "Integrated Framework" (a `symposium` on 2022-09-26 at `integrated-location-100` with 1 attendee) is linked to the management unit "Legacy Assessment" (`611523`), a private entity with contact Charles Larsen.

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

This view associates events with the project leaders who organize or participate in them. It surfaces the human element of event coordination. A row might show the event "Extended Protocol D" (a `conference` on 2023-02-10 at `seasonal-location-101` with 5 attendees) organized by the leader Theodore Mcgrath (28 years of experience, Baccalaureate education).

### Synthesis

The data model presented here captures a multi-layered ecosystem of conservation governance. Protected areas are the geographic anchors, each classified, zoned, and situated within a specific country. Management units provide the administrative machinery, with distinct legal statuses and contact points. Projects translate policy into funded action, with clear objectives, budgets, and lifecycle stages. Project leaders bring expertise and experience to bear, their qualifications and linguistic capabilities reflecting the cross-border nature of the work. ALPARC organizations serve as the institutional scaffolding, linking areas, units, projects, and people into a coherent network. Events represent the operational pulse of the system, gathering participants and generating measurable outcomes. Together, these entities form a comprehensive record of who manages what, where, with what resources, and toward what ends—a living archive of European protected area governance.