---
chapter_id: ch_live_artifact_governed_by_policy_b0b609
topic_id: 26
family: 01_foundation
cited_terms: ['artifact_governed_by_policy', 'evidence_for_audit', 'policy_min_one_enforcer']
model: engine-refine
---

Governed artifacts in compliance and audit systems are not anonymous blobs of data; they are identifiable, versioned objects whose physical characteristics and policy bindings must be traceable across time. An identifier is the durable handle that makes that traceability possible—a stable, human-readable key such as POLI-0001 or AUDI-0003 that survives renames, migrations, and cross-system references without ambiguity. When an ML training dataset is registered under POLI-0001 at version 9, or when a payment transaction log reaches version 10 under POLI-0003, the identifier anchors every downstream assertion: which policy applied, which evidence was collected, and which enforcement relationships were in force. Without identifiers, audit reconstruction collapses into guesswork; with them, each governed object becomes a node in a graph that investigators, regulators, and internal reviewers can follow from artifact to obligation to proof.

**t_evidence_for_audit**

| id | evidence |
| --- | --- |
| AUDI-0001 | AuditTrail_20231015 |
| AUDI-0002 | ChainOfCustody_Batch44 |
| AUDI-0003 | ChainOfCustody_Batch44 |
| AUDI-0004 | SignatureBlock_99A1 |
| AUDI-0005 | NetworkPacketCapture_0xFF |
| AUDI-0006 | AuditTrail_20231015 |

**t_policy_min_one_enforcer**

| id | policy |
| --- | --- |
| ENFO-0001 | SOC 2 Type II Controls |
| ENFO-0002 | ISO 13485 QMS |
| ENFO-0003 | GDPR Compliance Framework |
| ENFO-0004 | EU AI Act Risk Management |
| ENFO-0005 | ISO 13485 QMS |
| ENFO-0006 | ISO 13485 QMS |

Version and sizebytes extend that anchor with the material facts auditors need to assess integrity and scope. Version records the logical generation of an artifact—api_gateway_config at version 8 versus batch_ingestion_job at version 3—signaling whether a control assessment applies to the configuration that was live during an incident or to a superseded state. Sizebytes quantifies the artifact's footprint in storage: a 750,925,585-byte gateway configuration and a 76,522,3054-byte ingestion job are not interchangeable records, and discrepancies between declared size and observed size often surface tampering, incomplete copies, or retention violations before anyone reads a single log line. Together, identifier, version, and sizebytes form the baseline provenance tuple that every evidence record must be able to cite.

Evidence itself is modeled as an entity—a first-class object such as AuditTrail_20231015 or ChainOfCustody_Batch44—onto which structured observations are attached rather than flattened into wide tables. That entity-centric design matters because a single piece of evidence frequently carries heterogeneous facts: a decimal confidence score of 0.978, a string dimension label like "Dimension Kind 01," and a timestamp such as 2024-10-15T21:07:57 may all describe the same AUDI-0001 record without forcing a single row to absorb incompatible columns. The entity identifier (AUDI-0001, AUDI-0002, and so on) becomes the join key that binds those observations into a coherent audit narrative, while allowing the same attribute definition to apply across many entities—note how recorded_at values attach to four distinct entities through a shared attr reference.

Attributes and their types supply the semantic contract that governs those observations. An attr names what is being asserted—confidence, dimension_kind, method, recorded_at—while attr_type declares the validation and storage regime: xsd:decimal for numeric scores, xsd:string for categorical or textual values, xsd:dateTime for temporal stamps. This separation prevents the classic audit failure mode in which a date is stored as free text and later parsed inconsistently across jurisdictions. Typed value stores then hold the actual misc payloads—the miscellaneous concrete values that instantiate each attribute for a given entity—so that 0.546 confidence on AUDI-0002 and 212.01 on AUDI-0001 are unambiguously decimals, and "fr" on a varchar slot is unambiguously a string, not a mis-keyed numeric field. When ChainOfCustody_Batch44 appears twice as evidence (AUDI-0002 and AUDI-0003), distinct entity identifiers preserve separate audit threads even if the human-readable evidence name repeats.

**t_evidence_for_audit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUDI-0001 | confidence | xsd:decimal |
| AUDI-0002 | dimension_kind | xsd:string |
| AUDI-0003 | method | xsd:string |
| AUDI-0004 | recorded_at | xsd:dateTime |
| AUDI-0005 | uncertainty | xsd:decimal |
| AUDI-0006 | unit | xsd:string |
| AUDI-0007 | value | xsd:decimal |
| AUDI-0008 | encoding | xsd:string |

**t_evidence_for_audit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0004 | 2024-10-15T21:07:57 |
| AUDI-0002 | AUDI-0002 | AUDI-0004 | 2024-11-22T11:38:19 |
| AUDI-0003 | AUDI-0003 | AUDI-0004 | 2023-06-03T22:32:06 |
| AUDI-0004 | AUDI-0004 | AUDI-0004 | 2024-07-15T05:43:09 |
| AUDI-0005 | AUDI-0005 | AUDI-0004 | 2024-03-30T03:15:54 |
| AUDI-0006 | AUDI-0006 | AUDI-0004 | 2024-06-18T04:52:41 |

**t_evidence_for_audit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0001 | 0.978 |
| AUDI-0002 | AUDI-0001 | AUDI-0005 | 590.71 |
| AUDI-0003 | AUDI-0001 | AUDI-0007 | 212.01 |
| AUDI-0004 | AUDI-0002 | AUDI-0001 | 0.546 |
| AUDI-0005 | AUDI-0002 | AUDI-0005 | 882.77 |
| AUDI-0006 | AUDI-0002 | AUDI-0007 | 90.06 |
| AUDI-0007 | AUDI-0003 | AUDI-0001 | 0.051 |
| AUDI-0008 | AUDI-0003 | AUDI-0005 | 692.35 |

**t_evidence_for_audit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUDI-0001 | AUDI-0001 | AUDI-0002 | Dimension Kind 01 |
| AUDI-0002 | AUDI-0001 | AUDI-0008 | Encoding 02 |
| AUDI-0003 | AUDI-0001 | AUDI-0009 | intake form |
| AUDI-0004 | AUDI-0001 | AUDI-0010 | fr |
| AUDI-0005 | AUDI-0001 | AUDI-0003 | automated |
| AUDI-0006 | AUDI-0001 | AUDI-0006 | count |
| AUDI-0007 | AUDI-0002 | AUDI-0002 | Dimension Kind 07 |
| AUDI-0008 | AUDI-0002 | AUDI-0008 | Encoding 08 |

Policy enforcement introduces relational structure through subject, target, and role, which describe who does what to which obligation rather than merely listing names. A subject is the governed policy or framework node—SOC 2 Type II Controls, GDPR Compliance Framework, EU AI Act Risk Management—identified in enforcement graphs by keys such as ENFO-0005 or ENFO-0004. A target is the organizational actor bound to that subject: the Regulatory Affairs Division, Privacy Officer, or Data Stewardship Council, again referenced by stable identifiers like ENFO-0002 or ENFO-0004. Role qualifies the nature of that binding: an owner bears accountability, a contributor supplies evidence or remediation, an observer holds review rights without operational duty. Thus the Privacy Officer may appear as owner on one policy edge and a different actor as contributor on another, preventing the dangerous conflation of "listed on the policy" with "accountable for the policy."

In practice, these concepts interlock across the compliance lifecycle. A batch ingestion job governed under POLI-0004 accumulates evidence entities whose typed attributes document method, timing, and confidence; enforcement edges tie the governing policy to councils and officers with explicit roles; and artifact metadata—identifier, version, sizebytes—supplies the immutable coordinates that prove which object was evaluated. Investigators reconstruct chain of custody by traversing entity identifiers to misc values to attr definitions, then outward to policy subjects and enforcement targets. Regulators ask not only whether a control existed but whether the right role holder enforced it against the correct artifact version at the recorded time. The domain's design rewards precision at every layer: identifiers for stable reference, entities for bounded audit objects, typed attrs for interpretable assertions, misc for evidence-grade facts, and subject–target–role triples for accountable governance relationships that survive scrutiny long after the original operators have left the organization.

**t_artifact_governed_by_policy**

| id | artifact | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | ml_training_dataset | 98508200 | 9 |
| POLI-0002 | api_gateway_config | 750925585 | 8 |
| POLI-0003 | payment_transaction_log | 14439485 | 10 |
| POLI-0004 | batch_ingestion_job | 765223054 | 3 |

**t_policy_min_one_enforcer_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Regulatory Affairs Division |
| ENFO-0002 | Compliance Audit Board |
| ENFO-0003 | Privacy Officer |
| ENFO-0004 | Data Stewardship Council |
| ENFO-0005 | Automated Policy Engine |
| ENFO-0006 | Risk Management Committee |

**t_policy_min_one_enforcer__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0005 | ENFO-0002 | contributor |
| ENFO-0002 | ENFO-0004 | ENFO-0002 | observer |
| ENFO-0003 | ENFO-0005 | ENFO-0004 | owner |
| ENFO-0004 | ENFO-0005 | ENFO-0003 | contributor |
| ENFO-0005 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0006 | ENFO-0002 | ENFO-0004 | reviewer |
| ENFO-0007 | ENFO-0004 | ENFO-0003 | owner |
| ENFO-0008 | ENFO-0001 | ENFO-0002 | reviewer |