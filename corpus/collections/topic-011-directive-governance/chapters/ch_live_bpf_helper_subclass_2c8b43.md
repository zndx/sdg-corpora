---
chapter_id: ch_live_bpf_helper_subclass_2c8b43
topic_id: 11
family: 07_long_tail
cited_terms: ['bpf_helper_subclass', 'requirement_equiv_specifies_target', 'equiv_intersect_artifact_with_part']
model: engine-refine
---

BPF helper subclasses are catalogued as first-class entities identified by opaque handles such as `HELP-0001` through `HELP-0004`, each bearing a human-readable name—`xdp_router_v4`, `perf_cpu_idle`, `bpf_skb_change_head`, `bpf_redirect`—and a foreign-key reference to a target requirement, for instance `TARG-0005` or `TARG-0001`. These target requirements themselves are enumerated in a parallel registry where identifiers like `TARG-0001` and `TARG-0003` map to policy labels such as `LatencyThreshold` and `AuditLogFormat`, while `TARG-0002` carries the label `DataLineageTrace`. The linkage between helpers and their governing requirements is explicit: every row in the helper subclass table carries a `b_p_f_helper_function` column that points to exactly one target, establishing a one-to-many fan-out when multiple helpers reference the same requirement, as occurs when both `bpf_redirect` and `bpf_skb_change_head` resolve to `TARG-0001` and `TARG-0004` respectively.

**t_bpf_helper_subclass**

| id | bpf | b_p_f_helper_function |
| --- | --- | --- |
| HELP-0001 | xdp_router_v4 | TARG-0005 |
| HELP-0002 | perf_cpu_idle | TARG-0003 |
| HELP-0003 | bpf_skb_change_head | TARG-0004 |
| HELP-0004 | bpf_redirect | TARG-0001 |
| HELP-0005 | bpf_map_lookup_elem | TARG-0005 |
| HELP-0006 | bpf_skb_change_head | TARG-0001 |
| HELP-0007 | bpf_perf_event_output | TARG-0003 |

Attribute metadata for helper subclasses is decoupled from the entity table and stored in a dedicated attribute-definition table that pairs an `attr_name` with an `attr_type` drawn from a controlled vocabulary of XML Schema and custom ontology datatypes. The attribute names observed—`checksum`, `created_date`, `identifier`, `license`—are typed as `xsd:string`, `xsd:date`, `cco:DesignativeICE`, and `xsd:string` respectively, and each definition receives its own identifier (e.g., `HELP-0001` through `HELP-0004` in the attribute table) that is subsequently referenced by value tables. This normalization yields three distinct value tables—`t_bpf_helper_subclass_val_date`, `t_bpf_helper_subclass_val_int`, and `t_bpf_helper_subclass_val_varchar`—each keyed by a surrogate identifier and carrying a composite foreign key consisting of `entity_id` (the helper subclass being described) and `attr_id` (the attribute definition whose value is being recorded). Date values such as `2024-01-27`, `2025-05-03`, `2023-03-14`, and `2025-02-18` populate the date table; integer values including `475`, `7`, `134`, and `6` populate the integer table; and string values such as the hash `9d2b7a16`, the URN `urn:uuid:9f2a`, the license designation `Apache-2.0`, and the location tag `on-prem-dc1` populate the varchar table. The `entity_id` column in each value table is not unique—`HELP-0001` appears multiple times across the varchar table, for example—reflecting the fact that a single helper subclass carries multiple attributes, each stored in its own row.

**t_bpf_helper_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| HELP-0001 | checksum | xsd:string |
| HELP-0002 | created_date | xsd:date |
| HELP-0003 | identifier | cco:DesignativeICE |
| HELP-0004 | license | xsd:string |
| HELP-0005 | mime_type | xsd:string |
| HELP-0006 | size_bytes | xsd:long |
| HELP-0007 | uri | xsd:string |
| HELP-0008 | version | xsd:integer |

**t_bpf_helper_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HELP-0001 | HELP-0001 | HELP-0002 | 2024-01-27 |
| HELP-0002 | HELP-0002 | HELP-0002 | 2025-05-03 |
| HELP-0003 | HELP-0003 | HELP-0002 | 2023-03-14 |
| HELP-0004 | HELP-0004 | HELP-0002 | 2025-02-18 |
| HELP-0005 | HELP-0005 | HELP-0002 | 2024-07-06 |
| HELP-0006 | HELP-0006 | HELP-0002 | 2023-07-25 |
| HELP-0007 | HELP-0007 | HELP-0002 | 2024-02-22 |

**t_bpf_helper_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HELP-0001 | HELP-0001 | HELP-0006 | 475 |
| HELP-0002 | HELP-0001 | HELP-0008 | 7 |
| HELP-0003 | HELP-0002 | HELP-0006 | 134 |
| HELP-0004 | HELP-0002 | HELP-0008 | 6 |
| HELP-0005 | HELP-0003 | HELP-0006 | 422 |
| HELP-0006 | HELP-0003 | HELP-0008 | 7 |
| HELP-0007 | HELP-0004 | HELP-0006 | 484 |
| HELP-0008 | HELP-0004 | HELP-0008 | 3 |

**t_bpf_helper_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| HELP-0001 | HELP-0001 | HELP-0001 | 9d2b7a16 |
| HELP-0002 | HELP-0001 | HELP-0003 | urn:uuid:9f2a |
| HELP-0003 | HELP-0001 | HELP-0004 | Apache-2.0 |
| HELP-0004 | HELP-0001 | HELP-0009 | on-prem-dc1 |
| HELP-0005 | HELP-0001 | HELP-0005 | application/parquet |
| HELP-0006 | HELP-0001 | HELP-0010 | Name 06 |
| HELP-0007 | HELP-0001 | HELP-0011 | governance |
| HELP-0008 | HELP-0001 | HELP-0012 | Tags 08 |

Target requirements participate in a richer graph of relationships mediated by two junction tables that encode specification bindings and application mappings. The first junction, `t_requirement_equiv_specifies_target__specifies`, connects a `requirement_id` (the subject) to a `specifies_id` (the target) through a `role` column that distinguishes participants as `reviewer`, `owner`, or `contributor`. In this structure, `TARG-0004` assumes the role of reviewer against `TARG-0002`, while `TARG-0002` acts as owner against both `TARG-0002` and `TARG-0004`; `TARG-0004` also appears as contributor against `TARG-0007`. The second junction, `t_requirement_equiv_specifies_target__applies_to`, mirrors this pattern by linking a `requirement_id` to an `applies_to_id` with an accompanying `role` and a `cardinality_note` column that carries free-text annotations such as `Cardinality Note 01` through `Cardinality Note 04`. Here, `TARG-0001` is tagged as contributor against `TARG-0001`; `TARG-0005` is contributor against `TARG-0002`; `TARG-0006` is observer against `TARG-0003`; and `TARG-0002` is reviewer against `TARG-0004`. The application targets themselves—`CloudStorage`, `EUDataCenter`, `DataLake`—are enumerated in a separate lookup table that maps identifiers to human-readable domain labels.

**t_requirement_equiv_specifies_target**

| id | requirement |
| --- | --- |
| TARG-0001 | LatencyThreshold |
| TARG-0002 | DataLineageTrace |
| TARG-0003 | LatencyThreshold |
| TARG-0004 | AuditLogFormat |
| TARG-0005 | TelemetrySamplingRate |
| TARG-0006 | LatencyThreshold |

**t_requirement_equiv_specifies_target_specifies**

| id | specifies |
| --- | --- |
| TARG-0001 | KafkaProtocol |
| TARG-0002 | GDPRArticle |
| TARG-0003 | KafkaProtocol |
| TARG-0004 | JSONSchema |
| TARG-0005 | JSONSchema |
| TARG-0006 | OpenTelemetry |
| TARG-0007 | JSONSchema |

**t_requirement_equiv_specifies_target__specifies**

| id | requirement_id | specifies_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0004 | TARG-0002 | reviewer |
| TARG-0002 | TARG-0002 | TARG-0002 | owner |
| TARG-0003 | TARG-0004 | TARG-0007 | contributor |
| TARG-0004 | TARG-0002 | TARG-0004 | owner |
| TARG-0005 | TARG-0002 | TARG-0004 | observer |
| TARG-0006 | TARG-0006 | TARG-0007 | contributor |
| TARG-0007 | TARG-0005 | TARG-0006 | reviewer |
| TARG-0008 | TARG-0001 | TARG-0007 | reviewer |

**t_requirement_equiv_specifies_target_applies_to**

| id | applies_to |
| --- | --- |
| TARG-0001 | CloudStorage |
| TARG-0002 | EUDataCenter |
| TARG-0003 | DataLake |
| TARG-0004 | DataLake |
| TARG-0005 | EUDataCenter |
| TARG-0006 | CustomerTable |

**t_requirement_equiv_specifies_target__applies_to**

| id | requirement_id | applies_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TARG-0001 | TARG-0001 | TARG-0001 | contributor | Cardinality Note 01 |
| TARG-0002 | TARG-0005 | TARG-0002 | contributor | Cardinality Note 02 |
| TARG-0003 | TARG-0006 | TARG-0003 | observer | Cardinality Note 03 |
| TARG-0004 | TARG-0002 | TARG-0004 | reviewer | Cardinality Note 04 |
| TARG-0005 | TARG-0001 | TARG-0006 | reviewer | Cardinality Note 05 |
| TARG-0006 | TARG-0004 | TARG-0003 | observer | Cardinality Note 06 |
| TARG-0007 | TARG-0003 | TARG-0001 | observer | Cardinality Note 07 |
| TARG-0008 | TARG-0005 | TARG-0002 | reviewer | Cardinality Note 08 |

Artifact classification is captured in a table that intersects equivalence classes with part membership, recording an `equiv` label such as `data_lineage_node`, `log_pattern_delta`, or `record_linkage_set`; a `has_part` foreign key pointing to a target requirement; a `checksum` value like `c0ffee42`, `1a4b6c2d`, or `a3f9c21e` that serves as an integrity digest; and an `owner` designation such as `platform-team`, `governance`, or `ml-infra` that assigns custodianship. The `equiv` column is not unique—`data_lineage_node` appears twice, for `PART-0001` and `PART-0004`—and the checksum values may repeat across rows, as `c0ffee42` is shared by both `PART-0001` and `PART-0004`, suggesting that the checksum encodes a property of the equivalence class rather than of the individual artifact row. The `has_part` column ties each artifact to a target requirement, thereby closing the loop between the helper subclass registry, the target requirement graph, and the artifact classification layer.

**t_equiv_intersect_artifact_with_part**

| id | equiv | has_part | checksum | owner |
| --- | --- | --- | --- | --- |
| PART-0001 | data_lineage_node | TARG-0003 | c0ffee42 | platform-team |
| PART-0002 | log_pattern_delta | TARG-0001 | 1a4b6c2d | platform-team |
| PART-0003 | record_linkage_set | TARG-0004 | a3f9c21e | governance |
| PART-0004 | data_lineage_node | TARG-0004 | c0ffee42 | ml-infra |
| PART-0005 | contract_alpha_v2 | TARG-0001 | 1a4b6c2d | ml-infra |
| PART-0006 | entity_resolution_run | TARG-0005 | 7b14de08 | analytics |
| PART-0007 | metric_namespace_prod | TARG-0002 | c0ffee42 | ml-infra |