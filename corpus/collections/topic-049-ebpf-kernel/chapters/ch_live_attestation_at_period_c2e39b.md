---
chapter_id: ch_live_attestation_at_period_c2e39b
topic_id: 49
family: 03_directive_governance
cited_terms: ['attestation_at_period', 'ebpfprogram_with_license', 'claim_observed_by_event']
model: engine-refine
---

Claims function as the fundamental assertion units within a governance framework, each anchored by a unique identifier that guarantees unambiguous reference across audit trails and compliance reports. An identifier such as `EVEN-0001` or `PERI-0001` serves not merely as a key but as a stable handle through which attestations, program licenses, and factual claims are correlated across disparate registries. In practice, identifiers like `EVEN-0002` recur as claim keys within the fact table, linking multiple measured observations back to a single asserted proposition, while identifiers such as `LICE-0001` through `LICE-0004` distinguish individual eBPF programs—`uprobe_syscall`, `cgroup_sock_release`, `socket_filter`, `lsm_bpf`—each carrying its own licensing obligations under `MPL-2.0`, `EUPL-1.2`, `Unlicense`, or `ISC`.

**t_attestation_at_period**

| id | attestation |
| --- | --- |
| PERI-0001 | HIPAA Compliance Review |
| PERI-0002 | Vendor Risk Assessment |
| PERI-0003 | Quarterly Internal Audit |
| PERI-0004 | Data Lineage Review |
| PERI-0005 | SOC2 Type II Audit |
| PERI-0006 | Quarterly Internal Audit |

**t_attestation_at_period_at_attestation_period**

| id | at_attestation_period |
| --- | --- |
| PERI-0001 | Q1 2025 Cycle |
| PERI-0002 | Q1 2025 Cycle |
| PERI-0003 | Q4 2023 Review |
| PERI-0004 | Q2 2025 Window |
| PERI-0005 | Q3 2024 Period |
| PERI-0006 | Q2 2024 Window |

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
| LICE-0001 | MPL-2.0 |
| LICE-0002 | EUPL-1.2 |
| LICE-0003 | Unlicense |
| LICE-0004 | ISC |
| LICE-0005 | Apache-2.0 |
| LICE-0006 | LGPL-2.1 |
| LICE-0007 | Zlib |

Confidence and uncertainty quantify the epistemic position of each claim, forming a dual-axis measure that distinguishes between the strength of evidence and the magnitude of residual doubt. A confidence value of `0.621` paired with an uncertainty of `571.46` signals a moderately supported assertion carrying substantial variance, whereas a confidence of `0.338` alongside `142.53` reflects a weaker claim with comparatively constrained uncertainty bounds. These paired metrics enable auditors to weight claims proportionally during risk aggregation; the claim labeled `Claim Label 01` under `Claim Category 01` may carry a confidence of `0.621` and uncertainty of `571.46`, while `Claim Label 02` in `Claim Category 02` registers at `0.596` confidence with a markedly lower uncertainty of `43.01`, indicating a tighter evidentiary envelope despite marginally weaker support.

The category dimension classifies claims into structured domains that determine their applicability and regulatory weight. Categories such as `Claim Category 01` through `Claim Category 04` provide a taxonomy through which assertions are routed to appropriate review workflows and compliance controls. This classification operates in tandem with the misc field, which captures ancillary attributes—numeric values like `164.54`, `173.58`, `166.95`, and `152.06`—that do not fit the primary confidence-uncertainty axis but remain relevant for downstream analysis, whether as derived metrics, thresholds, or contextual annotations attached to each claim instance.

**fact_claim**

| id | claim_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | 0.621 | 571.46 | 164.54 |
| EVEN-0002 | EVEN-0002 | 0.596 | 43.01 | 173.58 |
| EVEN-0003 | EVEN-0006 | 0.338 | 142.53 | 166.95 |
| EVEN-0004 | EVEN-0002 | 0.364 | 296.86 | 152.06 |
| EVEN-0005 | EVEN-0001 | 0.316 | 715.93 | 997.16 |
| EVEN-0006 | EVEN-0006 | 0.410 | 701.36 | 614.41 |
| EVEN-0007 | EVEN-0003 | 0.162 | 133.33 | 142.05 |

**dim_claim**

| id | claim_label | claim_category |
| --- | --- | --- |
| EVEN-0001 | Claim Label 01 | Claim Category 01 |
| EVEN-0002 | Claim Label 02 | Claim Category 02 |
| EVEN-0003 | Claim Label 03 | Claim Category 03 |
| EVEN-0004 | Claim Label 04 | Claim Category 04 |
| EVEN-0005 | Claim Label 05 | Claim Category 05 |
| EVEN-0006 | Claim Label 06 | Claim Category 06 |

Subject, target, and role constitute the relational triad that binds entities within the governance graph. A subject—such as `PERI-0002` or `LICE-0002`—denotes the originating entity in a relationship, while the target—`PERI-0004` or `LICE-0004`—represents the entity to which the subject is connected. The role field assigns a functional designation to the relationship itself, distinguishing between `reviewer`, `observer`, and `contributor` positions. In the attestation domain, `PERI-0001` appears as a subject linked to target `PERI-0002` with the role of `reviewer`, while the same subject assumes the role of `observer` when connected to target `PERI-0001`. Similarly, within the licensing domain, `LICE-0002` serves as a subject in multiple relationships, acting as `contributor` when linked to `LICE-0004` and `LICE-0006`, and as `observer` when connected to `LICE-0001`. This tripartite structure ensures that every connection carries not only directional semantics but also an explicit assignment of responsibility or awareness.

Attestation records and licensing registries extend this relational model into operational compliance. The attestation `HIPAA Compliance Review` identified as `PERI-0001` is evaluated within the `Q1 2025 Cycle` period, while the `Vendor Risk Assessment` (`PERI-0002`) undergoes review in the same cycle; the `Quarterly Internal Audit` (`PERI-0003`) is scoped to the `Q4 2023 Review`, and the `Data Lineage Review` (`PERI-0004`) falls within the `Q2 2025 Window`. Each attestation-period pairing is mediated through the subject-target-role junction, ensuring that the provenance of every compliance assertion is traceable to a specific reviewer or observer within a defined temporal window. The same architectural pattern governs license attribution for eBPF programs, where program-to-license relationships are explicitly role-annotated, preventing ambiguity in contribution attribution and compliance verification.

**t_attestation_at_period__at_attestation_period**

| id | attestation_id | at_attestation_period_id | role |
| --- | --- | --- | --- |
| PERI-0001 | PERI-0002 | PERI-0004 | reviewer |
| PERI-0002 | PERI-0001 | PERI-0002 | observer |
| PERI-0003 | PERI-0001 | PERI-0001 | observer |
| PERI-0004 | PERI-0003 | PERI-0002 | reviewer |
| PERI-0005 | PERI-0005 | PERI-0004 | contributor |
| PERI-0006 | PERI-0001 | PERI-0004 | observer |
| PERI-0007 | PERI-0003 | PERI-0002 | observer |
| PERI-0008 | PERI-0003 | PERI-0005 | owner |

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