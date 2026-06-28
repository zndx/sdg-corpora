---
chapter_id: ch_live_artifact_not_deprecated_9bea9d
topic_id: 158
family: 07_long_tail
cited_terms: ['artifact_not_deprecated', 'ebpfprogram_min_one_hook', 'universal_combined_with_existential']
model: engine-refine
---

Artifact registries and eBPF program inventories constitute the foundational metadata layer for software supply-chain governance, where each deployable unit is tracked through a structured schema of identifiers, categorical classifications, size measurements, and version designations. The artifact fact table records discrete software deliverables—DEPR-0001 through DEPR-0004—each associated with an artifact_key that references a parent or related artifact, a size_bytes field quantifying the binary footprint, and a version number indicating the iteration state. Artifact DEPR-0001, for instance, carries a size of 123,155,790 bytes at version 6, while DEPR-0004, the largest entry at 996,080,316 bytes, resides at version 5, illustrating the variance in both footprint and revision maturity across the artifact population. These factual records are enriched through the artifact dimension table, which assigns human-readable labels such as Artifact Label 01 through Artifact Label 04 and maps each entry to a classification category—Artifact Category 01 through Artifact Category 04—enabling downstream filtering, compliance auditing, and impact analysis by functional grouping.

**fact_artifact**

| id | artifact_key | size_bytes | version |
| --- | --- | --- | --- |
| DEPR-0001 | DEPR-0004 | 123155790 | 6 |
| DEPR-0002 | DEPR-0005 | 42978804 | 5 |
| DEPR-0003 | DEPR-0004 | 996080316 | 5 |
| DEPR-0004 | DEPR-0005 | 597369362 | 10 |
| DEPR-0005 | DEPR-0006 | 12061913 | 9 |
| DEPR-0006 | DEPR-0001 | 792675668 | 5 |

**dim_artifact**

| id | artifact_label | artifact_category |
| --- | --- | --- |
| DEPR-0001 | Artifact Label 01 | Artifact Category 01 |
| DEPR-0002 | Artifact Label 02 | Artifact Category 02 |
| DEPR-0003 | Artifact Label 03 | Artifact Category 03 |
| DEPR-0004 | Artifact Label 04 | Artifact Category 04 |
| DEPR-0005 | Artifact Label 05 | Artifact Category 05 |
| DEPR-0006 | Artifact Label 06 | Artifact Category 06 |

**t_universal_combined_with_existential**

| id | universal | related |
| --- | --- | --- |
| EXIS-0001 | Lab_Centrifuge_Rotor | Atmospheric_Moisture |
| EXIS-0002 | Supply_Chain_Shipment | Personal_Information |
| EXIS-0003 | GDPR_Consent_Record | Tissue_Sample |
| EXIS-0004 | Database_Backup_Volume | Personal_Information |
| EXIS-0005 | GDPR_Consent_Record | Serum_Glucose |
| EXIS-0006 | Spectral_Analyzer_Module | Light_Wavelength |
| EXIS-0007 | GDPR_Consent_Record | Light_Wavelength |
| EXIS-0008 | Blood_Glucose_Assay | Tissue_Sample |

The eBPF program inventory operates under an analogous dimensional model, capturing kernel-level program artifacts through the fact_ebpfprogram table, where each program is identified by a hook-oriented key such as HOOK-0001 through HOOK-0004. The attaches_to_hook_key column establishes the attachment relationship, indicating which kernel hook point the program binds to; HOOK-0001 and HOOK-0002 both reference HOOK-0006 as their attachment target, demonstrating that multiple programs may converge on a single hook point. Size measurements for these eBPF programs range from 113,209,263 bytes for HOOK-0003 to 784,335,640 bytes for HOOK-0001, with version numbers spanning from 9 to 12, reflecting the iterative development lifecycle of kernel-space instrumentation code. The corresponding dimension table, dim_attaches_to_hook, provides the categorical and labeling context for these hook attachments, assigning labels such as Attaches To Hook Label 01 through Attaches To Hook Label 04 and categories from Attaches To Hook Category 01 through Attaches To Hook Category 04, thereby enabling policy engines to evaluate attachment patterns against security baselines and operational constraints.

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

The structural parallelism between the artifact and eBPF program schemas—both employing a fact-dimension pairing with identifier, size, version, and categorical metadata—reflects a deliberate normalization strategy designed to support unified querying across heterogeneous deployable units. In both models, the fact table carries the quantitative attributes (size_bytes, version) and the foreign key linking to the parent or attachment context, while the dimension table supplies the qualitative descriptors (labels, categories). This separation ensures that categorical reclassification does not necessitate updates to the factual records, preserving the integrity of historical size and version measurements while allowing organizational taxonomy to evolve independently. The identifier schemes themselves—DEPR- prefixed codes for artifacts and HOOK- prefixed codes for eBPF programs—provide a namespace-isolation mechanism that prevents key collisions across artifact families while remaining amenable to pattern-based filtering in compliance queries.

Beyond the core artifact and hook registries, the universal-existential relationship table introduces a cross-domain linkage mechanism that maps abstract universal concepts to their concrete existential instances. Entries such as Lab_Centrifuge_Rotor relating to Atmospheric_Moisture, Supply_Chain_Shipment relating to Personal_Information, GDPR_Consent_Record relating to Tissue_Sample, and Database_Backup_Volume relating to Personal_Information establish semantic bridges between operational artifacts and the regulatory or environmental contexts in which they operate. This relationship layer enables traceability from a specific artifact or eBPF program through its categorical classification to the broader compliance domain it touches—whether data protection, environmental monitoring, or supply-chain integrity—thereby supporting end-to-end audit trails that satisfy regulatory requirements for demonstrable governance coverage.