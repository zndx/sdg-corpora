---
chapter_id: ch_live_breaking_change_subclass_7289ae
topic_id: 27
family: 07_long_tail
cited_terms: ['breaking_change_subclass', 'verification_targets_artifact', 'labrun_with_protocol']
model: engine-refine
---

In governed operational systems, durable identity is the precondition for every audit trail, dependency map, and compliance assertion. An identifier is not merely a surrogate key but a stable, human-legible handle that survives schema evolution, personnel turnover, and cross-system federation. Breaking-change subclasses carry identifiers such as CHAN-0001 through CHAN-0004, each naming a distinct class of incompatible transition—telemetry schema evolution, provenance graph migration, OAuth2 token rotation—while laboratory protocol executions are keyed as PROT-0001 through PROT-0004 and verification artifacts as ARTI-0001 through ARTI-0004. Because these tokens are reused consistently as foreign keys across attribute registries, typed value stores, and relational junction records, a single identifier can anchor an entire evidentiary chain: a breaking change declared under CHAN-0001 can be traced to the MassSpec_LC_MS lab run that follows it under PROT-0004, and onward to the compliance review cycle that scrutinizes the artifacts it touches. Without such identifiers, governance prose collapses into anecdote; with them, obligations become machine-checkable and historically reconstructible.

**t_breaking_change_subclass**

| id | breaking | breaking_change_for |
| --- | --- | --- |
| CHAN-0001 | Telemetry schema evolution | PROT-0002 |
| CHAN-0002 | Telemetry schema evolution | PROT-0001 |
| CHAN-0003 | Provenance graph migration | PROT-0003 |
| CHAN-0004 | OAuth2 token rotation | PROT-0006 |
| CHAN-0005 | Schema field removal | PROT-0002 |
| CHAN-0006 | Sensor sampling rate drop | PROT-0005 |
| CHAN-0007 | Provenance graph migration | PROT-0005 |
| CHAN-0008 | TLS 1.3 enforcement | PROT-0005 |

**t_breaking_change_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CHAN-0001 | confidence | xsd:decimal |
| CHAN-0002 | dimension_kind | xsd:string |
| CHAN-0003 | method | xsd:string |
| CHAN-0004 | recorded_at | xsd:dateTime |
| CHAN-0005 | uncertainty | xsd:decimal |
| CHAN-0006 | unit | xsd:string |
| CHAN-0007 | value | xsd:decimal |
| CHAN-0008 | encoding | xsd:string |

**t_breaking_change_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0004 | 2023-07-26T14:07:49 |
| CHAN-0002 | CHAN-0002 | CHAN-0004 | 2025-01-03T20:08:42 |
| CHAN-0003 | CHAN-0003 | CHAN-0004 | 2024-04-10T03:15:13 |
| CHAN-0004 | CHAN-0004 | CHAN-0004 | 2023-07-21T06:41:40 |
| CHAN-0005 | CHAN-0005 | CHAN-0004 | 2023-07-01T02:58:50 |
| CHAN-0006 | CHAN-0006 | CHAN-0004 | 2024-07-07T11:26:39 |
| CHAN-0007 | CHAN-0007 | CHAN-0004 | 2024-07-12T18:30:29 |
| CHAN-0008 | CHAN-0008 | CHAN-0004 | 2024-11-14T05:00:21 |

**t_breaking_change_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0002 | Dimension Kind 01 |
| CHAN-0002 | CHAN-0001 | CHAN-0008 | Encoding 02 |
| CHAN-0003 | CHAN-0001 | CHAN-0009 | calibration record |
| CHAN-0004 | CHAN-0001 | CHAN-0010 | en |
| CHAN-0005 | CHAN-0001 | CHAN-0003 | hybrid |
| CHAN-0006 | CHAN-0001 | CHAN-0006 | deg_C |
| CHAN-0007 | CHAN-0002 | CHAN-0002 | Dimension Kind 07 |
| CHAN-0008 | CHAN-0002 | CHAN-0008 | Encoding 08 |

**t_verification_targets_artifact**

| id | verification |
| --- | --- |
| ARTI-0001 | Compliance review cycle |
| ARTI-0002 | Compliance review cycle |
| ARTI-0003 | Data lineage audit |
| ARTI-0004 | Compliance review cycle |
| ARTI-0005 | Test suite execution |
| ARTI-0006 | Governance policy scan |

**t_verification_targets_artifact_targets_artifact**

| id | targets_artifact |
| --- | --- |
| ARTI-0001 | Sensor calibration matrix |
| ARTI-0002 | Source code branch |
| ARTI-0003 | Sensor calibration matrix |
| ARTI-0004 | Sensor calibration matrix |
| ARTI-0005 | Ingestion manifest |
| ARTI-0006 | Ingestion manifest |

**t_labrun_with_protocol**

| id | labrun | follows_protocol |
| --- | --- | --- |
| PROT-0001 | MassSpec_LC_MS | CHAN-0002 |
| PROT-0002 | Nanopore_FC_Nine | CHAN-0006 |
| PROT-0003 | Nanopore_FC_Nine | CHAN-0006 |
| PROT-0004 | MassSpec_LC_MS | CHAN-0001 |
| PROT-0005 | Microbiome_16S_Seq | CHAN-0005 |
| PROT-0006 | Proteomics_ICP_MS | CHAN-0002 |

**t_labrun_with_protocol_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROT-0001 | duration_seconds | xsd:decimal |
| PROT-0002 | end_time | xsd:dateTime |
| PROT-0003 | exit_code | xsd:integer |
| PROT-0004 | host_name | xsd:string |
| PROT-0005 | log_level | xsd:string |
| PROT-0006 | phase | xsd:string |
| PROT-0007 | retry_count | xsd:integer |
| PROT-0008 | scheduled_at | xsd:dateTime |

**t_labrun_with_protocol_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0002 | 2023-11-19T15:13:31 |
| PROT-0002 | PROT-0001 | PROT-0008 | 2023-04-19T03:43:36 |
| PROT-0003 | PROT-0001 | PROT-0009 | 2023-06-05T09:50:58 |
| PROT-0004 | PROT-0002 | PROT-0002 | 2023-12-21T19:08:32 |
| PROT-0005 | PROT-0002 | PROT-0008 | 2023-06-26T20:13:34 |
| PROT-0006 | PROT-0002 | PROT-0009 | 2023-11-18T07:40:33 |
| PROT-0007 | PROT-0003 | PROT-0002 | 2024-09-05T03:02:45 |
| PROT-0008 | PROT-0003 | PROT-0008 | 2024-06-07T02:35:38 |

**t_labrun_with_protocol_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0003 | 497 |
| PROT-0002 | PROT-0001 | PROT-0007 | 434 |
| PROT-0003 | PROT-0002 | PROT-0003 | 538 |
| PROT-0004 | PROT-0002 | PROT-0007 | 309 |
| PROT-0005 | PROT-0003 | PROT-0003 | 513 |
| PROT-0006 | PROT-0003 | PROT-0007 | 375 |
| PROT-0007 | PROT-0004 | PROT-0003 | 355 |
| PROT-0008 | PROT-0004 | PROT-0007 | 171 |

**t_labrun_with_protocol_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0004 | node-b14 |
| PROT-0002 | PROT-0001 | PROT-0005 | Log Level 02 |
| PROT-0003 | PROT-0001 | PROT-0006 | closeout |
| PROT-0004 | PROT-0001 | PROT-0010 | running |
| PROT-0005 | PROT-0001 | PROT-0011 | Triggered By 05 |
| PROT-0006 | PROT-0002 | PROT-0004 | worker-07 |
| PROT-0007 | PROT-0002 | PROT-0005 | Log Level 07 |
| PROT-0008 | PROT-0002 | PROT-0006 | review |

An entity is the governed object that owns state—the breaking-change subclass instance, the protocol run, the verification artifact—not the metadata row that describes its shape nor the junction row that links it to something else. Attribute values are always attributed to an entity through entity_id, which may coincide with the entity’s primary identifier (as when CHAN-0001 stores a confidence decimal against itself) or may reference a related instance (as when PROT-0002 supplies an end_time for PROT-0001). This separation matters because governance frameworks must distinguish the thing under obligation from the facts asserted about it. A protocol run keyed PROT-0003 may accumulate duration_seconds, exit_code, and host_name facts while remaining the same entity across revisions; conversely, multiple entities may share attribute names without sharing semantics, because entity scope disambiguates otherwise identical labels.

**t_breaking_change_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0001 | 0.203 |
| CHAN-0002 | CHAN-0001 | CHAN-0005 | 700.59 |
| CHAN-0003 | CHAN-0001 | CHAN-0007 | 64.61 |
| CHAN-0004 | CHAN-0002 | CHAN-0001 | 0.645 |
| CHAN-0005 | CHAN-0002 | CHAN-0005 | 584.78 |
| CHAN-0006 | CHAN-0002 | CHAN-0007 | 672.81 |
| CHAN-0007 | CHAN-0003 | CHAN-0001 | 0.769 |
| CHAN-0008 | CHAN-0003 | CHAN-0005 | 136.48 |

**t_labrun_with_protocol_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROT-0001 | PROT-0001 | PROT-0001 | 301.25 |
| PROT-0002 | PROT-0002 | PROT-0001 | 4042.33 |
| PROT-0003 | PROT-0003 | PROT-0001 | 6125.88 |
| PROT-0004 | PROT-0004 | PROT-0001 | 1565.69 |
| PROT-0005 | PROT-0005 | PROT-0001 | 1033.06 |
| PROT-0006 | PROT-0006 | PROT-0001 | 3134.56 |

Attributes name the slots into which typed facts are placed, and attr_type declares the validation and storage contract each slot obeys. Breaking-change subclasses expose confidence as xsd:decimal, dimension_kind and method as xsd:string, and recorded_at as xsd:dateTime; protocol runs expose duration_seconds as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string. The type is not decorative: it partitions values into physically distinct stores—decimals such as 0.203 and 0.645, integers such as 497 and 538, timestamps such as 2023-07-26T14:07:49 and 2023-12-21T19:08:32, and lexical strings such as Dimension Kind 01, node-b14, and running—so that range checks, unit policies, and retention rules can be enforced without ambiguity. When attr and attr_type are registered separately from values, organizations can introduce new observability dimensions—calibration record, Log Level 02, en—without rewriting entity tables, preserving forward compatibility while keeping retrospective queries well-typed.

The misc designation captures the payload itself: the concrete value held at the intersection of entity, attribute, and type. Misc is deliberately generic in name because the governance layer treats content as opaque at persistence time and interprets it only through attr_type and attr_name. Thus 700.59 and 64.61 are misc only insofar as they are decimal facts bound to CHAN-0001 under distinct attribute identifiers; likewise, Encoding 02 and closeout are misc varchar entries whose compliance significance emerges from context, not from the storage column label. Typed value tables function as evidence lockers: each row is a sworn measurement or annotation whose admissibility depends on correct entity_id and attr_id pairing. A recorded_at of 2025-01-03T20:08:42 attached to CHAN-0002 via attr_id CHAN-0004 establishes when a telemetry schema evolution event was logged, independent of the prose description stored alongside the subclass definition.

Relational governance extends beyond monadic attributes through subject, target, and role, which together formalize directed responsibilities among identified artifacts. In verification targeting, the subject is the verification activity—identified, for example, as ARTI-0002 or ARTI-0005—and the target is the artifact placed under scrutiny, such as ARTI-0003 (Source code branch) or ARTI-0001 (Sensor calibration matrix). Role qualifies how the subject engages the target: reviewer, owner, or contributor, encoding duty of care rather than mere graph connectivity. A compliance review cycle aimed at a sensor calibration matrix therefore materializes as a subject–target pair annotated with reviewer or contributor, not as an undifferentiated link. Parallel structures appear elsewhere: breaking_change_for associates CHAN-0002 with PROT-0001 and CHAN-0004 with PROT-0006, while follows_protocol binds lab runs to the breaking-change subclasses they implement. These y-side and subject–target patterns express dependency and coverage—the obligations that propagate when a subclass changes or when a verification scope expands.

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role constitute the minimal vocabulary for evidence-anchored operations management. Identifiers stabilize reference; entities delimit what is governed; attr and attr_type specify what may be said and how it must be encoded; misc supplies the said facts; and subject–target–role triples articulate who or what bears responsibility toward what end. Operational practice that honors this vocabulary can reconstruct, from persisted rows alone, that Nanopore_FC_Nine executions following CHAN-0006 inherit breaking-change constraints distinct from MassSpec_LC_MS runs following CHAN-0001, that OAuth2 token rotation under CHAN-0004 was recorded at 2023-07-21T06:41:40, and that data lineage audits and compliance review cycles do not treat all artifacts uniformly but assign reviewers and owners to explicit targets. The density of the model is its virtue: every compliance claim reduces to identifiable entities, typed attributes, and qualified relationships, rendering governance auditable in the same register as the science it oversees.

**t_verification_targets_artifact__targets_artifact**

| id | verification_id | targets_artifact_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0002 | ARTI-0002 | reviewer |
| ARTI-0002 | ARTI-0004 | ARTI-0003 | owner |
| ARTI-0003 | ARTI-0005 | ARTI-0001 | reviewer |
| ARTI-0004 | ARTI-0005 | ARTI-0001 | contributor |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | reviewer |
| ARTI-0006 | ARTI-0005 | ARTI-0006 | owner |
| ARTI-0007 | ARTI-0006 | ARTI-0004 | owner |
| ARTI-0008 | ARTI-0006 | ARTI-0002 | reviewer |