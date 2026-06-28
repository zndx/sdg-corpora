---
chapter_id: ch_live_identifier_uniquely_identifies_b3c5ca
topic_id: 7
family: 01_foundation
cited_terms: ['identifier_uniquely_identifies', 'reference_subclass', 'quantum_cyber_security_field']
model: engine-refine
---

The governance of quantum cybersecurity infrastructure rests upon a layered identification and reference architecture that ensures every asset, standard, and domain aspect can be unambiguously traced to its origin and purpose. At the foundation, the identifier registry assigns persistent, globally unique handles to digital objects across heterogeneous formats: the DOI `doi:10.1145/3641519` anchors a provenance node root issued on 2024-09-07 in JSON encoding, while the same DOI, reissued on 2024-01-30, resolves to a data pipeline stage 3; the ISBN-based identifier `urn:isbn:9780131103627`, formatted under E.164 and dated 2023-03-13, identifies a container image at sha256; and the ORCID `orcid:0000-0002-1825-0097`, issued 2023-03-01 in JSON, tags a second instance of data pipeline stage 3. Each identifier carries a format designation and an issued date, establishing both the syntactic envelope and temporal provenance of the resource it names.

**t_identifier_uniquely_identifies**

| id | identifier | identifies | format | issued_date |
| --- | --- | --- | --- | --- |
| IDEN-0001 | doi:10.1145/3641519 | provenance node root | JSON | 2024-09-07 |
| IDEN-0002 | urn:isbn:9780131103627 | data pipeline stage 3 | E.164 | 2023-03-13 |
| IDEN-0003 | doi:10.1145/3641519 | container image sha256 | CSV | 2024-01-30 |
| IDEN-0004 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | JSON | 2023-03-01 |
| IDEN-0005 | pmid:12345678 | metadata registry entry | E.164 | 2025-03-08 |
| IDEN-0006 | doi:10.1016/j.softx.2020.100312 | metadata registry entry | ISO-8601 | 2025-05-18 |
| IDEN-0007 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | RFC-3339 | 2024-09-01 |

Reference subclass records extend this identification layer by introducing namespace-scoped pointers that link one entity to another within a defined governance context. Reference 01, issued 2024-02-21, points to Points To 01 within the provenance namespace; Reference 02, dated 2024-12-07, resolves to Points To 02 under lineage; Reference 03, issued 2025-05-30, targets Points To 03 within governance; and Reference 04, dated 2023-09-26, also operates within the lineage namespace. The namespace column functions as a scoping mechanism, ensuring that references with identical textual targets remain disambiguated by their administrative domain—provenance, lineage, or governance—while the issued date records the moment each pointer was registered.

**t_reference_subclass**

| id | reference | points_to | issued_date | namespace |
| --- | --- | --- | --- | --- |
| REFE-0001 | Reference 01 | Points To 01 | 2024-02-21 | provenance |
| REFE-0002 | Reference 02 | Points To 02 | 2024-12-07 | lineage |
| REFE-0003 | Reference 03 | Points To 03 | 2025-05-30 | governance |
| REFE-0004 | Reference 04 | Points To 04 | 2023-09-26 | lineage |
| REFE-0005 | Reference 05 | Points To 05 | 2024-10-25 | provenance |
| REFE-0006 | Reference 06 | Points To 06 | 2023-04-21 | catalog |

The quantum cybersecurity field taxonomy enumerates the technical domains that constitute the discipline's research and operational corpus. Quantum Secure Direct Communication, Measurement-Device-Independent QKD, and Post-Quantum Cryptography (appearing twice, under identifiers FIEL-0003 and FIEL-0004) represent the core fields under governance. Each field is associated with one or more domain aspects that describe the specific security concerns or operational challenges it addresses: Emitter Calibration Drift, Channel Eavesdropping Detection (also duplicated under FIEL-0004), and Quantum Memory Coherence. These aspects—collectively termed the communication security aspect—capture the granular phenomena that field-level research must mitigate or detect.

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

The junction between fields and domain aspects is mediated by a role-annotated association table that explicitly declares the nature of each relationship. The subject column references the quantum cybersecurity field identifier, while the target column references the domain aspect identifier; the role column specifies whether the field acts as a contributor to, or owner of, the aspect. For instance, field FIEL-0003 (Post-Quantum Cryptography) contributes to aspect FIEL-0001 (Emitter Calibration Drift), and field FIEL-0001 (Quantum Secure Direct Communication) both contributes to and owns aspect FIEL-0001, establishing a dual relationship. This role distinction is critical for attribution and accountability: ownership implies primary responsibility for the aspect's definition and mitigation strategy, whereas contribution denotes a supporting or complementary role within the broader field's scope.

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