---
chapter_id: ch_live_labrun_with_protocol_23f037
topic_id: 27
family: 02_observation_measurement
cited_terms: ['labrun_with_protocol', 'lane_compliance_behavior', 'legal_advocate_role']
model: engine-refine
---

The laboratory execution framework distinguishes between the protocol invocation itself and the runtime metadata that accompanies it, a separation enforced through a tripartite attribute model. Each protocol run—identified by a composite key such as `PROT-0001` through `PROT-0004`—is anchored to a concrete laboratory procedure: `MassSpec_LC_MS` paired with `Microbiome_QIIME2_Pipe`, `Nanopore_FC_Nine` bound to `SingleCell_Gelbead10x`, or `FlowCytometry_Panel7` applied to a `MassSpec_QTOF_Cal` calibration run. The attribute definitions themselves are catalogued in a schema table where each attribute carries a typed descriptor: `duration_seconds` maps to `xsd:decimal`, `end_time` to `xsd:dateTime`, `exit_code` to `xsd:integer`, and `host_name` to `xsd:string`. These type annotations are not decorative; they govern how values are stored, validated, and queried across the value tables that materialise the attribute–entity relationship.

Entity–attribute–value materialisation proceeds through four specialised value tables, each typed to its corresponding attribute definition. Decimal attributes such as `duration_seconds` resolve to values like `301.25`, `4042.33`, `6125.88`, and `1565.69`, all stored under `attr_id` `PROT-0001` and linked to their parent entities via `entity_id`. Integer-valued attributes—`exit_code` and its counterpart—carry whole-number results: `497`, `434`, `538`, `309`, distributed across `PROT-0001` and `PROT-0002` entities. String-valued attributes populate the `t_labrun_with_protocol_val_varchar` table with host identifiers like `node-b14`, log-level descriptors such as `Log Level 02`, and lifecycle states including `closeout` and `running`. Datetime attributes record temporal boundaries with ISO-8601 precision: `2023-11-19T15:13:31`, `2023-04-19T03:43:36`, `2023-06-05T09:50:58`, and `2023-12-21T19:08:32`. The `misc` designation applied to these value columns signals that the values are heterogeneous across tables but semantically unified by their `attr_id` linkage.

**t_labrun_with_protocol**

| id | labrun | follows_protocol |
| --- | --- | --- |
| PROT-0001 | MassSpec_LC_MS | Microbiome_QIIME2_Pipe |
| PROT-0002 | Nanopore_FC_Nine | SingleCell_Gelbead10x |
| PROT-0003 | Nanopore_FC_Nine | MassSpec_QTOF_Cal |
| PROT-0004 | MassSpec_LC_MS | FlowCytometry_Panel7 |
| PROT-0005 | Microbiome_16S_Seq | Nanopore_Basecall_v2 |
| PROT-0006 | Proteomics_ICP_MS | PCR_ColdStart |

**t_labrun_with_protocol_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROT-0001 | duration_seconds | xsd:decimal |
| PROT-0002 | end_time | xsd:dateTime |
| PROT-0003 | exit_code | xsd:integer |
| PROT-0004 | host_name | xsd:string |
| PROT-0005 | log_level | xsd:string |
| PROT-0006 | phase | xsd:string |
| PROT-0007 | retry_count | xsd:integer |
| PROT-0008 | scheduled_at | xsd:dateTime |

**t_labrun_with_protocol_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0002 | 2023-11-19T15:13:31 |
| PROT-0002 | PROT-0001 | PROT-0008 | 2023-04-19T03:43:36 |
| PROT-0003 | PROT-0001 | PROT-0009 | 2023-06-05T09:50:58 |
| PROT-0004 | PROT-0002 | PROT-0002 | 2023-12-21T19:08:32 |
| PROT-0005 | PROT-0002 | PROT-0008 | 2023-06-26T20:13:34 |
| PROT-0006 | PROT-0002 | PROT-0009 | 2023-11-18T07:40:33 |
| PROT-0007 | PROT-0003 | PROT-0002 | 2024-09-05T03:02:45 |
| PROT-0008 | PROT-0003 | PROT-0008 | 2024-06-07T02:35:38 |

**t_labrun_with_protocol_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0001 | 301.25 |
| PROT-0002 | PROT-0002 | PROT-0001 | 4042.33 |
| PROT-0003 | PROT-0003 | PROT-0001 | 6125.88 |
| PROT-0004 | PROT-0004 | PROT-0001 | 1565.69 |
| PROT-0005 | PROT-0005 | PROT-0001 | 1033.06 |
| PROT-0006 | PROT-0006 | PROT-0001 | 3134.56 |

**t_labrun_with_protocol_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0003 | 497 |
| PROT-0002 | PROT-0001 | PROT-0007 | 434 |
| PROT-0003 | PROT-0002 | PROT-0003 | 538 |
| PROT-0004 | PROT-0002 | PROT-0007 | 309 |
| PROT-0005 | PROT-0003 | PROT-0003 | 513 |
| PROT-0006 | PROT-0003 | PROT-0007 | 375 |
| PROT-0007 | PROT-0004 | PROT-0003 | 355 |
| PROT-0008 | PROT-0004 | PROT-0007 | 171 |

**t_labrun_with_protocol_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0004 | node-b14 |
| PROT-0002 | PROT-0001 | PROT-0005 | Log Level 02 |
| PROT-0003 | PROT-0001 | PROT-0006 | closeout |
| PROT-0004 | PROT-0001 | PROT-0010 | running |
| PROT-0005 | PROT-0001 | PROT-0011 | Triggered By 05 |
| PROT-0006 | PROT-0002 | PROT-0004 | worker-07 |
| PROT-0007 | PROT-0002 | PROT-0005 | Log Level 07 |
| PROT-0008 | PROT-0002 | PROT-0006 | review |

Lane compliance behaviour is modelled as a first-class entity type, `lanecompliancebehavior`, whose instances are identified by codes such as `BEHA-0001` through `BEHA-0004` and instantiated with descriptive labels: `I-280 Express Lane`, `I-70 Eastbound`, `SR-520 Toll`, and `Route 128 North`. Each behaviour instance is associated with a `streettrafficconfiguration`—the physical or regulatory context in which the behaviour occurs—through a junction table that records both the relationship and its `cardinality_note`. For example, `BEHA-0003` (the `SR-520 Toll` behaviour) occurs on `BEHA-0006` (classified as `Tunnel Approach Lane`) with the relationship role `observer` and cardinality note `Cardinality Note 03`; similarly, `BEHA-0001` (`I-280 Express Lane`) is observed on `BEHA-0005` (`Bridge Deck Section`) under `Cardinality Note 04`. The street-type dimension is further populated with configurations such as `Urban Signalized Intersection`, `Highway Work Zone`, and `Bridge Deck Section`, each serving as a target entity in the `occurs_on_street_type` association.

**t_lane_compliance_behavior**

| id | lane_compliance_behavior |
| --- | --- |
| BEHA-0001 | I-280 Express Lane |
| BEHA-0002 | I-70 Eastbound |
| BEHA-0003 | SR-520 Toll |
| BEHA-0004 | Route 128 North |
| BEHA-0005 | I-70 Eastbound |
| BEHA-0006 | Highway 401 Inner |

**t_lane_compliance_behavior_occurs_on_street_type**

| id | occurs_on_street_type |
| --- | --- |
| BEHA-0001 | Tunnel Approach Lane |
| BEHA-0002 | Urban Signalized Intersection |
| BEHA-0003 | Highway Work Zone |
| BEHA-0004 | Bridge Deck Section |
| BEHA-0005 | Rural Interstate Highway |
| BEHA-0006 | Urban Signalized Intersection |

**t_lane_compliance_behavior__occurs_on_street_type**

| id | lane_id | occurs_on_street_type_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| BEHA-0001 | BEHA-0003 | BEHA-0006 | observer | Cardinality Note 01 |
| BEHA-0002 | BEHA-0004 | BEHA-0002 | observer | Cardinality Note 02 |
| BEHA-0003 | BEHA-0002 | BEHA-0001 | owner | Cardinality Note 03 |
| BEHA-0004 | BEHA-0001 | BEHA-0005 | reviewer | Cardinality Note 04 |
| BEHA-0005 | BEHA-0001 | BEHA-0006 | observer | Cardinality Note 05 |
| BEHA-0006 | BEHA-0001 | BEHA-0003 | contributor | Cardinality Note 06 |
| BEHA-0007 | BEHA-0004 | BEHA-0006 | contributor | Cardinality Note 07 |
| BEHA-0008 | BEHA-0006 | BEHA-0004 | observer | Cardinality Note 08 |

The operator dimension of lane compliance behaviour introduces a many-to-many relationship mediated by a junction table that carries its own `role` attribute. A behaviour instance such as `BEHA-0002` (`I-70 Eastbound`) may be linked to operator `BEHA-0005` (`Autonomous Fleet Unit`) with the role `owner`, while the same behaviour may simultaneously involve operator `BEHA-0003` (`RideShare Driver`) under the role `reviewer`. The operator catalogue includes `Heavy Haul Supervisor`, `Delivery Van Operator`, `Autonomous Fleet Unit`, and `RideShare Driver`, each representing a distinct `vehicleoperator` entity. The dual-role structure—`owner` versus `reviewer`—captures the distinction between primary responsibility and secondary oversight within the compliance framework, a pattern that recurs in the legal advocate domain.

**t_lane_compliance_behavior_involves_operator**

| id | involves_operator |
| --- | --- |
| BEHA-0001 | Heavy Haul Supervisor |
| BEHA-0002 | Delivery Van Operator |
| BEHA-0003 | Autonomous Fleet Unit |
| BEHA-0004 | RideShare Driver |
| BEHA-0005 | RideShare Driver |
| BEHA-0006 | Logistics Coordinator |
| BEHA-0007 | Autonomous Fleet Unit |

Legal advocate roles, identified as `legaladvocaterole` entities with keys `ROLE-0001` through `ROLE-0004`, are instantiated with designations such as `LegalAid-Case33`, `CourtAdvoc-15B`, and `SurvivorAdvoc-118`. The role bearer relationship connects these roles to `person` entities—`Priya Nair`, `Robert Kim`, `Aisha B. Williams`, and `Marcus Chen`—through a junction table that again carries a `role` qualifier, distinguishing between `reviewer` and `contributor` assignments. Notably, the same person (`ROLE-0007`, corresponding to `Marcus Chen`) appears as the role bearer across multiple legal advocate instances (`ROLE-0006`, `ROLE-0008`, `ROLE-0005`), each with a distinct relationship role, demonstrating that person-to-role assignments are not one-to-one but are mediated by the junction table's role column.

**t_legal_advocate_role**

| id | legal_advocate_role |
| --- | --- |
| ROLE-0001 | LegalAid-Case33 |
| ROLE-0002 | CourtAdvoc-15B |
| ROLE-0003 | SurvivorAdvoc-118 |
| ROLE-0004 | CourtAdvoc-15B |
| ROLE-0005 | LegalShield-Intake |
| ROLE-0006 | LegalAid-Case33 |
| ROLE-0007 | LegalShield-Intake |
| ROLE-0008 | LegalAid-Case33 |

**t_legal_advocate_role_role_bearer**

| id | role_bearer |
| --- | --- |
| ROLE-0001 | Priya Nair |
| ROLE-0002 | Robert Kim |
| ROLE-0003 | Aisha B. Williams |
| ROLE-0004 | Marcus Chen |
| ROLE-0005 | James T. Vance |
| ROLE-0006 | Maria G. Delgado |
| ROLE-0007 | David Okafor |

The `domesticviolencesurvivor` entity type represents the beneficiaries of legal advocate services, identified by case codes such as `Case-Client-004`, `DV-Record-338`, and `Ref-Survivor-091`. The `assists` relationship between legal advocate roles and domestic violence survivors is materialised through a junction table that records both the relationship `role` (e.g., `observer`, `contributor`, `owner`) and a `cardinality_note` (e.g., `Cardinality Note 01` through `Cardinality Note 04`). This mirrors the cardinality-note pattern observed in the lane compliance behaviour junction tables, establishing a consistent design convention across domains: when a relationship carries metadata beyond the subject–target pairing, a junction table with `role` and `cardinality_note` columns serves as the normalised representation. The `identifier` column—present in every table—provides the stable primary key that enables cross-table joins, while the `entity_id` and `attr_id` foreign keys in the value tables anchor typed attribute values to their parent entities and attribute definitions.

**t_lane_compliance_behavior__involves_operator**

| id | lane_id | involves_operator_id | role |
| --- | --- | --- | --- |
| BEHA-0001 | BEHA-0002 | BEHA-0005 | reviewer |
| BEHA-0002 | BEHA-0006 | BEHA-0001 | reviewer |
| BEHA-0003 | BEHA-0005 | BEHA-0005 | owner |
| BEHA-0004 | BEHA-0002 | BEHA-0003 | owner |
| BEHA-0005 | BEHA-0003 | BEHA-0006 | owner |
| BEHA-0006 | BEHA-0003 | BEHA-0007 | contributor |
| BEHA-0007 | BEHA-0003 | BEHA-0006 | contributor |
| BEHA-0008 | BEHA-0002 | BEHA-0007 | observer |

**t_legal_advocate_role__role_bearer**

| id | legal_id | role_bearer_id | role |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0006 | ROLE-0007 | reviewer |
| ROLE-0002 | ROLE-0008 | ROLE-0007 | reviewer |
| ROLE-0003 | ROLE-0005 | ROLE-0007 | reviewer |
| ROLE-0004 | ROLE-0007 | ROLE-0005 | contributor |
| ROLE-0005 | ROLE-0007 | ROLE-0007 | reviewer |
| ROLE-0006 | ROLE-0005 | ROLE-0001 | owner |
| ROLE-0007 | ROLE-0001 | ROLE-0006 | reviewer |
| ROLE-0008 | ROLE-0002 | ROLE-0007 | reviewer |

**t_legal_advocate_role_assists**

| id | assists |
| --- | --- |
| ROLE-0001 | Case-Client-004 |
| ROLE-0002 | DV-Record-338 |
| ROLE-0003 | Case-Client-004 |
| ROLE-0004 | Ref-Survivor-091 |
| ROLE-0005 | Survivor-Ref-115 |
| ROLE-0006 | Client-Code-773 |
| ROLE-0007 | DV-Client-8842 |

**t_legal_advocate_role__assists**

| id | legal_id | assists_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| ROLE-0001 | ROLE-0007 | ROLE-0004 | observer | Cardinality Note 01 |
| ROLE-0002 | ROLE-0002 | ROLE-0003 | contributor | Cardinality Note 02 |
| ROLE-0003 | ROLE-0003 | ROLE-0004 | observer | Cardinality Note 03 |
| ROLE-0004 | ROLE-0006 | ROLE-0005 | owner | Cardinality Note 04 |
| ROLE-0005 | ROLE-0004 | ROLE-0007 | observer | Cardinality Note 05 |
| ROLE-0006 | ROLE-0007 | ROLE-0002 | observer | Cardinality Note 06 |
| ROLE-0007 | ROLE-0002 | ROLE-0004 | contributor | Cardinality Note 07 |
| ROLE-0008 | ROLE-0003 | ROLE-0001 | reviewer | Cardinality Note 08 |