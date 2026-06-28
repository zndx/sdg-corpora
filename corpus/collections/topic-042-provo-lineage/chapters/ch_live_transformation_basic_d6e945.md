---
chapter_id: ch_live_transformation_basic_d6e945
topic_id: 42
family: 05_provo_lineage
cited_terms: ['transformation_basic', 'ganglion_cyst_tissue_origin', 'transformation_not_recoverable']
model: engine-refine
---

An identifier is the durable handle by which any governed object is addressed, reconciled, and cited across audit trails, lineage graphs, and operational runbooks. In transformation governance, identifiers such as TRAN-0001 through TRAN-0004 name discrete processing obligations—checksum verification, parquet compaction, schema evolution migration, partition pruning—so that downstream evidence never depends on ambiguous labels. The same principle extends to clinical–structural registries, where ORIG-0001 through ORIG-0004 anchor ganglion cyst tissue origins at named anatomical loci (sacroiliac joint, metacarpophalangeal joint, subacromial bursa, first dorsal compartment), and to recovery controls, where RECO-0001 through RECO-0004 mark transformations that cannot be rolled back without explicit compensating action. Because identifiers are keys rather than descriptions, they survive renaming, reclassification, and cross-system federation; every attribute binding, typed value, and relational assertion ultimately resolves through them.

**t_transformation_basic**

| id | transformation |
| --- | --- |
| TRAN-0001 | checksum verification |
| TRAN-0002 | parquet compaction |
| TRAN-0003 | Schema evolution migration |
| TRAN-0004 | partition pruning |
| TRAN-0005 | hash truncation |
| TRAN-0006 | record purging |

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

**t_ganglion_cyst_tissue_origin**

| id | ganglion_cyst_tissue_origin |
| --- | --- |
| ORIG-0001 | sacroiliac joint |
| ORIG-0002 | metacarpophalangeal joint |
| ORIG-0003 | subacromial bursa |
| ORIG-0004 | first dorsal compartment |
| ORIG-0005 | sacroiliac joint |
| ORIG-0006 | distal radioulnar joint |
| ORIG-0007 | popliteal fossa |
| ORIG-0008 | distal radioulnar joint |

**t_ganglion_cyst_tissue_origin_part_of**

| id | part_of |
| --- | --- |
| ORIG-0001 | periosteal layer |
| ORIG-0002 | joint capsule |
| ORIG-0003 | deep fascia |
| ORIG-0004 | fibrous adventitia |
| ORIG-0005 | periosteal layer |
| ORIG-0006 | periosteal layer |

Entity denotes the object of record to which facts attach, distinct from the facts themselves and from the vocabulary that defines those facts. A single entity may accumulate many observations: TRAN-0001 carries both a decimal duration of 795.94 seconds and integer exit codes 133 and 93, alongside varchar host and status tokens edge-03, Log Level 02, review, and complete, each stored under its own attribute key while sharing the same entity_id. That pattern enforces a separation between identity (what is being described) and measurement (what was observed), which is essential for partial updates, late-arriving telemetry, and conflict resolution when two pipelines report on the same run. Entity granularity is a design choice with compliance consequences: too coarse and audit granularity collapses; too fine and reconciliation cost dominates operations.

Attr and attr_type form the typed contract layer. An attr names the semantic slot—duration_seconds, end_time, exit_code, host_name—while attr_type declares the governing datatype (xsd:decimal, xsd:dateTime, xsd:integer, xsd:string), routing each assertion to the correct physical representation and validation rule. Duration_seconds binds to xsd:decimal and therefore admits values such as 7139.05 and 5074.97; end_time binds to xsd:dateTime and therefore admits instants including 2025-05-04T13:03:22 and 2024-05-26T15:20:00; exit_code binds to xsd:integer (133, 142); host_name binds to xsd:string (edge-03). Attr_type is not decorative metadata: it determines comparability, aggregation eligibility, timezone handling, and whether a value may legally coexist with another in the same analytic grain. Governance frameworks treat attr definitions as controlled vocabulary entries; changing an attr_type without migration is a breaking change equivalent to altering a regulatory filing field’s permitted format.

Misc, in operational usage, is the carried payload—the literal value instance once entity, attr, and attr_type have fixed the interpretive frame. The term signals that the stored token is heterogeneous by design: decimals, datetimes, integers, and varchars all occupy the same logical role (“the answer”) while differing in syntax and constraint. A misc value of 93 on exit_code for TRAN-0001 is meaningful only in concert with its attr_id and entity_id; isolated from that context it is an opaque numeral. Handbooks therefore require that misc never be exported without its binding triple, and that retention policies apply to the composite fact, not to the scalar alone. Where multiple misc rows share an entity—as when TRAN-0001 records four datetime observations under distinct attr_ids—the consumer must treat them as a multiset of timed assertions, not as a single timestamp field.

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

Ganglioncysttissueorigin and connectivetissuestructure illustrate how domain semantics and structural anatomy are modeled as first-class governed terms rather than as free text. Ganglioncysttissueorigin captures the clinically salient origin site; connectivetissuestructure captures the connective-tissue scaffold within which that origin is situated—periosteal layer, joint capsule, deep fascia, fibrous adventitia in the exemplar set. The pairing is not merely descriptive: it supports traceability from a cyst presentation to the tissue compartment implicated in etiology, surgical planning, and epidemiological stratification. In parallel registries, subject and target orient directed assertions between identified nodes: subject (ganglion_id) points to the originating record, target (part_of_id) points to the structural constituent, and together they express “this origin is situated within that tissue structure” without collapsing two distinct concepts into one column. Role then layers accountability onto that edge—reviewer, contributor, owner—so that the same anatomical linkage may be authored, validated, and owned by different parties under segregation-of-duties rules; ORIG-0007 linked to ORIG-0001 as reviewer is a different governance act than ORIG-0002 linked to ORIG-0006 as owner, even when the underlying anatomy is stable.

**t_ganglion_cyst_tissue_origin__part_of**

| id | ganglion_id | part_of_id | role |
| --- | --- | --- | --- |
| ORIG-0001 | ORIG-0007 | ORIG-0001 | reviewer |
| ORIG-0002 | ORIG-0008 | ORIG-0001 | contributor |
| ORIG-0003 | ORIG-0007 | ORIG-0005 | owner |
| ORIG-0004 | ORIG-0002 | ORIG-0006 | owner |
| ORIG-0005 | ORIG-0003 | ORIG-0005 | reviewer |
| ORIG-0006 | ORIG-0008 | ORIG-0006 | observer |
| ORIG-0007 | ORIG-0003 | ORIG-0005 | contributor |
| ORIG-0008 | ORIG-0005 | ORIG-0005 | observer |

Scheduledat and triggeredby close the loop between static reference data and time-bounded operational control for transformations that are explicitly not recoverable. Scheduledat records the intended execution instant—2023-05-27T08:30:46 for timestamp normalization paired with partition compaction, 2025-03-09T11:37:12 for telemetry filtering paired with partition pruning—anchoring capacity planning, change windows, and evidence of when irreversible work was authorized to commence. Triggeredby classifies the initiation channel: event-driven runs, manual operator invocation, calendar schedule, or api call, each carrying different evidential weight and approval requirements. A cipher key rotation triggered manually (RECO-0002) demands stronger four-eyes proof than JSON-to-Parquet conversion triggered by api (RECO-0004), because the blast radius and rollback posture differ. Together, identifier-backed entities, attr-typed misc facts, subject–target–role linkages for structural semantics, and scheduledat/triggeredby provenance constitute the minimum interoperable surface for explaining what ran, on what, with what values, in what tissue or system context, under whose authority, and by what mechanism—precisely the evidentiary chain compliance reviewers expect when transformations cannot be silently undone.

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

**t_transformation_not_recoverable**

| id | transformation | transformation_2 | scheduled_at | triggered_by |
| --- | --- | --- | --- | --- |
| RECO-0001 | Timestamp normalization | partition compaction | 2023-05-27T08:30:46 | event |
| RECO-0002 | cipher key rotation | hash truncation | 2024-07-23T05:41:48 | manual |
| RECO-0003 | telemetry filtering | partition pruning | 2025-03-09T11:37:12 | schedule |
| RECO-0004 | JSON to Parquet conversion | log rotation | 2023-08-05T01:48:14 | api |
| RECO-0005 | Aggregation rollup | Hierarchical flattening | 2023-09-25T17:59:19 | manual |
| RECO-0006 | telemetry filtering | Feature scaling | 2024-03-31T12:21:12 | event |
| RECO-0007 | JSON to Parquet conversion | PII tokenization | 2023-07-05T00:36:15 | schedule |
| RECO-0008 | log rotation | metadata extraction | 2025-04-13T18:22:12 | schedule |