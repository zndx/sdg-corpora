---
chapter_id: ch_live_requirement_satisfies_fec252
topic_id: 184
family: 03_directive_governance
cited_terms: ['requirement_satisfies', 'backward_compatible_with', 'evidence_independent_of']
model: engine-refine
---

In compliance and governance architectures, identifiers serve as the immutable anchors that bind requirements, evidence, and dependencies to auditable records across the system lifecycle. Each identifier follows a structured prefix convention that signals its semantic domain: SATI-0001 through SATI-0004 denote requirement-satisfaction mappings, WITH-0001 through WITH-0008 encode backward-compatibility relationships, and INDE-0001 through INDE-0005 capture evidence-independence assertions. This prefix-based taxonomy enables operators to resolve any identifier to its governing relationship type without schema introspection. The identifier SATI-0001, for instance, anchors the mapping between the Audit Trail Mandate and the implementation WITH-0008, while INDE-0003 ties the evidence item sensor calibration trace to its dependent data warehouse. Such identifiers are not merely labels; they are the join keys that sustain referential integrity across the compliance graph, ensuring that every claim of satisfaction, compatibility, or independence can be traced to a single authoritative record.

**t_requirement_satisfies**

| id | requirement | satisfies | priority | scope |
| --- | --- | --- | --- | --- |
| SATI-0001 | Audit Trail Mandate | WITH-0008 | 5 | team |
| SATI-0002 | Data Retention Policy | WITH-0006 | 2 | team |
| SATI-0003 | Encryption Standard AES-256 | WITH-0004 | 1 | regional |
| SATI-0004 | ISO 27001 Annex A | WITH-0002 | 5 | team |
| SATI-0005 | Protocol TLS 1.3 | WITH-0008 | 2 | team |
| SATI-0006 | Data Retention Policy | WITH-0006 | 1 | local |

**t_backward_compatible_with**

| id | backward |
| --- | --- |
| WITH-0001 | gRPC 1.50 |
| WITH-0002 | Terraform v1.4 |
| WITH-0003 | Kafka 2.8 |
| WITH-0004 | Rust 1.50 |
| WITH-0005 | gRPC 1.50 |
| WITH-0006 | gRPC 1.27 |
| WITH-0007 | Parquet 2.0 |
| WITH-0008 | OAuth 1.0 |

**t_backward_compatible_with_backward_compatible_with**

| id | backward_compatible_with |
| --- | --- |
| WITH-0001 | OpenTelemetry 1.10 |
| WITH-0002 | Avro 1.9 |
| WITH-0003 | Kafka 2.8 |
| WITH-0004 | Avro 1.9 |
| WITH-0005 | Parquet 2.0 |
| WITH-0006 | Parquet 2.0 |
| WITH-0007 | Terraform v0.13 |

**t_evidence_independent_of**

| id | evidence |
| --- | --- |
| INDE-0001 | clinical trial outcome |
| INDE-0002 | compliance certification record |
| INDE-0003 | sensor calibration trace |
| INDE-0004 | lab assay result |
| INDE-0005 | batch processing checksum |
| INDE-0006 | telemetry snapshot |
| INDE-0007 | compliance certification record |

**t_evidence_independent_of_evidence_independent_of**

| id | evidence_independent_of |
| --- | --- |
| INDE-0001 | data warehouse |
| INDE-0002 | labeling schema |
| INDE-0003 | measurement device |
| INDE-0004 | data warehouse |
| INDE-0005 | partition strategy |
| INDE-0006 | git repository |
| INDE-0007 | monitoring dashboard |
| INDE-0008 | labeling schema |

Priority functions as the quantitative mechanism by which compliance obligations are ranked for resource allocation and remediation sequencing. Within the requirement-satisfaction layer, priorities range from 1 to 5, with SATI-0003 (Encryption Standard AES-256) carrying the highest priority of 1, while SATI-0001 (Audit Trail Mandate) and SATI-0004 (ISO 27001 Annex A) sit at the lowest tier with priority 5. This gradient directly informs incident response triage: a priority-1 requirement such as the AES-256 standard demands immediate remediation attention, whereas a priority-5 obligation like the ISO 27001 Annex A mapping can be deferred within the compliance cycle. The Data Retention Policy (SATI-0002), positioned at priority 2, occupies the upper-middle band, signaling that its enforcement is urgent but secondary to cryptographic controls. Priority values thus translate qualitative risk assessments into actionable ordering signals that drive compliance workflows.

Scope delineates the organizational or operational boundary within which a requirement-satisfaction relationship holds authority. The scope dimension partitions mappings into team-level and regional-level jurisdictions, with SATI-0001 (Audit Trail Mandate), SATI-0002 (Data Retention Policy), and SATI-0004 (ISO 27001 Annex A) all scoped to team, indicating that their satisfaction is governed at the team level. In contrast, SATI-0003 (Encryption Standard AES-256) carries a regional scope, meaning its enforcement extends across multiple teams within a defined geographic or administrative region. This distinction is operationally significant: team-scoped requirements permit decentralized compliance verification, while region-scoped requirements necessitate centralized oversight and cross-team coordination. The scope attribute therefore determines not only where a requirement applies but also which governance body holds accountability for its enforcement.

Role establishes the functional relationship between a subject and a target within a dependency or evidence assertion, defining whether an entity owns, observes, or contributes to the relationship. In the backward-compatibility graph, the role observer appears for WITH-0001 (gRPC 1.50), WITH-0002 (Terraform v1.4), and WITH-0008, indicating that these components passively depend on their targets—OpenTelemetry 1.10, Avro 1.9, and Avro 1.9 respectively—without actively maintaining the compatibility contract. The role owner, by contrast, appears for WITH-0005, signifying active stewardship of the backward-compatibility relationship with WITH-0001. Within the evidence-independence layer, roles distinguish between contributor (INDE-0001), reviewer (INDE-0002 and INDE-0004), and observer (INDE-0003), each carrying distinct audit responsibilities: contributors produce the evidence, reviewers validate its independence from the target, and observers monitor the relationship without direct accountability.

**t_backward_compatible_with__backward_compatible_with**

| id | backward_id | backward_compatible_with_id | role |
| --- | --- | --- | --- |
| WITH-0001 | WITH-0001 | WITH-0005 | observer |
| WITH-0002 | WITH-0007 | WITH-0007 | observer |
| WITH-0003 | WITH-0005 | WITH-0001 | owner |
| WITH-0004 | WITH-0008 | WITH-0005 | observer |
| WITH-0005 | WITH-0002 | WITH-0002 | reviewer |
| WITH-0006 | WITH-0008 | WITH-0006 | reviewer |
| WITH-0007 | WITH-0004 | WITH-0004 | owner |
| WITH-0008 | WITH-0008 | WITH-0001 | observer |

**t_evidence_independent_of__evidence_independent_of**

| id | evidence_id | evidence_independent_of_id | role |
| --- | --- | --- | --- |
| INDE-0001 | INDE-0005 | INDE-0008 | contributor |
| INDE-0002 | INDE-0003 | INDE-0008 | reviewer |
| INDE-0003 | INDE-0003 | INDE-0008 | observer |
| INDE-0004 | INDE-0002 | INDE-0005 | reviewer |
| INDE-0005 | INDE-0002 | INDE-0003 | observer |
| INDE-0006 | INDE-0006 | INDE-0001 | contributor |
| INDE-0007 | INDE-0001 | INDE-0005 | contributor |
| INDE-0008 | INDE-0002 | INDE-0005 | contributor |

Subject and target form the directional pair that gives every relationship its semantic orientation. In backward compatibility, the subject (backward) is the component whose compatibility is being asserted—gRPC 1.50, Terraform v1.4, Kafka 2.8, or Rust 1.50—while the target (backward_compatible_with) is the version or specification against which compatibility is measured, such as OpenTelemetry 1.10, Avro 1.9, or Kafka 2.8. The directionality is critical: WITH-0002 asserts that Terraform v1.4 is backward compatible with Kafka 2.8, not the reverse. Similarly, in the evidence-independence domain, the subject (evidence_id) is the evidence item asserting its independence, and the target (evidence_independent_of_id) is the artifact from which the evidence claims independence. INDE-0003, for example, positions sensor calibration trace as the subject asserting independence from data warehouse (INDE-0008), establishing a directional claim that can be independently verified. This subject-target orientation ensures that every relationship in the compliance graph is unambiguously directed, preventing circular reasoning and enabling precise audit trails.