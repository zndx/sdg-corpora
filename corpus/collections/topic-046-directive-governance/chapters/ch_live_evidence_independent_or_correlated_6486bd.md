---
chapter_id: ch_live_evidence_independent_or_correlated_6486bd
topic_id: 46
family: 06_belief_structure
cited_terms: ['evidence_independent_or_correlated', 'yager_combination', 'schemaorg_person_named']
model: engine-refine
---

The identifier serves as the immutable anchor of every record, a stable key that survives the passage of time and the churn of attribute values. In the evidence registry, identifiers such as `CORR-0001` through `CORR-0004` designate individual evidence artifacts—each one a distinct provenance chain, telemetry stream, or audit trail entry. The same pattern recurs in the Yager fusion layer, where identifiers like `COMB-0001` and `COMB-0004` tag combination operations, and in the person registry, where identifiers such as `NAME-0001` through `NAME-0004` anchor named entities. An identifier is not a label to be changed; it is the reference point by which all downstream relationships resolve.

**t_evidence_independent_or_correlated**

| id | evidence | evidence_2 | evidence_3 |
| --- | --- | --- | --- |
| CORR-0001 | Provenance-Chain-Hash | Metrics-Pool-Index | Provenance-Node-Hash |
| CORR-0002 | Metrics-Cache-Ref | Provenance-Chain-Hash | Telemetry-Stream-Alpha |
| CORR-0003 | Provenance-Leaf-Node | Telemetry-Stream-Alpha | Telemetry-Stream-Alpha |
| CORR-0004 | Independent-Array-Trace | Quarterly-Audit-Trail | Governance-Verification-File |
| CORR-0005 | Independent-Sensor-Trace | Observation-Grid-Fourteen | Governance-Compliance-Report |
| CORR-0006 | Quarterly-Audit-Trail | Metrics-Bucket-Index | Correlation-Stream-Gamma |

**t_yager_combination**

| id | yager |
| --- | --- |
| COMB-0001 | FusionGateway-Nine |
| COMB-0002 | FusionNode-Alpha |
| COMB-0003 | FusionGateway-Nine |
| COMB-0004 | ProvenanceEngine-Three |
| COMB-0005 | FusionNode-Alpha |
| COMB-0006 | TelemetryOrchestrator |

**t_yager_combination_yager_combines**

| id | yager_combines |
| --- | --- |
| COMB-0001 | RadarPulse-Data |
| COMB-0002 | SpectralData-Set |
| COMB-0003 | VibrationSensor-Nine |
| COMB-0004 | RadarPulse-Data |
| COMB-0005 | LidarScan-2023 |
| COMB-0006 | TelemetryStream-Alpha |
| COMB-0007 | AcousticArray-Alpha |

**t_schemaorg_person_named**

| id | schemaorg |
| --- | --- |
| NAME-0001 | person/tim_berners_lee |
| NAME-0002 | person/alan_kay |
| NAME-0003 | person/alan_turing |
| NAME-0004 | person/john_von_neumann |
| NAME-0005 | person/donald_knuth |
| NAME-0006 | person/grace_hopper |
| NAME-0007 | person/john_von_neumann |

An attribute defines what property of an entity is being measured or described, while the attribute type constrains the shape of permissible values. The attribute catalog for evidence records declares `confidence` as an `xsd:decimal`, `dimension_kind` and `method` as `xsd:string`, and `recorded_at` as an `xsd:dateTime`. These type declarations are not cosmetic: they govern how values are stored, validated, and compared across the system. A confidence score of `0.175` or `0.415` is stored in the decimal value table, a dimension kind such as `Dimension Kind 01` or an encoding label like `Encoding 02` in the varchar table, and a timestamp such as `2024-06-09T05:47:42` in the datetime table. The type system ensures that a numeric comparison, a string lookup, and a temporal sort each operate on data of the correct semantic shape.

The entity is the thing being described—the evidence artifact, the fusion combination, the person—while the value tables are the containers that hold its attribute values. This separation of entity from value is deliberate: it allows a single entity to carry multiple attributes of different types without requiring a wide, sparse row. Entity `CORR-0001`, for instance, appears across three value tables simultaneously, carrying a decimal confidence of `0.175`, a varchar dimension kind of `Dimension Kind 01`, and a datetime recorded at `2024-06-09T05:47:42`. The entity identifier in each value row is a foreign key back to the entity, and the attribute identifier is a foreign key to the attribute definition. Together they form a composite reference that pins a value to exactly one attribute of exactly one entity.

**t_evidence_independent_or_correlated_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CORR-0001 | confidence | xsd:decimal |
| CORR-0002 | dimension_kind | xsd:string |
| CORR-0003 | method | xsd:string |
| CORR-0004 | recorded_at | xsd:dateTime |
| CORR-0005 | uncertainty | xsd:decimal |
| CORR-0006 | unit | xsd:string |
| CORR-0007 | value | xsd:decimal |
| CORR-0008 | encoding | xsd:string |

**t_evidence_independent_or_correlated_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0004 | 2024-06-09T05:47:42 |
| CORR-0002 | CORR-0002 | CORR-0004 | 2023-11-11T17:14:05 |
| CORR-0003 | CORR-0003 | CORR-0004 | 2023-01-17T16:04:18 |
| CORR-0004 | CORR-0004 | CORR-0004 | 2024-01-18T01:21:21 |
| CORR-0005 | CORR-0005 | CORR-0004 | 2025-02-19T18:21:28 |
| CORR-0006 | CORR-0006 | CORR-0004 | 2023-04-21T22:33:15 |

**t_evidence_independent_or_correlated_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0001 | 0.175 |
| CORR-0002 | CORR-0001 | CORR-0005 | 667.59 |
| CORR-0003 | CORR-0001 | CORR-0007 | 420.06 |
| CORR-0004 | CORR-0002 | CORR-0001 | 0.415 |
| CORR-0005 | CORR-0002 | CORR-0005 | 386.38 |
| CORR-0006 | CORR-0002 | CORR-0007 | 519.11 |
| CORR-0007 | CORR-0003 | CORR-0001 | 0.685 |
| CORR-0008 | CORR-0003 | CORR-0005 | 275.29 |

**t_evidence_independent_or_correlated_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0002 | Dimension Kind 01 |
| CORR-0002 | CORR-0001 | CORR-0008 | Encoding 02 |
| CORR-0003 | CORR-0001 | CORR-0009 | intake form |
| CORR-0004 | CORR-0001 | CORR-0010 | en |
| CORR-0005 | CORR-0001 | CORR-0003 | hybrid |
| CORR-0006 | CORR-0001 | CORR-0006 | kg |
| CORR-0007 | CORR-0002 | CORR-0002 | Dimension Kind 07 |
| CORR-0008 | CORR-0002 | CORR-0008 | Encoding 08 |

The junction tables introduce the role as the third dimension of a relationship, transforming a simple many-to-many link into a typed association. In the Yager fusion layer, the junction between `t_yager_combination` and `t_yager_combination_yager_combines` carries a role column that distinguishes whether a data source acts as `observer`, `contributor`, or `owner` of the fusion. Combination `COMB-0001` links to `RadarPulse-Data` with the role `owner`, while `COMB-0003` links to `VibrationSensor-Nine` with the role `contributor`. The same pattern appears in the person registry, where the junction between `t_schemaorg_person_named` and `t_schemaorg_person_named_full_name` assigns roles such as `owner` and `reviewer` to the relationship between a person entity and a full name. The role column is what turns a bare foreign-key pair into a semantically rich assertion about how two entities relate.

**t_schemaorg_person_named_full_name**

| id | full_name |
| --- | --- |
| NAME-0001 | Grace Hopper |
| NAME-0002 | Donald Knuth |
| NAME-0003 | John von Neumann |
| NAME-0004 | Grace Hopper |
| NAME-0005 | Ada Lovelace |
| NAME-0006 | Alan Kay |

The subject and target columns in these junction tables are the directional endpoints of the relationship. The subject is the entity that initiates or owns the association—the Yager combination, the schema.org person—while the target is the entity that is being related to—the data source, the full name. In the Yager junction, `yager_id` points to `COMB-0003` as the subject and `yager_combines_id` points to `COMB-0006` as the target, with the role `observer` describing the nature of the link. In the person junction, `schemaorg_id` points to `NAME-0003` as the subject and `full_name_id` points to `NAME-0002` as the target, with the role `reviewer` describing the link. The subject-target distinction is not merely syntactic; it encodes directionality that matters for traversal, for permission checks, and for audit trails.

**t_yager_combination__yager_combines**

| id | yager_id | yager_combines_id | role |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0003 | COMB-0006 | observer |
| COMB-0002 | COMB-0006 | COMB-0004 | contributor |
| COMB-0003 | COMB-0006 | COMB-0007 | contributor |
| COMB-0004 | COMB-0001 | COMB-0003 | owner |
| COMB-0005 | COMB-0002 | COMB-0002 | reviewer |
| COMB-0006 | COMB-0006 | COMB-0005 | observer |
| COMB-0007 | COMB-0002 | COMB-0004 | contributor |
| COMB-0008 | COMB-0004 | COMB-0005 | observer |

**t_schemaorg_person_named__full_name**

| id | schemaorg_id | full_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0003 | NAME-0002 | owner |
| NAME-0002 | NAME-0004 | NAME-0003 | observer |
| NAME-0003 | NAME-0003 | NAME-0002 | reviewer |
| NAME-0004 | NAME-0005 | NAME-0002 | owner |
| NAME-0005 | NAME-0003 | NAME-0001 | contributor |
| NAME-0006 | NAME-0007 | NAME-0005 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | observer |
| NAME-0008 | NAME-0006 | NAME-0005 | owner |

Miscellaneous columns—such as the `evidence`, `evidence_2`, and `evidence_3` fields in the evidence table, or the `yager` and `schemaorg` columns in their respective registries—hold the primary descriptive content of the entity itself. These are the values that answer the question "what is this?" at the entity level, before any attributes are layered on. An evidence record might carry `Provenance-Chain-Hash` in its primary evidence column and `Metrics-Pool-Index` in its secondary, while a Yager combination might carry `FusionGateway-Nine` as its operational label, and a person entity might carry `person/alan_turing` as its schema.org identifier. These columns are the entity's core identity; the attribute-value tables are the metadata that describe it.