The domain under examination is a spatial navigation and path-planning system for autonomous vehicles operating within structured zones. At its core, the model captures how geometric regions (`zones`) contain obstacles, how those obstacles are approximated by tangent circles, how path segments connect through those circles, and how routes assemble segments into traversable plans that vehicles execute. The relational schema materializes this ontology through a combination of entity tables, junction tables for many-to-many relationships, and denormalized views that reconstruct domain facts for reporting and analysis.

## Spatial Zones and Their Obstacles

The foundational entity is the zone, a bounded spatial region with measurable dimensions and a lifecycle status. The `zones` table stores each zone's identifier, physical extent, and administrative state.

**Table `zones`**

| id | zone_identifier | zone_length | zone_width | zone_elevation | zone_status | checkpoint_id | has_exit_point_checkpoint_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ZON-2258 | 0.6000001 | 0.50102748 | baseline-zone-97 | active | 21956270 | 21956270 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | ZON-2263 | 0.6 | 1.24 | pilot-zone-98 | inactive | 195341 | 195341 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | ZON-2268 | 0.58 | 0.51 | extended-zone-99 | completed | 3158149 | 3158149 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | ZON-2273 | 0.77 | 0.99 | integrated-zone-100 | active | 974918 | 974918 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

A zone such as `ZON-2258` spans 0.6 units in length and 0.5 units in width at a baseline elevation, carrying the status `active`. Zones progress through statuses like `active`, `inactive`, and `completed`, and each carries timestamps (`created_at`, `updated_at`) that record when the zone was provisioned and last modified. The `checkpoint_id` and `has_exit_point_checkpoint_id` columns embed foreign keys into the `checkpoints` table, anchoring each zone to its entry and exit waypoints.

Obstacles inhabit zones as physical or virtual impediments. The `obstacles` table records each obstacle's type, Cartesian coordinates, radius, and status.

**Table `obstacles`**

| obstacle_id | obstacle_type | obstacle_x | obstacle_y | obstacle_radius | obstacle_status | zone_id |
|---|---|---|---|---|---|---|
| 1 | island | 12.70 | 7.95 | 8.20 | sensed | 1 |
| 2 | parking_line | 15.40 | 11.90 | 12.40 | mapped | 2 |
| 3 | cul_de_sac | 18.10 | 15.85 | 16.60 | avoided | 3 |
| 4 | vehicle | 20.80 | 19.80 | 20.80 | sensed | 4 |

An obstacle of type `island` sits at coordinates (12.70, 7.95) with a radius of 8.20 units and carries the status `sensed`. Other obstacle types include `parking_line`, `cul_de_sac`, and `vehicle`, each with statuses such as `mapped`, `avoided`, and `sensed`. The `zone_id` column is a foreign key linking the obstacle to its parent zone — for instance, the `island` obstacle belongs to zone 1 (`ZON-2258`).

The many-to-many relationship between zones and obstacles is materialized through the junction table `zones_obstacles`, which decouples the association so that a single zone may contain multiple obstacles and a single obstacle may be referenced by multiple zones.

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

## Tangent Circles and Geometric Approximation

Tangent circles serve as geometric intermediaries between obstacles and navigable path segments. Each tangent circle is defined by its center coordinates, radius, and curvature, and is associated with a specific obstacle.

**Table `tangent_circles`**

| id | circle_id | circle_radius | circle_center_x | circle_center_y | circle_curvature | obstacle_id |
|---|---|---|---|---|---|---|
| 100 | 338542 | 14.95 | 4.70 | 5.45 | 3.70 | 1 |
| 101 | 3012829 | 18.90 | 9.40 | 7.90 | 6.40 | 2 |
| 102 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 22.85 | 14.10 | 10.35 | 9.10 | 3 |
| 103 | 10238265 | 26.80 | 18.80 | 12.80 | 11.80 | 4 |

Circle `338542` has a radius of 14.95, is centered at (4.70, 5.45), and exhibits a curvature of 3.70. It is linked to obstacle 1 (the `island`). Circle identifiers follow mixed formats: short numeric strings like `338542`, longer numeric strings like `3012829`, and UUIDs such as `054cac68-8fc7-11eb-924d-9cd76263cbd0`. The `obstacle_id` column is a foreign key pointing to the `obstacles` table.

The `obstacles_circles` junction table captures the many-to-many relationship between obstacles and their tangent circles, allowing a single obstacle to be approximated by multiple circles and a circle to serve multiple obstacles.

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

## Path Segments and Route Assembly

Path segments are the atomic units of navigation. Each segment encodes a straight-line trajectory between two points in space, along with its status and its association with tangent circles and routes.

**Table `path_segments`**

| path_segment_id | segment_id | segment_length | segment_start_x | segment_start_y | segment_end_x | segment_end_y | segment_status | tangent_circle_id | connects_end_tangent_circle_id | route_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.52 | 6.95 | 20.70 | 6.70 | 23.20 | planned | 100 | 100 | 1000 |
| 2 | 32825 | 0.77 | 8.90 | 25.40 | 9.40 | 27.40 | executed | 101 | 101 | 1001 |
| 3 | 974920 | 0.4827489 | 10.85 | 30.10 | 12.10 | 31.60 | failed | 102 | 102 | 1002 |
| 4 | 2933482 | 1.05 | 12.80 | 34.80 | 14.80 | 35.80 | planned | 103 | 103 | 1003 |

Segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` is 0.52 units long, runs from (6.95, 20.70) to (6.70, 23.20), carries the status `planned`, and is associated with tangent circle 100. The `tangent_circle_id` and `connects_end_tangent_circle_id` columns are both foreign keys into `tangent_circles`, enabling a segment to be bounded by two circles — one at its start and one at its end. The `route_id` column links the segment to its parent route.

Routes are higher-level constructs that aggregate path segments into complete traversals. The `routes` table stores each route's identifier, status, total length, generation timestamp, and compliance flag.

**Table `routes`**

| id | route_id | route_status | total_length | generation_time | steering_compliant | zone_id | checkpoint_id | ends_at_checkpoint_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 1996928 | generated | 3.9057753239209303 | 2025-08-07T07:33:00 | false | 1 | 21956270 | 21956270 |
| 1001 | 6926358 | approved | 5.0 | 2022-01-18T14:50:00 | true | 2 | 195341 | 195341 |
| 1002 | 82869 | executing | 0.01999998 | 2023-06-02T21:07:00 | false | 3 | 3158149 | 3158149 |
| 1003 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | completed | 38.20000118679471 | 2024-11-13T04:24:00 | true | 4 | 974918 | 974918 |

Route `1996928` has a total length of approximately 3.91 units, was generated on 2025-08-07, is marked as non-compliant with steering constraints (`steering_compliant = false`), and belongs to zone 1. Routes carry statuses such as `generated`, `approved`, `executing`, and `completed`. The `zone_id`, `checkpoint_id`, and `ends_at_checkpoint_id` columns are foreign keys into `zones` and `checkpoints`, respectively.

The `routes_segments` junction table materializes the many-to-many relationship between routes and path segments, allowing segments to be shared across routes and routes to contain multiple segments.

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

## Checkpoints as Waypoints

Checkpoints are waypoints that mark entry, exit, parking, and destination points within zones. The `checkpoints` table records each checkpoint's type, coordinates, status, and its associations.

**Table `checkpoints`**

| checkpoint_id | checkpoint_type | checkpoint_x | checkpoint_y | checkpoint_status | zone_id | route_id | serves_as_end_for_route_id |
|---|---|---|---|---|---|---|---|
| 21956270 | entry | 22.95 | 19.95 | pending | 1 | 1000 | 1000 |
| 195341 | exit | 26.90 | 23.90 | reached | 2 | 1001 | 1001 |
| 3158149 | parking | 30.85 | 27.85 | missed | 3 | 1002 | 1002 |
| 974918 | destination | 34.80 | 31.80 | pending | 4 | 1003 | 1003 |

Checkpoint `21956270` is of type `entry`, located at (22.95, 19.95), carries the status `pending`, and is associated with zone 1 and route 1000. Other checkpoint types include `exit`, `parking`, and `destination`, with statuses such as `reached`, `missed`, and `pending`. The `zone_id`, `route_id`, and `serves_as_end_for_route_id` columns are foreign keys into `zones` and `routes`.

## Vehicles and Their Obstacle Encounters

The `vehicles` table represents the autonomous agents operating within the system.

**Table `vehicles`**

| id | vehicle_id | vehicle_model | min_turning_radius | current_x | current_y | current_heading | vehicle_status | route_id | zone_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 5917273 | compact-vehicle-80 | 20.70 | 6.70 | 11.95 | 11.95 | idle | 1000 | 1 |
| 2 | ptchol | composite-vehicle-81 | 25.40 | 8.40 | 15.90 | 14.90 | planning | 1001 | 2 |
| 3 | m09 | primary-vehicle-82 | 30.10 | 10.10 | 19.85 | 17.85 | navigating | 1002 | 3 |
| 4 | 3158135 | adaptive-vehicle-83 | 34.80 | 11.80 | 23.80 | 20.80 | parked | 1003 | 4 |

The `vehicles_obstacles` junction table records encounters between vehicles and obstacles, materializing a many-to-many relationship that allows any vehicle to interact with any obstacle.

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

## Junction Tables and the Circles-Segments Relationship

The `circles_segments` junction table connects tangent circles to path segments, enabling a circle to participate in multiple segments and a segment to reference multiple circles.

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

## Denormalized Views

The schema includes a suite of views that join base and junction tables to reconstruct domain facts for analytical queries. Each view answers a specific question about the relationships between entities.

### Zone-Obstacle and Zone-Checkpoint Views

The view `v_zone_obstacle_detail` joins `zones` with `obstacles` through `zones_obstacles` to produce a detailed listing of every obstacle within every zone.

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

This view answers the question: "Which obstacles are in which zones, and what are their properties?" A row might show zone `ZON-2258` containing the `island` obstacle at (12.70, 7.95) with status `sensed`.

The view `v_zone_checkpoint` joins `zones` with `checkpoints` to reveal which checkpoints are associated with which zones.

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

A row from this view might pair zone `ZON-2258` with checkpoint `21956270` (type `entry`, status `pending`), answering the question: "Which checkpoints belong to which zones?"

### Obstacle-Centric Views

The view `v_obstacle_zone` inverts the zone-obstacle relationship, presenting obstacles alongside their parent zones.

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

This view answers: "Which zone does each obstacle belong to?" A row might show the `island` obstacle (type `island`, status `sensed`) as residing in zone `ZON-2258`.

The view `v_obstacle_tangent_circle_detail` joins `obstacles` with `tangent_circles` through `obstacles_circles` to show the geometric approximation of each obstacle.

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

This view answers: "What tangent circles approximate each obstacle?" A row might pair obstacle 1 (`island`) with circle `338542` (radius 14.95, curvature 3.70).

### Tangent Circle Views

The view `v_tangent_circle_obstacle` presents tangent circles alongside their associated obstacles.

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

This view answers: "Which obstacle does each tangent circle approximate?" A row might show circle `338542` (radius 14.95) approximating obstacle 1 (type `island`).

The view `v_tangent_circle_path_segment_detail` joins `tangent_circles` with `path_segments` through `circles_segments` to reveal which segments are bounded by which circles.

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

This view answers: "Which path segments are associated with which tangent circles?" A row might pair circle 100 (radius 14.95) with segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` (length 0.52, status `planned`).

### Path Segment Views

The view `v_path_segment_tangent_circle` presents path segments alongside their tangent circles.

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

This view answers: "Which tangent circle bounds each path segment?" A row might show segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` (status `planned`) bounded by circle 100 (radius 14.95).

The view `v_path_segment_route` joins `path_segments` with `routes` through `routes_segments` to show which route each segment belongs to.

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

This view answers: "Which route does each path segment belong to?" A row might pair segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` with route `1996928` (status `generated`, total length 3.91).

### Route Views

The view `v_route_path_segment_detail` joins `routes` with `path_segments` through `routes_segments` to produce a detailed listing of all segments within each route.

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

This view answers: "Which path segments compose each route, and what are their properties?" A row might show route `1996928` (status `generated`) containing segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` (length 0.52, status `planned`).

The view `v_route_zone` joins `routes` with `zones` to reveal which zone each route operates within.

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

This view answers: "In which zone does each route operate?" A row might pair route `1996928` (status `generated`) with zone `ZON-2258` (status `active`).

The view `v_route_checkpoint` joins `routes` with `checkpoints` to show which checkpoints are associated with each route.

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

This view answers: "Which checkpoints belong to each route?" A row might pair route `1996928` with checkpoint `21956270` (type `entry`, status `pending`).

### Checkpoint Views

The view `v_checkpoint_zone` joins `checkpoints` with `zones` to present checkpoints alongside their parent zones.

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

This view answers: "Which zone does each checkpoint belong to?" A row might show checkpoint `21956270` (type `entry`) as belonging to zone `ZON-2258`.

The view `v_checkpoint_route` joins `checkpoints` with `routes` to show which route each checkpoint serves.

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

This view answers: "Which route does each checkpoint serve?" A row might pair checkpoint `21956270` (type `entry`) with route `1996928` (status `generated`).

### Vehicle Views

The view `v_vehicle_route` joins `vehicles` with `routes` to reveal which routes each vehicle is assigned to.

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

This view answers: "Which routes is each vehicle assigned to?" A row might pair a vehicle with route `1996928` (status `generated`, total length 3.91).

The view `v_vehicle_obstacle_detail` joins `vehicles` with `obstacles` through `vehicles_obstacles` to produce a detailed listing of every obstacle encountered by each vehicle.

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

This view answers: "Which obstacles has each vehicle encountered, and what are their properties?" A row might show a vehicle encountering the `island` obstacle (type `island`, status `sensed`) at coordinates (12.70, 7.95).

The view `v_vehicle_zone` joins `vehicles` with `zones` to reveal which zones each vehicle operates within.

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

This view answers: "In which zones does each vehicle operate?" A row might pair a vehicle with zone `ZON-2258` (status `active`, length 0.6).

## Synthesis

The schema models a layered spatial navigation domain: zones contain obstacles, obstacles are approximated by tangent circles, circles bound path segments, segments compose routes, routes operate within zones and reference checkpoints, and vehicles traverse routes while encountering obstacles. The base tables enforce referential integrity through foreign keys, while the junction tables (`zones_obstacles`, `obstacles_circles`, `circles_segments`, `routes_segments`, `vehicles_obstacles`) materialize many-to-many relationships that the entity-relationship model requires. The views then denormalize these relationships into analytical surfaces — each view answering a specific question about the domain by joining the appropriate tables. Together, the tables and views form a complete, queryable representation of the autonomous navigation ontology, from low-level geometric primitives to high-level route assignments.