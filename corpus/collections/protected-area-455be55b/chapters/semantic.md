The Alpine transalpine conservation ecosystem is a multi-layered domain in which protected areas, ecological corridors, regional jurisdictions, and cross-border collaborative projects intersect. Each layer carries its own identifiers, temporal metadata, and administrative attributes, and the relationships between layers are modelled as foreign keys and junction tables so that any domain fact can be reconstructed by a join. The following chapter walks through the entity types, their columns, the cardinality-bounded relationships that become foreign keys and junction tables, and the materialised views that reassemble the normalised data into domain-meaningful rows.

## Core entity types and their columns

The domain centres on seven base tables. The first, `protected_areas`, records individual conservation zones. Its primary key is `protected_area_id`. Each row carries an `identifier` (a short code such as `IDE-2086` or `IDE-2101`), a human-readable `name` like *Extended Review* or *Distributed Cluster*, an `area_hectares` measure (10.20 through 22.80 in the sample), an `established_date`, a `protection_level` enum (National Park, Nature Reserve, Landscape Protection Area, Biosphere Reserve), an `administering_entity` string (e.g. `primary-administ-22`), and a boolean `is_a_l_p_a_r_c_member` flag. Two foreign keys anchor each protected area to its geographic and ecological context: `alpine_region_id` points to `alpine_regions.id`, and `transalpine_ecological_network_id` points to `transalpine_ecological_networks.id`.

**Table `protected_areas`**

| protected_area_id | identifier | name | area_hectares | established_date | protection_level | administering_entity | is_a_l_p_a_r_c_member | alpine_region_id | transalpine_ecological_network_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | IDE-2086 | Extended Review | 10.20 | 2024-03-27 | National Park | primary-administ-22 | false | 1000 | 1 |
| 101 | IDE-2091 | Pilot Initiative A | 14.40 | 2025-08-11 | Nature Reserve | adaptive-administ-23 | true | 1001 | 2 |
| 102 | IDE-2096 | Baseline Model | 18.60 | 2022-01-22 | Landscape Protection Area | distributed-administ-24 | false | 1002 | 3 |
| 103 | IDE-2101 | Distributed Cluster | 22.80 | 2023-06-06 | Biosphere Reserve | baseline-administ-25 | true | 1003 | 4 |

The `alpine_regions` table defines the political-geographic slices of the Alpine arc. Its surrogate key is `id`, and each region is identified by a `region_code` (numeric or hex strings such as `1562837` and `8667ec1da10c4a0293d91388b49bc77c`), a `total_area_hectares` figure, a `member_states` string (France, Italy, Germany, Austria in the sample), and a `perimeter_definition_date`. A protected area belongs to exactly one alpine region, so the FK in `protected_areas` enforces a many-to-one cardinality.

**Table `alpine_regions`**

| id | region_code | total_area_hectares | member_states | perimeter_definition_date |
|---|---|---|---|---|
| 1000 | 1562837 | 16.95 | France | 2024-11-07 |
| 1001 | 6564391 | 20.90 | Italy | 2025-04-18 |
| 1002 | 778560 | 24.85 | Germany | 2022-09-02 |
| 1003 | 8667ec1da10c4a0293d91388b49bc77c | 28.80 | Austria | 2023-02-13 |

`transalpine_ecological_networks` captures cross-border habitat corridors. Its primary key is `id`, complemented by a `network_id` (UUIDs like `e6196808-8fd1-11eb-924d-9cd76263cbd0` or short integers such as `7441146`). The `name` column mirrors the protected-area naming convention (*Extended Review*, *Pilot Initiative A*, *Baseline Model*, *Distributed Cluster*). Temporal and operational metadata include `established_date`, `total_corridor_length_km` (fractions of a kilometre, e.g. 0.5291620600000001), a `status` enum (Planned, Active, Evaluated, Decommissioned), a `coordinating_entity` string, and an `a_l_p_a_r_c_organization_id` foreign key linking the network to an ALPARC organisation.

**Table `transalpine_ecological_networks`**

| id | network_id | name | established_date | total_corridor_length_km | status | coordinating_entity | a_l_p_a_r_c_organization_id |
|---|---|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Extended Review | 2024-03-27 | 0.5291620600000001 | Planned | regional-coordina-42 | Shell Oil |
| 2 | 7441146 | Pilot Initiative A | 2025-08-11 | 1.37 | Active | legacy-coordina-43 | GlobalPlatform Inc. |
| 3 | 8387535 | Baseline Model | 2022-01-22 | 0.6 | Evaluated | compact-coordina-44 | Whatsapp Inc. |
| 4 | 6589 | Distributed Cluster | 2023-06-06 | 0.4827489 | Decommissioned | composite-coordina-45 | American Institutes for Research |

The `a_l_p_a_r_cs` table is the organisational hub. Its primary key is `organization_id` (text identifiers such as `Shell Oil`, `GlobalPlatform Inc.`, `Whatsapp Inc.`, `American Institutes for Research`). Columns include `name`, `founded_date`, `headquarters_city`, `headquarters_country`, `total_member_areas` (3, 9, 14, 6), `coverage_percentage` (2.45 through 9.80), a `transalpine_ecological_network_id` FK, a `project_code` FK to `joint_european_projects`, a `project_leader_id` FK to `project_leaders`, a `professional_event_id` FK to `professional_events`, and audit timestamps `created_at` and `updated_at`. The presence of FKs to projects, leaders, and events means each ALPARC organisation is directly associated with one European project, one project leader, and one professional event in this model.

**Table `a_l_p_a_r_cs`**

| organization_id | name | founded_date | headquarters_city | headquarters_country | total_member_areas | coverage_percentage | transalpine_ecological_network_id | project_code | project_leader_id | professional_event_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Shell Oil | Extended Review | 2024-03-15 | seasonal-headquar-83 | regional-headquar-42 | 3 | 2.45 | 1 | IVC20det15 | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| GlobalPlatform Inc. | Pilot Initiative A | 2025-08-26 | regional-headquar-84 | legacy-headquar-43 | 9 | 4.90 | 2 | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| Whatsapp Inc. | Baseline Model | 2022-01-10 | legacy-headquar-85 | compact-headquar-44 | 14 | 7.35 | 3 | 324 | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| American Institutes for Research | Distributed Cluster | 2023-06-21 | compact-headquar-86 | composite-headquar-45 | 6 | 9.80 | 4 | template_ivacode_pagata_20det50 | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

`joint_european_projects` stores the cross-border funding instruments. Its primary key is `project_code` (text, e.g. `IVC20det15`, `8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3`, `324`, `template_ivacode_pagata_20det50`). Columns include `title` (*Compact Initiative*, *Legacy Model*, *Regional Cluster A*, *Seasonal Review*), `start_date` and `end_date` (ISO 8601 timestamps), `funding_source` (baseline-funding-73, pilot-funding-74, extended-funding-75, integrated-funding-76), `budget_euros` (11.11 through 43.25), `status` (Proposed, Active, Completed, Suspended), `deliverable_count` (1 through 75), and two FKs: `a_l_p_a_r_c_organization_id` and `project_leader_id`.

**Table `joint_european_projects`**

| project_code | title | start_date | end_date | funding_source | budget_euros | status | deliverable_count | a_l_p_a_r_c_organization_id | project_leader_id |
|---|---|---|---|---|---|---|---|---|---|
| IVC20det15 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | baseline-funding-73 | 11.11 | Proposed | 1 | Shell Oil | 1000 |
| 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | pilot-funding-74 | 19.72 | Active | 38 | GlobalPlatform Inc. | 1001 |
| 324 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | extended-funding-75 | 43.25 | Completed | 27 | Whatsapp Inc. | 1002 |
| template_ivacode_pagata_20det50 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | integrated-funding-76 | 17.12 | Suspended | 75 | American Institutes for Research | 1003 |

`project_leaders` records the individuals managing the projects. Its primary key is `id` (1000–1003). The `employee_id` column holds the person's name as a string (Norma Fisher, Tasha Rodriguez, Theodore Mcgrath, Peter Mcdowell), while `full_name` stores another name string (Theodore Mcgrath, Account Name, Saipan International Airport, Norma Fisher). Contractual metadata includes `contract_start_date`, `contract_end_date`, `weekly_hours` (43–67), `primary_language` (French, Italian, German, Slovene), `secondary_language`, a boolean `has_driving_license`, and `years_experience` (16–34). The FK `a_l_p_a_r_c_organization_id` ties each leader to their organisation.

**Table `project_leaders`**

| id | employee_id | full_name | contract_start_date | contract_end_date | weekly_hours | primary_language | secondary_language | has_driving_license | years_experience | a_l_p_a_r_c_organization_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Norma Fisher | Theodore Mcgrath | 2022-01-26 | 2025-12-07 | 43 | French | pilot-secondar-32 | false | 16 | Shell Oil |
| 1001 | Tasha Rodriguez | Account Name | 2023-06-10 | 2022-05-18 | 51 | Italian | extended-secondar-33 | true | 22 | GlobalPlatform Inc. |
| 1002 | Theodore Mcgrath | Saipan International Airport | 2024-11-21 | 2023-10-02 | 59 | German | integrated-secondar-34 | false | 28 | Whatsapp Inc. |
| 1003 | Peter Mcdowell | Norma Fisher | 2025-04-05 | 2024-03-13 | 67 | Slovene | seasonal-secondar-35 | true | 34 | American Institutes for Research |

`professional_events` is the seventh base table. Its structure mirrors the other entities with an `id` primary key, a `name`, a `date`, a `location`, a `category`, and an `a_l_p_a_r_c_organization_id` FK.

**Table `professional_events`**

| id | event_id | title | event_type | start_date | end_date | location_city | location_country | participant_count | status | topic | a_l_p_a_r_c_organization_id | project_code | project_leader_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | Compact Initiative | Conference | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | seasonal-location-23 | adaptive-location-47 | 100 | Planned | distributed-topic-60 | Shell Oil | IVC20det15 | 1000 |
| 2 | 168535 | Legacy Model | Workshop | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | regional-location-24 | distributed-location-48 | 27 | Ongoing | baseline-topic-61 | GlobalPlatform Inc. | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | 1001 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Regional Cluster A | Symposium | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | legacy-location-25 | baseline-location-49 | 23 | Completed | pilot-topic-62 | Whatsapp Inc. | 324 | 1002 |
| 4 | 1186089 | Seasonal Review | Meeting | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | compact-location-26 | pilot-location-50 | 34 | Cancelled | extended-topic-63 | American Institutes for Research | template_ivacode_pagata_20det50 | 1003 |

## Junction tables and many-to-many relationships

Three junction tables resolve many-to-many relationships between protected areas and the higher-level spatial or project entities. `regions_areas` links `protected_areas.protected_area_id` to `alpine_regions.id`, allowing a protected area to be associated with multiple alpine regions and vice versa. `networks_areas` links `protected_areas.protected_area_id` to `transalpine_ecological_networks.id`, enabling the same many-to-many pattern for ecological networks. `projects_areas` links `protected_areas.protected_area_id` to `joint_european_projects.project_code`, connecting conservation zones to the European projects that fund or govern them.

**Table `regions_areas`**

| alpine_region_id | protected_area_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

**Table `networks_areas`**

| transalpine_ecological_network_id | protected_area_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `projects_areas`**

| project_code | protected_area_id |
|---|---|
| IVC20det15 | 100 |
| IVC20det15 | 101 |
| 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | 101 |
| 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | 102 |
| 324 | 102 |
| 324 | 103 |
| template_ivacode_pagata_20det50 | 103 |
| template_ivacode_pagata_20det50 | 100 |

A fourth junction table, `leaders_projects`, connects `project_leaders.id` to `joint_european_projects.project_code`, allowing a project leader to manage multiple projects and a project to have multiple leaders.

**Table `leaders_projects`**

| project_leader_id | project_code |
|---|---|
| 1000 | IVC20det15 |
| 1000 | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1001 | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1001 | 324 |
| 1002 | 324 |
| 1002 | template_ivacode_pagata_20det50 |
| 1003 | template_ivacode_pagata_20det50 |
| 1003 | IVC20det15 |

## Materialised views: reconstructing domain facts

The materialised views reassemble the normalised tables into rows that answer specific domain questions. Each view is a pre-joined SELECT that can be queried directly.

### `protected_area_alpine_region_view`

This view joins `protected_areas` to `alpine_regions` on `alpine_region_id = id`, producing one row per protected area enriched with its regional context. A row such as `IDE-2086 / Extended Review / 10.20 ha / France / 1562837` tells us which member state administers the perimeter that contains the area.

**View `protected_area_alpine_region_view`**

```sql
CREATE VIEW protected_area_alpine_region_view AS
SELECT a.protected_area_id, a.identifier, a.name, a.area_hectares, b.id AS region_id, b.region_code AS region_region_code, b.total_area_hectares AS region_total_area_hectares
FROM protected_areas a JOIN alpine_regions b ON a.alpine_region_id = b.id;
```

| protected_area_id | identifier | name | area_hectares | region_id | region_region_code | region_total_area_hectares |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | Extended Review | 10.20 | 1000 | 1562837 | 16.95 |
| 101 | IDE-2091 | Pilot Initiative A | 14.40 | 1001 | 6564391 | 20.90 |
| 102 | IDE-2096 | Baseline Model | 18.60 | 1002 | 778560 | 24.85 |
| 103 | IDE-2101 | Distributed Cluster | 22.80 | 1003 | 8667ec1da10c4a0293d91388b49bc77c | 28.80 |

### `protected_area_transalpine_ecological_network_view`

By joining `protected_areas` to `transalpine_ecological_networks` on `transalpine_ecological_network_id = id`, this view answers which ecological corridor a protected area belongs to. The row `IDE-2091 / Pilot Initiative A / Active / 1.37 km / GlobalPlatform Inc.` reveals both the corridor's operational status and its coordinating ALPARC organisation.

**View `protected_area_transalpine_ecological_network_view`**

```sql
CREATE VIEW protected_area_transalpine_ecological_network_view AS
SELECT a.protected_area_id, a.identifier, a.name, a.area_hectares, b.id AS network_id, b.network_id AS network_network_id, b.name AS network_name
FROM protected_areas a JOIN transalpine_ecological_networks b ON a.transalpine_ecological_network_id = b.id;
```

| protected_area_id | identifier | name | area_hectares | network_id | network_network_id | network_name |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | Extended Review | 10.20 | 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Extended Review |
| 101 | IDE-2091 | Pilot Initiative A | 14.40 | 2 | 7441146 | Pilot Initiative A |
| 102 | IDE-2096 | Baseline Model | 18.60 | 3 | 8387535 | Baseline Model |
| 103 | IDE-2101 | Distributed Cluster | 22.80 | 4 | 6589 | Distributed Cluster |

### `alpine_region_protected_area_detail_view`

This view reverses the perspective: it starts from `alpine_regions` and joins to `protected_areas`, so each row represents a region with its constituent protected areas. A row like `1562837 / France / Extended Review / 10.20 / National Park` lets a regional administrator see which zones fall under their jurisdiction and their protection classifications.

**View `alpine_region_protected_area_detail_view`**

```sql
CREATE VIEW alpine_region_protected_area_detail_view AS
SELECT a.id, a.region_code, a.total_area_hectares, b.protected_area_id AS area_protected_area_id, b.identifier AS area_identifier, b.name AS area_name
FROM alpine_regions a
  JOIN regions_areas j ON j.alpine_region_id = a.id
  JOIN protected_areas b ON b.protected_area_id = j.protected_area_id;
```

| id | region_code | total_area_hectares | area_protected_area_id | area_identifier | area_name |
|---|---|---|---|---|---|
| 1000 | 1562837 | 16.95 | 100 | IDE-2086 | Extended Review |
| 1000 | 1562837 | 16.95 | 101 | IDE-2091 | Pilot Initiative A |
| 1001 | 6564391 | 20.90 | 101 | IDE-2091 | Pilot Initiative A |
| 1001 | 6564391 | 20.90 | 102 | IDE-2096 | Baseline Model |
| 1002 | 778560 | 24.85 | 102 | IDE-2096 | Baseline Model |
| 1002 | 778560 | 24.85 | 103 | IDE-2101 | Distributed Cluster |
| 1003 | 8667ec1da10c4a0293d91388b49bc77c | 28.80 | 103 | IDE-2101 | Distributed Cluster |
| 1003 | 8667ec1da10c4a0293d91388b49bc77c | 28.80 | 100 | IDE-2086 | Extended Review |

### `transalpine_ecological_network_protected_area_detail_view`

Analogous to the previous view but from the ecological-network perspective, this join connects `transalpine_ecological_networks` to `protected_areas`. The row `e6196808-8fd1-11eb-924d-9cd76263cbd0 / Extended Review / Planned / 0.5291620600000001 / IDE-2086` shows a corridor's length, status, and the protected areas it encompasses.

**View `transalpine_ecological_network_protected_area_detail_view`**

```sql
CREATE VIEW transalpine_ecological_network_protected_area_detail_view AS
SELECT a.id, a.network_id, a.name, b.protected_area_id AS area_protected_area_id, b.identifier AS area_identifier, b.name AS area_name
FROM transalpine_ecological_networks a
  JOIN networks_areas j ON j.transalpine_ecological_network_id = a.id
  JOIN protected_areas b ON b.protected_area_id = j.protected_area_id;
```

| id | network_id | name | area_protected_area_id | area_identifier | area_name |
|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Extended Review | 100 | IDE-2086 | Extended Review |
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Extended Review | 101 | IDE-2091 | Pilot Initiative A |
| 2 | 7441146 | Pilot Initiative A | 101 | IDE-2091 | Pilot Initiative A |
| 2 | 7441146 | Pilot Initiative A | 102 | IDE-2096 | Baseline Model |
| 3 | 8387535 | Baseline Model | 102 | IDE-2096 | Baseline Model |
| 3 | 8387535 | Baseline Model | 103 | IDE-2101 | Distributed Cluster |
| 4 | 6589 | Distributed Cluster | 103 | IDE-2101 | Distributed Cluster |
| 4 | 6589 | Distributed Cluster | 100 | IDE-2086 | Extended Review |

### `transalpine_ecological_network_a_l_p_a_r_c_view`

This view joins `transalpine_ecological_networks` to `a_l_p_a_r_cs` on `a_l_p_a_r_c_organization_id = organization_id`, revealing which ALPARC organisation coordinates each network. The row `Extended Review / Shell Oil / 2.45% / 3 member areas` tells us the coordinating body, its coverage percentage, and how many protected areas it represents.

**View `transalpine_ecological_network_a_l_p_a_r_c_view`**

```sql
CREATE VIEW transalpine_ecological_network_a_l_p_a_r_c_view AS
SELECT a.id, a.network_id, a.name, a.established_date, b.organization_id AS c_organization_id, b.name AS c_name, b.founded_date AS c_founded_date
FROM transalpine_ecological_networks a JOIN a_l_p_a_r_cs b ON a.a_l_p_a_r_c_organization_id = b.organization_id;
```

| id | network_id | name | established_date | c_organization_id | c_name | c_founded_date |
|---|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Extended Review | 2024-03-27 | Shell Oil | Extended Review | 2024-03-15 |
| 2 | 7441146 | Pilot Initiative A | 2025-08-11 | GlobalPlatform Inc. | Pilot Initiative A | 2025-08-26 |
| 3 | 8387535 | Baseline Model | 2022-01-22 | Whatsapp Inc. | Baseline Model | 2022-01-10 |
| 4 | 6589 | Distributed Cluster | 2023-06-06 | American Institutes for Research | Distributed Cluster | 2023-06-21 |

### `a_l_p_a_r_c_transalpine_ecological_network_view`

The inverse of the previous view: it starts from `a_l_p_a_r_cs` and joins to `transalpine_ecological_networks`. A row such as `Shell Oil / Extended Review / Regional Cluster A / IVC20det15` shows an organisation's network, its associated project, and the project code.

**View `a_l_p_a_r_c_transalpine_ecological_network_view`**

```sql
CREATE VIEW a_l_p_a_r_c_transalpine_ecological_network_view AS
SELECT a.organization_id, a.name, a.founded_date, a.headquarters_city, b.id AS network_id, b.network_id AS network_network_id, b.name AS network_name
FROM a_l_p_a_r_cs a JOIN transalpine_ecological_networks b ON a.transalpine_ecological_network_id = b.id;
```

| organization_id | name | founded_date | headquarters_city | network_id | network_network_id | network_name |
|---|---|---|---|---|---|---|
| Shell Oil | Extended Review | 2024-03-15 | seasonal-headquar-83 | 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Extended Review |
| GlobalPlatform Inc. | Pilot Initiative A | 2025-08-26 | regional-headquar-84 | 2 | 7441146 | Pilot Initiative A |
| Whatsapp Inc. | Baseline Model | 2022-01-10 | legacy-headquar-85 | 3 | 8387535 | Baseline Model |
| American Institutes for Research | Distributed Cluster | 2023-06-21 | compact-headquar-86 | 4 | 6589 | Distributed Cluster |

### `a_l_p_a_r_c_joint_european_project_view`

Joining `a_l_p_a_r_cs` to `joint_european_projects` on `project_code`, this view answers which European project an ALPARC organisation is linked to. The row `Shell Oil / Compact Initiative / 11.11 / Proposed / baseline-funding-73` reveals the project title, budget, status, and funding source.

**View `a_l_p_a_r_c_joint_european_project_view`**

```sql
CREATE VIEW a_l_p_a_r_c_joint_european_project_view AS
SELECT a.organization_id, a.name, a.founded_date, a.headquarters_city, b.project_code AS project_project_code, b.title AS project_title, b.start_date AS project_start_date
FROM a_l_p_a_r_cs a JOIN joint_european_projects b ON a.project_code = b.project_code;
```

| organization_id | name | founded_date | headquarters_city | project_project_code | project_title | project_start_date |
|---|---|---|---|---|---|---|
| Shell Oil | Extended Review | 2024-03-15 | seasonal-headquar-83 | IVC20det15 | Compact Initiative | 2022-09-05T20:24:00 |
| GlobalPlatform Inc. | Pilot Initiative A | 2025-08-26 | regional-headquar-84 | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model | 2023-02-16T03:41:00 |
| Whatsapp Inc. | Baseline Model | 2022-01-10 | legacy-headquar-85 | 324 | Regional Cluster A | 2024-07-27T10:58:00 |
| American Institutes for Research | Distributed Cluster | 2023-06-21 | compact-headquar-86 | template_ivacode_pagata_20det50 | Seasonal Review | 2025-12-11T17:15:00 |

### `a_l_p_a_r_c_project_leader_view`

This view joins `a_l_p_a_r_cs` to `project_leaders` on `project_leader_id = id`. A row like `Shell Oil / Norma Fisher / French / 16 years / 43 hours` tells us the leader assigned to the organisation, their primary language, experience level, and weekly commitment.

**View `a_l_p_a_r_c_project_leader_view`**

```sql
CREATE VIEW a_l_p_a_r_c_project_leader_view AS
SELECT a.organization_id, a.name, a.founded_date, a.headquarters_city, b.id AS leader_id, b.employee_id AS leader_employee_id, b.full_name AS leader_full_name
FROM a_l_p_a_r_cs a JOIN project_leaders b ON a.project_leader_id = b.id;
```

| organization_id | name | founded_date | headquarters_city | leader_id | leader_employee_id | leader_full_name |
|---|---|---|---|---|---|---|
| Shell Oil | Extended Review | 2024-03-15 | seasonal-headquar-83 | 1000 | Norma Fisher | Theodore Mcgrath |
| GlobalPlatform Inc. | Pilot Initiative A | 2025-08-26 | regional-headquar-84 | 1001 | Tasha Rodriguez | Account Name |
| Whatsapp Inc. | Baseline Model | 2022-01-10 | legacy-headquar-85 | 1002 | Theodore Mcgrath | Saipan International Airport |
| American Institutes for Research | Distributed Cluster | 2023-06-21 | compact-headquar-86 | 1003 | Peter Mcdowell | Norma Fisher |

### `a_l_p_a_r_c_professional_event_view`

Joining `a_l_p_a_r_cs` to `professional_events` on `professional_event_id`, this view surfaces the professional event associated with each ALPARC organisation. The row `Shell Oil / Professional Event 1 / 2025-01-15 / Geneva / Conservation Summit` shows the event name, date, location, and category.

**View `a_l_p_a_r_c_professional_event_view`**

```sql
CREATE VIEW a_l_p_a_r_c_professional_event_view AS
SELECT a.organization_id, a.name, a.founded_date, a.headquarters_city, b.id AS event_id, b.event_id AS event_event_id, b.title AS event_title
FROM a_l_p_a_r_cs a JOIN professional_events b ON a.professional_event_id = b.id;
```

| organization_id | name | founded_date | headquarters_city | event_id | event_event_id | event_title |
|---|---|---|---|---|---|---|
| Shell Oil | Extended Review | 2024-03-15 | seasonal-headquar-83 | 1 | 2002007020060 | Compact Initiative |
| GlobalPlatform Inc. | Pilot Initiative A | 2025-08-26 | regional-headquar-84 | 2 | 168535 | Legacy Model |
| Whatsapp Inc. | Baseline Model | 2022-01-10 | legacy-headquar-85 | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Regional Cluster A |
| American Institutes for Research | Distributed Cluster | 2023-06-21 | compact-headquar-86 | 4 | 1186089 | Seasonal Review |

### `joint_european_project_protected_area_detail_view`

This view joins `joint_european_projects` to `protected_areas` through the `projects_areas` junction table, answering which protected areas are connected to a given European project. A row such as `IVC20det15 / Compact Initiative / IDE-2086 / Extended Review / 10.20 ha` links the project to its associated conservation zone.

**View `joint_european_project_protected_area_detail_view`**

```sql
CREATE VIEW joint_european_project_protected_area_detail_view AS
SELECT a.project_code, a.title, a.start_date, b.protected_area_id AS area_protected_area_id, b.identifier AS area_identifier, b.name AS area_name
FROM joint_european_projects a
  JOIN projects_areas j ON j.project_code = a.project_code
  JOIN protected_areas b ON b.protected_area_id = j.protected_area_id;
```

| project_code | title | start_date | area_protected_area_id | area_identifier | area_name |
|---|---|---|---|---|---|
| IVC20det15 | Compact Initiative | 2022-09-05T20:24:00 | 100 | IDE-2086 | Extended Review |
| IVC20det15 | Compact Initiative | 2022-09-05T20:24:00 | 101 | IDE-2091 | Pilot Initiative A |
| 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model | 2023-02-16T03:41:00 | 101 | IDE-2091 | Pilot Initiative A |
| 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model | 2023-02-16T03:41:00 | 102 | IDE-2096 | Baseline Model |
| 324 | Regional Cluster A | 2024-07-27T10:58:00 | 102 | IDE-2096 | Baseline Model |
| 324 | Regional Cluster A | 2024-07-27T10:58:00 | 103 | IDE-2101 | Distributed Cluster |
| template_ivacode_pagata_20det50 | Seasonal Review | 2025-12-11T17:15:00 | 103 | IDE-2101 | Distributed Cluster |
| template_ivacode_pagata_20det50 | Seasonal Review | 2025-12-11T17:15:00 | 100 | IDE-2086 | Extended Review |

### `joint_european_project_a_l_p_a_r_c_view`

Joining `joint_european_projects` to `a_l_p_a_r_cs` on `a_l_p_a_r_c_organization_id`, this view shows which ALPARC organisation is responsible for each project. The row `Compact Initiative / Shell Oil / 2.45% / 3 member areas` connects the project to its coordinating body and coverage metrics.

**View `joint_european_project_a_l_p_a_r_c_view`**

```sql
CREATE VIEW joint_european_project_a_l_p_a_r_c_view AS
SELECT a.project_code, a.title, a.start_date, a.end_date, b.organization_id AS c_organization_id, b.name AS c_name, b.founded_date AS c_founded_date
FROM joint_european_projects a JOIN a_l_p_a_r_cs b ON a.a_l_p_a_r_c_organization_id = b.organization_id;
```

| project_code | title | start_date | end_date | c_organization_id | c_name | c_founded_date |
|---|---|---|---|---|---|---|
| IVC20det15 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | Shell Oil | Extended Review | 2024-03-15 |
| 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | GlobalPlatform Inc. | Pilot Initiative A | 2025-08-26 |
| 324 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | Whatsapp Inc. | Baseline Model | 2022-01-10 |
| template_ivacode_pagata_20det50 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | American Institutes for Research | Distributed Cluster | 2023-06-21 |

### `joint_european_project_project_leader_view`

This view joins `joint_european_projects` to `project_leaders` on `project_leader_id`, revealing the leader assigned to each project. A row like `Compact Initiative / Norma Fisher / French / 16 years` tells us who manages the project and their qualifications.

**View `joint_european_project_project_leader_view`**

```sql
CREATE VIEW joint_european_project_project_leader_view AS
SELECT a.project_code, a.title, a.start_date, a.end_date, b.id AS leader_id, b.employee_id AS leader_employee_id, b.full_name AS leader_full_name
FROM joint_european_projects a JOIN project_leaders b ON a.project_leader_id = b.id;
```

| project_code | title | start_date | end_date | leader_id | leader_employee_id | leader_full_name |
|---|---|---|---|---|---|---|
| IVC20det15 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | Norma Fisher | Theodore Mcgrath |
| 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | Tasha Rodriguez | Account Name |
| 324 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | Theodore Mcgrath | Saipan International Airport |
| template_ivacode_pagata_20det50 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | Peter Mcdowell | Norma Fisher |

### `project_leader_joint_european_project_detail_view`

Reversing the previous perspective, this view starts from `project_leaders` and joins to `joint_european_projects`. The row `Norma Fisher / Compact Initiative / 11.11 / Proposed / 2022-09-05` shows a leader's project assignment, budget, status, and start date.

**View `project_leader_joint_european_project_detail_view`**

```sql
CREATE VIEW project_leader_joint_european_project_detail_view AS
SELECT a.id, a.employee_id, a.full_name, b.project_code AS project_project_code, b.title AS project_title, b.start_date AS project_start_date
FROM project_leaders a
  JOIN leaders_projects j ON j.project_leader_id = a.id
  JOIN joint_european_projects b ON b.project_code = j.project_code;
```

| id | employee_id | full_name | project_project_code | project_title | project_start_date |
|---|---|---|---|---|---|
| 1000 | Norma Fisher | Theodore Mcgrath | IVC20det15 | Compact Initiative | 2022-09-05T20:24:00 |
| 1000 | Norma Fisher | Theodore Mcgrath | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model | 2023-02-16T03:41:00 |
| 1001 | Tasha Rodriguez | Account Name | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model | 2023-02-16T03:41:00 |
| 1001 | Tasha Rodriguez | Account Name | 324 | Regional Cluster A | 2024-07-27T10:58:00 |
| 1002 | Theodore Mcgrath | Saipan International Airport | 324 | Regional Cluster A | 2024-07-27T10:58:00 |
| 1002 | Theodore Mcgrath | Saipan International Airport | template_ivacode_pagata_20det50 | Seasonal Review | 2025-12-11T17:15:00 |
| 1003 | Peter Mcdowell | Norma Fisher | template_ivacode_pagata_20det50 | Seasonal Review | 2025-12-11T17:15:00 |
| 1003 | Peter Mcdowell | Norma Fisher | IVC20det15 | Compact Initiative | 2022-09-05T20:24:00 |

### `project_leader_a_l_p_a_r_c_view`

Joining `project_leaders` to `a_l_p_a_r_cs` on `a_l_p_a_r_c_organization_id`, this view surfaces the organisation each leader is associated with. The row `Norma Fisher / Shell Oil / 2.45% / 3 member areas` connects the person to their organisational context.

**View `project_leader_a_l_p_a_r_c_view`**

```sql
CREATE VIEW project_leader_a_l_p_a_r_c_view AS
SELECT a.id, a.employee_id, a.full_name, a.contract_start_date, b.organization_id AS c_organization_id, b.name AS c_name, b.founded_date AS c_founded_date
FROM project_leaders a JOIN a_l_p_a_r_cs b ON a.a_l_p_a_r_c_organization_id = b.organization_id;
```

| id | employee_id | full_name | contract_start_date | c_organization_id | c_name | c_founded_date |
|---|---|---|---|---|---|---|
| 1000 | Norma Fisher | Theodore Mcgrath | 2022-01-26 | Shell Oil | Extended Review | 2024-03-15 |
| 1001 | Tasha Rodriguez | Account Name | 2023-06-10 | GlobalPlatform Inc. | Pilot Initiative A | 2025-08-26 |
| 1002 | Theodore Mcgrath | Saipan International Airport | 2024-11-21 | Whatsapp Inc. | Baseline Model | 2022-01-10 |
| 1003 | Peter Mcdowell | Norma Fisher | 2025-04-05 | American Institutes for Research | Distributed Cluster | 2023-06-21 |

### `professional_event_a_l_p_a_r_c_view`

This view joins `professional_events` to `a_l_p_a_r_cs` on `a_l_p_a_r_c_organization_id`, showing which organisation is linked to each event. A row such as `Professional Event 1 / Shell Oil / 2.45% / 3 member areas` ties the event to its coordinating body.

**View `professional_event_a_l_p_a_r_c_view`**

```sql
CREATE VIEW professional_event_a_l_p_a_r_c_view AS
SELECT a.id, a.event_id, a.title, a.event_type, b.organization_id AS c_organization_id, b.name AS c_name, b.founded_date AS c_founded_date
FROM professional_events a JOIN a_l_p_a_r_cs b ON a.a_l_p_a_r_c_organization_id = b.organization_id;
```

| id | event_id | title | event_type | c_organization_id | c_name | c_founded_date |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | Compact Initiative | Conference | Shell Oil | Extended Review | 2024-03-15 |
| 2 | 168535 | Legacy Model | Workshop | GlobalPlatform Inc. | Pilot Initiative A | 2025-08-26 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Regional Cluster A | Symposium | Whatsapp Inc. | Baseline Model | 2022-01-10 |
| 4 | 1186089 | Seasonal Review | Meeting | American Institutes for Research | Distributed Cluster | 2023-06-21 |

### `professional_event_joint_european_project_view`

Joining `professional_events` to `joint_european_projects` through `a_l_p_a_r_cs`, this view connects events to the European projects they relate to. The row `Professional Event 1 / Compact Initiative / 11.11 / Proposed` shows the event's associated project and its budget and status.

**View `professional_event_joint_european_project_view`**

```sql
CREATE VIEW professional_event_joint_european_project_view AS
SELECT a.id, a.event_id, a.title, a.event_type, b.project_code AS project_project_code, b.title AS project_title, b.start_date AS project_start_date
FROM professional_events a JOIN joint_european_projects b ON a.project_code = b.project_code;
```

| id | event_id | title | event_type | project_project_code | project_title | project_start_date |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | Compact Initiative | Conference | IVC20det15 | Compact Initiative | 2022-09-05T20:24:00 |
| 2 | 168535 | Legacy Model | Workshop | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model | 2023-02-16T03:41:00 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Regional Cluster A | Symposium | 324 | Regional Cluster A | 2024-07-27T10:58:00 |
| 4 | 1186089 | Seasonal Review | Meeting | template_ivacode_pagata_20det50 | Seasonal Review | 2025-12-11T17:15:00 |

### `professional_event_project_leader_view`

This view joins `professional_events` to `project_leaders` through `a_l_p_a_r_cs`, revealing which leaders are associated with each professional event. A row like `Professional Event 1 / Norma Fisher / French / 16 years` connects the event to the leader's profile.

**View `professional_event_project_leader_view`**

```sql
CREATE VIEW professional_event_project_leader_view AS
SELECT a.id, a.event_id, a.title, a.event_type, b.id AS leader_id, b.employee_id AS leader_employee_id, b.full_name AS leader_full_name
FROM professional_events a JOIN project_leaders b ON a.project_leader_id = b.id;
```

| id | event_id | title | event_type | leader_id | leader_employee_id | leader_full_name |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | Compact Initiative | Conference | 1000 | Norma Fisher | Theodore Mcgrath |
| 2 | 168535 | Legacy Model | Workshop | 1001 | Tasha Rodriguez | Account Name |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Regional Cluster A | Symposium | 1002 | Theodore Mcgrath | Saipan International Airport |
| 4 | 1186089 | Seasonal Review | Meeting | 1003 | Peter Mcdowell | Norma Fisher |

## Closing synthesis

The relational schema models the Alpine transalpine conservation domain as a set of seven core entity tables linked by foreign keys and four junction tables that resolve many-to-many relationships. Protected areas sit at the centre, connected to alpine regions and ecological networks through direct FK columns, and to European projects through the `projects_areas` junction. ALPARC organisations serve as the organisational nexus, each linked to one ecological network, one European project, one project leader, and one professional event. The twenty materialised views reassemble these normalised tables into domain-meaningful rows, each answering a specific question about the relationships between protected areas, regions, networks, projects, leaders, and events. The design ensures that any fact — from the perimeter of a region containing a protected area to the budget of a project managed by a specific leader — can be retrieved through a single view query without manual join logic.