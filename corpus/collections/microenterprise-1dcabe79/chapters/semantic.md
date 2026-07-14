The domain under examination concerns the governance of microenterprises operating within structured project ecosystems, where each enterprise is simultaneously enrolled in a development activity and guided by a resource-efficiency and climate-resilience practice. The data model captures three distinct entity types—microenterprises, project activities, and REC (resource-efficiency, climate-resilience, circular-economy) practices—along with a many-to-many association between activities and enterprises. The relational schema materializes these entities as four base tables and four denormalized views, each view reconstructing a domain fact by joining the appropriate normalized tables.

**Table `microenterprises`**

| microenterprise_id | identifier | legal_name | cluster_location | sector_type | registration_date | is_demonstration_site | project_activity_id | r_e_c_p_practice_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Adaptive Model | composite-cluster-39 | integrated-sector-40 | 2023-06-19 | true | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | IDE-2091 | Primary Cluster | primary-cluster-40 | seasonal-sector-41 | 2024-11-03 | false | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | IDE-2096 | Composite Review D | adaptive-cluster-41 | regional-sector-42 | 2025-04-14 | true | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | IDE-2101 | Compact Initiative | distributed-cluster-42 | legacy-sector-43 | 2022-09-25 | false | 4 | 4 | 2025-04-16 09:14:00 |

The `microenterprises` table is the central entity in the model. Each row represents a single microenterprise identified by a surrogate primary key `microenterprise_id` and a human-readable `identifier` such as `IDE-2086` or `IDE-2101`. The `legal_name` column carries the organization's registered name—`Adaptive Model`, `Primary Cluster`, `Composite Review D`, `Compact Initiative`—while `cluster_location` records the geographic or organizational cluster, for example `composite-cluster-39` or `distributed-cluster-42`. The `sector_type` column classifies the enterprise's economic sector (`integrated-sector-40`, `seasonal-sector-41`, `regional-sector-42`, `legacy-sector-43`), and `registration_date` anchors the enterprise in time (e.g., `2023-06-19`). A boolean flag `is_demonstration_site` marks whether the enterprise participates in a demonstration programme. Critically, the table also carries two foreign keys: `project_activity_id` references `project_activities.id`, and `r_e_c_p_practice_id` references `r_e_c_p_practices.id`. These two columns encode the one-to-one associations between each microenterprise and its assigned activity and practice. The `created_at` timestamp records when the row was inserted.

**Table `r_e_c_p_practices`**

| id | practice_code | practice_name | category | resource_efficiency_gain | climate_resilience_score | adoption_status | microenterprise_id |
|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20ind | Seasonal Survey | compact-category-92 | 19.20 | 8 | potential | 1 |
| 2 | 8350036 | Integrated Corridor | composite-category-93 | 21.40 | 11 | selected | 2 |
| 3 | 17181811 | Extended Series D | primary-category-94 | 23.60 | 14 | demonstration | 3 |
| 4 | account_pymes_596 | Pilot Assessment | adaptive-category-95 | 25.80 | 17 | adopted | 4 |

The `r_e_c_p_practices` table defines the catalogue of resource-efficiency, climate-resilience, and circular-economy practices available to microenterprises. Its surrogate primary key is `id`. The `practice_code` column holds a machine-readable code—`template_ivacode_pagata_20ind`, `8350036`, `17181811`, `account_pymes_596`—while `practice_name` provides the human-readable label (`Seasonal Survey`, `Integrated Corridor`, `Extended Series D`, `Pilot Assessment`). The `category` column groups practices into types such as `compact-category-92` or `adaptive-category-95`. Two numeric columns quantify the practice's impact: `resource_efficiency_gain` (e.g., `19.20`, `21.40`, `23.60`, `25.80`) and `climate_resilience_score` (e.g., `8`, `11`, `14`, `17`). The `adoption_status` column records the current adoption stage—`potential`, `selected`, `demonstration`, `adopted`—and `microenterprise_id` is a foreign key back to `microenterprises.microenterprise_id`, establishing the reverse direction of the one-to-one association.

**Table `project_activities`**

| id | activity_i_d | activity_type | start_date | end_date | status | location |
|---|---|---|---|---|---|---|
| 1 | ACT-2460 | integrated-activity-64 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | extended-location-99 |
| 2 | ACT-2464 | seasonal-activity-65 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | ongoing | integrated-location-100 |
| 3 | ACT-2468 | regional-activity-66 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | seasonal-location-101 |
| 4 | ACT-2472 | legacy-activity-67 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | cancelled | regional-location-102 |

The `project_activities` table stores the development activities through which microenterprises receive support. Its surrogate primary key is `id`. The `activity_i_d` column carries a human-readable activity identifier such as `ACT-2460` or `ACT-2472`. The `activity_type` column classifies the activity (`integrated-activity-64`, `seasonal-activity-65`, `regional-activity-66`, `legacy-activity-67`). The `start_date` and `end_date` columns record the activity's temporal bounds using ISO 8601 timestamps (e.g., `2022-09-05T20:24:00` through `2022-09-01T08:00:00`). The `status` column captures the current lifecycle state (`planned`, `ongoing`, `completed`, `cancelled`), and `location` records the activity's geographic or organizational setting (`extended-location-99`, `integrated-location-100`, `seasonal-location-101`, `regional-location-102`).

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

The `activities_microenterprises` table is a junction table that resolves a many-to-many relationship between `project_activities` and `microenterprises`. It contains two columns: `project_activity_id` and `microenterprise_id`, both of which are foreign keys referencing their respective parent tables. Each row asserts that a particular microenterprise participates in a particular project activity. The data shows that each activity is associated with exactly two microenterprises: activity `1` links to enterprises `1` and `2`; activity `2` links to enterprises `2` and `3`; activity `3` links to enterprises `3` and `4`; and activity `4` links to enterprises `4` and `1`. This symmetric pairing creates a circular participation pattern across the four enterprises.

The materialization of this ontology into a relational schema follows a standard normalization pattern. The three core entity types—microenterprises, REC practices, and project activities—are each represented by their own table with a surrogate primary key. The one-to-one associations between microenterprises and REC practices are encoded as foreign keys in both `microenterprises.r_e_c_p_practice_id` and `r_e_c_p_practices.microenterprise_id`, forming a bidirectional link. The many-to-many association between microenterprises and project activities is resolved through the junction table `activities_microenterprises`, which contains only the two foreign key columns. The `microenterprises` table also carries a `project_activity_id` foreign key, which provides a convenient shortcut for the one-to-one view but does not replace the junction table for the full many-to-many relationship.

The four views in the schema each answer a specific analytical question by joining the normalized tables back together.

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

The `microenterprise_project_activity_view` answers the question: "Which project activity is each microenterprise directly assigned to?" It joins `microenterprises` to `project_activities` on `microenterprises.project_activity_id = project_activities.id`. The result is a flat table where each microenterprise row is augmented with the activity's `id`, `activity_i_d`, and `activity_type`. For example, the microenterprise `Adaptive Model` (`IDE-2086`) is joined to activity `ACT-2460` of type `integrated-activity-64`; `Primary Cluster` (`IDE-2091`) is joined to `ACT-2464` (`seasonal-activity-65`); `Composite Review D` (`IDE-2096`) to `ACT-2468` (`regional-activity-66`); and `Compact Initiative` (`IDE-2101`) to `ACT-2472` (`legacy-activity-67`). This view provides a one-row-per-enterprise summary of the activity assignment.

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

The `microenterprise_r_e_c_p_practice_view` answers: "Which REC practice is each microenterprise guided by?" It joins `microenterprises` to `r_e_c_p_practices` on `microenterprises.r_e_c_p_practice_id = r_e_c_p_practices.id`. The result augments each microenterprise row with the practice's `id`, `practice_code`, and `practice_name`. For instance, `Adaptive Model` (`IDE-2086`) is linked to practice `template_ivacode_pagata_20ind` named `Seasonal Survey`; `Primary Cluster` (`IDE-2091`) to `8350036` (`Integrated Corridor`); `Composite Review D` (`IDE-2096`) to `17181811` (`Extended Series D`); and `Compact Initiative` (`IDE-2101`) to `account_pymes_596` (`Pilot Assessment`). Like the previous view, this produces one row per microenterprise.

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

The `r_e_c_p_practice_microenterprise_view` reverses the perspective, answering: "Which microenterprise is associated with each REC practice?" It joins `r_e_c_p_practices` to `microenterprises` on `r_e_c_p_practices.microenterprise_id = microenterprises.microenterprise_id`. The result is the same logical information as `microenterprise_r_e_c_p_practice_view` but with the practice as the driving entity. Each practice row is augmented with the microenterprise's `microenterprise_id`, `identifier`, `legal_name`, and `cluster_location`. For example, the practice `Seasonal Survey` (`template_ivacode_pagata_20ind`) is associated with microenterprise `IDE-2086` (`Adaptive Model`) in `composite-cluster-39`; `Integrated Corridor` (`8350036`) with `IDE-2091` (`Primary Cluster`) in `primary-cluster-40`; `Extended Series D` (`17181811`) with `IDE-2096` (`Composite Review D`) in `adaptive-cluster-41`; and `Pilot Assessment` (`account_pymes_596`) with `IDE-2101` (`Compact Initiative`) in `distributed-cluster-42`. This view is useful when the analyst starts from the practice catalogue and wants to discover which enterprises are enrolled.

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

The `project_activity_microenterprise_detail_view` answers: "Which microenterprises participate in each project activity?" It joins `project_activities` to `microenterprises` through the `activities_microenterprises` junction table on `project_activities.id = activities_microenterprises.project_activity_id` and `activities_microenterprises.microenterprise_id = microenterprises.microenterprise_id`. Because the junction table supports a many-to-many relationship, this view can produce multiple rows per activity. For example, activity `ACT-2460` (`integrated-activity-64`) is associated with two microenterprises: `IDE-2086` (`Adaptive Model`) and `IDE-2091` (`Primary Cluster`). Activity `ACT-2464` (`seasonal-activity-65`) is associated with `IDE-2091` (`Primary Cluster`) and `IDE-2096` (`Composite Review D`). Activity `ACT-2468` (`regional-activity-66`) links to `IDE-2096` (`Composite Review D`) and `IDE-2101` (`Compact Initiative`). Activity `ACT-2472` (`legacy-activity-67`) links to `IDE-2101` (`Compact Initiative`) and `IDE-2086` (`Adaptive Model`). This view is the only one that materializes the many-to-many relationship explicitly; the other three views operate on the one-to-one associations encoded as direct foreign keys.

The schema design reflects a deliberate trade-off between normalization and query convenience. The one-to-one associations between microenterprises and REC practices are stored redundantly in both directions—`microenterprises.r_e_c_p_practice_id` and `r_e_c_p_practices.microenterprise_id`—which simplifies the two practice-related views into single-table joins. The many-to-many association between microenterprises and project activities is properly normalized through the `activities_microenterprises` junction table, and the `project_activity_microenterprise_detail_view` reconstructs the full relationship by joining through this junction. The `microenterprises.project_activity_id` column provides an additional shortcut for the one-to-one view `microenterprise_project_activity_view`, but this column does not capture the full participation pattern recorded in the junction table. Together, the four base tables and four views provide a complete materialization of the domain ontology, supporting both entity-centric and relationship-centric queries across the microenterprise development ecosystem.