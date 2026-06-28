---
chapter_id: ch_live_profile_of_dataset_7f3a51
topic_id: 44
family: 02_observation_measurement
cited_terms: ['profile_of_dataset', 'ebpfprogram_writes_to_map', 'cardinality_max_one_generic']
model: engine-refine
---

The architecture of a data warehouse rests upon the disciplined separation of measured phenomena from their descriptive context, a division that manifests in the distinction between fact tables and dimension tables. Fact tables capture quantifiable events or states—numeric measurements, timestamps, and foreign keys that anchor observations to their descriptive universe—while dimension tables supply the categorical scaffolding that renders those measurements interpretable. Within this paradigm, the fact_profile table records quantitative observations of profiled entities, each identified by a surrogate key such as DATA-0001 or DATA-0002, and each associated with a profile_key that references a named profile (DATA-0005, DATA-0003, DATA-0006) residing in the dim_profile dimension. The dim_profile table itself carries the human-readable profile_label—Profile Label 01 through Profile Label 04—alongside a profile_category field (Profile Category 01, Profile Category 02, and so forth) and a category_id foreign key that further resolves each profile into the taxonomy maintained by dim_profile_category, where category_name values such as Category Name 01 through Category Name 04 provide the final layer of classification. This multi-tiered categorization scheme ensures that every numeric observation in fact_profile can be traced through profile_key to dim_profile, and from there through category_id to dim_profile_category, yielding a complete audit trail from raw measurement to business classification.

Confidence and uncertainty constitute the twin pillars of measurement quality within this framework. The confidence column in fact_profile stores a probability-like value ranging from 0.226 to 0.994, where a reading of 0.994 for identifier DATA-0002 signals near-certainty in the associated observation, while a value of 0.226 for DATA-0004 indicates substantial doubt. These confidence scores are paired with an uncertainty column that quantifies the absolute dispersion of the measurement—values such as 284.36, 557.92, 622.09, and 488.10 represent the magnitude of potential error in the corresponding value field (728.94, 380.57, 607.36, 448.09). The inverse relationship between confidence and uncertainty is not strictly enforced; rather, both metrics are recorded independently so that downstream consumers can apply their own risk thresholds when filtering or aggregating profiled data. A profile observation with confidence 0.773 and uncertainty 622.09 (DATA-0003) may be deemed acceptable in one analytical context and rejected in another, depending on the tolerance for variance inherent to the use case.

**fact_profile**

| id | profile_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| DATA-0001 | DATA-0005 | 0.299 | 284.36 | 728.94 |
| DATA-0002 | DATA-0005 | 0.994 | 557.92 | 380.57 |
| DATA-0003 | DATA-0003 | 0.773 | 622.09 | 607.36 |
| DATA-0004 | DATA-0006 | 0.226 | 488.10 | 448.09 |

The fact_ebpfprogram table applies the same fact-table pattern to a different domain—eBPF program metadata—where the measured attributes are size_bytes and version rather than confidence and uncertainty. Each row is identified by a surrogate key such as MAP-0001 or MAP-0002, and the size_bytes column records program footprint in bytes, with values spanning from 113,209,263 to 784,335,640. The version column stores an integer revision number (9, 11, 12), enabling temporal tracking of program evolution. The writes_to_map_key column serves as the foreign key linking each eBPF program to its target map, a relationship resolved through the dim_writes_to_map dimension table, which provides the writes_to_map_label (Writes To Map Label 01 through 04) and writes_to_map_category (Writes To Map Category 01 through 04) for each map identifier. This structure mirrors the profile taxonomy: just as fact_profile resolves its profile_key through dim_profile to dim_profile_category, fact_ebpfprogram resolves its writes_to_map_key through dim_writes_to_map, establishing a consistent pattern of foreign-key resolution across domains.

**dim_profile_category**

| id | category_name |
| --- | --- |
| DATA-0001 | Category Name 01 |
| DATA-0002 | Category Name 02 |
| DATA-0003 | Category Name 03 |
| DATA-0004 | Category Name 04 |
| DATA-0005 | Category Name 05 |
| DATA-0006 | Category Name 06 |

**fact_ebpfprogram**

| id | writes_to_map_key | size_bytes | version |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0003 | 784335640 | 12 |
| MAP-0002 | MAP-0005 | 641704069 | 9 |
| MAP-0003 | MAP-0003 | 113209263 | 11 |
| MAP-0004 | MAP-0001 | 161013093 | 12 |
| MAP-0005 | MAP-0002 | 352203820 | 12 |
| MAP-0006 | MAP-0006 | 167519051 | 1 |

The cardinality constraint table, t_cardinality_max_one_generic, introduces a governance layer that governs how entities relate to one another across the warehouse. Its cardinality column encodes relationship semantics—mandatory_one, strict_unique, singular_ref, first_match—while the related column specifies the target entity set (device_metrics, asset_registry, audit_logs, config_params). These constraints are not stored as declarative schema-level foreign keys but as explicit records that can be queried, validated, and overridden, providing a flexible mechanism for documenting referential integrity rules that may vary by business context. The identifier values GENE-0001 through GENE-0004 serve as stable references to these rules, enabling downstream tooling to enforce or document cardinality expectations without hardcoding them into application logic.

**t_cardinality_max_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | mandatory_one | device_metrics |
| GENE-0002 | strict_unique | asset_registry |
| GENE-0003 | singular_ref | audit_logs |
| GENE-0004 | first_match | config_params |

Across all tables, the identifier column functions as the universal primary key, a surrogate value that remains stable regardless of changes to business attributes. In fact_profile, identifiers follow the pattern DATA-0001 through DATA-0004; in fact_ebpfprogram, they follow MAP-0001 through MAP-0004; in t_cardinality_max_one_generic, they follow GENE-0001 through GENE-0004. This naming convention—prefix followed by zero-padded sequence—provides immediate semantic signal about the table of origin without requiring a schema lookup. The misc, category, and profile columns that appear across dimension tables serve as the human-readable attributes that analysts query directly, while the identifier and foreign-key columns (profile_key, category_id, writes_to_map_key) serve the join operations that reconstruct the full analytical context from the normalized structure.

**dim_profile**

| id | profile_label | profile_category | category_id |
| --- | --- | --- | --- |
| DATA-0001 | Profile Label 01 | Profile Category 01 | DATA-0004 |
| DATA-0002 | Profile Label 02 | Profile Category 02 | DATA-0006 |
| DATA-0003 | Profile Label 03 | Profile Category 03 | DATA-0005 |
| DATA-0004 | Profile Label 04 | Profile Category 04 | DATA-0001 |
| DATA-0005 | Profile Label 05 | Profile Category 05 | DATA-0002 |
| DATA-0006 | Profile Label 06 | Profile Category 06 | DATA-0004 |
| DATA-0007 | Profile Label 07 | Profile Category 07 | DATA-0002 |

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