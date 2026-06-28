---
chapter_id: ch_live_ebpfprogram_has_program_type_74405c
topic_id: 10
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_has_program_type', 'ebpfprogram_only_attached_to_kprobe', 'trace_basic']
model: engine-refine
---

In governed observability and program-inventory systems, an entity denotes the unit of record to which facts attach and against which compliance assertions are evaluated. Entities are not self-describing labels; they are stable handles within a namespace whose persistence permits longitudinal comparison, audit replay, and cross-reference among heterogeneous evidence stores. The trace entity TRAC-0001, associated in operation with load-balancer-routing, exemplifies this pattern: the same entity key recurs across duration, temporal boundary, exit status, and host metadata, so that a reviewer may reconstruct a single operational episode without conflating distinct events. Identifier serves a parallel but distinct function. Where entity anchors internal continuity, identifier supplies the durable, often externally meaningful token by which a row, relationship, or artifact is uniquely addressed—whether as a primary surrogate such as TYPE-0001 or KPRO-0001, or as a bibliographic or cloud-native locator (ARN:res/41, doi:10.1109/x, ref-8842) that ties inventory rows to authoritative sources outside the registry. The separation matters in practice because governance queries routinely filter on identifier while analytic pipelines aggregate on entity; conflating the two invites duplicate attribution and breaks referential closure when external citations must be verified independently of internal keys.

**t_trace_basic**

| id | trace | observed_at |
| --- | --- | --- |
| TRAC-0001 | load-balancer-routing | TYPE-0007 |
| TRAC-0002 | frontend-render-loop | TYPE-0001 |
| TRAC-0003 | message-broker-poll | TYPE-0001 |
| TRAC-0004 | worker-task-execution | TYPE-0005 |
| TRAC-0005 | cache-hit-miss-run | TYPE-0004 |
| TRAC-0006 | message-broker-poll | TYPE-0002 |

**t_trace_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TRAC-0001 | duration_seconds | xsd:decimal |
| TRAC-0002 | end_time | xsd:dateTime |
| TRAC-0003 | exit_code | xsd:integer |
| TRAC-0004 | host_name | xsd:string |
| TRAC-0005 | log_level | xsd:string |
| TRAC-0006 | phase | xsd:string |
| TRAC-0007 | retry_count | xsd:integer |
| TRAC-0008 | scheduled_at | xsd:dateTime |

Attribute (attr) names the measurable or declarative facet ascribed to an entity, and attr type constrains how that facet may be interpreted, compared, and validated. A trace attribute registry that pairs duration_seconds with xsd:decimal, end_time with xsd:dateTime, exit_code with xsd:integer, and host_name with xsd:string embodies the orthodox typed-metadata design: the name carries domain semantics, while the type carries syntactic and operational contract. Typed separation prevents category errors that undermine policy engines—treating a timestamp as a sortable integer, or a host label as a numeric threshold—and it enables schema-aware storage so that values land in purpose-built representations rather than a single undifferentiated text column. In the present corpus, duration_seconds values such as 1505.64 s for TRAC-0001 and 5061.29 s for TRAC-0002 occupy the decimal plane; end_time and related instants (2023-04-16T02:44:01, 2024-07-31T11:49:14) satisfy dateTime parsing; exit_code observations (376, 314, 88, 293) remain integral; and host_name resolves to string tokens including node-b14 and operational state literals such as initiation and complete. Attr type thus functions as the enforcement layer through which attr acquires interoperable meaning across exporters, auditors, and downstream metric systems.

The misc designation marks the stored value payload itself—the fact asserted for a given entity–attribute pair—once entity and attr have fixed the subject of the assertion and attr type has fixed its interpretive frame. Misc is deliberately generic at the conceptual level because the physical representation is delegated to type-specialized stores; what unifies varchar, integer, decimal, and datetime value relations is the ternary binding pattern entity_id plus attr_id yielding a single misc entry. That pattern supports sparse schemas: TRAC-0001 may carry host_name without requiring every peer entity to populate the same slot, and TRAC-0002 may record end_time and duration_seconds without inheriting unrelated attributes from TRAC-0001. For compliance reviewers, misc is the evidentiary substrate—what was observed, not merely what could be observed—and duplicate or inconsistent misc rows for the same binding constitute prima facie data-integrity defects unless reconciled by versioned provenance or explicit supersession rules.

Relational assertions among registry objects adopt subject and target to orient directed associations, with role qualifying the nature of participation when the edge is not merely structural but normative. In program-type linkage, an ebpfprogram_id such as TYPE-0006 is asserted as subject relative to program_type_id TYPE-0005 as target under role observer, while TYPE-0005 paired with TYPE-0004 carries role reviewer and TYPE-0004 with TYPE-0006 carries role contributor. These roles are not decorative metadata; they govern who may attest, who may approve, and who bears operational responsibility within separation-of-duties frameworks. Subject typically denotes the governed artifact or originating party; target denotes the classification, hook, or policy object onto which governance applies—mirrored elsewhere where ebpfprogram tc_filter_ingress attaches to hook TRAC-0003, or perf_software_counter attaches to TRAC-0001. Queries that traverse subject→target graphs therefore answer markedly different compliance questions than flat attribute lookups: they reveal attachment topology, typing constraints (cgroup_sock_addr, kprobe, cgroup_skb), and accountability chains rather than scalar measurements alone.

Checksum supplies cryptographic or algorithmic compactness over selected fields so that tampering, truncation, or accidental duplication surfaces during reconciliation. Colliding checksums on distinct rows—9d2b7a16 shared by lsm_bpf_audit and lwt_in_encap despite divergent program identities—signal either intentional canonicalization of equivalent hook configurations or a collision requiring explicit disambiguation via identifier and attaches_to_hook context; non-colliding values such as 7b14de08 for tc_filter_ingress and 5e8f3c91 for perf_software_counter support independent integrity lanes. Identifier complements checksum by furnishing human- and machine-resolvable keys for external audit: duplicate doi:10.1109/x citations on separate KPRO rows indicate shared literature grounding, while ARN:res/41 and ref-8842 diversify the citation plane. Operational practice treats checksum verification as a batch gate before attestation publication and treats identifier resolution as the bridge to immutable external evidence, so that neither internal surrogate keys nor raw misc values stand alone without corroborating linkage.

Taken together, entity and identifier establish what is being discussed; attr and attr type specify what may be said and how it must be read; misc records what was said; subject, target, and role encode directed governance and attachment semantics among registry participants; and checksum anchors integrity over configuration snapshots that identifiers then connect to authoritative externals. Mature implementations keep these roles orthogonal—typing errors blocked at ingest, relational roles enforced at workflow transition, checksum failures blocking sign-off—so that trace measurements on load-balancer-routing or worker-task-execution remain auditable facts, while ebpfprogram inventories remain defensible under hook-level scrutiny without collapsing observational data into undifferentiated key–value sprawl.

**t_ebpfprogram_has_program_type**

| id | ebpfprogram |
| --- | --- |
| TYPE-0001 | tracepoint_sched_switch |
| TYPE-0002 | perf_software_counter |
| TYPE-0003 | xdp_drop_all |
| TYPE-0004 | xdp_drop_packet |
| TYPE-0005 | kprobe_execve |
| TYPE-0006 | tracepoint_sched_switch |
| TYPE-0007 | lwt_in_encap |

**t_ebpfprogram_has_program_type_program_type**

| id | program_type |
| --- | --- |
| TYPE-0001 | cgroup_sock_addr |
| TYPE-0002 | kprobe |
| TYPE-0003 | cgroup_skb |
| TYPE-0004 | kprobe |
| TYPE-0005 | kprobe |
| TYPE-0006 | cgroup_sock_addr |

**t_ebpfprogram_has_program_type__program_type**

| id | ebpfprogram_id | program_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0006 | TYPE-0005 | observer |
| TYPE-0002 | TYPE-0005 | TYPE-0004 | reviewer |
| TYPE-0003 | TYPE-0002 | TYPE-0001 | reviewer |
| TYPE-0004 | TYPE-0004 | TYPE-0006 | contributor |
| TYPE-0005 | TYPE-0006 | TYPE-0001 | reviewer |
| TYPE-0006 | TYPE-0007 | TYPE-0002 | owner |
| TYPE-0007 | TYPE-0007 | TYPE-0001 | observer |
| TYPE-0008 | TYPE-0006 | TYPE-0001 | observer |

**t_ebpfprogram_only_attached_to_kprobe**

| id | ebpfprogram | attaches_to_hook | checksum | identifier |
| --- | --- | --- | --- | --- |
| KPRO-0001 | tc_filter_ingress | TRAC-0003 | 7b14de08 | ARN:res/41 |
| KPRO-0002 | lsm_bpf_audit | TRAC-0003 | 9d2b7a16 | doi:10.1109/x |
| KPRO-0003 | lwt_in_encap | TRAC-0005 | 9d2b7a16 | ref-8842 |
| KPRO-0004 | perf_software_counter | TRAC-0001 | 5e8f3c91 | doi:10.1109/x |
| KPRO-0005 | lsm_bprm_committed | TRAC-0002 | 7b14de08 | oid:1.3.6.1 |
| KPRO-0006 | lsm_bpf_audit | TRAC-0001 | 5e8f3c91 | ARN:res/41 |

**t_trace_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0002 | 2023-04-16T02:44:01 |
| TRAC-0002 | TRAC-0001 | TRAC-0008 | 2024-07-31T11:49:14 |
| TRAC-0003 | TRAC-0001 | TRAC-0009 | 2025-04-08T10:42:35 |
| TRAC-0004 | TRAC-0002 | TRAC-0002 | 2023-05-20T09:49:51 |
| TRAC-0005 | TRAC-0002 | TRAC-0008 | 2023-07-22T09:50:59 |
| TRAC-0006 | TRAC-0002 | TRAC-0009 | 2023-11-29T05:54:22 |
| TRAC-0007 | TRAC-0003 | TRAC-0002 | 2023-07-03T21:45:54 |
| TRAC-0008 | TRAC-0003 | TRAC-0008 | 2023-03-31T15:28:51 |

**t_trace_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0001 | 1505.64 |
| TRAC-0002 | TRAC-0002 | TRAC-0001 | 5061.29 |
| TRAC-0003 | TRAC-0003 | TRAC-0001 | 4957.42 |
| TRAC-0004 | TRAC-0004 | TRAC-0001 | 1589.98 |
| TRAC-0005 | TRAC-0005 | TRAC-0001 | 2846.09 |
| TRAC-0006 | TRAC-0006 | TRAC-0001 | 1626.04 |

**t_trace_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0003 | 376 |
| TRAC-0002 | TRAC-0001 | TRAC-0007 | 314 |
| TRAC-0003 | TRAC-0002 | TRAC-0003 | 88 |
| TRAC-0004 | TRAC-0002 | TRAC-0007 | 293 |
| TRAC-0005 | TRAC-0003 | TRAC-0003 | 468 |
| TRAC-0006 | TRAC-0003 | TRAC-0007 | 480 |
| TRAC-0007 | TRAC-0004 | TRAC-0003 | 297 |
| TRAC-0008 | TRAC-0004 | TRAC-0007 | 77 |

**t_trace_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | node-b14 |
| TRAC-0002 | TRAC-0001 | TRAC-0005 | Log Level 02 |
| TRAC-0003 | TRAC-0001 | TRAC-0006 | initiation |
| TRAC-0004 | TRAC-0001 | TRAC-0010 | complete |
| TRAC-0005 | TRAC-0001 | TRAC-0011 | Triggered By 05 |
| TRAC-0006 | TRAC-0002 | TRAC-0004 | ingest-21 |
| TRAC-0007 | TRAC-0002 | TRAC-0005 | Log Level 07 |
| TRAC-0008 | TRAC-0002 | TRAC-0006 | initiation |