---
chapter_id: ch_live_ontology_class_match_c8a79f
topic_id: 109
family: 07_long_tail
cited_terms: ['ontology_class_match', 'schemaorg_review_rating', 'belief_interval_only_unit_range']
model: engine-refine
---

In knowledge-graph and compliance-oriented data systems, stable identifiers anchor every assertion that must survive audit, reconciliation, and downstream reasoning. An identifier such as MATC-0001 or RANG-0003 is not merely a surrogate key: it is the durable handle by which a fact, dimension member, or relational tuple is cited across extracts, lineage reports, and policy enforcement. Without that permanence, confidence scores, role assignments, and ontology alignments cannot be traced to the same real-world referent when schemas evolve or when multiple pipelines emit partially overlapping views of the same domain.

Ontology alignment expresses what a recorded observation is *about* in controlled vocabulary terms. A matches-ontology-class association ties a concrete fact to a class node—MATC-0001 pointing at MATC-0008, for instance—while companion dimension records supply human-readable labels and categorical placement (Matches Ontology Class Label 01 under Matches Ontology Class Category 01). Category thus operates as a governance partition: it groups class definitions for reporting scope, access control, or validation rule packs, whereas the class key itself is the machine-checkable typing hook. The pairing of label and category lets operators audit both semantics and administrative ownership without collapsing distinct concerns into a single free-text field.

Confidence and uncertainty quantify epistemic posture on those alignments and are rarely interchangeable even when both appear on the same row. Confidence scores such as 0.796, 0.272, 0.829, and 0.584 express graded belief that a match is correct under a stated model; low confidence (0.272 on MATC-0002) signals that automated classification should trigger human review or a fallback rule rather than silent promotion to production truth. Uncertainty values—236.57, 112.66, 27.88, 688.77 in the exemplar set—often encode complementary dispersion, interval width, or residual error budgets depending on the scoring framework; a high uncertainty of 688.77 alongside moderate confidence 0.584 warns that point estimates alone misrepresent decision risk. Governance practice treats the pair as joint evidence: thresholds on confidence gate automation, while uncertainty shapes whether a single scalar suffices or whether interval semantics must be preserved.

Relational assertions among business entities are articulated through subject, target, and role rather than through denormalized duplication. In review-rating integration, a schema.org-described item (Adobe Photoshop, The Great Gatsby, iPhone 15 Pro) stands as the subject of a rating edge whose target is a normalized rating artifact ("3.2 points," "100 percentile," "9.1 rating," "4.0 average"). The role qualifier—reviewer versus contributor—records *how* the subject participated in producing or endorsing the target, which matters for provenance, liability, and weighting in aggregate analytics: the same numeric target linked under different roles is not the same compliance event. Junction identifiers (RATI-0001 through RATI-0004) keep those triples addressable when either endpoint is revised independently.

**t_schemaorg_review_rating**

| id | schemaorg |
| --- | --- |
| RATI-0001 | Adobe Photoshop |
| RATI-0002 | The Great Gatsby |
| RATI-0003 | iPhone 15 Pro |
| RATI-0004 | iPhone 15 Pro |
| RATI-0005 | Marriott International |
| RATI-0006 | Marriott International |

**t_schemaorg_review_rating_review_rating**

| id | review_rating |
| --- | --- |
| RATI-0001 | 3.2 points |
| RATI-0002 | 100 percentile |
| RATI-0003 | 9.1 rating |
| RATI-0004 | 4.0 average |
| RATI-0005 | 47 score |
| RATI-0006 | 5.0 scale |
| RATI-0007 | 8.7 out of 10 |
| RATI-0008 | 88 out of 100 |

**t_schemaorg_review_rating__review_rating**

| id | schemaorg_id | review_rating_id | role |
| --- | --- | --- | --- |
| RATI-0001 | RATI-0004 | RATI-0001 | reviewer |
| RATI-0002 | RATI-0006 | RATI-0007 | reviewer |
| RATI-0003 | RATI-0001 | RATI-0004 | contributor |
| RATI-0004 | RATI-0005 | RATI-0003 | reviewer |
| RATI-0005 | RATI-0006 | RATI-0001 | owner |
| RATI-0006 | RATI-0006 | RATI-0007 | owner |
| RATI-0007 | RATI-0001 | RATI-0008 | owner |
| RATI-0008 | RATI-0006 | RATI-0008 | observer |

Attribute-centric modeling generalizes the same discipline to entities whose properties are heterogeneous and typed. An entity (for example a belief interval keyed RANG-0001) carries named attributes—confidence, dimension_kind, method, recorded_at—each declared with an attr_type drawn from a controlled datatype registry (`xsd:decimal`, `xsd:string`, `xsd:dateTime`). Separating attr metadata from attr values prevents schema churn: new measurements attach as new attribute rows and land in type-appropriate value stores (0.727 and 281.42 as decimals; Dimension Kind 01 and Encoding 02 as strings; 2025-06-14T16:53:04 as dateTime) without widening a single physical table or weakening validation. The attr name is the governance vocabulary; the attr_type is the enforceable contract.

Fields classified as misc absorb values that are necessary for operations yet resist a single global type or relational slot in the current model. Ontology facts may park auxiliary numerics (237.27, 381.96) beside formal confidence; belief intervals may store change rationale or locale codes (`fr`) alongside strictly typed siblings. Misc is not an excuse for ambiguity—it is an explicit staging or extension surface whose contents should be promoted to typed attributes, categories, or first-class relations when reuse and constraint requirements mature. Taken together, identifier, entity, subject, target, role, category, matches-ontology-class, attr, attr_type, confidence, uncertainty, and misc form a layered evidentiary grammar: keys stabilize reference, ontology and category supply meaning, subject–target–role graphs encode participation, typed attributes carry inspectable measurements, confidence and uncertainty govern trust, and misc holds the residual detail until the governance model catches up.

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

**t_belief_interval_only_unit_range**

| id | belief | belief_lower_bound |
| --- | --- | --- |
| RANG-0001 | throughput projection | RATI-0003 |
| RANG-0002 | throughput projection | RATI-0004 |
| RANG-0003 | packet loss guarantee | RATI-0001 |
| RANG-0004 | noise floor estimate | RATI-0005 |
| RANG-0005 | thermal drift assertion | RATI-0004 |
| RANG-0006 | packet loss guarantee | RATI-0004 |

**t_belief_interval_only_unit_range_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RANG-0001 | confidence | xsd:decimal |
| RANG-0002 | dimension_kind | xsd:string |
| RANG-0003 | method | xsd:string |
| RANG-0004 | recorded_at | xsd:dateTime |
| RANG-0005 | uncertainty | xsd:decimal |
| RANG-0006 | unit | xsd:string |
| RANG-0007 | value | xsd:decimal |
| RANG-0008 | encoding | xsd:string |

**t_belief_interval_only_unit_range_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0004 | 2025-06-14T16:53:04 |
| RANG-0002 | RANG-0002 | RANG-0004 | 2023-08-16T07:36:41 |
| RANG-0003 | RANG-0003 | RANG-0004 | 2023-03-26T19:32:25 |
| RANG-0004 | RANG-0004 | RANG-0004 | 2025-03-17T08:26:16 |
| RANG-0005 | RANG-0005 | RANG-0004 | 2025-04-30T01:20:27 |
| RANG-0006 | RANG-0006 | RANG-0004 | 2023-02-14T23:11:05 |

**t_belief_interval_only_unit_range_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0001 | 0.727 |
| RANG-0002 | RANG-0001 | RANG-0005 | 281.42 |
| RANG-0003 | RANG-0001 | RANG-0007 | 343.70 |
| RANG-0004 | RANG-0002 | RANG-0001 | 0.788 |
| RANG-0005 | RANG-0002 | RANG-0005 | 676.76 |
| RANG-0006 | RANG-0002 | RANG-0007 | 95.73 |
| RANG-0007 | RANG-0003 | RANG-0001 | 0.294 |
| RANG-0008 | RANG-0003 | RANG-0005 | 403.37 |

**t_belief_interval_only_unit_range_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RANG-0001 | RANG-0001 | RANG-0002 | Dimension Kind 01 |
| RANG-0002 | RANG-0001 | RANG-0008 | Encoding 02 |
| RANG-0003 | RANG-0001 | RANG-0009 | change rationale |
| RANG-0004 | RANG-0001 | RANG-0010 | fr |
| RANG-0005 | RANG-0001 | RANG-0003 | hybrid |
| RANG-0006 | RANG-0001 | RANG-0006 | ms |
| RANG-0007 | RANG-0002 | RANG-0002 | Dimension Kind 07 |
| RANG-0008 | RANG-0002 | RANG-0008 | Encoding 08 |