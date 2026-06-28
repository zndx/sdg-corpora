---
chapter_id: ch_live_ebpfmap_pinned_at_path_d3085d
topic_id: 23
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_pinned_at_path', 'existential_anchored_to_artifact_via_part', 'profile_has_cardinality']
model: engine-refine
---

Cardinality, category, confidence, identifier, location, misc, owner, tags, uncertainty, and uri constitute the interoperable metadata vocabulary through which governed artifacts are named, situated, classified, attributed, and evaluated under uncertainty. An identifier supplies the durable primary key that survives renames, migrations, and cross-system joins: PATH-0001 through PATH-0004 anchor distinct eBPF map registrations, PART-0001 through PART-0004 anchor existential entities such as GovernanceRule77 and EdgeGateway-12, and CARD-0001 through CARD-0004 anchor cardinality profiles and their dimensional gloss. Without such keys, lineage queries collapse into brittle string matching on paths or labels that drift; with them, policy engines, audit trails, and reconciliation jobs can treat each record as a stable referent even when surface attributes change.

**t_existential_anchored_to_artifact_via_part**

| id | existential | uri | location |
| --- | --- | --- | --- |
| PART-0001 | GovernanceRule77 | hdfs://cluster/staging | rack-7 |
| PART-0002 | ObservationDrone04 | abfss://prod/silver | eu-west-3 |
| PART-0003 | EdgeGateway-12 | abfss://prod/silver | on-prem-dc1 |
| PART-0004 | LabSampleVial-7 | s3://lake/raw | rack-7 |
| PART-0005 | ObservationDrone04 | abfss://prod/silver | zone-b |
| PART-0006 | ProvenanceLedger2 | s3://lake/raw | on-prem-dc1 |

**fact_profile**

| id | cardinality_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CARD-0001 | CARD-0001 | 0.299 | 284.36 | 728.94 |
| CARD-0002 | CARD-0003 | 0.994 | 557.92 | 380.57 |
| CARD-0003 | CARD-0005 | 0.773 | 622.09 | 607.36 |
| CARD-0004 | CARD-0002 | 0.226 | 488.10 | 448.09 |

**dim_cardinality**

| id | cardinality_label | cardinality_category |
| --- | --- | --- |
| CARD-0001 | Cardinality Label 01 | Cardinality Category 01 |
| CARD-0002 | Cardinality Label 02 | Cardinality Category 02 |
| CARD-0003 | Cardinality Label 03 | Cardinality Category 03 |
| CARD-0004 | Cardinality Label 04 | Cardinality Category 04 |
| CARD-0005 | Cardinality Label 05 | Cardinality Category 05 |
| CARD-0006 | Cardinality Label 06 | Cardinality Category 06 |

Ownership and tagging translate identifier stability into operational accountability and compliance posture. The owner field assigns custodial responsibility—here, sre for sock_hash pinned at /run/bpf/sockops and flow_table at /sys/fs/bpf/netfilter_flow, data-engineering for cpumap and conntrack_map under /sys/fs/bpf/cilium_flow and /sys/fs/bpf/bpftool_prog—so escalation, access review, and change control route to the correct function rather than to a generic platform team. Tags layer declarative classification atop that custody model: duplicate pii markings on the first two path records signal heightened data-protection obligations, internal on the third constrains disclosure scope, and verified on the fourth attests that a control or attestation step has been satisfied. Together, owner and tags let governance frameworks enforce least privilege, retention, and monitoring rules without re-deriving intent from infrastructure topology alone.

**t_ebpfmap_pinned_at_path**

| id | ebpfmap | pinned_at_path | owner | tags |
| --- | --- | --- | --- | --- |
| PATH-0001 | sock_hash | /run/bpf/sockops | sre | pii |
| PATH-0002 | cpumap | /sys/fs/bpf/cilium_flow | data-engineering | pii |
| PATH-0003 | conntrack_map | /sys/fs/bpf/bpftool_prog | data-engineering | internal |
| PATH-0004 | flow_table | /sys/fs/bpf/netfilter_flow | sre | verified |
| PATH-0005 | sock_hash | /sys/fs/bpf/cilium_sock | sre | internal |
| PATH-0006 | lru_percpu_hash | /sys/fs/bpf/xdp_ingress | platform-team | verified |

Uri and location partition *where* an artifact lives along complementary axes of logical addressability and physical or regional placement. A uri names the canonical retrieval or staging endpoint—hdfs://cluster/staging for GovernanceRule77, abfss://prod/silver for ObservationDrone04 and EdgeGateway-12, s3://lake/raw for LabSampleVial-7—so orchestration, catalog services, and cross-cloud replication speak a single locator language independent of host naming conventions. Location refines that abstraction with deployment context: rack-7 appears for both GovernanceRule77 and LabSampleVial-7, eu-west-3 for ObservationDrone04, on-prem-dc1 for EdgeGateway-12, enabling residency enforcement, disaster-recovery grouping, and capacity planning that uri schemes alone cannot express. In practice, compliance handbooks treat uri as the authoritative join key to storage and API surfaces, while location feeds data-sovereignty matrices and incident scoping when a region or facility is impaired.

Cardinality and category organize measurable or descriptive facts into a typed dimensional hierarchy rather than leaving them as opaque scalars. In the profile layer, cardinality_key values such as CARD-0001, CARD-0003, CARD-0005, and CARD-0002 link each fact row to a dimension member; the accompanying misc field—here numeric magnitudes 728.94, 380.57, 607.36, and 448.09—carries the measured or attributed quantity whose semantic role is defined only through that join. The dimension table supplies human-readable misc labels (Cardinality Label 01 through 04) and parallel category assignments (Cardinality Category 01 through 04), so reporting, thresholding, and policy templates can aggregate at category grain while preserving fine-grained identity at the cardinality key. This star-like separation prevents category collapse when labels evolve and allows the same category to subsume multiple cardinality members without rewriting historical facts.

Confidence and uncertainty quantify epistemic weight on those linked facts, governing whether automated decisions may act on them or must defer to human review. Confidence spans the unit interval—0.994 on one profile row indicates near-certain acceptance for downstream promotion or alerting, whereas 0.299 and 0.226 on others flag profiles that should be quarantined, re-sampled, or excluded from high-assurance controls until evidence improves; 0.773 occupies an intermediate band suitable for staged rollout with monitoring. Uncertainty, expressed here in commensurate numeric magnitudes (284.36 through 622.09), often captures complementary dispersion, posterior width, or error budget not reducible to a single probability; operational guides typically require both fields so that a high confidence with large uncertainty does not mask tail risk, and a moderate confidence with tight uncertainty still permits bounded automation. Misc values then remain interpretable only when read jointly with cardinality category, owner accountability, tag-imposed constraints, and uri–location grounding—illustrating why these ten attributes form a single governance fabric rather than isolated columns.