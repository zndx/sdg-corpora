## Domain Modelling and Relational Materialisation

The school transportation management domain captures the logistics of student bus routing across a multi-district educational system. At its core, the domain revolves around five principal entity types: `bus_routes`, `school_campuses`, `pickup_zones`, `bus_operators`, and `districts`. Each entity carries a set of attributes that describe its identity, its operational parameters, and its relationships to other entities. The relational schema materialises these entities through a combination of direct foreign-key columns and junction tables, enabling both one-to-many and many-to-many relationships to be expressed in normalised form. The following sections walk through each table, its columns, and the concrete data that populates them, then demonstrate how the six views reconstruct domain facts from the normalised tables.

**Table `bus_routes`**

| bus_route_id | route_code | district | round_trip_fee | single_trip_fee | academic_year | status | school_campus_id | bus_operator_license_number |
|---|---|---|---|---|---|---|---|---|
| 1000 | 2405 | integrated-district-40 | 26.25 | 17.12 | legacy-academic-43 | active | 100 | LIC-2589 |
| 1001 | ChIJIbRFlPtt5kcR5kM81XdpSfI | seasonal-district-41 | 29.43 | 19.97 | compact-academic-44 | pending | 101 | LIC-2596 |
| 1002 | 9085264 | regional-district-42 | 19.97 | 12.74 | composite-academic-45 | archived | 102 | LIC-2603 |
| 1003 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | legacy-district-43 | 13.49 | 29.99 | primary-academic-46 | active | 103 | LIC-2610 |

The `bus_routes` table is the central fact table of the transportation model. Each row represents a single bus route, identified by the surrogate key `bus_route_id` (e.g. `1000`, `1001`, `1002`, `1003`). The `route_code` column carries a business identifier that varies in format — it may be a numeric string such as `2405` or `9085264`, a UUID-like value such as `e02275d4-8fd1-11eb-924d-9cd76263cbd0`, or even a free-text string such as `ChIJIbRFlPtt5kcR5kM81XdpSfI`. The `district` column stores a denormalised reference to the district name (e.g. `integrated-district-40`, `seasonal-district-41`), while the `round_trip_fee` and `single_trip_fee` columns capture the monetary cost of the service, expressed as decimal values such as `26.25` and `17.12` respectively. The `academic_year` column classifies the route under a term such as `legacy-academic-43` or `compact-academic-44`, and the `status` column indicates the current lifecycle state — `active`, `pending`, or `archived`. Two foreign-key columns anchor the route to other entities: `school_campus_id` references `school_campuses.school_campus_id`, and `bus_operator_license_number` references `bus_operators.license_number`. In the sample data, route `1000` is assigned to campus `100` and operated by `LIC-2589`, while route `1003` is assigned to campus `103` and operated by `LIC-2610`.

**Table `school_campuses`**

| school_campus_id | campus_name | campus_code | campus_type | district | academic_year | district_id |
|---|---|---|---|---|---|---|
| 100 | Integrated Assessment A | 6969438 | kindergarten | integrated-district-40 | legacy-academic-43 | 1 |
| 101 | Extended Survey | 9736889 | nursery | seasonal-district-41 | compact-academic-44 | 2 |
| 102 | Pilot Corridor | 727050 | bilingual | regional-district-42 | composite-academic-45 | 3 |
| 103 | Baseline Series D | 89008 | kindergarten | legacy-district-43 | primary-academic-46 | 4 |

The `school_campuses` table defines the educational institutions served by the bus network. Each campus is identified by `school_campus_id` (e.g. `100`, `101`, `102`, `103`) and described by `campus_name` (such as `Integrated Assessment A` or `Baseline Series D`), `campus_code` (e.g. `6969438`, `9736889`), and `campus_type` (one of `kindergarten`, `nursery`, or `bilingual`). The `district` column again carries a denormalised district name, while `academic_year` mirrors the classification found in `bus_routes`. The `district_id` column is a foreign key into `districts.district_id`, linking each campus to its governing district. Campus `100` belongs to district `1` (`Extended Review`), campus `101` to district `2` (`Pilot Initiative A`), and so on through campus `103` in district `4`.

**Table `pickup_zones`**

| zone_name | zone_code | district | special_instructions | bus_route_id | district_id |
|---|---|---|---|---|---|
| Pilot Series | 974943 | integrated-district-40 | regional-special-78 | 1000 | 1 |
| Baseline Assessment | 2002007020170 | seasonal-district-41 | legacy-special-79 | 1001 | 2 |
| Distributed Survey A | 9424913 | regional-district-42 | compact-special-80 | 1002 | 3 |
| Adaptive Corridor | lu_tax_code_template_m14 | legacy-district-43 | composite-special-81 | 1003 | 4 |

The `pickup_zones` table models the geographic pickup locations where students board the buses. Each zone is identified by `zone_code` (e.g. `974943`, `2002007020170`, `lu_tax_code_template_m14`) and described by `zone_name` (such as `Pilot Series` or `Adaptive Corridor`). The `district` column stores the district name, while `special_instructions` carries operational notes like `regional-special-78` or `composite-special-81`. The `bus_route_id` column is a foreign key into `bus_routes.bus_route_id`, establishing which route serves each zone. The `district_id` column references `districts.district_id`. In the sample, zone `974943` (`Pilot Series`) is served by route `1000` in district `1`, while zone `lu_tax_code_template_m14` (`Adaptive Corridor`) is served by route `1003` in district `4`.

**Table `bus_operators`**

| company_name | contact_person | contact_phone | license_number |
|---|---|---|---|
| Feedback Rating | Alyssa Chung | Joe Tsai | LIC-2589 |
| Virgin Group | Brianna Mejia | Stephanie Collins | LIC-2596 |
| United Technologies | Eric Schultz | Tasha Rodriguez | LIC-2603 |
| Link Title | Peter Montgomery | Walter Pratt | LIC-2610 |

The `bus_operators` table stores the contracted transportation companies. Each operator is identified by `license_number` (e.g. `LIC-2589`, `LIC-2596`, `LIC-2603`, `LIC-2610`) and described by `company_name` (such as `Feedback Rating` or `Virgin Group`), `contact_person` (e.g. `Alyssa Chung`, `Brianna Mejia`), and `contact_phone` (e.g. `Joe Tsai`, `Stephanie Collins`). The license number serves as the primary key and is referenced by `bus_routes.bus_operator_license_number`.

**Table `districts`**

| district_id | district_name | district_code | region |
|---|---|---|---|
| 1 | Extended Review | prepor | distributed-region-12 |
| 2 | Pilot Initiative A | 325454 | baseline-region-13 |
| 3 | Baseline Model | 1152669 | pilot-region-14 |
| 4 | Distributed Cluster | 605952 | extended-region-15 |

The `districts` table defines the administrative districts that govern the educational system. Each district is identified by `district_id` (e.g. `1`, `2`, `3`, `4`) and described by `district_name` (such as `Extended Review` or `Distributed Cluster`), `district_code` (e.g. `prepor`, `325454`), and `region` (e.g. `distributed-region-12`, `baseline-region-13`). The `district_id` is referenced by `school_campuses.district_id`, `pickup_zones.district_id`, and the junction tables `districts_zones` and `districts_campuses`.

The remaining base tables are junction tables that resolve many-to-many relationships. The `routes_zones` table links routes to zones, allowing a single route to serve multiple pickup zones and a zone to be served by multiple routes. The `campuses_routes` table links campuses to routes, the `operators_routes` table links operators to routes, the `districts_zones` table links districts to zones, and the `districts_campuses` table links districts to campuses. These junction tables each contain pairs of foreign keys that reference the primary keys of the entities they connect.

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

The `routes_zones` junction table materialises the many-to-many relationship between `bus_routes` and `pickup_zones`. Each row pairs a `bus_route_id` with a `zone_code`. In the sample data, route `1000` serves zones `974943` and `2002007020170`, route `1001` serves zones `2002007020170` and `9424913`, route `1002` serves zones `9424913` and `lu_tax_code_template_m14`, and route `1003` serves zones `lu_tax_code_template_m14` and `974943`. This means zone `974943` is served by both routes `1000` and `1003`, while zone `2002007020170` is served by both routes `1000` and `1001`.

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

The `campuses_routes` junction table links `school_campuses` to `bus_routes`, enabling a campus to be served by multiple routes and a route to serve multiple campuses. The table contains pairs of `school_campus_id` and `bus_route_id` that define which routes are assigned to which campuses.

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

The `operators_routes` junction table links `bus_operators` to `bus_routes`, allowing an operator to manage multiple routes and a route to be operated by multiple operators. The table contains pairs of `license_number` and `bus_route_id`.

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

The `districts_zones` junction table links `districts` to `pickup_zones`, enabling a district to contain multiple zones and a zone to be associated with multiple districts. The table contains pairs of `district_id` and `zone_code`.

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

The `districts_campuses` junction table links `districts` to `school_campuses`, enabling a district to contain multiple campuses and a campus to be associated with multiple districts. The table contains pairs of `district_id` and `school_campus_id`.

The views in this schema provide denormalised, query-ready perspectives on the normalised data. Each view joins the relevant base and junction tables to reconstruct a domain fact in a single flat result set.

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

The `bus_route_school_campus_view` joins `bus_routes` to `school_campuses` on `bus_routes.school_campus_id = school_campuses.school_campus_id`, producing a flat view of each route alongside its assigned campus. Reading the sample data, route `1000` (code `2405`, round-trip fee `26.25`, status `active`) is served by campus `100` (`Integrated Assessment A`, type `kindergarten`) in district `1`. Route `1003` (code `e02275d4-8fd1-11eb-924d-9cd76263cbd0`, round-trip fee `13.49`, status `active`) is served by campus `103` (`Baseline Series D`, type `kindergarten`) in district `4`. This view answers the question: "Which campus is assigned to each bus route, and what are the route's fee and status parameters?"

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

The `bus_route_pickup_zone_detail_view` joins `bus_routes` to `pickup_zones` through the `routes_zones` junction table, producing one row per route-zone pairing. Route `1000` appears twice — once for zone `974943` (`Pilot Series`) and once for zone `2002007020170` (`Baseline Assessment`). Route `1003` similarly appears for zones `lu_tax_code_template_m14` (`Adaptive Corridor`) and `974943` (`Pilot Series`). This view answers: "Which pickup zones does each route serve, and what are the zone's special instructions?"

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

The `bus_route_bus_operator_view` joins `bus_routes` to `bus_operators` on `bus_routes.bus_operator_license_number = bus_operators.license_number`, producing a flat view of each route alongside its operating company. Route `1000` (round-trip fee `26.25`, status `active`) is operated by `Feedback Rating` (contact: `Alyssa Chung`, phone: `Joe Tsai`). Route `1002` (round-trip fee `19.97`, status `archived`) is operated by `United Technologies` (contact: `Eric Schultz`, phone: `Tasha Rodriguez`). This view answers: "Which company operates each route, and what are the route's operational parameters?"

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

The `school_campus_bus_route_detail_view` joins `school_campuses` to `bus_routes` on `school_campuses.school_campus_id = bus_routes.school_campus_id`, producing a flat view of each campus alongside its assigned route. Campus `100` (`Integrated Assessment A`, type `kindergarten`) is served by route `1000` (code `2405`, round-trip fee `26.25`, status `active`). Campus `102` (`Pilot Corridor`, type `bilingual`) is served by route `1002` (code `9085264`, round-trip fee `19.97`, status `archived`). This view answers: "Which route serves each campus, and what are the route's fee and status details?"

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

The `school_campus_district_view` joins `school_campuses` to `districts` on `school_campuses.district_id = districts.district_id`, producing a flat view of each campus alongside its governing district. Campus `100` (`Integrated Assessment A`) belongs to district `1` (`Extended Review`, code `prepor`, region `distributed-region-12`). Campus `103` (`Baseline Series D`) belongs to district `4` (`Distributed Cluster`, code `605952`, region `extended-region-15`). This view answers: "Which district governs each campus, and what are the district's regional parameters?"

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

The `pickup_zone_bus_route_view` joins `pickup_zones` to `bus_routes` through the `routes_zones` junction table, producing one row per zone-route pairing. Zone `974943` (`Pilot Series`, special instructions `regional-special-78`) is served by route `1000` (code `2405`, round-trip fee `26.25`) and also by route `1003` (code `e02275d4-8fd1-11eb-924d-9cd76263cbd0`, round-trip fee `13.49`). Zone `2002007020170` (`Baseline Assessment`, special instructions `legacy-special-79`) is served by routes `1000` and `1001`. This view answers: "Which routes serve each pickup zone, and what are the route's fee and status parameters?"

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

The `pickup_zone_district_view` joins `pickup_zones` to `districts` on `pickup_zones.district_id = districts.district_id`, producing a flat view of each zone alongside its governing district. Zone `974943` (`Pilot Series`) belongs to district `1` (`Extended Review`, region `distributed-region-12`). Zone `lu_tax_code_template_m14` (`Adaptive Corridor`, special instructions `composite-special-81`) belongs to district `4` (`Distributed Cluster`, region `extended-region-15`). This view answers: "Which district governs each pickup zone, and what are the zone's special instructions?"

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

The `bus_operator_bus_route_detail_view` joins `bus_operators` to `bus_routes` on `bus_operators.license_number = bus_routes.bus_operator_license_number`, producing a flat view of each operator alongside their assigned routes. Operator `LIC-2589` (`Feedback Rating`, contact `Alyssa Chung`) operates route `1000` (code `2405`, round-trip fee `26.25`, status `active`). Operator `LIC-2603` (`United Technologies`, contact `Eric Schultz`) operates route `1002` (code `9085264`, round-trip fee `19.97`, status `archived`). This view answers: "Which routes does each operator manage, and what are the route's operational parameters?"

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

The `district_pickup_zone_detail_view` joins `districts` to `pickup_zones` through the `districts_zones` junction table, producing one row per district-zone pairing. District `1` (`Extended Review`, region `distributed-region-12`) contains zone `974943` (`Pilot Series`, special instructions `regional-special-78`). District `4` (`Distributed Cluster`, region `extended-region-15`) contains zone `lu_tax_code_template_m14` (`Adaptive Corridor`, special instructions `composite-special-81`). This view answers: "Which pickup zones belong to each district, and what are the zone's special instructions?"

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

The `district_school_campus_detail_view` joins `districts` to `school_campuses` through the `districts_campuses` junction table, producing one row per district-campus pairing. District `1` (`Extended Review`, region `distributed-region-12`) contains campus `100` (`Integrated Assessment A`, type `kindergarten`). District `3` (`Baseline Model`, region `pilot-region-14`) contains campus `102` (`Pilot Corridor`, type `bilingual`). This view answers: "Which campuses belong to each district, and what are the campus's type and academic year parameters?"

The schema demonstrates a disciplined approach to normalisation: core entities are stored in their own tables with surrogate or natural keys, relationships are expressed through explicit foreign-key columns where the cardinality is one-to-many (such as `bus_routes.school_campus_id` and `bus_routes.bus_operator_license_number`), and many-to-many relationships are resolved through dedicated junction tables (`routes_zones`, `campuses_routes`, `operators_routes`, `districts_zones`, `districts_campuses`). The views then reassemble the normalised data into flat, query-ready perspectives that answer specific domain questions — which routes serve which campuses, which operators manage which routes, which zones belong to which districts — without requiring the consumer of the data to understand the underlying join topology. This separation of concerns between the normalised base schema and the denormalised view layer is a hallmark of well-designed analytical data models.