---
chapter_id: ch_live_schemaorg_review_rating_25dc86
topic_id: 24
family: 07_long_tail
cited_terms: ['schemaorg_review_rating', 'dataset_was_attributed_to', 'ebpfevent_at_kernel_hook_xref']
model: engine-refine
---

The architecture of the dataset rests upon a disciplined separation between definitional metadata and their runtime values, a pattern that recurs across every subject area. Attributes—such as `duration_seconds`, `end_time`, `exit_code`, and `host_name`—are declared once in a schema table where each is paired with a strict type annotation (`xsd:decimal`, `xsd:dateTime`, `xsd:integer`, `xsd:string`). This type discipline is not decorative: it governs which value table receives the data, and the value tables themselves are partitioned by type, each carrying the columns `entity_id`, `attr_id`, and `value`. An entity, identified by a code such as `XREF-0001` or `XREF-0002`, is thus a composite of multiple typed attributes, each resolved through a join on `attr_id`. The value tables store heterogeneous data—decimal figures like `6431.54` and `4806.21`, timestamps such as `2023-05-01T02:25:15` and `2024-11-27T07:20:09`, integers including `571` and `284`, and free-form strings like `node-b14` and `execution`—all under a single `value` column whose semantics are determined by the row's parent type table. This design avoids nullable columns and enforces type safety at the storage layer, at the cost of a wider schema that must be navigated through explicit joins.

**t_ebpfevent_at_kernel_hook_xref_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2023-05-01T02:25:15 |
| XREF-0002 | XREF-0001 | XREF-0008 | 2024-11-27T07:20:09 |
| XREF-0003 | XREF-0001 | XREF-0009 | 2025-02-12T09:55:43 |
| XREF-0004 | XREF-0002 | XREF-0002 | 2023-05-24T23:07:29 |
| XREF-0005 | XREF-0002 | XREF-0008 | 2024-09-21T23:23:59 |
| XREF-0006 | XREF-0002 | XREF-0009 | 2024-03-30T22:13:30 |
| XREF-0007 | XREF-0003 | XREF-0002 | 2023-05-04T20:31:37 |
| XREF-0008 | XREF-0003 | XREF-0008 | 2025-01-21T19:19:05 |

**t_ebpfevent_at_kernel_hook_xref_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 6431.54 |
| XREF-0002 | XREF-0002 | XREF-0001 | 4806.21 |
| XREF-0003 | XREF-0003 | XREF-0001 | 5462.31 |
| XREF-0004 | XREF-0004 | XREF-0001 | 1550.57 |
| XREF-0005 | XREF-0005 | XREF-0001 | 39.90 |
| XREF-0006 | XREF-0006 | XREF-0001 | 2405.95 |
| XREF-0007 | XREF-0007 | XREF-0001 | 1945.32 |

Attribution and provenance are modelled through a star-like structure centred on the `was_attributed_to` relationship. A fact table records each dataset instance by its `id` (for example, `ATTR-0001` through `ATTR-0004`), its `size_bytes` (ranging from `31504133` to `676110880`), its `version` (values `2`, `5`, and `10`), and a foreign key `was_attributed_to_key` that points to a dimension table. The dimension table, keyed by `id`, carries two descriptive columns: `was_attributed_to_label` (a human-readable string such as `Was Attributed To Label 01`) and `was_attributed_to_category` (a categorical tag such as `Was Attributed To Category 03`). The foreign key `was_attributed_to_key` in the fact table may reference a different `id` than the fact's own—`ATTR-0001` points to `ATTR-0004`, `ATTR-0002` and `ATTR-0004` both point to `ATTR-0003`—which permits a dataset to carry an attribution distinct from its own identity and supports recursive or hierarchical provenance chains. The `version` column, an integer, tracks revisions of the same logical dataset, while `size_bytes` provides a quantitative measure of the payload at each revision.

**fact_dataset**

| id | was_attributed_to_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0004 | 350697080 | 10 |
| ATTR-0002 | ATTR-0003 | 501391865 | 2 |
| ATTR-0003 | ATTR-0006 | 31504133 | 5 |
| ATTR-0004 | ATTR-0003 | 676110880 | 5 |
| ATTR-0005 | ATTR-0005 | 632357991 | 7 |
| ATTR-0006 | ATTR-0002 | 81640033 | 1 |
| ATTR-0007 | ATTR-0005 | 351254327 | 12 |
| ATTR-0008 | ATTR-0001 | 94866870 | 11 |

The review-rating subgraph mirrors this separation of concerns, distinguishing the thing being evaluated from the evaluation itself. The core table `t_schemaorg_review_rating` holds the entities under review—`Adobe Photoshop`, `The Great Gatsby`, `iPhone 15 Pro`—each identified by a code such as `RATI-0001`. A second table, `t_schemaorg_review_rating_review_rating`, stores the actual ratings (`3.2 points`, `100 percentile`, `9.1 rating`, `4.0 average`) keyed by the same identifier space. The two are reconciled in a junction table, `t_schemaorg_review_rating__review_rating`, which carries three foreign keys: `schemaorg_id` (the subject, pointing to the reviewed entity), `review_rating_id` (the target, pointing to the rating), and `role` (a string such as `reviewer` or `contributor` that describes the capacity in which the association was made). This three-column association table decouples the many-to-many relationship between reviewed items and their ratings and allows a single rating to be attributed to multiple entities or a single entity to carry multiple ratings, each annotated with a distinct role.

**t_schemaorg_review_rating**

| id | schemaorg |
| --- | --- |
| RATI-0001 | Adobe Photoshop |
| RATI-0002 | The Great Gatsby |
| RATI-0003 | iPhone 15 Pro |
| RATI-0004 | iPhone 15 Pro |
| RATI-0005 | Marriott International |
| RATI-0006 | Marriott International |

**t_schemaorg_review_rating_review_rating**

| id | review_rating |
| --- | --- |
| RATI-0001 | 3.2 points |
| RATI-0002 | 100 percentile |
| RATI-0003 | 9.1 rating |
| RATI-0004 | 4.0 average |
| RATI-0005 | 47 score |
| RATI-0006 | 5.0 scale |
| RATI-0007 | 8.7 out of 10 |
| RATI-0008 | 88 out of 100 |

**t_schemaorg_review_rating__review_rating**

| id | schemaorg_id | review_rating_id | role |
| --- | --- | --- | --- |
| RATI-0001 | RATI-0004 | RATI-0001 | reviewer |
| RATI-0002 | RATI-0006 | RATI-0007 | reviewer |
| RATI-0003 | RATI-0001 | RATI-0004 | contributor |
| RATI-0004 | RATI-0005 | RATI-0003 | reviewer |
| RATI-0005 | RATI-0006 | RATI-0001 | owner |
| RATI-0006 | RATI-0006 | RATI-0007 | owner |
| RATI-0007 | RATI-0001 | RATI-0008 | owner |
| RATI-0008 | RATI-0006 | RATI-0008 | observer |

Across all subgraphs, the identifier column—always named `id` and consistently formatted with a prefix such as `RATI-`, `ATTR-`, or `XREF-` followed by a zero-padded sequence—serves as the universal join key. The prefix encodes the subgraph to which the row belongs, enabling prefix-based routing in application logic and providing an immediate visual cue about provenance. The `misc` column appears in the value tables and in the attribution dimension as a catch-all label for free-form or semi-structured data that does not fit the typed columns; it is the repository for values like `pending`, `Log Level 02`, and the attribution labels themselves. The `category` column, present only in the attribution dimension, provides a coarse-grained classification that can be used for aggregation or filtering without inspecting the full label text.

**dim_was_attributed_to**

| id | was_attributed_to_label | was_attributed_to_category |
| --- | --- | --- |
| ATTR-0001 | Was Attributed To Label 01 | Was Attributed To Category 01 |
| ATTR-0002 | Was Attributed To Label 02 | Was Attributed To Category 02 |
| ATTR-0003 | Was Attributed To Label 03 | Was Attributed To Category 03 |
| ATTR-0004 | Was Attributed To Label 04 | Was Attributed To Category 04 |
| ATTR-0005 | Was Attributed To Label 05 | Was Attributed To Category 05 |
| ATTR-0006 | Was Attributed To Label 06 | Was Attributed To Category 06 |
| ATTR-0007 | Was Attributed To Label 07 | Was Attributed To Category 07 |
| ATTR-0008 | Was Attributed To Label 08 | Was Attributed To Category 08 |

**t_ebpfevent_at_kernel_hook_xref**

| id | ebpfevent |
| --- | --- |
| XREF-0001 | tracepoint_file_open |
| XREF-0002 | tracepoint_sched_switch |
| XREF-0003 | tracepoint_sched_switch |
| XREF-0004 | kprobe_do_execve |
| XREF-0005 | kretprobe_sys_openat |
| XREF-0006 | tracepoint_file_open |
| XREF-0007 | tracepoint_file_open |

**t_ebpfevent_at_kernel_hook_xref_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| XREF-0001 | duration_seconds | xsd:decimal |
| XREF-0002 | end_time | xsd:dateTime |
| XREF-0003 | exit_code | xsd:integer |
| XREF-0004 | host_name | xsd:string |
| XREF-0005 | log_level | xsd:string |
| XREF-0006 | phase | xsd:string |
| XREF-0007 | retry_count | xsd:integer |
| XREF-0008 | scheduled_at | xsd:dateTime |

**t_ebpfevent_at_kernel_hook_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0003 | 571 |
| XREF-0002 | XREF-0001 | XREF-0007 | 284 |
| XREF-0003 | XREF-0002 | XREF-0003 | 60 |
| XREF-0004 | XREF-0002 | XREF-0007 | 436 |
| XREF-0005 | XREF-0003 | XREF-0003 | 3 |
| XREF-0006 | XREF-0003 | XREF-0007 | 8 |
| XREF-0007 | XREF-0004 | XREF-0003 | 922 |
| XREF-0008 | XREF-0004 | XREF-0007 | 55 |

**t_ebpfevent_at_kernel_hook_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0004 | node-b14 |
| XREF-0002 | XREF-0001 | XREF-0005 | Log Level 02 |
| XREF-0003 | XREF-0001 | XREF-0006 | execution |
| XREF-0004 | XREF-0001 | XREF-0010 | pending |
| XREF-0005 | XREF-0001 | XREF-0011 | Triggered By 05 |
| XREF-0006 | XREF-0002 | XREF-0004 | edge-03 |
| XREF-0007 | XREF-0002 | XREF-0005 | Log Level 07 |
| XREF-0008 | XREF-0002 | XREF-0006 | review |

The practical effect of this design is a schema that is deliberately verbose but structurally sound. Every relationship is explicit, every type is declared before use, and every value is stored in a table whose column semantics are fixed by the row's parent definition. The trade-off is query complexity: retrieving the full attribute profile of an entity requires joining through the type table to the correct value table, and resolving attribution requires traversing the fact-to-dimension link. These costs are justified in environments where data integrity, auditability, and type safety are non-negotiable—kernel event tracing, where events such as `tracepoint_file_open` and `kprobe_do_execve` must be correlated with precise timestamps and exit codes, and where provenance chains must be reconstructible from versioned dataset snapshots.