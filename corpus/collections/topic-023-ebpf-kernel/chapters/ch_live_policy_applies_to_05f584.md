---
chapter_id: ch_live_policy_applies_to_05f584
topic_id: 23
family: 01_foundation
cited_terms: ['policy_applies_to', 'policy_attests_artifact', 'policy_authored_by']
model: engine-refine
---

Policy governance systems treat compliance obligations as durable objects that must be referenced unambiguously across audits, attestations, and operational enforcement. At the foundation of this discipline sits the identifier—a stable, surrogate key that survives renaming of human-readable policy titles and permits joins across otherwise heterogeneous record types. When the Software Supply Chain Policy is scoped to API Gateway Endpoints under APPL-0001, or when ARTI-0003 attests against the PCI DSS Audit Requirement, those opaque codes do not merely index rows; they establish a chain of custody that auditors can traverse without ambiguity. The entity, in turn, denotes the governed object to which attributes attach: an artifact record, an application boundary, or an authorship declaration. Values never float freely; they bind to entity identifiers such that mandatory=true on ARTI-0003 and mandatory=false on ARTI-0004 are assertions about specific attestable artifacts, not global defaults.

**t_policy_applies_to**

| id | policy | applies_to | effective_date | label_text |
| --- | --- | --- | --- | --- |
| APPL-0001 | Software Supply Chain Policy | API Gateway Endpoints | 2025-01-11 | audit excerpt |
| APPL-0002 | CCPA Consumer Rights | HR Personnel Files | 2023-03-13 | nightly summary |
| APPL-0003 | SOC 2 Access Control | Kubernetes Clusters | 2024-06-14 | nightly summary |
| APPL-0004 | ISO Privacy Guideline | Customer PII Datasets | 2024-05-03 | pre-release note |
| APPL-0005 | Software Supply Chain Policy | Financial Reporting Systems | 2024-11-13 | nightly summary |
| APPL-0006 | FINRA Trade Surveillance | Kubernetes Clusters | 2023-05-19 | change rationale |
| APPL-0007 | Model Validation Directive | Kubernetes Clusters | 2024-07-03 | nightly summary |

**t_policy_attests_artifact**

| id | policy |
| --- | --- |
| ARTI-0001 | SOC 2 Access Standard |
| ARTI-0002 | AWS IAM Permission Boundary |
| ARTI-0003 | PCI DSS Audit Requirement |
| ARTI-0004 | Data Retention Standard |
| ARTI-0005 | EU AI Risk Framework |
| ARTI-0006 | FINRA Trade Surveillance |

**t_policy_attests_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | effective_date | xsd:date |
| ARTI-0002 | enforcement | xsd:string |
| ARTI-0003 | mandatory | xsd:boolean |
| ARTI-0004 | priority | xsd:integer |
| ARTI-0005 | review_cycle_days | xsd:integer |
| ARTI-0006 | scope | xsd:string |
| ARTI-0007 | encoding | xsd:string |
| ARTI-0008 | label_text | xsd:string |

**t_policy_attests_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | true |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | false |

**t_policy_attests_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-10-01 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2024-11-14 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-16 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2025-04-17 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2025-02-23 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-06-05 |

**t_policy_attests_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 49 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 2 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 915 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 3 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 439 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 5 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 254 |

**t_policy_attests_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | intake form |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | calibration record |

Attributes and their declared types constitute the semantic contract through which heterogeneous policy metadata becomes machine-validatable. An attr names what is being asserted—effective_date, enforcement, mandatory, priority—while attr_type prescribes the encoding grammar under which that assertion may legally be stored. Declaring effective_date as xsd:date and mandatory as xsd:boolean is not cosmetic taxonomy; it routes each fact into a type-safe persistence layer and prevents silent coercion that would corrupt compliance evidence. Priority stored as xsd:integer yields the divergent magnitudes 2 and 915 on sibling artifact records, a spread that only remains interpretable because the type system forbids storing those ranks as unparsed strings. Enforcement rendered as xsd:string accommodates lexical values such as "Enforcement 02" and locale markers like en without collapsing distinct semantic roles into a single undifferentiated text field.

Effective dating governs when a policy obligation transitions from prospective guidance to operative constraint, and in mature implementations it appears at multiple layers of the same governance graph. Scope records carry effective_date values—2025-01-11 for supply-chain controls on gateway endpoints, 2023-03-13 for CCPA rights over HR personnel files—that tell operators when a rule begins to apply to a named target. Attestation artifacts mirror that temporal logic through parallel effective_date attributes whose values (2023-10-01 through 2025-04-17) may precede or follow scope effective dates depending on whether the artifact records policy adoption, control implementation, or evidence collection. Discrepancies between these layers are diagnostically valuable: a cluster-scoped SOC 2 control effective 2024-06-14 may already be attested with a 2024-03-16 artifact effective date, signaling early conformance, whereas a 2025-04-17 artifact date trailing a 2024-05-03 scope date for customer PII datasets flags deferred enforcement that risk teams must reconcile before audit.

Mandatory obligation—surfaced in operational schemas as ismandatory—distinguishes binding regulatory or contractual duties from advisory standards that organizations may adopt voluntarily. Authorship records make this distinction explicit at the provenance layer: the FedRAMP Storage Mandate and CCPA Consumer Rights carry ismandatory=true under NIST Computer Security and Federal Trade Commission authorship respectively, whereas PCI DSS and HIPAA entries remain false despite their audit salience. Within the attestation subgraph, the mandatory attribute typed as xsd:boolean further refines artifact-level posture; ARTI-0001 through ARTI-0003 assert true while ARTI-0004 records false, permitting a single PCI DSS audit requirement to govern multiple artifacts with differing compulsory status. This bifurcation matters in practice because automated control gates, exception workflows, and regulator-facing reports must treat mandatory failures as blocking events while treating non-mandatory gaps as tracked remediations.

Label text and character encoding address complementary facets of how policy knowledge is presented, transmitted, and preserved. Labeltext supplies human-legible context that orients operators and reviewers without altering the underlying obligation: "audit excerpt" on supply-chain scope, paired "nightly summary" labels on CCPA and SOC 2 applications, and "pre-release note" on ISO privacy coverage each signal the evidentiary frame in which a rule should be interpreted during review cycles. Encoding, recorded alongside authorship metadata as latin1 or ascii, governs byte-level fidelity when policy prose crosses jurisdictional and legacy-system boundaries; a FedRAMP mandate encoded as ascii reflects constraints typical of hardened federal interchange paths, while latin1-tagged HIPAA and PCI records assume Western European character repertoires compatible with longstanding enterprise repositories. Neglecting encoding alignment produces mojibake in mandatory clauses and can invalidate digitally signed artifacts—a failure mode invisible to business users until an examiner attempts to reproduce authoritative text.

The misc field, despite its name, is the typed payload that completes the entity–attribute linkage in value tables partitioned by datatype. Boolean misc holds true and false for mandatory attestations; date misc stores calendar instants; integer misc captures ordinal priority; varchar misc retains lexical artifacts including "Encoding 01," "intake form," and enforcement descriptors. This pattern—identifier-anchored entities, schema-typed attributes, and segregated misc value stores—permits the same governance framework to absorb new attribute definitions without relational migrations that would fracture historical audit trails. In operation, a compliance engineer traces APPL-0004 from CCPA Consumer Rights through its mandatory authorship flag, consults labeltext to determine reporting context, validates effective_date alignment against PII dataset scope, and inspects ARTI-0004's false mandatory attestation to determine whether an exception is permissible or a control gap requires escalation. The architecture succeeds not because any single field is ornate, but because identifiers, entities, typed attributes, temporal markers, obligation flags, presentation metadata, and encoded values interlock into evidence that remains legible years after the policies that produced it were first authored.

**t_policy_authored_by**

| id | policy | authored_by | mandatory | encoding |
| --- | --- | --- | --- | --- |
| AUTH-0001 | PCI DSS Audit Requirement | European Commission | false | latin1 |
| AUTH-0002 | HIPAA Privacy Rule | NIST Computer Security | false | latin1 |
| AUTH-0003 | FedRAMP Storage Mandate | NIST Computer Security | true | ascii |
| AUTH-0004 | CCPA Consumer Rights | Federal Trade Commission | true | latin1 |
| AUTH-0005 | ISO 27001 Control Framework | Federal Trade Commission | false | latin1 |
| AUTH-0006 | Zero Trust Access Policy | AWS Compliance Office | false | ascii |
| AUTH-0007 | PCI DSS Audit Requirement | SOC 2 Audit Board | true | unicode |
| AUTH-0008 | HIPAA Privacy Rule | Federal Trade Commission | false | unicode |