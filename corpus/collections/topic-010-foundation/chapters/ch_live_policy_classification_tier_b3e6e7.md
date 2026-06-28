---
chapter_id: ch_live_policy_classification_tier_b3e6e7
topic_id: 10
family: 03_directive_governance
cited_terms: ['policy_classification_tier', 'ebpfmap_basic', 'kernelhook_with_attached_program']
model: engine-refine
---

In kernel observability and policy-governed runtime enforcement, an attached program denotes bytecode loaded into the kernel and bound to a hook point—tracepoint, kprobe, cgroup, or similar—where it executes on each qualifying event. Operational inventories treat the attached program not as an anonymous blob but as a governed artifact keyed by a stable identifier (for example PROG-0001 through PROG-0004 in the program dimension) and described by categorical and miscellaneous attributes that separate taxonomic placement from human-readable naming. Attached Program Category 01 through Attached Program Category 04 partition the fleet by functional or jurisdictional class, while labels such as Attached Program Label 01 supply the misc field used in dashboards, change tickets, and audit narratives without overloading the primary key. Fact records for kernel hooks carry attached_program_key as the foreign linkage into that dimension, together with size_bytes and version as the two quantities auditors weigh first: footprint, expressed in the sample as values from roughly 36 MB (PROG-0001 at 36,342,735 bytes) to roughly 561 MB (PROG-0002 at 560,962,979 bytes), and revision, where the same logical program may appear at version 1 in multiple hook rows (PROG-0003 and PROG-0004 both reference PROG-0001 at version 1) while siblings advance independently (PROG-0002 at version 10).

**fact_kernelhook**

| id | attached_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0006 | 36342735 | 3 |
| PROG-0002 | PROG-0004 | 560962979 | 1 |
| PROG-0003 | PROG-0001 | 456299832 | 10 |
| PROG-0004 | PROG-0001 | 272822846 | 1 |

**dim_attached_program**

| id | attached_program_label | attached_program_category |
| --- | --- | --- |
| PROG-0001 | Attached Program Label 01 | Attached Program Category 01 |
| PROG-0002 | Attached Program Label 02 | Attached Program Category 02 |
| PROG-0003 | Attached Program Label 03 | Attached Program Category 03 |
| PROG-0004 | Attached Program Label 04 | Attached Program Category 04 |
| PROG-0005 | Attached Program Label 05 | Attached Program Category 05 |
| PROG-0006 | Attached Program Label 06 | Attached Program Category 06 |

eBPF maps constitute the complementary persistence layer: kernel-resident key–value stores that attached programs read and write to maintain connection tables, rate counters, policy decisions, or cross-CPU aggregates. In the dimensional model, each ebpfmap receives identifier EBPF-0001–EBPF-0004, a category (Ebpfmap Category 01–04) that signals intended use—routing, telemetry, enforcement buffer, or shared configuration—and a misc label (Ebpfmap Label 01–04) for operator-facing disambiguation when several maps of the same category coexist. The fact table binds ebpfmap_key to concrete instances and records size_bytes and version per materialized map; the evidence shows wide dispersion in allocated space, from approximately 31 MB (EBPF-0003, 31,105,012 bytes) to approximately 354 MB (EBPF-0001, 354,373,995 bytes), and in revision cadence (versions 3, 5, 6, and 12 across the four rows). Maps and programs are not interchangeable entities—maps hold state; programs hold logic—but compliance reviews treat them as a coupled surface: a map version bump without a reconciled program version, or the inverse, is a common source of silent behavioral drift.

**fact_ebpfmap**

| id | ebpfmap_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0002 | 208979093 | 3 |
| EBPF-0002 | EBPF-0005 | 156714508 | 6 |
| EBPF-0003 | EBPF-0003 | 31105012 | 12 |
| EBPF-0004 | EBPF-0001 | 354373995 | 5 |
| EBPF-0005 | EBPF-0002 | 866267293 | 2 |

**dim_ebpfmap**

| id | ebpfmap_label | ebpfmap_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfmap Label 01 | Ebpfmap Category 01 |
| EBPF-0002 | Ebpfmap Label 02 | Ebpfmap Category 02 |
| EBPF-0003 | Ebpfmap Label 03 | Ebpfmap Category 03 |
| EBPF-0004 | Ebpfmap Label 04 | Ebpfmap Category 04 |
| EBPF-0005 | Ebpfmap Label 05 | Ebpfmap Category 05 |
| EBPF-0006 | Ebpfmap Label 06 | Ebpfmap Category 06 |

Identifiers anchor the entire reference architecture. Whether prefixed TIER-, EBPF-, or PROG-, the identifier column marks the surrogate key that survives relabeling, category reassignment, and policy rewording. Governance queries therefore join on identifier rather than on display strings, because Medical Privacy Directive appears twice at the tier policy field (TIER-0001 and TIER-0004) while denoting potentially distinct tier records, and because fact tables deliberately point across identifier namespaces—ebpfmap_key values such as EBPF-0002 and EBPF-0005 reference map identities outside the four-row dimension slice, and attached_program_key PROG-0006 does likewise for programs—modeling the usual production case in which the inventory excerpt is a governed subset of a larger fleet. Version integers on facts are not decorative; they are the longitudinal coordinate used to prove that a cited artifact at audit time matches the artifact approved in change control.

Policy classification introduces subject–target–role semantics orthogonal to kernel object typing. Here the subject is the policy-side participant (policy_id in the association table), the target is the classification-tier participant (at_classification_tier_id), and role names the fiduciary stance of the subject toward the target: owner, observer, contributor, or reviewer. A single tier identifier in the classification dimension—Restricted Access for TIER-0002 and TIER-0004—can therefore participate in multiple bindings with different subjects and roles; TIER-0002 carries owner toward TIER-0003 while Financial SEC Reporting Rule’s tier row is classified at Restricted Access, illustrating how regulatory instrument and sensitivity band are linked without collapsing them into one column. Subjects in the junction need not equal the tier row’s own id: TIER-0003’s association lists policy_id TIER-0006 against at_classification_tier_id TIER-0004 with role contributor, demonstrating cross-tier delegation patterns that pure hierarchy tables cannot express. Roles matter in practice because entitlement matrices, segregation-of-duties checks, and escalation paths are keyed on them; an observer of Level 2 Sensitive (TIER-0003) is not authorized to mutate mappings that an owner of Tier 3 Critical (TIER-0001) controls.

**t_policy_classification_tier**

| id | policy |
| --- | --- |
| TIER-0001 | Medical Privacy Directive |
| TIER-0002 | Financial SEC Reporting Rule |
| TIER-0003 | Environmental EPA Emissions Standard |
| TIER-0004 | Medical Privacy Directive |
| TIER-0005 | Open Source License Policy |
| TIER-0006 | National Cybersecurity Strategy |

**t_policy_classification_tier_at_classification_tier**

| id | at_classification_tier |
| --- | --- |
| TIER-0001 | Tier 3 Critical |
| TIER-0002 | Restricted Access |
| TIER-0003 | Level 2 Sensitive |
| TIER-0004 | Restricted Access |
| TIER-0005 | Restricted Access |
| TIER-0006 | Restricted Access |
| TIER-0007 | Level 4 Sensitive |

**t_policy_classification_tier__at_classification_tier**

| id | policy_id | at_classification_tier_id | role |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0002 | TIER-0002 | owner |
| TIER-0002 | TIER-0002 | TIER-0003 | observer |
| TIER-0003 | TIER-0006 | TIER-0004 | contributor |
| TIER-0004 | TIER-0004 | TIER-0005 | reviewer |
| TIER-0005 | TIER-0001 | TIER-0003 | observer |
| TIER-0006 | TIER-0006 | TIER-0003 | owner |
| TIER-0007 | TIER-0004 | TIER-0002 | owner |
| TIER-0008 | TIER-0005 | TIER-0001 | owner |

Taken together, category and misc attributes supply the vocabulary layer, identifier and version supply the provenance layer, size_bytes supplies the capacity and risk layer, and subject–target–role triples supply the authorization layer over classified policy tiers. Operational guides built on this schema require analysts to traverse dimensions for meaning (label and category), facts for measured reality (bytes and version), and policy bridges for accountability (who, in what role, binds which policy subject to which classification target). Where Environmental EPA Emissions Standard sits at Tier 3 Critical and Medical Privacy Directive spans both critical and restricted tiers, the data exemplifies why compliance handbooks must teach the domain mechanics—maps versus programs, keys versus labels, version lineage versus role lineage—rather than reciting table columns: the enforcement story lives in the joins, and the joins only remain sound when every identifier, role, and revision is read as evidence of how governed kernel attachments behaved at a specific point in the lifecycle.