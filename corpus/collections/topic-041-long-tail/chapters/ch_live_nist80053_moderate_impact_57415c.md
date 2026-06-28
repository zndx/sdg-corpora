---
chapter_id: ch_live_nist80053_moderate_impact_57415c
topic_id: 41
family: 07_long_tail
cited_terms: ['nist80053_moderate_impact', 'breaking_change_subclass', 'entomological_surveillance_record']
model: engine-refine
---

Identifiers serve as the immutable anchors of every record across compliance registries, change catalogs, and analytical fact tables, each assigned a stable code such as IMPA-0001 through IMPA-0004 for NIST impact classifications, CHAN-0001 through CHAN-0004 for breaking-change subclasses, and RECO-0001 through RECO-0004 for entomological observation records. An entity denotes the concrete object to which attributes are bound — in the breaking-change domain, entity references such as CHAN-0001 and CHAN-0002 tie typed values back to specific change events like Telemetry schema evolution or Provenance graph migration, while the same entity column in value tables ensures that decimal measurements, datetime stamps, and free-text annotations are resolved to the correct parent record. This entity-attribute pairing forms the backbone of a normalized attribute store, where the attr column (attr_name) enumerates property names such as confidence, dimension_kind, method, and recorded_at, each governed by an attr_type that constrains the permissible value domain to xsd:decimal, xsd:string, or xsd:dateTime.

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

**t_breaking_change_subclass**

| id | breaking | breaking_change_for |
| --- | --- | --- |
| CHAN-0001 | Telemetry schema evolution | device telemetry collector |
| CHAN-0002 | Telemetry schema evolution | inventory management API |
| CHAN-0003 | Provenance graph migration | legacy mobile app |
| CHAN-0004 | OAuth2 token rotation | real-time event stream |
| CHAN-0005 | Schema field removal | internal microservice mesh |
| CHAN-0006 | Sensor sampling rate drop | customer dashboard frontend |
| CHAN-0007 | Provenance graph migration | compliance audit logger |
| CHAN-0008 | TLS 1.3 enforcement | third-party analytics SDK |

**t_breaking_change_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CHAN-0001 | confidence | xsd:decimal |
| CHAN-0002 | dimension_kind | xsd:string |
| CHAN-0003 | method | xsd:string |
| CHAN-0004 | recorded_at | xsd:dateTime |
| CHAN-0005 | uncertainty | xsd:decimal |
| CHAN-0006 | unit | xsd:string |
| CHAN-0007 | value | xsd:decimal |
| CHAN-0008 | encoding | xsd:string |

The typed value tables — t_breaking_change_subclass_val_decimal, t_breaking_change_subclass_val_datetime, and t_breaking_change_subclass_val_varchar — materialize this attribute model by storing heterogeneous data in separate tables keyed by a composite of identifier, entity_id, and attr_id, with the value column (misc) holding the actual datum: a confidence score of 0.203 or 0.645, a timestamp such as 2023-07-26T14:07:49, or a categorical label like Dimension Kind 01 and calibration record. This separation by type avoids null proliferation and preserves schema integrity while allowing any breaking-change entity to carry an arbitrary set of named, typed properties. The attr_type column thus functions not merely as a declaration but as a runtime enforcement mechanism, ensuring that the decimal column receives only numeric literals, the datetime column only ISO-8601 strings, and the varchar column only character data.

**t_breaking_change_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0004 | 2023-07-26T14:07:49 |
| CHAN-0002 | CHAN-0002 | CHAN-0004 | 2025-01-03T20:08:42 |
| CHAN-0003 | CHAN-0003 | CHAN-0004 | 2024-04-10T03:15:13 |
| CHAN-0004 | CHAN-0004 | CHAN-0004 | 2023-07-21T06:41:40 |
| CHAN-0005 | CHAN-0005 | CHAN-0004 | 2023-07-01T02:58:50 |
| CHAN-0006 | CHAN-0006 | CHAN-0004 | 2024-07-07T11:26:39 |
| CHAN-0007 | CHAN-0007 | CHAN-0004 | 2024-07-12T18:30:29 |
| CHAN-0008 | CHAN-0008 | CHAN-0004 | 2024-11-14T05:00:21 |

**t_breaking_change_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0001 | 0.203 |
| CHAN-0002 | CHAN-0001 | CHAN-0005 | 700.59 |
| CHAN-0003 | CHAN-0001 | CHAN-0007 | 64.61 |
| CHAN-0004 | CHAN-0002 | CHAN-0001 | 0.645 |
| CHAN-0005 | CHAN-0002 | CHAN-0005 | 584.78 |
| CHAN-0006 | CHAN-0002 | CHAN-0007 | 672.81 |
| CHAN-0007 | CHAN-0003 | CHAN-0001 | 0.769 |
| CHAN-0008 | CHAN-0003 | CHAN-0005 | 136.48 |

**t_breaking_change_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0002 | Dimension Kind 01 |
| CHAN-0002 | CHAN-0001 | CHAN-0008 | Encoding 02 |
| CHAN-0003 | CHAN-0001 | CHAN-0009 | calibration record |
| CHAN-0004 | CHAN-0001 | CHAN-0010 | en |
| CHAN-0005 | CHAN-0001 | CHAN-0003 | hybrid |
| CHAN-0006 | CHAN-0001 | CHAN-0006 | deg_C |
| CHAN-0007 | CHAN-0002 | CHAN-0002 | Dimension Kind 07 |
| CHAN-0008 | CHAN-0002 | CHAN-0008 | Encoding 08 |

The fact_entomological table operates as a star-schema fact, linking each observation record to two dimensions through its realizes_key and associated_with_key columns. The realizes_key references dim_realizes, where each identifier maps to a realizes_label (misc) such as Realizes Label 01 and a realizes_category (category) such as Realizes Category 01; similarly, associated_with_key references dim_associated_with, which pairs associated_with_label with associated_with_category. The event_count column in the fact table quantifies the measure of interest — values ranging from 49 to 485 — enabling aggregation across the realized and associated-with dimensions. This dimensional decomposition separates descriptive metadata from analytical measures, allowing queries to slice observation counts by category without joining free-form labels.

**fact_entomological**

| id | realizes_key | associated_with_key | event_count |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0002 | RECO-0001 | 311 |
| RECO-0002 | RECO-0005 | RECO-0005 | 166 |
| RECO-0003 | RECO-0004 | RECO-0003 | 49 |
| RECO-0004 | RECO-0004 | RECO-0001 | 485 |
| RECO-0005 | RECO-0006 | RECO-0001 | 380 |
| RECO-0006 | RECO-0003 | RECO-0005 | 490 |
| RECO-0007 | RECO-0004 | RECO-0007 | 321 |
| RECO-0008 | RECO-0002 | RECO-0003 | 179 |

**dim_realizes**

| id | realizes_label | realizes_category |
| --- | --- | --- |
| RECO-0001 | Realizes Label 01 | Realizes Category 01 |
| RECO-0002 | Realizes Label 02 | Realizes Category 02 |
| RECO-0003 | Realizes Label 03 | Realizes Category 03 |
| RECO-0004 | Realizes Label 04 | Realizes Category 04 |
| RECO-0005 | Realizes Label 05 | Realizes Category 05 |
| RECO-0006 | Realizes Label 06 | Realizes Category 06 |

**dim_associated_with**

| id | associated_with_label | associated_with_category |
| --- | --- | --- |
| RECO-0001 | Associated With Label 01 | Associated With Category 01 |
| RECO-0002 | Associated With Label 02 | Associated With Category 02 |
| RECO-0003 | Associated With Label 03 | Associated With Category 03 |
| RECO-0004 | Associated With Label 04 | Associated With Category 04 |
| RECO-0005 | Associated With Label 05 | Associated With Category 05 |
| RECO-0006 | Associated With Label 06 | Associated With Category 06 |
| RECO-0007 | Associated With Label 07 | Associated With Category 07 |
| RECO-0008 | Associated With Label 08 | Associated With Category 08 |

Relationships between NIST impact classifications and impact levels are mediated through a junction table that assigns a role to each subject-target pairing. The subject column (nist_id) identifies the source NIST standard — IMPA-0002 appears as the subject for two distinct mappings, while IMPA-0006 and IMPA-0007 each serve as subjects in separate rows — and the target column (at_n_i_s_t_impact_level_id) identifies the destination impact level, such as IMPA-0007 or IMPA-0004. The role column, taking values of observer, contributor, or owner, qualifies the nature of the relationship: IMPA-0002 observes IMPA-0007 in two separate associations, IMPA-0006 contributes to IMPA-0001, and IMPA-0007 owns IMPA-0007. This role-based mediation allows a single subject to participate in multiple relationships with different semantic weights, supporting fine-grained governance over how standards reference and depend upon one another.

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