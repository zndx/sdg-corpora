## Campus Infrastructure and Academic Departments

A university campus is a living system of buildings, departments, events, and public spaces that together form the operational fabric of academic life. The records in this domain capture the physical plant, the organizational units that occupy it, the events that animate it, and the monuments that commemorate it. Each entity is tracked with identifiers that link across tables, enabling practitioners to trace how a department's resources, a building's amenities, and an event's logistics interlock.

**Table `campus_buildings`**

| id | building_id | building_name | year_built | building_type | has_fiber_optic_cable | number_of_floors | academic_department_id | campus_area_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 10090 | Compact Initiative | 28 | Academic | false | 11 | 1 | 100 |
| 2 | 3744019 | Legacy Model | 37 | Residential | true | 22 | 2 | 101 |
| 3 | 3001009030150 | Regional Cluster A | 46 | Administrative | false | 33 | 3 | 102 |
| 4 | 325468 | Seasonal Review | 55 | Academic | true | 44 | 4 | 103 |

The campus buildings table records the physical structures that house academic, residential, and administrative functions. Each building carries a unique identifier, a human-readable name, and metadata about its construction and capabilities. The Compact Initiative (building ID 10090), for instance, is an eleven-floor academic structure built in year 28 without fiber-optic cabling, while the Legacy Model (building ID 3744019) is a twenty-two-floor residential building constructed in year 37 with fiber-optic connectivity. The Regional Cluster A (building ID 3001009030150) spans thirty-three floors as an administrative facility, and the Seasonal Review (building ID 325468) is a forty-four-floor academic building with fiber-optic infrastructure. The building_type column distinguishes Academic, Residential, and Administrative categories, while the has_fiber_optic_cable flag indicates whether the structure supports high-speed network infrastructure.

**Table `academic_departments`**

| academic_department_id | department_id | department_name | parent_university | has_museum | offers_graduate_program | number_of_students | campus_building_id | campus_event_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2087755 | Baseline Framework D | legacy-parent-91 | true | false | 16 | 1 | 100 |
| 2 | 790483 | Distributed Protocol | compact-parent-92 | false | true | 20 | 2 | 101 |
| 3 | 505978 | Adaptive Programme | composite-parent-93 | true | false | 24 | 3 | 102 |
| 4 | id_6 | Primary Standard A | primary-parent-94 | false | true | 28 | 4 | 103 |

Academic departments are the organizational units that operate within these buildings. The Baseline Framework D (department ID 2087755) reports to the legacy-parent-91 university, maintains a museum, and serves sixteen students without offering graduate programs. The Distributed Protocol (department ID 790483) is a graduate program under compact-parent-92 with twenty students and no museum. The Adaptive Programme (department ID 505978) mirrors the first department's profile — a non-graduate program with a museum and twenty-four students — while the Primary Standard A (department ID id_6) is a graduate program under primary-parent-94 with twenty-eight students and no museum. Each department is assigned to a specific campus building and campus event, anchoring its operational footprint.

**Table `campus_events`**

| campus_event_id | event_id | event_name | event_date | event_location | is_annual | charity_beneficiary | campus_area_id | student_organization_id | charity_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 2002007020060 | Seasonal Standard | 2025-04-15T15:21:00 | seasonal-event-17 | false | compact-charity-50 | 100 | 1000 | 8350015 |
| 101 | 168535 | Integrated Framework | 2022-09-26T22:38:00 | regional-event-18 | true | composite-charity-51 | 101 | 1001 | 884370 |
| 102 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10T05:55:00 | legacy-event-19 | false | primary-charity-52 | 102 | 1002 | 10238289 |
| 103 | 1186089 | Pilot Programme | 2024-07-21T12:12:00 | compact-event-20 | true | adaptive-charity-53 | 103 | 1003 | 325 |

Campus events represent the scheduled activities that bring the community together. The Seasonal Standard (event ID 2002007020060) occurred on April 15, 2025, at the seasonal-event-17 location, is not an annual occurrence, and benefits the compact-charity-50 fund. The Integrated Framework (event ID 168535) took place on September 26, 2022, at regional-event-18, is an annual event, and supports composite-charity-51. The Extended Protocol D (event ID ab8e1d18-8fcd-11eb-924d-9cd76263cbd0) was held on February 10, 2023, at legacy-event-19, is not annual, and benefits primary-charity-52. The Pilot Programme (event ID 1186089) occurred on July 21, 2024, at compact-event-20, is an annual event, and supports adaptive-charity-53. Each event is associated with a campus area, a student organization, and a charity beneficiary, creating a web of operational relationships.

**Table `student_organizations`**

| id | org_id | org_name | org_type | is_philanthropic | founding_year | campus_event_id | academic_department_id |
|---|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | Sorority | false | 43 | 100 | 1 |
| 1001 | 1717 | Pilot Initiative A | Fraternity | true | 48 | 101 | 2 |
| 1002 | 69437 | Baseline Model | Club | false | 53 | 102 | 3 |
| 1003 | m16 | Distributed Cluster | Ensemble | true | 58 | 103 | 4 |

Student organizations are the groups that participate in campus events and are affiliated with academic departments. The Extended Review (org ID 790471) is a sorority founded in year 43 that is not philanthropic and participates in event 100 under department 1. The Pilot Initiative A (org ID 1717) is a philanthropic fraternity founded in year 48 that participates in event 101 under department 2. The Baseline Model (org ID 69437) is a non-philanthropic club founded in year 53 that participates in event 102 under department 3. The Distributed Cluster (org ID m16) is a philanthropic ensemble founded in year 58 that participates in event 103 under department 4. The org_type column captures the organizational form — Sorority, Fraternity, Club, or Ensemble — while the is_philanthropic flag indicates charitable orientation.

## Campus Areas, Monuments, and Historical Figures

The campus is organized into distinct areas that serve different purposes and host physical features such as statues. These areas are themselves linked to buildings and to each other, forming a spatial hierarchy.

**Table `campus_areas`**

| id | area_id | area_name | area_type | is_wireless_enabled | area_description | campus_building_id | statue_id | campus_area_id |
|---|---|---|---|---|---|---|---|---|
| 100 | default_chart_a_tax_19 | Primary Programme A | Garden | true | Pilot Protocol | 1 | 1000 | 100 |
| 101 | fro | Composite Standard | Quad | false | Baseline Programme | 2 | 1001 | 101 |
| 102 | account_pymes_296 | Compact Framework | ParkingLot | true | Distributed Standard A | 3 | 1002 | 102 |
| 103 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | Legacy Protocol D | Path | false | Adaptive Framework | 4 | 1003 | 103 |

The Primary Programme A (area ID default_chart_a_tax_19) is a Garden that is wireless-enabled and described as a Pilot Protocol space. It is associated with building 1, statue 1000, and area 100. The Composite Standard (area ID fro) is a Quad without wireless access, described as a Baseline Programme, linked to building 2, statue 1001, and area 101. The Compact Framework (area ID account_pymes_296) is a ParkingLot with wireless access, described as Distributed Standard A, linked to building 3, statue 1002, and area 102. The Legacy Protocol D (area ID 57e52fbc-8fcd-11eb-924d-9cd76263cbd0) is a Path without wireless access, described as Adaptive Framework, linked to building 4, statue 1003, and area 103. The area_type column distinguishes Garden, Quad, ParkingLot, and Path categories, while the is_wireless_enabled flag indicates network availability.

**Table `statues`**

| id | statue_id | statue_name | dedicated_person | gift_from | dedication_year | is_decorated_by_students | campus_area_id | historical_figure_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 5844282 | Compact Series | James Graves | legacy-gift-73 | 12 | true | 100 | 1000 |
| 1001 | 7c692762-8fcd-11eb-924d-9cd76263cbd0 | Legacy Assessment | Stephanie Collins | compact-gift-74 | 22 | false | 101 | 1001 |
| 1002 | 338534 | Regional Survey A | Sean Green | composite-gift-75 | 32 | true | 102 | 1002 |
| 1003 | 11210 | Seasonal Corridor | Cynthia Lewis | primary-gift-76 | 42 | false | 103 | 1003 |

Statues are public monuments placed within campus areas, each dedicated to a historical figure and gifted by a named donor. The Compact Series (statue ID 5844282) is dedicated to James Graves, was gifted by legacy-gift-73, was installed in year 12, and is decorated by students. It resides in area 100 and honors historical figure 1000. The Legacy Assessment (statue ID 7c692762-8fcd-11eb-924d-9cd76263cbd0) is dedicated to Stephanie Collins, was gifted by compact-gift-74, was installed in year 22, and is not decorated by students. It resides in area 101 and honors historical figure 1001. The Regional Survey A (statue ID 338534) is dedicated to Sean Green, was gifted by composite-gift-75, was installed in year 32, and is decorated by students. It resides in area 102 and honors historical figure 1002. The Seasonal Corridor (statue ID 11210) is dedicated to Cynthia Lewis, was gifted by primary-gift-76, was installed in year 42, and is not decorated by students. It resides in area 103 and honors historical figure 1003. The is_decorated_by_students flag captures whether students actively adorn the monument.

**Table `historical_figures`**

| id | figure_id | full_name | birth_year | death_year | founded_institution | enrollment_date | statue_id |
|---|---|---|---|---|---|---|---|
| 1000 | 69443 | Theodore Mcgrath | 47 | 39 | baseline-founded-31 | 2022-05-11 | 1000 |
| 1001 | ChIJI_0BP4Bt5kcRqvGkKTwSztI | Account Name | 55 | 50 | pilot-founded-32 | 2023-10-22 | 1001 |
| 1002 | 2933461 | Saipan International Airport | 63 | 61 | extended-founded-33 | 2024-03-06 | 1002 |
| 1003 | 1437593 | Norma Fisher | 71 | 72 | integrated-founded-34 | 2025-08-17 | 1003 |

Historical figures are the individuals commemorated by statues. Each figure is referenced by a unique identifier that links back to the statue records. The figures 1000 through 1003 correspond to James Graves, Stephanie Collins, Sean Green, and Cynthia Lewis respectively, as documented in the statue records above.

**Table `charities`**

| charity_id | charity_name | target_beneficiaries | location | is_local | campus_event_id | student_organization_id |
|---|---|---|---|---|---|---|
| 8350015 | Composite Assessment | integrated-target-76 | extended-location-99 | true | 100 | 1000 |
| 884370 | Compact Survey A | seasonal-target-77 | integrated-location-100 | false | 101 | 1001 |
| 10238289 | Legacy Corridor | regional-target-78 | seasonal-location-101 | true | 102 | 1002 |
| 325 | Regional Series | legacy-target-79 | regional-location-102 | false | 103 | 1003 |

Charitable organizations are the beneficiaries of campus events. The compact-charity-50, composite-charity-51, primary-charity-52, and adaptive-charity-53 are the four charity entities referenced in the campus events table. Each event designates one charity as its beneficiary, creating a direct link between event logistics and charitable impact.

## Cross-Reference Views

The following views synthesize the base tables into joined results that answer specific operational questions about the campus domain.

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

This view joins campus buildings with their assigned academic departments, answering which department occupies which building. The Compact Initiative (building 10090) is occupied by the Baseline Framework D department, while the Legacy Model (building 3744019) houses the Distributed Protocol department. The Regional Cluster A (building 3001009030150) is assigned to the Adaptive Programme, and the Seasonal Review (building 325468) hosts the Primary Standard A department. This relationship confirms that each building has exactly one department, and each department occupies exactly one building.

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

This view links campus buildings to the campus areas they contain or border. Building 1 (Compact Initiative) is associated with area 100 (Primary Programme A), building 2 (Legacy Model) with area 101 (Composite Standard), building 3 (Regional Cluster A) with area 102 (Compact Framework), and building 4 (Seasonal Review) with area 103 (Legacy Protocol D). The join reveals a one-to-one correspondence between buildings and areas in this dataset, suggesting a tightly organized campus layout.

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

This view presents the same building-department relationship from the department's perspective, answering which building a department is assigned to. The Baseline Framework D department is located in building 1, the Distributed Protocol department in building 2, the Adaptive Programme in building 3, and the Primary Standard A department in building 4. This orientation is useful for departmental staff seeking to identify their physical location.

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

This view connects academic departments to the campus events they sponsor or participate in. The Baseline Framework D department is linked to event 100 (Seasonal Standard), the Distributed Protocol department to event 101 (Integrated Framework), the Adaptive Programme to event 102 (Extended Protocol D), and the Primary Standard A department to event 103 (Pilot Programme). Each department sponsors exactly one event, and each event is sponsored by exactly one department, forming a clean one-to-one mapping.

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

This view joins campus events to the areas where they take place. The Seasonal Standard (event 100) is held in area 100 (Primary Programme A), the Integrated Framework (event 101) in area 101 (Composite Standard), the Extended Protocol D (event 102) in area 102 (Compact Framework), and the Pilot Programme (event 103) in area 103 (Legacy Protocol D). The join confirms that each event has a designated location area, and each area hosts exactly one event in this dataset.

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

This view links campus events to the student organizations that participate in them. Event 100 (Seasonal Standard) involves organization 1000 (Extended Review), event 101 (Integrated Framework) involves organization 1001 (Pilot Initiative A), event 102 (Extended Protocol D) involves organization 1002 (Baseline Model), and event 103 (Pilot Programme) involves organization 1003 (Distributed Cluster). Each event has one participating student organization, and each organization participates in one event.

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

This view connects campus events to their charity beneficiaries. Event 100 (Seasonal Standard) benefits compact-charity-50, event 101 (Integrated Framework) benefits composite-charity-51, event 102 (Extended Protocol D) benefits primary-charity-52, and event 103 (Pilot Programme) benefits adaptive-charity-53. The join makes it straightforward to identify which charitable cause each event supports.

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

This view presents the event-organization relationship from the student organization's perspective. Organization 1000 (Extended Review) participates in event 100, organization 1001 (Pilot Initiative A) in event 101, organization 1002 (Baseline Model) in event 102, and organization 1003 (Distributed Cluster) in event 103. This orientation is useful for student affairs staff tracking which organizations are active in which events.

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

This view links student organizations to their affiliated academic departments. Organization 1000 (Extended Review) is affiliated with department 1 (Baseline Framework D), organization 1001 (Pilot Initiative A) with department 2 (Distributed Protocol), organization 1002 (Baseline Model) with department 3 (Adaptive Programme), and organization 1003 (Distributed Cluster) with department 4 (Primary Standard A). The join reveals that each student organization has a single departmental home.

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

This view joins campus areas to the buildings they are associated with, answering which building each area serves. Area 100 (Primary Programme A) is associated with building 1, area 101 (Composite Standard) with building 2, area 102 (Compact Framework) with building 3, and area 103 (Legacy Protocol D) with building 4. This perspective is useful for facilities management, as it maps outdoor and transitional spaces to their adjacent structures.

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

This view links campus areas to the statues they contain. Area 100 (Primary Programme A) contains statue 1000 (Compact Series), area 101 (Composite Standard) contains statue 1001 (Legacy Assessment), area 102 (Compact Framework) contains statue 1002 (Regional Survey A), and area 103 (Legacy Protocol D) contains statue 1003 (Seasonal Corridor). Each area hosts exactly one statue, and each statue is placed in exactly one area.

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

This self-joining view relates campus areas to other campus areas, potentially capturing hierarchical or adjacency relationships. In the current dataset, area 100 references area 100, area 101 references area 101, area 102 references area 102, and area 103 references area 103. The self-referential pattern suggests that the campus_area_id column may support future expansion into area-to-area relationships such as parent-child hierarchies or connected zones.

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

This view presents the area-statue relationship from the statue's perspective. Statue 1000 (Compact Series) is located in area 100, statue 1001 (Legacy Assessment) in area 101, statue 1002 (Regional Survey A) in area 102, and statue 1003 (Seasonal Corridor) in area 103. This orientation is useful for campus tours and maintenance scheduling, as it identifies which area is responsible for each monument.

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

This view joins statues to the historical figures they commemorate. Statue 1000 (Compact Series) honors figure 1000, statue 1001 (Legacy Assessment) honors figure 1001, statue 1002 (Regional Survey A) honors figure 1002, and statue 1003 (Seasonal Corridor) honors figure 1003. The join confirms that each statue is dedicated to exactly one historical figure, and each figure is commemorated by exactly one statue in this dataset.

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

This view presents the statue-figure relationship from the historical figure's perspective. Figure 1000 is commemorated by statue 1000, figure 1001 by statue 1001, figure 1002 by statue 1002, and figure 1003 by statue 1003. This orientation is useful for historical research and commemorative programming, as it identifies which monument represents each figure.

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

This view joins charities to the events that benefit from their support. Charity compact-charity-50 benefits event 100, composite-charity-51 benefits event 101, primary-charity-52 benefits event 102, and adaptive-charity-53 benefits event 103. The join makes it straightforward for charitable organizations to track which campus events they support.

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

This view links charities to the student organizations whose events they benefit. The compact-charity-50 is associated with student organization 1000 (Extended Review), composite-charity-51 with organization 1001 (Pilot Initiative A), primary-charity-52 with organization 1002 (Baseline Model), and adaptive-charity-53 with organization 1003 (Distributed Cluster). This cross-reference enables charitable organizations to identify which student groups are driving their fundraising efforts.

## Synthesis

The campus domain records a tightly integrated ecosystem where buildings house departments, departments sponsor events, events engage student organizations and charitable beneficiaries, and areas contain statues that honor historical figures. Every entity is connected through foreign-key relationships that form a coherent operational graph. The building-to-department assignment, the department-to-event sponsorship, the event-to-organization participation, and the area-to-statue placement all follow a consistent one-to-one pattern in the current dataset, suggesting a campus where each unit has a single, well-defined role. The self-referential area relationships and the cross-cutting charity links provide additional dimensions for future expansion, allowing the domain to grow from a simple mapping into a richer representation of campus life.