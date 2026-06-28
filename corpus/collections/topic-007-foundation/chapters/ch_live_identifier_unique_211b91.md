---
chapter_id: ch_live_identifier_unique_211b91
topic_id: 7
family: 01_foundation
cited_terms: ['identifier_unique', 'mass_function_equiv_frame_and_assignment', 'column_tag_subclass']
model: engine-refine
---

Within the governance framework, identifiers serve as the primary mechanism for entity resolution and cross-referencing across heterogeneous data sources. Each identifier—whether formatted as a universal unique key such as `UNIQ-0001` through `UNIQ-0004`, an assignment reference like `ASSI-0001` through `ASSI-0004`, or a tag designation such as `TAG-0001` through `TAG-0004`—anchors a distinct entity within the provenance graph. The identifier table establishes bidirectional mappings between external identifiers and internal entities: the DOI `10.1038/s41586-023-06123` resolves to assignment `ASSI-0004`, while the PDB identifier `PDB-7XYZ-A` and the W3C-DOI `W3C-DOI:10.1002/anie.202112345` each independently reference the same assignment entity, demonstrating that multiple external identifiers may converge on a single internal entity. This many-to-one resolution pattern is essential for deduplication and for maintaining referential integrity when ingesting metadata from disparate registries, including the Japanese-language entry `ja` associated with `UNIQ-0001` and the Spanish-language entry `es` associated with `UNIQ-0004`.

**t_identifier_unique**

| id | identifier | identifies | checksum_algo | language |
| --- | --- | --- | --- | --- |
| UNIQ-0001 | 10.1038/s41586-023-06123 | ASSI-0004 | md5 | ja |
| UNIQ-0002 | W3C-DOI:10.1002/anie.202112345 | ASSI-0004 | sha1 | en |
| UNIQ-0003 | PDB-7XYZ-A | ASSI-0004 | md5 | ja |
| UNIQ-0004 | W3C-DOI:10.1002/anie.202112345 | ASSI-0004 | blake2b | es |
| UNIQ-0005 | PDB-7XYZ-A | ASSI-0006 | blake2b | de |
| UNIQ-0006 | ORCID-0000-0002-1825-0097 | ASSI-0006 | md5 | es |
| UNIQ-0007 | W3C-DOI:10.1002/anie.202112345 | ASSI-0004 | blake2b | fr |
| UNIQ-0008 | SNOMED-123456008 | ASSI-0001 | blake2b | ja |

Attributes and their associated types constitute the schema layer that defines what properties may be attached to each entity class. The attribute registry distinguishes between mass function assignment attributes and column tag attributes, each with a controlled vocabulary of names and XSD-typed values. For mass function assignments, attributes include `confidence` typed as `xsd:decimal`, `dimension_kind` typed as `xsd:string`, `method` typed as `xsd:string`, and `recorded_at` typed as `xsd:dateTime`. Column tag attributes mirror this structure, supporting the same four attribute names with identical type declarations. Values are materialized in type-dispatched tables: decimal attributes such as `confidence` store quantified measurements like `0.002` and `0.018` for mass function assignments, or `0.376` and `0.809` for column tags; string attributes capture categorical descriptors including `Dimension Kind 01`, `Encoding 02`, and `pre-release note`; and datetime attributes record temporal provenance with ISO 8601 timestamps such as `2025-06-10T14:56:29` and `2023-08-03T19:45:29`. This type-dispatched storage pattern ensures type safety at query time while avoiding the overhead of generic value columns.

Checksum algorithms and language metadata provide integrity and localization guarantees for identifier records. The checksum algorithm column—populated with `md5`, `sha1`, and `blake2b`—specifies the digest method applied to the identifier value, enabling downstream systems to verify that an identifier has not been corrupted during transit or storage. The `md5` algorithm appears for identifiers `UNIQ-0001` and `UNIQ-0003`, `sha1` for `UNIQ-0002`, and the more modern `blake2b` for `UNIQ-0004`, reflecting a migration trajectory toward stronger hash functions. Language codes—`ja`, `en`, `es`, and `fr`—accompany each identifier to indicate the linguistic context of the source record, supporting multilingual metadata aggregation and locale-aware retrieval. These two columns operate orthogonally: checksum integrity is independent of language, and both are properties of the identifier record rather than of the entity it references.

Entity relationships are expressed through assignment and annotation structures that link mass functions to frames of discernment and column tags to their target columns. A mass function assignment such as `ASSI-0001` carries a mass value of `corrosion_rate_measurement` over the frame `TAG-0004`, assigning belief to the proposition `fault_or_failure`. Similarly, `ASSI-0002` and `ASSI-0003` operate over frames `TAG-0007` and `TAG-0006` respectively, with mass values of `optical_transmittance_run` and `magnetic_offset_calibration` targeting `land_or_sea_only` and `degraded_state_only`. The assignment `ASSI-0004` carries the mass `vibration_profile_test` over frame `TAG-0006` and assigns belief to `degraded_state_only`, mirroring the proposition of `ASSI-0003` while differing in its mass value and frame. Column tag subclasses annotate specific columns—`user_id`, `log_level`, `patient_id`, and `sensor_reading`—with tag identifiers that reference assignment entities, thereby creating a bridge between column-level metadata and the mass function framework. The entity column in each value table explicitly ties a value back to its owning entity, ensuring that attribute values are unambiguously associated with the correct assignment or tag even when multiple entities share the same attribute definition.

**t_mass_function_equiv_frame_and_assignment**

| id | mass | over_frame_of_discernment | assigns_mass_to |
| --- | --- | --- | --- |
| ASSI-0001 | corrosion_rate_measurement | TAG-0004 | fault_or_failure |
| ASSI-0002 | optical_transmittance_run | TAG-0007 | land_or_sea_only |
| ASSI-0003 | magnetic_offset_calibration | TAG-0006 | degraded_state_only |
| ASSI-0004 | vibration_profile_test | TAG-0006 | degraded_state_only |
| ASSI-0005 | pressure_deviation_check | TAG-0005 | high_or_extreme_only |
| ASSI-0006 | vibration_profile_test | TAG-0007 | degraded_state_only |

**t_mass_function_equiv_frame_and_assignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

**t_mass_function_equiv_frame_and_assignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-06-10T14:56:29 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-25T12:59:02 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2024-03-24T16:20:19 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-03-04T17:25:44 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2024-07-15T05:15:18 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-09-16T23:06:46 |

**t_mass_function_equiv_frame_and_assignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.002 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 724.48 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 469.73 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.018 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 449.10 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 350.09 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.405 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 839.88 |

**t_mass_function_equiv_frame_and_assignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | pre-release note |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | fr |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | manual |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | kg |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

**t_column_tag_subclass**

| id | column | annotates_column |
| --- | --- | --- |
| TAG-0001 | user_id | ASSI-0001 |
| TAG-0002 | log_level | ASSI-0003 |
| TAG-0003 | patient_id | ASSI-0006 |
| TAG-0004 | sensor_reading | ASSI-0006 |
| TAG-0005 | throughput_mb | ASSI-0005 |
| TAG-0006 | sensor_reading | ASSI-0006 |
| TAG-0007 | region_code | ASSI-0003 |

**t_column_tag_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAG-0001 | confidence | xsd:decimal |
| TAG-0002 | dimension_kind | xsd:string |
| TAG-0003 | method | xsd:string |
| TAG-0004 | recorded_at | xsd:dateTime |
| TAG-0005 | uncertainty | xsd:decimal |
| TAG-0006 | unit | xsd:string |
| TAG-0007 | value | xsd:decimal |
| TAG-0008 | encoding | xsd:string |

**t_column_tag_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0004 | 2023-08-03T19:45:29 |
| TAG-0002 | TAG-0002 | TAG-0004 | 2025-03-24T11:46:10 |
| TAG-0003 | TAG-0003 | TAG-0004 | 2025-05-22T05:44:38 |
| TAG-0004 | TAG-0004 | TAG-0004 | 2025-01-14T19:12:47 |
| TAG-0005 | TAG-0005 | TAG-0004 | 2024-02-24T06:52:57 |
| TAG-0006 | TAG-0006 | TAG-0004 | 2024-10-16T08:04:03 |
| TAG-0007 | TAG-0007 | TAG-0004 | 2025-02-04T08:16:45 |

**t_column_tag_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0001 | 0.376 |
| TAG-0002 | TAG-0001 | TAG-0005 | 922.76 |
| TAG-0003 | TAG-0001 | TAG-0007 | 942.47 |
| TAG-0004 | TAG-0002 | TAG-0001 | 0.809 |
| TAG-0005 | TAG-0002 | TAG-0005 | 398.44 |
| TAG-0006 | TAG-0002 | TAG-0007 | 718.52 |
| TAG-0007 | TAG-0003 | TAG-0001 | 0.172 |
| TAG-0008 | TAG-0003 | TAG-0005 | 254.23 |

**t_column_tag_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAG-0001 | TAG-0001 | TAG-0002 | Dimension Kind 01 |
| TAG-0002 | TAG-0001 | TAG-0008 | Encoding 02 |
| TAG-0003 | TAG-0001 | TAG-0009 | intake form |
| TAG-0004 | TAG-0001 | TAG-0010 | en |
| TAG-0005 | TAG-0001 | TAG-0003 | automated |
| TAG-0006 | TAG-0001 | TAG-0006 | m/s |
| TAG-0007 | TAG-0002 | TAG-0002 | Dimension Kind 07 |
| TAG-0008 | TAG-0002 | TAG-0008 | Encoding 08 |