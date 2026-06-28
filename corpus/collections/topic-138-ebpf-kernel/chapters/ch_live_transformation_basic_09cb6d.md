---
chapter_id: ch_live_transformation_basic_09cb6d
topic_id: 138
family: 05_provo_lineage
cited_terms: ['transformation_basic', 'equiv_intersect_basic', 'designative_for_specific_role']
model: engine-refine
---

In governed data pipelines, an identifier is the durable handle by which a record remains locatable, auditable, and joinable across operational stores without ambiguity. Transformation definitions carry stable keys such as TRAN-0001 through TRAN-0004, each naming a distinct processing obligation—Currency conversion, Customer deduplication, Feature scaling, and JSON to Parquet conversion—so that lineage, scheduling, and compliance review can refer to the same object regardless of when or where it was invoked. Equivalence classes and role designations extend the same principle outward: INTE-0001–INTE-0004 group intersecting capability sets (for example telemetry-baseline-set paired with fault-tolerance-layer and throughput-threshold), while ROLE-0001–ROLE-0004 bind human-readable designatives (Sensor-Array-Beta, Unit-Shift-Log) to the assets they identify (Calibration-Standard-ISO, Network-Edge-Router). Because identifiers are declared as keys, they function as the spine of the reference model; every subsequent assertion about type, value, or encoding resolves through them.

**t_transformation_basic**

| id | transformation |
| --- | --- |
| TRAN-0001 | Currency conversion |
| TRAN-0002 | Customer deduplication |
| TRAN-0003 | Feature scaling |
| TRAN-0004 | JSON to Parquet conversion |
| TRAN-0005 | Currency conversion |
| TRAN-0006 | Schema evolution migration |

**t_transformation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TRAN-0001 | duration_seconds | xsd:decimal |
| TRAN-0002 | end_time | xsd:dateTime |
| TRAN-0003 | exit_code | xsd:integer |
| TRAN-0004 | host_name | xsd:string |
| TRAN-0005 | log_level | xsd:string |
| TRAN-0006 | phase | xsd:string |
| TRAN-0007 | retry_count | xsd:integer |
| TRAN-0008 | scheduled_at | xsd:dateTime |

**t_equiv_intersect_basic**

| id | equiv | equiv_2 | equiv_3 |
| --- | --- | --- | --- |
| INTE-0001 | telemetry-baseline-set | fault-tolerance-layer | throughput-threshold |
| INTE-0002 | telemetry-baseline-set | policy-compliance-set | replication-factor |
| INTE-0003 | telemetry-baseline-set | delta-sync-channel | validation-matrix |
| INTE-0004 | core-ingest-pipeline | validation-snapshot | throughput-threshold |
| INTE-0005 | sensor-fusion-node | partition-rebalance | error-rate-baseline |
| INTE-0006 | lineage-tracker | delta-sync-channel | circuit-breaker-state |
| INTE-0007 | query-optimizer-cache | checkpoint-manager | archival-mirror-set |

**t_designative_for_specific_role**

| id | designative | identifies | code | encoding |
| --- | --- | --- | --- | --- |
| ROLE-0001 | Sensor-Array-Beta | Calibration-Standard-ISO | D-33 | ascii |
| ROLE-0002 | Unit-Shift-Log | Network-Edge-Router | B-12 | unicode |
| ROLE-0003 | CoreSample-X22 | Data-Lake-Partition | E-21 | unicode |
| ROLE-0004 | Batch-Alpha-99 | Quality-Control-Log | A-01 | ascii |
| ROLE-0005 | CoreSample-X22 | Bioreactor-Module-B | D-33 | latin1 |
| ROLE-0006 | LIDAR-Array-7 | Data-Lake-Partition | C-07 | ascii |
| ROLE-0007 | LIDAR-Array-7 | Quality-Control-Log | D-33 | ascii |
| ROLE-0008 | LIDAR-Array-7 | Geolocation-Map-Grid | A-01 | latin1 |

An entity is the thing about which attributes are asserted, not the attribute itself. In execution telemetry, entity_id values such as TRAN-0001 and TRAN-0002 denote concrete transformation runs or instances to which measured facts attach, so that duration, timestamps, exit status, and host identity remain scoped to the correct operational event. The same transformation identifier may therefore appear in two roles: as a definitional record in the catalog and as an entity reference in a value store, a distinction that matters for governance because policy applies to definitions while evidence applies to instances. Where multiple value rows share an entity_id—as when TRAN-0001 accumulates a decimal duration of 795.94, an integer exit_code of 133, a varchar host_name of edge-03, and datetime stamps including 2025-05-04T13:03:22—the entity becomes the compositional unit for completeness checks, retention rules, and incident reconstruction.

**t_transformation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0002 | 2025-05-04T13:03:22 |
| TRAN-0002 | TRAN-0001 | TRAN-0008 | 2023-11-24T00:59:19 |
| TRAN-0003 | TRAN-0001 | TRAN-0009 | 2024-10-31T22:10:22 |
| TRAN-0004 | TRAN-0002 | TRAN-0002 | 2024-05-26T15:20:00 |
| TRAN-0005 | TRAN-0002 | TRAN-0008 | 2024-04-05T04:09:32 |
| TRAN-0006 | TRAN-0002 | TRAN-0009 | 2025-06-07T09:12:29 |
| TRAN-0007 | TRAN-0003 | TRAN-0002 | 2023-11-14T02:28:35 |
| TRAN-0008 | TRAN-0003 | TRAN-0008 | 2023-01-21T02:20:55 |

**t_transformation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0001 | 795.94 |
| TRAN-0002 | TRAN-0002 | TRAN-0001 | 7139.05 |
| TRAN-0003 | TRAN-0003 | TRAN-0001 | 5074.97 |
| TRAN-0004 | TRAN-0004 | TRAN-0001 | 6971.76 |
| TRAN-0005 | TRAN-0005 | TRAN-0001 | 5283.27 |
| TRAN-0006 | TRAN-0006 | TRAN-0001 | 1285.62 |

**t_transformation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0003 | 133 |
| TRAN-0002 | TRAN-0001 | TRAN-0007 | 93 |
| TRAN-0003 | TRAN-0002 | TRAN-0003 | 142 |
| TRAN-0004 | TRAN-0002 | TRAN-0007 | 123 |
| TRAN-0005 | TRAN-0003 | TRAN-0003 | 502 |
| TRAN-0006 | TRAN-0003 | TRAN-0007 | 13 |
| TRAN-0007 | TRAN-0004 | TRAN-0003 | 896 |
| TRAN-0008 | TRAN-0004 | TRAN-0007 | 153 |

**t_transformation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | TRAN-0004 | edge-03 |
| TRAN-0002 | TRAN-0001 | TRAN-0005 | Log Level 02 |
| TRAN-0003 | TRAN-0001 | TRAN-0006 | review |
| TRAN-0004 | TRAN-0001 | TRAN-0010 | complete |
| TRAN-0005 | TRAN-0001 | TRAN-0011 | Triggered By 05 |
| TRAN-0006 | TRAN-0002 | TRAN-0004 | edge-03 |
| TRAN-0007 | TRAN-0002 | TRAN-0005 | Log Level 07 |
| TRAN-0008 | TRAN-0002 | TRAN-0006 | initiation |

Attr names the dimension along which a measurement or descriptor is taken, and attr_type fixes the interpretive contract under which that dimension may legally be stored and compared. The attribute registry records duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string, thereby preventing silent coercion: a compliance reviewer knows that 7139.05 belongs in decimal semantics, that 142 is an integer exit_code rather than a categorical code, and that edge-03 is unconstrained text unless further normalized. Typed value partitions follow attr_type rather than attr_name alone, which is why datetime observations (2023-11-24T00:59:19, 2024-10-31T22:10:22) never share physical storage with decimal durations even when both describe facets of TRAN-0001. attr_id references in value rows (TRAN-0001, TRAN-0003, TRAN-0007, and others) complete the linkage: the name supplies meaning for humans, the type supplies validation machinery, and the identifier supplies join discipline across tables.

Encoding governs how symbolic content is represented at the character or byte level when designatives, codes, or free text cross system boundaries. Role records declare ascii for entries such as Sensor-Array-Beta with code D-33 and Batch-Alpha-99 with code A-01, while unicode is specified for Unit-Shift-Log (B-12) and CoreSample-X22 (E-21), reflecting a deliberate choice about repertoire and interchange safety when identifiers embed non-ASCII glyphs or when downstream consumers assume a particular normalization form. Encoding sits adjacent to, but is not interchangeable with, attr_type: xsd:string governs logical datatype and comparison rules; ascii and unicode govern physical serialization. Operational guides treat mismatched encoding as a class of integration defect—readable in one repository, corrupted or unmatchable in another—so encoding belongs in the governance record alongside the designative and the code it annotates.

Fields classified as misc carry payload that the reference schema names generically because their semantics are contextual rather than structural. In value relations, misc holds the asserted datum itself—6971.76, 123, complete, 2024-05-26T15:20:00—while entity_id and attr_id carry the interpretive frame; the misc column is intentionally neutral so the same storage pattern can serve heterogeneous attributes without proliferating column names. In designative role rows, code occupies the misc role: compact tokens (D-33, E-21) that abbreviate or externalize an otherwise verbose identifies string such as Data-Lake-Partition. Treating misc as “unimportant” is a common operational failure; in compliance usage it is the evidential body to which identifiers, entities, attributes, and types give legal and technical standing.

Taken together, identifier, entity, attr, attr_type, encoding, and misc implement a separation of concerns that keeps catalogs stable while evidence remains queryable and defensible. Identifiers stitch definitions (TRAN-0003 as Feature scaling) to observations (5074.97 seconds on entity TRAN-0003) and to intersecting policy sets (INTE-0003’s delta-sync-channel under telemetry-baseline-set). attr_type routes each observation into the correct validation and retention regime; encoding protects symbolic integrity at export; misc preserves the fact under dispute or audit. A handbook grounded in this pattern instructs practitioners to resolve every value in two steps—first through its entity and attribute identity, then through its type and encoding contract—so that automated controls and human review converge on the same meaning without re-deriving schema intent from raw strings alone.