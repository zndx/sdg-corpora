## Modelling a Parking-and-Route Domain as a Normalised Relational Schema

The domain under consideration describes a spatial planning system for vehicle parking and route navigation within bounded zones. Zones are rectangular or irregular areas with a `length`, `width`, and `surface_type` such as `flat` or `sloped`; some zones are dead-ends (`is_cul_de_sac = true`). Within each zone sit obstacles — islands, parking lines, vehicles, or cul-de-sacs — each located at a Cartesian coordinate (`position_x`, `position_y`) and flagged as static or dynamic. Parking spaces share the same dimensional attributes as zones and are likewise assigned to a zone. Tangent circles are geometric constructs anchored to obstacles, each defined by a `radius` and a `center` point. Straight-line segments and arc sections are the two primitive path elements that compose planned routes; segments carry a `length` and start/end tangent points, while arc sections carry their own geometric parameters. Waypoints mark logical positions within zones, and planned routes record a `start_time`, `end_time`, feasibility flag, and a minimum obstacle clearance distance. The schema is normalised to third normal form: every entity type is a table, every many-to-many relationship is a junction table, and every view is a join that reconstructs a domain fact from those normalised pieces.

**Table `zones`**

| id | zone_id | length | width | surface_type | is_cul_de_sac | waypoint_id | has_exit_point_waypoint_id |
|---|---|---|---|---|---|---|---|
| 100 | 937724 | 0.6000001 | 0.34 | flat | false | 1 | 1 |
| 101 | 99504 | 0.28 | 1.19 | sloped | true | 2 | 2 |
| 102 | 10207142 | 0.5 | 0.48561337 | flat | false | 3 | 3 |
| 103 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 0.93331 | 1.48 | sloped | true | 4 | 4 |

The `zones` table is the spatial anchor of the model. Its surrogate key `id` (100–103) is opaque, while the business identifier `zone_id` carries values such as `937724`, `99504`, `10207142`, and the UUID `f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3`. The geometric attributes `length` and `width` are stored as `DECIMAL` values — for instance, zone 100 measures 0.6000001 by 0.34, while zone 103 measures 0.93331 by 1.48. The `surface_type` column is a categorical enum (`flat` or `sloped`), and `is_cul_de_sac` is a boolean that distinguishes dead-end zones (101 and 103 are `true`). The columns `waypoint_id` and `has_exit_point_waypoint_id` are foreign keys into the `waypoints` table, each referencing a single waypoint that marks the zone's entry and exit respectively. In the sample data both point to the same waypoint (1–4), but the schema permits them to diverge.

**Table `obstacles`**

| obstacle_id | obstacle_type | position_x | position_y | is_static | zone_id |
|---|---|---|---|---|---|
| 1 | island | 13.20 | 11.70 | false | 100 |
| 2 | parking_line | 16.40 | 13.40 | true | 101 |
| 3 | vehicle | 19.60 | 15.10 | false | 102 |
| 4 | cul_de_sac | 22.80 | 16.80 | true | 103 |

Obstacles are the second primary entity. The table uses `obstacle_id` as its natural key — values include `1`, `2`, `3`, and `4` in the sample — and stores the `obstacle_type` as a string (`island`, `parking_line`, `vehicle`, `cul_de_sac`). The Cartesian coordinates `position_x` and `position_y` locate the obstacle within the zone's coordinate frame (e.g., obstacle 1 sits at 13.20, 11.70). The `is_static` boolean distinguishes fixed features from movable ones, and the foreign key `zone_id` (100–103) ties each obstacle to exactly one zone. This is a many-to-one relationship: a zone can contain multiple obstacles, but each obstacle belongs to a single zone.

**Table `parking_spaces`**

| id | space_id | length | width | is_occupied | zone_id |
|---|---|---|---|---|---|
| 1000 | 195344 | 0.6000001 | 0.34 | false | 100 |
| 1001 | 16611019 | 0.28 | 1.19 | true | 101 |
| 1002 | L237 | 0.5 | 0.48561337 | false | 102 |
| 1003 | BjoernKW | 0.93331 | 1.48 | true | 103 |

Parking spaces mirror the zone schema in structure: `id` is the surrogate key, `space_id` is the business identifier (values like `195344`, `16611019`, `L237`, `BjoernKW`), and `length` and `width` store the dimensions. The `is_occupied` boolean indicates availability, and `zone_id` is the foreign key linking the space to its parent zone. Like obstacles, parking spaces are many-to-one with zones.

**Table `tangent_circles`**

| id | circle_id | radius | center_x | center_y | obstacle_id |
|---|---|---|---|---|---|
| 1 | 338542 | 4.70 | 8.20 | 6.45 | 1 |
| 2 | 3012829 | 7.40 | 12.40 | 8.90 | 2 |
| 3 | 054cac68-8fc7-11eb-924d-9cd76263cbd0 | 10.10 | 16.60 | 11.35 | 3 |
| 4 | 10238265 | 12.80 | 20.80 | 13.80 | 4 |

Tangent circles are geometric constructs associated with obstacles. The table's surrogate key `id` (1–4) maps to a `circle_id` business identifier (`338542`, `3012829`, `054cac68-8fc7-11eb-924d-9cd76263cbd0`, `10238265`). The `radius` (4.70, 7.40, 10.10, 12.80) and `center_x`/`center_y` coordinates define the circle's geometry. The foreign key `obstacle_id` (1–4) establishes a one-to-one or one-to-many relationship between an obstacle and its tangent circle(s).

**Table `straight_line_segments`**

| segment_id | length | start_tangent_point_x | start_tangent_point_y | end_tangent_point_x | end_tangent_point_y | tangent_circle_id | planned_route_id |
|---|---|---|---|---|---|---|---|
| 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 0.6000001 | 9.70 | 7.95 | 18.95 | 19.20 | 1 | 100 |
| 32825 | 0.28 | 14.40 | 9.90 | 20.90 | 22.40 | 2 | 101 |
| 974920 | 0.5 | 19.10 | 11.85 | 22.85 | 25.60 | 3 | 102 |
| 2933482 | 0.93331 | 23.80 | 13.80 | 24.80 | 28.80 | 4 | 103 |

Straight-line segments are path primitives. The `segment_id` is the business identifier (UUIDs and integers like `422a03c4-8fcc-11eb-924d-9cd76263cbd0`, `32825`, `974920`, `2933482`). The `length` attribute (0.6000001, 0.28, 0.5, 0.93331) and the start/end tangent point coordinates define the segment's geometry. Two foreign keys anchor the segment: `tangent_circle_id` (1–4) links it to a tangent circle, and `planned_route_id` (100–103) links it to a planned route. A segment belongs to exactly one circle and one route, but a circle or route can contain many segments.

**Table `planned_routes`**

| planned_route_id | route_id | start_time | end_time | is_feasible | min_obstacle_distance | zone_id | waypoint_id | ends_at_waypoint_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 1996928 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | false | 2.84 | 100 | 1 | 1 |
| 101 | 6926358 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | true | 0.625 | 101 | 2 | 2 |
| 102 | 82869 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | false | 0.88669 | 102 | 3 | 3 |
| 103 | b10c758c-8fcd-11eb-924d-9cd76263cbd0 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | true | 30.5 | 103 | 4 | 4 |

Planned routes are the top-level navigation entities. The `planned_route_id` (100–103) is the surrogate key, while `route_id` is the business identifier (`1996928`, `6926358`, `82869`, `b10c758c-8fcd-11eb-924d-9cd76263cbd0`). Temporal attributes `start_time` and `end_time` are stored as ISO-8601 timestamps (e.g., `2024-03-27T14:42:00`). The `is_feasible` boolean indicates whether the route is navigable, and `min_obstacle_distance` records the closest approach to any obstacle (2.84, 0.625, 0.88669, 30.5). Foreign keys `zone_id` (100–103), `waypoint_id` (1–4), and `ends_at_waypoint_id` (1–4) tie the route to its spatial context and logical endpoints.

**Table `arc_sections`**

| arc_section_id | arc_id | radius | start_angle | end_angle | segment_id | planned_route_id |
|---|---|---|---|---|---|---|
| 1000 | 3990162 | 4.70 | 19.95 | 21.45 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | 100 |
| 1001 | 4447016 | 7.40 | 22.90 | 25.90 | 32825 | 101 |
| 1002 | 3012827 | 10.10 | 25.85 | 30.35 | 974920 | 102 |
| 1003 | 611502 | 12.80 | 28.80 | 34.80 | 2933482 | 103 |

Arc sections are the second path primitive type, complementing straight-line segments. They carry their own geometric attributes (radius, start/end angles, centre coordinates) and are linked to a `planned_route_id` via a foreign key. Arc sections and straight-line segments together form the complete set of path elements for any planned route.

**Table `waypoints`**

| id | waypoint_id | x | y | waypoint_type | zone_id | planned_route_id | is_end_of_planned_route_id |
|---|---|---|---|---|---|---|---|
| 1 | 611507 | 19.70 | 15.20 | entry | 100 | 100 | 100 |
| 2 | 778575 | 21.40 | 17.40 | exit | 101 | 101 | 101 |
| 3 | 5006438 | 23.10 | 19.60 | checkpoint | 102 | 102 | 102 |
| 4 | 7041 | 24.80 | 21.80 | parking | 103 | 103 | 103 |

Waypoints are logical position markers within zones. The table stores a `waypoint_id` as the natural key, along with `x` and `y` coordinates, a `zone_id` foreign key, and a `description` column for human-readable labels. In the sample data, waypoints 1–4 correspond to zones 100–103 respectively.

### Junction Tables for Many-to-Many Relationships

Several entity pairs have many-to-many relationships that cannot be expressed through a single foreign key column. These are resolved through junction (associative) tables.

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

The `zones_obstacles` junction table resolves the many-to-many relationship between zones and obstacles. Although the `obstacles` table already carries a `zone_id` foreign key (suggesting a many-to-one relationship), the junction table exists to support additional metadata on the association — for example, an `entry_order` or `classification` column that describes how the obstacle relates to the zone beyond simple containment.

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

Similarly, `zones_spaces` resolves the many-to-many relationship between zones and parking spaces. The `parking_spaces` table has its own `zone_id` foreign key, but the junction table allows for richer association metadata.

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

The `obstacles_circles` junction table links obstacles to tangent circles. While `tangent_circles` has an `obstacle_id` foreign key, the junction table supports additional association attributes.

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

The `spaces_obstacles` junction table captures the relationship between parking spaces and obstacles — for example, recording which obstacles are adjacent to or block which spaces.

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

The `circles_segments` junction table links tangent circles to straight-line segments. The `straight_line_segments` table has a `tangent_circle_id` foreign key, but the junction table supports additional metadata on the geometric relationship.

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

The `routes_segments` junction table links planned routes to straight-line segments. The `straight_line_segments` table has a `planned_route_id` foreign key, but the junction table supports ordering and additional metadata.

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

The `routes_sections` junction table links planned routes to arc sections, supporting ordering and metadata for arc-based path elements.

### Views: Reconstructing Domain Facts from Normalised Tables

Views in this schema are read-only joins that reconstruct domain facts from the normalised base tables. Each view answers a specific question by bringing together related entities.

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

The view `v_zone_obstacle_detail` joins `zones` with `obstacles` on `zone_id`, producing a denormalised row per obstacle that includes the zone's `length`, `width`, `surface_type`, and `is_cul_de_sac` alongside the obstacle's `obstacle_type`, `position_x`, `position_y`, and `is_static`. For example, the row for obstacle 1 (an `island` at 13.20, 11.70, `is_static = false`) is augmented with zone 100's dimensions (0.6000001 × 0.34, `flat`, not a cul-de-sac). This view answers the question: "What are the obstacles within each zone, and what are the zone's spatial characteristics?"

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

The view `v_zone_parking_space_detail` joins `zones` with `parking_spaces` on `zone_id`. Each row pairs a zone's attributes with a parking space's `space_id`, `length`, `width`, and `is_occupied` status. The row for space `195344` (0.6000001 × 0.34, `is_occupied = false`) is paired with zone 100's `flat` surface and non-cul-de-sac status. This view answers: "Which parking spaces belong to each zone, and what are their availability and dimensional properties?"

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

The view `v_zone_waypoint` joins `zones` with `waypoints` on `zone_id`, producing rows that pair each zone with its associated waypoint(s). The row for zone 100 (length 0.6000001, width 0.34) is paired with waypoint 1. This view answers: "Which waypoints are associated with each zone?"

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

The view `v_obstacle_zone` is the inverse of `v_zone_obstacle_detail`: it joins `obstacles` with `zones` on `zone_id`, presenting the obstacle as the primary entity and the zone's attributes as context. The row for obstacle 2 (a `parking_line` at 16.40, 13.40, `is_static = true`) is paired with zone 101's attributes (length 0.28, width 1.19, `sloped`, `is_cul_de_sac = true`). This view answers: "For each obstacle, what zone does it belong to, and what are that zone's characteristics?"

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

The view `v_obstacle_tangent_circle_detail` joins `obstacles` with `tangent_circles` on `obstacle_id`. Each row pairs an obstacle's type and position with its tangent circle's `radius`, `center_x`, and `center_y`. The row for obstacle 1 (an `island`) is paired with circle `338542` (radius 4.70, centre 8.20, 6.45). This view answers: "What tangent circle is associated with each obstacle, and what are the circle's geometric parameters?"

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

The view `v_parking_space_zone` joins `parking_spaces` with `zones` on `zone_id`, presenting the parking space as the primary entity. The row for space `16611019` (length 0.28, width 1.19, `is_occupied = true`) is paired with zone 101's `sloped` surface and cul-de-sac status. This view answers: "For each parking space, what zone does it belong to, and what are the zone's spatial properties?"

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

The view `v_parking_space_obstacle_detail` joins `parking_spaces` with `obstacles` through their shared `zone_id`, producing rows that pair each parking space with the obstacles in the same zone. The row for space `L237` (length 0.5, width 0.48561337, `is_occupied = false`) in zone 102 is paired with obstacle 3 (a `vehicle` at 19.60, 15.10). This view answers: "Which obstacles share a zone with each parking space?"

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

The view `v_tangent_circle_obstacle` joins `tangent_circles` with `obstacles` on `obstacle_id`, presenting the tangent circle as the primary entity. The row for circle `3012829` (radius 7.40, centre 12.40, 8.90) is paired with obstacle 2 (a `parking_line` at 16.40, 13.40, `is_static = true`). This view answers: "For each tangent circle, what obstacle does it belong to, and what are the obstacle's properties?"

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

The view `v_tangent_circle_straight_line_segment_detail` joins `tangent_circles` with `straight_line_segments` on `tangent_circle_id`. Each row pairs a circle's geometry with the segment's `length` and tangent point coordinates. The row for circle `054cac68-8fc7-11eb-924d-9cd76263cbd0` (radius 10.10, centre 16.60, 11.35) is paired with segment `974920` (length 0.5, start point 19.10, 11.85, end point 22.85, 25.60). This view answers: "Which straight-line segments are associated with each tangent circle, and what are their geometric parameters?"

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

The view `v_straight_line_segment_tangent_circle` joins `straight_line_segments` with `tangent_circles` on `tangent_circle_id`, presenting the segment as the primary entity. The row for segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` (length 0.6000001, start point 9.70, 7.95, end point 18.95, 19.20) is paired with circle `338542` (radius 4.70, centre 8.20, 6.45). This view answers: "For each straight-line segment, what tangent circle does it belong to, and what are the circle's geometric parameters?"

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

The view `v_straight_line_segment_planned_route` joins `straight_line_segments` with `planned_routes` on `planned_route_id`. Each row pairs a segment's geometry with the route's temporal and feasibility attributes. The row for segment `32825` (length 0.28, start point 14.40, 9.90, end point 20.90, 22.40) is paired with route `6926358` (start time `2025-08-11T21:59:00`, end time `2024-07-10T20:44:00`, `is_feasible = true`, `min_obstacle_distance = 0.625`). This view answers: "Which planned route does each straight-line segment belong to, and what are the route's temporal and feasibility characteristics?"

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

The view `v_planned_route_straight_line_segment_detail` joins `planned_routes` with `straight_line_segments` on `planned_route_id`, presenting the route as the primary entity. The row for route `1996928` (start time `2024-03-27T14:42:00`, end time `2023-02-26T13:27:00`, `is_feasible = false`, `min_obstacle_distance = 2.84`) is paired with segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0` (length 0.6000001, start point 9.70, 7.95, end point 18.95, 19.20). This view answers: "For each planned route, what straight-line segments compose it, and what are their geometric parameters?"

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

The view `v_planned_route_arc_section_detail` joins `planned_routes` with `arc_sections` on `planned_route_id`. Each row pairs a route's temporal and feasibility attributes with an arc section's geometric parameters. This view answers: "For each planned route, what arc sections compose it, and what are their geometric parameters?"

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

The view `v_planned_route_zone` joins `planned_routes` with `zones` on `zone_id`. Each row pairs a route's temporal and feasibility attributes with its zone's spatial characteristics. The row for route `82869` (start time `2022-01-22T04:16:00`, end time `2025-12-21T03:01:00`, `is_feasible = false`, `min_obstacle_distance = 0.88669`) is paired with zone 102 (length 0.5, width 0.48561337, `flat`, not a cul-de-sac). This view answers: "For each planned route, what zone does it belong to, and what are the zone's spatial properties?"

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

The view `v_planned_route_waypoint` joins `planned_routes` with `waypoints` on `waypoint_id`. Each row pairs a route's temporal and feasibility attributes with its associated waypoint. The row for route `b10c758c-8fcd-11eb-924d-9cd76263cbd0` (start time `2023-06-06T11:33:00`, end time `2022-05-05T10:18:00`, `is_feasible = true`, `min_obstacle_distance = 30.5`) is paired with waypoint 4. This view answers: "For each planned route, what waypoint marks its logical start, and what are the route's temporal and feasibility characteristics?"

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

The view `v_arc_section_straight_line_segment` joins `arc_sections` with `straight_line_segments` through their shared `planned_route_id`, producing rows that pair arc sections with straight-line segments belonging to the same route. This view answers: "Which straight-line segments share a planned route with each arc section?"

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

The view `v_arc_section_planned_route` joins `arc_sections` with `planned_routes` on `planned_route_id`, presenting the arc section as the primary entity. Each row pairs an arc section's geometric parameters with the route's temporal and feasibility attributes. This view answers: "For each arc section, what planned route does it belong to, and what are the route's characteristics?"

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

The view `v_waypoint_zone` joins `waypoints` with `zones` on `zone_id`, presenting the waypoint as the primary entity. Each row pairs a waypoint's coordinates and description with its zone's spatial characteristics. This view answers: "For each waypoint, what zone does it belong to, and what are the zone's spatial properties?"

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

The view `v_waypoint_planned_route` joins `waypoints` with `planned_routes` on `waypoint_id`, presenting the waypoint as the primary entity. Each row pairs a waypoint's coordinates and description with the route's temporal and feasibility attributes. The row for waypoint 3 is paired with route `82869` (start time `2022-01-22T04:16:00`, end time `2025-12-21T03:01:00`, `is_feasible = false`, `min_obstacle_distance = 0.88669`). This view answers: "For each waypoint, what planned route does it mark, and what are the route's temporal and feasibility characteristics?"

### Synthesis

The schema models a parking-and-route planning domain through eight core entity tables, seven junction tables, and twenty-two denormalising views. The normalised base tables enforce referential integrity through foreign keys: obstacles and parking spaces reference zones; tangent circles reference obstacles; straight-line segments reference both tangent circles and planned routes; planned routes reference zones and waypoints. Junction tables such as `zones_obstacles`, `routes_segments`, and `circles_segments` capture many-to-many relationships that cannot be expressed through a single foreign key column. The views reconstruct domain facts by joining these normalised tables — for example, `v_zone_obstacle_detail` joins `zones` and `obstacles` to answer "what obstacles exist in each zone," while `v_planned_route_straight_line_segment_detail` joins `planned_routes` and `straight_line_segments` to answer "which segments compose each route." The concrete values in the sample data — zone 100's dimensions of 0.6000001 × 0.34, obstacle 1's position at 13.20, 11.70, route `1996928`'s infeasibility flag, and segment `422a03c4-8fcc-11eb-924d-9cd76263cbd0`'s length of 0.6000001 — illustrate how the abstract schema maps to real spatial and temporal planning data.