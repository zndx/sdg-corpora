## School Transportation Management

District transportation departments coordinate the movement of students across geographic regions through a structured system of routes, operators, and pickup locations. Each school campus is assigned to a district, which in turn manages multiple routes staffed by licensed bus operators. These routes connect campuses to designated pickup zones, creating a network that must be tracked, billed, and maintained across academic years. The data model captures every element of this operation—from the kindergarten campus in Extended Review to the bilingual campus in Baseline Model—ensuring that fee structures, operator assignments, and geographic coverage are all traceable to their originating district.

**Table `bus_routes`**

| bus_route_id | route_code | district | round_trip_fee | single_trip_fee | academic_year | status | school_campus_id | bus_operator_license_number |
|---|---|---|---|---|---|---|---|---|
| 1000 | 2405 | integrated-district-40 | 26.25 | 17.12 | legacy-academic-43 | active | 100 | LIC-2589 |
| 1001 | ChIJIbRFlPtt5kcR5kM81XdpSfI | seasonal-district-41 | 29.43 | 19.97 | compact-academic-44 | pending | 101 | LIC-2596 |
| 1002 | 9085264 | regional-district-42 | 19.97 | 12.74 | composite-academic-45 | archived | 102 | LIC-2603 |
| 1003 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | legacy-district-43 | 13.49 | 29.99 | primary-academic-46 | active | 103 | LIC-2610 |

A bus route represents the fundamental unit of student transportation. Each route carries a unique identifier, a route code that may follow different naming conventions, and a fee structure consisting of both a round-trip and a single-trip charge. The academic year field anchors the route to a specific operational period, while the status field tracks whether the route is active, pending, or archived. Route 1000, coded as 2405, operates under the integrated-district-40 designation with a round-trip fee of 26.25 and a single-trip fee of 17.12 during the legacy-academic-43 year. Its counterpart, route 1003, uses a UUID-style code and carries a notably higher single-trip fee of 29.99 despite a lower round-trip fee of 13.49. Every route is tied to exactly one school campus and one bus operator, establishing the core service relationship.

**Table `school_campuses`**

| school_campus_id | campus_name | campus_code | campus_type | district | academic_year | district_id |
|---|---|---|---|---|---|---|
| 100 | Integrated Assessment A | 6969438 | kindergarten | integrated-district-40 | legacy-academic-43 | 1 |
| 101 | Extended Survey | 9736889 | nursery | seasonal-district-41 | compact-academic-44 | 2 |
| 102 | Pilot Corridor | 727050 | bilingual | regional-district-42 | composite-academic-45 | 3 |
| 103 | Baseline Series D | 89008 | kindergarten | legacy-district-43 | primary-academic-46 | 4 |

School campuses serve as the destination endpoints for all transportation routes. Each campus is identified by an internal ID, a human-readable name, and a campus code. The campus type distinguishes between kindergarten, nursery, and bilingual programs, reflecting the varied educational needs across the district. Campus 100, named Integrated Assessment A, operates as a kindergarten facility within the integrated-district-40 region, while campus 102, Pilot Corridor, offers bilingual instruction under the regional-district-42 jurisdiction. The district_id column links each campus to its governing district, enabling hierarchical reporting from individual campuses up through regional clusters.

**Table `pickup_zones`**

| zone_name | zone_code | district | special_instructions | bus_route_id | district_id |
|---|---|---|---|---|---|
| Pilot Series | 974943 | integrated-district-40 | regional-special-78 | 1000 | 1 |
| Baseline Assessment | 2002007020170 | seasonal-district-41 | legacy-special-79 | 1001 | 2 |
| Distributed Survey A | 9424913 | regional-district-42 | compact-special-80 | 1002 | 3 |
| Adaptive Corridor | lu_tax_code_template_m14 | legacy-district-43 | composite-special-81 | 1003 | 4 |

Pickup zones define the geographic collection points where students board the buses. Each zone has a name, a zone code, and special instructions that guide operators on handling procedures. The zone is associated with a specific bus route through the bus_route_id column and belongs to a district via the district_id. Pilot Series, with zone code 974943, carries the instruction regional-special-78 and is linked to route 1000. In contrast, the Adaptive Corridor zone uses the code lu_tax_code_template_m14 and carries composite-special-81 instructions, serving route 1003. Multiple zones can serve a single route, and a single zone can appear across multiple routes, creating a flexible pickup network.

**Table `bus_operators`**

| company_name | contact_person | contact_phone | license_number |
|---|---|---|---|
| Feedback Rating | Alyssa Chung | Joe Tsai | LIC-2589 |
| Virgin Group | Brianna Mejia | Stephanie Collins | LIC-2596 |
| United Technologies | Eric Schultz | Tasha Rodriguez | LIC-2603 |
| Link Title | Peter Montgomery | Walter Pratt | LIC-2610 |

Bus operators are the licensed entities responsible for providing transportation services. Each operator is identified by a company name, a contact person, a contact phone number, and a license number. Feedback Rating, operated by Alyssa Chung with contact Joe Tsai, holds license LIC-2589 and services route 1000. Virgin Group, with Brianna Mejia as the contact person and Stephanie Collins on the phone line, holds license LIC-2596 for route 1001. The license number serves as the primary key for operator identification and is referenced by the routes that depend on their services.

**Table `districts`**

| district_id | district_name | district_code | region |
|---|---|---|---|
| 1 | Extended Review | prepor | distributed-region-12 |
| 2 | Pilot Initiative A | 325454 | baseline-region-13 |
| 3 | Baseline Model | 1152669 | pilot-region-14 |
| 4 | Distributed Cluster | 605952 | extended-region-15 |

Districts form the administrative hierarchy under which all other entities are organized. Each district has an internal ID, a district name, a district code, and a region designation. District 1, named Extended Review with code prepor, operates within the distributed-region-12 area. District 4, Distributed Cluster, carries code 605952 and falls under the extended-region-15 region. The district_id is the common key that connects districts to their campuses, zones, and the routes that serve them.

**Table `routes_zones`**

| bus_route_id | zone_code |
|---|---|
| 1000 | 974943 |
| 1000 | 2002007020170 |
| 1001 | 2002007020170 |
| 1001 | 9424913 |
| 1002 | 9424913 |
| 1002 | lu_tax_code_template_m14 |
| 1003 | lu_tax_code_template_m14 |
| 1003 | 974943 |

The routes_zones table establishes the many-to-many relationship between bus routes and pickup zones. A single route may serve multiple zones, and a zone may be shared across routes. Route 1000 serves two zones—974943 (Pilot Series) and 2002007020170 (Baseline Assessment)—while route 1003 also serves two zones, lu_tax_code_template_m14 (Adaptive Corridor) and 974943 (Pilot Series). This cross-assignment means that Pilot Series is a shared pickup location, accessible via both route 1000 and route 1003, providing redundancy and coverage flexibility.

**Table `campuses_routes`**

| school_campus_id | bus_route_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The campuses_routes junction table links school campuses to their assigned bus routes. Each campus is served by one or more routes, and each route serves one campus. This table formalizes the relationship that is also captured directly in the bus_routes table through the school_campus_id column, providing a normalized structure for tracking route-to-campus assignments.

**Table `operators_routes`**

| bus_operator_license_number | bus_route_id |
|---|---|
| LIC-2589 | 1000 |
| LIC-2589 | 1001 |
| LIC-2596 | 1001 |
| LIC-2596 | 1002 |
| LIC-2603 | 1002 |
| LIC-2603 | 1003 |
| LIC-2610 | 1003 |
| LIC-2610 | 1000 |

The operators_routes junction table records which bus operators are assigned to which routes. Similar to the campuses_routes table, this provides a normalized view of the operator-route relationship that is also directly stored in the bus_routes table via the bus_operator_license_number column. This dual representation supports both direct lookups and relational joins depending on the query pattern.

**Table `districts_zones`**

| district_id | zone_code |
|---|---|
| 1 | 974943 |
| 1 | 2002007020170 |
| 2 | 2002007020170 |
| 2 | 9424913 |
| 3 | 9424913 |
| 3 | lu_tax_code_template_m14 |
| 4 | lu_tax_code_template_m14 |
| 4 | 974943 |

The districts_zones table maps districts to their pickup zones. Each zone belongs to exactly one district, and a district may contain multiple zones. This relationship ensures that geographic coverage is organized administratively, with each district responsible for the zones within its boundaries.

**Table `districts_campuses`**

| district_id | school_campus_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The districts_campuses table links districts to their school campuses. Each campus is governed by one district, and a district may oversee multiple campuses. This table mirrors the district_id relationship found directly in the school_campuses table, providing a normalized junction for district-to-campus reporting.

**View `bus_route_school_campus_view`**

```sql
CREATE VIEW bus_route_school_campus_view AS
SELECT a.bus_route_id, a.route_code, a.district, a.round_trip_fee, b.school_campus_id AS campus_school_campus_id, b.campus_name AS campus_campus_name, b.campus_code AS campus_campus_code
FROM bus_routes a JOIN school_campuses b ON a.school_campus_id = b.school_campus_id;
```

| bus_route_id | route_code | district | round_trip_fee | campus_school_campus_id | campus_campus_name | campus_campus_code |
|---|---|---|---|---|---|---|
| 1000 | 2405 | integrated-district-40 | 26.25 | 100 | Integrated Assessment A | 6969438 |
| 1001 | ChIJIbRFlPtt5kcR5kM81XdpSfI | seasonal-district-41 | 29.43 | 101 | Extended Survey | 9736889 |
| 1002 | 9085264 | regional-district-42 | 19.97 | 102 | Pilot Corridor | 727050 |
| 1003 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | legacy-district-43 | 13.49 | 103 | Baseline Series D | 89008 |

This view joins bus routes with their assigned school campuses, answering the question of which campus each route serves and what fee structure applies. The joined result combines route identifiers, fee data, and campus details into a single record. Route 1000 (code 2405) with a round-trip fee of 26.25 serves campus 100, Integrated Assessment A, a kindergarten facility. Route 1002 (code 9085264), priced at 19.97 for a round trip, serves campus 102, Pilot Corridor, which offers bilingual instruction. This view is essential for financial planning, as it pairs each campus with the exact cost of its transportation service.

**View `bus_route_pickup_zone_detail_view`**

```sql
CREATE VIEW bus_route_pickup_zone_detail_view AS
SELECT a.bus_route_id, a.route_code, a.district, b.zone_name AS zone_zone_name, b.zone_code AS zone_zone_code, b.district AS zone_district
FROM bus_routes a
  JOIN routes_zones j ON j.bus_route_id = a.bus_route_id
  JOIN pickup_zones b ON b.zone_code = j.zone_code;
```

| bus_route_id | route_code | district | zone_zone_name | zone_zone_code | zone_district |
|---|---|---|---|---|---|
| 1000 | 2405 | integrated-district-40 | Pilot Series | 974943 | integrated-district-40 |
| 1000 | 2405 | integrated-district-40 | Baseline Assessment | 2002007020170 | seasonal-district-41 |
| 1001 | ChIJIbRFlPtt5kcR5kM81XdpSfI | seasonal-district-41 | Baseline Assessment | 2002007020170 | seasonal-district-41 |
| 1001 | ChIJIbRFlPtt5kcR5kM81XdpSfI | seasonal-district-41 | Distributed Survey A | 9424913 | regional-district-42 |
| 1002 | 9085264 | regional-district-42 | Distributed Survey A | 9424913 | regional-district-42 |
| 1002 | 9085264 | regional-district-42 | Adaptive Corridor | lu_tax_code_template_m14 | legacy-district-43 |
| 1003 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | legacy-district-43 | Adaptive Corridor | lu_tax_code_template_m14 | legacy-district-43 |
| 1003 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | legacy-district-43 | Pilot Series | 974943 | integrated-district-40 |

This view connects bus routes to their pickup zones, revealing the geographic coverage of each route. Route 1000 serves the Pilot Series zone (code 974943) and the Baseline Assessment zone (code 2002007020170), giving students in two distinct areas access to the Integrated Assessment A campus. Route 1003 serves the Adaptive Corridor zone (code lu_tax_code_template_m14) and the Pilot Series zone, meaning that the Pilot Series zone is a shared pickup point accessible from two different routes. This view supports route optimization by showing which zones are served by which routes and identifying zones with multiple route options.

**View `bus_route_bus_operator_view`**

```sql
CREATE VIEW bus_route_bus_operator_view AS
SELECT a.bus_route_id, a.route_code, a.district, a.round_trip_fee, b.company_name AS operator_company_name, b.contact_person AS operator_contact_person, b.contact_phone AS operator_contact_phone
FROM bus_routes a JOIN bus_operators b ON a.bus_operator_license_number = b.license_number;
```

| bus_route_id | route_code | district | round_trip_fee | operator_company_name | operator_contact_person | operator_contact_phone |
|---|---|---|---|---|---|---|
| 1000 | 2405 | integrated-district-40 | 26.25 | Feedback Rating | Alyssa Chung | Joe Tsai |
| 1001 | ChIJIbRFlPtt5kcR5kM81XdpSfI | seasonal-district-41 | 29.43 | Virgin Group | Brianna Mejia | Stephanie Collins |
| 1002 | 9085264 | regional-district-42 | 19.97 | United Technologies | Eric Schultz | Tasha Rodriguez |
| 1003 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | legacy-district-43 | 13.49 | Link Title | Peter Montgomery | Walter Pratt |

This view links bus routes to their licensed operators, providing a complete picture of who is responsible for each route. Route 1000 is operated by Feedback Rating (license LIC-2589), with Alyssa Chung as the primary contact. Route 1001, with the route code ChIJIbRFlPtt5kcR5kM81XdpSfI, is operated by Virgin Group (license LIC-2596), contacted through Brianna Mejia. Route 1002 is managed by United Technologies (license LIC-2603), and route 1003 by Link Title (license LIC-2610). This view is critical for operational accountability, ensuring that each route has a clearly identified responsible party.

**View `school_campus_bus_route_detail_view`**

```sql
CREATE VIEW school_campus_bus_route_detail_view AS
SELECT a.school_campus_id, a.campus_name, a.campus_code, b.bus_route_id AS route_bus_route_id, b.route_code AS route_route_code, b.district AS route_district
FROM school_campuses a
  JOIN campuses_routes j ON j.school_campus_id = a.school_campus_id
  JOIN bus_routes b ON b.bus_route_id = j.bus_route_id;
```

| school_campus_id | campus_name | campus_code | route_bus_route_id | route_route_code | route_district |
|---|---|---|---|---|---|
| 100 | Integrated Assessment A | 6969438 | 1000 | 2405 | integrated-district-40 |
| 100 | Integrated Assessment A | 6969438 | 1001 | ChIJIbRFlPtt5kcR5kM81XdpSfI | seasonal-district-41 |
| 101 | Extended Survey | 9736889 | 1001 | ChIJIbRFlPtt5kcR5kM81XdpSfI | seasonal-district-41 |
| 101 | Extended Survey | 9736889 | 1002 | 9085264 | regional-district-42 |
| 102 | Pilot Corridor | 727050 | 1002 | 9085264 | regional-district-42 |
| 102 | Pilot Corridor | 727050 | 1003 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | legacy-district-43 |
| 103 | Baseline Series D | 89008 | 1003 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | legacy-district-43 |
| 103 | Baseline Series D | 89008 | 1000 | 2405 | integrated-district-40 |

This view presents school campuses alongside their assigned bus routes, offering a campus-centric perspective on transportation. Integrated Assessment A (campus 100) is served by route 1000, which charges 26.25 for a round trip and 17.12 for a single trip. Pilot Corridor (campus 102) is served by route 1002, with fees of 19.97 and 12.74 respectively. The view includes the operator information, so administrators can see that Integrated Assessment A's route is operated by Feedback Rating, while Pilot Corridor's route is operated by United Technologies. This perspective is useful for campus-level budgeting and operator performance evaluation.

**View `school_campus_district_view`**

```sql
CREATE VIEW school_campus_district_view AS
SELECT a.school_campus_id, a.campus_name, a.campus_code, a.campus_type, b.district_id AS district_district_id, b.district_name AS district_district_name, b.district_code AS district_district_code
FROM school_campuses a JOIN districts b ON a.district_id = b.district_id;
```

| school_campus_id | campus_name | campus_code | campus_type | district_district_id | district_district_name | district_district_code |
|---|---|---|---|---|---|---|
| 100 | Integrated Assessment A | 6969438 | kindergarten | 1 | Extended Review | prepor |
| 101 | Extended Survey | 9736889 | nursery | 2 | Pilot Initiative A | 325454 |
| 102 | Pilot Corridor | 727050 | bilingual | 3 | Baseline Model | 1152669 |
| 103 | Baseline Series D | 89008 | kindergarten | 4 | Distributed Cluster | 605952 |

This view connects school campuses to their governing districts, providing an administrative overview of campus placement. Campus 100, Integrated Assessment A, falls under district 1 (Extended Review, code prepor) in the distributed-region-12 area. Campus 102, Pilot Corridor, is governed by district 3 (Baseline Model, code 1152669) in the pilot-region-14 area. This view enables district-level reporting on the number of campuses under management and supports resource allocation decisions based on regional distribution.

**View `pickup_zone_bus_route_view`**

```sql
CREATE VIEW pickup_zone_bus_route_view AS
SELECT a.zone_name, a.zone_code, a.district, a.special_instructions, b.bus_route_id AS route_bus_route_id, b.route_code AS route_route_code, b.district AS route_district
FROM pickup_zones a JOIN bus_routes b ON a.bus_route_id = b.bus_route_id;
```

| zone_name | zone_code | district | special_instructions | route_bus_route_id | route_route_code | route_district |
|---|---|---|---|---|---|---|
| Pilot Series | 974943 | integrated-district-40 | regional-special-78 | 1000 | 2405 | integrated-district-40 |
| Baseline Assessment | 2002007020170 | seasonal-district-41 | legacy-special-79 | 1001 | ChIJIbRFlPtt5kcR5kM81XdpSfI | seasonal-district-41 |
| Distributed Survey A | 9424913 | regional-district-42 | compact-special-80 | 1002 | 9085264 | regional-district-42 |
| Adaptive Corridor | lu_tax_code_template_m14 | legacy-district-43 | composite-special-81 | 1003 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | legacy-district-43 |

This view presents pickup zones alongside their assigned bus routes, offering a zone-centric view of transportation coverage. The Pilot Series zone (code 974943) is served by route 1000, which charges a round-trip fee of 26.25. The Baseline Assessment zone (code 2002007020170) is served by route 1001, with a round-trip fee of 29.43. The Adaptive Corridor zone (code lu_tax_code_template_m14) is served by route 1003, carrying a round-trip fee of 13.49. This view helps zone administrators understand which routes serve their area and at what cost.

**View `pickup_zone_district_view`**

```sql
CREATE VIEW pickup_zone_district_view AS
SELECT a.zone_name, a.zone_code, a.district, a.special_instructions, b.district_id AS district_district_id, b.district_name AS district_district_name, b.district_code AS district_district_code
FROM pickup_zones a JOIN districts b ON a.district_id = b.district_id;
```

| zone_name | zone_code | district | special_instructions | district_district_id | district_district_name | district_district_code |
|---|---|---|---|---|---|---|
| Pilot Series | 974943 | integrated-district-40 | regional-special-78 | 1 | Extended Review | prepor |
| Baseline Assessment | 2002007020170 | seasonal-district-41 | legacy-special-79 | 2 | Pilot Initiative A | 325454 |
| Distributed Survey A | 9424913 | regional-district-42 | compact-special-80 | 3 | Baseline Model | 1152669 |
| Adaptive Corridor | lu_tax_code_template_m14 | legacy-district-43 | composite-special-81 | 4 | Distributed Cluster | 605952 |

This view links pickup zones to their governing districts, confirming the administrative boundaries of each zone. The Pilot Series zone belongs to district 1 (Extended Review), the Baseline Assessment zone to district 2 (Pilot Initiative A), the Distributed Survey A zone to district 3 (Baseline Model), and the Adaptive Corridor zone to district 4 (Distributed Cluster). Each zone's district assignment ensures that geographic coverage aligns with administrative responsibility, making it clear which district manages each pickup location.

**View `bus_operator_bus_route_detail_view`**

```sql
CREATE VIEW bus_operator_bus_route_detail_view AS
SELECT a.company_name, a.contact_person, a.contact_phone, b.bus_route_id AS route_bus_route_id, b.route_code AS route_route_code, b.district AS route_district
FROM bus_operators a
  JOIN operators_routes j ON j.bus_operator_license_number = a.license_number
  JOIN bus_routes b ON b.bus_route_id = j.bus_route_id;
```

| company_name | contact_person | contact_phone | route_bus_route_id | route_route_code | route_district |
|---|---|---|---|---|---|
| Feedback Rating | Alyssa Chung | Joe Tsai | 1000 | 2405 | integrated-district-40 |
| Feedback Rating | Alyssa Chung | Joe Tsai | 1001 | ChIJIbRFlPtt5kcR5kM81XdpSfI | seasonal-district-41 |
| Virgin Group | Brianna Mejia | Stephanie Collins | 1001 | ChIJIbRFlPtt5kcR5kM81XdpSfI | seasonal-district-41 |
| Virgin Group | Brianna Mejia | Stephanie Collins | 1002 | 9085264 | regional-district-42 |
| United Technologies | Eric Schultz | Tasha Rodriguez | 1002 | 9085264 | regional-district-42 |
| United Technologies | Eric Schultz | Tasha Rodriguez | 1003 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | legacy-district-43 |
| Link Title | Peter Montgomery | Walter Pratt | 1003 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | legacy-district-43 |
| Link Title | Peter Montgomery | Walter Pratt | 1000 | 2405 | integrated-district-40 |

This view presents bus operators alongside their assigned routes, providing an operator-centric perspective on service delivery. Feedback Rating (license LIC-2589) operates route 1000, serving the Integrated Assessment A campus with a round-trip fee of 26.25. Virgin Group (license LIC-2596) operates route 1001, serving the Extended Survey campus with a round-trip fee of 29.43. United Technologies (license LIC-2603) operates route 1002 for the Pilot Corridor campus, and Link Title (license LIC-2610) operates route 1003 for the Baseline Series D campus. This view supports operator performance tracking and contract management by showing the full scope of each operator's assignments.

**View `district_pickup_zone_detail_view`**

```sql
CREATE VIEW district_pickup_zone_detail_view AS
SELECT a.district_id, a.district_name, a.district_code, b.zone_name AS zone_zone_name, b.zone_code AS zone_zone_code, b.district AS zone_district
FROM districts a
  JOIN districts_zones j ON j.district_id = a.district_id
  JOIN pickup_zones b ON b.zone_code = j.zone_code;
```

| district_id | district_name | district_code | zone_zone_name | zone_zone_code | zone_district |
|---|---|---|---|---|---|
| 1 | Extended Review | prepor | Pilot Series | 974943 | integrated-district-40 |
| 1 | Extended Review | prepor | Baseline Assessment | 2002007020170 | seasonal-district-41 |
| 2 | Pilot Initiative A | 325454 | Baseline Assessment | 2002007020170 | seasonal-district-41 |
| 2 | Pilot Initiative A | 325454 | Distributed Survey A | 9424913 | regional-district-42 |
| 3 | Baseline Model | 1152669 | Distributed Survey A | 9424913 | regional-district-42 |
| 3 | Baseline Model | 1152669 | Adaptive Corridor | lu_tax_code_template_m14 | legacy-district-43 |
| 4 | Distributed Cluster | 605952 | Adaptive Corridor | lu_tax_code_template_m14 | legacy-district-43 |
| 4 | Distributed Cluster | 605952 | Pilot Series | 974943 | integrated-district-40 |

This view connects districts to their pickup zones, providing a district-level overview of geographic coverage. District 1 (Extended Review) manages the Pilot Series zone, district 2 (Pilot Initiative A) manages the Baseline Assessment zone, district 3 (Baseline Model) manages the Distributed Survey A zone, and district 4 (Distributed Cluster) manages the Adaptive Corridor zone. This view is essential for understanding the distribution of pickup infrastructure across districts and for planning zone-level expansions or consolidations.

**View `district_school_campus_detail_view`**

```sql
CREATE VIEW district_school_campus_detail_view AS
SELECT a.district_id, a.district_name, a.district_code, b.school_campus_id AS campus_school_campus_id, b.campus_name AS campus_campus_name, b.campus_code AS campus_campus_code
FROM districts a
  JOIN districts_campuses j ON j.district_id = a.district_id
  JOIN school_campuses b ON b.school_campus_id = j.school_campus_id;
```

| district_id | district_name | district_code | campus_school_campus_id | campus_campus_name | campus_campus_code |
|---|---|---|---|---|---|
| 1 | Extended Review | prepor | 100 | Integrated Assessment A | 6969438 |
| 1 | Extended Review | prepor | 101 | Extended Survey | 9736889 |
| 2 | Pilot Initiative A | 325454 | 101 | Extended Survey | 9736889 |
| 2 | Pilot Initiative A | 325454 | 102 | Pilot Corridor | 727050 |
| 3 | Baseline Model | 1152669 | 102 | Pilot Corridor | 727050 |
| 3 | Baseline Model | 1152669 | 103 | Baseline Series D | 89008 |
| 4 | Distributed Cluster | 605952 | 103 | Baseline Series D | 89008 |
| 4 | Distributed Cluster | 605952 | 100 | Integrated Assessment A | 6969438 |

This view links districts to their school campuses, completing the administrative hierarchy from district down to campus. District 1 (Extended Review) oversees campus 100, Integrated Assessment A, a kindergarten facility. District 2 (Pilot Initiative A) oversees campus 101, Extended Survey, a nursery. District 3 (Baseline Model) oversees campus 102, Pilot Corridor, a bilingual campus. District 4 (Distributed Cluster) oversees campus 103, Baseline Series D, another kindergarten facility. This view provides a comprehensive picture of each district's educational footprint, enabling administrators to compare campus counts, types, and distributions across regions.

## Synthesis

The school transportation system is a multi-layered network where districts govern campuses, routes connect campuses to pickup zones, and licensed operators provide the service. The base tables capture the core entities—routes, campuses, zones, operators, and districts—while the junction tables formalize the many-to-many relationships between routes and zones, campuses and routes, and operators and routes. The views synthesize these elements into perspective-specific lenses: route-centric, campus-centric, zone-centric, operator-centric, and district-centric. Together, they enable administrators to answer questions about cost, coverage, accountability, and geographic distribution, ensuring that every student has a documented path from pickup zone to campus, managed by a licensed operator under a responsible district.