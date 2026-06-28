---
chapter_id: ch_live_quantum_cyber_security_field_ac39cc
topic_id: 16
family: 08_derived
cited_terms: ['quantum_cyber_security_field', 'control_subclass', 'verification_traces_requirement']
model: engine-refine
---

Quantum cybersecurity governance rests on a layered ontology in which research domains, operational controls, and verification artefacts are linked through stable identifiers and typed relationships. A quantumcybersecurityfield names a coherent line of defensive or cryptographic inquiry—Quantum Secure Direct Communication, Measurement-Device-Independent QKD, or Post-Quantum Cryptography—and each such field is keyed by an identifier (for example FIEL-0001 through FIEL-0004) so that policy, risk registers, and audit evidence can refer to the same concept across systems and reporting cycles. Fields do not exist in isolation: each is associated with one or more communicationsecurityaspect values that specify what security property or failure mode the field actually studies. Emitter Calibration Drift attaches to quantum secure direct communication; Channel Eavesdropping Detection appears against both measurement-device-independent QKD and post-quantum cryptography; Quantum Memory Coherence is the aspect studied under one post-quantum cryptography entry. These aspects translate abstract field labels into inspectable security concerns—calibration integrity, eavesdropping on the channel, memory decoherence—so that threat modelling and control selection can proceed from named phenomena rather than from marketing terminology alone.

**t_quantum_cyber_security_field**

| id | quantum_cyber_security_field |
| --- | --- |
| FIEL-0001 | Quantum Secure Direct Communication |
| FIEL-0002 | Measurement-Device-Independent QKD |
| FIEL-0003 | Post-Quantum Cryptography |
| FIEL-0004 | Post-Quantum Cryptography |
| FIEL-0005 | Quantum Digital Signatures |
| FIEL-0006 | Quantum Key Distribution |

**t_quantum_cyber_security_field_studies_domain_aspect**

| id | studies_domain_aspect |
| --- | --- |
| FIEL-0001 | Emitter Calibration Drift |
| FIEL-0002 | Channel Eavesdropping Detection |
| FIEL-0003 | Quantum Memory Coherence |
| FIEL-0004 | Channel Eavesdropping Detection |
| FIEL-0005 | Protocol Authentication Tokens |
| FIEL-0006 | Network Topology Integrity |

**t_verification_traces_requirement**

| id | verification |
| --- | --- |
| REQU-0001 | Functional Safety Assessment |
| REQU-0002 | Type Certification Review |
| REQU-0003 | ISO 9001 Compliance Audit |
| REQU-0004 | FAT Factory Acceptance |
| REQU-0005 | Type Certification Review |
| REQU-0006 | Type Certification Review |

The subject–target–role pattern is the structural mechanism through which those associations acquire governance meaning. In a studies-domain-aspect linkage, the subject is the quantum cybersecurity field entity and the target is the communication security aspect entity; the role qualifies how that subject relates to that target. A contributor role on FIEL-0003 linked to FIEL-0001 indicates that post-quantum cryptography materially informs channel eavesdropping detection without necessarily owning the aspect definition, whereas an owner role on the same aspect under a different subject line signals accountability for its definition, scope, or evidence requirements. The same tripartite pattern recurs in classical control taxonomies: a control subclass subject (such as TLS 1.3 mandatory, keyed CONT-0004) is paired with a mitigates target (network intrusion, service outage, phishing attack) under roles ranging from owner and reviewer to observer and contributor. TLS 1.3 mandatory may own the mitigation of one network-intrusion record while simultaneously contributing to service-outage mitigation under another control identifier, illustrating that roles are edge properties, not node labels—two subjects can reference the same target with different stewardship obligations.

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

**t_control_subclass**

| id | control |
| --- | --- |
| CONT-0001 | MFA enforcement |
| CONT-0002 | Backup frequency policy |
| CONT-0003 | Access review cycle |
| CONT-0004 | TLS 1.3 mandatory |
| CONT-0005 | Session timeout limit |
| CONT-0006 | Audit log retention |
| CONT-0007 | MFA enforcement |

**t_control_subclass_mitigates**

| id | mitigates |
| --- | --- |
| CONT-0001 | Service outage |
| CONT-0002 | Service outage |
| CONT-0003 | Phishing attack |
| CONT-0004 | Network intrusion |
| CONT-0005 | System downtime |
| CONT-0006 | Credential stuffing |
| CONT-0007 | Phishing attack |
| CONT-0008 | Data exfiltration |

**t_control_subclass__mitigates**

| id | control_id | mitigates_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0004 | CONT-0007 | owner |
| CONT-0002 | CONT-0004 | CONT-0002 | reviewer |
| CONT-0003 | CONT-0007 | CONT-0004 | observer |
| CONT-0004 | CONT-0001 | CONT-0002 | contributor |
| CONT-0005 | CONT-0006 | CONT-0002 | observer |
| CONT-0006 | CONT-0005 | CONT-0001 | owner |
| CONT-0007 | CONT-0001 | CONT-0002 | observer |
| CONT-0008 | CONT-0006 | CONT-0008 | observer |

Identifiers anchor every node in this graph and must remain immutable across schema evolution. FIEL-, CONT-, and REQU- prefixed keys partition the namespace by artefact class while preserving joinability: a junction row references quantum_id and studies_domain_aspect_id as foreign identifiers, and a control-to-mitigation bridge references control_id and mitigates_id in the same way. This separation matters because display strings change—Post-Quantum Cryptography appears twice under distinct field identifiers—and because compliance queries must resolve identity by key, not by label. Role cardinality on junction rows is typically one role per edge, which is sufficient for RACI-style accountability without overloading the relationship type itself.

Verification trace requirements introduce the entity–attr–attr_type model, which governs how executable evidence is described and stored. An entity is a requirement instance—Functional Safety Assessment, Type Certification Review, ISO 9001 Compliance Audit, or FAT Factory Acceptance—identified by REQU-0001 and siblings. Each entity may carry multiple attrs: duration_seconds typed as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, host_name as xsd:string. The attr names define the semantic slot; attr_type constrains validation, serialization, and cross-system interchange so that a duration is never persisted as an unparsed string and a timestamp conforms to lexical rules auditors expect. Typed value stores then hold the misc payload—the concrete observation bound to a specific entity–attr pair. REQU-0001 records duration_seconds of 5386.82, end_time 2025-01-18T10:03:30, exit_code 954, and host_name gw-12; REQU-0002 carries a distinct end_time (2024-03-08T07:44:16) and exit_code 69 on overlapping attribute definitions, demonstrating that attr definitions are shared schema while misc values are entity-specific facts.

**t_verification_traces_requirement_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REQU-0001 | duration_seconds | xsd:decimal |
| REQU-0002 | end_time | xsd:dateTime |
| REQU-0003 | exit_code | xsd:integer |
| REQU-0004 | host_name | xsd:string |
| REQU-0005 | log_level | xsd:string |
| REQU-0006 | phase | xsd:string |
| REQU-0007 | retry_count | xsd:integer |
| REQU-0008 | scheduled_at | xsd:dateTime |

**t_verification_traces_requirement_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0002 | 2025-01-18T10:03:30 |
| REQU-0002 | REQU-0001 | REQU-0008 | 2023-06-09T08:44:28 |
| REQU-0003 | REQU-0001 | REQU-0009 | 2025-02-02T23:23:29 |
| REQU-0004 | REQU-0002 | REQU-0002 | 2024-03-08T07:44:16 |
| REQU-0005 | REQU-0002 | REQU-0008 | 2024-10-17T04:41:38 |
| REQU-0006 | REQU-0002 | REQU-0009 | 2024-09-18T04:36:09 |
| REQU-0007 | REQU-0003 | REQU-0002 | 2025-05-20T16:00:41 |
| REQU-0008 | REQU-0003 | REQU-0008 | 2025-05-09T00:47:08 |

**t_verification_traces_requirement_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0001 | 5386.82 |
| REQU-0002 | REQU-0002 | REQU-0001 | 3098.08 |
| REQU-0003 | REQU-0003 | REQU-0001 | 4624.20 |
| REQU-0004 | REQU-0004 | REQU-0001 | 6273.82 |
| REQU-0005 | REQU-0005 | REQU-0001 | 833.29 |
| REQU-0006 | REQU-0006 | REQU-0001 | 3490.28 |

**t_verification_traces_requirement_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0003 | 954 |
| REQU-0002 | REQU-0001 | REQU-0007 | 329 |
| REQU-0003 | REQU-0002 | REQU-0003 | 641 |
| REQU-0004 | REQU-0002 | REQU-0007 | 69 |
| REQU-0005 | REQU-0003 | REQU-0003 | 829 |
| REQU-0006 | REQU-0003 | REQU-0007 | 87 |
| REQU-0007 | REQU-0004 | REQU-0003 | 46 |
| REQU-0008 | REQU-0004 | REQU-0007 | 237 |

**t_verification_traces_requirement_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REQU-0001 | REQU-0001 | REQU-0004 | gw-12 |
| REQU-0002 | REQU-0001 | REQU-0005 | Log Level 02 |
| REQU-0003 | REQU-0001 | REQU-0006 | execution |
| REQU-0004 | REQU-0001 | REQU-0010 | complete |
| REQU-0005 | REQU-0001 | REQU-0011 | Triggered By 05 |
| REQU-0006 | REQU-0002 | REQU-0004 | ingest-21 |
| REQU-0007 | REQU-0002 | REQU-0005 | Log Level 07 |
| REQU-0008 | REQU-0002 | REQU-0006 | execution |

Partitioning misc by attr_type is a deliberate normalisation choice: decimal, datetime, integer, and varchar tables enforce type safety at the persistence layer and simplify aggregate reporting (summing durations, filtering by exit_code thresholds, ordering by end_time) without runtime casting. Attributes not present for a given entity simply have no row in the corresponding value table, which is preferable to nullable omnibus columns that obscure data quality. Host-name and log-level strings (gw-12, Log Level 02), execution-phase markers (execution, complete), and historical timestamps spanning 2023 through 2025 together form an auditable run record suitable for factory acceptance and certification workflows, where proving when a check ran, how long it took, on which host, and whether it completed is as important as naming the verification activity itself.

In operational practice, these constructs interlock: quantum field identifiers and their aspect linkages inform which controls are in scope and which mitigations must be evidenced; control subjects mapped to threat targets under explicit roles define who must attest each mitigation; and verification entities with typed attrs and misc values supply the artefacts regulators and internal assurance functions consume. Queries that traverse subject–target edges filtered by role answer accountability questions; queries that join entity to attr to typed misc answer evidentiary questions; and queries that resolve quantumcybersecurityfield through communicationsecurityaspect bridge the research domain to the control and verification layers. The density of the model—many identifiers, few relationship types, strictly typed observations—is what allows a single governance framework to remain legible as the underlying technology portfolio shifts from QKD deployments toward post-quantum algorithm migration without rewriting the compliance vocabulary.