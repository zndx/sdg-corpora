Corporate responsibility management in a multi-unit enterprise requires tracking programmes across business divisions, geographic territories, and executive leadership structures. The domain model captures this complexity through a set of normalized base tables that separate concerns into distinct entity types — programmes, CSR components, executive roles, business units, geographic regions, professionals, educational institutions, and campaigns — linked by foreign keys and junction tables that materialize many-to-many relationships. The resulting schema supports a family of denormalized views that reconstruct domain facts for reporting and analysis.

## Base Entity Tables

The core of the model begins with `corporate_responsibility_programmes`, the central programme entity. Each row represents a distinct initiative with a unique `id` surrogate key, a human-readable `programme_identifier` such as `PRO-2239`, a descriptive `programme_name` like "Extended Standard" or "Pilot Framework A", a `start_date` timestamp, a `status` column constrained to values like `active`, `planned`, `completed`, or `suspended`, a `scope` dimension indicating whether the programme operates at `regional`, `global`, or `local` scale, and an `executive_role_id` foreign key that anchors the programme to its responsible executive. The `created_at` column records the metadata timestamp. For example, row 1 captures the "Extended Standard" programme (`PRO-2239`), launched on 2022-09-05, currently `active` at `regional` scope, assigned to executive role 1.

**Table `corporate_responsibility_programmes`**

| id | programme_identifier | programme_name | start_date | status | scope | executive_role_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | PRO-2239 | Extended Standard | 2022-09-05T20:24:00 | active | regional | 1 | 2025-01-01 00:14:00 |
| 2 | PRO-2245 | Pilot Framework A | 2023-02-16T03:41:00 | planned | global | 2 | 2025-02-06 03:14:00 |
| 3 | PRO-2251 | Baseline Protocol | 2024-07-27T10:58:00 | completed | local | 3 | 2025-03-11 06:14:00 |
| 4 | PRO-2257 | Distributed Programme | 2025-12-11T17:15:00 | suspended | regional | 4 | 2025-04-16 09:14:00 |

CSR components form a second foundational entity in `c_s_r_components`. Each component is a discrete activity within a programme, identified by `id`, `component_identifier` (e.g., `COM-2433` for "Seasonal Initiative"), `component_name`, a `component_type` enum such as `community_engagement`, `strategic_philanthropy`, `education_campaign`, or `health_initiative`, a `budget` expressed as a decimal (35.45 for the Seasonal Initiative), a `target_audience` string like `legacy-target-25`, and two foreign keys: `corporate_responsibility_programme_id` linking the component to its parent programme, and `geographic_region_id` anchoring it to a territory. Row 1000, the "Seasonal Initiative" (`COM-2433`), is a `community_engagement` component with a budget of 35.45 targeting `legacy-target-25`, belonging to programme 1 and region 1.

**Table `c_s_r_components`**

| id | component_identifier | component_name | component_type | budget | target_audience | corporate_responsibility_programme_id | geographic_region_id |
|---|---|---|---|---|---|---|---|
| 1000 | COM-2433 | Seasonal Initiative | community_engagement | 35.45 | legacy-target-25 | 1 | 1 |
| 1001 | COM-2440 | Integrated Model | strategic_philanthropy | 18.47 | compact-target-26 | 2 | 2 |
| 1002 | COM-2447 | Extended Cluster D | education_campaign | 26.25 | composite-target-27 | 3 | 3 |
| 1003 | COM-2454 | Pilot Review | health_initiative | 17.12 | primary-target-28 | 4 | 4 |

Executive roles are captured in `executive_roles`, which serves as a bridge between people, organisational units, and programmes. The table's primary key is `executive_role_id`, complemented by `role_identifier` (`ROL-2012`), `role_title` ("Distributed Standard"), `department` (`adaptive-departme-89`), `start_date` and `end_date` defining the tenure window, `employment_status` (`active`, `former`, or `contract`), and three foreign keys: `professional_id` pointing to the person occupying the role, `business_unit_id` identifying the organisational unit, and `corporate_responsibility_programme_id` linking the role to a programme. Row 1 (ROL-2012) shows Theodore Mcgrath in an `active` capacity within business unit 1, responsible for programme 1.

**Table `executive_roles`**

| executive_role_id | role_identifier | role_title | department | start_date | end_date | employment_status | professional_id | business_unit_id | corporate_responsibility_programme_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ROL-2012 | Distributed Standard | adaptive-departme-89 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | active | 1 | 1 | 1 |
| 2 | ROL-2016 | Adaptive Framework D | distributed-departme-90 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | former | 2 | 2 | 2 |
| 3 | ROL-2020 | Primary Protocol | baseline-departme-91 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | contract | 3 | 3 | 3 |
| 4 | ROL-2024 | Composite Programme | pilot-departme-92 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | active | 4 | 4 | 4 |

Business units are modelled in `business_units`, where each row represents a profit centre or division. The primary key is `business_unit_id`, with `unit_identifier` (`UNI-2580`), `unit_name` ("Compact Series"), `sector` (`media_networks`, `consumer_products`, `interactive_media`, `entertainment`), `revenue` as a decimal (18.70 for Compact Series), `employee_count` (131 employees), and two foreign keys: `executive_role_id` pointing to the executive leading the unit, and `geographic_region_id` indicating the unit's primary territory.

**Table `business_units`**

| business_unit_id | unit_identifier | unit_name | sector | revenue | employee_count | executive_role_id | geographic_region_id |
|---|---|---|---|---|---|---|---|
| 1 | UNI-2580 | Compact Series | media_networks | 18.70 | 131 | 1 | 1 |
| 2 | UNI-2584 | Legacy Assessment | consumer_products | 21.40 | 428 | 2 | 2 |
| 3 | UNI-2588 | Regional Survey A | interactive_media | 24.10 | 3 | 3 | 3 |
| 4 | UNI-2592 | Seasonal Corridor | entertainment | 26.80 | 9 | 4 | 4 |

Geographic regions live in `geographic_regions`, providing a territorial hierarchy. The primary key is `id`, with `region_code` (a hex string like `1562837` or `8667ec1da10c4a0293d91388b49bc77c`), `region_name` ("Distributed Assessment"), `region_type` (`continent`, `country`, `city`, `market`), `population` as an integer, `primary_language` (`primary-primary-10`), and two foreign keys: `business_unit_id` linking the region to a business unit, and `c_s_r_component_id` creating a reverse pointer back to a CSR component. Row 1 is a `continent`-level region with population 46, language `primary-primary-10`, associated with business unit 1 and CSR component 1000.

**Table `geographic_regions`**

| id | region_code | region_name | region_type | population | primary_language | business_unit_id | c_s_r_component_id |
|---|---|---|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | continent | 42 | primary-primary-10 | 1 | 1000 |
| 2 | 6564391 | Adaptive Survey D | country | 49 | adaptive-primary-11 | 2 | 1001 |
| 3 | 778560 | Primary Corridor | city | 56 | distributed-primary-12 | 3 | 1002 |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | market | 63 | baseline-primary-13 | 4 | 1003 |

Professionals are stored in `professionals`, the people table. The primary key is `id`, with `professional_id` (a numeric identifier like `5082965`), `full_name` ("Theodore Mcgrath", "Account Name", "Saipan International Airport", "Norma Fisher"), `birth_date`, `current_employer` ("Singapore General Hospital", "Viet Children's Aegis", "Standard Bank", "ACExcellent Consulting Pte Ltd"), `primary_expertise` (`pilot-primary-80`, `extended-primary-81`, `integrated-primary-82`, `seasonal-primary-83`), and two foreign keys: `executive_role_id` linking the professional to their role, and `educational_institution_id` pointing to their alma mater.

**Table `professionals`**

| id | professional_id | full_name | birth_date | current_employer | primary_expertise | executive_role_id | educational_institution_id |
|---|---|---|---|---|---|---|---|
| 1 | 5082965 | Theodore Mcgrath | 2023-10-18 | Singapore General Hospital | pilot-primary-80 | 1 | 1 |
| 2 | 2618560 | Account Name | 2024-03-02 | Viet Children's Aegis | extended-primary-81 | 2 | 2 |
| 3 | 3355767 | Saipan International Airport | 2025-08-13 | Standard Bank | integrated-primary-82 | 3 | 3 |
| 4 | 3355784 | Norma Fisher | 2022-01-24 | ACExcellent Consulting Pte Ltd | seasonal-primary-83 | 4 | 4 |

Educational institutions are captured in `educational_institutions`, referenced by the `educational_institution_id` foreign key in `professionals`. Each institution row provides the educational provenance for the professionals table.

**Table `educational_institutions`**

| id | institution_id | institution_name | location | founding_year | institution_type | professional_id | geographic_region_id |
|---|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Corridor | extended-location-99 | 43 | university | 1 | 1 |
| 2 | 8189481 | Pilot Series A | integrated-location-100 | 48 | college | 2 | 2 |
| 3 | 1437604 | Baseline Assessment | seasonal-location-101 | 53 | business_school | 3 | 3 |
| 4 | 884346 | Distributed Survey | regional-location-102 | 58 | research_institute | 4 | 4 |

Campaigns are modelled in `campaigns`, representing outreach or awareness initiatives that can be associated with professionals and geographic regions through junction tables.

**Table `campaigns`**

| id | campaign_id | campaign_title | launch_date | end_date | reach | campaign_status | professional_id | c_s_r_component_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 7021001070100 | Primary Standard A | 2022-05-17T16:36:00 | 2022-09-01T08:00:00 | 28 | planned | 1 | 1000 |
| 2 | 1437599 | Composite Framework | 2023-10-01T23:53:00 | 2023-02-12T15:17:00 | 36 | active | 2 | 1001 |
| 3 | 2106708 | Compact Protocol | 2024-03-12T06:10:00 | 2024-07-23T22:34:00 | 44 | completed | 3 | 1002 |
| 4 | 4985162 | Legacy Programme D | 2025-08-23T13:27:00 | 2025-12-07T05:51:00 | 52 | archived | 4 | 1003 |

## Junction Tables and Many-to-Many Relationships

The schema uses explicit junction tables to resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `programmes_components` table links `corporate_responsibility_programmes` to `c_s_r_components`, allowing a single programme to contain multiple components and a component to appear across programmes. This is the canonical many-to-many bridge: each row contains a `corporate_responsibility_programme_id` and a `c_s_r_component_id`, forming a composite foreign key pair.

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

Similarly, `campaigns_regions` connects `campaigns` to `geographic_regions`, enabling campaigns to target multiple territories and regions to host multiple campaigns. Each row holds a `campaign_id` and a `geographic_region_id`, forming the junction between the campaign and region entities.

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

## View-Based Fact Reconstruction

The normalized base tables are combined through a family of views that reconstruct domain facts for analytical consumption. Each view answers a specific business question by joining the relevant tables and projecting the columns needed for a particular reporting context.

The view `v_corporate_responsibility_programme_executive_role` joins `corporate_responsibility_programmes` with `executive_roles` on `executive_role_id`, producing a flat record that pairs each programme with its responsible executive. Row 1 shows "Extended Standard" (`PRO-2239`) linked to role ROL-2012 ("Distributed Standard") in department `adaptive-departme-89`, answering the question: which executive is accountable for which programme?

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

The view `v_corporate_responsibility_programme_c_s_r_component_detail` joins `corporate_responsibility_programmes` with `c_s_r_components` on `corporate_responsibility_programme_id`, surfacing each component alongside its parent programme's metadata. Row 1000 ("Seasonal Initiative", budget 35.45, type `community_engagement`) appears alongside programme "Extended Standard" (`PRO-2239`), answering: what components make up each programme, and what are their financial and audience parameters?

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

Conversely, `v_c_s_r_component_corporate_responsibility_programme` presents the same join from the component's perspective, with `c_s_r_components` as the driving table. Row 1000 ("Seasonal Initiative") is paired with programme 1 ("Extended Standard"), answering: which programme owns each CSR component?

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

The view `v_c_s_r_component_geographic_region` joins `c_s_r_components` with `geographic_regions` on `geographic_region_id`, revealing the territorial footprint of each component. Row 1000 ("Seasonal Initiative") is associated with region 1 ("Distributed Assessment", type `continent`, population 46), answering: in which geographic territories does each CSR component operate?

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

The view `v_executive_role_professional` joins `executive_roles` with `professionals` on `professional_id`, mapping each role to the person who fills it. Row 1 pairs role ROL-2012 ("Distributed Standard") with professional Theodore Mcgrath (`5082965`), employed at "Singapore General Hospital" with expertise `pilot-primary-80`, answering: who occupies each executive role?

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

The view `v_executive_role_business_unit` joins `executive_roles` with `business_units` on `business_unit_id`, showing which organisational unit each executive leads. Row 1 links role ROL-2012 to business unit "Compact Series" (`UNI-2580`) in the `media_networks` sector with revenue 18.70 and 131 employees, answering: which business unit is managed by each executive?

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

The view `v_executive_role_corporate_responsibility_programme` joins `executive_roles` with `corporate_responsibility_programmes` on `corporate_responsibility_programme_id`, connecting executives to the programmes they oversee. Row 1 shows role ROL-2012 ("Distributed Standard") responsible for programme "Extended Standard" (`PRO-2239`), answering: which programmes is each executive accountable for?

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

The view `v_business_unit_executive_role` joins `business_units` with `executive_roles` on `executive_role_id`, presenting the leadership structure from the business unit's perspective. Row 1 ("Compact Series", `media_networks`, revenue 18.70) is led by executive role ROL-2012 ("Distributed Standard"), answering: which executive leads each business unit?

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

The view `v_business_unit_geographic_region` joins `business_units` with `geographic_regions` on `geographic_region_id`, mapping organisational units to their primary territories. Row 1 ("Compact Series") is associated with region 1 ("Distributed Assessment", type `continent`), answering: which geographic region is each business unit primarily based in?

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

The view `v_geographic_region_business_unit` reverses the join, presenting regions as the driving table. Row 1 ("Distributed Assessment", type `continent`, population 46) is linked to business unit "Compact Series" (`UNI-2580`), answering: which business unit operates in each geographic region?

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

The view `v_geographic_region_c_s_r_component` joins `geographic_regions` with `c_s_r_components` on `c_s_r_component_id`, revealing which CSR components are active in each territory. Row 1 ("Distributed Assessment") is associated with component 1000 ("Seasonal Initiative", type `community_engagement`, budget 35.45), answering: what CSR components are deployed in each region?

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

The view `v_professional_executive_role` joins `professionals` with `executive_roles` on `executive_role_id`, presenting the professional as the driving entity. Row 1 (Theodore Mcgrath, `5082965`, employer "Singapore General Hospital", expertise `pilot-primary-80`) is linked to role ROL-2012 ("Distributed Standard"), answering: which executive role does each professional hold?

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

The view `v_professional_educational_institution` joins `professionals` with `educational_institutions` on `educational_institution_id`, surfacing the educational background of each professional. Row 1 (Theodore Mcgrath) is connected to educational institution 1, answering: where did each professional study?

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

The view `v_educational_institution_professional` reverses the join, presenting institutions as the driving table. Row 1 (institution 1) is linked to professional Theodore Mcgrath (`5082965`), answering: which professionals graduated from each institution?

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

The view `v_educational_institution_geographic_region` joins `educational_institutions` with `geographic_regions`, connecting educational institutions to geographic territories. Row 1 (institution 1) is associated with region 1 ("Distributed Assessment", type `continent`), answering: which regions are associated with each educational institution?

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

The view `v_campaign_professional` joins `campaigns` with `professionals`, linking outreach campaigns to the professionals involved. Row 1 connects a campaign to professional Theodore Mcgrath (`5082965`), answering: which professionals are engaged in each campaign?

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

The view `v_campaign_geographic_region_detail` joins `campaigns` with `geographic_regions`, revealing the territorial scope of each campaign. Row 1 links a campaign to region 1 ("Distributed Assessment", type `continent`, population 46), answering: in which regions does each campaign operate?

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

The view `v_campaign_c_s_r_component` joins `campaigns` with `c_s_r_components`, connecting outreach campaigns to the CSR components they support. Row 1 links a campaign to component 1000 ("Seasonal Initiative", type `community_engagement`, budget 35.45), answering: which CSR components are promoted by each campaign?

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

## Synthesis

The schema models corporate responsibility as a network of interrelated entities: programmes contain components, components operate in regions, executives lead business units and oversee programmes, professionals fill executive roles and carry educational pedigrees, and campaigns mobilise professionals across territories to advance CSR components. The foreign key graph forms a directed structure where `corporate_responsibility_programmes` anchors the programme hierarchy, `executive_roles` serves as the central hub connecting people to organisations to programmes, and `c_s_r_components` bridges programmes to geographic territories. Junction tables `programmes_components` and `campaigns_regions` resolve the many-to-many relationships that the star schema cannot express through simple foreign keys. The view layer then materialises these relationships into flat, queryable facts — each view answering a specific analytical question by joining the appropriate tables and projecting the relevant columns, allowing downstream consumers to reconstruct the domain model without navigating the normalized base schema directly.