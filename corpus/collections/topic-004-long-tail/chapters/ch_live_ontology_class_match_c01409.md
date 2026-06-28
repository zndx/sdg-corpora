---
chapter_id: ch_live_ontology_class_match_c01409
topic_id: 4
family: 07_long_tail
cited_terms: ['ontology_class_match', 'requirement_traces_to', 'column_tag_from_annotator']
model: engine-refine
---

Ontology matching in a compliance context begins with the concept of a match entity—a discrete assertion that a data element corresponds to a known ontology class. Each match carries an identifier such as MATC-0001 or MATC-0003, which serves as the stable reference point for downstream queries and audits. The match itself is anchored to a specific ontology class through a foreign-key link, and that class is further characterized by a human-readable label and a categorical classification. For instance, a match might resolve to an ontology class labeled "Matches Ontology Class Label 01" within category "Matches Ontology Class Category 01," while another match with identifier MATC-0002 points to a different class in category "Matches Ontology Class Category 02." This categorical dimension enables grouping and filtering of matches by their semantic domain, which is essential when compliance teams need to assess coverage across distinct regulatory areas.

**dim_matches_ontology_class**

| id | matches_ontology_class_label | matches_ontology_class_category |
| --- | --- | --- |
| MATC-0001 | Matches Ontology Class Label 01 | Matches Ontology Class Category 01 |
| MATC-0002 | Matches Ontology Class Label 02 | Matches Ontology Class Category 02 |
| MATC-0003 | Matches Ontology Class Label 03 | Matches Ontology Class Category 03 |
| MATC-0004 | Matches Ontology Class Label 04 | Matches Ontology Class Category 04 |
| MATC-0005 | Matches Ontology Class Label 05 | Matches Ontology Class Category 05 |
| MATC-0006 | Matches Ontology Class Label 06 | Matches Ontology Class Category 06 |
| MATC-0007 | Matches Ontology Class Label 07 | Matches Ontology Class Category 07 |
| MATC-0008 | Matches Ontology Class Label 08 | Matches Ontology Class Category 08 |

Every ontology match is accompanied by two quantitative measures: confidence and uncertainty. Confidence is a normalized score between zero and one that reflects the system's certainty in the match quality—MATC-0001 carries a confidence of 0.796, suggesting a strong alignment, whereas MATC-0002 scores only 0.272, indicating a weak or ambiguous correspondence. Uncertainty, expressed as a raw numeric value such as 236.57 for MATC-0001 or 27.88 for MATC-0003, provides an alternative, scale-dependent measure of doubt that may be useful for threshold-based filtering or risk scoring. Together, these two fields allow governance frameworks to triage matches: high-confidence, low-uncertainty assertions can be treated as authoritative for compliance reporting, while low-confidence matches may require manual review or additional evidence.

Beyond ontology matching, the framework tracks how compliance requirements relate to one another through a traceability graph. Each requirement—such as "Network Segmentation Rule" or "Privacy Compliance Requirement"—is assigned a unique identifier like TRAC-0001 or TRAC-0004. Requirements trace to external standards or internal artifacts, including references like "HIPAA Security Rule," "Risk Assessment Matrix," "Compliance Audit Checklist," and "ISO 27001 Control." The relationship between a source requirement and its target is not merely a binary link; it carries a role that describes the nature of the connection. In the traceability data, roles such as owner, reviewer, and contributor appear, indicating that TRAC-0001 acts as the owner of its trace to TRAC-0004, while TRAC-0004 serves as both a reviewer and contributor in other relationships. This role dimension is critical for accountability: it makes clear who is responsible for maintaining each link in the compliance chain and who must validate its accuracy.

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

Column-level annotations extend the traceability model into the data catalog itself. An annotator—identified by a reference such as TRAC-0001 or TRAC-0007—tags a specific column, like ingestion_latency, compliance_flag, or api_version, with structured metadata. These annotations are not flat key-value pairs; they are modeled as entities with typed attributes. Each attribute has a name and a type drawn from the XML Schema definition space: confidence attributes are typed as xsd:decimal, dimension_kind as xsd:string, method as xsd:string, and recorded_at as xsd:dateTime. The attribute values are stored in type-specific tables, ensuring that a decimal attribute holds values like 0.302 or 639.96, a string attribute holds values like "Dimension Kind 01" or "en," and a datetime attribute holds values like 2025-01-07T23:20:10. This typed attribute model allows the system to enforce data integrity at the annotation level while supporting a flexible schema that can accommodate new attribute types without schema migration.

**t_column_tag_from_annotator**

| id | column | by_annotator |
| --- | --- | --- |
| ANNO-0001 | ingestion_latency | TRAC-0001 |
| ANNO-0002 | compliance_flag | TRAC-0007 |
| ANNO-0003 | api_version | TRAC-0004 |
| ANNO-0004 | api_version | TRAC-0007 |
| ANNO-0005 | compliance_flag | TRAC-0001 |
| ANNO-0006 | event_timestamp | TRAC-0007 |

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

The entity concept ties these layers together. An entity is the thing being annotated or matched—whether it is a column in a data catalog, a requirement in a compliance register, or a fact in the ontology layer. Each entity has an identifier that serves as the join key across attribute tables, value tables, and relationship tables. The attr concept refers to the named property of an entity, such as confidence or recorded_at, while attr_type specifies the data type of that property's value. The misc column captures free-form or heterogeneous values that do not fit into the structured attribute model, including raw numeric measurements like 882.98 or contextual strings like "nightly summary." By separating structured typed attributes from misc values, the framework supports both rigorous, queryable metadata and the flexibility to capture unstructured information that may be relevant during compliance investigations.

**fact_ontology**

| id | matches_ontology_class_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MATC-0001 | MATC-0008 | 0.796 | 236.57 | 237.27 |
| MATC-0002 | MATC-0002 | 0.272 | 112.66 | 381.96 |
| MATC-0003 | MATC-0008 | 0.829 | 27.88 | 882.98 |
| MATC-0004 | MATC-0008 | 0.584 | 688.77 | 768.24 |
| MATC-0005 | MATC-0003 | 0.900 | 848.34 | 62.60 |
| MATC-0006 | MATC-0005 | 0.038 | 1.40 | 737.81 |
| MATC-0007 | MATC-0001 | 0.986 | 660.49 | 169.21 |
| MATC-0008 | MATC-0004 | 0.900 | 507.89 | 697.45 |

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