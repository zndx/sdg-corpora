---
chapter_id: ch_live_trace_subclass_6dfc54
topic_id: 26
family: 02_observation_measurement
cited_terms: ['trace_subclass', 'soc2_security_subclass', 'lineage_edge_max_one_target']
model: engine-refine
---

In governed distributed systems, every auditable fact begins with a stable identifier that survives renames, redeployments, and cross-system joins. Identifiers such as TRAC-0002 or SECU-0003 are not display labels; they are durable keys that bind operational telemetry to compliance metadata and lineage assertions without ambiguity. Governance frameworks depend on this immutability because auditors, incident responders, and automated policy engines must resolve the same object across fact tables, dimension tables, and typed value stores months or years after an event occurred. When a trace record keyed TRAC-0004 is correlated with a span dimension row and later with a SOC 2 security subclass, the identifier is the contract that makes the correlation legally and operationally defensible rather than anecdotal.

**t_soc2_security_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| SECU-0001 | SOC2-CloudInfra | Virtual Networks |
| SECU-0002 | SOC3-Public | Microservice Mesh |
| SECU-0003 | SOC2-Fintech | Database Clusters |
| SECU-0004 | SOC2-IdentityProvider | Microservice Mesh |
| SECU-0005 | SOC2-SaaS | Data Warehouses |
| SECU-0006 | SOC2-TypeII | Database Clusters |
| SECU-0007 | SOC2-SaaS | Database Clusters |

**t_soc2_security_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECU-0001 | effective_date | xsd:date |
| SECU-0002 | enforcement | xsd:string |
| SECU-0003 | mandatory | xsd:boolean |
| SECU-0004 | priority | xsd:integer |
| SECU-0005 | review_cycle_days | xsd:integer |
| SECU-0006 | scope | xsd:string |
| SECU-0007 | encoding | xsd:string |
| SECU-0008 | label_text | xsd:string |

Spans are the granular units of distributed execution whose labels and categorical placement explain what work was performed and under which operational class it falls. A span labeled “Spans Label 02” may roll up to “Spans Category 02” while also referencing a canonical category identifier such as TRAC-0006, illustrating how human-readable classification and normalized category keys coexist: operators read labels during triage, while reporting and policy engines join on stable category references. Category therefore functions as both taxonomy and control surface—grouping telemetry for SLA review, capacity planning, and control scoping—so that duration, exit status, and retry behavior can be interpreted in context rather than as isolated numbers.

**dim_spans_category**

| id | category_name |
| --- | --- |
| TRAC-0001 | Category Name 01 |
| TRAC-0002 | Category Name 02 |
| TRAC-0003 | Category Name 03 |
| TRAC-0004 | Category Name 04 |
| TRAC-0005 | Category Name 05 |
| TRAC-0006 | Category Name 06 |

Duration in seconds, exit codes, and retry counts translate span-level activity into measurable reliability and performance evidence. A trace enduring 3,940.66 seconds with exit code 420 and 396 retries signals a different failure mode than one completing in 1,874.27 seconds with exit 491 after 399 retries; together these fields support mean-time-to-recovery analysis, error-budget consumption, and automated escalation rules. Exit codes function as terminal state declarations—success, partial success, or classified failure—while retry count exposes resilience policy in action: high counts may indicate brittle downstream dependencies, misconfigured backoff, or deliberate idempotent replay under load. Compliance and SRE teams use these measures to demonstrate that monitoring controls detect anomalies and that incident timelines can be reconstructed from objective telemetry rather than narrative recall.

Entity-centric attribute modeling extends the same discipline to security and compliance subclasses, where each entity (for example SOC2-CloudInfra mapped to Virtual Networks, or SOC2-Fintech mapped to Database Clusters) carries typed attributes rather than a flat bag of strings. An attribute such as effective_date is declared with attr_type xsd:date and materialized as values like 2023-08-15 or 2025-05-01; mandatory is xsd:boolean with true/false assignments per entity; priority is xsd:integer ranging from 1 to 926; enforcement and related varchar fields are xsd:string, holding values such as “Enforcement 02” or “audit excerpt.” Separating attr from attr_type from misc-valued storage is a governance necessity: it enforces schema validation at ingestion, prevents type coercion errors in reporting, and allows policies to target specific attribute semantics—dates for control effective periods, booleans for non-negotiable requirements, integers for ranked remediation—without conflating them in a single untyped column.

**t_soc2_security_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0003 | true |
| SECU-0002 | SECU-0002 | SECU-0003 | false |
| SECU-0003 | SECU-0003 | SECU-0003 | true |
| SECU-0004 | SECU-0004 | SECU-0003 | false |
| SECU-0005 | SECU-0005 | SECU-0003 | false |
| SECU-0006 | SECU-0006 | SECU-0003 | false |
| SECU-0007 | SECU-0007 | SECU-0003 | false |

**t_soc2_security_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0001 | 2023-08-15 |
| SECU-0002 | SECU-0002 | SECU-0001 | 2024-04-12 |
| SECU-0003 | SECU-0003 | SECU-0001 | 2024-01-26 |
| SECU-0004 | SECU-0004 | SECU-0001 | 2025-05-01 |
| SECU-0005 | SECU-0005 | SECU-0001 | 2023-05-03 |
| SECU-0006 | SECU-0006 | SECU-0001 | 2025-05-11 |
| SECU-0007 | SECU-0007 | SECU-0001 | 2024-10-21 |

**t_soc2_security_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0004 | 5 |
| SECU-0002 | SECU-0001 | SECU-0005 | 926 |
| SECU-0003 | SECU-0002 | SECU-0004 | 1 |
| SECU-0004 | SECU-0002 | SECU-0005 | 849 |
| SECU-0005 | SECU-0003 | SECU-0004 | 2 |
| SECU-0006 | SECU-0003 | SECU-0005 | 409 |
| SECU-0007 | SECU-0004 | SECU-0004 | 5 |
| SECU-0008 | SECU-0004 | SECU-0005 | 551 |

**t_soc2_security_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0007 | Encoding 01 |
| SECU-0002 | SECU-0001 | SECU-0002 | Enforcement 02 |
| SECU-0003 | SECU-0001 | SECU-0008 | audit excerpt |
| SECU-0004 | SECU-0001 | SECU-0009 | de |
| SECU-0005 | SECU-0001 | SECU-0006 | Scope 05 |
| SECU-0006 | SECU-0002 | SECU-0007 | Encoding 06 |
| SECU-0007 | SECU-0002 | SECU-0002 | Enforcement 07 |
| SECU-0008 | SECU-0002 | SECU-0008 | audit excerpt |

Misc, in this architecture, is not ambiguity but a deliberate polymorphic value slot whose interpretation is always resolved through the pairing of entity and attr (and, implicitly, attr_type). The same misc column holds span labels, boolean mandates, calendar dates, numeric priorities, and short varchar enforcement text because downstream consumers never read misc in isolation; they resolve entity_id and attr_id first, then apply the declared type. That pattern mirrors how mature GRC platforms store evidence: the fact of record is typed and attributable, while presentation layers render human meaning. Auditors care because misc without entity and attr context would be inadmissible; with that context, even terse values like “de” or “Encoding 01” become inspectable claims attached to identifiable controls.

Subject and role complete the picture by documenting lineage—who or what contributed to an artifact and with what authority. In a max-one-target lineage pattern, a subject such as TARG-0006 or TARG-0003 links to destinations including a compliance audit log, feature vector store, or executive dashboard, while role distinguishes contributor from owner. A contributor edge to a risk scoring model differs materially from an owner edge to the same class of target: contributors supply inputs or transformations; owners bear accountability for correctness, retention, and control applicability. Lineage strings such as “Sensor calibration chain” or “Feature store refresh” name the procedural thread, but subject and role supply the accountability graph required for SOC 2 lineage expectations, data-quality investigations, and breach scoping. Identifier, spans, category, duration, exit, retry count, entity, attr, attr_type, misc, subject, and role are thus interlocking evidence primitives: telemetry proves what ran and how it behaved; typed attributes prove what controls applied and when; lineage proves how data and decisions propagated—and together they allow an organization to answer, with cited values and stable keys, not only whether a control existed but whether it was operative, measurable, and traceable at the time of execution.

**fact_trace**

| id | spans_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| TRAC-0001 | TRAC-0005 | 1874.27 | 491 | 399 |
| TRAC-0002 | TRAC-0002 | 2092.44 | 900 | 179 |
| TRAC-0003 | TRAC-0004 | 3940.66 | 420 | 396 |
| TRAC-0004 | TRAC-0006 | 3336.66 | 60 | 459 |

**dim_spans**

| id | spans_label | spans_category | category_id |
| --- | --- | --- | --- |
| TRAC-0001 | Spans Label 01 | Spans Category 01 | TRAC-0001 |
| TRAC-0002 | Spans Label 02 | Spans Category 02 | TRAC-0006 |
| TRAC-0003 | Spans Label 03 | Spans Category 03 | TRAC-0006 |
| TRAC-0004 | Spans Label 04 | Spans Category 04 | TRAC-0003 |
| TRAC-0005 | Spans Label 05 | Spans Category 05 | TRAC-0003 |
| TRAC-0006 | Spans Label 06 | Spans Category 06 | TRAC-0006 |

**t_lineage_edge_max_one_target**

| id | lineage |
| --- | --- |
| TARG-0001 | Sensor calibration chain |
| TARG-0002 | Sensor calibration chain |
| TARG-0003 | Feature store refresh |
| TARG-0004 | Sensor calibration chain |
| TARG-0005 | Feature store refresh |
| TARG-0006 | Model training pipeline |

**t_lineage_edge_max_one_target_to_target**

| id | to_target |
| --- | --- |
| TARG-0001 | Compliance audit log |
| TARG-0002 | Risk scoring model |
| TARG-0003 | Feature vector store |
| TARG-0004 | Executive dashboard |
| TARG-0005 | Executive summary report |
| TARG-0006 | Data lake staging area |
| TARG-0007 | Executive summary report |
| TARG-0008 | ML inference endpoint |

**t_lineage_edge_max_one_target__to_target**

| id | lineage_id | to_target_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0006 | TARG-0001 | contributor |
| TARG-0002 | TARG-0001 | TARG-0003 | owner |
| TARG-0003 | TARG-0003 | TARG-0005 | owner |
| TARG-0004 | TARG-0003 | TARG-0006 | contributor |
| TARG-0005 | TARG-0002 | TARG-0008 | owner |
| TARG-0006 | TARG-0006 | TARG-0004 | contributor |
| TARG-0007 | TARG-0006 | TARG-0006 | observer |
| TARG-0008 | TARG-0002 | TARG-0008 | reviewer |