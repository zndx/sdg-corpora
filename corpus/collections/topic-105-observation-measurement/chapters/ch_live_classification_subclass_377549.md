---
chapter_id: ch_live_classification_subclass_377549
topic_id: 105
family: 03_directive_governance
cited_terms: ['classification_subclass', 'artifact_either_active_or_archived', 'xdp_action_pass']
model: engine-refine
---

Within the governance architecture, every asset and classification is anchored by a unique identifier—CLAS-0001 through CLAS-0004 for risk and compliance taxonomies, ARCH-0001 through ARCH-0004 for the artifact registry, and PASS-0001 through PASS-0004 for stream-processing passes—ensuring that each entity, whether a data catalog index, a sensor-telemetry pipeline, or a compliance benchmark, is unambiguously addressable across all operational contexts. The identifier serves as the primary key through which all downstream relationships are resolved: an entity such as ARCH-0001, representing the artifact sensor-telemetry-v4 with its associated output-sink-delta and test-dataset dependencies, is not merely a row in a table but the referent for every attribute assignment, every value binding, and every access-control relationship that follows. Similarly, the classification entity CLAS-0001, carrying the OWASP Risk Rating with exit code 493 and status failed, is the subject of remediation workflows and the target of audit queries alike.

**t_classification_subclass**

| id | classification | exit_code | status |
| --- | --- | --- | --- |
| CLAS-0001 | OWASP Risk Rating | 493 | failed |
| CLAS-0002 | GDPR Data Category | 301 | pending |
| CLAS-0003 | GDPR Data Category | 581 | complete |
| CLAS-0004 | CIS Benchmark | 197 | complete |
| CLAS-0005 | OWASP Risk Rating | 912 | complete |

**t_artifact_either_active_or_archived**

| id | artifact | artifact_2 | artifact_3 |
| --- | --- | --- | --- |
| ARCH-0001 | sensor-telemetry-v4 | output-sink-delta | test-dataset |
| ARCH-0002 | config-repo-main | schema-registry | deployment-target |
| ARCH-0003 | data-catalog-index | upstream-source-beta | test-dataset |
| ARCH-0004 | event-stream-kafka | checksum-validator | compliance-tier |
| ARCH-0005 | config-repo-main | checksum-validator | production-cluster |
| ARCH-0006 | ml-feature-store | validation-module | test-dataset |
| ARCH-0007 | sensor-telemetry-v4 | validation-module | deployment-target |
| ARCH-0008 | batch-ingest-queue | validation-module | dev-sandbox |

**t_artifact_either_active_or_archived_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARCH-0001 | checksum | xsd:string |
| ARCH-0002 | created_date | xsd:date |
| ARCH-0003 | identifier | cco:DesignativeICE |
| ARCH-0004 | license | xsd:string |
| ARCH-0005 | mime_type | xsd:string |
| ARCH-0006 | size_bytes | xsd:long |
| ARCH-0007 | uri | xsd:string |
| ARCH-0008 | version | xsd:integer |

**t_artifact_either_active_or_archived_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0006 | 356 |
| ARCH-0002 | ARCH-0001 | ARCH-0008 | 2 |
| ARCH-0003 | ARCH-0002 | ARCH-0006 | 77 |
| ARCH-0004 | ARCH-0002 | ARCH-0008 | 4 |
| ARCH-0005 | ARCH-0003 | ARCH-0006 | 218 |
| ARCH-0006 | ARCH-0003 | ARCH-0008 | 10 |
| ARCH-0007 | ARCH-0004 | ARCH-0006 | 431 |
| ARCH-0008 | ARCH-0004 | ARCH-0008 | 2 |

**t_xdp_action_pass**

| id | xdp |
| --- | --- |
| PASS-0001 | prod-ingest-xdp |
| PASS-0002 | edge-telemetry-xdp |
| PASS-0003 | compliance-xdp |
| PASS-0004 | prod-ingest-xdp |
| PASS-0005 | streaming-fabric-xdp |
| PASS-0006 | cloud-sync-xdp |

**t_xdp_action_pass_x_d_p_action**

| id | x_d_p_action |
| --- | --- |
| PASS-0001 | route-to-lake |
| PASS-0002 | validate-schema |
| PASS-0003 | sync-replica |
| PASS-0004 | tag-PII |
| PASS-0005 | drop-invalid |
| PASS-0006 | encrypt-payload |

The attribute system decomposes each entity into a set of named properties, each typed to enforce schema discipline at the point of value insertion. Attribute names such as checksum, created_date, identifier, and license are declared against a type registry that includes xsd:string for opaque and textual values, xsd:date for temporal markers, and cco:DesignativeICE for designative identifiers conforming to the Content Commons ontology. This separation of attribute definition from value storage permits heterogeneous value types to coexist without schema drift: the checksum value 7b14de08 is stored as a varchar, the creation date 2024-02-12 as a date, and the license BSD-3-Clause as a varchar, each routed through its respective value table—val_varchar, val_date, or val_int—according to the attr_type declared at definition time. Integer attributes, such as the values 356 and 2 bound to entity ARCH-0001, or 77 and 4 bound to entity ARCH-0002, follow the same typed dispatch, ensuring that the misc column in each value table never contains a type mismatch.

**t_artifact_either_active_or_archived_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0002 | 2024-02-12 |
| ARCH-0002 | ARCH-0002 | ARCH-0002 | 2023-06-04 |
| ARCH-0003 | ARCH-0003 | ARCH-0002 | 2025-05-16 |
| ARCH-0004 | ARCH-0004 | ARCH-0002 | 2024-07-03 |
| ARCH-0005 | ARCH-0005 | ARCH-0002 | 2024-07-21 |
| ARCH-0006 | ARCH-0006 | ARCH-0002 | 2024-03-16 |
| ARCH-0007 | ARCH-0007 | ARCH-0002 | 2025-02-16 |
| ARCH-0008 | ARCH-0008 | ARCH-0002 | 2024-07-02 |

**t_artifact_either_active_or_archived_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0001 | 7b14de08 |
| ARCH-0002 | ARCH-0001 | ARCH-0003 | ref-8842 |
| ARCH-0003 | ARCH-0001 | ARCH-0004 | BSD-3-Clause |
| ARCH-0004 | ARCH-0001 | ARCH-0009 | ap-south-2 |
| ARCH-0005 | ARCH-0001 | ARCH-0005 | text/csv |
| ARCH-0006 | ARCH-0001 | ARCH-0010 | Name 06 |
| ARCH-0007 | ARCH-0001 | ARCH-0011 | analytics |
| ARCH-0008 | ARCH-0001 | ARCH-0012 | Tags 08 |

Classification entities carry their own lifecycle metadata through the exit_code and status columns, which together encode the operational posture of each risk or compliance benchmark. The exit code 493 associated with the OWASP Risk Rating classification CLAS-0001, paired with a status of failed, signals a remediation requirement that must be addressed before the entity can transition to a complete state; by contrast, CLAS-0003 and CLAS-0004, both classified under GDPR Data Category and bearing exit codes 581 and 197 respectively, have reached a status of complete, indicating that their assessment cycles have concluded without outstanding action items. The pending status of CLAS-0002, also a GDPR Data Category classification with exit code 301, marks an intermediate state where evaluation is underway but final disposition has not yet been recorded. These status values—failed, pending, complete—form a finite state machine that governs the progression of classification entities through their operational lifecycle.

The relationship between stream-processing passes and their constituent actions is modeled through a junction table that binds a subject to a target with an assigned role, thereby encoding not merely which action applies to which pass but the nature of the association. The subject column references the XDP pass—prod-ingest-xdp, edge-telemetry-xdp, or compliance-xdp—while the target column references the action, such as route-to-lake, validate-schema, sync-replica, or tag-PII. The role column, taking values of observer, owner, or contributor, specifies the capacity in which the subject participates in the action: a pass may observe a schema-validation action without owning it, or contribute to a PII-tagging operation without being its primary owner. This tripartite relationship—subject, target, role—enables fine-grained provenance tracking and access control, ensuring that every data transformation in the pipeline can be traced to its responsible entity and that the permissions associated with each role are enforced at the point of execution.

**t_xdp_action_pass__x_d_p_action**

| id | xdp_id | x_d_p_action_id | role |
| --- | --- | --- | --- |
| PASS-0001 | PASS-0001 | PASS-0005 | observer |
| PASS-0002 | PASS-0002 | PASS-0004 | owner |
| PASS-0003 | PASS-0005 | PASS-0003 | observer |
| PASS-0004 | PASS-0005 | PASS-0005 | contributor |
| PASS-0005 | PASS-0003 | PASS-0006 | observer |
| PASS-0006 | PASS-0005 | PASS-0006 | contributor |
| PASS-0007 | PASS-0005 | PASS-0001 | observer |
| PASS-0008 | PASS-0002 | PASS-0001 | contributor |