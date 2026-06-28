---
chapter_id: ch_live_annotation_governed_by_classification_policy_04304a
topic_id: 94
family: 02_observation_measurement
cited_terms: ['annotation_governed_by_classification_policy', 'belief_interval_at_confidence_level', 'requirement_traces_to']
model: engine-refine
---

The architecture of traceability and annotation rests on a disciplined separation between the things that are described and the metadata that qualifies them. Every observable or asserted fact is anchored by an identifier—a stable, machine-readable key such as POLI-0001 or TRAC-0003—that survives schema evolution and cross-referencing. Identifiers appear throughout the data model: as primary keys on annotation facts, as foreign keys linking belief intervals to confidence-level requirements, and as the join columns in relationship tables. An identifier alone carries no semantics; it is the scaffold upon which labels, categories, and attribute values are hung. The `dim_annotation` table, for instance, pairs each identifier with a human-readable label and a category designation, so that POLI-0001 resolves to "Annotation Label 01" within "Annotation Category 01," while POLI-0004 maps to "Annotation Label 04" under "Annotation Category 04." This two-tier naming—label for consumption, category for grouping—enables both direct lookup and aggregate filtering without conflating display concerns with classification logic.

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| POLI-0001 | POLI-0005 | 0.845 | 690.59 | 979.94 |
| POLI-0002 | POLI-0003 | 0.236 | 593.98 | 370.63 |
| POLI-0003 | POLI-0004 | 0.271 | 104.01 | 360.27 |
| POLI-0004 | POLI-0001 | 0.303 | 22.02 | 284.47 |
| POLI-0005 | POLI-0003 | 0.002 | 328.54 | 25.47 |

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| POLI-0001 | Annotation Label 01 | Annotation Category 01 |
| POLI-0002 | Annotation Label 02 | Annotation Category 02 |
| POLI-0003 | Annotation Label 03 | Annotation Category 03 |
| POLI-0004 | Annotation Label 04 | Annotation Category 04 |
| POLI-0005 | Annotation Label 05 | Annotation Category 05 |
| POLI-0006 | Annotation Label 06 | Annotation Category 06 |

**t_belief_interval_at_confidence_level**

| id | belief | at_confidence_level |
| --- | --- | --- |
| LEVE-0001 | Calibration drift reading | TRAC-0003 |
| LEVE-0002 | Query result set | TRAC-0002 |
| LEVE-0003 | Schema migration status | TRAC-0003 |
| LEVE-0004 | Sensor telemetry snapshot | TRAC-0007 |
| LEVE-0005 | Data lineage trace | TRAC-0002 |
| LEVE-0006 | Pipeline throughput metric | TRAC-0003 |
| LEVE-0007 | Schema migration status | TRAC-0002 |
| LEVE-0008 | Lab assay concentration | TRAC-0003 |

**t_belief_interval_at_confidence_level_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LEVE-0001 | confidence | xsd:decimal |
| LEVE-0002 | dimension_kind | xsd:string |
| LEVE-0003 | method | xsd:string |
| LEVE-0004 | recorded_at | xsd:dateTime |
| LEVE-0005 | uncertainty | xsd:decimal |
| LEVE-0006 | unit | xsd:string |
| LEVE-0007 | value | xsd:decimal |
| LEVE-0008 | encoding | xsd:string |

Annotations themselves are the primary vehicle for attaching qualified assessments to entities. The `fact_annotation` table stores each annotation as a record carrying a confidence score, an uncertainty magnitude, and a numeric value. Confidence values span a meaningful range: 0.845 for POLI-0001 signals a high-degree assertion, whereas 0.236 for POLI-0002 reflects substantial doubt. Uncertainty, measured on a separate scale, runs from 22.02 for POLI-0004 up to 690.59 for POLI-0001, indicating that high confidence does not necessarily imply low absolute uncertainty—the two dimensions capture distinct aspects of epistemic quality. The associated value field (979.94, 370.63, 360.27, 284.47) provides the quantitative substance of the annotation, whether it represents a measurement, a score, or a derived metric. Together, confidence, uncertainty, and value form a triad that allows downstream consumers to weight, filter, or reject annotations based on their quality thresholds.

Attribute definitions and their typed values are managed through a schema that distinguishes the attribute's identity and type from the actual data stored against it. The `t_belief_interval_at_confidence_level_attr` table declares attributes such as `confidence` (typed as `xsd:decimal`), `dimension_kind` (`xsd:string`), `method` (`xsd:string`), and `recorded_at` (`xsd:dateTime`). Each attribute is then materialized across three value tables—`val_decimal`, `val_varchar`, and `val_datetime`—partitioned by type to enforce schema discipline at query time. A single entity, identified as LEVE-0001, may carry a confidence of 0.649 in the decimal table, a dimension kind of "Dimension Kind 01" in the varchar table, and a recording timestamp of 2023-02-13T08:09:52 in the datetime table. The entity_id column in each value table references the belief interval record, while attr_id points back to the attribute definition, creating a normalized star schema where type safety is preserved without sacrificing flexibility.

**t_belief_interval_at_confidence_level_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0004 | 2023-02-13T08:09:52 |
| LEVE-0002 | LEVE-0002 | LEVE-0004 | 2025-01-26T05:24:46 |
| LEVE-0003 | LEVE-0003 | LEVE-0004 | 2023-02-11T13:24:10 |
| LEVE-0004 | LEVE-0004 | LEVE-0004 | 2025-05-13T04:15:37 |
| LEVE-0005 | LEVE-0005 | LEVE-0004 | 2025-01-29T02:47:20 |
| LEVE-0006 | LEVE-0006 | LEVE-0004 | 2023-06-10T12:00:26 |
| LEVE-0007 | LEVE-0007 | LEVE-0004 | 2023-12-02T09:08:00 |
| LEVE-0008 | LEVE-0008 | LEVE-0004 | 2023-02-02T13:44:49 |

**t_belief_interval_at_confidence_level_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0001 | 0.649 |
| LEVE-0002 | LEVE-0001 | LEVE-0005 | 174.38 |
| LEVE-0003 | LEVE-0001 | LEVE-0007 | 717.12 |
| LEVE-0004 | LEVE-0002 | LEVE-0001 | 0.339 |
| LEVE-0005 | LEVE-0002 | LEVE-0005 | 870.57 |
| LEVE-0006 | LEVE-0002 | LEVE-0007 | 357.58 |
| LEVE-0007 | LEVE-0003 | LEVE-0001 | 0.361 |
| LEVE-0008 | LEVE-0003 | LEVE-0005 | 687.09 |

**t_belief_interval_at_confidence_level_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LEVE-0001 | LEVE-0001 | LEVE-0002 | Dimension Kind 01 |
| LEVE-0002 | LEVE-0001 | LEVE-0008 | Encoding 02 |
| LEVE-0003 | LEVE-0001 | LEVE-0009 | audit excerpt |
| LEVE-0004 | LEVE-0001 | LEVE-0010 | en |
| LEVE-0005 | LEVE-0001 | LEVE-0003 | manual |
| LEVE-0006 | LEVE-0001 | LEVE-0006 | ms |
| LEVE-0007 | LEVE-0002 | LEVE-0002 | Dimension Kind 07 |
| LEVE-0008 | LEVE-0002 | LEVE-0008 | Encoding 08 |

The requirement-tracing subsystem demonstrates how identifiers, roles, subjects, and targets combine to express directed relationships between compliance artifacts. The `t_requirement_traces_to` table enumerates requirements—"Network Segmentation Rule," "Access Control Mandate," "Privacy Compliance Requirement"—while `t_requirement_traces_to_traces_to` lists the artifacts they reference, such as the "HIPAA Security Rule," "Risk Assessment Matrix," "Compliance Audit Checklist," and "ISO 27001 Control." The join table `t_requirement_traces_to__traces_to` materializes the relationship with three columns: requirement_id (the subject), traces_to_id (the target), and role (the nature of the linkage). A single requirement, Privacy Compliance Requirement (TRAC-0004), may trace to the same target (TRAC-0004) under different roles—owner in one instance, reviewer in another—demonstrating that the role column captures the semantic direction and responsibility of the link, not merely its existence. Confidence levels from belief intervals, such as TRAC-0002 and TRAC-0007, serve as the bridge between these two subsystems, allowing a belief interval's calibration drift reading or sensor telemetry snapshot to be evaluated against the specific compliance requirements it traces to.

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