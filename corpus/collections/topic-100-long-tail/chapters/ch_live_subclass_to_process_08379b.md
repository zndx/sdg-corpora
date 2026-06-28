---
chapter_id: ch_live_subclass_to_process_08379b
topic_id: 100
family: 01_foundation
cited_terms: ['subclass_to_process', 'schemaorg_place_address', 'control_under_framework']
model: engine-refine
---

In governed operational and compliance data environments, stable identifiers anchor every assertion that can be audited, reconciled, or propagated across systems. An identifier is not merely a surrogate key but a durable handle that survives reclassification, reprocessing, and cross-domain linkage: PROC-0001 names an incident-response process, FRAM-0001 names a network-firewall control, and ADDR-0001 names a Schema.org place record for CERN Main Campus. Because identifiers are reused as foreign keys in value and association tables, they establish a single referential spine through which duration readings, enforcement strings, postal-address pairings, and framework memberships can be traced back to the same canonical object. Without that spine, telemetry such as 5106.96 seconds of runtime or an exit code of 684 could not be attributed to a definable process instance, and a control’s mandatory flag could not be evaluated against the control definition that auditors expect.

**t_schemaorg_place_address**

| id | schemaorg |
| --- | --- |
| ADDR-0001 | CERN Main Campus |
| ADDR-0002 | Smithsonian Institution |
| ADDR-0003 | Royal Society |
| ADDR-0004 | UN Secretariat |
| ADDR-0005 | Royal Society |
| ADDR-0006 | RAND Corporation |
| ADDR-0007 | CERN Main Campus |

**t_schemaorg_place_address_postal_address**

| id | postal_address |
| --- | --- |
| ADDR-0001 | 700 1st Ave |
| ADDR-0002 | 350 Fifth Ave |
| ADDR-0003 | 2875 Broadway |
| ADDR-0004 | 1000 Independence Ave |
| ADDR-0005 | 1 Infinite Loop |
| ADDR-0006 | 1000 Independence Ave |

An entity is the governed object those identifiers denote—the process, control, place, or other subclass instance that carries meaning in policy and operations. Incident response, data validation, telemetry aggregation, and batch ingestion are not free-floating labels; each is an entity whose lifecycle, evidence, and control posture must be reasoned about as a unit. Value storage therefore keys observations to entity_id rather than to human-readable names, so that PROC-0002 may simultaneously hold a decimal duration of 6532.76, a datetime end_time of 2024-06-21T23:54:50, and integer exit codes without collapsing distinct facts into a single undifferentiated record. Entity-centric modeling matters because compliance arguments are always about specific objects under specific obligations: whether Session timeout is mandatory, whether Configuration baseline is enforced as “Enforcement 02,” or whether a place’s postal component is authoritative for a given campus address.

**t_subclass_to_process**

| id | process |
| --- | --- |
| PROC-0001 | incident response |
| PROC-0002 | data validation |
| PROC-0003 | telemetry aggregation |
| PROC-0004 | batch ingestion |
| PROC-0005 | data validation |
| PROC-0006 | stream processing |

**t_subclass_to_process_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | 2024-02-25T00:58:35 |
| PROC-0002 | PROC-0001 | PROC-0008 | 2025-01-11T16:52:13 |
| PROC-0003 | PROC-0001 | PROC-0009 | 2024-01-24T01:55:59 |
| PROC-0004 | PROC-0002 | PROC-0002 | 2024-06-21T23:54:50 |
| PROC-0005 | PROC-0002 | PROC-0008 | 2023-12-17T03:43:06 |
| PROC-0006 | PROC-0002 | PROC-0009 | 2023-12-07T20:42:12 |
| PROC-0007 | PROC-0003 | PROC-0002 | 2024-06-16T15:41:50 |
| PROC-0008 | PROC-0003 | PROC-0008 | 2025-01-20T06:41:15 |

**t_subclass_to_process_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0001 | 5106.96 |
| PROC-0002 | PROC-0002 | PROC-0001 | 6532.76 |
| PROC-0003 | PROC-0003 | PROC-0001 | 6219.83 |
| PROC-0004 | PROC-0004 | PROC-0001 | 2715.88 |
| PROC-0005 | PROC-0005 | PROC-0001 | 3614.44 |
| PROC-0006 | PROC-0006 | PROC-0001 | 6690.61 |

Attributes and attribute types separate what may be said about an entity from how it may legally be said. An attr is a named, reusable property slot—duration_seconds, end_time, exit_code, host_name, effective_date, enforcement, mandatory, priority—registered once per subclass and referenced wherever a value is recorded. The attr_type binds each slot to a validation and storage contract drawn from a typed vocabulary such as XSD: xsd:decimal for durations, xsd:dateTime for temporal boundaries, xsd:integer for exit codes and priorities, xsd:string for host names and enforcement descriptors, xsd:date for control effective dates, and xsd:boolean for mandatory flags. This pairing is what permits heterogeneous observations on the same entity without type confusion: PROC-0001’s host_name “worker-07” and its duration_seconds 5106.96 are both tied to PROC-0001 but routed through attr_id references that imply incompatible physical representations if mishandled. In practice, attr and attr_type are the schema layer that makes downstream analytics, access control, and retention rules predictable; they tell integrators which value table to query and which coercions, comparisons, and aggregations are semantically valid.

The misc designation marks the payload column in typed value relations—the concrete fact stored under an entity–attribute binding. Misc is deliberately generic at the column level because the attribute type has already fixed interpretation: 2024-02-25T00:58:35 is a datetime misc value for an end_time on PROC-0001, while “closeout” and “pending” are varchar misc values that may denote phase or disposition on the same process family. Boolean misc values such as true for mandatory on FRAM-0001 through FRAM-0003, contrasted with false on FRAM-0004, support pass-fail governance queries without encoding policy logic into column names. Integer misc values (195, 63, 361) and decimal misc values (6219.83, 2715.88) further illustrate that misc is not “miscellaneous” in the informal sense but the normalized storage cell whose semantics are fully delegated to attr_id and attr_type. Operators rely on this pattern to ingest high-volume telemetry, normalize it into audit-grade facts, and expose it to reporting layers that filter by attribute rather than by physical table.

**t_subclass_to_process_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0004 | worker-07 |
| PROC-0002 | PROC-0001 | PROC-0005 | Log Level 02 |
| PROC-0003 | PROC-0001 | PROC-0006 | closeout |
| PROC-0004 | PROC-0001 | PROC-0010 | pending |
| PROC-0005 | PROC-0001 | PROC-0011 | Triggered By 05 |
| PROC-0006 | PROC-0002 | PROC-0004 | worker-07 |
| PROC-0007 | PROC-0002 | PROC-0005 | Log Level 07 |
| PROC-0008 | PROC-0002 | PROC-0006 | closeout |

Associations among entities require subject, target, and role when identity alone is insufficient to express directed meaning. In place-address modeling, ADDR-0001 as subject may link to ADDR-0003 as target with role contributor, while another pairing attaches ADDR-0004 to ADDR-0001 under the same contributor role and a separate edge assigns reviewer to a different postal_address_id. Role disambiguates parallel edges that would otherwise look like duplicate keys: two contributors and one reviewer on overlapping ADDR-0001 subjects encode distinct governance responsibilities—provenance, stewardship, or review—without duplicating the underlying Schema.org or postal-address records. Subject and target thereby orient the graph: the subject is the anchoring entity whose assertion is being made (a campus, institution, or society place), and the target is the related entity brought into scope (a postal address such as 2875 Broadway or 1000 Independence Ave). Framework membership uses the same directional idea under different column names, as when Network firewall, Threat detection, and Configuration baseline are recorded under_framework PROC-0005 while Session timeout is bound to PROC-0002, signaling which process subclass inherits enforcement context for each control.

Taken together, identifier, entity, attr, attr_type, misc, subject, target, and role form a layered evidence model suitable for compliance handbooks and operational guides. Identifiers and entities answer “what object,” attr and attr_type answer “what property under what contract,” misc answers “what was observed,” and subject–target–role triples answer “how objects relate with what capacity.” A reviewer examining incident response can follow PROC-0001 from process definition through typed attributes to worker-07, Log Level 02, and sub-hour-scale durations; the same examiner can pivot to FRAM-0001’s effective_date 2024-07-12 and mandatory true, then outward to postal-address roles that document who contributed or reviewed location data for international facilities. That composability is why these constructs matter in practice: they let heterogeneous operational telemetry, security controls, and bibliographic place data coexist in one governable fabric without sacrificing type safety, referential integrity, or the directed semantics that auditors require when reconstructing who knew what, about which entity, under which framework, at which time.

**t_subclass_to_process_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PROC-0001 | duration_seconds | xsd:decimal |
| PROC-0002 | end_time | xsd:dateTime |
| PROC-0003 | exit_code | xsd:integer |
| PROC-0004 | host_name | xsd:string |
| PROC-0005 | log_level | xsd:string |
| PROC-0006 | phase | xsd:string |
| PROC-0007 | retry_count | xsd:integer |
| PROC-0008 | scheduled_at | xsd:dateTime |

**t_subclass_to_process_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0003 | 684 |
| PROC-0002 | PROC-0001 | PROC-0007 | 195 |
| PROC-0003 | PROC-0002 | PROC-0003 | 63 |
| PROC-0004 | PROC-0002 | PROC-0007 | 361 |
| PROC-0005 | PROC-0003 | PROC-0003 | 107 |
| PROC-0006 | PROC-0003 | PROC-0007 | 1 |
| PROC-0007 | PROC-0004 | PROC-0003 | 32 |
| PROC-0008 | PROC-0004 | PROC-0007 | 2 |

**t_schemaorg_place_address__postal_address**

| id | schemaorg_id | postal_address_id | role |
| --- | --- | --- | --- |
| ADDR-0001 | ADDR-0001 | ADDR-0003 | contributor |
| ADDR-0002 | ADDR-0004 | ADDR-0001 | contributor |
| ADDR-0003 | ADDR-0001 | ADDR-0006 | reviewer |
| ADDR-0004 | ADDR-0001 | ADDR-0003 | contributor |
| ADDR-0005 | ADDR-0002 | ADDR-0005 | observer |
| ADDR-0006 | ADDR-0004 | ADDR-0005 | contributor |
| ADDR-0007 | ADDR-0004 | ADDR-0003 | owner |
| ADDR-0008 | ADDR-0003 | ADDR-0001 | observer |

**t_control_under_framework**

| id | control | under_framework |
| --- | --- | --- |
| FRAM-0001 | Network firewall | PROC-0005 |
| FRAM-0002 | Threat detection | PROC-0005 |
| FRAM-0003 | Session timeout | PROC-0002 |
| FRAM-0004 | Configuration baseline | PROC-0005 |
| FRAM-0005 | Vulnerability scan | PROC-0003 |
| FRAM-0006 | Access review | PROC-0004 |

**t_control_under_framework_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FRAM-0001 | effective_date | xsd:date |
| FRAM-0002 | enforcement | xsd:string |
| FRAM-0003 | mandatory | xsd:boolean |
| FRAM-0004 | priority | xsd:integer |
| FRAM-0005 | review_cycle_days | xsd:integer |
| FRAM-0006 | scope | xsd:string |
| FRAM-0007 | encoding | xsd:string |
| FRAM-0008 | label_text | xsd:string |

**t_control_under_framework_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0003 | true |
| FRAM-0002 | FRAM-0002 | FRAM-0003 | true |
| FRAM-0003 | FRAM-0003 | FRAM-0003 | true |
| FRAM-0004 | FRAM-0004 | FRAM-0003 | false |
| FRAM-0005 | FRAM-0005 | FRAM-0003 | false |
| FRAM-0006 | FRAM-0006 | FRAM-0003 | false |

**t_control_under_framework_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0001 | 2024-07-12 |
| FRAM-0002 | FRAM-0002 | FRAM-0001 | 2023-06-25 |
| FRAM-0003 | FRAM-0003 | FRAM-0001 | 2024-04-08 |
| FRAM-0004 | FRAM-0004 | FRAM-0001 | 2023-08-28 |
| FRAM-0005 | FRAM-0005 | FRAM-0001 | 2025-04-10 |
| FRAM-0006 | FRAM-0006 | FRAM-0001 | 2024-04-05 |

**t_control_under_framework_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0004 | 3 |
| FRAM-0002 | FRAM-0001 | FRAM-0005 | 104 |
| FRAM-0003 | FRAM-0002 | FRAM-0004 | 1 |
| FRAM-0004 | FRAM-0002 | FRAM-0005 | 994 |
| FRAM-0005 | FRAM-0003 | FRAM-0004 | 5 |
| FRAM-0006 | FRAM-0003 | FRAM-0005 | 358 |
| FRAM-0007 | FRAM-0004 | FRAM-0004 | 3 |
| FRAM-0008 | FRAM-0004 | FRAM-0005 | 95 |

**t_control_under_framework_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0007 | Encoding 01 |
| FRAM-0002 | FRAM-0001 | FRAM-0002 | Enforcement 02 |
| FRAM-0003 | FRAM-0001 | FRAM-0008 | pre-release note |
| FRAM-0004 | FRAM-0001 | FRAM-0009 | ja |
| FRAM-0005 | FRAM-0001 | FRAM-0006 | Scope 05 |
| FRAM-0006 | FRAM-0002 | FRAM-0007 | Encoding 06 |
| FRAM-0007 | FRAM-0002 | FRAM-0002 | Enforcement 07 |
| FRAM-0008 | FRAM-0002 | FRAM-0008 | calibration record |