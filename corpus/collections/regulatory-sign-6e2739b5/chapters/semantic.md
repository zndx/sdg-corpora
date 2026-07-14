The infrastructure of a state highway system can be understood as a network of physical road segments, each governed by a set of traffic regulations and marked by regulatory signs that communicate those rules to drivers. In the data model that underpins this domain, four base tables capture the essential entities: `regulatory_signs`, `traffic_regations`, `roadway_segments`, and `sign_standards`. The relationships among them are not merely associative; they are enforced through foreign keys that bind each sign to a regulation, a roadway segment, and a design standard, while each regulation and roadway segment also points back to its sign. This chapter walks through the ontology of the domain, the materialization of that ontology into a relational schema, and the six materialized views that reconstruct the domain facts from the normalized tables.

## The Regulatory Sign as the Central Entity

The table `regulatory_signs` is the anchor of the schema. Every row represents a physical sign installed along the roadway, identified by a surrogate `id` and a human-readable `sign_identifier` such as `SIG-2078`. The sign carries descriptive attributes: `sign_message` (for example, `legacy-sign-13`), `sign_shape` (values like `octagon`, `rectangle`, `circle`, or `diamond`), `sign_color` (`red`, `white`, `black`, or `green`), and two boolean flags — `is_retroreflectorized` and `is_illuminated` — that indicate whether the sign meets nighttime visibility requirements. The `installation_date` column records when the sign was put into service (e.g., `2022-01-10T00:12:00`), and `status` tracks its current lifecycle state (`active`, `removed`, or `damaged`).

Three foreign keys in `regulatory_signs` tie the sign to the rest of the domain: `traffic_regulation_id` references `traffic_regulations.id`, `roadway_segment_id` references `roadway_segments.roadway_segment_id`, and `sign_standard_id` references `sign_standards.id`. In the sample data, sign `SIG-2078` (id `1000`) is an octagonal red sign, retroreflectorized and illuminated, installed on 2022-01-10, and linked to regulation `1000`, roadway segment `1`, and standard `1`. Sign `SIG-2081` (id `1003`) is a diamond-shaped green sign, neither retroreflectorized nor illuminated, with status `active`, linked to regulation `1003`, segment `4`, and standard `4`.

**Table `regulatory_signs`**

| id | sign_identifier | sign_message | sign_shape | sign_color | is_retroreflectorized | is_illuminated | installation_date | status | traffic_regulation_id | roadway_segment_id | sign_standard_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | SIG-2078 | legacy-sign-13 | octagon | red | true | true | 2022-01-10T00:12:00 | active | 1000 | 1 | 1 |
| 1001 | SIG-2079 | compact-sign-14 | rectangle | white | false | false | 2023-06-21T07:29:00 | removed | 1001 | 2 | 2 |
| 1002 | SIG-2080 | composite-sign-15 | circle | black | true | true | 2024-11-05T14:46:00 | damaged | 1002 | 3 | 3 |
| 1003 | SIG-2081 | primary-sign-16 | diamond | green | false | false | 2025-04-16T21:03:00 | active | 1003 | 4 | 4 |

The cardinality of these relationships is one-to-one in the current dataset: each sign references exactly one regulation, one segment, and one standard. The schema does not prevent a sign from referencing a non-existent regulation, but the foreign key constraint enforces referential integrity at the database level.

## Traffic Regulations and Their Sign Bindings

The `traffic_regulations` table stores the legal rules that signs communicate. Each row has a surrogate `id`, a `regulation_code` (which can be a plain integer like `5917296` or a UUID-like string such as `57e54d62-8fcd-11eb-924d-9cd76263cbd0`), a `regulation_type` (`speed_limit`, `stop`, `yield`, or `no_turn`), an `effective_date`, a `jurisdiction` (`state`, `county`, or `municipal`), a `penalty_amount` (ranging from `442.51` to `3,813`), and an `is_active` flag. The table also carries two foreign keys: `regulatory_sign_id` points back to `regulatory_signs.id`, and `roadway_segment_id` points to `roadway_segments.roadway_segment_id`.

Regulation `1000` (code `5917296`) is a `speed_limit` rule under `state` jurisdiction with a penalty of `2,604`, effective since `2023-02-14`, and it is currently `active`. It is linked to sign `1000` and segment `1`. Regulation `1001` (code `82874`) is a `stop` rule under `county` jurisdiction with a penalty of `442.51`, effective `2024-07-25`, and is `not active` — it references sign `1001` and segment `2`.

**Table `traffic_regulations`**

| id | regulation_code | regulation_type | effective_date | jurisdiction | penalty_amount | is_active | regulatory_sign_id | roadway_segment_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 5917296 | speed_limit | 2023-02-14 | state | 2,604 | true | 1000 | 1 |
| 1001 | 82874 | stop | 2024-07-25 | county | 442.51 | false | 1001 | 2 |
| 1002 | 1336197 | yield | 2025-12-09 | municipal | 1,997 | true | 1002 | 3 |
| 1003 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | no_turn | 2022-05-20 | state | 3,813 | false | 1003 | 4 |

The bidirectional link between `traffic_regulations` and `regulatory_signs` means that the relationship is captured from both sides: a sign knows which regulation it enforces, and a regulation knows which sign displays it. This redundancy is intentional in the schema, ensuring that queries can start from either entity without a join.

## Roadway Segments as the Physical Substrate

The `roadway_segments` table models the physical stretches of road where signs and regulations apply. Its primary key is `roadway_segment_id`, and each row carries a `segment_identifier` (e.g., `SEG-2495`), a `road_name` (`Composite Model`, `Compact Cluster A`, `Legacy Review`, `Regional Initiative`), start and end mile markers (`start_mile_marker` and `end_mile_marker`), `surface_type` (`asphalt`, `concrete`, or `gravel`), `lane_count` (ranging from `2` to `6`), and a `speed_limit` (from `24` to `33`). The table also stores `created_at` timestamps and two foreign keys: `regulatory_sign_id` references `regulatory_signs.id`, and `traffic_regulation_id` references `traffic_regulations.id`.

Segment `1` (`SEG-2495`, road name `Composite Model`) spans mile markers `19.45` to `1.70`, has an asphalt surface, six lanes, and a speed limit of `24`. It is linked to sign `1000` and regulation `1000`. Segment `4` (`SEG-2516`, road name `Regional Initiative`) spans mile markers `26.80` to `6.80`, has an asphalt surface, four lanes, and a speed limit of `33`, linked to sign `1003` and regulation `1003`.

**Table `roadway_segments`**

| roadway_segment_id | segment_identifier | road_name | start_mile_marker | end_mile_marker | surface_type | lane_count | speed_limit | regulatory_sign_id | traffic_regulation_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | SEG-2495 | Composite Model | 19.45 | 1.70 | asphalt | 6 | 24 | 1000 | 1000 | 2025-01-01 00:14:00 |
| 2 | SEG-2502 | Compact Cluster A | 21.90 | 3.40 | concrete | 2 | 27 | 1001 | 1001 | 2025-02-06 03:14:00 |
| 3 | SEG-2509 | Legacy Review | 24.35 | 5.10 | gravel | 3 | 30 | 1002 | 1002 | 2025-03-11 06:14:00 |
| 4 | SEG-2516 | Regional Initiative | 26.80 | 6.80 | asphalt | 4 | 33 | 1003 | 1003 | 2025-04-16 09:14:00 |

As with the regulation–sign relationship, the roadway segment participates in bidirectional links: it knows which sign and which regulation apply to it, and those entities also point back. This tripartite interlocking — sign, regulation, segment — forms the core fact of the domain.

## Sign Standards as Design Constraints

The `sign_standards` table encodes the design specifications that signs must meet. Each row has a surrogate `id`, a `standard_code` (e.g., `L459`, `account_pymes_596`, `9125613`, `8189504`), a `standard_version` (`compact-standard-86`, `composite-standard-87`, `primary-standard-88`, `adaptive-standard-89`), a `required_size` (`compact-required-50`, `composite-required-51`, `primary-required-52`, `adaptive-required-53`), a `required_legend` (`legacy-required-19`, `compact-required-20`, `composite-required-21`, `primary-required-22`), a `retroreflectivity_level` (`high`, `medium`, or `low`), an `illumination_requirement` boolean, and a foreign key `regulatory_sign_id` pointing to `regulatory_signs.id`.

Standard `1` (code `L459`, version `compact-standard-86`) requires a size of `compact-required-50`, a legend of `legacy-required-19`, has a `high` retroreflectivity level, and does not require illumination (`false`). It is linked to sign `1000`. Standard `2` (code `account_pymes_596`, version `composite-standard-87`) requires `composite-required-51` size, `compact-required-20` legend, `medium` retroreflectivity, and `true` illumination — linked to sign `1001`.

**Table `sign_standards`**

| id | standard_code | standard_version | required_size | required_legend | retroreflectivity_level | illumination_requirement | regulatory_sign_id |
|---|---|---|---|---|---|---|---|
| 1 | L459 | compact-standard-86 | compact-required-50 | legacy-required-19 | high | false | 1000 |
| 2 | account_pymes_596 | composite-standard-87 | composite-required-51 | compact-required-20 | medium | true | 1001 |
| 3 | 9125613 | primary-standard-88 | primary-required-52 | composite-required-21 | low | false | 1002 |
| 4 | 8189504 | adaptive-standard-89 | adaptive-required-53 | primary-required-22 | high | true | 1003 |

The sign standard relationship is unidirectional in the schema: a standard references a sign, but the sign does not carry a direct pointer to its standard beyond the `sign_standard_id` column in `regulatory_signs`. Together, these two columns form the complete bidirectional link.

## Materialized Views as Domain Fact Reconstructors

The six views in the schema are pairwise joins between the base tables. Each view answers a specific domain question by denormalizing two entities into a single flat result set. The naming convention is explicit: `v_<entity_a>_<entity_b>` indicates a join from entity A to entity B.

### The Sign–Regulation Pair

The view `v_regulatory_sign_traffic_regulation` joins `regulatory_signs` to `traffic_regulations` on `a.traffic_regulation_id = b.id`. It returns the sign's `id`, `sign_identifier`, `sign_message`, and `sign_shape` alongside the regulation's `id` (aliased as `regulation_id`), `regulation_code` (aliased as `regulation_regulation_code`), and `regulation_type` (aliased as `regulation_regulation_type`). The result tells us which regulation each sign enforces. For instance, sign `SIG-2078` (id `1000`, octagon shape) enforces regulation `5917296` of type `speed_limit`. Sign `SIG-2081` (id `1003`, diamond shape) enforces regulation `57e54d62-8fcd-11eb-924d-9cd76263cbd0` of type `no_turn`.

**View `v_regulatory_sign_traffic_regulation`**

```sql
CREATE VIEW v_regulatory_sign_traffic_regulation AS
SELECT a.id, a.sign_identifier, a.sign_message, a.sign_shape, b.id AS regulation_id, b.regulation_code AS regulation_regulation_code, b.regulation_type AS regulation_regulation_type
FROM regulatory_signs a JOIN traffic_regulations b ON a.traffic_regulation_id = b.id;
```

| id | sign_identifier | sign_message | sign_shape | regulation_id | regulation_regulation_code | regulation_regulation_type |
|---|---|---|---|---|---|---|
| 1000 | SIG-2078 | legacy-sign-13 | octagon | 1000 | 5917296 | speed_limit |
| 1001 | SIG-2079 | compact-sign-14 | rectangle | 1001 | 82874 | stop |
| 1002 | SIG-2080 | composite-sign-15 | circle | 1002 | 1336197 | yield |
| 1003 | SIG-2081 | primary-sign-16 | diamond | 1003 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | no_turn |

The inverse view `v_traffic_regulation_regulatory_sign` performs the same join from the regulation side, returning the regulation's identifying columns alongside the sign's `sign_identifier`, `sign_message`, and `sign_shape`. It answers the complementary question: given a regulation, which sign displays it? Regulation `1000` (code `5917296`, type `speed_limit`) is displayed by sign `SIG-2078` with message `legacy-sign-13` and octagon shape.

### The Sign–Segment Pair

The view `v_regulatory_sign_roadway_segment` joins `regulatory_signs` to `roadway_segments` on `a.roadway_segment_id = b.roadway_segment_id`. It returns the sign's `id`, `sign_identifier`, `sign_message`, and `sign_shape` alongside the segment's `roadway_segment_id` (aliased as `segment_roadway_segment_id`), `segment_identifier` (aliased as `segment_segment_identifier`), and `road_name` (aliased as `segment_road_name`). This view answers: on which roadway segment is each sign installed? Sign `SIG-2078` (id `1000`, octagon) is installed on segment `1` (`SEG-2495`, road `Composite Model`). Sign `SIG-2081` (id `1003`, diamond) is installed on segment `4` (`SEG-2516`, road `Regional Initiative`).

**View `v_regulatory_sign_roadway_segment`**

```sql
CREATE VIEW v_regulatory_sign_roadway_segment AS
SELECT a.id, a.sign_identifier, a.sign_message, a.sign_shape, b.roadway_segment_id AS segment_roadway_segment_id, b.segment_identifier AS segment_segment_identifier, b.road_name AS segment_road_name
FROM regulatory_signs a JOIN roadway_segments b ON a.roadway_segment_id = b.roadway_segment_id;
```

| id | sign_identifier | sign_message | sign_shape | segment_roadway_segment_id | segment_segment_identifier | segment_road_name |
|---|---|---|---|---|---|---|
| 1000 | SIG-2078 | legacy-sign-13 | octagon | 1 | SEG-2495 | Composite Model |
| 1001 | SIG-2079 | compact-sign-14 | rectangle | 2 | SEG-2502 | Compact Cluster A |
| 1002 | SIG-2080 | composite-sign-15 | circle | 3 | SEG-2509 | Legacy Review |
| 1003 | SIG-2081 | primary-sign-16 | diamond | 4 | SEG-2516 | Regional Initiative |

The inverse view `v_roadway_segment_regulatory_sign` joins from the segment side, returning the segment's `roadway_segment_id`, `segment_identifier`, and `road_name` alongside the sign's `id`, `sign_identifier`, `sign_message`, and `sign_shape`. It answers: which sign is installed on a given segment? Segment `1` (`SEG-2495`, road `Composite Model`) hosts sign `SIG-2078` (id `1000`, octagon shape, message `legacy-sign-13`).

### The Sign–Standard Pair

The view `v_regulatory_sign_sign_standard` joins `regulatory_signs` to `sign_standards` on `a.sign_standard_id = b.id`. It returns the sign's `id`, `sign_identifier`, `sign_message`, and `sign_shape` alongside the standard's `id` (aliased as `standard_id`), `standard_code` (aliased as `standard_standard_code`), and `standard_version` (aliased as `standard_standard_version`). This view answers: which design standard governs each sign? Sign `SIG-2078` (id `1000`, octagon) conforms to standard `L459` (version `compact-standard-86`). Sign `SIG-2081` (id `1003`, diamond) conforms to standard `8189504` (version `adaptive-standard-89`).

**View `v_regulatory_sign_sign_standard`**

```sql
CREATE VIEW v_regulatory_sign_sign_standard AS
SELECT a.id, a.sign_identifier, a.sign_message, a.sign_shape, b.id AS standard_id, b.standard_code AS standard_standard_code, b.standard_version AS standard_standard_version
FROM regulatory_signs a JOIN sign_standards b ON a.sign_standard_id = b.id;
```

| id | sign_identifier | sign_message | sign_shape | standard_id | standard_standard_code | standard_standard_version |
|---|---|---|---|---|---|---|
| 1000 | SIG-2078 | legacy-sign-13 | octagon | 1 | L459 | compact-standard-86 |
| 1001 | SIG-2079 | compact-sign-14 | rectangle | 2 | account_pymes_596 | composite-standard-87 |
| 1002 | SIG-2080 | composite-sign-15 | circle | 3 | 9125613 | primary-standard-88 |
| 1003 | SIG-2081 | primary-sign-16 | diamond | 4 | 8189504 | adaptive-standard-89 |

The inverse view `v_sign_standard_regulatory_sign` joins from the standard side, returning the standard's `id`, `standard_code`, and `standard_version` alongside the sign's `id`, `sign_identifier`, `sign_message`, and `sign_shape`. It answers: which sign is governed by a given standard? Standard `L459` (version `compact-standard-86`) governs sign `SIG-2078` (id `1000`, octagon shape, message `legacy-sign-13`).

### The Regulation–Segment Pair

The view `v_traffic_regulation_roadway_segment` joins `traffic_regulations` to `roadway_segments` on `a.roadway_segment_id = b.roadway_segment_id`. It returns the regulation's `id`, `regulation_code`, and `regulation_type` alongside the segment's `roadway_segment_id`, `segment_identifier`, and `road_name`. This view answers: on which roadway segment does each regulation apply? Regulation `1000` (code `5917296`, type `speed_limit`) applies on segment `1` (`SEG-2495`, road `Composite Model`). Regulation `1003` (code `57e54d62-8fcd-11eb-924d-9cd76263cbd0`, type `no_turn`) applies on segment `4` (`SEG-2516`, road `Regional Initiative`).

**View `v_traffic_regulation_roadway_segment`**

```sql
CREATE VIEW v_traffic_regulation_roadway_segment AS
SELECT a.id, a.regulation_code, a.regulation_type, a.effective_date, b.roadway_segment_id AS segment_roadway_segment_id, b.segment_identifier AS segment_segment_identifier, b.road_name AS segment_road_name
FROM traffic_regulations a JOIN roadway_segments b ON a.roadway_segment_id = b.roadway_segment_id;
```

| id | regulation_code | regulation_type | effective_date | segment_roadway_segment_id | segment_segment_identifier | segment_road_name |
|---|---|---|---|---|---|---|
| 1000 | 5917296 | speed_limit | 2023-02-14 | 1 | SEG-2495 | Composite Model |
| 1001 | 82874 | stop | 2024-07-25 | 2 | SEG-2502 | Compact Cluster A |
| 1002 | 1336197 | yield | 2025-12-09 | 3 | SEG-2509 | Legacy Review |
| 1003 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | no_turn | 2022-05-20 | 4 | SEG-2516 | Regional Initiative |

The inverse view `v_roadway_segment_traffic_regulation` joins from the segment side, returning the segment's `roadway_segment_id`, `segment_identifier`, and `road_name` alongside the regulation's `id`, `regulation_code`, and `regulation_type`. It answers: which regulation applies on a given segment? Segment `1` (`SEG-2495`, road `Composite Model`) is governed by regulation `5917296` (type `speed_limit`).

## Synthesis

The schema models a tripartite domain fact — a regulatory sign, its governing traffic regulation, and the roadway segment on which it is installed — as three interlocking one-to-one relationships, each captured bidirectionally through foreign keys in all three base tables. The `sign_standards` table adds a fourth dimension: the design specification that the sign must satisfy. The six views materialize every pairwise projection of this fact, allowing queries to start from any entity and recover the others without traversing multiple joins. The result is a schema that is both normalized (each entity lives in its own table) and denormalized at the view layer (each view flattens a domain fact into a single row). This dual structure supports both integrity enforcement at the base table level and analytical convenience at the view level, which is the hallmark of a well-grounded relational ontology.

## Data appendix

**View `v_traffic_regulation_regulatory_sign`**

```sql
CREATE VIEW v_traffic_regulation_regulatory_sign AS
SELECT a.id, a.regulation_code, a.regulation_type, a.effective_date, b.id AS sign_id, b.sign_identifier AS sign_sign_identifier, b.sign_message AS sign_sign_message
FROM traffic_regulations a JOIN regulatory_signs b ON a.regulatory_sign_id = b.id;
```

| id | regulation_code | regulation_type | effective_date | sign_id | sign_sign_identifier | sign_sign_message |
|---|---|---|---|---|---|---|
| 1000 | 5917296 | speed_limit | 2023-02-14 | 1000 | SIG-2078 | legacy-sign-13 |
| 1001 | 82874 | stop | 2024-07-25 | 1001 | SIG-2079 | compact-sign-14 |
| 1002 | 1336197 | yield | 2025-12-09 | 1002 | SIG-2080 | composite-sign-15 |
| 1003 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | no_turn | 2022-05-20 | 1003 | SIG-2081 | primary-sign-16 |

**View `v_roadway_segment_regulatory_sign`**

```sql
CREATE VIEW v_roadway_segment_regulatory_sign AS
SELECT a.roadway_segment_id, a.segment_identifier, a.road_name, a.start_mile_marker, b.id AS sign_id, b.sign_identifier AS sign_sign_identifier, b.sign_message AS sign_sign_message
FROM roadway_segments a JOIN regulatory_signs b ON a.regulatory_sign_id = b.id;
```

| roadway_segment_id | segment_identifier | road_name | start_mile_marker | sign_id | sign_sign_identifier | sign_sign_message |
|---|---|---|---|---|---|---|
| 1 | SEG-2495 | Composite Model | 19.45 | 1000 | SIG-2078 | legacy-sign-13 |
| 2 | SEG-2502 | Compact Cluster A | 21.90 | 1001 | SIG-2079 | compact-sign-14 |
| 3 | SEG-2509 | Legacy Review | 24.35 | 1002 | SIG-2080 | composite-sign-15 |
| 4 | SEG-2516 | Regional Initiative | 26.80 | 1003 | SIG-2081 | primary-sign-16 |

**View `v_roadway_segment_traffic_regulation`**

```sql
CREATE VIEW v_roadway_segment_traffic_regulation AS
SELECT a.roadway_segment_id, a.segment_identifier, a.road_name, a.start_mile_marker, b.id AS regulation_id, b.regulation_code AS regulation_regulation_code, b.regulation_type AS regulation_regulation_type
FROM roadway_segments a JOIN traffic_regulations b ON a.traffic_regulation_id = b.id;
```

| roadway_segment_id | segment_identifier | road_name | start_mile_marker | regulation_id | regulation_regulation_code | regulation_regulation_type |
|---|---|---|---|---|---|---|
| 1 | SEG-2495 | Composite Model | 19.45 | 1000 | 5917296 | speed_limit |
| 2 | SEG-2502 | Compact Cluster A | 21.90 | 1001 | 82874 | stop |
| 3 | SEG-2509 | Legacy Review | 24.35 | 1002 | 1336197 | yield |
| 4 | SEG-2516 | Regional Initiative | 26.80 | 1003 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | no_turn |

**View `v_sign_standard_regulatory_sign`**

```sql
CREATE VIEW v_sign_standard_regulatory_sign AS
SELECT a.id, a.standard_code, a.standard_version, a.required_size, b.id AS sign_id, b.sign_identifier AS sign_sign_identifier, b.sign_message AS sign_sign_message
FROM sign_standards a JOIN regulatory_signs b ON a.regulatory_sign_id = b.id;
```

| id | standard_code | standard_version | required_size | sign_id | sign_sign_identifier | sign_sign_message |
|---|---|---|---|---|---|---|
| 1 | L459 | compact-standard-86 | compact-required-50 | 1000 | SIG-2078 | legacy-sign-13 |
| 2 | account_pymes_596 | composite-standard-87 | composite-required-51 | 1001 | SIG-2079 | compact-sign-14 |
| 3 | 9125613 | primary-standard-88 | primary-required-52 | 1002 | SIG-2080 | composite-sign-15 |
| 4 | 8189504 | adaptive-standard-89 | adaptive-required-53 | 1003 | SIG-2081 | primary-sign-16 |
