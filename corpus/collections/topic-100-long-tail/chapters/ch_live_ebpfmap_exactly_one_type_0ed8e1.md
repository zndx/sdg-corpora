---
chapter_id: ch_live_ebpfmap_exactly_one_type_0ed8e1
topic_id: 100
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_exactly_one_type', 'trace_in_service', 'electricity_usage_pattern_record']
model: engine-refine
---

In governed operational telemetry and utility metering systems, the semantic roles that bind facts to the things they describe—attr, attr type, entity, identifier, misc, role, subject, target, serviceusagecategory, tariffstructure, usagepatternrecord, and cardinality note—form the interpretive layer through which raw observations become auditable evidence. An identifier is the durable, system-wide key that makes a record addressable across registries, association tables, and typed value stores without ambiguity; values such as TYPE-0001, SERV-0003, and RECO-0004 are not merely surrogate keys but stable handles that survive reclassification, downstream joins, and compliance review. The entity is the operational object those identifiers denote—the trace run, the eBPF map instance, the electricity usage pattern record—while attr names the measurable property asserted about that entity and attr type constrains how the assertion may be represented and validated. Declaring duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string establishes a contract: the same logical attribute cannot silently change representation, and consumers may enforce schema, range, and unit expectations before the value enters analytics or billing workflows.

**t_trace_in_service**

| id | trace | in_service |
| --- | --- | --- |
| SERV-0001 | ci-cd-deploy-run | TYPE-0001 |
| SERV-0002 | nightly-data-sync | TYPE-0006 |
| SERV-0003 | microservice-call-path | TYPE-0003 |
| SERV-0004 | sensor-telemetry-batch | TYPE-0004 |
| SERV-0005 | nightly-data-sync | TYPE-0002 |
| SERV-0006 | microservice-call-path | TYPE-0004 |

**t_trace_in_service_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SERV-0001 | duration_seconds | xsd:decimal |
| SERV-0002 | end_time | xsd:dateTime |
| SERV-0003 | exit_code | xsd:integer |
| SERV-0004 | host_name | xsd:string |
| SERV-0005 | log_level | xsd:string |
| SERV-0006 | phase | xsd:string |
| SERV-0007 | retry_count | xsd:integer |
| SERV-0008 | scheduled_at | xsd:dateTime |

**t_trace_in_service_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0002 | 2023-02-11T21:39:45 |
| SERV-0002 | SERV-0001 | SERV-0008 | 2025-04-17T05:33:23 |
| SERV-0003 | SERV-0001 | SERV-0009 | 2024-09-24T02:59:34 |
| SERV-0004 | SERV-0002 | SERV-0002 | 2023-11-01T18:02:16 |
| SERV-0005 | SERV-0002 | SERV-0008 | 2023-07-24T15:59:25 |
| SERV-0006 | SERV-0002 | SERV-0009 | 2023-09-19T06:42:34 |
| SERV-0007 | SERV-0003 | SERV-0002 | 2025-04-22T19:55:46 |
| SERV-0008 | SERV-0003 | SERV-0008 | 2024-12-15T02:05:50 |

**t_trace_in_service_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0001 | 4381.06 |
| SERV-0002 | SERV-0002 | SERV-0001 | 2102.62 |
| SERV-0003 | SERV-0003 | SERV-0001 | 5138.88 |
| SERV-0004 | SERV-0004 | SERV-0001 | 2082.99 |
| SERV-0005 | SERV-0005 | SERV-0001 | 6123.82 |
| SERV-0006 | SERV-0006 | SERV-0001 | 5465.25 |

**t_trace_in_service_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0003 | 744 |
| SERV-0002 | SERV-0001 | SERV-0007 | 59 |
| SERV-0003 | SERV-0002 | SERV-0003 | 247 |
| SERV-0004 | SERV-0002 | SERV-0007 | 232 |
| SERV-0005 | SERV-0003 | SERV-0003 | 916 |
| SERV-0006 | SERV-0003 | SERV-0007 | 56 |
| SERV-0007 | SERV-0004 | SERV-0003 | 376 |
| SERV-0008 | SERV-0004 | SERV-0007 | 417 |

**t_trace_in_service_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0001 | SERV-0004 | node-b14 |
| SERV-0002 | SERV-0001 | SERV-0005 | Log Level 02 |
| SERV-0003 | SERV-0001 | SERV-0006 | initiation |
| SERV-0004 | SERV-0001 | SERV-0010 | failed |
| SERV-0005 | SERV-0001 | SERV-0011 | Triggered By 05 |
| SERV-0006 | SERV-0002 | SERV-0004 | node-b14 |
| SERV-0007 | SERV-0002 | SERV-0005 | Log Level 07 |
| SERV-0008 | SERV-0002 | SERV-0006 | initiation |

**t_electricity_usage_pattern_record**

| id | usage_pattern_record |
| --- | --- |
| RECO-0001 | BaseLoad-Res09 |
| RECO-0002 | SmartMeter-8842 |
| RECO-0003 | CommHVAC-15 |
| RECO-0004 | SmartMeter-8842 |
| RECO-0005 | LoadProfile-77B |
| RECO-0006 | ResNight-22 |

**t_electricity_usage_pattern_record_corresponds_to_tariff**

| id | corresponds_to_tariff |
| --- | --- |
| RECO-0001 | RealTimeWholesale |
| RECO-0002 | RealTimeWholesale |
| RECO-0003 | CriticalPeakReward |
| RECO-0004 | RealTimeWholesale |
| RECO-0005 | RealTimeWholesale |
| RECO-0006 | BasicServicePlan |
| RECO-0007 | TieredResidential |
| RECO-0008 | RealTimeWholesale |

**t_electricity_usage_pattern_record__corresponds_to_tariff**

| id | electricity_id | corresponds_to_tariff_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| RECO-0001 | RECO-0006 | RECO-0002 | contributor | Cardinality Note 01 |
| RECO-0002 | RECO-0004 | RECO-0001 | contributor | Cardinality Note 02 |
| RECO-0003 | RECO-0004 | RECO-0008 | observer | Cardinality Note 03 |
| RECO-0004 | RECO-0001 | RECO-0003 | observer | Cardinality Note 04 |
| RECO-0005 | RECO-0002 | RECO-0002 | observer | Cardinality Note 05 |
| RECO-0006 | RECO-0005 | RECO-0001 | contributor | Cardinality Note 06 |
| RECO-0007 | RECO-0006 | RECO-0005 | observer | Cardinality Note 07 |
| RECO-0008 | RECO-0006 | RECO-0001 | reviewer | Cardinality Note 08 |

The misc designation marks the payload column that carries the asserted fact once typing is resolved—4381.06 seconds of runtime, exit_code 744, host_name node-b14, end_time 2023-02-11T21:39:45—partitioned across decimal, integer, varchar, and datetime stores so that enforcement occurs at ingest rather than at query time. In practice, entity and attr jointly index misc: a single trace entity SERV-0001 may simultaneously hold a decimal duration, multiple datetime boundaries, integer status codes, and varchar diagnostics, each row tying entity_id and attr_id to one typed value. This pattern matters because operational forensics and regulatory attestation require provenance at the attribute grain; auditors do not accept an undifferentiated blob when they must show which field—duration_seconds versus exit_code versus host_name—supported a conclusion about ci-cd-deploy-run or sensor-telemetry-batch behavior.

Subject and target articulate directed relationships between governed records, with role qualifying how each endpoint participates in the link. When ebpfmap_id TYPE-0002 is associated to map_type_id TYPE-0001 under role contributor, the subject names the originating governed object and the target names the classification or counterpart it binds to—here, an eBPF artifact such as tcp_conn_map related to hash—while role distinguishes ownership from observation, contribution from review. The same subject–target–role grammar appears where electricity_id RECO-0004 links to records_service_category_id RECO-0006 as owner, or where RECO-0001 links to corresponds_to_tariff_id RECO-0002 as contributor: subject anchors the usage-side record, target anchors the taxonomy or tariff construct, and role documents accountability rather than implying symmetric equivalence. Governance frameworks treat these triples as non-optional metadata; without role, a join would falsely suggest peer interchangeability between a SmartMeter-8842 pattern and a ResidentialGeneral category, or between a CommHVAC-15 load profile and a CriticalPeakReward tariff.

Usagepatternrecord and serviceusagecategory name the domain nouns that electricity operations place under control: a usage pattern record such as BaseLoad-Res09 or SmartMeter-8842 captures how demand manifests over time and metering context, while serviceusagecategory—RuralCoopDist, DataCenterIT, IndustrialProcess, ResidentialGeneral—classifies the service context in which that pattern is interpreted for allocation, reporting, and tariff application. Tariffstructure, exemplified by RealTimeWholesale and CriticalPeakReward, encodes the pricing and settlement regime to which a pattern may correspond; multiple records may reference the same tariff, and the same physical meter identifier may recur across distinct governed rows when policy requires separate attestations. Cardinality note exists precisely where naive one-to-one assumptions fail: annotations such as Cardinality Note 01 through Cardinality Note 04 on electricity-to-tariff associations document whether a link is mandatory, optional, singular, or repeatable, preventing silent many-to-many collapse when RECO-0004 and RECO-0001 both correspond to RealTimeWholesale under different roles and subject–target pairings.

**t_electricity_usage_pattern_record_records_service_category**

| id | records_service_category |
| --- | --- |
| RECO-0001 | RuralCoopDist |
| RECO-0002 | DataCenterIT |
| RECO-0003 | IndustrialProcess |
| RECO-0004 | ResidentialGeneral |
| RECO-0005 | MunicipalLighting |
| RECO-0006 | MunicipalLighting |

**t_electricity_usage_pattern_record__records_service_category**

| id | electricity_id | records_service_category_id | role |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0004 | RECO-0006 | reviewer |
| RECO-0002 | RECO-0001 | RECO-0004 | owner |
| RECO-0003 | RECO-0006 | RECO-0001 | observer |
| RECO-0004 | RECO-0006 | RECO-0006 | owner |
| RECO-0005 | RECO-0005 | RECO-0004 | observer |
| RECO-0006 | RECO-0001 | RECO-0001 | observer |
| RECO-0007 | RECO-0006 | RECO-0003 | owner |
| RECO-0008 | RECO-0004 | RECO-0005 | contributor |

Across both eBPF map typing and in-service trace characterization, these constructs interoperate. Trace registries name operational paths—nightly-data-sync, microservice-call-path—and bind them to type identifiers that participate in wider classification graphs; map_type queue, devmap, hash, and ringbuf classify kernel-side structures whose names cgroup_sock_map and dns_query_cache must resolve to exactly one type in governed registries. Identifier stability, attr typing, typed misc storage, subject–target linkage with explicit role, and cardinality_note on tariff correspondence together yield a reference model in which evidence is granular, relationships are directional and accountable, and domain terms remain semantically loaded rather than opaque column labels. Implementers who treat attr and attr type as presentation metadata, or who omit role and cardinality_note from association semantics, inherit reconciliation risk: billing disputes, incomplete audit trails, and observability joins that conflate observer access with ownership obligation. The operational guide therefore treats these roles as first-class governance primitives—each naming not a storage convenience but the minimum interpretive apparatus required for defensible use of usagepatternrecord, serviceusagecategory, and tariffstructure data alongside instrumented service traces and kernel map inventories.

**t_ebpfmap_exactly_one_type**

| id | ebpfmap |
| --- | --- |
| TYPE-0001 | cgroup_sock_map |
| TYPE-0002 | tcp_conn_map |
| TYPE-0003 | perf_event_array |
| TYPE-0004 | dns_query_cache |
| TYPE-0005 | tcp_conn_map |
| TYPE-0006 | skb_drop_reason_map |
| TYPE-0007 | skb_drop_reason_map |

**t_ebpfmap_exactly_one_type_map_type**

| id | map_type |
| --- | --- |
| TYPE-0001 | queue |
| TYPE-0002 | devmap |
| TYPE-0003 | hash |
| TYPE-0004 | ringbuf |
| TYPE-0005 | queue |
| TYPE-0006 | cgroup_storage |
| TYPE-0007 | lru_hash |
| TYPE-0008 | cpumap |

**t_ebpfmap_exactly_one_type__map_type**

| id | ebpfmap_id | map_type_id | role |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0007 | TYPE-0007 | observer |
| TYPE-0002 | TYPE-0002 | TYPE-0005 | owner |
| TYPE-0003 | TYPE-0002 | TYPE-0001 | contributor |
| TYPE-0004 | TYPE-0001 | TYPE-0005 | reviewer |
| TYPE-0005 | TYPE-0004 | TYPE-0008 | reviewer |
| TYPE-0006 | TYPE-0006 | TYPE-0005 | contributor |
| TYPE-0007 | TYPE-0007 | TYPE-0001 | observer |
| TYPE-0008 | TYPE-0005 | TYPE-0005 | contributor |