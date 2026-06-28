---
chapter_id: ch_live_ebpfmap_pinned_at_path_7a4981
topic_id: 8
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_pinned_at_path', 'belief_interval_with_upper_bound', 'iso27001_annexa_subclass']
model: engine-refine
---

Governed operational metadata rests on a small set of cross-cutting primitives—identifier, entity, attr, attr type, misc, owner, role, subject, tags, and target—whose joint behavior determines whether assertions about infrastructure, risk beliefs, and control posture can be traced, typed, classified, and attributed without ambiguity. An identifier supplies the durable handle by which every record participates in joins and accountability chains: PATH-0001 through PATH-0004 name distinct pinned eBPF map registrations, BOUN-0001 through BOUN-0004 anchor belief intervals whose plausibility upper bounds resolve to ANNE-0002, ANNE-0002, ANNE-0001, and ANNE-0005 respectively, and ANNE-0001 through ANNE-0004 index ISO annex subclasses that in turn cite controls such as A.5.22 Cloud security, A.5.7 Threat intelligence, A.6.3 Remote working, and A.8.12 Data masking. Because identifiers are stable across typed value stores and relationship tables, the same BOUN-0001 that denotes “Model feature shift” as a belief can simultaneously appear as entity_id in decimal, varchar, and datetime value rows without collapsing distinct semantic roles into a single overloaded field.

**t_belief_interval_with_upper_bound**

| id | belief | plausibility_upper_bound |
| --- | --- | --- |
| BOUN-0001 | Model feature shift | ANNE-0002 |
| BOUN-0002 | Batch ingestion failure | ANNE-0002 |
| BOUN-0003 | Sensor calibration drift | ANNE-0001 |
| BOUN-0004 | Storage quota warning | ANNE-0005 |
| BOUN-0005 | Latency SLA breach | ANNE-0005 |
| BOUN-0006 | Model feature shift | ANNE-0002 |

**t_belief_interval_with_upper_bound_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BOUN-0001 | confidence | xsd:decimal |
| BOUN-0002 | dimension_kind | xsd:string |
| BOUN-0003 | method | xsd:string |
| BOUN-0004 | recorded_at | xsd:dateTime |
| BOUN-0005 | uncertainty | xsd:decimal |
| BOUN-0006 | unit | xsd:string |
| BOUN-0007 | value | xsd:decimal |
| BOUN-0008 | encoding | xsd:string |

**t_belief_interval_with_upper_bound_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0004 | 2024-12-10T20:43:33 |
| BOUN-0002 | BOUN-0002 | BOUN-0004 | 2024-02-10T17:59:05 |
| BOUN-0003 | BOUN-0003 | BOUN-0004 | 2024-06-16T13:27:28 |
| BOUN-0004 | BOUN-0004 | BOUN-0004 | 2025-04-06T06:40:08 |
| BOUN-0005 | BOUN-0005 | BOUN-0004 | 2025-03-13T22:14:49 |
| BOUN-0006 | BOUN-0006 | BOUN-0004 | 2024-01-19T21:51:57 |

**t_belief_interval_with_upper_bound_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0001 | 0.680 |
| BOUN-0002 | BOUN-0001 | BOUN-0005 | 473.67 |
| BOUN-0003 | BOUN-0001 | BOUN-0007 | 703.38 |
| BOUN-0004 | BOUN-0002 | BOUN-0001 | 0.590 |
| BOUN-0005 | BOUN-0002 | BOUN-0005 | 382.46 |
| BOUN-0006 | BOUN-0002 | BOUN-0007 | 678.08 |
| BOUN-0007 | BOUN-0003 | BOUN-0001 | 0.348 |
| BOUN-0008 | BOUN-0003 | BOUN-0005 | 462.48 |

**t_belief_interval_with_upper_bound_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BOUN-0001 | BOUN-0001 | BOUN-0002 | Dimension Kind 01 |
| BOUN-0002 | BOUN-0001 | BOUN-0008 | Encoding 02 |
| BOUN-0003 | BOUN-0001 | BOUN-0009 | change rationale |
| BOUN-0004 | BOUN-0001 | BOUN-0010 | de |
| BOUN-0005 | BOUN-0001 | BOUN-0003 | automated |
| BOUN-0006 | BOUN-0001 | BOUN-0006 | m/s |
| BOUN-0007 | BOUN-0002 | BOUN-0002 | Dimension Kind 07 |
| BOUN-0008 | BOUN-0002 | BOUN-0008 | Encoding 08 |

**t_iso27001_annexa_subclass**

| id | iso |
| --- | --- |
| ANNE-0001 | ISO/IEC 27001 |
| ANNE-0002 | ISO/IEC 27001 |
| ANNE-0003 | ISO/IEC 27701 |
| ANNE-0004 | ISO 20000-1 |
| ANNE-0005 | ISO/IEC 27701 |
| ANNE-0006 | ISO 20000-1 |

**t_iso27001_annexa_subclass_iso27001_annex_a**

| id | iso27001_annex_a |
| --- | --- |
| ANNE-0001 | A.5.22 Cloud security |
| ANNE-0002 | A.5.7 Threat intelligence |
| ANNE-0003 | A.6.3 Remote working |
| ANNE-0004 | A.8.12 Data masking |
| ANNE-0005 | A.7.4 Physical security monitoring |
| ANNE-0006 | A.5.30 Incident response |
| ANNE-0007 | A.8.22 Data leakage prevention |

**t_iso27001_annexa_subclass__iso27001_annex_a**

| id | iso_id | iso27001_annex_a_id | role |
| --- | --- | --- | --- |
| ANNE-0001 | ANNE-0003 | ANNE-0001 | observer |
| ANNE-0002 | ANNE-0001 | ANNE-0004 | reviewer |
| ANNE-0003 | ANNE-0002 | ANNE-0007 | owner |
| ANNE-0004 | ANNE-0001 | ANNE-0003 | observer |
| ANNE-0005 | ANNE-0003 | ANNE-0007 | observer |
| ANNE-0006 | ANNE-0004 | ANNE-0005 | contributor |
| ANNE-0007 | ANNE-0003 | ANNE-0001 | reviewer |
| ANNE-0008 | ANNE-0006 | ANNE-0006 | reviewer |

Entity denotes the object to which attribute values attach, not merely the row that names it. In the belief-interval pattern, entity_id typically equals the interval’s own identifier—BOUN-0001 carries confidence 0.680, dimension_kind “Dimension Kind 01”, method “Encoding 02”, and recorded_at 2024-12-10T20:43:33—while other entities under the same interval family receive additional measurements, as when BOUN-0002 holds confidence 0.590 yet still contributes 473.67 and 703.38 against attr_ids that extend beyond the four attributes declared in the attribute registry. Attr names the governed property—confidence, dimension_kind, method, recorded_at—while attr_type constrains interpretation and storage: xsd:decimal for numeric belief strength, xsd:string for categorical or textual method metadata, xsd:dateTime for temporal provenance. Misc is the typed payload held outside the core entity record; it is never free-form in the governance sense, because each misc value is admitted only through the attr_type gate that routes decimals to one store, varchars to another, and datetimes to a third, preserving validation rules that a single wide column would erode.

Tags and owner externalize classification and stewardship so that infrastructure facts and inferred beliefs inherit policy context at the point of registration. A sock_hash map pinned at /run/bpf/sockops under PATH-0001 is tagged pii and owned by sre, as is the conntrack_map at /sys/fs/bpf/netfilter_flow under PATH-0004, whereas cpumap and flow_table entries fall to data-engineering with mixed sensitivity—pii on PATH-0002, internal on PATH-0003—and PATH-0004 additionally carries verified, signalling that downstream consumers may treat the registration as attested rather than provisional. Tags therefore operate as orthogonal descriptors to identifier and entity: they do not redefine what a record is, but they determine which retention, access, and monitoring regimes apply when the same technical artifact participates in multiple compliance narratives. Owner complements tags by naming the accountable function—sre versus data-engineering—so escalation, change approval, and audit sampling can key off ownership even when the underlying ebpfmap names (sock_hash, cpumap, conntrack_map, flow_table) and mount paths (/sys/fs/bpf/cilium_flow, /sys/fs/bpf/bpftool_prog) differ sharply in runtime purpose.

**t_ebpfmap_pinned_at_path**

| id | ebpfmap | pinned_at_path | owner | tags |
| --- | --- | --- | --- | --- |
| PATH-0001 | sock_hash | /run/bpf/sockops | sre | pii |
| PATH-0002 | cpumap | /sys/fs/bpf/cilium_flow | data-engineering | pii |
| PATH-0003 | conntrack_map | /sys/fs/bpf/bpftool_prog | data-engineering | internal |
| PATH-0004 | flow_table | /sys/fs/bpf/netfilter_flow | sre | verified |
| PATH-0005 | sock_hash | /sys/fs/bpf/cilium_sock | sre | internal |
| PATH-0006 | lru_percpu_hash | /sys/fs/bpf/xdp_ingress | platform-team | verified |

Subject, target, and role articulate directed relationships among identified records, especially where standards material must be linked without duplicating canonical text. In the ISO annex subgraph, iso_id acts as subject and iso27001_annex_a_id as target, with role stating how the subject participates relative to the target control: ANNE-0003 (ISO/IEC 27701) is an observer of ANNE-0001 mapped to A.5.22 Cloud security; ANNE-0001 (ISO/IEC 27001) is a reviewer of ANNE-0004 mapped to A.8.12 Data masking; ANNE-0002 is owner of ANNE-0007; and a further ANNE-0001 subject observes ANNE-0003 tied to A.6.3 Remote working. Role is doing substantive governance work here—it is not decorative metadata—because observer, reviewer, and owner imply different evidentiary burdens, and the same standard identifier can appear as subject in one edge and as subclass identity in another without contradiction. Targets thereby receive control semantics (A.5.7 Threat intelligence among them) while subjects retain standard-family identity, enabling plausibility upper bounds on beliefs—Batch ingestion failure and Sensor calibration drift both capped by ANNE-0002, Storage quota warning by ANNE-0005—to be interpreted as risk statements evaluated against particular annex postures rather than against undifferentiated “compliance” as a monolith.

Taken together, these primitives implement a separation of concerns that large language summaries and ad hoc spreadsheets typically collapse: identifiers knit graphs, entities bear facts, attrs and attr_types enforce typing, misc holds validated values, tags and owners enforce data-governance overlays, and subject–target–role triples express normative linkage. A reader encountering confidence 0.680 beside change rationale and de, or a plausibility ceiling of ANNE-0001 above Model feature shift, should understand not isolated cells but a composable evidence model—infra registrations classified and owned, belief intervals typed and timestamped, upper bounds anchored to annex subclasses, and control relationships attributed by role—such that compliance queries can be answered as traversals over identified, typed, and attributed structure rather than as reinterpretation of opaque prose.