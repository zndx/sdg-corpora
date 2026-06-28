---
chapter_id: ch_live_designative_for_specific_role_318314
topic_id: 119
family: 01_foundation
cited_terms: ['designative_for_specific_role', 'lineage_edge_with_confidence', 'policy_applies_to']
model: engine-refine
---

Temporal anchoring and provenance tracking form the backbone of any auditable data governance framework, where the effective date of a policy and the recorded_at timestamp of a lineage edge serve as immutable markers of when obligations and relationships came into force. The effective date establishes the point from which a directive such as the Cloud Security Baseline or the Zero Trust Architecture Guideline becomes enforceable across its target scope—whether that scope encompasses API Gateway Endpoints, Kubernetes Clusters, or Customer PII Datasets—and determines the temporal boundary against which compliance is measured. A policy like the GDPR Compliance Directive, effective from 2024-06-14, carries no retroactive weight; its applicability to HR Personnel Files begins precisely on that calendar date, and any audit finding must reference this boundary to distinguish pre-compliance from post-compliance states. Similarly, the recorded_at field captures the moment at which a lineage relationship was observed or inferred, anchoring claims about data flow to a specific instant in time. The lineage edge connecting ml_training_dataset_prep to downstream consumers was recorded at 2024-07-21T21:36:51, while the data_lake_warehouse_sync relationship was logged at 2025-03-12T13:46:59, and these timestamps are not interchangeable metadata—they define the temporal provenance chain that auditors reconstruct when tracing data from source to consumption.

The unit field extends this temporal precision into the physical and analytical dimensions of the data itself, specifying the measurement context in which lineage confidence values must be interpreted. A confidence assessment of 95_percent attached to a lineage edge carries a unit of ratio, indicating a dimensionless proportion, whereas the same confidence level paired with deg_C or mg/L signals that the lineage relationship pertains to data carrying thermal or concentration measurements respectively. The unit nm, appearing alongside a lineage edge recorded at 2024-01-06T01:59:57, grounds that relationship in spectral or wavelength-domain data. Without the unit, the confidence value is ambiguous; with it, the confidence claim is bounded by the measurement system to which it applies, and any downstream consumer can determine whether the lineage relationship is relevant to their own analytical context.

**t_lineage_edge_with_confidence**

| id | lineage | confidence | recorded_at | unit |
| --- | --- | --- | --- | --- |
| CONF-0001 | ml_training_dataset_prep | partial_match | 2024-07-21T21:36:51 | deg_C |
| CONF-0002 | data_lake_warehouse_sync | statistical_overlap | 2025-03-12T13:46:59 | mg/L |
| CONF-0003 | data_lake_warehouse_sync | 95_percent | 2023-02-17T19:37:00 | ratio |
| CONF-0004 | data_lake_warehouse_sync | 95_percent | 2024-01-06T01:59:57 | nm |
| CONF-0005 | api_log_aggregation | partial_match | 2025-01-27T14:57:11 | deg_C |
| CONF-0006 | geospatial_raster_processing | high | 2023-11-04T09:37:36 | nm |

Identifier fields provide the stable, machine-readable keys that bind these temporal and dimensional annotations to specific entities across the governance ecosystem. The identifier ROLE-0001 through ROLE-0004 in the designative role table, the identifiers CONF-0001 through CONF-0004 in the lineage confidence table, and the identifiers APPL-0001 through APPL-0004 in the policy application table each serve as primary keys that enable referential integrity across tables and systems. These identifiers are not arbitrary; they encode the domain of the entity they reference—ROLE- prefixed keys denote designative roles such as Sensor-Array-Beta or CoreSample-X22, CONF- prefixed keys denote lineage confidence edges, and APPL- prefixed keys denote policy application relationships. The identifier is the anchor point that allows an auditor to trace from a policy like the Data Retention Standard, applied to Customer PII Datasets, through to the specific lineage edges that govern how that data moves, and further to the designative roles that define who or what is responsible for its handling.

The designative and identifies columns within the role table establish a mapping between operational entities and the standards or systems they represent, creating a semantic layer that connects technical assets to governance obligations. The designative Sensor-Array-Beta identifies the Calibration-Standard-ISO, while the designative Network-Edge-Router identifies the Network-Edge-Router itself, and the designative Data-Lake-Partition identifies the Data-Lake-Partition—each pairing creating a verifiable link between a concrete asset and the framework or system it operates within. This mapping is essential for compliance because it allows a policy that applies to Kubernetes Clusters to be traced to the specific designative roles that manage those clusters, and from there to the lineage edges that describe how data flows through them. The designative Unit-Shift-Log, which identifies the Quality-Control-Log, illustrates how operational processes themselves can be designative entities, carrying their own identifiers, codes, and encoding specifications.

**t_designative_for_specific_role**

| id | designative | identifies | code | encoding |
| --- | --- | --- | --- | --- |
| ROLE-0001 | Sensor-Array-Beta | Calibration-Standard-ISO | D-33 | ascii |
| ROLE-0002 | Unit-Shift-Log | Network-Edge-Router | B-12 | unicode |
| ROLE-0003 | CoreSample-X22 | Data-Lake-Partition | E-21 | unicode |
| ROLE-0004 | Batch-Alpha-99 | Quality-Control-Log | A-01 | ascii |
| ROLE-0005 | CoreSample-X22 | Bioreactor-Module-B | D-33 | latin1 |
| ROLE-0006 | LIDAR-Array-7 | Data-Lake-Partition | C-07 | ascii |
| ROLE-0007 | LIDAR-Array-7 | Quality-Control-Log | D-33 | ascii |
| ROLE-0008 | LIDAR-Array-7 | Geolocation-Map-Grid | A-01 | latin1 |

**t_policy_applies_to**

| id | policy | applies_to | effective_date | label_text |
| --- | --- | --- | --- | --- |
| APPL-0001 | Cloud Security Baseline | API Gateway Endpoints | 2025-01-11 | audit excerpt |
| APPL-0002 | Zero Trust Architecture Guideline | HR Personnel Files | 2023-03-13 | nightly summary |
| APPL-0003 | GDPR Compliance Directive | Kubernetes Clusters | 2024-06-14 | nightly summary |
| APPL-0004 | Data Retention Standard | Customer PII Datasets | 2024-05-03 | pre-release note |
| APPL-0005 | Cloud Security Baseline | Financial Reporting Systems | 2024-11-13 | nightly summary |
| APPL-0006 | Incident Response Procedure | Kubernetes Clusters | 2023-05-19 | change rationale |
| APPL-0007 | Zero Trust Architecture Guideline | Kubernetes Clusters | 2024-07-03 | nightly summary |

The code and encoding fields provide the low-level technical specifications that ensure interoperability and correct interpretation of the designative data. The code D-33 associated with the Sensor-Array-Beta role, the code B-12 for Unit-Shift-Log, the code E-21 for CoreSample-X22, and the code A-01 for Batch-Alpha-99 serve as compact, domain-specific shorthand that can be used in system-to-system communication where full identifiers would be unwieldy. The encoding field—ascii for the Sensor-Array-Beta and Batch-Alpha-99 roles, unicode for the Unit-Shift-Log and CoreSample-X22 roles—specifies the character encoding that must be used when transmitting or storing the designative values, ensuring that the text Sensor-Array-Beta or CoreSample-X22 is rendered correctly across systems that may have different default encodings. This is not a trivial concern; a unicode designative value transmitted with an ascii encoding assumption will produce corrupted data, and the encoding field is the governance mechanism that prevents this failure mode.

The label_text field provides the human-readable context that bridges the gap between machine-enforced governance and human comprehension. An audit excerpt label attached to the Cloud Security Baseline policy signals that this policy application was documented as part of a formal audit process, while a nightly summary label on the Zero Trust Architecture Guideline and GDPR Compliance Directive applications indicates routine, recurring documentation rather than event-driven recording. The pre-release note label on the Data Retention Standard application suggests that the policy application was documented during a development or staging phase, before the policy went into production. These labels do not affect the machine-enforceable aspects of governance—the effective date, the identifier, the unit—but they are essential for human auditors, compliance officers, and data stewards who must understand the provenance and context of each governance relationship. The label_text is the narrative layer that makes the structured data interpretable, and without it, the governance framework would be technically complete but operationally opaque.