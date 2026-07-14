## Domain Modelling and Relational Materialization

Urban planning and development administration involve a complex web of spatial parcels, regulatory applications, construction projects, and public participation. The schema captures this ecosystem by separating concerns into distinct entity types—each materialized as a base table with a stable surrogate key—while many-to-many relationships and cross-entity aggregations are expressed through junction tables and materialized views. The following sections walk through the ontology, its relational projection, and the view layer that reconstructs domain facts from the normalized store.

### Base Entities and Their Attributes

The planning lifecycle begins with `planning_applications`, the central regulatory artifact. Each row represents a submitted proposal with a business-facing `application_id` (values such as `505997`, `1250196`, `IVC20det40`) alongside a surrogate `id` primary key. The `status` column tracks the lifecycle stage—`submitted`, `under_review`, `objection_raised`, `rejected`—while `proposal_type` classifies the work as `residential`, `commercial`, `mixed_use`, or `infrastructure`. Physical parameters like `total_floor_area` (ranging from 6.45 to 16.80) and `total_height` (0 to 11) describe the proposed footprint. Temporal metadata (`submission_date`, `created_at`, `updated_at`) provides auditability. Two foreign keys anchor the application to the spatial and administrative context: `land_parcel_id` points to the affected parcel, and `authority_id` references the responsible `local_authorities` record.

**Table `planning_applications`**

| id | application_id | status | submission_date | proposal_type | total_floor_area | total_height | land_parcel_id | authority_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 505997 | submitted | 2025-04-24 | residential | 6.45 | 10 | 1000 | 974930 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 1250196 | under_review | 2022-09-08 | commercial | 9.90 | 7 | 1001 | 5917289 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 124 | objection_raised | 2023-02-19 | mixed_use | 13.35 | 0 | 1002 | 8843762 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | IVC20det40 | rejected | 2024-07-03 | infrastructure | 16.80 | 11 | 1003 | 2087738 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Land parcels form the spatial substrate. The `land_parcels` table stores each parcel's business identifier (`parcel_id`), zoning classification (`zoning_district`—e.g., `garden_city`, `residential`, `commercial`, `green_belt`), physical extent (`area_hectares` from 10.20 to 22.80), existing use (`current_land_use`), and terrain (`topography`: `flat`, `sloped`, `hilly`). The foreign keys `municipality_id` and `planning_application_id` link parcels to their governing municipality and to any active planning application, respectively.

**Table `land_parcels`**

| id | parcel_id | zoning_district | area_hectares | current_land_use | topography | municipality_id | planning_application_id |
|---|---|---|---|---|---|---|---|
| 1000 | 4447034 | garden_city | 10.20 | agricultural | flat | 1000 | 1000 |
| 1001 | 325464 | residential | 14.40 | vacant | sloped | 1001 | 1001 |
| 1002 | 3990187 | commercial | 18.60 | residential | hilly | 1002 | 1002 |
| 1003 | 110 | green_belt | 22.80 | commercial | flat | 1003 | 1003 |

Housing units are modelled as a separate entity to support fine-grained unit-level analysis. The `housing_units` table uses a composite identifier (`unit_id`) that accommodates both numeric IDs (`39800614`) and UUIDs (`57dbb53c-8fcc-11eb-924d-9cd76263cbd0`). Attributes include `unit_type` (`house`, `flat`, `apartment`, `mansion`), `bedrooms` (16–25), boolean `has_garden`, `floor_level` (10–25), and `building_height` (30–57). The foreign key `development_project_id` ties each unit to its parent project.

**Table `housing_units`**

| unit_id | unit_type | bedrooms | has_garden | floor_level | building_height | development_project_id |
|---|---|---|---|---|---|---|
| 39800614 | house | 16 | false | 10 | 30 | 100 |
| 611523 | flat | 19 | true | 15 | 39 | 101 |
| 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | apartment | 22 | false | 20 | 48 | 102 |
| account_pymes_1040 | mansion | 25 | true | 25 | 57 | 103 |

Development projects aggregate housing units and infrastructure into a single deliverable. The `development_projects` table carries a business `project_id` (e.g., `1437597`, `df5a6648-8fd1-11eb-924d-9cd76263cbd0`), a human-readable `project_name` (`Compact Survey`, `Legacy Corridor`, `Regional Series A`, `Seasonal Assessment`), and summary metrics: `total_units` (0–57), `total_floors` (29–57), `estimated_cost` (12.74–36.43), and `start_date`. A foreign key `land_parcel_id` anchors the project to its site.

**Table `development_projects`**

| development_project_id | project_id | project_name | total_units | total_floors | estimated_cost | start_date | land_parcel_id |
|---|---|---|---|---|---|---|---|
| 100 | 1437597 | Compact Survey | 19 | 51 | 36.43 | 2022-09-05 | 1000 |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | 2 | 29 | 17.41 | 2023-02-16 | 1001 |
| 102 | 5006462 | Regional Series A | 57 | 57 | 12.74 | 2024-07-27 | 1002 |
| 103 | 10207143 | Seasonal Assessment | 0 | 38 | 13.49 | 2025-12-11 | 1003 |

Infrastructure assets—hospitals, schools, clinics, roads—are captured in `infrastructures`. Each record has an `infra_id`, an `infra_type`, capacity figures (`capacity` 32–59, `current_utilization` 19.95–31.80), and a `condition` rating (`adequate`, `insufficient`, `overloaded`, `new`). Foreign keys `municipality_id` and `land_parcel_id` locate the asset within the administrative and spatial hierarchy.

**Table `infrastructures`**

| infra_id | infra_type | capacity | current_utilization | condition | municipality_id | land_parcel_id |
|---|---|---|---|---|---|---|
| 10449522 | hospital | 32 | 19.95 | adequate | 1000 | 1000 |
| 168539 | school | 41 | 23.90 | insufficient | 1001 | 1001 |
| 9568467 | clinic | 50 | 27.85 | overloaded | 1002 | 1002 |
| 3012834 | road | 59 | 31.80 | new | 1003 | 1003 |

Public objections represent citizen feedback on planning applications. The `public_objections` table stores an `objection_id` (numeric or UUID, e.g., `5917292`, `5fd80e34-8fcc-11eb-924d-9cd76263cbd0`), `submission_date`, the `objection_reason` (`density`, `lack_of_green_space`, `inadequate_parking`, `infrastructure_strain`), a `severity` level (`minor`, `moderate`, `severe`), a boolean `is_formal` flag, and the foreign key `planning_application_id` linking the objection to the proposal it challenges.

**Table `public_objections`**

| objection_id | submission_date | objection_reason | severity | is_formal | planning_application_id |
|---|---|---|---|---|---|
| 5917292 | 2025-04-24 | density | minor | false | 1000 |
| 5fd80e34-8fcc-11eb-924d-9cd76263cbd0 | 2022-09-08 | lack_of_green_space | moderate | true | 1001 |
| 3775 | 2023-02-19 | inadequate_parking | severe | false | 1002 |
| bjacobt | 2024-07-03 | infrastructure_strain | minor | true | 1003 |

The remaining base tables—`municipalities`, `local_authorities`, and the eight junction tables—complete the entity inventory. Junction tables exist because the domain contains genuine many-to-many relationships: a single planning application can attract multiple objections and be handled by multiple authorities; a development project contains many housing units and may include multiple infrastructure components; a municipality oversees many parcels and infrastructure assets; and objections can relate to multiple infrastructure concerns.

**Table `municipalities`**

| id | municipality_id | name | population | density | garden_city_status | authority_id |
|---|---|---|---|---|---|---|
| 1000 | 3744009 | Extended Review | 42 | 3.45 | false | 974930 |
| 1001 | 2618554 | Pilot Initiative A | 49 | 5.90 | true | 5917289 |
| 1002 | 198 | Baseline Model | 56 | 8.35 | false | 8843762 |
| 1003 | ed58497c-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 63 | 10.80 | true | 2087738 |

**Table `local_authorities`**

| authority_id | authority_name | jurisdiction | decision | municipality_id |
|---|---|---|---|---|
| 974930 | Sean Green | regional-jurisdic-30 | pending | 1000 |
| 5917289 | Elizabeth Woods | legacy-jurisdic-31 | approved | 1001 |
| 8843762 | Kimberly Smith | compact-jurisdic-32 | rejected | 1002 |
| 2087738 | Kimberly Smith | composite-jurisdic-33 | requesting_changes | 1003 |

**Table `applications_objections`**

| planning_application_id | objection_id |
|---|---|
| 1000 | 5917292 |
| 1000 | 5fd80e34-8fcc-11eb-924d-9cd76263cbd0 |
| 1001 | 5fd80e34-8fcc-11eb-924d-9cd76263cbd0 |
| 1001 | 3775 |
| 1002 | 3775 |
| 1002 | bjacobt |
| 1003 | bjacobt |
| 1003 | 5917292 |

**Table `projects_units`**

| development_project_id | unit_id |
|---|---|
| 100 | 39800614 |
| 100 | 611523 |
| 101 | 611523 |
| 101 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 |
| 102 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 |
| 102 | account_pymes_1040 |
| 103 | account_pymes_1040 |
| 103 | 39800614 |

**Table `projects_infrastructures`**

| development_project_id | infrastructure_infra_id |
|---|---|
| 100 | 10449522 |
| 100 | 168539 |
| 101 | 168539 |
| 101 | 9568467 |
| 102 | 9568467 |
| 102 | 3012834 |
| 103 | 3012834 |
| 103 | 10449522 |

**Table `infrastructures_projects`**

| infrastructure_infra_id | development_project_id |
|---|---|
| 10449522 | 100 |
| 10449522 | 101 |
| 168539 | 101 |
| 168539 | 102 |
| 9568467 | 102 |
| 9568467 | 103 |
| 3012834 | 103 |
| 3012834 | 100 |

**Table `objections_infrastructures`**

| objection_id | infrastructure_infra_id |
|---|---|
| 5917292 | 10449522 |
| 5917292 | 168539 |
| 5fd80e34-8fcc-11eb-924d-9cd76263cbd0 | 168539 |
| 5fd80e34-8fcc-11eb-924d-9cd76263cbd0 | 9568467 |
| 3775 | 9568467 |
| 3775 | 3012834 |
| bjacobt | 3012834 |
| bjacobt | 10449522 |

**Table `municipalities_parcels`**

| municipality_id | land_parcel_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

**Table `municipalities_infrastructures`**

| municipality_id | infrastructure_infra_id |
|---|---|
| 1000 | 10449522 |
| 1000 | 168539 |
| 1001 | 168539 |
| 1001 | 9568467 |
| 1002 | 9568467 |
| 1002 | 3012834 |
| 1003 | 3012834 |
| 1003 | 10449522 |

**Table `authorities_applications`**

| authority_id | planning_application_id |
|---|---|
| 974930 | 1000 |
| 974930 | 1001 |
| 5917289 | 1001 |
| 5917289 | 1002 |
| 8843762 | 1002 |
| 8843762 | 1003 |
| 2087738 | 1003 |
| 2087738 | 1000 |

### Foreign-Key Topology and Cardinality

The foreign-key graph forms a layered structure. At the top level, `municipalities` sit at the apex, with `local_authorities` reporting to them. `land_parcels` are assigned to a `municipality_id` and may be linked to a `planning_application_id`. `planning_applications` reference both a `land_parcel_id` and an `authority_id`, creating a triangle of spatial, regulatory, and administrative dependencies.

`development_projects` reference `land_parcels` via `land_parcel_id`, while `housing_units` reference `development_projects` via `development_project_id`. This establishes a three-level hierarchy: municipality → land parcel → development project → housing unit.

`infrastructures` reference both `municipality_id` and `land_parcel_id`, placing them in the same spatial-administrative context as parcels and applications. The junction tables (`projects_units`, `projects_infrastructures`, `infrastructures_projects`, `objections_infrastructures`, `applications_objections`, `municipalities_parcels`, `municipalities_infrastructures`, `authorities_applications`) resolve the many-to-many relationships that the base tables cannot express directly. For example, `projects_units` allows a single development project to contain many housing units, while each housing unit belongs to exactly one project. Similarly, `applications_objections` enables a planning application to accumulate multiple public objections, and `objections_infrastructures` links objections to specific infrastructure concerns.

### View Layer: Reconstructing Domain Facts

The view layer denormalizes the schema to answer common analytical questions without requiring ad-hoc joins. Each view is a persistent query that materializes a specific domain fact.

The `planning_application_land_parcel_view` joins `planning_applications` with `land_parcels` on `land_parcel_id`, producing a single row per application that includes both the regulatory parameters (status, proposal type, floor area) and the spatial attributes (zoning district, area, topography). For application `505997` on parcel `4447034`, the view reveals a `residential` proposal on a `garden_city`-zoned, `flat`, `agricultural` parcel of 10.20 hectares.

**View `planning_application_land_parcel_view`**

```sql
CREATE VIEW planning_application_land_parcel_view AS
SELECT a.id, a.application_id, a.status, a.submission_date, b.id AS parcel_id, b.parcel_id AS parcel_parcel_id, b.zoning_district AS parcel_zoning_district
FROM planning_applications a JOIN land_parcels b ON a.land_parcel_id = b.id;
```

| id | application_id | status | submission_date | parcel_id | parcel_parcel_id | parcel_zoning_district |
|---|---|---|---|---|---|---|
| 1000 | 505997 | submitted | 2025-04-24 | 1000 | 4447034 | garden_city |
| 1001 | 1250196 | under_review | 2022-09-08 | 1001 | 325464 | residential |
| 1002 | 124 | objection_raised | 2023-02-19 | 1002 | 3990187 | commercial |
| 1003 | IVC20det40 | rejected | 2024-07-03 | 1003 | 110 | green_belt |

The `planning_application_local_authority_view` connects applications to their processing authorities via `authority_id`, enabling queries about which authority handles which types of proposals. An application with `status = under_review` and `proposal_type = commercial` (ID `1250196`) is processed by authority `5917289`.

**View `planning_application_local_authority_view`**

```sql
CREATE VIEW planning_application_local_authority_view AS
SELECT a.id, a.application_id, a.status, a.submission_date, b.authority_id AS authority_authority_id, b.authority_name AS authority_authority_name, b.jurisdiction AS authority_jurisdiction
FROM planning_applications a JOIN local_authorities b ON a.authority_id = b.authority_id;
```

| id | application_id | status | submission_date | authority_authority_id | authority_authority_name | authority_jurisdiction |
|---|---|---|---|---|---|---|
| 1000 | 505997 | submitted | 2025-04-24 | 974930 | Sean Green | regional-jurisdic-30 |
| 1001 | 1250196 | under_review | 2022-09-08 | 5917289 | Elizabeth Woods | legacy-jurisdic-31 |
| 1002 | 124 | objection_raised | 2023-02-19 | 8843762 | Kimberly Smith | compact-jurisdic-32 |
| 1003 | IVC20det40 | rejected | 2024-07-03 | 2087738 | Kimberly Smith | composite-jurisdic-33 |

The `planning_application_public_objection_detail_view` joins applications with their objections, surfacing the citizen feedback alongside the proposal details. Application `505997` has an objection with reason `density` and severity `minor` that is not formal (`is_formal = false`). Application `1250196` has a formal objection (`is_formal = true`) citing `lack_of_green_space` at `moderate` severity.

**View `planning_application_public_objection_detail_view`**

```sql
CREATE VIEW planning_application_public_objection_detail_view AS
SELECT a.id, a.application_id, a.status, b.objection_id AS objection_objection_id, b.submission_date AS objection_submission_date, b.objection_reason AS objection_objection_reason
FROM planning_applications a
  JOIN applications_objections j ON j.planning_application_id = a.id
  JOIN public_objections b ON b.objection_id = j.objection_id;
```

| id | application_id | status | objection_objection_id | objection_submission_date | objection_objection_reason |
|---|---|---|---|---|---|
| 1000 | 505997 | submitted | 5917292 | 2025-04-24 | density |
| 1000 | 505997 | submitted | 5fd80e34-8fcc-11eb-924d-9cd76263cbd0 | 2022-09-08 | lack_of_green_space |
| 1001 | 1250196 | under_review | 5fd80e34-8fcc-11eb-924d-9cd76263cbd0 | 2022-09-08 | lack_of_green_space |
| 1001 | 1250196 | under_review | 3775 | 2023-02-19 | inadequate_parking |
| 1002 | 124 | objection_raised | 3775 | 2023-02-19 | inadequate_parking |
| 1002 | 124 | objection_raised | bjacobt | 2024-07-03 | infrastructure_strain |
| 1003 | IVC20det40 | rejected | bjacobt | 2024-07-03 | infrastructure_strain |
| 1003 | IVC20det40 | rejected | 5917292 | 2025-04-24 | density |

The `land_parcel_municipality_view` enriches parcel records with their governing municipality, answering questions about which municipality controls which parcels and their zoning characteristics. Parcel `4447034` in the `garden_city` district falls under municipality `1000`.

**View `land_parcel_municipality_view`**

```sql
CREATE VIEW land_parcel_municipality_view AS
SELECT a.id, a.parcel_id, a.zoning_district, a.area_hectares, b.id AS municipality_id, b.municipality_id AS municipality_municipality_id, b.name AS municipality_name
FROM land_parcels a JOIN municipalities b ON a.municipality_id = b.id;
```

| id | parcel_id | zoning_district | area_hectares | municipality_id | municipality_municipality_id | municipality_name |
|---|---|---|---|---|---|---|
| 1000 | 4447034 | garden_city | 10.20 | 1000 | 3744009 | Extended Review |
| 1001 | 325464 | residential | 14.40 | 1001 | 2618554 | Pilot Initiative A |
| 1002 | 3990187 | commercial | 18.60 | 1002 | 198 | Baseline Model |
| 1003 | 110 | green_belt | 22.80 | 1003 | ed58497c-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster |

The `land_parcel_planning_application_view` provides the inverse of the first view—starting from the parcel and showing the associated application. Parcel `325464` (zoning: `residential`, topography: `sloped`) is linked to application `1250196`.

**View `land_parcel_planning_application_view`**

```sql
CREATE VIEW land_parcel_planning_application_view AS
SELECT a.id, a.parcel_id, a.zoning_district, a.area_hectares, b.id AS application_id, b.application_id AS application_application_id, b.status AS application_status
FROM land_parcels a JOIN planning_applications b ON a.planning_application_id = b.id;
```

| id | parcel_id | zoning_district | area_hectares | application_id | application_application_id | application_status |
|---|---|---|---|---|---|---|
| 1000 | 4447034 | garden_city | 10.20 | 1000 | 505997 | submitted |
| 1001 | 325464 | residential | 14.40 | 1001 | 1250196 | under_review |
| 1002 | 3990187 | commercial | 18.60 | 1002 | 124 | objection_raised |
| 1003 | 110 | green_belt | 22.80 | 1003 | IVC20det40 | rejected |

The `housing_unit_development_project_view` joins housing units with their parent projects, enabling unit-level analysis within project context. Unit `39800614` (a `house` with 16 bedrooms, no garden, on floor 10, building height 30) belongs to project `1437597` (`Compact Survey`). Unit `account_pymes_1040` (a `mansion` with 25 bedrooms, garden, floor 25, height 57) is part of project `10207143` (`Seasonal Assessment`).

**View `housing_unit_development_project_view`**

```sql
CREATE VIEW housing_unit_development_project_view AS
SELECT a.unit_id, a.unit_type, a.bedrooms, a.has_garden, b.development_project_id AS project_development_project_id, b.project_id AS project_project_id, b.project_name AS project_project_name
FROM housing_units a JOIN development_projects b ON a.development_project_id = b.development_project_id;
```

| unit_id | unit_type | bedrooms | has_garden | project_development_project_id | project_project_id | project_project_name |
|---|---|---|---|---|---|---|
| 39800614 | house | 16 | false | 100 | 1437597 | Compact Survey |
| 611523 | flat | 19 | true | 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor |
| 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | apartment | 22 | false | 102 | 5006462 | Regional Series A |
| account_pymes_1040 | mansion | 25 | true | 103 | 10207143 | Seasonal Assessment |

The `development_project_land_parcel_view` links projects to their host parcels, answering which land parcel each project occupies. Project `1437597` (`Compact Survey`, 19 units, 51 floors, cost 36.43) is sited on parcel `1000`.

**View `development_project_land_parcel_view`**

```sql
CREATE VIEW development_project_land_parcel_view AS
SELECT a.development_project_id, a.project_id, a.project_name, a.total_units, b.id AS parcel_id, b.parcel_id AS parcel_parcel_id, b.zoning_district AS parcel_zoning_district
FROM development_projects a JOIN land_parcels b ON a.land_parcel_id = b.id;
```

| development_project_id | project_id | project_name | total_units | parcel_id | parcel_parcel_id | parcel_zoning_district |
|---|---|---|---|---|---|---|
| 100 | 1437597 | Compact Survey | 19 | 1000 | 4447034 | garden_city |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | 2 | 1001 | 325464 | residential |
| 102 | 5006462 | Regional Series A | 57 | 1002 | 3990187 | commercial |
| 103 | 10207143 | Seasonal Assessment | 0 | 1003 | 110 | green_belt |

The `development_project_housing_unit_detail_view` provides a project-centric view of its constituent units, useful for capacity and composition analysis. Project `101` (`Legacy Corridor`) contains unit `611523`, a `flat` with 19 bedrooms and a garden on floor 15.

**View `development_project_housing_unit_detail_view`**

```sql
CREATE VIEW development_project_housing_unit_detail_view AS
SELECT a.development_project_id, a.project_id, a.project_name, b.unit_id AS unit_unit_id, b.unit_type AS unit_unit_type, b.bedrooms AS unit_bedrooms
FROM development_projects a
  JOIN projects_units j ON j.development_project_id = a.development_project_id
  JOIN housing_units b ON b.unit_id = j.unit_id;
```

| development_project_id | project_id | project_name | unit_unit_id | unit_unit_type | unit_bedrooms |
|---|---|---|---|---|---|
| 100 | 1437597 | Compact Survey | 39800614 | house | 16 |
| 100 | 1437597 | Compact Survey | 611523 | flat | 19 |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | 611523 | flat | 19 |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | apartment | 22 |
| 102 | 5006462 | Regional Series A | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | apartment | 22 |
| 102 | 5006462 | Regional Series A | account_pymes_1040 | mansion | 25 |
| 103 | 10207143 | Seasonal Assessment | account_pymes_1040 | mansion | 25 |
| 103 | 10207143 | Seasonal Assessment | 39800614 | house | 16 |

The `development_project_infrastructure_detail_view` connects projects to their associated infrastructure, revealing the public amenities planned alongside residential development.

**View `development_project_infrastructure_detail_view`**

```sql
CREATE VIEW development_project_infrastructure_detail_view AS
SELECT a.development_project_id, a.project_id, a.project_name, b.infra_id AS infrastructure_infra_id, b.infra_type AS infrastructure_infra_type, b.capacity AS infrastructure_capacity
FROM development_projects a
  JOIN projects_infrastructures j ON j.development_project_id = a.development_project_id
  JOIN infrastructures b ON b.infra_id = j.infrastructure_infra_id;
```

| development_project_id | project_id | project_name | infrastructure_infra_id | infrastructure_infra_type | infrastructure_capacity |
|---|---|---|---|---|---|
| 100 | 1437597 | Compact Survey | 10449522 | hospital | 32 |
| 100 | 1437597 | Compact Survey | 168539 | school | 41 |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | 168539 | school | 41 |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | 9568467 | clinic | 50 |
| 102 | 5006462 | Regional Series A | 9568467 | clinic | 50 |
| 102 | 5006462 | Regional Series A | 3012834 | road | 59 |
| 103 | 10207143 | Seasonal Assessment | 3012834 | road | 59 |
| 103 | 10207143 | Seasonal Assessment | 10449522 | hospital | 32 |

The `infrastructure_municipality_view` joins infrastructure assets with their governing municipalities, enabling queries about municipal infrastructure portfolios. Infrastructure `10449522` (a `hospital` with capacity 32 and utilization 19.95, condition `adequate`) is managed by municipality `1000`.

**View `infrastructure_municipality_view`**

```sql
CREATE VIEW infrastructure_municipality_view AS
SELECT a.infra_id, a.infra_type, a.capacity, a.current_utilization, b.id AS municipality_id, b.municipality_id AS municipality_municipality_id, b.name AS municipality_name
FROM infrastructures a JOIN municipalities b ON a.municipality_id = b.id;
```

| infra_id | infra_type | capacity | current_utilization | municipality_id | municipality_municipality_id | municipality_name |
|---|---|---|---|---|---|---|
| 10449522 | hospital | 32 | 19.95 | 1000 | 3744009 | Extended Review |
| 168539 | school | 41 | 23.90 | 1001 | 2618554 | Pilot Initiative A |
| 9568467 | clinic | 50 | 27.85 | 1002 | 198 | Baseline Model |
| 3012834 | road | 59 | 31.80 | 1003 | ed58497c-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster |

The `infrastructure_development_project_detail_view` links infrastructure to development projects, showing which projects are supported by which public amenities.

**View `infrastructure_development_project_detail_view`**

```sql
CREATE VIEW infrastructure_development_project_detail_view AS
SELECT a.infra_id, a.infra_type, a.capacity, b.development_project_id AS project_development_project_id, b.project_id AS project_project_id, b.project_name AS project_project_name
FROM infrastructures a
  JOIN infrastructures_projects j ON j.infrastructure_infra_id = a.infra_id
  JOIN development_projects b ON b.development_project_id = j.development_project_id;
```

| infra_id | infra_type | capacity | project_development_project_id | project_project_id | project_project_name |
|---|---|---|---|---|---|
| 10449522 | hospital | 32 | 100 | 1437597 | Compact Survey |
| 10449522 | hospital | 32 | 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor |
| 168539 | school | 41 | 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor |
| 168539 | school | 41 | 102 | 5006462 | Regional Series A |
| 9568467 | clinic | 50 | 102 | 5006462 | Regional Series A |
| 9568467 | clinic | 50 | 103 | 10207143 | Seasonal Assessment |
| 3012834 | road | 59 | 103 | 10207143 | Seasonal Assessment |
| 3012834 | road | 59 | 100 | 1437597 | Compact Survey |

The `infrastructure_land_parcel_view` connects infrastructure to the parcels on which they sit, answering spatial questions about asset location. Infrastructure `168539` (a `school` with capacity 41, utilization 23.90, condition `insufficient`) is located on parcel `1001`.

**View `infrastructure_land_parcel_view`**

```sql
CREATE VIEW infrastructure_land_parcel_view AS
SELECT a.infra_id, a.infra_type, a.capacity, a.current_utilization, b.id AS parcel_id, b.parcel_id AS parcel_parcel_id, b.zoning_district AS parcel_zoning_district
FROM infrastructures a JOIN land_parcels b ON a.land_parcel_id = b.id;
```

| infra_id | infra_type | capacity | current_utilization | parcel_id | parcel_parcel_id | parcel_zoning_district |
|---|---|---|---|---|---|---|
| 10449522 | hospital | 32 | 19.95 | 1000 | 4447034 | garden_city |
| 168539 | school | 41 | 23.90 | 1001 | 325464 | residential |
| 9568467 | clinic | 50 | 27.85 | 1002 | 3990187 | commercial |
| 3012834 | road | 59 | 31.80 | 1003 | 110 | green_belt |

The `public_objection_planning_application_view` joins objections with their target applications, providing a citizen-feedback lens on the planning pipeline. Objection `5917292` (reason: `density`, severity: `minor`) targets application `505997`. Objection `3775` (reason: `inadequate_parking`, severity: `severe`) targets application `124`.

**View `public_objection_planning_application_view`**

```sql
CREATE VIEW public_objection_planning_application_view AS
SELECT a.objection_id, a.submission_date, a.objection_reason, a.severity, b.id AS application_id, b.application_id AS application_application_id, b.status AS application_status
FROM public_objections a JOIN planning_applications b ON a.planning_application_id = b.id;
```

| objection_id | submission_date | objection_reason | severity | application_id | application_application_id | application_status |
|---|---|---|---|---|---|---|
| 5917292 | 2025-04-24 | density | minor | 1000 | 505997 | submitted |
| 5fd80e34-8fcc-11eb-924d-9cd76263cbd0 | 2022-09-08 | lack_of_green_space | moderate | 1001 | 1250196 | under_review |
| 3775 | 2023-02-19 | inadequate_parking | severe | 1002 | 124 | objection_raised |
| bjacobt | 2024-07-03 | infrastructure_strain | minor | 1003 | IVC20det40 | rejected |

The `public_objection_infrastructure_detail_view` links objections to infrastructure concerns, revealing which public amenities are under citizen scrutiny.

**View `public_objection_infrastructure_detail_view`**

```sql
CREATE VIEW public_objection_infrastructure_detail_view AS
SELECT a.objection_id, a.submission_date, a.objection_reason, b.infra_id AS infrastructure_infra_id, b.infra_type AS infrastructure_infra_type, b.capacity AS infrastructure_capacity
FROM public_objections a
  JOIN objections_infrastructures j ON j.objection_id = a.objection_id
  JOIN infrastructures b ON b.infra_id = j.infrastructure_infra_id;
```

| objection_id | submission_date | objection_reason | infrastructure_infra_id | infrastructure_infra_type | infrastructure_capacity |
|---|---|---|---|---|---|
| 5917292 | 2025-04-24 | density | 10449522 | hospital | 32 |
| 5917292 | 2025-04-24 | density | 168539 | school | 41 |
| 5fd80e34-8fcc-11eb-924d-9cd76263cbd0 | 2022-09-08 | lack_of_green_space | 168539 | school | 41 |
| 5fd80e34-8fcc-11eb-924d-9cd76263cbd0 | 2022-09-08 | lack_of_green_space | 9568467 | clinic | 50 |
| 3775 | 2023-02-19 | inadequate_parking | 9568467 | clinic | 50 |
| 3775 | 2023-02-19 | inadequate_parking | 3012834 | road | 59 |
| bjacobt | 2024-07-03 | infrastructure_strain | 3012834 | road | 59 |
| bjacobt | 2024-07-03 | infrastructure_strain | 10449522 | hospital | 32 |

The `municipality_land_parcel_detail_view` provides a municipality-centric view of its parcel portfolio, including zoning and land-use characteristics. Municipality `1000` oversees parcel `4447034` (zoning: `garden_city`, land use: `agricultural`, area: 10.20 hectares).

**View `municipality_land_parcel_detail_view`**

```sql
CREATE VIEW municipality_land_parcel_detail_view AS
SELECT a.id, a.municipality_id, a.name, b.id AS parcel_id, b.parcel_id AS parcel_parcel_id, b.zoning_district AS parcel_zoning_district
FROM municipalities a
  JOIN municipalities_parcels j ON j.municipality_id = a.id
  JOIN land_parcels b ON b.id = j.land_parcel_id;
```

| id | municipality_id | name | parcel_id | parcel_parcel_id | parcel_zoning_district |
|---|---|---|---|---|---|
| 1000 | 3744009 | Extended Review | 1000 | 4447034 | garden_city |
| 1000 | 3744009 | Extended Review | 1001 | 325464 | residential |
| 1001 | 2618554 | Pilot Initiative A | 1001 | 325464 | residential |
| 1001 | 2618554 | Pilot Initiative A | 1002 | 3990187 | commercial |
| 1002 | 198 | Baseline Model | 1002 | 3990187 | commercial |
| 1002 | 198 | Baseline Model | 1003 | 110 | green_belt |
| 1003 | ed58497c-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 1003 | 110 | green_belt |
| 1003 | ed58497c-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 1000 | 4447034 | garden_city |

The `municipality_local_authority_view` connects municipalities to their local authorities, clarifying the administrative reporting structure.

**View `municipality_local_authority_view`**

```sql
CREATE VIEW municipality_local_authority_view AS
SELECT a.id, a.municipality_id, a.name, a.population, b.authority_id AS authority_authority_id, b.authority_name AS authority_authority_name, b.jurisdiction AS authority_jurisdiction
FROM municipalities a JOIN local_authorities b ON a.authority_id = b.authority_id;
```

| id | municipality_id | name | population | authority_authority_id | authority_authority_name | authority_jurisdiction |
|---|---|---|---|---|---|---|
| 1000 | 3744009 | Extended Review | 42 | 974930 | Sean Green | regional-jurisdic-30 |
| 1001 | 2618554 | Pilot Initiative A | 49 | 5917289 | Elizabeth Woods | legacy-jurisdic-31 |
| 1002 | 198 | Baseline Model | 56 | 8843762 | Kimberly Smith | compact-jurisdic-32 |
| 1003 | ed58497c-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 63 | 2087738 | Kimberly Smith | composite-jurisdic-33 |

The `municipality_infrastructure_detail_view` shows each municipality's infrastructure assets with their capacity and condition metrics. Municipality `1002` manages infrastructure `9568467` (a `clinic` with capacity 50, utilization 27.85, condition `overloaded`).

**View `municipality_infrastructure_detail_view`**

```sql
CREATE VIEW municipality_infrastructure_detail_view AS
SELECT a.id, a.municipality_id, a.name, b.infra_id AS infrastructure_infra_id, b.infra_type AS infrastructure_infra_type, b.capacity AS infrastructure_capacity
FROM municipalities a
  JOIN municipalities_infrastructures j ON j.municipality_id = a.id
  JOIN infrastructures b ON b.infra_id = j.infrastructure_infra_id;
```

| id | municipality_id | name | infrastructure_infra_id | infrastructure_infra_type | infrastructure_capacity |
|---|---|---|---|---|---|
| 1000 | 3744009 | Extended Review | 10449522 | hospital | 32 |
| 1000 | 3744009 | Extended Review | 168539 | school | 41 |
| 1001 | 2618554 | Pilot Initiative A | 168539 | school | 41 |
| 1001 | 2618554 | Pilot Initiative A | 9568467 | clinic | 50 |
| 1002 | 198 | Baseline Model | 9568467 | clinic | 50 |
| 1002 | 198 | Baseline Model | 3012834 | road | 59 |
| 1003 | ed58497c-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 3012834 | road | 59 |
| 1003 | ed58497c-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 10449522 | hospital | 32 |

The `local_authority_planning_application_detail_view` provides an authority-centric view of the applications it processes, including status and proposal type. Authority `974930` handles application `505997` (status: `submitted`, type: `residential`).

**View `local_authority_planning_application_detail_view`**

```sql
CREATE VIEW local_authority_planning_application_detail_view AS
SELECT a.authority_id, a.authority_name, a.jurisdiction, b.id AS application_id, b.application_id AS application_application_id, b.status AS application_status
FROM local_authorities a
  JOIN authorities_applications j ON j.authority_id = a.authority_id
  JOIN planning_applications b ON b.id = j.planning_application_id;
```

| authority_id | authority_name | jurisdiction | application_id | application_application_id | application_status |
|---|---|---|---|---|---|
| 974930 | Sean Green | regional-jurisdic-30 | 1000 | 505997 | submitted |
| 974930 | Sean Green | regional-jurisdic-30 | 1001 | 1250196 | under_review |
| 5917289 | Elizabeth Woods | legacy-jurisdic-31 | 1001 | 1250196 | under_review |
| 5917289 | Elizabeth Woods | legacy-jurisdic-31 | 1002 | 124 | objection_raised |
| 8843762 | Kimberly Smith | compact-jurisdic-32 | 1002 | 124 | objection_raised |
| 8843762 | Kimberly Smith | compact-jurisdic-32 | 1003 | IVC20det40 | rejected |
| 2087738 | Kimberly Smith | composite-jurisdic-33 | 1003 | IVC20det40 | rejected |
| 2087738 | Kimberly Smith | composite-jurisdic-33 | 1000 | 505997 | submitted |

The `local_authority_municipality_view` links local authorities to their parent municipalities, completing the administrative hierarchy.

**View `local_authority_municipality_view`**

```sql
CREATE VIEW local_authority_municipality_view AS
SELECT a.authority_id, a.authority_name, a.jurisdiction, a.decision, b.id AS municipality_id, b.municipality_id AS municipality_municipality_id, b.name AS municipality_name
FROM local_authorities a JOIN municipalities b ON a.municipality_id = b.id;
```

| authority_id | authority_name | jurisdiction | decision | municipality_id | municipality_municipality_id | municipality_name |
|---|---|---|---|---|---|---|
| 974930 | Sean Green | regional-jurisdic-30 | pending | 1000 | 3744009 | Extended Review |
| 5917289 | Elizabeth Woods | legacy-jurisdic-31 | approved | 1001 | 2618554 | Pilot Initiative A |
| 8843762 | Kimberly Smith | compact-jurisdic-32 | rejected | 1002 | 198 | Baseline Model |
| 2087738 | Kimberly Smith | composite-jurisdic-33 | requesting_changes | 1003 | ed58497c-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster |

### Synthesis

The schema models urban planning as a layered domain: municipalities govern local authorities and land parcels; parcels host planning applications, development projects, and infrastructure; applications attract public objections; and projects contain housing units and infrastructure. The base tables enforce referential integrity through foreign keys, while junction tables resolve the many-to-many relationships that arise when a single entity participates in multiple associations. The view layer materializes the most common analytical perspectives—application-parcel pairs, authority-application assignments, objection details, project-unit compositions, and municipality asset inventories—allowing downstream consumers to query domain facts without reconstructing joins. This separation of concerns between the normalized store and the denormalized views mirrors the distinction between the canonical data model and the analytical lenses through which planners, regulators, and citizens interact with the system.