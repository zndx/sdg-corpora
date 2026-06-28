---
chapter_id: ch_live_ice_exactly_one_subject_d6e2b5
topic_id: 44
family: 01_foundation
cited_terms: ['ice_exactly_one_subject', 'policy_applies_to', 'ebpfprogram_writes_to_map']
model: engine-refine
---

Metadata in governed data architectures decomposes into a disciplined set of primitives: identifiers anchor every entity, attributes define its properties with typed constraints, categories organize dimensions of classification, effective dates bound policies to temporal windows, labels supply human-readable annotations, and auxiliary fields capture miscellaneous context. An identifier such as `SUBJ-0001` or `MAP-0003` serves as the immutable handle through which all downstream relationships resolve; it is the sole key that permits an attribute definition to be resolved against a concrete entity value, or a policy directive to be resolved against an operational target. The subject table `t_ice_exactly_one_subject` assigns identifiers like `SUBJ-0001` through `SUBJ-0004` to subjects whose ice descriptors—`Calibration Manifest`, `Provenance Graph Export`, `Raw Observation Feed`—and related artifacts—`Measurement Timeframe`, `Message Type Definition`, `Quality Check Script`—establish the provenance context for every derived attribute.

**t_ice_exactly_one_subject**

| id | ice | related |
| --- | --- | --- |
| SUBJ-0001 | Calibration Manifest | Measurement Timeframe |
| SUBJ-0002 | Provenance Graph Export | Message Type Definition |
| SUBJ-0003 | Raw Observation Feed | Quality Check Script |
| SUBJ-0004 | Provenance Graph Export | Primary Data Source |
| SUBJ-0005 | Schema Registry Entry | Primary Data Source |
| SUBJ-0006 | Audit Trail Report | Primary Data Source |
| SUBJ-0007 | Schema Registry Entry | Field Survey Zone |
| SUBJ-0008 | Sensor Configuration File | Data Governance Board |

**t_ice_exactly_one_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | encoding | xsd:string |
| SUBJ-0002 | label_text | xsd:string |
| SUBJ-0003 | language | xsd:string |

**t_ice_exactly_one_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | Encoding 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0002 | nightly summary |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0003 | fr |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | Encoding 04 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0002 | intake form |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0003 | de |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | Encoding 07 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0002 | intake form |

Attributes themselves are declared in a schema-like registry where each entry carries an `attr_name` and an `attr_type`. The attribute table `t_ice_exactly_one_subject_attr` enumerates properties such as `encoding`, `label_text`, and `language`, all constrained to the `xsd:string` type, thereby ensuring that every value bound to these attributes conforms to a single, well-defined datatype. The actual binding occurs in the value table `t_ice_exactly_one_subject_val_varchar`, which links an `entity_id` to an `attr_id` and stores the concrete `value`. Entity `SUBJ-0001` carries the attribute values `Encoding 01`, `nightly summary`, and `fr` across three distinct attribute associations, while entity `SUBJ-0002` holds `Encoding 04` under a different attribute reference. This three-table pattern—subject, attribute definition, and attribute value—separates the schema from the data, allowing attributes to be added, renamed, or re-typed without altering the entity records themselves.

Policy governance introduces a parallel structure where directives are bound to operational targets with explicit temporal boundaries. The table `t_policy_applies_to` records that the `Cloud Security Baseline` policy applies to `API Gateway Endpoints` with an `effective_date` of `2025-01-11` and a `label_text` of `audit excerpt`; the `Zero Trust Architecture Guideline` targets `HR Personnel Files` effective `2023-03-13`; the `GDPR Compliance Directive` governs `Kubernetes Clusters` from `2024-06-14`; and the `Data Retention Standard` covers `Customer PII Datasets` from `2024-05-03`. The `label_text` field—carrying values such as `nightly summary` and `pre-release note`—provides an auxiliary annotation layer that is independent of the policy name and the target, enabling audit trails and documentation references to carry human-readable context without polluting the primary identifiers.

**t_policy_applies_to**

| id | policy | applies_to | effective_date | label_text |
| --- | --- | --- | --- | --- |
| APPL-0001 | Cloud Security Baseline | API Gateway Endpoints | 2025-01-11 | audit excerpt |
| APPL-0002 | Zero Trust Architecture Guideline | HR Personnel Files | 2023-03-13 | nightly summary |
| APPL-0003 | GDPR Compliance Directive | Kubernetes Clusters | 2024-06-14 | nightly summary |
| APPL-0004 | Data Retention Standard | Customer PII Datasets | 2024-05-03 | pre-release note |
| APPL-0005 | Cloud Security Baseline | Financial Reporting Systems | 2024-11-13 | nightly summary |
| APPL-0006 | Incident Response Procedure | Kubernetes Clusters | 2023-05-19 | change rationale |
| APPL-0007 | Zero Trust Architecture Guideline | Kubernetes Clusters | 2024-07-03 | nightly summary |

In the systems-observability domain, the relationship between eBPF programs and kernel maps is captured through a fact-dimension split. The fact table `fact_ebpfprogram` records each program by its `identifier`—`MAP-0001` through `MAP-0004`—alongside a `writes_to_map_key` that points to the target map, a `size_bytes` measurement ranging from `113209263` to `784335640` bytes, and a `version` number of `9`, `11`, or `12`. The dimension table `dim_writes_to_map` enriches each map identifier with a `writes_to_map_label` such as `Writes To Map Label 01` and a `writes_to_map_category` such as `Writes To Map Category 01`. The `writes_to_map_key` column in the fact table creates a foreign-key link to the dimension, so that a program identified as `MAP-0001` can be traced to the map it writes to (`MAP-0003`), whose category and label are resolved through the dimension lookup. This separation permits the map taxonomy to evolve independently of the program inventory.

**fact_ebpfprogram**

| id | writes_to_map_key | size_bytes | version |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0003 | 784335640 | 12 |
| MAP-0002 | MAP-0005 | 641704069 | 9 |
| MAP-0003 | MAP-0003 | 113209263 | 11 |
| MAP-0004 | MAP-0001 | 161013093 | 12 |
| MAP-0005 | MAP-0002 | 352203820 | 12 |
| MAP-0006 | MAP-0006 | 167519051 | 1 |

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

Across all four structures, the recurring primitives—identifier, entity, attribute, category, effective date, label text, and miscellaneous context—form a coherent vocabulary for describing what exists, how it is classified, when rules apply, and what properties it carries. The `size_bytes` and `version` fields in the eBPF fact table introduce quantitative and revisionary dimensions that have no analogue in the metadata or policy tables, illustrating how the same identifier-and-relationship pattern adapts to different domains. The `attr_type` constraint (`xsd:string`) enforces datatype discipline in the attribute registry, while the `effective_date` column enforces temporal discipline in the policy registry; both are type-level guards that prevent semantic drift. The `misc` and `labeltext` columns, appearing in both the value and policy tables, serve as the human-facing annotation layer, carrying values like `nightly summary` and `Encoding 01` that are meaningful to operators but structurally independent of the keys that bind the data together.