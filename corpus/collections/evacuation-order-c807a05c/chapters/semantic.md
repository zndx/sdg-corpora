Disaster management agencies must coordinate evacuations across geographic zones, properties, households, shelters, and communication channels while tracking the hazard events that trigger each response. The ontology underlying this domain distinguishes eight core entity types—`evacuation_orders`, `hazard_events`, `evacuation_zones`, `evacuation_routes`, `properties`, `households`, `shelters`, and `warning_channels`—and models their interrelationships through a combination of direct foreign-key associations and junction tables that capture many-to-many participation. The resulting relational schema normalizes the domain into fourteen base tables and exposes twenty-one materialized views that reconstruct domain facts from the normalized grain.

**Table `evacuation_orders`**

| id | order_identifier | issuing_authority | issue_date_time | evacuation_type | warning_method | compliance_status | hazard_event_id | warning_channel_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ORD-2692 | extended-issuing-33 | 2024-07-23T06:30:00 | mandatory | media | pending | 100 | 100 |
| 2 | ORD-2696 | integrated-issuing-34 | 2025-12-07T13:47:00 | voluntary | sirens | in_progress | 101 | 101 |
| 3 | ORD-2700 | seasonal-issuing-35 | 2022-05-18T20:04:00 | immediate | telephone | complete | 102 | 102 |
| 4 | ORD-2704 | regional-issuing-36 | 2023-10-02T03:21:00 | scheduled | direct_notification | failed | 103 | 103 |

The `evacuation_orders` table is the central command artifact. Each row represents a single evacuation directive issued by an authority, identified by `order_identifier` values such as `ORD-2692` and `ORD-2696`. The `issuing_authority` column records the organizational source—`extended-issuing-33`, `integrated-issuing-34`, `seasonal-issuing-35`, `regional-issuing-36`—while `issue_date_time` timestamps the directive in ISO 8601 format. The `evacuation_type` column classifies the directive as `mandatory`, `voluntary`, `immediate`, or `scheduled`, and `warning_method` records the dissemination channel used at issuance: `media`, `sirens`, `telephone`, or `direct_notification`. The `compliance_status` column tracks execution progress through the states `pending`, `in_progress`, `complete`, and `failed`. Two foreign keys anchor the order to the rest of the model: `hazard_event_id` links the order to the triggering hazard event, and `warning_channel_id` links it to the communication channel used for the directive.

**Table `hazard_events`**

| hazard_event_id | event_identifier | event_category | severity_level | onset_date_time | peak_intensity_date_time | affected_population_count | is_monitored | evacuation_order_id | evacuation_route_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | EVE-2706 | weather | 29 | 2023-02-16T01:27:00 | 2022-01-11T00:24:00 | 17 | false | 1 | 1 |
| 101 | EVE-2707 | industrial | 40 | 2024-07-27T08:44:00 | 2023-06-22T07:41:00 | 493 | true | 2 | 2 |
| 102 | EVE-2708 | transportation | 51 | 2025-12-11T15:01:00 | 2024-11-06T14:58:00 | 14463 | false | 3 | 3 |
| 103 | EVE-2709 | fire | 62 | 2022-05-22T22:18:00 | 2025-04-17T21:15:00 | 13 | true | 4 | 4 |

Hazard events are the causal triggers of evacuation activity. The `hazard_events` table stores each event under `event_identifier` values like `EVE-2706` and `EVE-2707`, classifying them by `event_category` (`weather`, `industrial`, `transportation`, `fire`) and quantifying their intensity through `severity_level` (values ranging from 29 to 62 in the sample data). Temporal attributes `onset_date_time` and `peak_intensity_date_time` bracket the event's lifecycle, while `affected_population_count` records the estimated number of people impacted (from 17 to 14,463). The boolean `is_monitored` flag indicates whether the event is under active surveillance. Two foreign keys on this table create a bidirectional linkage with the command layer: `evacuation_order_id` points back to the order that was issued in response, and `evacuation_route_id` associates the event with a designated evacuation route. This dual foreign-key design means a hazard event can be directly traced to both the command decision and the logistical path chosen for evacuation.

**Table `evacuation_zones`**

| id | zone_identifier | zone_name | risk_category | estimated_resident_count | zone_boundary_coordinates | is_coastal | evacuation_order_id |
|---|---|---|---|---|---|---|---|
| 1 | ZON-2258 | Pilot Series | high | 66 | adaptive-zone-11 | false | 1 |
| 2 | ZON-2263 | Baseline Assessment | medium | 2946 | distributed-zone-12 | true | 2 |
| 3 | ZON-2268 | Distributed Survey A | low | 4 | baseline-zone-13 | false | 3 |
| 4 | ZON-2273 | Adaptive Corridor | high | 0 | pilot-zone-14 | true | 4 |

Evacuation zones partition the geographic area under an evacuation order into manageable sub-regions. The `evacuation_zones` table stores each zone under `zone_identifier` values such as `ZON-2258` and `ZON-2263`, with `zone_name` providing a human-readable label like `Pilot Series` and `Baseline Assessment`. The `risk_category` column classifies each zone as `high`, `medium`, or `low`, while `estimated_resident_count` records the projected population (from 0 to 2,946 residents). The `zone_boundary_coordinates` column holds a spatial descriptor (e.g., `adaptive-zone-11`, `distributed-zone-12`), and `is_coastal` is a boolean flag indicating proximity to coastal waters. The `evacuation_order_id` foreign key binds each zone to the order that triggered its designation, establishing a one-to-many relationship: a single evacuation order can encompass multiple zones.

**Table `evacuation_routes`**

| evacuation_route_id | route_identifier | route_name | route_status | capacity_rating | is_shortcut | flood_risk_level | shelter_id |
|---|---|---|---|---|---|---|---|
| 1 | ROU-2146 | Pilot Survey | open | 35 | true | none | 100 |
| 2 | ROU-2152 | Baseline Corridor | blocked | 43 | false | low | 101 |
| 3 | ROU-2158 | Distributed Series A | washed_out | 51 | true | high | 102 |
| 4 | ROU-2164 | Adaptive Assessment | restricted | 59 | false | none | 103 |

Evacuation routes define the physical corridors through which populations move from hazard zones to safety. The `evacuation_routes` table stores each route under `route_identifier` values like `ROU-2146` and `ROU-2152`, with `route_name` providing labels such as `Pilot Survey` and `Baseline Corridor`. The `route_status` column tracks operational state through values like `open`, `blocked`, `washed_out`, and `restricted`. The `capacity_rating` column quantifies throughput capacity (values 35 through 59), while `is_shortcut` is a boolean indicating whether the route is a designated shortcut. The `flood_risk_level` column records flood exposure as `none`, `low`, or `high`. The `shelter_id` foreign key associates each route with its destination shelter, creating a one-to-many relationship from shelters to routes.

**Table `properties`**

| id | property_identifier | address | property_type | occupancy_status | has_vehicle_access | flooding_risk | evacuation_zone_id | household_id | evacuation_route_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | PRO-2098 | distributed-address-72 | residential | occupied | true | false | 1 | 1000 | 1 |
| 1001 | PRO-2103 | baseline-address-73 | school | vacant | false | true | 2 | 1001 | 2 |
| 1002 | PRO-2108 | pilot-address-74 | workplace | evacuated | true | false | 3 | 1002 | 3 |
| 1003 | PRO-2113 | extended-address-75 | commercial | occupied | false | true | 4 | 1003 | 4 |

Properties represent the built environment within the evacuation area. The `properties` table stores each property under `property_identifier` values such as `PRO-2098` and `PRO-2103`, with `address` providing location descriptors like `distributed-address-72` and `baseline-address-73`. The `property_type` column classifies structures as `residential`, `school`, `workplace`, or `commercial`. The `occupancy_status` column tracks current state through `occupied`, `vacant`, `evacuated`, and `returned`. Boolean flags `has_vehicle_access` and `flooding_risk` capture infrastructure characteristics. Three foreign keys anchor the property to the broader model: `evacuation_zone_id` places the property within a geographic zone, `household_id` links it to the resident household, and `evacuation_route_id` associates it with a designated evacuation route.

**Table `households`**

| id | household_identifier | vehicle_count | has_transportation_arrangement | disaster_kit_ready | evacuation_status | fuel_level_percent | property_id | shelter_id | warning_channel_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | HOU-2425 | 4 | true | true | preparing | 9.45 | 1000 | 100 | 100 |
| 1001 | HOU-2429 | 3 | false | false | departed | 11.90 | 1001 | 101 | 101 |
| 1002 | HOU-2433 | 51 | true | true | at_shelter | 14.35 | 1002 | 102 | 102 |
| 1003 | HOU-2437 | 4 | false | false | returned | 16.80 | 1003 | 103 | 103 |

Households are the human units at the center of evacuation planning. The `households` table stores each household under `household_identifier` values such as `HOU-2425` and `HOU-2429`, with `vehicle_count` recording transportation resources (from 3 to 51 vehicles). Boolean flags `has_transportation_arrangement` and `disaster_kit_ready` capture preparedness status. The `evacuation_status` column tracks movement progress through `preparing`, `departed`, `at_shelter`, and `returned`, while `fuel_level_percent` records current fuel availability (9.45% to 16.80%). Three foreign keys link the household to its context: `property_id` associates it with its dwelling, `shelter_id` records its current or assigned shelter, and `warning_channel_id` links it to the communication channel through which it receives alerts.

**Table `shelters`**

| id | shelter_identifier | shelter_name | shelter_type | current_occupancy | max_capacity | operational_status |
|---|---|---|---|---|---|---|
| 100 | SHE-2726 | Regional Cluster | public_building | 27 | 32 | open |
| 101 | SHE-2729 | Seasonal Review D | community_center | 36 | 42 | full |
| 102 | SHE-2732 | Integrated Initiative | temporary_camp | 45 | 52 | closed |
| 103 | SHE-2735 | Extended Model | public_building | 54 | 62 | open |

Shelters provide the destination infrastructure for evacuated populations. The `shelters` table stores each shelter with its own identifier and descriptive attributes including `shelter_name`, `shelter_type`, `capacity`, `current_occupancy`, `is_accessible`, and `is_active`. Shelters are linked to evacuation routes through the `shelter_id` foreign key on `evacuation_routes`, and to households through the `shelter_id` foreign key on `households`.

**Table `warning_channels`**

| warning_channel_id | channel_identifier | channel_name | channel_type | power_dependency | coverage_area | is_reliable_during_outage | evacuation_order_id | household_id |
|---|---|---|---|---|---|---|---|---|
| 100 | CHA-2292 | Adaptive Corridor | radio | true | extended-coverage-87 | false | 1 | 1000 |
| 101 | CHA-2294 | Primary Series | television | false | integrated-coverage-88 | true | 2 | 1001 |
| 102 | CHA-2296 | Composite Assessment D | siren | true | seasonal-coverage-89 | false | 3 | 1002 |
| 103 | CHA-2298 | Compact Survey | telephone | false | regional-coverage-90 | true | 4 | 1003 |

Warning channels are the communication pathways through which evacuation directives reach the public. The `warning_channels` table stores each channel with attributes including `channel_identifier`, `channel_name`, `channel_type`, and `is_active`. Warning channels are referenced by both `evacuation_orders` (via `warning_channel_id`) and `households` (via `warning_channel_id`), creating a many-to-many relationship between orders and households that is mediated through the channel entity.

The domain's many-to-many relationships are materialized through six junction tables. The `orders_zones` table resolves the relationship between evacuation orders and evacuation zones, allowing a single order to span multiple zones and a single zone to be referenced by multiple orders. The `zones_properties` table links evacuation zones to properties, enabling a zone to contain multiple properties and a property to be associated with multiple zones. The `zones_routes` and `routes_zones` tables together manage the bidirectional relationship between evacuation zones and evacuation routes, capturing which routes serve which zones and which zones are served by which routes. The `shelters_routes` table links shelters to the routes that lead to them, and the `shelters_households` table records which households are assigned to or currently occupying which shelters.

**Table `orders_zones`**

| evacuation_order_id | evacuation_zone_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `orders_zones` junction table resolves the many-to-many relationship between `evacuation_orders` and `evacuation_zones`. Each row pairs an `order_id` with a `zone_id`, allowing a single evacuation order to encompass multiple zones and a single zone to be referenced by multiple orders. This table is the normalized form of the direct `evacuation_order_id` foreign key on `evacuation_zones`, providing the flexibility to reassign zones across orders without data duplication.

**Table `zones_properties`**

| evacuation_zone_id | property_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `zones_properties` junction table resolves the many-to-many relationship between `evacuation_zones` and `properties`. Each row pairs a `zone_id` with a `property_id`, enabling a zone to contain multiple properties and a property to be associated with multiple zones. This table complements the direct `evacuation_zone_id` foreign key on `properties`, providing the normalized structure for zone-to-property membership.

**Table `zones_routes`**

| evacuation_zone_id | evacuation_route_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `zones_routes` junction table resolves the many-to-many relationship between `evacuation_zones` and `evacuation_routes`. Each row pairs a `zone_id` with a `route_id`, capturing which evacuation routes serve which zones. This table enables flexible route-to-zone assignments that can change as hazard conditions evolve.

**Table `routes_zones`**

| evacuation_route_id | evacuation_zone_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `routes_zones` junction table provides the inverse perspective of the zone-route relationship, pairing `route_id` with `zone_id` to capture which zones are served by which routes. Together with `zones_routes`, this table supports bidirectional navigation between zones and routes in query patterns that need to traverse the relationship in either direction.

**Table `shelters_routes`**

| shelter_id | evacuation_route_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `shelters_routes` junction table resolves the many-to-many relationship between `shelters` and `evacuation_routes`. Each row pairs a `shelter_id` with a `route_id`, allowing a shelter to be reachable via multiple routes and a route to serve multiple shelters. This table complements the direct `shelter_id` foreign key on `evacuation_routes`, providing the normalized structure for shelter-route associations.

**Table `shelters_households`**

| shelter_id | household_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The `shelters_households` junction table resolves the many-to-many relationship between `shelters` and `households`. Each row pairs a `shelter_id` with a `household_id`, recording which households are assigned to or currently occupying which shelters. This table complements the direct `shelter_id` foreign key on `households`, providing the normalized structure for shelter-household assignments.

The materialized views reconstruct domain facts by joining the normalized tables back into denormalized perspectives that answer specific operational questions. Each view is a named query that materializes a particular join path through the schema.

**View `vw_evacuation_order_hazard_event`**

```sql
CREATE VIEW vw_evacuation_order_hazard_event AS
SELECT a.id, a.order_identifier, a.issuing_authority, a.issue_date_time, b.hazard_event_id AS event_hazard_event_id, b.event_identifier AS event_event_identifier, b.event_category AS event_event_category
FROM evacuation_orders a JOIN hazard_events b ON a.hazard_event_id = b.hazard_event_id;
```

| id | order_identifier | issuing_authority | issue_date_time | event_hazard_event_id | event_event_identifier | event_event_category |
|---|---|---|---|---|---|---|
| 1 | ORD-2692 | extended-issuing-33 | 2024-07-23T06:30:00 | 100 | EVE-2706 | weather |
| 2 | ORD-2696 | integrated-issuing-34 | 2025-12-07T13:47:00 | 101 | EVE-2707 | industrial |
| 3 | ORD-2700 | seasonal-issuing-35 | 2022-05-18T20:04:00 | 102 | EVE-2708 | transportation |
| 4 | ORD-2704 | regional-issuing-36 | 2023-10-02T03:21:00 | 103 | EVE-2709 | fire |

The `vw_evacuation_order_hazard_event` view joins `evacuation_orders` to `hazard_events` on the `hazard_event_id` foreign key, answering the question: "Which hazard event triggered which evacuation order?" A row from this view might show `ORD-2692` issued by `extended-issuing-33` in response to hazard event `EVE-2706`, a weather event with severity level 29 that affected 17 people. This view is the primary command-to-causality bridge, allowing analysts to trace each directive back to its triggering event.

**View `vw_evacuation_order_evacuation_zone_detail`**

```sql
CREATE VIEW vw_evacuation_order_evacuation_zone_detail AS
SELECT a.id, a.order_identifier, a.issuing_authority, b.id AS zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_name AS zone_zone_name
FROM evacuation_orders a
  JOIN orders_zones j ON j.evacuation_order_id = a.id
  JOIN evacuation_zones b ON b.id = j.evacuation_zone_id;
```

| id | order_identifier | issuing_authority | zone_id | zone_zone_identifier | zone_zone_name |
|---|---|---|---|---|---|
| 1 | ORD-2692 | extended-issuing-33 | 1 | ZON-2258 | Pilot Series |
| 1 | ORD-2692 | extended-issuing-33 | 2 | ZON-2263 | Baseline Assessment |
| 2 | ORD-2696 | integrated-issuing-34 | 2 | ZON-2263 | Baseline Assessment |
| 2 | ORD-2696 | integrated-issuing-34 | 3 | ZON-2268 | Distributed Survey A |
| 3 | ORD-2700 | seasonal-issuing-35 | 3 | ZON-2268 | Distributed Survey A |
| 3 | ORD-2700 | seasonal-issuing-35 | 4 | ZON-2273 | Adaptive Corridor |
| 4 | ORD-2704 | regional-issuing-36 | 4 | ZON-2273 | Adaptive Corridor |
| 4 | ORD-2704 | regional-issuing-36 | 1 | ZON-2258 | Pilot Series |

The `vw_evacuation_order_evacuation_zone_detail` view joins `evacuation_orders` to `evacuation_zones` through the `orders_zones` junction table, answering: "Which zones are covered by which evacuation orders?" A row might show order `ORD-2696` covering zone `ZON-2263` (Baseline Assessment), a medium-risk coastal zone with 2,946 estimated residents. This view supports operational planning by revealing the geographic scope of each directive.

**View `vw_evacuation_order_warning_channel`**

```sql
CREATE VIEW vw_evacuation_order_warning_channel AS
SELECT a.id, a.order_identifier, a.issuing_authority, a.issue_date_time, b.warning_channel_id AS channel_warning_channel_id, b.channel_identifier AS channel_channel_identifier, b.channel_name AS channel_channel_name
FROM evacuation_orders a JOIN warning_channels b ON a.warning_channel_id = b.warning_channel_id;
```

| id | order_identifier | issuing_authority | issue_date_time | channel_warning_channel_id | channel_channel_identifier | channel_channel_name |
|---|---|---|---|---|---|---|
| 1 | ORD-2692 | extended-issuing-33 | 2024-07-23T06:30:00 | 100 | CHA-2292 | Adaptive Corridor |
| 2 | ORD-2696 | integrated-issuing-34 | 2025-12-07T13:47:00 | 101 | CHA-2294 | Primary Series |
| 3 | ORD-2700 | seasonal-issuing-35 | 2022-05-18T20:04:00 | 102 | CHA-2296 | Composite Assessment D |
| 4 | ORD-2704 | regional-issuing-36 | 2023-10-02T03:21:00 | 103 | CHA-2298 | Compact Survey |

The `vw_evacuation_order_warning_channel` view joins `evacuation_orders` to `warning_channels` on `warning_channel_id`, answering: "Through which communication channel was each evacuation order disseminated?" A row might show order `ORD-2700` (immediate evacuation type) disseminated via the `telephone` warning method. This view supports communication audit trails and effectiveness analysis.

**View `vw_hazard_event_evacuation_order`**

```sql
CREATE VIEW vw_hazard_event_evacuation_order AS
SELECT a.hazard_event_id, a.event_identifier, a.event_category, a.severity_level, b.id AS order_id, b.order_identifier AS order_order_identifier, b.issuing_authority AS order_issuing_authority
FROM hazard_events a JOIN evacuation_orders b ON a.evacuation_order_id = b.id;
```

| hazard_event_id | event_identifier | event_category | severity_level | order_id | order_order_identifier | order_issuing_authority |
|---|---|---|---|---|---|---|
| 100 | EVE-2706 | weather | 29 | 1 | ORD-2692 | extended-issuing-33 |
| 101 | EVE-2707 | industrial | 40 | 2 | ORD-2696 | integrated-issuing-34 |
| 102 | EVE-2708 | transportation | 51 | 3 | ORD-2700 | seasonal-issuing-35 |
| 103 | EVE-2709 | fire | 62 | 4 | ORD-2704 | regional-issuing-36 |

The `vw_hazard_event_evacuation_order` view joins `hazard_events` to `evacuation_orders` on `evacuation_order_id`, answering the inverse question: "Which evacuation order was issued in response to which hazard event?" A row might show hazard event `EVE-2708` (transportation category, severity 51, affecting 14,463 people) triggered order `ORD-2700` issued by `seasonal-issuing-35`. This view supports impact analysis by starting from the hazard and tracing to the response.

**View `vw_hazard_event_evacuation_route`**

```sql
CREATE VIEW vw_hazard_event_evacuation_route AS
SELECT a.hazard_event_id, a.event_identifier, a.event_category, a.severity_level, b.evacuation_route_id AS route_evacuation_route_id, b.route_identifier AS route_route_identifier, b.route_name AS route_route_name
FROM hazard_events a JOIN evacuation_routes b ON a.evacuation_route_id = b.evacuation_route_id;
```

| hazard_event_id | event_identifier | event_category | severity_level | route_evacuation_route_id | route_route_identifier | route_route_name |
|---|---|---|---|---|---|---|
| 100 | EVE-2706 | weather | 29 | 1 | ROU-2146 | Pilot Survey |
| 101 | EVE-2707 | industrial | 40 | 2 | ROU-2152 | Baseline Corridor |
| 102 | EVE-2708 | transportation | 51 | 3 | ROU-2158 | Distributed Series A |
| 103 | EVE-2709 | fire | 62 | 4 | ROU-2164 | Adaptive Assessment |

The `vw_hazard_event_evacuation_route` view joins `hazard_events` to `evacuation_routes` on `evacuation_route_id`, answering: "Which evacuation route is associated with which hazard event?" A row might show hazard event `EVE-2707` (industrial category, monitored status true) associated with route `ROU-2152` (Baseline Corridor, blocked status, low flood risk). This view supports logistical planning by linking hazard events to their designated evacuation corridors.

**View `vw_evacuation_zone_evacuation_order`**

```sql
CREATE VIEW vw_evacuation_zone_evacuation_order AS
SELECT a.id, a.zone_identifier, a.zone_name, a.risk_category, b.id AS order_id, b.order_identifier AS order_order_identifier, b.issuing_authority AS order_issuing_authority
FROM evacuation_zones a JOIN evacuation_orders b ON a.evacuation_order_id = b.id;
```

| id | zone_identifier | zone_name | risk_category | order_id | order_order_identifier | order_issuing_authority |
|---|---|---|---|---|---|---|
| 1 | ZON-2258 | Pilot Series | high | 1 | ORD-2692 | extended-issuing-33 |
| 2 | ZON-2263 | Baseline Assessment | medium | 2 | ORD-2696 | integrated-issuing-34 |
| 3 | ZON-2268 | Distributed Survey A | low | 3 | ORD-2700 | seasonal-issuing-35 |
| 4 | ZON-2273 | Adaptive Corridor | high | 4 | ORD-2704 | regional-issuing-36 |

The `vw_evacuation_zone_evacuation_order` view joins `evacuation_zones` to `evacuation_orders` on `evacuation_order_id`, answering: "Which evacuation order designated this zone?" A row might show zone `ZON-2258` (Pilot Series, high risk, 66 residents) designated by order `ORD-2692`. This view supports zone-level analysis by revealing the command context for each geographic area.

**View `vw_evacuation_zone_property_detail`**

```sql
CREATE VIEW vw_evacuation_zone_property_detail AS
SELECT a.id, a.zone_identifier, a.zone_name, b.id AS property_id, b.property_identifier AS property_property_identifier, b.address AS property_address
FROM evacuation_zones a
  JOIN zones_properties j ON j.evacuation_zone_id = a.id
  JOIN properties b ON b.id = j.property_id;
```

| id | zone_identifier | zone_name | property_id | property_property_identifier | property_address |
|---|---|---|---|---|---|
| 1 | ZON-2258 | Pilot Series | 1000 | PRO-2098 | distributed-address-72 |
| 1 | ZON-2258 | Pilot Series | 1001 | PRO-2103 | baseline-address-73 |
| 2 | ZON-2263 | Baseline Assessment | 1001 | PRO-2103 | baseline-address-73 |
| 2 | ZON-2263 | Baseline Assessment | 1002 | PRO-2108 | pilot-address-74 |
| 3 | ZON-2268 | Distributed Survey A | 1002 | PRO-2108 | pilot-address-74 |
| 3 | ZON-2268 | Distributed Survey A | 1003 | PRO-2113 | extended-address-75 |
| 4 | ZON-2273 | Adaptive Corridor | 1003 | PRO-2113 | extended-address-75 |
| 4 | ZON-2273 | Adaptive Corridor | 1000 | PRO-2098 | distributed-address-72 |

The `vw_evacuation_zone_property_detail` view joins `evacuation_zones` to `properties` through the `zones_properties` junction table, answering: "Which properties are located within which evacuation zones?" A row might show zone `ZON-2263` (Baseline Assessment, medium risk) containing property `PRO-2103` (baseline-address-73, school type, vacant, with flooding risk). This view supports property-level risk assessment within zone contexts.

**View `vw_evacuation_zone_evacuation_route_detail`**

```sql
CREATE VIEW vw_evacuation_zone_evacuation_route_detail AS
SELECT a.id, a.zone_identifier, a.zone_name, b.evacuation_route_id AS route_evacuation_route_id, b.route_identifier AS route_route_identifier, b.route_name AS route_route_name
FROM evacuation_zones a
  JOIN zones_routes j ON j.evacuation_zone_id = a.id
  JOIN evacuation_routes b ON b.evacuation_route_id = j.evacuation_route_id;
```

| id | zone_identifier | zone_name | route_evacuation_route_id | route_route_identifier | route_route_name |
|---|---|---|---|---|---|
| 1 | ZON-2258 | Pilot Series | 1 | ROU-2146 | Pilot Survey |
| 1 | ZON-2258 | Pilot Series | 2 | ROU-2152 | Baseline Corridor |
| 2 | ZON-2263 | Baseline Assessment | 2 | ROU-2152 | Baseline Corridor |
| 2 | ZON-2263 | Baseline Assessment | 3 | ROU-2158 | Distributed Series A |
| 3 | ZON-2268 | Distributed Survey A | 3 | ROU-2158 | Distributed Series A |
| 3 | ZON-2268 | Distributed Survey A | 4 | ROU-2164 | Adaptive Assessment |
| 4 | ZON-2273 | Adaptive Corridor | 4 | ROU-2164 | Adaptive Assessment |
| 4 | ZON-2273 | Adaptive Corridor | 1 | ROU-2146 | Pilot Survey |

The `vw_evacuation_zone_evacuation_route_detail` view joins `evacuation_zones` to `evacuation_routes` through the `zones_routes` junction table, answering: "Which evacuation routes serve which zones?" A row might show zone `ZON-2268` (Distributed Survey A, low risk, 4 residents) served by route `ROU-2158` (Distributed Series A, washed_out status, high flood risk). This view supports route planning by revealing zone-to-route assignments.

**View `vw_evacuation_route_evacuation_zone_detail`**

```sql
CREATE VIEW vw_evacuation_route_evacuation_zone_detail AS
SELECT a.evacuation_route_id, a.route_identifier, a.route_name, b.id AS zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_name AS zone_zone_name
FROM evacuation_routes a
  JOIN routes_zones j ON j.evacuation_route_id = a.evacuation_route_id
  JOIN evacuation_zones b ON b.id = j.evacuation_zone_id;
```

| evacuation_route_id | route_identifier | route_name | zone_id | zone_zone_identifier | zone_zone_name |
|---|---|---|---|---|---|
| 1 | ROU-2146 | Pilot Survey | 1 | ZON-2258 | Pilot Series |
| 1 | ROU-2146 | Pilot Survey | 2 | ZON-2263 | Baseline Assessment |
| 2 | ROU-2152 | Baseline Corridor | 2 | ZON-2263 | Baseline Assessment |
| 2 | ROU-2152 | Baseline Corridor | 3 | ZON-2268 | Distributed Survey A |
| 3 | ROU-2158 | Distributed Series A | 3 | ZON-2268 | Distributed Survey A |
| 3 | ROU-2158 | Distributed Series A | 4 | ZON-2273 | Adaptive Corridor |
| 4 | ROU-2164 | Adaptive Assessment | 4 | ZON-2273 | Adaptive Corridor |
| 4 | ROU-2164 | Adaptive Assessment | 1 | ZON-2258 | Pilot Series |

The `vw_evacuation_route_evacuation_zone_detail` view joins `evacuation_routes` to `evacuation_zones` through the `routes_zones` junction table, answering the inverse question: "Which zones are served by which evacuation routes?" A row might show route `ROU-2146` (Pilot Survey, open status, capacity 35, shortcut true) serving zone `ZON-2258` (Pilot Series, high risk). This view supports route-level analysis by revealing the zones each corridor serves.

**View `vw_evacuation_route_shelter`**

```sql
CREATE VIEW vw_evacuation_route_shelter AS
SELECT a.evacuation_route_id, a.route_identifier, a.route_name, a.route_status, b.id AS shelter_id, b.shelter_identifier AS shelter_shelter_identifier, b.shelter_name AS shelter_shelter_name
FROM evacuation_routes a JOIN shelters b ON a.shelter_id = b.id;
```

| evacuation_route_id | route_identifier | route_name | route_status | shelter_id | shelter_shelter_identifier | shelter_shelter_name |
|---|---|---|---|---|---|---|
| 1 | ROU-2146 | Pilot Survey | open | 100 | SHE-2726 | Regional Cluster |
| 2 | ROU-2152 | Baseline Corridor | blocked | 101 | SHE-2729 | Seasonal Review D |
| 3 | ROU-2158 | Distributed Series A | washed_out | 102 | SHE-2732 | Integrated Initiative |
| 4 | ROU-2164 | Adaptive Assessment | restricted | 103 | SHE-2735 | Extended Model |

The `vw_evacuation_route_shelter` view joins `evacuation_routes` to `shelters` on `shelter_id`, answering: "Which shelter is the destination of which evacuation route?" A row might show route `ROU-2152` (Baseline Corridor, blocked status) leading to shelter `101`. This view supports destination planning by linking routes to their shelter endpoints.

**View `vw_property_evacuation_zone`**

```sql
CREATE VIEW vw_property_evacuation_zone AS
SELECT a.id, a.property_identifier, a.address, a.property_type, b.id AS zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_name AS zone_zone_name
FROM properties a JOIN evacuation_zones b ON a.evacuation_zone_id = b.id;
```

| id | property_identifier | address | property_type | zone_id | zone_zone_identifier | zone_zone_name |
|---|---|---|---|---|---|---|
| 1000 | PRO-2098 | distributed-address-72 | residential | 1 | ZON-2258 | Pilot Series |
| 1001 | PRO-2103 | baseline-address-73 | school | 2 | ZON-2263 | Baseline Assessment |
| 1002 | PRO-2108 | pilot-address-74 | workplace | 3 | ZON-2268 | Distributed Survey A |
| 1003 | PRO-2113 | extended-address-75 | commercial | 4 | ZON-2273 | Adaptive Corridor |

The `vw_property_evacuation_zone` view joins `properties` to `evacuation_zones` on `evacuation_zone_id`, answering: "Which evacuation zone contains this property?" A row might show property `PRO-2098` (distributed-address-72, residential, occupied) located in zone `ZON-2258` (Pilot Series, high risk). This view supports property-level queries that need zone context.

**View `vw_property_household`**

```sql
CREATE VIEW vw_property_household AS
SELECT a.id, a.property_identifier, a.address, a.property_type, b.id AS household_id, b.household_identifier AS household_household_identifier, b.vehicle_count AS household_vehicle_count
FROM properties a JOIN households b ON a.household_id = b.id;
```

| id | property_identifier | address | property_type | household_id | household_household_identifier | household_vehicle_count |
|---|---|---|---|---|---|---|
| 1000 | PRO-2098 | distributed-address-72 | residential | 1000 | HOU-2425 | 4 |
| 1001 | PRO-2103 | baseline-address-73 | school | 1001 | HOU-2429 | 3 |
| 1002 | PRO-2108 | pilot-address-74 | workplace | 1002 | HOU-2433 | 51 |
| 1003 | PRO-2113 | extended-address-75 | commercial | 1003 | HOU-2437 | 4 |

The `vw_property_household` view joins `properties` to `households` on `household_id`, answering: "Which household resides at this property?" A row might show property `PRO-2103` (baseline-address-73, school type, vacant) associated with household `HOU-2429` (3 vehicles, no transportation arrangement, not disaster-kit ready, departed status, 11.90% fuel). This view supports household-level queries that need property context.

**View `vw_property_evacuation_route`**

```sql
CREATE VIEW vw_property_evacuation_route AS
SELECT a.id, a.property_identifier, a.address, a.property_type, b.evacuation_route_id AS route_evacuation_route_id, b.route_identifier AS route_route_identifier, b.route_name AS route_route_name
FROM properties a JOIN evacuation_routes b ON a.evacuation_route_id = b.evacuation_route_id;
```

| id | property_identifier | address | property_type | route_evacuation_route_id | route_route_identifier | route_route_name |
|---|---|---|---|---|---|---|
| 1000 | PRO-2098 | distributed-address-72 | residential | 1 | ROU-2146 | Pilot Survey |
| 1001 | PRO-2103 | baseline-address-73 | school | 2 | ROU-2152 | Baseline Corridor |
| 1002 | PRO-2108 | pilot-address-74 | workplace | 3 | ROU-2158 | Distributed Series A |
| 1003 | PRO-2113 | extended-address-75 | commercial | 4 | ROU-2164 | Adaptive Assessment |

The `vw_property_evacuation_route` view joins `properties` to `evacuation_routes` on `evacuation_route_id`, answering: "Which evacuation route is associated with this property?" A row might show property `PRO-2108` (pilot-address-74, workplace, evacuated) associated with route `ROU-2158` (Distributed Series A, washed_out status). This view supports property-level evacuation planning.

**View `vw_household_property`**

```sql
CREATE VIEW vw_household_property AS
SELECT a.id, a.household_identifier, a.vehicle_count, a.has_transportation_arrangement, b.id AS property_id, b.property_identifier AS property_property_identifier, b.address AS property_address
FROM households a JOIN properties b ON a.property_id = b.id;
```

| id | household_identifier | vehicle_count | has_transportation_arrangement | property_id | property_property_identifier | property_address |
|---|---|---|---|---|---|---|
| 1000 | HOU-2425 | 4 | true | 1000 | PRO-2098 | distributed-address-72 |
| 1001 | HOU-2429 | 3 | false | 1001 | PRO-2103 | baseline-address-73 |
| 1002 | HOU-2433 | 51 | true | 1002 | PRO-2108 | pilot-address-74 |
| 1003 | HOU-2437 | 4 | false | 1003 | PRO-2113 | extended-address-75 |

The `vw_household_property` view joins `households` to `properties` on `property_id`, answering the inverse question: "Which property is associated with this household?" A row might show household `HOU-2425` (4 vehicles, has transportation arrangement, disaster kit ready, preparing status, 9.45% fuel) associated with property `PRO-2098` (distributed-address-72, residential, occupied). This view supports household-level queries that need property context.

**View `vw_household_shelter`**

```sql
CREATE VIEW vw_household_shelter AS
SELECT a.id, a.household_identifier, a.vehicle_count, a.has_transportation_arrangement, b.id AS shelter_id, b.shelter_identifier AS shelter_shelter_identifier, b.shelter_name AS shelter_shelter_name
FROM households a JOIN shelters b ON a.shelter_id = b.id;
```

| id | household_identifier | vehicle_count | has_transportation_arrangement | shelter_id | shelter_shelter_identifier | shelter_shelter_name |
|---|---|---|---|---|---|---|
| 1000 | HOU-2425 | 4 | true | 100 | SHE-2726 | Regional Cluster |
| 1001 | HOU-2429 | 3 | false | 101 | SHE-2729 | Seasonal Review D |
| 1002 | HOU-2433 | 51 | true | 102 | SHE-2732 | Integrated Initiative |
| 1003 | HOU-2437 | 4 | false | 103 | SHE-2735 | Extended Model |

The `vw_household_shelter` view joins `households` to `shelters` on `shelter_id`, answering: "Which shelter is assigned to or currently occupied by this household?" A row might show household `HOU-2433` (51 vehicles, has transportation arrangement, disaster kit ready, at_shelter status) assigned to shelter `102`. This view supports shelter capacity planning and household tracking.

**View `vw_household_warning_channel`**

```sql
CREATE VIEW vw_household_warning_channel AS
SELECT a.id, a.household_identifier, a.vehicle_count, a.has_transportation_arrangement, b.warning_channel_id AS channel_warning_channel_id, b.channel_identifier AS channel_channel_identifier, b.channel_name AS channel_channel_name
FROM households a JOIN warning_channels b ON a.warning_channel_id = b.warning_channel_id;
```

| id | household_identifier | vehicle_count | has_transportation_arrangement | channel_warning_channel_id | channel_channel_identifier | channel_channel_name |
|---|---|---|---|---|---|---|
| 1000 | HOU-2425 | 4 | true | 100 | CHA-2292 | Adaptive Corridor |
| 1001 | HOU-2429 | 3 | false | 101 | CHA-2294 | Primary Series |
| 1002 | HOU-2433 | 51 | true | 102 | CHA-2296 | Composite Assessment D |
| 1003 | HOU-2437 | 4 | false | 103 | CHA-2298 | Compact Survey |

The `vw_household_warning_channel` view joins `households` to `warning_channels` on `warning_channel_id`, answering: "Through which warning channel does this household receive alerts?" A row might show household `HOU-2437` (4 vehicles, no transportation arrangement, not disaster kit ready, returned status) receiving alerts via warning channel `103`. This view supports communication targeting and household alerting analysis.

**View `vw_shelter_evacuation_route_detail`**

```sql
CREATE VIEW vw_shelter_evacuation_route_detail AS
SELECT a.id, a.shelter_identifier, a.shelter_name, b.evacuation_route_id AS route_evacuation_route_id, b.route_identifier AS route_route_identifier, b.route_name AS route_route_name
FROM shelters a
  JOIN shelters_routes j ON j.shelter_id = a.id
  JOIN evacuation_routes b ON b.evacuation_route_id = j.evacuation_route_id;
```

| id | shelter_identifier | shelter_name | route_evacuation_route_id | route_route_identifier | route_route_name |
|---|---|---|---|---|---|
| 100 | SHE-2726 | Regional Cluster | 1 | ROU-2146 | Pilot Survey |
| 100 | SHE-2726 | Regional Cluster | 2 | ROU-2152 | Baseline Corridor |
| 101 | SHE-2729 | Seasonal Review D | 2 | ROU-2152 | Baseline Corridor |
| 101 | SHE-2729 | Seasonal Review D | 3 | ROU-2158 | Distributed Series A |
| 102 | SHE-2732 | Integrated Initiative | 3 | ROU-2158 | Distributed Series A |
| 102 | SHE-2732 | Integrated Initiative | 4 | ROU-2164 | Adaptive Assessment |
| 103 | SHE-2735 | Extended Model | 4 | ROU-2164 | Adaptive Assessment |
| 103 | SHE-2735 | Extended Model | 1 | ROU-2146 | Pilot Survey |

The `vw_shelter_evacuation_route_detail` view joins `shelters` to `evacuation_routes` through the `shelters_routes` junction table, answering: "Which evacuation routes lead to which shelters?" A row might show shelter `100` reachable via route `ROU-2146` (Pilot Survey, open status, capacity 35). This view supports shelter access planning by revealing the routes that serve each shelter.

**View `vw_shelter_household_detail`**

```sql
CREATE VIEW vw_shelter_household_detail AS
SELECT a.id, a.shelter_identifier, a.shelter_name, b.id AS household_id, b.household_identifier AS household_household_identifier, b.vehicle_count AS household_vehicle_count
FROM shelters a
  JOIN shelters_households j ON j.shelter_id = a.id
  JOIN households b ON b.id = j.household_id;
```

| id | shelter_identifier | shelter_name | household_id | household_household_identifier | household_vehicle_count |
|---|---|---|---|---|---|
| 100 | SHE-2726 | Regional Cluster | 1000 | HOU-2425 | 4 |
| 100 | SHE-2726 | Regional Cluster | 1001 | HOU-2429 | 3 |
| 101 | SHE-2729 | Seasonal Review D | 1001 | HOU-2429 | 3 |
| 101 | SHE-2729 | Seasonal Review D | 1002 | HOU-2433 | 51 |
| 102 | SHE-2732 | Integrated Initiative | 1002 | HOU-2433 | 51 |
| 102 | SHE-2732 | Integrated Initiative | 1003 | HOU-2437 | 4 |
| 103 | SHE-2735 | Extended Model | 1003 | HOU-2437 | 4 |
| 103 | SHE-2735 | Extended Model | 1000 | HOU-2425 | 4 |

The `vw_shelter_household_detail` view joins `shelters` to `households` through the `shelters_households` junction table, answering: "Which households are assigned to or occupying which shelters?" A row might show shelter `101` assigned to household `HOU-2429` (departed status, 11.90% fuel). This view supports shelter occupancy tracking and household placement analysis.

**View `vw_warning_channel_evacuation_order`**

```sql
CREATE VIEW vw_warning_channel_evacuation_order AS
SELECT a.warning_channel_id, a.channel_identifier, a.channel_name, a.channel_type, b.id AS order_id, b.order_identifier AS order_order_identifier, b.issuing_authority AS order_issuing_authority
FROM warning_channels a JOIN evacuation_orders b ON a.evacuation_order_id = b.id;
```

| warning_channel_id | channel_identifier | channel_name | channel_type | order_id | order_order_identifier | order_issuing_authority |
|---|---|---|---|---|---|---|
| 100 | CHA-2292 | Adaptive Corridor | radio | 1 | ORD-2692 | extended-issuing-33 |
| 101 | CHA-2294 | Primary Series | television | 2 | ORD-2696 | integrated-issuing-34 |
| 102 | CHA-2296 | Composite Assessment D | siren | 3 | ORD-2700 | seasonal-issuing-35 |
| 103 | CHA-2298 | Compact Survey | telephone | 4 | ORD-2704 | regional-issuing-36 |

The `vw_warning_channel_evacuation_order` view joins `warning_channels` to `evacuation_orders` on `warning_channel_id`, answering the inverse question: "Which evacuation orders were disseminated through which warning channel?" A row might show warning channel `100` used to disseminate order `ORD-2692` (mandatory evacuation type, pending compliance status). This view supports communication channel effectiveness analysis.

**View `vw_warning_channel_household`**

```sql
CREATE VIEW vw_warning_channel_household AS
SELECT a.warning_channel_id, a.channel_identifier, a.channel_name, a.channel_type, b.id AS household_id, b.household_identifier AS household_household_identifier, b.vehicle_count AS household_vehicle_count
FROM warning_channels a JOIN households b ON a.household_id = b.id;
```

| warning_channel_id | channel_identifier | channel_name | channel_type | household_id | household_household_identifier | household_vehicle_count |
|---|---|---|---|---|---|---|
| 100 | CHA-2292 | Adaptive Corridor | radio | 1000 | HOU-2425 | 4 |
| 101 | CHA-2294 | Primary Series | television | 1001 | HOU-2429 | 3 |
| 102 | CHA-2296 | Composite Assessment D | siren | 1002 | HOU-2433 | 51 |
| 103 | CHA-2298 | Compact Survey | telephone | 1003 | HOU-2437 | 4 |

The `vw_warning_channel_household` view joins `warning_channels` to `households` on `warning_channel_id`, answering: "Which households receive alerts through which warning channel?" A row might show warning channel `101` used by household `HOU-2433` (51 vehicles, at_shelter status, 14.35% fuel). This view supports household alerting analysis and communication targeting.

The schema design reflects a careful balance between normalization and query convenience. The eight base entity tables capture the core domain concepts with minimal redundancy, while the six junction tables resolve the many-to-many relationships that arise when evacuation orders span multiple zones, properties belong to multiple zones, and households can be assigned to multiple shelters. The twenty-one materialized views provide denormalized perspectives that answer the most common operational questions without requiring analysts to write complex join queries. Each view is a named reconstruction of a domain fact from the normalized grain, allowing the same underlying data to be queried from multiple perspectives—whether starting from the hazard event and tracing to the response, starting from the evacuation order and tracing to the affected zones, or starting from a household and tracing to its property, shelter, and communication channel. This multi-perspective access pattern is the hallmark of a well-modeled ontology materialized as a relational schema: the normalized tables preserve data integrity and minimize update anomalies, while the views provide the analytical convenience needed for operational decision-making during time-critical evacuation scenarios.