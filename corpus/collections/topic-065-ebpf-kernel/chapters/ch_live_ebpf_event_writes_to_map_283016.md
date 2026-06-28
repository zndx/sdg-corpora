---
chapter_id: ch_live_ebpf_event_writes_to_map_283016
topic_id: 65
family: 02_observation_measurement
cited_terms: ['ebpf_event_writes_to_map', 'equiv_union_ice_branches', 'control_with_owner']
model: engine-refine
---

Operational observability in eBPF-based systems rests on a fact table that records execution outcomes for map-write operations, each identified by a unique identifier such as MAP-0001 through MAP-0004. The fact table captures three quantitative dimensions of runtime behavior: duration_seconds, which measures elapsed time in seconds and ranges from 4285.04 to 6511.30 across observed executions; exit_code, an integer status indicator whose values—224, 266, 948, 381—encode termination conditions; and retry_count, reflecting the number of re-attempts before final resolution, with observed values spanning from 25 to 439. Each fact row is linked to a descriptive dimension through the writes_to_map_key column, which serves as a foreign key into the map-write dimension table. This dimension supplies human-readable labels and categorical classifications for each map-write operation, with labels such as Writes To Map Label 01 through Writes To Map Label 04 and corresponding categories including Writes To Map Category 01 through Writes To Map Category 04. The separation of quantitative execution metrics from qualitative classification enables independent analysis of performance patterns and operational taxonomy.

**fact_ebpf**

| id | writes_to_map_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MAP-0001 | MAP-0002 | 5223.15 | 224 | 439 |
| MAP-0002 | MAP-0004 | 6511.30 | 266 | 25 |
| MAP-0003 | MAP-0001 | 6092.75 | 948 | 201 |
| MAP-0004 | MAP-0006 | 4285.04 | 381 | 33 |
| MAP-0005 | MAP-0001 | 4316.18 | 956 | 335 |

**dim_writes_to_map**

| id | writes_to_map_label | writes_to_map_category |
| --- | --- | --- |
| MAP-0001 | Writes To Map Label 01 | Writes To Map Category 01 |
| MAP-0002 | Writes To Map Label 02 | Writes To Map Category 02 |
| MAP-0003 | Writes To Map Label 03 | Writes To Map Category 03 |
| MAP-0004 | Writes To Map Label 04 | Writes To Map Category 04 |
| MAP-0005 | Writes To Map Label 05 | Writes To Map Category 05 |
| MAP-0006 | Writes To Map Label 06 | Writes To Map Category 06 |
| MAP-0007 | Writes To Map Label 07 | Writes To Map Category 07 |

Governance attributes follow a parallel dimensional pattern, though applied to control ownership rather than runtime telemetry. A control definition table establishes the inventory of governance controls—Vendor Risk Assessment and Data Retention Policy appear among the recorded entries—each assigned a unique identifier such as OWNE-0001 through OWNE-0004. Attribute metadata is defined in a companion table that pairs each attribute with its semantic name and type specification. The attribute names include effective_date, enforcement, mandatory, and priority, while the attribute types conform to XML Schema datatypes: xsd:date, xsd:string, xsd:boolean, and xsd:integer respectively. This type declaration is critical because it determines which value storage table receives the actual attribute assignment, creating a type-dispatch mechanism across four separate valuation tables.

**t_control_with_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Vendor Risk Assessment |
| OWNE-0002 | Data Retention Policy |
| OWNE-0003 | Vendor Risk Assessment |
| OWNE-0004 | Data Retention Policy |
| OWNE-0005 | Password Complexity Policy |
| OWNE-0006 | MFA Enforcement |
| OWNE-0007 | Data Retention Policy |

**t_control_with_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

**t_control_with_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | true |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | true |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | false |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | true |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_control_with_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2024-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2025-04-01 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2025-05-22 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2024-09-08 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-05-30 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-06-07 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2025-03-19 |

**t_control_with_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 4 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 806 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 5 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 150 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 1 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 596 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 663 |

The value storage architecture partitions attribute assignments by data type into four distinct tables, each governed by a common schema of identifier, entity_id, attr_id, and value. The entity column functions as a foreign key referencing the control definition table, while attr_id references the attribute metadata table, establishing a many-to-many relationship between controls and their typed attribute values. Boolean attributes such as mandatory are stored in the boolean valuation table, where values of true and false are recorded against specific entity-attribute pairs—for instance, the attribute OWNE-0003 receives the value true for entities OWNE-0001, OWNE-0002, and OWNE-0004, but false for OWNE-0003. Date attributes like effective_date occupy their own valuation table, with values such as 2024-04-04, 2025-04-01, 2025-05-22, and 2024-09-08 assigned to entity-attribute combinations. Integer attributes including priority are stored in the integer valuation table, where values range from 4 to 806 across the observed entity-attribute mappings. String attributes such as enforcement are persisted in the varchar valuation table, with values including Encoding 01, Enforcement 02, change rationale, and es.

**t_control_with_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | change rationale |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | es |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | intake form |

A third dimensional structure captures equivalence and localization metadata for branch definitions, organized under identifiers such as BRAN-0001 through BRAN-0004. Each branch carries an equivalence classification—Calibration_Offset, Equipment_Model, Data_Retention_Policy, and Quality_Score—alongside a label_text field containing human-readable descriptors like calibration record, change rationale, and intake form. The language column specifies the localization of each label, with observed values including fr, es, and de, indicating that the same equivalence concept may have language-specific representations. This structure supports multilingual governance documentation where branch descriptions and their associated rationale are stored alongside their linguistic context.

**t_equiv_union_ice_branches**

| id | equiv | label_text | language |
| --- | --- | --- | --- |
| BRAN-0001 | Calibration_Offset | calibration record | fr |
| BRAN-0002 | Equipment_Model | change rationale | es |
| BRAN-0003 | Data_Retention_Policy | calibration record | es |
| BRAN-0004 | Quality_Score | intake form | de |
| BRAN-0005 | Quality_Score | change rationale | de |
| BRAN-0006 | Observation_Code | nightly summary | es |
| BRAN-0007 | Safety_Protocol | nightly summary | es |
| BRAN-0008 | Quality_Score | pre-release note | fr |

The foreign-key relationships across these tables form a coherent relational model that separates concerns between operational telemetry, governance metadata, and localization data. The fact table's writes_to_map_key foreign key into the dimension table enables performance analysis to be enriched with categorical context without duplicating descriptive data. Similarly, the entity and attr_id foreign keys in the four valuation tables create a normalized attribute-value store that avoids the pitfalls of wide tables with nullable columns for each attribute type. This design allows new attribute types to be added by creating new valuation tables rather than altering existing schemas, supporting the evolution of governance requirements without schema migration. The consistent use of identifier columns as primary keys across all tables, combined with the typed value partitioning, provides a scalable foundation for querying both operational performance and governance compliance from a unified data model.