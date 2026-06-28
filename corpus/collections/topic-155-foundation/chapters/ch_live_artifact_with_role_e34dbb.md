---
chapter_id: ch_live_artifact_with_role_e34dbb
topic_id: 155
family: 01_foundation
cited_terms: ['artifact_with_role', 'instrument_with_function', 'constraint_with_predicate']
model: engine-refine
---

Identifiers serve as the immutable anchors of any governed data ecosystem, uniquely distinguishing every entity from its peers regardless of the semantic domain it inhabits. An identifier such as `ROLE-0001` or `FUNC-0001` is not merely a label but a stable reference point that persists across the lifecycle of the object it denotes, whether that object is a patient cohort dataset or a Keysight DSOX3024T oscilloscope. The entity to which an identifier is bound may carry a human-readable name—`patient-cohorts-2023`, `Thermo Q Exactive`, `Zygo NewView`—but it is the identifier that guarantees unambiguous resolution in queries, audits, and cross-referential lookups. This separation of identity from nomenclature is essential: names change, instruments get replaced, datasets are renamed, yet the identifier remains the single source of truth that binds all associated metadata, constraints, and relationships to the correct object.

Attributes and their declared types constitute the mechanism by which entities acquire descriptive properties in a type-safe manner. The attribute definition itself—captured by an `attr_name` such as `checksum`, `created_date`, or `license` and an `attr_type` such as `xsd:string`, `xsd:date`, or `cco:DesignativeICE`—establishes a schema that constrains what values are admissible. When a value is assigned to an attribute of a given entity, it is stored in a value table whose column type corresponds to the declared attribute type: date values like `2024-09-19` or `2023-09-07` reside in the date-value store, integer values such as `359` or `439` in the integer-value store, and free-form strings like `a3f9c21e`, `MPL-2.0`, or `us-east-1` in the varchar-value store. This type-dispatched storage pattern ensures that a checksum value is never conflated with a license identifier, and that date comparisons remain semantically valid. The `attr_type` column, in particular, encodes the data model's commitment to schema enforcement at the point of value assignment rather than at query time.

**t_instrument_with_function_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | checksum | xsd:string |
| FUNC-0002 | created_date | xsd:date |
| FUNC-0003 | identifier | cco:DesignativeICE |
| FUNC-0004 | license | xsd:string |
| FUNC-0005 | mime_type | xsd:string |
| FUNC-0006 | size_bytes | xsd:long |
| FUNC-0007 | uri | xsd:string |
| FUNC-0008 | version | xsd:integer |

**t_instrument_with_function_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | 2024-09-19 |
| FUNC-0002 | FUNC-0002 | FUNC-0002 | 2023-09-07 |
| FUNC-0003 | FUNC-0003 | FUNC-0002 | 2024-09-12 |
| FUNC-0004 | FUNC-0004 | FUNC-0002 | 2024-08-15 |
| FUNC-0005 | FUNC-0005 | FUNC-0002 | 2025-05-20 |
| FUNC-0006 | FUNC-0006 | FUNC-0002 | 2023-09-16 |

**t_instrument_with_function_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0006 | 359 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | 4 |
| FUNC-0003 | FUNC-0002 | FUNC-0006 | 439 |
| FUNC-0004 | FUNC-0002 | FUNC-0008 | 6 |
| FUNC-0005 | FUNC-0003 | FUNC-0006 | 255 |
| FUNC-0006 | FUNC-0003 | FUNC-0008 | 10 |
| FUNC-0007 | FUNC-0004 | FUNC-0006 | 467 |
| FUNC-0008 | FUNC-0004 | FUNC-0008 | 3 |

**t_instrument_with_function_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | a3f9c21e |
| FUNC-0002 | FUNC-0001 | FUNC-0003 | ref-8842 |
| FUNC-0003 | FUNC-0001 | FUNC-0004 | MPL-2.0 |
| FUNC-0004 | FUNC-0001 | FUNC-0009 | us-east-1 |
| FUNC-0005 | FUNC-0001 | FUNC-0005 | text/plain |
| FUNC-0006 | FUNC-0001 | FUNC-0010 | Name 06 |
| FUNC-0007 | FUNC-0001 | FUNC-0011 | sre |
| FUNC-0008 | FUNC-0001 | FUNC-0012 | Tags 08 |

Checksums and size metrics provide the quantitative controls necessary for data integrity and capacity planning. A checksum such as `5e8f3c91` or `a3f9c21e` is a cryptographic fingerprint of an artifact's contents, enabling verification that the data stored at rest has not been corrupted or tampered with since ingestion. In the artifact registry, each entry carries both its checksum and its `size_bytes`—values like `666903238` bytes for one patient cohort and `29914871` bytes for a feature-store cache—allowing operators to track storage consumption and to detect anomalies in file growth. The checksum is itself an attribute of type `xsd:string` when stored as metadata, but its semantic role is distinct: it is not descriptive metadata but a verification primitive. An artifact identified as `patient-cohorts-2023` may appear in multiple rows with different roles (`PRED-0007` and `PRED-0006`) and different checksums (`5e8f3c91` and `7b14de08`), reflecting that the same logical dataset can be materialized in different forms, each with its own integrity hash and byte count.

**t_artifact_with_role**

| id | artifact | role | checksum | size_bytes |
| --- | --- | --- | --- | --- |
| ROLE-0001 | patient-cohorts-2023 | PRED-0007 | 5e8f3c91 | 666903238 |
| ROLE-0002 | patient-cohorts-2023 | PRED-0006 | 7b14de08 | 309925726 |
| ROLE-0003 | feature-store-cache | PRED-0001 | a3f9c21e | 29914871 |
| ROLE-0004 | feature-store-cache | PRED-0001 | 9d2b7a16 | 347040623 |

Constraints and predicates formalize the governance rules that artifacts and instruments must satisfy. A constraint such as `Log retention mandate`, `Quality assurance protocol`, `Authentication requirement`, or `Max latency threshold` expresses a policy obligation, while a predicate such as `authRequirement`, `unitSpecification`, or `checksumValidation` specifies the technical mechanism by which that obligation is enforced. The relationship between a constraint and its predicate is mediated by a role—`owner`, `contributor`, or `observer`—that clarifies the nature of the dependency. In the constraint-predicate linkage table, the `constraint_id` column (the subject) and the `predicate_id` column (the target) form a directed edge annotated with the role, making explicit whether the predicate is the primary enforcement mechanism (owner), a supporting control (contributor), or an informational dependency (observer). For example, the constraint `Authentication requirement` is linked to the predicate `authRequirement` with the role `owner`, while the constraint `Max latency threshold` is linked to the same predicate with the role `contributor`, indicating that authentication is both the primary and a supporting control for different governance objectives.

**t_constraint_with_predicate**

| id | constraint |
| --- | --- |
| PRED-0001 | Log retention mandate |
| PRED-0002 | Quality assurance protocol |
| PRED-0003 | Authentication requirement |
| PRED-0004 | Max latency threshold |
| PRED-0005 | Access control directive |
| PRED-0006 | Max latency threshold |
| PRED-0007 | Data retention policy |
| PRED-0008 | Authentication requirement |

**t_constraint_with_predicate_predicate**

| id | predicate |
| --- | --- |
| PRED-0001 | authRequirement |
| PRED-0002 | authRequirement |
| PRED-0003 | unitSpecification |
| PRED-0004 | checksumValidation |
| PRED-0005 | targetDataset |
| PRED-0006 | formatRule |

**t_constraint_with_predicate__predicate**

| id | constraint_id | predicate_id | role |
| --- | --- | --- | --- |
| PRED-0001 | PRED-0003 | PRED-0001 | owner |
| PRED-0002 | PRED-0005 | PRED-0003 | observer |
| PRED-0003 | PRED-0004 | PRED-0002 | contributor |
| PRED-0004 | PRED-0007 | PRED-0001 | contributor |
| PRED-0005 | PRED-0008 | PRED-0001 | reviewer |
| PRED-0006 | PRED-0002 | PRED-0003 | reviewer |
| PRED-0007 | PRED-0006 | PRED-0002 | reviewer |
| PRED-0008 | PRED-0001 | PRED-0005 | observer |

The instrument-function mapping table bridges the physical and logical layers of the data estate by declaring which instrument realizes which function. A Keysight DSOX3024T realizes function `PRED-0004`, a Thermo Q Exactive realizes `PRED-0003`, and an Agilent 5975C realizes `PRED-0001`. These functions, in turn, appear as roles on artifacts: the artifact `feature-store-cache` is associated with role `PRED-0001` in two distinct materializations, each with its own checksum (`a3f9c21e` and `9d2b7a16`) and size (`29914871` and `347040623` bytes). This cross-referencing—where an instrument's realized function becomes the role that an artifact is assigned—creates a traceability chain from physical equipment through logical function to data artifact, enabling auditors to answer questions such as which instrument validated the checksum of a given patient cohort, or whether a feature-store cache was produced under the quality assurance protocol enforced by a Zygo NewView interferometer.

**t_instrument_with_function**

| id | instrument | realizes_function |
| --- | --- | --- |
| FUNC-0001 | Keysight DSOX3024T | PRED-0004 |
| FUNC-0002 | Thermo Q Exactive | PRED-0003 |
| FUNC-0003 | Zygo NewView | PRED-0003 |
| FUNC-0004 | Agilent 5975C | PRED-0001 |
| FUNC-0005 | Agilent 5975C | PRED-0002 |
| FUNC-0006 | Agilent 5975C | PRED-0007 |