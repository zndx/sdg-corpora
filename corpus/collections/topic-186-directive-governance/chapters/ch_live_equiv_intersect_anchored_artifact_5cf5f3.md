---
chapter_id: ch_live_equiv_intersect_anchored_artifact_5cf5f3
topic_id: 186
family: 01_foundation
cited_terms: ['equiv_intersect_anchored_artifact', 'frame_coarsening', 'nist80053_moderate_impact']
model: engine-refine
---

At the foundation of any structured data governance system lies the concept of the identifier, a stable key that anchors an entity across its entire lifecycle. Whether tracking a processing artifact, a data coarsening frame, or a compliance impact classification, each record receives a unique handle—such as ARTI-0001, COAR-0001, or IMPA-0001—that enables unambiguous reference, cross-system linking, and auditability. These identifiers do not merely label records; they serve as the primary join keys that bind metadata, values, and policy constraints together, ensuring that every downstream operation can trace back to a single source of truth.

**t_frame_coarsening**

| id | frame | coarsens_frame |
| --- | --- | --- |
| COAR-0001 | temporal observation scope | micro batch window |
| COAR-0002 | raw sensor tick | quarterly region cluster |
| COAR-0003 | raw sensor tick | spatial zone seven |
| COAR-0004 | processing pipeline tier | raw sensor tick |
| COAR-0005 | metadata catalog level | daily telemetry window |
| COAR-0006 | hourly sensor grid | logical dataset slice |

**t_frame_coarsening_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0004 | 2025-04-27T07:32:48 |
| COAR-0002 | COAR-0002 | COAR-0004 | 2023-03-09T02:04:03 |
| COAR-0003 | COAR-0003 | COAR-0004 | 2024-05-12T02:02:48 |
| COAR-0004 | COAR-0004 | COAR-0004 | 2023-04-01T23:44:45 |
| COAR-0005 | COAR-0005 | COAR-0004 | 2024-09-19T04:18:56 |
| COAR-0006 | COAR-0006 | COAR-0004 | 2024-03-20T18:21:57 |

**t_frame_coarsening_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0001 | 0.517 |
| COAR-0002 | COAR-0001 | COAR-0005 | 121.11 |
| COAR-0003 | COAR-0001 | COAR-0007 | 637.59 |
| COAR-0004 | COAR-0002 | COAR-0001 | 0.922 |
| COAR-0005 | COAR-0002 | COAR-0005 | 777.00 |
| COAR-0006 | COAR-0002 | COAR-0007 | 979.20 |
| COAR-0007 | COAR-0003 | COAR-0001 | 0.376 |
| COAR-0008 | COAR-0003 | COAR-0005 | 973.40 |

**t_frame_coarsening_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COAR-0001 | COAR-0001 | COAR-0002 | Dimension Kind 01 |
| COAR-0002 | COAR-0001 | COAR-0008 | Encoding 02 |
| COAR-0003 | COAR-0001 | COAR-0009 | nightly summary |
| COAR-0004 | COAR-0001 | COAR-0010 | en |
| COAR-0005 | COAR-0001 | COAR-0003 | hybrid |
| COAR-0006 | COAR-0001 | COAR-0006 | count |
| COAR-0007 | COAR-0002 | COAR-0002 | Dimension Kind 07 |
| COAR-0008 | COAR-0002 | COAR-0008 | Encoding 08 |

**t_nist80053_moderate_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-53 |
| IMPA-0002 | SP 800-53 |
| IMPA-0003 | SP 800-171 |
| IMPA-0004 | SP 800-218 |
| IMPA-0005 | NIST AI RMF |
| IMPA-0006 | SP 800-171 |
| IMPA-0007 | SP 800-37 |

**t_nist80053_moderate_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate Threshold |
| IMPA-0002 | System Security Moderate |
| IMPA-0003 | Impact Level Moderate |
| IMPA-0004 | Moderate Baseline |
| IMPA-0005 | Moderate Threshold |
| IMPA-0006 | Moderate |
| IMPA-0007 | Availability Moderate |

Once an entity is identified, its characteristics are captured through attributes and their corresponding data types. The attribute schema defines what can be measured or recorded, while the attribute type enforces structural integrity by constraining values to specific formats like xsd:decimal, xsd:string, or xsd:dateTime. This separation allows systems to store heterogeneous data efficiently: numeric measurements such as 0.517 or 121.11 reside in decimal stores, temporal markers like 2025-04-27T07:32:48 are preserved in datetime columns, and categorical descriptors such as Dimension Kind 01 or Encoding 02 are held in variable-character fields. By decoupling the attribute definition from its runtime values, the architecture supports flexible metadata expansion without schema migration, while miscellaneous value stores absorb unstructured or domain-specific payloads that do not fit rigid typological boundaries.

Beyond descriptive metadata, governance frameworks must guarantee artifact integrity and clarify usage rights. Checksums function as cryptographic fingerprints that detect unauthorized modifications; for instance, a value like 7b14de08 can be verified against a stored baseline to confirm that an artifact such as LabSampleMetadata or ComplianceDocument remains unaltered since ingestion. Alongside integrity verification, license designations establish the legal and operational boundaries for artifact distribution. Whether marked proprietary, GPL-3.0, or MIT, these licenses dictate downstream consumption rules, ensuring that data products are handled in compliance with intellectual property and open-source obligations.

Compliance enforcement relies on a structured mapping of responsibilities, typically expressed through a subject-target-role relationship model. In this paradigm, a subject represents the governing standard or control framework—such as SP 800-53 or SP 800-171—while the target denotes the specific impact classification or security threshold it addresses, like Moderate Threshold or System Security Moderate. The role field assigns operational accountability to each pairing, designating whether an entity acts as an observer, contributor, or owner within the control landscape. This triad transforms abstract policy documents into actionable governance matrices, clarifying who must monitor, implement, or maintain specific security baselines.

**t_nist80053_moderate_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0007 | observer |
| IMPA-0002 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0003 | IMPA-0006 | IMPA-0001 | contributor |
| IMPA-0004 | IMPA-0007 | IMPA-0007 | owner |
| IMPA-0005 | IMPA-0003 | IMPA-0002 | owner |
| IMPA-0006 | IMPA-0004 | IMPA-0005 | observer |
| IMPA-0007 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0008 | IMPA-0003 | IMPA-0007 | owner |

Together, these constructs form a cohesive data governance fabric. Identifiers provide the addressing layer, attributes and their types supply the descriptive schema, checksums and licenses enforce integrity and legal compliance, and subject-target-role mappings operationalize policy into accountable relationships. When integrated, they enable organizations to track data artifacts from ingestion through processing, validate their authenticity, respect licensing constraints, and demonstrate adherence to regulatory frameworks. The result is a transparent, auditable ecosystem where every piece of data carries its own lineage, constraints, and compliance context.

**t_equiv_intersect_anchored_artifact**

| id | equiv | equiv_2 | checksum | license |
| --- | --- | --- | --- | --- |
| ARTI-0001 | LabSampleMetadata | IntegrityFile | 7b14de08 | proprietary |
| ARTI-0002 | IngestionPipeline | ComplianceDocument | 5e8f3c91 | GPL-3.0 |
| ARTI-0003 | ValidationRuleSet | SecurityAuditLog | 7b14de08 | MIT |
| ARTI-0004 | AuditTrailLog | IntegrityFile | a3f9c21e | proprietary |
| ARTI-0005 | FeatureVectorStore | ConfigurationArtifact | a3f9c21e | GPL-3.0 |
| ARTI-0006 | AuditTrailLog | ConstraintDefinition | a3f9c21e | BSD-3-Clause |

**t_frame_coarsening_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COAR-0001 | confidence | xsd:decimal |
| COAR-0002 | dimension_kind | xsd:string |
| COAR-0003 | method | xsd:string |
| COAR-0004 | recorded_at | xsd:dateTime |
| COAR-0005 | uncertainty | xsd:decimal |
| COAR-0006 | unit | xsd:string |
| COAR-0007 | value | xsd:decimal |
| COAR-0008 | encoding | xsd:string |