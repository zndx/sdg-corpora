---
chapter_id: ch_live_artifact_not_deprecated_49ec22
topic_id: 56
family: 07_long_tail
cited_terms: ['artifact_not_deprecated', 'schema_migration_subclass', 'claim_subclass']
model: engine-refine
---

Artifact governance in data infrastructure rests on a layered taxonomy that distinguishes between the identity of a data product, its classification, and the technical attributes that govern its lifecycle. Each artifact is assigned a unique identifier—DEPR-0001 through DEPR-0004 serve as canonical keys—and is further characterized by a label such as Artifact Label 01 and a category like Artifact Category 01, which together provide the semantic context necessary for discovery and audit. The factual layer captures the material properties of each artifact instance: size_bytes records the storage footprint, ranging from 42,978,804 bytes for a compact artifact to 996,080,316 bytes for a substantially larger variant, while version numbers (5 through 10) track iterative changes. The artifact_key column introduces a cross-reference mechanism, allowing one artifact record to point to another—DEPR-0004, for instance, references DEPR-0005, suggesting a lineage or dependency relationship between distinct data products.

**fact_artifact**

| id | artifact_key | size_bytes | version |
| --- | --- | --- | --- |
| DEPR-0001 | DEPR-0004 | 123155790 | 6 |
| DEPR-0002 | DEPR-0005 | 42978804 | 5 |
| DEPR-0003 | DEPR-0004 | 996080316 | 5 |
| DEPR-0004 | DEPR-0005 | 597369362 | 10 |
| DEPR-0005 | DEPR-0006 | 12061913 | 9 |
| DEPR-0006 | DEPR-0001 | 792675668 | 5 |

**dim_artifact**

| id | artifact_label | artifact_category |
| --- | --- | --- |
| DEPR-0001 | Artifact Label 01 | Artifact Category 01 |
| DEPR-0002 | Artifact Label 02 | Artifact Category 02 |
| DEPR-0003 | Artifact Label 03 | Artifact Category 03 |
| DEPR-0004 | Artifact Label 04 | Artifact Category 04 |
| DEPR-0005 | Artifact Label 05 | Artifact Category 05 |
| DEPR-0006 | Artifact Label 06 | Artifact Category 06 |

Schema migration events form the operational backbone of data platform evolution, and their governance requires precise attribution of responsibility. Migration subclasses are classified by their schema type—compliance_audit, inventory_snapshot, sensor_telemetry, and transaction_ledger—each representing a distinct data domain with its own regulatory and technical requirements. The migration target determines the destination platform, whether PostgreSQL_14, ClickHouse_v20, DeltaLake_v1, or BigQuery_warehouse, and the relationship between source and target is mediated through a role-based assignment. In the migration junction table, the role column distinguishes between owner, observer, and reviewer designations, establishing a clear accountability framework. A single migration record such as MIGR-0004 may carry multiple role assignments—owner, observer, and reviewer simultaneously—reflecting the multi-stakeholder nature of data platform transitions.

**t_schema_migration_subclass**

| id | schema |
| --- | --- |
| MIGR-0001 | compliance_audit |
| MIGR-0002 | inventory_snapshot |
| MIGR-0003 | sensor_telemetry |
| MIGR-0004 | transaction_ledger |
| MIGR-0005 | compliance_audit |
| MIGR-0006 | inventory_snapshot |

**t_schema_migration_subclass_migrates_schema_to**

| id | migrates_schema_to |
| --- | --- |
| MIGR-0001 | PostgreSQL_14 |
| MIGR-0002 | ClickHouse_v20 |
| MIGR-0003 | DeltaLake_v1 |
| MIGR-0004 | BigQuery_warehouse |
| MIGR-0005 | Avro_registry |
| MIGR-0006 | GraphQL_resolvers |
| MIGR-0007 | Kafka_schemas |
| MIGR-0008 | Kafka_schemas |

**t_schema_migration_subclass__migrates_schema_to**

| id | schema_id | migrates_schema_to_id | role |
| --- | --- | --- | --- |
| MIGR-0001 | MIGR-0004 | MIGR-0001 | owner |
| MIGR-0002 | MIGR-0004 | MIGR-0007 | observer |
| MIGR-0003 | MIGR-0004 | MIGR-0007 | reviewer |
| MIGR-0004 | MIGR-0002 | MIGR-0004 | observer |
| MIGR-0005 | MIGR-0001 | MIGR-0001 | reviewer |
| MIGR-0006 | MIGR-0001 | MIGR-0008 | owner |
| MIGR-0007 | MIGR-0004 | MIGR-0002 | contributor |
| MIGR-0008 | MIGR-0001 | MIGR-0002 | owner |

Claims provide the evidentiary layer that connects operational events to their underlying causes and documentation. A claim records a specific assertion—Lab centrifuge unit-7, QC sample failed, Packet loss SLA breach, Authentication microservice—and anchors it to a migration event through the claim_about column, which references identifiers like MIGR-0003 or MIGR-0002. The method column classifies how the claim was derived: automated detection, hybrid analysis combining automated and manual inputs, or inferred reasoning based on indirect evidence. Each claim is further substantiated by a label_text field that points to the supporting document—an audit excerpt, intake form, pre-release note, or calibration record—creating a verifiable chain from assertion to source material.

**t_claim_subclass**

| id | claim | claim_about | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Lab centrifuge unit-7 | MIGR-0003 | automated | audit excerpt |
| CLAI-0002 | QC sample failed | MIGR-0002 | hybrid | intake form |
| CLAI-0003 | Packet loss SLA breach | MIGR-0004 | hybrid | pre-release note |
| CLAI-0004 | Authentication microservice | MIGR-0002 | inferred | calibration record |

The interplay between these layers creates a traceable governance model. An artifact's version history can be correlated with the schema migrations that affected its underlying data, while claims about those migrations carry methodological transparency and documentary evidence. The role assignments in the migration junction table ensure that every schema-to-platform transition has designated owners, observers, and reviewers, and the artifact_key cross-references allow downstream systems to trace which data products were impacted by a given migration. This architecture supports compliance requirements by maintaining a complete audit trail: from the raw artifact (identified, categorized, sized, and versioned), through the migration event (classified, targeted, and role-assigned), to the claim that documents what occurred (methodologically derived and evidentially anchored).