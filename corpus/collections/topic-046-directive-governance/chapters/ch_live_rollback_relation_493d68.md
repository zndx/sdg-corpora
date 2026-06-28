---
chapter_id: ch_live_rollback_relation_493d68
topic_id: 46
family: 07_long_tail
cited_terms: ['rollback_relation', 'schema_revision_of', 'identifier_uniquely_identifies']
model: engine-refine
---

In governance and provenance frameworks, every relationship between entities carries metadata that captures not only what is connected but how, when, and with what confidence. A rollback relationship, for instance, records that `release-tag-v3.2` undoes `batch-processing-halt`, while `telemetry-archive-oct` reverts `dataset-v111-stable`. These relationships are not bare links; they are enriched with attributes—`confidence`, `dimension_kind`, `method`, `recorded_at`—each typed to a precise schema datatype such as `xsd:decimal`, `xsd:string`, or `xsd:dateTime`. The attribute type governs how values are stored, validated, and queried, ensuring that a confidence score like `0.023` or `0.999` is never conflated with a timestamp like `2024-05-22T12:01:29` or a categorical label like `Dimension Kind 01`. This separation of attribute definition from attribute value allows the system to scale: new attributes can be introduced without restructuring the underlying storage, and type constraints enforce data integrity at the point of insertion.

**t_rollback_relation**

| id | rollback | rolls_back_to |
| --- | --- | --- |
| RELA-0001 | release-tag-v3.2 | batch-processing-halt |
| RELA-0002 | telemetry-archive-oct | dataset-v111-stable |
| RELA-0003 | nightly-sync-rollback | telemetry-ingest-pause |
| RELA-0004 | config-deploy-fail | telemetry-archive-oct |
| RELA-0005 | model-checkpoint-88 | dataset-v111-stable |
| RELA-0006 | batch-processing-halt | model-checkpoint-88 |

**t_rollback_relation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RELA-0001 | confidence | xsd:decimal |
| RELA-0002 | dimension_kind | xsd:string |
| RELA-0003 | method | xsd:string |
| RELA-0004 | recorded_at | xsd:dateTime |
| RELA-0005 | uncertainty | xsd:decimal |
| RELA-0006 | unit | xsd:string |
| RELA-0007 | value | xsd:decimal |
| RELA-0008 | encoding | xsd:string |

**t_rollback_relation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0004 | 2024-05-22T12:01:29 |
| RELA-0002 | RELA-0002 | RELA-0004 | 2024-03-03T15:52:05 |
| RELA-0003 | RELA-0003 | RELA-0004 | 2024-01-11T10:28:20 |
| RELA-0004 | RELA-0004 | RELA-0004 | 2025-05-09T21:44:43 |
| RELA-0005 | RELA-0005 | RELA-0004 | 2023-08-15T18:37:49 |
| RELA-0006 | RELA-0006 | RELA-0004 | 2023-12-04T10:02:30 |

**t_rollback_relation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0001 | 0.023 |
| RELA-0002 | RELA-0001 | RELA-0005 | 717.59 |
| RELA-0003 | RELA-0001 | RELA-0007 | 918.13 |
| RELA-0004 | RELA-0002 | RELA-0001 | 0.999 |
| RELA-0005 | RELA-0002 | RELA-0005 | 360.64 |
| RELA-0006 | RELA-0002 | RELA-0007 | 735.68 |
| RELA-0007 | RELA-0003 | RELA-0001 | 0.137 |
| RELA-0008 | RELA-0003 | RELA-0005 | 883.40 |

**t_rollback_relation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RELA-0001 | RELA-0001 | RELA-0002 | Dimension Kind 01 |
| RELA-0002 | RELA-0001 | RELA-0008 | Encoding 02 |
| RELA-0003 | RELA-0001 | RELA-0009 | pre-release note |
| RELA-0004 | RELA-0001 | RELA-0010 | de |
| RELA-0005 | RELA-0001 | RELA-0003 | automated |
| RELA-0006 | RELA-0001 | RELA-0006 | kg |
| RELA-0007 | RELA-0002 | RELA-0002 | Dimension Kind 07 |
| RELA-0008 | RELA-0002 | RELA-0008 | Encoding 08 |

The entity-attribute-value pattern underpins this design. Each attribute definition—identified by a stable reference such as `RELA-0001` or `RELA-0004`—is decoupled from its concrete values, which are materialized in type-specific value tables. A decimal attribute like `RELA-0001` stores values such as `717.59` and `918.13` alongside the entity it qualifies, while a datetime attribute like `RELA-0004` anchors the same entity to precise moments in time, from `2024-01-11T10:28:20` to `2025-05-09T21:44:43`. String-valued attributes capture freeform or enumerated data—`Encoding 02`, `pre-release note`, or the two-character code `de`—each row tying a value back to its attribute definition and the entity it describes. This tripartite structure (entity, attribute, value) is the backbone of flexible metadata management, enabling rich, heterogeneous descriptions without sacrificing queryability.

Identifiers serve as the stable anchors that make all of this traceable across systems and time. An identifier such as `doi:10.1145/3641519` does not merely name a resource; it declares that a specific provenance node root is represented in JSON format, and it records the date `2024-09-07` on which this mapping was established. Similarly, `orcid:0000-0002-1825-0097` identifies a data pipeline stage under the E.164 format convention, issued on `2023-03-01`. The format field captures the encoding or serialization convention of the identified resource—whether `JSON`, `CSV`, or `E.164`—while the issued date provides an audit trail for when the identifier-to-resource binding was created. Together, these fields ensure that every identifier is not just a label but a fully contextualized, time-stamped assertion about what it refers to and how that reference should be interpreted.

**t_identifier_uniquely_identifies**

| id | identifier | identifies | format | issued_date |
| --- | --- | --- | --- | --- |
| IDEN-0001 | doi:10.1145/3641519 | provenance node root | JSON | 2024-09-07 |
| IDEN-0002 | urn:isbn:9780131103627 | data pipeline stage 3 | E.164 | 2023-03-13 |
| IDEN-0003 | doi:10.1145/3641519 | container image sha256 | CSV | 2024-01-30 |
| IDEN-0004 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | JSON | 2023-03-01 |
| IDEN-0005 | pmid:12345678 | metadata registry entry | E.164 | 2025-03-08 |
| IDEN-0006 | doi:10.1016/j.softx.2020.100312 | metadata registry entry | ISO-8601 | 2025-05-18 |
| IDEN-0007 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | RFC-3339 | 2024-09-01 |

Relationships between schema revisions further illustrate how roles and directional links structure governance. A schema revision such as `network_flow_record` may itself revise a `legacy_compliance_log`, and the relationship between them is annotated with a role—`reviewer`, `contributor`, or `owner`—that specifies the nature of the connection. The subject of the relationship is the revision being examined (`REVI-0001`), the target is the revision it depends on (`REVI-0006`), and the role clarifies whether the subject acted as reviewer, contributor, or owner in the context of that dependency. This triad of subject, target, and role transforms a simple dependency graph into a rich provenance record, where every edge carries semantic meaning about responsibility and lineage. Such granularity is essential in regulated domains like clinical trial management, where `clinical_trial_protocol` revisions must be traceable to their `legacy_network_record` predecessors with full accountability.

**t_schema_revision_of**

| id | schema |
| --- | --- |
| REVI-0001 | network_flow_record |
| REVI-0002 | product_inventory_catalog |
| REVI-0003 | network_flow_record |
| REVI-0004 | clinical_trial_protocol |
| REVI-0005 | financial_ledger_format |
| REVI-0006 | network_flow_record |
| REVI-0007 | api_gateway_routing |
| REVI-0008 | compliance_audit_log |

**t_schema_revision_of_schema_revision_of**

| id | schema_revision_of |
| --- | --- |
| REVI-0001 | legacy_compliance_log |
| REVI-0002 | legacy_compliance_log |
| REVI-0003 | legacy_compliance_log |
| REVI-0004 | legacy_network_record |
| REVI-0005 | legacy_api_gateway |
| REVI-0006 | legacy_api_gateway |

**t_schema_revision_of__schema_revision_of**

| id | schema_id | schema_revision_of_id | role |
| --- | --- | --- | --- |
| REVI-0001 | REVI-0001 | REVI-0006 | reviewer |
| REVI-0002 | REVI-0001 | REVI-0001 | contributor |
| REVI-0003 | REVI-0001 | REVI-0003 | reviewer |
| REVI-0004 | REVI-0007 | REVI-0003 | owner |
| REVI-0005 | REVI-0006 | REVI-0001 | contributor |
| REVI-0006 | REVI-0005 | REVI-0001 | observer |
| REVI-0007 | REVI-0006 | REVI-0004 | owner |
| REVI-0008 | REVI-0007 | REVI-0004 | reviewer |