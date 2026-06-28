---
chapter_id: ch_live_program_with_entry_exactly_one_c020b8
topic_id: 181
family: 01_foundation
cited_terms: ['program_with_entry_exactly_one', 'ebpfmap_subclass', 'attestation_basic']
model: engine-refine
---

Attributes constitute the fundamental schema layer governing how attestation records carry structured metadata, with each attribute declared through a name and an associated type drawn from the XSD vocabulary—`xsd:decimal` for numeric measures such as `7132.97` and `6429.54`, `xsd:dateTime` for temporal markers like `2024-11-18T12:26:52` and `2023-12-15T15:31:35`, `xsd:integer` for discrete counts including `898` and `71`, and `xsd:string` for free-form labels such as `ingest-21`, `Log Level 02`, and `superseded`. This type discipline is enforced through a normalized attribute registry that decouples the definition of an attribute from its runtime values, allowing a single attribute identifier to reference multiple typed value tables without schema drift. The separation ensures that temporal, numeric, and textual data each reside in their appropriate storage domain while remaining addressable through a common entity reference.

**t_attestation_basic**

| id | attestation |
| --- | --- |
| ATTE-0001 | Vendor risk assessment |
| ATTE-0002 | HIPAA compliance review |
| ATTE-0003 | ML model fairness audit |
| ATTE-0004 | HIPAA compliance review |
| ATTE-0005 | SOC 2 Type II audit |
| ATTE-0006 | Vendor risk assessment |

**t_attestation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2024-11-18T12:26:52 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2023-12-15T15:31:35 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2023-03-05T20:41:52 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2023-09-08T13:00:56 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-07-29T18:29:50 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2024-08-01T11:14:05 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2023-01-08T06:41:42 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2025-06-10T02:28:19 |

**t_attestation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 7132.97 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 6429.54 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 3894.03 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 6507.32 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5722.64 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 4627.41 |

**t_attestation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 898 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 487 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 71 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 180 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 107 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 326 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 620 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 392 |

**t_attestation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | ingest-21 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | initiation |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | gw-12 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | execution |

Entities serve as the primary linkage point between attestation definitions and their concrete attribute values, with each entity identified by a stable identifier such as `ATTE-0001` or `ATTE-0002` and associated with a descriptive attestation label—`Vendor risk assessment`, `HIPAA compliance review`, or `ML model fairness audit`. The entity identifier functions as a foreign key into the typed value tables, where the `entity_id` column anchors each value row to its parent attestation record. A single entity may carry multiple attributes across different type domains; for instance, entity `ATTE-0001` simultaneously holds a decimal value of `7132.97`, an integer value of `898`, a datetime value of `2024-11-18T12:26:52`, and string values including `ingest-21` and `initiation`, all traceable to the same attestation through the entity identifier.

Checksums provide an integrity verification mechanism for eBPF map subclass records, where each map entry carries a computed hash such as `9d2b7a16`, `1a4b6c2d`, `a3f9c21e`, or `7b14de08` that can be validated against the stored map definition. These checksums are associated with maps like `sock_ops_map`, `xdp_stats_map`, and `conntrack_hash`, each classified under a specific map type—`lpm_trie`, `devmap`, `perf_event_array`, or `hash_map`—and stored at a location identified by a URI. The URI scheme encodes the storage domain and access protocol, with values such as `abfss://prod/silver` for Azure Blob Storage in the silver layer, `s3://lake/raw` for S3 raw storage, and `gs://warehouse/gold` for Google Cloud Storage in the gold tier, enabling deterministic retrieval of the underlying map artifact for checksum validation.

**t_ebpfmap_subclass**

| id | ebpfmap | map_type | checksum | uri |
| --- | --- | --- | --- | --- |
| EBPF-0001 | sock_ops_map | lpm_trie | 9d2b7a16 | abfss://prod/silver |
| EBPF-0002 | xdp_stats_map | devmap | 1a4b6c2d | abfss://prod/silver |
| EBPF-0003 | conntrack_hash | perf_event_array | a3f9c21e | s3://lake/raw |
| EBPF-0004 | conntrack_hash | hash_map | 7b14de08 | gs://warehouse/gold |
| EBPF-0005 | perf_event_map | stack_trace | 9d2b7a16 | hdfs://cluster/staging |
| EBPF-0006 | stack_trace_map | ringbuf | 1a4b6c2d | hdfs://cluster/staging |
| EBPF-0007 | dev_map_eth | hash_map | 5e8f3c91 | hdfs://cluster/staging |
| EBPF-0008 | xdp_stats_map | stack_trace | c0ffee42 | abfss://prod/silver |

Programs with entry points establish a mapping between operational processes and their associated attestation entry points, with each program identified by a unique program identifier such as `ONE-0001` through `ONE-0004` and named according to its function—`inventory_sync`, `nightly_etl`, or `health_check`. Each program references an entry point via the attestation identifier (e.g., `ATTE-0003`, `ATTE-0006`, `ATTE-0001`) and carries a resource identifier in ARN format such as `ARN:res/41` or a reference code like `ref-8842`, alongside a version number that tracks the program's evolution. The version field, holding values such as `12`, `3`, `8`, and `11`, enables change management and rollback procedures by anchoring each program configuration to a specific point in its lifecycle.

**t_program_with_entry_exactly_one**

| id | program | entry_point | identifier | version |
| --- | --- | --- | --- | --- |
| ONE-0001 | inventory_sync | ATTE-0003 | ARN:res/41 | 12 |
| ONE-0002 | inventory_sync | ATTE-0006 | ARN:res/41 | 3 |
| ONE-0003 | nightly_etl | ATTE-0006 | ARN:res/41 | 8 |
| ONE-0004 | health_check | ATTE-0001 | ref-8842 | 11 |
| ONE-0005 | health_check | ATTE-0002 | doi:10.1109/x | 9 |
| ONE-0006 | nightly_etl | ATTE-0001 | urn:uuid:9f2a | 7 |
| ONE-0007 | health_check | ATTE-0003 | urn:uuid:9f2a | 1 |

The interplay between these tables forms a coherent governance fabric: attestation records define the compliance or audit context, their typed attributes capture structured evidence, eBPF map records with checksums and URIs provide low-level system state verification, and program entries with versioned identifiers orchestrate the execution flow. The entity identifier acts as the central join key across the attestation value tables, while the entry point identifier bridges program execution to specific attestation records, creating a traceable chain from high-level program invocation through to the granular attribute values that constitute the compliance evidence.