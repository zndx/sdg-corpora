## Regulatory Sign Infrastructure

Municipal, county, and state transportation authorities maintain an intricate network of regulatory signs along public roadways, each sign encoding a specific traffic rule, physical geometry, and compliance standard. The operational backbone of this system is the registry of regulatory signs, which captures every installed device from its unique identifier through its physical attributes, visibility features, and current operational status. A sign such as SIG-2078, bearing the message legacy-sign-13, is an octagonal red device that is both retroreflectorized and illuminated, installed on 2022-01-10 and currently active. By contrast, SIG-2079 is a white rectangular sign with the message compact-sign-14 that lacks both retroreflective and illuminated properties; it was installed on 2023-06-21 but has since been removed from service. The inventory also includes SIG-2080, a black circular sign marked composite-sign-15, retroreflectorized and illuminated but flagged as damaged, and SIG-2081, a green diamond-shaped sign carrying primary-sign-16, which is neither retroreflectorized nor illuminated yet remains active. These four records form the foundational layer of sign management, linking each device to a traffic regulation, a roadway segment, and a governing sign standard.

**Table `regulatory_signs`**

| id | sign_identifier | sign_message | sign_shape | sign_color | is_retroreflectorized | is_illuminated | installation_date | status | traffic_regulation_id | roadway_segment_id | sign_standard_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | SIG-2078 | legacy-sign-13 | octagon | red | true | true | 2022-01-10T00:12:00 | active | 1000 | 1 | 1 |
| 1001 | SIG-2079 | compact-sign-14 | rectangle | white | false | false | 2023-06-21T07:29:00 | removed | 1001 | 2 | 2 |
| 1002 | SIG-2080 | composite-sign-15 | circle | black | true | true | 2024-11-05T14:46:00 | damaged | 1002 | 3 | 3 |
| 1003 | SIG-2081 | primary-sign-16 | diamond | green | false | false | 2025-04-16T21:03:00 | active | 1003 | 4 | 4 |

## Traffic Regulation Framework

Every regulatory sign enforces a specific traffic regulation, and the regulations table catalogs the legal rules that govern driver behavior across jurisdictions. Regulation 5917296, classified as a speed_limit type, took effect on 2023-02-14 under state jurisdiction with a penalty amount of 2,604 for violations, and remains active. Regulation 82874, a stop rule effective 2024-07-25 under county jurisdiction, carries a penalty of 442.51 and is currently inactive. The yield regulation 1336197, effective 2025-12-09 at the municipal level, imposes a 1,997 penalty and is active. Finally, regulation 57e54d62-8fcd-11eb-924d-9cd76263cbd0 governs no_turn movements under state jurisdiction with a 3,813 penalty and is inactive. Each regulation is tied to a specific regulatory sign and roadway segment, creating a direct chain from legal rule to physical enforcement device.

**Table `traffic_regulations`**

| id | regulation_code | regulation_type | effective_date | jurisdiction | penalty_amount | is_active | regulatory_sign_id | roadway_segment_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 5917296 | speed_limit | 2023-02-14 | state | 2,604 | true | 1000 | 1 |
| 1001 | 82874 | stop | 2024-07-25 | county | 442.51 | false | 1001 | 2 |
| 1002 | 1336197 | yield | 2025-12-09 | municipal | 1,997 | true | 1002 | 3 |
| 1003 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | no_turn | 2022-05-20 | state | 3,813 | false | 1003 | 4 |

## Roadway Segment Classification

The physical infrastructure where signs and regulations operate is organized into roadway segments, each defined by a geographic span, surface characteristics, and lane configuration. Segment SEG-2495, named Composite Model, extends from mile marker 19.45 to mile marker 1.70, features an asphalt surface, and contains six lanes with a posted speed limit of 24. Segment SEG-2502, Compact Cluster A, runs from mile marker 21.90 to 3.40 on a concrete surface with two lanes and a speed limit of 27. Segment SEG-2509, Legacy Review, covers the stretch between mile markers 24.35 and 5.10, has a gravel surface, three lanes, and a speed limit of 30. Segment SEG-2516, Regional Initiative, spans mile markers 26.80 to 6.80, is paved with asphalt, has four lanes, and a speed limit of 33. Each segment was created on a specific date and is associated with one regulatory sign and one traffic regulation, anchoring the abstract rules to concrete stretches of road.

**Table `roadway_segments`**

| roadway_segment_id | segment_identifier | road_name | start_mile_marker | end_mile_marker | surface_type | lane_count | speed_limit | regulatory_sign_id | traffic_regulation_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | SEG-2495 | Composite Model | 19.45 | 1.70 | asphalt | 6 | 24 | 1000 | 1000 | 2025-01-01 00:14:00 |
| 2 | SEG-2502 | Compact Cluster A | 21.90 | 3.40 | concrete | 2 | 27 | 1001 | 1001 | 2025-02-06 03:14:00 |
| 3 | SEG-2509 | Legacy Review | 24.35 | 5.10 | gravel | 3 | 30 | 1002 | 1002 | 2025-03-11 06:14:00 |
| 4 | SEG-2516 | Regional Initiative | 26.80 | 6.80 | asphalt | 4 | 33 | 1003 | 1003 | 2025-04-16 09:14:00 |

## Sign Standards and Compliance

Sign standards define the technical specifications that each regulatory sign must meet, covering physical dimensions, legend requirements, retroreflectivity levels, and illumination mandates. Standard L459, version compact-standard-86, requires a compact-sized sign with legend legacy-required-19, demands a high retroreflectivity level, and does not require illumination. Standard account_pymes_596, version composite-standard-87, specifies a composite-sized sign with legend compact-required-20, calls for medium retroreflectivity, and mandates illumination. Standard 9125613, version primary-standard-88, requires a primary-sized sign with legend composite-required-21, sets a low retroreflectivity level, and has no illumination requirement. Standard 8189504, version adaptive-standard-89, prescribes an adaptive-sized sign with legend primary-required-22, requires high retroreflectivity, and mandates illumination. Each standard is linked to a specific regulatory sign, establishing the compliance baseline for that device.

**Table `sign_standards`**

| id | standard_code | standard_version | required_size | required_legend | retroreflectivity_level | illumination_requirement | regulatory_sign_id |
|---|---|---|---|---|---|---|---|
| 1 | L459 | compact-standard-86 | compact-required-50 | legacy-required-19 | high | false | 1000 |
| 2 | account_pymes_596 | composite-standard-87 | composite-required-51 | compact-required-20 | medium | true | 1001 |
| 3 | 9125613 | primary-standard-88 | primary-required-52 | composite-required-21 | low | false | 1002 |
| 4 | 8189504 | adaptive-standard-89 | adaptive-required-53 | primary-required-22 | high | true | 1003 |

## Cross-Referenced Sign-Regulation Records

The view v_regulatory_sign_traffic_regulation joins the regulatory signs table with the traffic regulations table on the traffic_regulation_id foreign key, answering the question of which sign enforces which regulation. This join produces a flat record for each sign-regulation pair, carrying the sign's identifier, message, and shape alongside the regulation's code and type. For example, sign SIG-2078 (octagon, message legacy-sign-13) is joined to regulation 5917296 of type speed_limit, confirming that the octagonal red sign at this location enforces the speed limit rule. Sign SIG-2079 (rectangle, message compact-sign-14) maps to regulation 82874 of type stop, indicating the rectangular white sign governs the stop requirement. Sign SIG-2080 (circle, message composite-sign-15) links to regulation 1336197 of type yield, and sign SIG-2081 (diamond, message primary-sign-16) links to regulation 57e54d62-8fcd-11eb-924d-9cd76263cbd0 of type no_turn. This view is the primary reference for auditors verifying that every active sign has a corresponding regulation in force.

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

## Sign-to-Roadway Mapping

The view v_regulatory_sign_roadway_segment joins regulatory signs with roadway segments on the roadway_segment_id foreign key, answering which physical stretch of road each sign is installed on. The result carries the sign's identifying attributes alongside the segment's identifier and road name, enabling field crews to locate a sign by its road segment. Sign SIG-2078 (octagon, message legacy-sign-13) is located on segment 1, identified as SEG-2495 and named Composite Model. Sign SIG-2079 (rectangle, message compact-sign-14) is on segment 2, SEG-2502, Compact Cluster A. Sign SIG-2080 (circle, message composite-sign-15) sits on segment 3, SEG-2509, Legacy Review. Sign SIG-2081 (diamond, message primary-sign-16) is installed on segment 4, SEG-2516, Regional Initiative. This mapping is essential for maintenance scheduling, as crews can query by road name to retrieve all signs requiring inspection or replacement along a given corridor.

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

## Sign Standard Compliance Records

The view v_regulatory_sign_sign_standard joins regulatory signs with sign standards on the sign_standard_id foreign key, answering which technical standard each sign must satisfy. The joined record presents the sign's physical description alongside the standard's code, version, size requirement, legend specification, retroreflectivity level, and illumination mandate. Sign SIG-2078 (octagon, message legacy-sign-13) is governed by standard L459, version compact-standard-86, which requires a compact-sized sign, legend legacy-required-19, high retroreflectivity, and no illumination. Sign SIG-2079 (rectangle, message compact-sign-14) falls under standard account_pymes_596, version composite-standard-87, specifying a composite-sized sign, legend compact-required-20, medium retroreflectivity, and mandatory illumination. Sign SIG-2080 (circle, message composite-sign-15) is subject to standard 9125613, version primary-standard-88, requiring a primary-sized sign, legend composite-required-21, low retroreflectivity, and no illumination. Sign SIG-2081 (diamond, message primary-sign-16) complies with standard 8189504, version adaptive-standard-89, which mandates an adaptive-sized sign, legend primary-required-22, high retroreflectivity, and illumination. This view supports compliance audits by surfacing any sign whose physical attributes diverge from its prescribed standard.

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

## Regulation-to-Sign Associations

The view v_traffic_regulation_regulatory_sign performs the inverse join of the sign-regulation relationship, linking traffic regulations to their enforcing signs via the regulatory_sign_id foreign key. This perspective is useful when a regulation code or type is the starting point—for instance, when a legal team needs to identify which physical sign enforces a given rule. Regulation 5917296 (speed_limit) is enforced by sign SIG-2078, an octagonal device carrying message legacy-sign-13. Regulation 82874 (stop) is enforced by sign SIG-2079, a rectangular device with message compact-sign-14. Regulation 1336197 (yield) is enforced by sign SIG-2080, a circular device carrying message composite-sign-15. Regulation 57e54d62-8fcd-11eb-924d-9cd76263cbd0 (no_turn) is enforced by sign SIG-2081, a diamond-shaped device with message primary-sign-16. This view ensures that every active regulation has a corresponding sign on the ground and that no sign is enforcing a regulation that has been revoked.

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

## Regulation-to-Roadway Linkages

The view v_traffic_regulation_roadway_segment joins traffic regulations with roadway segments on the roadway_segment_id foreign key, answering which regulation applies to which stretch of road. The result pairs the regulation's code and type with the segment's identifier and road name, providing a jurisdictional and geographic context for enforcement. Regulation 5917296 (speed_limit) applies to segment 1, SEG-2495, Composite Model. Regulation 82874 (stop) applies to segment 2, SEG-2502, Compact Cluster A. Regulation 1336197 (yield) applies to segment 3, SEG-2509, Legacy Review. Regulation 57e54d62-8fcd-11eb-924d-9cd76263cbd0 (no_turn) applies to segment 4, SEG-2516, Regional Initiative. Planners use this view to verify that speed limits and other regulatory rules are consistently posted along contiguous segments and to identify gaps where a regulation exists but no sign has been installed.

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

## Roadway-to-Sign Assignments

The view v_roadway_segment_regulatory_sign joins roadway segments with regulatory signs on the regulatory_sign_id foreign key, answering which sign is assigned to each roadway segment. This perspective is oriented around the physical infrastructure: given a road segment, what sign devices are responsible for enforcing rules there? Segment 1, SEG-2495 (Composite Model), is assigned sign SIG-2078, an octagonal device carrying message legacy-sign-13. Segment 2, SEG-2502 (Compact Cluster A), is assigned sign SIG-2079, a rectangular device with message compact-sign-14. Segment 3, SEG-2509 (Legacy Review), is assigned sign SIG-2080, a circular device carrying message composite-sign-15. Segment 4, SEG-2516 (Regional Initiative), is assigned sign SIG-2081, a diamond-shaped device with message primary-sign-16. Maintenance teams rely on this view to generate work orders by segment, ensuring that every roadway has its designated signs in place and operational.

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

## Roadway-to-Regulation Assignments

The view v_roadway_segment_traffic_regulation joins roadway segments with traffic regulations on the traffic_regulation_id foreign key, answering which regulation is in effect on each roadway segment. The joined record presents the segment's identifier and road name alongside the regulation's code and type, providing a direct mapping from geography to legal rule. Segment 1, SEG-2495 (Composite Model), is governed by regulation 5917296 of type speed_limit. Segment 2, SEG-2502 (Compact Cluster A), is governed by regulation 82874 of type stop. Segment 3, SEG-2509 (Legacy Review), is governed by regulation 1336197 of type yield. Segment 4, SEG-2516 (Regional Initiative), is governed by regulation 57e54d62-8fcd-11eb-924d-9cd76263cbd0 of type no_turn. This view is the primary reference for legal compliance reviews, enabling authorities to confirm that every roadway segment has an active regulation and that the posted signs accurately reflect the current rules.

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

## Sign Standard-to-Sign Compliance

The view v_sign_standard_regulatory_sign joins sign standards with regulatory signs on the regulatory_sign_id foreign key, answering which sign is subject to which technical standard. This perspective is oriented around the standard: given a standard, which signs must conform to it? The joined record carries the standard's code, version, size requirement, legend specification, retroreflectivity level, and illumination mandate alongside the sign's identifier, message, and shape. Standard L459 (compact-standard-86) applies to sign SIG-2078, an octagonal device carrying message legacy-sign-13. Standard account_pymes_596 (composite-standard-87) applies to sign SIG-2079, a rectangular device with message compact-sign-14. Standard 9125613 (primary-standard-88) applies to sign SIG-2080, a circular device carrying message composite-sign-15. Standard 8189504 (adaptive-standard-89) applies to sign SIG-2081, a diamond-shaped device with message primary-sign-16. Procurement and quality assurance teams use this view to verify that every sign in the field meets the retroreflectivity and illumination requirements of its governing standard before it is approved for installation.

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

## Closing Synthesis

The regulatory sign ecosystem is a tightly coupled system of four base tables and eight cross-referenced views that together answer every operational question a transportation authority might ask. The base tables—regulatory signs, traffic regulations, roadway segments, and sign standards—store the authoritative records for physical devices, legal rules, geographic spans, and technical specifications. The views join these tables along their foreign keys to produce flat, queryable records that answer specific questions: which sign enforces which regulation, which segment carries which sign, which standard governs which device, and so on. Each view is a different lens on the same underlying relationships, and each lens is necessary for a different operational role—field crews, legal auditors, procurement officers, and maintenance planners all depend on the view that aligns with their workflow. The data, though fictional in its identifiers and names, illustrates a real-world architecture: a system where every sign has a regulation, every regulation has a roadway, every roadway has a sign, and every sign has a standard, and where the integrity of the entire network depends on the consistency of these links.