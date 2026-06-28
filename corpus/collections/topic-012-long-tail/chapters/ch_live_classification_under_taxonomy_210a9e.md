---
chapter_id: ch_live_classification_under_taxonomy_210a9e
topic_id: 12
family: 03_directive_governance
cited_terms: ['classification_under_taxonomy', 'profiling_produces_profile', 'dengue_transmission_process']
model: engine-refine
---

Classification under taxonomy anchors operational and scientific metadata to governed vocabularies—EDAM Ontology, DQO Framework, LOINC Code Set, SAREK Pipeline—so that heterogeneous records (Lab Sample Category, Anomaly Detection Model, Experiment Phase Code, Telemetry Stream Type) remain comparable across pipelines, audits, and downstream analytics. Each classification instance carries a durable identifier (TAXO-0001 through TAXO-0004) that survives renaming, re-indexing, and cross-system federation; the identifier is not merely a surrogate key but the contractual handle by which entities, facts, and attribute bindings are resolved without ambiguity. Under this arrangement, taxonomy supplies the semantic frame (what kind of thing is being described), while entity supplies the instance (which particular thing within that frame), and the two must remain joinable under retention and lineage policies that treat identifier stability as a compliance primitive rather than an implementation convenience.

**t_classification_under_taxonomy**

| id | classification | under_taxonomy |
| --- | --- | --- |
| TAXO-0001 | Lab Sample Category | EDAM Ontology |
| TAXO-0002 | Anomaly Detection Model | DQO Framework |
| TAXO-0003 | Experiment Phase Code | LOINC Code Set |
| TAXO-0004 | Telemetry Stream Type | SAREK Pipeline |
| TAXO-0005 | Compliance Framework Set | ENVO Biological |
| TAXO-0006 | Experiment Phase Code | PROMISE Metrics |
| TAXO-0007 | Metadata Schema Version | SAREK Pipeline |
| TAXO-0008 | Experiment Phase Code | OMOP CDM |

**t_classification_under_taxonomy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAXO-0001 | duration_seconds | xsd:decimal |
| TAXO-0002 | end_time | xsd:dateTime |
| TAXO-0003 | exit_code | xsd:integer |
| TAXO-0004 | host_name | xsd:string |
| TAXO-0005 | log_level | xsd:string |
| TAXO-0006 | phase | xsd:string |
| TAXO-0007 | retry_count | xsd:integer |
| TAXO-0008 | scheduled_at | xsd:dateTime |

**t_classification_under_taxonomy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0003 | 123 |
| TAXO-0002 | TAXO-0001 | TAXO-0007 | 306 |
| TAXO-0003 | TAXO-0002 | TAXO-0003 | 682 |
| TAXO-0004 | TAXO-0002 | TAXO-0007 | 349 |
| TAXO-0005 | TAXO-0003 | TAXO-0003 | 409 |
| TAXO-0006 | TAXO-0003 | TAXO-0007 | 189 |
| TAXO-0007 | TAXO-0004 | TAXO-0003 | 329 |
| TAXO-0008 | TAXO-0004 | TAXO-0007 | 345 |

Attributes declare what may be said about a classified entity, and attr_type constrains how it may be said. A duration_seconds property typed as xsd:decimal admits fractional elapsed time suitable for instrument runs and batch profiling; end_time as xsd:dateTime fixes wall-clock boundaries such as 2024-03-16T10:40:44 or 2023-01-11T10:30:50; exit_code as xsd:integer encodes discrete termination semantics; host_name as xsd:string carries execution context (e.g., worker-07). Separating attr from attr_type enforces validation at ingest and prevents silent coercion—decimal durations are not stored as unparsed strings, and integer exit codes are not conflated with categorical labels. In practice, attr definitions function as a controlled extension mechanism: new observables enter the model by registration under an existing taxonomy node, not by ad hoc column addition, which preserves schema stability while permitting domain growth.

Entity–attribute–value storage materializes observations against those registered attrs without widening core tables for every new measurable. An entity_id (commonly aligned to a taxonomy identifier such as TAXO-0001) paired with an attr_id selects the slot; the value—held under misc in typed value stores—records the assertion itself: 4845.29 seconds of elapsed time, exit_code 123, host_name worker-07, phase label initiation, or status superseded. Partitioning values by type (decimal, integer, datetime, varchar) mirrors attr_type and keeps predicates index-friendly; misc therefore denotes the payload of the assertion, whether a numeric measure, a timestamp, or a free-form descriptor, while entity and attr jointly locate that payload in semantic space. Where multiple attrs attach to one entity—as when TAXO-0001 simultaneously carries duration_seconds, end_time, host_name, and a varchar status—the model expresses a compound characterization suitable for QC review, without collapsing distinct dimensions into a single overloaded field.

**t_classification_under_taxonomy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0002 | 2024-03-16T10:40:44 |
| TAXO-0002 | TAXO-0001 | TAXO-0008 | 2023-03-15T13:57:05 |
| TAXO-0003 | TAXO-0001 | TAXO-0009 | 2024-10-13T12:06:31 |
| TAXO-0004 | TAXO-0002 | TAXO-0002 | 2023-01-11T10:30:50 |
| TAXO-0005 | TAXO-0002 | TAXO-0008 | 2025-05-19T08:08:31 |
| TAXO-0006 | TAXO-0002 | TAXO-0009 | 2025-04-05T18:33:08 |
| TAXO-0007 | TAXO-0003 | TAXO-0002 | 2024-01-05T08:57:44 |
| TAXO-0008 | TAXO-0003 | TAXO-0008 | 2024-10-15T05:44:13 |

**t_classification_under_taxonomy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0001 | 4845.29 |
| TAXO-0002 | TAXO-0002 | TAXO-0001 | 4012.23 |
| TAXO-0003 | TAXO-0003 | TAXO-0001 | 5805.70 |
| TAXO-0004 | TAXO-0004 | TAXO-0001 | 852.80 |
| TAXO-0005 | TAXO-0005 | TAXO-0001 | 5949.40 |
| TAXO-0006 | TAXO-0006 | TAXO-0001 | 1054.63 |
| TAXO-0007 | TAXO-0007 | TAXO-0001 | 5765.70 |
| TAXO-0008 | TAXO-0008 | TAXO-0001 | 2142.87 |

**t_classification_under_taxonomy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0004 | worker-07 |
| TAXO-0002 | TAXO-0001 | TAXO-0005 | Log Level 02 |
| TAXO-0003 | TAXO-0001 | TAXO-0006 | initiation |
| TAXO-0004 | TAXO-0001 | TAXO-0010 | superseded |
| TAXO-0005 | TAXO-0001 | TAXO-0011 | Triggered By 05 |
| TAXO-0006 | TAXO-0002 | TAXO-0004 | ingest-21 |
| TAXO-0007 | TAXO-0002 | TAXO-0005 | Log Level 07 |
| TAXO-0008 | TAXO-0002 | TAXO-0006 | review |

Profiling facts translate execution telemetry into auditable outcomes keyed by identifier (PROF-0001–PROF-0004) and linked to what they produce through produces_key references into a produces dimension. duration_seconds on the fact (6716.87, 1113.38, 2546.61, 2074.93) measures run length at the grain of the profiling event; exit (exit_code: 725, 809, 348, 827) records how the run terminated and must be interpreted alongside retry_count (209, 186, 303, 264) to distinguish benign retries from hard failures. The produces side—Produces Label 01–04 grouped under Produces Category 01–04—supplies human-readable misc labels and category rollups for reporting; repeated produces_key values (e.g., PROF-0004 appearing twice) indicate multiple profiling events contributing to the same output artifact, which matters for throughput accounting and duplicate-run detection. Category on dimension rows is the governance tier that clusters produces (or hosts, or vectors) for policy application, dashboard aggregation, and access control without erasing instance-level identifiers.

**fact_profiling**

| id | produces_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0001 | 6716.87 | 725 | 209 |
| PROF-0002 | PROF-0004 | 1113.38 | 809 | 186 |
| PROF-0003 | PROF-0004 | 2546.61 | 348 | 303 |
| PROF-0004 | PROF-0006 | 2074.93 | 827 | 264 |

**dim_produces**

| id | produces_label | produces_category |
| --- | --- | --- |
| PROF-0001 | Produces Label 01 | Produces Category 01 |
| PROF-0002 | Produces Label 02 | Produces Category 02 |
| PROF-0003 | Produces Label 03 | Produces Category 03 |
| PROF-0004 | Produces Label 04 | Produces Category 04 |
| PROF-0005 | Produces Label 05 | Produces Category 05 |
| PROF-0006 | Produces Label 06 | Produces Category 06 |

Epidemiological and process analytics extend the same fact–dimension discipline through involves_host and involves_vector, which tie event aggregates to host and vector populations rather than embedding labels in the fact row. fact_dengue records (PROC-0001–PROC-0004) pair involves_host_key and involves_vector_key with event_count (251, 444, 56, 167), quantifying occurrences at the intersection of host context (Involves Host Label 01–04 under Involves Host Category 01–04) and vector context (Involves Vector Label 01–04 under Involves Vector Category 01–04). The keys preserve referential integrity when labels change; misc on the dimensions holds the display strings, while category supports stratified analysis and regulatory reporting bands. event_count thus operates as the measurable outcome at a defined host–vector involvement grain, analogous to duration_seconds at the profiling grain—both are facts that must remain explainable back to stable identifiers and to the taxonomy-qualified entities they summarize.

**fact_dengue**

| id | involves_host_key | involves_vector_key | event_count |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0002 | PROC-0004 | 251 |
| PROC-0002 | PROC-0001 | PROC-0002 | 444 |
| PROC-0003 | PROC-0005 | PROC-0007 | 56 |
| PROC-0004 | PROC-0002 | PROC-0003 | 167 |
| PROC-0005 | PROC-0002 | PROC-0008 | 168 |

**dim_involves_host**

| id | involves_host_label | involves_host_category |
| --- | --- | --- |
| PROC-0001 | Involves Host Label 01 | Involves Host Category 01 |
| PROC-0002 | Involves Host Label 02 | Involves Host Category 02 |
| PROC-0003 | Involves Host Label 03 | Involves Host Category 03 |
| PROC-0004 | Involves Host Label 04 | Involves Host Category 04 |
| PROC-0005 | Involves Host Label 05 | Involves Host Category 05 |
| PROC-0006 | Involves Host Label 06 | Involves Host Category 06 |

**dim_involves_vector**

| id | involves_vector_label | involves_vector_category |
| --- | --- | --- |
| PROC-0001 | Involves Vector Label 01 | Involves Vector Category 01 |
| PROC-0002 | Involves Vector Label 02 | Involves Vector Category 02 |
| PROC-0003 | Involves Vector Label 03 | Involves Vector Category 03 |
| PROC-0004 | Involves Vector Label 04 | Involves Vector Category 04 |
| PROC-0005 | Involves Vector Label 05 | Involves Vector Category 05 |
| PROC-0006 | Involves Vector Label 06 | Involves Vector Category 06 |
| PROC-0007 | Involves Vector Label 07 | Involves Vector Category 07 |
| PROC-0008 | Involves Vector Label 08 | Involves Vector Category 08 |

Taken together, identifier, entity, attr, attr_type, misc, category, duration_seconds, exit, produces, involves_host, involves_vector, and event_count form a layered evidence model: taxonomy classifies, attrs type the permissible observations, typed value stores assert misc payloads per entity, profiling facts chronicle production runs with exit semantics, and dengue-style facts count events across host and vector dimensions. Operational maturity depends on keeping each layer joinable—TAXO identifiers binding attrs and values, PROF and PROC identifiers anchoring facts, dimension categories supplying rollup without substituting for keys—so that an auditor can move from a category-level summary to a single worker-07 run ending at 2024-03-16T10:40:44 with exit_code 725 and a traced produces artifact, or from an event_count of 444 to the specific host and vector keys that defined the aggregation window. That traceability is why these elements matter in practice: they convert loosely coupled telemetry, labels, and counts into a coherent, evidence-anchored record suitable for compliance handbook governance and repeatable operational control.