---
chapter_id: ch_live_ebpfevent_observes_syscall_xref_4c88a3
topic_id: 65
family: 04_ebpf_kernel
cited_terms: ['ebpfevent_observes_syscall_xref', 'control_with_classification_tier', 'profile_over_time_window']
model: engine-refine
---

The governance framework distinguishes between control definitions and their runtime manifestations through a typed attribute system. Each control—such as Input sanitization, Role based access, Encryption at rest, or Session expiration—carries a set of named attributes whose semantics are governed by strict type constraints. The attribute registry enumerates names like effective_date, enforcement, mandatory, and priority, each bound to an XSD type: xsd:date, xsd:string, xsd:boolean, or xsd:integer. This type discipline is enforced at the value layer, where boolean attributes resolve to true or false, date attributes carry ISO-formatted values such as 2023-02-10 or 2024-02-25, integer attributes hold magnitudes ranging from 2 to 86, and string attributes encode labels like Encoding 01, Enforcement 02, or audit excerpt. The entity column anchors each attribute-value pair to a specific control instance, ensuring that the same attribute definition can assume different values across distinct entities without ambiguity.

**t_control_with_classification_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | effective_date | xsd:date |
| TIER-0002 | enforcement | xsd:string |
| TIER-0003 | mandatory | xsd:boolean |
| TIER-0004 | priority | xsd:integer |
| TIER-0005 | review_cycle_days | xsd:integer |
| TIER-0006 | scope | xsd:string |
| TIER-0007 | encoding | xsd:string |
| TIER-0008 | label_text | xsd:string |

**t_control_with_classification_tier_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0003 | false |
| TIER-0002 | TIER-0002 | TIER-0003 | true |
| TIER-0003 | TIER-0003 | TIER-0003 | true |
| TIER-0004 | TIER-0004 | TIER-0003 | true |
| TIER-0005 | TIER-0005 | TIER-0003 | true |
| TIER-0006 | TIER-0006 | TIER-0003 | false |

**t_control_with_classification_tier_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 2023-02-10 |
| TIER-0002 | TIER-0002 | TIER-0001 | 2023-09-02 |
| TIER-0003 | TIER-0003 | TIER-0001 | 2024-01-29 |
| TIER-0004 | TIER-0004 | TIER-0001 | 2024-02-25 |
| TIER-0005 | TIER-0005 | TIER-0001 | 2025-05-01 |
| TIER-0006 | TIER-0006 | TIER-0001 | 2023-03-16 |

**t_control_with_classification_tier_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2 |
| TIER-0002 | TIER-0001 | TIER-0005 | 715 |
| TIER-0003 | TIER-0002 | TIER-0004 | 4 |
| TIER-0004 | TIER-0002 | TIER-0005 | 86 |
| TIER-0005 | TIER-0003 | TIER-0004 | 1 |
| TIER-0006 | TIER-0003 | TIER-0005 | 78 |
| TIER-0007 | TIER-0004 | TIER-0004 | 5 |
| TIER-0008 | TIER-0004 | TIER-0005 | 174 |

Event telemetry is captured through a fact dimension that records the operational lifecycle of each ebpfevent occurrence. The identifier column assigns a unique key—XREF-0001 through XREF-0004—to each fact row, while the ebpfevent_key column links the occurrence back to its parent event definition. Duration is measured in seconds with sub-second precision, yielding values such as 889.87, 1832.41, 3410.73, and 5696.76, reflecting the span from event initiation to completion. The exit_code column records the terminal status of the event, with observed values including 988, 313, 278, and 158, each encoding a distinct outcome. Retry_count quantifies the number of recovery attempts before final resolution, with counts ranging from 38 to 427, providing a direct signal of operational instability. The dimension table for ebpfevent supplies human-readable labels—Ebpfevent Label 01 through Ebpfevent Label 04—and category assignments—Ebpfevent Category 01 through Ebpfevent Category 04—that enable aggregation and filtering at the classification level.

**fact_ebpfevent**

| id | ebpfevent_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| XREF-0001 | XREF-0003 | 889.87 | 988 | 278 |
| XREF-0002 | XREF-0005 | 1832.41 | 313 | 427 |
| XREF-0003 | XREF-0001 | 3410.73 | 278 | 133 |
| XREF-0004 | XREF-0005 | 5696.76 | 158 | 38 |
| XREF-0005 | XREF-0005 | 4846.66 | 7 | 455 |
| XREF-0006 | XREF-0004 | 4215.38 | 52 | 460 |
| XREF-0007 | XREF-0006 | 653.90 | 100 | 108 |
| XREF-0008 | XREF-0005 | 2673.38 | 169 | 73 |

**dim_ebpfevent**

| id | ebpfevent_label | ebpfevent_category |
| --- | --- | --- |
| XREF-0001 | Ebpfevent Label 01 | Ebpfevent Category 01 |
| XREF-0002 | Ebpfevent Label 02 | Ebpfevent Category 02 |
| XREF-0003 | Ebpfevent Label 03 | Ebpfevent Category 03 |
| XREF-0004 | Ebpfevent Label 04 | Ebpfevent Category 04 |
| XREF-0005 | Ebpfevent Label 05 | Ebpfevent Category 05 |
| XREF-0006 | Ebpfevent Label 06 | Ebpfevent Category 06 |

**t_control_with_classification_tier**

| id | control |
| --- | --- |
| TIER-0001 | Input sanitization |
| TIER-0002 | Role based access |
| TIER-0003 | Encryption at rest |
| TIER-0004 | Session expiration |
| TIER-0005 | Firewall rule set |
| TIER-0006 | Encryption at rest |

Temporal profiling operates on a parallel schema centered on the over_time_window construct. Each window is identified by a key such as WIND-0001 or WIND-0005, labeled with descriptive strings like Over Time Window Label 01, and classified under categories including Over Time Window Category 01 and Over Time Window Category 04. The fact_profile table records measurements within these windows, pairing each observation with a confidence score that ranges from 0.226 to 0.994, an uncertainty magnitude spanning 284.36 to 622.09, and a measured value between 380.57 and 728.94. The confidence metric serves as a reliability indicator: a value of 0.994 signals near-certainty in the associated measurement, whereas 0.226 indicates substantial doubt. The over_time_window_key column in fact_profile establishes the foreign-key linkage to the window dimension, ensuring that every measurement can be traced to its temporal context and category classification.

**fact_profile**

| id | over_time_window_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| WIND-0001 | WIND-0005 | 0.299 | 284.36 | 728.94 |
| WIND-0002 | WIND-0007 | 0.994 | 557.92 | 380.57 |
| WIND-0003 | WIND-0004 | 0.773 | 622.09 | 607.36 |
| WIND-0004 | WIND-0007 | 0.226 | 488.10 | 448.09 |

**dim_over_time_window_category**

| id | category_name |
| --- | --- |
| WIND-0001 | Category Name 01 |
| WIND-0002 | Category Name 02 |
| WIND-0003 | Category Name 03 |
| WIND-0004 | Category Name 04 |
| WIND-0005 | Category Name 05 |
| WIND-0006 | Category Name 06 |
| WIND-0007 | Category Name 07 |
| WIND-0008 | Category Name 08 |

**dim_over_time_window**

| id | over_time_window_label | over_time_window_category | category_id |
| --- | --- | --- | --- |
| WIND-0001 | Over Time Window Label 01 | Over Time Window Category 01 | WIND-0008 |
| WIND-0002 | Over Time Window Label 02 | Over Time Window Category 02 | WIND-0004 |
| WIND-0003 | Over Time Window Label 03 | Over Time Window Category 03 | WIND-0008 |
| WIND-0004 | Over Time Window Label 04 | Over Time Window Category 04 | WIND-0004 |
| WIND-0005 | Over Time Window Label 05 | Over Time Window Category 05 | WIND-0005 |
| WIND-0006 | Over Time Window Label 06 | Over Time Window Category 06 | WIND-0002 |
| WIND-0007 | Over Time Window Label 07 | Over Time Window Category 07 | WIND-0006 |

The categorical taxonomy unifies both event and temporal domains under a shared classification mechanism. In the ebpfevent dimension, category values such as Ebpfevent Category 01 through Ebpfevent Category 04 group events by functional type, enabling roll-up analyses across related operations. Similarly, the over_time_window dimension references a category_id—WIND-0004 or WIND-0008—that points to the dim_over_time_window_category table, where category_name fields like Category Name 01 through Category Name 04 provide the canonical labels. This dual-layer categorization allows the framework to support both flat classification (where category is embedded in the dimension) and relational classification (where category is resolved through a separate table), accommodating different organizational needs for taxonomy management and query performance.

Control attribute values are stored in type-specialized tables that enforce schema integrity at the storage layer. The boolean value table records entity-attr pairs where the attribute is of type xsd:boolean, with values restricted to true or false; the date value table stores xsd:date values in ISO format; the integer value table holds xsd:integer values including 2, 4, 715, and 86; and the varchar value table accommodates free-form strings. Each value table uses a composite foreign key consisting of entity_id and attr_id to link back to the control definition and attribute registry, respectively. This normalization ensures that type validation occurs at insert time, preventing type mismatches and enabling efficient storage through homogeneous column layouts within each value table.

**t_control_with_classification_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0007 | Encoding 01 |
| TIER-0002 | TIER-0001 | TIER-0002 | Enforcement 02 |
| TIER-0003 | TIER-0001 | TIER-0008 | audit excerpt |
| TIER-0004 | TIER-0001 | TIER-0009 | en |
| TIER-0005 | TIER-0001 | TIER-0006 | Scope 05 |
| TIER-0006 | TIER-0002 | TIER-0007 | Encoding 06 |
| TIER-0007 | TIER-0002 | TIER-0002 | Enforcement 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | change rationale |