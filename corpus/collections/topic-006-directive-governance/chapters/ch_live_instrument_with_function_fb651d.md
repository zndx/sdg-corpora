---
chapter_id: ch_live_instrument_with_function_fb651d
topic_id: 6
family: 01_foundation
cited_terms: ['instrument_with_function', 'taper_tolerance_constraint', 'verification_produces_evidence']
model: engine-refine
---

Instrument–function bindings and taper-tolerance constraints in a governed metrology and compliance environment depend on a small set of cross-cutting reference primitives—identifier, entity, attr, attr_type, misc, exitcode, status, and tapertoleranceconstraint—that together permit heterogeneous facts to be recorded, typed, queried, and audited without collapsing distinct domains into a single undifferentiated record shape. An identifier is the durable, system-wide key that stabilizes reference across ingestion, reconciliation, and downstream evidence linkage; FUNC-0001 through FUNC-0004 name instrument–function pairings (Keysight DSOX3024T, Thermo Q Exactive, Zygo NewView, Agilent 5975C) that realize evidentiary artifacts EVID-0002, EVID-0003, and EVID-0005, while CONS-0001 through CONS-0004 name taper regimes (ISO 7/24, R8 Taper, HSK 63A, Brown Sharpe). Entity denotes the subject to which a fact is asserted: entity_id in value stores points attribute instances at the same logical object named by the parent identifier, so that checksum, license, and confidence values remain attributable to FUNC-0001 or CONS-0001 even when physically partitioned across typed value relations. The identifier therefore names the row; the entity scopes the assertion.

**t_instrument_with_function**

| id | instrument | realizes_function |
| --- | --- | --- |
| FUNC-0001 | Keysight DSOX3024T | EVID-0002 |
| FUNC-0002 | Thermo Q Exactive | EVID-0003 |
| FUNC-0003 | Zygo NewView | EVID-0005 |
| FUNC-0004 | Agilent 5975C | EVID-0005 |
| FUNC-0005 | Agilent 5975C | EVID-0002 |
| FUNC-0006 | Agilent 5975C | EVID-0003 |

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

**t_taper_tolerance_constraint**

| id | taper_tolerance_constraint |
| --- | --- |
| CONS-0001 | ISO 7/24 |
| CONS-0002 | R8 Taper |
| CONS-0003 | HSK 63A |
| CONS-0004 | Brown Sharpe |
| CONS-0005 | R8 Taper |
| CONS-0006 | HSK 63A |
| CONS-0007 | HSK 63A |

**t_taper_tolerance_constraint_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | confidence | xsd:decimal |
| CONS-0002 | dimension_kind | xsd:string |
| CONS-0003 | method | xsd:string |
| CONS-0004 | recorded_at | xsd:dateTime |
| CONS-0005 | uncertainty | xsd:decimal |
| CONS-0006 | unit | xsd:string |
| CONS-0007 | value | xsd:decimal |
| CONS-0008 | encoding | xsd:string |

Attr and attr_type constitute the declarative contract that governs what may be said about an entity and how it must be interpreted. Attr is the semantic slot—declared once per entity class via attr_name such as checksum, created_date, identifier, license, confidence, dimension_kind, method, and recorded_at—and referenced at assertion time through attr_id, which binds a particular value row to that slot without embedding the slot name in every fact table. Attr_type carries the interpretive obligation: xsd:string for checksum and license text, xsd:date for created_date (2024-09-19, 2023-09-07, 2024-09-12, 2024-08-15), cco:DesignativeICE for designative identifiers, xsd:decimal for confidence (0.573, 0.728) and related magnitudes (111.04, 682.01), and xsd:dateTime for recorded_at timestamps (2023-04-13T01:14:03 through 2024-03-22T07:54:37). In practice, attr_type is what permits validators, exporters, and compliance reviewers to reject structurally valid but semantically incoherent submissions—an integer where a date is required, or a plain string where a controlled vocabulary applies—and to route each accepted assertion to the correct physical store (date, integer, varchar, decimal, or datetime) without ambiguity.

Misc names the payload column that holds the asserted value once entity and attr have fixed its subject and meaning. Because a single entity may simultaneously carry a checksum (a3f9c21e), a cross-reference (ref-8842), a license designation (MPL-2.0), a deployment region (us-east-1), integer operational counters (359, 4, 439, 6), and taper-constraint annotations (Dimension Kind 01, Encoding 02, nightly summary, en), misc is intentionally polymorphic at the logical layer while remaining type-safe at the physical layer through attr_type and table choice. This entity–attribute–value pattern trades wide normalized tables for extensibility: new observables (method, dimension_kind, confidence) can be introduced by extending the attribute catalog rather than migrating monolithic schemas, which matters when instrument fleets, audit programs, and machining standards evolve on different cadences. Reviewers should treat misc not as an informal catch-all but as the canonical value field whose semantics are fully determined by the paired entity_id, attr_id, and attr_type triple.

Exitcode and status encode the outcome semantics of verification processes that produce or fail to produce evidence. Verification runs—here uniformly labeled Compliance audit Q3—emit exit_code values (568, 821, 938, 88) that function as machine-interpretable termination signals distinct from human-readable narrative; they support automated triage, re-run policies, and integration with orchestration layers that must decide whether to advance, retry, or quarantine a workflow without parsing logs. Status (complete, failed, pending) supplies the governance-facing disposition: EVID-0002 and EVID-0003 remain failed despite non-zero exit codes, EVID-0001 is complete, and EVID-0004 awaits resolution while still associated with produced artifacts FUNC-0006, FUNC-0001, FUNC-0005, and FUNC-0003. Operational discipline requires that exitcode and status be read together—an exit code alone does not confer evidentiary validity, and a pending status may still block reliance on downstream instrument–function realizations until the verification chain closes.

Tapertoleranceconstraint denotes a governed machining or tooling conformance class whose identity (ISO 7/24, R8 Taper, HSK 63A, Brown Sharpe) is insufficient for audit without the same attr, attr_type, entity, and misc machinery applied elsewhere. Constraints accumulate typed metadata—decimal confidence and dimensional quantities, varchar-encoded dimension and encoding kinds, datetime provenance of capture—so that spindle interfaces, gauge records, and nightly summaries remain traceable to CONS-0001 through CONS-0004 under a single identifier namespace. Linkage from instrument functions to evidence (EVID-0002, EVID-0003, EVID-0005) and from verification to produced functions completes the compliance graph: identifiers anchor nodes, entities scope facts, attrs and attr_types define permissible statements, misc holds the evidentiary payload, exitcode and status govern process integrity, and tapertoleranceconstraint instantiates domain-specific enforceable limits within that uniform reference architecture. Maintainers who preserve this separation—naming, typing, valuing, and verifying—retain the ability to expand catalogs, replay audits, and demonstrate conformance without rewriting historical records.

**t_instrument_with_function_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | 2024-09-19 |
| FUNC-0002 | FUNC-0002 | FUNC-0002 | 2023-09-07 |
| FUNC-0003 | FUNC-0003 | FUNC-0002 | 2024-09-12 |
| FUNC-0004 | FUNC-0004 | FUNC-0002 | 2024-08-15 |
| FUNC-0005 | FUNC-0005 | FUNC-0002 | 2025-05-20 |
| FUNC-0006 | FUNC-0006 | FUNC-0002 | 2023-09-16 |

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

**t_taper_tolerance_constraint_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 2023-04-13T01:14:03 |
| CONS-0002 | CONS-0002 | CONS-0004 | 2023-11-17T04:32:31 |
| CONS-0003 | CONS-0003 | CONS-0004 | 2024-02-24T21:07:21 |
| CONS-0004 | CONS-0004 | CONS-0004 | 2024-03-22T07:54:37 |
| CONS-0005 | CONS-0005 | CONS-0004 | 2024-06-16T09:28:12 |
| CONS-0006 | CONS-0006 | CONS-0004 | 2025-04-01T15:47:40 |
| CONS-0007 | CONS-0007 | CONS-0004 | 2023-11-02T02:01:06 |

**t_taper_tolerance_constraint_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 0.573 |
| CONS-0002 | CONS-0001 | CONS-0005 | 111.04 |
| CONS-0003 | CONS-0001 | CONS-0007 | 682.01 |
| CONS-0004 | CONS-0002 | CONS-0001 | 0.728 |
| CONS-0005 | CONS-0002 | CONS-0005 | 404.41 |
| CONS-0006 | CONS-0002 | CONS-0007 | 774.28 |
| CONS-0007 | CONS-0003 | CONS-0001 | 0.546 |
| CONS-0008 | CONS-0003 | CONS-0005 | 913.78 |

**t_taper_tolerance_constraint_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0002 | Dimension Kind 01 |
| CONS-0002 | CONS-0001 | CONS-0008 | Encoding 02 |
| CONS-0003 | CONS-0001 | CONS-0009 | nightly summary |
| CONS-0004 | CONS-0001 | CONS-0010 | en |
| CONS-0005 | CONS-0001 | CONS-0003 | hybrid |
| CONS-0006 | CONS-0001 | CONS-0006 | ratio |
| CONS-0007 | CONS-0002 | CONS-0002 | Dimension Kind 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | Encoding 08 |

**t_verification_produces_evidence**

| id | verification | produces_evidence | exit_code | status |
| --- | --- | --- | --- | --- |
| EVID-0001 | Compliance audit Q3 | FUNC-0006 | 568 | complete |
| EVID-0002 | Compliance audit Q3 | FUNC-0001 | 821 | failed |
| EVID-0003 | Compliance audit Q3 | FUNC-0005 | 938 | failed |
| EVID-0004 | Compliance audit Q3 | FUNC-0003 | 88 | pending |
| EVID-0005 | Compliance audit Q3 | FUNC-0002 | 761 | pending |
| EVID-0006 | Compliance audit Q3 | FUNC-0005 | 718 | running |