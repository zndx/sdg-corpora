---
chapter_id: ch_live_survey_response_record_ef63d3
topic_id: 184
family: 08_derived
cited_terms: ['survey_response_record', 'ebpfmap_equiv_kv_typed', 'mass_function_only_assigns_subsets']
model: engine-refine
---

In research governance systems, survey response records serve as the primary vessel for capturing structured feedback from personnel, each record identified by a unique code such as RECO-0001 or RECO-0003 and tagged with a descriptive label like Peer-Review-Submission, Q3-2023-Feedback, or Safety-Compliance-Check. Every response is associated with a specific profile attribute under investigation—Clearance-Level, Domain-Expertise-Code, or Protocol-Approval-Ref—ensuring that the data collected maps directly to the researcher's qualifications or standing. The encoding and language fields further contextualize each record: a response may arrive in Spanish (es) encoded as ascii, in German (de) as unicode, or in English (en) as utf8, reflecting the multilingual, multi-format nature of international research collaboration. This metadata layer is essential for downstream processing, as it guarantees that text parsing, localization, and archival systems can handle each record according to its declared format.

**t_survey_response_record**

| id | survey_response_record | captures_profile_attribute | encoding | language |
| --- | --- | --- | --- | --- |
| RECO-0001 | Peer-Review-Submission | Clearance-Level | ascii | es |
| RECO-0002 | Q3-2023-Feedback | Domain-Expertise-Code | unicode | de |
| RECO-0003 | Safety-Compliance-Check | Protocol-Approval-Ref | ascii | es |
| RECO-0004 | Q3-2023-Feedback | Protocol-Approval-Ref | utf8 | en |
| RECO-0005 | Incident-Report-Form | Funding-Source-ID | ascii | es |
| RECO-0006 | Field-Obs-Log | Institutional-Affiliation | unicode | de |
| RECO-0007 | Dev-Team-Performance | Protocol-Approval-Ref | ascii | ja |

The eBPF map key-value typed domain models the structural typing of kernel-level data structures used in systems observability and security monitoring. Each map—such as interface_stats, rate_limit, or socket_stats—is assigned a key type drawn from a controlled vocabulary including bpf_cookie, uint32_t, and dev_index, which defines the shape of the lookup key. These key types are not rigidly bound to a single map; instead, the relationship is mediated through a junction table that records the role each map plays with respect to a given key type, with designations such as contributor, owner, or reviewer. For instance, map TYPE-0007 contributes to key type TYPE-0001, while map TYPE-0002 owns key type TYPE-0002, and map TYPE-0005 assumes both owner and reviewer roles for different key types. This role-based linkage supports governance over which components may read, write, or audit each map's key structure, a distinction critical in multi-tenant kernel environments where eBPF programs from different authors share the same runtime.

**t_ebpfmap_equiv_kv_typed**

| id | ebpfmap |
| --- | --- |
| TYPE-0001 | interface_stats |
| TYPE-0002 | rate_limit |
| TYPE-0003 | rate_limit |
| TYPE-0004 | socket_stats |
| TYPE-0005 | interface_stats |
| TYPE-0006 | interface_stats |
| TYPE-0007 | rate_limit |
| TYPE-0008 | rate_limit |

**t_ebpfmap_equiv_kv_typed_key_type**

| id | key_type |
| --- | --- |
| TYPE-0001 | bpf_cookie |
| TYPE-0002 | uint32_t |
| TYPE-0003 | uint32_t |
| TYPE-0004 | dev_index |
| TYPE-0005 | pid_t |
| TYPE-0006 | inode_key |

**t_ebpfmap_equiv_kv_typed__key_type**

| id | ebpfmap_id | key_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0007 | TYPE-0001 | contributor |
| TYPE-0002 | TYPE-0002 | TYPE-0002 | owner |
| TYPE-0003 | TYPE-0005 | TYPE-0002 | owner |
| TYPE-0004 | TYPE-0005 | TYPE-0004 | reviewer |
| TYPE-0005 | TYPE-0004 | TYPE-0005 | reviewer |
| TYPE-0006 | TYPE-0002 | TYPE-0003 | owner |
| TYPE-0007 | TYPE-0006 | TYPE-0006 | owner |
| TYPE-0008 | TYPE-0004 | TYPE-0003 | owner |

**t_ebpfmap_equiv_kv_typed_value_type_map**

| id | value_type_map |
| --- | --- |
| TYPE-0001 | dev_entry |
| TYPE-0002 | task_struct |
| TYPE-0003 | flow_key |
| TYPE-0004 | perf_event |
| TYPE-0005 | stack_trace |
| TYPE-0006 | perf_event |
| TYPE-0007 | stack_trace |

The value side of the eBPF map typing follows an analogous pattern. Maps are associated with value type mappings—dev_entry, task_struct, flow_key, and perf_event—through a separate junction table that again carries a role field and a cardinality note. Map TYPE-0005 contributes to value type TYPE-0002 under Cardinality Note 02, while map TYPE-0006 owns value type TYPE-0001 under Cardinality Note 04. The cardinality notes, though abstractly labeled, encode constraints on how many values a map may hold or how values are distributed across keys, information that is essential for memory planning and for validating that eBPF programs respect map capacity limits at load time. Together, the key-type and value-type junction tables form a bipartite graph over maps and types, with roles providing the semantic glue that distinguishes ownership from mere usage.

**t_ebpfmap_equiv_kv_typed__value_type_map**

| id | ebpfmap_id | value_type_map_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TYPE-0001 | TYPE-0005 | TYPE-0002 | contributor | Cardinality Note 01 |
| TYPE-0002 | TYPE-0002 | TYPE-0006 | contributor | Cardinality Note 02 |
| TYPE-0003 | TYPE-0003 | TYPE-0003 | observer | Cardinality Note 03 |
| TYPE-0004 | TYPE-0006 | TYPE-0001 | owner | Cardinality Note 04 |
| TYPE-0005 | TYPE-0007 | TYPE-0005 | owner | Cardinality Note 05 |
| TYPE-0006 | TYPE-0002 | TYPE-0002 | reviewer | Cardinality Note 06 |
| TYPE-0007 | TYPE-0005 | TYPE-0004 | observer | Cardinality Note 07 |
| TYPE-0008 | TYPE-0007 | TYPE-0001 | reviewer | Cardinality Note 08 |

The mass function assignment domain addresses uncertainty quantification in sensor and telemetry networks, where evidence is distributed across subsets of a frame of discernment rather than assigned to single hypotheses. Each mass function—data_quality, edge_node, thermal_fusion, and telemetry_confidence—is defined by a set of attributes whose names and types are catalogued separately: confidence as xsd:decimal, dimension_kind as xsd:string, method as xsd:string, and recorded_at as xsd:dateTime. The actual attribute values are stored in a normalized entity-attribute-value (EAV) pattern across three value tables. Decimal attributes such as confidence take values like 0.589 or 503.17 and are stored in the decimal value table, where entity SUBS-0001 carries a confidence of 0.589 alongside dimension_kind Encoding 02 and method nightly summary. DateTime attributes such as recorded_at are stored in the datetime value table, with entries like 2024-10-19T15:01:03 and 2023-10-05T14:35:44 anchoring each mass function to a point in time. The varchar value table holds string attributes, including locale codes such as de, completing the attribute profile for each mass function.

**t_mass_function_only_assigns_subsets**

| id | mass | assigns_mass_to |
| --- | --- | --- |
| SUBS-0001 | data_quality | network_congestion |
| SUBS-0002 | edge_node | thermal_overload |
| SUBS-0003 | thermal_fusion | sensor_offline |
| SUBS-0004 | telemetry_confidence | data_corruption |
| SUBS-0005 | signal_integrity | packet_loss |
| SUBS-0006 | edge_node | thermal_overload |

**t_mass_function_only_assigns_subsets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBS-0001 | confidence | xsd:decimal |
| SUBS-0002 | dimension_kind | xsd:string |
| SUBS-0003 | method | xsd:string |
| SUBS-0004 | recorded_at | xsd:dateTime |
| SUBS-0005 | uncertainty | xsd:decimal |
| SUBS-0006 | unit | xsd:string |
| SUBS-0007 | value | xsd:decimal |
| SUBS-0008 | encoding | xsd:string |

**t_mass_function_only_assigns_subsets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0004 | 2024-10-19T15:01:03 |
| SUBS-0002 | SUBS-0002 | SUBS-0004 | 2023-10-05T14:35:44 |
| SUBS-0003 | SUBS-0003 | SUBS-0004 | 2024-02-24T01:03:34 |
| SUBS-0004 | SUBS-0004 | SUBS-0004 | 2024-04-26T17:49:00 |
| SUBS-0005 | SUBS-0005 | SUBS-0004 | 2024-01-29T11:02:31 |
| SUBS-0006 | SUBS-0006 | SUBS-0004 | 2023-11-16T17:14:50 |

**t_mass_function_only_assigns_subsets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0001 | 0.589 |
| SUBS-0002 | SUBS-0001 | SUBS-0005 | 503.17 |
| SUBS-0003 | SUBS-0001 | SUBS-0007 | 721.15 |
| SUBS-0004 | SUBS-0002 | SUBS-0001 | 0.512 |
| SUBS-0005 | SUBS-0002 | SUBS-0005 | 595.07 |
| SUBS-0006 | SUBS-0002 | SUBS-0007 | 721.26 |
| SUBS-0007 | SUBS-0003 | SUBS-0001 | 0.645 |
| SUBS-0008 | SUBS-0003 | SUBS-0005 | 722.55 |

**t_mass_function_only_assigns_subsets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBS-0001 | SUBS-0001 | SUBS-0002 | Dimension Kind 01 |
| SUBS-0002 | SUBS-0001 | SUBS-0008 | Encoding 02 |
| SUBS-0003 | SUBS-0001 | SUBS-0009 | nightly summary |
| SUBS-0004 | SUBS-0001 | SUBS-0010 | de |
| SUBS-0005 | SUBS-0001 | SUBS-0003 | manual |
| SUBS-0006 | SUBS-0001 | SUBS-0006 | mg/L |
| SUBS-0007 | SUBS-0002 | SUBS-0002 | Dimension Kind 07 |
| SUBS-0008 | SUBS-0002 | SUBS-0008 | Encoding 08 |

These mass functions are not abstract; they assign belief mass to specific evidence items—network_congestion, thermal_overload, sensor_offline, and data_corruption—each representing a potential fault mode in an industrial or IoT deployment. The assignment is itself a first-class entity (SUBS-0001 through SUBS-0004), and the EAV decomposition ensures that attribute values can be queried, versioned, and validated independently of the mass function's structural definition. This separation of attribute schema from attribute values mirrors the key-type/value-type separation in the eBPF domain, reflecting a consistent design philosophy: define the shape of data in one place, store the data in another, and link them through role-bearing junctions that encode governance constraints.