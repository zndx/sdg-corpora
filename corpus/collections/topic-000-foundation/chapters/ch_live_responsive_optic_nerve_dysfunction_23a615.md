---
chapter_id: ch_live_responsive_optic_nerve_dysfunction_23a615
topic_id: 0
family: 08_derived
cited_terms: ['responsive_optic_nerve_dysfunction', 'profiling_only_targets_datasets', 'primary_key_designation']
model: engine-refine
---

The integrity of any data governance framework rests on the disciplined separation of identifiers, entities, attributes, and values—a structural discipline that prevents conflation of what something is with what it is made of. Identifiers such as `DYSF-0001` through `DYSF-0004` serve as stable, immutable handles for clinical entities like optic nerve dysfunction cases, while `DATA-0001` through `DATA-0004` anchor profiling targets and `DESI-0001` through `DESI-0004` anchor primary key designations. Each identifier is scoped to its domain: a dysfunction record, a profiling dataset, or a key designation, and each is declared as a primary key through explicit designation records—for instance, `hardware_sn`, `lab_specimens`, `manufacturing_batches`, and `asset_inventory` are each mapped to their respective target tables, establishing a clear chain of referential authority.

**t_primary_key_designation**

| id | primary | primary_key_of |
| --- | --- | --- |
| DESI-0001 | hardware_sn | DATA-0005 |
| DESI-0002 | lab_specimens | DATA-0005 |
| DESI-0003 | manufacturing_batches | DATA-0006 |
| DESI-0004 | asset_inventory | DATA-0004 |
| DESI-0005 | network_traffic_db | DATA-0001 |
| DESI-0006 | manufacturing_batches | DATA-0005 |

Attributes and their types form the schema layer that gives meaning to raw values. In the profiling domain, attributes such as `duration_seconds`, `end_time`, `exit_code`, and `host_name` are each typed with XML Schema primitives: `xsd:decimal`, `xsd:dateTime`, `xsd:integer`, and `xsd:string` respectively. This typed attribute registry decouples structural definition from data storage, allowing the same attribute model to be reused across heterogeneous value stores. The primary key designation layer mirrors this pattern, declaring attributes like `confidence`, `dimension_kind`, `method`, and `recorded_at` with their own schema types, thereby ensuring that every attribute—whether it describes a profiling run or a key designation—carries its type semantics explicitly.

Values are materialized in a normalized, type-dispatched value store where each row binds an entity to an attribute through a foreign-keyed `entity_id` and `attr_id`, with the actual data residing in a `misc` column whose interpretation is governed by the attribute's declared type. For profiling targets, decimal values such as `30.48`, `6189.13`, `4326.04`, and `4636.52` are stored in a dedicated decimal value table, all referencing `attr_id` `DATA-0001` (the `duration_seconds` attribute). Datetime values like `2024-10-18T20:19:23`, `2025-02-03T06:32:48`, `2023-04-17T19:14:01`, and `2024-11-09T19:11:07` occupy their own value table, linked to attributes such as `DATA-0002` (`end_time`). Integer values including `255`, `337`, `67`, and `59` are stored against `attr_id` `DATA-0003` (`exit_code`), while varchar values—`gw-12`, `Log Level 02`, `closeout`, `failed`—are held in the string value table against `attr_id` `DATA-0004` (`host_name`). This type-partitioned value architecture ensures that each datum is stored in a column type that matches its semantic nature, eliminating the need for runtime type coercion.

The clinical domain of optic nerve dysfunction and Leber's optic atrophy illustrates how this same modeling discipline applies to medical data. The table `t_responsive_optic_nerve_dysfunction` holds four dysfunction records, each identified by a `DYSF-` prefixed identifier, and each carrying a `responsive` classification—`Focal Response` for three records and `Diffuse Response` for one—alongside a `optic_nerve_dysfunction` etiology such as `MT-ND6 Strain`, `Secondary Atrophy`, `Nutritional Deficit`, or `Hereditary Degeneration`. The `leber_optic_atrophy` column captures the corresponding atrophy phenotype, with values including `Hereditary Degeneration`, `Nutritional Deficit`, `Bilateral Atrophy`, and `Focal Atrophy`. These columns are not merely descriptive; they represent structured clinical observations that can be queried, joined, and traced back to their source identifiers with the same rigor applied to profiling metadata.

**t_responsive_optic_nerve_dysfunction**

| id | responsive | optic_nerve_dysfunction | leber_optic_atrophy |
| --- | --- | --- | --- |
| DYSF-0001 | Focal Response | MT-ND6 Strain | Hereditary Degeneration |
| DYSF-0002 | Focal Response | Secondary Atrophy | Nutritional Deficit |
| DYSF-0003 | Diffuse Response | Nutritional Deficit | Bilateral Atrophy |
| DYSF-0004 | Focal Response | Hereditary Degeneration | Focal Atrophy |
| DYSF-0005 | Bilateral Response | Primary Atrophy | Papilledema |
| DYSF-0006 | Left Optic Response | Hereditary Degeneration | MT-ND6 Strain |
| DYSF-0007 | Left Optic Response | Compressive Lesion | Ischemic Optic Neuropathy |

The foreign-key relationships that bind these tables together form a coherent referential graph. Entity identifiers in the profiling value tables (`entity_id` columns) reference back to records in `t_profiling_only_targets_datasets`, while attribute identifiers (`attr_id` columns) reference the attribute registry in `t_profiling_only_targets_datasets_attr`. Similarly, the primary key designation value tables link `entity_id` values like `DESI-0001` to their parent designation records and `attr_id` values like `DESI-0001` through `DESI-0010` to their attribute definitions. The designation table itself maps each identifier to its semantic role—`hardware_sn` is the primary key of `DATA-0005`, `lab_specimens` of `DATA-0006`, and so on—creating an auditable chain from abstract identifier to concrete table to typed attribute to stored value. This layered architecture, where identifiers, entities, attributes, and values are each managed in their own normalized layer, is what enables traceability, type safety, and schema evolution without data corruption.

**t_profiling_only_targets_datasets**

| id | profiling |
| --- | --- |
| DATA-0001 | null rate analysis |
| DATA-0002 | cardinality profiling |
| DATA-0003 | data lineage sweep |
| DATA-0004 | hash integrity check |
| DATA-0005 | null rate analysis |
| DATA-0006 | field distribution scan |

**t_profiling_only_targets_datasets_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DATA-0001 | duration_seconds | xsd:decimal |
| DATA-0002 | end_time | xsd:dateTime |
| DATA-0003 | exit_code | xsd:integer |
| DATA-0004 | host_name | xsd:string |
| DATA-0005 | log_level | xsd:string |
| DATA-0006 | phase | xsd:string |
| DATA-0007 | retry_count | xsd:integer |
| DATA-0008 | scheduled_at | xsd:dateTime |

**t_profiling_only_targets_datasets_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0002 | 2024-10-18T20:19:23 |
| DATA-0002 | DATA-0001 | DATA-0008 | 2025-02-03T06:32:48 |
| DATA-0003 | DATA-0001 | DATA-0009 | 2023-04-17T19:14:01 |
| DATA-0004 | DATA-0002 | DATA-0002 | 2024-11-09T19:11:07 |
| DATA-0005 | DATA-0002 | DATA-0008 | 2025-06-11T19:41:26 |
| DATA-0006 | DATA-0002 | DATA-0009 | 2023-12-25T21:51:31 |
| DATA-0007 | DATA-0003 | DATA-0002 | 2024-07-30T10:10:32 |
| DATA-0008 | DATA-0003 | DATA-0008 | 2025-03-13T05:29:50 |

**t_profiling_only_targets_datasets_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0001 | 30.48 |
| DATA-0002 | DATA-0002 | DATA-0001 | 6189.13 |
| DATA-0003 | DATA-0003 | DATA-0001 | 4326.04 |
| DATA-0004 | DATA-0004 | DATA-0001 | 4636.52 |
| DATA-0005 | DATA-0005 | DATA-0001 | 5515.53 |
| DATA-0006 | DATA-0006 | DATA-0001 | 6410.37 |

**t_profiling_only_targets_datasets_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0003 | 255 |
| DATA-0002 | DATA-0001 | DATA-0007 | 337 |
| DATA-0003 | DATA-0002 | DATA-0003 | 67 |
| DATA-0004 | DATA-0002 | DATA-0007 | 59 |
| DATA-0005 | DATA-0003 | DATA-0003 | 29 |
| DATA-0006 | DATA-0003 | DATA-0007 | 312 |
| DATA-0007 | DATA-0004 | DATA-0003 | 538 |
| DATA-0008 | DATA-0004 | DATA-0007 | 235 |

**t_profiling_only_targets_datasets_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DATA-0001 | DATA-0001 | DATA-0004 | gw-12 |
| DATA-0002 | DATA-0001 | DATA-0005 | Log Level 02 |
| DATA-0003 | DATA-0001 | DATA-0006 | closeout |
| DATA-0004 | DATA-0001 | DATA-0010 | failed |
| DATA-0005 | DATA-0001 | DATA-0011 | Triggered By 05 |
| DATA-0006 | DATA-0002 | DATA-0004 | node-b14 |
| DATA-0007 | DATA-0002 | DATA-0005 | Log Level 07 |
| DATA-0008 | DATA-0002 | DATA-0006 | closeout |

**t_primary_key_designation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DESI-0001 | confidence | xsd:decimal |
| DESI-0002 | dimension_kind | xsd:string |
| DESI-0003 | method | xsd:string |
| DESI-0004 | recorded_at | xsd:dateTime |
| DESI-0005 | uncertainty | xsd:decimal |
| DESI-0006 | unit | xsd:string |
| DESI-0007 | value | xsd:decimal |
| DESI-0008 | encoding | xsd:string |

**t_primary_key_designation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0004 | 2024-07-25T13:27:19 |
| DESI-0002 | DESI-0002 | DESI-0004 | 2024-03-16T21:31:41 |
| DESI-0003 | DESI-0003 | DESI-0004 | 2023-06-18T02:34:37 |
| DESI-0004 | DESI-0004 | DESI-0004 | 2023-02-27T13:30:12 |
| DESI-0005 | DESI-0005 | DESI-0004 | 2024-09-26T23:46:39 |
| DESI-0006 | DESI-0006 | DESI-0004 | 2024-08-10T21:30:38 |

**t_primary_key_designation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0001 | 0.354 |
| DESI-0002 | DESI-0001 | DESI-0005 | 612.82 |
| DESI-0003 | DESI-0001 | DESI-0007 | 317.84 |
| DESI-0004 | DESI-0002 | DESI-0001 | 0.186 |
| DESI-0005 | DESI-0002 | DESI-0005 | 917.05 |
| DESI-0006 | DESI-0002 | DESI-0007 | 468.15 |
| DESI-0007 | DESI-0003 | DESI-0001 | 0.339 |
| DESI-0008 | DESI-0003 | DESI-0005 | 505.24 |

**t_primary_key_designation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0002 | Dimension Kind 01 |
| DESI-0002 | DESI-0001 | DESI-0008 | Encoding 02 |
| DESI-0003 | DESI-0001 | DESI-0009 | audit excerpt |
| DESI-0004 | DESI-0001 | DESI-0010 | de |
| DESI-0005 | DESI-0001 | DESI-0003 | hybrid |
| DESI-0006 | DESI-0001 | DESI-0006 | mg/L |
| DESI-0007 | DESI-0002 | DESI-0002 | Dimension Kind 07 |
| DESI-0008 | DESI-0002 | DESI-0008 | Encoding 08 |