---
chapter_id: ch_live_artifact_either_active_or_archived_1952d2
topic_id: 79
family: 07_long_tail
cited_terms: ['artifact_either_active_or_archived', 'ebpfprogram_min_one_hook', 'column_lineage_for_compliance_claim']
model: engine-refine
---

The governance of software artifacts and their associated metadata rests upon a disciplined separation between identity, definition, and instantiation. Each artifact—whether identified as sensor-telemetry-v4, config-repo-main, data-catalog-index, or event-stream-kafka—receives a persistent identifier such as ARCH-0001 through ARCH-0004, anchoring it within the registry. Attributes are declared independently of any single artifact instance: the attribute named checksum carries type xsd:string, created_date is typed xsd:date, identifier resolves to cco:DesignativeICE, and license is xsd:string. These type declarations constrain the domain of permissible values and enable automated validation at ingestion time. The attribute definitions themselves are keyed by their own identifiers, which are then referenced from the valuation tables where actual values materialize against specific entities.

**t_artifact_either_active_or_archived**

| id | artifact | artifact_2 | artifact_3 |
| --- | --- | --- | --- |
| ARCH-0001 | sensor-telemetry-v4 | output-sink-delta | test-dataset |
| ARCH-0002 | config-repo-main | schema-registry | deployment-target |
| ARCH-0003 | data-catalog-index | upstream-source-beta | test-dataset |
| ARCH-0004 | event-stream-kafka | checksum-validator | compliance-tier |
| ARCH-0005 | config-repo-main | checksum-validator | production-cluster |
| ARCH-0006 | ml-feature-store | validation-module | test-dataset |
| ARCH-0007 | sensor-telemetry-v4 | validation-module | deployment-target |
| ARCH-0008 | batch-ingest-queue | validation-module | dev-sandbox |

**t_artifact_either_active_or_archived_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARCH-0001 | checksum | xsd:string |
| ARCH-0002 | created_date | xsd:date |
| ARCH-0003 | identifier | cco:DesignativeICE |
| ARCH-0004 | license | xsd:string |
| ARCH-0005 | mime_type | xsd:string |
| ARCH-0006 | size_bytes | xsd:long |
| ARCH-0007 | uri | xsd:string |
| ARCH-0008 | version | xsd:integer |

**t_artifact_either_active_or_archived_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0002 | 2024-02-12 |
| ARCH-0002 | ARCH-0002 | ARCH-0002 | 2023-06-04 |
| ARCH-0003 | ARCH-0003 | ARCH-0002 | 2025-05-16 |
| ARCH-0004 | ARCH-0004 | ARCH-0002 | 2024-07-03 |
| ARCH-0005 | ARCH-0005 | ARCH-0002 | 2024-07-21 |
| ARCH-0006 | ARCH-0006 | ARCH-0002 | 2024-03-16 |
| ARCH-0007 | ARCH-0007 | ARCH-0002 | 2025-02-16 |
| ARCH-0008 | ARCH-0008 | ARCH-0002 | 2024-07-02 |

**t_artifact_either_active_or_archived_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0006 | 356 |
| ARCH-0002 | ARCH-0001 | ARCH-0008 | 2 |
| ARCH-0003 | ARCH-0002 | ARCH-0006 | 77 |
| ARCH-0004 | ARCH-0002 | ARCH-0008 | 4 |
| ARCH-0005 | ARCH-0003 | ARCH-0006 | 218 |
| ARCH-0006 | ARCH-0003 | ARCH-0008 | 10 |
| ARCH-0007 | ARCH-0004 | ARCH-0006 | 431 |
| ARCH-0008 | ARCH-0004 | ARCH-0008 | 2 |

**t_artifact_either_active_or_archived_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0001 | 7b14de08 |
| ARCH-0002 | ARCH-0001 | ARCH-0003 | ref-8842 |
| ARCH-0003 | ARCH-0001 | ARCH-0004 | BSD-3-Clause |
| ARCH-0004 | ARCH-0001 | ARCH-0009 | ap-south-2 |
| ARCH-0005 | ARCH-0001 | ARCH-0005 | text/csv |
| ARCH-0006 | ARCH-0001 | ARCH-0010 | Name 06 |
| ARCH-0007 | ARCH-0001 | ARCH-0011 | analytics |
| ARCH-0008 | ARCH-0001 | ARCH-0012 | Tags 08 |

The valuation layer materializes attribute values across three type-specialized tables, each governing a distinct data domain. Date-valued attributes such as created_date are recorded in the date valuation table, where entity ARCH-0001 bears the date 2024-02-12, entity ARCH-0002 carries 2023-06-04, entity ARCH-0003 holds 2025-05-16, and entity ARCH-0004 is dated 2024-07-03. Integer-valued attributes—such as size_bytes or version counters—reside in the integer valuation table, where entity ARCH-0001 exhibits values of 356 and 2, while entity ARCH-0002 records 77 and 4. String-valued attributes populate the varchar valuation table, yielding values such as 7b14de08, ref-8842, BSD-3-Clause, and ap-south-2 across entity ARCH-0001. The foreign key attr_id in each valuation table points back to the attribute definition, while entity_id references the artifact to which the value pertains, establishing a clean many-to-one relationship between values and their definitional schema.

Beyond artifact metadata, the registry also governs eBPF programs through a parallel fact-dimension architecture. The eBPF program fact table records each program by its identifier—HOOK-0001 through HOOK-0004—alongside its size in bytes and its version number. Program HOOK-0001 occupies 784,335,640 bytes at version 12, HOOK-0002 spans 641,704,069 bytes at version 9, HOOK-0003 measures 113,209,263 bytes at version 11, and HOOK-0004 occupies 161,013,093 bytes at version 12. Each program attaches to a hook, recorded as attaches_to_hook_key, which references the hook dimension table. The hook dimension provides human-readable labels—Attaches To Hook Label 01 through Attaches To Hook Label 04—and categorical classifications—Attaches To Hook Category 01 through Attaches To Hook Category 04—enabling aggregation and filtering by functional domain.

**fact_ebpfprogram**

| id | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- |
| HOOK-0001 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0006 | 167519051 | 1 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |

A similar fact-dimension pattern governs column-level metadata, where the column fact table captures measurement confidence and uncertainty alongside a misc value. Column CLAI-0001 exhibits a confidence of 0.164 and uncertainty of 560.21 with a misc value of 257.80; CLAI-0002 shows confidence 0.068 and uncertainty 744.10 with misc 571.55; CLAI-0003 carries confidence 0.107 and uncertainty 984.09 with misc 140.18; and CLAI-0004 presents confidence 0.354 and uncertainty 404.01 with misc 131.27. The column_key in the fact table references the column dimension, which supplies column_label and column_category attributes—Column Label 01 through 04 and Column Category 01 through 04 respectively—providing the semantic context necessary for interpreting the quantitative measures. This separation of measured facts from categorical labels ensures that confidence and uncertainty assessments remain decoupled from the structural classification of the columns they describe.

**fact_column**

| id | column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | 0.164 | 560.21 | 257.80 |
| CLAI-0002 | CLAI-0006 | 0.068 | 744.10 | 571.55 |
| CLAI-0003 | CLAI-0004 | 0.107 | 984.09 | 140.18 |
| CLAI-0004 | CLAI-0001 | 0.354 | 404.01 | 131.27 |
| CLAI-0005 | CLAI-0006 | 0.790 | 109.97 | 235.19 |
| CLAI-0006 | CLAI-0003 | 0.934 | 653.09 | 813.74 |
| CLAI-0007 | CLAI-0005 | 0.938 | 827.04 | 409.13 |
| CLAI-0008 | CLAI-0002 | 0.734 | 419.22 | 492.32 |

**dim_column**

| id | column_label | column_category |
| --- | --- | --- |
| CLAI-0001 | Column Label 01 | Column Category 01 |
| CLAI-0002 | Column Label 02 | Column Category 02 |
| CLAI-0003 | Column Label 03 | Column Category 03 |
| CLAI-0004 | Column Label 04 | Column Category 04 |
| CLAI-0005 | Column Label 05 | Column Category 05 |
| CLAI-0006 | Column Label 06 | Column Category 06 |