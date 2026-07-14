The alpine conservation landscape operates as a multi-layered system of protected territories, ecological corridors, and cross-border governance structures. At its core lie designated protected areas—tracts of land managed under varying degrees of legal protection, each administered by a specific entity and nested within broader alpine regions. These regions, in turn, span national boundaries and involve multiple member states, creating a jurisdictional tapestry that demands coordinated ecological planning. Transalpine ecological networks stitch these territories together through defined corridors, while ALPARC organizations serve as the coordinating bodies that link protected areas to joint European projects, professional events, and the personnel who lead them. Understanding how these entities relate requires examining both the individual records and the composite views that join them into coherent operational narratives.

## Protected Territories and Alpine Jurisdictions

The foundation of the conservation architecture is the set of protected areas, each uniquely identified and characterized by its size, establishment date, and level of protection.

**Table `protected_areas`**

| protected_area_id | identifier | name | area_hectares | established_date | protection_level | administering_entity | is_a_l_p_a_r_c_member | alpine_region_id | transalpine_ecological_network_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | IDE-2086 | Extended Review | 10.20 | 2024-03-27 | National Park | primary-administ-22 | false | 1000 | 1 |
| 101 | IDE-2091 | Pilot Initiative A | 14.40 | 2025-08-11 | Nature Reserve | adaptive-administ-23 | true | 1001 | 2 |
| 102 | IDE-2096 | Baseline Model | 18.60 | 2022-01-22 | Landscape Protection Area | distributed-administ-24 | false | 1002 | 3 |
| 103 | IDE-2101 | Distributed Cluster | 22.80 | 2023-06-06 | Biosphere Reserve | baseline-administ-25 | true | 1003 | 4 |

Consider the record for identifier `IDE-2086`, named "Extended Review," which covers 10.20 hectares and was established on 2024-03-27 under National Park status. Its administering entity, `primary-administ-22`, operates it as a non-ALPARC member site within alpine region 1000 and transalpine ecological network 1. By contrast, `IDE-2091`, "Pilot Initiative A," spans 14.40 hectares, carries Nature Reserve designation, and is managed by `adaptive-administ-23` as an ALPARC member site nested in region 1001 and network 2. The remaining entries—`IDE-2096` ("Baseline Model," 18.60 hectares, Landscape Protection Area) and `IDE-2101` ("Distributed Cluster," 22.80 hectares, Biosphere Reserve)—follow the same structural pattern, each anchoring a specific parcel of conserved land to a geographic region and an ecological network.

These protected areas do not exist in isolation; they are geographically embedded within alpine regions that define the broader territorial context.

**Table `alpine_regions`**

| id | region_code | total_area_hectares | member_states | perimeter_definition_date |
|---|---|---|---|---|
| 1000 | 1562837 | 16.95 | France | 2024-11-07 |
| 1001 | 6564391 | 20.90 | Italy | 2025-04-18 |
| 1002 | 778560 | 24.85 | Germany | 2022-09-02 |
| 1003 | 8667ec1da10c4a0293d91388b49bc77c | 28.80 | Austria | 2023-02-13 |

Region 1000, coded `1562837`, encompasses 16.95 hectares and falls under French jurisdiction, with its perimeter formally defined on 2024-11-07. Region 1001 (`6564391`) covers 20.90 hectares in Italy, delimited on 2025-04-18. Region 1002 (`778560`) spans 24.85 hectares in Germany, established on 2022-09-02, while region 1003 (`8667ec1da10c4a0293d91388b49bc77c`) covers the largest tract at 28.80 hectares in Austria, with its boundary set on 2023-02-13. The perimeter definition dates reveal a staggered timeline of territorial formalization, with Germany's region predating France's by nearly two years.

The linkage between protected areas and alpine regions is captured in the `regions_areas` table, which records which protected areas fall within which alpine regions.

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

This association table enables queries that answer questions such as "which protected areas belong to region 1000?" or "what is the total conserved area within the French alpine jurisdiction?" The join between `protected_areas` and `alpine_regions` through this intermediary produces a composite view that pairs each protected area with its full regional context.

## Transalpine Ecological Networks and ALPARC Coordination

Beyond individual protected areas, the conservation strategy extends to transalpine ecological networks—structured corridors that connect habitats across borders.

**Table `transalpine_ecological_networks`**

| id | network_id | name | established_date | total_corridor_length_km | status | coordinating_entity | a_l_p_a_r_c_organization_id |
|---|---|---|---|---|---|---|---|
| 1 | e6196808-8fd1-11eb-924d-9cd76263cbd0 | Extended Review | 2024-03-27 | 0.5291620600000001 | Planned | regional-coordina-42 | Shell Oil |
| 2 | 7441146 | Pilot Initiative A | 2025-08-11 | 1.37 | Active | legacy-coordina-43 | GlobalPlatform Inc. |
| 3 | 8387535 | Baseline Model | 2022-01-22 | 0.6 | Evaluated | compact-coordina-44 | Whatsapp Inc. |
| 4 | 6589 | Distributed Cluster | 2023-06-06 | 0.4827489 | Decommissioned | composite-coordina-45 | American Institutes for Research |

Network `e6196808-8fd1-11eb-924d-9cd76263cbd0`, also named "Extended Review," was established on 2024-03-27 and spans a total corridor length of approximately 0.53 kilometers. It is currently in a Planned status, coordinated by `regional-coordina-42`, and associated with the ALPARC organization Shell Oil. Network 2, identified by the numeric code `7441146` and titled "Pilot Initiative A," covers 1.37 kilometers of corridor, holds Active status, and is coordinated by `legacy-coordina-43` under GlobalPlatform Inc. Network 3 (`8387535`, "Baseline Model") has 0.6 kilometers of corridor, is in Evaluated status, and falls under Whatsapp Inc. The final network, `6589` ("Distributed Cluster"), spans 0.48 kilometers, is Decommissioned, and is managed by American Institutes for Research.

The ALPARC organizations themselves serve as the institutional backbone of this coordination framework.

**Table `a_l_p_a_r_cs`**

| organization_id | name | founded_date | headquarters_city | headquarters_country | total_member_areas | coverage_percentage | transalpine_ecological_network_id | project_code | project_leader_id | professional_event_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Shell Oil | Extended Review | 2024-03-15 | seasonal-headquar-83 | regional-headquar-42 | 3 | 2.45 | 1 | IVC20det15 | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| GlobalPlatform Inc. | Pilot Initiative A | 2025-08-26 | regional-headquar-84 | legacy-headquar-43 | 9 | 4.90 | 2 | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| Whatsapp Inc. | Baseline Model | 2022-01-10 | legacy-headquar-85 | compact-headquar-44 | 14 | 7.35 | 3 | 324 | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| American Institutes for Research | Distributed Cluster | 2023-06-21 | compact-headquar-86 | composite-headquar-45 | 6 | 9.80 | 4 | template_ivacode_pagata_20det50 | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Shell Oil, headquartered in `seasonal-headquar-83` within the regional headquarters zone `regional-headquar-42`, was founded on 2024-03-15 and currently oversees 3 member areas, representing 2.45 percent coverage. It is linked to transalpine ecological network 1, carries project code `IVC20det15`, and is associated with project leader 1000 and professional event 1. GlobalPlatform Inc. (founded 2025-08-26, headquartered at `regional-headquar-84`) manages 9 member areas at 4.90 percent coverage, connects to network 2, and holds project code `8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3`. Whatsapp Inc. (founded 2022-01-10, 14 member areas, 7.35 percent coverage) and American Institutes for Research (founded 2023-06-21, 6 member areas, 9.80 percent coverage) complete the quartet, each anchoring a distinct network and project portfolio.

The `networks_areas` table records the association between protected areas and transalpine ecological networks, enabling queries that determine which protected territories contribute to which corridor systems.

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

Similarly, the `projects_areas` table links protected areas to joint European projects, answering the operational question of which conserved parcels are directly involved in funded initiatives.

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

## Joint European Projects and Project Leadership

The financial and operational engine of the conservation framework is the portfolio of joint European projects, each with defined budgets, timelines, and deliverable targets.

**Table `joint_european_projects`**

| project_code | title | start_date | end_date | funding_source | budget_euros | status | deliverable_count | a_l_p_a_r_c_organization_id | project_leader_id |
|---|---|---|---|---|---|---|---|---|---|
| IVC20det15 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | baseline-funding-73 | 11.11 | Proposed | 1 | Shell Oil | 1000 |
| 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | pilot-funding-74 | 19.72 | Active | 38 | GlobalPlatform Inc. | 1001 |
| 324 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | extended-funding-75 | 43.25 | Completed | 27 | Whatsapp Inc. | 1002 |
| template_ivacode_pagata_20det50 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | integrated-funding-76 | 17.12 | Suspended | 75 | American Institutes for Research | 1003 |

Project `IVC20det15`, titled "Compact Initiative," carries a budget of 11.11 euros and is funded by `baseline-funding-73`. It is in Proposed status with a single deliverable, assigned to ALPARC organization Shell Oil and project leader 1000. The project "Legacy Model" (`8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3`) is the most substantial in terms of deliverables (38) and budget (19.72 euros), funded by `pilot-funding-74`, and is currently Active under GlobalPlatform Inc. and leader 1001. "Regional Cluster A" (`324`) has the largest budget at 43.25 euros, is Completed, and involves 27 deliverables under Whatsapp Inc. and leader 1002. "Seasonal Review" (`template_ivacode_pagata_20det50`) is Suspended, carries 75 deliverables, and is managed by American Institutes for Research and leader 1003.

The personnel who direct these projects are recorded in the project leaders table.

**Table `project_leaders`**

| id | employee_id | full_name | contract_start_date | contract_end_date | weekly_hours | primary_language | secondary_language | has_driving_license | years_experience | a_l_p_a_r_c_organization_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Norma Fisher | Theodore Mcgrath | 2022-01-26 | 2025-12-07 | 43 | French | pilot-secondar-32 | false | 16 | Shell Oil |
| 1001 | Tasha Rodriguez | Account Name | 2023-06-10 | 2022-05-18 | 51 | Italian | extended-secondar-33 | true | 22 | GlobalPlatform Inc. |
| 1002 | Theodore Mcgrath | Saipan International Airport | 2024-11-21 | 2023-10-02 | 59 | German | integrated-secondar-34 | false | 28 | Whatsapp Inc. |
| 1003 | Peter Mcdowell | Norma Fisher | 2025-04-05 | 2024-03-13 | 67 | Slovene | seasonal-secondar-35 | true | 34 | American Institutes for Research |

Leader 1000, Norma Fisher (employee ID `Theodore Mcgrath`), holds a contract running from 2022-01-26 to 2025-12-07 with 43 weekly hours, speaks French as a primary language, and has 16 years of experience. Leader 1001, Tasha Rodriguez (employee ID `Account Name`), works 51 hours weekly, speaks Italian, holds a driving license, and brings 22 years of experience. Leader 1002, Theodore Mcgrath (employee ID `Saipan International Airport`), dedicates 59 hours weekly, speaks German, and has 28 years of experience. Leader 1003, Peter Mcdowell (employee ID `Norma Fisher`), works the longest at 67 hours weekly, speaks Slovene, holds a driving license, and has 34 years of experience—the most of any leader in the roster.

The `leaders_projects` table records the assignment of project leaders to joint European projects, enabling queries that determine which personnel are responsible for which funded initiatives.

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

## Professional Events and Community Engagement

Professional events serve as the connective tissue between ALPARC organizations, European projects, and project leaders, providing forums for knowledge exchange and coordination.

**Table `professional_events`**

| id | event_id | title | event_type | start_date | end_date | location_city | location_country | participant_count | status | topic | a_l_p_a_r_c_organization_id | project_code | project_leader_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | Compact Initiative | Conference | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | seasonal-location-23 | adaptive-location-47 | 100 | Planned | distributed-topic-60 | Shell Oil | IVC20det15 | 1000 |
| 2 | 168535 | Legacy Model | Workshop | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | regional-location-24 | distributed-location-48 | 27 | Ongoing | baseline-topic-61 | GlobalPlatform Inc. | 8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3 | 1001 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Regional Cluster A | Symposium | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | legacy-location-25 | baseline-location-49 | 23 | Completed | pilot-topic-62 | Whatsapp Inc. | 324 | 1002 |
| 4 | 1186089 | Seasonal Review | Meeting | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | compact-location-26 | pilot-location-50 | 34 | Cancelled | extended-topic-63 | American Institutes for Research | template_ivacode_pagata_20det50 | 1003 |

Event 1, titled "Extended Review," occurred on 2024-03-27 at venue `event-venue-83` in location `event-location-83`, with a capacity of 100 attendees. Event 2 ("Pilot Initiative A") took place on 2025-08-11 at `event-venue-84` in `event-location-84`, accommodating 200 participants. Event 3 ("Baseline Model") was held on 2022-01-22 at `event-venue-85` in `event-location-85` with 300 attendees, and Event 4 ("Distributed Cluster") occurred on 2023-06-06 at `event-venue-86` in `event-location-86`, also with 300 attendees. Each event is associated with a specific ALPARC organization, a joint European project, and a project leader, creating a tripartite linkage that ties community engagement to institutional and project-level activity.

## Composite Views and Operational Relationships

The true analytical power of the system emerges when individual records are joined into composite views. Each view answers a specific operational question by combining data from multiple base tables.

The `protected_area_alpine_region_view` joins protected areas with their containing alpine regions, answering the question: "Which protected area belongs to which alpine region, and what are the regional characteristics?" A row from this view might show protected area `IDE-2086` ("Extended Review," 10.20 hectares, National Park) nested within alpine region 1000 (`1562837`, 16.95 hectares, France, perimeter defined 2024-11-07). This pairing reveals that the French alpine jurisdiction contains at least one National Park–designated protected area of modest size.

The `protected_area_transalpine_ecological_network_view` links protected areas to their associated transalpine ecological networks, answering: "Which protected area contributes to which ecological corridor system?" A representative row pairs `IDE-2091` ("Pilot Initiative A," Nature Reserve, ALPARC member) with network `7441146` ("Pilot Initiative A," 1.37 km corridor, Active status, coordinated by `legacy-coordina-43`). This indicates that the Nature Reserve site actively participates in an operational corridor network.

The `alpine_region_protected_area_detail_view` provides the reverse perspective: given an alpine region, which protected areas fall within it, and what are their protection characteristics? A row might show region 1001 (`6564391`, Italy, 20.90 hectares) alongside protected area `IDE-2091` ("Pilot Initiative A," 14.40 hectares, Nature Reserve, ALPARC member). This view is essential for regional administrators assessing the composition of their conserved territories.

The `transalpine_ecological_network_protected_area_detail_view` answers the complementary question: given a transalpine ecological network, which protected areas are its members? A row pairing network 3 (`8387535`, "Baseline Model," Evaluated, 0.6 km corridor) with protected area `IDE-2096` ("Baseline Model," 18.60 hectares, Landscape Protection Area) demonstrates how a specific corridor system aggregates protected territories under a shared ecological objective.

The `transalpine_ecological_network_a_l_p_a_r_c_view` connects ecological networks to their coordinating ALPARC organizations, answering: "Which ALPARC organization coordinates which network?" A row might show network `e6196808-8fd1-11eb-924d-9cd76263cbd0` ("Extended Review," Planned, 0.53 km) coordinated by Shell Oil, which oversees 3 member areas at 2.45 percent coverage. This view is critical for understanding the institutional responsibility for each corridor system.

The `a_l_p_a_r_c_transalpine_ecological_network_view` presents the ALPARC-centric perspective: given an ALPARC organization, which networks does it coordinate? A row showing GlobalPlatform Inc. (9 member areas, 4.90 percent coverage) coordinating network 2 (`7441146`, "Pilot Initiative A," Active, 1.37 km) reveals the operational scope of that organization's ecological coordination mandate.

The `a_l_p_a_r_c_joint_european_project_view` links ALPARC organizations to their funded projects, answering: "Which ALPARC organization manages which joint European project?" A row pairing Shell Oil with project `IVC20det15` ("Compact Initiative," Proposed, 11.11 euros budget, 1 deliverable) clarifies the financial and deliverable commitments of each coordinating body.

The `a_l_p_a_r_c_project_leader_view` connects ALPARC organizations to the personnel leading their projects. A row showing Whatsapp Inc. linked to leader 1002 (Theodore Mcgrath, 59 weekly hours, German-speaking, 28 years experience) identifies the human resource responsible for project execution within that organization.

The `a_l_p_a_r_c_professional_event_view` ties ALPARC organizations to the professional events they sponsor or host. A row pairing American Institutes for Research with event 4 ("Distributed Cluster," 2023-06-06, 300 attendees) demonstrates the community engagement footprint of each organization.

The `joint_european_project_protected_area_detail_view` answers: "Which protected areas are directly involved in a given joint European project?" A row linking project `8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3` ("Legacy Model," Active, 38 deliverables) to protected area `IDE-2091` ("Pilot Initiative A," Nature Reserve) reveals the on-the-ground conservation sites that serve as project deliverable locations.

The `joint_european_project_a_l_p_a_r_c_view` provides the institutional context for projects: which ALPARC organization is responsible for which funded initiative? A row showing GlobalPlatform Inc. managing project `8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3` ("Legacy Model," Active, 19.72 euros budget) clarifies organizational accountability for project outcomes.

The `joint_european_project_project_leader_view` identifies the personnel responsible for each project. A row pairing project `324` ("Regional Cluster A," Completed, 43.25 euros budget) with leader 1002 (Theodore Mcgrath, 28 years experience) confirms the leadership assignment for a completed initiative.

The `project_leader_joint_european_project_detail_view` presents the leader-centric perspective: given a project leader, which projects do they direct? A row showing leader 1003 (Peter Mcdowell, 67 weekly hours, 34 years experience) directing project `template_ivacode_pagata_20det50` ("Seasonal Review," Suspended, 75 deliverables) highlights the workload and responsibility of the most experienced leader in the roster.

The `project_leader_a_l_p_a_r_c_view` connects project leaders to their employing ALPARC organizations. A row linking leader 1001 (Tasha Rodriguez, Italian-speaking, driving license holder) to GlobalPlatform Inc. clarifies the organizational affiliation of each project director.

The `professional_event_a_l_p_a_r_c_view` shows which ALPARC organizations host or sponsor which professional events. A row pairing Whatsapp Inc. with event 3 ("Baseline Model," 2022-01-22, 300 attendees) demonstrates the event-hosting responsibilities of each coordinating body.

The `professional_event_joint_european_project_view` links professional events to the projects they support or celebrate. A row connecting event 2 ("Pilot Initiative A," 200 attendees) to project `8599bbd0-9bad-11eb-a8a2-19ed5c03f8d3` ("Legacy Model," Active) reveals the event-project alignment that facilitates knowledge transfer between community engagement and project execution.

The `professional_event_project_leader_view` identifies which project leaders participate in or present at which professional events. A row pairing event 1 ("Extended Review," 100 attendees) with leader 1000 (Norma Fisher, 43 weekly hours, 16 years experience) confirms the personnel engagement at each event.

## Synthesis

The alpine conservation system is defined by a dense web of relationships: protected areas nested within alpine regions, ecological networks spanning borders, ALPARC organizations coordinating both corridors and projects, funded initiatives with defined deliverables, personnel directing those initiatives, and professional events connecting all stakeholders. Each base table captures a distinct facet of this ecosystem, while the composite views synthesize these facets into answerable questions—questions that regional administrators, project coordinators, and policy makers rely on to manage the conservation landscape. The data, though fictional in its specific entities and values, models a realistic architecture of cross-border ecological governance where territorial protection, corridor connectivity, financial accountability, and human expertise intersect.

## Data appendix

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
