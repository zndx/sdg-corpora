---
chapter_id: ch_live_belief_interval_exactly_two_bounds_69d9b4
topic_id: 186
family: 06_belief_structure
cited_terms: ['belief_interval_exactly_two_bounds', 'ebpfprogram_exactly_one_type', 'profiling_produces_profile']
model: engine-refine
---

In operational data models, the identifier serves as the immutable anchor for every entity, whether it is a belief interval such as BOUN-0001 tracking battery charge decay, an eBPF program like TYPE-0001 implementing fentry_do_fork, or a profiling record PROF-0001. These identifiers are not merely labels; they are the foreign keys that stitch together a distributed schema where entities are decomposed into their semantic components. A belief about turbine vibration threshold (BOUN-0002) is stored separately from its lower bound of 22.4 dBm, and an eBPF program is decoupled from its program type classification. This normalization enables independent evolution of each dimension while preserving referential integrity through explicit join tables.

**t_ebpfprogram_exactly_one_type**

| id | ebpfprogram |
| --- | --- |
| TYPE-0001 | fentry_do_fork |
| TYPE-0002 | kprobe_sched_switch |
| TYPE-0003 | kprobe_sched_switch |
| TYPE-0004 | fentry_do_fork |
| TYPE-0005 | tc_ingress_filter |
| TYPE-0006 | tc_ingress_filter |

**t_ebpfprogram_exactly_one_type_program_type**

| id | program_type |
| --- | --- |
| TYPE-0001 | kprobe |
| TYPE-0002 | kprobe |
| TYPE-0003 | kprobe |
| TYPE-0004 | socket_filter |
| TYPE-0005 | lsm |
| TYPE-0006 | kprobe |

The relationship between entities is mediated through junction tables that carry subject and target columns alongside a role attribute. In the belief interval model, the junction table t_belief_interval_exactly_two_bounds__belief_lower_bound links a belief (subject) to a lower bound (target) with a role such as observer, reviewer, or contributor. For instance, belief BOUN-0006 is associated with lower bound BOUN-0004 under the observer role, while belief BOUN-0002 connects to lower bound BOUN-0004 as a reviewer. Similarly, the eBPF program type junction maps program TYPE-0003 to program type TYPE-0005 with the role owner, establishing ownership semantics that govern who may modify or audit the association. The role column thus encodes the nature of the relationship itself, transforming a simple many-to-many link into a semantically rich edge that can be queried, filtered, and governed independently of the entities it connects.

**t_belief_interval_exactly_two_bounds**

| id | belief |
| --- | --- |
| BOUN-0001 | battery charge decay |
| BOUN-0002 | turbine vibration threshold |
| BOUN-0003 | blood glucose trend |
| BOUN-0004 | reactor core temperature estimate |
| BOUN-0005 | filter clog probability |
| BOUN-0006 | turbine vibration threshold |

**t_belief_interval_exactly_two_bounds_belief_lower_bound**

| id | belief_lower_bound |
| --- | --- |
| BOUN-0001 | 78.9 pct |
| BOUN-0002 | 22.4 dBm |
| BOUN-0003 | 0.001 |
| BOUN-0004 | 15.0 kPa |
| BOUN-0005 | 78.9 pct |
| BOUN-0006 | 78.9 pct |

**t_belief_interval_exactly_two_bounds__belief_lower_bound**

| id | belief_id | belief_lower_bound_id | role |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0006 | BOUN-0004 | observer |
| BOUN-0002 | BOUN-0003 | BOUN-0001 | reviewer |
| BOUN-0003 | BOUN-0002 | BOUN-0004 | reviewer |
| BOUN-0004 | BOUN-0001 | BOUN-0002 | contributor |
| BOUN-0005 | BOUN-0001 | BOUN-0001 | reviewer |
| BOUN-0006 | BOUN-0003 | BOUN-0004 | observer |
| BOUN-0007 | BOUN-0001 | BOUN-0004 | reviewer |
| BOUN-0008 | BOUN-0005 | BOUN-0002 | observer |

**t_ebpfprogram_exactly_one_type__program_type**

| id | ebpfprogram_id | program_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0003 | TYPE-0005 | owner |
| TYPE-0002 | TYPE-0005 | TYPE-0004 | observer |
| TYPE-0003 | TYPE-0004 | TYPE-0006 | owner |
| TYPE-0004 | TYPE-0003 | TYPE-0002 | owner |
| TYPE-0005 | TYPE-0006 | TYPE-0003 | owner |
| TYPE-0006 | TYPE-0006 | TYPE-0002 | reviewer |
| TYPE-0007 | TYPE-0004 | TYPE-0003 | owner |
| TYPE-0008 | TYPE-0005 | TYPE-0001 | observer |

Profiling facts introduce a different dimension of operational observability, where each record captures the produces key, duration_seconds, exit_code, and retry_count of a discrete execution event. The profiling fact PROF-0001 ran for 6716.87 seconds, exited with code 725, and required 209 retries, while PROF-0003 completed in 2546.61 seconds with exit code 348 after 303 retries. These metrics are not stored in isolation; the produces_key column references the dim_produces dimension table, which enriches each fact with a produces_label (misc) such as Produces Label 01 and a produces_category such as Produces Category 01. This star-schema pattern separates the measurable quantities from their descriptive metadata, allowing analytical queries to aggregate by category while preserving the granular timing and failure data at the fact level.

**fact_profiling**

| id | produces_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0001 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0004 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0004 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

**dim_produces**

| id | produces_label | produces_category |
| --- | --- | --- |
| PROF-0001 | Produces Label 01 | Produces Category 01 |
| PROF-0002 | Produces Label 02 | Produces Category 02 |
| PROF-0003 | Produces Label 03 | Produces Category 03 |
| PROF-0004 | Produces Label 04 | Produces Category 04 |
| PROF-0005 | Produces Label 05 | Produces Category 05 |
| PROF-0006 | Produces Label 06 | Produces Category 06 |

The produces relationship itself functions as the bridge between operational events and their categorical taxonomy. A profiling record with produces_key PROF-0004 links to a dimension entry whose misc field reads Produces Label 04 and whose category is Produces Category 04. This indirection means that the same produces entity can be reclassified without altering the underlying fact records, and that multiple facts can share a category for rollup analysis. The category column thus serves as the primary grouping mechanism for dashboards and compliance reports, while the misc label provides human-readable context for operators reviewing raw profiling data.

Together, these patterns—normalized identifiers, role-bearing junction tables, and star-schema fact-dimension relationships—form a coherent architecture for tracking both the structural properties of monitored entities and the temporal outcomes of their execution. The belief interval tables capture the static bounds of system parameters, the eBPF program tables classify kernel-level instrumentation, and the profiling facts record the dynamic behavior of workloads over time. Each layer is independently queryable yet fully cross-referencable through the foreign keys that bind subject to target, identifier to produces_key, and role to relationship.