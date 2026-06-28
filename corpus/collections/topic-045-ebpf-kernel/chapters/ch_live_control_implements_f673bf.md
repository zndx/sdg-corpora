---
chapter_id: ch_live_control_implements_f673bf
topic_id: 45
family: 03_directive_governance
cited_terms: ['control_implements', 'digital_media_service', 'ebpfmap_only_one_value_type']
model: engine-refine
---

In dimensional data modeling, the distinction between descriptive attributes and measurable quantities structures how analytical queries are composed and how referential integrity is maintained across fact and dimension tables. Identifiers serve as the immutable keys that anchor every record, whether they appear as `IMPL-0001` through `IMPL-0004` in the control implementation registry or as `SERV-0001` through `SERV-0004` in the service function catalog. These identifiers are not merely labels; they are the join predicates that bind fact tables to their corresponding dimensions, ensuring that every event count or size measurement can be traced back to a well-defined entity. The `provides_function` column in the control implementation table and the `provides_function_key` foreign key in the digital events fact table both reference the same dimension, creating a bridge between governance controls and the operational events they are designed to govern.

**fact_digital**

| id | provides_function_key | event_count |
| --- | --- | --- |
| SERV-0001 | SERV-0005 | 311 |
| SERV-0002 | SERV-0003 | 322 |
| SERV-0003 | SERV-0002 | 297 |
| SERV-0004 | SERV-0002 | 386 |
| SERV-0005 | SERV-0005 | 377 |
| SERV-0006 | SERV-0006 | 162 |

Categories and miscellaneous labels populate the dimension tables, providing the semantic context that transforms raw identifiers into analyzable groupings. The `provides_function_category` attribute in the service function dimension assigns classifications such as `Provides Function Category 01` through `Provides Function Category 04`, while the `value_type_map_category` in the value type map dimension similarly assigns `Value Type Map Category 01` through `Value Type Map Category 04`. These categorical attributes enable aggregation and filtering at query time without denormalizing the fact tables. The corresponding `misc` columns—`provides_function_label` and `value_type_map_label`—carry human-readable descriptors like `Provides Function Label 01` or `Value Type Map Label 02`, which are used for display and reporting but do not participate in join logic. This separation of machine-readable category from human-readable label is a standard pattern that supports both programmatic filtering and user-facing dashboards.

**dim_provides_function**

| id | provides_function_label | provides_function_category |
| --- | --- | --- |
| SERV-0001 | Provides Function Label 01 | Provides Function Category 01 |
| SERV-0002 | Provides Function Label 02 | Provides Function Category 02 |
| SERV-0003 | Provides Function Label 03 | Provides Function Category 03 |
| SERV-0004 | Provides Function Label 04 | Provides Function Category 04 |
| SERV-0005 | Provides Function Label 05 | Provides Function Category 05 |
| SERV-0006 | Provides Function Label 06 | Provides Function Category 06 |

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

Event counts and size measurements constitute the numeric measures that fact tables are designed to store. The digital events fact table records `event_count` values ranging from 297 to 386 across its four service function records, with `SERV-0004` registering the highest count at 386 events and `SERV-0003` the lowest at 297. These counts are additive measures that can be summed across time partitions or aggregated by the `provides_function_key` foreign key to produce service-level activity summaries. In the eBPF map fact table, `size_bytes` values span several orders of magnitude, from 31,105,012 bytes for `TYPE-0003` to 354,373,995 bytes for `TYPE-0004`, reflecting the variable memory footprint of different kernel-level data structures. The `value_type_map_key` foreign key in this table links each size measurement to its type classification, with `TYPE-0002` appearing three times across records `TYPE-0001` through `TYPE-0003`, indicating that this type map category is the most frequently instantiated.

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |

Version numbers and priority levels introduce temporal and ordinal dimensions to the data model. The eBPF map fact table stores `version` values of 3, 6, 12, and 5 across its four records, enabling queries that isolate measurements by software revision or that track how size distributions shift across versions. The control implementation table stores `priority` values of 1, 3, and 5, with the `Access Review Cycle` control carrying the highest priority of 1 and the `Change Advisory Board` and `Data Retention Schedule` controls both at priority 3. These priority levels are not foreign keys but rather ordinal attributes that support ranking and escalation logic in operational workflows.

Scope and the implements relationship define the operational boundaries and functional mappings that govern how controls are applied. The control implementation table records `scope` values of `regional`, `global`, and `team`, with the `Change Advisory Board` control scoped to `regional` operations and the `Access Review Cycle` control scoped to `team`-level execution. The `implements` column establishes which technical artifacts each control governs, such as `Automated Backup Scripts` being covered by both the `Change Advisory Board` and `Data Retention Schedule` controls, or `Database Audit Trails` being governed by the `Access Review Cycle` control. This many-to-many relationship between controls and implemented artifacts is resolved through the fact table's structure, where each row represents a distinct control-to-implementation pairing with its own priority and scope assignment.

**t_control_implements**

| id | control | implements | priority | scope |
| --- | --- | --- | --- | --- |
| IMPL-0001 | Change Advisory Board | Automated Backup Scripts | 5 | regional |
| IMPL-0002 | Data Retention Schedule | Automated Backup Scripts | 3 | global |
| IMPL-0003 | Access Review Cycle | Database Audit Trails | 1 | team |
| IMPL-0004 | Data Retention Schedule | Patch Deployment Pipeline | 3 | team |
| IMPL-0005 | GDPR Data Minimization | Container Image Scanning | 1 | global |
| IMPL-0006 | Incident Response Protocol | Network Firewall Rules | 1 | global |
| IMPL-0007 | NIST SP 800-53 | Container Image Scanning | 2 | local |