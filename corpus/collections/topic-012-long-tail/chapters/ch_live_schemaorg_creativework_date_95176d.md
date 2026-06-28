---
chapter_id: ch_live_schemaorg_creativework_date_95176d
topic_id: 12
family: 07_long_tail
cited_terms: ['schemaorg_creativework_date', 'audit_produces_evidence', 'syscall_at_security_tier']
model: engine-refine
---

Security tier classification anchors how monitored system activity is segmented, aggregated, and interpreted within a compliance-oriented telemetry fabric. Each tier receives a stable identifier—TIER-0001 through TIER-0004 in the reference corpus—and carries a human-readable label together with a categorical assignment that situates the tier within a broader control taxonomy. At Security Tier Category 03, for instance, pairs with At Security Tier Label 03 under identifier TIER-0003, while Category 04 and Label 04 attach to TIER-0004; these category and misc (miscellaneous descriptive) fields do not themselves record events but supply the dimensional semantics required to roll raw observations into auditable summaries. Event count then quantifies exposure or activity volume at each tier: the fact grain records 238 events against TIER-0003, 52 against TIER-0001, 198 against TIER-0005, and 382 against TIER-0004, demonstrating how a single analytic measure—event_count—depends on identifier-resolved tier keys to remain joinable, reproducible, and defensible under scrutiny.

**dim_at_security_tier**

| id | at_security_tier_label | at_security_tier_category |
| --- | --- | --- |
| TIER-0001 | At Security Tier Label 01 | At Security Tier Category 01 |
| TIER-0002 | At Security Tier Label 02 | At Security Tier Category 02 |
| TIER-0003 | At Security Tier Label 03 | At Security Tier Category 03 |
| TIER-0004 | At Security Tier Label 04 | At Security Tier Category 04 |
| TIER-0005 | At Security Tier Label 05 | At Security Tier Category 05 |
| TIER-0006 | At Security Tier Label 06 | At Security Tier Category 06 |

Identifier discipline extends beyond security telemetry into provenance-rich knowledge graphs where creative works, publication instants, and accountable parties must remain disambiguated across time. DATE-0001, DATE-0002, DATE-0003, and DATE-0004 each denote distinct creative-work date records—Quantum Error Correction, Human Genome Release (appearing twice under separate identifiers), and OAuth 2.0 Guidelines—while companion publication values such as 2024-05-11, 2022-11-05, 2023-12-01, and 2023-04-12 attach as typed temporal facts rather than as free text embedded in titles. Relational integrity is expressed through subject–target bindings enriched by role: a subject reference to schemaorg_id DATE-0006 paired with target date_published_id DATE-0004 and role owner establishes custodial authority over a publication binding, whereas contributor and observer roles on alternate pairings (DATE-0006→DATE-0001, DATE-0005→DATE-0001, DATE-0005→DATE-0002) encode differentiated participation without collapsing distinct agents into undifferentiated metadata. Role therefore functions as a governance primitive—owner, contributor, observer are not decorative labels but operational qualifiers that determine how downstream reviewers weight assertions, attribute accountability, and reconcile conflicting lineage.

**t_schemaorg_creativework_date**

| id | schemaorg |
| --- | --- |
| DATE-0001 | Quantum Error Correction |
| DATE-0002 | Human Genome Release |
| DATE-0003 | OAuth 2.0 Guidelines |
| DATE-0004 | Human Genome Release |
| DATE-0005 | Human Genome Release |
| DATE-0006 | OpenTelemetry Specification |

**t_schemaorg_creativework_date_date_published**

| id | date_published |
| --- | --- |
| DATE-0001 | 2024-05-11 |
| DATE-0002 | 2022-11-05 |
| DATE-0003 | 2023-12-01 |
| DATE-0004 | 2023-04-12 |
| DATE-0005 | 2023-12-01 |
| DATE-0006 | 2024-01-18 |

**t_schemaorg_creativework_date__date_published**

| id | schemaorg_id | date_published_id | role |
| --- | --- | --- | --- |
| DATE-0001 | DATE-0006 | DATE-0004 | owner |
| DATE-0002 | DATE-0006 | DATE-0001 | contributor |
| DATE-0003 | DATE-0005 | DATE-0001 | contributor |
| DATE-0004 | DATE-0005 | DATE-0002 | observer |
| DATE-0005 | DATE-0005 | DATE-0005 | owner |
| DATE-0006 | DATE-0003 | DATE-0005 | owner |
| DATE-0007 | DATE-0004 | DATE-0004 | observer |
| DATE-0008 | DATE-0004 | DATE-0004 | owner |

Entity-centric attribute modeling supplies the evidentiary substrate on which audits rest, separating what is being described from how it is typed and what value it holds. Audit artifacts identified as EVID-0001 through EVID-0004 correspond to concrete assurance activities—Data Retention Policy Audit, ISO27001 Certification, and duplicate Cloud Infrastructure Scan entries—each treated as an entity that may accumulate multiple attrs (attributes) governed by attr_type declarations. Attribute name confidence is constrained to xsd:decimal and therefore lands in decimal-valued stores as 0.658, 0.814, and related magnitudes; dimension_kind as xsd:string accepts lexical misc values such as Dimension Kind 01 and Encoding 02; method as xsd:string captures procedural misc like calibration record; recorded_at as xsd:dateTime normalizes temporal misc including 2025-03-28T10:19:21, 2023-02-07T18:23:26, 2025-03-19T12:10:16, and 2023-11-17T00:14:22. The attr_type functions as a contract: it dictates validation rules, storage partition, and interchange semantics before any misc payload is accepted, preventing category errors that would otherwise corrupt cross-audit comparison.

In practice, entity, attr, and misc compose an extensible evidence pattern well suited to heterogeneous compliance domains where every audit need not share an identical column layout yet must remain queryable under common governance rules. The same entity_id EVID-0001 may simultaneously own a confidence decimal (0.658), a dimension_kind varchar (Dimension Kind 01), an encoding-related varchar (Encoding 02), a method varchar (calibration record), and a language misc (en), each bound through attr_id references that preserve referential discipline across val_decimal, val_varchar, and val_datetime partitions. This separation matters because assurance workflows rarely reduce to scalars: ISO27001 Certification (EVID-0002) records confidence 0.814 alongside a recorded_at instant of 2023-02-07T18:23:26, while Cloud Infrastructure Scan evidence (EVID-0003, EVID-0004) interleaves high-magnitude decimal observations—291.89, 838.98—with scan timestamps that establish freshness and retention alignment. Reviewers therefore reason over entities as bundles of typed assertions, not as monolithic rows, which is why attr typing precedes value capture in well-formed pipelines.

**t_audit_produces_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2025-03-28T10:19:21 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-02-07T18:23:26 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2025-03-19T12:10:16 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2023-11-17T00:14:22 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2023-04-23T17:18:39 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-01-14T13:39:09 |

**t_audit_produces_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.658 |
| EVID-0002 | EVID-0001 | EVID-0005 | 291.89 |
| EVID-0003 | EVID-0001 | EVID-0007 | 838.98 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.814 |
| EVID-0005 | EVID-0002 | EVID-0005 | 409.44 |
| EVID-0006 | EVID-0002 | EVID-0007 | 534.69 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.935 |
| EVID-0008 | EVID-0003 | EVID-0005 | 954.22 |

**t_audit_produces_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | calibration record |
| EVID-0004 | EVID-0001 | EVID-0010 | en |
| EVID-0005 | EVID-0001 | EVID-0003 | manual |
| EVID-0006 | EVID-0001 | EVID-0006 | deg_C |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

Category, security tier, event_count, and role interoperate when organizations must connect operational telemetry to documentary evidence and bibliographic lineage within one accountability frame. Security tier category supplies the control-family lens through which syscall volumes are interpreted—382 events at tier key TIER-0004 versus 52 at TIER-0001 may trigger different escalation thresholds depending on category placement—while parallel subject–target graphs explain who asserted which publication fact under which role, and audit entities document whether those interpretations were validated by methodical review with recorded confidence and timestamps. Identifier stability is the linchpin across these subsystems: DATE-0005 and DATE-0006, EVID-0004, and TIER-0003 must resolve identically in extracts, dashboards, and regulator-facing disclosures. Where identifiers drift or roles collapse to undifferentiated links, event_count aggregates lose their tier meaning, misc values lose type safety, and entities cease to function as durable evidence carriers—outcomes that formal governance frameworks treat as failures of traceability rather than mere data-quality nuisances.

**t_audit_produces_evidence**

| id | audit |
| --- | --- |
| EVID-0001 | Data Retention Policy Audit |
| EVID-0002 | ISO27001 Certification |
| EVID-0003 | Cloud Infrastructure Scan |
| EVID-0004 | Cloud Infrastructure Scan |
| EVID-0005 | Data Retention Policy Audit |
| EVID-0006 | Data Retention Policy Audit |

**fact_syscall**

| id | at_security_tier_key | event_count |
| --- | --- | --- |
| TIER-0001 | TIER-0003 | 238 |
| TIER-0002 | TIER-0001 | 52 |
| TIER-0003 | TIER-0005 | 198 |
| TIER-0004 | TIER-0004 | 382 |
| TIER-0005 | TIER-0001 | 283 |
| TIER-0006 | TIER-0002 | 288 |

Operational teams implement these constructs by enforcing tier-keyed aggregation jobs that increment event_count only after category and label dimensions are validated, by routing attr writes through attr_type gates before persisting misc payloads, and by treating owner versus contributor versus observer roles as authorization-adjacent metadata in publication graphs. The reference values—Human Genome Release spanning 2023-04-12 and 2022-11-05 under distinct identifiers, OAuth 2.0 Guidelines dated 2023-12-01, Quantum Error Correction dated 2024-05-11—illustrate why subject and target must remain explicit when the same canonical title recurs across time. Likewise, duplicate Cloud Infrastructure Scan audits differentiated only by recorded_at and confidence demonstrate why entity granularity and typed attrs outperform flattened spreadsheets for defensible compliance reporting. Taken together, security tier, category, event_count, identifier, entity, attr, attr_type, misc, role, subject, and target form a coherent vocabulary for describing who did what, to which object, under which control tier, with what measured activity, supported by what typed evidence, and recorded when—precisely the crosswalk modern assurance programs require when telemetry, policy audits, and scholarly or standards metadata must be read as mutually reinforcing facts rather than isolated inventories.

**t_audit_produces_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |