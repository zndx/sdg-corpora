## Traffic Control Infrastructure and Regulatory Compliance

Municipal traffic management relies on a layered architecture of physical signage, regulatory rules, street-level infrastructure, and vehicle operator credentials. Each component carries precise identifiers, dates, and compliance states that together determine whether a roadway segment operates within legal and safety boundaries. The records below capture a snapshot of four street segments, their associated control signs, the rules governing vehicle movement, the classes of vehicles permitted, and the municipal codes that authorize each regulation. Understanding how these elements interlock is essential for auditors, traffic engineers, and compliance officers who must trace a violation from the curb back to the originating municipal code.

**Table `traffic_control_signs`**

| traffic_control_sign_id | sign_identifier | sign_type | installation_date | last_inspection_date | compliance_status | manual_revision | street_segment_id | rule_code |
|---|---|---|---|---|---|---|---|---|
| 1000 | SIG-2078 | STOP | 2022-01-10 | 2025-04-12 | COMPLIANT | adaptive-manual-59 | 100 | 2839520 |
| 1001 | SIG-2079 | YIELD | 2023-06-21 | 2022-09-23 | NON-COMPLIANT | distributed-manual-60 | 101 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1002 | SIG-2080 | ONE-WAY | 2024-11-05 | 2023-02-07 | PENDING_REVIEW | baseline-manual-61 | 102 | romeg_ul |
| 1003 | SIG-2081 | NO-PASSING | 2025-04-16 | 2024-07-18 | COMPLIANT | pilot-manual-62 | 103 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 |

Traffic control signs form the first layer of enforcement. Each sign carries a unique identifier such as SIG-2078 through SIG-2081, a type designation (STOP, YIELD, ONE-WAY, NO-PASSING), and a compliance status that ranges from COMPLIANT to NON-COMPLIANT to PENDING_REVIEW. The installation dates span from early 2022 to mid-2025, while last inspection dates reveal a maintenance gap: SIG-2079, a YIELD sign, was last inspected in September 2022 despite being installed in June 2023, a lag that coincides with its NON-COMPLIANT status. Each sign is anchored to a street segment via `street_segment_id` and tied to a rule through `rule_code`. The `manual_revision` field references the governing procedural manual, with entries like adaptive-manual-59 and distributed-manual-60 indicating different regulatory frameworks applied across the network.

**Table `traffic_rules`**

| rule_code | rule_description | enforcement_level | effective_date | repeal_date | municipal_code_id | vehicle_class_id |
|---|---|---|---|---|---|---|
| 2839520 | Integrated Series A | CITABLE | 2023-02-14 | 2024-03-18 | 1 | 100 |
| 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | Extended Assessment | WARNING | 2024-07-25 | 2025-08-02 | 2 | 101 |
| romeg_ul | Pilot Survey | MANDATORY | 2025-12-09 | 2022-01-13 | 3 | 102 |
| 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Corridor D | CITABLE | 2022-05-20 | 2023-06-24 | 4 | 103 |

Traffic rules serve as the regulatory backbone, each identified by a `rule_code` that may be a numeric string or a UUID. The rule descriptions—Integrated Series A, Extended Assessment, Pilot Survey, and Baseline Corridor D—encode the policy intent behind each regulation. Enforcement levels range from WARNING through CITABLE to MANDATORY, dictating the severity of non-compliance. Effective and repeal dates establish temporal validity: rule 2839520 (Integrated Series A) was effective from February 2023 through March 2024, while romeg_ul (Pilot Survey) has an effective date of December 2025 that lies in the future relative to the data snapshot, suggesting a rule pending activation. Each rule references a `municipal_code_id` and a `vehicle_class_id`, binding the regulation to both a jurisdictional authority and a vehicle category.

**Table `street_segments`**

| id | segment_id | street_name | lane_count | is_one_way | is_closed_for_repairs | surface_type | traffic_control_sign_id | rule_code | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Primary Standard A | 6 | true | false | ASPHALT | 1000 | 2839520 | 2025-01-01 00:14:00 |
| 101 | 32825 | Composite Framework | 2 | false | true | CONCRETE | 1001 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-02-06 03:14:00 |
| 102 | 974920 | Compact Protocol | 3 | true | false | GRAVEL | 1002 | romeg_ul | 2025-03-11 06:14:00 |
| 103 | 2933482 | Legacy Programme D | 4 | false | true | ASPHALT | 1003 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-04-16 09:14:00 |

Street segments represent the physical roadway infrastructure. Each segment has a `segment_id` (often a UUID or numeric code), a street name such as Primary Standard A or Composite Framework, and attributes including lane count, one-way designation, repair closure status, and surface type (ASPHALT, CONCRETE, GRAVEL). Segment 100, Primary Standard A, carries six lanes, operates as one-way, and uses an asphalt surface. Segment 101, Composite Framework, has two lanes, is not one-way, and is currently closed for repairs with a concrete surface. Every segment links to a `traffic_control_sign_id` and a `rule_code`, creating the physical-to-regulatory bridge. The `created_at` timestamps show segments were provisioned sequentially from January through April 2025.

**Table `vehicle_classes`**

| id | vehicle_class_code | class_description | requires_muffler | requires_brakes | requires_lights | rule_code | operator_id |
|---|---|---|---|---|---|---|---|
| 100 | e9525746-8fd1-11eb-924d-9cd76263cbd0 | Baseline Framework D | false | false | false | 2839520 | 9736895 |
| 101 | 103166 | Distributed Protocol | true | true | true | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | 195359 |
| 102 | 8092 | Adaptive Programme | false | false | false | romeg_ul | 5082968 |
| 103 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Primary Standard A | true | true | true | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 | b69ce49c-8fd1-11eb-924d-9cd76263cbd0 |

Vehicle classes categorize the types of vehicles subject to specific rules. Each class has a `vehicle_class_code` (UUID or numeric), a `class_description` such as Baseline Framework D or Distributed Protocol, and boolean flags for equipment requirements: `requires_muffler`, `requires_brakes`, and `requires_lights`. Classes 100 and 102 (Baseline Framework D and Adaptive Programme) have no equipment mandates, while classes 101 and 103 (Distributed Protocol and Primary Standard A) require all three safety features. Each vehicle class references a `rule_code` and an `operator_id`, establishing which regulation governs the class and which operator is authorized to manage it.

**Table `vehicle_operators`**

| operator_id | license_number | license_status | last_violation_date | vehicle_class_id | rule_code |
|---|---|---|---|---|---|
| 9736895 | LIC-2589 | VALID | 2025-04-07 | 100 | 2839520 |
| 195359 | LIC-2596 | SUSPENDED | 2022-09-18 | 101 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 |
| 5082968 | LIC-2603 | REVOKED | 2023-02-02 | 102 | romeg_ul |
| b69ce49c-8fd1-11eb-924d-9cd76263cbd0 | LIC-2610 | VALID | 2024-07-13 | 103 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 |

Vehicle operators hold the credentials that authorize vehicle operation. Each operator has an `operator_id`, a `license_number` (LIC-2589 through LIC-2610), and a `license_status` of VALID, SUSPENDED, or REVOKED. Operator 195359 (LIC-2596) holds a SUSPENDED license with a last violation date of September 2022, while operator 5082968 (LIC-2603) has a REVOKED license last violated in February 2023. Operators 9736895 and b69ce49c-8fd1-11eb-924d-9cd76263cbd0 maintain VALID status. Each operator is assigned a `vehicle_class_id` and a `rule_code`, completing the chain from person to vehicle to regulation.

**Table `municipal_codes`**

| id | code_title | code_chapter | code_section | enactment_date | amendment_date | rule_code |
|---|---|---|---|---|---|---|
| 1 | 3744018 | 32815 | 1336171 | 2022-01-04 | 2024-11-19 | 2839520 |
| 2 | 4463644 | state_uk_13 | 99762 | 2023-06-15 | 2025-04-03 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 |
| 3 | 8350031 | 1202-0001-M | a0f8ceb6-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-26 | 2022-09-14 | romeg_ul |
| 4 | 1250224 | ff3f52c5-6ef5-4176-84f0-ec4e90d617a9 | 4463672 | 2025-04-10 | 2023-02-25 | 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 |

Municipal codes provide the legal authority for each traffic rule. Each code entry has an `id`, a `code_title`, `code_chapter`, and `code_section` that together form a citation path. The enactment dates range from January 2022 to April 2025, while amendment dates show when each code was last modified. Code 1 (3744018) was enacted in January 2022 and amended in November 2024; code 3 (8350031) was enacted in November 2024 but amended in September 2022, indicating a retroactive amendment. Each municipal code references a `rule_code`, anchoring the legal text to the operational rule it authorizes.

### Junction Views: Tracing Compliance Across Domains

The joined views synthesize the base tables into actionable records that answer specific investigative questions. Each view represents a different analytical lens on the traffic control ecosystem.

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

This view joins traffic control signs with their host street segments, answering the question: which signs are deployed on which roadways, and what is their compliance posture? Consider the row for SIG-2078 on segment 100 (Primary Standard A): a STOP sign installed in January 2022, last inspected in April 2025, and marked COMPLIANT. By contrast, SIG-2079 on segment 101 (Composite Framework) is a YIELD sign with a NON-COMPLIANT status and a last inspection date of September 2022—nearly three years before the data snapshot. The view surfaces the operational risk: a non-compliant sign on a road segment that is itself closed for repairs may indicate deferred maintenance that should be prioritized once repairs conclude.

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

This view links signs directly to their governing rules, answering: what regulation does each sign enforce? SIG-2078 (STOP) enforces rule 2839520 (Integrated Series A), which carries a CITABLE enforcement level. SIG-2080 (ONE-WAY) enforces romeg_ul (Pilot Survey), a MANDATORY rule with a future effective date of December 2025. The temporal mismatch is notable: a ONE-WAY sign is installed and inspected (last inspection February 2023) under a rule that is not yet effective, suggesting either premature deployment or a rule that was enacted retroactively. SIG-2081 (NO-PASSING) enforces 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 (Baseline Corridor D), a CITABLE rule whose repeal date of June 2023 predates the sign's installation in April 2025, indicating the sign may be enforcing a repealed regulation.

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

This view maps rules to their authorizing municipal codes, answering: which jurisdiction enacted each rule? Rule 2839520 (Integrated Series A) is authorized by municipal code 1 (3744018, chapter 32815, section 1336171), enacted in January 2022 and amended in November 2024. Rule romeg_ul (Pilot Survey) is authorized by code 3 (8350031, chapter 1202-0001-M), enacted in November 2024 but amended in September 2022—a temporal inversion that warrants legal review. The view enables auditors to verify that every active rule has a valid, unamended municipal code backing it.

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

This view connects rules to the vehicle classes they govern, answering: which vehicle types fall under each regulation? Rule 2839520 applies to vehicle class 100 (Baseline Framework D), which requires no muffler, brakes, or lights. Rule 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 (Extended Assessment) applies to class 101 (Distributed Protocol), which mandates all three safety features. The enforcement level of WARNING for rule 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 contrasts with the CITABLE level for rule 2839520, suggesting that violations involving fully-equipped vehicles receive lighter penalties than those involving minimally-equipped vehicles.

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

This view presents street segments alongside their control signs, answering: what signage governs each roadway? Segment 100 (Primary Standard A, six lanes, asphalt, one-way) carries SIG-2078 (STOP, COMPLIANT). Segment 101 (Composite Framework, two lanes, concrete, closed for repairs) carries SIG-2079 (YIELD, NON-COMPLIANT). The view highlights a compliance gap: a road segment under active repair carries a non-compliant sign, which could create confusion for emergency or construction vehicles navigating the area. Segment 102 (Compact Protocol, three lanes, gravel, one-way) carries SIG-2080 (ONE-WAY, PENDING_REVIEW), indicating that the sign's compliance is under active assessment.

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

This view joins street segments with their governing rules, answering: what regulation applies to each roadway? Segment 100 enforces rule 2839520 (Integrated Series A, CITABLE). Segment 101 enforces rule 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 (Extended Assessment, WARNING). Segment 102 enforces romeg_ul (Pilot Survey, MANDATORY). The enforcement gradient across segments is notable: a six-lane one-way arterial road (segment 100) carries a CITABLE rule, while a three-lane gravel road (segment 102) carries a MANDATORY rule, suggesting that lower-capacity roads may be subject to stricter regulatory oversight.

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

This view maps vehicle classes to their governing rules, answering: which rule governs each vehicle type? Class 100 (Baseline Framework D) is governed by rule 2839520 (Integrated Series A). Class 101 (Distributed Protocol) is governed by rule 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 (Extended Assessment). Class 102 (Adaptive Programme) is governed by romeg_ul (Pilot Survey). Class 103 (Primary Standard A) is governed by 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 (Baseline Corridor D). The one-to-one mapping across all four records indicates a clean regulatory partitioning where each vehicle class has exactly one governing rule.

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

This view links vehicle classes to their authorized operators, answering: which operator manages each vehicle class? Class 100 is managed by operator 9736895 (LIC-2589, VALID). Class 101 is managed by operator 195359 (LIC-2596, SUSPENDED). Class 102 is managed by operator 5082968 (LIC-2603, REVOKED). Class 103 is managed by operator b69ce49c-8fd1-11eb-924d-9cd76263cbd0 (LIC-2610, VALID). The view reveals a critical compliance issue: two of four vehicle classes are managed by operators with non-valid licenses. A SUSPENDED operator managing a class that requires muffler, brakes, and lights (class 101) and a REVOKED operator managing a class with no equipment requirements (class 102) both represent authorization gaps that should trigger immediate reassignment.

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

This view presents vehicle operators alongside their assigned classes, answering: what vehicles does each operator control? Operator 9736895 (LIC-2589, VALID) controls class 100 (Baseline Framework D, no equipment requirements). Operator 195359 (LIC-2596, SUSPENDED) controls class 101 (Distributed Protocol, all equipment required). Operator 5082968 (LIC-2603, REVOKED) controls class 102 (Adaptive Programme, no equipment requirements). Operator b69ce49c-8fd1-11eb-924d-9cd76263cbd0 (LIC-2610, VALID) controls class 103 (Primary Standard A, all equipment required). The view underscores the operational risk of suspended and revoked operators retaining class assignments: even if the class has no equipment requirements, the operator's license status invalidates their authority to operate any vehicle under that class.

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

This view connects operators to the rules they must follow, answering: which regulation governs each operator's activities? Operator 9736895 follows rule 2839520 (Integrated Series A, CITABLE). Operator 195359 follows rule 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 (Extended Assessment, WARNING). Operator 5082968 follows romeg_ul (Pilot Survey, MANDATORY). Operator b69ce49c-8fd1-11eb-924d-9cd76263cbd0 follows 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 (Baseline Corridor D, CITABLE). The enforcement levels range from WARNING to MANDATORY, and the view enables compliance officers to prioritize inspections: operators following MANDATORY rules should receive higher-frequency audits than those following WARNING-level rules.

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

This view maps municipal codes to their authorized rules, answering: which rule does each municipal code authorize? Code 1 (3744018, chapter 32815, section 1336171) authorizes rule 2839520 (Integrated Series A). Code 2 (4463644, chapter state_uk_13, section 99762) authorizes rule 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 (Extended Assessment). Code 3 (8350031, chapter 1202-0001-M, section a0f8ceb6-8fcd-11eb-924d-9cd76263cbd0) authorizes rule romeg_ul (Pilot Survey). Code 4 (1250224, chapter ff3f52c5-6ef5-4176-84f0-ec4e90d617a9, section 4463672) authorizes rule 73a5d11c-9bac-11eb-a8a2-19ed5c03f8d3 (Baseline Corridor D). The one-to-one mapping confirms that each municipal code authorizes exactly one rule, and each rule is backed by exactly one code, forming a clean legal chain from municipal ordinance to operational enforcement.

### Synthesis

The traffic control ecosystem operates as an integrated system where physical signs, regulatory rules, roadway segments, vehicle classifications, operator credentials, and municipal codes form a continuous chain of accountability. A STOP sign on Primary Standard A (SIG-2078) is compliant because it was inspected recently and enforces a CITABLE rule (2839520) backed by municipal code 1, which governs vehicle class 100 managed by a VALID operator (9736895). By contrast, a YIELD sign on Composite Framework (SIG-2079) is non-compliant because its last inspection predates its installation by over a year, it enforces a WARNING-level rule (72623baa-9bad-11eb-a8a2-19ed5c03f8d3) under a municipal code (2) that was amended after its enactment, and the rule applies to a vehicle class (101) managed by a SUSPENDED operator (195359). Tracing any single violation through these joined views reveals not just where the failure occurred but which upstream authorization broke down, enabling targeted remediation rather than blanket policy changes.