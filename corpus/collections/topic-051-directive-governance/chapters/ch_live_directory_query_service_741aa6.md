---
chapter_id: ch_live_directory_query_service_741aa6
topic_id: 51
family: 08_derived
cited_terms: ['directory_query_service', 'lift_with_support_count', 'evidence_at_quality_tier']
model: engine-refine
---

Service observability and compliance reporting depend on a small set of recurring metadata primitives that govern how events are classified, attributed, and traced through downstream response chains. The identifier anchors every such record: a stable, opaque key—SERV-0001 through SERV-0004 in the service directory, COUN-0001 through COUN-0004 for lift-and-support-count entities, TIER-0001 through TIER-0004 for evidence-at-quality-tier records—that survives relabeling, reclassification, and schema evolution. Without identifier discipline, cross-table joins between operational facts and descriptive dimensions collapse; auditors cannot reconstruct which service instance produced which evidence bundle, and governance workflows lose the thread when category labels change but the underlying entity persists.

**t_lift_with_support_count**

| id | lift | support_count |
| --- | --- | --- |
| COUN-0001 | signal amplification lift | 32768 |
| COUN-0002 | data pipeline lift | 2048 |
| COUN-0003 | sensor drift lift | 16384 |
| COUN-0004 | sensor drift lift | 2048 |
| COUN-0005 | fuel economy lift | 65536 |
| COUN-0006 | aerodynamic lift | 1024 |
| COUN-0007 | signal amplification lift | 32768 |
| COUN-0008 | latency reduction lift | 2048 |

**t_evidence_at_quality_tier**

| id | evidence | at_quality_tier |
| --- | --- | --- |
| TIER-0001 | network packets | qualified |
| TIER-0002 | audit trails | silver-tier |
| TIER-0003 | network packets | gold-tier |
| TIER-0004 | inspection photos | accredited |
| TIER-0005 | telemetry streams | platinum-tier |
| TIER-0006 | field measurements | certified |
| TIER-0007 | device firmware | archival |
| TIER-0008 | audit trails | validated |

Targets user and generates response name the two principal relational roles that connect an observed event to the actors and outcomes it implicates. Targets user designates the subject or recipient of an interaction—the party whose state, permissions, or exposure the event concerns—while generates response designates the downstream artefact or behaviour the same interaction is expected to produce. In the service directory, SERV-0001 records 315 events whose targets_user_key resolves to SERV-0006 and whose generates_response_key resolves to SERV-0007; SERV-0004, by contrast, accumulates 397 events yet points to SERV-0002 for both roles, illustrating how volume alone does not determine role assignment. Dimension tables enrich these keys with human-readable misc labels—Targets User Label 01 through Targets User Label 04, Generates Response Label 01 through Generates Response Label 04—and with category values that place each label into a coarser governance bucket: Targets User Category 01 through Targets User Category 04, Generates Response Category 01 through Generates Response Category 04. Category thus supplies the taxonomic layer auditors query when they need cohort-level assurance rather than row-level drill-down; misc supplies the operational layer operators read during incident triage.

Event count is the quantitative measure carried on the fact grain: a non-key numeric field that aggregates how often a given service identifier, targets-user pairing, and generates-response pairing has been observed within the reporting window. The spread across SERV-0001 (315), SERV-0002 (259), SERV-0003 (81), and SERV-0004 (397) signals heterogeneous traffic profiles that compliance thresholds must treat differently—a low-count service may warrant exemption from certain controls, whereas a high-count service may trigger enhanced sampling. Event count does not interpret itself; it gains meaning only when joined through identifier to the dimensional roles and, where applicable, to entity-level attribute evidence that explains why counts diverge.

**fact_directory**

| id | targets_user_key | generates_response_key | event_count |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0006 | SERV-0007 | 315 |
| SERV-0002 | SERV-0002 | SERV-0002 | 259 |
| SERV-0003 | SERV-0001 | SERV-0006 | 81 |
| SERV-0004 | SERV-0002 | SERV-0005 | 397 |

Entity, attr, and attr type implement the extensible attribute model that hangs qualitative and typed metadata off each governed object without proliferating fixed columns. An entity is the thing being described—COUN-0001 as a lift-with-support-count record characterised as signal amplification lift with support_count 32768, or TIER-0001 as evidence classified as network packets at quality tier qualified. Attr names the facet under measurement: confidence, dimension_kind, method, recorded_at recur identically across both entity families, signalling a shared attribute vocabulary enforced organisation-wide. Attr type declares the XSD datatype governing storage and validation—xsd:decimal for confidence scores such as 0.849 on COUN-0001 and 0.731 on TIER-0001, xsd:string for dimension_kind values like Dimension Kind 01 and method descriptors such as nightly summary or change rationale, xsd:dateTime for recorded_at stamps including 2024-12-28T07:07:56 on COUN-0001 and 2024-11-19T18:15:43 on TIER-0001. Partitioning values into type-specific misc stores (decimal, varchar, datetime) preserves type safety at ingest and allows policy engines to apply decimal-range checks, string-enumeration rules, and temporal freshness windows without casting errors.

**t_lift_with_support_count_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0004 | 2024-12-28T07:07:56 |
| COUN-0002 | COUN-0002 | COUN-0004 | 2023-08-28T07:06:53 |
| COUN-0003 | COUN-0003 | COUN-0004 | 2023-06-25T23:08:52 |
| COUN-0004 | COUN-0004 | COUN-0004 | 2024-05-16T16:03:55 |
| COUN-0005 | COUN-0005 | COUN-0004 | 2024-10-22T12:30:05 |
| COUN-0006 | COUN-0006 | COUN-0004 | 2023-09-08T00:35:07 |
| COUN-0007 | COUN-0007 | COUN-0004 | 2025-05-03T04:02:17 |
| COUN-0008 | COUN-0008 | COUN-0004 | 2024-04-02T09:45:25 |

**t_lift_with_support_count_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0002 | Dimension Kind 01 |
| COUN-0002 | COUN-0001 | COUN-0008 | Encoding 02 |
| COUN-0003 | COUN-0001 | COUN-0009 | nightly summary |
| COUN-0004 | COUN-0001 | COUN-0010 | es |
| COUN-0005 | COUN-0001 | COUN-0003 | hybrid |
| COUN-0006 | COUN-0001 | COUN-0006 | ratio |
| COUN-0007 | COUN-0002 | COUN-0002 | Dimension Kind 07 |
| COUN-0008 | COUN-0002 | COUN-0008 | Encoding 08 |

**t_evidence_at_quality_tier_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2024-11-19T18:15:43 |
| TIER-0002 | TIER-0002 | TIER-0004 | 2023-02-10T23:54:33 |
| TIER-0003 | TIER-0003 | TIER-0004 | 2023-06-07T05:45:43 |
| TIER-0004 | TIER-0004 | TIER-0004 | 2024-08-05T11:37:21 |
| TIER-0005 | TIER-0005 | TIER-0004 | 2025-03-30T21:54:34 |
| TIER-0006 | TIER-0006 | TIER-0004 | 2023-10-26T18:53:01 |
| TIER-0007 | TIER-0007 | TIER-0004 | 2023-09-26T03:30:22 |
| TIER-0008 | TIER-0008 | TIER-0004 | 2023-04-10T10:08:00 |

**t_evidence_at_quality_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0002 | Dimension Kind 01 |
| TIER-0002 | TIER-0001 | TIER-0008 | Encoding 02 |
| TIER-0003 | TIER-0001 | TIER-0009 | change rationale |
| TIER-0004 | TIER-0001 | TIER-0010 | ja |
| TIER-0005 | TIER-0001 | TIER-0003 | hybrid |
| TIER-0006 | TIER-0001 | TIER-0006 | kg |
| TIER-0007 | TIER-0002 | TIER-0002 | Dimension Kind 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | Encoding 08 |

In practice, investigators traverse from event_count on the fact grain through identifier joins into targets user and generates response dimensions for role and category context, then descend into entity attribute graphs when they require evidentiary substantiation. A sensor drift lift on COUN-0003 and COUN-0004—each with support_count 16384 and 2048 respectively—may share a lift classification yet diverge in confidence (0.258 on COUN-0002's decimal slice) and recorded_at lineage, demonstrating why entity-level attrs must not be inferred from aggregate counts alone. Likewise, network packets appearing at both silver-tier (TIER-0002) and gold-tier (TIER-0003) quality tiers show that identical evidence types demand tier-specific misc qualifiers—Encoding 02, locale markers such as es and ja—before accreditation status can be affirmed. Misc, in this architecture, is therefore not miscellaneous in the colloquial sense but the typed payload field that carries every attribute value whose semantics exceed what category and attr name alone can express.

**dim_targets_user**

| id | targets_user_label | targets_user_category |
| --- | --- | --- |
| SERV-0001 | Targets User Label 01 | Targets User Category 01 |
| SERV-0002 | Targets User Label 02 | Targets User Category 02 |
| SERV-0003 | Targets User Label 03 | Targets User Category 03 |
| SERV-0004 | Targets User Label 04 | Targets User Category 04 |
| SERV-0005 | Targets User Label 05 | Targets User Category 05 |
| SERV-0006 | Targets User Label 06 | Targets User Category 06 |

**dim_generates_response**

| id | generates_response_label | generates_response_category |
| --- | --- | --- |
| SERV-0001 | Generates Response Label 01 | Generates Response Category 01 |
| SERV-0002 | Generates Response Label 02 | Generates Response Category 02 |
| SERV-0003 | Generates Response Label 03 | Generates Response Category 03 |
| SERV-0004 | Generates Response Label 04 | Generates Response Category 04 |
| SERV-0005 | Generates Response Label 05 | Generates Response Category 05 |
| SERV-0006 | Generates Response Label 06 | Generates Response Category 06 |
| SERV-0007 | Generates Response Label 07 | Generates Response Category 07 |
| SERV-0008 | Generates Response Label 08 | Generates Response Category 08 |

**t_lift_with_support_count_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COUN-0001 | confidence | xsd:decimal |
| COUN-0002 | dimension_kind | xsd:string |
| COUN-0003 | method | xsd:string |
| COUN-0004 | recorded_at | xsd:dateTime |
| COUN-0005 | uncertainty | xsd:decimal |
| COUN-0006 | unit | xsd:string |
| COUN-0007 | value | xsd:decimal |
| COUN-0008 | encoding | xsd:string |

**t_lift_with_support_count_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COUN-0001 | COUN-0001 | COUN-0001 | 0.849 |
| COUN-0002 | COUN-0001 | COUN-0005 | 945.35 |
| COUN-0003 | COUN-0001 | COUN-0007 | 331.44 |
| COUN-0004 | COUN-0002 | COUN-0001 | 0.258 |
| COUN-0005 | COUN-0002 | COUN-0005 | 675.58 |
| COUN-0006 | COUN-0002 | COUN-0007 | 197.74 |
| COUN-0007 | COUN-0003 | COUN-0001 | 0.111 |
| COUN-0008 | COUN-0003 | COUN-0005 | 368.51 |

**t_evidence_at_quality_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | confidence | xsd:decimal |
| TIER-0002 | dimension_kind | xsd:string |
| TIER-0003 | method | xsd:string |
| TIER-0004 | recorded_at | xsd:dateTime |
| TIER-0005 | uncertainty | xsd:decimal |
| TIER-0006 | unit | xsd:string |
| TIER-0007 | value | xsd:decimal |
| TIER-0008 | encoding | xsd:string |

**t_evidence_at_quality_tier_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 0.731 |
| TIER-0002 | TIER-0001 | TIER-0005 | 574.79 |
| TIER-0003 | TIER-0001 | TIER-0007 | 563.53 |
| TIER-0004 | TIER-0002 | TIER-0001 | 0.358 |
| TIER-0005 | TIER-0002 | TIER-0005 | 139.04 |
| TIER-0006 | TIER-0002 | TIER-0007 | 944.94 |
| TIER-0007 | TIER-0003 | TIER-0001 | 0.228 |
| TIER-0008 | TIER-0003 | TIER-0005 | 33.93 |

Operational governance treats these primitives as a contract: identifier for immutability, category for rollup, targets user and generates response for causal linkage, event count for exposure measurement, and the entity–attr–attr_type–misc chain for defensible, machine-validated detail. Teams that maintain the contract can answer, for any SERV-0003 record with 81 events, which user category was targeted, which response category was generated, which COUN or TIER entity substantiates the finding, and whether confidence, method, and recorded_at values satisfy the control definition—without ad hoc relabelling or untyped side tables. That closure between aggregate fact, dimensional role, and typed entity evidence is what transforms raw counters into audit-ready assertions.