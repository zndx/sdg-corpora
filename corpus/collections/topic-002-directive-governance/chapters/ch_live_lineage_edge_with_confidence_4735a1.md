---
chapter_id: ch_live_lineage_edge_with_confidence_4735a1
topic_id: 2
family: 05_provo_lineage
cited_terms: ['lineage_edge_with_confidence', 'xdp_action_drop', 'policy_with_jurisdiction']
model: engine-refine
---

The attribute-value model structures heterogeneous metadata through a disciplined separation of entity identity, attribute definition, and value storage. Each entity—whether a drop action such as `wlan0_monitor` or a policy jurisdiction like the Financial Conduct Authority—is anchored by a stable identifier, for example `DROP-0001` or `JURI-0001`, which serves as the primary key across all related tables. Attributes are declared once in a schema table with a human-readable name and a formal type annotation: the `xsd:string` type governs character fields such as the checksum `1a4b6c2d`, while `xsd:date` constrains temporal values like `2025-02-22`, and more specialized types such as `cco:DesignativeICE` and `xsd:boolean` capture domain-specific semantics. This declarative layer ensures that every value, regardless of its physical storage location, conforms to a known schema before it enters the system.

**t_xdp_action_drop**

| id | xdp | x_d_p_action |
| --- | --- | --- |
| DROP-0001 | wlan0_monitor | JURI-0006 |
| DROP-0002 | veth1_filter | JURI-0004 |
| DROP-0003 | docker0_hook | JURI-0006 |
| DROP-0004 | nfqueue_bridge | JURI-0001 |
| DROP-0005 | eth0_ingress | JURI-0001 |
| DROP-0006 | wlan0_monitor | JURI-0002 |

**t_xdp_action_drop_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DROP-0001 | checksum | xsd:string |
| DROP-0002 | created_date | xsd:date |
| DROP-0003 | identifier | cco:DesignativeICE |
| DROP-0004 | license | xsd:string |
| DROP-0005 | mime_type | xsd:string |
| DROP-0006 | size_bytes | xsd:long |
| DROP-0007 | uri | xsd:string |
| DROP-0008 | version | xsd:integer |

**t_xdp_action_drop_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0002 | 2025-02-22 |
| DROP-0002 | DROP-0002 | DROP-0002 | 2023-10-04 |
| DROP-0003 | DROP-0003 | DROP-0002 | 2025-04-21 |
| DROP-0004 | DROP-0004 | DROP-0002 | 2023-05-09 |
| DROP-0005 | DROP-0005 | DROP-0002 | 2023-08-28 |
| DROP-0006 | DROP-0006 | DROP-0002 | 2023-05-04 |

**t_xdp_action_drop_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0006 | 265 |
| DROP-0002 | DROP-0001 | DROP-0008 | 7 |
| DROP-0003 | DROP-0002 | DROP-0006 | 394 |
| DROP-0004 | DROP-0002 | DROP-0008 | 7 |
| DROP-0005 | DROP-0003 | DROP-0006 | 114 |
| DROP-0006 | DROP-0003 | DROP-0008 | 8 |
| DROP-0007 | DROP-0004 | DROP-0006 | 460 |
| DROP-0008 | DROP-0004 | DROP-0008 | 9 |

**t_xdp_action_drop_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DROP-0001 | DROP-0001 | DROP-0001 | 1a4b6c2d |
| DROP-0002 | DROP-0001 | DROP-0003 | urn:uuid:9f2a |
| DROP-0003 | DROP-0001 | DROP-0004 | CC-BY-4.0 |
| DROP-0004 | DROP-0001 | DROP-0009 | us-east-1 |
| DROP-0005 | DROP-0001 | DROP-0005 | application/parquet |
| DROP-0006 | DROP-0001 | DROP-0010 | Name 06 |
| DROP-0007 | DROP-0001 | DROP-0011 | ml-infra |
| DROP-0008 | DROP-0001 | DROP-0012 | Tags 08 |

**t_policy_with_jurisdiction**

| id | policy | jurisdiction |
| --- | --- | --- |
| JURI-0001 | Financial Conduct Authority | DROP-0006 |
| JURI-0002 | European Union | DROP-0003 |
| JURI-0003 | European Union | DROP-0001 |
| JURI-0004 | FISMA | DROP-0002 |
| JURI-0005 | California Attorney General | DROP-0005 |
| JURI-0006 | Federal Trade Commission | DROP-0001 |

**t_policy_with_jurisdiction_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| JURI-0001 | effective_date | xsd:date |
| JURI-0002 | enforcement | xsd:string |
| JURI-0003 | mandatory | xsd:boolean |
| JURI-0004 | priority | xsd:integer |
| JURI-0005 | review_cycle_days | xsd:integer |
| JURI-0006 | scope | xsd:string |
| JURI-0007 | encoding | xsd:string |
| JURI-0008 | label_text | xsd:string |

**t_policy_with_jurisdiction_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0003 | false |
| JURI-0002 | JURI-0002 | JURI-0003 | false |
| JURI-0003 | JURI-0003 | JURI-0003 | true |
| JURI-0004 | JURI-0004 | JURI-0003 | false |
| JURI-0005 | JURI-0005 | JURI-0003 | false |
| JURI-0006 | JURI-0006 | JURI-0003 | true |

**t_policy_with_jurisdiction_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0001 | 2023-11-22 |
| JURI-0002 | JURI-0002 | JURI-0001 | 2024-05-18 |
| JURI-0003 | JURI-0003 | JURI-0001 | 2025-06-18 |
| JURI-0004 | JURI-0004 | JURI-0001 | 2023-05-18 |
| JURI-0005 | JURI-0005 | JURI-0001 | 2025-03-17 |
| JURI-0006 | JURI-0006 | JURI-0001 | 2024-10-08 |

**t_policy_with_jurisdiction_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0004 | 4 |
| JURI-0002 | JURI-0001 | JURI-0005 | 326 |
| JURI-0003 | JURI-0002 | JURI-0004 | 1 |
| JURI-0004 | JURI-0002 | JURI-0005 | 210 |
| JURI-0005 | JURI-0003 | JURI-0004 | 2 |
| JURI-0006 | JURI-0003 | JURI-0005 | 496 |
| JURI-0007 | JURI-0004 | JURI-0004 | 2 |
| JURI-0008 | JURI-0004 | JURI-0005 | 607 |

**t_policy_with_jurisdiction_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| JURI-0001 | JURI-0001 | JURI-0007 | Encoding 01 |
| JURI-0002 | JURI-0001 | JURI-0002 | Enforcement 02 |
| JURI-0003 | JURI-0001 | JURI-0008 | intake form |
| JURI-0004 | JURI-0001 | JURI-0009 | ja |
| JURI-0005 | JURI-0001 | JURI-0006 | Scope 05 |
| JURI-0006 | JURI-0002 | JURI-0007 | Encoding 06 |
| JURI-0007 | JURI-0002 | JURI-0002 | Enforcement 07 |
| JURI-0008 | JURI-0002 | JURI-0008 | change rationale |

Values are materialized in type-specific tables that reference both the owning entity and the attribute to which they belong, creating a three-way join between entity, attribute, and value. A single entity may carry multiple attributes of different types: `DROP-0001`, for instance, has a date value `2023-10-04` stored in the date table, an integer value `265` in the integer table, and a string value `1a4b6c2d` in the varchar table, each row independently keyed by its own identifier but unified through the shared `entity_id` and `attr_id` foreign keys. This denormalized value layer trades join complexity for query simplicity, allowing attribute retrieval to be resolved by type without conditional logic, while preserving referential integrity through the composite foreign-key constraints on `entity_id` and `attr_id`.

Temporal provenance is captured through the `recorded_at` column, which timestamps every lineage edge with an ISO 8601 instant—`2024-07-21T21:36:51` for the `ml_training_dataset_prep` edge, `2025-03-12T13:46:59` for a `data_lake_warehouse_sync` edge—enabling temporal queries that reconstruct the state of the data fabric at any point in time. The `unit` column, present on lineage edges, attaches a physical or dimensional qualifier to each measurement: `deg_C` for temperature, `mg/L` for concentration, `ratio` for dimensionless proportions, and `nm` for wavelength, ensuring that quantitative comparisons remain semantically valid. These two columns together form a lightweight provenance envelope that accompanies every recorded relationship, making it possible to audit not only what was recorded but when and in what terms.

Confidence scores on lineage edges—`partial_match`, `statistical_overlap`, and `95_percent`—quantify the degree of certainty associated with each data relationship, allowing downstream consumers to weight or filter edges according to their tolerance for uncertainty. The `95_percent` confidence appears on three of the four recorded edges, including both the `data_lake_warehouse_sync` entries and the edge linked to the FISMA policy jurisdiction, while the `partial_match` label on the `ml_training_dataset_prep` edge signals a lower-confidence association that may warrant manual review. This graduated confidence model, combined with the `recorded_at` timestamp, provides a complete audit trail: one can trace when a relationship was established, how certain it is, and what unit of measure applies, all within a single row.

**t_lineage_edge_with_confidence**

| id | lineage | confidence | recorded_at | unit |
| --- | --- | --- | --- | --- |
| CONF-0001 | ml_training_dataset_prep | partial_match | 2024-07-21T21:36:51 | deg_C |
| CONF-0002 | data_lake_warehouse_sync | statistical_overlap | 2025-03-12T13:46:59 | mg/L |
| CONF-0003 | data_lake_warehouse_sync | 95_percent | 2023-02-17T19:37:00 | ratio |
| CONF-0004 | data_lake_warehouse_sync | 95_percent | 2024-01-06T01:59:57 | nm |
| CONF-0005 | api_log_aggregation | partial_match | 2025-01-27T14:57:11 | deg_C |
| CONF-0006 | geospatial_raster_processing | high | 2023-11-04T09:37:36 | nm |

The jurisdictional policy table extends this pattern to governance metadata, where attributes such as `effective_date`, `enforcement`, `mandatory`, and `priority` are declared with types `xsd:date`, `xsd:string`, `xsd:boolean`, and `xsd:integer` respectively. Boolean values like `true` and `false` on the `mandatory` attribute distinguish binding obligations from advisory guidance, while integer priority values—`4` and `326` for one jurisdiction, `1` and `210` for another—encode relative importance across policy domains. String values such as `Encoding 01`, `Enforcement 02`, `intake form`, and `ja` (Japanese) populate the varchar value table, capturing free-form descriptors that resist stricter typing. The jurisdiction identifiers `DROP-0006`, `DROP-0003`, `DROP-0001`, and `DROP-0002` appear as foreign keys in both the policy table and the drop-action table, creating a cross-reference layer that ties operational actions to their governing policies and, by extension, to the confidence and provenance metadata recorded on the lineage edges that connect them.