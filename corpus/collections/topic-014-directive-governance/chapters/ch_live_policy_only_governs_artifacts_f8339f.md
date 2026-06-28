---
chapter_id: ch_live_policy_only_governs_artifacts_f8339f
topic_id: 14
family: 03_directive_governance
cited_terms: ['policy_only_governs_artifacts', 'audit_with_findings', 'ebpfmap_subclass']
model: engine-refine
---

An identifier serves as the immutable anchor for every tracked entity within a governance ecosystem, whether it is the artifact reference ARTI-0001, the audit finding FIND-0003, or the eBPF map instance EBPF-0002. These identifiers are not arbitrary; they encode a classification prefix that immediately signals the entity's domain—ARTI for policy-governed artifacts, FIND for audit findings, EBPF for kernel-level map objects—enabling operators to route queries, correlate events, and maintain referential integrity across disparate subsystems. The prefix convention ensures that a string such as ARTI-0004 resolves unambiguously to the Immutable Audit Policy artifact, while FIND-0002 points to the Data Lake Governance Review finding, eliminating the ambiguity that arises when entities from different operational planes share overlapping naming conventions.

**t_policy_only_governs_artifacts**

| id | policy | enforcement | priority |
| --- | --- | --- | --- |
| ARTI-0001 | Data Retention Policy | blocking | 2 |
| ARTI-0002 | Access Control Policy | advisory | 4 |
| ARTI-0003 | Privacy Compliance Policy | deprecated | 1 |
| ARTI-0004 | Immutable Audit Policy | advisory | 5 |
| ARTI-0005 | Provenance Tracking Policy | deprecated | 5 |
| ARTI-0006 | Access Control Policy | mandatory | 1 |

**t_audit_with_findings**

| id | audit | findings | duration_seconds | host_name |
| --- | --- | --- | --- | --- |
| FIND-0001 | HIPAA Security Assessment | Expired TLS Certificate | 5564.74 | worker-07 |
| FIND-0002 | Data Lake Governance Review | Missing MFA Enforcement | 1140.43 | node-a01 |
| FIND-0003 | SOC 2 Type II Review | Overprivileged Service Account | 7105.34 | node-b14 |
| FIND-0004 | ISO 27001 Certification | Inadequate Data Retention | 2350.00 | edge-03 |
| FIND-0005 | Third-Party Vendor Review | Unpatched OS Kernel | 2041.65 | worker-07 |
| FIND-0006 | Data Lake Governance Review | Unpatched OS Kernel | 3303.91 | ingest-21 |
| FIND-0007 | ML Model Drift Audit | Unmonitored API Endpoint | 5489.56 | ingest-21 |

**t_ebpfmap_subclass**

| id | ebpfmap | map_type | checksum | uri |
| --- | --- | --- | --- | --- |
| EBPF-0001 | sock_ops_map | lpm_trie | 9d2b7a16 | abfss://prod/silver |
| EBPF-0002 | xdp_stats_map | devmap | 1a4b6c2d | abfss://prod/silver |
| EBPF-0003 | conntrack_hash | perf_event_array | a3f9c21e | s3://lake/raw |
| EBPF-0004 | conntrack_hash | hash_map | 7b14de08 | gs://warehouse/gold |
| EBPF-0005 | perf_event_map | stack_trace | 9d2b7a16 | hdfs://cluster/staging |
| EBPF-0006 | stack_trace_map | ringbuf | 1a4b6c2d | hdfs://cluster/staging |
| EBPF-0007 | dev_map_eth | hash_map | 5e8f3c91 | hdfs://cluster/staging |
| EBPF-0008 | xdp_stats_map | stack_trace | c0ffee42 | abfss://prod/silver |

Enforcement and priority form the policy layer that determines how governance rules are applied and in what order. Enforcement modes—blocking, advisory, deprecated—dictate the operational weight of a policy: a blocking enforcement on the Data Retention Policy (ARTI-0001) means violations are actively prevented, whereas advisory enforcement on the Access Control Policy (ARTI-0002) signals a recommendation without hard stop. The deprecated status of the Privacy Compliance Policy (ARTI-0003) indicates a rule that has been superseded but remains visible for historical reference. Priority levels, ranging from 1 through 5, establish resolution order when multiple policies apply to the same artifact; the Privacy Compliance Policy carries priority 1, ensuring it is evaluated before the Access Control Policy at priority 4 or the Immutable Audit Policy at priority 5. This priority hierarchy is critical in environments where policy conflicts arise, as it provides a deterministic resolution mechanism without requiring manual intervention.

Audit findings are contextualized by their duration and the host on which they were observed, providing both temporal and spatial grounding for remediation efforts. The HIPAA Security Assessment finding (FIND-0001) on worker-07 required 5,564.74 seconds to complete, while the SOC 2 Type II Review (FIND-0003) on node-b14 consumed 7,105.34 seconds—the longest engagement—suggesting the complexity of the assessment scope rather than a procedural delay. The Missing MFA Enforcement finding from the Data Lake Governance Review (FIND-0002) on node-a01 was resolved in 1,140.43 seconds, a comparatively brief window that may indicate a straightforward configuration gap. Hostnames such as worker-07, node-a01, node-b14, and edge-03 anchor each finding to a specific infrastructure node, enabling operators to correlate findings with deployment topology, network segments, and access control boundaries.

Checksums and URIs provide the integrity and location guarantees necessary for data pipeline and kernel subsystem reliability. Each eBPF map carries a checksum—9d2b7a16 for the sock_ops_map (EBPF-0001), 1a4b6c2d for the xdp_stats_map (EBPF-0002), a3f9c21e and 7b14de08 for the two conntrack_hash instances (EBPF-0003 and EBPF-0004)—that enables operators to detect corruption, verify deployments, and confirm that the running kernel state matches the expected configuration. The URIs associated with these maps—abfss://prod/silver for the first two maps, s3://lake/raw for the perf_event_array variant, and gs://warehouse/gold for the hash_map variant—specify the data lake storage tier and protocol, linking kernel telemetry to the broader data governance architecture. This URI-to-checksum pairing ensures that any map loaded from a given storage location can be validated against its expected fingerprint before execution, preventing stale or tampered configurations from entering production.