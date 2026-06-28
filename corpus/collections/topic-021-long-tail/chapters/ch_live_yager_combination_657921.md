---
chapter_id: ch_live_yager_combination_657921
topic_id: 21
family: 07_long_tail
cited_terms: ['yager_combination', 'ebpfevent_via_program_xref', 'column_tag_subclass']
model: engine-refine
---

Within attribute-centric data architectures, the foundational vocabulary revolves around a small set of interlocking concepts: an identifier uniquely names an entity or attribute definition; an attribute carries a semantic label and a declared type; an entity is the concrete thing to which attribute values are affixed; a value—typed as decimal, integer, datetime, or string—resides in a dedicated value store and is linked back to its entity and attribute through foreign keys; a subject and target denote the two ends of a binary relationship; and a role disambiguates the semantic direction of that relationship. This vocabulary is not merely taxonomic. It is the operational grammar that allows heterogeneous data—sensor readings, event logs, column annotations—to be modelled uniformly, queried across types, and governed through a single schema discipline.

**t_ebpfevent_via_program_xref**

| id | ebpfevent |
| --- | --- |
| XREF-0001 | DATA_LAKE_SYNC_FAIL |
| XREF-0002 | DATA_LAKE_SYNC_FAIL |
| XREF-0003 | TELEMETRY_HEARTBEAT |
| XREF-0004 | BATCH_ETL_COMPLETE |
| XREF-0005 | BATCH_ETL_COMPLETE |
| XREF-0006 | BATCH_ETL_COMPLETE |
| XREF-0007 | AUDIT_LOG_ROTATE |
| XREF-0008 | SYS_METRIC_COLLECT_9 |

**t_ebpfevent_via_program_xref_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| XREF-0001 | duration_seconds | xsd:decimal |
| XREF-0002 | end_time | xsd:dateTime |
| XREF-0003 | exit_code | xsd:integer |
| XREF-0004 | host_name | xsd:string |
| XREF-0005 | log_level | xsd:string |
| XREF-0006 | phase | xsd:string |
| XREF-0007 | retry_count | xsd:integer |
| XREF-0008 | scheduled_at | xsd:dateTime |

**t_ebpfevent_via_program_xref_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0002 | 2024-04-10T05:27:34 |
| XREF-0002 | XREF-0001 | XREF-0008 | 2023-11-22T11:52:36 |
| XREF-0003 | XREF-0001 | XREF-0009 | 2023-03-12T23:52:23 |
| XREF-0004 | XREF-0002 | XREF-0002 | 2023-06-01T11:10:59 |
| XREF-0005 | XREF-0002 | XREF-0008 | 2025-03-29T17:45:15 |
| XREF-0006 | XREF-0002 | XREF-0009 | 2025-05-05T19:52:00 |
| XREF-0007 | XREF-0003 | XREF-0002 | 2025-04-08T16:02:54 |
| XREF-0008 | XREF-0003 | XREF-0008 | 2023-08-28T04:07:50 |

**t_ebpfevent_via_program_xref_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0001 | 523.38 |
| XREF-0002 | XREF-0002 | XREF-0001 | 5096.06 |
| XREF-0003 | XREF-0003 | XREF-0001 | 3292.30 |
| XREF-0004 | XREF-0004 | XREF-0001 | 4000.50 |
| XREF-0005 | XREF-0005 | XREF-0001 | 6997.28 |
| XREF-0006 | XREF-0006 | XREF-0001 | 6461.53 |
| XREF-0007 | XREF-0007 | XREF-0001 | 396.42 |
| XREF-0008 | XREF-0008 | XREF-0001 | 2149.89 |

**t_ebpfevent_via_program_xref_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0003 | 165 |
| XREF-0002 | XREF-0001 | XREF-0007 | 480 |
| XREF-0003 | XREF-0002 | XREF-0003 | 408 |
| XREF-0004 | XREF-0002 | XREF-0007 | 150 |
| XREF-0005 | XREF-0003 | XREF-0003 | 507 |
| XREF-0006 | XREF-0003 | XREF-0007 | 419 |
| XREF-0007 | XREF-0004 | XREF-0003 | 413 |
| XREF-0008 | XREF-0004 | XREF-0007 | 9 |

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

Consider the Yager fusion subsystem, where entities such as `COMB-0001` through `COMB-0004` represent combination records, each associated with a named component like `FusionGateway-Nine`, `FusionNode-Alpha`, or `ProvenanceEngine-Three`. These combinations are themselves related to other entities—`RadarPulse-Data`, `SpectralData-Set`, `VibrationSensor-Nine`—through a junction table that encodes not merely a link but a labelled association: the relationship carries a role, one of `observer`, `contributor`, or `owner`. The same combination `COMB-0006` appears as a subject in two distinct relationships, linked to targets `COMB-0004` and `COMB-0007`, each time under the role `contributor`, while `COMB-0001` serves as a subject linked to target `COMB-0003` under the role `owner`. The role column is the critical discriminator; without it, the subject-target pair would be an undirected edge, insufficient for provenance tracking or access control.

**t_yager_combination**

| id | yager |
| --- | --- |
| COMB-0001 | FusionGateway-Nine |
| COMB-0002 | FusionNode-Alpha |
| COMB-0003 | FusionGateway-Nine |
| COMB-0004 | ProvenanceEngine-Three |
| COMB-0005 | FusionNode-Alpha |
| COMB-0006 | TelemetryOrchestrator |

**t_yager_combination_yager_combines**

| id | yager_combines |
| --- | --- |
| COMB-0001 | RadarPulse-Data |
| COMB-0002 | SpectralData-Set |
| COMB-0003 | VibrationSensor-Nine |
| COMB-0004 | RadarPulse-Data |
| COMB-0005 | LidarScan-2023 |
| COMB-0006 | TelemetryStream-Alpha |
| COMB-0007 | AcousticArray-Alpha |

**t_yager_combination__yager_combines**

| id | yager_id | yager_combines_id | role |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0003 | COMB-0006 | observer |
| COMB-0002 | COMB-0006 | COMB-0004 | contributor |
| COMB-0003 | COMB-0006 | COMB-0007 | contributor |
| COMB-0004 | COMB-0001 | COMB-0003 | owner |
| COMB-0005 | COMB-0002 | COMB-0002 | reviewer |
| COMB-0006 | COMB-0006 | COMB-0005 | observer |
| COMB-0007 | COMB-0002 | COMB-0004 | contributor |
| COMB-0008 | COMB-0004 | COMB-0005 | observer |

The EBPFE event cross-reference layer applies the same attribute-value discipline to operational telemetry. An event such as `DATA_LAKE_SYNC_FAIL` or `TELEMETRY_HEARTBEAT` is first identified by a row in the cross-reference table, then enriched by a set of attribute definitions—`duration_seconds` typed as `xsd:decimal`, `end_time` as `xsd:dateTime`, `exit_code` as `xsd:integer`, `host_name` as `xsd:string`—each with its own identifier. Values are stored in four type-specific tables, each keyed by a surrogate identifier and linked to an entity and an attribute via foreign keys. The decimal value table records `duration_seconds` as `523.38`, `5096.06`, `3292.30`, and `4000.50` across four entities; the integer table captures `exit_code` values of `165`, `480`, `408`, and `150`; the datetime table stores timestamps such as `2024-04-10T05:27:34` and `2023-11-22T11:52:36`; and the varchar table holds host identifiers like `worker-07` alongside free-text fields such as `Log Level 02` and `review`. The entity column in each value table is the foreign key that binds the value to its owning event, while the attr column binds it to its semantic definition.

**t_ebpfevent_via_program_xref_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| XREF-0001 | XREF-0001 | XREF-0004 | worker-07 |
| XREF-0002 | XREF-0001 | XREF-0005 | Log Level 02 |
| XREF-0003 | XREF-0001 | XREF-0006 | review |
| XREF-0004 | XREF-0001 | XREF-0010 | failed |
| XREF-0005 | XREF-0001 | XREF-0011 | Triggered By 05 |
| XREF-0006 | XREF-0002 | XREF-0004 | ingest-21 |
| XREF-0007 | XREF-0002 | XREF-0005 | Log Level 07 |
| XREF-0008 | XREF-0002 | XREF-0006 | execution |

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

Column-level tagging in the `t_column_tag_subclass` layer mirrors this structure, demonstrating that the same attribute-value pattern scales across domains. A column such as `user_id` or `patient_id` is annotated with a tag that itself carries attributes—`confidence` of type `xsd:decimal`, `dimension_kind` of type `xsd:string`, `method` of type `xsd:string`, `recorded_at` of type `xsd:dateTime`. The decimal value table records confidence scores of `0.376` and `0.809` alongside higher-magnitude readings of `922.76` and `942.47`; the datetime table stores annotation timestamps ranging from `2023-08-03T19:45:29` to `2025-05-22T05:44:38`; and the varchar table captures classification labels such as `Dimension Kind 01`, `Encoding 02`, `intake form`, and `en`. The entity column in each value table points back to the tag row, and the attr column points to the attribute definition, preserving the same subject-attr-value linkage that governs the event cross-reference.

The practical consequence of this uniformity is that governance policies can be expressed once and applied across all entity types. A retention rule on `xsd:dateTime` attributes applies equally to event end-times and column annotation timestamps. An access control policy on attributes whose names contain `patient_id` or `sensor_reading` can be enforced regardless of whether the underlying entity is an EBPFE event or a column tag. The role column in relationship tables provides the same benefit for provenance: by distinguishing `observer` from `contributor` from `owner`, the system can answer not only which entities are connected but in what capacity, enabling audit trails that distinguish passive monitoring from active modification. The identifier column, present in every table, is the linchpin that makes this all composable—each foreign key references a single source of truth, and every value, attribute, and relationship can be traced back to it.