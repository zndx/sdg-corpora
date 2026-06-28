---
chapter_id: ch_live_entity_type_belongs_to_6372db
topic_id: 109
family: 07_long_tail
cited_terms: ['entity_type_belongs_to', 'mass_function_with_normalization', 'census_data_collection_process']
model: engine-refine
---

Entity is the durable object of record around which governance, lineage, and operational evidence are organized: a named participant in a typed relationship, such as edge_gateway_12, sensor_node_47, or governance_policy_fin, each bound to a normalization context through a belongs-to assertion that states what kind of mass function or policy frame the instance is interpreted under. Identifier supplies the stable surrogate that makes such bindings auditable across stores and revisions; BELO-0001 through BELO-0004 and NORM-0001 through NORM-0004 are not decorative labels but join keys that let reviewers trace the same logical fact from its membership row to its attribute declarations and, ultimately, to the evidentiary payloads that substantiate it. In parallel, mass-function records—Rotor-Assembly-M, Batch-7721, Core-Segment-12, Dust-Collection-1—carry their own identifiers and point to normalization constants (BELO-0006, BELO-0007), so that quantitative treatment of physical or procedural mass is never free-floating but always anchored to an explicit normalization lineage.

**t_entity_type_belongs_to**

| id | entity | entity_type_belongs_to |
| --- | --- | --- |
| BELO-0001 | edge_gateway_12 | NORM-0001 |
| BELO-0002 | sensor_node_47 | NORM-0003 |
| BELO-0003 | governance_policy_fin | NORM-0001 |
| BELO-0004 | sensor_node_47 | NORM-0004 |
| BELO-0005 | edge_gateway_12 | NORM-0006 |
| BELO-0006 | edge_gateway_12 | NORM-0002 |
| BELO-0007 | ml_feature_store_prod | NORM-0006 |

**t_entity_type_belongs_to_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BELO-0001 | confidence | xsd:decimal |
| BELO-0002 | dimension_kind | xsd:string |
| BELO-0003 | method | xsd:string |
| BELO-0004 | recorded_at | xsd:dateTime |
| BELO-0005 | uncertainty | xsd:decimal |
| BELO-0006 | unit | xsd:string |
| BELO-0007 | value | xsd:decimal |
| BELO-0008 | encoding | xsd:string |

**t_mass_function_with_normalization**

| id | mass | normalization_constant |
| --- | --- | --- |
| NORM-0001 | Rotor-Assembly-M | BELO-0006 |
| NORM-0002 | Batch-7721 | BELO-0007 |
| NORM-0003 | Core-Segment-12 | BELO-0006 |
| NORM-0004 | Dust-Collection-1 | BELO-0006 |
| NORM-0005 | Powder-Grade-B | BELO-0004 |
| NORM-0006 | Rotor-Assembly-M | BELO-0001 |

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

Attr names the semantic slot through which an entity is described, while attr_type fixes the interpretive contract under which any recorded value must be read. Across both belongs-to and mass-function contexts, the same quartet of slots recurs—confidence as xsd:decimal, dimension_kind and method as xsd:string, recorded_at as xsd:dateTime—signalling a deliberate pattern in which probabilistic weight, categorical encoding, procedural method, and temporal provenance are treated as first-class governance metadata rather than ad hoc columns. Misc is the typed residue: the concrete instantiation of attr once identifier, entity, and attr_id have been resolved. A confidence misc of 0.703 on BELO-0001 and 0.715 on NORM-0001 is comparable only because attr_type declared both as decimals; likewise, dimension_kind misc values such as Dimension Kind 01 and Encoding 02 remain strings by construction, and recorded_at misc entries—2025-04-30T12:57:36 for a belongs-to edge, 2024-12-04T17:58:43 for a normalization mass—establish when the assertion entered the evidentiary record, not merely when it was queried.

**t_entity_type_belongs_to_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0004 | 2025-04-30T12:57:36 |
| BELO-0002 | BELO-0002 | BELO-0004 | 2023-11-10T02:05:22 |
| BELO-0003 | BELO-0003 | BELO-0004 | 2023-12-19T19:26:36 |
| BELO-0004 | BELO-0004 | BELO-0004 | 2023-01-25T21:39:36 |
| BELO-0005 | BELO-0005 | BELO-0004 | 2023-12-09T03:03:32 |
| BELO-0006 | BELO-0006 | BELO-0004 | 2023-09-18T08:14:48 |
| BELO-0007 | BELO-0007 | BELO-0004 | 2024-05-10T13:50:46 |

**t_entity_type_belongs_to_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0001 | 0.703 |
| BELO-0002 | BELO-0001 | BELO-0005 | 525.54 |
| BELO-0003 | BELO-0001 | BELO-0007 | 691.11 |
| BELO-0004 | BELO-0002 | BELO-0001 | 0.351 |
| BELO-0005 | BELO-0002 | BELO-0005 | 906.27 |
| BELO-0006 | BELO-0002 | BELO-0007 | 385.85 |
| BELO-0007 | BELO-0003 | BELO-0001 | 0.357 |
| BELO-0008 | BELO-0003 | BELO-0005 | 529.91 |

**t_entity_type_belongs_to_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0002 | Dimension Kind 01 |
| BELO-0002 | BELO-0001 | BELO-0008 | Encoding 02 |
| BELO-0003 | BELO-0001 | BELO-0009 | nightly summary |
| BELO-0004 | BELO-0001 | BELO-0010 | es |
| BELO-0005 | BELO-0001 | BELO-0003 | hybrid |
| BELO-0006 | BELO-0001 | BELO-0006 | ms |
| BELO-0007 | BELO-0002 | BELO-0002 | Dimension Kind 07 |
| BELO-0008 | BELO-0002 | BELO-0008 | Encoding 08 |

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

The separation of attr declaration from misc storage by physical type is an operational safeguard. Datetime misc lives apart from decimal misc and varchar misc so that validators, retention rules, and access controls can be applied per datatype without contaminating unrelated domains of discourse; method misc such as nightly summary and language misc such as es or ja attach to the same entity identifier only when the attr_id explicitly authorizes that slot. Reviewers therefore reconstruct a complete portrait by traversing identifier → entity → attr → misc, rather than by inferring meaning from a single wide row. Where multiple misc rows share an entity_id—as when BELO-0001 accumulates confidence, supplementary decimal measures, and several string descriptors—the pattern documents layered attestation: one membership fact supported by distinct, typed attestations whose combination, not any single field, carries compliance weight.

Censusdatacollectionprocess names the sovereign enumeration program whose design must be defensible to regulators and counterpart agencies: UK National Census, Australia Census, Brazil IBGE Count, and Japan Ministry Census each denote a nationally scoped collection regime with its own legal mandate, field operations, and publication obligations. Such a process rarely reduces to a single instrument; it is realized as a choreography of preparatory controls and substantive instruments. Organizationalscreeningactivity captures the front-end integrity work that conditions whether downstream statistics may be trusted—Initial Contact Verification, Household Mapping Exercise, Preliminary Demographic Sampling, and Coverage Measurement Study are not interchangeable synonyms for “survey,” but distinct screening acts that verify coverage, bound non-response, and document frames before official counts proceed. Representativesurveyactivity, in turn, records the thematic modules that extend or refine the census core—Agricultural Census Module, Labor Force Participation Survey, Disability Assessment Survey, Migrant Tracking Survey—each representative in the statistical sense that sampled or modular content stands for a domain the headcount alone cannot exhaust.

In practice, PROC-0001 through PROC-0004 illustrate how identifier-backed process records bind a censusdatacollectionprocess to the screening and survey activities that operationalize it: the UK program pairs Initial Contact Verification with an Agricultural Census Module; Australia links Household Mapping Exercise to Labor Force Participation Survey; Brazil associates Preliminary Demographic Sampling with Disability Assessment Survey; Japan connects Coverage Measurement Study to Migrant Tracking Survey. The architectural rhyme with entity–attr–misc elsewhere in the corpus is intentional. A census process identifier plays the role of entity; organizationalscreeningactivity and representativesurveyactivity function as typed relational attrs that declare what classes of operational fact must exist; the field operations, instruments, and coverage metrics produced in the field are the misc—evidence that the declared process was not merely authorized but executed under traceable controls. Auditors who can follow BELO-0003 from sensor_node_47 through method and recorded_at to 2023-12-19T19:26:36 are applying the same discipline needed to determine whether Japan Ministry Census, identified as PROC-0004, actually encompassed the Coverage Measurement Study and Migrant Tracking Survey its record claims.

**t_census_data_collection_process**

| id | census_data_collection_process | involves_screening | includes_survey |
| --- | --- | --- | --- |
| PROC-0001 | UK National Census | Initial Contact Verification | Agricultural Census Module |
| PROC-0002 | Australia Census | Household Mapping Exercise | Labor Force Participation Survey |
| PROC-0003 | Brazil IBGE Count | Preliminary Demographic Sampling | Disability Assessment Survey |
| PROC-0004 | Japan Ministry Census | Coverage Measurement Study | Migrant Tracking Survey |

Taken together, entity and identifier establish what exists and how it is cited; attr and attr_type establish what may be said and how it must be parsed; misc establishes what was in fact said, in values that withstand type checking and temporal scrutiny; and the census triad—censusdatacollectionprocess, organizationalscreeningactivity, representativesurveyactivity—projects that discipline onto national statistical governance, where the cost of ambiguous typing or missing screening lineage is not a schema defect but a publishability and treaty-comparability risk. The worked examples across BELO, NORM, and PROC families should be read as evidence of a single compliance posture: name processes and assets precisely, declare attributes with XSD rigor, store values in segregated misc by type, and require that every enumeration program show, by identifier-linked facts, both how its frame was screened and which representative surveys substantiate its public numbers.