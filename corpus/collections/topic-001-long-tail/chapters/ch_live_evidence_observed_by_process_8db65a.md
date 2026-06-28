---
chapter_id: ch_live_evidence_observed_by_process_8db65a
topic_id: 1
family: 06_belief_structure
cited_terms: ['evidence_observed_by_process', 'identifier_subclass', 'control_only_addresses_threat_class']
model: engine-refine
---

The governance of technical evidence and control implementation rests upon a disciplined taxonomy of identifiers, attributes, and their typed values, each serving as a structural anchor for compliance documentation. Identifiers such as HANDLE-1234/5678, SEQ-NF2024, SN-8842XJ, and ACCN-GSM7829104 function as the primary keys through which threat classes are referenced and controlled; each identifier maps to one or more threat class designations—THRE-0002, THRE-0008, THRE-0003, THRE-0004—establishing a chain of traceability from the asset or record to the risk it faces. This mapping is not merely nominal: the identifier subclass table encodes the structural properties of these identifiers through attribute definitions such as checksum_algo, code, format, and issued_date, each bound to a precise schema type—xsd:string for textual properties like checksum_algo and code, and xsd:date for temporal properties like issued_date, whose concrete values span from 2023-11-13 through 2025-05-27, reflecting a multi-year lifecycle of identifier issuance and renewal.

**t_identifier_subclass**

| id | identifier | identifies |
| --- | --- | --- |
| IDEN-0001 | HANDLE-1234/5678 | THRE-0002 |
| IDEN-0002 | SEQ-NF2024 | THRE-0008 |
| IDEN-0003 | SN-8842XJ | THRE-0003 |
| IDEN-0004 | ACCN-GSM7829104 | THRE-0004 |
| IDEN-0005 | RUN-20231105 | THRE-0001 |
| IDEN-0006 | GUID-f47ac10b | THRE-0003 |
| IDEN-0007 | DOI-10.1234/abc | THRE-0005 |

**t_identifier_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| IDEN-0001 | checksum_algo | xsd:string |
| IDEN-0002 | code | xsd:string |
| IDEN-0003 | format | xsd:string |
| IDEN-0004 | issued_date | xsd:date |
| IDEN-0005 | namespace | xsd:string |
| IDEN-0006 | encoding | xsd:string |
| IDEN-0007 | label_text | xsd:string |
| IDEN-0008 | language | xsd:string |

**t_identifier_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0004 | 2023-11-13 |
| IDEN-0002 | IDEN-0002 | IDEN-0004 | 2024-05-25 |
| IDEN-0003 | IDEN-0003 | IDEN-0004 | 2024-09-11 |
| IDEN-0004 | IDEN-0004 | IDEN-0004 | 2025-05-27 |
| IDEN-0005 | IDEN-0005 | IDEN-0004 | 2023-08-09 |
| IDEN-0006 | IDEN-0006 | IDEN-0004 | 2023-03-27 |
| IDEN-0007 | IDEN-0007 | IDEN-0004 | 2023-01-25 |

The attribute-value relationship is materialized through a type-dispatched storage pattern that separates values by their semantic domain. String-valued attributes—such as the code B-12, the format designation JSON, and the checksum algorithm label Checksum Algo 01—are persisted in the varchar value table, while date-valued attributes occupy their own dedicated table, ensuring type safety at the storage layer. This separation is not an implementation artifact but a governance principle: it enforces that the issued_date of an identifier, for instance, is always validated as a date rather than conflated with free-form text, and that the code attribute, which may carry alphanumeric significance, is never subjected to date-parsing logic. The entity_id column in both value tables serves as the foreign key binding a specific attribute value back to its parent identifier, creating a many-to-one relationship where a single identifier like IDEN-0001 can carry multiple attribute values—Checksum Algo 01, B-12, Encoding 03, and JSON—each independently versioned and queryable.

**t_identifier_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| IDEN-0001 | IDEN-0001 | IDEN-0001 | Checksum Algo 01 |
| IDEN-0002 | IDEN-0001 | IDEN-0002 | B-12 |
| IDEN-0003 | IDEN-0001 | IDEN-0006 | Encoding 03 |
| IDEN-0004 | IDEN-0001 | IDEN-0003 | JSON |
| IDEN-0005 | IDEN-0001 | IDEN-0007 | pre-release note |
| IDEN-0006 | IDEN-0001 | IDEN-0008 | es |
| IDEN-0007 | IDEN-0001 | IDEN-0005 | Namespace 07 |
| IDEN-0008 | IDEN-0002 | IDEN-0001 | Checksum Algo 08 |

Control mechanisms are modeled through an analogous but distinct attribute-value architecture, where controls such as Multi-Factor Authentication, Incident Response Plan, and Access Review Policy are defined not only by their names but by a rich set of typed properties. The control attribute schema includes effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer), each capturing a different dimension of the control's operational character. Boolean enforcement flags—true for THRE-0001 and THRE-0004, false for THRE-0002 and THRE-0003—encode whether a control is actively enforced, while integer priority values ranging from 5 to 926 establish a relative ordering of control importance. Date values such as 2024-12-09, 2024-12-21, 2025-01-04, and 2023-01-13 anchor controls to their effective dates, and string values like Encoding 01, Enforcement 02, and change rationale provide additional contextual metadata. The control-to-threat mapping is explicit: the Incident Response Plan (THRE-0002 and THRE-0003) addresses threat class IDEN-0004, while the Access Review Policy (THRE-0004) addresses IDEN-0001, creating a direct linkage between the control's attributes and the risk it mitigates.

**t_control_only_addresses_threat_class**

| id | control | addresses_risk |
| --- | --- | --- |
| THRE-0001 | Multi-Factor Authentication | IDEN-0005 |
| THRE-0002 | Incident Response Plan | IDEN-0004 |
| THRE-0003 | Incident Response Plan | IDEN-0004 |
| THRE-0004 | Access Review Policy | IDEN-0001 |
| THRE-0005 | Backup Retention Schedule | IDEN-0004 |
| THRE-0006 | Backup Retention Schedule | IDEN-0002 |
| THRE-0007 | Access Review Policy | IDEN-0005 |
| THRE-0008 | Incident Response Plan | IDEN-0002 |

**t_control_only_addresses_threat_class_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| THRE-0001 | effective_date | xsd:date |
| THRE-0002 | enforcement | xsd:string |
| THRE-0003 | mandatory | xsd:boolean |
| THRE-0004 | priority | xsd:integer |
| THRE-0005 | review_cycle_days | xsd:integer |
| THRE-0006 | scope | xsd:string |
| THRE-0007 | encoding | xsd:string |
| THRE-0008 | label_text | xsd:string |

**t_control_only_addresses_threat_class_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0003 | true |
| THRE-0002 | THRE-0002 | THRE-0003 | false |
| THRE-0003 | THRE-0003 | THRE-0003 | false |
| THRE-0004 | THRE-0004 | THRE-0003 | true |
| THRE-0005 | THRE-0005 | THRE-0003 | true |
| THRE-0006 | THRE-0006 | THRE-0003 | false |
| THRE-0007 | THRE-0007 | THRE-0003 | true |
| THRE-0008 | THRE-0008 | THRE-0003 | true |

**t_control_only_addresses_threat_class_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0001 | 2024-12-09 |
| THRE-0002 | THRE-0002 | THRE-0001 | 2024-12-21 |
| THRE-0003 | THRE-0003 | THRE-0001 | 2025-01-04 |
| THRE-0004 | THRE-0004 | THRE-0001 | 2023-01-13 |
| THRE-0005 | THRE-0005 | THRE-0001 | 2023-09-02 |
| THRE-0006 | THRE-0006 | THRE-0001 | 2023-12-08 |
| THRE-0007 | THRE-0007 | THRE-0001 | 2025-01-04 |
| THRE-0008 | THRE-0008 | THRE-0001 | 2024-03-28 |

**t_control_only_addresses_threat_class_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0004 | 5 |
| THRE-0002 | THRE-0001 | THRE-0005 | 99 |
| THRE-0003 | THRE-0002 | THRE-0004 | 5 |
| THRE-0004 | THRE-0002 | THRE-0005 | 926 |
| THRE-0005 | THRE-0003 | THRE-0004 | 1 |
| THRE-0006 | THRE-0003 | THRE-0005 | 740 |
| THRE-0007 | THRE-0004 | THRE-0004 | 4 |
| THRE-0008 | THRE-0004 | THRE-0005 | 301 |

**t_control_only_addresses_threat_class_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| THRE-0001 | THRE-0001 | THRE-0007 | Encoding 01 |
| THRE-0002 | THRE-0001 | THRE-0002 | Enforcement 02 |
| THRE-0003 | THRE-0001 | THRE-0008 | change rationale |
| THRE-0004 | THRE-0001 | THRE-0009 | fr |
| THRE-0005 | THRE-0001 | THRE-0006 | Scope 05 |
| THRE-0006 | THRE-0002 | THRE-0007 | Encoding 06 |
| THRE-0007 | THRE-0002 | THRE-0002 | Enforcement 07 |
| THRE-0008 | THRE-0002 | THRE-0008 | nightly summary |

Evidence observation completes the governance triad by recording the empirical data that supports or refutes control effectiveness. The evidence table captures observations such as voltage_dip_trace, ph_sensor_record, and vibration_anomaly_log, each associated with a process identifier (PROC-0001 through PROC-0004) and a numeric measurement value—573.25, 273.64, 199.51, 512.26—that quantifies the observed phenomenon. The language column, carrying values en, es, de, and fr, indicates the linguistic context of the evidence record, which is critical in multinational compliance environments where evidence must be auditable across jurisdictions. This language attribute, though simple in type, carries significant governance weight: it ensures that evidence can be matched to the appropriate linguistic corpus during review, and that controls documented in one language can be cross-referenced against evidence captured in another. The evidence-process linkage is itself a foreign key relationship, binding raw observational data to the procedural context in which it was collected, thereby closing the loop between control design, threat identification, and empirical verification.

**t_evidence_observed_by_process**

| id | evidence | value | language |
| --- | --- | --- | --- |
| PROC-0001 | voltage_dip_trace | 573.25 | en |
| PROC-0002 | ph_sensor_record | 273.64 | es |
| PROC-0003 | vibration_anomaly_log | 199.51 | de |
| PROC-0004 | ph_sensor_record | 512.26 | fr |
| PROC-0005 | voltage_dip_trace | 950.53 | es |