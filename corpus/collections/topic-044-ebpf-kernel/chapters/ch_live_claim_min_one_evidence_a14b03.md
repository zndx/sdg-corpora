---
chapter_id: ch_live_claim_min_one_evidence_a14b03
topic_id: 44
family: 06_belief_structure
cited_terms: ['claim_min_one_evidence', 'ebpfprogram_governed_by_security_policy', 'nist80053_moderate_impact']
model: engine-refine
---

Operational governance and regulatory compliance rest upon a rigorously normalized relational architecture that binds discrete assertions to their evidentiary foundations and regulatory benchmarks. At the core of this architecture lies the identifier, a deterministic key that anchors every claim, policy artifact, and compliance mapping to an immutable reference point. These identifiers function as the primary keys for subject and target entities, establishing directed relationships that dictate accountability and lineage. When a claim such as “Antibiotic resistance rising” or “Deforestation rate doubled” is evaluated, the system routes it through a junction table where the subject identifier points to the originating assertion and the target identifier resolves to the supporting datum—whether a Lancet longitudinal cohort study, an ICES marine ecosystem index, or a WHO mortality surveillance Q3 report. The relationship is never implicit; it is explicitly mediated by a role attribute that assigns operational responsibility. A contributor may supply raw telemetry, a reviewer validates methodological integrity, and an owner bears final accountability for the assertion’s continued validity. This tripartite mapping of subject, target, and role ensures that every compliance claim carries a complete audit trail, traceable from initial submission through evidentiary validation to regulatory sign-off.

Classification taxonomy operates in parallel to relational mapping, providing the categorical scaffolding necessary for large-scale policy inventory and impact assessment. Each operational artifact is assigned a category that groups it by functional domain, while a supplementary misc label supplies human-readable metadata for interface rendering and administrative lookup. In the eBPF policy registry, for instance, distinct category designations segment workloads into discrete operational silos, allowing auditors to isolate and review policy families without traversing the entire deployment matrix. The misc attribute functions as a display alias, decoupling internal classification logic from external reporting requirements. This separation of machine-readable taxonomy from administrative labeling prevents schema drift when regulatory frameworks evolve; categories remain stable anchors for aggregation queries, while misc labels adapt to shifting nomenclature standards. Consequently, compliance officers can filter by Ebpfprogram Category 01 or Category 04 to isolate specific regulatory scopes, while the underlying misc identifiers maintain backward compatibility with legacy reporting templates.

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| POLI-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| POLI-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| POLI-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| POLI-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| POLI-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| POLI-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| POLI-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| POLI-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

Lifecycle management of executable policy artifacts demands precise telemetry on footprint, revision state, and deployment lineage. The ebpfprogram entity captures the operational payload itself, while size_bytes quantifies its compiled footprint to enforce memory constraints and performance budgets during policy injection. A single policy variant may register a compiled size of 113,209,263 bytes, whereas a more complex variant approaches 784,335,640 bytes, necessitating dynamic threshold checks before kernel attachment. Versioning complements this footprint tracking by establishing a strict monotonic progression; revisions are stamped with integer markers such as 9, 11, and 12, enabling rollback procedures and differential auditing when a policy’s behavior diverges from its certified baseline. When paired with the categorical and labeling metadata, the versioned size telemetry creates a complete artifact manifest. Auditors can verify that a deployed ebpfprogram matches its certified version, confirm that its size_bytes falls within approved operational bounds, and cross-reference its category to ensure it aligns with the intended regulatory impact tier.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | 784335640 | 12 |
| POLI-0002 | POLI-0003 | 641704069 | 9 |
| POLI-0003 | POLI-0003 | 113209263 | 11 |
| POLI-0004 | POLI-0005 | 161013093 | 12 |
| POLI-0005 | POLI-0004 | 352203820 | 12 |
| POLI-0006 | POLI-0003 | 167519051 | 1 |

The convergence of these structural elements culminates in a unified compliance posture that maps technical artifacts to formal regulatory impact levels. NIST frameworks, including SP 800-53, SP 800-171, and SP 800-218, are not merely cataloged; they are explicitly bound to impact thresholds such as Moderate Threshold, System Security Moderate, and Moderate Baseline through the same subject-target-role junction pattern. An identifier like IMPA-0002 may link a specific NIST control to an IMPA-0007 impact level, with the role attribute designating whether the control acts as an observer, contributor, or owner within that impact tier. This relational discipline eliminates ambiguity in compliance reporting: every policy version, every evidence claim, and every regulatory benchmark exists within a single, queryable graph where accountability is explicit, lineage is preserved, and operational telemetry is continuously reconciled against governance thresholds. The result is an audit-ready architecture where technical execution and regulatory obligation are indistinguishable in their traceability.

**t_claim_min_one_evidence**

| id | claim |
| --- | --- |
| EVID-0001 | Antibiotic resistance rising |
| EVID-0002 | Glacier mass loss accelerating |
| EVID-0003 | Antibiotic resistance rising |
| EVID-0004 | Deforestation rate doubled |
| EVID-0005 | Ocean acidity increased 0.3 |
| EVID-0006 | Ocean acidity increased 0.3 |
| EVID-0007 | Deforestation rate doubled |

**t_claim_min_one_evidence_supported_by_evidence**

| id | supported_by_evidence |
| --- | --- |
| EVID-0001 | Lancet longitudinal cohort study |
| EVID-0002 | Lancet longitudinal cohort study |
| EVID-0003 | ICES marine ecosystem index |
| EVID-0004 | WHO mortality surveillance Q3 |
| EVID-0005 | WHO mortality surveillance Q3 |
| EVID-0006 | EPA ambient monitor 7B |
| EVID-0007 | IPCC AR6 synthesis report |
| EVID-0008 | ICES marine ecosystem index |

**t_claim_min_one_evidence__supported_by_evidence**

| id | claim_id | supported_by_evidence_id | role |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0004 | EVID-0002 | contributor |
| EVID-0002 | EVID-0003 | EVID-0007 | reviewer |
| EVID-0003 | EVID-0007 | EVID-0004 | owner |
| EVID-0004 | EVID-0007 | EVID-0005 | contributor |
| EVID-0005 | EVID-0005 | EVID-0004 | reviewer |
| EVID-0006 | EVID-0004 | EVID-0005 | reviewer |
| EVID-0007 | EVID-0007 | EVID-0003 | reviewer |
| EVID-0008 | EVID-0004 | EVID-0004 | owner |

**t_nist80053_moderate_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-53 |
| IMPA-0002 | SP 800-53 |
| IMPA-0003 | SP 800-171 |
| IMPA-0004 | SP 800-218 |
| IMPA-0005 | NIST AI RMF |
| IMPA-0006 | SP 800-171 |
| IMPA-0007 | SP 800-37 |

**t_nist80053_moderate_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | Moderate Threshold |
| IMPA-0002 | System Security Moderate |
| IMPA-0003 | Impact Level Moderate |
| IMPA-0004 | Moderate Baseline |
| IMPA-0005 | Moderate Threshold |
| IMPA-0006 | Moderate |
| IMPA-0007 | Availability Moderate |

**t_nist80053_moderate_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0007 | observer |
| IMPA-0002 | IMPA-0002 | IMPA-0004 | observer |
| IMPA-0003 | IMPA-0006 | IMPA-0001 | contributor |
| IMPA-0004 | IMPA-0007 | IMPA-0007 | owner |
| IMPA-0005 | IMPA-0003 | IMPA-0002 | owner |
| IMPA-0006 | IMPA-0004 | IMPA-0005 | observer |
| IMPA-0007 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0008 | IMPA-0003 | IMPA-0007 | owner |