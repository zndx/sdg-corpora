---
chapter_id: ch_live_control_with_evidence_requirement_d39072
topic_id: 2
family: 03_directive_governance
cited_terms: ['control_with_evidence_requirement', 'control_basic', 'attribute_set_subclass']
model: engine-refine
---

Governance frameworks require that every control, policy, or compliance obligation be anchored to a unique identifier—such as `REQU-0001` or `CONT-0003`—to ensure unambiguous reference across audit trails, reporting systems, and enforcement actions. These identifiers serve as the primary key by which controls are tracked, versioned, and correlated with their supporting evidence requirements. A single control, for instance, may appear under multiple identifiers when it carries distinct evidence obligations or enforcement classifications; the control `DataEncryptionAtRest`, for example, is associated with three separate requirement records (`REQU-0001`, `REQU-0003`, `REQU-0004`), each specifying a different evidence artifact and enforcement posture. This multiplicity reflects the reality that a single policy directive often branches into multiple compliance pathways depending on jurisdiction, regulatory regime, or organizational context.

**t_control_with_evidence_requirement**

| id | control | requires_evidence | enforcement | language |
| --- | --- | --- | --- | --- |
| REQU-0001 | DataEncryptionAtRest | SystemAuditLog | deprecated | en |
| REQU-0002 | BaselineConfigurationCheck | ISO27001Certification | advisory | es |
| REQU-0003 | DataEncryptionAtRest | SystemAuditLog | deprecated | en |
| REQU-0004 | DataEncryptionAtRest | ManagerApprovalEmail | mandatory | ja |

**t_control_basic**

| id | control | effective_date | mandatory |
| --- | --- | --- | --- |
| CONT-0001 | Anomaly detection limit | 2025-01-22 | false |
| CONT-0002 | Audit logging standard | 2025-04-27 | false |
| CONT-0003 | Data retention mandate | 2024-12-05 | true |
| CONT-0004 | Anomaly detection limit | 2025-05-27 | true |
| CONT-0005 | PII masking policy | 2025-02-05 | false |
| CONT-0006 | Rate limiting rule | 2023-06-05 | false |
| CONT-0007 | Checksum verification rule | 2024-10-11 | false |

**fact_attribute**

| id | attribute_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| SET-0001 | SET-0005 | 0.926 | 957.49 | 482.01 |
| SET-0002 | SET-0003 | 0.786 | 274.08 | 742.87 |
| SET-0003 | SET-0005 | 0.123 | 455.70 | 100.75 |
| SET-0004 | SET-0003 | 0.178 | 516.20 | 779.52 |

The attribute dimension provides the categorical scaffolding upon which measured values are organized. Each attribute—identified by a key such as `SET-0003` or `SET-0005`—is assigned a human-readable label and a classification category, enabling aggregation and filtering at the category level. In practice, this means that a collection of disparate measurements can be grouped under `Attribute Category 01` or `Attribute Category 03` for consolidated reporting, while the underlying attribute keys preserve the granularity needed for individual record retrieval. The attribute label, such as `Attribute Label 01`, functions as the display name presented to auditors and compliance officers, decoupling the machine-readable key from the semantic representation used in operational interfaces.

**dim_attribute**

| id | attribute_label | attribute_category |
| --- | --- | --- |
| SET-0001 | Attribute Label 01 | Attribute Category 01 |
| SET-0002 | Attribute Label 02 | Attribute Category 02 |
| SET-0003 | Attribute Label 03 | Attribute Category 03 |
| SET-0004 | Attribute Label 04 | Attribute Category 04 |
| SET-0005 | Attribute Label 05 | Attribute Category 05 |
| SET-0006 | Attribute Label 06 | Attribute Category 06 |

Confidence and uncertainty form the dual metrics that quantify the reliability of any recorded measurement or assessment. Confidence, expressed as a value between zero and one, indicates the degree of assurance in the reported figure; a confidence of `0.926` attached to the value `482.01` signals strong evidentiary support, whereas a confidence of `0.123` for the value `100.75` suggests the measurement rests on tenuous or incomplete data. Uncertainty, measured on a continuous scale, provides the complementary magnitude of doubt—`957.49` for the first record versus `274.08` for the second—allowing risk assessors to weight findings proportionally when compiling compliance summaries or escalation reports. These paired metrics are essential for distinguishing between high-certainty findings that warrant immediate remediation and low-confidence observations that require further investigation before action is taken.

The enforcement and mandatory dimensions govern the obligation structure of each control. Enforcement classifications such as `mandatory`, `advisory`, and `deprecated` define the operational weight of a requirement: a `mandatory` enforcement on the control `DataEncryptionAtRest` (record `REQU-0004`) carries the force of policy, while an `advisory` designation on `BaselineConfigurationCheck` (record `REQU-0002`) signals a recommended but non-binding practice. The deprecated status on records `REQU-0001` and `REQU-0003` indicates controls that remain in the registry for historical reference but no longer impose active obligations. The mandatory flag in the basic control table operates at a coarser granularity, marking entire controls—such as `Data retention mandate` (record `CONT-0003`)—as universally required, while controls like `Anomaly detection limit` (records `CONT-0001` and `CONT-0004`) may be mandatory in some contexts and optional in others, depending on the enforcement layer applied through the evidence requirement table.

Effective dates establish the temporal validity of each control, ensuring that compliance assessments reference the correct version of a policy at any given point in time. The control `Data retention mandate` became effective on `2024-12-05`, predating the `Anomaly detection limit` control under record `CONT-0001` (effective `2025-01-22`) by over a month, while the same control reappears under `CONT-0004` with a later effective date of `2025-05-27`, suggesting a revision or reissuance. This temporal dimension is critical for retrospective audits, where the applicable control regime at the time of an incident must be determined by comparing the event date against the effective dates of all relevant controls.

Language designations enable multilingual compliance programs to associate each requirement with the appropriate linguistic variant. The requirement `REQU-0002` is designated for Spanish (`es`) audiences, `REQU-0004` for Japanese (`ja`) audiences, while `REQU-0001` and `REQU-0003` are both in English (`en`). This localization capability ensures that enforcement documentation, audit checklists, and evidence submission portals are presented in the language appropriate to the target jurisdiction or organizational unit, reducing the risk of misinterpretation in cross-border compliance operations.