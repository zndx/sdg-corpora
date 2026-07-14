Disaster management agencies must coordinate hazard detection, geographic risk assessment, population notification, and evacuation routing before, during, and after an emergency event. The evacuation management domain captures this coordination as a set of six base tables and twenty denormalized views that materialize every pairwise relationship between the core entities. Each base table stores a single entity type with its intrinsic attributes; foreign-key columns encode the cardinality-bounded relationships that bind orders to hazards, zones to routes, and populations to warning methods. The views then rejoin these normalized tables so that analysts can query a single result set for any domain fact — for example, which warning method reached which population in a given evacuation order, or which evacuation route traverses a geographic zone flagged as extreme risk.

## Entity Types and Their Attributes

The domain centres on six entity types, each persisted in its own table. The `evac_evacuation_orders` table records the formal directives issued by authorities. Its primary key is `id`, and the business-identifying column `order_identifier` carries values such as `ORD-2692` and `ORD-2704`. The directive carries a timestamp in `issuance_date_time` (e.g. `2024-11-17T10:30:00`), the name of the issuing body in `issuing_authority` (e.g. `extended-issuing-33`), and a free-text `evacuation_zone` label (e.g. `regional-evacuati-72`). The column `hazard_type` classifies the threat — values include `baseline-hazard-19` and `pilot-hazard-20` — while `status` tracks the lifecycle state (`pending`, `active`, `lifted`, `cancelled`). A boolean `mandatory` flag indicates whether compliance is compulsory. Three foreign-key columns — `hazard_event_id`, `geographic_zone_id`, and `warning_method_id` — link the order to the originating hazard, the affected zone, and the notification channel.

**Table `evac_evacuation_orders`**

| id | order_identifier | issuance_date_time | issuing_authority | evacuation_zone | hazard_type | status | mandatory | hazard_event_id | geographic_zone_id | warning_method_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ORD-2692 | 2024-11-17T10:30:00 | extended-issuing-33 | regional-evacuati-72 | baseline-hazard-19 | pending | true | 1 | 100 | 1 |
| 2 | ORD-2696 | 2025-04-01T17:47:00 | integrated-issuing-34 | legacy-evacuati-73 | pilot-hazard-20 | active | false | 2 | 101 | 2 |
| 3 | ORD-2700 | 2022-09-12T00:04:00 | seasonal-issuing-35 | compact-evacuati-74 | extended-hazard-21 | lifted | true | 3 | 102 | 3 |
| 4 | ORD-2704 | 2023-02-23T07:21:00 | regional-issuing-36 | composite-evacuati-75 | integrated-hazard-22 | cancelled | false | 4 | 103 | 4 |

The `evac_hazard_events` table captures the natural or industrial events that trigger orders. Its primary key is `id`, and the business identifier `event_identifier` holds values like `EVE-2706` and `EVE-2709`. Temporal bounds are stored in `start_time` and `end_time` — note that in the sample data the end time may precede the start time, reflecting a data-entry convention rather than a logical constraint. The `event_type` column enumerates categories such as `hurricane`, `flood`, `fire`, and `industrial_accident`. Severity is captured as an integer in `severity_level` (values range from 29 to 62 in the sample), and `affected_area` provides a free-text description (e.g. `extended-affected-15`). The boolean `monitored` flag indicates whether the event is under active surveillance. Foreign keys `evacuation_order_id` and `geographic_zone_id` tie the event back to the order and zone.

**Table `evac_hazard_events`**

| id | event_identifier | start_time | end_time | event_type | severity_level | affected_area | monitored | evacuation_order_id | geographic_zone_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | EVE-2706 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | hurricane | 29 | extended-affected-15 | true | 1 | 100 |
| 2 | EVE-2707 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | flood | 40 | integrated-affected-16 | false | 2 | 101 |
| 3 | EVE-2708 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | fire | 51 | seasonal-affected-17 | true | 3 | 102 |
| 4 | EVE-2709 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | industrial_accident | 62 | regional-affected-18 | false | 4 | 103 |

The `evac_geographic_zones` table models the spatial units at risk. Its primary key is `geographic_zone_id`, a surrogate that also serves as the foreign key referenced by other tables. The business identifier `zone_identifier` carries values such as `ZON-2258` and `ZON-2273`, while `zone_name` provides a human-readable label (`Pilot Series`, `Baseline Assessment`, `Distributed Survey A`, `Adaptive Corridor`). The `risk_level` column classifies zones as `low`, `medium`, `high`, or `extreme`. Demographic and spatial attributes include `population_count` (15021 down to 18 in the sample), `area_size` (a decimal in square units), and `boundary_coordinates` (a free-text boundary description). Foreign keys `evacuation_order_id`, `evacuation_route_id`, and `hazard_event_id` link the zone to the directive, the route, and the triggering event.

**Table `evac_geographic_zones`**

| geographic_zone_id | zone_identifier | zone_name | risk_level | population_count | area_size | boundary_coordinates | evacuation_order_id | evacuation_route_id | hazard_event_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | ZON-2258 | Pilot Series | low | 15021 | 1.52 | regional-boundary-78 | 1 | 1000 | 1 |
| 101 | ZON-2263 | Baseline Assessment | medium | 10 | 0.65 | legacy-boundary-79 | 2 | 1001 | 2 |
| 102 | ZON-2268 | Distributed Survey A | high | 18 | 0.43012016 | compact-boundary-80 | 3 | 1002 | 3 |
| 103 | ZON-2273 | Adaptive Corridor | extreme | 50 | 0.6000001 | composite-boundary-81 | 4 | 1003 | 4 |

The `evac_evacuation_routes` table stores the planned escape paths. Its primary key is `id`, and the business identifier `route_identifier` holds values like `ROU-2146` and `ROU-2164`. The `route_name` column provides a label (`Pilot Survey`, `Baseline Corridor`, `Distributed Series A`, `Adaptive Assessment`). Spatial endpoints are captured in `start_point` and `end_point` (e.g. `compact-start-62` to `composite-end-69`), and `route_length` records the distance (576.33914 down to 0.07500005). The `road_condition` column classifies the path as `open`, `blocked`, `washed_out`, or `flooded`, while the boolean `recommended` flag indicates whether the route is advised. Foreign keys `geographic_zone_id`, `connects_to_geographic_zone_id`, and `evacuation_order_id` tie the route to its origin zone, its destination zone, and the order.

**Table `evac_evacuation_routes`**

| id | route_identifier | route_name | start_point | end_point | route_length | road_condition | recommended | geographic_zone_id | connects_to_geographic_zone_id | evacuation_order_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | ROU-2146 | Pilot Survey | compact-start-62 | composite-end-69 | 576.33914 | open | true | 100 | 100 | 1 |
| 1001 | ROU-2152 | Baseline Corridor | composite-start-63 | primary-end-70 | 41.28334045410156 | blocked | false | 101 | 101 | 2 |
| 1002 | ROU-2158 | Distributed Series A | primary-start-64 | adaptive-end-71 | 0.07500005 | washed_out | true | 102 | 102 | 3 |
| 1003 | ROU-2164 | Adaptive Assessment | adaptive-start-65 | distributed-end-72 | 0.6000001 | flooded | false | 103 | 103 | 4 |

The `evac_warning_methods` table records the notification channels. Its primary key is `warning_method_id`, and the business identifier `method_identifier` carries values such as `MET-2663` and `MET-2684`. The `method_name` column provides a label (`Pilot Assessment`, `Baseline Survey`, `Distributed Corridor A`, `Adaptive Series`). The `reach` column classifies coverage as `local`, `regional`, or `national`, while `reliability` classifies it as `high` or `low`. The boolean `active_during_power_outage` indicates whether the method remains operational during infrastructure failure. Foreign keys `evacuation_order_id` and `population_id` link the method to the order and the population it targets.

**Table `evac_warning_methods`**

| warning_method_id | method_identifier | method_name | reach | reliability | active_during_power_outage | evacuation_order_id | population_id |
|---|---|---|---|---|---|---|---|
| 1 | MET-2663 | Pilot Assessment | local | high | true | 1 | 1 |
| 2 | MET-2670 | Baseline Survey | regional | medium | false | 2 | 2 |
| 3 | MET-2677 | Distributed Corridor A | national | low | true | 3 | 3 |
| 4 | MET-2684 | Adaptive Series | local | high | false | 4 | 4 |

The `evac_populations` table captures the demographic units affected by orders. Its primary key is `id`, and the business identifier `population_identifier` holds values like `POP-2555` and `POP-2558`. The `household_count` column records the number of households (66 down to 3), and `average_household_size` captures the mean household size (3.9440646171569824 down to 1.15). The `evacuation_compliance_rate` is stored as a percentage (9.95 to 18.80), and `transportation_access` classifies mobility as `private_vehicle`, `public_transit`, or `none`. Foreign keys `geographic_zone_id`, `warning_method_id`, and `evacuation_order_id` tie the population to its zone, its notification channel, and the order.

**Table `evac_populations`**

| id | population_identifier | household_count | average_household_size | evacuation_compliance_rate | transportation_access | geographic_zone_id | warning_method_id | evacuation_order_id |
|---|---|---|---|---|---|---|---|---|
| 1 | POP-2555 | 66 | 3.9440646171569824 | 9.95 | private_vehicle | 100 | 1 | 1 |
| 2 | POP-2556 | 5 | 1.65 | 12.90 | public_transit | 101 | 2 | 2 |
| 3 | POP-2557 | 21 | 1.15 | 15.85 | none | 102 | 3 | 3 |
| 4 | POP-2558 | 3 | 2.82 | 18.80 | private_vehicle | 103 | 4 | 4 |

## Foreign-Key Relationships and Normalization

The six base tables form a star-like schema anchored by `evac_evacuation_orders`. Each order references a single hazard event (`hazard_event_id`), a single geographic zone (`geographic_zone_id`), and a single warning method (`warning_method_id`). This design enforces a one-to-one mapping between orders and their triggering entities at the base-table level. However, the other tables also carry foreign keys that create additional relationships: `evac_hazard_events` references `evacuation_order_id` and `geographic_zone_id`, `evac_geographic_zones` references `evacuation_order_id`, `evacuation_route_id`, and `hazard_event_id`, `evac_evacuation_routes` references `geographic_zone_id`, `connects_to_geographic_zone_id`, and `evacuation_order_id`, `evac_warning_methods` references `evacuation_order_id` and `population_id`, and `evac_populations` references `geographic_zone_id`, `warning_method_id`, and `evacuation_order_id`.

This multi-directional foreign-key structure means that any entity can be reached from any other through a chain of joins. The views materialize these chains as single-query results, eliminating the need for application-level join logic. Each view corresponds to a pairwise relationship between two entity types, joining through the common foreign-key columns found in the base tables.

## View-Based Reconciliation of Domain Facts

The view `vw_evacuation_order_hazard_event` joins `evac_evacuation_orders` to `evac_hazard_events` on the shared `hazard_event_id` / `evacuation_order_id` columns, producing a flat row that answers the question: "Which hazard event triggered which evacuation order?" For the row with `order_identifier` `ORD-2692`, the join reveals that the hazard event `EVE-2706` (a `hurricane` with severity level 29) was the trigger, and the order was issued by `extended-issuing-33` on `2024-11-17T10:30:00`. The second row pairs `ORD-2696` with `EVE-2707` (a `flood` with severity level 40), illustrating how the view consolidates temporal and categorical hazard data alongside the order metadata into a single read.

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

The view `vw_evacuation_order_geographic_zone` joins `evac_evacuation_orders` to `evac_geographic_zones` on `geographic_zone_id`, answering: "Which geographic zone is affected by which evacuation order?" The first row shows that order `ORD-2692` affects zone `ZON-2258` (`Pilot Series`), which has a `low` risk level and a population count of 15021. The fourth row pairs `ORD-2704` with zone `ZON-2273` (`Adaptive Corridor`), which carries an `extreme` risk level and a population count of 50, demonstrating how the view surfaces the risk profile alongside the order status (`cancelled` in this case).

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

The view `vw_evacuation_order_warning_method` joins `evac_evacuation_orders` to `evac_warning_methods` on `warning_method_id`, answering: "Which warning method is associated with which evacuation order?" The first row reveals that order `ORD-2692` uses method `MET-2663` (`Pilot Assessment`), which has `local` reach, `high` reliability, and is `active_during_power_outage`. The third row pairs `ORD-2700` with method `MET-2677` (`Distributed Corridor A`), which has `national` reach but `low` reliability, illustrating the trade-off between coverage and dependability that planners must weigh.

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

The view `vw_hazard_event_evacuation_order` performs the inverse join of `vw_evacuation_order_hazard_event`, starting from the hazard event side. It answers: "Which evacuation order was issued in response to which hazard event?" The first row shows that hazard event `EVE-2706` (a `hurricane` starting at `2024-03-27T14:42:00`) triggered evacuation order `ORD-2692`, which has status `pending` and is marked `mandatory`. The fourth row pairs hazard event `EVE-2709` (an `industrial_accident` with severity level 62) with order `ORD-2704`, which has status `cancelled` and is not `mandatory`, showing how the view surfaces the full lifecycle of the order alongside the hazard metadata.

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

The view `vw_hazard_event_geographic_zone` joins `evac_hazard_events` to `evac_geographic_zones` on `geographic_zone_id`, answering: "Which geographic zone is impacted by which hazard event?" The first row shows that hazard event `EVE-2706` (a `hurricane`) impacts zone `ZON-2258` (`Pilot Series`), which has a `low` risk level and an area size of 1.52. The third row pairs hazard event `EVE-2708` (a `fire` with severity level 51) with zone `ZON-2268` (`Distributed Survey A`), which has a `high` risk level and a population count of 18, illustrating how the view correlates hazard severity with zone risk classification.

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

The view `vw_geographic_zone_evacuation_order` joins `evac_geographic_zones` to `evac_evacuation_orders` on `evacuation_order_id`, answering: "Which evacuation order applies to which geographic zone?" The first row shows that zone `ZON-2258` (`Pilot Series`, `low` risk) is governed by order `ORD-2692`, which has status `pending` and is `mandatory`. The fourth row pairs zone `ZON-2273` (`Adaptive Corridor`, `extreme` risk) with order `ORD-2704`, which has status `cancelled` and is not `mandatory`, demonstrating how the view surfaces the directive status alongside the zone's risk profile.

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

The view `vw_geographic_zone_evacuation_route` joins `evac_geographic_zones` to `evac_evacuation_routes` on `evacuation_route_id`, answering: "Which evacuation route is assigned to which geographic zone?" The first row shows that zone `ZON-2258` (`Pilot Series`) is served by route `ROU-2146` (`Pilot Survey`), which has a length of 576.33914, an `open` road condition, and is `recommended`. The third row pairs zone `ZON-2268` (`Distributed Survey A`) with route `ROU-2158` (`Distributed Series A`), which has a very short length of 0.07500005, a `washed_out` road condition, and is `recommended`, illustrating how the view surfaces route usability alongside zone assignment.

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

The view `vw_geographic_zone_hazard_event` joins `evac_geographic_zones` to `evac_hazard_events` on `hazard_event_id`, answering: "Which hazard event is associated with which geographic zone?" The first row shows that zone `ZON-2258` (`Pilot Series`) is linked to hazard event `EVE-2706` (a `hurricane` with severity level 29, `monitored` = true). The fourth row pairs zone `ZON-2273` (`Adaptive Corridor`) with hazard event `EVE-2709` (an `industrial_accident` with severity level 62, `monitored` = false), showing how the view surfaces the monitoring status alongside the zone's risk classification.

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

The view `vw_evacuation_route_geographic_zone` joins `evac_evacuation_routes` to `evac_geographic_zones` on `geographic_zone_id`, answering: "Which geographic zone does which evacuation route originate from?" The first row shows that route `ROU-2146` (`Pilot Survey`) originates from zone `ZON-2258` (`Pilot Series`), which has a `low` risk level and a population count of 15021. The second row pairs route `ROU-2152` (`Baseline Corridor`) with zone `ZON-2263` (`Baseline Assessment`), which has a `medium` risk level and a population count of 10, illustrating how the view surfaces the origin zone's demographics alongside the route's road condition (`blocked` in this case).

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

The view `vw_evacuation_route_evacuation_order` joins `evac_evacuation_routes` to `evac_evacuation_orders` on `evacuation_order_id`, answering: "Which evacuation order governs which evacuation route?" The first row shows that order `ORD-2692` (status `pending`, `mandatory` = true) governs route `ROU-2146` (`Pilot Survey`), which has an `open` road condition and is `recommended`. The fourth row pairs order `ORD-2704` (status `cancelled`, `mandatory` = false) with route `ROU-2164` (`Adaptive Assessment`), which has a `flooded` road condition and is not `recommended`, demonstrating how the view surfaces the directive's lifecycle state alongside the route's physical condition.

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

The view `vw_warning_method_evacuation_order` joins `evac_warning_methods` to `evac_evacuation_orders` on `evacuation_order_id`, answering: "Which evacuation order uses which warning method?" The first row shows that order `ORD-2692` uses method `MET-2663` (`Pilot Assessment`), which has `local` reach, `high` reliability, and is `active_during_power_outage`. The third row pairs order `ORD-2700` (status `lifted`) with method `MET-2677` (`Distributed Corridor A`), which has `national` reach but `low` reliability, illustrating how the view surfaces the method's operational characteristics alongside the order's status.

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

The view `vw_warning_method_population` joins `evac_warning_methods` to `evac_populations` on `population_id`, answering: "Which population is targeted by which warning method?" The first row shows that method `MET-2663` (`Pilot Assessment`, `local` reach, `high` reliability) targets population `POP-2555`, which has 66 households, an average household size of 3.9440646171569824, and a compliance rate of 9.95. The fourth row pairs method `MET-2684` (`Adaptive Series`, `local` reach, `high` reliability) with population `POP-2558`, which has only 3 households but a higher compliance rate of 18.80, illustrating how the view surfaces population demographics alongside the method's reach and reliability.

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

The view `vw_population_geographic_zone` joins `evac_populations` to `evac_geographic_zones` on `geographic_zone_id`, answering: "Which geographic zone contains which population?" The first row shows that zone `ZON-2258` (`Pilot Series`, `low` risk, area size 1.52) contains population `POP-2555`, which has 66 households and a transportation access mode of `private_vehicle`. The third row pairs zone `ZON-2268` (`Distributed Survey A`, `high` risk, area size 0.43012016) with population `POP-2557`, which has 21 households, an average household size of 1.15, and no transportation access (`none`), illustrating how the view surfaces the zone's spatial and risk attributes alongside the population's mobility constraints.

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

The view `vw_population_warning_method` joins `evac_populations` to `evac_warning_methods` on `warning_method_id`, answering: "Which warning method reaches which population?" The first row shows that population `POP-2555` (66 households, compliance rate 9.95) is reached by method `MET-2663` (`Pilot Assessment`, `local` reach, `high` reliability, `active_during_power_outage` = true). The second row pairs population `POP-2556` (5 households, compliance rate 12.90, `public_transit` access) with method `MET-2670` (`Baseline Survey`, `regional` reach, `medium` reliability, `active_during_power_outage` = false), illustrating how the view surfaces the method's operational constraints alongside the population's transit access.

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

The view `vw_population_evacuation_order` joins `evac_populations` to `evac_evacuation_orders` on `evacuation_order_id`, answering: "Which evacuation order applies to which population?" The first row shows that order `ORD-2692` (issued by `extended-issuing-33`, status `pending`, `mandatory` = true) applies to population `POP-2555`, which has 66 households and a compliance rate of 9.95. The fourth row pairs order `ORD-2704` (status `cancelled`, `mandatory` = false) with population `POP-2558`, which has 3 households, an average household size of 2.82, and a compliance rate of 18.80, demonstrating how the view surfaces the directive's mandatory status alongside the population's compliance history.

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

## Closing Synthesis

The evacuation management schema demonstrates a deliberate normalization strategy: six base tables store entity-specific attributes with surrogate primary keys, while foreign-key columns encode the relationships that bind orders to hazards, zones, routes, warning methods, and populations. The twenty views materialize every pairwise relationship as a flat, queryable result, each answering a specific domain question by joining two base tables on their shared foreign-key columns. This design separates the concerns of data storage (normalized, update-efficient base tables) from data access (denormalized, read-optimized views), allowing analysts to query any domain fact — from the hazard severity that triggered a given order to the compliance rate of a population reached by a specific warning method — through a single, self-contained SQL statement. The record identifiers (`ORD-2692`, `EVE-2706`, `ZON-2258`, `ROU-2146`, `MET-2663`, `POP-2555`) and their associated attribute values serve as concrete anchors for understanding how the abstract entity-relationship model maps onto the relational implementation.