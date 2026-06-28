---
chapter_id: ch_live_syscall_at_security_tier_d28de1
topic_id: 10
family: 04_ebpf_kernel
cited_terms: ['syscall_at_security_tier', 'requirement_traces_to', 'ebpfprogram_only_attached_to_kprobe']
model: engine-refine
---

Security tier classification constitutes the foundational axis along which observable system behavior is stratified for governance and enforcement. Each tier is assigned a stable identifier—conventionally prefixed forms such as TIER-0001 through TIER-0004—that serves as the join key linking operational fact records to their dimensional definitions. The tier itself is not merely a label; it encodes a graduated posture of control, and operational telemetry quantifies how activity distributes across that posture. In syscall observation, for example, tier TIER-0004 accumulates 382 events while TIER-0001 registers only 52, a disparity that signals differential exposure or monitoring intensity rather than equivalent risk across strata. When a fact record references a tier key absent from the dimension table—as when at_security_tier_key TIER-0005 appears without a corresponding dimensional row—the integrity of downstream reporting is compromised, and analysts must treat such orphans as data-quality exceptions before drawing compliance conclusions.

**fact_syscall**

| id | at_security_tier_key | event_count |
| --- | --- | --- |
| TIER-0001 | TIER-0003 | 238 |
| TIER-0002 | TIER-0001 | 52 |
| TIER-0003 | TIER-0005 | 198 |
| TIER-0004 | TIER-0004 | 382 |
| TIER-0005 | TIER-0001 | 283 |
| TIER-0006 | TIER-0002 | 288 |

**t_ebpfprogram_only_attached_to_kprobe**

| id | ebpfprogram | attaches_to_hook | checksum | identifier |
| --- | --- | --- | --- | --- |
| KPRO-0001 | xdp_drop_all | xdp | 7b14de08 | ARN:res/41 |
| KPRO-0002 | tracepoint_sched_switch | kretprobe | 9d2b7a16 | doi:10.1109/x |
| KPRO-0003 | tc_egress_rate | tc_ingress | 9d2b7a16 | ref-8842 |
| KPRO-0004 | flow_dissector_match | sk_msg | 5e8f3c91 | doi:10.1109/x |
| KPRO-0005 | tc_ingress_filter | tc_ingress | 7b14de08 | oid:1.3.6.1 |
| KPRO-0006 | tracepoint_sched_switch | flow_dissector | 5e8f3c91 | ARN:res/41 |

Dimensional enrichment supplies the semantic layer that identifiers alone cannot carry. Category fields partition tiers into coarse governance families—At Security Tier Category 01 through Category 04—while miscellaneous label attributes furnish human-readable descriptors such as At Security Tier Label 03 that bridge operational schemas to audit narratives. The separation of identifier, category, and label is deliberate: the identifier guarantees referential stability across revisions, the category enables policy rollups and exception routing, and the label accommodates presentation without perturbing the key structure. This tripartite arrangement mirrors established practice in regulated environments where machine keys must remain invariant even as display terminology evolves to satisfy new reporting mandates.

**dim_at_security_tier**

| id | at_security_tier_label | at_security_tier_category |
| --- | --- | --- |
| TIER-0001 | At Security Tier Label 01 | At Security Tier Category 01 |
| TIER-0002 | At Security Tier Label 02 | At Security Tier Category 02 |
| TIER-0003 | At Security Tier Label 03 | At Security Tier Category 03 |
| TIER-0004 | At Security Tier Label 04 | At Security Tier Category 04 |
| TIER-0005 | At Security Tier Label 05 | At Security Tier Category 05 |
| TIER-0006 | At Security Tier Label 06 | At Security Tier Category 06 |

Requirement traceability extends the tier model from observational stratification to normative accountability. A requirement—Network Segmentation Rule, Access Control Mandate, or Privacy Compliance Requirement—constitutes the subject of a trace relation, while the artifact to which it maps—HIPAA Security Rule, Risk Assessment Matrix, Compliance Audit Checklist, or ISO 27001 Control—constitutes the target. Junction records bind subject to target and assign a role that governs how the relationship is interpreted in review workflows: an owner on TRAC-0001 bears primary accountability for satisfaction of the mapped control, whereas reviewers and contributors on subsequent traces exercise verification and supplementary attestation without assuming custodial responsibility. When multiple requirements converge on a single target, as when both TRAC-0001 and TRAC-0004 trace to TRAC-0004 under roles of owner and contributor respectively, the framework captures many-to-one accountability without collapsing distinct policy origins into an undifferentiated compliance claim.

**t_requirement_traces_to**

| id | requirement |
| --- | --- |
| TRAC-0001 | Network Segmentation Rule |
| TRAC-0002 | Access Control Mandate |
| TRAC-0003 | Privacy Compliance Requirement |
| TRAC-0004 | Privacy Compliance Requirement |
| TRAC-0005 | Access Control Mandate |
| TRAC-0006 | Encryption Standard |
| TRAC-0007 | System Availability Target |

**t_requirement_traces_to_traces_to**

| id | traces_to |
| --- | --- |
| TRAC-0001 | HIPAA Security Rule |
| TRAC-0002 | Risk Assessment Matrix |
| TRAC-0003 | Compliance Audit Checklist |
| TRAC-0004 | ISO 27001 Control |
| TRAC-0005 | Penetration Test Suite |
| TRAC-0006 | NIST SP 800-53 |
| TRAC-0007 | Vulnerability Scan Config |

**t_requirement_traces_to__traces_to**

| id | requirement_id | traces_to_id | role |
| --- | --- | --- | --- |
| TRAC-0001 | TRAC-0001 | TRAC-0004 | owner |
| TRAC-0002 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0003 | TRAC-0004 | TRAC-0004 | reviewer |
| TRAC-0004 | TRAC-0001 | TRAC-0004 | contributor |
| TRAC-0005 | TRAC-0007 | TRAC-0005 | contributor |
| TRAC-0006 | TRAC-0002 | TRAC-0003 | observer |
| TRAC-0007 | TRAC-0007 | TRAC-0002 | owner |
| TRAC-0008 | TRAC-0001 | TRAC-0002 | observer |

Integrity verification for deployable enforcement artifacts relies on checksum fields that fingerprint executable or configuration state at attachment time. In eBPF program governance, programs such as xdp_drop_all, tracepoint_sched_switch, tc_egress_rate, and flow_dissector_match attach to kernel hooks—xdp, kretprobe, tc_ingress, and sk_msg—and each attachment record carries a checksum value (7b14de08, 9d2b7a16, 5e8f3c91) that permits auditors to confirm the deployed bytecode matches the approved artifact. Duplicate checksums, as when 9d2b7a16 appears for both tracepoint_sched_switch and tc_egress_rate, indicate either shared provenance or a collision requiring explicit resolution; neither condition should pass silent acceptance in a hardened pipeline. Supplementary identifier fields—ARN:res/41, doi:10.1109/x, ref-8842—anchor each program to external registries or publication records, enabling cross-repository citation and version reconciliation when hook attachments are revalidated after kernel upgrades.

Event count aggregation at the tier level transforms raw observability into governance metrics suitable for thresholding and trend analysis. Counts of 238, 198, and 382 events associated with tiers TIER-0001, TIER-0003, and TIER-0004 respectively provide the evidentiary basis for determining whether monitoring coverage aligns with declared tier sensitivity; a tier assigned the highest categorical standing but exhibiting sparse event volume may indicate instrumentation gaps rather than genuine risk reduction. Practitioners therefore read event_count not as an absolute risk score but as a consistency check between declared tier posture, attached enforcement mechanisms, and the volume of behavior those mechanisms observe.

Taken together, identifier, category, misc, role, subject, target, checksum, and event count form an interlocking evidence chain: tiers classify exposure; dimensions annotate classification; requirements trace normative obligations to control frameworks; checksums and secondary identifiers attest deployment fidelity; and event counts validate that the observational apparatus is proportionate to the tier assigned. Failure at any link—orphan tier keys, missing checksum verification, or untraced requirements—propagates uncertainty through the entire compliance posture, which is why mature governance frameworks treat these attributes not as incidental metadata but as mandatory fields whose population and consistency are themselves subject to audit.