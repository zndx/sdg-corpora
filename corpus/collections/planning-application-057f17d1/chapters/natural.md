## Urban Development Planning and Infrastructure Coordination

Municipal governance in modern urban environments requires the systematic tracking of land use decisions, construction projects, and public engagement. Every development begins as a planning application submitted to a local authority, which then evaluates the proposal against zoning regulations, infrastructure capacity, and community feedback. The records maintained across these systems form an interconnected web: land parcels carry zoning designations and topographical characteristics; planning applications propose specific building dimensions and use types; development projects aggregate housing units and infrastructure investments; and public objections capture community concerns that can alter project trajectories. Understanding how these elements relate is essential for planners, municipal officials, and infrastructure managers who must coordinate decisions across jurisdictions.

The foundation of this domain rests on eight core record types that capture the essential entities of urban development.

**Table `planning_applications`**

| id | application_id | status | submission_date | proposal_type | total_floor_area | total_height | land_parcel_id | authority_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 505997 | submitted | 2025-04-24 | residential | 6.45 | 10 | 1000 | 974930 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 1250196 | under_review | 2022-09-08 | commercial | 9.90 | 7 | 1001 | 5917289 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 124 | objection_raised | 2023-02-19 | mixed_use | 13.35 | 0 | 1002 | 8843762 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | IVC20det40 | rejected | 2024-07-03 | infrastructure | 16.80 | 11 | 1003 | 2087738 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Planning applications represent the formal proposals submitted by developers or landowners seeking approval to modify land use or construct new structures. Each application carries a unique identifier, a status reflecting its current position in the review pipeline, and technical specifications including total floor area and building height. The proposal type categorizes the intended use—residential, commercial, mixed_use, or infrastructure—and the application is linked to a specific land parcel and the local authority responsible for its review. In the sample data, application 505997 proposes a residential structure with 6.45 units of floor area and a height of 10 on parcel 1000, currently in submitted status. Application IVC20det40, classified as infrastructure with a floor area of 16.80 and height of 11, has been rejected by authority 2087738. The status field tracks the lifecycle from initial submission through under_review, objection_raised, and ultimately rejected or approved outcomes.

**Table `land_parcels`**

| id | parcel_id | zoning_district | area_hectares | current_land_use | topography | municipality_id | planning_application_id |
|---|---|---|---|---|---|---|---|
| 1000 | 4447034 | garden_city | 10.20 | agricultural | flat | 1000 | 1000 |
| 1001 | 325464 | residential | 14.40 | vacant | sloped | 1001 | 1001 |
| 1002 | 3990187 | commercial | 18.60 | residential | hilly | 1002 | 1002 |
| 1003 | 110 | green_belt | 22.80 | commercial | flat | 1003 | 1003 |

Land parcels define the physical sites upon which development occurs. Each parcel is characterized by its zoning district designation—such as garden_city, residential, commercial, or green_belt—its area in hectares, its current land use, and its topography, which ranges from flat to sloped to hilly. These attributes directly influence what types of planning applications are permissible. Parcel 4447034, a 10.20-hectare agricultural site in the garden_city district with flat topography, is associated with planning application 1000. Parcel 3990187, covering 18.60 hectares in a commercial district with hilly terrain, currently serves residential use and is linked to application 1002. The municipality_id field anchors each parcel to its governing jurisdiction.

**Table `housing_units`**

| unit_id | unit_type | bedrooms | has_garden | floor_level | building_height | development_project_id |
|---|---|---|---|---|---|---|
| 39800614 | house | 16 | false | 10 | 30 | 100 |
| 611523 | flat | 19 | true | 15 | 39 | 101 |
| 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | apartment | 22 | false | 20 | 48 | 102 |
| account_pymes_1040 | mansion | 25 | true | 25 | 57 | 103 |

Housing units are the individual residential components within larger development projects. Each unit is classified by type—house, flat, apartment, or mansion—and described by its bedroom count, garden access, floor level, and building height. The unit identifiers vary in format, ranging from numeric strings like 39800614 to UUIDs such as 57dbb53c-8fcc-11eb-924d-9cd76263cbd0, and even alphanumeric identifiers like account_pymes_1040. Unit 39800614 is a house with 16 bedrooms on floor level 10 within a building of height 30, part of development project 100. Unit account_pymes_1040, a mansion with 25 bedrooms on floor level 25 in a building of height 57, belongs to project 103 and includes garden access.

**Table `development_projects`**

| development_project_id | project_id | project_name | total_units | total_floors | estimated_cost | start_date | land_parcel_id |
|---|---|---|---|---|---|---|---|
| 100 | 1437597 | Compact Survey | 19 | 51 | 36.43 | 2022-09-05 | 1000 |
| 101 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | 2 | 29 | 17.41 | 2023-02-16 | 1001 |
| 102 | 5006462 | Regional Series A | 57 | 57 | 12.74 | 2024-07-27 | 1002 |
| 103 | 10207143 | Seasonal Assessment | 0 | 38 | 13.49 | 2025-12-11 | 1003 |

Development projects aggregate housing units and infrastructure investments into coherent construction initiatives. Each project carries a project_id, a human-readable project_name, and aggregate metrics including total_units, total_floors, and estimated_cost. The start_date marks when construction commenced or is scheduled to commence. Project 1437597, named Compact Survey, plans 19 units across 51 floors with an estimated cost of 36.43, beginning on 2022-09-05 on parcel 1000. Project df5a6648-8fd1-11eb-924d-9cd76263cbd0, Legacy Corridor, contains only 2 units across 29 floors with a cost of 17.41, starting 2023-02-16 on parcel 1001. Project 10207143, Seasonal Assessment, lists zero total units but 38 floors and a cost of 13.49, with a start date of 2025-12-11 on parcel 1003.

**Table `infrastructures`**

| infra_id | infra_type | capacity | current_utilization | condition | municipality_id | land_parcel_id |
|---|---|---|---|---|---|---|
| 10449522 | hospital | 32 | 19.95 | adequate | 1000 | 1000 |
| 168539 | school | 41 | 23.90 | insufficient | 1001 | 1001 |
| 9568467 | clinic | 50 | 27.85 | overloaded | 1002 | 1002 |
| 3012834 | road | 59 | 31.80 | new | 1003 | 1003 |

Infrastructure records document public facilities and their operational status. Each infrastructure item has an infra_id, a type such as hospital, school, clinic, or road, and capacity metrics including current_utilization and condition. The condition field uses categorical values—adequate, insufficient, overloaded, or new—to describe the facility's state. Infrastructure 10449522 is a hospital with capacity 32 and utilization of 19.95 in adequate condition, located in municipality 1000 on parcel 1000. Infrastructure 168539, a school with capacity 41 and utilization of 23.90, is rated insufficient and sits in municipality 1001 on parcel 1001. Infrastructure 9568467, a clinic with capacity 50 and utilization of 27.85, is overloaded and located in municipality 1002 on parcel 1002.

**Table `public_objections`**

| objection_id | submission_date | objection_reason | severity | is_formal | planning_application_id |
|---|---|---|---|---|---|
| 5917292 | 2025-04-24 | density | minor | false | 1000 |
| 5fd80e34-8fcc-11eb-924d-9cd76263cbd0 | 2022-09-08 | lack_of_green_space | moderate | true | 1001 |
| 3775 | 2023-02-19 | inadequate_parking | severe | false | 1002 |
| bjacobt | 2024-07-03 | infrastructure_strain | minor | true | 1003 |

Public objections capture community feedback submitted during the planning review process. Each objection has an objection_id, a submission_date, an objection_reason such as density, lack_of_green_space, inadequate_parking, or infrastructure_strain, a severity level of minor, moderate, or severe, and an is_formal flag indicating whether the objection follows formal procedural requirements. Objection 5917292 cites density as a minor concern and is not formal, submitted on 2025-04-24 against planning application 1000. Objection 3775 raises inadequate_parking as a severe issue, also informal, submitted on 2023-02-19 against application 1002. Objection bjacobt addresses infrastructure_strain as a minor but formal objection against application 1003, submitted on 2024-07-03.

**Table `municipalities`**

| id | municipality_id | name | population | density | garden_city_status | authority_id |
|---|---|---|---|---|---|---|
| 1000 | 3744009 | Extended Review | 42 | 3.45 | false | 974930 |
| 1001 | 2618554 | Pilot Initiative A | 49 | 5.90 | true | 5917289 |
| 1002 | 198 | Baseline Model | 56 | 8.35 | false | 8843762 |
| 1003 | ed58497c-8fcc-11eb-924d-9cd76263cbd0 | Distributed Cluster | 63 | 10.80 | true | 2087738 |

Municipalities serve as the primary geographic and administrative divisions within the planning domain. Each municipality has a unique identifier and name, and serves as the jurisdictional container for land parcels, infrastructure, and development oversight. The municipality_id field in land_parcels, infrastructures, and other tables references the governing municipality.

**Table `local_authorities`**

| authority_id | authority_name | jurisdiction | decision | municipality_id |
|---|---|---|---|---|
| 974930 | Sean Green | regional-jurisdic-30 | pending | 1000 |
| 5917289 | Elizabeth Woods | legacy-jurisdic-31 | approved | 1001 |
| 8843762 | Kimberly Smith | compact-jurisdic-32 | rejected | 1002 |
| 2087738 | Kimberly Smith | composite-jurisdic-33 | requesting_changes | 1003 |

Local authorities are the administrative bodies responsible for reviewing and approving planning applications. Each authority has a unique identifier and name, and the authority_id in planning_applications links each proposal to its reviewing body. Authority 974930 reviews application 505997, while authority 5917289 handles application 1250196.

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

The applications_objections table records the explicit linkage between planning applications and the public objections raised against them, enabling the tracking of which proposals face community resistance and the nature of that resistance.

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

The projects_units table establishes the many-to-many relationship between development projects and their constituent housing units, allowing a single project to contain multiple unit types and a unit to potentially appear across related project phases.

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

The projects_infrastructures table connects development projects to the infrastructure investments they require or generate, documenting which facilities are planned as part of each construction initiative.

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

The infrastructures_projects table provides the reverse linkage from infrastructure to the development projects that depend on or contribute to it, supporting capacity planning and impact analysis.

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

The objections_infrastructures table links public objections to specific infrastructure concerns, enabling analysts to identify which facilities are generating the most community pushback and at what severity levels.

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

The municipalities_parcels table explicitly records the jurisdictional relationship between municipalities and their contained land parcels, supplementing the direct municipality_id foreign key in the land_parcels table with a dedicated association record.

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

The municipalities_infrastructures table documents which infrastructure facilities fall under each municipality's jurisdiction, supporting resource allocation and maintenance planning across the municipal network.

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

The authorities_applications table formalizes the relationship between local authorities and the planning applications they review, providing an auditable trail of which body is responsible for each proposal in the pipeline.

With the core entities established, the domain's relational structure becomes apparent through a series of joined views that answer specific operational questions. Each view combines records from multiple tables to produce a unified perspective on a particular aspect of the planning process.

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

This view joins planning applications with their associated land parcels, answering the question of what physical site a proposal targets and whether the site's zoning and topography align with the proposed use. A row linking application 505997 (residential, floor area 6.45) to parcel 4447034 (garden_city zoning, 10.20 hectares, flat topography) reveals a proposal situated on a flat agricultural site within a garden_city district—a configuration that planners would evaluate for compatibility with the residential intent.

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

By connecting planning applications to their reviewing local authorities, this view clarifies jurisdictional responsibility. Application 1250196 (commercial, under_review) is associated with authority 5917289, indicating which administrative body holds the proposal for evaluation. This linkage is critical for tracking review timelines and accountability.

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

This view merges planning applications with their associated public objections, providing a comprehensive picture of community response. Application 1002 (mixed_use, objection_raised status) is linked to objection 3775 (inadequate_parking, severe severity, informal), demonstrating how a severe parking concern has escalated the application's status to objection_raised.

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

Joining land parcels with their governing municipalities answers the question of which jurisdiction controls a given site. Parcel 3990187 (commercial zoning, 18.60 hectares, hilly) is managed by municipality 1002, establishing the regulatory framework within which any planning application on that parcel must operate.

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

This view presents land parcels alongside their linked planning applications, enabling planners to see all active proposals for a given site. Parcel 1003 (green_belt, 22.80 hectares, flat) is associated with application 1003 (infrastructure, rejected), showing how a green_belt site received an infrastructure proposal that was ultimately denied.

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

This view connects individual housing units to their parent development projects, clarifying the composition of each initiative. Unit 611523 (flat, 19 bedrooms, with garden, floor level 15) belongs to development project 101 (Legacy Corridor), illustrating how a single high-bedroom flat contributes to a project that totals only 2 units across 29 floors.

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

By linking development projects to their host land parcels, this view reveals the spatial footprint of each construction initiative. Project 1437597 (Compact Survey, 19 units, 51 floors) is built on parcel 1000, a 10.20-hectare garden_city site, demonstrating how a dense multi-floor project occupies a relatively compact parcel.

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

This view provides a detailed breakdown of housing units within each development project, showing unit types, bedroom counts, and building specifications. Project 102 (Regional Series A, 57 units, 57 floors) contains unit 57dbb53c-8fcc-11eb-924d-9cd76263cbd0, an apartment with 22 bedrooms on floor level 20 in a building of height 48, illustrating the scale of a large mixed-use development.

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

This view associates development projects with their required or generated infrastructure, enabling capacity planning. Project 103 (Seasonal Assessment, 0 units, 38 floors) is linked to infrastructure investments that support its construction, even though the project lists zero housing units—suggesting a non-residential or preparatory development phase.

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

Joining infrastructure records with their governing municipalities clarifies which jurisdiction is responsible for each facility. Infrastructure 168539 (school, capacity 41, insufficient condition) is managed by municipality 1001, indicating that this underperforming school falls within that municipality's maintenance and upgrade responsibilities.

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

This view connects infrastructure to the development projects that depend on it, supporting impact analysis. Infrastructure 3012834 (road, capacity 59, new condition) serves development projects in its vicinity, and its new condition suggests recent construction aligned with a development phase.

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

By linking infrastructure to land parcels, this view reveals the spatial distribution of public facilities. Infrastructure 9568467 (clinic, capacity 50, overloaded) is located on parcel 1002, a 18.60-hectare commercial district site, indicating that the clinic serves a densely used commercial area and its current overloaded condition may warrant expansion.

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

This view pairs public objections with their target planning applications, providing a clear audit trail of community concerns. Objection 5fd80e34-8fcc-11eb-924d-9cd76263cbd0 (lack_of_green_space, moderate severity, formal) is directed at planning application 1001 (commercial, under_review), showing how a formal objection regarding green space has been lodged against a commercial proposal currently under review.

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

This view connects public objections to infrastructure-related concerns, enabling targeted analysis of facility-specific pushback. Objection bjacobt (infrastructure_strain, minor severity, formal) against application 1003 relates to infrastructure capacity concerns, suggesting that the rejected infrastructure proposal on parcel 1003 may have triggered community anxiety about strain on existing facilities.

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

This view presents municipalities alongside their contained land parcels, providing a jurisdictional inventory. Municipality 1000 contains parcel 4447034 (garden_city, 10.20 hectares, agricultural), establishing the scope of land under that municipality's planning authority.

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

By linking municipalities to their local authorities, this view clarifies the administrative hierarchy. Municipality 1001 is served by local authority 5917289, which reviews planning applications within that jurisdiction, including application 1250196.

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

This view associates municipalities with their infrastructure assets, supporting resource planning. Municipality 1002 contains infrastructure 9568467 (clinic, overloaded), highlighting a facility that requires attention and may influence future development decisions in that jurisdiction.

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

This view presents local authorities alongside the planning applications they review, providing an accountability map. Local authority 8843762 reviews application 124 (mixed_use, objection_raised), demonstrating how a single authority manages proposals at various stages of the review pipeline.

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

By connecting local authorities to their parent municipalities, this view completes the administrative hierarchy. Local authority 2087738 operates within municipality 1003, which contains parcel 1003 (green_belt, 22.80 hectares) and infrastructure 3012834 (road, new condition).

The planning domain operates as an integrated system where land use decisions, construction projects, infrastructure capacity, and community feedback continuously interact. A planning application on a garden_city parcel triggers review by a local authority, which may encounter public objections about density or parking. If approved, the application feeds into a development project that aggregates housing units and requires infrastructure investment. That infrastructure, in turn, serves the municipality's population and may itself become the subject of future objections. The relational structure of these records—linking parcels to applications, projects to units, infrastructure to municipalities—enables planners to trace the full lifecycle of urban development from initial proposal through community engagement to final construction outcomes. Effective governance depends on maintaining accurate records across all these dimensions and using the joined perspectives they provide to make informed, coordinated decisions.