---
chapter_id: ch_live_transformation_not_recoverable_c98388
topic_id: 42
family: 05_provo_lineage
cited_terms: ['transformation_not_recoverable', 'cardinality_max_one_generic', 'directive_only_governs_artifact']
model: engine-refine
---

A governance framework of this sort rests on a disciplined separation between the rules that govern data assets and the concrete properties those rules impose. Directives such as the ISO 27001 Security Policy, the SOC 2 Type II Standard, the GDPR Compliance Mandate, and the PCI DSS v4.0 Compliance specification each target specific artifacts—Sensor Data Streams, Network Access Control Lists, and the Data Lake Metadata Catalog, for instance—and the framework records which directive governs which artifact through a stable identifier. The governing relationship is not merely declarative; it is operationalized through attributes that capture the enforceable characteristics of each directive. An attribute such as `effective_date` carries an `xsd:date` type and resolves to concrete values like 2023-09-27 or 2025-04-15 depending on the entity to which it is bound. The attribute `mandatory` is typed as `xsd:boolean` and takes values of `true` or `false`, while `priority` is an `xsd:integer` with observed values ranging from 4 to 959. Free-form attributes such as `enforcement` are stored as `xsd:string` and hold values like "Enforcement 02" or "nightly summary." This type discipline ensures that every attribute value is validated against its schema before it enters the compliance state.

**t_directive_only_governs_artifact**

| id | directive | governs |
| --- | --- | --- |
| ARTI-0001 | ISO 27001 Security Policy | Sensor Data Streams |
| ARTI-0002 | SOC 2 Type II Standard | Network Access Control Lists |
| ARTI-0003 | GDPR Compliance Mandate | Data Lake Metadata Catalog |
| ARTI-0004 | PCI DSS v4.0 Compliance | Data Lake Metadata Catalog |
| ARTI-0005 | FISMA Moderate Baseline | Laboratory Reagent Inventory |
| ARTI-0006 | OWASP Top Ten Control | Access Control Matrices |
| ARTI-0007 | NIST Cybersecurity Framework | Sensor Data Streams |

**t_directive_only_governs_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | effective_date | xsd:date |
| ARTI-0002 | enforcement | xsd:string |
| ARTI-0003 | mandatory | xsd:boolean |
| ARTI-0004 | priority | xsd:integer |
| ARTI-0005 | review_cycle_days | xsd:integer |
| ARTI-0006 | scope | xsd:string |
| ARTI-0007 | encoding | xsd:string |
| ARTI-0008 | label_text | xsd:string |

**t_directive_only_governs_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | false |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | true |
| ARTI-0007 | ARTI-0007 | ARTI-0003 | false |

**t_directive_only_governs_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-09-27 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2025-04-15 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-21 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2024-02-09 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2023-02-02 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-08-24 |
| ARTI-0007 | ARTI-0007 | ARTI-0001 | 2023-05-03 |

**t_directive_only_governs_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 5 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 959 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 4 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 97 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 5 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 179 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 4 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 356 |

**t_directive_only_governs_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | nightly summary |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | pre-release note |

The entity concept binds these attribute definitions to the governed artifacts. Each entity is identified by a stable key—ARTI-0001, ARTI-0002, and so on—and serves as the anchor point for all attribute values. The same attribute, say `mandatory`, can be evaluated independently for each entity, producing a distinct boolean outcome per governed artifact. This design permits fine-grained compliance posture: one artifact may carry `mandatory = true` while another carries `mandatory = false`, even though both are subject to the same overarching directive. The identifier space is further partitioned across domains. Transformation records carry keys such as RECO-0001 through RECO-0004, cardinality constraints use GENE-0001 through GENE-0004, and directive-artifact bindings use ARTI-0001 through ARTI-0004, ensuring that cross-references remain unambiguous and that no two governance objects collide in the identifier namespace.

**t_cardinality_max_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | mandatory_one | device_metrics |
| GENE-0002 | strict_unique | asset_registry |
| GENE-0003 | singular_ref | audit_logs |
| GENE-0004 | first_match | config_params |

Cardinality constraints enforce structural invariants on the relationships between governance objects. A constraint labeled `mandatory_one` or `strict_unique` guarantees that a given relationship admits exactly one target, while `singular_ref` and `first_match` express weaker but still deterministic selection rules. These constraints apply to associations such as the link between audit logs and device metrics, or between config parameters and the asset registry. The cardinality layer operates independently of the attribute-value layer; it governs the topology of the governance graph rather than the content of individual nodes.

Non-recoverable transformations are tracked as first-class governance events. Each transformation record carries an identifier such as RECO-0001 and describes a primary operation—partition compaction, log rotation, batch compaction, or format conversion—alongside a secondary operation such as checksum verification, index defragmentation, record purging, or index rebuild. The `scheduled_at` column records the planned execution time in ISO 8601 format, with observed values spanning from 2023-05-27T08:30:46 through 2025-03-09T11:37:12. The `triggered_by` column captures the origin of the transformation: `event`, `manual`, `schedule`, or `api`. This triad of identifier, timing, and provenance provides an auditable trail for every irreversible data operation, enabling compliance officers to reconstruct the sequence of transformations that affected a given artifact and to verify that each was authorized and logged.

**t_transformation_not_recoverable**

| id | transformation | transformation_2 | scheduled_at | triggered_by |
| --- | --- | --- | --- | --- |
| RECO-0001 | partition compaction | checksum verification | 2023-05-27T08:30:46 | event |
| RECO-0002 | log rotation | index defragmentation | 2024-07-23T05:41:48 | manual |
| RECO-0003 | batch compaction | record purging | 2025-03-09T11:37:12 | schedule |
| RECO-0004 | format conversion | index rebuild | 2023-08-05T01:48:14 | api |
| RECO-0005 | format conversion | feature scaling | 2023-09-25T17:59:19 | manual |
| RECO-0006 | batch compaction | telemetry filtering | 2024-03-31T12:21:12 | event |
| RECO-0007 | snapshot commit | batch compaction | 2023-07-05T00:36:15 | schedule |
| RECO-0008 | index defragmentation | index defragmentation | 2025-04-13T18:22:12 | schedule |