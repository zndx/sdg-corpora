## The Campus Domain as a Normalized Relational Model

A university campus is a complex ecosystem of physical infrastructure, academic units, scheduled activities, and cultural artifacts. The domain model captures buildings that house departments, areas that contain gardens and statues, events that connect organizations to charitable causes, and monuments that commemorate historical figures. Every entity is persisted in its own table with a surrogate primary key, and relationships are expressed through foreign keys that enforce referential integrity. The following sections describe how the ontology materializes as a relational schema, how cardinality constraints shape the column layout, and how materialized views reconstruct domain facts from the normalized tables.

**Table `campus_buildings`**

| id | building_id | building_name | year_built | building_type | has_fiber_optic_cable | number_of_floors | academic_department_id | campus_area_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 10090 | Compact Initiative | 28 | Academic | false | 11 | 1 | 100 |
| 2 | 3744019 | Legacy Model | 37 | Residential | true | 22 | 2 | 101 |
| 3 | 3001009030150 | Regional Cluster A | 46 | Administrative | false | 33 | 3 | 102 |
| 4 | 325468 | Seasonal Review | 55 | Academic | true | 44 | 4 | 103 |

The `campus_buildings` table is the anchor of the physical infrastructure model. Its surrogate primary key `id` is a monotonically increasing integer, while the business identifier `building_id` carries a composite-style value such as `3001009030150` for "Regional Cluster A" or a short integer like `10090` for "Compact Initiative". The `building_name` column stores human-readable labels, and `building_type` classifies each structure into one of three categories: `Academic`, `Residential`, or `Administrative`. Boolean and numeric attributes — `has_fiber_optic_cable` and `number_of_floors` — capture infrastructure details; for instance, "Legacy Model" (building `3744019`) is a 22-floor residential building equipped with fiber, whereas "Compact Initiative" lacks fiber entirely. Two foreign keys, `academic_department_id` and `campus_area_id`, link each building to exactly one department and one campus area, respectively, enforcing a many-to-one cardinality from buildings to both dimensions.

**Table `academic_departments`**

| academic_department_id | department_id | department_name | parent_university | has_museum | offers_graduate_program | number_of_students | campus_building_id | campus_event_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2087755 | Baseline Framework D | legacy-parent-91 | true | false | 16 | 1 | 100 |
| 2 | 790483 | Distributed Protocol | compact-parent-92 | false | true | 20 | 2 | 101 |
| 3 | 505978 | Adaptive Programme | composite-parent-93 | true | false | 24 | 3 | 102 |
| 4 | id_6 | Primary Standard A | primary-parent-94 | false | true | 28 | 4 | 103 |

Academic departments are modeled in `academic_departments`, where the surrogate key `academic_department_id` (values 1 through 4) is distinct from the business `department_id`, which carries identifiers like `2087755` for "Baseline Framework D" or the string `id_6` for "Primary Standard A". The `department_name` column holds the human-readable name, while `parent_university` records the institutional lineage — values such as `legacy-parent-91`, `compact-parent-92`, and `primary-parent-94` trace back to their parent institutions. The boolean flags `has_museum` and `offers_graduate_program` describe programmatic capabilities, and `number_of_students` quantifies enrollment. Two foreign keys, `campus_building_id` and `campus_event_id`, tie each department to a specific building and a specific event, creating a bridge between the academic and operational layers of the campus.

**Table `campus_events`**

| campus_event_id | event_id | event_name | event_date | event_location | is_annual | charity_beneficiary | campus_area_id | student_organization_id | charity_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | seasonal-event-17 | false | compact-charity-50 | 100 | 1000 | 8350015 |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | regional-event-18 | true | composite-charity-51 | 101 | 1001 | 884370 |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | legacy-event-19 | false | primary-charity-52 | 102 | 1002 | 10238289 |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | compact-event-20 | true | adaptive-charity-53 | 103 | 1003 | 325 |

The `campus_events` table records scheduled activities across the campus. Its surrogate key `campus_event_id` is an integer (100–103), while the business `event_id` carries diverse formats: a compact integer like `168535`, a UUID such as `ab8e1d18-8fcd-11eb-924d-9cd76263cbd0`, or a short numeric code. The `event_name` column stores labels like "Seasonal Standard" and "Integrated Framework", and `event_date` captures the ISO-8601 timestamp of the event. The `event_location` field holds a coded location reference (e.g., `seasonal-event-17`), while `is_annual` is a boolean flag indicating recurrence. The `charity_beneficiary` column names the beneficiary charity (e.g., `compact-charity-50`), and three foreign keys — `campus_area_id`, `student_organization_id`, and `charity_id` — link each event to its physical setting, its organizing student body, and its charitable cause.

**Table `student_organizations`**

| id | org_id | org_name | org_type | is_philanthropic | founding_year | campus_event_id | academic_department_id |
|---|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | Sorority | false | 43 | 100 | 1 |
| 1001 | 1717 | Pilot Initiative A | Fraternity | true | 48 | 101 | 2 |
| 1002 | 69437 | Baseline Model | Club | false | 53 | 102 | 3 |
| 1003 | m16 | Distributed Cluster | Ensemble | true | 58 | 103 | 4 |

Student organizations are captured in `student_organizations`, keyed by surrogate `id` (1000–1003). The business `org_id` carries values like `790471` for "Extended Review" or the string `m16` for "Distributed Cluster". The `org_name` column stores the organization's name, and `org_type` classifies it as `Sorority`, `Fraternity`, `Club`, or `Ensemble`. The boolean `is_philanthropic` indicates whether the organization engages in charitable work — "Pilot Initiative A" and "Distributed Cluster" are philanthropic, while "Extended Review" and "Baseline Model" are not. The `founding_year` records the year of establishment. Two foreign keys, `campus_event_id` and `academic_department_id`, associate each organization with a specific event and a specific academic department, enabling queries that trace organizational participation across both dimensions.

**Table `campus_areas`**

| id | area_id | area_name | area_type | is_wireless_enabled | area_description | campus_building_id | statue_id | campus_area_id |
|---|---|---|---|---|---|---|---|---|
| 100 | default_chart_a_tax_19 | Primary Programme A | Garden | true | Pilot Protocol | 1 | 1000 | 100 |
| 101 | fro | Composite Standard | Quad | false | Baseline Programme | 2 | 1001 | 101 |
| 102 | account_pymes_296 | Compact Framework | ParkingLot | true | Distributed Standard A | 3 | 1002 | 102 |
| 103 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D | Path | false | Adaptive Framework | 4 | 1003 | 103 |

Campus areas form the spatial layer of the model. The `campus_areas` table uses surrogate `id` (100–103) as its primary key, while `area_id` carries business identifiers ranging from short strings like `fro` to UUIDs such as `57e52fbc-8fcd-11eb-9cd76263cbd0`. The `area_name` column holds labels like "Primary Programme A" and "Composite Standard", and `area_type` classifies the area as `Garden`, `Quad`, `ParkingLot`, or `Path`. The boolean `is_wireless_enabled` indicates connectivity, and `area_description` provides a free-text summary (e.g., "Pilot Protocol"). Three foreign keys — `campus_building_id`, `statue_id`, and `campus_area_id` — link each area to its parent building, any statue it contains, and a parent area, enabling a hierarchical spatial model where areas can nest within other areas.

**Table `statues`**

| id | statue_id | statue_name | dedicated_person | gift_from | dedication_year | is_decorated_by_students | campus_area_id | historical_figure_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 5844282 | Compact Series | James Graves | legacy-gift-73 | 12 | true | 100 | 1000 |
| 1001 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Legacy Assessment | Stephanie Collins | compact-gift-74 | 22 | false | 101 | 1001 |
| 1002 | 338534 | Regional Survey A | Sean Green | composite-gift-75 | 32 | true | 102 | 1002 |
| 1003 | 11210 | Seasonal Corridor | Cynthia Lewis | primary-gift-76 | 42 | false | 103 | 1003 |

Statues are cultural artifacts placed within campus areas. The `statues` table uses surrogate `id` (1000–1003) as its primary key, while `statue_id` carries business identifiers like `5844282` for "Compact Series" or a UUID for "Legacy Assessment". The `statue_name` column stores the monument's name, and `dedicated_person` records the honoree (e.g., "James Graves", "Stephanie Collins", "Sean Green", "Cynthia Lewis"). The `gift_from` column names the donor (e.g., `legacy-gift-73`), and `dedication_year` records the year of dedication. The boolean `is_decorated_by_students` captures whether students have adorned the statue. Two foreign keys, `campus_area_id` and `historical_figure_id`, link each statue to its physical location and the historical figure it commemorates.

**Table `historical_figures`**

| id | figure_id | full_name | birth_year | death_year | founded_institution | enrollment_date | statue_id |
|---|---|---|---|---|---|---|---|
| 1000 | 69443 | Theodore Mcgrath | 47 | 39 | baseline-founded-31 | 2022-05-11 | 1000 |
| 1001 | ChIJI_0BP4Bt5kcRqvGkKTwSztI | Account Name | 55 | 50 | pilot-founded-32 | 2023-10-22 | 1001 |
| 1002 | 2933461 | Saipan International Airport | 63 | 61 | extended-founded-33 | 2024-03-06 | 1002 |
| 1003 | 1437593 | Norma Fisher | 71 | 72 | integrated-founded-34 | 2025-08-17 | 1003 |

The `historical_figures` table stores records of individuals commemorated by statues. Each figure has a surrogate `id` and a business `figure_id`, along with `figure_name`, `era`, `notable_work`, `birth_year`, and `death_year`. The `campus_area_id` foreign key links each figure to a campus area, enabling queries that trace which areas host monuments to which historical persons.

**Table `charities`**

| charity_id | charity_name | target_beneficiaries | location | is_local | campus_event_id | student_organization_id |
|---|---|---|---|---|---|---|
| 8350015 | Composite Assessment | integrated-target-76 | extended-location-99 | true | 100 | 1000 |
| 884370 | Compact Survey A | seasonal-target-77 | integrated-location-100 | false | 101 | 1001 |
| 10238289 | Legacy Corridor | regional-target-78 | seasonal-location-101 | true | 102 | 1002 |
| 325 | Regional Series | legacy-target-79 | regional-location-102 | false | 103 | 1003 |

Charities are the beneficiaries of campus events. The `charities` table uses surrogate `id` and business `charity_id`, along with `charity_name`, `charity_type`, `founded_year`, and `mission_statement`. The `campus_event_id` foreign key links each charity to the events that benefit it, enabling queries that trace charitable impact across the event calendar.

### Materialized Views: Reconstructing Domain Facts

The normalized tables are connected through a set of materialized views, each of which joins two or more base tables to answer a specific domain question. The following sections interpret each view's join logic and illustrate its output with concrete rows.

**View `v_campus_building_academic_department`**

```sql
CREATE VIEW v_campus_building_academic_department AS
SELECT a.id, a.building_id, a.building_name, a.year_built, b.academic_department_id AS department_academic_department_id, b.department_id AS department_department_id, b.department_name AS department_department_name
FROM campus_buildings a JOIN academic_departments b ON a.academic_department_id = b.academic_department_id;
```

| id | building_id | building_name | year_built | department_academic_department_id | department_department_id | department_department_name |
|---|---|---|---|---|---|---|
| 1 | 10090 | Compact Initiative | 28 | 1 | 2087755 | Baseline Framework D |
| 2 | 3744019 | Legacy Model | 37 | 2 | 790483 | Distributed Protocol |
| 3 | 3001009030150 | Regional Cluster A | 46 | 3 | 505978 | Adaptive Programme |
| 4 | 325468 | Seasonal Review | 55 | 4 | id_6 | Primary Standard A |

This view joins `campus_buildings` to `academic_departments` on `campus_building_id = academic_department_id`, answering the question: "Which academic department occupies which building?" A row from the view might show building "Compact Initiative" (id 1) paired with department "Baseline Framework D" (academic_department_id 1), revealing that the Academic-type building houses the department with 16 students and a museum.

**View `v_campus_building_campus_area`**

```sql
CREATE VIEW v_campus_building_campus_area AS
SELECT a.id, a.building_id, a.building_name, a.year_built, b.id AS area_id, b.area_id AS area_area_id, b.area_name AS area_area_name
FROM campus_buildings a JOIN campus_areas b ON a.campus_area_id = b.id;
```

| id | building_id | building_name | year_built | area_id | area_area_id | area_area_name |
|---|---|---|---|---|---|---|
| 1 | 10090 | Compact Initiative | 28 | 100 | default_chart_a_tax_19 | Primary Programme A |
| 2 | 3744019 | Legacy Model | 37 | 101 | fro | Composite Standard |
| 3 | 3001009030150 | Regional Cluster A | 46 | 102 | account_pymes_296 | Compact Framework |
| 4 | 325468 | Seasonal Review | 55 | 103 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D |

By joining `campus_buildings` to `campus_areas` on `campus_area_id`, this view answers: "Which campus area contains which building?" For example, building "Regional Cluster A" (id 3) appears alongside area "Compact Framework" (id 102), a wireless-enabled ParkingLot area, indicating the spatial containment relationship.

**View `v_academic_department_campus_building`**

```sql
CREATE VIEW v_academic_department_campus_building AS
SELECT a.academic_department_id, a.department_id, a.department_name, a.parent_university, b.id AS building_id, b.building_id AS building_building_id, b.building_name AS building_building_name
FROM academic_departments a JOIN campus_buildings b ON a.campus_building_id = b.id;
```

| academic_department_id | department_id | department_name | parent_university | building_id | building_building_id | building_building_name |
|---|---|---|---|---|---|---|
| 1 | 2087755 | Baseline Framework D | legacy-parent-91 | 1 | 10090 | Compact Initiative |
| 2 | 790483 | Distributed Protocol | compact-parent-92 | 2 | 3744019 | Legacy Model |
| 3 | 505978 | Adaptive Programme | composite-parent-93 | 3 | 3001009030150 | Regional Cluster A |
| 4 | id_6 | Primary Standard A | primary-parent-94 | 4 | 325468 | Seasonal Review |

This is the inverse of the building-to-department view, joining `academic_departments` to `campus_buildings` on `campus_building_id`. It answers: "Which building hosts which department?" A row might show department "Distributed Protocol" (academic_department_id 2) in building "Legacy Model" (id 2), a 22-floor residential building with fiber optic cable.

**View `v_academic_department_campus_event`**

```sql
CREATE VIEW v_academic_department_campus_event AS
SELECT a.academic_department_id, a.department_id, a.department_name, a.parent_university, b.campus_event_id AS event_campus_event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM academic_departments a JOIN campus_events b ON a.campus_event_id = b.campus_event_id;
```

| academic_department_id | department_id | department_name | parent_university | event_campus_event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|---|
| 1 | 2087755 | Baseline Framework D | legacy-parent-91 | 100 | 2002007020060 | Seasonal Standard |
| 2 | 790483 | Distributed Protocol | compact-parent-92 | 101 | 168535 | Integrated Framework |
| 3 | 505978 | Adaptive Programme | composite-parent-93 | 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 4 | id_6 | Primary Standard A | primary-parent-94 | 103 | 1186089 | Pilot Programme |

Joining `academic_departments` to `campus_events` on `campus_event_id`, this view answers: "Which academic department is associated with which campus event?" For instance, department "Adaptive Programme" (academic_department_id 3) appears alongside event "Extended Protocol D" (campus_event_id 102), a legacy-event held on 2023-02-10 benefiting primary-charity-52.

**View `v_campus_event_campus_area`**

```sql
CREATE VIEW v_campus_event_campus_area AS
SELECT a.campus_event_id, a.event_id, a.event_name, a.event_date, b.id AS area_id, b.area_id AS area_area_id, b.area_name AS area_area_name
FROM campus_events a JOIN campus_areas b ON a.campus_area_id = b.id;
```

| campus_event_id | event_id | event_name | event_date | area_id | area_area_id | area_area_name |
|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | 100 | default_chart_a_tax_19 | Primary Programme A |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | 101 | fro | Composite Standard |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | 102 | account_pymes_296 | Compact Framework |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | 103 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D |

This view joins `campus_events` to `campus_areas` on `campus_area_id`, answering: "In which campus area is each event held?" A row might show event "Seasonal Standard" (campus_event_id 100) held in area "Primary Programme A" (id 100), a wireless-enabled Garden area.

**View `v_campus_event_student_organization`**

```sql
CREATE VIEW v_campus_event_student_organization AS
SELECT a.campus_event_id, a.event_id, a.event_name, a.event_date, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM campus_events a JOIN student_organizations b ON a.student_organization_id = b.id;
```

| campus_event_id | event_id | event_name | event_date | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | 1000 | 790471 | Extended Review |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | 1001 | 1717 | Pilot Initiative A |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | 1002 | 69437 | Baseline Model |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | 1003 | m16 | Distributed Cluster |

By joining `campus_events` to `student_organizations` on `student_organization_id`, this view answers: "Which student organization organizes which event?" For example, event "Integrated Framework" (campus_event_id 101) is organized by organization "Pilot Initiative A" (id 1001), a philanthropic Fraternity founded in year 48.

**View `v_campus_event_charity`**

```sql
CREATE VIEW v_campus_event_charity AS
SELECT a.campus_event_id, a.event_id, a.event_name, a.event_date, b.charity_id AS charity_charity_id, b.charity_name AS charity_charity_name, b.target_beneficiaries AS charity_target_beneficiaries
FROM campus_events a JOIN charities b ON a.charity_id = b.charity_id;
```

| campus_event_id | event_id | event_name | event_date | charity_charity_id | charity_charity_name | charity_target_beneficiaries |
|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | 8350015 | Composite Assessment | integrated-target-76 |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | 884370 | Compact Survey A | seasonal-target-77 |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | 10238289 | Legacy Corridor | regional-target-78 |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | 325 | Regional Series | legacy-target-79 |

This view joins `campus_events` to `charities` on `charity_id`, answering: "Which charity benefits from each event?" A row might show event "Pilot Programme" (campus_event_id 103) benefiting charity with id `325`, an adaptive-charity.

**View `v_student_organization_campus_event`**

```sql
CREATE VIEW v_student_organization_campus_event AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.campus_event_id AS event_campus_event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM student_organizations a JOIN campus_events b ON a.campus_event_id = b.campus_event_id;
```

| id | org_id | org_name | org_type | event_campus_event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | Sorority | 100 | 2002007020060 | Seasonal Standard |
| 1001 | 1717 | Pilot Initiative A | Fraternity | 101 | 168535 | Integrated Framework |
| 1002 | 69437 | Baseline Model | Club | 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 1003 | m16 | Distributed Cluster | Ensemble | 103 | 1186089 | Pilot Programme |

The inverse of the event-to-organization view, joining `student_organizations` to `campus_events` on `campus_event_id`, answers: "Which event is each student organization associated with?" For instance, organization "Extended Review" (id 1000), a non-philanthropic Sorority, is associated with event "Seasonal Standard" (campus_event_id 100).

**View `v_student_organization_academic_department`**

```sql
CREATE VIEW v_student_organization_academic_department AS
SELECT a.id, a.org_id, a.org_name, a.org_type, b.academic_department_id AS department_academic_department_id, b.department_id AS department_department_id, b.department_name AS department_department_name
FROM student_organizations a JOIN academic_departments b ON a.academic_department_id = b.academic_department_id;
```

| id | org_id | org_name | org_type | department_academic_department_id | department_department_id | department_department_name |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | Sorority | 1 | 2087755 | Baseline Framework D |
| 1001 | 1717 | Pilot Initiative A | Fraternity | 2 | 790483 | Distributed Protocol |
| 1002 | 69437 | Baseline Model | Club | 3 | 505978 | Adaptive Programme |
| 1003 | m16 | Distributed Cluster | Ensemble | 4 | id_6 | Primary Standard A |

Joining `student_organizations` to `academic_departments` on `academic_department_id`, this view answers: "Which academic department sponsors which student organization?" A row might show organization "Distributed Cluster" (id 1003), a philanthropic Ensemble, sponsored by department "Primary Standard A" (academic_department_id 4), which offers graduate programs and has 28 students.

**View `v_campus_area_campus_building`**

```sql
CREATE VIEW v_campus_area_campus_building AS
SELECT a.id, a.area_id, a.area_name, a.area_type, b.id AS building_id, b.building_id AS building_building_id, b.building_name AS building_building_name
FROM campus_areas a JOIN campus_buildings b ON a.campus_building_id = b.id;
```

| id | area_id | area_name | area_type | building_id | building_building_id | building_building_name |
|---|---|---|---|---|---|---|
| 100 | default_chart_a_tax_19 | Primary Programme A | Garden | 1 | 10090 | Compact Initiative |
| 101 | fro | Composite Standard | Quad | 2 | 3744019 | Legacy Model |
| 102 | account_pymes_296 | Compact Framework | ParkingLot | 3 | 3001009030150 | Regional Cluster A |
| 103 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D | Path | 4 | 325468 | Seasonal Review |

This view joins `campus_areas` to `campus_buildings` on `campus_building_id`, answering: "Which building is each campus area associated with?" For example, area "Composite Standard" (id 101), a non-wireless Quad, is associated with building "Legacy Model" (id 2).

**View `v_campus_area_statue`**

```sql
CREATE VIEW v_campus_area_statue AS
SELECT a.id, a.area_id, a.area_name, a.area_type, b.id AS statue_id, b.statue_id AS statue_statue_id, b.statue_name AS statue_statue_name
FROM campus_areas a JOIN statues b ON a.statue_id = b.id;
```

| id | area_id | area_name | area_type | statue_id | statue_statue_id | statue_statue_name |
|---|---|---|---|---|---|---|
| 100 | default_chart_a_tax_19 | Primary Programme A | Garden | 1000 | 5844282 | Compact Series |
| 101 | fro | Composite Standard | Quad | 1001 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Legacy Assessment |
| 102 | account_pymes_296 | Compact Framework | ParkingLot | 1002 | 338534 | Regional Survey A |
| 103 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D | Path | 1003 | 11210 | Seasonal Corridor |

By joining `campus_areas` to `statues` on `statue_id`, this view answers: "Which statue is located in each campus area?" A row might show area "Compact Framework" (id 102) containing statue "Regional Survey A" (id 1002), dedicated to Sean Green and decorated by students.

**View `v_campus_area_campus_area`**

```sql
CREATE VIEW v_campus_area_campus_area AS
SELECT a.id, a.area_id, a.area_name, a.area_type, b.id AS area_id, b.area_id AS area_area_id, b.area_name AS area_area_name
FROM campus_areas a JOIN campus_areas b ON a.campus_area_id = b.id;
```

| id | area_id | area_name | area_type | area_id | area_area_id | area_area_name |
|---|---|---|---|---|---|---|
| 100 | default_chart_a_tax_19 | Primary Programme A | Garden | 100 | default_chart_a_tax_19 | Primary Programme A |
| 101 | fro | Composite Standard | Quad | 101 | fro | Composite Standard |
| 102 | account_pymes_296 | Compact Framework | ParkingLot | 102 | account_pymes_296 | Compact Framework |
| 103 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D | Path | 103 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D |

This self-join on `campus_area_id` answers: "Which campus area is a child of which parent area?" For instance, area "Legacy Protocol D" (id 103) might be a child of area "Primary Programme A" (id 100), revealing the hierarchical nesting of campus spaces.

**View `v_statue_campus_area`**

```sql
CREATE VIEW v_statue_campus_area AS
SELECT a.id, a.statue_id, a.statue_name, a.dedicated_person, b.id AS area_id, b.area_id AS area_area_id, b.area_name AS area_area_name
FROM statues a JOIN campus_areas b ON a.campus_area_id = b.id;
```

| id | statue_id | statue_name | dedicated_person | area_id | area_area_id | area_area_name |
|---|---|---|---|---|---|---|
| 1000 | 5844282 | Compact Series | James Graves | 100 | default_chart_a_tax_19 | Primary Programme A |
| 1001 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Legacy Assessment | Stephanie Collins | 101 | fro | Composite Standard |
| 1002 | 338534 | Regional Survey A | Sean Green | 102 | account_pymes_296 | Compact Framework |
| 1003 | 11210 | Seasonal Corridor | Cynthia Lewis | 103 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D |

The inverse of the area-to-statue view, joining `statues` to `campus_areas` on `campus_area_id`, answers: "In which campus area is each statue located?" For example, statue "Compact Series" (id 1000), dedicated to James Graves in year 12, is located in area "Primary Programme A" (id 100).

**View `v_statue_historical_figure`**

```sql
CREATE VIEW v_statue_historical_figure AS
SELECT a.id, a.statue_id, a.statue_name, a.dedicated_person, b.id AS figure_id, b.figure_id AS figure_figure_id, b.full_name AS figure_full_name
FROM statues a JOIN historical_figures b ON a.historical_figure_id = b.id;
```

| id | statue_id | statue_name | dedicated_person | figure_id | figure_figure_id | figure_full_name |
|---|---|---|---|---|---|---|
| 1000 | 5844282 | Compact Series | James Graves | 1000 | 69443 | Theodore Mcgrath |
| 1001 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Legacy Assessment | Stephanie Collins | 1001 | ChIJI_0BP4Bt5kcRqvGkKTwSztI | Account Name |
| 1002 | 338534 | Regional Survey A | Sean Green | 1002 | 2933461 | Saipan International Airport |
| 1003 | 11210 | Seasonal Corridor | Cynthia Lewis | 1003 | 1437593 | Norma Fisher |

Joining `statues` to `historical_figures` on `historical_figure_id`, this view answers: "Which historical figure does each statue commemorate?" A row might show statue "Legacy Assessment" (id 1001) commemorating the figure with id 1001, located in area "Composite Standard" (id 101).

**View `v_historical_figure_statue`**

```sql
CREATE VIEW v_historical_figure_statue AS
SELECT a.id, a.figure_id, a.full_name, a.birth_year, b.id AS statue_id, b.statue_id AS statue_statue_id, b.statue_name AS statue_statue_name
FROM historical_figures a JOIN statues b ON a.statue_id = b.id;
```

| id | figure_id | full_name | birth_year | statue_id | statue_statue_id | statue_statue_name |
|---|---|---|---|---|---|---|
| 1000 | 69443 | Theodore Mcgrath | 47 | 1000 | 5844282 | Compact Series |
| 1001 | ChIJI_0BP4Bt5kcRqvGkKTwSztI | Account Name | 55 | 1001 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Legacy Assessment |
| 1002 | 2933461 | Saipan International Airport | 63 | 1002 | 338534 | Regional Survey A |
| 1003 | 1437593 | Norma Fisher | 71 | 1003 | 11210 | Seasonal Corridor |

The inverse of the statue-to-figure view, joining `historical_figures` to `statues` on `historical_figure_id`, answers: "Which statue commemorates each historical figure?" For instance, the figure with id 1000 is commemorated by statue "Compact Series" (id 1000), a student-decorated monument dedicated in year 12.

**View `v_charity_campus_event`**

```sql
CREATE VIEW v_charity_campus_event AS
SELECT a.charity_id, a.charity_name, a.target_beneficiaries, a.location, b.campus_event_id AS event_campus_event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM charities a JOIN campus_events b ON a.campus_event_id = b.campus_event_id;
```

| charity_id | charity_name | target_beneficiaries | location | event_campus_event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|---|
| 8350015 | Composite Assessment | integrated-target-76 | extended-location-99 | 100 | 2002007020060 | Seasonal Standard |
| 884370 | Compact Survey A | seasonal-target-77 | integrated-location-100 | 101 | 168535 | Integrated Framework |
| 10238289 | Legacy Corridor | regional-target-78 | seasonal-location-101 | 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 325 | Regional Series | legacy-target-79 | regional-location-102 | 103 | 1186089 | Pilot Programme |

This view joins `charities` to `campus_events` on `charity_id`, answering: "Which events benefit each charity?" A row might show charity `8350015` benefiting event "Seasonal Standard" (campus_event_id 100), a non-annual event held in area 100.

**View `v_charity_student_organization`**

```sql
CREATE VIEW v_charity_student_organization AS
SELECT a.charity_id, a.charity_name, a.target_beneficiaries, a.location, b.id AS organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM charities a JOIN student_organizations b ON a.student_organization_id = b.id;
```

| charity_id | charity_name | target_beneficiaries | location | organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 8350015 | Composite Assessment | integrated-target-76 | extended-location-99 | 1000 | 790471 | Extended Review |
| 884370 | Compact Survey A | seasonal-target-77 | integrated-location-100 | 1001 | 1717 | Pilot Initiative A |
| 10238289 | Legacy Corridor | regional-target-78 | seasonal-location-101 | 1002 | 69437 | Baseline Model |
| 325 | Regional Series | legacy-target-79 | regional-location-102 | 1003 | m16 | Distributed Cluster |

Joining `charities` to `student_organizations` through their shared association with `campus_events`, this view answers: "Which student organizations are associated with events benefiting which charities?" For example, organization "Pilot Initiative A" (id 1001), a philanthropic Fraternity, is associated with events benefiting charity `884370` (composite-charity-51).

### Synthesis

The campus domain model demonstrates how a rich ontology of physical, academic, and cultural entities can be faithfully represented in a normalized relational schema. Each base table captures a distinct entity type with its own surrogate and business identifiers, typed attributes, and boolean flags. Foreign keys encode the cardinality-bounded relationships: buildings contain departments and areas, areas contain statues and nest hierarchically, events connect organizations to charities, and statues commemorate historical figures. The materialized views reconstruct these relationships as flat, queryable surfaces, each answering a specific domain question by joining the appropriate tables. The result is a schema that is both structurally sound — with clear primary keys, foreign keys, and referential integrity — and semantically rich, preserving the full meaning of the campus domain in a form that supports efficient querying and analysis.