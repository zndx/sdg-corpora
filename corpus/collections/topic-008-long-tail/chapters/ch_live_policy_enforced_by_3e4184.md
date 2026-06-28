---
chapter_id: ch_live_policy_enforced_by_3e4184
topic_id: 8
family: 03_directive_governance
cited_terms: ['policy_enforced_by', 'hipaa_safeguard_physical', 'iso27001_annexa_subclass']
model: engine-refine
---

In compliance-oriented knowledge graphs, identifier, role, subject, and target constitute the minimal vocabulary through which regulatory obligations are decomposed into auditable, machine-navigable assertions rather than narrative policy text. The identifier furnishes a durable surrogate key—ENFO-0001 through ENFO-0004 for enforcement artifacts, PHYS-0001 through PHYS-0004 for HIPAA physical safeguards, ANNE-0001 through ANNE-0004 for ISO annex subclasses—that remains stable when display labels change, when control catalogs are renumbered, or when the same obligation is referenced from audit evidence, ticketing systems, and configuration baselines. Without such keys, cross-table joins collapse into brittle string matching on phrases like “ISO27001 Encryption” or “A.5.22 Cloud security,” and traceability from a detected drift event back to the governing clause becomes probabilistic rather than deterministic.

**t_policy_enforced_by**

| id | policy |
| --- | --- |
| ENFO-0001 | ISO27001 Encryption |
| ENFO-0002 | CCPA Data Deletion |
| ENFO-0003 | PCI-DSS Tokenization |
| ENFO-0004 | FINRA Record Retention |
| ENFO-0005 | FINRA Record Retention |
| ENFO-0006 | HIPAA Audit Trail |

**t_policy_enforced_by_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Splunk SIEM |
| ENFO-0002 | ISO Audit Board |
| ENFO-0003 | AWS Config Rules |
| ENFO-0004 | AWS Config Rules |
| ENFO-0005 | ISO Audit Board |
| ENFO-0006 | AWS Config Rules |

**t_policy_enforced_by__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0002 | ENFO-0002 | ENFO-0006 | observer |
| ENFO-0003 | ENFO-0003 | ENFO-0001 | reviewer |
| ENFO-0004 | ENFO-0006 | ENFO-0001 | owner |
| ENFO-0005 | ENFO-0002 | ENFO-0005 | reviewer |
| ENFO-0006 | ENFO-0001 | ENFO-0003 | observer |
| ENFO-0007 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0008 | ENFO-0004 | ENFO-0006 | reviewer |

**t_hipaa_safeguard_physical**

| id | hipaa |
| --- | --- |
| PHYS-0001 | Alarm Siren System |
| PHYS-0002 | Cabinet Lockdown Procedure |
| PHYS-0003 | Access Control Log |
| PHYS-0004 | Cabinet Lockdown Procedure |
| PHYS-0005 | Badge Printer |
| PHYS-0006 | Badge Printer |

**t_hipaa_safeguard_physical_hipaa_safeguard**

| id | hipaa_safeguard |
| --- | --- |
| PHYS-0001 | Media Disposal Protocol |
| PHYS-0002 | Mantrap Entry |
| PHYS-0003 | CCTV Monitoring |
| PHYS-0004 | Equipment Maintenance Schedule |
| PHYS-0005 | Visitor Badge System |
| PHYS-0006 | Power Redundancy Plan |
| PHYS-0007 | Equipment Maintenance Schedule |
| PHYS-0008 | Keycard Reader |

**t_hipaa_safeguard_physical__hipaa_safeguard**

| id | hipaa_id | hipaa_safeguard_id | role |
| --- | --- | --- | --- |
| PHYS-0001 | PHYS-0006 | PHYS-0002 | owner |
| PHYS-0002 | PHYS-0004 | PHYS-0005 | reviewer |
| PHYS-0003 | PHYS-0002 | PHYS-0008 | observer |
| PHYS-0004 | PHYS-0001 | PHYS-0008 | owner |
| PHYS-0005 | PHYS-0004 | PHYS-0003 | observer |
| PHYS-0006 | PHYS-0006 | PHYS-0004 | owner |
| PHYS-0007 | PHYS-0001 | PHYS-0001 | reviewer |
| PHYS-0008 | PHYS-0002 | PHYS-0008 | contributor |

**t_iso27001_annexa_subclass**

| id | iso |
| --- | --- |
| ANNE-0001 | ISO/IEC 27001 |
| ANNE-0002 | ISO/IEC 27001 |
| ANNE-0003 | ISO/IEC 27701 |
| ANNE-0004 | ISO 20000-1 |
| ANNE-0005 | ISO/IEC 27701 |
| ANNE-0006 | ISO 20000-1 |

**t_iso27001_annexa_subclass_iso27001_annex_a**

| id | iso27001_annex_a |
| --- | --- |
| ANNE-0001 | A.5.22 Cloud security |
| ANNE-0002 | A.5.7 Threat intelligence |
| ANNE-0003 | A.6.3 Remote working |
| ANNE-0004 | A.8.12 Data masking |
| ANNE-0005 | A.7.4 Physical security monitoring |
| ANNE-0006 | A.5.30 Incident response |
| ANNE-0007 | A.8.22 Data leakage prevention |

**t_iso27001_annexa_subclass__iso27001_annex_a**

| id | iso_id | iso27001_annex_a_id | role |
| --- | --- | --- | --- |
| ANNE-0001 | ANNE-0003 | ANNE-0001 | observer |
| ANNE-0002 | ANNE-0001 | ANNE-0004 | reviewer |
| ANNE-0003 | ANNE-0002 | ANNE-0007 | owner |
| ANNE-0004 | ANNE-0001 | ANNE-0003 | observer |
| ANNE-0005 | ANNE-0003 | ANNE-0007 | observer |
| ANNE-0006 | ANNE-0004 | ANNE-0005 | contributor |
| ANNE-0007 | ANNE-0003 | ANNE-0001 | reviewer |
| ANNE-0008 | ANNE-0006 | ANNE-0006 | reviewer |

Subject and target encode directionality: the subject is the governed or anchoring entity, and the target is the counterparty that implements, evidences, or operationalizes it. In policy enforcement, the subject is the policy identifier (for example ENFO-0001 for ISO27001 Encryption or ENFO-0002 for CCPA Data Deletion), while the target is the enforcement mechanism identifier (ENFO-0003 for AWS Config Rules or ENFO-0006 for a distinct control plane not duplicated in the enforcement roster). The bipartite pattern repeats under HIPAA physical safeguards, where PHYS-0002 as subject may bind to PHYS-0005 as target for Mantrap Entry, and under ISO annex modeling, where ANNE-0001 as subject may associate with ANNE-0003 as target for A.6.3 Remote working. This subject–target asymmetry prevents symmetric “related to” edges from obscuring accountability: auditors can always ask whether a relationship is “policy requires control” versus “control satisfies policy,” because the edge type is fixed by column semantics rather than inferred from proximity in a flat list.

Role qualifies the subject–target link without collapsing it into mere adjacency. The same enforcement target may participate in multiple policies under different capacities: AWS Config Rules appears as reviewer for PCI-DSS Tokenization (ENFO-0003) and as owner for FINRA Record Retention (ENFO-0004), whereas Splunk SIEM and the ISO Audit Board both attach as observers to ENFO-0001 and ENFO-0002 respectively. HIPAA and ISO instances exhibit the same tripartite enrichment—owner on Cabinet Lockdown Procedure tied to Equipment Maintenance Schedule (PHYS-0001), reviewer on Access Control Log tied to CCTV Monitoring (PHYS-0003), owner on ISO/IEC 27001 tied to A.5.7 Threat intelligence (ANNE-0002), observer on ISO/IEC 27701 tied to A.5.22 Cloud security (ANNE-0003). Observer, reviewer, and owner therefore function as governance predicates: they specify whether an artifact merely witnesses compliance, adjudicates adequacy, or bears operational responsibility, a distinction material for segregation-of-duties reviews and for interpreting automated findings that do not, by themselves, establish ownership.

Operationally, these four primitives enable a three-layer decomposition that separates entity registries from relationship assertions. Entity tables hold canonical records—policies such as PCI-DSS Tokenization, safeguard classes such as Alarm Siren System, standards such as ISO 20000-1—while companion registries hold enforceable or implementable counterparts—Splunk SIEM, Media Disposal Protocol, A.8.12 Data masking. The junction layer then materializes only the edges that governance cares to assert, each edge carrying its own identifier so that corrections, attestations, and exceptions can be versioned per link rather than per entity. When junction rows reference identifiers absent from a local registry—as when policy_id ENFO-0006 or hipaa_id PHYS-0006 or iso27001_annex_a_id ANNE-0007 appear in link rows—the model explicitly tolerates outward pointers, signaling that the compliance graph is federated: subjects and targets may be mastered elsewhere while this store retains authoritative role assignments for the relationships under its scope.

The evidentiary payoff emerges when controls are shared, duplicated, or partially overlapping across frameworks. AWS Config Rules enforces more than one policy in this corpus, yet the reviewer versus owner roles differentiate PCI-DSS Tokenization from FINRA Record Retention, preserving distinct evidentiary postures even when the underlying technical probe is identical. Likewise, Cabinet Lockdown Procedure recurs as a HIPAA label while distinct physical safeguards—Mantrap Entry, CCTV Monitoring, Equipment Maintenance Schedule—attach through different roles, illustrating how a single procedural theme fans out into multiple operational targets without conflating them. ISO mappings show the same nuance: ISO/IEC 27001 supports several annex A controls, but ANNE-0001 links to A.8.12 Data masking as observer while other standards assume reviewer or owner capacities on different annex entries, reflecting that framework membership does not uniformly imply the same degree of implementation accountability.

For practitioners, identifier–role–subject–target tuples should be treated as first-class audit objects. An identifier names what is being discussed; subject and target fix the oriented dependency; role states how the dependency must be read in governance workflows. Queries that aggregate only subjects or only targets therefore under-report risk: they miss whether AWS Config Rules merely reviews tokenization or owns retention, or whether ISO/IEC 27701’s observer linkage to cloud security implies monitoring scope rather than control ownership. Dense registries of ENFO-, PHYS-, and ANNE-prefixed keys are thus not catalog clutter but the compositional substrate on which evidence chains—from regulatory clause to operational sensor to attestation duty—are assembled, disputed, and renewed without re-parsing unstructured policy prose at each review cycle.