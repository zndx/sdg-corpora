---
chapter_id: ch_live_outlier_detection_with_baseline_cefcc9
topic_id: 23
family: 02_observation_measurement
cited_terms: ['outlier_detection_with_baseline', 'ebpfprogram_attaches_kernelhook_xref', 'log_with_resource_attribute']
model: engine-refine
---

Governed observability and compliance systems treat every durable record as an **entity** whose meaning is fixed only when it carries a stable **identifier** and is situated within typed relationships and attribute bindings. An identifier such as `BASE-0001` or `XREF-0003` is not merely a surrogate key: it is the durable handle by which audit trails, cross-references, and authorization decisions remain coherent across ingestion, transformation, and retention. Entities without identifiers cannot be attributed, versioned, or compared; entities with identifiers but without declared semantics remain inert rows. In operational practice, identifiers anchor both the anomaly records that enter outlier workflows (`BASE-0001` through `BASE-0004`) and the instrumentation cross-references that attach eBPF programs (`XREF-0001` through `XREF-0004`) to kernel hooks, so that downstream governance can answer not only *what* was observed but *which* governed object was responsible for the observation.

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

**Attributes** name the facets an entity may legally carry, while **attr type** constrains how those facets may be asserted and stored. A resource attribute declaration pairs `attr_name` with `attr_type`: `checksum` as `xsd:string`, `created_date` as `xsd:date`, `identifier` as `cco:DesignativeICE`, and `license` again as `xsd:string`. The type is the compliance contract—validators, serializers, and retention policies consult it before accepting a value. Typed value stores then partition **misc** payloads by representation: varchar holds `7b14de08`, `ref-8842`, `Apache-2.0`, and `ap-south-2`; date holds `2025-04-17`, `2025-02-23`, `2025-06-16`, and `2023-07-21`; integer holds `268`, `11`, `212`, and `1`. The misc column is therefore not miscellaneous in the colloquial sense; it is the evidence field whose interpretation is entirely determined by the binding of `entity_id` to `attr_id` and by the declared attr type. When `entity_id` `XREF-0001` binds `attr_id` `XREF-0002`, the misc value `2025-04-17` is unambiguously a creation timestamp for the cross-reference that names `dns_query_parser`, not a checksum or license string.

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

Relational governance extends beyond scalar decoration through **subject**, **target**, and **role**, which together specify who or what participates in a governed comparison and under which capacity. In outlier detection against baselines, the observed deviation—`network latency jump` on `BASE-0001`, `log flood` on `BASE-0003`, `sensor drift` on `BASE-0004`—is not evaluated in isolation; it is positioned relative to a baseline frame such as `expected distribution`, `nominal profile`, or `seasonal pattern`. Association rows make that positioning explicit: `outlier_id` functions as subject, `against_id` as target, and `role` as the capacity in which the linkage is asserted (`observer`, `owner`, `reviewer`). Thus `BASE-0001` may appear simultaneously as an outlier record and, in a separate association, as subject `BASE-0001` linked to target `BASE-0005` under role `observer`, while `BASE-0004` pairs with target `BASE-0002` under the same role. Roles matter because identical numeric or textual facts carry different compliance weight depending on whether the asserting party observed, owned, or reviewed the relationship; auditors reconstruct evidentiary chains from these triples rather than from flat anomaly labels alone.

**t_outlier_detection_with_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | network latency jump |
| BASE-0002 | network latency jump |
| BASE-0003 | log flood |
| BASE-0004 | sensor drift |
| BASE-0005 | API error surge |
| BASE-0006 | disk I/O stall |

**t_outlier_detection_with_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | expected distribution |
| BASE-0002 | nominal profile |
| BASE-0003 | seasonal pattern |
| BASE-0004 | seasonal pattern |
| BASE-0005 | statistical baseline |
| BASE-0006 | control group dataset |
| BASE-0007 | seasonal pattern |

**t_outlier_detection_with_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | observer |
| BASE-0002 | BASE-0001 | BASE-0004 | owner |
| BASE-0003 | BASE-0004 | BASE-0002 | reviewer |
| BASE-0004 | BASE-0003 | BASE-0002 | observer |
| BASE-0005 | BASE-0004 | BASE-0007 | observer |
| BASE-0006 | BASE-0005 | BASE-0003 | observer |
| BASE-0007 | BASE-0006 | BASE-0006 | owner |
| BASE-0008 | BASE-0001 | BASE-0003 | reviewer |

At the analytic layer, **resource attribute** keys join operational facts to dimensional **category** semantics, while **size_bytes** and **version** quantify material change over time. Fact rows keyed `ATTR-0001` through `ATTR-0004` reference `resource_attribute_key` values that resolve, through `dim_resource_attribute`, to human-readable labels and categorical placement—`Resource Attribute Category 01` through `Resource Attribute Category 04`—so that volumetric telemetry inherits business and policy classification rather than remaining opaque byte counts. Size in bytes (`913386183`, `303816232`, `758542341`, `442933768`) records the physical footprint attributable to each keyed attribute instance, supporting capacity planning, cost allocation, and evidentiary proportionality reviews. **Version** (`6`, `7`, `7`, `2`) records which revision of the attribute definition or fact grain was in force when the measurement was taken, which is essential when retention rules, encryption standards, or schema migrations alter the meaning of a key without changing its identifier. Repeated keys such as `ATTR-0001` appearing at versions `7` and `2` with distinct size_bytes values signal evolutionary drift that compliance officers must reconcile against change-control records.

**fact_log**

| id | resource_attribute_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0005 | 913386183 | 6 |
| ATTR-0002 | ATTR-0006 | 303816232 | 7 |
| ATTR-0003 | ATTR-0001 | 758542341 | 7 |
| ATTR-0004 | ATTR-0001 | 442933768 | 2 |

Taken together, these constructs implement a layered model in which identifiers stabilize entities, attr and attr type govern permissible assertions, misc carries typed evidence, subject–target–role tuples encode governed relationships, and resource attribute with category, size_bytes, and version supply the measurable, classifiable, and temporally scoped facts upon which handbook obligations rest. Whether the domain is kernel-attached `network_latency_tracker` instrumentation or baseline-relative `network latency jump` anomalies, the same primitives recur: name the entity, type the attribute, bind the value, classify the resource, measure its footprint, version the assertion, and document the relational role under which the comparison was made. That recurrence is precisely why these fields appear as first-class governance vocabulary rather than incidental schema columns—they are the minimum orthogonal basis for defensible, queryable, and auditable operational truth.

**dim_resource_attribute**

| id | resource_attribute_label | resource_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Resource Attribute Label 01 | Resource Attribute Category 01 |
| ATTR-0002 | Resource Attribute Label 02 | Resource Attribute Category 02 |
| ATTR-0003 | Resource Attribute Label 03 | Resource Attribute Category 03 |
| ATTR-0004 | Resource Attribute Label 04 | Resource Attribute Category 04 |
| ATTR-0005 | Resource Attribute Label 05 | Resource Attribute Category 05 |
| ATTR-0006 | Resource Attribute Label 06 | Resource Attribute Category 06 |