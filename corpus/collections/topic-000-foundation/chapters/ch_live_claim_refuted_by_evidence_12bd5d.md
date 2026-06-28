---
chapter_id: ch_live_claim_refuted_by_evidence_12bd5d
topic_id: 0
family: 06_belief_structure
cited_terms: ['claim_refuted_by_evidence', 'agent_identified_by_uri', 'instrument_only_emits_type']
model: engine-refine
---

Identity in evidence management rests on a layered architecture of identifiers, each serving a distinct resolution scope. The primary key identifier—`EVID-0001`, `URI-0001`, `TYPE-0001`—anchors a record within its own table, while secondary identifiers such as `ref-8842`, `ARN:res/41`, and `urn:uuid:9f2a` provide cross-system resolution handles. These identifiers are not merely labels; they are the stable endpoints for URIs like `ark:/13030/n8yy3r` and `urn:isbn:978316148`, which in turn resolve to concrete agents such as `weather-station-alpha`, `compliance-audit-bot`, and `genomics-lab-director`. The owner field assigns custodianship over these resources, with `data-engineering` and `ml-infra` emerging as the principal stewardship domains. An owner is not a person but a functional unit responsible for the lifecycle, access control, and integrity of the assets under its purview.

**t_agent_identified_by_uri**

| id | agent | identified_by_u_r_i | identifier | owner |
| --- | --- | --- | --- | --- |
| URI-0001 | weather-station-alpha | ark:/13030/n8yy3r | ref-8842 | data-engineering |
| URI-0002 | compliance-audit-bot | ark:/13030/n8yy3r | ARN:res/41 | ml-infra |
| URI-0003 | genomics-lab-director | urn:isbn:978316148 | urn:uuid:9f2a | ml-infra |
| URI-0004 | edge-device-gateway | urn:isbn:978316148 | ARN:res/41 | ml-infra |
| URI-0005 | genomics-lab-director | doi:10.5281/zenodo | urn:uuid:9f2a | analytics |
| URI-0006 | edge-device-gateway | doi:10.5281/zenodo | doi:10.1109/x | sre |
| URI-0007 | cern-alice-analysis | urn:isbn:978316148 | urn:uuid:9f2a | sre |

The subject-role-target triad governs how evidence items relate to one another, forming the relational backbone of the claim-refutation graph. In the junction table linking claims to their refutations, the `claim_id` column functions as the subject—the entity initiating or bearing the relationship—while `refuted_by_evidence_id` serves as the target, the entity receiving or resolving it. The `role` column, populated with values such as `observer` and `reviewer`, qualifies the nature of the connection: an observer witnesses or records a refutation, whereas a reviewer validates or adjudicates it. For instance, the claim `EVID-0006` is linked to the refuting evidence `EVID-0004` through an observer role, while `EVID-0001` connects to `EVID-0003` under a reviewer role, indicating a higher degree of authoritative scrutiny. This tripartite structure allows the same pair of evidence items to participate in multiple relationships with different roles, supporting nuanced provenance tracking.

Temporal and quantitative metadata—`createddate` and `sizebytes`—provide the material context for each instrument or data artifact. The `created_date` field records when an instrument was instantiated or its data stream began, with dates ranging from `2023-01-25` for an acoustic transducer to `2024-12-01` for a seismograph, establishing a chronological ordering that is essential for versioning and temporal analysis. The `size_bytes` field quantifies the data volume associated with each instrument, spanning from approximately 542 MB for an ion chamber deployed on `2024-07-30` to 632 MB for another ion chamber created on `2023-12-08`. These magnitudes are not arbitrary; they reflect the sampling rate, duration, and fidelity of the signals emitted—`EVID-0006` and `EVID-0007` being the signal identifiers produced by the respective instruments—and inform storage provisioning, transfer planning, and data retention policies.

**t_instrument_only_emits_type**

| id | instrument | emits_signal | created_date | size_bytes |
| --- | --- | --- | --- | --- |
| TYPE-0001 | Seismograph | EVID-0006 | 2024-12-01 | 370347470 |
| TYPE-0002 | Ion chamber | EVID-0007 | 2023-12-08 | 631989835 |
| TYPE-0003 | Acoustic transducer | EVID-0007 | 2023-01-25 | 565520223 |
| TYPE-0004 | Ion chamber | EVID-0007 | 2024-07-30 | 541950157 |
| TYPE-0005 | Spectrometer | EVID-0003 | 2024-06-22 | 83957422 |
| TYPE-0006 | Magnetometer | EVID-0001 | 2024-05-04 | 105995168 |
| TYPE-0007 | Particle detector | EVID-0002 | 2024-10-26 | 587447986 |

Together, these fields form a coherent provenance model: identifiers establish unambiguous reference, owners assign accountability, the subject-role-target pattern encodes relational semantics, and createddate alongside sizebytes anchor each record in time and material scale. When a claim such as "Carbon emissions peaked" is refuted by evidence, the system does not merely store a boolean outcome; it records which agent produced the refutation, under what identifier and URI, who owns the resulting artifact, the role that agent played in the refutation chain, when the instrument was created, and how much data was generated. This density of metadata ensures that every assertion and its refutation can be traced, audited, and reproduced.

**t_claim_refuted_by_evidence**

| id | claim |
| --- | --- |
| EVID-0001 | Carbon emissions peaked |
| EVID-0002 | Patient dosage exceeds limit |
| EVID-0003 | Supply chain disruption |
| EVID-0004 | Firmware update breaks encryption |
| EVID-0005 | Algorithm bias flagged |
| EVID-0006 | Market volatility threshold |
| EVID-0007 | Carbon emissions peaked |

**t_claim_refuted_by_evidence_refuted_by_evidence**

| id | refuted_by_evidence |
| --- | --- |
| EVID-0001 | Compliance checklist v2.1 |
| EVID-0002 | Compliance checklist v2.1 |
| EVID-0003 | Compliance checklist v2.1 |
| EVID-0004 | Satellite imagery timestamp |
| EVID-0005 | Peer reviewed study 10.1234 |
| EVID-0006 | Lab bench measurement sheet |
| EVID-0007 | Satellite imagery timestamp |
| EVID-0008 | Clinical trial phase III |

**t_claim_refuted_by_evidence__refuted_by_evidence**

| id | claim_id | refuted_by_evidence_id | role |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0006 | EVID-0004 | observer |
| EVID-0002 | EVID-0007 | EVID-0004 | observer |
| EVID-0003 | EVID-0003 | EVID-0007 | observer |
| EVID-0004 | EVID-0001 | EVID-0003 | reviewer |
| EVID-0005 | EVID-0004 | EVID-0005 | reviewer |
| EVID-0006 | EVID-0001 | EVID-0007 | contributor |
| EVID-0007 | EVID-0007 | EVID-0005 | owner |
| EVID-0008 | EVID-0003 | EVID-0001 | owner |