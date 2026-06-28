---
chapter_id: ch_live_ebpfprogram_attaches_kernelhook_xref_e3a9fb
topic_id: 23
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_attaches_kernelhook_xref', 'social_enterprise_annual_income', 'functional_dependency_rhs']
model: engine-refine
---

The architecture for representing structured metadata and attribute-value pairs follows a normalized, type-disaggregated pattern in which entities are decoupled from their properties and those properties are further disaggregated by value type. At the core of this design, the cross-reference table `t_ebpfprogram_attaches_kernelhook_xref` anchors a set of eBPF program-to-kernel-hook mappings—`dns_query_parser`, `network_latency_tracker`, `block_io_monitor`, and `tcp_retrans_monitor`—each identified by a surrogate key such as `XREF-0001`. Attribute definitions are stored in a companion table, `t_ebpfprogram_attaches_kernelhook_xref_attr`, where names like `checksum`, `created_date`, `identifier`, and `license` are paired with their schema-level types: `xsd:string`, `xsd:date`, `cco:DesignativeICE`, and `xsd:string` respectively. This separation of entity identity, attribute schema, and attribute values into distinct tables enables type-safe storage and avoids the null proliferation inherent in wide, denormalized schemas.

**t_ebpfprogram_attaches_kernelhook_xref**

| id | ebpfprogram |
| --- | --- |
| XREF-0001 | dns_query_parser |
| XREF-0002 | network_latency_tracker |
| XREF-0003 | block_io_monitor |
| XREF-0004 | tcp_retrans_monitor |
| XREF-0005 | tcp_retrans_monitor |
| XREF-0006 | syscall_trace_logger |

**t_ebpfprogram_attaches_kernelhook_xref_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| XREF-0001 | checksum | xsd:string |
| XREF-0002 | created_date | xsd:date |
| XREF-0003 | identifier | cco:DesignativeICE |
| XREF-0004 | license | xsd:string |
| XREF-0005 | mime_type | xsd:string |
| XREF-0006 | size_bytes | xsd:long |
| XREF-0007 | uri | xsd:string |
| XREF-0008 | version | xsd:integer |

**t_ebpfprogram_attaches_kernelhook_xref_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2025-04-17 |
| XREF-0002 | XREF-0002 | XREF-0002 | 2025-02-23 |
| XREF-0003 | XREF-0003 | XREF-0002 | 2025-06-16 |
| XREF-0004 | XREF-0004 | XREF-0002 | 2023-07-21 |
| XREF-0005 | XREF-0005 | XREF-0002 | 2024-01-20 |
| XREF-0006 | XREF-0006 | XREF-0002 | 2025-03-02 |

**t_ebpfprogram_attaches_kernelhook_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0006 | 268 |
| XREF-0002 | XREF-0001 | XREF-0008 | 11 |
| XREF-0003 | XREF-0002 | XREF-0006 | 212 |
| XREF-0004 | XREF-0002 | XREF-0008 | 1 |
| XREF-0005 | XREF-0003 | XREF-0006 | 251 |
| XREF-0006 | XREF-0003 | XREF-0008 | 5 |
| XREF-0007 | XREF-0004 | XREF-0006 | 130 |
| XREF-0008 | XREF-0004 | XREF-0008 | 6 |

Value storage is further partitioned by data type across three dedicated tables. The `t_ebpfprogram_attaches_kernelhook_xref_val_varchar` table holds string-valued attributes, capturing identifiers such as `7b14de08`, reference codes like `ref-8842`, license designations including `Apache-2.0`, and regional designators such as `ap-south-2`. Temporal values are stored in `t_ebpfprogram_attaches_kernelhook_xref_val_date`, where entries like `2025-04-17`, `2025-02-23`, `2025-06-16`, and `2023-07-21` are linked to their corresponding attribute definitions via the `attr_id` foreign key. Numeric values reside in `t_ebpfprogram_attaches_kernelhook_xref_val_int`, with integer entries such as `268`, `11`, `212`, and `1` associated with attribute keys `XREF-0006` and `XREF-0008`. In each case, the `entity_id` column establishes the many-to-many relationship between entities and their typed attribute values, while the `attr_id` column resolves the semantic meaning of each value to its definition in the attribute schema table.

**t_ebpfprogram_attaches_kernelhook_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 7b14de08 |
| XREF-0002 | XREF-0001 | XREF-0003 | ref-8842 |
| XREF-0003 | XREF-0001 | XREF-0004 | Apache-2.0 |
| XREF-0004 | XREF-0001 | XREF-0009 | ap-south-2 |
| XREF-0005 | XREF-0001 | XREF-0005 | application/octet-stream |
| XREF-0006 | XREF-0001 | XREF-0010 | Name 06 |
| XREF-0007 | XREF-0001 | XREF-0011 | platform-team |
| XREF-0008 | XREF-0001 | XREF-0012 | Tags 08 |

A parallel structure governs the `t_social_enterprise_annual_income` domain, where the entity table records enterprise identifiers such as `BrightFuture Learning`, `Sustainable Harvest Fund`, and `Urban Harvest Co-op` under keys `INCO-0001` through `INCO-0004`. The associated attribute definitions in `t_social_enterprise_annual_income_attr` include `confidence`, `dimension_kind`, `method`, and `recorded_at`, with types spanning `xsd:decimal`, `xsd:string`, and `xsd:dateTime`. Value tables follow the same disaggregation principle: `t_social_enterprise_annual_income_val_decimal` stores numeric measures such as `0.063`, `21.38`, `997.65`, and `0.705`; `t_social_enterprise_annual_income_val_datetime` captures temporal stamps including `2024-11-16T11:00:06`, `2025-02-04T05:23:06`, `2023-12-18T07:36:57`, and `2024-08-27T04:35:14`; and `t_social_enterprise_annual_income_val_varchar` holds categorical and free-text values such as `Dimension Kind 01`, `Encoding 02`, `change rationale`, and the language code `fr`. The consistent use of `entity_id` and `attr_id` as foreign keys across all value tables ensures that every stored datum is traceable to both its originating entity and its semantic definition.

**t_social_enterprise_annual_income**

| id | social_enterprise_annual_income |
| --- | --- |
| INCO-0001 | BrightFuture Learning |
| INCO-0002 | Sustainable Harvest Fund |
| INCO-0003 | Urban Harvest Co-op |
| INCO-0004 | Urban Harvest Co-op |
| INCO-0005 | CleanTech Ventures |
| INCO-0006 | FairTrade Roots |

**t_social_enterprise_annual_income_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| INCO-0001 | confidence | xsd:decimal |
| INCO-0002 | dimension_kind | xsd:string |
| INCO-0003 | method | xsd:string |
| INCO-0004 | recorded_at | xsd:dateTime |
| INCO-0005 | uncertainty | xsd:decimal |
| INCO-0006 | unit | xsd:string |
| INCO-0007 | value | xsd:decimal |
| INCO-0008 | encoding | xsd:string |

**t_social_enterprise_annual_income_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0004 | 2024-11-16T11:00:06 |
| INCO-0002 | INCO-0002 | INCO-0004 | 2025-02-04T05:23:06 |
| INCO-0003 | INCO-0003 | INCO-0004 | 2023-12-18T07:36:57 |
| INCO-0004 | INCO-0004 | INCO-0004 | 2024-08-27T04:35:14 |
| INCO-0005 | INCO-0005 | INCO-0004 | 2023-06-07T02:54:49 |
| INCO-0006 | INCO-0006 | INCO-0004 | 2024-06-20T22:31:31 |

**t_social_enterprise_annual_income_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0001 | 0.063 |
| INCO-0002 | INCO-0001 | INCO-0005 | 21.38 |
| INCO-0003 | INCO-0001 | INCO-0007 | 997.65 |
| INCO-0004 | INCO-0002 | INCO-0001 | 0.705 |
| INCO-0005 | INCO-0002 | INCO-0005 | 716.05 |
| INCO-0006 | INCO-0002 | INCO-0007 | 442.00 |
| INCO-0007 | INCO-0003 | INCO-0001 | 0.150 |
| INCO-0008 | INCO-0003 | INCO-0005 | 767.65 |

**t_social_enterprise_annual_income_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| INCO-0001 | INCO-0001 | INCO-0002 | Dimension Kind 01 |
| INCO-0002 | INCO-0001 | INCO-0008 | Encoding 02 |
| INCO-0003 | INCO-0001 | INCO-0009 | change rationale |
| INCO-0004 | INCO-0001 | INCO-0010 | fr |
| INCO-0005 | INCO-0001 | INCO-0003 | automated |
| INCO-0006 | INCO-0001 | INCO-0006 | deg_C |
| INCO-0007 | INCO-0002 | INCO-0002 | Dimension Kind 07 |
| INCO-0008 | INCO-0002 | INCO-0008 | Encoding 08 |

Beyond attribute-value modeling, the schema also encodes functional dependency relationships through a tripartite structure. The table `t_functional_dependency_rhs` defines the left-hand side subjects of dependencies—`data ingestion pipeline`, `encryption transformation`, `telemetry aggregation service`, and `access control evaluator`—while `t_functional_dependency_rhs_f_d_right_hand_side` enumerates the corresponding right-hand side outcomes: `aggregated event count`, `sanitized email address`, `partition key value`, and `enriched sensor reading`. The join table `t_functional_dependency_rhs__f_d_right_hand_side` binds these two sets together, assigning each pair a role of either `contributor` or `owner`. For instance, the dependency `RHS-0003` links `telemetry aggregation service` to `enriched sensor reading` with the role `owner`, while `RHS-0002` connects `encryption transformation` to `partition key value` as `owner`, and `RHS-0004` associates `access control evaluator` with `enriched sensor reading` as `owner`. The `RHS-0001` entry, linking `data ingestion pipeline` to `aggregated event count`, carries the role `contributor`, indicating a less authoritative relationship. This role-based join table provides a mechanism for expressing not merely that a functional dependency exists, but the nature of the relationship between the determining and determined attributes.

**t_functional_dependency_rhs_f_d_right_hand_side**

| id | f_d_right_hand_side |
| --- | --- |
| RHS-0001 | aggregated event count |
| RHS-0002 | sanitized email address |
| RHS-0003 | partition key value |
| RHS-0004 | enriched sensor reading |
| RHS-0005 | derived priority level |
| RHS-0006 | computed latency metric |
| RHS-0007 | computed latency metric |

**t_functional_dependency_rhs__f_d_right_hand_side**

| id | functional_id | f_d_right_hand_side_id | role |
| --- | --- | --- | --- |
| RHS-0001 | RHS-0003 | RHS-0007 | contributor |
| RHS-0002 | RHS-0004 | RHS-0001 | owner |
| RHS-0003 | RHS-0002 | RHS-0005 | owner |
| RHS-0004 | RHS-0003 | RHS-0006 | owner |
| RHS-0005 | RHS-0003 | RHS-0001 | owner |
| RHS-0006 | RHS-0001 | RHS-0005 | owner |
| RHS-0007 | RHS-0001 | RHS-0006 | contributor |
| RHS-0008 | RHS-0002 | RHS-0001 | contributor |

The design choices reflected across these tables—surrogate identifier keys prefixed by domain abbreviations (`XREF-`, `INCO-`, `RHS-`), type-disaggregated value storage, and role-enriched relationship tables—collectively support a governance framework in which metadata provenance, type safety, and relationship semantics are first-class concerns. The use of standardized XML Schema types (`xsd:string`, `xsd:date`, `xsd:dateTime`, `xsd:decimal`) alongside domain-specific types such as `cco:DesignativeICE` signals an intent to align with broader ontology and standards ecosystems. The separation of attribute definitions from their values permits schema evolution without data migration, while the role annotations on functional dependency links enable fine-grained access control and auditability. In practice, querying any attribute value requires a three-hop join through the entity, attribute definition, and value tables—a deliberate trade-off favoring normalization and type integrity over query simplicity.

**t_functional_dependency_rhs**

| id | functional |
| --- | --- |
| RHS-0001 | data ingestion pipeline |
| RHS-0002 | encryption transformation |
| RHS-0003 | telemetry aggregation service |
| RHS-0004 | access control evaluator |
| RHS-0005 | telemetry aggregation service |
| RHS-0006 | schema validation routine |