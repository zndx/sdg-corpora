---
chapter_id: ch_live_ebpfmap_with_key_type_295503
topic_id: 158
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_with_key_type', 'lane_compliance_behavior', 'ebpfprogram_min_one_hook']
model: engine-refine
---

The dimensional architecture governing eBPF program and map telemetry rests upon a clear separation between measurable facts and their descriptive contexts. The fact table `fact_ebpfprogram` records program instances identified by codes such as `HOOK-0001` through `HOOK-0004`, each annotated with a `size_bytes` value ranging from 113,209,263 bytes for program `HOOK-0003` to 784,335,640 bytes for `HOOK-0001`, alongside a `version` number and a foreign key `attaches_to_hook_key` that anchors the program to its hook dimension. Similarly, `fact_ebpfmap` captures map-level measurements with identifiers like `TYPE-0001` through `TYPE-0004`, `size_bytes` spanning from 31,105,012 for `TYPE-0003` to 354,373,995 for `TYPE-0004`, and a `key_type_key` linking to the key type taxonomy. These fact tables are the quantitative core, but their analytical utility depends entirely on the dimension tables that supply semantic labels and categorical groupings.

**fact_ebpfmap**

| id | key_type_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | 208979093 | 3 |
| TYPE-0002 | TYPE-0006 | 156714508 | 6 |
| TYPE-0003 | TYPE-0006 | 31105012 | 12 |
| TYPE-0004 | TYPE-0002 | 354373995 | 5 |
| TYPE-0005 | TYPE-0004 | 866267293 | 2 |

**fact_ebpfprogram**

| id | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0006 | 167519051 | 1 |

The dimension tables `dim_attaches_to_hook` and `dim_key_type` provide the categorical scaffolding that transforms raw foreign keys into interpretable metadata. Each dimension carries an `id` that matches the corresponding fact table's key column, a `misc` column holding human-readable labels—`Attaches To Hook Label 01` through `Attaches To Hook Label 04` for hooks, and `Key Type Label 01` through `Key Type Label 04` for key types—and a `category` column assigning each entry to a classification such as `Attaches To Hook Category 01` or `Key Type Category 01`. The `attaches_to_hook_key` values in `fact_ebpfprogram` (e.g., `HOOK-0006` appearing for both `HOOK-0001` and `HOOK-0002`) demonstrate that multiple programs may attach to the same hook point, while the `key_type_key` values in `fact_ebpfmap` (e.g., `TYPE-0006` shared by `TYPE-0002` and `TYPE-0003`) reveal that distinct maps can employ identical key type classifications. The `version` columns in both fact tables—ranging from 1 to 12—add a temporal or revision dimension to the measurements, enabling tracking of how program and map characteristics evolve across releases.

**dim_key_type**

| id | key_type_label | key_type_category |
| --- | --- | --- |
| TYPE-0001 | Key Type Label 01 | Key Type Category 01 |
| TYPE-0002 | Key Type Label 02 | Key Type Category 02 |
| TYPE-0003 | Key Type Label 03 | Key Type Category 03 |
| TYPE-0004 | Key Type Label 04 | Key Type Category 04 |
| TYPE-0005 | Key Type Label 05 | Key Type Category 05 |
| TYPE-0006 | Key Type Label 06 | Key Type Category 06 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |

Beyond the eBPF telemetry domain, the same dimensional pattern extends to lane compliance behavior analysis, where the relationship between behavioral events and the entities involved is modeled through explicit junction tables. The table `t_lane_compliance_behavior` enumerates compliance events identified by `BEHA-0001` through `BEHA-0004`, each associated with a descriptive label such as `I-280 Express Lane`, `I-70 Eastbound`, `SR-520 Toll`, or `Route 128 North`. These behaviors are linked to operators through `t_lane_compliance_behavior_involves_operator`, which maps each behavior identifier to an operator role—`Heavy Haul Supervisor`, `Delivery Van Operator`, `Autonomous Fleet Unit`, or `RideShare Driver`—and then through the junction table `t_lane_compliance_behavior__involves_operator`, which materializes the many-to-many relationship with columns `lane_id` (the subject), `involves_operator_id` (the target), and `role` (specifying whether the operator acts as `reviewer` or `owner`). For instance, behavior `BEHA-0002` appears as the subject in two distinct relationships: paired with operator `BEHA-0005` under the role `owner`, and paired with operator `BEHA-0003` under the role `owner`, while behavior `BEHA-0006` serves as the target of operator `BEHA-0005` acting as `reviewer`.

**t_lane_compliance_behavior**

| id | lane_compliance_behavior |
| --- | --- |
| BEHA-0001 | I-280 Express Lane |
| BEHA-0002 | I-70 Eastbound |
| BEHA-0003 | SR-520 Toll |
| BEHA-0004 | Route 128 North |
| BEHA-0005 | I-70 Eastbound |
| BEHA-0006 | Highway 401 Inner |

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

A parallel junction structure, `t_lane_compliance_behavior__occurs_on_street_type`, connects compliance behaviors to the street traffic configurations on which they occur. The dimension table `t_lane_compliance_behavior_occurs_on_street_type` defines the street types—`Tunnel Approach Lane`, `Urban Signalized Intersection`, `Highway Work Zone`, and `Bridge Deck Section`—each identified by a code that the junction table references via `occurs_on_street_type_id`. The junction itself carries four columns: `id` for the relationship record, `lane_id` as the subject referencing a behavior, `occurs_on_street_type_id` as the target referencing a street type, `role` indicating the nature of the association (values include `observer` and `owner`), and `cardinality_note` providing additional constraint metadata such as `Cardinality Note 01` through `Cardinality Note 04`. The role column in both junction tables serves a critical governance function: it distinguishes between an entity that owns a relationship and one that merely observes or reviews it, enabling fine-grained access control and audit trails. The cardinality notes, while appearing as generic labels in the sample data, represent the mechanism by which the model encodes multiplicity constraints—whether a behavior occurs on exactly one street type, may span multiple, or is constrained by regulatory or physical conditions.

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

The consistent use of `identifier` as the primary key column across all tables, paired with foreign key columns that carry descriptive suffixes such as `_key`, `__involves_operator`, or `__occurs_on_street_type`, creates a navigable graph of relationships. The `subject` and `target` columns in the junction tables explicitly name the directionality of each relationship, while the `role` column adds a semantic layer that distinguishes ownership from observation. This design allows a single compliance behavior like `BEHA-0002` to participate in multiple relationship contexts simultaneously—owned by one operator, observed by another, occurring on a particular street type—without requiring denormalization or redundant data. The dimensional model thus achieves both query efficiency, by keeping fact and dimension data separate, and analytical richness, by preserving the full complexity of how behaviors, operators, and infrastructure configurations interrelate.