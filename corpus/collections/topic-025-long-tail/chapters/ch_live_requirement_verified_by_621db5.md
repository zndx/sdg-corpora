---
chapter_id: ch_live_requirement_verified_by_621db5
topic_id: 25
family: 03_directive_governance
cited_terms: ['requirement_verified_by', 'requirement_only_satisfied_by', 'ebpfprogram_writes_to_map_xref']
model: engine-refine
---

Operational governance of kernel-level execution environments demands precise instrumentation of every deployed eBpfprogram, where each instance is anchored by a unique identifier and catalogued across version, size_bytes, category, and misc classification fields. The structural integrity of such deployments hinges on tracking binary footprint and revision state; an eBPF program consuming 784,335,640 bytes at version 12 requires distinct audit scrutiny compared to a 113,209,263-byte variant at version 9. Categorization schemes—ranging from Ebpfprogram Category 01 through Ebpfprogram Category 04—provide the taxonomic scaffolding necessary for risk stratification, while misc labels such as Ebpfprogram Label 01 serve as operational tags for lifecycle routing and environment segregation. Without this dimensional granularity, compliance officers cannot correlate resource consumption with regulatory thresholds or enforce version pinning across heterogeneous host fleets.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | 784335640 | 12 |
| XREF-0002 | XREF-0003 | 641704069 | 9 |
| XREF-0003 | XREF-0003 | 113209263 | 11 |
| XREF-0004 | XREF-0005 | 161013093 | 12 |
| XREF-0005 | XREF-0004 | 352203820 | 12 |
| XREF-0006 | XREF-0003 | 167519051 | 1 |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| XREF-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| XREF-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| XREF-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| XREF-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| XREF-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| XREF-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| XREF-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| XREF-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

Compliance validation operates through a layered verification architecture that binds abstract policy mandates to concrete execution controls via subject and target relationships. Requirements such as the Data retention policy and Compliance baseline are not merely documented; they are instantiated as verifiable assertions (VERI-0001 through VERI-0004) that must be satisfied by designated authorities. The verification chain distinguishes between active and passive oversight: an Automated scanner or System validator may assume the reviewer role when validating data persistence mechanisms, whereas a Lab director or Internal audit team typically functions as an observer, providing independent attestation. This role-based partitioning—owner, reviewer, observer—ensures that no single entity holds unchecked authority over compliance outcomes, thereby satisfying segregation-of-duties mandates inherent to enterprise governance frameworks.

Technical satisfaction of regulatory requirements follows a parallel mapping discipline, wherein cryptographic and networking controls are explicitly linked to their governing standards. The OWASP authentication flow, IEEE 802.1Q tagging specifications, and TLS 1.3 cipher suite mandates are satisfied by concrete implementations including Let’s Encrypt, OpenSSL 3.0, FIPS 140-3 modules, and the Zstd library. Each satisfaction event is recorded through a subject-to-target linkage that preserves the provenance of the control while assigning a functional role—predominantly reviewer or observer—to the validating component. Identifier cross-referencing (SATI-0001 through SATI-0004) creates an auditable trail that survives infrastructure refactoring; when a TLS 1.3 requirement is satisfied by a FIPS 140-3 module, the relationship is not ephemeral but persists as a structured assertion, enabling continuous compliance monitoring and automated drift detection.

**t_requirement_verified_by**

| id | requirement |
| --- | --- |
| VERI-0001 | Data retention policy |
| VERI-0002 | Compliance baseline |
| VERI-0003 | Data retention policy |
| VERI-0004 | Data retention policy |
| VERI-0005 | Audit logging mandate |
| VERI-0006 | Provenance tracking spec |

**t_requirement_verified_by_verified_by**

| id | verified_by |
| --- | --- |
| VERI-0001 | Automated scanner |
| VERI-0002 | Lab director |
| VERI-0003 | Internal audit team |
| VERI-0004 | System validator |
| VERI-0005 | Automated scanner |
| VERI-0006 | Automated scanner |

**t_requirement_verified_by__verified_by**

| id | requirement_id | verified_by_id | role |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0006 | VERI-0006 | owner |
| VERI-0002 | VERI-0002 | VERI-0003 | observer |
| VERI-0003 | VERI-0004 | VERI-0006 | reviewer |
| VERI-0004 | VERI-0003 | VERI-0005 | observer |
| VERI-0005 | VERI-0004 | VERI-0001 | owner |
| VERI-0006 | VERI-0004 | VERI-0002 | owner |
| VERI-0007 | VERI-0001 | VERI-0002 | reviewer |
| VERI-0008 | VERI-0004 | VERI-0001 | observer |

**t_requirement_only_satisfied_by**

| id | requirement |
| --- | --- |
| SATI-0001 | OWASP authentication flow |
| SATI-0002 | IEEE 802.1Q tagging |
| SATI-0003 | IEEE 802.1Q tagging |
| SATI-0004 | TLS 1.3 cipher suite |
| SATI-0005 | NIST 800-53 audit logging |
| SATI-0006 | GDPR data residency |

**t_requirement_only_satisfied_by_satisfied_by**

| id | satisfied_by |
| --- | --- |
| SATI-0001 | Let's Encrypt |
| SATI-0002 | OpenSSL 3.0 |
| SATI-0003 | FIPS 140-3 module |
| SATI-0004 | Zstd library |
| SATI-0005 | AWS KMS |
| SATI-0006 | AWS KMS |
| SATI-0007 | Zstd library |

**t_requirement_only_satisfied_by__satisfied_by**

| id | requirement_id | satisfied_by_id | role |
| --- | --- | --- | --- |
| SATI-0001 | SATI-0001 | SATI-0004 | reviewer |
| SATI-0002 | SATI-0003 | SATI-0005 | observer |
| SATI-0003 | SATI-0002 | SATI-0002 | reviewer |
| SATI-0004 | SATI-0003 | SATI-0003 | reviewer |
| SATI-0005 | SATI-0006 | SATI-0002 | observer |
| SATI-0006 | SATI-0001 | SATI-0003 | contributor |
| SATI-0007 | SATI-0003 | SATI-0004 | observer |
| SATI-0008 | SATI-0005 | SATI-0001 | owner |

The convergence of program metadata and compliance mapping establishes a deterministic audit fabric capable of withstanding regulatory examination. When an eBPF program’s size_bytes and version are correlated with its category classification, governance systems can automatically trigger verification workflows tied to specific requirements. The subject and target identifiers function as the relational glue that binds kernel telemetry to policy enforcement, while role assignments dictate the workflow state and approval thresholds. In practice, this architecture transforms static configuration records into dynamic compliance artifacts: a version 12 deployment exceeding 700 megabytes will route through reviewer-assigned verification gates, cross-referencing both Data retention policy mandates and TLS 1.3 satisfaction records. Such precision eliminates ambiguity in incident response, ensures that every byte of kernel-space execution is accounted for, and maintains an unbroken chain of custody from policy definition to runtime enforcement.