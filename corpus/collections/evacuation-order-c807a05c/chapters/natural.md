## Evacuation Management Systems: Records, Relationships, and Operational Views

Emergency evacuation management requires coordinating hazard intelligence, geographic risk zones, transportation corridors, and the populations within them. Every decision—from issuing a mandatory evacuation order to routing displaced households to a shelter—rests on a structured set of operational records. These records capture who is affected, where they are, how they will move, and through which channels they receive instructions. The following chapter describes the core entities, their interconnections, and the analytical views that practitioners rely on to monitor and direct evacuations in real time.

At the center of the system sits the evacuation order, the formal directive that triggers all downstream activity. An evacuation order carries an identifier such as ORD-2692, names the issuing authority (for example, extended-issuing-33), and records the precise moment of issuance, like 2024-07-23T06:30:00. Each order specifies an evacuation type—mandatory, voluntary, immediate, or scheduled—and a warning method, which may be media broadcasts, sirens, telephone calls, or direct notification. The compliance status of an order tracks its lifecycle as pending, in_progress, complete, or failed. Every order is tied to a specific hazard event and a designated warning channel, anchoring the directive to both the threat and the communication pathway.

**Table `evacuation_orders`**

| id | order_identifier | issuing_authority | issue_date_time | evacuation_type | warning_method | compliance_status | hazard_event_id | warning_channel_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ORD-2692 | extended-issuing-33 | 2024-07-23T06:30:00 | mandatory | media | pending | 100 | 100 |
| 2 | ORD-2696 | integrated-issuing-34 | 2025-12-07T13:47:00 | voluntary | sirens | in_progress | 101 | 101 |
| 3 | ORD-2700 | seasonal-issuing-35 | 2022-05-18T20:04:00 | immediate | telephone | complete | 102 | 102 |
| 4 | ORD-2704 | regional-issuing-36 | 2023-10-02T03:21:00 | scheduled | direct_notification | failed | 103 | 103 |

Hazard events represent the triggering phenomena themselves. Each event carries an identifier such as EVE-2706 and falls into a category like weather, industrial, transportation, or fire. The severity level provides a numeric measure of intensity, ranging from 29 for a weather event to 62 for a fire event in the current dataset. Temporal markers record the onset of the event and the date and time of peak intensity, while the affected population count estimates the number of people at risk. A monitored flag indicates whether the event is under active surveillance. Each hazard event links to an evacuation order and an evacuation route, forming the initial chain of response.

**Table `hazard_events`**

| hazard_event_id | event_identifier | event_category | severity_level | onset_date_time | peak_intensity_date_time | affected_population_count | is_monitored | evacuation_order_id | evacuation_route_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | EVE-2706 | weather | 29 | 2023-02-16T01:27:00 | 2022-01-11T00:24:00 | 17 | false | 1 | 1 |
| 101 | EVE-2707 | industrial | 40 | 2024-07-27T08:44:00 | 2023-06-22T07:41:00 | 493 | true | 2 | 2 |
| 102 | EVE-2708 | transportation | 51 | 2025-12-11T15:01:00 | 2024-11-06T14:58:00 | 14463 | false | 3 | 3 |
| 103 | EVE-2709 | fire | 62 | 2022-05-22T22:18:00 | 2025-04-17T21:15:00 | 13 | true | 4 | 4 |

Evacuation zones define the geographic areas subject to evacuation. A zone carries an identifier such as ZON-2258 and a human-readable name like Pilot Series or Baseline Assessment. Zones are classified by risk category—high, medium, or low—and include an estimated resident count that helps planners gauge the scale of displacement. The zone boundary is described by a coordinate reference, such as adaptive-zone-11 or distributed-zone-12, and a coastal flag indicates whether the zone borders a coastline. Each zone is associated with an evacuation order, establishing which directive governs its population.

**Table `evacuation_zones`**

| id | zone_identifier | zone_name | risk_category | estimated_resident_count | zone_boundary_coordinates | is_coastal | evacuation_order_id |
|---|---|---|---|---|---|---|---|
| 1 | ZON-2258 | Pilot Series | high | 66 | adaptive-zone-11 | false | 1 |
| 2 | ZON-2263 | Baseline Assessment | medium | 2946 | distributed-zone-12 | true | 2 |
| 3 | ZON-2268 | Distributed Survey A | low | 4 | baseline-zone-13 | false | 3 |
| 4 | ZON-2273 | Adaptive Corridor | high | 0 | pilot-zone-14 | true | 4 |

Evacuation routes provide the physical pathways for movement out of affected areas. A route carries an identifier such as ROU-2146 and a name like Pilot Survey or Baseline Corridor. The route status—open, blocked, washed_out, or restricted—communicates its current operability. A capacity rating quantifies the throughput capability of the route, while a shortcut flag indicates whether the route provides a direct path. Flood risk level, which may be none, low, or high, informs route selection under adverse conditions. Each route connects to a shelter, identifying the destination facility it serves.

**Table `evacuation_routes`**

| evacuation_route_id | route_identifier | route_name | route_status | capacity_rating | is_shortcut | flood_risk_level | shelter_id |
|---|---|---|---|---|---|---|---|
| 1 | ROU-2146 | Pilot Survey | open | 35 | true | none | 100 |
| 2 | ROU-2152 | Baseline Corridor | blocked | 43 | false | low | 101 |
| 3 | ROU-2158 | Distributed Series A | washed_out | 51 | true | high | 102 |
| 4 | ROU-2164 | Adaptive Assessment | restricted | 59 | false | none | 103 |

Properties represent the built environment within which households reside or operate. A property carries an identifier such as PRO-2098 and a street address like distributed-address-72. Property types include residential, school, workplace, and commercial. Occupancy status tracks whether a property is occupied, vacant, or evacuated. Vehicle access and flooding risk flags provide logistical details relevant to evacuation planning. Each property belongs to an evacuation zone and is associated with a household and an evacuation route, linking the physical structure to the people within it and the path they will take.

**Table `properties`**

| id | property_identifier | address | property_type | occupancy_status | has_vehicle_access | flooding_risk | evacuation_zone_id | household_id | evacuation_route_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | PRO-2098 | distributed-address-72 | residential | occupied | true | false | 1 | 1000 | 1 |
| 1001 | PRO-2103 | baseline-address-73 | school | vacant | false | true | 2 | 1001 | 2 |
| 1002 | PRO-2108 | pilot-address-74 | workplace | evacuated | true | false | 3 | 1002 | 3 |
| 1003 | PRO-2113 | extended-address-75 | commercial | occupied | false | true | 4 | 1003 | 4 |

Households are the primary units of human concern in the evacuation system. A household carries an identifier such as HOU-2425 and records its vehicle count, which ranges from 3 to 51 in the current data. Transportation arrangement and disaster kit readiness flags indicate preparedness levels. The evacuation status of a household progresses through stages—preparing, departed, at_shelter, or returned—providing real-time visibility into population movement. Fuel level, expressed as a percentage, offers a logistical constraint on household mobility. Each household is linked to a property, a shelter, and a warning channel, completing the chain from home to destination to communication.

**Table `households`**

| id | household_identifier | vehicle_count | has_transportation_arrangement | disaster_kit_ready | evacuation_status | fuel_level_percent | property_id | shelter_id | warning_channel_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | HOU-2425 | 4 | true | true | preparing | 9.45 | 1000 | 100 | 100 |
| 1001 | HOU-2429 | 3 | false | false | departed | 11.90 | 1001 | 101 | 101 |
| 1002 | HOU-2433 | 51 | true | true | at_shelter | 14.35 | 1002 | 102 | 102 |
| 1003 | HOU-2437 | 4 | false | false | returned | 16.80 | 1003 | 103 | 103 |

Shelters serve as the destination facilities for displaced populations. Each shelter is associated with an evacuation route, establishing the pathway through which arriving households will reach it. Shelters also connect to households, recording which households have been assigned or have arrived. The shelter system ensures that every evacuation route has a designated endpoint and that every household has a known destination.

**Table `shelters`**

| id | shelter_identifier | shelter_name | shelter_type | current_occupancy | max_capacity | operational_status |
|---|---|---|---|---|---|---|
| 100 | SHE-2726 | Regional Cluster | public_building | 27 | 32 | open |
| 101 | SHE-2729 | Seasonal Review D | community_center | 36 | 42 | full |
| 102 | SHE-2732 | Integrated Initiative | temporary_camp | 45 | 52 | closed |
| 103 | SHE-2735 | Extended Model | public_building | 54 | 62 | open |

Warning channels are the communication mechanisms through which evacuation instructions reach the public. Each warning channel is linked to an evacuation order, identifying the directive it is used to disseminate, and to households, recording which populations receive alerts through that channel. The warning channel system ensures that every order has a defined communication pathway and that every household has a known source of official instructions.

**Table `warning_channels`**

| warning_channel_id | channel_identifier | channel_name | channel_type | power_dependency | coverage_area | is_reliable_during_outage | evacuation_order_id | household_id |
|---|---|---|---|---|---|---|---|---|
| 100 | CHA-2292 | Adaptive Corridor | radio | true | extended-coverage-87 | false | 1 | 1000 |
| 101 | CHA-2294 | Primary Series | television | false | integrated-coverage-88 | true | 2 | 1001 |
| 102 | CHA-2296 | Composite Assessment D | siren | true | seasonal-coverage-89 | false | 3 | 1002 |
| 103 | CHA-2298 | Compact Survey | telephone | false | regional-coverage-90 | true | 4 | 1003 |

The relationships between these core entities form the operational backbone of the evacuation system. Orders connect to zones through a dedicated mapping table, allowing a single order to govern multiple zones or a zone to be referenced across orders. This many-to-many relationship captures the flexibility required when hazard events span multiple geographic areas or when orders are updated to cover revised boundaries.

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

Zones connect to properties through another mapping table, establishing which properties fall within each evacuation zone. This relationship ensures that every property has a defined risk context and that every zone has a known inventory of affected structures. The mapping supports both granular property-level tracking and aggregate zone-level reporting.

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

Zones and routes are linked through a dedicated relationship table, defining which routes serve which zones. This connection ensures that every zone has at least one designated evacuation path and that every route serves a defined set of zones. The relationship supports route capacity planning and alternative routing when primary paths become unavailable.

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

Routes and zones are also connected through a reverse mapping, providing bidirectional visibility into the zone-route network. This relationship allows practitioners to trace from a route back to all zones it serves, supporting impact analysis when a route is closed or degraded.

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

Shelters and routes are connected through a dedicated mapping, establishing which routes feed into which shelters. This relationship ensures that every shelter has defined access routes and that every route has a known destination. The mapping supports capacity planning at both the route and shelter levels.

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

Shelters and households are linked through a mapping table that records which households are assigned to or have arrived at each shelter. This relationship provides real-time occupancy tracking and supports capacity management as shelters approach their limits.

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

The analytical views in the system synthesize these relationships into actionable information. The evacuation order to hazard event view joins orders with their triggering events, revealing the directive-threat pairing. For example, order ORD-2692 is issued in response to hazard event EVE-2706, a weather event with severity level 29 affecting 17 people. This view enables practitioners to assess whether the evacuation response is proportionate to the hazard.

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

The evacuation order to evacuation zone detail view combines orders with the zones they govern, providing a directive-geography mapping. Order ORD-2692, issued by extended-issuing-33, governs zone ZON-2258, the Pilot Series zone classified as high risk with an estimated 66 residents. This view supports compliance monitoring by showing which zones are subject to which orders and their current risk classifications.

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

The evacuation order to warning channel view links orders with their communication pathways, ensuring that every directive has a defined dissemination method. Order ORD-2692 uses a warning channel identified as 100, while order ORD-2696 uses channel 101. This view supports communication audits and helps identify orders that may lack adequate notification infrastructure.

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

The hazard event to evacuation order view provides the reverse perspective, showing which orders have been issued for each hazard event. Event EVE-2706, a weather event with severity 29, has triggered evacuation order ORD-2692. Event EVE-2708, a transportation event with severity 51 affecting 14,463 people, has triggered order ORD-2700. This view supports situational awareness by revealing the response footprint of each active hazard.

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

The hazard event to evacuation route view connects events with their designated evacuation routes, ensuring that every hazard has a planned egress path. Event EVE-2706 is associated with route ROU-2146, the Pilot Survey route, which is currently open with a capacity rating of 35. Event EVE-2708, the largest event by affected population, is linked to route ROU-2158, the Distributed Series A route, which is currently washed out. This view highlights critical infrastructure vulnerabilities where routes are compromised.

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

The evacuation zone to evacuation order view shows which orders govern each zone, providing a zone-centric perspective on directives. Zone ZON-2258, the Pilot Series zone, is governed by order ORD-2692, a mandatory order with pending compliance status. Zone ZON-2273, the Adaptive Corridor zone, is governed by order ORD-2704, a scheduled order with failed compliance status. This view supports zone-level compliance tracking and resource allocation.

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

The evacuation zone to property detail view reveals the properties within each zone, providing a structure-level inventory. Zone ZON-2258 contains property PRO-2098, a residential property at distributed-address-72 that is occupied and has vehicle access. Zone ZON-2263 contains property PRO-2103, a school at baseline-address-73 that is vacant and has a flooding risk. This view supports property-level risk assessment and resource targeting.

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

The evacuation zone to evacuation route detail view shows which routes serve each zone, providing a zone-centric view of egress options. Zone ZON-2258 is served by route ROU-2146, the Pilot Survey route, which is open and classified as a shortcut with no flood risk. Zone ZON-2268 is served by route ROU-2158, the Distributed Series A route, which is washed out and carries a high flood risk. This view is critical for identifying zones with compromised evacuation infrastructure.

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

The evacuation route to evacuation zone detail view provides the reverse mapping, showing which zones each route serves. Route ROU-2146, the Pilot Survey route, serves zone ZON-2258, the Pilot Series zone. Route ROU-2158, the Distributed Series A route, serves zone ZON-2268, the Distributed Survey A zone. This view supports route-level impact analysis and alternative routing decisions.

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

The evacuation route to shelter view connects routes with their destination shelters, ensuring that every route has a known endpoint. Route ROU-2146, the Pilot Survey route, leads to shelter 100. Route ROU-2152, the Baseline Corridor route, leads to shelter 101. This view supports destination planning and shelter capacity coordination.

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

The property to evacuation zone view shows which zone each property belongs to, providing a property-centric risk classification. Property PRO-2098, a residential property at distributed-address-72, is in zone ZON-2258, the Pilot Series zone, which is classified as high risk. Property PRO-2103, a school at baseline-address-73, is in zone ZON-2263, the Baseline Assessment zone, classified as medium risk. This view supports property-level risk profiling.

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

The property to household view links properties to the households within them, connecting structures to the people they contain. Property PRO-2098 contains household HOU-2425, which has 4 vehicles, is preparing for evacuation, and has a fuel level of 9.45 percent. Property PRO-2108 contains household HOU-2433, which has 51 vehicles, is at the shelter, and has a fuel level of 14.35 percent. This view supports household-level tracking and resource allocation.

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

The property to evacuation route view shows which route each property is associated with, providing a property-centric egress plan. Property PRO-2098 is associated with route ROU-2146, the Pilot Survey route. Property PRO-2103 is associated with route ROU-2152, the Baseline Corridor route, which is currently blocked. This view supports route-level congestion analysis and alternative routing.

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

The household to property view provides the reverse mapping, showing which property each household occupies. Household HOU-2425 occupies property PRO-2098, a residential property at distributed-address-72. Household HOU-2433 occupies property PRO-2108, a workplace at pilot-address-74. This view supports household-level property tracking and emergency response targeting.

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

The household to shelter view links households to their assigned or current shelters, providing destination visibility. Household HOU-2425 is assigned to shelter 100 and is currently preparing for evacuation. Household HOU-2433 is at shelter 102 and has an evacuation status of at_shelter. This view supports real-time population tracking and shelter capacity management.

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

The household to warning channel view connects households with their communication pathways, ensuring that every household has a known alert source. Household HOU-2425 receives warnings through channel 100. Household HOU-2429 receives warnings through channel 101. This view supports communication coverage analysis and ensures no household is without an alert pathway.

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

The shelter to evacuation route detail view shows which routes feed into each shelter, providing a shelter-centric view of access infrastructure. Shelter 100 is served by route ROU-2146, the Pilot Survey route, which is open and has a capacity rating of 35. Shelter 101 is served by route ROU-2152, the Baseline Corridor route, which is blocked. This view supports shelter access planning and identifies shelters with compromised entry routes.

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

The shelter to household detail view reveals which households are assigned to or have arrived at each shelter, providing occupancy-level detail. Shelter 100 is associated with household HOU-2425, which has 4 vehicles and is preparing for evacuation. Shelter 102 is associated with household HOU-2433, which has 51 vehicles and is already at the shelter. This view supports real-time shelter occupancy monitoring and capacity planning.

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

The warning channel to evacuation order view shows which orders use each warning channel, providing a channel-centric view of directive dissemination. Warning channel 100 is used by order ORD-2692, a mandatory evacuation order with pending compliance status. Warning channel 103 is used by order ORD-2704, a scheduled order with failed compliance status. This view supports communication effectiveness analysis and identifies channels associated with orders that have not achieved compliance.

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

The warning channel to household view links channels to the households they serve, providing a communication coverage map. Warning channel 100 serves household HOU-2425, which has 4 vehicles and is preparing for evacuation. Warning channel 103 serves household HOU-2437, which has returned from evacuation and has a fuel level of 16.80 percent. This view ensures that every household has a defined communication pathway and supports targeted outreach to households with limited alert access.

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

The evacuation management system described here forms a coherent operational framework. Evacuation orders trigger responses to hazard events, directing populations in designated zones along defined routes to shelters, all while communicating through structured warning channels. The relationships between these entities—orders to zones, zones to properties, routes to shelters, households to channels—create a multidimensional network that supports both strategic planning and real-time operational decisions. The analytical views synthesize these relationships into actionable intelligence, enabling practitioners to monitor compliance, track population movement, assess infrastructure status, and allocate resources where they are needed most. Every record, from the severity level of a hazard event to the fuel percentage of a household, contributes to a comprehensive picture of the evacuation landscape.