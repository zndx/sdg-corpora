The municipal traffic management domain revolves around a single governing concept: every physical sign, every road segment, every vehicle class, and every licensed operator is bound to a rule. That rule is the pivot of the entire schema. The `traffic_rules` table sits at the centre of a star-like normalised model, with five surrounding base tables each holding a slice of the domain—signs, streets, vehicles, operators, and municipal codes—and each table reaching back to `traffic_rules` through a `rule_code` column. The views then reassemble these fragments into readable, fact-level rows that answer concrete operational questions.

## Base Tables and Their Columns

The `traffic_control_signs` table records the physical hardware deployed along the road network. Each row carries a surrogate `traffic_control_sign_id`, a human-readable `sign_identifier` such as `SIG-2078`, and a `sign_type` drawn from a small vocabulary: `STOP`, `YIELD`, `ONE-WAY`, and `NO-PASSING`. Lifecycle metadata includes `installation_date` and `last_inspection_date`, while `compliance_status` tracks whether the sign meets current standards (`COMPLIANT`, `NON-COMPLIANT`, `PENDING_REVIEW`). The `manual_revision` column stores a reference to the governing maintenance manual, for example `adaptive-manual-59`. Two foreign keys anchor the sign to the rest of the model: `street_segment_id` points to the road segment on which the sign is mounted, and `rule_code` points to the rule that the sign enforces.

**Table `traffic_control_signs`**

| traffic_control_sign_id | sign_identifier | sign_type | installation_date | last_inspection_date | compliance_status | manual_revision | street_segment_id | rule_code |
|---|---|---|---|---|---|---|---|---|
| 1000 | SIG-2078 | STOP | 2022-01-10 | 2025-04-12 | COMPLIANT | adaptive-manual-59 | 100 | 2839520 |
| 1001 | SIG-2079 | YIELD | 2023-06-21 | 2022-09-23 | NON-COMPLIANT | distributed-manual-60 | 101 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1002 | SIG-2080 | ONE-WAY | 2024-11-05 | 2023-02-07 | PENDING_REVIEW | baseline-manual-61 | 102 | romeg_ul |
| 1003 | SIG-2081 | NO-PASSING | 2025-04-16 | 2024-07-18 | COMPLIANT | pilot-manual-62 | 103 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 |

The `traffic_rules` table is the schema's central hub. Its primary key is `rule_code`, which in this dataset mixes plain integers like `2839520` with UUIDs such as `72623baa-9bad-11eb-a8a2-19ed5c03f8d3`. The `rule_description` column carries human-readable labels—`Integrated Series A`, `Extended Assessment`, `Pilot Survey`, `Baseline Corridor D`—while `enforcement_level` classifies the rule as `CITABLE`, `WARNING`, or `MANDATORY`. Temporal boundaries are captured by `effective_date` and `repeal_date`, allowing rules to be active, expired, or future-dated. Two additional foreign keys, `municipal_code_id` and `vehicle_class_id`, link the rule to its legal source and its applicable vehicle class respectively.

**Table `traffic_rules`**

| rule_code | rule_description | enforcement_level | effective_date | repeal_date | municipal_code_id | vehicle_class_id |
|---|---|---|---|---|---|---|
| 2839520 | Integrated Series A | CITABLE | 2023-02-14 | 2024-03-18 | 1 | 100 |
| 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | WARNING | 2024-07-25 | 2025-08-02 | 2 | 101 |
| romeg_ul | Pilot Survey | MANDATORY | 2025-12-09 | 2022-01-13 | 3 | 102 |
| 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | CITABLE | 2022-05-20 | 2023-06-24 | 4 | 103 |

The `street_segments` table describes the physical road network. Its surrogate key `id` doubles as the target of the `street_segment_id` foreign key in `traffic_control_signs`. Each row also stores a `segment_id` (a business identifier, e.g. `422a03c4-8fcc-11eb-924d-9cd76263cbd0`), a `street_name` such as `Primary Standard A`, and structural attributes: `lane_count` (an integer from 2 to 6), boolean flags `is_one_way` and `is_closed_for_repairs`, and `surface_type` (`ASPHALT`, `CONCRETE`, `GRAVEL`). Like the sign table, `street_segments` holds a `traffic_control_sign_id` foreign key pointing back to `traffic_control_signs` and a `rule_code` foreign key pointing to `traffic_rules`, creating a bidirectional link between streets and signs.

**Table `street_segments`**

| id | segment_id | street_name | lane_count | is_one_way | is_closed_for_repairs | surface_type | traffic_control_sign_id | rule_code | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Primary Standard A | 6 | true | false | ASPHALT | 1000 | 2839520 | 2025-01-01 00:14:00 |
| 101 | 32825 | Composite Framework | 2 | false | true | CONCRETE | 1001 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-02-06 03:14:00 |
| 102 | 974920 | Compact Protocol | 3 | true | false | GRAVEL | 1002 | romeg_ul | 2025-03-11 06:14:00 |
| 103 | 2933482 | Legacy Programme D | 4 | false | true | ASPHALT | 1003 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-16 09:14:00 |

The `vehicle_classes` table enumerates categories of vehicles subject to the rules. Its surrogate `id` is referenced by `traffic_rules.vehicle_class_id` and by `vehicle_operators.vehicle_class_id`. The `vehicle_class_code` column stores either a UUID (e.g. `e9525746-8fd1-11eb-924d-9cd76263cbd0`) or a short numeric code (`103166`, `8092`). The `class_description` provides a readable label such as `Baseline Framework D` or `Distributed Protocol`. Three boolean columns—`requires_muffler`, `requires_brakes`, and `requires_lights`—capture equipment mandates. An `operator_id` foreign key links each class to its primary operator, and a `rule_code` foreign key ties the class to the governing rule.

**Table `vehicle_classes`**

| id | vehicle_class_code | class_description | requires_muffler | requires_brakes | requires_lights | rule_code | operator_id |
|---|---|---|---|---|---|---|---|
| 100 | e9525746-8fd1-11eb-924d-9cd76263cbd0 | Baseline Framework D | false | false | false | 2839520 | 9736895 |
| 101 | 103166 | Distributed Protocol | true | true | true | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | 195359 |
| 102 | 8092 | Adaptive Programme | false | false | false | romeg_ul | 5082968 |
| 103 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Primary Standard A | true | true | true | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 |

The `vehicle_operators` table holds the individuals or entities authorised to operate vehicles. Its primary key `operator_id` is referenced by `vehicle_classes.operator_id`. Each row stores a `license_number` (e.g. `LIC-2589`), a `license_status` (`VALID`, `SUSPENDED`, `REVOKED`), and `last_violation_date`. The `vehicle_class_id` foreign key identifies which class the operator is licensed for, while `rule_code` again points to the governing rule.

**Table `vehicle_operators`**

| operator_id | license_number | license_status | last_violation_date | vehicle_class_id | rule_code |
|---|---|---|---|---|---|
| 9736895 | LIC-2589 | VALID | 2025-04-07 | 100 | 2839520 |
| 195359 | LIC-2596 | SUSPENDED | 2022-09-18 | 101 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 |
| 5082968 | LIC-2603 | REVOKED | 2023-02-02 | 102 | romeg_ul |
| b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | LIC-2610 | VALID | 2024-07-13 | 103 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 |

Finally, the `municipal_codes` table captures the legal statutes under which rules are enacted. Its surrogate `id` is referenced by `traffic_rules.municipal_code_id`. The `code_title`, `code_chapter`, and `code_section` columns store the hierarchical reference within a municipal codebook; values range from pure integers (`3744018`, `32815`) to mixed alphanumeric strings (`state_uk_13`, `1202-0001-M`). The `enactment_date` and `amendment_date` columns track the legislative timeline, and a `rule_code` foreign key links the code to the rule it supports.

**Table `municipal_codes`**

| id | code_title | code_chapter | code_section | enactment_date | amendment_date | rule_code |
|---|---|---|---|---|---|---|
| 1 | 3744018 | 32815 | 1336171 | 2022-01-04 | 2024-11-19 | 2839520 |
| 2 | 4463644 | state_uk_13 | 99762 | 2023-06-15 | 2025-04-03 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 |
| 3 | 8350031 | 1202-0001-M | a0f8ceb6-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-26 | 2022-09-14 | romeg_ul |
| 4 | 1250224 | ff3f52c5-6ef5-4176-84f0-ec4e90d617a9 | 4463672 | 2025-04-10 | 2023-02-25 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 |

## Views: Reconstructing Domain Facts

Each view is a `JOIN` that collapses the normalised fragments back into a single, queryable row. The views fall into three families: sign-centric, street-centric, and operator-centric, with a few cross-cutting views that expose the rule-to-code and rule-to-class relationships directly.

### Sign-to-Segment and Sign-to-Rule Views

The view `v_traffic_control_sign_street_segment` joins `traffic_control_signs` to `street_segments` on `street_segment_id = id`, producing a row that answers "which sign is on which street, and what are the street's physical characteristics?" A representative row shows sign `SIG-2078` (type `STOP`, status `COMPLIANT`) installed on segment `Primary Standard A`, a six-lane `ASPHALT` road that is one-way and open for repairs.

The view `v_traffic_control_sign_traffic_rule` joins `traffic_control_signs` to `traffic_rules` on `rule_code`, answering "which rule does this sign enforce?" The row for `SIG-2079` (type `YIELD`, status `NON-COMPLIANT`) reveals that it enforces rule `Extended Assessment` (`72623baa-9bad-11eb-a8a2-19ed5c03f8d3`), an `WARNING`-level rule that was effective from 2024-07-25 until 2025-08-02.

### Rule-to-Municipal-Code and Rule-to-Vehicle-Class Views

The view `v_traffic_rule_municipal_code` joins `traffic_rules` to `municipal_codes` on `municipal_code_id = id`, answering "under which municipal statute is this rule enacted?" The row for rule `Integrated Series A` (`2839520`) shows it is codified under title `3744018`, chapter `32815`, section `1336171`, enacted on 2022-01-04 and amended on 2024-11-19.

The view `v_traffic_rule_vehicle_class` joins `traffic_rules` to `vehicle_classes` on `vehicle_class_id = id`, answering "which vehicle class does this rule apply to?" The row for rule `Extended Assessment` links to vehicle class `Distributed Protocol` (`103166`), a class that requires muffler, brakes, and lights.

### Street-to-Sign and Street-to-Rule Views

The view `v_street_segment_traffic_control_sign` joins `street_segments` to `traffic_control_signs` on `traffic_control_sign_id = traffic_control_sign_id`, answering "which sign is associated with this street segment?" The row for segment `Composite Framework` (id `101`, surface `CONCRETE`, two lanes, closed for repairs) shows it is linked to sign `SIG-2079` (type `YIELD`, status `NON-COMPLIANT`).

The view `v_street_segment_traffic_rule` joins `street_segments` to `traffic_rules` on `rule_code`, answering "which rule governs this street segment?" The row for segment `Compact Protocol` (id `102`, three lanes, one-way, `GRAVEL` surface) reveals it is governed by rule `Pilot Survey` (`romeg_ul`), a `MANDATORY` rule.

### Vehicle-Class-to-Rule and Vehicle-Class-to-Operator Views

The view `v_vehicle_class_traffic_rule` joins `vehicle_classes` to `traffic_rules` on `rule_code`, answering "which rule applies to this vehicle class?" The row for class `Baseline Framework D` (`e9525746-8fd1-11eb-924d-9cd76263cbd0`) shows it is subject to rule `Integrated Series A` (`2839520`), a `CITABLE` rule.

The view `v_vehicle_class_vehicle_operator` joins `vehicle_classes` to `vehicle_operators` on `operator_id = operator_id`, answering "which operator is licensed for this vehicle class?" The row for class `Adaptive Programme` (`8092`) links to operator `LIC-2603`, whose license status is `REVOKED` and whose last violation was on 2023-02-02.

### Operator-to-Class and Operator-to-Rule Views

The view `v_vehicle_operator_vehicle_class` joins `vehicle_operators` to `vehicle_classes` on `vehicle_class_id = id`, answering "which vehicle class does this operator hold?" The row for operator `LIC-2589` (status `VALID`, last violation 2025-04-07) shows they are licensed for class `Baseline Framework D`, which does not require muffler, brakes, or lights.

The view `v_vehicle_operator_traffic_rule` joins `vehicle_operators` to `traffic_rules` on `rule_code`, answering "which rule governs this operator's licence?" The row for operator `LIC-2610` (status `VALID`, last violation 2024-07-13) reveals they are governed by rule `Baseline Corridor D` (`73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3`), a `CITABLE` rule effective from 2022-05-20 to 2023-06-24.

### Municipal-Code-to-Rule View

The view `v_municipal_code_traffic_rule` joins `municipal_codes` to `traffic_rules` on `rule_code`, answering "which rule is supported by this municipal code?" The row for code title `1250224`, chapter `ff3f52c5-6ef5-4176-84f0-ec4e90d617a9`, section `4463672` (enacted 2025-04-10, amended 2023-02-25) shows it supports rule `Baseline Corridor D` (`73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3`), a `CITABLE` rule.

## Synthesis

The schema is built around a single pivot: `traffic_rules`. Every base table either points to `traffic_rules` through a `rule_code` foreign key or reaches it indirectly through a chain of joins. The `traffic_control_signs` table anchors signs to streets and rules; `street_segments` anchors streets to signs and rules; `vehicle_classes` and `vehicle_operators` anchor vehicle categories and their licence-holders to rules; and `municipal_codes` anchors the legal statutes to rules. The views then project these relationships in every direction needed by operational queries—sign-to-street, sign-to-rule, street-to-sign, street-to-rule, rule-to-code, rule-to-class, class-to-operator, operator-to-class, operator-to-rule, and code-to-rule—each view collapsing the normalised fragments back into a single, human-readable row that answers a concrete question about the municipal traffic domain.

## Data appendix

**View `v_traffic_control_sign_street_segment`**

```sql
CREATE VIEW v_traffic_control_sign_street_segment AS
SELECT a.traffic_control_sign_id, a.sign_identifier, a.sign_type, a.installation_date, b.id AS segment_id, b.segment_id AS segment_segment_id, b.street_name AS segment_street_name
FROM traffic_control_signs a JOIN street_segments b ON a.street_segment_id = b.id;
```

| traffic_control_sign_id | sign_identifier | sign_type | installation_date | segment_id | segment_segment_id | segment_street_name |
|---|---|---|---|---|---|---|
| 1000 | SIG-2078 | STOP | 2022-01-10 | 100 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Primary Standard A |
| 1001 | SIG-2079 | YIELD | 2023-06-21 | 101 | 32825 | Composite Framework |
| 1002 | SIG-2080 | ONE-WAY | 2024-11-05 | 102 | 974920 | Compact Protocol |
| 1003 | SIG-2081 | NO-PASSING | 2025-04-16 | 103 | 2933482 | Legacy Programme D |

**View `v_traffic_control_sign_traffic_rule`**

```sql
CREATE VIEW v_traffic_control_sign_traffic_rule AS
SELECT a.traffic_control_sign_id, a.sign_identifier, a.sign_type, a.installation_date, b.rule_code AS rule_rule_code, b.rule_description AS rule_rule_description, b.enforcement_level AS rule_enforcement_level
FROM traffic_control_signs a JOIN traffic_rules b ON a.rule_code = b.rule_code;
```

| traffic_control_sign_id | sign_identifier | sign_type | installation_date | rule_rule_code | rule_rule_description | rule_enforcement_level |
|---|---|---|---|---|---|---|
| 1000 | SIG-2078 | STOP | 2022-01-10 | 2839520 | Integrated Series A | CITABLE |
| 1001 | SIG-2079 | YIELD | 2023-06-21 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | WARNING |
| 1002 | SIG-2080 | ONE-WAY | 2024-11-05 | romeg_ul | Pilot Survey | MANDATORY |
| 1003 | SIG-2081 | NO-PASSING | 2025-04-16 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | CITABLE |

**View `v_traffic_rule_municipal_code`**

```sql
CREATE VIEW v_traffic_rule_municipal_code AS
SELECT a.rule_code, a.rule_description, a.enforcement_level, a.effective_date, b.id AS code_id, b.code_title AS code_code_title, b.code_chapter AS code_code_chapter
FROM traffic_rules a JOIN municipal_codes b ON a.municipal_code_id = b.id;
```

| rule_code | rule_description | enforcement_level | effective_date | code_id | code_code_title | code_code_chapter |
|---|---|---|---|---|---|---|
| 2839520 | Integrated Series A | CITABLE | 2023-02-14 | 1 | 3744018 | 32815 |
| 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | WARNING | 2024-07-25 | 2 | 4463644 | state_uk_13 |
| romeg_ul | Pilot Survey | MANDATORY | 2025-12-09 | 3 | 8350031 | 1202-0001-M |
| 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | CITABLE | 2022-05-20 | 4 | 1250224 | ff3f52c5-6ef5-4176-84f0-ec4e90d617a9 |

**View `v_traffic_rule_vehicle_class`**

```sql
CREATE VIEW v_traffic_rule_vehicle_class AS
SELECT a.rule_code, a.rule_description, a.enforcement_level, a.effective_date, b.id AS class_id, b.vehicle_class_code AS class_vehicle_class_code, b.class_description AS class_class_description
FROM traffic_rules a JOIN vehicle_classes b ON a.vehicle_class_id = b.id;
```

| rule_code | rule_description | enforcement_level | effective_date | class_id | class_vehicle_class_code | class_class_description |
|---|---|---|---|---|---|---|
| 2839520 | Integrated Series A | CITABLE | 2023-02-14 | 100 | e9525746-8fd1-11eb-924d-9cd76263cbd0 | Baseline Framework D |
| 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | WARNING | 2024-07-25 | 101 | 103166 | Distributed Protocol |
| romeg_ul | Pilot Survey | MANDATORY | 2025-12-09 | 102 | 8092 | Adaptive Programme |
| 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | CITABLE | 2022-05-20 | 103 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Primary Standard A |

**View `v_street_segment_traffic_control_sign`**

```sql
CREATE VIEW v_street_segment_traffic_control_sign AS
SELECT a.id, a.segment_id, a.street_name, a.lane_count, b.traffic_control_sign_id AS sign_traffic_control_sign_id, b.sign_identifier AS sign_sign_identifier, b.sign_type AS sign_sign_type
FROM street_segments a JOIN traffic_control_signs b ON a.traffic_control_sign_id = b.traffic_control_sign_id;
```

| id | segment_id | street_name | lane_count | sign_traffic_control_sign_id | sign_sign_identifier | sign_sign_type |
|---|---|---|---|---|---|---|
| 100 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Primary Standard A | 6 | 1000 | SIG-2078 | STOP |
| 101 | 32825 | Composite Framework | 2 | 1001 | SIG-2079 | YIELD |
| 102 | 974920 | Compact Protocol | 3 | 1002 | SIG-2080 | ONE-WAY |
| 103 | 2933482 | Legacy Programme D | 4 | 1003 | SIG-2081 | NO-PASSING |

**View `v_street_segment_traffic_rule`**

```sql
CREATE VIEW v_street_segment_traffic_rule AS
SELECT a.id, a.segment_id, a.street_name, a.lane_count, b.rule_code AS rule_rule_code, b.rule_description AS rule_rule_description, b.enforcement_level AS rule_enforcement_level
FROM street_segments a JOIN traffic_rules b ON a.rule_code = b.rule_code;
```

| id | segment_id | street_name | lane_count | rule_rule_code | rule_rule_description | rule_enforcement_level |
|---|---|---|---|---|---|---|
| 100 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Primary Standard A | 6 | 2839520 | Integrated Series A | CITABLE |
| 101 | 32825 | Composite Framework | 2 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | WARNING |
| 102 | 974920 | Compact Protocol | 3 | romeg_ul | Pilot Survey | MANDATORY |
| 103 | 2933482 | Legacy Programme D | 4 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | CITABLE |

**View `v_vehicle_class_traffic_rule`**

```sql
CREATE VIEW v_vehicle_class_traffic_rule AS
SELECT a.id, a.vehicle_class_code, a.class_description, a.requires_muffler, b.rule_code AS rule_rule_code, b.rule_description AS rule_rule_description, b.enforcement_level AS rule_enforcement_level
FROM vehicle_classes a JOIN traffic_rules b ON a.rule_code = b.rule_code;
```

| id | vehicle_class_code | class_description | requires_muffler | rule_rule_code | rule_rule_description | rule_enforcement_level |
|---|---|---|---|---|---|---|
| 100 | e9525746-8fd1-11eb-924d-9cd76263cbd0 | Baseline Framework D | false | 2839520 | Integrated Series A | CITABLE |
| 101 | 103166 | Distributed Protocol | true | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | WARNING |
| 102 | 8092 | Adaptive Programme | false | romeg_ul | Pilot Survey | MANDATORY |
| 103 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Primary Standard A | true | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | CITABLE |

**View `v_vehicle_class_vehicle_operator`**

```sql
CREATE VIEW v_vehicle_class_vehicle_operator AS
SELECT a.id, a.vehicle_class_code, a.class_description, a.requires_muffler, b.operator_id AS operator_operator_id, b.license_number AS operator_license_number, b.license_status AS operator_license_status
FROM vehicle_classes a JOIN vehicle_operators b ON a.operator_id = b.operator_id;
```

| id | vehicle_class_code | class_description | requires_muffler | operator_operator_id | operator_license_number | operator_license_status |
|---|---|---|---|---|---|---|
| 100 | e9525746-8fd1-11eb-924d-9cd76263cbd0 | Baseline Framework D | false | 9736895 | LIC-2589 | VALID |
| 101 | 103166 | Distributed Protocol | true | 195359 | LIC-2596 | SUSPENDED |
| 102 | 8092 | Adaptive Programme | false | 5082968 | LIC-2603 | REVOKED |
| 103 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Primary Standard A | true | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | LIC-2610 | VALID |

**View `v_vehicle_operator_vehicle_class`**

```sql
CREATE VIEW v_vehicle_operator_vehicle_class AS
SELECT a.operator_id, a.license_number, a.license_status, a.last_violation_date, b.id AS class_id, b.vehicle_class_code AS class_vehicle_class_code, b.class_description AS class_class_description
FROM vehicle_operators a JOIN vehicle_classes b ON a.vehicle_class_id = b.id;
```

| operator_id | license_number | license_status | last_violation_date | class_id | class_vehicle_class_code | class_class_description |
|---|---|---|---|---|---|---|
| 9736895 | LIC-2589 | VALID | 2025-04-07 | 100 | e9525746-8fd1-11eb-924d-9cd76263cbd0 | Baseline Framework D |
| 195359 | LIC-2596 | SUSPENDED | 2022-09-18 | 101 | 103166 | Distributed Protocol |
| 5082968 | LIC-2603 | REVOKED | 2023-02-02 | 102 | 8092 | Adaptive Programme |
| b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | LIC-2610 | VALID | 2024-07-13 | 103 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Primary Standard A |

**View `v_vehicle_operator_traffic_rule`**

```sql
CREATE VIEW v_vehicle_operator_traffic_rule AS
SELECT a.operator_id, a.license_number, a.license_status, a.last_violation_date, b.rule_code AS rule_rule_code, b.rule_description AS rule_rule_description, b.enforcement_level AS rule_enforcement_level
FROM vehicle_operators a JOIN traffic_rules b ON a.rule_code = b.rule_code;
```

| operator_id | license_number | license_status | last_violation_date | rule_rule_code | rule_rule_description | rule_enforcement_level |
|---|---|---|---|---|---|---|
| 9736895 | LIC-2589 | VALID | 2025-04-07 | 2839520 | Integrated Series A | CITABLE |
| 195359 | LIC-2596 | SUSPENDED | 2022-09-18 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | WARNING |
| 5082968 | LIC-2603 | REVOKED | 2023-02-02 | romeg_ul | Pilot Survey | MANDATORY |
| b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | LIC-2610 | VALID | 2024-07-13 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | CITABLE |

**View `v_municipal_code_traffic_rule`**

```sql
CREATE VIEW v_municipal_code_traffic_rule AS
SELECT a.id, a.code_title, a.code_chapter, a.code_section, b.rule_code AS rule_rule_code, b.rule_description AS rule_rule_description, b.enforcement_level AS rule_enforcement_level
FROM municipal_codes a JOIN traffic_rules b ON a.rule_code = b.rule_code;
```

| id | code_title | code_chapter | code_section | rule_rule_code | rule_rule_description | rule_enforcement_level |
|---|---|---|---|---|---|---|
| 1 | 3744018 | 32815 | 1336171 | 2839520 | Integrated Series A | CITABLE |
| 2 | 4463644 | state_uk_13 | 99762 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | WARNING |
| 3 | 8350031 | 1202-0001-M | a0f8ceb6-8fcd-11eb-924d-9cd76263cbd0 | romeg_ul | Pilot Survey | MANDATORY |
| 4 | 1250224 | ff3f52c5-6ef5-4176-84f0-ec4e90d617a9 | 4463672 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | CITABLE |
