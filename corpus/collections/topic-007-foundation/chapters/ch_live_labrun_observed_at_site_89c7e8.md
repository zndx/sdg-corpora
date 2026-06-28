---
chapter_id: ch_live_labrun_observed_at_site_89c7e8
topic_id: 7
family: 02_observation_measurement
cited_terms: ['labrun_observed_at_site', 'designative_subclass_basic', 'cardinality_max_one_generic']
model: engine-refine
---

The foundational layer of the data architecture relies on the `t_labrun_observed_at_site` table, where the `id` column serves as the primary **identifier** for discrete operational records. These **entities**, such as the laboratory run `PCR-ALPHA` or `RUN-2023-A4`, are intrinsically bound to their procedural contexts through the `labrun` column, while their physical provenance is captured in the `occurs_in` column, mapping instances to locations like `FIELD-STATION-9`, `CLEAN-ROOM-A`, or `SECURE-VAULT-3`. By anchoring these records with unique keys such as `SITE-0001` or `SITE-0002`, the system ensures that every experimental instance can be traced unambiguously across disparate facilities, decoupling the abstract identifier from the descriptive label to maintain rigorous data lineage.

**t_labrun_observed_at_site**

| id | labrun | occurs_in |
| --- | --- | --- |
| SITE-0001 | PCR-ALPHA | FIELD-STATION-9 |
| SITE-0002 | RUN-2023-A4 | CLEAN-ROOM-A |
| SITE-0003 | WET-LAB-44 | SECURE-VAULT-3 |
| SITE-0004 | PLATE-A12 | BUILDING-C |
| SITE-0005 | BATCH-8812 | LAB-WING-D |
| SITE-0006 | NEXTRA-GEN-03 | BENCH-12 |
| SITE-0007 | BATCH-8812 | CORE-FACILITY |

To capture the multidimensional nature of these entities, the schema employs a highly structured attribute model defined in the `t_labrun_observed_at_site_attr` table. Here, the `attr_name` column formally declares properties such as `duration_seconds`, `end_time`, `exit_code`, and `host_name`, while the `attr_type` column enforces strict data typing by assigning corresponding XML Schema Definition (XSD) types. For instance, temporal precision is guaranteed by binding `end_time` to `xsd:dateTime`, while quantitative measurements like `duration_seconds` are constrained to `xsd:decimal`. Similarly, operational metadata is rigorously categorized, with integer-based exit statuses mapped to `xsd:integer` and textual host identifiers bound to `xsd:string`, preventing semantic drift and allowing downstream systems to process heterogeneous data without ad-hoc parsing logic.

**t_labrun_observed_at_site_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SITE-0001 | duration_seconds | xsd:decimal |
| SITE-0002 | end_time | xsd:dateTime |
| SITE-0003 | exit_code | xsd:integer |
| SITE-0004 | host_name | xsd:string |
| SITE-0005 | log_level | xsd:string |
| SITE-0006 | phase | xsd:string |
| SITE-0007 | retry_count | xsd:integer |
| SITE-0008 | scheduled_at | xsd:dateTime |

**t_labrun_observed_at_site_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0002 | 2024-11-18T14:57:47 |
| SITE-0002 | SITE-0001 | SITE-0008 | 2025-06-11T00:43:59 |
| SITE-0003 | SITE-0001 | SITE-0009 | 2024-11-24T23:41:09 |
| SITE-0004 | SITE-0002 | SITE-0002 | 2024-09-03T12:28:15 |
| SITE-0005 | SITE-0002 | SITE-0008 | 2024-01-21T14:36:33 |
| SITE-0006 | SITE-0002 | SITE-0009 | 2024-08-02T20:19:39 |
| SITE-0007 | SITE-0003 | SITE-0002 | 2023-08-18T18:21:00 |
| SITE-0008 | SITE-0003 | SITE-0008 | 2023-03-15T08:25:39 |

**t_labrun_observed_at_site_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0001 | 3858.44 |
| SITE-0002 | SITE-0002 | SITE-0001 | 2622.63 |
| SITE-0003 | SITE-0003 | SITE-0001 | 5434.21 |
| SITE-0004 | SITE-0004 | SITE-0001 | 3308.67 |
| SITE-0005 | SITE-0005 | SITE-0001 | 138.03 |
| SITE-0006 | SITE-0006 | SITE-0001 | 5237.38 |
| SITE-0007 | SITE-0007 | SITE-0001 | 3257.93 |

**t_labrun_observed_at_site_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0003 | 263 |
| SITE-0002 | SITE-0001 | SITE-0007 | 199 |
| SITE-0003 | SITE-0002 | SITE-0003 | 302 |
| SITE-0004 | SITE-0002 | SITE-0007 | 29 |
| SITE-0005 | SITE-0003 | SITE-0003 | 93 |
| SITE-0006 | SITE-0003 | SITE-0007 | 209 |
| SITE-0007 | SITE-0004 | SITE-0003 | 703 |
| SITE-0008 | SITE-0004 | SITE-0007 | 313 |

The actual instantiation of these attributes is managed through a polymorphic value storage mechanism, where specific data types are segregated into dedicated value tables to optimize query performance. The `t_labrun_observed_at_site_val_decimal` table stores numeric measurements, linking an `entity_id` like `SITE-0001` to an `attr_id` and a precise `value` such as `3858.44`. Temporal data is similarly isolated in the `t_labrun_observed_at_site_val_datetime` table, where the same entity might hold a timestamp of `2024-11-18T14:57:47`. Integer exit codes, such as `263` or `199`, are persisted in the `t_labrun_observed_at_site_val_int` table, while variable character strings like `ingest-21` or `Log Level 02` are stored in the `t_labrun_observed_at_site_val_varchar` table. This relational separation allows the system to scale independently for each data modality, maintaining a clear lineage back to the parent entity through explicit foreign key references.

**t_labrun_observed_at_site_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0004 | ingest-21 |
| SITE-0002 | SITE-0001 | SITE-0005 | Log Level 02 |
| SITE-0003 | SITE-0001 | SITE-0006 | closeout |
| SITE-0004 | SITE-0001 | SITE-0010 | failed |
| SITE-0005 | SITE-0001 | SITE-0011 | Triggered By 05 |
| SITE-0006 | SITE-0002 | SITE-0004 | gw-12 |
| SITE-0007 | SITE-0002 | SITE-0005 | Log Level 07 |
| SITE-0008 | SITE-0002 | SITE-0006 | initiation |

Beyond the core operational attributes, the framework incorporates a rich layer of designative and cardinality metadata to govern relationships and localization. The `t_designative_subclass_basic` table introduces a **language** dimension, allowing designatives such as `event_tag_crash` or `plate_A04` to be associated with specific linguistic locales like `fr` or `es`, alongside standardized codes such as `D-33` or `B-12`. This multilingual capability ensures that operational tags remain interpretable across international teams. Concurrently, the `t_cardinality_max_one_generic` table enforces the structural integrity of the graph by dictating permissible relationships between entities. Rules such as `mandatory_one` or `strict_unique` govern how an entity relates to external registries, ensuring that critical dependencies—such as linking `device_metrics` to an `asset_registry` or referencing `audit_logs`—are resolved deterministically, thereby maintaining a consistent and auditable data topology.

**t_designative_subclass_basic**

| id | designative | code | language |
| --- | --- | --- | --- |
| DESI-0001 | event_tag_crash | D-33 | fr |
| DESI-0002 | plate_A04 | B-12 | es |
| DESI-0003 | barcode_8842X | E-21 | fr |
| DESI-0004 | event_tag_crash | D-33 | es |
| DESI-0005 | reagent_Lot_B22 | B-12 | es |
| DESI-0006 | registry_ISO9001 | C-07 | fr |
| DESI-0007 | event_tag_crash | A-01 | es |

**t_cardinality_max_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | mandatory_one | device_metrics |
| GENE-0002 | strict_unique | asset_registry |
| GENE-0003 | singular_ref | audit_logs |
| GENE-0004 | first_match | config_params |