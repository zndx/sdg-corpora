---
chapter_id: ch_live_universal_combined_with_existential_836d6b
topic_id: 186
family: 01_foundation
cited_terms: ['universal_combined_with_existential', 'descriptive_not_retracted', 'soc2_availability_subclass']
model: engine-refine
---

In governed data architectures, identifiers serve as the immutable anchors that bind disparate operational and compliance records to their underlying business entities. Each record receives a scoped primary key—such as EXIS-0001 for an equipment linkage, RETR-0001 for a sensor calibration note, or AVAI-0001 for a SOC 3 public report—that guarantees unambiguous reference across audit trails. These identifiers do not merely label rows; they establish the referential backbone that connects concrete assets like a Lab_Centrifuge_Rotor or a Database_Backup_Volume to their contextual metadata, ensuring that every downstream query, compliance check, or incident report resolves to a single source of truth.

**t_universal_combined_with_existential**

| id | universal | related |
| --- | --- | --- |
| EXIS-0001 | Lab_Centrifuge_Rotor | Atmospheric_Moisture |
| EXIS-0002 | Supply_Chain_Shipment | Personal_Information |
| EXIS-0003 | GDPR_Consent_Record | Tissue_Sample |
| EXIS-0004 | Database_Backup_Volume | Personal_Information |
| EXIS-0005 | GDPR_Consent_Record | Serum_Glucose |
| EXIS-0006 | Spectral_Analyzer_Module | Light_Wavelength |
| EXIS-0007 | GDPR_Consent_Record | Light_Wavelength |
| EXIS-0008 | Blood_Glucose_Assay | Tissue_Sample |

Attributes (attr) define the specific dimensions of an entity that require tracking, while attr type enforces the structural and semantic rules governing how those dimensions are stored. Rather than allowing freeform text, the schema assigns strict data contracts to each property: measurement precision like confidence is bound to xsd:decimal, temporal stamps such as recorded_at use xsd:dateTime, and policy flags like mandatory are constrained to xsd:boolean. This type discipline ensures that a value of 0.736 or 273.61 is mathematically comparable, that timestamps like 2024-02-12T07:34:36 parse consistently across systems, and that boolean enforcement flags evaluate deterministically in automated compliance engines.

The misc column captures the actual instantiated values that populate these typed attribute slots, decoupling raw data from schema definitions to support flexible, multi-domain reporting. String-based attributes store operational codes like Encoding 01, procedural labels such as intake form, or localization tags like fr, while integer slots hold priority rankings or threshold counts like 378 and 753. By routing values through type-specific storage tables, the architecture prevents format collisions and enables precise filtering—for instance, isolating all records where the mandatory flag evaluates to true, or extracting decimal confidence scores below a defined anomaly threshold like 0.217.

This triad of identifier, typed attribute, and misc value operates as a unified governance mechanism across both technical operations and regulatory frameworks. A SOC 2 Type I Assessment linked to Availability Criteria carries its own attribute set—effective_date typed as xsd:date, priority as xsd:integer, and enforcement as xsd:string—allowing auditors to trace exactly when controls became active and how they were prioritized. Similarly, supply chain or laboratory records use the same pattern to attach descriptive metadata like Batch Processing Note or Anomaly Classification Code to their parent entities. The result is a normalized, queryable fabric where compliance requirements, sensor telemetry, and asset inventories share a consistent semantic layer, reducing reconciliation overhead and strengthening audit readiness.

**t_descriptive_not_retracted**

| id | descriptive | descriptive_2 |
| --- | --- | --- |
| RETR-0001 | Sensor Drift Note | Metadata Extension Record |
| RETR-0002 | Anomaly Flag Sheet | Batch Processing Note |
| RETR-0003 | Sensor Drift Note | Calibration Reference Sheet |
| RETR-0004 | Metadata Index Card | Anomaly Classification Code |
| RETR-0005 | Data Quality Memo | Data Quality Metric Card |
| RETR-0006 | Observation Summary | Anomaly Classification Code |

**t_descriptive_not_retracted_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RETR-0001 | confidence | xsd:decimal |
| RETR-0002 | dimension_kind | xsd:string |
| RETR-0003 | method | xsd:string |
| RETR-0004 | recorded_at | xsd:dateTime |
| RETR-0005 | uncertainty | xsd:decimal |
| RETR-0006 | unit | xsd:string |
| RETR-0007 | value | xsd:decimal |
| RETR-0008 | encoding | xsd:string |

**t_descriptive_not_retracted_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0004 | 2024-02-12T07:34:36 |
| RETR-0002 | RETR-0002 | RETR-0004 | 2024-08-04T13:26:29 |
| RETR-0003 | RETR-0003 | RETR-0004 | 2024-08-02T08:30:25 |
| RETR-0004 | RETR-0004 | RETR-0004 | 2025-01-21T18:04:20 |
| RETR-0005 | RETR-0005 | RETR-0004 | 2024-03-11T23:18:32 |
| RETR-0006 | RETR-0006 | RETR-0004 | 2024-12-14T04:10:36 |

**t_descriptive_not_retracted_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0001 | 0.736 |
| RETR-0002 | RETR-0001 | RETR-0005 | 273.61 |
| RETR-0003 | RETR-0001 | RETR-0007 | 449.86 |
| RETR-0004 | RETR-0002 | RETR-0001 | 0.217 |
| RETR-0005 | RETR-0002 | RETR-0005 | 724.88 |
| RETR-0006 | RETR-0002 | RETR-0007 | 500.73 |
| RETR-0007 | RETR-0003 | RETR-0001 | 0.920 |
| RETR-0008 | RETR-0003 | RETR-0005 | 966.69 |

**t_descriptive_not_retracted_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0002 | Dimension Kind 01 |
| RETR-0002 | RETR-0001 | RETR-0008 | Encoding 02 |
| RETR-0003 | RETR-0001 | RETR-0009 | intake form |
| RETR-0004 | RETR-0001 | RETR-0010 | es |
| RETR-0005 | RETR-0001 | RETR-0003 | manual |
| RETR-0006 | RETR-0001 | RETR-0006 | ratio |
| RETR-0007 | RETR-0002 | RETR-0002 | Dimension Kind 07 |
| RETR-0008 | RETR-0002 | RETR-0008 | Encoding 08 |

**t_soc2_availability_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| AVAI-0001 | SOC 3 Public Report | Financial Controls |
| AVAI-0002 | SOC 2 Privacy Assessment | Financial Controls |
| AVAI-0003 | SOC 2 Type I Assessment | Availability Criteria |
| AVAI-0004 | SOC 1 Financial Audit | Network Infrastructure |
| AVAI-0005 | SOC 2 Type I Assessment | Security Criteria |
| AVAI-0006 | SOC 1 Type I Report | Confidentiality Criteria |
| AVAI-0007 | SOC 2 Privacy Assessment | Privacy Criteria |

**t_soc2_availability_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AVAI-0001 | effective_date | xsd:date |
| AVAI-0002 | enforcement | xsd:string |
| AVAI-0003 | mandatory | xsd:boolean |
| AVAI-0004 | priority | xsd:integer |
| AVAI-0005 | review_cycle_days | xsd:integer |
| AVAI-0006 | scope | xsd:string |
| AVAI-0007 | encoding | xsd:string |
| AVAI-0008 | label_text | xsd:string |

**t_soc2_availability_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0003 | true |
| AVAI-0002 | AVAI-0002 | AVAI-0003 | true |
| AVAI-0003 | AVAI-0003 | AVAI-0003 | false |
| AVAI-0004 | AVAI-0004 | AVAI-0003 | false |
| AVAI-0005 | AVAI-0005 | AVAI-0003 | false |
| AVAI-0006 | AVAI-0006 | AVAI-0003 | true |
| AVAI-0007 | AVAI-0007 | AVAI-0003 | false |

**t_soc2_availability_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0001 | 2024-07-01 |
| AVAI-0002 | AVAI-0002 | AVAI-0001 | 2024-03-01 |
| AVAI-0003 | AVAI-0003 | AVAI-0001 | 2023-09-25 |
| AVAI-0004 | AVAI-0004 | AVAI-0001 | 2024-01-04 |
| AVAI-0005 | AVAI-0005 | AVAI-0001 | 2023-04-30 |
| AVAI-0006 | AVAI-0006 | AVAI-0001 | 2024-05-11 |
| AVAI-0007 | AVAI-0007 | AVAI-0001 | 2023-07-31 |

**t_soc2_availability_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0004 | 5 |
| AVAI-0002 | AVAI-0001 | AVAI-0005 | 378 |
| AVAI-0003 | AVAI-0002 | AVAI-0004 | 4 |
| AVAI-0004 | AVAI-0002 | AVAI-0005 | 753 |
| AVAI-0005 | AVAI-0003 | AVAI-0004 | 1 |
| AVAI-0006 | AVAI-0003 | AVAI-0005 | 952 |
| AVAI-0007 | AVAI-0004 | AVAI-0004 | 1 |
| AVAI-0008 | AVAI-0004 | AVAI-0005 | 575 |

**t_soc2_availability_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AVAI-0001 | AVAI-0001 | AVAI-0007 | Encoding 01 |
| AVAI-0002 | AVAI-0001 | AVAI-0002 | Enforcement 02 |
| AVAI-0003 | AVAI-0001 | AVAI-0008 | nightly summary |
| AVAI-0004 | AVAI-0001 | AVAI-0009 | fr |
| AVAI-0005 | AVAI-0001 | AVAI-0006 | Scope 05 |
| AVAI-0006 | AVAI-0002 | AVAI-0007 | Encoding 06 |
| AVAI-0007 | AVAI-0002 | AVAI-0002 | Enforcement 07 |
| AVAI-0008 | AVAI-0002 | AVAI-0008 | pre-release note |