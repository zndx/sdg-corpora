---
chapter_id: ch_live_ebpf_event_observed_pid_7e7afb
topic_id: 188
family: 02_observation_measurement
cited_terms: ['ebpf_event_observed_pid', 'school_security_policy', 'kernelhook_subclass']
model: engine-refine
---

Kernel instrumentation anchors observability and enforcement at precisely named attachment points in the operating-system kernel, where hooks register behavior, memory footprint, and versioning as auditable facts. An `at_kernel_function` record denotes such a hook site—often referenced indirectly through a stable key such as KERN-0002 or KERN-0008 while a companion dimension supplies human-readable labels and categorical placement (for example, “At Kernel Function Category 02”). The `size_bytes` field quantifies the resident artifact associated with each hook—values on the order of 36342735, 560962979, or 456299832 bytes—so capacity planning, integrity review, and change control can treat kernel extensions as measurable binaries rather than opaque runtime effects. `category` groups functionally related hook sites so policy engines and security analysts can reason at the level of syscall tracing, block I/O, or network connect probes without enumerating every individual symbol.

**dim_at_kernel_function**

| id | at_kernel_function_label | at_kernel_function_category |
| --- | --- | --- |
| KERN-0001 | At Kernel Function Label 01 | At Kernel Function Category 01 |
| KERN-0002 | At Kernel Function Label 02 | At Kernel Function Category 02 |
| KERN-0003 | At Kernel Function Label 03 | At Kernel Function Category 03 |
| KERN-0004 | At Kernel Function Label 04 | At Kernel Function Category 04 |
| KERN-0005 | At Kernel Function Label 05 | At Kernel Function Category 05 |
| KERN-0006 | At Kernel Function Label 06 | At Kernel Function Category 06 |
| KERN-0007 | At Kernel Function Label 07 | At Kernel Function Category 07 |
| KERN-0008 | At Kernel Function Label 08 | At Kernel Function Category 08 |

School security governance expresses institutional obligations as `schoolsecuritypolicy` entities—Cedar Ridge Preparatory, Westfield Middle School, Lincoln High School, and Sunrise International School each instantiate a distinct policy record—while `safetyobjective` names the protective outcome each policy is chartered to advance, whether network intrusion detection, unauthorized access prevention, or cyber threat intelligence. Those objectives do not float in isolation: every policy is bound by `constitutionalconstraint` requirements it must satisfy, such as OSHA workplace safety, a no-lethal-force rule, ADA accessibility standards, or state education statutes. The pairing of objective and constraint is what makes a policy auditable in compliance terms; it states both what the organization seeks to protect and which higher-order legal or ethical limits shape how protection may be pursued.

**t_school_security_policy**

| id | school_security_policy | targets | must_satisfy |
| --- | --- | --- | --- |
| POLI-0001 | Cedar Ridge Preparatory | Network intrusion detection | OSHA workplace safety |
| POLI-0002 | Westfield Middle School | Unauthorized access prevention | No lethal force rule |
| POLI-0003 | Lincoln High School | Cyber threat intelligence | ADA accessibility standards |
| POLI-0004 | Sunrise International School | Cyber threat intelligence | State education statutes |
| POLI-0005 | Northview Technical Institute | Emergency evacuation protocols | State education statutes |
| POLI-0006 | Cedar Ridge Preparatory | Visitor management compliance | ISO 27001 framework |
| POLI-0007 | Sunrise International School | Structural integrity monitoring | ADA accessibility standards |
| POLI-0008 | Jefferson STEM Academy | Network intrusion detection | No lethal force rule |

Typed metadata gives policies operational teeth. An `attr` names a governed field—`effective_date`, `enforcement`, `mandatory`, or `priority`—and `attr_type` fixes its interpretive semantics (`xsd:date`, `xsd:string`, `xsd:boolean`, `xsd:integer`) so validators and reporting tools cannot silently coerce incompatible values. Each `entity` (here, a policy identified as POLI-0001 through POLI-0004) carries attribute values stored in type-specific value relations where the payload appears under `misc`: Cedar Ridge’s effective date of 2023-05-09, Westfield’s 2024-07-27, Lincoln’s 2023-12-11, and Sunrise’s 2024-08-29; mandatory flags that are true only for POLI-0001 and false elsewhere; priority integers such as 2 versus 982; and varchar miscellany including “Encoding 01,” “Enforcement 02,” “intake form,” or locale markers like “ja.” Separating attribute definition from entity-bound values preserves schema stability when new schools onboard or when a single field’s cardinality changes.

**t_school_security_policy_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | true |
| POLI-0002 | POLI-0002 | POLI-0003 | false |
| POLI-0003 | POLI-0003 | POLI-0003 | false |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | true |
| POLI-0008 | POLI-0008 | POLI-0003 | false |

**t_school_security_policy_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-05-09 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-07-27 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-12-11 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-08-29 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-05-03 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2024-09-29 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2024-11-04 |
| POLI-0008 | POLI-0008 | POLI-0001 | 2024-06-30 |

**t_school_security_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 2 |
| POLI-0002 | POLI-0001 | POLI-0005 | 982 |
| POLI-0003 | POLI-0002 | POLI-0004 | 2 |
| POLI-0004 | POLI-0002 | POLI-0005 | 312 |
| POLI-0005 | POLI-0003 | POLI-0004 | 2 |
| POLI-0006 | POLI-0003 | POLI-0005 | 809 |
| POLI-0007 | POLI-0004 | POLI-0004 | 4 |
| POLI-0008 | POLI-0004 | POLI-0005 | 270 |

**t_school_security_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | intake form |
| POLI-0004 | POLI-0001 | POLI-0009 | ja |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | pre-release note |

Process-level observability in extended Berkeley Packet Filter deployments parallels this entity–attribute discipline. eBPF programs—`syscall_trace`, `disk_io_tracker`, `tcp_connect_probe`—attach to observed process identifiers (PIDs 11024, 7743, and related records) so kernel and userspace activity can be correlated under a common `identifier` namespace (PID-0001 through PID-0004). Association rows assign `role` semantics—contributor, observer, owner, reviewer—across subject and target identifiers, clarifying who produces telemetry, who consumes it, and who bears accountability when a probe’s scope overlaps multiple processes. The same `identifier` abstraction that keys policies and kernel hooks also keys observation relationships, which allows cross-domain queries: a reviewer role on PID-0004’s observation of PID-0002 can be evaluated alongside the school policy whose safety objective is cyber threat intelligence and whose constitutional constraint is state education statutes.

**t_ebpf_event_observed_pid**

| id | ebpf |
| --- | --- |
| PID-0001 | syscall_trace |
| PID-0002 | disk_io_tracker |
| PID-0003 | tcp_connect_probe |
| PID-0004 | disk_io_tracker |
| PID-0005 | cpu_profile_sampler |
| PID-0006 | disk_io_tracker |

**t_ebpf_event_observed_pid_observes_pid**

| id | observes_pid |
| --- | --- |
| PID-0001 | 11024 |
| PID-0002 | 11024 |
| PID-0003 | 7743 |
| PID-0004 | 11024 |
| PID-0005 | 8891 |
| PID-0006 | 11024 |

**t_ebpf_event_observed_pid__observes_pid**

| id | ebpf_id | observes_pid_id | role |
| --- | --- | --- | --- |
| PID-0001 | PID-0002 | PID-0006 | contributor |
| PID-0002 | PID-0004 | PID-0004 | observer |
| PID-0003 | PID-0003 | PID-0002 | owner |
| PID-0004 | PID-0002 | PID-0002 | reviewer |
| PID-0005 | PID-0005 | PID-0004 | contributor |
| PID-0006 | PID-0005 | PID-0001 | contributor |
| PID-0007 | PID-0006 | PID-0005 | owner |
| PID-0008 | PID-0006 | PID-0002 | contributor |

In practice, operators treat `identifier` as the immutable join key across fact and dimension layers. Kernel hook facts reference `at_kernel_function` keys and record `version` (1, 3, or 10 in the sample set) beside `size_bytes`, supporting drift detection when a hook’s binary grows from hundreds of megabytes to more than half a gigabyte. Policy administrators maintain attribute catalogs independently of per-school values, enabling bulk amendment of enforcement semantics or priority typing without rewriting institution names or safety objectives. Security engineers map eBPF probe types to the PIDs they observe and document roles so incident response can distinguish an owner’s authoritative configuration from a contributor’s supplementary trace. Constitutional constraints remain first-class requirements—never inferred from objectives alone—so a policy targeting unauthorized access prevention at Westfield still explicitly carries ADA accessibility standards as a hard bound, and Lincoln’s cyber threat intelligence mandate remains coupled to the no-lethal-force rule.

**t_school_security_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**fact_kernelhook**

| id | at_kernel_function_key | size_bytes | version |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0002 | 36342735 | 3 |
| KERN-0002 | KERN-0003 | 560962979 | 1 |
| KERN-0003 | KERN-0001 | 456299832 | 10 |
| KERN-0004 | KERN-0008 | 272822846 | 1 |

Together, kernel function placement, typed policy attributes, constitutional bounds, safety objectives, and role-governed process observation form a single compliance-oriented data model: measurable hooks at named kernel sites; institution-specific security policies with machine-validated metadata; and accountable telemetry relationships among processes and probes. Density of evidence—specific dates, boolean mandates, byte sizes, probe names, and role assignments—is not decorative; it is how auditors reconstruct whether a deployed kernel artifact, a school’s stated objective, and the processes under watch were aligned at a given point in time.