---
chapter_id: ch_live_patient_insurance_record_8a984d
topic_id: 11
family: 08_derived
cited_terms: ['patient_insurance_record', 'lineage_describes_transformation', 'requirement_equiv_specifies_target']
model: engine-refine
---

Within health information systems, the patient insurance record serves as the primary entity through which coverage metadata is organized and traced. Each record carries a unique identifier—RECO-0001 through RECO-0004—that anchors it to a discrete enrollment or policy instance, while the associated record value encodes the actual coverage artifact, whether an enrollment number such as ENROLL-7742, a policy designation like POL-8821-AX, or a structured attribute such as SSN-4821 or DOB-19850312. These identifiers are not merely labels; they function as the stable keys that permit cross-referencing across the insurance data model, ensuring that downstream consumers—whether claims processors, audit engines, or compliance monitors—can resolve a single logical record regardless of which subsystem generated it. The insurance information item, represented by data elements such as coverage_start_date, provider_npi, deductible_limit, and premium_amount, constitutes the granular content attached to each record. Rather than embedding these elements directly within the patient insurance record, the model preserves them as discrete items linked through a relationship table, thereby supporting flexible composition and avoiding the structural rigidity of a monolithic schema.

**t_patient_insurance_record**

| id | patient_insurance_record |
| --- | --- |
| RECO-0001 | ENROLL-7742 |
| RECO-0002 | POL-8821-AX |
| RECO-0003 | SSN-4821 |
| RECO-0004 | DOB-19850312 |
| RECO-0005 | MRN-4829103 |
| RECO-0006 | SSN-4821 |
| RECO-0007 | POL-8821-AX |
| RECO-0008 | ENROLL-7742 |

**t_patient_insurance_record_contains_data_element**

| id | contains_data_element |
| --- | --- |
| RECO-0001 | coverage_start_date |
| RECO-0002 | provider_npi |
| RECO-0003 | deductible_limit |
| RECO-0004 | premium_amount |
| RECO-0005 | copay_rate |
| RECO-0006 | coverage_start_date |

The relationship between a patient and an insurance data element is mediated by a junction construct that captures not only the structural linkage but also the semantic role assumed by each party in the association. A patient identifier—RECO-0005, RECO-0003, RECO-0008, RECO-0007—appears as the subject of the relationship, while the data element identifier—RECO-0003, RECO-0006, RECO-0002—serves as the target. The role column distinguishes whether the patient acts as contributor, owner, or observer in the context of that particular data element, a distinction that carries operational weight: an owner bears responsibility for the accuracy of the element, a contributor supplies it, and an observer consumes it without modification. This tripartite role taxonomy ensures that data provenance is not merely recorded but qualified, enabling downstream governance policies to enforce different access controls, update permissions, and audit requirements depending on the role assumed.

**t_patient_insurance_record__contains_data_element**

| id | patient_id | contains_data_element_id | role |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0005 | RECO-0003 | contributor |
| RECO-0002 | RECO-0003 | RECO-0006 | contributor |
| RECO-0003 | RECO-0008 | RECO-0006 | owner |
| RECO-0004 | RECO-0007 | RECO-0002 | observer |
| RECO-0005 | RECO-0001 | RECO-0002 | owner |
| RECO-0006 | RECO-0005 | RECO-0002 | observer |
| RECO-0007 | RECO-0003 | RECO-0002 | contributor |
| RECO-0008 | RECO-0008 | RECO-0001 | owner |

Data lineage tracking introduces a parallel dimension of accountability, one that quantifies the reliability of each recorded fact through confidence and uncertainty metrics. The lineage fact table assigns a confidence score—ranging from 0.071 for TRAN-0002 to 0.779 for TRAN-0004—to each lineage event, providing a normalized measure of how certain the system is that the recorded transformation or data movement actually occurred as described. The corresponding uncertainty value, expressed in absolute terms such as 612.22, 133.03, 76.69, or 708.23, offers a complementary perspective: where confidence is a relative probability, uncertainty is an absolute deviation that can be compared directly against operational thresholds. The misc column captures the raw measured value associated with the lineage event—903.86, 832.18, 862.00, 259.55—allowing auditors to reconcile the abstract confidence and uncertainty scores against the concrete data that was transformed. The lineage dimension table provides the human-readable label and category for each lineage key, with entries such as Lineage Label 01 mapped to Lineage Category 01, ensuring that the machine-readable identifiers can be translated into terms meaningful to compliance reviewers and data stewards.

**fact_lineage**

| id | lineage_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| TRAN-0001 | TRAN-0001 | 0.645 | 612.22 | 903.86 |
| TRAN-0002 | TRAN-0003 | 0.071 | 133.03 | 832.18 |
| TRAN-0003 | TRAN-0005 | 0.404 | 76.69 | 862.00 |
| TRAN-0004 | TRAN-0003 | 0.779 | 708.23 | 259.55 |
| TRAN-0005 | TRAN-0003 | 0.376 | 801.99 | 986.33 |
| TRAN-0006 | TRAN-0008 | 0.744 | 956.79 | 34.40 |

**dim_lineage**

| id | lineage_label | lineage_category |
| --- | --- | --- |
| TRAN-0001 | Lineage Label 01 | Lineage Category 01 |
| TRAN-0002 | Lineage Label 02 | Lineage Category 02 |
| TRAN-0003 | Lineage Label 03 | Lineage Category 03 |
| TRAN-0004 | Lineage Label 04 | Lineage Category 04 |
| TRAN-0005 | Lineage Label 05 | Lineage Category 05 |
| TRAN-0006 | Lineage Label 06 | Lineage Category 06 |
| TRAN-0007 | Lineage Label 07 | Lineage Category 07 |
| TRAN-0008 | Lineage Label 08 | Lineage Category 08 |

Requirement specification follows a similar relational pattern, where the requirement itself—LatencyThreshold, DataLineageTrace, AuditLogFormat—acts as the subject and the specification it references—KafkaProtocol, GDPRArticle, JSONSchema—serves as the target. The relationship between them is again qualified by role, with entries distinguishing reviewer, owner, and contributor positions. A requirement such as DataLineageTrace may be specified by GDPRArticle with the specification acting as owner, while LatencyThreshold may reference KafkaProtocol with the specification in a contributor role. This role-based qualification of the requirement-to-specification linkage ensures that the mapping is not treated as a flat equivalence but as a structured assertion with assigned accountability. The applies_to dimension extends this model further, linking requirements to operational targets such as CloudStorage, EUDataCenter, or DataLake, and the junction table governing this linkage introduces the cardinality note—Cardinality Note 01 through Cardinality Note 04—as an additional qualifier. The cardinality note constrains the multiplicity of the relationship, indicating whether a requirement applies to a target in a one-to-one, one-to-many, or many-to-many fashion, and the role column again distinguishes contributor, observer, and reviewer positions within that constrained relationship. Together, these constructs form a governance framework in which every data element, every lineage event, and every compliance requirement is anchored to a stable identifier, qualified by a role, and bounded by cardinality constraints that together ensure traceability, accountability, and auditability across the entire information ecosystem.

**t_requirement_equiv_specifies_target**

| id | requirement |
| --- | --- |
| TARG-0001 | LatencyThreshold |
| TARG-0002 | DataLineageTrace |
| TARG-0003 | LatencyThreshold |
| TARG-0004 | AuditLogFormat |
| TARG-0005 | TelemetrySamplingRate |
| TARG-0006 | LatencyThreshold |

**t_requirement_equiv_specifies_target_specifies**

| id | specifies |
| --- | --- |
| TARG-0001 | KafkaProtocol |
| TARG-0002 | GDPRArticle |
| TARG-0003 | KafkaProtocol |
| TARG-0004 | JSONSchema |
| TARG-0005 | JSONSchema |
| TARG-0006 | OpenTelemetry |
| TARG-0007 | JSONSchema |

**t_requirement_equiv_specifies_target__specifies**

| id | requirement_id | specifies_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0004 | TARG-0002 | reviewer |
| TARG-0002 | TARG-0002 | TARG-0002 | owner |
| TARG-0003 | TARG-0004 | TARG-0007 | contributor |
| TARG-0004 | TARG-0002 | TARG-0004 | owner |
| TARG-0005 | TARG-0002 | TARG-0004 | observer |
| TARG-0006 | TARG-0006 | TARG-0007 | contributor |
| TARG-0007 | TARG-0005 | TARG-0006 | reviewer |
| TARG-0008 | TARG-0001 | TARG-0007 | reviewer |

**t_requirement_equiv_specifies_target_applies_to**

| id | applies_to |
| --- | --- |
| TARG-0001 | CloudStorage |
| TARG-0002 | EUDataCenter |
| TARG-0003 | DataLake |
| TARG-0004 | DataLake |
| TARG-0005 | EUDataCenter |
| TARG-0006 | CustomerTable |

**t_requirement_equiv_specifies_target__applies_to**

| id | requirement_id | applies_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TARG-0001 | TARG-0001 | TARG-0001 | contributor | Cardinality Note 01 |
| TARG-0002 | TARG-0005 | TARG-0002 | contributor | Cardinality Note 02 |
| TARG-0003 | TARG-0006 | TARG-0003 | observer | Cardinality Note 03 |
| TARG-0004 | TARG-0002 | TARG-0004 | reviewer | Cardinality Note 04 |
| TARG-0005 | TARG-0001 | TARG-0006 | reviewer | Cardinality Note 05 |
| TARG-0006 | TARG-0004 | TARG-0003 | observer | Cardinality Note 06 |
| TARG-0007 | TARG-0003 | TARG-0001 | observer | Cardinality Note 07 |
| TARG-0008 | TARG-0005 | TARG-0002 | reviewer | Cardinality Note 08 |