---
chapter_id: ch_live_kernel_event_with_tid_f15198
topic_id: 19
family: 07_long_tail
cited_terms: ['kernel_event_with_tid', 'existential_anchored_to_artifact_via_part', 'state_basic']
model: engine-refine
---

The foundational architecture of the observability framework rests upon a disciplined separation between event identity, attribute schema, and value instantiation. Each kernel event receives a unique identifier—TID-0001 through TID-0004 in the observed corpus—while the associated thread context is captured independently, as evidenced by thread identifiers such as 11475 and 15634, or the repeated assignment of 9001 across distinct events. Attributes are declared in a dedicated schema table where each attribute name, whether duration_seconds, end_time, exit_code, or host_name, is paired with a strict type annotation drawn from the XSD namespace: xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively. This type discipline ensures that value tables remain homogeneous and that downstream consumers can parse measurements without runtime coercion.

**t_kernel_event_with_tid**

| id | kernel | with_thread_id |
| --- | --- | --- |
| TID-0001 | ZFS on Linux | 11475 |
| TID-0002 | Darwin 22.4.0 | 15634 |
| TID-0003 | FreeBSD 13.2 | 9001 |
| TID-0004 | Linux 5.15.0 | 9001 |
| TID-0005 | ZFS on Linux | 15634 |
| TID-0006 | Red Hat 4.18 | 3320 |

**t_kernel_event_with_tid_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TID-0001 | duration_seconds | xsd:decimal |
| TID-0002 | end_time | xsd:dateTime |
| TID-0003 | exit_code | xsd:integer |
| TID-0004 | host_name | xsd:string |
| TID-0005 | log_level | xsd:string |
| TID-0006 | phase | xsd:string |
| TID-0007 | retry_count | xsd:integer |
| TID-0008 | scheduled_at | xsd:dateTime |

**t_kernel_event_with_tid_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0002 | 2025-02-14T18:33:06 |
| TID-0002 | TID-0001 | TID-0008 | 2024-07-20T10:27:40 |
| TID-0003 | TID-0001 | TID-0009 | 2024-06-11T20:07:21 |
| TID-0004 | TID-0002 | TID-0002 | 2025-04-06T19:50:52 |
| TID-0005 | TID-0002 | TID-0008 | 2025-02-15T21:22:11 |
| TID-0006 | TID-0002 | TID-0009 | 2024-07-12T03:26:24 |
| TID-0007 | TID-0003 | TID-0002 | 2024-05-24T01:52:05 |
| TID-0008 | TID-0003 | TID-0008 | 2023-12-06T07:40:08 |

**t_kernel_event_with_tid_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0001 | 5060.73 |
| TID-0002 | TID-0002 | TID-0001 | 6983.04 |
| TID-0003 | TID-0003 | TID-0001 | 363.99 |
| TID-0004 | TID-0004 | TID-0001 | 6644.72 |
| TID-0005 | TID-0005 | TID-0001 | 5301.35 |
| TID-0006 | TID-0006 | TID-0001 | 4668.07 |

**t_kernel_event_with_tid_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0003 | 883 |
| TID-0002 | TID-0001 | TID-0007 | 384 |
| TID-0003 | TID-0002 | TID-0003 | 644 |
| TID-0004 | TID-0002 | TID-0007 | 289 |
| TID-0005 | TID-0003 | TID-0003 | 158 |
| TID-0006 | TID-0003 | TID-0007 | 165 |
| TID-0007 | TID-0004 | TID-0003 | 803 |
| TID-0008 | TID-0004 | TID-0007 | 36 |

**t_kernel_event_with_tid_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0004 | gw-12 |
| TID-0002 | TID-0001 | TID-0005 | Log Level 02 |
| TID-0003 | TID-0001 | TID-0006 | review |
| TID-0004 | TID-0001 | TID-0010 | running |
| TID-0005 | TID-0001 | TID-0011 | Triggered By 05 |
| TID-0006 | TID-0002 | TID-0004 | node-b14 |
| TID-0007 | TID-0002 | TID-0005 | Log Level 07 |
| TID-0008 | TID-0002 | TID-0006 | execution |

Value instantiation is distributed across four typed value tables, each enforcing a single data domain. Decimal-valued attributes such as duration_seconds carry magnitudes like 5060.73, 6983.04, 363.99, and 6644.72, each anchored to an entity and an attribute reference. Datetime attributes record temporal boundaries with values such as 2025-02-14T18:33:06 and 2024-07-20T10:27:40, while integer attributes capture discrete quantities including 883, 384, 644, and 289. String-valued attributes hold free-form content—gw-12, Log Level 02, review, running—each linked to the same entity-attribute graph. The entity_id column serves as the join key across all value tables, binding heterogeneous measurements to a single event instance, while attr_id resolves each value to its declared schema entry.

State observation introduces a second layer of quantification, decoupled from kernel events and instead organized around state dimensions and their measured facts. The dimension table assigns each state a human-readable label—State Label 01 through State Label 04—and a categorical classification—State Category 01 through State Category 04—that groups related measurements under shared semantic headings. The fact table records the actual observation, pairing a state key with a numeric value such as 195.86, 143.04, 237.15, or 619.50, while simultaneously attaching a confidence score and an uncertainty magnitude. Confidence values range from 0.012 to 0.523, reflecting varying degrees of measurement assurance, and uncertainty values span from 366.30 to 951.90, quantifying the dispersion or error bound associated with each reading. This dual annotation enables downstream systems to weight observations appropriately and to flag low-confidence readings for manual review.

**dim_state**

| id | state_label | state_category |
| --- | --- | --- |
| STAT-0001 | State Label 01 | State Category 01 |
| STAT-0002 | State Label 02 | State Category 02 |
| STAT-0003 | State Label 03 | State Category 03 |
| STAT-0004 | State Label 04 | State Category 04 |
| STAT-0005 | State Label 05 | State Category 05 |
| STAT-0006 | State Label 06 | State Category 06 |
| STAT-0007 | State Label 07 | State Category 07 |
| STAT-0008 | State Label 08 | State Category 08 |

Existential entities—GovernanceRule77, ObservationDrone04, EdgeGateway-12, LabSampleVial-7—are anchored to physical and logical locations through a dedicated mapping table that records both a URI and a location descriptor. URIs such as hdfs://cluster/staging, abfss://prod/silver, and s3://lake/raw identify distributed storage endpoints, while location fields like rack-7, eu-west-3, and on-prem-dc1 ground those logical references in identifiable infrastructure. This dual-addressing model supports both programmatic resolution of artifact locations and human-readable operational awareness, ensuring that every existential entity can be traced to its deployment context without ambiguity.

**t_existential_anchored_to_artifact_via_part**

| id | existential | uri | location |
| --- | --- | --- | --- |
| PART-0001 | GovernanceRule77 | hdfs://cluster/staging | rack-7 |
| PART-0002 | ObservationDrone04 | abfss://prod/silver | eu-west-3 |
| PART-0003 | EdgeGateway-12 | abfss://prod/silver | on-prem-dc1 |
| PART-0004 | LabSampleVial-7 | s3://lake/raw | rack-7 |
| PART-0005 | ObservationDrone04 | abfss://prod/silver | zone-b |
| PART-0006 | ProvenanceLedger2 | s3://lake/raw | on-prem-dc1 |

The interplay between these components forms a coherent observability graph: kernel events carry typed attributes whose values are stored in domain-specific tables and linked back to events through entity identifiers; state facts record measured conditions with explicit confidence and uncertainty annotations that govern their trustworthiness; and existential entities bridge the logical and physical worlds through URIs and location descriptors. Together, these structures enable precise attribution of measurements, rigorous assessment of their reliability, and unambiguous mapping of abstract entities to their operational environments.

**fact_state**

| id | state_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | 0.422 | 951.90 | 195.86 |
| STAT-0002 | STAT-0004 | 0.012 | 416.12 | 143.04 |
| STAT-0003 | STAT-0005 | 0.075 | 421.79 | 237.15 |
| STAT-0004 | STAT-0003 | 0.523 | 366.30 | 619.50 |