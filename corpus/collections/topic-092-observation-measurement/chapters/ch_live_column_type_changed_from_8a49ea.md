---
chapter_id: ch_live_column_type_changed_from_8a49ea
topic_id: 92
family: 07_long_tail
cited_terms: ['column_type_changed_from', 'lift_with_support_count', 'classification_assigns_tier']
model: engine-refine
---

Data quality in analytical pipelines rests on the disciplined tracking of attributes—the named properties that describe entities across their lifecycle. An attribute, whether it records a confidence score of 0.849, a dimension kind such as "Dimension Kind 01", or a timestamp like 2024-12-28T07:07:56, carries an explicit type that governs its interpretation: xsd:decimal for numeric measures, xsd:string for categorical labels like "Encoding 02" or "nightly summary", and xsd:dateTime for temporal markers. This type annotation is not merely syntactic; it determines how values are validated, aggregated, and compared. The attribute registry maintains a one-to-one correspondence between an attribute identifier—COUN-0001 through COUN-0010—and its semantic name and type, ensuring that downstream consumers resolve "confidence" to xsd:decimal and "recorded_at" to xsd:dateTime without ambiguity. Entity identifiers, such as COUN-0001 or COUN-0002, serve as the stable anchors to which these typed attributes bind, and the value tables partition by type so that decimal measures (0.258, 331.44, 945.35), string descriptors, and datetime stamps each reside in their appropriate store, preserving type integrity across the pipeline.

**t_lift_with_support_count_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COUN-0001 | confidence | xsd:decimal |
| COUN-0002 | dimension_kind | xsd:string |
| COUN-0003 | method | xsd:string |
| COUN-0004 | recorded_at | xsd:dateTime |
| COUN-0005 | uncertainty | xsd:decimal |
| COUN-0006 | unit | xsd:string |
| COUN-0007 | value | xsd:decimal |
| COUN-0008 | encoding | xsd:string |

**t_lift_with_support_count_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0004 | 2024-12-28T07:07:56 |
| COUN-0002 | COUN-0002 | COUN-0004 | 2023-08-28T07:06:53 |
| COUN-0003 | COUN-0003 | COUN-0004 | 2023-06-25T23:08:52 |
| COUN-0004 | COUN-0004 | COUN-0004 | 2024-05-16T16:03:55 |
| COUN-0005 | COUN-0005 | COUN-0004 | 2024-10-22T12:30:05 |
| COUN-0006 | COUN-0006 | COUN-0004 | 2023-09-08T00:35:07 |
| COUN-0007 | COUN-0007 | COUN-0004 | 2025-05-03T04:02:17 |
| COUN-0008 | COUN-0008 | COUN-0004 | 2024-04-02T09:45:25 |

**t_lift_with_support_count_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0001 | 0.849 |
| COUN-0002 | COUN-0001 | COUN-0005 | 945.35 |
| COUN-0003 | COUN-0001 | COUN-0007 | 331.44 |
| COUN-0004 | COUN-0002 | COUN-0001 | 0.258 |
| COUN-0005 | COUN-0002 | COUN-0005 | 675.58 |
| COUN-0006 | COUN-0002 | COUN-0007 | 197.74 |
| COUN-0007 | COUN-0003 | COUN-0001 | 0.111 |
| COUN-0008 | COUN-0003 | COUN-0005 | 368.51 |

**t_lift_with_support_count_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0002 | Dimension Kind 01 |
| COUN-0002 | COUN-0001 | COUN-0008 | Encoding 02 |
| COUN-0003 | COUN-0001 | COUN-0009 | nightly summary |
| COUN-0004 | COUN-0001 | COUN-0010 | es |
| COUN-0005 | COUN-0001 | COUN-0003 | hybrid |
| COUN-0006 | COUN-0001 | COUN-0006 | ratio |
| COUN-0007 | COUN-0002 | COUN-0002 | Dimension Kind 07 |
| COUN-0008 | COUN-0002 | COUN-0008 | Encoding 08 |

The concept of type_changed_from captures the provenance of schema evolution: when an attribute's definition shifts, the system records what the prior type was, enabling audit trails and backward-compatible transformations. In the fact table, each row carries an identifier (FROM-0001 through FROM-0004) that links to a dimension table where the type_changed_from_label—such as "Type Changed From Label 01"—and its associated category ("Type Changed From Category 01") provide human-readable context for the migration. This linkage between the fact and dimension tables means that every observed value change can be traced back to a specific categorization of the type transition, supporting governance requirements that demand visibility into how data definitions have evolved over time. The category field, in particular, groups these transitions into meaningful classes, allowing analysts to assess whether changes cluster around certain attribute families or occur uniformly across the schema.

**fact_column**

| id | type_changed_from_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0006 | 0.164 | 560.21 | 257.80 |
| FROM-0002 | FROM-0003 | 0.068 | 744.10 | 571.55 |
| FROM-0003 | FROM-0006 | 0.107 | 984.09 | 140.18 |
| FROM-0004 | FROM-0006 | 0.354 | 404.01 | 131.27 |
| FROM-0005 | FROM-0001 | 0.790 | 109.97 | 235.19 |
| FROM-0006 | FROM-0002 | 0.934 | 653.09 | 813.74 |
| FROM-0007 | FROM-0004 | 0.938 | 827.04 | 409.13 |
| FROM-0008 | FROM-0003 | 0.734 | 419.22 | 492.32 |

**dim_type_changed_from**

| id | type_changed_from_label | type_changed_from_category |
| --- | --- | --- |
| FROM-0001 | Type Changed From Label 01 | Type Changed From Category 01 |
| FROM-0002 | Type Changed From Label 02 | Type Changed From Category 02 |
| FROM-0003 | Type Changed From Label 03 | Type Changed From Category 03 |
| FROM-0004 | Type Changed From Label 04 | Type Changed From Category 04 |
| FROM-0005 | Type Changed From Label 05 | Type Changed From Category 05 |
| FROM-0006 | Type Changed From Label 06 | Type Changed From Category 06 |

Confidence and uncertainty form the twin axes along which data reliability is measured. Confidence values—0.164, 0.068, 0.107, 0.354 in the fact table—quantify the degree of assurance that an observed value or classification is correct, while uncertainty values (560.21, 744.10, 984.09, 404.01) express the magnitude of potential deviation. These metrics are not abstract; they are attached to concrete observations and propagate through the pipeline, influencing downstream decisions. A lift metric described as "sensor drift lift" with a support count of 16384, for instance, carries its own confidence and uncertainty profile that determines whether the signal amplification it represents can be trusted for operational use. The interplay between confidence and uncertainty is critical: low confidence paired with high uncertainty signals a value that should be flagged for review, while high confidence and low uncertainty justify automated action.

**t_lift_with_support_count**

| id | lift | support_count |
| --- | --- | --- |
| COUN-0001 | signal amplification lift | 32768 |
| COUN-0002 | data pipeline lift | 2048 |
| COUN-0003 | sensor drift lift | 16384 |
| COUN-0004 | sensor drift lift | 2048 |
| COUN-0005 | fuel economy lift | 65536 |
| COUN-0006 | aerodynamic lift | 1024 |
| COUN-0007 | signal amplification lift | 32768 |
| COUN-0008 | latency reduction lift | 2048 |

Classification and tier assignment govern access and handling policies, with each classification—Governance Registry, Security Baseline, Data Classification Scheme, Data Lineage Map—mapped to a specific tier such as Sandbox Tier, Internal Distribution, or Restricted Access. The classification-to-tier mapping is itself an attribute-rich entity, carrying a log_level (info, error, debug) that determines the verbosity of audit trails, and a retry_count (379, 176, 195, 460) that records how many times a classification operation was retried before reaching a terminal state. These operational metrics are not peripheral; they are integral to understanding the reliability of the classification process itself. A retry_count of 460 against a debug log_level suggests a transient failure that was eventually resolved, while a lower retry_count paired with an error log_level may indicate a persistent issue requiring intervention. The log_level field thus serves as both a diagnostic indicator and a governance signal, informing operators whether a classification event warrants immediate attention or can be reviewed during routine audits.

**t_classification_assigns_tier**

| id | classification | assigns_tier | log_level | retry_count |
| --- | --- | --- | --- | --- |
| TIER-0001 | Governance Registry | Sandbox Tier | info | 379 |
| TIER-0002 | Security Baseline | Internal Distribution | error | 176 |
| TIER-0003 | Data Classification Scheme | Restricted Access | debug | 195 |
| TIER-0004 | Data Lineage Map | Restricted Access | debug | 460 |
| TIER-0005 | Metadata Schema | Sandbox Tier | critical | 23 |