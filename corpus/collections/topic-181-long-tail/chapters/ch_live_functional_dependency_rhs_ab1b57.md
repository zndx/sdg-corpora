---
chapter_id: ch_live_functional_dependency_rhs_ab1b57
topic_id: 181
family: 07_long_tail
cited_terms: ['functional_dependency_rhs', 'attestation_basic', 'artifact_subclass_two_parents']
model: engine-refine
---

This Controlled Document establishes the taxonomy and governance of attribute-based metadata, wherein every observable property of an entity is decomposed into a discrete attribute definition paired with a strict type constraint. Attribute definitions—such as duration_seconds, end_time, exit_code, and host_name—are catalogued with their corresponding data types drawn from the XML Schema Definition namespace: xsd:decimal for numeric measures, xsd:dateTime for temporal markers, xsd:integer for discrete counters, and xsd:string for textual descriptors. This type discipline ensures that every value assigned to an attribute conforms to a predictable schema, enabling automated validation across heterogeneous data sources. The attribute registry itself is decoupled from its values, permitting a single attribute definition to be referenced by multiple entity instances without duplication of type metadata.

Entity instances materialize these abstract attributes through value assignments distributed across type-specific storage tables. A single entity, identified by a composite key such as ATTE-0001, may carry a decimal measure of 7132.97, a datetime stamp of 2024-11-18T12:26:52, an integer counter of 898, and a categorical label such as ingest-21 or initiation, each stored in its respective typed value table and linked back to the entity through a foreign-key reference. This normalization pattern—separating attribute definitions from their typed values—preserves referential integrity while accommodating the heterogeneity of real-world metadata, where a single entity may carry dozens of attributes spanning numeric, temporal, and textual domains. The entity identifier serves as the stable anchor point across all value tables, ensuring that every measurement, timestamp, and classification can be traced to its originating entity without ambiguity.

**t_attestation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2024-11-18T12:26:52 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2023-12-15T15:31:35 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2023-03-05T20:41:52 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2023-09-08T13:00:56 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-07-29T18:29:50 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2024-08-01T11:14:05 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2023-01-08T06:41:42 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2025-06-10T02:28:19 |

**t_attestation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 7132.97 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 6429.54 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 3894.03 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 6507.32 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5722.64 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 4627.41 |

Attestations represent a higher-order classification of entities, anchoring them to governance and compliance frameworks. An attestation such as Vendor risk assessment, HIPAA compliance review, or ML model fairness audit functions as a container entity that inherits the same attribute-value architecture, allowing compliance reviews to carry their own duration, exit codes, host identifiers, and lifecycle states. The attestation lifecycle is further tracked through categorical values such as initiation, superseded, and Log Level 02, which encode the current status and severity of the review process. This uniform treatment of attestations as typed entities ensures that compliance metadata is queryable, auditable, and subject to the same integrity constraints as operational telemetry.

**t_attestation_basic**

| id | attestation |
| --- | --- |
| ATTE-0001 | Vendor risk assessment |
| ATTE-0002 | HIPAA compliance review |
| ATTE-0003 | ML model fairness audit |
| ATTE-0004 | HIPAA compliance review |
| ATTE-0005 | SOC 2 Type II audit |
| ATTE-0006 | Vendor risk assessment |

**t_attestation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 898 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 487 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 71 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 180 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 107 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 326 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 620 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 392 |

**t_attestation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | ingest-21 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | initiation |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | gw-12 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | execution |

Functional dependencies define the transformational relationships between data elements, specifying how input properties deterministically produce output properties. A functional dependency such as data ingestion pipeline, encryption transformation, telemetry aggregation service, or access control evaluator establishes a rule by which certain input attributes constrain the values of output attributes. The right-hand side of these dependencies—values such as aggregated event count, sanitized email address, partition key value, and enriched sensor reading—represents the deterministic outputs that follow from the input specification. These dependencies are not merely declarative; they encode the data lineage and transformation logic that underpins data quality guarantees, enabling downstream systems to reason about the provenance and trustworthiness of derived values.

**t_functional_dependency_rhs**

| id | functional |
| --- | --- |
| RHS-0001 | data ingestion pipeline |
| RHS-0002 | encryption transformation |
| RHS-0003 | telemetry aggregation service |
| RHS-0004 | access control evaluator |
| RHS-0005 | telemetry aggregation service |
| RHS-0006 | schema validation routine |

**t_functional_dependency_rhs_f_d_right_hand_side**

| id | f_d_right_hand_side |
| --- | --- |
| RHS-0001 | aggregated event count |
| RHS-0002 | sanitized email address |
| RHS-0003 | partition key value |
| RHS-0004 | enriched sensor reading |
| RHS-0005 | derived priority level |
| RHS-0006 | computed latency metric |
| RHS-0007 | computed latency metric |

The association between functional dependencies and their right-hand side outputs is mediated through a role-based junction table that explicitly declares the nature of each relationship. A functional dependency may contribute to a right-hand side value as a contributor, or it may own the output as an owner, with the role column encoding this semantic distinction. For instance, the telemetry aggregation service may own the enriched sensor reading while simultaneously contributing to the aggregated event count, reflecting the multi-faceted nature of data transformations. This role-based association pattern generalizes beyond functional dependencies to any many-to-many relationship where the semantic nature of the link carries independent meaning, enabling fine-grained governance over data lineage and transformation accountability.

**t_functional_dependency_rhs__f_d_right_hand_side**

| id | functional_id | f_d_right_hand_side_id | role |
| --- | --- | --- | --- |
| RHS-0001 | RHS-0003 | RHS-0007 | contributor |
| RHS-0002 | RHS-0004 | RHS-0001 | owner |
| RHS-0003 | RHS-0002 | RHS-0005 | owner |
| RHS-0004 | RHS-0003 | RHS-0006 | owner |
| RHS-0005 | RHS-0003 | RHS-0001 | owner |
| RHS-0006 | RHS-0001 | RHS-0005 | owner |
| RHS-0007 | RHS-0001 | RHS-0006 | contributor |
| RHS-0008 | RHS-0002 | RHS-0001 | contributor |

Artifact classification extends the metadata model to include externally identifiable resources, each assigned a stable identifier drawn from established naming authorities and a set of classification tags. Identifiers such as doi:10.1109/x, oid:1.3.6.1, ref-8842, and urn:uuid:9f2a provide globally unique references to artifacts, while tags such as verified, pii, and internal encode sensitivity and trust classifications. The artifact subclass model supports multiple inheritance through a two-parent structure, where an artifact may simultaneously belong to categories such as streaming-window-5min and ingestion-script-v2, or telemetry-aggregate-q3 and encryption-key-rotation. This dual-parent classification enables fine-grained access control and policy enforcement, as governance rules can target artifacts based on any combination of their parent categories, their identifier namespace, or their tag set.

**t_artifact_subclass_two_parents**

| id | artifact | artifact_2 | identifier | tags |
| --- | --- | --- | --- | --- |
| PARE-0001 | streaming-window-5min | ingestion-script-v2 | doi:10.1109/x | verified |
| PARE-0002 | streaming-window-5min | metadata-registry-sync | oid:1.3.6.1 | pii |
| PARE-0003 | telemetry-aggregate-q3 | encryption-key-rotation | ref-8842 | verified |
| PARE-0004 | model-checkpoint-epoch12 | master-schema-v1 | urn:uuid:9f2a | internal |
| PARE-0005 | telemetry-aggregate-q3 | master-schema-v1 | oid:1.3.6.1 | public |
| PARE-0006 | model-checkpoint-epoch12 | ingestion-script-v2 | doi:10.1109/x | verified |
| PARE-0007 | index-rebuild-prod | validation-ruleset-strict | urn:uuid:9f2a | verified |