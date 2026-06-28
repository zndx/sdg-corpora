---
chapter_id: ch_live_policy_supersedes_5ae6b8
topic_id: 49
family: 03_directive_governance
cited_terms: ['policy_supersedes', 'constraint_with_predicate', 'ebpfprogram_with_license']
model: engine-refine
---

Identifier, language, review_cycle_days, role, subject, and target constitute the structural vocabulary of policy governance and constraint resolution within enterprise compliance frameworks. Each artifact—whether a superseded policy, an eBPF program, or a constraint predicate—receives a stable identifier that anchors it across relational boundaries: SUPE-0001 through SUPE-0004 for policy supersession records, PRED-0001 through PRED-0004 for constraint predicates, and LICE-0001 through LICE-0004 for eBPF program licensing associations. These identifiers are not merely enumeration keys; they serve as the immutable handles by which cross-referential integrity is maintained when a single policy such as the Network Segmentation Directive supersedes the Legacy Vendor Checklist, or when the eBPF program cgroup_sock_release carries the Enterprise Data Classification license alongside MPL-2.0. The language field, uniformly set to es across all supersession records, signals that the governing documentation and its revision history are maintained in Spanish, a detail that carries operational weight for multilingual compliance teams auditing the evolution from Draft Audit Logging to its current iteration over a 336-day review cycle.

**t_policy_supersedes**

| id | policy | supersedes | review_cycle_days | language |
| --- | --- | --- | --- | --- |
| SUPE-0001 | Unlicense | Legacy Vendor Checklist | 262 | es |
| SUPE-0002 | BSD-3-Clause | Legacy Data Handling | 131 | es |
| SUPE-0003 | Network Segmentation Directive | Legacy Vendor Checklist | 716 | es |
| SUPE-0004 | Enterprise Data Classification | Draft Audit Logging | 336 | es |

**t_constraint_with_predicate**

| id | constraint |
| --- | --- |
| PRED-0001 | Log retention mandate |
| PRED-0002 | Quality assurance protocol |
| PRED-0003 | Authentication requirement |
| PRED-0004 | Max latency threshold |
| PRED-0005 | Access control directive |
| PRED-0006 | Max latency threshold |
| PRED-0007 | Data retention policy |
| PRED-0008 | Authentication requirement |

**t_constraint_with_predicate_predicate**

| id | predicate |
| --- | --- |
| PRED-0001 | authRequirement |
| PRED-0002 | authRequirement |
| PRED-0003 | unitSpecification |
| PRED-0004 | checksumValidation |
| PRED-0005 | targetDataset |
| PRED-0006 | formatRule |

**t_constraint_with_predicate__predicate**

| id | constraint_id | predicate_id | role |
| --- | --- | --- | --- |
| PRED-0001 | PRED-0003 | PRED-0001 | owner |
| PRED-0002 | PRED-0005 | PRED-0003 | observer |
| PRED-0003 | PRED-0004 | PRED-0002 | contributor |
| PRED-0004 | PRED-0007 | PRED-0001 | contributor |
| PRED-0005 | PRED-0008 | PRED-0001 | reviewer |
| PRED-0006 | PRED-0002 | PRED-0003 | reviewer |
| PRED-0007 | PRED-0006 | PRED-0002 | reviewer |
| PRED-0008 | PRED-0001 | PRED-0005 | observer |

**t_ebpfprogram_with_license**

| id | ebpfprogram |
| --- | --- |
| LICE-0001 | uprobe_syscall |
| LICE-0002 | cgroup_sock_release |
| LICE-0003 | socket_filter |
| LICE-0004 | lsm_bpf |
| LICE-0005 | xdp_router |
| LICE-0006 | cgroup_sock_release |

**t_ebpfprogram_with_license_license**

| id | license |
| --- | --- |
| LICE-0001 | Enterprise Data Classification |
| LICE-0002 | Encryption Key Rotation |
| LICE-0003 | Privacy Impact Assessment |
| LICE-0004 | MPL-2.0 |
| LICE-0005 | Network Segmentation Directive |
| LICE-0006 | Apache-2.0 |
| LICE-0007 | Data Residency Rule |

**t_ebpfprogram_with_license__license**

| id | ebpfprogram_id | license_id | role |
| --- | --- | --- | --- |
| LICE-0001 | LICE-0002 | LICE-0004 | contributor |
| LICE-0002 | LICE-0006 | LICE-0002 | reviewer |
| LICE-0003 | LICE-0002 | LICE-0001 | observer |
| LICE-0004 | LICE-0002 | LICE-0006 | contributor |
| LICE-0005 | LICE-0003 | LICE-0004 | reviewer |
| LICE-0006 | LICE-0005 | LICE-0003 | contributor |
| LICE-0007 | LICE-0005 | LICE-0005 | reviewer |
| LICE-0008 | LICE-0006 | LICE-0003 | contributor |

The review_cycle_days attribute governs the temporal cadence at which superseded policies must be re-evaluated for continued relevance or further revision. Values range from 131 days for the BSD-3-Clause policy to 716 days for the Network Segmentation Directive, reflecting the risk profile and regulatory exposure of each artifact. A 262-day cycle applies to the Unlicense superseding the Legacy Vendor Checklist, while the Enterprise Data Classification policy—replacing Draft Audit Logging—carries a 336-day interval. These intervals are not arbitrary; they encode the organization's risk tolerance and the expected rate of change in the underlying control environment. A policy governing encryption key rotation, for instance, would logically demand a shorter review window than one addressing a stable architectural principle, and the data substantiates this gradient: the 716-day cycle for Network Segmentation Directive suggests a control domain with low volatility, whereas the 131-day cycle for BSD-3-Clause implies a license framework subject to frequent reinterpretation or community-driven amendment.

Role, subject, and target form the triad that resolves many-to-many relationships between constraints and their predicates, and between eBPF programs and their associated licenses. In the constraint predicate junction, the subject column (constraint_id) identifies the originating constraint—PRED-0003, for example, which corresponds to the Authentication requirement—while the target column (predicate_id) identifies the predicate to which the constraint is bound, such as PRED-0001 carrying the authRequirement predicate. The role column disambiguates the nature of the binding: owner, observer, contributor, or reviewer. The Authentication requirement (PRED-0003) assumes the owner role with respect to the authRequirement predicate (PRED-0001), establishing primary accountability for that predicate's implementation and enforcement. Conversely, the Log retention mandate (PRED-0001) appears as an observer of the authRequirement predicate, indicating a dependency or monitoring relationship without direct ownership.

The same subject-role-target pattern governs the licensing associations of eBPF programs. The program cgroup_sock_release (LICE-0002) appears as the subject in three distinct associations: it is a contributor to the MPL-2.0 license (LICE-0004), a reviewer of the Encryption Key Rotation license (LICE-0002), and an observer of the Enterprise Data Classification license (LICE-0001). This multiplicity of roles within a single program's licensing profile reflects the layered nature of open-source compliance—where a program may simultaneously contribute to one license's codebase, be reviewed under another's terms, and be monitored for alignment with an internal classification policy. The observer role, in particular, denotes a passive compliance posture: the program is tracked against the license but does not actively contribute code or require review actions.

Together, these six concepts—identifier, language, review_cycle_days, role, subject, and target—form the backbone of a relational compliance model that distinguishes between what an artifact is (identifier), where its documentation resides (language), how frequently it must be reassessed (review_cycle_days), and how it relates to other artifacts through ownership, observation, and contribution (role, subject, target). The model supports both linear supersession chains, as in the progression from Legacy Vendor Checklist through the Unlicense to the BSD-3-Clause, and complex predicate graphs, as in the Authentication requirement's dual relationship with authRequirement as owner and with checksumValidation as contributor. This dual capacity—linear and graph-based—enables the framework to handle both the temporal evolution of policies and the simultaneous application of multiple constraints to a single technical artifact, such as the eBPF program lsm_bpf, which carries the Enterprise Data Classification license and is subject to the same review discipline as any other governed policy.