## Navigational Geometry in Structured Parking Environments

Modern parking infrastructure relies on precise geometric modeling to enable autonomous vehicle navigation, space allocation, and route planning. The domain captures every navigable zone, every physical obstacle, every designated parking space, and every planned trajectory through a structured set of records. Zones define the navigable footprint of a parking area with dimensions and surface characteristics. Obstacles represent static and dynamic impediments within those zones, from islands and parking lines to vehicles and cul-de-sacs. Parking spaces are the target destinations, each with occupancy status and dimensional attributes. Tangent circles model the clearance envelopes around obstacles, while straight line segments and arc sections compose the actual paths vehicles follow. Planned routes tie everything together, recording when a route was scheduled, whether it is feasible, and the minimum distance to any obstacle encountered along the way. This chapter documents the entities, their relationships, and the analytical views that make the data actionable for practitioners.

**Table `zones`**

| id | zone_id | length | width | surface_type | is_cul_de_sac | waypoint_id | has_exit_point_waypoint_id |
|---|---|---|---|---|---|---|---|
| 100 | 937724 | 0.6000001 | 0.34 | flat | false | 1 | 1 |
| 101 | 99504 | 0.28 | 1.19 | sloped | true | 2 | 2 |
| 102 | 10207142 | 0.5 | 0.48561337 | flat | false | 3 | 3 |
| 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 0.93331 | 1.48 | sloped | true | 4 | 4 |

Zones form the foundational spatial units of the parking environment. Each zone carries a unique identifier, a length and width that define its rectangular footprint, and a surface type that indicates whether the ground is flat or sloped. The boolean flag `is_cul_de_sac` marks dead-end zones where vehicles must reverse to exit. Zone 100, identified by `937724`, spans 0.6 by 0.34 units on a flat surface and is not a cul-de-sac. Zone 101 (`99504`) is narrower at 0.28 by 1.19 units but is flagged as a cul-de-sac with a sloped surface. Zone 102 (`10207142`) measures 0.5 by 0.48561337 on flat ground, while zone 103 (`f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`) is the largest at 0.93331 by 1.48 units, also sloped and a cul-de-sac. Each zone is associated with a waypoint for navigation reference and an exit point waypoint that marks where a vehicle leaves the zone.

**Table `obstacles`**

| obstacle_id | obstacle_type | position_x | position_y | is_static | zone_id |
|---|---|---|---|---|---|
| 1 | island | 13.20 | 11.70 | false | 100 |
| 2 | parking_line | 16.40 | 13.40 | true | 101 |
| 3 | vehicle | 19.60 | 15.10 | false | 102 |
| 4 | cul_de_sac | 22.80 | 16.80 | true | 103 |

Obstacles occupy zones and represent anything that impedes free movement. The `obstacle_type` column classifies them as islands, parking lines, vehicles, or cul-de-sacs. Each obstacle has a precise `position_x` and `position_y` coordinate within its parent zone, and the `is_static` flag distinguishes fixed infrastructure from movable objects. Obstacle 1, an island at coordinates (13.20, 11.70) in zone 100, is not static, suggesting it may be a temporary or movable barrier. Obstacle 2, a parking line at (16.40, 13.40) in zone 101, is static. Obstacle 3, a vehicle at (19.60, 15.10) in zone 102, is not static, consistent with a vehicle that can move. Obstacle 4, a cul-de-sac marker at (22.80, 16.80) in zone 103, is static.

**Table `parking_spaces`**

| id | space_id | length | width | is_occupied | zone_id |
|---|---|---|---|---|---|
| 1000 | 195344 | 0.6000001 | 0.34 | false | 100 |
| 1001 | 16611019 | 0.28 | 1.19 | true | 101 |
| 1002 | L237 | 0.5 | 0.48561337 | false | 102 |
| 1003 | BjoernKW | 0.93331 | 1.48 | true | 103 |

Parking spaces are the destinations within zones. Each space has a `space_id`, dimensions, an occupancy flag, and a reference to its parent zone. Space 1000 (`195344`) in zone 100 measures 0.6 by 0.34 and is unoccupied. Space 1001 (`16611019`) in zone 101 is 0.28 by 1.19 and occupied. Space 1002 (`L237`) in zone 102 is 0.5 by 0.48561337 and unoccupied. Space 1003 (`BjoernKW`) in zone 103 is 0.93331 by 1.48 and occupied. The dimensions of parking spaces closely mirror their parent zones, suggesting that spaces may occupy the full footprint of their zones or that zones are defined by their contained spaces.

**Table `tangent_circles`**

| id | circle_id | radius | center_x | center_y | obstacle_id |
|---|---|---|---|---|---|
| 1 | 338542 | 4.70 | 8.20 | 6.45 | 1 |
| 2 | 3012829 | 7.40 | 12.40 | 8.90 | 2 |
| 3 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 10.10 | 16.60 | 11.35 | 3 |
| 4 | 10238265 | 12.80 | 20.80 | 13.80 | 4 |

Tangent circles define clearance envelopes around obstacles. Each circle has a `circle_id`, a `radius` that determines the safety buffer, and a center point (`center_x`, `center_y`). The `obstacle_id` links the circle to the obstacle it surrounds. Circle 1 (`338542`) has a radius of 4.70 and is centered at (8.20, 6.45), associated with obstacle 1. Circle 2 (`3012829`) has a larger radius of 7.40, centered at (12.40, 8.90), linked to obstacle 2. Circle 3 (`054cac68-8fc7-11eb-924d-9cd76263cbd0`) has the largest radius at 10.10, centered at (16.60, 11.35), for obstacle 3. Circle 4 (`10238265`) has a radius of 12.80, centered at (20.80, 13.80), for obstacle 4. The increasing radii suggest that obstacles in later zones require progressively larger clearance buffers.

**Table `straight_line_segments`**

| segment_id | length | start_tangent_point_x | start_tangent_point_y | end_tangent_point_x | end_tangent_point_y | tangent_circle_id | planned_route_id |
|---|---|---|---|---|---|---|---|
| 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.6000001 | 9.70 | 7.95 | 18.95 | 19.20 | 1 | 100 |
| 32825 | 0.28 | 14.40 | 9.90 | 20.90 | 22.40 | 2 | 101 |
| 974920 | 0.5 | 19.10 | 11.85 | 22.85 | 25.60 | 3 | 102 |
| 2933482 | 0.93331 | 23.80 | 13.80 | 24.80 | 28.80 | 4 | 103 |

Straight line segments are the linear components of planned routes. Each segment has a `segment_id`, a `length`, start and end tangent points, and references to both a `tangent_circle_id` and a `planned_route_id`. Segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` has a length of 0.6000001, runs from tangent point (9.70, 7.95) to (18.95, 19.20), connects to tangent circle 1, and belongs to planned route 100. Segment `32825` is 0.28 units long, from (14.40, 9.90) to (20.90, 22.40), linked to circle 2 and route 101. Segment `974920` is 0.5 units, from (19.10, 11.85) to (22.85, 25.60), tied to circle 3 and route 102. Segment `2933482` is 0.93331 units, from (23.80, 13.80) to (24.80, 28.80), associated with circle 4 and route 103.

**Table `planned_routes`**

| planned_route_id | route_id | start_time | end_time | is_feasible | min_obstacle_distance | zone_id | waypoint_id | ends_at_waypoint_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 1996928 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | false | 2.84 | 100 | 1 | 1 |
| 101 | 6926358 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | true | 0.625 | 101 | 2 | 2 |
| 102 | 82869 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | false | 0.88669 | 102 | 3 | 3 |
| 103 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | true | 30.5 | 103 | 4 | 4 |

Planned routes represent scheduled vehicle trajectories through the parking environment. Each route has a `route_id`, a `start_time` and `end_time`, a `is_feasible` flag, a `min_obstacle_distance` indicating the closest approach to any obstacle, and references to a zone and waypoints. Route 100 (`1996928`) was scheduled from 2024-03-27 to 2023-02-26, is not feasible, and has a minimum obstacle distance of 2.84. Route 101 (`6926358`) runs from 2025-08-11 to 2024-07-10, is feasible, with a tight minimum distance of 0.625. Route 102 (`82869`) spans 2022-01-22 to 2025-12-21, is not feasible, and has a minimum distance of 0.88669. Route 103 (`b10c758c-8fcd-11eb-924d-9cd76263cbd0`) runs from 2023-06-06 to 2022-05-05, is feasible, and has a generous minimum distance of 30.5. The feasibility flag appears inversely correlated with the minimum obstacle distance in some cases, though route 103 demonstrates that large clearance does not guarantee feasibility.

**Table `arc_sections`**

| arc_section_id | arc_id | radius | start_angle | end_angle | segment_id | planned_route_id |
|---|---|---|---|---|---|---|
| 1000 | 3990162 | 4.70 | 19.95 | 21.45 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 100 |
| 1001 | 4447016 | 7.40 | 22.90 | 25.90 | 32825 | 101 |
| 1002 | 3012827 | 10.10 | 25.85 | 30.35 | 974920 | 102 |
| 1003 | 611502 | 12.80 | 28.80 | 34.80 | 2933482 | 103 |

Arc sections complement straight line segments as the curved components of planned routes. Arc sections connect to straight line segments and belong to planned routes, forming complete navigable paths. The arc sections table captures the curvature data needed to model non-linear vehicle trajectories through parking zones.

**Table `waypoints`**

| id | waypoint_id | x | y | waypoint_type | zone_id | planned_route_id | is_end_of_planned_route_id |
|---|---|---|---|---|---|---|---|
| 1 | 611507 | 19.70 | 15.20 | entry | 100 | 100 | 100 |
| 2 | 778575 | 21.40 | 17.40 | exit | 101 | 101 | 101 |
| 3 | 5006438 | 23.10 | 19.60 | checkpoint | 102 | 102 | 102 |
| 4 | 7041 | 24.80 | 21.80 | parking | 103 | 103 | 103 |

Waypoints serve as navigation anchors within zones. Each waypoint has a unique identifier and is associated with a zone. Waypoints 1 through 4 correspond to zones 100 through 103, providing reference points for both zone navigation and route planning. The `waypoint_id` column in zones and the `waypoint_id` column in planned routes both reference this table, creating a bridge between spatial zones and scheduled routes.

The relationships between these entities are captured through junction tables. Zones and obstacles are linked through the `zones_obstacles` table, which records which obstacles reside in which zones. Zones and parking spaces are connected via `zones_spaces`. Obstacles and tangent circles are related through `obstacles_circles`, while parking spaces and obstacles are linked by `spaces_obstacles`. Tangent circles and straight line segments are joined by `circles_segments`, and planned routes are connected to straight line segments through `routes_segments` and to arc sections through `routes_sections`. These junction tables enable the many-to-many relationships that arise when a zone contains multiple obstacles, when a route traverses multiple segments, or when a tangent circle influences multiple path segments.

**Table `zones_obstacles`**

| zone_id | obstacle_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `zones_spaces`**

| zone_id | parking_space_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

**Table `obstacles_circles`**

| obstacle_id | tangent_circle_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `spaces_obstacles`**

| parking_space_id | obstacle_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `circles_segments`**

| tangent_circle_id | segment_id |
|---|---|
| 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 |
| 1 | 32825 |
| 2 | 32825 |
| 2 | 974920 |
| 3 | 974920 |
| 3 | 2933482 |
| 4 | 2933482 |
| 4 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 |

**Table `routes_segments`**

| planned_route_id | segment_id |
|---|---|
| 100 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 |
| 100 | 32825 |
| 101 | 32825 |
| 101 | 974920 |
| 102 | 974920 |
| 102 | 2933482 |
| 103 | 2933482 |
| 103 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 |

**Table `routes_sections`**

| planned_route_id | arc_section_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The views in this domain synthesize the base tables and junction records into analytical perspectives that answer specific operational questions. Each view joins related entities to provide a complete picture of a particular aspect of the parking environment.

**View `v_zone_obstacle_detail`**

```sql
CREATE VIEW v_zone_obstacle_detail AS
SELECT a.id, a.zone_id, a.length, b.obstacle_id AS obstacle_obstacle_id, b.obstacle_type AS obstacle_obstacle_type, b.position_x AS obstacle_position_x
FROM zones a
  JOIN zones_obstacles j ON j.zone_id = a.id
  JOIN obstacles b ON b.obstacle_id = j.obstacle_id;
```

| id | zone_id | length | obstacle_obstacle_id | obstacle_obstacle_type | obstacle_position_x |
|---|---|---|---|---|---|
| 100 | 937724 | 0.6000001 | 1 | island | 13.20 |
| 100 | 937724 | 0.6000001 | 2 | parking_line | 16.40 |
| 101 | 99504 | 0.28 | 2 | parking_line | 16.40 |
| 101 | 99504 | 0.28 | 3 | vehicle | 19.60 |
| 102 | 10207142 | 0.5 | 3 | vehicle | 19.60 |
| 102 | 10207142 | 0.5 | 4 | cul_de_sac | 22.80 |
| 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 0.93331 | 4 | cul_de_sac | 22.80 |
| 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 0.93331 | 1 | island | 13.20 |

The zone-obstacle detail view answers which obstacles are present in each zone, combining zone dimensions and surface type with obstacle classification and position. For zone 100, the view reveals an island obstacle at (13.20, 11.70) on a flat surface spanning 0.6 by 0.34 units. For zone 103, it shows a cul-de-sac obstacle at (22.80, 16.80) within a sloped cul-de-sac zone measuring 0.93331 by 1.48 units.

**View `v_zone_parking_space_detail`**

```sql
CREATE VIEW v_zone_parking_space_detail AS
SELECT a.id, a.zone_id, a.length, b.id AS space_id, b.space_id AS space_space_id, b.length AS space_length
FROM zones a
  JOIN zones_spaces j ON j.zone_id = a.id
  JOIN parking_spaces b ON b.id = j.parking_space_id;
```

| id | zone_id | length | space_id | space_space_id | space_length |
|---|---|---|---|---|---|
| 100 | 937724 | 0.6000001 | 1000 | 195344 | 0.6000001 |
| 100 | 937724 | 0.6000001 | 1001 | 16611019 | 0.28 |
| 101 | 99504 | 0.28 | 1001 | 16611019 | 0.28 |
| 101 | 99504 | 0.28 | 1002 | L237 | 0.5 |
| 102 | 10207142 | 0.5 | 1002 | L237 | 0.5 |
| 102 | 10207142 | 0.5 | 1003 | BjoernKW | 0.93331 |
| 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 0.93331 | 1003 | BjoernKW | 0.93331 |
| 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 0.93331 | 1000 | 195344 | 0.6000001 |

This view pairs each zone with its parking spaces, showing space dimensions and occupancy alongside zone characteristics. Zone 100 contains space 1000 (`195344`), which is 0.6 by 0.34 units and unoccupied. Zone 103 contains space 1003 (`BjoernKW`), which is 0.93331 by 1.48 units and occupied. The view makes it straightforward to identify which zones have available parking.

**View `v_zone_waypoint`**

```sql
CREATE VIEW v_zone_waypoint AS
SELECT a.id, a.zone_id, a.length, a.width, b.id AS waypoint_id, b.waypoint_id AS waypoint_waypoint_id, b.x AS waypoint_x
FROM zones a JOIN waypoints b ON a.waypoint_id = b.id;
```

| id | zone_id | length | width | waypoint_id | waypoint_waypoint_id | waypoint_x |
|---|---|---|---|---|---|---|
| 100 | 937724 | 0.6000001 | 0.34 | 1 | 611507 | 19.70 |
| 101 | 99504 | 0.28 | 1.19 | 2 | 778575 | 21.40 |
| 102 | 10207142 | 0.5 | 0.48561337 | 3 | 5006438 | 23.10 |
| 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 0.93331 | 1.48 | 4 | 7041 | 24.80 |

The zone-waypoint view links zones to their navigation waypoints, providing a complete reference for zone-level navigation. Zone 100 is associated with waypoint 1, and zone 103 with waypoint 4. This view supports route planning by establishing the waypoints that define zone entry and exit points.

**View `v_obstacle_zone`**

```sql
CREATE VIEW v_obstacle_zone AS
SELECT a.obstacle_id, a.obstacle_type, a.position_x, a.position_y, b.id AS zone_id, b.zone_id AS zone_zone_id, b.length AS zone_length
FROM obstacles a JOIN zones b ON a.zone_id = b.id;
```

| obstacle_id | obstacle_type | position_x | position_y | zone_id | zone_zone_id | zone_length |
|---|---|---|---|---|---|---|
| 1 | island | 13.20 | 11.70 | 100 | 937724 | 0.6000001 |
| 2 | parking_line | 16.40 | 13.40 | 101 | 99504 | 0.28 |
| 3 | vehicle | 19.60 | 15.10 | 102 | 10207142 | 0.5 |
| 4 | cul_de_sac | 22.80 | 16.80 | 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 0.93331 |

This view presents obstacles alongside their parent zone information, answering which zone each obstacle belongs to and what the zone's characteristics are. Obstacle 1 (island) resides in zone 100, a flat 0.6 by 0.34 unit zone. Obstacle 2 (parking line) is in zone 101, a sloped cul-de-sac measuring 0.28 by 1.19 units.

**View `v_obstacle_tangent_circle_detail`**

```sql
CREATE VIEW v_obstacle_tangent_circle_detail AS
SELECT a.obstacle_id, a.obstacle_type, a.position_x, b.id AS circle_id, b.circle_id AS circle_circle_id, b.radius AS circle_radius
FROM obstacles a
  JOIN obstacles_circles j ON j.obstacle_id = a.obstacle_id
  JOIN tangent_circles b ON b.id = j.tangent_circle_id;
```

| obstacle_id | obstacle_type | position_x | circle_id | circle_circle_id | circle_radius |
|---|---|---|---|---|---|
| 1 | island | 13.20 | 1 | 338542 | 4.70 |
| 1 | island | 13.20 | 2 | 3012829 | 7.40 |
| 2 | parking_line | 16.40 | 2 | 3012829 | 7.40 |
| 2 | parking_line | 16.40 | 3 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 10.10 |
| 3 | vehicle | 19.60 | 3 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 10.10 |
| 3 | vehicle | 19.60 | 4 | 10238265 | 12.80 |
| 4 | cul_de_sac | 22.80 | 4 | 10238265 | 12.80 |
| 4 | cul_de_sac | 22.80 | 1 | 338542 | 4.70 |

The obstacle-tangent circle detail view combines obstacle classification with the clearance circle that surrounds it. Obstacle 1 (island) is surrounded by circle 1 (`338542`) with a radius of 4.70 centered at (8.20, 6.45). Obstacle 4 (cul-de-sac) is surrounded by circle 4 (`10238265`) with a radius of 12.80 centered at (20.80, 13.80). This view is essential for collision avoidance calculations.

**View `v_parking_space_zone`**

```sql
CREATE VIEW v_parking_space_zone AS
SELECT a.id, a.space_id, a.length, a.width, b.id AS zone_id, b.zone_id AS zone_zone_id, b.length AS zone_length
FROM parking_spaces a JOIN zones b ON a.zone_id = b.id;
```

| id | space_id | length | width | zone_id | zone_zone_id | zone_length |
|---|---|---|---|---|---|---|
| 1000 | 195344 | 0.6000001 | 0.34 | 100 | 937724 | 0.6000001 |
| 1001 | 16611019 | 0.28 | 1.19 | 101 | 99504 | 0.28 |
| 1002 | L237 | 0.5 | 0.48561337 | 102 | 10207142 | 0.5 |
| 1003 | BjoernKW | 0.93331 | 1.48 | 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 0.93331 |

This view shows parking spaces in the context of their parent zones, combining space occupancy and dimensions with zone surface type and cul-de-sac status. Space 1001 (`16611019`) is occupied and located in zone 101, a sloped cul-de-sac. Space 1002 (`L237`) is unoccupied in zone 102, a flat non-cul-de-sac zone.

**View `v_parking_space_obstacle_detail`**

```sql
CREATE VIEW v_parking_space_obstacle_detail AS
SELECT a.id, a.space_id, a.length, b.obstacle_id AS obstacle_obstacle_id, b.obstacle_type AS obstacle_obstacle_type, b.position_x AS obstacle_position_x
FROM parking_spaces a
  JOIN spaces_obstacles j ON j.parking_space_id = a.id
  JOIN obstacles b ON b.obstacle_id = j.obstacle_id;
```

| id | space_id | length | obstacle_obstacle_id | obstacle_obstacle_type | obstacle_position_x |
|---|---|---|---|---|---|
| 1000 | 195344 | 0.6000001 | 1 | island | 13.20 |
| 1000 | 195344 | 0.6000001 | 2 | parking_line | 16.40 |
| 1001 | 16611019 | 0.28 | 2 | parking_line | 16.40 |
| 1001 | 16611019 | 0.28 | 3 | vehicle | 19.60 |
| 1002 | L237 | 0.5 | 3 | vehicle | 19.60 |
| 1002 | L237 | 0.5 | 4 | cul_de_sac | 22.80 |
| 1003 | BjoernKW | 0.93331 | 4 | cul_de_sac | 22.80 |
| 1003 | BjoernKW | 0.93331 | 1 | island | 13.20 |

The parking space-obstacle detail view reveals the spatial relationship between parking spaces and obstacles within the same zone. Space 1000 in zone 100 coexists with obstacle 1 (island), while space 1003 in zone 103 coexists with obstacle 4 (cul-de-sac). This view supports occupancy-aware navigation by identifying which obstacles are near available spaces.

**View `v_tangent_circle_obstacle`**

```sql
CREATE VIEW v_tangent_circle_obstacle AS
SELECT a.id, a.circle_id, a.radius, a.center_x, b.obstacle_id AS obstacle_obstacle_id, b.obstacle_type AS obstacle_obstacle_type, b.position_x AS obstacle_position_x
FROM tangent_circles a JOIN obstacles b ON a.obstacle_id = b.obstacle_id;
```

| id | circle_id | radius | center_x | obstacle_obstacle_id | obstacle_obstacle_type | obstacle_position_x |
|---|---|---|---|---|---|---|
| 1 | 338542 | 4.70 | 8.20 | 1 | island | 13.20 |
| 2 | 3012829 | 7.40 | 12.40 | 2 | parking_line | 16.40 |
| 3 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 10.10 | 16.60 | 3 | vehicle | 19.60 |
| 4 | 10238265 | 12.80 | 20.80 | 4 | cul_de_sac | 22.80 |

This view presents tangent circles alongside their associated obstacles, providing a clear mapping from clearance geometry to the physical impediment it protects against. Circle 2 (`3012829`) with radius 7.40 protects obstacle 2 (parking line). Circle 3 (`054cac68-8fc7-11eb-924d-9cd76263cbd0`) with radius 10.10 protects obstacle 3 (vehicle).

**View `v_tangent_circle_straight_line_segment_detail`**

```sql
CREATE VIEW v_tangent_circle_straight_line_segment_detail AS
SELECT a.id, a.circle_id, a.radius, b.segment_id AS segment_segment_id, b.length AS segment_length, b.start_tangent_point_x AS segment_start_tangent_point_x
FROM tangent_circles a
  JOIN circles_segments j ON j.tangent_circle_id = a.id
  JOIN straight_line_segments b ON b.segment_id = j.segment_id;
```

| id | circle_id | radius | segment_segment_id | segment_length | segment_start_tangent_point_x |
|---|---|---|---|---|---|
| 1 | 338542 | 4.70 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.6000001 | 9.70 |
| 1 | 338542 | 4.70 | 32825 | 0.28 | 14.40 |
| 2 | 3012829 | 7.40 | 32825 | 0.28 | 14.40 |
| 2 | 3012829 | 7.40 | 974920 | 0.5 | 19.10 |
| 3 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 10.10 | 974920 | 0.5 | 19.10 |
| 3 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 10.10 | 2933482 | 0.93331 | 23.80 |
| 4 | 10238265 | 12.80 | 2933482 | 0.93331 | 23.80 |
| 4 | 10238265 | 12.80 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.6000001 | 9.70 |

The tangent circle-straight line segment detail view connects clearance geometry to the path segments that navigate around it. Segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` (length 0.6000001, from (9.70, 7.95) to (18.95, 19.20)) is associated with tangent circle 1. Segment `2933482` (length 0.93331, from (23.80, 13.80) to (24.80, 28.80)) is associated with tangent circle 4.

**View `v_straight_line_segment_tangent_circle`**

```sql
CREATE VIEW v_straight_line_segment_tangent_circle AS
SELECT a.segment_id, a.length, a.start_tangent_point_x, a.start_tangent_point_y, b.id AS circle_id, b.circle_id AS circle_circle_id, b.radius AS circle_radius
FROM straight_line_segments a JOIN tangent_circles b ON a.tangent_circle_id = b.id;
```

| segment_id | length | start_tangent_point_x | start_tangent_point_y | circle_id | circle_circle_id | circle_radius |
|---|---|---|---|---|---|---|
| 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.6000001 | 9.70 | 7.95 | 1 | 338542 | 4.70 |
| 32825 | 0.28 | 14.40 | 9.90 | 2 | 3012829 | 7.40 |
| 974920 | 0.5 | 19.10 | 11.85 | 3 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 10.10 |
| 2933482 | 0.93331 | 23.80 | 13.80 | 4 | 10238265 | 12.80 |

This view presents straight line segments alongside their tangent circles, answering which clearance envelope each segment navigates around. Segment `32825` (length 0.28) navigates around tangent circle 2 (radius 7.40). Segment `974920` (length 0.5) navigates around tangent circle 3 (radius 10.10).

**View `v_straight_line_segment_planned_route`**

```sql
CREATE VIEW v_straight_line_segment_planned_route AS
SELECT a.segment_id, a.length, a.start_tangent_point_x, a.start_tangent_point_y, b.planned_route_id AS route_planned_route_id, b.route_id AS route_route_id, b.start_time AS route_start_time
FROM straight_line_segments a JOIN planned_routes b ON a.planned_route_id = b.planned_route_id;
```

| segment_id | length | start_tangent_point_x | start_tangent_point_y | route_planned_route_id | route_route_id | route_start_time |
|---|---|---|---|---|---|---|
| 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.6000001 | 9.70 | 7.95 | 100 | 1996928 | 2024-03-27T14:42:00 |
| 32825 | 0.28 | 14.40 | 9.90 | 101 | 6926358 | 2025-08-11T21:59:00 |
| 974920 | 0.5 | 19.10 | 11.85 | 102 | 82869 | 2022-01-22T04:16:00 |
| 2933482 | 0.93331 | 23.80 | 13.80 | 103 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-06T11:33:00 |

The straight line segment-planned route view links path segments to the routes they compose. Segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` belongs to planned route 100 (`1996928`). Segment `2933482` belongs to planned route 103 (`b10c758c-8fcd-11eb-924d-9cd76263cbd0`). This view enables route reconstruction from individual segments.

**View `v_planned_route_straight_line_segment_detail`**

```sql
CREATE VIEW v_planned_route_straight_line_segment_detail AS
SELECT a.planned_route_id, a.route_id, a.start_time, b.segment_id AS segment_segment_id, b.length AS segment_length, b.start_tangent_point_x AS segment_start_tangent_point_x
FROM planned_routes a
  JOIN routes_segments j ON j.planned_route_id = a.planned_route_id
  JOIN straight_line_segments b ON b.segment_id = j.segment_id;
```

| planned_route_id | route_id | start_time | segment_segment_id | segment_length | segment_start_tangent_point_x |
|---|---|---|---|---|---|
| 100 | 1996928 | 2024-03-27T14:42:00 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.6000001 | 9.70 |
| 100 | 1996928 | 2024-03-27T14:42:00 | 32825 | 0.28 | 14.40 |
| 101 | 6926358 | 2025-08-11T21:59:00 | 32825 | 0.28 | 14.40 |
| 101 | 6926358 | 2025-08-11T21:59:00 | 974920 | 0.5 | 19.10 |
| 102 | 82869 | 2022-01-22T04:16:00 | 974920 | 0.5 | 19.10 |
| 102 | 82869 | 2022-01-22T04:16:00 | 2933482 | 0.93331 | 23.80 |
| 103 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-06T11:33:00 | 2933482 | 0.93331 | 23.80 |
| 103 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-06T11:33:00 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.6000001 | 9.70 |

This view provides detailed information about the straight line segments that make up each planned route, combining segment geometry with route scheduling data. Route 100 contains segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` with length 0.6000001. Route 101 contains segment `32825` with length 0.28. The view supports route feasibility analysis by showing the geometric components of each scheduled trajectory.

**View `v_planned_route_arc_section_detail`**

```sql
CREATE VIEW v_planned_route_arc_section_detail AS
SELECT a.planned_route_id, a.route_id, a.start_time, b.arc_section_id AS section_arc_section_id, b.arc_id AS section_arc_id, b.radius AS section_radius
FROM planned_routes a
  JOIN routes_sections j ON j.planned_route_id = a.planned_route_id
  JOIN arc_sections b ON b.arc_section_id = j.arc_section_id;
```

| planned_route_id | route_id | start_time | section_arc_section_id | section_arc_id | section_radius |
|---|---|---|---|---|---|
| 100 | 1996928 | 2024-03-27T14:42:00 | 1000 | 3990162 | 4.70 |
| 100 | 1996928 | 2024-03-27T14:42:00 | 1001 | 4447016 | 7.40 |
| 101 | 6926358 | 2025-08-11T21:59:00 | 1001 | 4447016 | 7.40 |
| 101 | 6926358 | 2025-08-11T21:59:00 | 1002 | 3012827 | 10.10 |
| 102 | 82869 | 2022-01-22T04:16:00 | 1002 | 3012827 | 10.10 |
| 102 | 82869 | 2022-01-22T04:16:00 | 1003 | 611502 | 12.80 |
| 103 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-06T11:33:00 | 1003 | 611502 | 12.80 |
| 103 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-06T11:33:00 | 1000 | 3990162 | 4.70 |

The planned route arc section detail view reveals the curved components of each planned route, complementing the straight line segments with arc geometry. This view is essential for understanding the complete path geometry of a route, as vehicles navigate both linear and curved segments through parking zones.

**View `v_planned_route_zone`**

```sql
CREATE VIEW v_planned_route_zone AS
SELECT a.planned_route_id, a.route_id, a.start_time, a.end_time, b.id AS zone_id, b.zone_id AS zone_zone_id, b.length AS zone_length
FROM planned_routes a JOIN zones b ON a.zone_id = b.id;
```

| planned_route_id | route_id | start_time | end_time | zone_id | zone_zone_id | zone_length |
|---|---|---|---|---|---|---|
| 100 | 1996928 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 100 | 937724 | 0.6000001 |
| 101 | 6926358 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 101 | 99504 | 0.28 |
| 102 | 82869 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 102 | 10207142 | 0.5 |
| 103 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 0.93331 |

This view connects planned routes to their parent zones, answering which zone each route traverses. Route 100 (`1996928`) traverses zone 100, a flat 0.6 by 0.34 unit zone. Route 103 (`b10c758c-8fcd-11eb-924d-9cd76263cbd0`) traverses zone 103, a sloped cul-de-sac measuring 0.93331 by 1.48 units. This view supports zone-level route analysis and capacity planning.

**View `v_planned_route_waypoint`**

```sql
CREATE VIEW v_planned_route_waypoint AS
SELECT a.planned_route_id, a.route_id, a.start_time, a.end_time, b.id AS waypoint_id, b.waypoint_id AS waypoint_waypoint_id, b.x AS waypoint_x
FROM planned_routes a JOIN waypoints b ON a.waypoint_id = b.id;
```

| planned_route_id | route_id | start_time | end_time | waypoint_id | waypoint_waypoint_id | waypoint_x |
|---|---|---|---|---|---|---|
| 100 | 1996928 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1 | 611507 | 19.70 |
| 101 | 6926358 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 2 | 778575 | 21.40 |
| 102 | 82869 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 3 | 5006438 | 23.10 |
| 103 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 4 | 7041 | 24.80 |

The planned route-waypoint view links routes to their start and end waypoints, providing the navigation anchors for each scheduled trajectory. Route 100 uses waypoint 1 for both start and end. Route 103 uses waypoint 4 for both start and end. This view is critical for understanding the navigation logic of each route.

**View `v_arc_section_straight_line_segment`**

```sql
CREATE VIEW v_arc_section_straight_line_segment AS
SELECT a.arc_section_id, a.arc_id, a.radius, a.start_angle, b.segment_id AS segment_segment_id, b.length AS segment_length, b.start_tangent_point_x AS segment_start_tangent_point_x
FROM arc_sections a JOIN straight_line_segments b ON a.segment_id = b.segment_id;
```

| arc_section_id | arc_id | radius | start_angle | segment_segment_id | segment_length | segment_start_tangent_point_x |
|---|---|---|---|---|---|---|
| 1000 | 3990162 | 4.70 | 19.95 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.6000001 | 9.70 |
| 1001 | 4447016 | 7.40 | 22.90 | 32825 | 0.28 | 14.40 |
| 1002 | 3012827 | 10.10 | 25.85 | 974920 | 0.5 | 19.10 |
| 1003 | 611502 | 12.80 | 28.80 | 2933482 | 0.93331 | 23.80 |

This view reveals the relationship between arc sections and straight line segments within planned routes, showing how curved and linear path components connect. Arc sections and straight line segments together form the complete navigable path, and this view documents the transition points between them.

**View `v_arc_section_planned_route`**

```sql
CREATE VIEW v_arc_section_planned_route AS
SELECT a.arc_section_id, a.arc_id, a.radius, a.start_angle, b.planned_route_id AS route_planned_route_id, b.route_id AS route_route_id, b.start_time AS route_start_time
FROM arc_sections a JOIN planned_routes b ON a.planned_route_id = b.planned_route_id;
```

| arc_section_id | arc_id | radius | start_angle | route_planned_route_id | route_route_id | route_start_time |
|---|---|---|---|---|---|---|
| 1000 | 3990162 | 4.70 | 19.95 | 100 | 1996928 | 2024-03-27T14:42:00 |
| 1001 | 4447016 | 7.40 | 22.90 | 101 | 6926358 | 2025-08-11T21:59:00 |
| 1002 | 3012827 | 10.10 | 25.85 | 102 | 82869 | 2022-01-22T04:16:00 |
| 1003 | 611502 | 12.80 | 28.80 | 103 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-06T11:33:00 |

The arc section-planned route view shows which planned routes contain each arc section, answering which routes include curved navigation segments. This view supports route complexity analysis by identifying routes that require curved trajectory planning in addition to straight-line navigation.

**View `v_waypoint_zone`**

```sql
CREATE VIEW v_waypoint_zone AS
SELECT a.id, a.waypoint_id, a.x, a.y, b.id AS zone_id, b.zone_id AS zone_zone_id, b.length AS zone_length
FROM waypoints a JOIN zones b ON a.zone_id = b.id;
```

| id | waypoint_id | x | y | zone_id | zone_zone_id | zone_length |
|---|---|---|---|---|---|---|
| 1 | 611507 | 19.70 | 15.20 | 100 | 937724 | 0.6000001 |
| 2 | 778575 | 21.40 | 17.40 | 101 | 99504 | 0.28 |
| 3 | 5006438 | 23.10 | 19.60 | 102 | 10207142 | 0.5 |
| 4 | 7041 | 24.80 | 21.80 | 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 0.93331 |

This view presents waypoints alongside their parent zones, providing a complete reference for zone-level navigation. Waypoint 1 is in zone 100, and waypoint 4 is in zone 103. The view supports navigation planning by establishing the spatial relationship between waypoints and the zones they anchor.

**View `v_waypoint_planned_route`**

```sql
CREATE VIEW v_waypoint_planned_route AS
SELECT a.id, a.waypoint_id, a.x, a.y, b.planned_route_id AS route_planned_route_id, b.route_id AS route_route_id, b.start_time AS route_start_time
FROM waypoints a JOIN planned_routes b ON a.planned_route_id = b.planned_route_id;
```

| id | waypoint_id | x | y | route_planned_route_id | route_route_id | route_start_time |
|---|---|---|---|---|---|---|
| 1 | 611507 | 19.70 | 15.20 | 100 | 1996928 | 2024-03-27T14:42:00 |
| 2 | 778575 | 21.40 | 17.40 | 101 | 6926358 | 2025-08-11T21:59:00 |
| 3 | 5006438 | 23.10 | 19.60 | 102 | 82869 | 2022-01-22T04:16:00 |
| 4 | 7041 | 24.80 | 21.80 | 103 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-06T11:33:00 |

The waypoint-planned route view links waypoints to the routes that use them, answering which routes reference each navigation anchor. Waypoint 1 is used by route 100, and waypoint 4 is used by route 103. This view completes the navigation chain from waypoints through routes to zones, enabling end-to-end route verification.

The domain data model provides a comprehensive framework for modeling parking infrastructure and vehicle navigation. Zones define the navigable space, obstacles represent impediments, and parking spaces are the targets. Tangent circles establish safety buffers around obstacles, while straight line segments and arc sections compose the actual paths. Planned routes tie scheduling, feasibility, and geometric data together, and waypoints provide navigation anchors throughout. The junction tables enable the complex many-to-many relationships that arise in real parking environments, and the analytical views synthesize these relationships into actionable perspectives. Together, these records support autonomous vehicle navigation, space allocation, and route feasibility analysis in structured parking environments.