---
chapter_id: ch_live_transformation_associated_with_agent_d93664
topic_id: 45
family: 05_provo_lineage
cited_terms: ['transformation_associated_with_agent', 'annotation_assigned_by', 'kernelhook_only_kprobe']
model: engine-refine
---

Identifiers serve as the canonical addressing mechanism across the provenance graph, each following a structured prefix scheme that encodes the entity class—`AGN-0001` through `AGN-0004` for agents, `ASSI-0001` through `ASSI-0006` for annotations, and `KPRO-0001` through `KPRO-0006` for kernel hooks—thereby enabling unambiguous cross-table resolution without ambiguity. An entity denotes a distinct, addressable instance within the provenance model, whether it be a transformation such as `Archive Export Run` or `Model Retraining Cycle`, a kernel hook like `net_rx_action` or `vfs_read`, or an annotation such as `compliance_audit` or `provenance_trace`. Each entity is independently addressable and may participate in multiple relationship contexts simultaneously, as when the agent `AGN-0002` (associated with a `Feature Engineering Job` executed within a `Docker Container`) appears both as a standalone entity and as a referent in association tables.

**t_transformation_associated_with_agent**

| id | transformation |
| --- | --- |
| AGEN-0001 | Archive Export Run |
| AGEN-0002 | Feature Engineering Job |
| AGEN-0003 | Model Retraining Cycle |
| AGEN-0004 | Sensor Calibration Pass |
| AGEN-0005 | Schema Migration Run |
| AGEN-0006 | Partition Pruning Step |
| AGEN-0007 | Daily ETL Pipeline |

**t_transformation_associated_with_agent_was_associated_with**

| id | was_associated_with |
| --- | --- |
| AGEN-0001 | GitHub CI Pipeline |
| AGEN-0002 | Docker Container |
| AGEN-0003 | Senior Data Engineer |
| AGEN-0004 | Senior Data Engineer |
| AGEN-0005 | Docker Container |
| AGEN-0006 | Docker Container |

**t_annotation_assigned_by**

| id | annotation | assigned_by |
| --- | --- | --- |
| ASSI-0001 | compliance_audit | KPRO-0005 |
| ASSI-0002 | telemetry_ingestion | KPRO-0006 |
| ASSI-0003 | provenance_trace | KPRO-0005 |
| ASSI-0004 | provenance_trace | KPRO-0006 |
| ASSI-0005 | source_system_sync | KPRO-0004 |
| ASSI-0006 | source_system_sync | KPRO-0004 |

**t_annotation_assigned_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

**t_annotation_assigned_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | calibration record |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | de |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | hybrid |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | nm |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

**t_kernelhook_only_kprobe**

| id | kernelhook |
| --- | --- |
| KPRO-0001 | net_rx_action |
| KPRO-0002 | kfree |
| KPRO-0003 | vfs_read |
| KPRO-0004 | ext4_file_open |
| KPRO-0005 | kmalloc |
| KPRO-0006 | ip_rcv |

**t_kernelhook_only_kprobe_hook_kind**

| id | hook_kind |
| --- | --- |
| KPRO-0001 | kprobe_perf |
| KPRO-0002 | entry_kprobe |
| KPRO-0003 | kprobe_trace |
| KPRO-0004 | kprobe_trace |
| KPRO-0005 | bpf_kprobe |
| KPRO-0006 | multi_kprobe |
| KPRO-0007 | kprobe_fs |

Attributes and their types constitute the property layer that annotates entities with structured metadata. Attribute names such as `confidence`, `dimension_kind`, `method`, and `recorded_at` are declared with corresponding types drawn from the XML Schema namespace—`xsd:decimal`, `xsd:string`, and `xsd:dateTime`—establishing a typed schema that governs value validation and semantic interpretation. The separation of attribute declaration from value storage permits heterogeneous value types to coexist within a unified model: decimal-valued attributes store precision figures like `0.167` and `0.404` for confidence scores or `103.53` and `863.30` for dimensional measurements, while string-valued attributes carry categorical labels such as `Dimension Kind 01`, `Encoding 02`, and `calibration record`, and datetime-valued attributes capture temporal anchors including `2025-05-21T21:38:03` and `2023-06-05T19:53:01`.

The subject–target–role triad formalizes binary relationships between entities, where the subject identifies the originating entity in a relationship, the target identifies the recipient, and the role specifies the semantic nature of the association. In the transformation–agent association table, for instance, the transformation `AGN-0006` is linked to the agent `AGN-0001` under the role `contributor`, while the same agent `AGN-0001` serves as the target of transformation `AGN-0007` under the role `reviewer`; similarly, in the kernel hook–hook kind association, `KPRO-0002` relates to `KPRO-0005` as `owner`, and `KPRO-0004` relates to `KPRO-0002` as `reviewer`. This three-column relationship model—subject, target, and role—provides the expressive capacity to distinguish between different kinds of participation by the same entity, allowing `AGN-0003` to be an `observer` in one context and `AGN-0004` to be a `contributor` in another, without conflating distinct relationship semantics.

**t_transformation_associated_with_agent__was_associated_with**

| id | transformation_id | was_associated_with_id | role |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0006 | AGEN-0001 | contributor |
| AGEN-0002 | AGEN-0007 | AGEN-0001 | reviewer |
| AGEN-0003 | AGEN-0003 | AGEN-0002 | observer |
| AGEN-0004 | AGEN-0004 | AGEN-0005 | contributor |
| AGEN-0005 | AGEN-0001 | AGEN-0002 | reviewer |
| AGEN-0006 | AGEN-0007 | AGEN-0006 | contributor |
| AGEN-0007 | AGEN-0001 | AGEN-0004 | observer |
| AGEN-0008 | AGEN-0003 | AGEN-0002 | observer |

**t_kernelhook_only_kprobe__hook_kind**

| id | kernelhook_id | hook_kind_id | role |
| --- | --- | --- | --- |
| KPRO-0001 | KPRO-0002 | KPRO-0005 | owner |
| KPRO-0002 | KPRO-0005 | KPRO-0005 | contributor |
| KPRO-0003 | KPRO-0004 | KPRO-0002 | reviewer |
| KPRO-0004 | KPRO-0006 | KPRO-0006 | contributor |
| KPRO-0005 | KPRO-0003 | KPRO-0006 | owner |
| KPRO-0006 | KPRO-0002 | KPRO-0004 | observer |
| KPRO-0007 | KPRO-0006 | KPRO-0003 | reviewer |
| KPRO-0008 | KPRO-0001 | KPRO-0006 | contributor |

Miscellaneous values represent the leaf-level data that populates attribute instances, stored in type-specific value tables that partition by schema type to preserve type safety while maintaining a uniform entity–attribute–value addressing pattern. Each value record is identified by a composite key referencing both the entity and the attribute, ensuring that a single entity can carry multiple attribute values of different types—`ASSI-0001`, for example, holds a decimal confidence of `0.167`, a string dimension kind of `Dimension Kind 01`, and a datetime recorded at `2025-05-21T21:38:03`, each in its respective value table. This design decouples the structural declaration of attributes from their runtime values, enabling the provenance graph to scale attribute cardinality without schema modification while preserving the ability to query by attribute name, type, or value with equal precision.

**t_annotation_assigned_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-05-21T21:38:03 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-17T00:22:41 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2023-06-05T19:53:01 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-01-30T17:11:59 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2023-08-08T10:34:13 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-06-13T10:27:19 |

**t_annotation_assigned_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.167 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 103.53 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 863.30 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.404 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 720.81 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 58.05 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.783 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 338.86 |