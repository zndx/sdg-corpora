---
chapter_id: ch_live_requirement_only_satisfied_by_bcdb26
topic_id: 25
family: 03_directive_governance
cited_terms: ['requirement_only_satisfied_by', 'requirement_refines', 'requirement_satisfies']
model: engine-refine
---

In governance and compliance architectures, requirements do not exist as isolated statements; they persist as addressable artifacts whose meaning is fixed by stable identifiers and elaborated through typed relationships. An identifier such as SATI-0001 or REFI-0003 functions as the durable handle by which auditors, engineers, and policy owners refer to the same obligation across satisfaction chains, refinement hierarchies, and crosswalk tables without ambiguity. When an OWASP authentication flow is recorded under SATI-0001 and later linked—through a separate association—to a TLS 1.3 cipher suite requirement and to a Zstd library implementation, each hop retains its own identifier while the semantic thread remains traceable. This indirection is not administrative overhead; it is the mechanism that permits evidence to accumulate over time, permits partial updates without rewriting entire policy corpora, and permits automated validators to confirm that every cited control still resolves to a live record.

Subject and target designate the directional endpoints of a relationship and thereby determine what question a given edge answers. In a satisfaction mapping, the subject is the requirement whose compliance posture is under evaluation—SATI-0003, for instance, when IEEE 802.1Q tagging is the stated obligation—while the target is the concrete artifact alleged to discharge it, such as the FIPS 140-3 module referenced at SATI-0003 in the satisfied-by registry or the OpenSSL 3.0 build that appears as a distinct target identity. The direction matters: reversing subject and target would invert the audit narrative, implying that a cryptographic module requires a VLAN standard rather than that VLAN tagging is implemented through an approved module. Mature frameworks therefore treat subject–target pairs as semantically oriented facts, not interchangeable foreign keys, and require that role, scope, and priority annotations attach to the edge rather than to either endpoint alone.

Role qualifies how a target participates relative to a subject without collapsing distinct participation modes into a single “implements” verb. Where SATI-0001 binds the OWASP authentication flow to the Zstd library with role reviewer, the library is not claimed as the authenticating component; it is positioned as an reviewing party in the satisfaction argument—distinct from the reviewer assignments that attach SATI-0003 to the FIPS 140-3 module and SATI-0002 to OpenSSL 3.0, and distinct again from the observer role assigned when SATI-0003 is associated with IEEE 802.1Q tagging. Roles make heterogeneous evidence chains legible: a requirement may be satisfied in part by an enforcing control, witnessed by an observing component, and independently reviewed by a separate artifact, each relationship carrying its own identifier and audit trail.

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

Scope and priority distribute obligations across organizational and operational boundaries and establish the order in which conflicts are adjudicated. Scope values—team, regional, local, global—signal where a refinement or satisfaction claim is authoritative rather than merely illustrative. A Data Retention Policy refined at team scope into a System Availability Target carries different jurisdictional weight than the same parent policy refined at global scope into GDPR Compliance, even when both refinements share the REFI family of identifiers. Priority, conversely, ranks competing satisfiers when multiple targets address one subject: Encryption Standard AES-256 mapped to a FIPS 140-2 Module at priority 1 expresses a preferred discharge path, whereas Audit Trail Mandate and ISO 27001 Annex A satisfactions recorded at priority 5 indicate controls that remain valid but subordinate when resource constraints or exception processes force a choice. Together, scope and priority prevent silent over-generalization—no regional latency limit may be mistaken for a global retention rule—and prevent silent over-commitment—no lower-priority scanner may override a higher-priority cryptographic module without explicit waiver.

Language anchors the human-readable surface of a requirement to a governed locale, ensuring that refinement and communication remain faithful as policy propagates across jurisdictions. A Data Retention Policy articulated in Spanish for a team-scoped refinement into a System Availability Target, in English for regional and local refinements into Network Latency Limit and Pipeline Throughput Goal respectively, and in French for a global refinement into GDPR Compliance, demonstrates that multilingual expression is not cosmetic translation but a control on interpretive drift: auditors must verify not only semantic equivalence but also that the correct language variant is cited in the correct scope. Identifier stability crosses language boundaries; the obligation referenced by REFI-0004 remains the same logical object whether presented to a francophone executive committee or an anglophone engineering squad, while the language tag records which lexical rendering is authoritative for a given audience.

**t_requirement_refines**

| id | requirement | refines | scope | language |
| --- | --- | --- | --- | --- |
| REFI-0001 | Access Control Matrix | System Availability Target | team | es |
| REFI-0002 | Data Retention Policy | Network Latency Limit | regional | en |
| REFI-0003 | Data Retention Policy | Pipeline Throughput Goal | local | en |
| REFI-0004 | Data Retention Policy | GDPR Compliance | global | fr |

In practice, these dimensions interlock during assessment. An assessor begins from an identifier, confirms the subject requirement text—whether an Access Control Matrix, an IEEE 802.1Q tagging mandate, or an Audit Trail Mandate—locates targets and their roles along satisfaction and satisfied-by paths, and then weighs the resulting posture against scope and priority. Refinement edges explain why a high-level Data Retention Policy decomposes into operable targets such as container image scanning at team priority 2 or data masking at team priority 5, while satisfied-by edges explain why TLS 1.3 cipher suite selection may be discharged through a Let's Encrypt deployment yet still require an independent reviewer relationship to a compression library. The architecture’s purpose is evidentiary closure: every compliance claim is a typed, scoped, prioritized, and—where necessary—multilingual relationship between named subjects and named targets, recoverable in full from identifiers alone long after the authors of the original mapping have left the organization.

**t_requirement_satisfies**

| id | requirement | satisfies | priority | scope |
| --- | --- | --- | --- | --- |
| SATI-0001 | Audit Trail Mandate | Data Masking Engine | 5 | team |
| SATI-0002 | Data Retention Policy | Container Image Scan | 2 | team |
| SATI-0003 | Encryption Standard AES-256 | FIPS 140-2 Module | 1 | regional |
| SATI-0004 | ISO 27001 Annex A | WAF Rule Set | 5 | team |
| SATI-0005 | Protocol TLS 1.3 | Backup Encryption Routine | 2 | team |
| SATI-0006 | Data Retention Policy | Vault Key Rotation | 1 | local |