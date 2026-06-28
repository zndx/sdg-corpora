---
chapter_id: ch_live_claim_supported_by_evidence_318af4
topic_id: 19
family: 06_belief_structure
cited_terms: ['claim_supported_by_evidence', 'ebpfprogram_writes_to_map', 'subclass_to_descriptive_ice']
model: engine-refine
---

The governance of evidence-backed claims rests upon a disciplined taxonomy of attributes, each assigned a precise type that governs how values are stored, validated, and interpreted across the system. An attribute such as `confidence` carries the type `xsd:decimal`, constraining its values to numeric precision—recorded measurements like 0.768 or 0.833 quantify model accuracy benchmarks with reproducible granularity. By contrast, the attribute `dimension_kind` is typed as `xsd:string`, accommodating categorical descriptors such as "Dimension Kind 01" or "Encoding 02" without imposing numerical semantics. Temporal attributes like `recorded_at` are bound to `xsd:dateTime`, anchoring observations to exact moments in time—2024-08-09T04:01:38, for instance—while `method` remains a free-form string, permitting entries like "nightly summary" to capture procedural context. This type discipline ensures that every attribute value, whether a decimal magnitude, a datetime stamp, or a textual label, conforms to a schema that is both machine-enforceable and semantically unambiguous.

Each attribute value is resolved through a tripartite linkage: the entity to which it belongs, the attribute it qualifies, and the typed value table that holds it. The entity identifier—EVID-0001, EVID-0002, and so forth—serves as the foreign key binding a value row back to its parent claim record, where the claim itself might read "Model accuracy benchmark" or "Server latency threshold breach." The evidence supporting that claim is itself referenced by an identifier such as ICE-0001 or ICE-0003, and these evidence identifiers resolve through a descriptive registry that pairs each code with a human-readable label and a language tag. The label "intake form" appears under language code `en` for ICE-0001 and under `de` for ICE-0002, while "calibration record" and "audit excerpt" follow the same bilingual pattern, enabling multilingual interpretation of the same evidentiary artifact without duplicating the underlying identifier.

**t_subclass_to_descriptive_ice**

| id | descriptive | label_text | language |
| --- | --- | --- | --- |
| ICE-0001 | schema_version_patch | intake form | en |
| ICE-0002 | annotation_layer_b | intake form | de |
| ICE-0003 | metadata_registry | calibration record | de |
| ICE-0004 | metadata_registry | audit excerpt | en |
| ICE-0005 | quality_flag_alpha | nightly summary | fr |
| ICE-0006 | telemetry_header | intake form | es |

The dimension of map writes introduces a parallel structure of classification and measurement. A fact table recording eBPF program behavior assigns each program an identifier—MAP-0001 through MAP-0004—and a foreign key, `writes_to_map_key`, that points to a dimension table where each map receives a label and a category. The label "Writes To Map Label 01" and its counterpart "Writes To Map Category 01" are not free text but controlled vocabulary entries, ensuring that every reference to a target map resolves to a single, canonical classification. The program itself carries a `size_bytes` measurement—784,335,640 bytes for MAP-0001, 113,209,263 for MAP-0003—and a `version` number, 12 or 9, that tracks the evolution of the binary. These numeric attributes are not merely descriptive; they are the basis for capacity planning, compliance auditing, and change management, where a version increment signals a material modification to the program's behavior.

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

The interplay between these structures—attribute typing, entity resolution, bilingual labeling, and map classification—forms a coherent governance layer. An evidence claim does not exist in isolation; it is anchored by an identifier, qualified by typed attributes, supported by a referenced evidence item whose label and language are independently maintained, and, in the case of programmatic artifacts, measured against size and version thresholds that map to controlled categories. The system's integrity derives not from any single table but from the foreign-key relationships that bind them: identifiers that resolve across tables, types that constrain values, and controlled vocabularies that ensure consistency regardless of the language in which a label is rendered.

**t_claim_supported_by_evidence**

| id | claim | supported_by_evidence |
| --- | --- | --- |
| EVID-0001 | Model accuracy benchmark | ICE-0003 |
| EVID-0002 | Server latency threshold breach | ICE-0001 |
| EVID-0003 | Server latency threshold breach | ICE-0003 |
| EVID-0004 | Emissions compliance record | ICE-0003 |
| EVID-0005 | Emissions compliance record | ICE-0003 |
| EVID-0006 | Batch ingestion delay anomaly | ICE-0003 |

**t_claim_supported_by_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

**t_claim_supported_by_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2024-08-09T04:01:38 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-12-19T17:45:47 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2024-10-20T14:55:58 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2024-09-01T03:06:06 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2024-01-23T04:47:13 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-03-02T02:15:09 |

**t_claim_supported_by_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.768 |
| EVID-0002 | EVID-0001 | EVID-0005 | 631.25 |
| EVID-0003 | EVID-0001 | EVID-0007 | 135.16 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.833 |
| EVID-0005 | EVID-0002 | EVID-0005 | 5.88 |
| EVID-0006 | EVID-0002 | EVID-0007 | 87.07 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.936 |
| EVID-0008 | EVID-0003 | EVID-0005 | 975.53 |

**t_claim_supported_by_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | nightly summary |
| EVID-0004 | EVID-0001 | EVID-0010 | de |
| EVID-0005 | EVID-0001 | EVID-0003 | automated |
| EVID-0006 | EVID-0001 | EVID-0006 | ms |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |