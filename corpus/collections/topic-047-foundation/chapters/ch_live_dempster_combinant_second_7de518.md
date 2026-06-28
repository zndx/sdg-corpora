---
chapter_id: ch_live_dempster_combinant_second_7de518
topic_id: 47
family: 07_long_tail
cited_terms: ['dempster_combinant_second', 'reference_within_dataset', 'subclass_to_directive_ice']
model: engine-refine
---

Identifiers serve as the immutable anchors of any structured data fabric, providing stable handles that survive the churn of underlying value changes. Within the Dempster combination registry, each entity receives a persistent key such as SECO-0001 through SECO-0004, which uniquely distinguishes instances regardless of whether the entity represents an EvidenceCombinationBeta, an AnomalyFusionEngine, a LabDataCombinerNode, or a GovernanceEvidenceModel. The secondary combinant dimension—capturing associated artifacts like SourceMetadataRegistry, GPSPositionLog, BaselineTelemetryTrace, or ThermalImagingFeed—attaches to these same identifiers, establishing a one-to-many relationship between a core entity and its supplementary metadata. A parallel structure governs dataset references, where identifiers DATA-0001 through DATA-0004 anchor entries such as PROVENANCE-MAP-V4 and SCHEMA-REF-ALPHA, each pointing to concrete targets like feature_store_metrics or model_artifact_x7 and nested within broader containers including ml_training_run, regulatory_submission, and enterprise_data_catalog. A third identifier space, ICE-0001 through ICE-0004, catalogs directive-classifications such as ProvenanceTraceRequirement, EncryptionStandard, and CalibrationInstruction, binding each to its human-facing label text—intake form, calibration record, nightly summary—and to its character encoding.

**t_dempster_combinant_second**

| id | dempster | second_combinant |
| --- | --- | --- |
| SECO-0001 | EvidenceCombinationBeta | SourceMetadataRegistry |
| SECO-0002 | AnomalyFusionEngine | GPSPositionLog |
| SECO-0003 | LabDataCombinerNode | BaselineTelemetryTrace |
| SECO-0004 | GovernanceEvidenceModel | ThermalImagingFeed |
| SECO-0005 | GovernanceEvidenceModel | ThermalImagingFeed |
| SECO-0006 | GovernanceEvidenceModel | SpectralAnalysisOutput |
| SECO-0007 | CrossDomainEvidenceRule | PressureSensorArray |

**t_dempster_combinant_second_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECO-0001 | confidence | xsd:decimal |
| SECO-0002 | dimension_kind | xsd:string |
| SECO-0003 | method | xsd:string |
| SECO-0004 | recorded_at | xsd:dateTime |
| SECO-0005 | uncertainty | xsd:decimal |
| SECO-0006 | unit | xsd:string |
| SECO-0007 | value | xsd:decimal |
| SECO-0008 | encoding | xsd:string |

**t_dempster_combinant_second_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0004 | 2024-10-02T15:13:46 |
| SECO-0002 | SECO-0002 | SECO-0004 | 2024-09-30T23:04:21 |
| SECO-0003 | SECO-0003 | SECO-0004 | 2023-05-15T03:36:40 |
| SECO-0004 | SECO-0004 | SECO-0004 | 2023-03-27T03:16:31 |
| SECO-0005 | SECO-0005 | SECO-0004 | 2024-02-17T20:31:55 |
| SECO-0006 | SECO-0006 | SECO-0004 | 2025-02-25T15:10:20 |
| SECO-0007 | SECO-0007 | SECO-0004 | 2023-11-24T02:27:20 |

**t_dempster_combinant_second_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0001 | 0.328 |
| SECO-0002 | SECO-0001 | SECO-0005 | 597.98 |
| SECO-0003 | SECO-0001 | SECO-0007 | 738.09 |
| SECO-0004 | SECO-0002 | SECO-0001 | 0.558 |
| SECO-0005 | SECO-0002 | SECO-0005 | 817.82 |
| SECO-0006 | SECO-0002 | SECO-0007 | 989.70 |
| SECO-0007 | SECO-0003 | SECO-0001 | 0.241 |
| SECO-0008 | SECO-0003 | SECO-0005 | 869.27 |

**t_dempster_combinant_second_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECO-0001 | SECO-0001 | SECO-0002 | Dimension Kind 01 |
| SECO-0002 | SECO-0001 | SECO-0008 | Encoding 02 |
| SECO-0003 | SECO-0001 | SECO-0009 | nightly summary |
| SECO-0004 | SECO-0001 | SECO-0010 | en |
| SECO-0005 | SECO-0001 | SECO-0003 | manual |
| SECO-0006 | SECO-0001 | SECO-0006 | deg_C |
| SECO-0007 | SECO-0002 | SECO-0002 | Dimension Kind 07 |
| SECO-0008 | SECO-0002 | SECO-0008 | Encoding 08 |

**t_reference_within_dataset**

| id | reference | points_to | part_of |
| --- | --- | --- | --- |
| DATA-0001 | PROVENANCE-MAP-V4 | feature_store_metrics | ml_training_run |
| DATA-0002 | SCHEMA-REF-ALPHA | production_schema | regulatory_submission |
| DATA-0003 | PROVENANCE-MAP-V4 | model_artifact_x7 | cloud_storage_bucket |
| DATA-0004 | QC-PROTOCOL-V2 | model_artifact_x7 | enterprise_data_catalog |
| DATA-0005 | DOC-2023-04A | feature_store_metrics | compliance_audit_cycle |
| DATA-0006 | DATA-DICT-PROD | compliance_register | regulatory_submission |

**t_reference_within_dataset_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | Checksum Algo 01 |
| DATA-0002 | DATA-0001 | DATA-0002 | A-01 |
| DATA-0003 | DATA-0001 | DATA-0006 | Encoding 03 |
| DATA-0004 | DATA-0001 | DATA-0003 | RFC-3339 |
| DATA-0005 | DATA-0001 | DATA-0007 | intake form |
| DATA-0006 | DATA-0001 | DATA-0008 | en |
| DATA-0007 | DATA-0001 | DATA-0005 | Namespace 07 |
| DATA-0008 | DATA-0002 | DATA-0001 | Checksum Algo 08 |

**t_subclass_to_directive_ice**

| id | directive | encoding | label_text |
| --- | --- | --- | --- |
| ICE-0001 | ProvenanceTraceRequirement | ascii | intake form |
| ICE-0002 | EncryptionStandard | ascii | calibration record |
| ICE-0003 | CalibrationInstruction | unicode | nightly summary |
| ICE-0004 | CalibrationInstruction | unicode | intake form |
| ICE-0005 | BatchIngestionRule | ascii | nightly summary |

Attributes define the dimensional space in which entities are described, and their types enforce semantic discipline at the schema level. The Dempster entities expose attributes named confidence, dimension_kind, method, and recorded_at, each declared with an XSD type—xsd:decimal, xsd:string, xsd:string, and xsd:dateTime respectively—that constrains the shape of permissible values. Reference entities carry their own attribute vocabulary: checksum_algo, code, format, and issued_date, typed as xsd:string, xsd:string, xsd:string, and xsd:date. This attribute registry is deliberately decoupled from value storage, allowing the type system to evolve independently of the data it constrains. An attribute's name communicates intent—confidence signals a numeric degree of belief, recorded_at signals a temporal stamp—while its type guarantees that downstream consumers can parse and validate without runtime introspection.

Value storage follows a type-dispatched pattern: decimal, datetime, date, and varchar columns each hold the concrete instantiations of attributes whose types they match. A confidence attribute of type xsd:decimal materializes as 0.328 or 0.558 in the decimal value table, while a dimension_kind attribute of type xsd:string appears as Dimension Kind 01 or Encoding 02 in the varchar store. Temporal attributes resolve to ISO-8601 timestamps—2024-10-02T15:13:46, 2024-09-30T23:04:21, 2023-05-15T03:36:40, 2023-03-27T03:16:31—stored in the datetime column, and date attributes such as issued_date resolve to calendar dates like 2024-10-25, 2024-06-06, 2023-04-24, and 2023-10-13 in the date column. Each value row carries an entity_id that ties it to a specific entity and an attr_id that ties it to a specific attribute definition, forming a sparse, entity-attribute-value triple that can accommodate heterogeneous attribute sets without schema migration. The entity_id and attr_id pairs are themselves unique identifiers, ensuring that every value is traceable to both its owner and its schema definition.

Encoding and label text bridge the gap between machine-parsable identifiers and human-operable interfaces. The directive-classification table assigns each ICE entity a character encoding—ascii for ProvenanceTraceRequirement and EncryptionStandard, unicode for CalibrationInstruction entries—and a label_text that renders the directive in operational language: intake form, calibration record, nightly summary. These label texts are not free-form annotations but controlled descriptors that appear in user-facing artifacts such as intake forms and calibration records, while the encoding field guarantees that the label text is rendered consistently across systems that may default to different character sets. The encoding choice is itself a data point: ascii suffices for the Latin characters present in intake form and calibration record, while unicode is reserved for directives that may require extended character sets. This separation of encoding from label text allows the same label to be re-encoded for different output channels without altering the underlying value.

The reference-within-dataset structure extends this pattern by linking entities to external artifacts and governance contexts. A reference such as PROVENANCE-MAP-V4 points to a concrete target like feature_store_metrics or model_artifact_x7 and is classified as part of a broader container—ml_training_run, regulatory_submission, cloud_storage_bucket, or enterprise_data_catalog. Its attributes include a checksum_algo value of Checksum Algo 01, a code value of A-01, a format value of RFC-3339, and an issued_date that anchors the reference in time. The points_to column establishes a directed edge from the reference to its target, while part_of establishes containment within a governance or operational scope. Together, these columns form a provenance graph: entities reference artifacts, artifacts are typed and versioned, and the entire structure is anchored by identifiers that survive across system boundaries. The attribute-value mechanism ensures that each reference carries its own metadata—checksums, codes, formats, dates—without requiring a monolithic reference table, and the type system ensures that a checksum_algo is always a string, a code is always a string, and an issued_date is always a date.

**t_reference_within_dataset_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | checksum_algo | xsd:string |
| DATA-0002 | code | xsd:string |
| DATA-0003 | format | xsd:string |
| DATA-0004 | issued_date | xsd:date |
| DATA-0005 | namespace | xsd:string |
| DATA-0006 | encoding | xsd:string |
| DATA-0007 | label_text | xsd:string |
| DATA-0008 | language | xsd:string |

**t_reference_within_dataset_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | 2024-10-25 |
| DATA-0002 | DATA-0002 | DATA-0004 | 2024-06-06 |
| DATA-0003 | DATA-0003 | DATA-0004 | 2023-04-24 |
| DATA-0004 | DATA-0004 | DATA-0004 | 2023-10-13 |
| DATA-0005 | DATA-0005 | DATA-0004 | 2023-04-15 |
| DATA-0006 | DATA-0006 | DATA-0004 | 2024-06-08 |