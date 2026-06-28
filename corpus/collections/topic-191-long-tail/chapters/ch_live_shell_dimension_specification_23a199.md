---
chapter_id: ch_live_shell_dimension_specification_23a199
topic_id: 191
family: 08_derived
cited_terms: ['shell_dimension_specification', 'attestation_min_one_signer', 'measurement_subclass_only_one_unit']
model: engine-refine
---

Shell dimension specifications serve as the foundational entities for cataloguing biometric and morphological descriptors, each identified by a unique specification code such as SPEC-0001 through SPEC-0004 and associated with a canonical nomenclature string—Venus_venerupis_Mediterranean, Cypraea_tigris_Asian, Littorina_obtusa_Urban, or Strombus_gigas_Tropical. These identifiers anchor a property graph in which attributes are declared independently of their values, enabling a single specification to carry heterogeneous metadata without schema modification. The attribute registry, keyed by its own identifier and exposing two structural columns—attr_name and attr_type—defines the schema of permissible observations. Within this registry, attr_name takes values such as confidence, dimension_kind, method, and recorded_at, while attr_type constrains each to an XML Schema datatype: xsd:decimal for numeric precision, xsd:string for free-form text, and xsd:dateTime for temporal stamps. This separation of attribute declaration from attribute instantiation is the architectural mechanism that permits a single entity like SPEC-0001 to accumulate a confidence score of 0.130, a dimension_kind of Dimension Kind 01, a method label, and a recorded_at timestamp of 2024-08-09T04:20:11, each stored in a type-specialised value table.

**t_shell_dimension_specification**

| id | shell_dimension_specification |
| --- | --- |
| SPEC-0001 | Venus_venerupis_Mediterranean |
| SPEC-0002 | Cypraea_tigris_Asian |
| SPEC-0003 | Littorina_obtusa_Urban |
| SPEC-0004 | Strombus_gigas_Tropical |
| SPEC-0005 | Ostrea_gigas_Brittany |
| SPEC-0006 | Nassa_pertenuis_Coast |
| SPEC-0007 | Strongylocentrotus_pacificus_Puget |

**t_shell_dimension_specification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPEC-0001 | confidence | xsd:decimal |
| SPEC-0002 | dimension_kind | xsd:string |
| SPEC-0003 | method | xsd:string |
| SPEC-0004 | recorded_at | xsd:dateTime |
| SPEC-0005 | uncertainty | xsd:decimal |
| SPEC-0006 | unit | xsd:string |
| SPEC-0007 | value | xsd:decimal |
| SPEC-0008 | encoding | xsd:string |

**t_shell_dimension_specification_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0004 | 2024-08-09T04:20:11 |
| SPEC-0002 | SPEC-0002 | SPEC-0004 | 2023-01-11T02:33:00 |
| SPEC-0003 | SPEC-0003 | SPEC-0004 | 2025-04-11T22:51:28 |
| SPEC-0004 | SPEC-0004 | SPEC-0004 | 2025-04-30T10:31:45 |
| SPEC-0005 | SPEC-0005 | SPEC-0004 | 2023-04-03T22:35:38 |
| SPEC-0006 | SPEC-0006 | SPEC-0004 | 2023-08-11T07:42:35 |
| SPEC-0007 | SPEC-0007 | SPEC-0004 | 2025-04-06T02:27:44 |

**t_shell_dimension_specification_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0001 | 0.130 |
| SPEC-0002 | SPEC-0001 | SPEC-0005 | 733.39 |
| SPEC-0003 | SPEC-0001 | SPEC-0007 | 125.34 |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | 0.624 |
| SPEC-0005 | SPEC-0002 | SPEC-0005 | 68.87 |
| SPEC-0006 | SPEC-0002 | SPEC-0007 | 303.82 |
| SPEC-0007 | SPEC-0003 | SPEC-0001 | 0.168 |
| SPEC-0008 | SPEC-0003 | SPEC-0005 | 203.41 |

The value tables implement a vertical partitioning strategy that maps every (entity_id, attr_id) pair to a typed value column. For shell dimension specifications, three such tables exist: val_datetime holds ISO-8601 timestamps such as 2023-01-11T02:33:00 and 2025-04-30T10:31:45; val_decimal stores floating-point measurements including 0.130, 733.39, and 125.34; and val_varchar captures character strings like Encoding 02, nightly summary, and the language tag ja. Each value row carries its own surrogate id, a foreign key entity_id that references the primary specification, and a foreign key attr_id that resolves to the attribute definition. This design ensures that type enforcement occurs at the storage layer—decimal values never leak into the varchar table, and datetime values are isolated from numeric columns—while the shared entity_id column provides the join path that reconstructs a complete attribute bundle for any given specification.

The same attribute–entity–value pattern recurs across attestation records and measurement subclass records, demonstrating a uniform modelling discipline. In the attestation domain, the entity table t_attestation_min_one_signer enumerates compliance events such as Chain of Custody Review, Security Baseline Validation, and SOC 2 Type II Audit, each identified by codes SIGN-0001 through SIGN-0004. Its attribute registry declares duration_seconds, end_time, exit_code, and host_name, typed respectively as xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string. The corresponding value tables distribute these observations: val_decimal records durations of 1355.00, 2257.11, 6713.34, and 6673.35 seconds; val_datetime captures end times such as 2023-11-17T23:13:16 and 2024-10-31T01:25:16; val_int stores exit codes 392, 373, 567, and 384; and val_varchar holds host identifiers like node-b14 alongside status strings complete and review. The foreign-key relationships are identical in form to those in the shell dimension specification domain—entity_id resolves to the attestation record, attr_id resolves to the attribute definition, and the value column carries the typed payload.

**t_shell_dimension_specification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0002 | Dimension Kind 01 |
| SPEC-0002 | SPEC-0001 | SPEC-0008 | Encoding 02 |
| SPEC-0003 | SPEC-0001 | SPEC-0009 | nightly summary |
| SPEC-0004 | SPEC-0001 | SPEC-0010 | ja |
| SPEC-0005 | SPEC-0001 | SPEC-0003 | manual |
| SPEC-0006 | SPEC-0001 | SPEC-0006 | nm |
| SPEC-0007 | SPEC-0002 | SPEC-0002 | Dimension Kind 07 |
| SPEC-0008 | SPEC-0002 | SPEC-0008 | Encoding 08 |

**t_attestation_min_one_signer**

| id | attestation |
| --- | --- |
| SIGN-0001 | Chain of Custody Review |
| SIGN-0002 | Security Baseline Validation |
| SIGN-0003 | Chain of Custody Review |
| SIGN-0004 | SOC 2 Type II Audit |
| SIGN-0005 | HIPAA Compliance Verification |
| SIGN-0006 | Data Residency Certification |

**t_attestation_min_one_signer_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SIGN-0001 | duration_seconds | xsd:decimal |
| SIGN-0002 | end_time | xsd:dateTime |
| SIGN-0003 | exit_code | xsd:integer |
| SIGN-0004 | host_name | xsd:string |
| SIGN-0005 | log_level | xsd:string |
| SIGN-0006 | phase | xsd:string |
| SIGN-0007 | retry_count | xsd:integer |
| SIGN-0008 | scheduled_at | xsd:dateTime |

**t_attestation_min_one_signer_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0002 | 2023-01-30T09:27:18 |
| SIGN-0002 | SIGN-0001 | SIGN-0008 | 2023-11-17T23:13:16 |
| SIGN-0003 | SIGN-0001 | SIGN-0009 | 2024-10-31T01:25:16 |
| SIGN-0004 | SIGN-0002 | SIGN-0002 | 2024-07-02T14:51:27 |
| SIGN-0005 | SIGN-0002 | SIGN-0008 | 2025-02-15T22:43:11 |
| SIGN-0006 | SIGN-0002 | SIGN-0009 | 2025-01-24T22:56:47 |
| SIGN-0007 | SIGN-0003 | SIGN-0002 | 2024-08-04T06:50:35 |
| SIGN-0008 | SIGN-0003 | SIGN-0008 | 2024-10-17T00:50:44 |

**t_attestation_min_one_signer_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0001 | 1355.00 |
| SIGN-0002 | SIGN-0002 | SIGN-0001 | 2257.11 |
| SIGN-0003 | SIGN-0003 | SIGN-0001 | 6713.34 |
| SIGN-0004 | SIGN-0004 | SIGN-0001 | 6673.35 |
| SIGN-0005 | SIGN-0005 | SIGN-0001 | 1063.66 |
| SIGN-0006 | SIGN-0006 | SIGN-0001 | 1.74 |

**t_attestation_min_one_signer_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0003 | 392 |
| SIGN-0002 | SIGN-0001 | SIGN-0007 | 373 |
| SIGN-0003 | SIGN-0002 | SIGN-0003 | 567 |
| SIGN-0004 | SIGN-0002 | SIGN-0007 | 384 |
| SIGN-0005 | SIGN-0003 | SIGN-0003 | 347 |
| SIGN-0006 | SIGN-0003 | SIGN-0007 | 188 |
| SIGN-0007 | SIGN-0004 | SIGN-0003 | 103 |
| SIGN-0008 | SIGN-0004 | SIGN-0007 | 410 |

**t_attestation_min_one_signer_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0004 | node-b14 |
| SIGN-0002 | SIGN-0001 | SIGN-0005 | Log Level 02 |
| SIGN-0003 | SIGN-0001 | SIGN-0006 | review |
| SIGN-0004 | SIGN-0001 | SIGN-0010 | complete |
| SIGN-0005 | SIGN-0001 | SIGN-0011 | Triggered By 05 |
| SIGN-0006 | SIGN-0002 | SIGN-0004 | ingest-21 |
| SIGN-0007 | SIGN-0002 | SIGN-0005 | Log Level 07 |
| SIGN-0008 | SIGN-0002 | SIGN-0006 | execution |

Measurement subclass entities follow the same schema, with t_measurement_subclass_only_one_unit pairing a measurement label—temperature gradient, soil pH, soil moisture, torque—to a unit of measure such as newton meters, decibels, lumens, or degrees celsius. The attribute definitions mirror those of the shell dimension specification, reusing attr_name values confidence, dimension_kind, method, and recorded_at with the same xsd-typed constraints. Value instantiation again splits across type-specialised tables: val_decimal stores 0.584, 680.89, and 977.36; val_datetime records 2024-07-02T10:17:22, 2025-05-17T18:10:32, 2023-09-23T07:34:54, and 2023-07-03T17:50:57; and val_varchar carries Dimension Kind 01, Encoding 02, change rationale, and the language tag fr. The repetition of this three-table value pattern across three distinct entity families—shell dimension specifications, attestations, and measurement subclasses—confirms that the attribute–entity–value decomposition is a deliberate governance mechanism, not an incidental implementation detail.

**t_measurement_subclass_only_one_unit**

| id | measurement | unit |
| --- | --- | --- |
| UNIT-0001 | temperature gradient | newton meters |
| UNIT-0002 | soil pH | decibels |
| UNIT-0003 | soil moisture | lumens |
| UNIT-0004 | torque | degrees celsius |
| UNIT-0005 | heart rate | lumens |
| UNIT-0006 | packet loss | percent |

**t_measurement_subclass_only_one_unit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNIT-0001 | confidence | xsd:decimal |
| UNIT-0002 | dimension_kind | xsd:string |
| UNIT-0003 | method | xsd:string |
| UNIT-0004 | recorded_at | xsd:dateTime |
| UNIT-0005 | uncertainty | xsd:decimal |
| UNIT-0006 | unit | xsd:string |
| UNIT-0007 | value | xsd:decimal |
| UNIT-0008 | encoding | xsd:string |

**t_measurement_subclass_only_one_unit_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0004 | 2024-07-02T10:17:22 |
| UNIT-0002 | UNIT-0002 | UNIT-0004 | 2025-05-17T18:10:32 |
| UNIT-0003 | UNIT-0003 | UNIT-0004 | 2023-09-23T07:34:54 |
| UNIT-0004 | UNIT-0004 | UNIT-0004 | 2023-07-03T17:50:57 |
| UNIT-0005 | UNIT-0005 | UNIT-0004 | 2025-03-23T11:32:54 |
| UNIT-0006 | UNIT-0006 | UNIT-0004 | 2024-10-11T18:39:44 |

**t_measurement_subclass_only_one_unit_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | 0.584 |
| UNIT-0002 | UNIT-0001 | UNIT-0005 | 680.89 |
| UNIT-0003 | UNIT-0001 | UNIT-0007 | 977.36 |
| UNIT-0004 | UNIT-0002 | UNIT-0001 | 0.929 |
| UNIT-0005 | UNIT-0002 | UNIT-0005 | 548.84 |
| UNIT-0006 | UNIT-0002 | UNIT-0007 | 51.31 |
| UNIT-0007 | UNIT-0003 | UNIT-0001 | 0.964 |
| UNIT-0008 | UNIT-0003 | UNIT-0005 | 305.75 |

**t_measurement_subclass_only_one_unit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | Dimension Kind 01 |
| UNIT-0002 | UNIT-0001 | UNIT-0008 | Encoding 02 |
| UNIT-0003 | UNIT-0001 | UNIT-0009 | change rationale |
| UNIT-0004 | UNIT-0001 | UNIT-0010 | fr |
| UNIT-0005 | UNIT-0001 | UNIT-0003 | hybrid |
| UNIT-0006 | UNIT-0001 | UNIT-0006 | nm |
| UNIT-0007 | UNIT-0002 | UNIT-0002 | Dimension Kind 07 |
| UNIT-0008 | UNIT-0002 | UNIT-0008 | Encoding 08 |

The practical consequence of this architecture is that any query seeking to reconstruct the full attribute profile of an entity must traverse from the entity table through the attribute registry and then into the appropriate value table based on the declared attr_type. A specification identified as SPEC-0001, for instance, yields a confidence of 0.130 from val_decimal, a dimension_kind of Dimension Kind 01 from val_varchar, and a recorded_at of 2024-08-09T04:20:11 from val_datetime, each row linked by the common entity_id and resolved by the attr_id foreign key. This multi-table join is the operational cost of type-safe attribute storage, and it is the mechanism that guarantees a decimal value of 733.39 never collides with a string value of Encoding 02, even when both belong to the same entity. The design supports extensibility: new attributes can be declared in the attr table without altering any value table, and new entity types can adopt the same value table structure, as evidenced by the attestation and measurement subclasses.