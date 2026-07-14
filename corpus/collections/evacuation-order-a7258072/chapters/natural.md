## Emergency Evacuation Coordination

Modern emergency management relies on the systematic tracking of hazard events, the geographic zones they affect, and the evacuation orders issued in response. An evacuation coordination system captures the full lifecycle of a disaster response: a hazard event occurs, a geographic zone is identified as at risk, an evacuation order is issued, a route is designated for safe egress, a warning method is selected to alert the population, and the population's compliance and transportation access are recorded. The data model underlying this coordination consists of six base tables that store discrete records of orders, events, zones, routes, warning methods, and populations, along with a suite of joined views that answer operational questions by combining these records.

**Table `evac_evacuation_orders`**

| id | order_identifier | issuance_date_time | issuing_authority | evacuation_zone | hazard_type | status | mandatory | hazard_event_id | geographic_zone_id | warning_method_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ORD-2692 | 2024-11-17T10:30:00 | extended-issuing-33 | regional-evacuati-72 | baseline-hazard-19 | pending | true | 1 | 100 | 1 |
| 2 | ORD-2696 | 2025-04-01T17:47:00 | integrated-issuing-34 | legacy-evacuati-73 | pilot-hazard-20 | active | false | 2 | 101 | 2 |
| 3 | ORD-2700 | 2022-09-12T00:04:00 | seasonal-issuing-35 | compact-evacuati-74 | extended-hazard-21 | lifted | true | 3 | 102 | 3 |
| 4 | ORD-2704 | 2023-02-23T07:21:00 | regional-issuing-36 | composite-evacuati-75 | integrated-hazard-22 | cancelled | false | 4 | 103 | 4 |

The evacuation orders table is the central ledger of the system. Each row represents a single directive issued by an authority, identified by an order identifier such as ORD-2692 or ORD-2704. The issuance date and time, for instance 2024-11-17T10:30:00, anchors the order in the response timeline. The issuing authority—values like extended-issuing-33 or regional-issuing-36—indicates which organizational unit issued the directive. The evacuation zone field (regional-evacuati-72, legacy-evacuati-73, and so on) names the zone to which the order applies. The hazard type column (baseline-hazard-19, pilot-hazard-20, extended-hazard-21, integrated-hazard-22) categorizes the nature of the threat. The status field tracks the order's lifecycle: pending, active, lifted, or cancelled. The mandatory flag indicates whether compliance is legally required. Foreign keys link the order to a specific hazard event, geographic zone, and warning method, forming the backbone of the relational model.

**Table `evac_hazard_events`**

| id | event_identifier | start_time | end_time | event_type | severity_level | affected_area | monitored | evacuation_order_id | geographic_zone_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | EVE-2706 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | hurricane | 29 | extended-affected-15 | true | 1 | 100 |
| 2 | EVE-2707 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | flood | 40 | integrated-affected-16 | false | 2 | 101 |
| 3 | EVE-2708 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | fire | 51 | seasonal-affected-17 | true | 3 | 102 |
| 4 | EVE-2709 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | industrial_accident | 62 | regional-affected-18 | false | 4 | 103 |

Hazard events record the actual disasters that trigger evacuation responses. Each event carries an identifier such as EVE-2706 or EVE-2709, a start time, and an end time. The event type column distinguishes between hurricane, flood, fire, and industrial_accident. Severity levels are numeric values—29, 40, 51, 62—that quantify the intensity of the event. The affected area field (extended-affected-15, integrated-affected-16, seasonal-affected-17, regional-affected-18) describes the geographic scope of the impact. A monitored flag indicates whether the event is under active surveillance. Each hazard event is linked to an evacuation order and a geographic zone, establishing the causal chain from threat to directive.

**Table `evac_geographic_zones`**

| geographic_zone_id | zone_identifier | zone_name | risk_level | population_count | area_size | boundary_coordinates | evacuation_order_id | evacuation_route_id | hazard_event_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | ZON-2258 | Pilot Series | low | 15021 | 1.52 | regional-boundary-78 | 1 | 1000 | 1 |
| 101 | ZON-2263 | Baseline Assessment | medium | 10 | 0.65 | legacy-boundary-79 | 2 | 1001 | 2 |
| 102 | ZON-2268 | Distributed Survey A | high | 18 | 0.43012016 | compact-boundary-80 | 3 | 1002 | 3 |
| 103 | ZON-2273 | Adaptive Corridor | extreme | 50 | 0.6000001 | composite-boundary-81 | 4 | 1003 | 4 |

Geographic zones define the spatial units of the evacuation plan. Each zone has a geographic zone identifier (100 through 103), a zone identifier such as ZON-2258 or ZON-2273, and a zone name like Pilot Series, Baseline Assessment, Distributed Survey A, or Adaptive Corridor. The risk level column assigns a qualitative assessment—low, medium, high, or extreme—to each zone. Population count records the number of people in the zone, ranging from 10 in the Baseline Assessment zone to 15,021 in the Pilot Series zone. Area size, measured in square units, varies from 0.43 to 1.52. Boundary coordinates (regional-boundary-78, legacy-boundary-79, compact-boundary-80, composite-boundary-81) provide the spatial definition. Each zone is linked to an evacuation order, an evacuation route, and a hazard event.

**Table `evac_evacuation_routes`**

| id | route_identifier | route_name | start_point | end_point | route_length | road_condition | recommended | geographic_zone_id | connects_to_geographic_zone_id | evacuation_order_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | ROU-2146 | Pilot Survey | compact-start-62 | composite-end-69 | 576.33914 | open | true | 100 | 100 | 1 |
| 1001 | ROU-2152 | Baseline Corridor | composite-start-63 | primary-end-70 | 41.28334045410156 | blocked | false | 101 | 101 | 2 |
| 1002 | ROU-2158 | Distributed Series A | primary-start-64 | adaptive-end-71 | 0.07500005 | washed_out | true | 102 | 102 | 3 |
| 1003 | ROU-2164 | Adaptive Assessment | adaptive-start-65 | distributed-end-72 | 0.6000001 | flooded | false | 103 | 103 | 4 |

Evacuation routes specify the designated paths for population egress. Each route has an identifier (1000 through 1003), a route identifier such as ROU-2146 or ROU-2164, and a route name like Pilot Survey, Baseline Corridor, Distributed Series A, or Adaptive Assessment. The start point and end point fields (compact-start-62 to composite-end-69, composite-start-63 to primary-end-70, and so on) define the route geometry. Route length, measured in distance units, ranges from 0.075 to 576.34. Road condition records the current state of the route—open, blocked, washed_out, or flooded. A recommended flag indicates whether the route is the preferred egress path. Each route is associated with a geographic zone and an evacuation order.

**Table `evac_warning_methods`**

| warning_method_id | method_identifier | method_name | reach | reliability | active_during_power_outage | evacuation_order_id | population_id |
|---|---|---|---|---|---|---|---|
| 1 | MET-2663 | Pilot Assessment | local | high | true | 1 | 1 |
| 2 | MET-2670 | Baseline Survey | regional | medium | false | 2 | 2 |
| 3 | MET-2677 | Distributed Corridor A | national | low | true | 3 | 3 |
| 4 | MET-2684 | Adaptive Series | local | high | false | 4 | 4 |

Warning methods capture how populations are alerted to evacuation orders. Each method has a warning method identifier (1 through 4), a method identifier such as MET-2663 or MET-2684, and a method name like Pilot Assessment, Baseline Survey, Distributed Corridor A, or Adaptive Series. The reach column indicates the geographic scope of the method—local, regional, or national. Reliability is rated as high, medium, or low. The active during power outage flag indicates whether the method remains functional during infrastructure failure. Each warning method is linked to an evacuation order and a population.

**Table `evac_populations`**

| id | population_identifier | household_count | average_household_size | evacuation_compliance_rate | transportation_access | geographic_zone_id | warning_method_id | evacuation_order_id |
|---|---|---|---|---|---|---|---|---|
| 1 | POP-2555 | 66 | 3.9440646171569824 | 9.95 | private_vehicle | 100 | 1 | 1 |
| 2 | POP-2556 | 5 | 1.65 | 12.90 | public_transit | 101 | 2 | 2 |
| 3 | POP-2557 | 21 | 1.15 | 15.85 | none | 102 | 3 | 3 |
| 4 | POP-2558 | 3 | 2.82 | 18.80 | private_vehicle | 103 | 4 | 4 |

Populations record the demographic and behavioral characteristics of the people affected by evacuation orders. Each population record has an identifier (1 through 4), a population identifier such as POP-2555 or POP-2558, a household count (66, 5, 21, 3), and an average household size (ranging from 1.15 to 3.94). The evacuation compliance rate—9.95, 12.90, 15.85, 18.80—measures the percentage of the population that has complied with the evacuation directive. Transportation access records the primary mode of transport: private_vehicle, public_transit, or none. Each population is linked to a geographic zone, a warning method, and an evacuation order.

The base tables store discrete records, but operational decision-making requires joined perspectives. The following views combine these records to answer specific coordination questions.

**View `vw_evacuation_order_hazard_event`**

```sql
CREATE VIEW vw_evacuation_order_hazard_event AS
SELECT a.id, a.order_identifier, a.issuance_date_time, a.issuing_authority, b.id AS event_id, b.event_identifier AS event_event_identifier, b.start_time AS event_start_time
FROM evac_evacuation_orders a JOIN evac_hazard_events b ON a.hazard_event_id = b.id;
```

| id | order_identifier | issuance_date_time | issuing_authority | event_id | event_event_identifier | event_start_time |
|---|---|---|---|---|---|---|
| 1 | ORD-2692 | 2024-11-17T10:30:00 | extended-issuing-33 | 1 | EVE-2706 | 2024-03-27T14:42:00 |
| 2 | ORD-2696 | 2025-04-01T17:47:00 | integrated-issuing-34 | 2 | EVE-2707 | 2025-08-11T21:59:00 |
| 3 | ORD-2700 | 2022-09-12T00:04:00 | seasonal-issuing-35 | 3 | EVE-2708 | 2022-01-22T04:16:00 |
| 4 | ORD-2704 | 2023-02-23T07:21:00 | regional-issuing-36 | 4 | EVE-2709 | 2023-06-06T11:33:00 |

This view joins evacuation orders with their triggering hazard events, answering the question: which hazard event prompted each evacuation order? The joined result pairs order identifiers with event identifiers, event types, and severity levels. For example, ORD-2692 is linked to EVE-2706, a hurricane with severity level 29, issued by extended-issuing-33 on 2024-11-17. ORD-2700 corresponds to EVE-2708, a fire event with severity level 51, issued by seasonal-issuing-35. This view enables analysts to assess whether the severity of the hazard event correlates with the status of the evacuation order—ORD-2692 remains pending despite a severity of 29, while ORD-2700 has been lifted even though its fire event reached severity 51.

**View `vw_evacuation_order_geographic_zone`**

```sql
CREATE VIEW vw_evacuation_order_geographic_zone AS
SELECT a.id, a.order_identifier, a.issuance_date_time, a.issuing_authority, b.geographic_zone_id AS zone_geographic_zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_name AS zone_zone_name
FROM evac_evacuation_orders a JOIN evac_geographic_zones b ON a.geographic_zone_id = b.geographic_zone_id;
```

| id | order_identifier | issuance_date_time | issuing_authority | zone_geographic_zone_id | zone_zone_identifier | zone_zone_name |
|---|---|---|---|---|---|---|
| 1 | ORD-2692 | 2024-11-17T10:30:00 | extended-issuing-33 | 100 | ZON-2258 | Pilot Series |
| 2 | ORD-2696 | 2025-04-01T17:47:00 | integrated-issuing-34 | 101 | ZON-2263 | Baseline Assessment |
| 3 | ORD-2700 | 2022-09-12T00:04:00 | seasonal-issuing-35 | 102 | ZON-2268 | Distributed Survey A |
| 4 | ORD-2704 | 2023-02-23T07:21:00 | regional-issuing-36 | 103 | ZON-2273 | Adaptive Corridor |

This view connects evacuation orders to the geographic zones they affect, answering: which zone does each order target? The join produces rows that pair order identifiers with zone identifiers, zone names, risk levels, and population counts. ORD-2692 targets zone ZON-2258 (Pilot Series), a low-risk zone with a population of 15,021. ORD-2703 targets zone ZON-2273 (Adaptive Corridor), an extreme-risk zone with a population of 50. The view reveals an operational pattern: the highest-risk zone (Adaptive Corridor, extreme risk) is associated with an order that has been cancelled, while the largest-population zone (Pilot Series, low risk) carries an order that remains pending.

**View `vw_evacuation_order_warning_method`**

```sql
CREATE VIEW vw_evacuation_order_warning_method AS
SELECT a.id, a.order_identifier, a.issuance_date_time, a.issuing_authority, b.warning_method_id AS method_warning_method_id, b.method_identifier AS method_method_identifier, b.method_name AS method_method_name
FROM evac_evacuation_orders a JOIN evac_warning_methods b ON a.warning_method_id = b.warning_method_id;
```

| id | order_identifier | issuance_date_time | issuing_authority | method_warning_method_id | method_method_identifier | method_method_name |
|---|---|---|---|---|---|---|
| 1 | ORD-2692 | 2024-11-17T10:30:00 | extended-issuing-33 | 1 | MET-2663 | Pilot Assessment |
| 2 | ORD-2696 | 2025-04-01T17:47:00 | integrated-issuing-34 | 2 | MET-2670 | Baseline Survey |
| 3 | ORD-2700 | 2022-09-12T00:04:00 | seasonal-issuing-35 | 3 | MET-2677 | Distributed Corridor A |
| 4 | ORD-2704 | 2023-02-23T07:21:00 | regional-issuing-36 | 4 | MET-2684 | Adaptive Series |

This view links evacuation orders to the warning methods used to alert populations, answering: how was each order communicated? The joined rows pair order identifiers with method identifiers, method names, reach, and reliability. ORD-2692 uses MET-2663 (Pilot Assessment), a local-reach method with high reliability that remains active during power outages. ORD-2700 uses MET-2677 (Distributed Corridor A), a national-reach method with low reliability that is active during power outages. The view allows coordinators to evaluate whether the chosen warning method's reach and reliability are appropriate for the order's urgency and the zone's characteristics.

**View `vw_hazard_event_evacuation_order`**

```sql
CREATE VIEW vw_hazard_event_evacuation_order AS
SELECT a.id, a.event_identifier, a.start_time, a.end_time, b.id AS order_id, b.order_identifier AS order_order_identifier, b.issuance_date_time AS order_issuance_date_time
FROM evac_hazard_events a JOIN evac_evacuation_orders b ON a.evacuation_order_id = b.id;
```

| id | event_identifier | start_time | end_time | order_id | order_order_identifier | order_issuance_date_time |
|---|---|---|---|---|---|---|
| 1 | EVE-2706 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1 | ORD-2692 | 2024-11-17T10:30:00 |
| 2 | EVE-2707 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 2 | ORD-2696 | 2025-04-01T17:47:00 |
| 3 | EVE-2708 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 3 | ORD-2700 | 2022-09-12T00:04:00 |
| 4 | EVE-2709 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 4 | ORD-2704 | 2023-02-23T07:21:00 |

This view presents the hazard-event-centric perspective, answering: for each hazard event, what evacuation order was issued? The join inverts the relationship, placing the event at the center and linking it to its corresponding order. EVE-2706 (a hurricane, severity 29, monitored) is linked to ORD-2692, which carries a mandatory flag of true. EVE-2707 (a flood, severity 40, not monitored) is linked to ORD-2696, which is non-mandatory and active. EVE-2708 (a fire, severity 51, monitored) is linked to ORD-2700, which is mandatory but has been lifted. EVE-2709 (an industrial accident, severity 62, not monitored) is linked to ORD-2704, which is non-mandatory and cancelled. This view highlights that higher severity does not guarantee an active or mandatory order.

**View `vw_hazard_event_geographic_zone`**

```sql
CREATE VIEW vw_hazard_event_geographic_zone AS
SELECT a.id, a.event_identifier, a.start_time, a.end_time, b.geographic_zone_id AS zone_geographic_zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_name AS zone_zone_name
FROM evac_hazard_events a JOIN evac_geographic_zones b ON a.geographic_zone_id = b.geographic_zone_id;
```

| id | event_identifier | start_time | end_time | zone_geographic_zone_id | zone_zone_identifier | zone_zone_name |
|---|---|---|---|---|---|---|
| 1 | EVE-2706 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 100 | ZON-2258 | Pilot Series |
| 2 | EVE-2707 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 101 | ZON-2263 | Baseline Assessment |
| 3 | EVE-2708 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 102 | ZON-2268 | Distributed Survey A |
| 4 | EVE-2709 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 103 | ZON-2273 | Adaptive Corridor |

This view connects hazard events to the geographic zones they impact, answering: which zone is affected by each hazard event? The joined result pairs event identifiers with zone identifiers, zone names, risk levels, and population counts. EVE-2706 (hurricane) affects zone ZON-2258 (Pilot Series, low risk, population 15,021). EVE-2708 (fire) affects zone ZON-2268 (Distributed Survey A, high risk, population 18). The view exposes a potential mismatch: the hurricane event impacts a low-risk zone with a large population, while the fire event impacts a high-risk zone with a small population, suggesting that risk classification and event severity may operate on different scales.

**View `vw_geographic_zone_evacuation_order`**

```sql
CREATE VIEW vw_geographic_zone_evacuation_order AS
SELECT a.geographic_zone_id, a.zone_identifier, a.zone_name, a.risk_level, b.id AS order_id, b.order_identifier AS order_order_identifier, b.issuance_date_time AS order_issuance_date_time
FROM evac_geographic_zones a JOIN evac_evacuation_orders b ON a.evacuation_order_id = b.id;
```

| geographic_zone_id | zone_identifier | zone_name | risk_level | order_id | order_order_identifier | order_issuance_date_time |
|---|---|---|---|---|---|---|
| 100 | ZON-2258 | Pilot Series | low | 1 | ORD-2692 | 2024-11-17T10:30:00 |
| 101 | ZON-2263 | Baseline Assessment | medium | 2 | ORD-2696 | 2025-04-01T17:47:00 |
| 102 | ZON-2268 | Distributed Survey A | high | 3 | ORD-2700 | 2022-09-12T00:04:00 |
| 103 | ZON-2273 | Adaptive Corridor | extreme | 4 | ORD-2704 | 2023-02-23T07:21:00 |

This view presents the geographic-zone-centric perspective, answering: for each geographic zone, what evacuation order applies? The join places the zone at the center and links it to its order. Zone ZON-2258 (Pilot Series, low risk, population 15,021) is linked to ORD-2692, a mandatory order that remains pending. Zone ZON-2273 (Adaptive Corridor, extreme risk, population 50) is linked to ORD-2704, a non-mandatory order that has been cancelled. This view is useful for zone-level situational awareness, showing which zones have active directives and which have been released.

**View `vw_geographic_zone_evacuation_route`**

```sql
CREATE VIEW vw_geographic_zone_evacuation_route AS
SELECT a.geographic_zone_id, a.zone_identifier, a.zone_name, a.risk_level, b.id AS route_id, b.route_identifier AS route_route_identifier, b.route_name AS route_route_name
FROM evac_geographic_zones a JOIN evac_evacuation_routes b ON a.evacuation_route_id = b.id;
```

| geographic_zone_id | zone_identifier | zone_name | risk_level | route_id | route_route_identifier | route_route_name |
|---|---|---|---|---|---|---|
| 100 | ZON-2258 | Pilot Series | low | 1000 | ROU-2146 | Pilot Survey |
| 101 | ZON-2263 | Baseline Assessment | medium | 1001 | ROU-2152 | Baseline Corridor |
| 102 | ZON-2268 | Distributed Survey A | high | 1002 | ROU-2158 | Distributed Series A |
| 103 | ZON-2273 | Adaptive Corridor | extreme | 1003 | ROU-2164 | Adaptive Assessment |

This view connects geographic zones to their designated evacuation routes, answering: which route serves each zone? The joined rows pair zone identifiers with route identifiers, route names, road conditions, and recommended flags. Zone ZON-2258 (Pilot Series) is served by route ROU-2146 (Pilot Survey), which is open and recommended. Zone ZON-2263 (Baseline Assessment) is served by route ROU-2152 (Baseline Corridor), which is blocked and not recommended. Zone ZON-2268 (Distributed Survey A) is served by route ROU-2158 (Distributed Series A), which is washed out but recommended. Zone ZON-2273 (Adaptive Corridor) is served by route ROU-2164 (Adaptive Assessment), which is flooded and not recommended. The view reveals a critical operational concern: two of the four zones have routes that are impassable (blocked or flooded), and one has a washed-out route, yet only one of the compromised routes is marked as not recommended.

**View `vw_geographic_zone_hazard_event`**

```sql
CREATE VIEW vw_geographic_zone_hazard_event AS
SELECT a.geographic_zone_id, a.zone_identifier, a.zone_name, a.risk_level, b.id AS event_id, b.event_identifier AS event_event_identifier, b.start_time AS event_start_time
FROM evac_geographic_zones a JOIN evac_hazard_events b ON a.hazard_event_id = b.id;
```

| geographic_zone_id | zone_identifier | zone_name | risk_level | event_id | event_event_identifier | event_start_time |
|---|---|---|---|---|---|---|
| 100 | ZON-2258 | Pilot Series | low | 1 | EVE-2706 | 2024-03-27T14:42:00 |
| 101 | ZON-2263 | Baseline Assessment | medium | 2 | EVE-2707 | 2025-08-11T21:59:00 |
| 102 | ZON-2268 | Distributed Survey A | high | 3 | EVE-2708 | 2022-01-22T04:16:00 |
| 103 | ZON-2273 | Adaptive Corridor | extreme | 4 | EVE-2709 | 2023-06-06T11:33:00 |

This view is the zone-centric counterpart to vw_hazard_event_geographic_zone, answering: for each geographic zone, what hazard event is associated with it? The join pairs zone identifiers with event identifiers, event types, severity levels, and monitored flags. Zone ZON-2258 (Pilot Series) is associated with EVE-2706 (hurricane, severity 29, monitored). Zone ZON-2273 (Adaptive Corridor) is associated with EVE-2709 (industrial accident, severity 62, not monitored). This view supports zone-level risk assessment by combining the zone's intrinsic risk level with the characteristics of the event affecting it.

**View `vw_evacuation_route_geographic_zone`**

```sql
CREATE VIEW vw_evacuation_route_geographic_zone AS
SELECT a.id, a.route_identifier, a.route_name, a.start_point, b.geographic_zone_id AS zone_geographic_zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_name AS zone_zone_name
FROM evac_evacuation_routes a JOIN evac_geographic_zones b ON a.geographic_zone_id = b.geographic_zone_id;
```

| id | route_identifier | route_name | start_point | zone_geographic_zone_id | zone_zone_identifier | zone_zone_name |
|---|---|---|---|---|---|---|
| 1000 | ROU-2146 | Pilot Survey | compact-start-62 | 100 | ZON-2258 | Pilot Series |
| 1001 | ROU-2152 | Baseline Corridor | composite-start-63 | 101 | ZON-2263 | Baseline Assessment |
| 1002 | ROU-2158 | Distributed Series A | primary-start-64 | 102 | ZON-2268 | Distributed Survey A |
| 1003 | ROU-2164 | Adaptive Assessment | adaptive-start-65 | 103 | ZON-2273 | Adaptive Corridor |

This view presents the route-centric perspective, answering: for each evacuation route, which geographic zone does it serve? The join places the route at the center and links it to its zone. Route ROU-2146 (Pilot Survey, length 576.34, open) serves zone ZON-2258 (Pilot Series, low risk). Route ROU-2158 (Distributed Series A, length 0.075, washed out) serves zone ZON-2268 (Distributed Survey A, high risk). The view is useful for route-level logistics planning, showing the zone each route supports and enabling comparison of route conditions against zone risk levels.

**View `vw_evacuation_route_evacuation_order`**

```sql
CREATE VIEW vw_evacuation_route_evacuation_order AS
SELECT a.id, a.route_identifier, a.route_name, a.start_point, b.id AS order_id, b.order_identifier AS order_order_identifier, b.issuance_date_time AS order_issuance_date_time
FROM evac_evacuation_routes a JOIN evac_evacuation_orders b ON a.evacuation_order_id = b.id;
```

| id | route_identifier | route_name | start_point | order_id | order_order_identifier | order_issuance_date_time |
|---|---|---|---|---|---|---|
| 1000 | ROU-2146 | Pilot Survey | compact-start-62 | 1 | ORD-2692 | 2024-11-17T10:30:00 |
| 1001 | ROU-2152 | Baseline Corridor | composite-start-63 | 2 | ORD-2696 | 2025-04-01T17:47:00 |
| 1002 | ROU-2158 | Distributed Series A | primary-start-64 | 3 | ORD-2700 | 2022-09-12T00:04:00 |
| 1003 | ROU-2164 | Adaptive Assessment | adaptive-start-65 | 4 | ORD-2704 | 2023-02-23T07:21:00 |

This view connects evacuation routes to the orders that designate them, answering: for each evacuation route, which order uses it? The joined rows pair route identifiers with order identifiers, order statuses, and mandatory flags. Route ROU-2146 (Pilot Survey) is designated by ORD-2692, which is pending and mandatory. Route ROU-2152 (Baseline Corridor) is designated by ORD-2696, which is active and non-mandatory. Route ROU-2158 (Distributed Series A) is designated by ORD-2700, which is lifted and mandatory. Route ROU-2164 (Adaptive Assessment) is designated by ORD-2704, which is cancelled and non-mandatory. This view enables route utilization analysis, showing which routes are actively being used versus those associated with orders that have been lifted or cancelled.

**View `vw_warning_method_evacuation_order`**

```sql
CREATE VIEW vw_warning_method_evacuation_order AS
SELECT a.warning_method_id, a.method_identifier, a.method_name, a.reach, b.id AS order_id, b.order_identifier AS order_order_identifier, b.issuance_date_time AS order_issuance_date_time
FROM evac_warning_methods a JOIN evac_evacuation_orders b ON a.evacuation_order_id = b.id;
```

| warning_method_id | method_identifier | method_name | reach | order_id | order_order_identifier | order_issuance_date_time |
|---|---|---|---|---|---|---|
| 1 | MET-2663 | Pilot Assessment | local | 1 | ORD-2692 | 2024-11-17T10:30:00 |
| 2 | MET-2670 | Baseline Survey | regional | 2 | ORD-2696 | 2025-04-01T17:47:00 |
| 3 | MET-2677 | Distributed Corridor A | national | 3 | ORD-2700 | 2022-09-12T00:04:00 |
| 4 | MET-2684 | Adaptive Series | local | 4 | ORD-2704 | 2023-02-23T07:21:00 |

This view presents the warning-method-centric perspective, answering: for each warning method, which evacuation order does it support? The join places the method at the center and links it to its order. MET-2663 (Pilot Assessment, local reach, high reliability, active during power outage) supports ORD-2692 (pending, mandatory). MET-2677 (Distributed Corridor A, national reach, low reliability, active during power outage) supports ORD-2700 (lifted, mandatory). The view allows coordinators to evaluate whether the reliability and reach of a warning method are appropriate for the order's status and the zone's characteristics.

**View `vw_warning_method_population`**

```sql
CREATE VIEW vw_warning_method_population AS
SELECT a.warning_method_id, a.method_identifier, a.method_name, a.reach, b.id AS population_id, b.population_identifier AS population_population_identifier, b.household_count AS population_household_count
FROM evac_warning_methods a JOIN evac_populations b ON a.population_id = b.id;
```

| warning_method_id | method_identifier | method_name | reach | population_id | population_population_identifier | population_household_count |
|---|---|---|---|---|---|---|
| 1 | MET-2663 | Pilot Assessment | local | 1 | POP-2555 | 66 |
| 2 | MET-2670 | Baseline Survey | regional | 2 | POP-2556 | 5 |
| 3 | MET-2677 | Distributed Corridor A | national | 3 | POP-2557 | 21 |
| 4 | MET-2684 | Adaptive Series | local | 4 | POP-2558 | 3 |

This view links warning methods to the populations they alert, answering: for each warning method, which population does it reach? The joined rows pair method identifiers with population identifiers, household counts, compliance rates, and transportation access. MET-2663 (Pilot Assessment) reaches POP-2555, a population of 66 households with an average size of 3.94, a compliance rate of 9.95, and private vehicle access. MET-2677 (Distributed Corridor A) reaches POP-2557, a population of 21 households with an average size of 1.15, a compliance rate of 15.85, and no transportation access. The view reveals that populations with no transportation access (POP-2557) have higher compliance rates than those with private vehicles (POP-2555), suggesting that warning method effectiveness may interact with transportation availability.

**View `vw_population_geographic_zone`**

```sql
CREATE VIEW vw_population_geographic_zone AS
SELECT a.id, a.population_identifier, a.household_count, a.average_household_size, b.geographic_zone_id AS zone_geographic_zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_name AS zone_zone_name
FROM evac_populations a JOIN evac_geographic_zones b ON a.geographic_zone_id = b.geographic_zone_id;
```

| id | population_identifier | household_count | average_household_size | zone_geographic_zone_id | zone_zone_identifier | zone_zone_name |
|---|---|---|---|---|---|---|
| 1 | POP-2555 | 66 | 3.9440646171569824 | 100 | ZON-2258 | Pilot Series |
| 2 | POP-2556 | 5 | 1.65 | 101 | ZON-2263 | Baseline Assessment |
| 3 | POP-2557 | 21 | 1.15 | 102 | ZON-2268 | Distributed Survey A |
| 4 | POP-2558 | 3 | 2.82 | 103 | ZON-2273 | Adaptive Corridor |

This view connects populations to the geographic zones they inhabit, answering: for each population, which zone do they live in? The join pairs population identifiers with zone identifiers, zone names, risk levels, and population counts. POP-2555 (66 households, compliance rate 9.95, private vehicle) lives in zone ZON-2258 (Pilot Series, low risk, population 15,021). POP-2557 (21 households, compliance rate 15.85, no transportation) lives in zone ZON-2268 (Distributed Survey A, high risk, population 18). The view supports demographic analysis by combining population-level characteristics with zone-level risk assessments.

**View `vw_population_warning_method`**

```sql
CREATE VIEW vw_population_warning_method AS
SELECT a.id, a.population_identifier, a.household_count, a.average_household_size, b.warning_method_id AS method_warning_method_id, b.method_identifier AS method_method_identifier, b.method_name AS method_method_name
FROM evac_populations a JOIN evac_warning_methods b ON a.warning_method_id = b.warning_method_id;
```

| id | population_identifier | household_count | average_household_size | method_warning_method_id | method_method_identifier | method_method_name |
|---|---|---|---|---|---|---|
| 1 | POP-2555 | 66 | 3.9440646171569824 | 1 | MET-2663 | Pilot Assessment |
| 2 | POP-2556 | 5 | 1.65 | 2 | MET-2670 | Baseline Survey |
| 3 | POP-2557 | 21 | 1.15 | 3 | MET-2677 | Distributed Corridor A |
| 4 | POP-2558 | 3 | 2.82 | 4 | MET-2684 | Adaptive Series |

This view is the population-centric counterpart to vw_warning_method_population, answering: for each population, which warning method alerts them? The join places the population at the center and links it to its method. POP-2555 (66 households, private vehicle, compliance 9.95) is alerted by MET-2663 (Pilot Assessment, local reach, high reliability). POP-2558 (3 households, private vehicle, compliance 18.80) is alerted by MET-2684 (Adaptive Series, local reach, high reliability). The view enables analysis of whether the warning method's reach and reliability correlate with population compliance rates.

**View `vw_population_evacuation_order`**

```sql
CREATE VIEW vw_population_evacuation_order AS
SELECT a.id, a.population_identifier, a.household_count, a.average_household_size, b.id AS order_id, b.order_identifier AS order_order_identifier, b.issuance_date_time AS order_issuance_date_time
FROM evac_populations a JOIN evac_evacuation_orders b ON a.evacuation_order_id = b.id;
```

| id | population_identifier | household_count | average_household_size | order_id | order_order_identifier | order_issuance_date_time |
|---|---|---|---|---|---|---|
| 1 | POP-2555 | 66 | 3.9440646171569824 | 1 | ORD-2692 | 2024-11-17T10:30:00 |
| 2 | POP-2556 | 5 | 1.65 | 2 | ORD-2696 | 2025-04-01T17:47:00 |
| 3 | POP-2557 | 21 | 1.15 | 3 | ORD-2700 | 2022-09-12T00:04:00 |
| 4 | POP-2558 | 3 | 2.82 | 4 | ORD-2704 | 2023-02-23T07:21:00 |

This view connects populations to the evacuation orders that apply to them, answering: for each population, which evacuation order governs them? The joined rows pair population identifiers with order identifiers, order statuses, and mandatory flags. POP-2555 (66 households, compliance 9.95) is governed by ORD-2692 (pending, mandatory). POP-2558 (3 households, compliance 18.80) is governed by ORD-2704 (cancelled, non-mandatory). This view is the most operationally comprehensive, combining population demographics, order status, and mandatory status to assess the overall coordination state. It reveals that the population with the highest compliance rate (POP-2558 at 18.80) is governed by a cancelled, non-mandatory order, while the population with the lowest compliance rate (POP-2555 at 9.95) is governed by a pending, mandatory order.

The evacuation coordination system integrates hazard events, geographic zones, evacuation orders, routes, warning methods, and populations into a coherent relational structure. Each base table captures a distinct dimension of the response, and the joined views synthesize these dimensions to answer the operational questions that coordinators face: which event triggered which order, which zone is affected, which route is available, which method reaches the population, and how is the population complying. The data—spanning hazard types from hurricane to industrial accident, risk levels from low to extreme, road conditions from open to flooded, and compliance rates from 9.95 to 18.80—provides a detailed record of the coordination landscape. Understanding these relationships enables practitioners to assess the adequacy of the response, identify mismatches between risk and action, and improve future evacuation planning.