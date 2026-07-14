## Domain: Autonomous Navigation in Structured Environments

Modern autonomous systems operate within carefully defined physical spaces where geometry, obstacles, and planned trajectories intersect. An autonomous navigation system models its operational world as a hierarchy of zones, each containing obstacles that must be detected, characterized, and circumnavigated. Path planning proceeds by constructing tangent circles around obstacles, linking those circles into path segments, and assembling segments into complete routes that pass through designated checkpoints. Vehicles traverse these routes, and the system continuously monitors their proximity to obstacles. This chapter describes the entities, measurements, and operational relationships that constitute the navigation data model, drawing on concrete records from the system's working database.

## Operational Zones

The foundational unit of the navigation model is the zone—a bounded region of the operational environment with measurable dimensions and a lifecycle status. Zones are identified by codes such as `ZON-2258` and `ZON-2263`, and each carries a length and width that define its spatial footprint. The elevation field stores a categorical label describing the zone's role, such as `baseline-zone-97` or `integrated-zone-100`. The status field tracks whether a zone is `active`, `inactive`, or `completed`, reflecting its current operational state.

**Table `zones`**

| id | zone_identifier | zone_length | zone_width | zone_elevation | zone_status | checkpoint_id | has_exit_point_checkpoint_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ZON-2258 | 0.6000001 | 0.50102748 | baseline-zone-97 | active | 21956270 | 21956270 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ZON-2263 | 0.6 | 1.24 | pilot-zone-98 | inactive | 195341 | 195341 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | ZON-2268 | 0.58 | 0.51 | extended-zone-99 | completed | 3158149 | 3158149 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | ZON-2273 | 0.77 | 0.99 | integrated-zone-100 | active | 974918 | 974918 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Zone `ZON-2258`, for example, measures approximately 0.6 by 0.5 units and is classified as a baseline zone with `active` status. It is associated with checkpoint `21956270`, which serves both as an entry and exit point for the zone. Zone `ZON-2263` is larger at 0.6 by 1.24 units, carries the label `pilot-zone-98`, and is currently `inactive`. The zone table also records timestamps for creation and last update, enabling audit trails of zone lifecycle changes.

## Obstacles and Their Geometric Characterization

Within each zone, obstacles represent physical or virtual impediments that the autonomous system must navigate around. Obstacles are identified by numeric IDs and classified by type—`island`, `parking_line`, `cul_de_sac`, and `vehicle` appear in the data. Each obstacle has Cartesian coordinates (`obstacle_x`, `obstacle_y`) and a radius that defines its exclusion zone. The status field records the system's interaction with the obstacle: `sensed`, `mapped`, or `avoided`.

**Table `obstacles`**

| obstacle_id | obstacle_type | obstacle_x | obstacle_y | obstacle_radius | obstacle_status | zone_id |
|---|---|---|---|---|---|---|
| 1 | island | 12.70 | 7.95 | 8.20 | sensed | 1 |
| 2 | parking_line | 15.40 | 11.90 | 12.40 | mapped | 2 |
| 3 | cul_de_sac | 18.10 | 15.85 | 16.60 | avoided | 3 |
| 4 | vehicle | 20.80 | 19.80 | 20.80 | sensed | 4 |

Obstacle `1` is an `island` located at coordinates (12.70, 7.95) with a radius of 8.20 units, currently in `sensed` status and belonging to zone `1`. Obstacle `2` is a `parking_line` at (15.40, 11.90) with radius 12.40, marked as `mapped` in zone `2`. Obstacle `3`, a `cul_de_sac` at (18.10, 15.85) with radius 16.60, has been `avoided` and resides in zone `3`. Obstacle `4`, classified as a `vehicle` at (20.80, 19.80) with radius 20.80, is in `sensed` status within zone `4`.

The relationship between zones and obstacles is explicit: the `zones_obstacles` junction table records which obstacles belong to which zones, and the `obstacles` table carries a `zone_id` foreign key that anchors each obstacle to its parent zone.

## Tangent Circles: Geometric Proxies for Obstacle Avoidance

For path planning, the system computes tangent circles around obstacles. These circles serve as geometric proxies that define safe passing distances. Each tangent circle has a unique identifier (which may be numeric or UUID-formatted), a radius, center coordinates, and a curvature value that influences the smoothness of the planned trajectory.

**Table `tangent_circles`**

| id | circle_id | circle_radius | circle_center_x | circle_center_y | circle_curvature | obstacle_id |
|---|---|---|---|---|---|---|
| 100 | 338542 | 14.95 | 4.70 | 5.45 | 3.70 | 1 |
| 101 | 3012829 | 18.90 | 9.40 | 7.90 | 6.40 | 2 |
| 102 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 22.85 | 14.10 | 10.35 | 9.10 | 3 |
| 103 | 10238265 | 26.80 | 18.80 | 12.80 | 11.80 | 4 |

Tangent circle `338542` has a radius of 14.95, is centered at (4.70, 5.45), and exhibits a curvature of 3.70. It is associated with obstacle `1`. Tangent circle `3012829` has a larger radius of 18.90, center at (9.40, 7.90), and curvature 6.40, linked to obstacle `2`. The UUID-formatted circle `054cac68-8fc7-11eb-924d-9cd76263cbd0` has radius 22.85 and curvature 9.10, associated with obstacle `3`. Tangent circle `10238265` has radius 26.80, center (18.80, 12.80), curvature 11.80, and belongs to obstacle `4`.

The `obstacles_circles` junction table and the `obstacle_id` foreign key in `tangent_circles` establish the mapping between obstacles and their geometric proxies. The `circles_segments` table then links these circles to the path segments that use them.

## Path Segments: Building Blocks of Trajectories

Path segments are the atomic units of a planned trajectory. Each segment has a unique identifier (numeric or UUID), a length, start and end coordinates, a status (`planned`, `executed`, or `failed`), and associations with tangent circles and routes.

**Table `path_segments`**

| path_segment_id | segment_id | segment_length | segment_start_x | segment_start_y | segment_end_x | segment_end_y | segment_status | tangent_circle_id | connects_end_tangent_circle_id | route_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.52 | 6.95 | 20.70 | 6.70 | 23.20 | planned | 100 | 100 | 1000 |
| 2 | 32825 | 0.77 | 8.90 | 25.40 | 9.40 | 27.40 | executed | 101 | 101 | 1001 |
| 3 | 974920 | 0.4827489 | 10.85 | 30.10 | 12.10 | 31.60 | failed | 102 | 102 | 1002 |
| 4 | 2933482 | 1.05 | 12.80 | 34.80 | 14.80 | 35.80 | planned | 103 | 103 | 1003 |

Path segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` has length 0.52, runs from (6.95, 20.70) to (6.70, 23.20), is in `planned` status, and is associated with tangent circle `100` at both its start and end points. It belongs to route `1000`. Path segment `32825` has length 0.77, runs from (8.90, 25.40) to (9.40, 27.40), is in `executed` status, and connects tangent circle `101`. It belongs to route `1001`. Path segment `974920` has length 0.483, runs from (10.85, 30.10) to (12.10, 31.60), is in `failed` status, and connects tangent circle `102` within route `1002`. Path segment `2933482` has length 1.05, runs from (12.80, 34.80) to (14.80, 35.80), is `planned`, connects tangent circle `103`, and belongs to route `1003`.

The `tangent_circle_id` and `connects_end_tangent_circle_id` columns indicate which tangent circles anchor the start and end of each segment. The `route_id` foreign key assigns each segment to a route. The `routes_segments` junction table provides an additional mapping layer between routes and their constituent segments.

## Routes: Assembled Trajectories

Routes represent complete planned trajectories assembled from path segments. Each route has a unique identifier (numeric or UUID), a status (`generated`, `approved`, `executing`, or `completed`), a total length, a generation timestamp, and a flag indicating whether the route is steering-compliant.

**Table `routes`**

| id | route_id | route_status | total_length | generation_time | steering_compliant | zone_id | checkpoint_id | ends_at_checkpoint_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 1996928 | generated | 3.9057753239209303 | 2025-08-07T07:33:00 | false | 1 | 21956270 | 21956270 |
| 1001 | 6926358 | approved | 5.0 | 2022-01-18T14:50:00 | true | 2 | 195341 | 195341 |
| 1002 | 82869 | executing | 0.01999998 | 2023-06-02T21:07:00 | false | 3 | 3158149 | 3158149 |
| 1003 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | completed | 38.20000118679471 | 2024-11-13T04:24:00 | true | 4 | 974918 | 974918 |

Route `1996928` has status `generated`, total length approximately 3.91, was generated on 2025-08-07, is not steering-compliant, and is associated with zone `1` and checkpoint `21956270`. Route `6926358` has status `approved`, total length 5.0, was generated on 2022-01-18, is steering-compliant, and is associated with zone `2` and checkpoint `195341`. Route `82869` has status `executing`, total length approximately 0.02, was generated on 2023-06-02, is not steering-compliant, and is associated with zone `3` and checkpoint `3158149`. Route `b10c758c-8fcd-11eb-924d-9cd76263cbd0` has status `completed`, total length approximately 38.20, was generated on 2024-11-13, is steering-compliant, and is associated with zone `4` and checkpoint `974918`.

The `zone_id` and `checkpoint_id` columns in the routes table anchor each route to its operational zone and starting checkpoint. The `ends_at_checkpoint_id` column identifies the terminal checkpoint of the route.

## Checkpoints: Waypoints and Milestones

Checkpoints are waypoints that mark significant positions along routes. They are classified by type: `entry`, `exit`, `parking`, and `destination`. Each checkpoint has Cartesian coordinates, a status (`pending`, `reached`, or `missed`), and associations with zones and routes.

**Table `checkpoints`**

| checkpoint_id | checkpoint_type | checkpoint_x | checkpoint_y | checkpoint_status | zone_id | route_id | serves_as_end_for_route_id |
|---|---|---|---|---|---|---|---|
| 21956270 | entry | 22.95 | 19.95 | pending | 1 | 1000 | 1000 |
| 195341 | exit | 26.90 | 23.90 | reached | 2 | 1001 | 1001 |
| 3158149 | parking | 30.85 | 27.85 | missed | 3 | 1002 | 1002 |
| 974918 | destination | 34.80 | 31.80 | pending | 4 | 1003 | 1003 |

Checkpoint `21956270` is an `entry` type at (22.95, 19.95) with `pending` status, located in zone `1` and serving route `1000`. It also serves as the end point for route `1000`. Checkpoint `195341` is an `exit` type at (26.90, 23.90) with `reached` status, in zone `2` and serving route `1001`. Checkpoint `3158149` is a `parking` type at (30.85, 27.85) with `missed` status, in zone `3` and serving route `1002`. Checkpoint `974918` is a `destination` type at (34.80, 31.80) with `pending` status, in zone `4` and serving route `1003`.

The `zone_id` column anchors each checkpoint to its parent zone, while `route_id` and `serves_as_end_for_route_id` establish the checkpoint's role within route execution.

## Vehicles and Their Operational Context

The `vehicles` table records the autonomous agents operating within the navigation system. Vehicles are linked to routes they are assigned to traverse and to obstacles they are currently monitoring or avoiding. The `vehicles_obstacles` junction table captures the real-time proximity relationships between vehicles and obstacles, enabling the system to trigger avoidance maneuvers when necessary.

**Table `vehicles`**

| id | vehicle_id | vehicle_model | min_turning_radius | current_x | current_y | current_heading | vehicle_status | route_id | zone_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 5917273 | compact-vehicle-80 | 20.70 | 6.70 | 11.95 | 11.95 | idle | 1000 | 1 |
| 2 | ptchol | composite-vehicle-81 | 25.40 | 8.40 | 15.90 | 14.90 | planning | 1001 | 2 |
| 3 | m09 | primary-vehicle-82 | 30.10 | 10.10 | 19.85 | 17.85 | navigating | 1002 | 3 |
| 4 | 3158135 | adaptive-vehicle-83 | 34.80 | 11.80 | 23.80 | 20.80 | parked | 1003 | 4 |

## Junction Tables: Explicit Relationship Records

The navigation model uses junction tables to manage many-to-many relationships between entities. The `zones_obstacles` table records which obstacles are present in which zones, complementing the `zone_id` foreign key in the `obstacles` table. The `obstacles_circles` table records which tangent circles are associated with which obstacles, complementing the `obstacle_id` foreign key in `tangent_circles`. The `circles_segments` table records which tangent circles are used by which path segments, complementing the `tangent_circle_id` and `connects_end_tangent_circle_id` foreign keys in `path_segments`. The `routes_segments` table records which path segments belong to which routes, complementing the `route_id` foreign key in `path_segments`. The `vehicles_obstacles` table records which vehicles are monitoring which obstacles.

**Table `zones_obstacles`**

| zone_id | obstacle_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |
**Table `obstacles_circles`**

| obstacle_id | tangent_circle_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |
**Table `circles_segments`**

| tangent_circle_id | path_segment_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |
**Table `routes_segments`**

| route_id | path_segment_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |
**Table `vehicles_obstacles`**

| vehicle_id | obstacle_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

## View: v_zone_obstacle_detail

The view `v_zone_obstacle_detail` joins zones with their associated obstacles, answering the question: "Which obstacles are present in each zone, and what are their characteristics?" This view is essential for zone-level situational awareness.

**View `v_zone_obstacle_detail`**

```sql
CREATE VIEW v_zone_obstacle_detail AS
SELECT a.id, a.zone_identifier, a.zone_length, b.obstacle_id AS obstacle_obstacle_id, b.obstacle_type AS obstacle_obstacle_type, b.obstacle_x AS obstacle_obstacle_x
FROM zones a
  JOIN zones_obstacles j ON j.zone_id = a.id
  JOIN obstacles b ON b.obstacle_id = j.obstacle_id;
```

| id | zone_identifier | zone_length | obstacle_obstacle_id | obstacle_obstacle_type | obstacle_obstacle_x |
|---|---|---|---|---|---|
| 1 | ZON-2258 | 0.6000001 | 1 | island | 12.70 |
| 1 | ZON-2258 | 0.6000001 | 2 | parking_line | 15.40 |
| 2 | ZON-2263 | 0.6 | 2 | parking_line | 15.40 |
| 2 | ZON-2263 | 0.6 | 3 | cul_de_sac | 18.10 |
| 3 | ZON-2268 | 0.58 | 3 | cul_de_sac | 18.10 |
| 3 | ZON-2268 | 0.58 | 4 | vehicle | 20.80 |
| 4 | ZON-2273 | 0.77 | 4 | vehicle | 20.80 |
| 4 | ZON-2273 | 0.77 | 1 | island | 12.70 |

Reading a concrete row from this view: zone `ZON-2258` (zone `id` 1) contains obstacle `1`, which is an `island` at coordinates (12.70, 7.95) with radius 8.20 and status `sensed`. Zone `ZON-2263` (zone `id` 2) contains obstacle `2`, a `parking_line` at (15.40, 11.90) with radius 12.40 and status `mapped`. This join enables operators to assess the obstacle density and types within any given zone.

## View: v_zone_checkpoint

The view `v_zone_checkpoint` joins zones with their associated checkpoints, answering: "Which checkpoints are located within each zone, and what is their current status?" This supports checkpoint management and route planning.

**View `v_zone_checkpoint`**

```sql
CREATE VIEW v_zone_checkpoint AS
SELECT a.id, a.zone_identifier, a.zone_length, a.zone_width, b.checkpoint_id AS checkpoint_checkpoint_id, b.checkpoint_type AS checkpoint_checkpoint_type, b.checkpoint_x AS checkpoint_checkpoint_x
FROM zones a JOIN checkpoints b ON a.checkpoint_id = b.checkpoint_id;
```

| id | zone_identifier | zone_length | zone_width | checkpoint_checkpoint_id | checkpoint_checkpoint_type | checkpoint_checkpoint_x |
|---|---|---|---|---|---|---|
| 1 | ZON-2258 | 0.6000001 | 0.50102748 | 21956270 | entry | 22.95 |
| 2 | ZON-2263 | 0.6 | 1.24 | 195341 | exit | 26.90 |
| 3 | ZON-2268 | 0.58 | 0.51 | 3158149 | parking | 30.85 |
| 4 | ZON-2273 | 0.77 | 0.99 | 974918 | destination | 34.80 |

A representative row shows zone `ZON-2258` (zone `id` 1) containing checkpoint `21956270`, which is of type `entry`, located at (22.95, 19.95), with status `pending`, and serving route `1000`. Zone `ZON-2263` (zone `id` 2) contains checkpoint `195341`, an `exit` type at (26.90, 23.90) with status `reached`, serving route `1001`.

## View: v_obstacle_zone

The view `v_obstacle_zone` joins obstacles with their parent zones, answering: "Which zone does each obstacle belong to, and what is the zone's operational status?" This provides obstacle-centric zone context.

**View `v_obstacle_zone`**

```sql
CREATE VIEW v_obstacle_zone AS
SELECT a.obstacle_id, a.obstacle_type, a.obstacle_x, a.obstacle_y, b.id AS zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_length AS zone_zone_length
FROM obstacles a JOIN zones b ON a.zone_id = b.id;
```

| obstacle_id | obstacle_type | obstacle_x | obstacle_y | zone_id | zone_zone_identifier | zone_zone_length |
|---|---|---|---|---|---|---|
| 1 | island | 12.70 | 7.95 | 1 | ZON-2258 | 0.6000001 |
| 2 | parking_line | 15.40 | 11.90 | 2 | ZON-2263 | 0.6 |
| 3 | cul_de_sac | 18.10 | 15.85 | 3 | ZON-2268 | 0.58 |
| 4 | vehicle | 20.80 | 19.80 | 4 | ZON-2273 | 0.77 |

A row from this view reveals that obstacle `1` (an `island` at 12.70, 7.95) belongs to zone `ZON-2258`, which has status `active` and elevation label `baseline-zone-97`. Obstacle `3` (a `cul_de_sac` at 18.10, 15.85) belongs to zone `ZON-2268`, which has status `completed` and elevation label `extended-zone-99`.

## View: v_obstacle_tangent_circle_detail

The view `v_obstacle_tangent_circle_detail` joins obstacles with their tangent circles, answering: "What geometric proxies have been computed for each obstacle?" This is critical for path planning verification.

**View `v_obstacle_tangent_circle_detail`**

```sql
CREATE VIEW v_obstacle_tangent_circle_detail AS
SELECT a.obstacle_id, a.obstacle_type, a.obstacle_x, b.id AS circle_id, b.circle_id AS circle_circle_id, b.circle_radius AS circle_circle_radius
FROM obstacles a
  JOIN obstacles_circles j ON j.obstacle_id = a.obstacle_id
  JOIN tangent_circles b ON b.id = j.tangent_circle_id;
```

| obstacle_id | obstacle_type | obstacle_x | circle_id | circle_circle_id | circle_circle_radius |
|---|---|---|---|---|---|
| 1 | island | 12.70 | 100 | 338542 | 14.95 |
| 1 | island | 12.70 | 101 | 3012829 | 18.90 |
| 2 | parking_line | 15.40 | 101 | 3012829 | 18.90 |
| 2 | parking_line | 15.40 | 102 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 22.85 |
| 3 | cul_de_sac | 18.10 | 102 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 22.85 |
| 3 | cul_de_sac | 18.10 | 103 | 10238265 | 26.80 |
| 4 | vehicle | 20.80 | 103 | 10238265 | 26.80 |
| 4 | vehicle | 20.80 | 100 | 338542 | 14.95 |

A representative row shows obstacle `1` (an `island`) paired with tangent circle `338542`, which has radius 14.95, center at (4.70, 5.45), and curvature 3.70. Obstacle `4` (a `vehicle`) is paired with tangent circle `10238265`, which has radius 26.80, center at (18.80, 12.80), and curvature 11.80. The increasing radii and curvatures across obstacles reflect the system's adaptive sizing of avoidance geometry.

## View: v_tangent_circle_obstacle

The view `v_tangent_circle_obstacle` joins tangent circles with their parent obstacles, answering: "Which obstacle does each tangent circle represent?" This is the inverse perspective of `v_obstacle_tangent_circle_detail`.

**View `v_tangent_circle_obstacle`**

```sql
CREATE VIEW v_tangent_circle_obstacle AS
SELECT a.id, a.circle_id, a.circle_radius, a.circle_center_x, b.obstacle_id AS obstacle_obstacle_id, b.obstacle_type AS obstacle_obstacle_type, b.obstacle_x AS obstacle_obstacle_x
FROM tangent_circles a JOIN obstacles b ON a.obstacle_id = b.obstacle_id;
```

| id | circle_id | circle_radius | circle_center_x | obstacle_obstacle_id | obstacle_obstacle_type | obstacle_obstacle_x |
|---|---|---|---|---|---|---|
| 100 | 338542 | 14.95 | 4.70 | 1 | island | 12.70 |
| 101 | 3012829 | 18.90 | 9.40 | 2 | parking_line | 15.40 |
| 102 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 22.85 | 14.10 | 3 | cul_de_sac | 18.10 |
| 103 | 10238265 | 26.80 | 18.80 | 4 | vehicle | 20.80 |

A row from this view shows tangent circle `338542` (radius 14.95, curvature 3.70) representing obstacle `1`, an `island` at (12.70, 7.95) with status `sensed`. Tangent circle `054cac68-8fc7-11eb-924d-9cd76263cbd0` (radius 22.85, curvature 9.10) represents obstacle `3`, a `cul_de_sac` at (18.10, 15.85) with status `avoided`.

## View: v_tangent_circle_path_segment_detail

The view `v_tangent_circle_path_segment_detail` joins tangent circles with the path segments that use them, answering: "Which path segments are anchored by each tangent circle?" This supports trajectory analysis.

**View `v_tangent_circle_path_segment_detail`**

```sql
CREATE VIEW v_tangent_circle_path_segment_detail AS
SELECT a.id, a.circle_id, a.circle_radius, b.path_segment_id AS segment_path_segment_id, b.segment_id AS segment_segment_id, b.segment_length AS segment_segment_length
FROM tangent_circles a
  JOIN circles_segments j ON j.tangent_circle_id = a.id
  JOIN path_segments b ON b.path_segment_id = j.path_segment_id;
```

| id | circle_id | circle_radius | segment_path_segment_id | segment_segment_id | segment_segment_length |
|---|---|---|---|---|---|
| 100 | 338542 | 14.95 | 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.52 |
| 100 | 338542 | 14.95 | 2 | 32825 | 0.77 |
| 101 | 3012829 | 18.90 | 2 | 32825 | 0.77 |
| 101 | 3012829 | 18.90 | 3 | 974920 | 0.4827489 |
| 102 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 22.85 | 3 | 974920 | 0.4827489 |
| 102 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 22.85 | 4 | 2933482 | 1.05 |
| 103 | 10238265 | 26.80 | 4 | 2933482 | 1.05 |
| 103 | 10238265 | 26.80 | 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.52 |

A representative row shows tangent circle `338542` (radius 14.95, curvature 3.70) being used by path segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0`, which has length 0.52, runs from (6.95, 20.70) to (6.70, 23.20), is in `planned` status, and belongs to route `1000`. Tangent circle `10238265` (radius 26.80, curvature 11.80) is used by path segment `2933482`, which has length 1.05, runs from (12.80, 34.80) to (14.80, 35.80), is `planned`, and belongs to route `1003`.

## View: v_path_segment_tangent_circle

The view `v_path_segment_tangent_circle` joins path segments with their tangent circles, answering: "What tangent circle anchors each end of a path segment?" This provides segment-centric geometric context.

**View `v_path_segment_tangent_circle`**

```sql
CREATE VIEW v_path_segment_tangent_circle AS
SELECT a.path_segment_id, a.segment_id, a.segment_length, a.segment_start_x, b.id AS circle_id, b.circle_id AS circle_circle_id, b.circle_radius AS circle_circle_radius
FROM path_segments a JOIN tangent_circles b ON a.tangent_circle_id = b.id;
```

| path_segment_id | segment_id | segment_length | segment_start_x | circle_id | circle_circle_id | circle_circle_radius |
|---|---|---|---|---|---|---|
| 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.52 | 6.95 | 100 | 338542 | 14.95 |
| 2 | 32825 | 0.77 | 8.90 | 101 | 3012829 | 18.90 |
| 3 | 974920 | 0.4827489 | 10.85 | 102 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 22.85 |
| 4 | 2933482 | 1.05 | 12.80 | 103 | 10238265 | 26.80 |

A row from this view shows path segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` (length 0.52, status `planned`) anchored by tangent circle `338542` (radius 14.95, curvature 3.70). Path segment `32825` (length 0.77, status `executed`) is anchored by tangent circle `3012829` (radius 18.90, curvature 6.40).

## View: v_path_segment_route

The view `v_path_segment_route` joins path segments with their parent routes, answering: "Which route does each path segment belong to, and what is the route's status?" This supports route-level segment tracking.

**View `v_path_segment_route`**

```sql
CREATE VIEW v_path_segment_route AS
SELECT a.path_segment_id, a.segment_id, a.segment_length, a.segment_start_x, b.id AS route_id, b.route_id AS route_route_id, b.route_status AS route_route_status
FROM path_segments a JOIN routes b ON a.route_id = b.id;
```

| path_segment_id | segment_id | segment_length | segment_start_x | route_id | route_route_id | route_route_status |
|---|---|---|---|---|---|---|
| 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.52 | 6.95 | 1000 | 1996928 | generated |
| 2 | 32825 | 0.77 | 8.90 | 1001 | 6926358 | approved |
| 3 | 974920 | 0.4827489 | 10.85 | 1002 | 82869 | executing |
| 4 | 2933482 | 1.05 | 12.80 | 1003 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | completed |

A representative row shows path segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` (length 0.52, status `planned`) belonging to route `1996928`, which has status `generated`, total length approximately 3.91, and is not steering-compliant. Path segment `32825` (length 0.77, status `executed`) belongs to route `6926358`, which has status `approved`, total length 5.0, and is steering-compliant.

## View: v_route_path_segment_detail

The view `v_route_path_segment_detail` joins routes with their constituent path segments, answering: "What are the path segments that compose each route?" This is essential for route decomposition and analysis.

**View `v_route_path_segment_detail`**

```sql
CREATE VIEW v_route_path_segment_detail AS
SELECT a.id, a.route_id, a.route_status, b.path_segment_id AS segment_path_segment_id, b.segment_id AS segment_segment_id, b.segment_length AS segment_segment_length
FROM routes a
  JOIN routes_segments j ON j.route_id = a.id
  JOIN path_segments b ON b.path_segment_id = j.path_segment_id;
```

| id | route_id | route_status | segment_path_segment_id | segment_segment_id | segment_segment_length |
|---|---|---|---|---|---|
| 1000 | 1996928 | generated | 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.52 |
| 1000 | 1996928 | generated | 2 | 32825 | 0.77 |
| 1001 | 6926358 | approved | 2 | 32825 | 0.77 |
| 1001 | 6926358 | approved | 3 | 974920 | 0.4827489 |
| 1002 | 82869 | executing | 3 | 974920 | 0.4827489 |
| 1002 | 82869 | executing | 4 | 2933482 | 1.05 |
| 1003 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | completed | 4 | 2933482 | 1.05 |
| 1003 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | completed | 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.52 |

A row from this view shows route `1996928` (status `generated`, total length 3.91, not steering-compliant) containing path segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` (length 0.52, status `planned`, running from 6.95, 20.70 to 6.70, 23.20). Route `b10c758c-8fcd-11eb-924d-9cd76263cbd0` (status `completed`, total length 38.20, steering-compliant) contains path segment `2933482` (length 1.05, status `planned`, running from 12.80, 34.80 to 14.80, 35.80).

## View: v_route_zone

The view `v_route_zone` joins routes with their parent zones, answering: "Which zone does each route operate within?" This provides route-level zone context.

**View `v_route_zone`**

```sql
CREATE VIEW v_route_zone AS
SELECT a.id, a.route_id, a.route_status, a.total_length, b.id AS zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_length AS zone_zone_length
FROM routes a JOIN zones b ON a.zone_id = b.id;
```

| id | route_id | route_status | total_length | zone_id | zone_zone_identifier | zone_zone_length |
|---|---|---|---|---|---|---|
| 1000 | 1996928 | generated | 3.9057753239209303 | 1 | ZON-2258 | 0.6000001 |
| 1001 | 6926358 | approved | 5.0 | 2 | ZON-2263 | 0.6 |
| 1002 | 82869 | executing | 0.01999998 | 3 | ZON-2268 | 0.58 |
| 1003 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | completed | 38.20000118679471 | 4 | ZON-2273 | 0.77 |

A representative row shows route `1996928` (status `generated`, total length 3.91) operating within zone `ZON-2258` (status `active`, elevation `baseline-zone-97`). Route `b10c758c-8fcd-11eb-924d-9cd76263cbd0` (status `completed`, total length 38.20) operates within zone `ZON-2273` (status `active`, elevation `integrated-zone-100`).

## View: v_route_checkpoint

The view `v_route_checkpoint` joins routes with their associated checkpoints, answering: "Which checkpoints are associated with each route?" This supports route execution tracking.

**View `v_route_checkpoint`**

```sql
CREATE VIEW v_route_checkpoint AS
SELECT a.id, a.route_id, a.route_status, a.total_length, b.checkpoint_id AS checkpoint_checkpoint_id, b.checkpoint_type AS checkpoint_checkpoint_type, b.checkpoint_x AS checkpoint_checkpoint_x
FROM routes a JOIN checkpoints b ON a.checkpoint_id = b.checkpoint_id;
```

| id | route_id | route_status | total_length | checkpoint_checkpoint_id | checkpoint_checkpoint_type | checkpoint_checkpoint_x |
|---|---|---|---|---|---|---|
| 1000 | 1996928 | generated | 3.9057753239209303 | 21956270 | entry | 22.95 |
| 1001 | 6926358 | approved | 5.0 | 195341 | exit | 26.90 |
| 1002 | 82869 | executing | 0.01999998 | 3158149 | parking | 30.85 |
| 1003 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | completed | 38.20000118679471 | 974918 | destination | 34.80 |

A row from this view shows route `1996928` (status `generated`) associated with checkpoint `21956270` (type `entry`, status `pending`, at 22.95, 19.95). Route `6926358` (status `approved`) is associated with checkpoint `195341` (type `exit`, status `reached`, at 26.90, 23.90).

## View: v_checkpoint_zone

The view `v_checkpoint_zone` joins checkpoints with their parent zones, answering: "Which zone contains each checkpoint?" This provides checkpoint-centric zone context.

**View `v_checkpoint_zone`**

```sql
CREATE VIEW v_checkpoint_zone AS
SELECT a.checkpoint_id, a.checkpoint_type, a.checkpoint_x, a.checkpoint_y, b.id AS zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_length AS zone_zone_length
FROM checkpoints a JOIN zones b ON a.zone_id = b.id;
```

| checkpoint_id | checkpoint_type | checkpoint_x | checkpoint_y | zone_id | zone_zone_identifier | zone_zone_length |
|---|---|---|---|---|---|---|
| 21956270 | entry | 22.95 | 19.95 | 1 | ZON-2258 | 0.6000001 |
| 195341 | exit | 26.90 | 23.90 | 2 | ZON-2263 | 0.6 |
| 3158149 | parking | 30.85 | 27.85 | 3 | ZON-2268 | 0.58 |
| 974918 | destination | 34.80 | 31.80 | 4 | ZON-2273 | 0.77 |

A representative row shows checkpoint `21956270` (type `entry`, status `pending`, at 22.95, 19.95) located in zone `ZON-2258` (status `active`, elevation `baseline-zone-97`). Checkpoint `974918` (type `destination`, status `pending`, at 34.80, 31.80) is located in zone `ZON-2273` (status `active`, elevation `integrated-zone-100`).

## View: v_checkpoint_route

The view `v_checkpoint_route` joins checkpoints with their associated routes, answering: "Which route does each checkpoint serve?" This supports route planning and execution.

**View `v_checkpoint_route`**

```sql
CREATE VIEW v_checkpoint_route AS
SELECT a.checkpoint_id, a.checkpoint_type, a.checkpoint_x, a.checkpoint_y, b.id AS route_id, b.route_id AS route_route_id, b.route_status AS route_route_status
FROM checkpoints a JOIN routes b ON a.route_id = b.id;
```

| checkpoint_id | checkpoint_type | checkpoint_x | checkpoint_y | route_id | route_route_id | route_route_status |
|---|---|---|---|---|---|---|
| 21956270 | entry | 22.95 | 19.95 | 1000 | 1996928 | generated |
| 195341 | exit | 26.90 | 23.90 | 1001 | 6926358 | approved |
| 3158149 | parking | 30.85 | 27.85 | 1002 | 82869 | executing |
| 974918 | destination | 34.80 | 31.80 | 1003 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | completed |

A row from this view shows checkpoint `21956270` (type `entry`, status `pending`) serving route `1996928` (status `generated`, total length 3.91). Checkpoint `195341` (type `exit`, status `reached`) serves route `6926358` (status `approved`, total length 5.0).

## View: v_vehicle_route

The view `v_vehicle_route` joins vehicles with their assigned routes, answering: "Which route is each vehicle assigned to, and what is the route's status?" This is essential for fleet management.

**View `v_vehicle_route`**

```sql
CREATE VIEW v_vehicle_route AS
SELECT a.id, a.vehicle_id, a.vehicle_model, a.min_turning_radius, b.id AS route_id, b.route_id AS route_route_id, b.route_status AS route_route_status
FROM vehicles a JOIN routes b ON a.route_id = b.id;
```

| id | vehicle_id | vehicle_model | min_turning_radius | route_id | route_route_id | route_route_status |
|---|---|---|---|---|---|---|
| 1 | 5917273 | compact-vehicle-80 | 20.70 | 1000 | 1996928 | generated |
| 2 | ptchol | composite-vehicle-81 | 25.40 | 1001 | 6926358 | approved |
| 3 | m09 | primary-vehicle-82 | 30.10 | 1002 | 82869 | executing |
| 4 | 3158135 | adaptive-vehicle-83 | 34.80 | 1003 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | completed |

A representative row shows a vehicle assigned to route `1996928` (status `generated`, total length 3.91, not steering-compliant). Another row shows a vehicle assigned to route `b10c758c-8fcd-11eb-924d-9cd76263cbd0` (status `completed`, total length 38.20, steering-compliant).

## View: v_vehicle_obstacle_detail

The view `v_vehicle_obstacle_detail` joins vehicles with the obstacles they are monitoring, answering: "Which obstacles is each vehicle currently tracking?" This supports real-time proximity management.

**View `v_vehicle_obstacle_detail`**

```sql
CREATE VIEW v_vehicle_obstacle_detail AS
SELECT a.id, a.vehicle_id, a.vehicle_model, b.obstacle_id AS obstacle_obstacle_id, b.obstacle_type AS obstacle_obstacle_type, b.obstacle_x AS obstacle_obstacle_x
FROM vehicles a
  JOIN vehicles_obstacles j ON j.vehicle_id = a.id
  JOIN obstacles b ON b.obstacle_id = j.obstacle_id;
```

| id | vehicle_id | vehicle_model | obstacle_obstacle_id | obstacle_obstacle_type | obstacle_obstacle_x |
|---|---|---|---|---|---|
| 1 | 5917273 | compact-vehicle-80 | 1 | island | 12.70 |
| 1 | 5917273 | compact-vehicle-80 | 2 | parking_line | 15.40 |
| 2 | ptchol | composite-vehicle-81 | 2 | parking_line | 15.40 |
| 2 | ptchol | composite-vehicle-81 | 3 | cul_de_sac | 18.10 |
| 3 | m09 | primary-vehicle-82 | 3 | cul_de_sac | 18.10 |
| 3 | m09 | primary-vehicle-82 | 4 | vehicle | 20.80 |
| 4 | 3158135 | adaptive-vehicle-83 | 4 | vehicle | 20.80 |
| 4 | 3158135 | adaptive-vehicle-83 | 1 | island | 12.70 |

A row from this view shows a vehicle monitoring obstacle `1` (an `island` at 12.70, 7.95, radius 8.20, status `sensed`). Another row shows a vehicle monitoring obstacle `3` (a `cul_de_sac` at 18.10, 15.85, radius 16.60, status `avoided`).

## View: v_vehicle_zone

The view `v_vehicle_zone` joins vehicles with the zones they are operating in, answering: "Which zone is each vehicle currently in?" This provides fleet-level situational awareness.

**View `v_vehicle_zone`**

```sql
CREATE VIEW v_vehicle_zone AS
SELECT a.id, a.vehicle_id, a.vehicle_model, a.min_turning_radius, b.id AS zone_id, b.zone_identifier AS zone_zone_identifier, b.zone_length AS zone_zone_length
FROM vehicles a JOIN zones b ON a.zone_id = b.id;
```

| id | vehicle_id | vehicle_model | min_turning_radius | zone_id | zone_zone_identifier | zone_zone_length |
|---|---|---|---|---|---|---|
| 1 | 5917273 | compact-vehicle-80 | 20.70 | 1 | ZON-2258 | 0.6000001 |
| 2 | ptchol | composite-vehicle-81 | 25.40 | 2 | ZON-2263 | 0.6 |
| 3 | m09 | primary-vehicle-82 | 30.10 | 3 | ZON-2268 | 0.58 |
| 4 | 3158135 | adaptive-vehicle-83 | 34.80 | 4 | ZON-2273 | 0.77 |

A representative row shows a vehicle operating in zone `ZON-2258` (status `active`, elevation `baseline-zone-97`). Another row shows a vehicle operating in zone `ZON-2273` (status `active`, elevation `integrated-zone-100`).

## Closing Synthesis

The autonomous navigation data model presents a coherent hierarchy: zones contain obstacles; obstacles are characterized by tangent circles; tangent circles anchor path segments; path segments compose routes; routes pass through checkpoints; and vehicles traverse routes while monitoring obstacles. The junction tables and views provide multiple perspectives on this hierarchy, enabling operators to query the system from any entity's viewpoint. Concrete records—zone `ZON-2258` with its `island` obstacle, route `b10c758c-8fcd-11eb-924d-9cd76263cbd0` with its completed status and steering compliance, checkpoint `195341` with its `reached` status—demonstrate the model's capacity to capture both the static geometry of the operational environment and the dynamic state of vehicle operations.