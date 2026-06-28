---
chapter_id: ch_live_measurement_with_unit_7408b6
topic_id: 125
family: 02_observation_measurement
cited_terms: ['measurement_with_unit', 'quantum_cyber_security_field', 'functional_dependency_lhs']
model: engine-refine
---

In quantum cybersecurity governance, the domain is structured around specialized fields of inquiry and the communication security aspects they address. Quantum cybersecurity fields such as Quantum Secure Direct Communication, Measurement-Device-Independent QKD, and Post-Quantum Cryptography represent distinct research and operational domains, each of which intersects with specific communication security aspects including Emitter Calibration Drift, Channel Eavesdropping Detection, and Quantum Memory Coherence. The relationship between a quantum cybersecurity field and a communication security aspect is not merely associative; it is mediated by a role that defines the nature of the linkage. A field may serve as the owner of a particular aspect, acting as its primary domain of responsibility, or it may function as a contributor, indicating a secondary or supporting relationship. For instance, the field identified as FIEL-0001 appears in multiple associations—both as an owner and as a contributor—demonstrating that a single quantum cybersecurity field can occupy different relational positions across distinct communication security aspects.

**t_quantum_cyber_security_field_studies_domain_aspect**

| id | studies_domain_aspect |
| --- | --- |
| FIEL-0001 | Emitter Calibration Drift |
| FIEL-0002 | Channel Eavesdropping Detection |
| FIEL-0003 | Quantum Memory Coherence |
| FIEL-0004 | Channel Eavesdropping Detection |
| FIEL-0005 | Protocol Authentication Tokens |
| FIEL-0006 | Network Topology Integrity |

The relational architecture that binds these entities together relies on a consistent pattern of subject, target, and role. In the junction tables that connect quantum cybersecurity fields to communication security aspects, the subject column identifies the originating entity—the quantum cybersecurity field itself—while the target column identifies the destination entity, namely the communication security aspect being addressed. The role column then qualifies the nature of this connection, with values such as owner and contributor specifying whether the field has primary or secondary responsibility for the aspect. This same structural pattern appears in the measurement domain, where measurement entities are linked to unit entities through a junction table that similarly uses subject, target, and role columns. In that context, a measurement such as Network latency may be associated with a unit like milliseconds through a reviewer role, indicating that the measurement is subject to review by or in relation to that unit of measure.

**t_measurement_with_unit__unit**

| id | measurement_id | unit_id | role |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0004 | UNIT-0001 | owner |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | reviewer |
| UNIT-0003 | UNIT-0008 | UNIT-0005 | observer |
| UNIT-0004 | UNIT-0005 | UNIT-0006 | reviewer |
| UNIT-0005 | UNIT-0007 | UNIT-0003 | contributor |
| UNIT-0006 | UNIT-0003 | UNIT-0002 | contributor |
| UNIT-0007 | UNIT-0005 | UNIT-0006 | contributor |
| UNIT-0008 | UNIT-0006 | UNIT-0004 | contributor |

**t_quantum_cyber_security_field__studies_domain_aspect**

| id | quantum_id | studies_domain_aspect_id | role |
| --- | --- | --- | --- |
| FIEL-0001 | FIEL-0003 | FIEL-0001 | contributor |
| FIEL-0002 | FIEL-0005 | FIEL-0003 | contributor |
| FIEL-0003 | FIEL-0001 | FIEL-0001 | contributor |
| FIEL-0004 | FIEL-0001 | FIEL-0001 | owner |
| FIEL-0005 | FIEL-0003 | FIEL-0006 | owner |
| FIEL-0006 | FIEL-0001 | FIEL-0005 | contributor |
| FIEL-0007 | FIEL-0002 | FIEL-0004 | contributor |
| FIEL-0008 | FIEL-0004 | FIEL-0004 | reviewer |

The identifier serves as the unique key that anchors every entity and relationship within this framework. Whether identifying a measurement such as Blood pressure, a quantum cybersecurity field such as Post-Quantum Cryptography, or a functional left-hand-side dimension entry, each entity is assigned a stable identifier—UNIT-0001, FIEL-0003, LHS-0001—that enables unambiguous reference across the entire data model. These identifiers are not merely labels; they are the connective tissue that allows foreign-key relationships to be established and traversed. In the junction table linking measurements to units, the measurement_id column references the identifier of a measurement entity, while the unit_id column references the identifier of a unit entity, creating a many-to-many relationship that can be resolved through the junction table's own identifier.

**t_measurement_with_unit**

| id | measurement |
| --- | --- |
| UNIT-0001 | Blood pressure |
| UNIT-0002 | Ozone concentration |
| UNIT-0003 | Seismic magnitude |
| UNIT-0004 | Network latency |
| UNIT-0005 | Network latency |
| UNIT-0006 | Battery voltage |
| UNIT-0007 | Network latency |
| UNIT-0008 | Blood pressure |

**t_measurement_with_unit_unit**

| id | unit |
| --- | --- |
| UNIT-0001 | milligrams per deciliter |
| UNIT-0002 | Richter scale |
| UNIT-0003 | milliseconds |
| UNIT-0004 | beats per minute |
| UNIT-0005 | milligrams per deciliter |
| UNIT-0006 | beats per minute |

**t_quantum_cyber_security_field**

| id | quantum_cyber_security_field |
| --- | --- |
| FIEL-0001 | Quantum Secure Direct Communication |
| FIEL-0002 | Measurement-Device-Independent QKD |
| FIEL-0003 | Post-Quantum Cryptography |
| FIEL-0004 | Post-Quantum Cryptography |
| FIEL-0005 | Quantum Digital Signatures |
| FIEL-0006 | Quantum Key Distribution |

At the analytical core of this framework lies the functional fact table, which records quantitative observations against a dimension of functional left-hand-side entities. Each fact entry carries a confidence value—a decimal between zero and one that expresses the degree of certainty in the measurement—and an uncertainty value that quantifies the margin of error in absolute terms. For example, a fact entry with identifier LHS-0004 records a value of 896.76 with a confidence of 0.950 and an uncertainty of 187.13, indicating a high-confidence observation with a relatively narrow error band. By contrast, entry LHS-0003 records a value of 139.46 with a confidence of only 0.117 and an uncertainty of 994.01, reflecting a low-confidence measurement with substantial error. These confidence and uncertainty values are essential for risk assessment and decision-making, as they allow operators to distinguish between well-substantiated findings and those that require further validation.

**fact_functional**

| id | f_d_left_hand_side_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| LHS-0001 | LHS-0006 | 0.516 | 249.67 | 163.64 |
| LHS-0002 | LHS-0002 | 0.130 | 197.20 | 234.79 |
| LHS-0003 | LHS-0006 | 0.117 | 994.01 | 139.46 |
| LHS-0004 | LHS-0001 | 0.950 | 187.13 | 896.76 |
| LHS-0005 | LHS-0003 | 0.902 | 938.45 | 27.14 |
| LHS-0006 | LHS-0002 | 0.388 | 256.27 | 476.93 |
| LHS-0007 | LHS-0001 | 0.665 | 479.74 | 169.53 |

The functional left-hand-side dimension provides the categorical context for these observations, organizing entries by label and category. Each dimension member—such as F D Left Hand Side Label 01 or F D Left Hand Side Label 02—belongs to a category like F D Left Hand Side Category 01 or F D Left Hand Side Category 02, and the fact table references these dimension members through the f_d_left_hand_side_key column. This categorical structure enables aggregation and filtering of observations by domain, allowing analysts to compare confidence and uncertainty levels across different categories of functional left-hand-side activity. The misc column in the fact table captures the raw measured value, completing the record with the quantitative observation that the confidence and uncertainty values qualify. Together, these elements form a coherent framework for tracking, evaluating, and acting upon measurements within the quantum cybersecurity domain.

**dim_f_d_left_hand_side**

| id | f_d_left_hand_side_label | f_d_left_hand_side_category |
| --- | --- | --- |
| LHS-0001 | F D Left Hand Side Label 01 | F D Left Hand Side Category 01 |
| LHS-0002 | F D Left Hand Side Label 02 | F D Left Hand Side Category 02 |
| LHS-0003 | F D Left Hand Side Label 03 | F D Left Hand Side Category 03 |
| LHS-0004 | F D Left Hand Side Label 04 | F D Left Hand Side Category 04 |
| LHS-0005 | F D Left Hand Side Label 05 | F D Left Hand Side Category 05 |
| LHS-0006 | F D Left Hand Side Label 06 | F D Left Hand Side Category 06 |