---
chapter_id: ch_live_entity_match_link_080f41
topic_id: 60
family: 07_long_tail
cited_terms: ['entity_match_link', 'lineage_edge_within_dataset_only', 'survey_response_record']
model: engine-refine
---

Entity matching establishes provenance relationships between operational artifacts and the standards against which they are evaluated, with each linkage identified by a stable key such as LINK-0001 through LINK-0004. A single match might associate a lab instrument bearing serial number SN-4491 with reference standard RS-004, or bind a sample batch SB-2214 to validation suite VS-605; governance policy DOC-992, by contrast, maps to standard template ST-099. These relationships are not binary assertions but structured associations enriched by attributes whose names—confidence, dimension_kind, method, recorded_at—convey the nature of the metadata being attached, and whose declared types (xsd:decimal, xsd:string, xsd:dateTime) enforce schema discipline across heterogeneous data sources. The attribute values themselves are stored in type-specialized tables: decimal measures such as 0.249, 448.20, and 699.43 coexist with temporal stamps like 2025-02-02T03:38:54 and 2024-07-01T04:17:43, while categorical descriptors such as Dimension Kind 01 and Encoding 02, alongside free-text annotations like audit excerpt, populate the varchar store. This separation of concerns by data type ensures that downstream consumers can resolve attribute values without type coercion or ambiguity.

**t_entity_match_link**

| id | entity | matches_entity |
| --- | --- | --- |
| LINK-0001 | Lab instrument SN-4491 | Reference standard RS-004 |
| LINK-0002 | Sample batch SB-2214 | Validation suite VS-605 |
| LINK-0003 | Dataset v4.2.1 | Validation suite VS-605 |
| LINK-0004 | Governance policy DOC-992 | Standard template ST-099 |
| LINK-0005 | Governance policy DOC-992 | Matched registry MR-881 |
| LINK-0006 | Provenance log PR-7741 | Validation suite VS-605 |

**t_entity_match_link_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LINK-0001 | confidence | xsd:decimal |
| LINK-0002 | dimension_kind | xsd:string |
| LINK-0003 | method | xsd:string |
| LINK-0004 | recorded_at | xsd:dateTime |
| LINK-0005 | uncertainty | xsd:decimal |
| LINK-0006 | unit | xsd:string |
| LINK-0007 | value | xsd:decimal |
| LINK-0008 | encoding | xsd:string |

**t_entity_match_link_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0004 | 2025-02-02T03:38:54 |
| LINK-0002 | LINK-0002 | LINK-0004 | 2024-07-01T04:17:43 |
| LINK-0003 | LINK-0003 | LINK-0004 | 2023-10-04T15:34:58 |
| LINK-0004 | LINK-0004 | LINK-0004 | 2025-05-20T07:58:08 |
| LINK-0005 | LINK-0005 | LINK-0004 | 2023-04-10T04:16:09 |
| LINK-0006 | LINK-0006 | LINK-0004 | 2023-09-16T03:40:04 |

**t_entity_match_link_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0001 | 0.249 |
| LINK-0002 | LINK-0001 | LINK-0005 | 448.20 |
| LINK-0003 | LINK-0001 | LINK-0007 | 699.43 |
| LINK-0004 | LINK-0002 | LINK-0001 | 0.772 |
| LINK-0005 | LINK-0002 | LINK-0005 | 156.67 |
| LINK-0006 | LINK-0002 | LINK-0007 | 439.51 |
| LINK-0007 | LINK-0003 | LINK-0001 | 0.389 |
| LINK-0008 | LINK-0003 | LINK-0005 | 388.52 |

**t_entity_match_link_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0002 | Dimension Kind 01 |
| LINK-0002 | LINK-0001 | LINK-0008 | Encoding 02 |
| LINK-0003 | LINK-0001 | LINK-0009 | audit excerpt |
| LINK-0004 | LINK-0001 | LINK-0010 | es |
| LINK-0005 | LINK-0001 | LINK-0003 | manual |
| LINK-0006 | LINK-0001 | LINK-0006 | count |
| LINK-0007 | LINK-0002 | LINK-0002 | Dimension Kind 07 |
| LINK-0008 | LINK-0002 | LINK-0008 | Encoding 08 |

Confidence and uncertainty operate as complementary quality signals within the lineage fabric, quantifying the reliability of data transformations and the magnitude of residual error. In the lineage facts, confidence scores range from a low of 0.071—suggesting a tenuous or poorly traced derivation—to a high of 0.779, indicating strong evidentiary support for the transformation in question. The corresponding uncertainty values, expressed as absolute magnitudes such as 612.22, 133.03, 76.69, and 708.23, provide the counterweight: a lineage record with confidence 0.071 carries uncertainty of 133.03 against a measured value of 832.18, whereas the record with confidence 0.779 exhibits uncertainty of 708.23 against value 259.55, revealing that high confidence does not necessarily imply small absolute error but rather a well-characterized error distribution. These paired metrics enable downstream systems to weight lineage paths probabilistically, flagging transformations whose uncertainty exceeds operational thresholds for manual review.

Survey response records capture structured feedback from researchers and reviewers, each record identified by keys such as RECO-0001 through RECO-0004 and carrying a survey_response_record label that identifies the originating instrument—Peer-Review-Submission, Q3-2023-Feedback, or Safety-Compliance-Check. Each response captures a specific researcher profile attribute, whether Clearance-Level, Domain-Expertise-Code, or Protocol-Approval-Ref, thereby linking subjective assessments to the institutional metadata that governs access and authorization. The encoding field (ascii, unicode, utf8) and language field (es, de, en) document the character encoding and linguistic context of the response, ensuring that multilingual submissions are preserved and routed to appropriate reviewers. The repetition of Q3-2023-Feedback across multiple records (RECO-0002 and RECO-0004) with distinct languages (de and en) and profile attributes (Domain-Expertise-Code and Protocol-Approval-Ref) illustrates how a single survey instrument can yield heterogeneous responses that are differentiated by respondent context rather than by form structure.

**t_survey_response_record**

| id | survey_response_record | captures_profile_attribute | encoding | language |
| --- | --- | --- | --- | --- |
| RECO-0001 | Peer-Review-Submission | Clearance-Level | ascii | es |
| RECO-0002 | Q3-2023-Feedback | Domain-Expertise-Code | unicode | de |
| RECO-0003 | Safety-Compliance-Check | Protocol-Approval-Ref | ascii | es |
| RECO-0004 | Q3-2023-Feedback | Protocol-Approval-Ref | utf8 | en |
| RECO-0005 | Incident-Report-Form | Funding-Source-ID | ascii | es |
| RECO-0006 | Field-Obs-Log | Institutional-Affiliation | unicode | de |
| RECO-0007 | Dev-Team-Performance | Protocol-Approval-Ref | ascii | ja |

Within-dataset dimensions provide the categorical scaffolding against which lineage facts are organized, with each dimension identified by a key (ONLY-0001 through ONLY-0004) and labeled through within_dataset_label fields such as Within Dataset Label 01, while the within_dataset_category column (Within Dataset Category 01 through 04) groups related labels into higher-level taxonomies. These categories serve as the primary join key between the dimensional and fact tables, enabling aggregation of confidence and uncertainty metrics across coherent data domains. The misc column in the lineage facts, holding values like 903.86, 862.00, and 259.55, represents residual or auxiliary measurements that do not fit the primary confidence-uncertainty-value triad but may be relevant for audit or reconciliation purposes. Together, the attribute typing system, the confidence-uncertainty pairing, and the categorical dimensioning form a coherent framework for tracking data quality across the full lifecycle from raw instrument output through governance compliance to researcher feedback.

**fact_lineage**

| id | within_dataset_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| ONLY-0001 | ONLY-0003 | 0.645 | 612.22 | 903.86 |
| ONLY-0002 | ONLY-0004 | 0.071 | 133.03 | 832.18 |
| ONLY-0003 | ONLY-0005 | 0.404 | 76.69 | 862.00 |
| ONLY-0004 | ONLY-0006 | 0.779 | 708.23 | 259.55 |
| ONLY-0005 | ONLY-0001 | 0.376 | 801.99 | 986.33 |
| ONLY-0006 | ONLY-0004 | 0.744 | 956.79 | 34.40 |

**dim_within_dataset**

| id | within_dataset_label | within_dataset_category |
| --- | --- | --- |
| ONLY-0001 | Within Dataset Label 01 | Within Dataset Category 01 |
| ONLY-0002 | Within Dataset Label 02 | Within Dataset Category 02 |
| ONLY-0003 | Within Dataset Label 03 | Within Dataset Category 03 |
| ONLY-0004 | Within Dataset Label 04 | Within Dataset Category 04 |
| ONLY-0005 | Within Dataset Label 05 | Within Dataset Category 05 |
| ONLY-0006 | Within Dataset Label 06 | Within Dataset Category 06 |