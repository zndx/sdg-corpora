---
chapter_id: ch_live_trace_with_service_name_be58c8
topic_id: 155
family: 07_long_tail
cited_terms: ['trace_with_service_name', 'instrument_with_function', 'schemaorg_event_location']
model: engine-refine
---

In governed information systems, stable identification is the precondition for every downstream assertion of provenance, accountability, and auditability. An identifier is not merely a surrogate key but a durable handle that permits the same real-world object to be referenced across time, process boundaries, and heterogeneous stores without conflation or silent substitution. When a distributed trace such as `notif-send-8876` or an instrument record keyed as `FUNC-0001` is registered under a canonical code (`NAME-0001`, `LOCA-0003`), the registry commits to treating that code as the authoritative locus of identity for all subsequent metadata, relationship edges, and typed value assertions. The practical consequence is enforceable referential integrity: compliance queries can join evidence chains knowing that `FUNC-0001` always denotes the Keysight DSOX3024T instrument realizing Signal Amplification, and that `LOCA-0001` always anchors the audit-log-archive event location mapped to AWS us-east-1, regardless of how display labels or deployment topology evolve.

**t_instrument_with_function**

| id | instrument | realizes_function |
| --- | --- | --- |
| FUNC-0001 | Keysight DSOX3024T | Signal Amplification |
| FUNC-0002 | Thermo Q Exactive | Temperature Measurement |
| FUNC-0003 | Zygo NewView | Concentration Quantification |
| FUNC-0004 | Agilent 5975C | Gas Composition |
| FUNC-0005 | Agilent 5975C | Gas Composition |
| FUNC-0006 | Agilent 5975C | Pressure Monitoring |

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

**t_schemaorg_event_location**

| id | schemaorg | event_location |
| --- | --- | --- |
| LOCA-0001 | audit-log-archive | AWS us-east-1 |
| LOCA-0002 | data-lake-ingestion-job | Basement Server Room |
| LOCA-0003 | provenance-trace-record | Room 4B Server Hall |
| LOCA-0004 | provenance-trace-record | Network Zone Secure |
| LOCA-0005 | field-observation-dataset | Network Zone Secure |
| LOCA-0006 | governance-policy-update | Basement Server Room |
| LOCA-0007 | lab-sample-tracker | AWS us-east-1 |
| LOCA-0008 | field-observation-dataset | Facility 7 Calibration Lab |

Entities are the governed objects to which descriptive and evidential statements attach. An entity may be a laboratory instrument, a Schema.org–aligned event location, a trace span, or a service component, but in each case the entity is the bearer of obligations: it is what must be inventoried, licensed, time-stamped, and cross-checked against policy. Attribute definitions (`attr`) name the facets of description that the governance framework permits—checksum, created_date, identifier, license recur as a shared vocabulary across instrument and location domains because they encode universal compliance primitives (integrity evidence, temporal provenance, designative naming, and entitlement). Separating the entity from its attribute schema allows the same instrument (`FUNC-0001`) to accumulate multiple orthogonal assertions without collapsing distinct evidentiary dimensions into a single undifferentiated record; the entity remains the stable subject of governance while attributes articulate which dimensions of that subject are being claimed.

**t_trace_with_service_name**

| id | trace |
| --- | --- |
| NAME-0001 | notif-send-8876 |
| NAME-0002 | inventory-sync-2290 |
| NAME-0003 | payment-proc-4451 |
| NAME-0004 | api-gateway-991 |
| NAME-0005 | cache-warm-5502 |
| NAME-0006 | payment-proc-4451 |

**t_trace_with_service_name_service_name**

| id | service_name |
| --- | --- |
| NAME-0001 | inventory-db |
| NAME-0002 | order-processor |
| NAME-0003 | metrics-collector |
| NAME-0004 | search-engine |
| NAME-0005 | logging-agent |
| NAME-0006 | logging-agent |
| NAME-0007 | config-server |
| NAME-0008 | inventory-db |

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

Attribute type (`attr_type`) supplies the semantic contract under which each assertion may be interpreted, validated, and exchanged. A value declared under `xsd:date` is not interchangeable with one declared under `xsd:string` or `cco:DesignativeICE`; the type governs parsing, comparison, and the admissibility of the value in automated reasoning pipelines. Thus `2024-09-19` attached to `FUNC-0002` as a created_date is a calendar fact subject to chronological ordering and retention rules, whereas `a3f9c21e` under checksum on the same entity is an opaque integrity token whose equality tests are lexical, not temporal. License values typed as `xsd:string` (`MPL-2.0`, `Apache-2.0`) enter license-compliance workflows; designative identifiers typed under CCO ontologies (`cco:DesignativeICE`) signal that the misc value participates in a formal naming regime rather than free-text annotation. Type discipline is therefore not syntactic pedantry but the mechanism by which heterogeneous evidence remains machine-auditable across federated registries.

The misc dimension—materialized in segregated value stores by representation (`val_date`, `val_int`, `val_varchar`)—is where abstract attribute definitions become inspectable fact. Each misc record binds an entity to an attr through foreign keys (`entity_id`, `attr_id`) and carries the concrete payload: integer counts such as `359` and `439`, regional deployment tokens like `us-east-1` and `ap-south-2`, or cross-reference strings such as `ref-8842` that stitch records across domains. Partitioning misc by physical type prevents silent coercion—dates are not stored as ambiguous strings, and numeric counters are not lossily rounded into varchar fields—so integrity checks, threshold alarms, and statutory retention filters operate on values whose semantics were fixed at ingest. When multiple entities share the same attr_id (`FUNC-0002` for created_date across four instrument rows), the framework expresses a reusable attribute template instantiated per entity with distinct misc values (`2024-09-19`, `2023-09-07`, `2024-09-12`, `2024-08-15`), demonstrating that governance metadata scales through definition reuse rather than ad hoc column proliferation.

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

Relational governance extends beyond unary entity–attribute assertions through subject–target edges qualified by role. In trace-to-service linkage, the subject (`trace_id`) names the provenance-bearing activity—`payment-proc-4451`, `api-gateway-991`—while the target (`service_name_id`) names the infrastructural actor—`NAME-0006`, `NAME-0007`—against which that activity must be interpreted for scope, data residency, and access control. Role is the interpretive modifier that prevents symmetric edges from collapsing distinct compliance postures into undifferentiated association: the same trace may relate to a service as `observer` (read-only telemetry participation), while another trace assumes `owner` (operational accountability for state mutation), and a third enters as `reviewer` (post-hoc attestation). A single subject (`NAME-0001`, the trace `notif-send-8876`) can therefore participate in multiple governed relationships with different targets and roles without identity fracture, because identifier, subject, target, and role are orthogonal coordinates in the evidence graph.

**t_trace_with_service_name__service_name**

| id | trace_id | service_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0001 | NAME-0005 | observer |
| NAME-0002 | NAME-0005 | NAME-0007 | observer |
| NAME-0003 | NAME-0004 | NAME-0007 | owner |
| NAME-0004 | NAME-0001 | NAME-0006 | reviewer |
| NAME-0005 | NAME-0002 | NAME-0004 | observer |
| NAME-0006 | NAME-0003 | NAME-0008 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | contributor |
| NAME-0008 | NAME-0003 | NAME-0008 | reviewer |

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role constitute a layered reference architecture for defensible operational records. Identifiers stabilize referents; entities anchor policy scope; attrs and attr_types define what may be said and how it may be validated; misc supplies the auditable fact; and subject–target–role triples situate those facts inside accountable process topology—linking, for example, provenance-trace-record locations in Room 4B Server Hall to the search-engine and metrics-collector services that observed or owned correlated traces. Systems that honor this separation gain composability: instrument checksums, event-location licenses, and trace-service roles can be queried uniformly, versioned independently, and cited in compliance handbooks as interoperable evidence rather than as brittle, monolithic documents. The density of the pattern across laboratory instrumentation and cloud event-location registries is itself instructive: wherever governance must survive audit, the same primitives recur because they encode the minimum structure required for claims to remain attributable, typed, and relationally situated in practice.

**t_schemaorg_event_location_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LOCA-0001 | checksum | xsd:string |
| LOCA-0002 | created_date | xsd:date |
| LOCA-0003 | identifier | cco:DesignativeICE |
| LOCA-0004 | license | xsd:string |
| LOCA-0005 | mime_type | xsd:string |
| LOCA-0006 | size_bytes | xsd:long |
| LOCA-0007 | uri | xsd:string |
| LOCA-0008 | version | xsd:integer |

**t_schemaorg_event_location_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0002 | 2024-05-14 |
| LOCA-0002 | LOCA-0002 | LOCA-0002 | 2024-02-21 |
| LOCA-0003 | LOCA-0003 | LOCA-0002 | 2023-06-13 |
| LOCA-0004 | LOCA-0004 | LOCA-0002 | 2023-08-21 |
| LOCA-0005 | LOCA-0005 | LOCA-0002 | 2025-03-20 |
| LOCA-0006 | LOCA-0006 | LOCA-0002 | 2025-01-04 |
| LOCA-0007 | LOCA-0007 | LOCA-0002 | 2023-08-21 |
| LOCA-0008 | LOCA-0008 | LOCA-0002 | 2025-03-26 |

**t_schemaorg_event_location_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0006 | 400 |
| LOCA-0002 | LOCA-0001 | LOCA-0008 | 6 |
| LOCA-0003 | LOCA-0002 | LOCA-0006 | 223 |
| LOCA-0004 | LOCA-0002 | LOCA-0008 | 6 |
| LOCA-0005 | LOCA-0003 | LOCA-0006 | 283 |
| LOCA-0006 | LOCA-0003 | LOCA-0008 | 2 |
| LOCA-0007 | LOCA-0004 | LOCA-0006 | 450 |
| LOCA-0008 | LOCA-0004 | LOCA-0008 | 8 |

**t_schemaorg_event_location_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LOCA-0001 | LOCA-0001 | LOCA-0001 | c0ffee42 |
| LOCA-0002 | LOCA-0001 | LOCA-0003 | ref-8842 |
| LOCA-0003 | LOCA-0001 | LOCA-0004 | Apache-2.0 |
| LOCA-0004 | LOCA-0001 | LOCA-0009 | ap-south-2 |
| LOCA-0005 | LOCA-0001 | LOCA-0005 | application/json |
| LOCA-0006 | LOCA-0001 | LOCA-0010 | Name 06 |
| LOCA-0007 | LOCA-0001 | LOCA-0011 | analytics |
| LOCA-0008 | LOCA-0001 | LOCA-0012 | Tags 08 |