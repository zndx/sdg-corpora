## Humanitarian Program Operations: A Reference Guide

Humanitarian and community development programs operate through interconnected systems of people, resources, and organizational structures. At the core of this domain are beneficiaries—individuals or entities receiving assistance—organized within households, supported by programs with defined timelines and budgets, executed through activities, and sustained by resources distributed by implementing organizations. The data model captures every layer of this ecosystem, from the demographic profile of a beneficiary like Theodore Mcgrath, a 35-year-old male classified as an orphan in extended-location-99, to the financial tracking of resources such as the Adaptive Corridor clothing distribution valued at 61.82 total cost. Understanding how these records relate is essential for program managers, auditors, and field coordinators who must answer questions about reach, resource allocation, and organizational accountability.

**Table `beneficiaries`**

| beneficiary_id | full_name | age | gender | location | vulnerability_status | household_id | program_id | activity_id | belongs_household_to_household_id |
|---|---|---|---|---|---|---|---|---|---|
| 325448 | Theodore Mcgrath | 35 | male | extended-location-99 | orphan | 726044 | 1000 | 1000 | 1000 |
| 7731875 | Account Name | 40 | female | integrated-location-100 | vulnerable_child | 16605652 | 1001 | 1001 | 1001 |
| 4447008 | Saipan International Airport | 45 | other | seasonal-location-101 | youth | 8928495 | 1002 | 1002 | 1002 |
| 39800616 | Norma Fisher | 50 | male | regional-location-102 | adult | 5844284 | 1003 | 1003 | 1003 |

The beneficiaries table serves as the primary registry of individuals and entities receiving program support. Each record carries a unique beneficiary_id, a full_name, demographic attributes including age and gender, a location identifier, and a vulnerability_status that categorizes the recipient's need level. The sample data reveals a range of vulnerability classifications: orphan, vulnerable_child, youth, and adult. Theodore Mcgrath (beneficiary_id 325448) is recorded as a 35-year-old male with orphan status, while Account Name (7731875) is a 40-year-old female classified as a vulnerable_child. The location field uses descriptive identifiers such as extended-location-99 and integrated-location-100, anchoring each beneficiary to a geographic or administrative zone. The household_id and program_id columns link each beneficiary to their family unit and the program through which they receive assistance, while the activity_id references the specific operational event. The belongs_household_to_household_id field establishes intra-household relationships, indicating which household a beneficiary is formally registered under.

**Table `households`**

| household_id | household_head | number_of_members | location | economic_status | vulnerability_level | support_received | program_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | pilot-househol-86 | 43 | extended-location-99 | low_income | low | true | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | extended-househol-87 | 52 | integrated-location-100 | middle_income | medium | false | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | integrated-househol-88 | 61 | seasonal-location-101 | high_income | high | true | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | seasonal-househol-89 | 70 | regional-location-102 | low_income | low | false | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Households form the foundational unit of household-level registration and support tracking. Each household record includes a household_id, the name of the household_head, the number_of_members, a location, an economic_status classification (low_income, middle_income, or high_income), a vulnerability_level, and a boolean flag indicating whether support has been received. The household head pilot-househol-86 leads a household of 43 members in extended-location-99, classified as low_income with low vulnerability and confirmed support receipt. In contrast, extended-househol-87 heads a larger household of 52 members in integrated-location-100, classified as middle_income with medium vulnerability and no recorded support. The created_at and updated_at timestamps provide an audit trail of when household records were established and last modified, with dates ranging from January 2025 through April 2025 in the sample data.

**Table `households_beneficiaries`**

| household_id | beneficiary_id |
|---|---|
| 1000 | 325448 |
| 1000 | 7731875 |
| 1001 | 7731875 |
| 1001 | 4447008 |
| 1002 | 4447008 |
| 1002 | 39800616 |
| 1003 | 39800616 |
| 1003 | 325448 |

The households_beneficiaries table establishes the explicit membership relationship between households and their registered beneficiaries. This junction table resolves the many-to-many possibility that a single household may contain multiple beneficiaries and that, in certain program designs, a beneficiary may be associated with multiple household registrations. Each row links a household_id to a beneficiary_id, creating the operational bridge that allows program coordinators to determine which individuals belong to which family units. The presence of this table ensures that household-level statistics—such as total members, economic status, and support receipt—can be accurately aggregated from the individual beneficiary records.

**Table `programs`**

| id | program_id | program_name | start_date | end_date | status | target_population | budget | funding_source | beneficiary_id | activity_id | organization_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planning | youth | 35.45 | baseline-funding-73 | 325448 | 1000 | 1 |
| 1001 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | orphans | 18.47 | pilot-funding-74 | 7731875 | 1001 | 2 |
| 1002 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | vulnerable_children | 26.25 | extended-funding-75 | 4447008 | 1002 | 3 |
| 1003 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | suspended | community | 17.12 | integrated-funding-76 | 39800616 | 1003 | 4 |

Programs represent the structured interventions through which assistance is delivered. Each program record contains an id, a program_id (a secondary identifier), a program_name, start_date and end_date defining the operational window, a status indicating the current phase (planning, active, completed, or suspended), a target_population specifying the intended recipient group, a budget figure, a funding_source identifier, and foreign keys linking to the associated beneficiary_id, activity_id, and organization_id. The sample programs illustrate the diversity of program types: Extended Review (program_id 103176) is in planning status targeting youth with a budget of 35.45 funded by baseline-funding-73; Pilot Initiative A (2986219) is active, targeting orphans with a budget of 18.47 under pilot-funding-74; Baseline Model (1186079) is completed, serving vulnerable_children with a budget of 26.25 from extended-funding-75; and Distributed Cluster (1562855) is suspended, aimed at the broader community with a budget of 17.12 funded by integrated-funding-76. Notably, the end_date precedes the start_date in several records, which may indicate data entry conventions or retroactive program registrations.

**Table `organizations`**

| id | org_id | org_name | org_type | established_year | location | status | membership | program_id | beneficiary_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | NGO | 10 | extended-location-99 | active | distributed-membersh-24 | 1000 | 325448 |
| 2 | 1717 | Pilot Initiative A | CBO | 16 | integrated-location-100 | inactive | baseline-membersh-25 | 1001 | 7731875 |
| 3 | 69437 | Baseline Model | network | 22 | seasonal-location-101 | suspended | pilot-membersh-26 | 1002 | 4447008 |
| 4 | m16 | Distributed Cluster | NGO | 28 | regional-location-102 | active | extended-membersh-27 | 1003 | 39800616 |

Organizations are the implementing entities responsible for program execution and resource distribution. The organizations table records an id, org_id, org_name, org_type (NGO, CBO, or network), established_year, location, status (active, inactive, or suspended), membership classification, and links to the associated program_id and beneficiary_id. Extended Review (org_id 790471) is an NGO established 10 years ago, operating in extended-location-99 with active status and distributed-membersh-24 membership. Pilot Initiative A (org_id 1717) is a CBO with 16 years of establishment, currently inactive, located in integrated-location-100. Baseline Model (org_id 69437) is a network entity, suspended, in seasonal-location-101 with 22 years of establishment. Distributed Cluster (org_id m16) is an NGO, active, in regional-location-102 with 28 years of establishment. The org_type distinction between NGO (non-governmental organization) and CBO (community-based organization) reflects different governance and funding structures relevant to program oversight.

**Table `activities`**

| activity_id | activity_name | activity_type | date | location | participants_count | status | resources_used | program_id | beneficiary_id | resource_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Composite Programme | training | 2023-02-05T13:03:00 | extended-location-99 | 25 | planned | 17.45 | 1000 | 325448 | 100 |
| 1001 | Compact Standard A | outreach | 2024-07-16T20:20:00 | integrated-location-100 | 9 | ongoing | 21.90 | 1001 | 7731875 | 101 |
| 1002 | Legacy Framework | counseling | 2025-12-27T03:37:00 | seasonal-location-101 | 27 | completed | 26.35 | 1002 | 4447008 | 102 |
| 1003 | Regional Protocol | awareness_campaign | 2022-05-11T10:54:00 | regional-location-102 | 45 | cancelled | 30.80 | 1003 | 39800616 | 103 |

Activities are the operational events through which programs deliver services to beneficiaries. Each activity record includes an activity_id, activity_name, activity_type (training, outreach, counseling, or awareness_campaign), a date, a location, participants_count, status (planned, ongoing, completed, or cancelled), resources_used (a numeric value representing resource consumption), and foreign keys to the program_id, beneficiary_id, and resource_id. The sample activities demonstrate this operational diversity: Composite Programme (activity_id 1000) is a training event held on 2023-02-05 in extended-location-99 with 25 participants, currently planned, consuming 17.45 in resources. Compact Standard A (1001) is an outreach activity in integrated-location-100 on 2024-07-16 with 9 participants, ongoing status, and 21.90 resources used. Legacy Framework (1002) is a counseling session in seasonal-location-101 on 2025-12-27 with 27 participants, completed status, and 26.35 resources. Regional Protocol (1003) is an awareness_campaign in regional-location-102 on 2022-05-11 with 45 participants, cancelled status, and 30.80 resources.

**Table `resources`**

| id | resource_id | resource_name | resource_type | quantity | unit_cost | total_cost | distribution_date | status | activity_id | beneficiary_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1167 | Adaptive Corridor | clothing | 9 | 10.72 | 61.82 | 2025-12-07T23:21:00 | available | 1000 | 325448 |
| 101 | 2106708 | Primary Series | bedding | 8 | 29.99 | 89.53 | 2022-05-18T06:38:00 | distributed | 1001 | 7731875 |
| 102 | 4180945 | Composite Assessment D | food | 0 | 18.47 | 29.24 | 2023-10-02T13:55:00 | reserved | 1002 | 4447008 |
| 103 | 10238270 | Compact Survey | uniform | 12 | 43.48 | 13.94 | 2024-03-13T20:12:00 | available | 1003 | 39800616 |

Resources are the tangible goods and materials distributed through program activities. The resources table captures an id, resource_id, resource_name, resource_type (clothing, bedding, food, or uniform), quantity, unit_cost, total_cost, distribution_date, status (available, distributed, or reserved), and foreign keys to the activity_id and beneficiary_id. The Adaptive Corridor (resource_id 1167) is a clothing-type resource with a quantity of 9 units at 10.72 per unit, totaling 61.82, distributed on 2025-12-07 with available status. The Primary Series (2106708) is bedding with 8 units at 29.99 per unit, totaling 89.53, distributed on 2022-05-18 with distributed status. Composite Assessment D (4180945) is a food resource with 0 quantity at 18.47 per unit, totaling 29.24, reserved on 2023-10-02. Compact Survey (10238270) is a uniform resource with 12 units at 43.48 per unit, totaling 13.94, available as of 2024-03-13. The resource_type and status fields enable inventory management and distribution tracking across program activities.

## Program-Beneficiary Relationships



The v_beneficiary_program view joins beneficiary records with their associated program data, answering the question of which individuals are enrolled in which programs and under what conditions. This view combines the demographic and vulnerability information from beneficiaries with the program-level details including names, dates, budgets, and funding sources. For example, the record for Theodore Mcgrath (beneficiary_id 325448) shows enrollment in the Extended Review program (program_id 103176), which is in planning status, targets youth, carries a budget of 35.45, and is funded by baseline-funding-73. Similarly, Account Name (7731875) is linked to Pilot Initiative A (2986219), an active program targeting orphans with a budget of 18.47 under pilot-funding-74. This view enables program managers to assess beneficiary enrollment across programs, compare budget allocations per beneficiary, and track the status of each program's delivery to its target population.

## Activity-Beneficiary Linkages



The v_beneficiary_activity view connects beneficiaries to the specific activities through which they receive services, providing a granular view of operational participation. By joining the beneficiaries table with activities, this view reveals which individuals attended which events, the type of service delivered, the number of participants, and the resource consumption associated with each activity. Theodore Mcgrath (325448) participated in the Composite Programme (activity_id 1000), a training event in extended-location-99 with 25 participants, planned status, and 17.45 resources used. Account Name (7731875) is linked to Compact Standard A (1001), an outreach activity in integrated-location-100 with 9 participants, ongoing status, and 21.90 resources. This view supports operational reporting on participation rates, activity-level resource tracking, and the identification of beneficiaries who have engaged with multiple activity types.

## Household-Beneficiary Associations



The v_beneficiary_household view maps beneficiaries to their household registrations, enabling household-level analysis of program reach and vulnerability distribution. This join combines beneficiary demographic data with household characteristics including head name, member count, economic status, and vulnerability level. Theodore Mcgrath (325448) is registered under household 1000, headed by pilot-househol-86, with 43 members, low_income economic status, low vulnerability, and confirmed support receipt. Account Name (7731875) belongs to household 1001, led by extended-househol-87, comprising 52 members, middle_income status, medium vulnerability, and no support received. This view is essential for understanding the household context of individual beneficiaries, calculating per-household program costs, and identifying households with multiple enrolled members.

## Program-Level Beneficiary Aggregation



The v_program_beneficiary view aggregates beneficiary information at the program level, answering questions about program enrollment, target population reach, and demographic composition. This view joins programs with their associated beneficiaries, presenting program names, statuses, budgets, and funding sources alongside beneficiary names, ages, genders, and vulnerability statuses. The Extended Review program (103176) enrolls Theodore Mcgrath, a 35-year-old male orphan, with a budget of 35.45 and planning status. Pilot Initiative A (2986219) serves Account Name, a 40-year-old female vulnerable_child, with a budget of 18.47 and active status. This view supports program-level reporting on enrollment demographics, budget-per-beneficiary calculations, and status-based filtering for active versus completed interventions.

## Program-Activity Integration



The v_program_activity view links programs to their constituent activities, providing a structural map of how program objectives are operationalized through specific events. This join combines program details (names, dates, budgets, target populations) with activity information (names, types, dates, participant counts, statuses, and resource consumption). The Extended Review program (103176) includes the Composite Programme activity (1000), a training event with 25 participants and 17.45 resources used. Pilot Initiative A (2986219) encompasses Compact Standard A (1001), an outreach activity with 9 participants and 21.90 resources. This view enables program managers to assess the alignment between program objectives and the activities designed to achieve them, compare resource intensity across activities within a program, and track the completion status of program components.

## Program-Organization Accountability



The v_program_organization view establishes the accountability relationship between programs and their implementing organizations, answering which entity is responsible for delivering which intervention. This join combines program metadata (names, statuses, budgets, funding sources) with organizational details (names, types, establishment years, locations, and operational statuses). The Extended Review program (103176) is implemented by Extended Review (org_id 790471), an active NGO established 10 years ago in extended-location-99. Pilot Initiative A (2986219) is delivered by Pilot Initiative A (org_id 1717), an inactive CBO with 16 years of establishment in integrated-location-100. This view is critical for organizational reporting, compliance tracking, and assessing the capacity of implementing partners based on their type, status, and geographic presence.

## Activity-Program Context



The v_activity_program view provides the program context for each activity, answering the question of which broader intervention a specific operational event serves. By joining activities with their parent programs, this view presents activity-level details (names, types, dates, participant counts, statuses, resource consumption) alongside program information (names, target populations, budgets, funding sources). The Composite Programme activity (1000), a training event with 25 participants, is part of the Extended Review program (103176), which targets youth with a budget of 35.45. Compact Standard A (1001), an outreach activity with 9 participants, falls under Pilot Initiative A (2986219), targeting orphans with a budget of 18.47. This view supports activity-level reporting within program frameworks, enabling coordinators to evaluate whether activities are appropriately scoped to their parent program's objectives and budget.

## Activity-Beneficiary Participation



The v_activity_beneficiary view details which beneficiaries participate in which activities, providing a direct link between service delivery events and the individuals they serve. This join combines activity information (names, types, dates, locations, participant counts, statuses) with beneficiary demographics (names, ages, genders, locations, vulnerability statuses). The Composite Programme activity (1000) in extended-location-99 serves Theodore Mcgrath (325448), a 35-year-old male orphan. Compact Standard A (1001) in integrated-location-100 serves Account Name (7731875), a 40-year-old female vulnerable_child. This view is essential for verifying service delivery, tracking beneficiary engagement across multiple activities, and analyzing the demographic distribution of activity participants.

## Activity-Resource Consumption



The v_activity_resource view connects activities to the resources consumed or distributed during their execution, enabling resource tracking at the operational level. This join presents activity details (names, types, dates, participant counts, statuses) alongside resource information (names, types, quantities, unit costs, total costs, distribution dates, and statuses). The Composite Programme activity (1000) is associated with the Adaptive Corridor resource (1167), a clothing-type item with 9 units at 10.72 per unit, totaling 61.82, with available status. Compact Standard A (1001) is linked to the Primary Series resource (2106708), a bedding item with 8 units at 29.99 per unit, totaling 89.53, with distributed status. This view supports resource allocation analysis, cost-per-activity calculations, and inventory management by activity.

## Resource-Activity Distribution



The v_resource_activity view reverses the perspective of resource tracking, presenting resources alongside the activities through which they are distributed. This join answers questions about which activities are consuming which resources, the quantities involved, and the financial implications. The Adaptive Corridor resource (1167), a clothing item with 9 units and a total cost of 61.82, is distributed through the Composite Programme activity (1000), a planned training event. The Primary Series resource (2106708), a bedding item with 8 units and a total cost of 89.53, is distributed through Compact Standard A (1001), an ongoing outreach activity. This view is valuable for resource managers assessing distribution patterns, identifying high-cost activities, and monitoring the status of resource allocations across the program portfolio.

## Resource-Beneficiary Allocation



The v_resource_beneficiary view links resources directly to the beneficiaries who receive them, providing a beneficiary-centric view of material assistance. This join combines resource details (names, types, quantities, unit costs, total costs, distribution dates, statuses) with beneficiary information (names, ages, genders, locations, vulnerability statuses). The Adaptive Corridor resource (1167), a clothing item with 9 units totaling 61.82, is allocated to Theodore Mcgrath (325448), a 35-year-old male orphan. The Primary Series resource (2106708), a bedding item with 8 units totaling 89.53, is allocated to Account Name (7731875), a 40-year-old female vulnerable_child. This view supports beneficiary-level reporting on material assistance, enabling coordinators to verify that resources reach the intended recipients and to calculate per-beneficiary resource values.

## Household-Beneficiary Composition



The v_household_beneficiary_detail view provides a comprehensive picture of household composition by joining household records with their registered beneficiaries. This view combines household characteristics (head name, member count, location, economic status, vulnerability level, support receipt) with beneficiary demographics (names, ages, genders, vulnerability statuses). Household 1000, headed by pilot-househol-86 with 43 members in extended-location-99, classified as low_income with low vulnerability and support received, includes Theodore Mcgrath (325448), a 35-year-old male orphan. Household 1001, led by extended-househol-87 with 52 members in integrated-location-100, classified as middle_income with medium vulnerability and no support, includes Account Name (7731875), a 40-year-old female vulnerable_child. This view is critical for household-level program planning, vulnerability assessment, and determining eligibility for household-targeted interventions.

## Household-Program Enrollment



The v_household_program view connects households to the programs through which their members receive assistance, enabling household-level program coverage analysis. This join combines household data (head name, member count, location, economic status, vulnerability level) with program information (names, statuses, target populations, budgets, funding sources). Household 1000 (pilot-househol-86, 43 members, low_income, low vulnerability) is associated with the Extended Review program (103176), a planning-status program targeting youth with a budget of 35.45. Household 1001 (extended-househol-87, 52 members, middle_income, medium vulnerability) is linked to Pilot Initiative A (2986219), an active program targeting orphans with a budget of 18.47. This view supports program managers in assessing household-level enrollment patterns, comparing program reach across economic and vulnerability categories, and identifying households that may benefit from additional program access.

## Organization-Program Delivery



The v_organization_program view maps the relationship between implementing organizations and the programs they deliver, providing an organizational portfolio overview. This join combines organizational details (names, types, establishment years, locations, statuses, membership classifications) with program information (names, statuses, target populations, budgets, funding sources). Extended Review (org_id 790471), an active NGO established 10 years ago in extended-location-99 with distributed-membersh-24 membership, implements the Extended Review program (103176), a planning-status intervention targeting youth with a budget of 35.45. Pilot Initiative A (org_id 1717), an inactive CBO with 16 years of establishment in integrated-location-100 and baseline-membersh-25 membership, delivers Pilot Initiative A (2986219), an active program targeting orphans with a budget of 18.47. This view is essential for organizational capacity assessment, partner performance tracking, and funding allocation decisions based on organizational type and status.

## Organization-Beneficiary Reach



The v_organization_beneficiary view traces the full chain from implementing organization through program and activity to the individual beneficiary, providing a complete accountability trail. This join presents organizational information (names, types, establishment years, locations, statuses) alongside program details (names, statuses, target populations, budgets) and beneficiary demographics (names, ages, genders, vulnerability statuses). Extended Review (org_id 790471), an active NGO, delivers the Extended Review program (103176) to Theodore Mcgrath (325448), a 35-year-old male orphan. Pilot Initiative A (org_id 1717), an inactive CBO, serves Account Name (7731875), a 40-year-old female vulnerable_child. This view supports comprehensive reporting on organizational impact, enabling stakeholders to trace how organizational resources flow through programs to reach specific beneficiaries, and to assess the effectiveness of different organization types in serving diverse population groups.

## Synthesis

The data model described in this chapter captures the full operational lifecycle of humanitarian and community development programs, from organizational implementation through program design, activity execution, resource distribution, and beneficiary engagement. The seven base tables—beneficiaries, programs, activities, resources, households, organizations, and households_beneficiaries—form the structural foundation, while the fourteen views provide specialized lenses for answering specific operational questions. Together, they enable program managers to track enrollment and participation, organizations to demonstrate accountability and impact, and coordinators to optimize resource allocation across a diverse portfolio of interventions. The fictional entities and values presented here illustrate the breadth of data captured: from the demographic profile of a single beneficiary to the financial tracking of multi-unit resource distributions, from the governance structure of an NGO to the operational status of a community-based outreach event. Mastery of this relational structure is essential for anyone responsible for the planning, execution, or evaluation of humanitarian programs.

## Data appendix

**View `v_beneficiary_program`**

```sql
CREATE VIEW v_beneficiary_program AS
SELECT a.beneficiary_id, a.full_name, a.age, a.gender, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM beneficiaries a JOIN programs b ON a.program_id = b.id;
```

| beneficiary_id | full_name | age | gender | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 325448 | Theodore Mcgrath | 35 | male | 1000 | 103176 | Extended Review |
| 7731875 | Account Name | 40 | female | 1001 | 2986219 | Pilot Initiative A |
| 4447008 | Saipan International Airport | 45 | other | 1002 | 1186079 | Baseline Model |
| 39800616 | Norma Fisher | 50 | male | 1003 | 1562855 | Distributed Cluster |

**View `v_beneficiary_activity`**

```sql
CREATE VIEW v_beneficiary_activity AS
SELECT a.beneficiary_id, a.full_name, a.age, a.gender, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name, b.activity_type AS activity_activity_type
FROM beneficiaries a JOIN activities b ON a.activity_id = b.activity_id;
```

| beneficiary_id | full_name | age | gender | activity_activity_id | activity_activity_name | activity_activity_type |
|---|---|---|---|---|---|---|
| 325448 | Theodore Mcgrath | 35 | male | 1000 | Composite Programme | training |
| 7731875 | Account Name | 40 | female | 1001 | Compact Standard A | outreach |
| 4447008 | Saipan International Airport | 45 | other | 1002 | Legacy Framework | counseling |
| 39800616 | Norma Fisher | 50 | male | 1003 | Regional Protocol | awareness_campaign |

**View `v_beneficiary_household`**

```sql
CREATE VIEW v_beneficiary_household AS
SELECT a.beneficiary_id, a.full_name, a.age, a.gender, b.household_id AS household_household_id, b.household_head AS household_household_head, b.number_of_members AS household_number_of_members
FROM beneficiaries a JOIN households b ON a.belongs_household_to_household_id = b.household_id;
```

| beneficiary_id | full_name | age | gender | household_household_id | household_household_head | household_number_of_members |
|---|---|---|---|---|---|---|
| 325448 | Theodore Mcgrath | 35 | male | 1000 | pilot-househol-86 | 43 |
| 7731875 | Account Name | 40 | female | 1001 | extended-househol-87 | 52 |
| 4447008 | Saipan International Airport | 45 | other | 1002 | integrated-househol-88 | 61 |
| 39800616 | Norma Fisher | 50 | male | 1003 | seasonal-househol-89 | 70 |

**View `v_program_beneficiary`**

```sql
CREATE VIEW v_program_beneficiary AS
SELECT a.id, a.program_id, a.program_name, a.start_date, b.beneficiary_id AS beneficiary_beneficiary_id, b.full_name AS beneficiary_full_name, b.age AS beneficiary_age
FROM programs a JOIN beneficiaries b ON a.beneficiary_id = b.beneficiary_id;
```

| id | program_id | program_name | start_date | beneficiary_beneficiary_id | beneficiary_full_name | beneficiary_age |
|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 2022-09-05T20:24:00 | 325448 | Theodore Mcgrath | 35 |
| 1001 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | 7731875 | Account Name | 40 |
| 1002 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | 4447008 | Saipan International Airport | 45 |
| 1003 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | 39800616 | Norma Fisher | 50 |

**View `v_program_activity`**

```sql
CREATE VIEW v_program_activity AS
SELECT a.id, a.program_id, a.program_name, a.start_date, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name, b.activity_type AS activity_activity_type
FROM programs a JOIN activities b ON a.activity_id = b.activity_id;
```

| id | program_id | program_name | start_date | activity_activity_id | activity_activity_name | activity_activity_type |
|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 2022-09-05T20:24:00 | 1000 | Composite Programme | training |
| 1001 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | 1001 | Compact Standard A | outreach |
| 1002 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | 1002 | Legacy Framework | counseling |
| 1003 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | 1003 | Regional Protocol | awareness_campaign |

**View `v_program_organization`**

```sql
CREATE VIEW v_program_organization AS
SELECT a.id, a.program_id, a.program_name, a.start_date, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM programs a JOIN organizations b ON a.organization_id = b.id;
```

| id | program_id | program_name | start_date | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 2022-09-05T20:24:00 | 1 | 790471 | Extended Review |
| 1001 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | 2 | 1717 | Pilot Initiative A |
| 1002 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | 3 | 69437 | Baseline Model |
| 1003 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | 4 | m16 | Distributed Cluster |

**View `v_activity_program`**

```sql
CREATE VIEW v_activity_program AS
SELECT a.activity_id, a.activity_name, a.activity_type, a.date, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM activities a JOIN programs b ON a.program_id = b.id;
```

| activity_id | activity_name | activity_type | date | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | Composite Programme | training | 2023-02-05T13:03:00 | 1000 | 103176 | Extended Review |
| 1001 | Compact Standard A | outreach | 2024-07-16T20:20:00 | 1001 | 2986219 | Pilot Initiative A |
| 1002 | Legacy Framework | counseling | 2025-12-27T03:37:00 | 1002 | 1186079 | Baseline Model |
| 1003 | Regional Protocol | awareness_campaign | 2022-05-11T10:54:00 | 1003 | 1562855 | Distributed Cluster |

**View `v_activity_beneficiary`**

```sql
CREATE VIEW v_activity_beneficiary AS
SELECT a.activity_id, a.activity_name, a.activity_type, a.date, b.beneficiary_id AS beneficiary_beneficiary_id, b.full_name AS beneficiary_full_name, b.age AS beneficiary_age
FROM activities a JOIN beneficiaries b ON a.beneficiary_id = b.beneficiary_id;
```

| activity_id | activity_name | activity_type | date | beneficiary_beneficiary_id | beneficiary_full_name | beneficiary_age |
|---|---|---|---|---|---|---|
| 1000 | Composite Programme | training | 2023-02-05T13:03:00 | 325448 | Theodore Mcgrath | 35 |
| 1001 | Compact Standard A | outreach | 2024-07-16T20:20:00 | 7731875 | Account Name | 40 |
| 1002 | Legacy Framework | counseling | 2025-12-27T03:37:00 | 4447008 | Saipan International Airport | 45 |
| 1003 | Regional Protocol | awareness_campaign | 2022-05-11T10:54:00 | 39800616 | Norma Fisher | 50 |

**View `v_activity_resource`**

```sql
CREATE VIEW v_activity_resource AS
SELECT a.activity_id, a.activity_name, a.activity_type, a.date, b.id AS resource_id, b.resource_id AS resource_resource_id, b.resource_name AS resource_resource_name
FROM activities a JOIN resources b ON a.resource_id = b.id;
```

| activity_id | activity_name | activity_type | date | resource_id | resource_resource_id | resource_resource_name |
|---|---|---|---|---|---|---|
| 1000 | Composite Programme | training | 2023-02-05T13:03:00 | 100 | 1167 | Adaptive Corridor |
| 1001 | Compact Standard A | outreach | 2024-07-16T20:20:00 | 101 | 2106708 | Primary Series |
| 1002 | Legacy Framework | counseling | 2025-12-27T03:37:00 | 102 | 4180945 | Composite Assessment D |
| 1003 | Regional Protocol | awareness_campaign | 2022-05-11T10:54:00 | 103 | 10238270 | Compact Survey |

**View `v_resource_activity`**

```sql
CREATE VIEW v_resource_activity AS
SELECT a.id, a.resource_id, a.resource_name, a.resource_type, b.activity_id AS activity_activity_id, b.activity_name AS activity_activity_name, b.activity_type AS activity_activity_type
FROM resources a JOIN activities b ON a.activity_id = b.activity_id;
```

| id | resource_id | resource_name | resource_type | activity_activity_id | activity_activity_name | activity_activity_type |
|---|---|---|---|---|---|---|
| 100 | 1167 | Adaptive Corridor | clothing | 1000 | Composite Programme | training |
| 101 | 2106708 | Primary Series | bedding | 1001 | Compact Standard A | outreach |
| 102 | 4180945 | Composite Assessment D | food | 1002 | Legacy Framework | counseling |
| 103 | 10238270 | Compact Survey | uniform | 1003 | Regional Protocol | awareness_campaign |

**View `v_resource_beneficiary`**

```sql
CREATE VIEW v_resource_beneficiary AS
SELECT a.id, a.resource_id, a.resource_name, a.resource_type, b.beneficiary_id AS beneficiary_beneficiary_id, b.full_name AS beneficiary_full_name, b.age AS beneficiary_age
FROM resources a JOIN beneficiaries b ON a.beneficiary_id = b.beneficiary_id;
```

| id | resource_id | resource_name | resource_type | beneficiary_beneficiary_id | beneficiary_full_name | beneficiary_age |
|---|---|---|---|---|---|---|
| 100 | 1167 | Adaptive Corridor | clothing | 325448 | Theodore Mcgrath | 35 |
| 101 | 2106708 | Primary Series | bedding | 7731875 | Account Name | 40 |
| 102 | 4180945 | Composite Assessment D | food | 4447008 | Saipan International Airport | 45 |
| 103 | 10238270 | Compact Survey | uniform | 39800616 | Norma Fisher | 50 |

**View `v_household_beneficiary_detail`**

```sql
CREATE VIEW v_household_beneficiary_detail AS
SELECT a.household_id, a.household_head, a.number_of_members, b.beneficiary_id AS beneficiary_beneficiary_id, b.full_name AS beneficiary_full_name, b.age AS beneficiary_age
FROM households a
  JOIN households_beneficiaries j ON j.household_id = a.household_id
  JOIN beneficiaries b ON b.beneficiary_id = j.beneficiary_id;
```

| household_id | household_head | number_of_members | beneficiary_beneficiary_id | beneficiary_full_name | beneficiary_age |
|---|---|---|---|---|---|
| 1000 | pilot-househol-86 | 43 | 325448 | Theodore Mcgrath | 35 |
| 1000 | pilot-househol-86 | 43 | 7731875 | Account Name | 40 |
| 1001 | extended-househol-87 | 52 | 7731875 | Account Name | 40 |
| 1001 | extended-househol-87 | 52 | 4447008 | Saipan International Airport | 45 |
| 1002 | integrated-househol-88 | 61 | 4447008 | Saipan International Airport | 45 |
| 1002 | integrated-househol-88 | 61 | 39800616 | Norma Fisher | 50 |
| 1003 | seasonal-househol-89 | 70 | 39800616 | Norma Fisher | 50 |
| 1003 | seasonal-househol-89 | 70 | 325448 | Theodore Mcgrath | 35 |

**View `v_household_program`**

```sql
CREATE VIEW v_household_program AS
SELECT a.household_id, a.household_head, a.number_of_members, a.location, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM households a JOIN programs b ON a.program_id = b.id;
```

| household_id | household_head | number_of_members | location | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | pilot-househol-86 | 43 | extended-location-99 | 1000 | 103176 | Extended Review |
| 1001 | extended-househol-87 | 52 | integrated-location-100 | 1001 | 2986219 | Pilot Initiative A |
| 1002 | integrated-househol-88 | 61 | seasonal-location-101 | 1002 | 1186079 | Baseline Model |
| 1003 | seasonal-househol-89 | 70 | regional-location-102 | 1003 | 1562855 | Distributed Cluster |

**View `v_organization_program`**

```sql
CREATE VIEW v_organization_program AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM organizations a JOIN programs b ON a.program_id = b.id;
```

| id | org_id | org_name | org_type | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | NGO | 1000 | 103176 | Extended Review |
| 2 | 1717 | Pilot Initiative A | CBO | 1001 | 2986219 | Pilot Initiative A |
| 3 | 69437 | Baseline Model | network | 1002 | 1186079 | Baseline Model |
| 4 | m16 | Distributed Cluster | NGO | 1003 | 1562855 | Distributed Cluster |

**View `v_organization_beneficiary`**

```sql
CREATE VIEW v_organization_beneficiary AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.beneficiary_id AS beneficiary_beneficiary_id, b.full_name AS beneficiary_full_name, b.age AS beneficiary_age
FROM organizations a JOIN beneficiaries b ON a.beneficiary_id = b.beneficiary_id;
```

| id | org_id | org_name | org_type | beneficiary_beneficiary_id | beneficiary_full_name | beneficiary_age |
|---|---|---|---|---|---|---|
| 1 | 790471 | Extended Review | NGO | 325448 | Theodore Mcgrath | 35 |
| 2 | 1717 | Pilot Initiative A | CBO | 7731875 | Account Name | 40 |
| 3 | 69437 | Baseline Model | network | 4447008 | Saipan International Airport | 45 |
| 4 | m16 | Distributed Cluster | NGO | 39800616 | Norma Fisher | 50 |
