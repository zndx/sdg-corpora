---
chapter_id: ch_live_lineage_edge_basic_a6cd89
topic_id: 80
family: 05_provo_lineage
cited_terms: ['lineage_edge_basic', 'lineage_edge_describes_column_flow', 'lineage_edge_max_one_target']
model: engine-refine
---

Every lineage edge and data flow is anchored by a unique identifier that serves as the primary entity key across the governance fabric. These identifiers—such as EDGE-0001, FLOW-0001, or TARG-0001—establish deterministic references that survive schema evolution and enable cross-system traceability. Attached to each entity is a structured set of attributes, or attr, which capture the measurable and descriptive properties of the lineage relationship. Each attribute is bound to a strict attr type, whether xsd:decimal for quantitative metrics, xsd:string for categorical labels, or xsd:dateTime for temporal events. This type discipline prevents semantic drift, enforces validation at ingestion, and ensures that downstream compliance queries operate against homogeneous, queryable datasets rather than unstructured payloads.

**t_lineage_edge_basic**

| id | lineage |
| --- | --- |
| EDGE-0001 | Document Revision History |
| EDGE-0002 | Log aggregation sequence |
| EDGE-0003 | Data Lake Ingestion Chain |
| EDGE-0004 | Financial Reconciliation Trace |
| EDGE-0005 | Sensor calibration chain |
| EDGE-0006 | Financial Reconciliation Trace |
| EDGE-0007 | Credit card transaction flow |
| EDGE-0008 | Patient cohort extraction |

**t_lineage_edge_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EDGE-0001 | confidence | xsd:decimal |
| EDGE-0002 | dimension_kind | xsd:string |
| EDGE-0003 | method | xsd:string |
| EDGE-0004 | recorded_at | xsd:dateTime |
| EDGE-0005 | uncertainty | xsd:decimal |
| EDGE-0006 | unit | xsd:string |
| EDGE-0007 | value | xsd:decimal |
| EDGE-0008 | encoding | xsd:string |

**t_lineage_edge_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0004 | 2023-06-18T00:21:12 |
| EDGE-0002 | EDGE-0002 | EDGE-0004 | 2023-11-20T00:15:50 |
| EDGE-0003 | EDGE-0003 | EDGE-0004 | 2023-03-09T06:34:54 |
| EDGE-0004 | EDGE-0004 | EDGE-0004 | 2023-04-04T09:21:45 |
| EDGE-0005 | EDGE-0005 | EDGE-0004 | 2025-02-06T04:35:19 |
| EDGE-0006 | EDGE-0006 | EDGE-0004 | 2023-09-20T23:51:28 |
| EDGE-0007 | EDGE-0007 | EDGE-0004 | 2023-03-25T22:49:39 |
| EDGE-0008 | EDGE-0008 | EDGE-0004 | 2025-02-12T13:04:31 |

**t_lineage_edge_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0001 | 0.947 |
| EDGE-0002 | EDGE-0001 | EDGE-0005 | 637.72 |
| EDGE-0003 | EDGE-0001 | EDGE-0007 | 513.28 |
| EDGE-0004 | EDGE-0002 | EDGE-0001 | 0.497 |
| EDGE-0005 | EDGE-0002 | EDGE-0005 | 852.97 |
| EDGE-0006 | EDGE-0002 | EDGE-0007 | 198.62 |
| EDGE-0007 | EDGE-0003 | EDGE-0001 | 0.290 |
| EDGE-0008 | EDGE-0003 | EDGE-0005 | 468.80 |

**t_lineage_edge_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0002 | Dimension Kind 01 |
| EDGE-0002 | EDGE-0001 | EDGE-0008 | Encoding 02 |
| EDGE-0003 | EDGE-0001 | EDGE-0009 | change rationale |
| EDGE-0004 | EDGE-0001 | EDGE-0010 | de |
| EDGE-0005 | EDGE-0001 | EDGE-0003 | manual |
| EDGE-0006 | EDGE-0001 | EDGE-0006 | count |
| EDGE-0007 | EDGE-0002 | EDGE-0002 | Dimension Kind 07 |
| EDGE-0008 | EDGE-0002 | EDGE-0008 | Encoding 08 |

**t_lineage_edge_max_one_target**

| id | lineage |
| --- | --- |
| TARG-0001 | Sensor calibration chain |
| TARG-0002 | IoT telemetry ingestion |
| TARG-0003 | Log aggregation sequence |
| TARG-0004 | IoT telemetry ingestion |
| TARG-0005 | Log aggregation sequence |
| TARG-0006 | Feature store refresh |

**t_lineage_edge_max_one_target_to_target**

| id | to_target |
| --- | --- |
| TARG-0001 | Compliance audit log |
| TARG-0002 | Risk scoring model |
| TARG-0003 | Feature vector store |
| TARG-0004 | Executive dashboard |
| TARG-0005 | Executive summary report |
| TARG-0006 | Data lake staging area |
| TARG-0007 | Executive summary report |
| TARG-0008 | ML inference endpoint |

Actual measurements populate these attributes through a type-segregated value layer, commonly designated as the misc storage construct. Decimal attributes retain full precision for figures like 0.947 or 637.72, while temporal attributes anchor observations to exact moments such as 2023-06-18T00:21:12. Textual attributes preserve operational context through entries like change rationale, Dimension Kind 01, or Encoding 02. By isolating values according to their underlying attr type, the system guarantees that analytical workloads and audit reports draw from validated, type-coherent records. This architectural separation eliminates runtime casting errors, accelerates index utilization, and maintains a clean boundary between metadata definitions and measured data.

Lineage paths are further organized through a describes column flow framework that maps raw data movements to standardized business and technical categories. Each flow is assigned a descriptive label and a category designation—such as Describes Column Flow Category 01 or Category 03—which aligns technical lineage with regulatory domains, architectural tiers, or operational workflows. This categorization transforms unstructured data trails into governed assets, enabling stewards to filter, aggregate, and report on lineage at the domain level rather than the record level. When a flow keyed as FLOW-0006 is classified under a specific category, governance teams can instantly correlate it with relevant compliance mandates, data residency requirements, or retention policies.

**fact_lineage**

| id | describes_column_flow_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FLOW-0001 | FLOW-0006 | 0.645 | 612.22 | 903.86 |
| FLOW-0002 | FLOW-0005 | 0.071 | 133.03 | 832.18 |
| FLOW-0003 | FLOW-0004 | 0.404 | 76.69 | 862.00 |
| FLOW-0004 | FLOW-0005 | 0.779 | 708.23 | 259.55 |
| FLOW-0005 | FLOW-0002 | 0.376 | 801.99 | 986.33 |
| FLOW-0006 | FLOW-0003 | 0.744 | 956.79 | 34.40 |

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

Reliability and risk are quantified through paired confidence and uncertainty metrics that accompany every lineage assertion. Confidence scores, such as 0.645 or 0.779, express the degree of assurance that a given data relationship accurately reflects its source-to-destination mapping. Conversely, uncertainty values like 612.22 or 708.23 capture the associated variance, measurement error, or probabilistic risk exposure. Together, these measures allow data stewards to prioritize remediation efforts, flag low-assurance pathways for manual verification, and maintain a defensible posture during external audits. The continuous monitoring of confidence and uncertainty converts static lineage maps into dynamic risk dashboards, ensuring that governance decisions are grounded in measurable assurance levels rather than assumed correctness.

Accountability and data ownership are formalized through a subject-target-role relationship model that explicitly defines how lineage processes interact with downstream consumers. The subject represents the originating lineage chain—such as a Sensor calibration chain or IoT telemetry ingestion pipeline—while the target identifies the destination system or analytical artifact, including a Compliance audit log, Risk scoring model, or Executive dashboard. The role field assigns the functional relationship between them, designating entities as contributor, owner, or processor. This triad establishes unambiguous stewardship boundaries, ensuring that every data movement has an identifiable accountable party and a defined operational purpose. When combined with the preceding identifier, attribute, flow, and risk constructs, the subject-target-role architecture delivers a complete, audit-ready lineage fabric that satisfies both technical traceability requirements and regulatory compliance mandates.

**t_lineage_edge_max_one_target__to_target**

| id | lineage_id | to_target_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0006 | TARG-0001 | contributor |
| TARG-0002 | TARG-0001 | TARG-0003 | owner |
| TARG-0003 | TARG-0003 | TARG-0005 | owner |
| TARG-0004 | TARG-0003 | TARG-0006 | contributor |
| TARG-0005 | TARG-0002 | TARG-0008 | owner |
| TARG-0006 | TARG-0006 | TARG-0004 | contributor |
| TARG-0007 | TARG-0006 | TARG-0006 | observer |
| TARG-0008 | TARG-0002 | TARG-0008 | reviewer |