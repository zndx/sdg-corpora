---
chapter_id: ch_live_equiv_intersect_with_two_restrictions_be5ec0
topic_id: 7
family: 01_foundation
cited_terms: ['equiv_intersect_with_two_restrictions', 'identifier_unique', 'ebpfmap_only_one_value_type']
model: engine-refine
---

Identifier systems form the backbone of any rigorous data governance framework, serving as the immutable anchor points across heterogeneous registries and operational contexts. An identifier such as `10.1038/s41586-023-06123` may designate the FDA 510(k) Database, while the same DOI prefix `W3C-DOI:10.1002/anie.202112345` simultaneously references both the OSMnx Graph Library and the CERN Telemetry Stream, demonstrating that identifier collision and cross-domain reuse are not anomalies but structural features of federated systems. The `t_equiv_intersect_with_two_restrictions` table captures these equivalence relationships explicitly, recording that `telemetry_stream_alpha` and `ml_model_checkpoint` are treated as interchangeable with respect to `storage_volume` and `inference_dataset`, while `governance_policy_set` and `sensor_node_array` are equivalently bound to `encryption_key` and `backup_volume`. Such equivalence mappings are essential for maintaining referential integrity when the same logical entity appears under different nomenclatures across organizational boundaries.

**t_equiv_intersect_with_two_restrictions**

| id | equiv | equiv_2 | related | related_2 |
| --- | --- | --- | --- | --- |
| REST-0001 | telemetry_stream_alpha | ml_model_checkpoint | storage_volume | inference_dataset |
| REST-0002 | governance_policy_set | sensor_node_array | encryption_key | backup_volume |
| REST-0003 | ml_feature_vector | sensor_node_array | centrifuge_tube | pressure_transducer |
| REST-0004 | lab_assay_batch | ml_model_checkpoint | ingestion_connector | pressure_transducer |
| REST-0005 | edge_gateway_unit | validation_schema | protocol_adapter | incubator_chamber |
| REST-0006 | batch_pipeline_gamma | sensor_node_array | schema_registry | catalog_entry |
| REST-0007 | telemetry_stream_alpha | ml_model_checkpoint | centrifuge_tube | inference_dataset |

The integrity of any identifier registry depends critically on the checksum algorithm selected for integrity verification, a parameter that carries significant operational and compliance implications. The `md5` algorithm appears alongside identifiers such as `PDB-7XYZ-A` for the RefSeq Genome Assembly, while `sha1` is applied to the OSMnx Graph Library entry, and `blake2b` protects the CERN Telemetry Stream record. The choice among these algorithms is not arbitrary: `md5` and `sha1` represent legacy checksums with known collision vulnerabilities, whereas `blake2b` offers modern cryptographic strength suitable for environments where tamper evidence is a regulatory requirement. This parameter, stored as `checksum_algo`, must therefore be evaluated not merely as a technical detail but as a compliance artifact subject to audit.

Language designation provides another layer of contextual metadata, ensuring that identifier registries remain accessible and unambiguous across multilingual operational environments. The identifier `10.1038/s41586-023-06123` is associated with the Japanese language code `ja`, as is `PDB-7XYZ-A`, while the OSMnx Graph Library record carries the English code `en` and the CERN Telemetry Stream entry is tagged `es` for Spanish. These language attributes do not describe the identifier itself but rather the locale of the associated documentation, governance policy, or user-facing interface, and they must be maintained consistently to prevent misinterpretation in cross-border data exchanges.

**t_identifier_unique**

| id | identifier | identifies | checksum_algo | language |
| --- | --- | --- | --- | --- |
| UNIQ-0001 | 10.1038/s41586-023-06123 | FDA 510(k) Database | md5 | ja |
| UNIQ-0002 | W3C-DOI:10.1002/anie.202112345 | OSMnx Graph Library | sha1 | en |
| UNIQ-0003 | PDB-7XYZ-A | RefSeq Genome Assembly | md5 | ja |
| UNIQ-0004 | W3C-DOI:10.1002/anie.202112345 | CERN Telemetry Stream | blake2b | es |
| UNIQ-0005 | PDB-7XYZ-A | RefSeq Genome Assembly | blake2b | de |
| UNIQ-0006 | ORCID-0000-0002-1825-0097 | CERN Telemetry Stream | md5 | es |
| UNIQ-0007 | W3C-DOI:10.1002/anie.202112345 | WHO ICD-11 Code | blake2b | fr |
| UNIQ-0008 | SNOMED-123456008 | CERN Telemetry Stream | blake2b | ja |

At the operational layer, the `type_map` dimension serves as the primary key connecting factual measurements to their categorical definitions. The `fact_ebpfmap` table records `size_bytes` values—ranging from `31105012` for one `TYPE-0002` mapping to `354373995` for `TYPE-0003`—alongside version numbers such as `3`, `6`, `12`, and `5`, which track the evolution of each type mapping over time. The `dim_value_type_map` table provides the human-readable labels and categories for these type keys: `TYPE-0001` through `TYPE-0004` are each assigned distinct `value_type_map_label` entries (e.g., `Value Type Map Label 01`) and corresponding `value_type_map_category` designations (`Value Type Map Category 01` through `04`). This separation of factual measurements from their categorical metadata enables independent versioning of type definitions without disrupting the integrity of historical size and version records.

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

The interplay between these dimensions—identifier, checksum algorithm, language, type map, category, size, and version—creates a multi-axis governance framework in which every data asset can be located, verified, contextualized, and traced through its lifecycle. An equivalence relationship recorded under `REST-0001` links `telemetry_stream_alpha` to `ml_model_checkpoint` and associates them with `storage_volume` and `inference_dataset`, while the same logical entity may simultaneously carry an identifier like `UNIQ-0001` with a specific checksum algorithm and language tag, and appear in operational fact tables under a `type_map` key with a recorded size and version number. The completeness of this metadata fabric determines whether an organization can demonstrate data lineage, satisfy audit requirements, and maintain operational continuity when systems evolve or merge.