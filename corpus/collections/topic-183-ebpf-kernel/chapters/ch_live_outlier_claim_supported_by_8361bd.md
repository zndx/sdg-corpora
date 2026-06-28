---
chapter_id: ch_live_outlier_claim_supported_by_8361bd
topic_id: 183
family: 02_observation_measurement
cited_terms: ['outlier_claim_supported_by', 'ontology_class_match', 'xdp_action_drop']
model: engine-refine
---

In operational security and compliance frameworks, the precise tracking of network events requires a flexible yet rigorous data model capable of capturing heterogeneous metadata without sacrificing query performance or schema stability. The system employs an entity-attribute-value architecture to manage security actions, such as eXpress Data Path packet drops, where each event, identified by a unique entity identifier like `DROP-0001`, serves as the anchor for a dynamic set of attributes. Rather than hardcoding columns for every possible metadata field, the framework defines attributes in a dedicated registry, specifying an attribute name (e.g., `checksum`, `created_date`, `identifier`, `license`) and an attribute type that dictates how the corresponding value must be interpreted. This decoupling allows the system to scale across diverse network interfaces, ranging from `wlan0_monitor` to `nfqueue_bridge`, and enforcement actions such as `quarantine`, `conntrack_drop`, `acl_denied`, and `threat_block`, while maintaining a unified governance layer.

**t_xdp_action_drop**

| id | xdp | x_d_p_action |
| --- | --- | --- |
| DROP-0001 | wlan0_monitor | quarantine |
| DROP-0002 | veth1_filter | conntrack_drop |
| DROP-0003 | docker0_hook | acl_denied |
| DROP-0004 | nfqueue_bridge | threat_block |
| DROP-0005 | eth0_ingress | acl_denied |
| DROP-0006 | wlan0_monitor | threat_block |

**t_xdp_action_drop_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DROP-0001 | checksum | xsd:string |
| DROP-0002 | created_date | xsd:date |
| DROP-0003 | identifier | cco:DesignativeICE |
| DROP-0004 | license | xsd:string |
| DROP-0005 | mime_type | xsd:string |
| DROP-0006 | size_bytes | xsd:long |
| DROP-0007 | uri | xsd:string |
| DROP-0008 | version | xsd:integer |

**t_xdp_action_drop_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0002 | 2025-02-22 |
| DROP-0002 | DROP-0002 | DROP-0002 | 2023-10-04 |
| DROP-0003 | DROP-0003 | DROP-0002 | 2025-04-21 |
| DROP-0004 | DROP-0004 | DROP-0002 | 2023-05-09 |
| DROP-0005 | DROP-0005 | DROP-0002 | 2023-08-28 |
| DROP-0006 | DROP-0006 | DROP-0002 | 2023-05-04 |

**t_xdp_action_drop_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0006 | 265 |
| DROP-0002 | DROP-0001 | DROP-0008 | 7 |
| DROP-0003 | DROP-0002 | DROP-0006 | 394 |
| DROP-0004 | DROP-0002 | DROP-0008 | 7 |
| DROP-0005 | DROP-0003 | DROP-0006 | 114 |
| DROP-0006 | DROP-0003 | DROP-0008 | 8 |
| DROP-0007 | DROP-0004 | DROP-0006 | 460 |
| DROP-0008 | DROP-0004 | DROP-0008 | 9 |

**t_xdp_action_drop_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0001 | 1a4b6c2d |
| DROP-0002 | DROP-0001 | DROP-0003 | urn:uuid:9f2a |
| DROP-0003 | DROP-0001 | DROP-0004 | CC-BY-4.0 |
| DROP-0004 | DROP-0001 | DROP-0009 | us-east-1 |
| DROP-0005 | DROP-0001 | DROP-0005 | application/parquet |
| DROP-0006 | DROP-0001 | DROP-0010 | Name 06 |
| DROP-0007 | DROP-0001 | DROP-0011 | ml-infra |
| DROP-0008 | DROP-0001 | DROP-0012 | Tags 08 |

Attribute typing enforces strict data integrity by mapping each metadata field to a standardized type, such as `xsd:string` for textual identifiers like `1a4b6c2d` or `urn:uuid:9f2a`, `xsd:date` for temporal metadata like `2025-02-22`, or domain-specific types like `cco:DesignativeICE` for designative identifiers. Because values are strictly typed, the system distributes them across specialized storage layers, linking each entity to its corresponding attribute and storing the actual misc value. This separation ensures that numeric metrics, such as integer counters like `265` or `394`, are stored alongside categorical strings like `CC-BY-4.0` or geographic regions like `us-east-1`, without type coercion errors or storage bloat. The foreign-key relationships between entity and attribute identifiers guarantee that every metadata assignment is traceable to both the originating security event and the schema definition.

**dim_supported_by**

| id | supported_by_label | supported_by_category |
| --- | --- | --- |
| SUPP-0001 | Supported By Label 01 | Supported By Category 01 |
| SUPP-0002 | Supported By Label 02 | Supported By Category 02 |
| SUPP-0003 | Supported By Label 03 | Supported By Category 03 |
| SUPP-0004 | Supported By Label 04 | Supported By Category 04 |
| SUPP-0005 | Supported By Label 05 | Supported By Category 05 |
| SUPP-0006 | Supported By Label 06 | Supported By Category 06 |

To support compliance auditing and operational categorization, attributes and events are further organized through categorical taxonomies. Dimension tables provide human-readable labels, such as `Supported By Label 01` or `Matches Ontology Class Label 03`, paired with structured category fields like `Supported By Category 01` or `Matches Ontology Class Category 02`. These categories enable granular filtering and reporting, allowing governance teams to isolate events by policy domain, regulatory framework, or internal control classification. By abstracting labels and categories into dimension tables, the system ensures that terminology remains consistent across audits and that changes to classification schemes can be applied centrally without altering the underlying fact data.

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

A critical component of this governance framework is the quantification of analytical certainty, where every recorded event is accompanied by confidence and uncertainty metrics that provide a mathematical basis for risk assessment. Confidence scores, expressed as decimal values between zero and one, indicate the system’s assurance that a particular classification or anomaly is accurate; for instance, a score of `0.877` reflects a high-certainty outlier detection, while `0.147` signals a low-confidence match. Conversely, uncertainty values, ranging from precise measurements like `10.24` to highly volatile readings like `719.33` or `688.77`, quantify the margin of error or variance associated with the observed metric, such as `369.89` or `882.98`. These metrics enable operators to prioritize investigations, applying threshold-based filtering to distinguish actionable security events from noise or ambiguous detections.

**fact_outlier**

| id | supported_by_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SUPP-0001 | SUPP-0006 | 0.877 | 516.58 | 453.93 |
| SUPP-0002 | SUPP-0002 | 0.147 | 368.22 | 510.05 |
| SUPP-0003 | SUPP-0001 | 0.792 | 10.24 | 369.89 |
| SUPP-0004 | SUPP-0003 | 0.479 | 719.33 | 757.32 |
| SUPP-0005 | SUPP-0003 | 0.986 | 245.64 | 972.07 |
| SUPP-0006 | SUPP-0004 | 0.386 | 5.02 | 16.62 |
| SUPP-0007 | SUPP-0003 | 0.047 | 979.09 | 828.93 |

The framework further strengthens its analytical rigor by linking events to external ontologies and internal support evidence. The matches ontology class foreign key connects each event to a standardized classification, such as `MATC-0008` or `MATC-0002`, ensuring that internal security actions align with industry-standard taxonomies and regulatory definitions. Similarly, the supported by key references the supporting evidence dimension, tying outlier detections to specific analytical models or data sources, such as `SUPP-0006` or `SUPP-0002`. This dual-layer validation, combining ontology alignment with evidence-based support, creates an auditable trail that satisfies compliance requirements for data provenance and decision transparency.

Together, these components form a cohesive operational intelligence layer that bridges raw network telemetry with structured governance requirements. By separating entity definitions, attribute schemas, typed values, categorical taxonomies, and confidence metrics into distinct but interconnected structures, the system achieves both the flexibility needed to capture evolving security events and the rigor required for regulatory compliance. Operators can trace any security action back through its attributes, validate its classification against established ontologies, and assess the reliability of its detection metrics, ensuring that every operational decision is grounded in verifiable, well-documented evidence.