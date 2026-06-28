---
chapter_id: ch_live_mass_function_subclass_0f107f
topic_id: 140
family: 06_belief_structure
cited_terms: ['mass_function_subclass', 'institutional_vision_statement', 'measurement_aggregated_into']
model: engine-refine
---

Within belief-function frameworks and institutional governance registries alike, identifiers serve as the immutable anchors that bind heterogeneous evidence to coherent analytical units. Mass-function subclasses such as FUNC-0001 through FUNC-0004 carry semantic payloads—fault_detection_assignment, signal_quality_mass, network_topology_confidence—that quantify degrees of belief across distinct frames of discernment including resource_utilization_buckets, signal_strength_levels, and protocol_compliance_status. These mappings are not arbitrary; they are mediated through a join structure that assigns governance roles—reviewer, contributor, owner—to each mass-function–frame pairing, thereby embedding accountability directly into the evidentiary graph. A single mass function may participate in multiple frame assignments, and the role attribute disambiguates whether FUNC-0007 acts as reviewer in one context and contributor in another, ensuring that provenance is traceable at the granularity of individual belief assignments.

**t_mass_function_subclass**

| id | mass |
| --- | --- |
| FUNC-0001 | fault_detection_assignment |
| FUNC-0002 | signal_quality_mass |
| FUNC-0003 | network_topology_confidence |
| FUNC-0004 | network_topology_confidence |
| FUNC-0005 | signal_quality_mass |
| FUNC-0006 | network_topology_confidence |
| FUNC-0007 | signal_quality_mass |

**t_mass_function_subclass_over_frame_of_discernment**

| id | over_frame_of_discernment |
| --- | --- |
| FUNC-0001 | resource_utilization_buckets |
| FUNC-0002 | signal_strength_levels |
| FUNC-0003 | signal_strength_levels |
| FUNC-0004 | protocol_compliance_status |
| FUNC-0005 | incident_severity_levels |
| FUNC-0006 | protocol_compliance_status |

**t_mass_function_subclass__over_frame_of_discernment**

| id | mass_id | over_frame_of_discernment_id | role |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0006 | FUNC-0002 | reviewer |
| FUNC-0002 | FUNC-0007 | FUNC-0001 | reviewer |
| FUNC-0003 | FUNC-0007 | FUNC-0001 | contributor |
| FUNC-0004 | FUNC-0004 | FUNC-0005 | owner |
| FUNC-0005 | FUNC-0003 | FUNC-0005 | owner |
| FUNC-0006 | FUNC-0003 | FUNC-0002 | reviewer |
| FUNC-0007 | FUNC-0005 | FUNC-0001 | observer |
| FUNC-0008 | FUNC-0006 | FUNC-0001 | contributor |

**t_institutional_vision_statement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| STAT-0001 | effective_date | xsd:date |
| STAT-0002 | enforcement | xsd:string |
| STAT-0003 | mandatory | xsd:boolean |
| STAT-0004 | priority | xsd:integer |
| STAT-0005 | review_cycle_days | xsd:integer |
| STAT-0006 | scope | xsd:string |
| STAT-0007 | encoding | xsd:string |
| STAT-0008 | label_text | xsd:string |

**t_institutional_vision_statement_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0003 | true |
| STAT-0002 | STAT-0002 | STAT-0003 | true |
| STAT-0003 | STAT-0003 | STAT-0003 | false |
| STAT-0004 | STAT-0004 | STAT-0003 | false |
| STAT-0005 | STAT-0005 | STAT-0003 | true |
| STAT-0006 | STAT-0006 | STAT-0003 | false |
| STAT-0007 | STAT-0007 | STAT-0003 | false |

**t_institutional_vision_statement_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0001 | 2023-09-09 |
| STAT-0002 | STAT-0002 | STAT-0001 | 2023-09-20 |
| STAT-0003 | STAT-0003 | STAT-0001 | 2023-06-25 |
| STAT-0004 | STAT-0004 | STAT-0001 | 2023-10-19 |
| STAT-0005 | STAT-0005 | STAT-0001 | 2024-08-06 |
| STAT-0006 | STAT-0006 | STAT-0001 | 2024-01-23 |
| STAT-0007 | STAT-0007 | STAT-0001 | 2025-03-30 |

**t_institutional_vision_statement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0004 | 5 |
| STAT-0002 | STAT-0001 | STAT-0005 | 753 |
| STAT-0003 | STAT-0002 | STAT-0004 | 2 |
| STAT-0004 | STAT-0002 | STAT-0005 | 439 |
| STAT-0005 | STAT-0003 | STAT-0004 | 5 |
| STAT-0006 | STAT-0003 | STAT-0005 | 277 |
| STAT-0007 | STAT-0004 | STAT-0004 | 5 |
| STAT-0008 | STAT-0004 | STAT-0005 | 639 |

**t_institutional_vision_statement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| STAT-0001 | STAT-0001 | STAT-0007 | Encoding 01 |
| STAT-0002 | STAT-0001 | STAT-0002 | Enforcement 02 |
| STAT-0003 | STAT-0001 | STAT-0008 | nightly summary |
| STAT-0004 | STAT-0001 | STAT-0009 | ja |
| STAT-0005 | STAT-0001 | STAT-0006 | Scope 05 |
| STAT-0006 | STAT-0002 | STAT-0007 | Encoding 06 |
| STAT-0007 | STAT-0002 | STAT-0002 | Enforcement 07 |
| STAT-0008 | STAT-0002 | STAT-0008 | nightly summary |

Institutional vision statements operate under an analogous identification discipline, where entries such as STAT-0001 through STAT-0004 encode strategic commitments like Community Impact Vision, Future-First Learning, Global Excellence Framework, and Campus 2030 Blueprint. Each vision statement is explicitly scoped to an educational goal—Student Retention Improvement, Faculty Development Program, Curriculum Modernization, Alumni Engagement Metric—and directed at a defined stakeholder group including Research Faculty, Accrediting Bodies, Alumni Network, and Local Community. This tripartite linkage (vision, goal, stakeholder) transforms abstract policy declarations into auditable governance artifacts, enabling downstream systems to resolve which strategic objective a given statement advances and for whom.

**t_institutional_vision_statement**

| id | institutional_vision_statement | targets_goal | addresses_stakeholder |
| --- | --- | --- | --- |
| STAT-0001 | Community Impact Vision | Student Retention Improvement | Research Faculty |
| STAT-0002 | Future-First Learning | Faculty Development Program | Accrediting Bodies |
| STAT-0003 | Global Excellence Framework | Curriculum Modernization | Alumni Network |
| STAT-0004 | Campus 2030 Blueprint | Alumni Engagement Metric | Local Community |
| STAT-0005 | Open Access Roadmap | Research Output Expansion | Undergraduate Cohort |
| STAT-0006 | Global Excellence Framework | Curriculum Modernization | Administrative Staff |
| STAT-0007 | Next-Gen Research Mandate | Inclusive Access Expansion | K-12 Pipeline |

The attribute layer extends this structure through a typed, entity-attribute-value pattern that separates schema from instance data. Attributes such as effective_date, enforcement, mandatory, and priority are declared with their corresponding XML Schema types—xsd:date, xsd:string, xsd:boolean, xsd:integer—allowing the same entity to carry heterogeneous metadata without schema drift. Boolean attributes resolve to true or false across entities STAT-0001 through STAT-0004, date attributes anchor to values like 2023-09-09 and 2023-10-19, integer attributes encode magnitudes such as 753 and 439, and varchar attributes capture free-form strings including Encoding 01, Enforcement 02, nightly summary, and ja. This normalization ensures that every attribute value is type-constrained at the schema level while remaining decoupled from the entity definition, a design that supports both validation and extensibility.

Measurement aggregation introduces a second dimension of structural organization, where fact measurements are grouped under aggregated_into keys that reference a dimension table of labels and categories. Each measurement carries a confidence value—0.496, 0.945, 0.506, 0.307—paired with an uncertainty magnitude such as 306.26, 279.24, 120.70, or 364.07, and a raw value ranging from 64.10 to 878.99. The aggregated_into dimension provides categorical context (Aggregated Into Category 01 through 04) and human-readable labels (Aggregated Into Label 01 through 04), enabling roll-up queries that respect both the semantic grouping and the numerical precision of the underlying evidence. Confidence and uncertainty together form a dual-axis quality signal: high confidence (0.945) coincides with moderate uncertainty (279.24) and a substantial measured value (660.64), while lower confidence (0.307) accompanies the highest uncertainty (364.07) and a comparatively small value (64.10), reflecting the expected inverse relationship between belief strength and measurement dispersion.

**fact_measurement**

| id | aggregated_into_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| INTO-0001 | INTO-0005 | 0.496 | 306.26 | 353.34 |
| INTO-0002 | INTO-0005 | 0.945 | 279.24 | 660.64 |
| INTO-0003 | INTO-0004 | 0.506 | 120.70 | 878.99 |
| INTO-0004 | INTO-0006 | 0.307 | 364.07 | 64.10 |
| INTO-0005 | INTO-0006 | 0.923 | 642.96 | 897.70 |

**dim_aggregated_into**

| id | aggregated_into_label | aggregated_into_category |
| --- | --- | --- |
| INTO-0001 | Aggregated Into Label 01 | Aggregated Into Category 01 |
| INTO-0002 | Aggregated Into Label 02 | Aggregated Into Category 02 |
| INTO-0003 | Aggregated Into Label 03 | Aggregated Into Category 03 |
| INTO-0004 | Aggregated Into Label 04 | Aggregated Into Category 04 |
| INTO-0005 | Aggregated Into Label 05 | Aggregated Into Category 05 |
| INTO-0006 | Aggregated Into Label 06 | Aggregated Into Category 06 |