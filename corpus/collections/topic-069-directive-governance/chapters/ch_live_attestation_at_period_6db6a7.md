---
chapter_id: ch_live_attestation_at_period_6db6a7
topic_id: 69
family: 03_directive_governance
cited_terms: ['attestation_at_period', 'column_tag_from_annotator', 'policy_classification_tier']
model: engine-refine
---

Identifier, attribute, attribute type, entity, miscellaneous value, role, subject, and target constitute the foundational vocabulary of a normalized metadata registry, where every datum is anchored to a stable key and every relationship is expressed through typed associations. The identifier column functions as the immutable handle by which records are referenced across the entire schema: a compliance review bearing the identifier PERI-0001 is the same entity that surfaces as the subject of a reviewer relationship in the junction table, and the annotator record ANNO-0001 is simultaneously the entity that carries a confidence attribute of 0.302 and a recorded_at timestamp of 2025-01-07T23:20:10. This cross-table referential integrity ensures that a single logical object—whether it is a HIPAA Compliance Review, a Vendor Risk Assessment, or a column tagged ingestion_latency—can be queried from any angle without ambiguity.

**t_column_tag_from_annotator**

| id | column | by_annotator |
| --- | --- | --- |
| ANNO-0001 | ingestion_latency | PERI-0004 |
| ANNO-0002 | compliance_flag | PERI-0002 |
| ANNO-0003 | api_version | PERI-0001 |
| ANNO-0004 | api_version | PERI-0006 |
| ANNO-0005 | compliance_flag | PERI-0004 |
| ANNO-0006 | event_timestamp | PERI-0003 |

**t_column_tag_from_annotator_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ANNO-0001 | confidence | xsd:decimal |
| ANNO-0002 | dimension_kind | xsd:string |
| ANNO-0003 | method | xsd:string |
| ANNO-0004 | recorded_at | xsd:dateTime |
| ANNO-0005 | uncertainty | xsd:decimal |
| ANNO-0006 | unit | xsd:string |
| ANNO-0007 | value | xsd:decimal |
| ANNO-0008 | encoding | xsd:string |

**t_column_tag_from_annotator_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0004 | 2025-01-07T23:20:10 |
| ANNO-0002 | ANNO-0002 | ANNO-0004 | 2024-03-06T18:58:36 |
| ANNO-0003 | ANNO-0003 | ANNO-0004 | 2024-05-08T12:18:31 |
| ANNO-0004 | ANNO-0004 | ANNO-0004 | 2023-05-11T14:25:42 |
| ANNO-0005 | ANNO-0005 | ANNO-0004 | 2023-11-26T14:31:09 |
| ANNO-0006 | ANNO-0006 | ANNO-0004 | 2024-05-18T09:15:26 |

**t_column_tag_from_annotator_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0001 | 0.302 |
| ANNO-0002 | ANNO-0001 | ANNO-0005 | 639.96 |
| ANNO-0003 | ANNO-0001 | ANNO-0007 | 206.06 |
| ANNO-0004 | ANNO-0002 | ANNO-0001 | 0.049 |
| ANNO-0005 | ANNO-0002 | ANNO-0005 | 98.50 |
| ANNO-0006 | ANNO-0002 | ANNO-0007 | 895.36 |
| ANNO-0007 | ANNO-0003 | ANNO-0001 | 0.609 |
| ANNO-0008 | ANNO-0003 | ANNO-0005 | 158.17 |

**t_column_tag_from_annotator_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ANNO-0001 | ANNO-0001 | ANNO-0002 | Dimension Kind 01 |
| ANNO-0002 | ANNO-0001 | ANNO-0008 | Encoding 02 |
| ANNO-0003 | ANNO-0001 | ANNO-0009 | nightly summary |
| ANNO-0004 | ANNO-0001 | ANNO-0010 | en |
| ANNO-0005 | ANNO-0001 | ANNO-0003 | hybrid |
| ANNO-0006 | ANNO-0001 | ANNO-0006 | kg |
| ANNO-0007 | ANNO-0002 | ANNO-0002 | Dimension Kind 07 |
| ANNO-0008 | ANNO-0002 | ANNO-0008 | Encoding 08 |

The attribute concept, captured in the attr_name column, represents the named property of an entity, while attr_type constrains the domain of permissible values through an XML Schema Definition namespace. An attribute named confidence carries the type xsd:decimal and therefore resides in the decimal value store, where entries such as 0.302 and 0.049 appear alongside larger magnitudes like 639.96 and 206.06. By contrast, an attribute called dimension_kind is typed xsd:string and its values—Dimension Kind 01, Encoding 02—live in the varchar value table, as do the locale indicator en and the descriptive string nightly summary. The attribute recorded_at, typed xsd:dateTime, is stored in the dedicated datetime value table with entries such as 2024-03-06T18:58:36 and 2023-05-11T14:25:42. This type-dispatched value storage pattern allows the registry to accommodate heterogeneous data without sacrificing schema discipline.

The entity column in each value table serves as the foreign key that binds a specific attribute value back to its owner record. An entity_id of ANNO-0001 in the decimal value table points to the annotator whose column annotation targets ingestion_latency, while the same entity_id in the varchar table associates the values Dimension Kind 01 and Encoding 02 with that identical annotator record. This design permits a single entity to carry multiple attributes of different types, each stored in its own value table, and retrieved through a join on entity_id and attr_id. The attr_id column in the value tables references the primary key of the attribute definition table, completing the chain from typed property to concrete value.

Subject and target columns in the junction tables encode binary relationships between two registered entities, while the role column qualifies the nature of that relationship. In the attestation-to-period association, the subject PERI-0001 (HIPAA Compliance Review) is linked to the target PERI-0004 (Q2 2025 Window) through a reviewer role, whereas the subject PERI-0001 also appears in a separate row where it plays the role of observer against the target PERI-0001 (Q1 2025 Cycle). The same structural pattern governs the policy-to-tier associations: the subject TIER-0002 (Financial SEC Reporting Rule) assumes the role of owner when related to the target TIER-0002 (Restricted Access), and the role of observer when related to the target TIER-0003 (Level 2 Sensitive). This triad of subject, target, and role generalizes across domains—attestations, policy classifications, and annotator assignments—into a single relationship model.

**t_attestation_at_period**

| id | attestation |
| --- | --- |
| PERI-0001 | HIPAA Compliance Review |
| PERI-0002 | Vendor Risk Assessment |
| PERI-0003 | Quarterly Internal Audit |
| PERI-0004 | Data Lineage Review |
| PERI-0005 | SOC2 Type II Audit |
| PERI-0006 | Quarterly Internal Audit |

**t_attestation_at_period_at_attestation_period**

| id | at_attestation_period |
| --- | --- |
| PERI-0001 | Q1 2025 Cycle |
| PERI-0002 | Q1 2025 Cycle |
| PERI-0003 | Q4 2023 Review |
| PERI-0004 | Q2 2025 Window |
| PERI-0005 | Q3 2024 Period |
| PERI-0006 | Q2 2024 Window |

**t_attestation_at_period__at_attestation_period**

| id | attestation_id | at_attestation_period_id | role |
| --- | --- | --- | --- |
| PERI-0001 | PERI-0002 | PERI-0004 | reviewer |
| PERI-0002 | PERI-0001 | PERI-0002 | observer |
| PERI-0003 | PERI-0001 | PERI-0001 | observer |
| PERI-0004 | PERI-0003 | PERI-0002 | reviewer |
| PERI-0005 | PERI-0005 | PERI-0004 | contributor |
| PERI-0006 | PERI-0001 | PERI-0004 | observer |
| PERI-0007 | PERI-0003 | PERI-0002 | observer |
| PERI-0008 | PERI-0003 | PERI-0005 | owner |

**t_policy_classification_tier**

| id | policy |
| --- | --- |
| TIER-0001 | Medical Privacy Directive |
| TIER-0002 | Financial SEC Reporting Rule |
| TIER-0003 | Environmental EPA Emissions Standard |
| TIER-0004 | Medical Privacy Directive |
| TIER-0005 | Open Source License Policy |
| TIER-0006 | National Cybersecurity Strategy |

**t_policy_classification_tier_at_classification_tier**

| id | at_classification_tier |
| --- | --- |
| TIER-0001 | Tier 3 Critical |
| TIER-0002 | Restricted Access |
| TIER-0003 | Level 2 Sensitive |
| TIER-0004 | Restricted Access |
| TIER-0005 | Restricted Access |
| TIER-0006 | Restricted Access |
| TIER-0007 | Level 4 Sensitive |

**t_policy_classification_tier__at_classification_tier**

| id | policy_id | at_classification_tier_id | role |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0002 | TIER-0002 | owner |
| TIER-0002 | TIER-0002 | TIER-0003 | observer |
| TIER-0003 | TIER-0006 | TIER-0004 | contributor |
| TIER-0004 | TIER-0004 | TIER-0005 | reviewer |
| TIER-0005 | TIER-0001 | TIER-0003 | observer |
| TIER-0006 | TIER-0006 | TIER-0003 | owner |
| TIER-0007 | TIER-0004 | TIER-0002 | owner |
| TIER-0008 | TIER-0005 | TIER-0001 | owner |

The misc column, as the label for the value field in each type-specific value table, is the terminal node of the metadata chain: it holds the actual data that users query, whether that data is a decimal measurement, a human-readable string, or an ISO 8601 timestamp. The separation of value storage by type is not merely an implementation detail; it enforces type safety at query time and allows the registry to scale its attribute vocabulary without altering the value tables. An annotator identified by PERI-0001 can annotate the column api_version with a method attribute of type xsd:string, while another annotator identified by PERI-0004 annotates ingestion_latency with a confidence attribute of type xsd:decimal, and both annotations coexist in the same registry without conflict. The identifier, attribute, type, entity, value, role, subject, and target together form a self-describing metadata fabric that supports compliance tracking, data lineage, and policy classification within a single coherent model.