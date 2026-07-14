## Domain Overview: Microenterprise Project Tracking and Practice Adoption

The operational landscape of regional development programs relies on precise tracking of microenterprises, their engagement with structured project activities, and the adoption of resource-efficient practices. This chapter documents the data architecture that supports such tracking, describing how individual enterprises are linked to activities and practices, and how joined views synthesize these relationships for operational reporting. The domain centers on four core entities: microenterprises themselves, the resource-efficient and climate-resilient (R-E-C-P) practices they adopt, the project activities that organize field-level work, and the associative records that bind activities to enterprises.

**Table `microenterprises`**

| microenterprise_id | identifier | legal_name | cluster_location | sector_type | registration_date | is_demonstration_site | project_activity_id | r_e_c_p_practice_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Adaptive Model | composite-cluster-39 | integrated-sector-40 | 2023-06-19 | true | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | IDE-2091 | Primary Cluster | primary-cluster-40 | seasonal-sector-41 | 2024-11-03 | false | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | IDE-2096 | Composite Review D | adaptive-cluster-41 | regional-sector-42 | 2025-04-14 | true | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | IDE-2101 | Compact Initiative | distributed-cluster-42 | legacy-sector-43 | 2022-09-25 | false | 4 | 4 | 2025-04-16 09:14:00 |

The `microenterprises` table serves as the primary registry of participating organizations. Each row identifies a distinct microenterprise through a composite key (`microenterprise_id`) and a human-readable `identifier` such as `IDE-2086` or `IDE-2101`. The `legal_name` column carries the enterprise's registered name—Adaptive Model, Primary Cluster, Composite Review D, and Compact Initiative in the current dataset. Geographic and sectoral context is captured via `cluster_location` (e.g., `composite-cluster-39`, `distributed-cluster-42`) and `sector_type` (e.g., `integrated-sector-40`, `legacy-sector-43`). Registration dates span from 2022 through 2025, and the boolean flag `is_demonstration_site` distinguishes pilot locations from standard participants. Two foreign keys, `project_activity_id` and `r_e_c_p_practice_id`, anchor each enterprise to its assigned activity and practice, respectively. The `created_at` timestamp records when the registry entry was established.

**Table `r_e_c_p_practices`**

| id | practice_code | practice_name | category | resource_efficiency_gain | climate_resilience_score | adoption_status | microenterprise_id |
|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20ind | Seasonal Survey | compact-category-92 | 19.20 | 8 | potential | 1 |
| 2 | 8350036 | Integrated Corridor | composite-category-93 | 21.40 | 11 | selected | 2 |
| 3 | 17181811 | Extended Series D | primary-category-94 | 23.60 | 14 | demonstration | 3 |
| 4 | account_pymes_596 | Pilot Assessment | adaptive-category-95 | 25.80 | 17 | adopted | 4 |

The `r_e_c_p_practices` table catalogs the resource-efficient and climate-resilient practices available for adoption. Each practice carries a unique `id`, a `practice_code` (ranging from alphanumeric identifiers like `template_ivacode_pagata_20ind` to numeric codes such as `8350036`), and a descriptive `practice_name`—Seasonal Survey, Integrated Corridor, Extended Series D, and Pilot Assessment. The `category` column groups practices into classification buckets like `compact-category-92` or `adaptive-category-95`. Quantitative metrics accompany each practice: `resource_efficiency_gain` measures the expected percentage improvement in resource use (values of 19.20, 21.40, 23.60, and 25.80 in the current data), while `climate_resilience_score` provides an ordinal assessment (8 through 17). The `adoption_status` field tracks the lifecycle stage of each practice as it moves through potential, selected, demonstration, and adopted phases. A `microenterprise_id` foreign key links each practice to the enterprise that has adopted it.

**Table `project_activities`**

| id | activity_i_d | activity_type | start_date | end_date | status | location |
|---|---|---|---|---|---|---|
| 1 | ACT-2460 | integrated-activity-64 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | extended-location-99 |
| 2 | ACT-2464 | seasonal-activity-65 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | ongoing | integrated-location-100 |
| 3 | ACT-2468 | regional-activity-66 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | seasonal-location-101 |
| 4 | ACT-2472 | legacy-activity-67 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | cancelled | regional-location-102 |

Project activities represent the operational units through which field work is organized and executed. The `project_activities` table records each activity with an `id`, an `activity_i_d` identifier (e.g., `ACT-2460`, `ACT-2472`), and an `activity_type` classification such as `integrated-activity-64` or `seasonal-activity-65`. Temporal boundaries are defined by `start_date` and `end_date` columns, which store ISO 8601 timestamps. The `status` column indicates the current state of the activity—planned, ongoing, completed, or cancelled—and `location` specifies the geographic or operational site, such as `extended-location-99` or `regional-location-102`.

**Table `activities_microenterprises`**

| project_activity_id | microenterprise_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `activities_microenterprises` table implements the many-to-many relationship between project activities and microenterprises. Each row pairs a `project_activity_id` with a `microenterprise_id`, documenting which enterprises participate in which activities. In the current dataset, activity 1 involves enterprises 1 and 2; activity 2 involves enterprises 2 and 3; activity 3 involves enterprises 3 and 4; and activity 4 involves enterprises 4 and 1. This associative table enables flexible assignment of enterprises to multiple activities and activities to multiple enterprises, supporting complex program structures where participation is not strictly one-to-one.

### Enterprise–Activity Relationships

The `microenterprise_project_activity_view` synthesizes the direct linkage between microenterprises and their assigned project activities. This view joins `microenterprises` to `project_activities` on the matching `project_activity_id` and `id` columns, producing a consolidated record that presents enterprise identifiers alongside activity details in a single row.

**View `microenterprise_project_activity_view`**

```sql
CREATE VIEW microenterprise_project_activity_view AS
SELECT a.microenterprise_id, a.identifier, a.legal_name, a.cluster_location, b.id AS activity_id, b.activity_i_d AS activity_activity_i_d, b.activity_type AS activity_activity_type
FROM microenterprises a JOIN project_activities b ON a.project_activity_id = b.id;
```

| microenterprise_id | identifier | legal_name | cluster_location | activity_id | activity_activity_i_d | activity_activity_type |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Adaptive Model | composite-cluster-39 | 1 | ACT-2460 | integrated-activity-64 |
| 2 | IDE-2091 | Primary Cluster | primary-cluster-40 | 2 | ACT-2464 | seasonal-activity-65 |
| 3 | IDE-2096 | Composite Review D | adaptive-cluster-41 | 3 | ACT-2468 | regional-activity-66 |
| 4 | IDE-2101 | Compact Initiative | distributed-cluster-42 | 4 | ACT-2472 | legacy-activity-67 |

Each row in this view answers the question: which project activity is assigned to which microenterprise, and what are the identifying characteristics of both? For example, the first row shows that microenterprise `IDE-2086` (Adaptive Model, located at `composite-cluster-39`) is associated with activity `ACT-2460` of type `integrated-activity-64`. The second row links `IDE-2091` (Primary Cluster, `primary-cluster-40`) to activity `ACT-2464` (seasonal-activity-65). The third and fourth rows follow the same pattern, connecting `IDE-2096` to `ACT-2468` (regional-activity-66) and `IDE-2101` to `ACT-2472` (legacy-activity-67). This view is particularly useful for program managers who need a quick reference mapping enterprises to their current activity assignments.

### Enterprise–Practice Relationships

The `microenterprise_r_e_c_p_practice_view` provides a parallel synthesis, joining microenterprises to their adopted R-E-C-P practices. By matching `r_e_c_p_practice_id` from the microenterprises table to the `id` in `r_e_c_p_practices`, this view presents a unified record of which practice each enterprise has adopted.

**View `microenterprise_r_e_c_p_practice_view`**

```sql
CREATE VIEW microenterprise_r_e_c_p_practice_view AS
SELECT a.microenterprise_id, a.identifier, a.legal_name, a.cluster_location, b.id AS practice_id, b.practice_code AS practice_practice_code, b.practice_name AS practice_practice_name
FROM microenterprises a JOIN r_e_c_p_practices b ON a.r_e_c_p_practice_id = b.id;
```

| microenterprise_id | identifier | legal_name | cluster_location | practice_id | practice_practice_code | practice_practice_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Adaptive Model | composite-cluster-39 | 1 | template_ivacode_pagata_20ind | Seasonal Survey |
| 2 | IDE-2091 | Primary Cluster | primary-cluster-40 | 2 | 8350036 | Integrated Corridor |
| 3 | IDE-2096 | Composite Review D | adaptive-cluster-41 | 3 | 17181811 | Extended Series D |
| 4 | IDE-2101 | Compact Initiative | distributed-cluster-42 | 4 | account_pymes_596 | Pilot Assessment |

This view addresses the question: which resource-efficient practice has each microenterprise adopted, and what are the practice's identifying attributes? The first row reveals that `IDE-2086` (Adaptive Model) has adopted practice `template_ivacode_pagata_20ind`, named Seasonal Survey, classified under `compact-category-92`. The second row shows `IDE-2091` (Primary Cluster) linked to practice `8350036`, Integrated Corridor, in `composite-category-93`. The third and fourth rows connect `IDE-2096` to `17181811` (Extended Series D, `primary-category-94`) and `IDE-2101` to `account_pymes_596` (Pilot Assessment, `adaptive-category-95`). Program coordinators use this view to verify practice assignments and to cross-reference enterprise locations with practice categories for geographic or sectoral analysis.

### Practice–Enterprise Relationships

The `r_e_c_p_practice_microenterprise_view` inverts the perspective of the previous view, organizing records by practice and listing the enterprises that have adopted each one. This join starts from `r_e_c_p_practices` and connects to `microenterprises` via the `microenterprise_id` foreign key, producing a consolidated record that presents practice identifiers alongside enterprise details.

**View `r_e_c_p_practice_microenterprise_view`**

```sql
CREATE VIEW r_e_c_p_practice_microenterprise_view AS
SELECT a.id, a.practice_code, a.practice_name, a.category, b.microenterprise_id AS microenterprise_microenterprise_id, b.identifier AS microenterprise_identifier, b.legal_name AS microenterprise_legal_name
FROM r_e_c_p_practices a JOIN microenterprises b ON a.microenterprise_id = b.microenterprise_id;
```

| id | practice_code | practice_name | category | microenterprise_microenterprise_id | microenterprise_identifier | microenterprise_legal_name |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20ind | Seasonal Survey | compact-category-92 | 1 | IDE-2086 | Adaptive Model |
| 2 | 8350036 | Integrated Corridor | composite-category-93 | 2 | IDE-2091 | Primary Cluster |
| 3 | 17181811 | Extended Series D | primary-category-94 | 3 | IDE-2096 | Composite Review D |
| 4 | account_pymes_596 | Pilot Assessment | adaptive-category-95 | 4 | IDE-2101 | Compact Initiative |

This view answers the question: which microenterprises have adopted each R-E-C-P practice, and what are the enterprises' identifying characteristics? Each row pairs a practice with its adopting enterprise, presenting the practice's `id`, `practice_code`, and `practice_name` alongside the enterprise's `microenterprise_id`, `identifier`, `legal_name`, and `cluster_location`. For instance, the first row shows that practice `template_ivacode_pagata_20ind` (Seasonal Survey) is adopted by microenterprise `IDE-2086` (Adaptive Model) at `composite-cluster-39`. The subsequent rows follow the same structure, linking Integrated Corridor to Primary Cluster, Extended Series D to Composite Review D, and Pilot Assessment to Compact Initiative. This perspective is valuable for practice managers who need to understand the adoption footprint of each practice across the enterprise population.

### Activity–Enterprise Detail Relationships

The `project_activity_microenterprise_detail_view` provides the most granular operational view, joining the `activities_microenterprises` associative table to both `project_activities` and `microenterprises`. This three-way join produces a detailed record that combines the participation relationship with the full identifying and descriptive attributes of both the activity and the enterprise.

**View `project_activity_microenterprise_detail_view`**

```sql
CREATE VIEW project_activity_microenterprise_detail_view AS
SELECT a.id, a.activity_i_d, a.activity_type, b.microenterprise_id AS microenterprise_microenterprise_id, b.identifier AS microenterprise_identifier, b.legal_name AS microenterprise_legal_name
FROM project_activities a
  JOIN activities_microenterprises j ON j.project_activity_id = a.id
  JOIN microenterprises b ON b.microenterprise_id = j.microenterprise_id;
```

| id | activity_i_d | activity_type | microenterprise_microenterprise_id | microenterprise_identifier | microenterprise_legal_name |
|---|---|---|---|---|---|
| 1 | ACT-2460 | integrated-activity-64 | 1 | IDE-2086 | Adaptive Model |
| 1 | ACT-2460 | integrated-activity-64 | 2 | IDE-2091 | Primary Cluster |
| 2 | ACT-2464 | seasonal-activity-65 | 2 | IDE-2091 | Primary Cluster |
| 2 | ACT-2464 | seasonal-activity-65 | 3 | IDE-2096 | Composite Review D |
| 3 | ACT-2468 | regional-activity-66 | 3 | IDE-2096 | Composite Review D |
| 3 | ACT-2468 | regional-activity-66 | 4 | IDE-2101 | Compact Initiative |
| 4 | ACT-2472 | legacy-activity-67 | 4 | IDE-2101 | Compact Initiative |
| 4 | ACT-2472 | legacy-activity-67 | 1 | IDE-2086 | Adaptive Model |

This view addresses the question: which microenterprises participate in which project activities, and what are the complete identifying details of both the activity and the enterprise? Each row presents the `project_activity_id` and `microenterprise_id` from the associative table alongside the activity's `activity_i_d`, `activity_type`, and `status`, as well as the enterprise's `identifier`, `legal_name`, and `cluster_location`. For example, the first row shows that microenterprise `IDE-2086` (Adaptive Model, `composite-cluster-39`) participates in activity `ACT-2460` (integrated-activity-64, status: planned) at `extended-location-99`. The second row documents that `IDE-2091` (Primary Cluster) also participates in activity 1, demonstrating the many-to-many relationship. The remaining rows follow the same pattern, capturing all eight participation records from the `activities_microenterprises` table with full contextual detail. This view is the primary tool for operational reporting, enabling program managers to audit participation, verify activity assignments, and generate detailed rosters for field coordination.

### Synthesis

The four base tables and four views together form a coherent data architecture for tracking microenterprise engagement with project activities and R-E-C-P practices. The base tables store the canonical records: enterprises are registered with their identifying and contextual attributes, practices are cataloged with quantitative efficiency and resilience metrics, activities are defined with temporal and status information, and the associative table captures the flexible many-to-many participation relationships. The views synthesize these records into operational perspectives—enterprise-to-activity, enterprise-to-practice, practice-to-enterprise, and activity-to-enterprise detail—each answering a distinct reporting question. Together, they support the full lifecycle of program management, from initial registration through practice adoption to activity execution and participation tracking.