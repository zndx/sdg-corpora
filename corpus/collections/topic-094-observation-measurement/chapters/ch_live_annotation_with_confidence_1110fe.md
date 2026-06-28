---
chapter_id: ch_live_annotation_with_confidence_1110fe
topic_id: 94
family: 02_observation_measurement
cited_terms: ['annotation_with_confidence', 'ebpfmap_with_max_entries', 'audit_basic']
model: engine-refine
---

The data architecture implements a normalized entity-attribute-value (EAV) pattern that decouples entity definitions from their mutable properties, enabling heterogeneous metadata without schema migration. Core entities such as `Telemetry Integrity Check`, `Logging Compliance Review`, and `Model Drift Validation` are registered in a canonical table keyed by identifiers like `AUDI-0001` and `AUDI-0002`, while their variable attributes are declared separately with names such as `duration_seconds`, `end_time`, `exit_code`, and `host_name`, each bound to a typed schema—`xsd:decimal`, `xsd:dateTime`, `xsd:integer`, `xsd:string`—that dictates how values are stored and validated. This separation ensures that the addition of new audit attributes or the retirement of obsolete ones requires no alteration to the entity registry, a design imperative for compliance systems where regulatory reporting requirements evolve continuously.

**t_audit_basic**

| id | audit |
| --- | --- |
| AUDI-0001 | Telemetry Integrity Check |
| AUDI-0002 | Logging Compliance Review |
| AUDI-0003 | Logging Compliance Review |
| AUDI-0004 | Model Drift Validation |
| AUDI-0005 | Model Drift Validation |
| AUDI-0006 | Pipeline Latency Review |

**t_audit_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | duration_seconds | xsd:decimal |
| AUDI-0002 | end_time | xsd:dateTime |
| AUDI-0003 | exit_code | xsd:integer |
| AUDI-0004 | host_name | xsd:string |
| AUDI-0005 | log_level | xsd:string |
| AUDI-0006 | phase | xsd:string |
| AUDI-0007 | retry_count | xsd:integer |
| AUDI-0008 | scheduled_at | xsd:dateTime |

**t_audit_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | 2024-05-14T01:27:39 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | 2024-03-24T17:57:06 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | 2023-07-30T11:39:04 |
| AUDI-0004 | AUDI-0002 | AUDI-0002 | 2024-03-11T10:39:38 |
| AUDI-0005 | AUDI-0002 | AUDI-0008 | 2025-01-11T17:40:44 |
| AUDI-0006 | AUDI-0002 | AUDI-0009 | 2024-09-25T22:35:18 |
| AUDI-0007 | AUDI-0003 | AUDI-0002 | 2025-04-27T05:17:32 |
| AUDI-0008 | AUDI-0003 | AUDI-0008 | 2023-12-11T03:24:19 |

**t_audit_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 2391.38 |
| AUDI-0002 | AUDI-0002 | AUDI-0001 | 1955.36 |
| AUDI-0003 | AUDI-0003 | AUDI-0001 | 919.71 |
| AUDI-0004 | AUDI-0004 | AUDI-0001 | 338.61 |
| AUDI-0005 | AUDI-0005 | AUDI-0001 | 1120.15 |
| AUDI-0006 | AUDI-0006 | AUDI-0001 | 6419.06 |

**t_audit_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0003 | 765 |
| AUDI-0002 | AUDI-0001 | AUDI-0007 | 217 |
| AUDI-0003 | AUDI-0002 | AUDI-0003 | 123 |
| AUDI-0004 | AUDI-0002 | AUDI-0007 | 33 |
| AUDI-0005 | AUDI-0003 | AUDI-0003 | 601 |
| AUDI-0006 | AUDI-0003 | AUDI-0007 | 361 |
| AUDI-0007 | AUDI-0004 | AUDI-0003 | 79 |
| AUDI-0008 | AUDI-0004 | AUDI-0007 | 456 |

**t_audit_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | node-a01 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | Log Level 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0006 | initiation |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | pending |
| AUDI-0005 | AUDI-0001 | AUDI-0011 | Triggered By 05 |
| AUDI-0006 | AUDI-0002 | AUDI-0004 | ingest-21 |
| AUDI-0007 | AUDI-0002 | AUDI-0005 | Log Level 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0006 | closeout |

Attribute values are materialized across type-specific value tables, each enforcing the structural contract established by the attribute definitions. The decimal value table stores numeric measurements such as `2391.38` and `1955.36` against the `duration_seconds` attribute of entity `AUDI-0001`, while the datetime table records temporal markers like `2024-05-14T01:27:39` and `2024-03-24T17:57:06` against `end_time` and `exit_code` attributes respectively. String-valued attributes resolve to the varchar table, where `node-a01` and `Log Level 02` populate `host_name` and `log_level` fields, and integer attributes such as `765` and `217` are persisted in the integer table against `exit_code` and `start_time`. The entity identifier and attribute identifier together form the composite foreign key in each value table, guaranteeing referential integrity between a value and its declared type.

Beyond the EAV model, the architecture supports binary and n-ary associations through junction tables that employ a subject-target-role triad to express directional relationships with semantic context. In the annotation confidence domain, entities identified as `CONF-0001` (Telemetry Stream US East) and `CONF-0002` (Lab Assay Plate 12B) participate in association records where the subject column references one entity—such as `CONF-0007` or `CONF-0001`—the target column references another—such as `CONF-0006` or `CONF-0004`—and the role column assigns a functional designation like `contributor`, `observer`, or `reviewer`. This tripartite structure captures not merely that two entities are related, but the nature of the relationship: a `reviewer` at `ENTR-0001` links the `devmap` entity to the `cgroup_storage` entity, while an `owner` at the same entity links it to a distinct max-entries record, and a `reviewer` at `ENTR-0004` connects `stack_trace` to a separate entries threshold.

**t_annotation_with_confidence**

| id | annotation |
| --- | --- |
| CONF-0001 | Telemetry Stream US East |
| CONF-0002 | Lab Assay Plate 12B |
| CONF-0003 | Lab Assay Plate 12B |
| CONF-0004 | Lab Assay Plate 12B |
| CONF-0005 | Gene Expression Run X42 |
| CONF-0006 | Telemetry Stream US East |
| CONF-0007 | Clinical Trial Arm C |

**t_annotation_with_confidence_confidence**

| id | confidence |
| --- | --- |
| CONF-0001 | 95 Percent Confidence |
| CONF-0002 | Cross Referenced |
| CONF-0003 | Ensemble Agreement |
| CONF-0004 | Expert Verified |
| CONF-0005 | P Value 0.01 |
| CONF-0006 | Expert Verified |

**t_annotation_with_confidence__confidence**

| id | annotation_id | confidence_id | role |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0007 | CONF-0006 | contributor |
| CONF-0002 | CONF-0001 | CONF-0004 | observer |
| CONF-0003 | CONF-0001 | CONF-0005 | contributor |
| CONF-0004 | CONF-0002 | CONF-0001 | reviewer |
| CONF-0005 | CONF-0006 | CONF-0005 | observer |
| CONF-0006 | CONF-0001 | CONF-0001 | owner |
| CONF-0007 | CONF-0004 | CONF-0005 | owner |
| CONF-0008 | CONF-0006 | CONF-0002 | contributor |

The identifier namespace is partitioned by domain prefix—`AUDI-` for audit entities, `CONF-` for annotation entities, `ENTR-` for eBPF map entities—providing an implicit schema namespace that prevents cross-domain identifier collisions while allowing the same relational pattern to scale across unrelated data domains. Within each domain, the junction table identifier (e.g., `ENTR-0001` through `ENTR-0004`) serves as a surrogate key for the association itself, distinct from the subject and target entity identifiers it references, enabling multiple associations between the same entity pair to coexist with different roles. The eBPF map domain illustrates this with `devmap` (`ENTR-0001`) appearing as both a subject in an `owner` relationship and as a target in a separate association, while `stack_trace` (`ENTR-0004`) participates as a subject in two distinct reviewer relationships, each pointing to different max-entries targets.

**t_ebpfmap_with_max_entries**

| id | ebpfmap |
| --- | --- |
| ENTR-0001 | devmap |
| ENTR-0002 | cgroup_storage |
| ENTR-0003 | queue |
| ENTR-0004 | stack_trace |
| ENTR-0005 | sockhash |
| ENTR-0006 | queue |

**t_ebpfmap_with_max_entries_max_entries**

| id | max_entries |
| --- | --- |
| ENTR-0001 | 1048576 |
| ENTR-0002 | 262144 |
| ENTR-0003 | 16384 |
| ENTR-0004 | 16384 |
| ENTR-0005 | 32768 |
| ENTR-0006 | 1048576 |
| ENTR-0007 | 524288 |

**t_ebpfmap_with_max_entries__max_entries**

| id | ebpfmap_id | max_entries_id | role |
| --- | --- | --- | --- |
| ENTR-0001 | ENTR-0004 | ENTR-0002 | reviewer |
| ENTR-0002 | ENTR-0001 | ENTR-0001 | owner |
| ENTR-0003 | ENTR-0004 | ENTR-0006 | reviewer |
| ENTR-0004 | ENTR-0002 | ENTR-0004 | observer |
| ENTR-0005 | ENTR-0006 | ENTR-0002 | observer |
| ENTR-0006 | ENTR-0006 | ENTR-0006 | owner |
| ENTR-0007 | ENTR-0004 | ENTR-0005 | owner |
| ENTR-0008 | ENTR-0006 | ENTR-0004 | observer |

This dual-layer architecture—EAV for attribute flexibility and subject-target-role for relationship expressiveness—provides a unified metadata substrate suitable for governance frameworks where entities must support arbitrary properties and complex, typed associations without schema rigidity. The type discipline enforced by the attribute definitions ensures that values like `95 Percent Confidence` and `Expert Verified` in the confidence domain, or `1048576` and `262144` in the eBPF domain, are stored in columns with compatible schemas, while the role column in junction tables preserves the semantic directionality of relationships critical for audit trails and access control matrices.