---
chapter_id: ch_live_ebpfprogram_union_kprobe_or_xdp_f3915f
topic_id: 49
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_union_kprobe_or_xdp', 'ebpfprogram_verified_safe', 'ebpfprogram_with_license']
model: engine-refine
---

In governed eBPF artifact registries, the identifier is the durable handle by which every program, verification record, and license binding is located, compared, and audited across otherwise heterogeneous stores. Values such as `XDP-0001` through `XDP-0004` name unioned kprobe and XDP program definitions whose logical identities—`tcx_ingress`, `perf_cpu_clock_sampler`, `socket_connect_tracker`, and `scheduler_latency_hook`—must remain stable even when the same capability is materialized under alternate attach models or companion hooks (`filesystem_integrity_hook`, `capability_change_hook`, `tc_police_ingress`, and the LSM-oriented `lsm_file_open`, `sysctl_access_tracker`, `network_policy_enforcer`, and `module_load_tracker`). Parallel identifier namespaces (`SAFE-0001`–`SAFE-0004` for verified-safe attestations, `LICE-0001`–`LICE-0004` for license-bearing programs) prevent collision between operational program keys and compliance overlays; a reviewer tracing `socket_connect_tracker` therefore consults `SAFE-0002` in the verified-safe corpus while the same symbolic name may appear under `XDP-0003` in the union registry, and under `LICE-0003` only after license metadata has been bound.

**t_ebpfprogram_union_kprobe_or_xdp**

| id | ebpfprogram | ebpfprogram_2 | ebpfprogram_3 | mime_type | size_bytes |
| --- | --- | --- | --- | --- | --- |
| XDP-0001 | tcx_ingress | filesystem_integrity_hook | lsm_file_open | application/xml | 613043965 |
| XDP-0002 | perf_cpu_clock_sampler | filesystem_integrity_hook | sysctl_access_tracker | application/parquet | 757467115 |
| XDP-0003 | socket_connect_tracker | capability_change_hook | network_policy_enforcer | application/octet-stream | 333629998 |
| XDP-0004 | scheduler_latency_hook | tc_police_ingress | module_load_tracker | text/csv | 79215808 |
| XDP-0005 | sock_ops | scheduler_latency_hook | cpu_frequency_governor | text/plain | 893084779 |

**t_ebpfprogram_verified_safe**

| id | ebpfprogram |
| --- | --- |
| SAFE-0001 | xdp_packet_dropper |
| SAFE-0002 | socket_connect_tracker |
| SAFE-0003 | tcp_congestion_control |
| SAFE-0004 | signal_delivery_probe |
| SAFE-0005 | network_policy_enforcer |
| SAFE-0006 | cgroup_skb_ingress |

**t_ebpfprogram_verified_safe_verified_safe_by**

| id | verified_safe_by |
| --- | --- |
| SAFE-0001 | libbpf |
| SAFE-0002 | Kani_bpf |
| SAFE-0003 | Z3_solver |
| SAFE-0004 | Kani_bpf |
| SAFE-0005 | veristat |
| SAFE-0006 | FramaC_bpf |

Mime type and byte size together characterize the serialized artifact that an identifier ultimately resolves to, and they matter because verification tooling, transfer policy, and storage accounting depend on format and footprint rather than on the program’s attach semantics alone. The union registry records `application/xml` at 613,043,965 bytes for one program family, `application/parquet` at 757,467,115 bytes for another, `application/octet-stream` at 333,629,998 bytes where the canonical representation is opaque binary, and `text/csv` at 79,215,808 bytes where tabular export suffices; these pairings signal whether downstream consumers should expect schema-validated XML, columnar analytics payloads, raw object blobs, or human-auditable delimited text. Size variance of nearly an order of magnitude between the parquet-backed and CSV-backed entries is not incidental bulk—it governs replication windows, integrity-check cost, and whether an artifact may be inlined in a policy bundle or must be referenced externally.

Subject and target are the oriented endpoints of a relationship assertion: the subject is the entity whose status is being described, and the target is the authority, instrument, or classification applied to it. In verification lineage, a row keyed `SAFE-0001` may assert subject `SAFE-0004` (`signal_delivery_probe`) against target `SAFE-0002` (`socket_connect_tracker` as verified-safe identity), while `SAFE-0003` pairs subject `SAFE-0003` (`tcp_congestion_control`) with target `SAFE-0005` (an identifier reserved in the verifier namespace beyond the four named tools). License bindings exhibit the same directed structure: subject `LICE-0002` (`tcx_ingress`) may be linked to target `LICE-0004` (ISC), while another assertion attaches subject `LICE-0006`—an identifier present only on the relationship edge—to target `LICE-0002` (EUPL-1.2), demonstrating that subjects and targets need not coincide with the junction row’s own primary key. This asymmetry is deliberate: the junction identifier names the assertion, while subject and target carry the semantic graph.

**t_ebpfprogram_verified_safe__verified_safe_by**

| id | ebpfprogram_id | verified_safe_by_id | role |
| --- | --- | --- | --- |
| SAFE-0001 | SAFE-0004 | SAFE-0002 | contributor |
| SAFE-0002 | SAFE-0004 | SAFE-0004 | reviewer |
| SAFE-0003 | SAFE-0003 | SAFE-0005 | owner |
| SAFE-0004 | SAFE-0002 | SAFE-0003 | owner |
| SAFE-0005 | SAFE-0001 | SAFE-0003 | contributor |
| SAFE-0006 | SAFE-0003 | SAFE-0006 | contributor |
| SAFE-0007 | SAFE-0001 | SAFE-0005 | owner |
| SAFE-0008 | SAFE-0001 | SAFE-0002 | owner |

**t_ebpfprogram_with_license**

| id | ebpfprogram |
| --- | --- |
| LICE-0001 | seccomp_profile_loader |
| LICE-0002 | tcx_ingress |
| LICE-0003 | tcp_state_monitor |
| LICE-0004 | lsm_file_open |
| LICE-0005 | socket_filter |
| LICE-0006 | tcx_ingress |

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

Role qualifies the subject–target edge so that identical endpoint pairs are not treated as interchangeable obligations. Verification governance assigns `contributor` where a toolchain such as `libbpf` supplied evidential support, `reviewer` where `Kani_bpf` or `Z3_solver` performed independent safety argumentation, and `owner` where accountability for deployment readiness rests with a designated party—as seen when two distinct rows both carry `owner` yet bind different program subjects (`SAFE-0003` and `SAFE-0002`) to different verifier targets. License edges reuse the same vocabulary with different force: `contributor` and `reviewer` mark participatory duties around `MPL-2.0`, `EUPL-1.2`, `Unlicense`, and `ISC` attachments, while `observer` denotes a non-binding visibility relationship that still must be recorded for audit completeness. Treating role as mere annotation would collapse separation-of-duties controls; in practice it determines who may certify, who may only attest, and who bears ongoing compliance ownership.

Operationally, these six dimensions interlock during intake, verification, and release. An operator registering `scheduler_latency_hook` under `XDP-0004` must ensure the declared `text/csv` representation at 79,215,808 bytes matches the ingestion pipeline’s parser expectations, then reconcile any `SAFE-*` subject edges that reference a different program identifier on the same junction row, and finally align `LICE-*` targets so that `lsm_file_open` and `tcx_ingress` inherit correct SPDX-class licenses without conflating contributor and owner roles. Verifier multiplicity—`libbpf`, `Kani_bpf`, and `Z3_solver` appearing across `SAFE-0001` through `SAFE-0004`—further requires that each subject–target–role triple be read as a specific evidentiary claim, not as undifferentiated approval. Identifier stability anchors the graph; mimetype and sizebytes ground it in transferable artifacts; subject and target express directed dependencies among programs, verifiers, and licenses; and role encodes the governance semantics that transform a flat cross-reference into an enforceable compliance record.

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