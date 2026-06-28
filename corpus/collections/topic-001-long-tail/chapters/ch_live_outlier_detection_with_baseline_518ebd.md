---
chapter_id: ch_live_outlier_detection_with_baseline_518ebd
topic_id: 1
family: 02_observation_measurement
cited_terms: ['outlier_detection_with_baseline', 'patient_insurance_record', 'pci_dss_requirement']
model: engine-refine
---

In governed information systems, an identifier is the durable handle by which an entity is named, audited, and referenced across time and process boundaries. It is not the business fact itself but the stable surrogate that permits reconciliation when labels change, versions diverge, or multiple representations of the same underlying object coexist. In outlier-detection operations, BASE-0001 through BASE-0004 denote distinct baseline observations—network latency jump, log flood, sensor drift—each keyed independently so that subsequent comparisons do not collapse distinct events into a single narrative. In health-insurance administration, RECO-0001 through RECO-0004 perform the same function for patient insurance records, whether the stored value is an enrollment token such as ENROLL-7742, a policy number POL-8821-AX, or demographic surrogates including SSN-4821 and DOB-19850312. In payment-card compliance, REQU-0001 through REQU-0004 anchor PCI framework editions and mapped controls—PCI DSS v3.2 paired with Requirement 10.6, v1.1 with Requirements 2.1 and 1.2, v4.0 with Requirement 3.4—so that attestations, gap analyses, and remediation tickets always resolve to an unambiguous requirement instance rather than to informal prose.

**t_outlier_detection_with_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | network latency jump |
| BASE-0002 | network latency jump |
| BASE-0003 | log flood |
| BASE-0004 | sensor drift |
| BASE-0005 | API error surge |
| BASE-0006 | disk I/O stall |

**t_outlier_detection_with_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | expected distribution |
| BASE-0002 | nominal profile |
| BASE-0003 | seasonal pattern |
| BASE-0004 | seasonal pattern |
| BASE-0005 | statistical baseline |
| BASE-0006 | control group dataset |
| BASE-0007 | seasonal pattern |

**t_pci_dss_requirement**

| id | pci |
| --- | --- |
| REQU-0001 | PCI DSS v3.2 |
| REQU-0002 | PCI DSS v1.1 |
| REQU-0003 | PCI DSS v1.1 |
| REQU-0004 | PCI DSS v4.0 |
| REQU-0005 | PCI DSS v3.0 |
| REQU-0006 | PCI DSS v2.0 |

**t_pci_dss_requirement_pci_dss_requirement**

| id | pci_dss_requirement |
| --- | --- |
| REQU-0001 | Requirement 10.6 |
| REQU-0002 | Requirement 2.1 |
| REQU-0003 | Requirement 1.2 |
| REQU-0004 | Requirement 3.4 |
| REQU-0005 | Requirement 6.5 |
| REQU-0006 | Requirement 11.4 |

A patientinsurancerecord is the governed container for insurance identity and eligibility context attributable to a person or covered party. Its value may take several interoperable forms—enrollment identifier, policy number, government identifier, or date-of-birth surrogate—because operational systems ingest records from heterogeneous sources and must preserve provenance while still supporting matching, billing, and coverage verification. The record is therefore both a compliance object and an operational artifact: it must be retrievable under authorization policy, bounded by retention rules, and traceable to the systems that created or last modified it. Where RECO-0002 carries POL-8821-AX and RECO-0003 carries SSN-4821, the identifier RECO-0002 or RECO-0003 is what auditors cite; the payload distinguishes record type without substituting for the governance key.

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

Insuranceinformationitem names the atomic, typed datum that a patient insurance record may contain or reference—coverage_start_date, provider_npi, deductible_limit, premium_amount—each representing a field with defined semantics, validation constraints, and often regulatory sensitivity. Items are not interchangeable with the record shell: a record may exist before all items are populated, and the same item type may appear across multiple records under different stewardship. Decomposing records into items enables fine-grained access control, data-quality measurement, and lineage reporting, because obligations attach differently to a provider identifier than to a financial limit or a coverage effective date. In practice, governance treats the item as the unit of definition—what it means, who may alter it, how it is masked in exports—while the record remains the unit of subject identity for enrollment and claims context.

**t_patient_insurance_record_contains_data_element**

| id | contains_data_element |
| --- | --- |
| RECO-0001 | coverage_start_date |
| RECO-0002 | provider_npi |
| RECO-0003 | deductible_limit |
| RECO-0004 | premium_amount |
| RECO-0005 | copay_rate |
| RECO-0006 | coverage_start_date |

Subject and target formalize directional relationships between governed entities. The subject is the party or object from which the relationship is asserted—the outlier under review, the patient record in scope, the PCI framework edition under assessment—while the target is the entity to which that subject is linked for comparison, containment, or control mapping. A network latency jump keyed BASE-0001 is evaluated against an expected distribution; a sensor drift at BASE-0004 is measured against a seasonal pattern; a log flood at BASE-0003 is contrasted with a nominal profile. In insurance linkage, patient subjects RECO-0005, RECO-0003, RECO-0008, and RECO-0007 connect to information-item targets RECO-0003, RECO-0006, and RECO-0002, expressing which patient record contains or depends upon which defined element. In PCI DSS alignment, framework subjects REQU-0004, REQU-0005, REQU-0001, and REQU-0002 map to requirement targets REQU-0002, REQU-0005, and REQU-0005, encoding edition-to-control structure without conflating the standard version with the individual requirement clause.

Role qualifies the subject–target binding by stating how the subject participates in the relationship, and thereby determines accountability, permitted action, and evidential weight in review. An observer may witness or monitor without ownership; an owner bears primary responsibility for accuracy, remediation, or attestation; a reviewer exercises independent judgment; a contributor supplies or maintains data under delegated authority. In baseline governance, BASE-0001’s linkage to BASE-0005 carries role observer, BASE-0001 to BASE-0004 carries owner, and BASE-0004 to BASE-0002 carries reviewer—so the same outlier identifier can appear in multiple relational rows with different duties. Patient-insurance rows assign contributor to RECO-0005 and RECO-0003, owner to RECO-0008, and observer to RECO-0007, separating those who populate deductible_limit or provider_npi from those accountable for the record and those with read-only oversight. PCI mappings likewise distribute contributor, observer, and owner across REQU-0004→REQU-0002 and REQU-0001→REQU-0005, ensuring that control ownership under Requirement 3.4 or Requirement 10.6 is explicit rather than inferred from org charts.

**t_outlier_detection_with_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | observer |
| BASE-0002 | BASE-0001 | BASE-0004 | owner |
| BASE-0003 | BASE-0004 | BASE-0002 | reviewer |
| BASE-0004 | BASE-0003 | BASE-0002 | observer |
| BASE-0005 | BASE-0004 | BASE-0007 | observer |
| BASE-0006 | BASE-0005 | BASE-0003 | observer |
| BASE-0007 | BASE-0006 | BASE-0006 | owner |
| BASE-0008 | BASE-0001 | BASE-0003 | reviewer |

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

**t_pci_dss_requirement__pci_dss_requirement**

| id | pci_id | pci_dss_requirement_id | role |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0004 | REQU-0002 | contributor |
| REQU-0002 | REQU-0005 | REQU-0005 | observer |
| REQU-0003 | REQU-0001 | REQU-0005 | owner |
| REQU-0004 | REQU-0002 | REQU-0005 | observer |
| REQU-0005 | REQU-0003 | REQU-0004 | owner |
| REQU-0006 | REQU-0003 | REQU-0002 | owner |
| REQU-0007 | REQU-0006 | REQU-0003 | owner |
| REQU-0008 | REQU-0006 | REQU-0002 | owner |

Taken together, identifier, record, information item, subject, target, and role constitute the minimum vocabulary for evidence-anchored governance: every audit trail, access decision, and exception workflow should resolve to a keyed entity, a typed constituent where applicable, a directed association, and a named participation mode. Operational teams use identifiers to correlate anomalies across monitoring cycles; privacy and security officers use items and roles to enforce least privilege on provider_npi versus premium_amount; compliance officers use subject–target maps to prove that PCI DSS v4.0 is tied to Requirement 3.4 through an owner-attributed edge rather than through informal spreadsheet notation. When these primitives are maintained consistently, cross-domain inquiries—whether a seasonal-pattern deviation, a policy-number record, or a DSS requirement mapping—remain composable, defensible, and portable across handbook procedures, control matrices, and incident records without re-deriving meaning from ad hoc labels.