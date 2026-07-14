## Corporate Responsibility Programme Architecture

Organizations that operate across multiple jurisdictions and business lines require a structured approach to managing corporate responsibility initiatives. The data model described here captures the full lifecycle of such programmes—from initial planning through execution, component allocation, and geographic deployment. At its core, the system tracks individual programmes, each assigned to an executive role, broken into discrete components with defined budgets and target audiences, and distributed across business units and geographic regions. Professionals staff the executive roles, often drawing on educational backgrounds from specific institutions, while campaigns and their regional deployments provide the public-facing layer of these initiatives.

**Table `corporate_responsibility_programmes`**

| id | programme_identifier | programme_name | start_date | status | scope | executive_role_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | PRO-2239 | Extended Standard | 2022-09-05T20:24:00 | active | regional | 1 | 2025-01-01 00:14:00 |
| 2 | PRO-2245 | Pilot Framework A | 2023-02-16T03:41:00 | planned | global | 2 | 2025-02-06 03:14:00 |
| 3 | PRO-2251 | Baseline Protocol | 2024-07-27T10:58:00 | completed | local | 3 | 2025-03-11 06:14:00 |
| 4 | PRO-2257 | Distributed Programme | 2025-12-11T17:15:00 | suspended | regional | 4 | 2025-04-16 09:14:00 |

The `corporate_responsibility_programmes` table serves as the primary entry point for all tracked initiatives. Each programme carries a unique identifier such as PRO-2239 or PRO-2257, a human-readable name like "Extended Standard" or "Distributed Programme," and a start date that anchors its timeline. Programmes are classified by scope—regional, global, local, or national—and maintain a status that reflects their current phase: active, planned, completed, or suspended. The programme PRO-2239, for instance, is an active regional initiative that began in September 2022, while PRO-2251, the "Baseline Protocol," reached completion in July 2024. Every programme is linked to an executive role through the `executive_role_id` column, establishing the accountability chain that runs through the entire organisation.

**Table `c_s_r_components`**

| id | component_identifier | component_name | component_type | budget | target_audience | corporate_responsibility_programme_id | geographic_region_id |
|---|---|---|---|---|---|---|---|
| 1000 | COM-2433 | Seasonal Initiative | community_engagement | 35.45 | legacy-target-25 | 1 | 1 |
| 1001 | COM-2440 | Integrated Model | strategic_philanthropy | 18.47 | compact-target-26 | 2 | 2 |
| 1002 | COM-2447 | Extended Cluster D | education_campaign | 26.25 | composite-target-27 | 3 | 3 |
| 1003 | COM-2454 | Pilot Review | health_initiative | 17.12 | primary-target-28 | 4 | 4 |

Within each corporate responsibility programme, discrete operational elements are captured as CSR components. The `c_s_r_components` table records components such as COM-2433 ("Seasonal Initiative") and COM-2454 ("Pilot Review"), each classified by type—community engagement, strategic philanthropy, education campaign, or health initiative. Budget allocations range from approximately 17 to 35 units, with the Seasonal Initiative carrying the largest allocation at 35.45. Components are assigned a target audience identifier, such as legacy-target-25 or primary-target-28, and are explicitly tied to their parent programme via `corporate_responsibility_programme_id` and to a geographic region via `geographic_region_id`. This dual linkage ensures that every component is both programmatically and geographically grounded.

**Table `executive_roles`**

| executive_role_id | role_identifier | role_title | department | start_date | end_date | employment_status | professional_id | business_unit_id | corporate_responsibility_programme_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ROL-2012 | Distributed Standard | adaptive-departme-89 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | active | 1 | 1 | 1 |
| 2 | ROL-2016 | Adaptive Framework D | distributed-departme-90 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | former | 2 | 2 | 2 |
| 3 | ROL-2020 | Primary Protocol | baseline-departme-91 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | contract | 3 | 3 | 3 |
| 4 | ROL-2024 | Composite Programme | pilot-departme-92 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | active | 4 | 4 | 4 |

Executive roles form the governance backbone of the system. The `executive_roles` table assigns each role a unique identifier like ROL-2012 or ROL-2024, a title such as "Distributed Standard" or "Composite Programme," and a department designation including adaptive-departme-89 and pilot-departme-92. Employment status—active, former, or contract—indicates the current standing of the role holder. Each role is associated with a professional through `professional_id`, a business unit via `business_unit_id`, and a corporate responsibility programme through `corporate_responsibility_programme_id`. The temporal dimensions of these roles are captured by start and end dates; for example, ROL-2016 (Adaptive Framework D) began in February 2023 and ended shortly thereafter, suggesting a time-limited assignment.

**Table `business_units`**

| business_unit_id | unit_identifier | unit_name | sector | revenue | employee_count | executive_role_id | geographic_region_id |
|---|---|---|---|---|---|---|---|
| 1 | UNI-2580 | Compact Series | media_networks | 18.70 | 131 | 1 | 1 |
| 2 | UNI-2584 | Legacy Assessment | consumer_products | 21.40 | 428 | 2 | 2 |
| 3 | UNI-2588 | Regional Survey A | interactive_media | 24.10 | 3 | 3 | 3 |
| 4 | UNI-2592 | Seasonal Corridor | entertainment | 26.80 | 9 | 4 | 4 |

Business units represent the operational divisions through which corporate responsibility programmes are delivered. The `business_units` table includes units such as UNI-2580 ("Compact Series") operating in media networks, and UNI-2592 ("Seasonal Corridor") in entertainment. Each unit reports a sector classification, revenue figure (ranging from 18.70 to 26.80), and employee count (from 3 to 428). The linkage to an executive role and a geographic region ensures that every business unit sits at the intersection of governance and geography. The Compact Series, for instance, operates under executive role 1 within geographic region 1, while the Seasonal Corridor is managed by executive role 4 in region 4.

**Table `geographic_regions`**

| id | region_code | region_name | region_type | population | primary_language | business_unit_id | c_s_r_component_id |
|---|---|---|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | continent | 42 | primary-primary-10 | 1 | 1000 |
| 2 | 6564391 | Adaptive Survey D | country | 49 | adaptive-primary-11 | 2 | 1001 |
| 3 | 778560 | Primary Corridor | city | 56 | distributed-primary-12 | 3 | 1002 |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | market | 63 | baseline-primary-13 | 4 | 1003 |

Geographic regions provide the spatial context for all programme activities. The `geographic_regions` table records region codes such as 1562837 and 6564391, region names like "Distributed Assessment" and "Adaptive Survey D," and region types spanning continent, country, city, and market. Population figures are modest in this dataset (42 to 63), and each region specifies a primary language identifier. The critical structural columns `business_unit_id` and `c_s_r_component_id` tie each region to a specific business unit and CSR component, creating a three-way relationship between geography, operations, and programme content.

**Table `professionals`**

| id | professional_id | full_name | birth_date | current_employer | primary_expertise | executive_role_id | educational_institution_id |
|---|---|---|---|---|---|---|---|
| 1 | 5082965 | Theodore Mcgrath | 2023-10-18 | Singapore General Hospital | pilot-primary-80 | 1 | 1 |
| 2 | 2618560 | Account Name | 2024-03-02 | Viet Children's Aegis | extended-primary-81 | 2 | 2 |
| 3 | 3355767 | Saipan International Airport | 2025-08-13 | Standard Bank | integrated-primary-82 | 3 | 3 |
| 4 | 3355784 | Norma Fisher | 2022-01-24 | ACExcellent Consulting Pte Ltd | seasonal-primary-83 | 4 | 4 |

The `professionals` table captures the individuals who occupy executive roles. Records include identifiers like 5082965 (Theodore Mcgrath) and 3355784 (Norma Fisher), along with birth dates, current employers such as Singapore General Hospital and ACExcellent Consulting Pte Ltd, and primary expertise areas. Each professional is linked to an executive role via `executive_role_id` and to an educational institution through `educational_institution_id`, forming a complete professional profile that connects personal background to organizational responsibility.

**Table `educational_institutions`**

| id | institution_id | institution_name | location | founding_year | institution_type | professional_id | geographic_region_id |
|---|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Corridor | extended-location-99 | 43 | university | 1 | 1 |
| 2 | 8189481 | Pilot Series A | integrated-location-100 | 48 | college | 2 | 2 |
| 3 | 1437604 | Baseline Assessment | seasonal-location-101 | 53 | business_school | 3 | 3 |
| 4 | 884346 | Distributed Survey | regional-location-102 | 58 | research_institute | 4 | 4 |

Educational institutions provide the academic provenance for professionals in the system. While the table structure mirrors the professionals table with an `educational_institution_id` column, it anchors the educational background that underpins professional qualifications. The linkage between professionals and their institutions—such as professional 1 (Theodore Mcgrath) being associated with institution 1—creates a traceable chain from academic training to executive accountability.

**Table `campaigns`**

| id | campaign_id | campaign_title | launch_date | end_date | reach | campaign_status | professional_id | c_s_r_component_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 7021001070100 | Primary Standard A | 2022-05-17T16:36:00 | 2022-09-01T08:00:00 | 28 | planned | 1 | 1000 |
| 2 | 1437599 | Composite Framework | 2023-10-01T23:53:00 | 2023-02-12T15:17:00 | 36 | active | 2 | 1001 |
| 3 | 2106708 | Compact Protocol | 2024-03-12T06:10:00 | 2024-07-23T22:34:00 | 44 | completed | 3 | 1002 |
| 4 | 4985162 | Legacy Programme D | 2025-08-23T13:27:00 | 2025-12-07T05:51:00 | 52 | archived | 4 | 1003 |

Campaigns represent the communicative and outreach layer of corporate responsibility efforts. The campaigns table captures campaign-level metadata that drives public engagement activities. While specific campaign records are not enumerated in the sample data, the table structure supports the tracking of campaign identifiers, names, types, and their relationships to professionals and geographic regions through the join tables described below.

**Table `programmes_components`**

| corporate_responsibility_programme_id | c_s_r_component_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `programmes_components` table establishes the many-to-many relationship between corporate responsibility programmes and CSR components. This junction table allows a single programme to encompass multiple components and a component to be shared across programmes, providing the flexibility needed for complex, multi-faceted initiatives. The linkage is explicit: each row connects a `corporate_responsibility_programme_id` to a `c_s_r_component_id`, ensuring that the programme-to-component mapping is both auditable and reversible.

**Table `campaigns_regions`**

| campaign_id | geographic_region_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Similarly, `campaigns_regions` links campaigns to geographic regions, enabling the tracking of where specific outreach activities are deployed. This junction table supports the geographic targeting of campaigns, ensuring that each campaign's regional footprint is explicitly recorded and can be queried independently of the underlying programme structure.

## Programme-Executive Relationships

**View `v_corporate_responsibility_programme_executive_role`**

```sql
CREATE VIEW v_corporate_responsibility_programme_executive_role AS
SELECT a.id, a.programme_identifier, a.programme_name, a.start_date, b.executive_role_id AS role_executive_role_id, b.role_identifier AS role_role_identifier, b.role_title AS role_role_title
FROM corporate_responsibility_programmes a JOIN executive_roles b ON a.executive_role_id = b.executive_role_id;
```

| id | programme_identifier | programme_name | start_date | role_executive_role_id | role_role_identifier | role_role_title |
|---|---|---|---|---|---|---|
| 1 | PRO-2239 | Extended Standard | 2022-09-05T20:24:00 | 1 | ROL-2012 | Distributed Standard |
| 2 | PRO-2245 | Pilot Framework A | 2023-02-16T03:41:00 | 2 | ROL-2016 | Adaptive Framework D |
| 3 | PRO-2251 | Baseline Protocol | 2024-07-27T10:58:00 | 3 | ROL-2020 | Primary Protocol |
| 4 | PRO-2257 | Distributed Programme | 2025-12-11T17:15:00 | 4 | ROL-2024 | Composite Programme |

This view joins corporate responsibility programmes with their assigned executive roles, answering the question of which leader is accountable for which initiative. The row for programme PRO-2239 (Extended Standard) paired with executive role ROL-2012 (Distributed Standard) demonstrates how a single programme maps to a single role holder. The view surfaces the programme's scope, status, and start date alongside the role's department, employment status, and temporal boundaries, providing a complete accountability snapshot.

**View `v_corporate_responsibility_programme_c_s_r_component_detail`**

```sql
CREATE VIEW v_corporate_responsibility_programme_c_s_r_component_detail AS
SELECT a.id, a.programme_identifier, a.programme_name, b.id AS component_id, b.component_identifier AS component_component_identifier, b.component_name AS component_component_name
FROM corporate_responsibility_programmes a
  JOIN programmes_components j ON j.corporate_responsibility_programme_id = a.id
  JOIN c_s_r_components b ON b.id = j.c_s_r_component_id;
```

| id | programme_identifier | programme_name | component_id | component_component_identifier | component_component_name |
|---|---|---|---|---|---|
| 1 | PRO-2239 | Extended Standard | 1000 | COM-2433 | Seasonal Initiative |
| 1 | PRO-2239 | Extended Standard | 1001 | COM-2440 | Integrated Model |
| 2 | PRO-2245 | Pilot Framework A | 1001 | COM-2440 | Integrated Model |
| 2 | PRO-2245 | Pilot Framework A | 1002 | COM-2447 | Extended Cluster D |
| 3 | PRO-2251 | Baseline Protocol | 1002 | COM-2447 | Extended Cluster D |
| 3 | PRO-2251 | Baseline Protocol | 1003 | COM-2454 | Pilot Review |
| 4 | PRO-2257 | Distributed Programme | 1003 | COM-2454 | Pilot Review |
| 4 | PRO-2257 | Distributed Programme | 1000 | COM-2433 | Seasonal Initiative |

By joining programmes with their constituent CSR components, this view reveals the internal composition of each initiative. The row connecting PRO-2239 to component COM-2433 (Seasonal Initiative, type community_engagement, budget 35.45) illustrates how a programme's financial and operational commitments are itemized. The view includes the component's target audience and geographic region, enabling stakeholders to assess both the content and the reach of each programme element.

**View `v_c_s_r_component_corporate_responsibility_programme`**

```sql
CREATE VIEW v_c_s_r_component_corporate_responsibility_programme AS
SELECT a.id, a.component_identifier, a.component_name, a.component_type, b.id AS programme_id, b.programme_identifier AS programme_programme_identifier, b.programme_name AS programme_programme_name
FROM c_s_r_components a JOIN corporate_responsibility_programmes b ON a.corporate_responsibility_programme_id = b.id;
```

| id | component_identifier | component_name | component_type | programme_id | programme_programme_identifier | programme_programme_name |
|---|---|---|---|---|---|---|
| 1000 | COM-2433 | Seasonal Initiative | community_engagement | 1 | PRO-2239 | Extended Standard |
| 1001 | COM-2440 | Integrated Model | strategic_philanthropy | 2 | PRO-2245 | Pilot Framework A |
| 1002 | COM-2447 | Extended Cluster D | education_campaign | 3 | PRO-2251 | Baseline Protocol |
| 1003 | COM-2454 | Pilot Review | health_initiative | 4 | PRO-2257 | Distributed Programme |

This view inverts the relationship, presenting CSR components with their parent programme context. The row for COM-2440 (Integrated Model, type strategic_philanthropy) linked to programme PRO-2245 (Pilot Framework A) shows how components inherit programme-level attributes such as scope and status. This perspective is particularly useful for budget analysis, as it allows aggregation of component-level spending within programme boundaries.

## Component-Geographic Relationships

**View `v_c_s_r_component_geographic_region`**

```sql
CREATE VIEW v_c_s_r_component_geographic_region AS
SELECT a.id, a.component_identifier, a.component_name, a.component_type, b.id AS region_id, b.region_code AS region_region_code, b.region_name AS region_region_name
FROM c_s_r_components a JOIN geographic_regions b ON a.geographic_region_id = b.id;
```

| id | component_identifier | component_name | component_type | region_id | region_region_code | region_region_name |
|---|---|---|---|---|---|---|
| 1000 | COM-2433 | Seasonal Initiative | community_engagement | 1 | 1562837 | Distributed Assessment |
| 1001 | COM-2440 | Integrated Model | strategic_philanthropy | 2 | 6564391 | Adaptive Survey D |
| 1002 | COM-2447 | Extended Cluster D | education_campaign | 3 | 778560 | Primary Corridor |
| 1003 | COM-2454 | Pilot Review | health_initiative | 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series |

This view connects CSR components to their assigned geographic regions, answering where each programme element is intended to operate. The row for COM-2447 (Extended Cluster D, type education_campaign) mapped to geographic region 778560 (Primary Corridor, type city) demonstrates the granularity of geographic targeting. The view includes the region's population and primary language, providing context for component design and localization requirements.

## Executive-Professional and Executive-Business Unit Relationships

**View `v_executive_role_professional`**

```sql
CREATE VIEW v_executive_role_professional AS
SELECT a.executive_role_id, a.role_identifier, a.role_title, a.department, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM executive_roles a JOIN professionals b ON a.professional_id = b.id;
```

| executive_role_id | role_identifier | role_title | department | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 1 | ROL-2012 | Distributed Standard | adaptive-departme-89 | 1 | 5082965 | Theodore Mcgrath |
| 2 | ROL-2016 | Adaptive Framework D | distributed-departme-90 | 2 | 2618560 | Account Name |
| 3 | ROL-2020 | Primary Protocol | baseline-departme-91 | 3 | 3355767 | Saipan International Airport |
| 4 | ROL-2024 | Composite Programme | pilot-departme-92 | 4 | 3355784 | Norma Fisher |

This view links executive roles to the professionals who occupy them, bridging organizational structure with human capital. The row for role ROL-2012 (Distributed Standard) paired with professional Theodore Mcgrath (employer: Singapore General Hospital, expertise: pilot-primary-80) illustrates the personnel assignment. The view surfaces the professional's full name, birth date, and educational institution, providing a complete picture of the role holder's background.

**View `v_executive_role_business_unit`**

```sql
CREATE VIEW v_executive_role_business_unit AS
SELECT a.executive_role_id, a.role_identifier, a.role_title, a.department, b.business_unit_id AS unit_business_unit_id, b.unit_identifier AS unit_unit_identifier, b.unit_name AS unit_unit_name
FROM executive_roles a JOIN business_units b ON a.business_unit_id = b.business_unit_id;
```

| executive_role_id | role_identifier | role_title | department | unit_business_unit_id | unit_unit_identifier | unit_unit_name |
|---|---|---|---|---|---|---|
| 1 | ROL-2012 | Distributed Standard | adaptive-departme-89 | 1 | UNI-2580 | Compact Series |
| 2 | ROL-2016 | Adaptive Framework D | distributed-departme-90 | 2 | UNI-2584 | Legacy Assessment |
| 3 | ROL-2020 | Primary Protocol | baseline-departme-91 | 3 | UNI-2588 | Regional Survey A |
| 4 | ROL-2024 | Composite Programme | pilot-departme-92 | 4 | UNI-2592 | Seasonal Corridor |

By joining executive roles with their associated business units, this view clarifies the operational context of each role. The row for ROL-2016 (Adaptive Framework D) linked to business unit UNI-2584 (Legacy Assessment, sector consumer_products, revenue 21.40, 428 employees) shows how governance roles are embedded within specific operational divisions. The employment status and temporal boundaries of the role are preserved alongside the business unit's financial and workforce metrics.

**View `v_executive_role_corporate_responsibility_programme`**

```sql
CREATE VIEW v_executive_role_corporate_responsibility_programme AS
SELECT a.executive_role_id, a.role_identifier, a.role_title, a.department, b.id AS programme_id, b.programme_identifier AS programme_programme_identifier, b.programme_name AS programme_programme_name
FROM executive_roles a JOIN corporate_responsibility_programmes b ON a.corporate_responsibility_programme_id = b.id;
```

| executive_role_id | role_identifier | role_title | department | programme_id | programme_programme_identifier | programme_programme_name |
|---|---|---|---|---|---|---|
| 1 | ROL-2012 | Distributed Standard | adaptive-departme-89 | 1 | PRO-2239 | Extended Standard |
| 2 | ROL-2016 | Adaptive Framework D | distributed-departme-90 | 2 | PRO-2245 | Pilot Framework A |
| 3 | ROL-2020 | Primary Protocol | baseline-departme-91 | 3 | PRO-2251 | Baseline Protocol |
| 4 | ROL-2024 | Composite Programme | pilot-departme-92 | 4 | PRO-2257 | Distributed Programme |

This view presents executive roles with their assigned corporate responsibility programmes, completing the accountability triangle. The row for ROL-2020 (Primary Protocol) paired with programme PRO-2251 (Baseline Protocol, scope local, status completed) demonstrates the full lifecycle visibility. The programme's start date and the role's employment status together indicate whether the role holder was active during the programme's execution phase.

## Business Unit Relationships

**View `v_business_unit_executive_role`**

```sql
CREATE VIEW v_business_unit_executive_role AS
SELECT a.business_unit_id, a.unit_identifier, a.unit_name, a.sector, b.executive_role_id AS role_executive_role_id, b.role_identifier AS role_role_identifier, b.role_title AS role_role_title
FROM business_units a JOIN executive_roles b ON a.executive_role_id = b.executive_role_id;
```

| business_unit_id | unit_identifier | unit_name | sector | role_executive_role_id | role_role_identifier | role_role_title |
|---|---|---|---|---|---|---|
| 1 | UNI-2580 | Compact Series | media_networks | 1 | ROL-2012 | Distributed Standard |
| 2 | UNI-2584 | Legacy Assessment | consumer_products | 2 | ROL-2016 | Adaptive Framework D |
| 3 | UNI-2588 | Regional Survey A | interactive_media | 3 | ROL-2020 | Primary Protocol |
| 4 | UNI-2592 | Seasonal Corridor | entertainment | 4 | ROL-2024 | Composite Programme |

This view inverts the executive-business unit relationship, presenting business units with their assigned executive roles. The row for UNI-2588 (Regional Survey A, sector interactive_media, 3 employees) linked to executive role ROL-2020 (Primary Protocol, department baseline-departme-91) shows how smaller units are governed. The view includes the role's start and end dates, enabling analysis of leadership tenure relative to unit operations.

**View `v_business_unit_geographic_region`**

```sql
CREATE VIEW v_business_unit_geographic_region AS
SELECT a.business_unit_id, a.unit_identifier, a.unit_name, a.sector, b.id AS region_id, b.region_code AS region_region_code, b.region_name AS region_region_name
FROM business_units a JOIN geographic_regions b ON a.geographic_region_id = b.id;
```

| business_unit_id | unit_identifier | unit_name | sector | region_id | region_region_code | region_region_name |
|---|---|---|---|---|---|---|
| 1 | UNI-2580 | Compact Series | media_networks | 1 | 1562837 | Distributed Assessment |
| 2 | UNI-2584 | Legacy Assessment | consumer_products | 2 | 6564391 | Adaptive Survey D |
| 3 | UNI-2588 | Regional Survey A | interactive_media | 3 | 778560 | Primary Corridor |
| 4 | UNI-2592 | Seasonal Corridor | entertainment | 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series |

This view connects business units to their geographic regions, answering where each operational division operates. The row for UNI-2592 (Seasonal Corridor, sector entertainment, revenue 26.80) mapped to geographic region 8667ec1da10c4a0293d91388b49bc77c (Composite Series, type market) demonstrates the market-level granularity of some operations. The region's population and primary language provide essential context for regional strategy.

**View `v_geographic_region_business_unit`**

```sql
CREATE VIEW v_geographic_region_business_unit AS
SELECT a.id, a.region_code, a.region_name, a.region_type, b.business_unit_id AS unit_business_unit_id, b.unit_identifier AS unit_unit_identifier, b.unit_name AS unit_unit_name
FROM geographic_regions a JOIN business_units b ON a.business_unit_id = b.business_unit_id;
```

| id | region_code | region_name | region_type | unit_business_unit_id | unit_unit_identifier | unit_unit_name |
|---|---|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | continent | 1 | UNI-2580 | Compact Series |
| 2 | 6564391 | Adaptive Survey D | country | 2 | UNI-2584 | Legacy Assessment |
| 3 | 778560 | Primary Corridor | city | 3 | UNI-2588 | Regional Survey A |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | market | 4 | UNI-2592 | Seasonal Corridor |

Inverting the geographic-business unit relationship, this view presents regions with their associated business units. The row for region 1562837 (Distributed Assessment, type continent, population 42) linked to business unit UNI-2580 (Compact Series, media_networks) shows how continental-scale regions can host specific operational divisions. The view preserves the business unit's revenue and employee count, enabling geographic-level aggregation of operational metrics.

## Geographic-Component Relationships

**View `v_geographic_region_c_s_r_component`**

```sql
CREATE VIEW v_geographic_region_c_s_r_component AS
SELECT a.id, a.region_code, a.region_name, a.region_type, b.id AS component_id, b.component_identifier AS component_component_identifier, b.component_name AS component_component_name
FROM geographic_regions a JOIN c_s_r_components b ON a.c_s_r_component_id = b.id;
```

| id | region_code | region_name | region_type | component_id | component_component_identifier | component_component_name |
|---|---|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | continent | 1000 | COM-2433 | Seasonal Initiative |
| 2 | 6564391 | Adaptive Survey D | country | 1001 | COM-2440 | Integrated Model |
| 3 | 778560 | Primary Corridor | city | 1002 | COM-2447 | Extended Cluster D |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | market | 1003 | COM-2454 | Pilot Review |

This view links geographic regions to their assigned CSR components, providing a geographic lens on programme content. The row for region 6564391 (Adaptive Survey D, type country, population 49) paired with component COM-2440 (Integrated Model, budget 18.47, target compact-target-26) demonstrates how regional characteristics inform component design. The component's type and target audience are surfaced alongside the region's primary language, supporting localization analysis.

## Professional Relationships

**View `v_professional_executive_role`**

```sql
CREATE VIEW v_professional_executive_role AS
SELECT a.id, a.professional_id, a.full_name, a.birth_date, b.executive_role_id AS role_executive_role_id, b.role_identifier AS role_role_identifier, b.role_title AS role_role_title
FROM professionals a JOIN executive_roles b ON a.executive_role_id = b.executive_role_id;
```

| id | professional_id | full_name | birth_date | role_executive_role_id | role_role_identifier | role_role_title |
|---|---|---|---|---|---|---|
| 1 | 5082965 | Theodore Mcgrath | 2023-10-18 | 1 | ROL-2012 | Distributed Standard |
| 2 | 2618560 | Account Name | 2024-03-02 | 2 | ROL-2016 | Adaptive Framework D |
| 3 | 3355767 | Saipan International Airport | 2025-08-13 | 3 | ROL-2020 | Primary Protocol |
| 4 | 3355784 | Norma Fisher | 2022-01-24 | 4 | ROL-2024 | Composite Programme |

This view presents professionals with their assigned executive roles, providing a personnel-centric view of governance. The row for professional Theodore Mcgrath (employer: Singapore General Hospital, expertise: pilot-primary-80) linked to executive role ROL-2012 (Distributed Standard, department adaptive-departme-89) shows the professional's organizational placement. The role's employment status and temporal boundaries indicate the professional's current standing within the role.

**View `v_professional_educational_institution`**

```sql
CREATE VIEW v_professional_educational_institution AS
SELECT a.id, a.professional_id, a.full_name, a.birth_date, b.id AS institution_id, b.institution_id AS institution_institution_id, b.institution_name AS institution_institution_name
FROM professionals a JOIN educational_institutions b ON a.educational_institution_id = b.id;
```

| id | professional_id | full_name | birth_date | institution_id | institution_institution_id | institution_institution_name |
|---|---|---|---|---|---|---|
| 1 | 5082965 | Theodore Mcgrath | 2023-10-18 | 1 | 9424913 | Extended Corridor |
| 2 | 2618560 | Account Name | 2024-03-02 | 2 | 8189481 | Pilot Series A |
| 3 | 3355767 | Saipan International Airport | 2025-08-13 | 3 | 1437604 | Baseline Assessment |
| 4 | 3355784 | Norma Fisher | 2022-01-24 | 4 | 884346 | Distributed Survey |

This view connects professionals to their educational institutions, completing the professional profile. The row for professional Norma Fisher (employer: ACExcellent Consulting Pte Ltd, expertise: seasonal-primary-83) linked to educational institution 4 demonstrates the academic provenance of the professional. This linkage supports competency analysis and institutional partnership tracking.

## Educational Institution Relationships

**View `v_educational_institution_professional`**

```sql
CREATE VIEW v_educational_institution_professional AS
SELECT a.id, a.institution_id, a.institution_name, a.location, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM educational_institutions a JOIN professionals b ON a.professional_id = b.id;
```

| id | institution_id | institution_name | location | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Corridor | extended-location-99 | 1 | 5082965 | Theodore Mcgrath |
| 2 | 8189481 | Pilot Series A | integrated-location-100 | 2 | 2618560 | Account Name |
| 3 | 1437604 | Baseline Assessment | seasonal-location-101 | 3 | 3355767 | Saipan International Airport |
| 4 | 884346 | Distributed Survey | regional-location-102 | 4 | 3355784 | Norma Fisher |

Inverting the professional-institution relationship, this view presents educational institutions with their associated professionals. The row for institution 1 linked to professional Theodore Mcgrath shows how institutions can be analyzed by their alumni placements in executive roles. The professional's current employer and primary expertise provide context for institutional impact assessment.

**View `v_educational_institution_geographic_region`**

```sql
CREATE VIEW v_educational_institution_geographic_region AS
SELECT a.id, a.institution_id, a.institution_name, a.location, b.id AS region_id, b.region_code AS region_region_code, b.region_name AS region_region_name
FROM educational_institutions a JOIN geographic_regions b ON a.geographic_region_id = b.id;
```

| id | institution_id | institution_name | location | region_id | region_region_code | region_region_name |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Corridor | extended-location-99 | 1 | 1562837 | Distributed Assessment |
| 2 | 8189481 | Pilot Series A | integrated-location-100 | 2 | 6564391 | Adaptive Survey D |
| 3 | 1437604 | Baseline Assessment | seasonal-location-101 | 3 | 778560 | Primary Corridor |
| 4 | 884346 | Distributed Survey | regional-location-102 | 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series |

This view links educational institutions to geographic regions, answering where institution-affiliated professionals operate. The row for institution 2 linked to geographic region 6564391 (Adaptive Survey D, type country) demonstrates the geographic distribution of institutional talent. The region's population and primary language provide context for regional professional deployment.

## Campaign Relationships

**View `v_campaign_professional`**

```sql
CREATE VIEW v_campaign_professional AS
SELECT a.id, a.campaign_id, a.campaign_title, a.launch_date, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM campaigns a JOIN professionals b ON a.professional_id = b.id;
```

| id | campaign_id | campaign_title | launch_date | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 1 | 7021001070100 | Primary Standard A | 2022-05-17T16:36:00 | 1 | 5082965 | Theodore Mcgrath |
| 2 | 1437599 | Composite Framework | 2023-10-01T23:53:00 | 2 | 2618560 | Account Name |
| 3 | 2106708 | Compact Protocol | 2024-03-12T06:10:00 | 3 | 3355767 | Saipan International Airport |
| 4 | 4985162 | Legacy Programme D | 2025-08-23T13:27:00 | 4 | 3355784 | Norma Fisher |

This view connects campaigns to the professionals responsible for their execution, bridging outreach activities with personnel accountability. The row for a campaign linked to professional Theodore Mcgrath shows how campaign leadership is assigned. The professional's expertise and current employer provide context for campaign strategy and execution capability.

**View `v_campaign_geographic_region_detail`**

```sql
CREATE VIEW v_campaign_geographic_region_detail AS
SELECT a.id, a.campaign_id, a.campaign_title, b.id AS region_id, b.region_code AS region_region_code, b.region_name AS region_region_name
FROM campaigns a
  JOIN campaigns_regions j ON j.campaign_id = a.id
  JOIN geographic_regions b ON b.id = j.geographic_region_id;
```

| id | campaign_id | campaign_title | region_id | region_region_code | region_region_name |
|---|---|---|---|---|---|
| 1 | 7021001070100 | Primary Standard A | 1 | 1562837 | Distributed Assessment |
| 1 | 7021001070100 | Primary Standard A | 2 | 6564391 | Adaptive Survey D |
| 2 | 1437599 | Composite Framework | 2 | 6564391 | Adaptive Survey D |
| 2 | 1437599 | Composite Framework | 3 | 778560 | Primary Corridor |
| 3 | 2106708 | Compact Protocol | 3 | 778560 | Primary Corridor |
| 3 | 2106708 | Compact Protocol | 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series |
| 4 | 4985162 | Legacy Programme D | 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series |
| 4 | 4985162 | Legacy Programme D | 1 | 1562837 | Distributed Assessment |

This view links campaigns to their deployed geographic regions, providing a spatial view of outreach activities. The row for a campaign mapped to geographic region 778560 (Primary Corridor, type city, population 56) demonstrates the regional targeting of campaigns. The region's primary language and the campaign's type together inform localization and messaging strategy.

**View `v_campaign_c_s_r_component`**

```sql
CREATE VIEW v_campaign_c_s_r_component AS
SELECT a.id, a.campaign_id, a.campaign_title, a.launch_date, b.id AS component_id, b.component_identifier AS component_component_identifier, b.component_name AS component_component_name
FROM campaigns a JOIN c_s_r_components b ON a.c_s_r_component_id = b.id;
```

| id | campaign_id | campaign_title | launch_date | component_id | component_component_identifier | component_component_name |
|---|---|---|---|---|---|---|
| 1 | 7021001070100 | Primary Standard A | 2022-05-17T16:36:00 | 1000 | COM-2433 | Seasonal Initiative |
| 2 | 1437599 | Composite Framework | 2023-10-01T23:53:00 | 1001 | COM-2440 | Integrated Model |
| 3 | 2106708 | Compact Protocol | 2024-03-12T06:10:00 | 1002 | COM-2447 | Extended Cluster D |
| 4 | 4985162 | Legacy Programme D | 2025-08-23T13:27:00 | 1003 | COM-2454 | Pilot Review |

This final view connects campaigns to their underlying CSR components, revealing the programme content that drives public-facing activities. The row for a campaign linked to component COM-2454 (Pilot Review, type health_initiative, budget 17.12) demonstrates how campaign messaging is grounded in specific programme elements. The component's target audience and parent programme context provide the strategic framework for campaign design.

## Synthesis

The data model presented here captures corporate responsibility as a multi-dimensional operational discipline. Programmes serve as the organizing container, each assigned to an executive role that provides governance and accountability. Within programmes, CSR components break initiatives into manageable, budgeted elements that are deployed across geographic regions and business units. Professionals staff the executive roles, bringing educational backgrounds and expertise to their assignments, while campaigns translate programme content into public-facing outreach activities. The junction tables—`programmes_components` and `campaigns_regions`—enable flexible many-to-many relationships that reflect the complexity of real-world corporate responsibility operations. Together, these tables and their derived views provide a comprehensive framework for tracking, analyzing, and managing corporate responsibility initiatives from strategic planning through geographic deployment and professional execution.