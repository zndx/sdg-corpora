---
chapter_id: ch_live_shell_dimension_specification_ccd263
topic_id: 186
family: 08_derived
cited_terms: ['shell_dimension_specification', 'dataset_at_version', 'attribute_set_supports_outlier_claim']
model: engine-refine
---

Shell dimension specifications anchor how dimensional metadata is named, typed, and governed across a compliance-oriented data environment. A **shelldimensionspecification** is not merely a label but a durable semantic anchor: it identifies a particular dimensional context—such as *Venus_venerupis_Mediterranean*, *Cypraea_tigris_Asian*, *Littorina_obtusa_Urban*, or *Strombus_gigas_Tropical*—under which measurements, encodings, and provenance claims must be interpreted consistently. Without such anchors, downstream validation, lineage tracing, and cross-dataset reconciliation collapse into ad hoc string matching. Specifications therefore function as first-class entities in the governance model: each receives a stable **identifier** (for example `SPEC-0001` through `SPEC-0004`) that survives renaming, re-indexing, and schema evolution, allowing auditors and integrators to refer to the same logical object even when its human-readable name or storage location changes.

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

Attributes (**attr**) extend entities with structured, queryable properties rather than bloating core records with nullable columns for every conceivable facet. In practice, a specification may carry **confidence** (a quantitative score), **dimension_kind** (a categorical classifier), **method** (how the dimension was derived), and **recorded_at** (when the assertion was captured). Each attribute is registered with an **attr_type** drawn from a controlled vocabulary—`xsd:decimal`, `xsd:string`, or `xsd:dateTime`—which is not decorative typing but an enforcement contract: it dictates storage semantics, comparison rules, serialization boundaries, and which validation pipeline applies. A confidence value of `0.130` for one Mediterranean Venus record and `0.624` for an Asian Cypraea record are comparable decimals; a **recorded_at** of `2024-08-09T04:20:11` or `2025-04-30T10:31:45` must round-trip as ISO-8601 datetimes without silent truncation. Separating attribute definition from attribute value is what keeps the model extensible: new attributes can be introduced without migrating entity tables, provided their types are declared before values are admitted.

The **entity** is the thing being described; the **misc** field (in operational terms, the stored **value**) is what is said about it. Values are not hung directly on entity rows but resolved through entity–attribute bindings: an **entity** reference such as `SPEC-0001` paired with an **attr** reference such as `SPEC-0004` (here, `recorded_at`) yields a concrete assertion. Typed value stores honor **attr_type**: decimals hold measurements like `733.39` and `125.34`; varchar holds lexical tokens such as `Dimension Kind 01`, `Encoding 02`, `nightly summary`, or locale markers like `ja`; datetime tables isolate temporal facts so timezone and precision policies can be applied uniformly. This pattern matters in compliance work because it localizes evidence: an auditor can enumerate every decimal assertion on `SPEC-0001`, every string annotation, and every timestamp without scanning unrelated columns, and can reject values that violate declared types before they enter authoritative registries.

Directed associations introduce **subject**, **target**, and **role** as the vocabulary for relationship governance rather than flat foreign keys alone. A **subject** is the node from which a relationship is asserted; a **target** is the node it points to; **role** qualifies the semantic force of that edge. Dataset versioning illustrates why this triplet is necessary: a dataset at version may link to another versioned artifact—`VERS-0004` relating to `VERS-0002`, or `VERS-0002` to `VERS-0001`—but the same pair of identifiers could mean ownership, contribution, or review depending on **role**. When `VERS-0002` bears **role** `owner` toward `VERS-0001` while another edge marks `contributor` or `reviewer`, access control, attribution, and change-approval workflows can be derived from the graph without inferring intent from table names. The same structure appears where attribute sets **support** outlier claims: an attribute such as *geolocation accuracy* or *sensor calibration* is the **subject**, a supporting system such as an *Ontology registry* or *PostgreSQL instance* is the **target**, and **role** again distinguishes whether that support is ownership, contribution, or another governed stance. Treating support as typed edges—not implicit co-location—makes evidentiary chains legible under scrutiny.

**t_dataset_at_version**

| id | dataset |
| --- | --- |
| VERS-0001 | Landsat-8-OLI |
| VERS-0002 | UrbanAirQuality |
| VERS-0003 | Landsat-8-OLI |
| VERS-0004 | ATLAS-ICU-Cohort |
| VERS-0005 | SatelliteTelemetryRaw |
| VERS-0006 | GeospatialRoadNetwork |

**t_dataset_at_version_at_dataset_version**

| id | at_dataset_version |
| --- | --- |
| VERS-0001 | v3.0.0-stable |
| VERS-0002 | release-2023-Q4 |
| VERS-0003 | build-4491 |
| VERS-0004 | v2.1.0 |
| VERS-0005 | build-4491 |
| VERS-0006 | release-2023-Q4 |
| VERS-0007 | v2.1.0 |
| VERS-0008 | v2.1.0 |

**t_dataset_at_version__at_dataset_version**

| id | dataset_id | at_dataset_version_id | role |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0004 | VERS-0002 | contributor |
| VERS-0002 | VERS-0002 | VERS-0001 | owner |
| VERS-0003 | VERS-0005 | VERS-0001 | reviewer |
| VERS-0004 | VERS-0001 | VERS-0004 | contributor |
| VERS-0005 | VERS-0005 | VERS-0007 | owner |
| VERS-0006 | VERS-0002 | VERS-0007 | reviewer |
| VERS-0007 | VERS-0003 | VERS-0003 | reviewer |
| VERS-0008 | VERS-0003 | VERS-0002 | owner |

**t_attribute_set_supports_outlier_claim**

| id | attribute |
| --- | --- |
| CLAI-0001 | source system ID |
| CLAI-0002 | validation rule |
| CLAI-0003 | geolocation accuracy |
| CLAI-0004 | sensor calibration |
| CLAI-0005 | source system ID |
| CLAI-0006 | validation rule |

**t_attribute_set_supports_outlier_claim_supports**

| id | supports |
| --- | --- |
| CLAI-0001 | API gateway |
| CLAI-0002 | PostgreSQL instance |
| CLAI-0003 | Ontology registry |
| CLAI-0004 | Ontology registry |
| CLAI-0005 | Storage volume |
| CLAI-0006 | Storage volume |

**t_attribute_set_supports_outlier_claim__supports**

| id | attribute_id | supports_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | contributor |
| CLAI-0002 | CLAI-0005 | CLAI-0002 | contributor |
| CLAI-0003 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0004 | CLAI-0005 | CLAI-0005 | contributor |
| CLAI-0005 | CLAI-0006 | CLAI-0001 | owner |
| CLAI-0006 | CLAI-0004 | CLAI-0002 | contributor |
| CLAI-0007 | CLAI-0001 | CLAI-0004 | reviewer |
| CLAI-0008 | CLAI-0001 | CLAI-0002 | contributor |

**Identifier** discipline threads through every layer and is the practical precondition for auditability. Identifiers like `SPEC-0001`, `VERS-0003`, or `CLAI-0005` are opaque, immutable handles; they decouple reference from display strings such as `Landsat-8-OLI`, `release-2023-Q4`, or *validation rule*. In operations, identifiers enable idempotent ingestion (the same `SPEC-0003` row cannot be duplicated without detection), cross-table joins that survive refactors, and diff reports that state precisely which entity–attribute pairs changed between compliance snapshots. Teams that conflate identifiers with labels—using `UrbanAirQuality` where `VERS-0002` is required—invite drift: a renamed dataset breaks joins, a retyped attribute orphans values, and role edges attach to the wrong governance principal.

Taken together, shelldimensionspecification entities, typed attributes, partitioned values, and subject–target–role graphs form a coherent governance grammar. Specifications name the context; **attr** and **attr_type** declare what may be said and how it must be encoded; **entity** and **misc** bind assertions to evidence; **identifier** stabilizes reference across time; and **subject**, **target**, and **role** articulate who and what stands in which relationship to whom. Operators who internalize this grammar can onboard new measurement programs—adding a tropical Strombus profile, wiring a new Landsat build, or registering an outlier claim backed by an API gateway—without breaking validation or obscuring lineage, because every new fact extends the same typed, identifiable, and relationally qualified fabric rather than inventing a parallel convention.

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