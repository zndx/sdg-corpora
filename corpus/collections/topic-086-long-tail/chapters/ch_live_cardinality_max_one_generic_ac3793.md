---
chapter_id: ch_live_cardinality_max_one_generic_ac3793
topic_id: 86
family: 01_foundation
cited_terms: ['cardinality_max_one_generic', 'state_observed_at_time', 'outlier_detection_produces_claim']
model: engine-refine
---

The identification of discrete entities within an observability framework rests upon a uniform identifier scheme that anchors every record to a stable, machine-readable key. In the cardinality registry, identifiers such as GENE-0001 through GENE-0004 establish the referential backbone for constraints governing how entities relate to one another—whether through mandatory_one associations to device_metrics, strict_unique bindings to asset_registry, singular_ref links to audit_logs, or first_match resolutions against config_params. The same identifier discipline carries into temporal observations, where keys like TIME-0001 and TIME-0002 tag state snapshots captured at precise instants, for example the offline state recorded at 2024-03-16T07:00:05Z or the calibrated state observed at 2024-03-17T09:33:40Z. This dual use of identifiers—both as cardinality anchors and as temporal observation keys—ensures that every attribute value, regardless of its data type, can be traced back to a single point in the entity-state lattice.

**t_cardinality_max_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | mandatory_one | device_metrics |
| GENE-0002 | strict_unique | asset_registry |
| GENE-0003 | singular_ref | audit_logs |
| GENE-0004 | first_match | config_params |

**t_state_observed_at_time**

| id | state | observed_at |
| --- | --- | --- |
| TIME-0001 | offline | 2024-03-16T07:00:05Z |
| TIME-0002 | calibrated | 2024-03-17T09:33:40Z |
| TIME-0003 | idle | 2024-03-18T08:05:19Z |
| TIME-0004 | calibrated | 2024-03-16T11:22:30Z |
| TIME-0005 | idle | 2024-03-17T13:50:02Z |
| TIME-0006 | draining | 2024-03-15T10:45:11Z |
| TIME-0007 | idle | 2024-03-16T07:00:05Z |
| TIME-0008 | locked | 2024-03-15T08:30:00Z |

**t_state_observed_at_time_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIME-0001 | confidence | xsd:decimal |
| TIME-0002 | dimension_kind | xsd:string |
| TIME-0003 | method | xsd:string |
| TIME-0004 | recorded_at | xsd:dateTime |
| TIME-0005 | uncertainty | xsd:decimal |
| TIME-0006 | unit | xsd:string |
| TIME-0007 | value | xsd:decimal |
| TIME-0008 | encoding | xsd:string |

**t_state_observed_at_time_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0004 | 2023-08-28T00:49:09 |
| TIME-0002 | TIME-0002 | TIME-0004 | 2023-01-12T06:19:16 |
| TIME-0003 | TIME-0003 | TIME-0004 | 2023-12-07T18:51:38 |
| TIME-0004 | TIME-0004 | TIME-0004 | 2024-05-06T22:48:11 |
| TIME-0005 | TIME-0005 | TIME-0004 | 2023-11-07T19:04:18 |
| TIME-0006 | TIME-0006 | TIME-0004 | 2024-03-08T08:57:30 |
| TIME-0007 | TIME-0007 | TIME-0004 | 2023-04-13T11:54:48 |
| TIME-0008 | TIME-0008 | TIME-0004 | 2024-08-24T14:36:17 |

**t_state_observed_at_time_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0001 | 0.673 |
| TIME-0002 | TIME-0001 | TIME-0005 | 138.13 |
| TIME-0003 | TIME-0001 | TIME-0007 | 126.00 |
| TIME-0004 | TIME-0002 | TIME-0001 | 0.137 |
| TIME-0005 | TIME-0002 | TIME-0005 | 428.04 |
| TIME-0006 | TIME-0002 | TIME-0007 | 24.81 |
| TIME-0007 | TIME-0003 | TIME-0001 | 0.753 |
| TIME-0008 | TIME-0003 | TIME-0005 | 875.90 |

**t_state_observed_at_time_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0001 | TIME-0002 | Dimension Kind 01 |
| TIME-0002 | TIME-0001 | TIME-0008 | Encoding 02 |
| TIME-0003 | TIME-0001 | TIME-0009 | nightly summary |
| TIME-0004 | TIME-0001 | TIME-0010 | fr |
| TIME-0005 | TIME-0001 | TIME-0003 | automated |
| TIME-0006 | TIME-0001 | TIME-0006 | ms |
| TIME-0007 | TIME-0002 | TIME-0002 | Dimension Kind 07 |
| TIME-0008 | TIME-0002 | TIME-0008 | Encoding 08 |

Attribute metadata and their associated types form the structural vocabulary through which entity states are described. The attribute catalog assigns human-readable names such as confidence, dimension_kind, method, and recorded_at to abstract properties, while simultaneously declaring their semantic types using the XSD namespace: xsd:decimal for numeric precision, xsd:string for categorical labels, and xsd:dateTime for temporal markers. This type discipline is not merely declarative; it governs the physical storage layout across three distinct value tables, each specialized for a single type family. Decimal values—0.673, 138.13, 126.00, 0.137—are persisted in the decimal value store, string values—Dimension Kind 01, Encoding 02, nightly summary, fr—in the varchar store, and datetime values—2023-08-28T00:49:09, 2023-01-12T06:19:16, 2023-12-07T18:51:38, 2024-05-06T22:48:11—in the datetime store. The entity_id column in each value table serves as the foreign key back to the state observation, while attr_id resolves to the attribute definition, creating a normalized star schema where type-specific values are materialized without sacrificing referential integrity.

The produces dimension introduces a categorical taxonomy that classifies outputs generated by system processes. Each produce entry carries a human-readable label—Produces Label 01 through Produces Label 04—and is associated with a named category such as Produces Category 01 or Produces Category 02, which in turn references a category identifier like CLAI-0004 or CLAI-0002. The category dimension table provides the canonical list of category names—Category Name 01 through Category Name 04—serving as the lookup source for the category_id foreign key in the produces table. This two-level classification scheme enables both granular labeling at the produce level and aggregated analysis at the category level, a pattern that supports reporting hierarchies where individual outputs can be rolled up into broader thematic groupings.

**dim_produces_category**

| id | category_name |
| --- | --- |
| CLAI-0001 | Category Name 01 |
| CLAI-0002 | Category Name 02 |
| CLAI-0003 | Category Name 03 |
| CLAI-0004 | Category Name 04 |
| CLAI-0005 | Category Name 05 |
| CLAI-0006 | Category Name 06 |

**dim_produces**

| id | produces_label | produces_category | category_id |
| --- | --- | --- | --- |
| CLAI-0001 | Produces Label 01 | Produces Category 01 | CLAI-0004 |
| CLAI-0002 | Produces Label 02 | Produces Category 02 | CLAI-0002 |
| CLAI-0003 | Produces Label 03 | Produces Category 03 | CLAI-0006 |
| CLAI-0004 | Produces Label 04 | Produces Category 04 | CLAI-0002 |
| CLAI-0005 | Produces Label 05 | Produces Category 05 | CLAI-0005 |
| CLAI-0006 | Produces Label 06 | Produces Category 06 | CLAI-0001 |

Process execution metrics are captured in the outlier fact table, which records the operational characteristics of completed jobs or pipeline stages. Each fact row is keyed by an identifier such as CLAI-0001 and linked to a produces_key—CLAI-0004, CLAI-0006, CLAI-0001—that identifies the output artifact or downstream consumer. The duration_seconds column quantifies execution time with sub-second precision, ranging from 1182.39 seconds for the shortest observed run to 6466.78 seconds for the longest, while the exit_code column records the termination status—values of 760, 4, 490, and 124 indicate diverse exit conditions spanning normal completion, signal-based termination, and application-specific error codes. The retry_count column, with values of 293, 225, 101, and 308, captures the number of re-attempts before final resolution, providing a direct signal of operational instability that can be correlated with duration and exit behavior to identify systemic reliability patterns.

**fact_outlier**

| id | produces_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0004 | 3360.34 | 760 | 293 |
| CLAI-0002 | CLAI-0006 | 6466.78 | 4 | 225 |
| CLAI-0003 | CLAI-0001 | 5282.09 | 490 | 101 |
| CLAI-0004 | CLAI-0001 | 1182.39 | 124 | 308 |
| CLAI-0005 | CLAI-0002 | 3041.72 | 808 | 59 |
| CLAI-0006 | CLAI-0001 | 3852.38 | 619 | 489 |
| CLAI-0007 | CLAI-0004 | 1453.07 | 682 | 1 |

The misc column, appearing as the value store across the three type-specific tables, functions as the catch-all container for attribute values that do not fit into the primary typed columns. In the datetime store, misc holds the actual timestamp values; in the decimal store, it holds the numeric measurements; and in the varchar store, it holds the textual descriptors. This design choice reflects a pragmatic normalization strategy: rather than attempting to force heterogeneous values into a single typed column, the schema distributes values by type while preserving a uniform column name—misc—across all three stores. This uniformity simplifies query patterns that operate across types, as the application layer can resolve the appropriate value table through the attr_type metadata and then read from the misc column without needing to reason about per-type column names. The result is a schema that balances type safety at the metadata level with flexibility at the storage level, enabling the system to accommodate new attribute types without schema migration.