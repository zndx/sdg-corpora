## Funding Water Infrastructure: A Reference Guide to the Grant and Sustainability Ecosystem

Water harvesting represents a critical intersection of municipal planning, corporate investment, and community engagement. Across regions, organizations coordinate to design, fund, and operate water collection infrastructure that serves both immediate needs and long-term sustainability goals. The records in this domain capture every layer of that coordination—from the initial grant award through facility construction, system installation, and ongoing operational management. Each entity in the ecosystem maintains its own attributes while remaining connected to others through explicit relational links. Understanding these connections requires examining how funding flows, how projects are scoped, and how physical infrastructure is deployed across jurisdictions.

The financial backbone of water harvesting initiatives is captured in the grant awards ledger.

**Table `grant_awards`**

| id | grant_amount | grant_currency | award_date | grant_program_name | grant_status | grant_reference_id | community_organization_id | corporate_sponsor_id | sustainability_project_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 11.88 | regional-grant-60 | 2025-12-01T23:33:00 | Adaptive Model | pending | 89130 | 1000 | 1 | 1 |
| 2 | 14.31 | legacy-grant-61 | 2022-05-12T06:50:00 | Primary Cluster | approved | 2618575 | 1001 | 2 | 2 |
| 3 | 18.47 | compact-grant-62 | 2023-10-23T13:07:00 | Composite Review D | disbursed | 627 | 1002 | 3 | 3 |
| 4 | 14.58 | composite-grant-63 | 2024-03-07T20:24:00 | Compact Initiative | completed | 0000000000000 | 1003 | 4 | 4 |

Each grant record anchors a funding event with a precise monetary value, currency designation, and program classification. The grant reference identifiers—such as `89130` for the first award and `2618575` for the second—serve as the primary cross-referencing keys used throughout downstream reports. Grant statuses progress through a defined lifecycle: `pending`, `approved`, `disbursed`, and `completed`. The Adaptive Model program under grant reference `89130` remains in pending status as of its award date on 2025-12-01, while the Compact Initiative associated with reference `0000000000000` has reached completion. Every grant ties to three external entities simultaneously: a community organization receiving oversight, a corporate sponsor providing capital, and a sustainability project serving as the funded initiative.

Sustainability projects define the operational scope that grants finance.

**Table `sustainability_projects`**

| id | project_name | project_description | project_status | start_date | end_date | project_location | facility_id | community_organization_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Compact Survey | Composite Cluster | planned | 2022-09-05 | 2022-09-01 | regional-project-48 | 1000 | 1000 |
| 2 | Legacy Corridor | Compact Review A | in_progress | 2023-02-16 | 2023-02-12 | legacy-project-49 | 1001 | 1001 |
| 3 | Regional Series A | Legacy Initiative | completed | 2024-07-27 | 2024-07-23 | compact-project-50 | 1002 | 1002 |
| 4 | Seasonal Assessment | Regional Model | failed | 2025-12-11 | 2025-12-07 | composite-project-51 | 1003 | 1003 |

Project records carry descriptive names like Compact Survey and Legacy Corridor, paired with classification labels such as Composite Cluster and Compact Review A. The project status field tracks whether an initiative is `planned`, `in_progress`, `completed`, or `failed`. The Seasonal Assessment project, located at `composite-project-51`, carries a failed status with a start date of 2025-12-11, indicating a project that did not achieve its objectives. Each project is geographically situated at a specific location identifier and is bound to a facility where physical work occurs, as well as to a community organization responsible for local coordination. The date ranges—such as the Legacy Corridor project running from 2023-02-16 to 2023-02-12—establish the temporal boundaries within which project activities are expected to unfold.

Water harvesting systems represent the physical infrastructure deployed at project sites.

**Table `water_harvesting_systems`**

| water_harvesting_system_id | system_type | capacity_liters | installation_date | material_type | system_status | manufacturer | facility_id | corporate_sponsor_id |
|---|---|---|---|---|---|---|---|---|
| 100 | extended-system-69 | 5.45 | 2022-01-10 | adaptive-material-71 | installed | Standard Chartered | 1000 | 1 |
| 101 | integrated-system-70 | 8.90 | 2023-06-21 | distributed-material-72 | operational | General Motors | 1001 | 2 |
| 102 | seasonal-system-71 | 12.35 | 2024-11-05 | baseline-material-73 | maintenance_required | Column Name cannot be empty | 1002 | 3 |
| 103 | regional-system-72 | 15.80 | 2025-04-16 | pilot-material-74 | decommissioned | Financial Information Service Co. Ltd. | 1003 | 4 |

System records classify infrastructure by type—extended-system, integrated-system, seasonal-system, and regional-system—each with a measurable capacity in liters ranging from 5.45 to 15.80. The installation dates span from early 2022 through mid-2025, reflecting a rolling deployment schedule. Material types such as adaptive-material-71 and distributed-material-72 describe the construction composition of each system. Operational statuses include `installed`, `operational`, `maintenance_required`, and `decommissioned`, providing a real-time snapshot of system health. The system manufactured by Standard Chartered with identifier `100` is installed and operational, while the Column Name cannot be empty system at facility `1002` requires maintenance attention. Each system is tied to a specific facility and sponsored by a corporate entity.

Facilities serve as the physical anchor points for all infrastructure and organizational activity.

**Table `facilities`**

| facility_id | facility_name | facility_address | facility_type | construction_year | roof_completion_date | facility_status | community_organization_id | water_harvesting_system_id | municipality_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Integrated Protocol A | legacy-facility-91 | legacy-facility-73 | 14 | 2023-06-17 | active | 1000 | 100 | 1000 | 2025-01-01 00:14:00 |
| 1001 | Extended Programme | compact-facility-92 | compact-facility-74 | 21 | 2024-11-01 | inactive | 1001 | 101 | 1001 | 2025-02-06 03:14:00 |
| 1002 | Pilot Standard | composite-facility-93 | composite-facility-75 | 28 | 2025-04-12 | under_construction | 1002 | 102 | 1002 | 2025-03-11 06:14:00 |
| 1003 | Baseline Framework D | primary-facility-94 | primary-facility-76 | 35 | 2022-09-23 | active | 1003 | 103 | 1003 | 2025-04-16 09:14:00 |

Facility records document constructed sites with names like Integrated Protocol A and Baseline Framework D, each assigned a type classification such as legacy-facility-73 and primary-facility-76. Construction years range from 14 to 35, suggesting either legacy structures or a coded year representation. Roof completion dates—such as 2023-06-17 for Integrated Protocol A—mark when the collection surface became available for water harvesting. Facility statuses include `active`, `inactive`, and `under_construction`, with Pilot Standard at facility `1002` currently under construction. Each facility is associated with a community organization for local management, a water harvesting system for infrastructure, and a municipality for jurisdictional oversight.

Community organizations function as the local implementing partners in the water harvesting network.

**Table `community_organizations`**

| id | organization_name | organization_type | registration_number | founding_date | membership_count | organization_status | facility_id | grant_award_id | sustainability_project_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Staples Inc. | Gulf Oil | REG-2136 | 2023-06-24 | 242 | active | 1000 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Oscar Health Inc. | FSG Social Impact Advisors | REG-2142 | 2024-11-08 | 77 | dissolved | 1001 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Atlantic Richfield | McDonnell Douglas | REG-2148 | 2025-04-19 | 601 | suspended | 1002 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Port Loko | Alliant Energy Corp | REG-2154 | 2022-09-03 | 300 | active | 1003 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Organization records capture entities such as Staples Inc. and Oscar Health Inc., each classified by type—Gulf Oil, FSG Social Impact Advisors, McDonnell Douglas, and Alliant Energy Corp. Registration numbers like REG-2136 and REG-2142 provide formal identification. Membership counts vary significantly, from 77 members at Oscar Health Inc. to 601 at Atlantic Richfield, reflecting the scale of local engagement. Organization statuses include `active`, `dissolved`, and `suspended`, with Oscar Health Inc. having been dissolved as of its last update on 2025-02-09. Each organization is linked to a facility for on-site coordination, a grant award for financial tracking, and a sustainability project for operational alignment.

Corporate sponsors provide the capital that enables water harvesting initiatives.

**Table `corporate_sponsors`**

| id | company_name | company_type | headquarters_location | industry_sector | sponsorship_program_name | total_funding_distributed | grant_award_id | water_harvesting_system_id | community_organization_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Feedback Rating | Greater Houston Community Foundation | composite-headquar-63 | seasonal-industry-35 | Integrated Cluster A | 13.20 | 1 | 100 | 1000 |
| 2 | Virgin Group | Poshmark Inc. | primary-headquar-64 | regional-industry-36 | Extended Review | 16.40 | 2 | 101 | 1001 |
| 3 | United Technologies | Schlumberger Industries Identif d'Encarteur PR050 | adaptive-headquar-65 | legacy-industry-37 | Pilot Initiative | 19.60 | 3 | 102 | 1002 |
| 4 | Link Title | LDAP First Name Field | distributed-headquar-66 | compact-industry-38 | Baseline Model D | 22.80 | 4 | 103 | 1003 |

Sponsor records document companies such as Feedback Rating and Virgin Group, each characterized by a company type, headquarters location, and industry sector. The industry sectors—seasonal-industry-35, regional-industry-36, legacy-industry-37, and compact-industry-38—categorize the sponsoring entities by their economic domain. Total funding distributed ranges from 13.20 to 22.80, with Link Title committing the largest amount under the Baseline Model D sponsorship program. Each sponsor is connected to a grant award as the funding source, a water harvesting system as the beneficiary infrastructure, and a community organization as the local partner.

Municipalities provide the jurisdictional framework within which facilities operate.

**Table `municipalities`**

| municipality_id | municipality_name | municipality_code | state_province | country | population | area_sq_km | facility_id |
|---|---|---|---|---|---|---|---|
| 1000 | Compact Model | 8843744 | primary-state-28 | compact-country-26 | 42 | 15.45 | 1000 |
| 1001 | Legacy Cluster | c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | adaptive-state-29 | composite-country-27 | 49 | 17.90 | 1001 |
| 1002 | Regional Review A | 3012833 | distributed-state-30 | primary-country-28 | 56 | 20.35 | 1002 |
| 1003 | Seasonal Initiative | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | baseline-state-31 | adaptive-country-29 | 63 | 22.80 | 1003 |

Municipal records define the governing bodies responsible for the regulatory and administrative oversight of facilities within their boundaries. Each municipality is linked to one or more facilities, establishing the chain of jurisdictional accountability. The facility-municipality linkage ensures that every constructed site operates under a recognized local authority, enabling compliance monitoring and public reporting.

The projects-systems relationship table captures the explicit mapping between sustainability initiatives and their deployed water harvesting infrastructure.

**Table `projects_systems`**

| sustainability_project_id | water_harvesting_system_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

This junction table resolves the many-to-many relationships that arise when a single sustainability project deploys multiple water harvesting systems, or when a system serves multiple project phases. Each row in this table establishes a concrete association, ensuring that the logical connection between project scope and physical deployment is preserved in the data.

The joined views synthesize these base records into actionable perspectives. The grant award community organization view consolidates financial awards with the implementing organizations, answering which community groups are responsible for which funded initiatives.

**View `grant_award_community_organization_view`**

```sql
CREATE VIEW grant_award_community_organization_view AS
SELECT a.id, a.grant_amount, a.grant_currency, a.award_date, b.id AS organization_id, b.organization_name AS organization_organization_name, b.organization_type AS organization_organization_type
FROM grant_awards a JOIN community_organizations b ON a.community_organization_id = b.id;
```

| id | grant_amount | grant_currency | award_date | organization_id | organization_organization_name | organization_organization_type |
|---|---|---|---|---|---|---|
| 1 | 11.88 | regional-grant-60 | 2025-12-01T23:33:00 | 1000 | Staples Inc. | Gulf Oil |
| 2 | 14.31 | legacy-grant-61 | 2022-05-12T06:50:00 | 1001 | Oscar Health Inc. | FSG Social Impact Advisors |
| 3 | 18.47 | compact-grant-62 | 2023-10-23T13:07:00 | 1002 | Atlantic Richfield | McDonnell Douglas |
| 4 | 14.58 | composite-grant-63 | 2024-03-07T20:24:00 | 1003 | Port Loko | Alliant Energy Corp |

Reading the first row of this view reveals that Staples Inc. (organization `1000`) is linked to grant award `1` with an amount of 11.88 in the regional-grant-60 currency, under the Adaptive Model program. The second row shows Oscar Health Inc. (organization `1001`) connected to grant award `2` at 14.31 in legacy-grant-61 currency, under the Primary Cluster program. This view enables auditors to trace funding from the award record through to the local implementing partner.

The grant award corporate sponsor view connects financial awards to their funding sources.

**View `grant_award_corporate_sponsor_view`**

```sql
CREATE VIEW grant_award_corporate_sponsor_view AS
SELECT a.id, a.grant_amount, a.grant_currency, a.award_date, b.id AS sponsor_id, b.company_name AS sponsor_company_name, b.company_type AS sponsor_company_type
FROM grant_awards a JOIN corporate_sponsors b ON a.corporate_sponsor_id = b.id;
```

| id | grant_amount | grant_currency | award_date | sponsor_id | sponsor_company_name | sponsor_company_type |
|---|---|---|---|---|---|---|
| 1 | 11.88 | regional-grant-60 | 2025-12-01T23:33:00 | 1 | Feedback Rating | Greater Houston Community Foundation |
| 2 | 14.31 | legacy-grant-61 | 2022-05-12T06:50:00 | 2 | Virgin Group | Poshmark Inc. |
| 3 | 18.47 | compact-grant-62 | 2023-10-23T13:07:00 | 3 | United Technologies | Schlumberger Industries Identif d'Encarteur PR050 |
| 4 | 14.58 | composite-grant-63 | 2024-03-07T20:24:00 | 4 | Link Title | LDAP First Name Field |

In the first row, Feedback Rating (sponsor `1`) is shown as the funder for grant award `1`, with the grant amount of 11.88 and the Adaptive Model program designation. The fourth row links Link Title (sponsor `4`) to grant award `4` carrying 14.58 in composite-grant-63 currency under the Compact Initiative. This view supports financial reconciliation by pairing each disbursement with its corporate source.

The grant award sustainability project view bridges funding to the initiatives it supports.

**View `grant_award_sustainability_project_view`**

```sql
CREATE VIEW grant_award_sustainability_project_view AS
SELECT a.id, a.grant_amount, a.grant_currency, a.award_date, b.id AS project_id, b.project_name AS project_project_name, b.project_description AS project_project_description
FROM grant_awards a JOIN sustainability_projects b ON a.sustainability_project_id = b.id;
```

| id | grant_amount | grant_currency | award_date | project_id | project_project_name | project_project_description |
|---|---|---|---|---|---|---|
| 1 | 11.88 | regional-grant-60 | 2025-12-01T23:33:00 | 1 | Compact Survey | Composite Cluster |
| 2 | 14.31 | legacy-grant-61 | 2022-05-12T06:50:00 | 2 | Legacy Corridor | Compact Review A |
| 3 | 18.47 | compact-grant-62 | 2023-10-23T13:07:00 | 3 | Regional Series A | Legacy Initiative |
| 4 | 14.58 | composite-grant-63 | 2024-03-07T20:24:00 | 4 | Seasonal Assessment | Regional Model |

The first row demonstrates that grant award `1` (11.88, Adaptive Model) finances the Compact Survey project (project `1`), which is classified as planned and located at regional-project-48. The third row shows grant award `3` (18.47, Composite Review D) funding the Regional Series A project (project `3`), which has reached completed status. This view is essential for program managers assessing whether funded projects are progressing as expected.

The sustainability project facility view reveals which physical sites host each project.

**View `sustainability_project_facility_view`**

```sql
CREATE VIEW sustainability_project_facility_view AS
SELECT a.id, a.project_name, a.project_description, a.project_status, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name, b.facility_address AS facility_facility_address
FROM sustainability_projects a JOIN facilities b ON a.facility_id = b.facility_id;
```

| id | project_name | project_description | project_status | facility_facility_id | facility_facility_name | facility_facility_address |
|---|---|---|---|---|---|---|
| 1 | Compact Survey | Composite Cluster | planned | 1000 | Integrated Protocol A | legacy-facility-91 |
| 2 | Legacy Corridor | Compact Review A | in_progress | 1001 | Extended Programme | compact-facility-92 |
| 3 | Regional Series A | Legacy Initiative | completed | 1002 | Pilot Standard | composite-facility-93 |
| 4 | Seasonal Assessment | Regional Model | failed | 1003 | Baseline Framework D | primary-facility-94 |

The first row indicates that the Compact Survey project (project `1`) is hosted at facility `1000`, named Integrated Protocol A, which is an active legacy-facility-73. The third row shows the Regional Series A project (project `3`) operating at facility `1002`, Pilot Standard, which is currently under construction. This view helps operations teams coordinate site access and resource allocation across multiple concurrent projects.

The sustainability project community organization view identifies the local partners responsible for each project.

**View `sustainability_project_community_organization_view`**

```sql
CREATE VIEW sustainability_project_community_organization_view AS
SELECT a.id, a.project_name, a.project_description, a.project_status, b.id AS organization_id, b.organization_name AS organization_organization_name, b.organization_type AS organization_organization_type
FROM sustainability_projects a JOIN community_organizations b ON a.community_organization_id = b.id;
```

| id | project_name | project_description | project_status | organization_id | organization_organization_name | organization_organization_type |
|---|---|---|---|---|---|---|
| 1 | Compact Survey | Composite Cluster | planned | 1000 | Staples Inc. | Gulf Oil |
| 2 | Legacy Corridor | Compact Review A | in_progress | 1001 | Oscar Health Inc. | FSG Social Impact Advisors |
| 3 | Regional Series A | Legacy Initiative | completed | 1002 | Atlantic Richfield | McDonnell Douglas |
| 4 | Seasonal Assessment | Regional Model | failed | 1003 | Port Loko | Alliant Energy Corp |

In the first row, the Compact Survey project (project `1`) is managed by Staples Inc. (organization `1000`), an active organization with 242 members. The fourth row shows the Seasonal Assessment project (project `4`) overseen by Port Loko (organization `1003`), also active with 300 members. This view is critical for community engagement reporting and for identifying which organizations are accountable for project outcomes.

The sustainability project water harvesting system detail view connects projects to their deployed infrastructure.

**View `sustainability_project_water_harvesting_system_detail_view`**

```sql
CREATE VIEW sustainability_project_water_harvesting_system_detail_view AS
SELECT a.id, a.project_name, a.project_description, b.water_harvesting_system_id AS system_water_harvesting_system_id, b.system_type AS system_system_type, b.capacity_liters AS system_capacity_liters
FROM sustainability_projects a
  JOIN projects_systems j ON j.sustainability_project_id = a.id
  JOIN water_harvesting_systems b ON b.water_harvesting_system_id = j.water_harvesting_system_id;
```

| id | project_name | project_description | system_water_harvesting_system_id | system_system_type | system_capacity_liters |
|---|---|---|---|---|---|
| 1 | Compact Survey | Composite Cluster | 100 | extended-system-69 | 5.45 |
| 1 | Compact Survey | Composite Cluster | 101 | integrated-system-70 | 8.90 |
| 2 | Legacy Corridor | Compact Review A | 101 | integrated-system-70 | 8.90 |
| 2 | Legacy Corridor | Compact Review A | 102 | seasonal-system-71 | 12.35 |
| 3 | Regional Series A | Legacy Initiative | 102 | seasonal-system-71 | 12.35 |
| 3 | Regional Series A | Legacy Initiative | 103 | regional-system-72 | 15.80 |
| 4 | Seasonal Assessment | Regional Model | 103 | regional-system-72 | 15.80 |
| 4 | Seasonal Assessment | Regional Model | 100 | extended-system-69 | 5.45 |

The first row reveals that the Compact Survey project (project `1`) utilizes water harvesting system `100`, an extended-system-69 with a capacity of 5.45 liters, manufactured by Standard Chartered, and currently in installed status. The second row shows the Legacy Corridor project (project `2`) deploying system `101`, an integrated-system-70 with 8.90 liters capacity from General Motors, operating in operational status. This view provides a comprehensive picture of the physical assets supporting each initiative.

The water harvesting system facility view maps infrastructure to its host sites.

**View `water_harvesting_system_facility_view`**

```sql
CREATE VIEW water_harvesting_system_facility_view AS
SELECT a.water_harvesting_system_id, a.system_type, a.capacity_liters, a.installation_date, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name, b.facility_address AS facility_facility_address
FROM water_harvesting_systems a JOIN facilities b ON a.facility_id = b.facility_id;
```

| water_harvesting_system_id | system_type | capacity_liters | installation_date | facility_facility_id | facility_facility_name | facility_facility_address |
|---|---|---|---|---|---|---|
| 100 | extended-system-69 | 5.45 | 2022-01-10 | 1000 | Integrated Protocol A | legacy-facility-91 |
| 101 | integrated-system-70 | 8.90 | 2023-06-21 | 1001 | Extended Programme | compact-facility-92 |
| 102 | seasonal-system-71 | 12.35 | 2024-11-05 | 1002 | Pilot Standard | composite-facility-93 |
| 103 | regional-system-72 | 15.80 | 2025-04-16 | 1003 | Baseline Framework D | primary-facility-94 |

The first row demonstrates that system `100` (extended-system-69, 5.45 liters) is installed at facility `1000` (Integrated Protocol A), an active legacy facility. The third row shows system `102` (seasonal-system-71, 12.35 liters) deployed at facility `1002` (Pilot Standard), which is under construction. This view supports maintenance scheduling and site-level capacity planning.

The water harvesting system corporate sponsor view links infrastructure to its funding sources.

**View `water_harvesting_system_corporate_sponsor_view`**

```sql
CREATE VIEW water_harvesting_system_corporate_sponsor_view AS
SELECT a.water_harvesting_system_id, a.system_type, a.capacity_liters, a.installation_date, b.id AS sponsor_id, b.company_name AS sponsor_company_name, b.company_type AS sponsor_company_type
FROM water_harvesting_systems a JOIN corporate_sponsors b ON a.corporate_sponsor_id = b.id;
```

| water_harvesting_system_id | system_type | capacity_liters | installation_date | sponsor_id | sponsor_company_name | sponsor_company_type |
|---|---|---|---|---|---|---|
| 100 | extended-system-69 | 5.45 | 2022-01-10 | 1 | Feedback Rating | Greater Houston Community Foundation |
| 101 | integrated-system-70 | 8.90 | 2023-06-21 | 2 | Virgin Group | Poshmark Inc. |
| 102 | seasonal-system-71 | 12.35 | 2024-11-05 | 3 | United Technologies | Schlumberger Industries Identif d'Encarteur PR050 |
| 103 | regional-system-72 | 15.80 | 2025-04-16 | 4 | Link Title | LDAP First Name Field |

The first row indicates that system `100` is sponsored by Feedback Rating (sponsor `1`), which has distributed 13.20 in total funding. The fourth row shows system `103` (regional-system-72, 15.80 liters) sponsored by Link Title (sponsor `4`), with 22.80 in total funding distributed. This view enables corporate sponsors to track the infrastructure their investments have enabled.

The facility community organization view identifies which organizations manage each facility.

**View `facility_community_organization_view`**

```sql
CREATE VIEW facility_community_organization_view AS
SELECT a.facility_id, a.facility_name, a.facility_address, a.facility_type, b.id AS organization_id, b.organization_name AS organization_organization_name, b.organization_type AS organization_organization_type
FROM facilities a JOIN community_organizations b ON a.community_organization_id = b.id;
```

| facility_id | facility_name | facility_address | facility_type | organization_id | organization_organization_name | organization_organization_type |
|---|---|---|---|---|---|---|
| 1000 | Integrated Protocol A | legacy-facility-91 | legacy-facility-73 | 1000 | Staples Inc. | Gulf Oil |
| 1001 | Extended Programme | compact-facility-92 | compact-facility-74 | 1001 | Oscar Health Inc. | FSG Social Impact Advisors |
| 1002 | Pilot Standard | composite-facility-93 | composite-facility-75 | 1002 | Atlantic Richfield | McDonnell Douglas |
| 1003 | Baseline Framework D | primary-facility-94 | primary-facility-76 | 1003 | Port Loko | Alliant Energy Corp |

The first row shows that facility `1000` (Integrated Protocol A) is managed by Staples Inc. (organization `1000`), an active organization. The third row indicates facility `1002` (Pilot Standard) is managed by Atlantic Richfield (organization `1002`), which is currently suspended. This view is essential for accountability mapping and for identifying facilities that may require organizational reassignment.

The facility water harvesting system view documents the infrastructure at each site.

**View `facility_water_harvesting_system_view`**

```sql
CREATE VIEW facility_water_harvesting_system_view AS
SELECT a.facility_id, a.facility_name, a.facility_address, a.facility_type, b.water_harvesting_system_id AS system_water_harvesting_system_id, b.system_type AS system_system_type, b.capacity_liters AS system_capacity_liters
FROM facilities a JOIN water_harvesting_systems b ON a.water_harvesting_system_id = b.water_harvesting_system_id;
```

| facility_id | facility_name | facility_address | facility_type | system_water_harvesting_system_id | system_system_type | system_capacity_liters |
|---|---|---|---|---|---|---|
| 1000 | Integrated Protocol A | legacy-facility-91 | legacy-facility-73 | 100 | extended-system-69 | 5.45 |
| 1001 | Extended Programme | compact-facility-92 | compact-facility-74 | 101 | integrated-system-70 | 8.90 |
| 1002 | Pilot Standard | composite-facility-93 | composite-facility-75 | 102 | seasonal-system-71 | 12.35 |
| 1003 | Baseline Framework D | primary-facility-94 | primary-facility-76 | 103 | regional-system-72 | 15.80 |

The first row reveals that facility `1000` hosts system `100` (extended-system-69, 5.45 liters, installed status). The fourth row shows facility `1003` (Baseline Framework D) hosting system `103` (regional-system-72, 15.80 liters, decommissioned status). This view supports infrastructure audits and capacity assessments at the facility level.

The facility municipality view establishes jurisdictional oversight for each site.

**View `facility_municipality_view`**

```sql
CREATE VIEW facility_municipality_view AS
SELECT a.facility_id, a.facility_name, a.facility_address, a.facility_type, b.municipality_id AS municipality_municipality_id, b.municipality_name AS municipality_municipality_name, b.municipality_code AS municipality_municipality_code
FROM facilities a JOIN municipalities b ON a.municipality_id = b.municipality_id;
```

| facility_id | facility_name | facility_address | facility_type | municipality_municipality_id | municipality_municipality_name | municipality_municipality_code |
|---|---|---|---|---|---|---|
| 1000 | Integrated Protocol A | legacy-facility-91 | legacy-facility-73 | 1000 | Compact Model | 8843744 |
| 1001 | Extended Programme | compact-facility-92 | compact-facility-74 | 1001 | Legacy Cluster | c7476bbe-8fcc-11eb-924d-9cd76263cbd0 |
| 1002 | Pilot Standard | composite-facility-93 | composite-facility-75 | 1002 | Regional Review A | 3012833 |
| 1003 | Baseline Framework D | primary-facility-94 | primary-facility-76 | 1003 | Seasonal Initiative | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 |

Each row in this view pairs a facility with its overseeing municipality, ensuring that every constructed site operates within a recognized regulatory framework. The facility `1000` (Integrated Protocol A) is linked to municipality `1000`, while facility `1003` (Baseline Framework D) falls under municipality `1003`. This view is critical for compliance reporting and for coordinating with local government entities.

The community organization facility view provides the reverse mapping from organizations to their managed sites.

**View `community_organization_facility_view`**

```sql
CREATE VIEW community_organization_facility_view AS
SELECT a.id, a.organization_name, a.organization_type, a.registration_number, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name, b.facility_address AS facility_facility_address
FROM community_organizations a JOIN facilities b ON a.facility_id = b.facility_id;
```

| id | organization_name | organization_type | registration_number | facility_facility_id | facility_facility_name | facility_facility_address |
|---|---|---|---|---|---|---|
| 1000 | Staples Inc. | Gulf Oil | REG-2136 | 1000 | Integrated Protocol A | legacy-facility-91 |
| 1001 | Oscar Health Inc. | FSG Social Impact Advisors | REG-2142 | 1001 | Extended Programme | compact-facility-92 |
| 1002 | Atlantic Richfield | McDonnell Douglas | REG-2148 | 1002 | Pilot Standard | composite-facility-93 |
| 1003 | Port Loko | Alliant Energy Corp | REG-2154 | 1003 | Baseline Framework D | primary-facility-94 |

The first row shows Staples Inc. (organization `1000`) managing facility `1000` (Integrated Protocol A), an active legacy facility. The second row indicates Oscar Health Inc. (organization `1001`) manages facility `1001` (Extended Programme), which is currently inactive. This view helps identify organizations with multiple facility responsibilities and highlights facilities managed by dissolved or suspended organizations.

The community organization grant award view connects implementing partners to their funding awards.

**View `community_organization_grant_award_view`**

```sql
CREATE VIEW community_organization_grant_award_view AS
SELECT a.id, a.organization_name, a.organization_type, a.registration_number, b.id AS award_id, b.grant_amount AS award_grant_amount, b.grant_currency AS award_grant_currency
FROM community_organizations a JOIN grant_awards b ON a.grant_award_id = b.id;
```

| id | organization_name | organization_type | registration_number | award_id | award_grant_amount | award_grant_currency |
|---|---|---|---|---|---|---|
| 1000 | Staples Inc. | Gulf Oil | REG-2136 | 1 | 11.88 | regional-grant-60 |
| 1001 | Oscar Health Inc. | FSG Social Impact Advisors | REG-2142 | 2 | 14.31 | legacy-grant-61 |
| 1002 | Atlantic Richfield | McDonnell Douglas | REG-2148 | 3 | 18.47 | compact-grant-62 |
| 1003 | Port Loko | Alliant Energy Corp | REG-2154 | 4 | 14.58 | composite-grant-63 |

The first row demonstrates that Staples Inc. (organization `1000`) is associated with grant award `1` (11.88, Adaptive Model, pending status). The third row shows Atlantic Richfield (organization `1002`) linked to grant award `3` (18.47, Composite Review D, disbursed status). This view supports financial oversight by pairing each organization with the grants it administers.

The community organization sustainability project view identifies the projects each organization oversees.

**View `community_organization_sustainability_project_view`**

```sql
CREATE VIEW community_organization_sustainability_project_view AS
SELECT a.id, a.organization_name, a.organization_type, a.registration_number, b.id AS project_id, b.project_name AS project_project_name, b.project_description AS project_project_description
FROM community_organizations a JOIN sustainability_projects b ON a.sustainability_project_id = b.id;
```

| id | organization_name | organization_type | registration_number | project_id | project_project_name | project_project_description |
|---|---|---|---|---|---|---|
| 1000 | Staples Inc. | Gulf Oil | REG-2136 | 1 | Compact Survey | Composite Cluster |
| 1001 | Oscar Health Inc. | FSG Social Impact Advisors | REG-2142 | 2 | Legacy Corridor | Compact Review A |
| 1002 | Atlantic Richfield | McDonnell Douglas | REG-2148 | 3 | Regional Series A | Legacy Initiative |
| 1003 | Port Loko | Alliant Energy Corp | REG-2154 | 4 | Seasonal Assessment | Regional Model |

The first row reveals that Staples Inc. (organization `1000`) oversees the Compact Survey project (project `1`), which is in planned status. The fourth row shows Port Loko (organization `1003`) managing the Seasonal Assessment project (project `4`), which has failed. This view is essential for evaluating organizational performance and for identifying projects that may require intervention.

The corporate sponsor grant award view links funding sources to their awards.

**View `corporate_sponsor_grant_award_view`**

```sql
CREATE VIEW corporate_sponsor_grant_award_view AS
SELECT a.id, a.company_name, a.company_type, a.headquarters_location, b.id AS award_id, b.grant_amount AS award_grant_amount, b.grant_currency AS award_grant_currency
FROM corporate_sponsors a JOIN grant_awards b ON a.grant_award_id = b.id;
```

| id | company_name | company_type | headquarters_location | award_id | award_grant_amount | award_grant_currency |
|---|---|---|---|---|---|---|
| 1 | Feedback Rating | Greater Houston Community Foundation | composite-headquar-63 | 1 | 11.88 | regional-grant-60 |
| 2 | Virgin Group | Poshmark Inc. | primary-headquar-64 | 2 | 14.31 | legacy-grant-61 |
| 3 | United Technologies | Schlumberger Industries Identif d'Encarteur PR050 | adaptive-headquar-65 | 3 | 18.47 | compact-grant-62 |
| 4 | Link Title | LDAP First Name Field | distributed-headquar-66 | 4 | 14.58 | composite-grant-63 |

The first row indicates that Feedback Rating (sponsor `1`) funded grant award `1` (11.88, Adaptive Model, pending). The fourth row shows Link Title (sponsor `4`) funding grant award `4` (14.58, Compact Initiative, completed). This view supports corporate reporting and enables sponsors to track the status of their funded initiatives.

The corporate sponsor water harvesting system view connects sponsors to the infrastructure their funding supports.

**View `corporate_sponsor_water_harvesting_system_view`**

```sql
CREATE VIEW corporate_sponsor_water_harvesting_system_view AS
SELECT a.id, a.company_name, a.company_type, a.headquarters_location, b.water_harvesting_system_id AS system_water_harvesting_system_id, b.system_type AS system_system_type, b.capacity_liters AS system_capacity_liters
FROM corporate_sponsors a JOIN water_harvesting_systems b ON a.water_harvesting_system_id = b.water_harvesting_system_id;
```

| id | company_name | company_type | headquarters_location | system_water_harvesting_system_id | system_system_type | system_capacity_liters |
|---|---|---|---|---|---|---|
| 1 | Feedback Rating | Greater Houston Community Foundation | composite-headquar-63 | 100 | extended-system-69 | 5.45 |
| 2 | Virgin Group | Poshmark Inc. | primary-headquar-64 | 101 | integrated-system-70 | 8.90 |
| 3 | United Technologies | Schlumberger Industries Identif d'Encarteur PR050 | adaptive-headquar-65 | 102 | seasonal-system-71 | 12.35 |
| 4 | Link Title | LDAP First Name Field | distributed-headquar-66 | 103 | regional-system-72 | 15.80 |

The first row demonstrates that Feedback Rating (sponsor `1`) supports system `100` (extended-system-69, 5.45 liters, installed). The third row shows United Technologies (sponsor `3`) supporting system `102` (seasonal-system-71, 12.35 liters, maintenance_required). This view enables sponsors to assess the operational health of the infrastructure their investments have enabled.

The corporate sponsor community organization view links funding sources to their local implementing partners.

**View `corporate_sponsor_community_organization_view`**

```sql
CREATE VIEW corporate_sponsor_community_organization_view AS
SELECT a.id, a.company_name, a.company_type, a.headquarters_location, b.id AS organization_id, b.organization_name AS organization_organization_name, b.organization_type AS organization_organization_type
FROM corporate_sponsors a JOIN community_organizations b ON a.community_organization_id = b.id;
```

| id | company_name | company_type | headquarters_location | organization_id | organization_organization_name | organization_organization_type |
|---|---|---|---|---|---|---|
| 1 | Feedback Rating | Greater Houston Community Foundation | composite-headquar-63 | 1000 | Staples Inc. | Gulf Oil |
| 2 | Virgin Group | Poshmark Inc. | primary-headquar-64 | 1001 | Oscar Health Inc. | FSG Social Impact Advisors |
| 3 | United Technologies | Schlumberger Industries Identif d'Encarteur PR050 | adaptive-headquar-65 | 1002 | Atlantic Richfield | McDonnell Douglas |
| 4 | Link Title | LDAP First Name Field | distributed-headquar-66 | 1003 | Port Loko | Alliant Energy Corp |

The first row reveals that Feedback Rating (sponsor `1`) partners with Staples Inc. (organization `1000`), an active organization with 242 members. The fourth row shows Link Title (sponsor `4`) partnering with Port Loko (organization `1003`), also active with 300 members. This view supports partnership management and helps identify organizations that serve as primary implementation partners for specific sponsors.

The municipality facility view provides the jurisdictional mapping from the municipal perspective.

**View `municipality_facility_view`**

```sql
CREATE VIEW municipality_facility_view AS
SELECT a.municipality_id, a.municipality_name, a.municipality_code, a.state_province, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name, b.facility_address AS facility_facility_address
FROM municipalities a JOIN facilities b ON a.facility_id = b.facility_id;
```

| municipality_id | municipality_name | municipality_code | state_province | facility_facility_id | facility_facility_name | facility_facility_address |
|---|---|---|---|---|---|---|
| 1000 | Compact Model | 8843744 | primary-state-28 | 1000 | Integrated Protocol A | legacy-facility-91 |
| 1001 | Legacy Cluster | c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | adaptive-state-29 | 1001 | Extended Programme | compact-facility-92 |
| 1002 | Regional Review A | 3012833 | distributed-state-30 | 1002 | Pilot Standard | composite-facility-93 |
| 1003 | Seasonal Initiative | 46d4e72c-8fcc-11eb-924d-9cd76263cbd0 | baseline-state-31 | 1003 | Baseline Framework D | primary-facility-94 |

Each row in this view associates a municipality with the facilities under its jurisdiction. Municipality `1000` oversees facility `1000` (Integrated Protocol A), while municipality `1003` oversees facility `1003` (Baseline Framework D). This view enables municipal authorities to monitor all infrastructure within their boundaries and coordinate regulatory activities across multiple sites.

The water harvesting domain operates as an interconnected system where financial resources, physical infrastructure, organizational capacity, and jurisdictional oversight converge. Grant awards provide the funding mechanism, sustainability projects define the operational scope, and water harvesting systems deliver the physical capability. Facilities serve as the anchor points where all these elements meet, while community organizations and corporate sponsors provide the human and financial capital necessary for execution. Municipalities ensure that all activities remain within regulatory frameworks. The views synthesized from these base tables transform raw records into actionable intelligence, enabling stakeholders at every level—from corporate sponsors tracking their investments to municipal authorities monitoring compliance—to make informed decisions about water infrastructure development and management.