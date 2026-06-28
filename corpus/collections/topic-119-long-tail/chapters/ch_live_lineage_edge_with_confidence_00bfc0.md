---
chapter_id: ch_live_lineage_edge_with_confidence_00bfc0
topic_id: 119
family: 05_provo_lineage
cited_terms: ['lineage_edge_with_confidence', 'annotation_classifies_artifact', 'requirement_subclass']
model: engine-refine
---

In governed data environments, every assertion about an object must be addressable, typed, and attributable. An identifier supplies that address: a stable, surrogate key that survives renaming, reclassification, and cross-system reconciliation. Lineage-confidence records such as CONF-0001 through CONF-0004 are not identified by their descriptive content—`ml_training_dataset_prep` versus repeated `data_lake_warehouse_sync` edges—but by opaque keys that permit joins, audit trails, and idempotent updates without conflating distinct observations that happen to share a label. The same principle extends to annotated artifacts (ARTI-0001–ARTI-0004) and normative requirements (REQU-0001–REQU-0004), where the identifier anchors policy enforcement, retention schedules, and downstream validation regardless of how human-readable titles evolve.

**t_annotation_classifies_artifact**

| id | annotation |
| --- | --- |
| ARTI-0001 | Source Verified |
| ARTI-0002 | PII Redacted |
| ARTI-0003 | PII Sensitive |
| ARTI-0004 | Deprecated |
| ARTI-0005 | GDPR Compliant |
| ARTI-0006 | GDPR Compliant |

**t_annotation_classifies_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

An entity is the thing being described, distinct from the rows that describe it. In attribute-value modeling, typed value stores carry an entity reference—here, ARTI-0001–ARTI-0004—so that multiple attributes can attach to the same artifact without duplicating its identity. A single entity may therefore accumulate heterogeneous facts: decimal measurements (0.727, 765.80, 266.33, 0.091), varchar descriptors (`Dimension Kind 01`, `Encoding 02`, `pre-release note`, `ja`), and datetime stamps (2024-11-28T13:33:59 through 2024-11-30T14:24:01), each stored in the table appropriate to its representation while remaining logically unified under one entity key. This separation matters for compliance because it enables partial updates, fine-grained access control, and evidence packaging: auditors can retrieve every assertion about ARTI-0003 without traversing unrelated scalar columns on a wide denormalized record.

Attributes name the semantic slot; attribute type constrains what may legally occupy it. Registration of `confidence`, `dimension_kind`, `method`, and `recorded_at` as attr definitions, each bound to an XSD datatype—`xsd:decimal`, `xsd:string`, `xsd:dateTime`—establishes a contract between producers and consumers before any value is written. Producers cannot persist a free-text ratio label into a decimal slot; consumers can rely on parseability, comparison, and unit harmonization. The attr identifier (distinct from the entity identifier) allows one attribute definition to be referenced by many entity instances: all four artifacts share attr_id ARTI-0004 for `recorded_at`, demonstrating how a single typed schema element propagates across a population while values in the misc column remain instance-specific.

**t_annotation_classifies_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2024-11-28T13:33:59 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2024-06-29T04:58:51 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-01-05T00:51:32 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-11-30T14:24:01 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2023-01-14T09:06:44 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2023-02-15T12:01:42 |

**t_annotation_classifies_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.727 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 765.80 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 266.33 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.091 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 761.16 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 564.24 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.118 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 599.96 |

**t_annotation_classifies_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | pre-release note |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | ja |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | automated |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

The misc field—or, in operational glossaries, the typed value payload—holds the ground truth of each assertion once entity and attr have fixed its subject and meaning. Misc is not miscellaneous in the colloquial sense; it is the canonical storage locus for the fact itself, segregated by physical type so that indexing, range queries, and locale-sensitive rendering remain efficient. A confidence of 0.727 on ARTI-0001 coexists with categorical annotations (`Source Verified`, `PII Redacted`, `PII Sensitive`, `Deprecated`) and procedural metadata (`Dimension Kind 01`, `ja`) because each value is written only after its attr_type gate has been satisfied. Operational guides treat misc as evidentiary content: what was observed, classified, or measured, as opposed to structural keys that merely locate the observation.

Temporal and dimensional metadata complete the assertion so that facts remain interpretable across time and jurisdiction. Recorded-at timestamps—whether captured on lineage edges (2024-07-21T21:36:51, 2025-03-12T13:46:59, 2023-02-17T19:37:00, 2024-01-06T01:59:57) or as datetime misc values aligned to the `recorded_at` attribute—establish provenance ordering, retention eligibility, and conflict resolution when duplicate observations arise. Units (`deg_C`, `mg/L`, `ratio`, `nm`) attach physical or statistical meaning to numeric misc values and to confidence encodings such as `95_percent` or `statistical_overlap`, preventing silent commingling of incomparable quantities in analytics pipelines. Without unit discipline, a ratio stored beside a concentration in mg/L would invite aggregation errors that governance frameworks cannot detect at the identifier level alone.

**t_lineage_edge_with_confidence**

| id | lineage | confidence | recorded_at | unit |
| --- | --- | --- | --- | --- |
| CONF-0001 | ml_training_dataset_prep | partial_match | 2024-07-21T21:36:51 | deg_C |
| CONF-0002 | data_lake_warehouse_sync | statistical_overlap | 2025-03-12T13:46:59 | mg/L |
| CONF-0003 | data_lake_warehouse_sync | 95_percent | 2023-02-17T19:37:00 | ratio |
| CONF-0004 | data_lake_warehouse_sync | 95_percent | 2024-01-06T01:59:57 | nm |
| CONF-0005 | api_log_aggregation | partial_match | 2025-01-27T14:57:11 | deg_C |
| CONF-0006 | geospatial_raster_processing | high | 2023-11-04T09:37:36 | nm |

Scope and language situate requirements and annotations within the organization’s control envelope. Scope (`local`, `team`, `global`) delimits where a mandate applies: a Data Retention Policy may bind only local infrastructure in one record (REQU-0002) while an identical policy title at global scope (REQU-0003) invokes SOC2 Compliance Framework obligations across the estate; a Metadata Tagging Mandate scoped globally with language `ja` signals that tagging rules must be operable for Japanese-speaking stewards and auditors, not merely translated as an afterthought. Language codes (`de`, `es`, `fr`, `ja`) do not decorate requirements—they determine authoritative wording, training material, and escalation paths. In practice, identifier stability, entity-centric factoring, attr typing, misc payloads, recorded-at lineage, unit semantics, and scoped multilingual requirements interlock: identifiers locate the record, entities locate the object, attrs and attr types define what may be said, misc states what was said, recorded-at and unit state when and in what measurable terms it was said, and scope with language state for whom and under which jurisdictional or organizational boundary it must be honored.

**t_requirement_subclass**

| id | requirement | specifies | scope | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | Event Deduplication Protocol | SOC2 Compliance Framework | local | de |
| REQU-0002 | Data Retention Policy | Backup Storage Volume | team | es |
| REQU-0003 | Data Retention Policy | SOC2 Compliance Framework | local | fr |
| REQU-0004 | Metadata Tagging Mandate | Real Time Alerting Engine | global | ja |