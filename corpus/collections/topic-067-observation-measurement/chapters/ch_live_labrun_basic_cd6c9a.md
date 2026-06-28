---
chapter_id: ch_live_labrun_basic_cd6c9a
topic_id: 67
family: 02_observation_measurement
cited_terms: ['labrun_basic', 'designative_for_specific_role', 'ebpfprogram_min_one_hook']
model: engine-refine
---

Laboratory execution records and instrumented runtime artifacts share a common requirement: every observable fact must be addressable, typed, and traceable across systems that were not designed together. An identifier furnishes that address—a stable, surrogate key that survives renaming, redeployment, and schema evolution. In operational telemetry, LABR-0001 denotes a concrete lab run irrespective of whether downstream consumers know it as Microplate_Scan_9A; likewise HOOK-0006 and ROLE-0003 persist as join keys when human-readable labels change. Governance treats identifiers as immutable once issued: they anchor audit trails, cross-reference regulatory submissions, and permit idempotent reconciliation when duplicate ingest events arrive from edge collectors or LIMS exports.

**t_labrun_basic**

| id | labrun |
| --- | --- |
| LABR-0001 | Microplate_Scan_9A |
| LABR-0002 | MassSpec_Triplicate |
| LABR-0003 | ELISA_Screen_4B |
| LABR-0004 | PCR_Amplification |
| LABR-0005 | FlowCytometry_Sweep |
| LABR-0006 | WesternBlot_22 |
| LABR-0007 | WesternBlot_22 |
| LABR-0008 | FlowCytometry_Sweep |

The entity is the thing being described; the attr is the dimension along which it is described; and attr type is the contract that governs interpretation. A single lab run may accumulate duration_seconds as xsd:decimal (1438.98 on LABR-0001), end_time as xsd:dateTime (2025-01-01T00:58:28), exit_code as xsd:integer (918), and host_name as xsd:string (edge-03)—each attr_id bound to an attr_name and attr_type in the attribute registry before any value is accepted. Separating declaration from storage enforces type safety at scale: datetime values never share a column with decimals, validation rules attach to attr_type rather than to ad hoc string parsing, and breaking changes surface as explicit attr_type migrations rather than silent coercion. Compliance reviews therefore examine the attribute catalogue first, because miscategorized attrs undermine every downstream control that depends on numeric thresholds, temporal ordering, or lexical normalization.

**t_labrun_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0002 | 2025-01-01T00:58:28 |
| LABR-0002 | LABR-0001 | LABR-0008 | 2023-02-28T02:17:46 |
| LABR-0003 | LABR-0001 | LABR-0009 | 2024-11-14T14:13:50 |
| LABR-0004 | LABR-0002 | LABR-0002 | 2025-05-09T16:03:58 |
| LABR-0005 | LABR-0002 | LABR-0008 | 2023-08-07T03:38:58 |
| LABR-0006 | LABR-0002 | LABR-0009 | 2023-11-05T10:47:29 |
| LABR-0007 | LABR-0003 | LABR-0002 | 2024-07-22T03:34:20 |
| LABR-0008 | LABR-0003 | LABR-0008 | 2023-11-18T18:40:00 |

**t_labrun_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0001 | 1438.98 |
| LABR-0002 | LABR-0002 | LABR-0001 | 6523.97 |
| LABR-0003 | LABR-0003 | LABR-0001 | 7176.32 |
| LABR-0004 | LABR-0004 | LABR-0001 | 6375.34 |
| LABR-0005 | LABR-0005 | LABR-0001 | 876.07 |
| LABR-0006 | LABR-0006 | LABR-0001 | 5075.37 |
| LABR-0007 | LABR-0007 | LABR-0001 | 485.96 |
| LABR-0008 | LABR-0008 | LABR-0001 | 1443.01 |

The misc designation marks payload fields that resist rigid typing in the dimension layer yet remain indispensable for operations and evidence. Host names, execution phases, completion markers, designative codes (D-33, B-12), and categorical labels all land in misc columns because their semantics are contextual: "complete" on LABR-0001 signals run terminus, while "execution" classifies process phase, and code E-21 identifies CoreSample-X22 relative to Data-Lake-Partition under ROLE-0003. Encoding governs how such misc values are serialized and compared: ascii for Batch-Alpha-99 and Sensor-Array-Beta, unicode for Unit-Shift-Log and CoreSample-X22, with mismatched encoding producing false negatives in deduplication and integrity checks. Category supplies the taxonomic frame—Attaches To Hook Category 01 through 04 partitions hook endpoints so policy rules, retention schedules, and access controls apply uniformly to HOOK-0001–HOOK-0004 without re-deriving class from free text each time a new program registers.

Attaches to hook models the binding between deployable instrumentation and the kernel- or runtime-level interception point it extends. fact_ebpfprogram rows record that binding through attaches_to_hook_key: HOOK-0006 hosts two programs at 784335640 and 641704069 bytes (versions 12 and 9), while HOOK-0001 and HOOK-0002 each carry a single attachment at 113209263 bytes (version 11) and 161013093 bytes (version 12) respectively. size_bytes and version jointly define the artifact fingerprint governance must track—byte length detects truncated downloads and supply-chain substitution, version numbers gate compatibility with hook ABI expectations and signed-policy bundles. A program that reports version 12 against a hook dimensioned as Attaches To Hook Category 02 must satisfy both the categorical control set for that hook class and the versioned attestation chain tied to the recorded byte count; drift in any leg triggers quarantine before the hook accepts execution.

**fact_ebpfprogram**

| id | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0006 | 167519051 | 1 |

In practice these constructs interlock across the evidence chain from bench to edge. LABR-0002 (MassSpec_Triplicate) carries duration_seconds 6523.97 and end_time 2025-05-09T16:03:58, with exit_code 674 and host-level integers 57 and 220 on shared attr_ids—demonstrating how one entity_id fans out across typed value stores while remaining joinable through identifier and attr foreign keys. Parallel role designatives (Calibration-Standard-ISO, Network-Edge-Router) show how encoding and misc codes bridge organizational naming to machine joins. Hook attachments close the loop: instrumentation provenance (version, size_bytes, attaches_to_hook_key) must align with entity-scoped run metadata (attr, attr_type, entity) so investigators can answer, without ambiguity, which program observed which run on which host under which category at which time. That alignment—not the mere presence of columns—is what satisfies traceability obligations: identifiers persist, types constrain meaning, categories and encodings standardize comparison, and hook attachment plus artifact metrics certify that the observing layer itself was the one approved for the operational context recorded.

**t_labrun_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LABR-0001 | duration_seconds | xsd:decimal |
| LABR-0002 | end_time | xsd:dateTime |
| LABR-0003 | exit_code | xsd:integer |
| LABR-0004 | host_name | xsd:string |
| LABR-0005 | log_level | xsd:string |
| LABR-0006 | phase | xsd:string |
| LABR-0007 | retry_count | xsd:integer |
| LABR-0008 | scheduled_at | xsd:dateTime |

**t_labrun_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0003 | 918 |
| LABR-0002 | LABR-0001 | LABR-0007 | 57 |
| LABR-0003 | LABR-0002 | LABR-0003 | 674 |
| LABR-0004 | LABR-0002 | LABR-0007 | 220 |
| LABR-0005 | LABR-0003 | LABR-0003 | 637 |
| LABR-0006 | LABR-0003 | LABR-0007 | 406 |
| LABR-0007 | LABR-0004 | LABR-0003 | 597 |
| LABR-0008 | LABR-0004 | LABR-0007 | 367 |

**t_labrun_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LABR-0001 | LABR-0001 | LABR-0004 | edge-03 |
| LABR-0002 | LABR-0001 | LABR-0005 | Log Level 02 |
| LABR-0003 | LABR-0001 | LABR-0006 | execution |
| LABR-0004 | LABR-0001 | LABR-0010 | complete |
| LABR-0005 | LABR-0001 | LABR-0011 | Triggered By 05 |
| LABR-0006 | LABR-0002 | LABR-0004 | ingest-21 |
| LABR-0007 | LABR-0002 | LABR-0005 | Log Level 07 |
| LABR-0008 | LABR-0002 | LABR-0006 | initiation |

**t_designative_for_specific_role**

| id | designative | identifies | code | encoding |
| --- | --- | --- | --- | --- |
| ROLE-0001 | Sensor-Array-Beta | Calibration-Standard-ISO | D-33 | ascii |
| ROLE-0002 | Unit-Shift-Log | Network-Edge-Router | B-12 | unicode |
| ROLE-0003 | CoreSample-X22 | Data-Lake-Partition | E-21 | unicode |
| ROLE-0004 | Batch-Alpha-99 | Quality-Control-Log | A-01 | ascii |
| ROLE-0005 | CoreSample-X22 | Bioreactor-Module-B | D-33 | latin1 |
| ROLE-0006 | LIDAR-Array-7 | Data-Lake-Partition | C-07 | ascii |
| ROLE-0007 | LIDAR-Array-7 | Quality-Control-Log | D-33 | ascii |
| ROLE-0008 | LIDAR-Array-7 | Geolocation-Map-Grid | A-01 | latin1 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |