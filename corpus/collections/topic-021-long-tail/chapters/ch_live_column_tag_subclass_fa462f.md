---
chapter_id: ch_live_column_tag_subclass_fa462f
topic_id: 21
family: 07_long_tail
cited_terms: ['column_tag_subclass', 'equiv_union_three', 'kernelhook_in_kernel_module']
model: engine-refine
---

Attributes and their typed definitions constitute the foundational layer of column-level metadata governance, establishing a formal vocabulary through which data elements are classified, constrained, and audited. Each attribute—whether `confidence`, `dimension_kind`, `method`, or `recorded_at`—is assigned a precise type from the XML Schema Definition namespace, such as `xsd:decimal`, `xsd:string`, or `xsd:dateTime`, ensuring that downstream consumers can validate values against a known schema. This type discipline is not merely declarative; it governs how values are stored, queried, and enforced across heterogeneous data pipelines. A column like `sensor_reading` annotated as `geographic_zone` may carry a `confidence` attribute of type `xsd:decimal` (values such as `0.376` or `0.809`), while the same column may simultaneously hold a `recorded_at` timestamp of type `xsd:dateTime` (e.g., `2025-03-24T11:46:10`), demonstrating that a single data element can be enriched with multiple typed attributes without ambiguity.

Entities serve as the connective tissue between attribute definitions and their concrete instantiations. Each entity—identified by a unique tag such as `TAG-0001` or `MODU-0001`—represents a specific column or kernel hook that has been classified under a particular subclass and annotated with one or more attributes. The entity `TAG-0001`, for instance, corresponds to the column `user_id` and annotates the concept `instrument_measurement`, yet it also carries a rich set of attribute values: a decimal confidence of `0.376`, a string dimension kind of `Dimension Kind 01`, and a recorded timestamp of `2023-08-03T19:45:29`. This multi-dimensional enrichment allows governance frameworks to capture not only what a column represents but also the quality, provenance, and contextual metadata associated with it. The entity model further supports cross-referencing through equivalence unions, where identifiers such as `telemetry_stream_alpha` are linked to operational constructs like `switch_board` and serialization formats such as `flat_text`, enabling traceability across architectural boundaries.

**t_column_tag_subclass**

| id | column | annotates_column |
| --- | --- | --- |
| TAG-0001 | user_id | instrument_measurement |
| TAG-0002 | log_level | clinical_subject |
| TAG-0003 | patient_id | clinical_subject |
| TAG-0004 | sensor_reading | geographic_zone |
| TAG-0005 | throughput_mb | geographic_zone |
| TAG-0006 | sensor_reading | bandwidth_utilization |
| TAG-0007 | region_code | coordinate_latitude |

**t_column_tag_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAG-0001 | confidence | xsd:decimal |
| TAG-0002 | dimension_kind | xsd:string |
| TAG-0003 | method | xsd:string |
| TAG-0004 | recorded_at | xsd:dateTime |
| TAG-0005 | uncertainty | xsd:decimal |
| TAG-0006 | unit | xsd:string |
| TAG-0007 | value | xsd:decimal |
| TAG-0008 | encoding | xsd:string |

**t_column_tag_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0004 | 2023-08-03T19:45:29 |
| TAG-0002 | TAG-0002 | TAG-0004 | 2025-03-24T11:46:10 |
| TAG-0003 | TAG-0003 | TAG-0004 | 2025-05-22T05:44:38 |
| TAG-0004 | TAG-0004 | TAG-0004 | 2025-01-14T19:12:47 |
| TAG-0005 | TAG-0005 | TAG-0004 | 2024-02-24T06:52:57 |
| TAG-0006 | TAG-0006 | TAG-0004 | 2024-10-16T08:04:03 |
| TAG-0007 | TAG-0007 | TAG-0004 | 2025-02-04T08:16:45 |

**t_column_tag_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0001 | 0.376 |
| TAG-0002 | TAG-0001 | TAG-0005 | 922.76 |
| TAG-0003 | TAG-0001 | TAG-0007 | 942.47 |
| TAG-0004 | TAG-0002 | TAG-0001 | 0.809 |
| TAG-0005 | TAG-0002 | TAG-0005 | 398.44 |
| TAG-0006 | TAG-0002 | TAG-0007 | 718.52 |
| TAG-0007 | TAG-0003 | TAG-0001 | 0.172 |
| TAG-0008 | TAG-0003 | TAG-0005 | 254.23 |

**t_column_tag_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0002 | Dimension Kind 01 |
| TAG-0002 | TAG-0001 | TAG-0008 | Encoding 02 |
| TAG-0003 | TAG-0001 | TAG-0009 | intake form |
| TAG-0004 | TAG-0001 | TAG-0010 | en |
| TAG-0005 | TAG-0001 | TAG-0003 | automated |
| TAG-0006 | TAG-0001 | TAG-0006 | m/s |
| TAG-0007 | TAG-0002 | TAG-0002 | Dimension Kind 07 |
| TAG-0008 | TAG-0002 | TAG-0008 | Encoding 08 |

**t_equiv_union_three**

| id | equiv | equiv_2 | equiv_3 | equiv_4 |
| --- | --- | --- | --- | --- |
| THRE-0001 | telemetry_stream_alpha | switch_board | idle_mode | flat_text |
| THRE-0002 | governance_policy_alpha | firewall_rule | rate_limit | json_payload |
| THRE-0003 | governance_policy_alpha | backup_node | maintenance_window | protobuf_msg |
| THRE-0004 | metadata_registry | primary_gateway | rate_limit | yaml_config |
| THRE-0005 | governance_policy_alpha | relay_module | error_recovery | parquet_file |

The value layer distinguishes itself by type, routing attribute values into dedicated storage domains—decimal, datetime, and varchar—each optimized for its respective data shape. Decimal values such as `922.76` and `942.47` populate the numeric store, while string values like `intake form` and `en` reside in the variable-character domain, and ISO 8601 timestamps such as `2025-05-22T05:44:38` are persisted in the datetime table. This separation is not an artifact of implementation but a deliberate governance choice: it ensures that type coercion errors cannot propagate across attribute categories, and it permits independent indexing and retention policies per value type. An entity like `TAG-0002`, which maps the column `log_level` to the annotation `clinical_subject`, may hold a decimal value of `0.809` and a datetime of `2025-01-14T19:12:47`, illustrating how heterogeneous attribute values coexist within a single entity without conflating their semantic domains.

License and location attributes introduce the compliance and operational dimensions that transform metadata from a descriptive exercise into an enforceable governance mechanism. Kernel hooks such as `PsSetCreateProcessNotify_Monitor` are bound to specific kernel modules like `ntoskrnl.exe` and `kdcom.sys`, each carrying an explicit license—`CC-BY-4.0`, `GPL-3.0`, or `MIT`—and a geographic deployment zone such as `zone-b`, `us-east-1`, `eu-west-3`, or `ap-south-2`. This pairing of license with location is critical for regulatory compliance: it enables automated checks that no module operating within a jurisdiction governed by data-residency requirements (e.g., `eu-west-3`) is subject to a license incompatible with local intellectual-property law. Similarly, the equivalence union for `governance_policy_alpha`—linked to `firewall_rule`, `rate_limit`, and `json_payload`—demonstrates how policy artifacts can be traced to their technical implementations and serialization formats, closing the loop between governance intent and operational reality.

**t_kernelhook_in_kernel_module**

| id | kernelhook | in_kernel_module | license | location |
| --- | --- | --- | --- | --- |
| MODU-0001 | PsSetCreateProcessNotify_Monitor | ntoskrnl.exe | CC-BY-4.0 | zone-b |
| MODU-0002 | PsSetCreateProcessNotify_Monitor | kdcom.sys | GPL-3.0 | us-east-1 |
| MODU-0003 | nvlddmkm.sys | IDT_KiDispatch_Stub | MIT | eu-west-3 |
| MODU-0004 | storport.sys | hal.dll | MIT | ap-south-2 |
| MODU-0005 | iaStorAC.sys | iaStorAC.sys | proprietary | zone-b |
| MODU-0006 | ntoskrnl.exe | storport.sys | CC-BY-4.0 | eu-west-3 |
| MODU-0007 | nvlddmkm.sys | Inline_NtQuerySystem | CC-BY-4.0 | eu-west-3 |
| MODU-0008 | dxgkrnl.sys | SSDT_Dispatch_Rewrite | MPL-2.0 | zone-b |