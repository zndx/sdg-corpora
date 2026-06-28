---
chapter_id: ch_live_measurement_produced_by_run_c1e9b7
topic_id: 161
family: 02_observation_measurement
cited_terms: ['measurement_produced_by_run', 'requirement_traces_to', 'claim_basic']
model: engine-refine
---

The governance framework distinguishes between the declarative properties of a claim and the concrete values those properties assume at a given point in time. An attribute—such as confidence, dimension_kind, method, or recorded_at—encodes a named dimension of assessment, while its type constrains the admissible value domain to a precise schema definition: xsd:decimal for numerical confidence scores, xsd:string for categorical descriptors like Dimension Kind 01 or Encoding 02, and xsd:dateTime for temporal stamps such as 2025-05-28T11:02:08. This separation of attribute schema from attribute value permits a single claim entity, identified by a stable key like CLAI-0001, to carry heterogeneous properties without schema migration. The entity itself serves as the anchor of accountability; every value row—whether a decimal reading of 0.443, a string fragment such as audit excerpt, or a timestamp—references back to its parent entity through a foreign-key linkage, ensuring that all observations remain attributable to a single auditable subject.

Measurements occupy a parallel but distinct position in the data model, functioning as quantified observations rather than declarative claims. Each measurement record carries an identifier—RUN-0001 through RUN-0004—and a measurement_key that may reference a canonical measurement definition. The factual content of a measurement comprises a numeric value, such as 353.34 or 878.99, accompanied by two companion fields that qualify its reliability: confidence, expressed as a decimal between 0.307 and 0.945, and uncertainty, expressed as an absolute magnitude ranging from 120.70 to 364.07. These three fields—value, confidence, and uncertainty—form a triad that any downstream consumer must evaluate jointly; a value of 660.64 paired with a confidence of 0.945 and an uncertainty of 279.24 conveys a materially different assurance posture than a value of 64.10 paired with a confidence of 0.307 and an uncertainty of 364.07. The measurement dimension table further classifies each measurement under a category, linking to a category dimension through a foreign key such as RUN-0005, and assigns a human-readable label like Measurement Label 01 alongside a broader category designation such as Measurement Category 01.

**fact_measurement**

| id | measurement_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| RUN-0001 | RUN-0003 | 0.496 | 306.26 | 353.34 |
| RUN-0002 | RUN-0001 | 0.945 | 279.24 | 660.64 |
| RUN-0003 | RUN-0006 | 0.506 | 120.70 | 878.99 |
| RUN-0004 | RUN-0006 | 0.307 | 364.07 | 64.10 |
| RUN-0005 | RUN-0003 | 0.923 | 642.96 | 897.70 |

**dim_measurement_category**

| id | category_name |
| --- | --- |
| RUN-0001 | Category Name 01 |
| RUN-0002 | Category Name 02 |
| RUN-0003 | Category Name 03 |
| RUN-0004 | Category Name 04 |
| RUN-0005 | Category Name 05 |
| RUN-0006 | Category Name 06 |

**t_claim_basic**

| id | claim |
| --- | --- |
| CLAI-0001 | Model accuracy below SLA |
| CLAI-0002 | Schema version deprecated |
| CLAI-0003 | Model accuracy below SLA |
| CLAI-0004 | File checksum matches |
| CLAI-0005 | Compliance audit passed |
| CLAI-0006 | Compliance audit passed |

The requirement-to-target traceability structure introduces a third relational pattern: a many-to-many association mediated by a role. Requirements—identified by keys such as TRAC-0001 and bearing descriptive names like Network Segmentation Rule or Privacy Compliance Requirement—map to target artifacts—identified by keys such as TRAC-0004 and bearing names like HIPAA Security Rule or ISO 27001 Control—through a junction table that records not merely the linkage but the nature of the linkage. The role column distinguishes whether a requirement is the owner of a target, a reviewer of it, or a contributor to it. In the observed data, the requirement Privacy Compliance Requirement (TRAC-0004) appears with the role reviewer in one association and contributor in another, while the target ISO 27001 Control (TRAC-0004) receives multiple inbound traces from different requirements, each carrying its own role designation. This role-bearing association is critical for audit: it answers not only which requirements reference which controls but in what capacity, a distinction that determines responsibility boundaries during compliance review.

**t_requirement_traces_to__traces_to**

| id | requirement_id | traces_to_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | owner |
| TRAC-0002 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0003 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0004 | TRAC-0001 | TRAC-0004 | contributor |
| TRAC-0005 | TRAC-0007 | TRAC-0005 | contributor |
| TRAC-0006 | TRAC-0002 | TRAC-0003 | observer |
| TRAC-0007 | TRAC-0007 | TRAC-0002 | owner |
| TRAC-0008 | TRAC-0001 | TRAC-0002 | observer |

Across all three patterns—claim attributes, measurements, and requirement traces—the identifier column serves as the universal primary key, enabling cross-table joins and providing a stable reference that survives schema evolution. The misc designation applied to value columns in the claim valuation tables reflects a pragmatic normalization strategy: because attributes carry heterogeneous types, the system stores decimal values, string values, and datetime values in separate tables, each keyed by the same entity-attr pair, rather than forcing a single value column to accommodate all types. This approach preserves type safety at the cost of query complexity, a trade-off appropriate for governance systems where data integrity outweighs query convenience. The category dimension, similarly, provides a flat classification layer that measurements reference through a foreign key, enabling aggregation and reporting without embedding categorical logic within the measurement fact itself.

**dim_measurement**

| id | measurement_label | measurement_category | category_id |
| --- | --- | --- | --- |
| RUN-0001 | Measurement Label 01 | Measurement Category 01 | RUN-0004 |
| RUN-0002 | Measurement Label 02 | Measurement Category 02 | RUN-0003 |
| RUN-0003 | Measurement Label 03 | Measurement Category 03 | RUN-0002 |
| RUN-0004 | Measurement Label 04 | Measurement Category 04 | RUN-0005 |
| RUN-0005 | Measurement Label 05 | Measurement Category 05 | RUN-0003 |
| RUN-0006 | Measurement Label 06 | Measurement Category 06 | RUN-0001 |
| RUN-0007 | Measurement Label 07 | Measurement Category 07 | RUN-0002 |

**t_requirement_traces_to**

| id | requirement |
| --- | --- |
| TRAC-0001 | Network Segmentation Rule |
| TRAC-0002 | Access Control Mandate |
| TRAC-0003 | Privacy Compliance Requirement |
| TRAC-0004 | Privacy Compliance Requirement |
| TRAC-0005 | Access Control Mandate |
| TRAC-0006 | Encryption Standard |
| TRAC-0007 | System Availability Target |

**t_requirement_traces_to_traces_to**

| id | traces_to |
| --- | --- |
| TRAC-0001 | HIPAA Security Rule |
| TRAC-0002 | Risk Assessment Matrix |
| TRAC-0003 | Compliance Audit Checklist |
| TRAC-0004 | ISO 27001 Control |
| TRAC-0005 | Penetration Test Suite |
| TRAC-0006 | NIST SP 800-53 |
| TRAC-0007 | Vulnerability Scan Config |

**t_claim_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2025-05-28T11:02:08 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2025-04-22T09:44:09 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2025-01-23T06:41:57 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-03-14T10:07:11 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-08-27T20:51:04 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2025-04-10T08:56:25 |

**t_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.443 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 443.93 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 257.71 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.828 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 729.35 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 717.18 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.004 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 534.68 |

**t_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | audit excerpt |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | fr |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | automated |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | m/s |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |