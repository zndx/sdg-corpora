---
chapter_id: ch_live_artifact_with_role_f72aee
topic_id: 2
family: 01_foundation
cited_terms: ['artifact_with_role', 'constraint_evaluated_during', 'ice_about_artifact']
model: engine-refine
---

Identifiers establish the durable referential spine across compliance and governance records, permitting every downstream assertion—whether it concerns a constraint evaluation window, an artifact role assignment, or an integrity certificate—to be traced to a single, unambiguous key without conflating distinct objects that share superficial similarity. A role binding such as ROLE-0001 is not merely a row label; it is the anchor that connects a named artifact instance to the evaluation context in which governing rules were applied, and the same identifier discipline extends to duration-scoped constraint records (DURI-0001 through DURI-0004) and artifact integrity certificates (ARTI-0001 through ARTI-0004). Because identifiers are stable across typed value stores and cross-reference tables, auditors can reconstruct provenance chains—e.g., determining that DURI-0001’s Field Length Constraint was evaluated during ROLE-0006—without relying on human-readable names that may change, collide, or be reused across environments.

**t_constraint_evaluated_during**

| id | constraint | evaluated_during |
| --- | --- | --- |
| DURI-0001 | Field Length Constraint | ROLE-0006 |
| DURI-0002 | Data Retention Policy | ROLE-0004 |
| DURI-0003 | Audit Log Requirement | ROLE-0002 |
| DURI-0004 | Null Value Limit | ROLE-0006 |
| DURI-0005 | Data Retention Policy | ROLE-0001 |
| DURI-0006 | Data Retention Policy | ROLE-0001 |

**t_constraint_evaluated_during_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DURI-0001 | effective_date | xsd:date |
| DURI-0002 | enforcement | xsd:string |
| DURI-0003 | mandatory | xsd:boolean |
| DURI-0004 | priority | xsd:integer |
| DURI-0005 | review_cycle_days | xsd:integer |
| DURI-0006 | scope | xsd:string |
| DURI-0007 | encoding | xsd:string |
| DURI-0008 | label_text | xsd:string |

**t_ice_about_artifact**

| id | ice |
| --- | --- |
| ARTI-0001 | Compliance-Audit-Log |
| ARTI-0002 | Supply-Chain-Declaration |
| ARTI-0003 | Calibration-Certificate-2024 |
| ARTI-0004 | Calibration-Certificate-2024 |
| ARTI-0005 | Design-Specification-Draft |
| ARTI-0006 | Validation-Protocol-7B |

The entity concept names the governed object to which attribute values attach, and in practice entity identifiers function as the foreign-key glue between a canonical record and its decomposed property values. When mandatory is recorded as false for DURI-0001, DURI-0002, and DURI-0003 but true for DURI-0004, each assertion is keyed by entity_id pointing at the corresponding DURI record, not at the attribute definition itself; similarly, encoding values for ARTI-0001 and ARTI-0002 are stored against entity_id ARTI-0001 and ARTI-0002 respectively, preserving a one-to-many relationship between an integrity certificate and its typed literals. This separation matters because entities carry identity and lifecycle semantics—what is being constrained or described—while attrs carry the semantic dimension of what is being said about that entity.

**t_ice_about_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | encoding | xsd:string |
| ARTI-0002 | label_text | xsd:string |
| ARTI-0003 | language | xsd:string |

Attrs and attr_type jointly define the governed property namespace and the validation contract under which values may be admitted into the record. Attribute names such as effective_date, enforcement, mandatory, and priority describe the compliance-facing semantics of a constraint evaluation record, while attr_type declarations (xsd:date, xsd:string, xsd:boolean, xsd:integer) route each name to the appropriate physical representation and parser. The same pattern appears on artifact integrity certificates, where encoding, label_text, and language are all declared as xsd:string, signaling that their values belong in a varchar-valued store even when the underlying meaning differs—calibration metadata versus locale designation. Attr_type is therefore not decorative metadata; it is the enforcement gate that prevents category errors, such as storing a boolean mandatory flag in a date column or treating a priority integer as free text.

The misc designation captures the stored literal—the evidentiary payload—once entity, attr, and attr_type have resolved where and how it may live. Effective dates ranging from 2023-03-04 through 2025-03-02 illustrate temporal scoping of otherwise identically named attributes across distinct DURI entities; integer misc values such as 2, 590, and 52 show that the same attr_id may participate in different entity contexts with unrelated magnitudes; varchar misc entries including "Enforcement 02," "pre-release note," and "es" demonstrate that string-typed governance data spans both normative enforcement labels and documentary annotations. Boolean misc values consolidate binary compliance posture—here, mandatory=false for three constraints and mandatory=true for the Null Value Limit—into a representation that supports automated policy engines without ambiguous lexical interpretation.

Checksum and sizebytes address a complementary class of assurance: content integrity and operational scale for artifacts that participate in role-bound processing. The patient-cohorts-2023 artifact appears twice under distinct role bindings (ROLE-0001 and ROLE-0002) with different checksums (5e8f3c91 versus 7b14de08) and materially different size_bytes (666903238 versus 309925726), indicating that the same logical artifact name can denote distinct physical payloads across evaluation contexts and that integrity verification must be role-specific rather than name-based. Feature-store-cache exhibits a similar pattern across DURI-0003 and DURI-0001 assignments, with checksums a3f9c21e and 9d2b7a16 and sizes 29914871 and 347040623 respectively. In operational practice, checksums support tamper detection and reproducibility proofs during audits, while size_bytes supports capacity planning, transfer-window analysis, and anomaly detection when an artifact’s byte footprint shifts without a corresponding checksum rotation.

Taken together, these constructs implement a typed, referentially intact compliance graph in which identifiers stabilize identity, entities localize assertions, attrs and attr_types govern semantic and syntactic validity, misc carries the adjudicated facts, and checksum with sizebytes ground artifact claims in measurable physical reality. An auditor reviewing ARTI-0003 and ARTI-0004—both Calibration-Certificate-2024 ICE records—can still distinguish them by identifier while comparing encoding literals ("Encoding 01" versus "Encoding 04") and cross-walking to the constraint evaluations that fired during ROLE-0002 and ROLE-0004 for Data Retention Policy and Audit Log Requirement. The architecture rewards this discipline: governance rules remain machine-checkable, human-auditable, and resistant to silent drift, because every material statement is typed, keyed, and—where bytes are at stake—cryptographically and quantitatively anchored.

**t_artifact_with_role**

| id | artifact | role | checksum | size_bytes |
| --- | --- | --- | --- | --- |
| ROLE-0001 | patient-cohorts-2023 | DURI-0001 | 5e8f3c91 | 666903238 |
| ROLE-0002 | patient-cohorts-2023 | DURI-0004 | 7b14de08 | 309925726 |
| ROLE-0003 | feature-store-cache | DURI-0003 | a3f9c21e | 29914871 |
| ROLE-0004 | feature-store-cache | DURI-0001 | 9d2b7a16 | 347040623 |
| ROLE-0005 | raw-exports-batch-9 | DURI-0003 | c0ffee42 | 485402723 |
| ROLE-0006 | patient-cohorts-2023 | DURI-0005 | 5e8f3c91 | 504986609 |

**t_constraint_evaluated_during_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0003 | false |
| DURI-0002 | DURI-0002 | DURI-0003 | false |
| DURI-0003 | DURI-0003 | DURI-0003 | false |
| DURI-0004 | DURI-0004 | DURI-0003 | true |
| DURI-0005 | DURI-0005 | DURI-0003 | true |
| DURI-0006 | DURI-0006 | DURI-0003 | true |

**t_constraint_evaluated_during_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0001 | 2024-01-04 |
| DURI-0002 | DURI-0002 | DURI-0001 | 2025-03-02 |
| DURI-0003 | DURI-0003 | DURI-0001 | 2023-10-02 |
| DURI-0004 | DURI-0004 | DURI-0001 | 2023-03-04 |
| DURI-0005 | DURI-0005 | DURI-0001 | 2023-08-27 |
| DURI-0006 | DURI-0006 | DURI-0001 | 2023-09-26 |

**t_constraint_evaluated_during_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0004 | 2 |
| DURI-0002 | DURI-0001 | DURI-0005 | 590 |
| DURI-0003 | DURI-0002 | DURI-0004 | 2 |
| DURI-0004 | DURI-0002 | DURI-0005 | 52 |
| DURI-0005 | DURI-0003 | DURI-0004 | 1 |
| DURI-0006 | DURI-0003 | DURI-0005 | 88 |
| DURI-0007 | DURI-0004 | DURI-0004 | 5 |
| DURI-0008 | DURI-0004 | DURI-0005 | 829 |

**t_constraint_evaluated_during_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0007 | Encoding 01 |
| DURI-0002 | DURI-0001 | DURI-0002 | Enforcement 02 |
| DURI-0003 | DURI-0001 | DURI-0008 | pre-release note |
| DURI-0004 | DURI-0001 | DURI-0009 | en |
| DURI-0005 | DURI-0001 | DURI-0006 | Scope 05 |
| DURI-0006 | DURI-0002 | DURI-0007 | Encoding 06 |
| DURI-0007 | DURI-0002 | DURI-0002 | Enforcement 07 |
| DURI-0008 | DURI-0002 | DURI-0008 | audit excerpt |

**t_ice_about_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | calibration record |
| ARTI-0003 | ARTI-0001 | ARTI-0003 | es |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | Encoding 04 |
| ARTI-0005 | ARTI-0002 | ARTI-0002 | calibration record |
| ARTI-0006 | ARTI-0002 | ARTI-0003 | de |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | Encoding 07 |
| ARTI-0008 | ARTI-0003 | ARTI-0002 | nightly summary |