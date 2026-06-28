---
chapter_id: ch_live_policy_only_for_high_impact_0d8471
topic_id: 45
family: 07_long_tail
cited_terms: ['policy_only_for_high_impact', 'ebpfmap_with_max_entries', 'kernelhook_only_kprobe']
model: engine-refine
---

NIST impact level classification anchors organizational risk governance by assigning each control artifact a calibrated consequence band that downstream policy engines can evaluate without re-deriving qualitative judgments on every review cycle. In operational practice, the impact level is not a free-text annotation but a governed dimension keyed by stable identifiers—IMPA-0001 through IMPA-0004 in the reference corpus—each of which resolves to a human-readable label and a coarser categorical bucket. The label field, recorded here as entries such as At N I S T Impact Level Label 02, functions as the miscellany surface where stewards expose the precise nomenclature expected in audit packets, while the paired category value—At N I S T Impact Level Category 02, for instance—collapses that nuance into a portfolio-level stratum suitable for executive dashboards and cross-domain aggregation. Identifier discipline matters because policies, hooks, and map configurations are joined by key rather than by string equality; a mis-keyed reference to IMPA-0006 rather than IMPA-0002 would silently attach the wrong impact posture to an otherwise correctly authored control.

**dim_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level_label | at_n_i_s_t_impact_level_category |
| --- | --- | --- |
| IMPA-0001 | At N I S T Impact Level Label 01 | At N I S T Impact Level Category 01 |
| IMPA-0002 | At N I S T Impact Level Label 02 | At N I S T Impact Level Category 02 |
| IMPA-0003 | At N I S T Impact Level Label 03 | At N I S T Impact Level Category 03 |
| IMPA-0004 | At N I S T Impact Level Label 04 | At N I S T Impact Level Category 04 |
| IMPA-0005 | At N I S T Impact Level Label 05 | At N I S T Impact Level Category 05 |
| IMPA-0006 | At N I S T Impact Level Label 06 | At N I S T Impact Level Category 06 |
| IMPA-0007 | At N I S T Impact Level Label 07 | At N I S T Impact Level Category 07 |
| IMPA-0008 | At N I S T Impact Level Label 08 | At N I S T Impact Level Category 08 |

Policy facts materialize the impact dimension into enforceable obligations by binding each policy record to exactly one impact level key and by layering operational metadata that governs how often the binding must be revalidated. The four exemplar policies IMPA-0001 through IMPA-0004 demonstrate heterogeneous coupling: IMPA-0001 points at IMPA-0006, whereas IMPA-0002 and IMPA-0003 both inherit IMPA-0002, and IMPA-0004 aligns with IMPA-0004, illustrating that impact level is a shared attribute across multiple policies rather than a one-to-one identity. Priority, expressed as ordinal ranks 2, 3, 3, and 5 across those records, orders remediation and assessment queues when capacity is constrained; lower numbers conventionally signal earlier attention, so a policy at priority 2 precedes siblings at 3 even when they share the same impact key. Review cycle days translate that priority and impact pairing into a temporal contract: 258 days for the highest-priority exemplar, stretching to 710, 866, and 950 days for progressively deprioritized siblings, encoding the principle that higher-impact or higher-priority controls undergo scrutiny more frequently while long-cycle reviews remain permissible only where residual risk acceptance is documented.

**fact_policy**

| id | at_n_i_s_t_impact_level_key | priority | review_cycle_days |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0006 | 2 | 258 |
| IMPA-0002 | IMPA-0002 | 3 | 710 |
| IMPA-0003 | IMPA-0002 | 3 | 866 |
| IMPA-0004 | IMPA-0004 | 5 | 950 |
| IMPA-0005 | IMPA-0001 | 1 | 305 |
| IMPA-0006 | IMPA-0002 | 2 | 729 |

The subject–target–role triad generalizes the same governance grammar to technical objects whose relationships are inherently many-to-many and whose accountability must be explicit at the edge of each association. Subject denotes the originating entity in a directed link—an ebpfmap identifier such as ENTR-0004 for stack_trace or a kernelhook identifier such as KPRO-0002 for kfree—while target denotes the dependent attribute or companion record being qualified, exemplified by max_entries bindings like ENTR-0001 (1,048,576 entries for devmap) and ENTR-0004 (16,384 entries for stack_trace), or hook_kind bindings such as KPRO-0005 paired with entry_kprobe semantics. Role names the stewardship function exercised across that edge: owner confers accountable authority, reviewer imposes independent verification, contributor permits bounded modification, and observer grants read-only attestation without veto. In the ebpfmap corpus, stack_trace (ENTR-0004) links to devmap’s capacity record ENTR-0001 under role reviewer, while cgroup_storage (ENTR-0002) carries owner on its association to ENTR-0001; in the kprobe corpus, kfree (KPRO-0002) is owner on its hook_kind edge, vfs_read (KPRO-0004) is reviewer against kprobe_trace (KPRO-0002), and ext4_file_open (KPRO-0006) is contributor—demonstrating that identical technical pairings may carry different governance postures depending on operational context.

**t_ebpfmap_with_max_entries**

| id | ebpfmap |
| --- | --- |
| ENTR-0001 | devmap |
| ENTR-0002 | cgroup_storage |
| ENTR-0003 | queue |
| ENTR-0004 | stack_trace |
| ENTR-0005 | sockhash |
| ENTR-0006 | queue |

**t_ebpfmap_with_max_entries_max_entries**

| id | max_entries |
| --- | --- |
| ENTR-0001 | 1048576 |
| ENTR-0002 | 262144 |
| ENTR-0003 | 16384 |
| ENTR-0004 | 16384 |
| ENTR-0005 | 32768 |
| ENTR-0006 | 1048576 |
| ENTR-0007 | 524288 |

**t_ebpfmap_with_max_entries__max_entries**

| id | ebpfmap_id | max_entries_id | role |
| --- | --- | --- | --- |
| ENTR-0001 | ENTR-0004 | ENTR-0002 | reviewer |
| ENTR-0002 | ENTR-0001 | ENTR-0001 | owner |
| ENTR-0003 | ENTR-0004 | ENTR-0006 | reviewer |
| ENTR-0004 | ENTR-0002 | ENTR-0004 | observer |
| ENTR-0005 | ENTR-0006 | ENTR-0002 | observer |
| ENTR-0006 | ENTR-0006 | ENTR-0006 | owner |
| ENTR-0007 | ENTR-0004 | ENTR-0005 | owner |
| ENTR-0008 | ENTR-0006 | ENTR-0004 | observer |

**t_kernelhook_only_kprobe**

| id | kernelhook |
| --- | --- |
| KPRO-0001 | net_rx_action |
| KPRO-0002 | kfree |
| KPRO-0003 | vfs_read |
| KPRO-0004 | ext4_file_open |
| KPRO-0005 | kmalloc |
| KPRO-0006 | ip_rcv |

**t_kernelhook_only_kprobe_hook_kind**

| id | hook_kind |
| --- | --- |
| KPRO-0001 | kprobe_perf |
| KPRO-0002 | entry_kprobe |
| KPRO-0003 | kprobe_trace |
| KPRO-0004 | kprobe_trace |
| KPRO-0005 | bpf_kprobe |
| KPRO-0006 | multi_kprobe |
| KPRO-0007 | kprobe_fs |

**t_kernelhook_only_kprobe__hook_kind**

| id | kernelhook_id | hook_kind_id | role |
| --- | --- | --- | --- |
| KPRO-0001 | KPRO-0002 | KPRO-0005 | owner |
| KPRO-0002 | KPRO-0005 | KPRO-0005 | contributor |
| KPRO-0003 | KPRO-0004 | KPRO-0002 | reviewer |
| KPRO-0004 | KPRO-0006 | KPRO-0006 | contributor |
| KPRO-0005 | KPRO-0003 | KPRO-0006 | owner |
| KPRO-0006 | KPRO-0002 | KPRO-0004 | observer |
| KPRO-0007 | KPRO-0006 | KPRO-0003 | reviewer |
| KPRO-0008 | KPRO-0001 | KPRO-0006 | contributor |

Kernel instrumentation and eBPF map governance illustrate why impact level, category, and association roles must remain separable concerns rather than collapsed into a single descriptive field. A kprobe on net_rx_action classified under kprobe_perf, or on vfs_read under kprobe_trace, imposes qualitatively different observability and failure modes than a devmap sized to 1,048,576 entries versus a queue map capped at 16,384; yet each object still requires the same identifier-keyed join pattern so that compliance automation can traverse from technical fact to organizational obligation without ambiguous string matching. Hook kind differentiation—entry_kprobe versus kprobe_trace appearing twice in the reference set—signals that the target side of an association carries typed behavior, not merely scalar limits as on the max_entries axis. Controllers therefore treat subject as the stable identity of the instrumented artifact, target as the parameterized constraint or modality applied to it, and role as the human or service principal authorized to attest that the constraint remains appropriate for the impact category currently assigned.

Taken together, impact level supplies the consequence frame, category and label supply auditable vocabulary, identifier supplies join integrity, priority and review cycle days supply scheduling mechanics, and subject–target–role supplies accountable linkage across heterogeneous technical domains. A policy keyed to IMPA-0002 at priority 3 with an 866-day review cycle inherits whatever categorical posture At N I S T Impact Level Category 02 denotes, while the ebpfmap and kprobe associations show how identically keyed infrastructure objects acquire differentiated oversight edges without rewriting the underlying impact dimension. Mature programs treat mismatches—such as a reviewer role on a high max_entries binding, or a contributor on a filesystem open hook—as exceptions requiring explicit risk acceptance, because the data model is deliberately explicit: nothing in the association row substitutes for impact level, and nothing in the impact dimension substitutes for the named role on the subject–target edge. That separation is what allows a single NIST-aligned impact taxonomy to span policy corpora, kernel telemetry, and map capacity controls while preserving evidence chains that auditors can reconstruct from identifiers alone.