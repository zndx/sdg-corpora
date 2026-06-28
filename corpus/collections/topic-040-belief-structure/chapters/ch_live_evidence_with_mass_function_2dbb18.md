---
chapter_id: ch_live_evidence_with_mass_function_2dbb18
topic_id: 40
family: 06_belief_structure
cited_terms: ['evidence_with_mass_function', 'claim_not_disconfirmed', 'mass_function_with_normalization']
model: engine-refine
---

The architecture of evidence management rests upon a disciplined separation between what is asserted, how it is characterized, and the concrete values that instantiate those characterizations. Each evidentiary record—identified by a stable key such as `FUNC-0001` or `FUNC-0004`—carries a `dimension_kind` that anchors the evidence to a physical or operational domain: pressure, temperature, mass. The `method` column records the provenance of the assessment, distinguishing between `automated` acquisition, `inferred` derivation, and `hybrid` approaches that combine both. A `provenance trace log` or `calibration certificate` is not merely a label; it is the primary evidence payload, paired with a `mass_function` specification—whether a `Gaussian distribution`, a `calibration curve`, or a `normalized weight vector`—that quantifies the degree of belief assigned to the claim. This triad of identifier, dimension, and method forms the irreducible unit of traceability, ensuring that every assertion can be traced back to its measurement context and processing lineage.

**t_evidence_with_mass_function**

| id | evidence | mass_function | dimension_kind | method |
| --- | --- | --- | --- | --- |
| FUNC-0001 | provenance trace log | Gaussian distribution | pressure | automated |
| FUNC-0002 | calibration certificate | calibration curve | temperature | automated |
| FUNC-0003 | telemetry dump | normalized weight vector | mass | inferred |
| FUNC-0004 | signal capture data | Gaussian distribution | mass | hybrid |
| FUNC-0005 | system event record | posterior distribution | length | automated |

**t_claim_not_disconfirmed**

| id | claim | claim_2 |
| --- | --- | --- |
| DISC-0001 | redundancy failover successful | data pipeline stalled |
| DISC-0002 | secondary sensor aligned | latency under SLA bounds |
| DISC-0003 | firmware version outdated | threshold limits expanded |
| DISC-0004 | thermal monitoring active | secondary sensor aligned |
| DISC-0005 | firmware version outdated | network latency spike unexplained |
| DISC-0006 | temperature sensor offline | redundancy failover successful |
| DISC-0007 | latency under SLA bounds | network latency spike unexplained |

**t_mass_function_with_normalization**

| id | mass | normalization_constant |
| --- | --- | --- |
| NORM-0001 | Rotor-Assembly-M | Offset-0.02 |
| NORM-0002 | Batch-7721 | 0.982-scaling |
| NORM-0003 | Core-Segment-12 | 0.982-scaling |
| NORM-0004 | Dust-Collection-1 | Offset-0.02 |
| NORM-0005 | Powder-Grade-B | Baseline-0.75 |
| NORM-0006 | Rotor-Assembly-M | 0.982-scaling |

Attributes are not embedded within the entity records themselves but are declared separately, in a schema that maps `attr_name` to an `attr_type` drawn from the XML Schema namespace: `xsd:decimal` for numeric confidence scores, `xsd:string` for categorical labels such as `dimension_kind` or `method`, and `xsd:dateTime` for temporal stamps. This declaration layer—where an attribute named `confidence` is formally typed as `xsd:decimal` and an attribute named `recorded_at` as `xsd:dateTime`—establishes the contract between the data model and the values that will populate it. The separation of attribute declaration from attribute instantiation means that the schema can evolve independently of the data: new attributes can be introduced without altering existing records, and type constraints are enforced at query time rather than at ingestion.

The instantiation of attributes follows an Entity-Attribute-Value pattern, where each value is stored in a type-specific table keyed by the entity it belongs to and the attribute it populates. For a claim identified as `DISC-0001`, the `confidence` attribute might resolve to `0.145` in the decimal values table, while the same entity's `recorded_at` attribute resolves to `2023-08-09T14:45:08` in the datetime table, and its `dimension_kind` resolves to `Dimension Kind 01` in the varchar table. The entity identifier—`DISC-0001`—serves as the join key across these three value tables, reconstructing the full attribute set for any given entity through a controlled fan-out. This design avoids the null proliferation of wide relational tables while preserving type safety: a decimal value of `669.01` and a string value of `Encoding 02` coexist within the same entity without type coercion, each residing in its own typed store.

**t_claim_not_disconfirmed_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DISC-0001 | confidence | xsd:decimal |
| DISC-0002 | dimension_kind | xsd:string |
| DISC-0003 | method | xsd:string |
| DISC-0004 | recorded_at | xsd:dateTime |
| DISC-0005 | uncertainty | xsd:decimal |
| DISC-0006 | unit | xsd:string |
| DISC-0007 | value | xsd:decimal |
| DISC-0008 | encoding | xsd:string |

**t_claim_not_disconfirmed_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0004 | 2023-08-09T14:45:08 |
| DISC-0002 | DISC-0002 | DISC-0004 | 2023-07-14T01:11:42 |
| DISC-0003 | DISC-0003 | DISC-0004 | 2023-07-27T10:01:23 |
| DISC-0004 | DISC-0004 | DISC-0004 | 2024-07-11T23:49:48 |
| DISC-0005 | DISC-0005 | DISC-0004 | 2024-06-18T23:43:54 |
| DISC-0006 | DISC-0006 | DISC-0004 | 2023-11-25T07:03:11 |
| DISC-0007 | DISC-0007 | DISC-0004 | 2025-06-11T19:52:01 |

**t_claim_not_disconfirmed_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0001 | 0.145 |
| DISC-0002 | DISC-0001 | DISC-0005 | 669.01 |
| DISC-0003 | DISC-0001 | DISC-0007 | 65.74 |
| DISC-0004 | DISC-0002 | DISC-0001 | 0.678 |
| DISC-0005 | DISC-0002 | DISC-0005 | 525.06 |
| DISC-0006 | DISC-0002 | DISC-0007 | 361.13 |
| DISC-0007 | DISC-0003 | DISC-0001 | 0.813 |
| DISC-0008 | DISC-0003 | DISC-0005 | 578.57 |

**t_claim_not_disconfirmed_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DISC-0001 | DISC-0001 | DISC-0002 | Dimension Kind 01 |
| DISC-0002 | DISC-0001 | DISC-0008 | Encoding 02 |
| DISC-0003 | DISC-0001 | DISC-0009 | intake form |
| DISC-0004 | DISC-0001 | DISC-0010 | ja |
| DISC-0005 | DISC-0001 | DISC-0003 | hybrid |
| DISC-0006 | DISC-0001 | DISC-0006 | mg/L |
| DISC-0007 | DISC-0002 | DISC-0002 | Dimension Kind 07 |
| DISC-0008 | DISC-0002 | DISC-0008 | Encoding 08 |

**t_mass_function_with_normalization_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0004 | 2024-12-04T17:58:43 |
| NORM-0002 | NORM-0002 | NORM-0004 | 2023-02-03T12:29:30 |
| NORM-0003 | NORM-0003 | NORM-0004 | 2024-03-08T15:41:30 |
| NORM-0004 | NORM-0004 | NORM-0004 | 2023-01-16T04:53:31 |
| NORM-0005 | NORM-0005 | NORM-0004 | 2023-05-04T19:41:54 |
| NORM-0006 | NORM-0006 | NORM-0004 | 2025-01-09T01:34:48 |

**t_mass_function_with_normalization_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0001 | 0.715 |
| NORM-0002 | NORM-0001 | NORM-0005 | 279.33 |
| NORM-0003 | NORM-0001 | NORM-0007 | 243.08 |
| NORM-0004 | NORM-0002 | NORM-0001 | 0.608 |
| NORM-0005 | NORM-0002 | NORM-0005 | 643.66 |
| NORM-0006 | NORM-0002 | NORM-0007 | 319.15 |
| NORM-0007 | NORM-0003 | NORM-0001 | 0.596 |
| NORM-0008 | NORM-0003 | NORM-0005 | 676.31 |

**t_mass_function_with_normalization_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| NORM-0001 | NORM-0001 | NORM-0002 | Dimension Kind 01 |
| NORM-0002 | NORM-0001 | NORM-0008 | Encoding 02 |
| NORM-0003 | NORM-0001 | NORM-0009 | nightly summary |
| NORM-0004 | NORM-0001 | NORM-0010 | ja |
| NORM-0005 | NORM-0001 | NORM-0003 | manual |
| NORM-0006 | NORM-0001 | NORM-0006 | count |
| NORM-0007 | NORM-0002 | NORM-0002 | Dimension Kind 07 |
| NORM-0008 | NORM-0002 | NORM-0008 | Encoding 08 |

The normalization of mass functions introduces a parallel attribute structure, where entities such as `NORM-0001` carry their own confidence scores (`0.715`), dimensional classifications (`Dimension Kind 01`), and temporal metadata (`2024-12-04T17:58:43`). The mass values themselves—`Rotor-Assembly-M`, `Batch-7721`, `Core-Segment-12`, `Dust-Collection-1`—are paired with normalization constants such as `Offset-0.02` or `0.982-scaling`, which adjust the belief distribution to account for systematic bias or scaling artifacts. The attribute declaration for these normalization entities mirrors that of the claim entities: the same four attributes (`confidence`, `dimension_kind`, `method`, `recorded_at`) appear with identical types, enabling a unified query interface across evidence and normalization layers. This structural symmetry is not incidental; it ensures that the confidence assigned to a normalized mass function can be directly compared with the confidence assigned to a raw claim, supporting audit trails that span the full pipeline from raw telemetry dump to final assessment.

**t_mass_function_with_normalization_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| NORM-0001 | confidence | xsd:decimal |
| NORM-0002 | dimension_kind | xsd:string |
| NORM-0003 | method | xsd:string |
| NORM-0004 | recorded_at | xsd:dateTime |
| NORM-0005 | uncertainty | xsd:decimal |
| NORM-0006 | unit | xsd:string |
| NORM-0007 | value | xsd:decimal |
| NORM-0008 | encoding | xsd:string |

The practical consequence of this architecture is that every claim—whether `redundancy failover successful` or `firmware version outdated`—carries with it a complete provenance envelope: a numeric confidence, a dimensional classification, a processing method, and a precise timestamp. The `claim_2` column captures the counterfactual or the correlated state: `data pipeline stalled` alongside `redundancy failover successful`, `secondary sensor aligned` alongside `thermal monitoring active`. These paired claims are not merely descriptive; they encode the logical structure of disconfirmation, where the truth of one claim is evaluated against the state of another. The attribute values that populate this structure are not free-form text but typed, indexed, and queryable, enabling precise retrieval of all claims with confidence above a threshold, or all evidence recorded within a specific temporal window, or all mass functions associated with a particular dimension kind. The system thus achieves both the flexibility of a schema-on-read model and the rigor of a schema-enforced one.