---
chapter_id: ch_live_cardinality_min_two_generic_b73414
topic_id: 80
family: 01_foundation
cited_terms: ['cardinality_min_two_generic', 'descriptive_either_evidence_or_claim', 'lineage_edge_describes_column_flow']
model: engine-refine
---

Attributes and their typed values constitute the fundamental mechanism by which evidence and claims are annotated within the data governance framework. Each attribute—whether a confidence score, a dimension kind, a method designation, or a recorded timestamp—is declared with an explicit type constraint drawn from the XML Schema definition space: xsd:decimal for numeric measures, xsd:string for categorical or textual descriptors, and xsd:dateTime for temporal markers. This type discipline ensures that the value store remains structurally coherent across heterogeneous data sources. A confidence attribute, for instance, carries a decimal value such as 0.015 or 0.355, while a dimension kind attribute holds a string value like Dimension Kind 01 or Encoding 02. The separation of attribute metadata from value storage permits each value to be typed independently, so that a single entity may simultaneously carry a decimal confidence of 92.51, a string method designation of change rationale, and a datetime stamp of 2023-12-14T23:50:57, each stored in its appropriately typed value table.

The entity-attribute-value triad forms the backbone of this annotation model, with each entity identified by a stable identifier such as CLAI-0001 or CLAI-0002 and linked to its attributes through foreign-key references. The entity_id column in each value table points back to the claim or evidence record, while the attr_id column resolves to the attribute definition, establishing a many-to-many relationship that allows any attribute type to be applied to any entity. This design accommodates the full spectrum of descriptive content: a pipeline run log may be associated with a checksum mismatch alert and a validation rule set, while a compliance audit trail carries a field condition note and a calibration certificate. The descriptive columns capture the substantive content of each record, and the attribute-value tables layer structured metadata on top, enabling both human-readable documentation and machine-processable constraints.

**t_cardinality_min_two_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | AtLeastTwo | PrimaryCache |
| GENE-0002 | MinTwoRequired | PrimaryCache |
| GENE-0003 | AtLeastTwo | TargetSystem |
| GENE-0004 | AtLeastTwo | ReplicaNode |
| GENE-0005 | DualAssociation | MasterNode |
| GENE-0006 | TwinConstraint | GatewayHub |

**t_descriptive_either_evidence_or_claim**

| id | descriptive | descriptive_2 | descriptive_3 |
| --- | --- | --- | --- |
| CLAI-0001 | pipeline run log | checksum mismatch alert | validation rule set |
| CLAI-0002 | compliance audit trail | field condition note | validation rule set |
| CLAI-0003 | network latency trace | calibration certificate | chain of custody tag |
| CLAI-0004 | pipeline run log | data quality flag | sampling interval ms |
| CLAI-0005 | data ingestion manifest | retention policy label | retention expiry date |
| CLAI-0006 | compliance audit trail | data quality flag | hash algorithm ID |

**t_descriptive_either_evidence_or_claim_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_descriptive_either_evidence_or_claim_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2023-12-14T23:50:57 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2024-02-16T02:04:00 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2024-04-20T14:09:40 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2025-04-28T22:05:41 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-01-08T15:26:20 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2023-08-14T20:31:38 |

**t_descriptive_either_evidence_or_claim_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.015 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 195.73 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 92.51 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.355 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 482.72 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 420.42 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.827 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 514.52 |

**t_descriptive_either_evidence_or_claim_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | change rationale |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | es |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | manual |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | deg_C |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

Column flow descriptions are modeled as a separate dimensional construct, with each flow identified by a label and categorized by a category designation. The fact table for column lineage references these flows through a foreign key on describes_column_flow_key, linking each lineage observation to its corresponding flow dimension record. A flow labeled Describes Column Flow Label 01 belongs to category Describes Column Flow Category 01, and this categorical classification provides the organizational structure for grouping related data transformations. The cardinality constraints table extends this organizational logic by specifying minimum membership requirements—AtLeastTwo or MinTwoRequired—on relationships between entities, ensuring that critical associations such as those between PrimaryCache and TargetSystem or between PrimaryCache and ReplicaNode satisfy defined structural invariants.

**dim_describes_column_flow**

| id | describes_column_flow_label | describes_column_flow_category |
| --- | --- | --- |
| FLOW-0001 | Describes Column Flow Label 01 | Describes Column Flow Category 01 |
| FLOW-0002 | Describes Column Flow Label 02 | Describes Column Flow Category 02 |
| FLOW-0003 | Describes Column Flow Label 03 | Describes Column Flow Category 03 |
| FLOW-0004 | Describes Column Flow Label 04 | Describes Column Flow Category 04 |
| FLOW-0005 | Describes Column Flow Label 05 | Describes Column Flow Category 05 |
| FLOW-0006 | Describes Column Flow Label 06 | Describes Column Flow Category 06 |
| FLOW-0007 | Describes Column Flow Label 07 | Describes Column Flow Category 07 |

Confidence and uncertainty metrics quantify the reliability of each column flow observation, providing a dual-axis assessment of data provenance quality. The confidence value, expressed as a decimal between zero and one, indicates the degree of assurance in the lineage assertion: a confidence of 0.779 for flow FLOW-0004 suggests substantial reliability, while a confidence of 0.071 for FLOW-0002 signals considerable doubt. The uncertainty value, expressed as an absolute measure such as 612.22 or 76.69, provides the complementary magnitude of imprecision. Together, these metrics enable downstream consumers to weight lineage evidence appropriately, recognizing that a flow with confidence 0.645 and uncertainty 612.22 carries materially different assurance than one with confidence 0.404 and uncertainty 76.69. The associated value column records the quantitative observation underlying each lineage fact, with values ranging from 259.55 to 903.86, grounding the confidence-uncertainty assessment in concrete measured quantities.

**fact_lineage**

| id | describes_column_flow_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FLOW-0001 | FLOW-0006 | 0.645 | 612.22 | 903.86 |
| FLOW-0002 | FLOW-0005 | 0.071 | 133.03 | 832.18 |
| FLOW-0003 | FLOW-0004 | 0.404 | 76.69 | 862.00 |
| FLOW-0004 | FLOW-0005 | 0.779 | 708.23 | 259.55 |
| FLOW-0005 | FLOW-0002 | 0.376 | 801.99 | 986.33 |
| FLOW-0006 | FLOW-0003 | 0.744 | 956.79 | 34.40 |