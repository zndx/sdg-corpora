---
chapter_id: ch_live_ganglion_cyst_imaging_finding_5bda5e
topic_id: 47
family: 08_derived
cited_terms: ['ganglion_cyst_imaging_finding', 'subclass_to_information_content_entity', 'constraint_with_severity_classification']
model: engine-refine
---

The architecture of clinical and regulatory data management rests upon a tripartite schema in which identifiers serve as the immutable anchors linking imaging observations, information content entities, and constraint classifications. The table `t_ganglion_cyst_imaging_finding` records discrete diagnostic observations—each assigned a unique identifier such as `FIND-0001` through `FIND-0004`—alongside the anatomical finding itself, the magnetic resonance imaging modality employed, the character encoding of the stored text, and the language of documentation. A finding of "Dorsal right ankle" may be visualized via MIP reconstruction encoded in `ascii` and documented in Japanese (`ja`), whereas the finding "Bilateral distal radius" employs Gadolinium enhanced T1 imaging with `latin1` encoding and English (`en`) language tags. The modality column, `magneticresonanceimagingmodality`, captures the specific acquisition technique—Sagittal PD FS, T2 weighted fat sat, and others—providing the technical provenance necessary for reproducibility and cross-institutional comparison.

**t_ganglion_cyst_imaging_finding**

| id | ganglion_cyst_imaging_finding | visualizes | encoding | language |
| --- | --- | --- | --- | --- |
| FIND-0001 | Dorsal right ankle | MIP reconstruction | ascii | ja |
| FIND-0002 | Left medial malleolus | Sagittal PD FS | ascii | ja |
| FIND-0003 | Bilateral distal radius | Gadolinium enhanced T1 | latin1 | en |
| FIND-0004 | Right dorsal metatarsal | T2 weighted fat sat | unicode | ja |
| FIND-0005 | Palmar left thumb | Sagittal PD FS | unicode | de |
| FIND-0006 | Left scapholunate ligament | STIR sequence | unicode | en |
| FIND-0007 | Palmar left thumb | PD weighted fat sat | unicode | en |

**t_constraint_with_severity_classification**

| id | constraint | severity | priority | language |
| --- | --- | --- | --- | --- |
| CLAS-0001 | Access control policy | ENTI-0001 | 3 | es |
| CLAS-0002 | PII encryption mandate | ENTI-0001 | 5 | en |
| CLAS-0003 | Sensor calibration interval | ENTI-0001 | 3 | es |
| CLAS-0004 | Log retention period | ENTI-0004 | 3 | fr |
| CLAS-0005 | Lab containment level | ENTI-0002 | 3 | ja |
| CLAS-0006 | Lab containment level | ENTI-0002 | 2 | fr |

The table `t_subclass_to_information_content_entity` establishes a registry of information content types, each identified by codes such as `ENTI-0001` through `ENTI-0004`, and annotated with a human-readable `labeltext` and a language designation. The information column distinguishes between structural categories—`schema_registry`, `telemetry_stream`, `compliance_audit`, and `data_catalog_entry`—while the label text provides operational context: a "nightly summary" for the schema registry, a "pre-release note" for telemetry streams, an "intake form" for compliance audit entries, and a "change rationale" for data catalog entries. These label texts are themselves localized, appearing in English (`en`), Japanese (`ja`), or Spanish (`es`), reflecting the multilingual nature of the information governance framework.

**t_subclass_to_information_content_entity**

| id | information | label_text | language |
| --- | --- | --- | --- |
| ENTI-0001 | schema_registry | nightly summary | en |
| ENTI-0002 | telemetry_stream | pre-release note | ja |
| ENTI-0003 | compliance_audit | intake form | ja |
| ENTI-0004 | data_catalog_entry | change rationale | es |
| ENTI-0005 | model_weights | nightly summary | en |
| ENTI-0006 | deployment_manifest | pre-release note | en |

Constraint severity classification, housed in `t_constraint_with_severity_classification`, binds regulatory and operational requirements to the information content entities defined above through a foreign-key relationship: the `severity` column references the `id` of `t_subclass_to_information_content_entity`, thereby grounding each constraint in a specific information type. The constraint column enumerates obligations such as "Access control policy," "PII encryption mandate," "Sensor calibration interval," and "Log retention period," each assigned a numeric `priority` value—`3` or `5`—indicating relative urgency or enforcement tier. The constraint "PII encryption mandate" carries the highest observed priority of `5` and is classified with severity `ENTI-0001` (the schema registry), whereas "Log retention period" bears severity `ENTI-0004` (the data catalog entry) and priority `3`.

Character encoding and language designation permeate all three tables as cross-cutting metadata dimensions. The imaging findings table records four encoding schemes—`ascii`, `latin1`, and `unicode`—applied to anatomical descriptions and modality labels, while the constraint and information entity tables uniformly carry a `language` column that disambiguates the locale of stored text. Japanese (`ja`) appears in both the imaging findings and information content entity tables, Spanish (`es`) in the constraint classification and information entity tables, French (`fr`) in the constraint table, and English (`en`) across all three, establishing a multilingual baseline for international deployment. The identifier columns—`FIND-000*`, `ENTI-000*`, and `CLAS-000*`—provide a consistent naming convention that enables unambiguous joins and audit trails across the schema, ensuring that every imaging observation, information entity, and regulatory constraint can be traced to its source record without ambiguity.