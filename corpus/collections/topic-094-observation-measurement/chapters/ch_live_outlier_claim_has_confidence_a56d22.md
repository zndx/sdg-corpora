---
chapter_id: ch_live_outlier_claim_has_confidence_a56d22
topic_id: 94
family: 02_observation_measurement
cited_terms: ['outlier_claim_has_confidence', 'uretprobe_subclass', 'existential_anchored_to_artifact_via_part']
model: engine-refine
---

The architecture of attribute-value binding rests on a disciplined separation between the attribute definition, its type, and the entity to which it is attached. An attribute such as `confidence` or `dimension_kind` carries a schema-level type—`xsd:decimal`, `xsd:string`, or `xsd:dateTime`—that governs how its value is stored and validated. The entity is the concrete subject receiving the attribute: a confidence record identified as `CONF-0001` may carry a decimal value of `0.904` for its confidence score, while the same entity simultaneously holds a string attribute `Dimension Kind 01` and a recorded-at timestamp of `2023-06-24T17:04:07`. This tripartite structure—attr, attr type, entity—ensures that heterogeneous data types coexist within a single referential framework without type coercion errors, and it permits an entity to accumulate dozens of attributes across multiple value tables, each typed independently.

Identifiers serve as the immutable anchors of this system, propagating through every relationship and value table. The identifier `CONF-0001` appears not only as the primary key of an outlier claim but also as the entity reference in decimal, varchar, and datetime value tables, and as the attachment point for a `uretprobe` subclass such as `pthread_create_ret`. Similarly, `URET-0001` identifies a probe subclass whose attributes include a checksum value of `9d2b7a16`, a creation date of `2024-10-13`, and an integer attribute with value `365`. These identifiers are not merely row keys; they are the connective tissue that allows a confidence claim about a `power fluctuation` to be traced through its associated probe, through the probe's metadata, and ultimately to the artifact or location where the observation was made.

**t_outlier_claim_has_confidence**

| id | outlier | confidence |
| --- | --- | --- |
| CONF-0001 | power fluctuation | URET-0001 |
| CONF-0002 | power fluctuation | URET-0007 |
| CONF-0003 | power fluctuation | URET-0004 |
| CONF-0004 | calibration drift | URET-0005 |
| CONF-0005 | telemetry gap | URET-0007 |
| CONF-0006 | signal dropout | URET-0004 |
| CONF-0007 | memory leak | URET-0005 |
| CONF-0008 | calibration drift | URET-0001 |

**t_outlier_claim_has_confidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0004 | 2023-06-24T17:04:07 |
| CONF-0002 | CONF-0002 | CONF-0004 | 2024-09-22T13:07:31 |
| CONF-0003 | CONF-0003 | CONF-0004 | 2023-12-24T05:49:34 |
| CONF-0004 | CONF-0004 | CONF-0004 | 2025-01-22T02:31:25 |
| CONF-0005 | CONF-0005 | CONF-0004 | 2023-07-07T20:57:08 |
| CONF-0006 | CONF-0006 | CONF-0004 | 2023-12-11T12:48:41 |
| CONF-0007 | CONF-0007 | CONF-0004 | 2024-11-29T10:12:10 |
| CONF-0008 | CONF-0008 | CONF-0004 | 2024-08-28T09:33:36 |

**t_outlier_claim_has_confidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0001 | 0.904 |
| CONF-0002 | CONF-0001 | CONF-0005 | 369.80 |
| CONF-0003 | CONF-0001 | CONF-0007 | 179.72 |
| CONF-0004 | CONF-0002 | CONF-0001 | 0.503 |
| CONF-0005 | CONF-0002 | CONF-0005 | 659.89 |
| CONF-0006 | CONF-0002 | CONF-0007 | 72.27 |
| CONF-0007 | CONF-0003 | CONF-0001 | 0.694 |
| CONF-0008 | CONF-0003 | CONF-0005 | 15.75 |

**t_outlier_claim_has_confidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONF-0001 | CONF-0001 | CONF-0002 | Dimension Kind 01 |
| CONF-0002 | CONF-0001 | CONF-0008 | Encoding 02 |
| CONF-0003 | CONF-0001 | CONF-0009 | change rationale |
| CONF-0004 | CONF-0001 | CONF-0010 | fr |
| CONF-0005 | CONF-0001 | CONF-0003 | manual |
| CONF-0006 | CONF-0001 | CONF-0006 | ratio |
| CONF-0007 | CONF-0002 | CONF-0002 | Dimension Kind 07 |
| CONF-0008 | CONF-0002 | CONF-0008 | Encoding 08 |

**t_uretprobe_subclass**

| id | uretprobe | attaches_to_return_hook |
| --- | --- | --- |
| URET-0001 | pthread_create_ret | CONF-0004 |
| URET-0002 | pthread_create_ret | CONF-0002 |
| URET-0003 | qt_delete_ret | CONF-0001 |
| URET-0004 | ssl_read_ret | CONF-0006 |
| URET-0005 | libc_malloc_ret | CONF-0001 |
| URET-0006 | pthread_create_ret | CONF-0003 |
| URET-0007 | pthread_create_ret | CONF-0006 |

**t_uretprobe_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| URET-0001 | checksum | xsd:string |
| URET-0002 | created_date | xsd:date |
| URET-0003 | identifier | cco:DesignativeICE |
| URET-0004 | license | xsd:string |
| URET-0005 | mime_type | xsd:string |
| URET-0006 | size_bytes | xsd:long |
| URET-0007 | uri | xsd:string |
| URET-0008 | version | xsd:integer |

**t_uretprobe_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0002 | 2024-10-13 |
| URET-0002 | URET-0002 | URET-0002 | 2023-10-28 |
| URET-0003 | URET-0003 | URET-0002 | 2024-07-11 |
| URET-0004 | URET-0004 | URET-0002 | 2023-10-14 |
| URET-0005 | URET-0005 | URET-0002 | 2023-07-03 |
| URET-0006 | URET-0006 | URET-0002 | 2023-12-10 |
| URET-0007 | URET-0007 | URET-0002 | 2023-01-22 |

**t_uretprobe_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0006 | 365 |
| URET-0002 | URET-0001 | URET-0008 | 12 |
| URET-0003 | URET-0002 | URET-0006 | 45 |
| URET-0004 | URET-0002 | URET-0008 | 10 |
| URET-0005 | URET-0003 | URET-0006 | 43 |
| URET-0006 | URET-0003 | URET-0008 | 3 |
| URET-0007 | URET-0004 | URET-0006 | 104 |
| URET-0008 | URET-0004 | URET-0008 | 4 |

**t_uretprobe_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| URET-0001 | URET-0001 | URET-0001 | 9d2b7a16 |
| URET-0002 | URET-0001 | URET-0003 | ARN:res/41 |
| URET-0003 | URET-0001 | URET-0004 | CC-BY-4.0 |
| URET-0004 | URET-0001 | URET-0009 | us-east-1 |
| URET-0005 | URET-0001 | URET-0005 | application/octet-stream |
| URET-0006 | URET-0001 | URET-0010 | Name 06 |
| URET-0007 | URET-0001 | URET-0011 | data-engineering |
| URET-0008 | URET-0001 | URET-0012 | Tags 08 |

**t_existential_anchored_to_artifact_via_part**

| id | existential | uri | location |
| --- | --- | --- | --- |
| PART-0001 | GovernanceRule77 | hdfs://cluster/staging | rack-7 |
| PART-0002 | ObservationDrone04 | abfss://prod/silver | eu-west-3 |
| PART-0003 | EdgeGateway-12 | abfss://prod/silver | on-prem-dc1 |
| PART-0004 | LabSampleVial-7 | s3://lake/raw | rack-7 |
| PART-0005 | ObservationDrone04 | abfss://prod/silver | zone-b |
| PART-0006 | ProvenanceLedger2 | s3://lake/raw | on-prem-dc1 |

The value storage strategy partitions attributes by type into dedicated tables—decimal, integer, varchar, datetime, and date—each carrying the same structural columns: an identifier, an entity reference, an attribute reference, and a value column. This design avoids the performance and integrity penalties of a wide EAV model while preserving the flexibility of a schema-on-read approach. A decimal attribute like `369.80` and an integer attribute like `45` may belong to the same entity (`URET-0001`), yet they reside in separate tables, each enforcing its own type constraint at the storage layer. String values such as `change rationale` or `CC-BY-4.0` follow the same pattern, stored alongside their type declarations in the attribute definition table, ensuring that the semantic meaning of `fr` as a locale code is never confused with a numeric literal.

Location and URI provide the external grounding for abstract identifiers, anchoring them to physical or logical positions in the infrastructure. An existential entity such as `ObservationDrone04` is associated with the URI `abfss://prod/silver` and the physical location `eu-west-3`, while `EdgeGateway-12` maps to the same URI but a different location, `on-prem-dc1`. The existential `GovernanceRule77` references `hdfs://cluster/staging` at `rack-7`, and `LabSampleVial-7`—despite sharing the rack location—points to `s3://lake/raw`. These location-URI pairs transform abstract confidence claims and probe definitions into traceable, auditable records that can be correlated with infrastructure telemetry, compliance reports, or incident response workflows.

The practical significance of this structure becomes apparent when tracing a single anomaly end to end. An outlier claim of type `power fluctuation` is linked to confidence identifier `URET-0001`, which in turn attaches to the `pthread_create_ret` probe subclass. That probe carries a checksum of `9d2b7a16`, was created on `2024-10-13`, and has an integer attribute of `365` alongside a string attribute `ARN:res/41`. The confidence claim itself holds a decimal value of `0.904`, a recorded-at timestamp of `2023-06-24T17:04:07`, and a dimension kind of `Dimension Kind 01`. Each of these values is independently typed, independently referenced, and independently queryable, yet all converge on the same set of identifiers, forming a coherent evidence chain from raw observation through classification to infrastructure context.

**t_outlier_claim_has_confidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONF-0001 | confidence | xsd:decimal |
| CONF-0002 | dimension_kind | xsd:string |
| CONF-0003 | method | xsd:string |
| CONF-0004 | recorded_at | xsd:dateTime |
| CONF-0005 | uncertainty | xsd:decimal |
| CONF-0006 | unit | xsd:string |
| CONF-0007 | value | xsd:decimal |
| CONF-0008 | encoding | xsd:string |