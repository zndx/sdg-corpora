---
chapter_id: ch_live_descriptive_not_retracted_4bf939
topic_id: 187
family: 07_long_tail
cited_terms: ['descriptive_not_retracted', 'directive_only_governs_artifact', 'evidence_with_source']
model: engine-refine
---

In governed information systems, an entity is the durable object of record—the compliance artifact, descriptive instrument, or evidentiary source that auditors, operators, and downstream applications must be able to name, retrieve, and reason about without ambiguity. Each entity is bound to a stable identifier that functions as the canonical key across the registry: RETR-0001 designates a Sensor Drift Note, ARTI-0001 an ISO 27001 Security Policy, SOUR-0004 a Phase II Clinical Summary. Identifiers are not display text; they are the invariant handles through which relationships are asserted, values are attached, and lineage is preserved when human-readable titles repeat or evolve. Where RETR-0001 and RETR-0003 both carry the descriptive title Sensor Drift Note, the identifier remains the sole reliable discriminator, and every subsequent attribute assertion, governance link, and evidentiary cross-reference resolves through that key rather than through surface wording.

An attribute names what is being said about an entity—the measurable, classificatory, or temporal facet that the registry must hold distinctly from the entity itself. In the descriptive domain, confidence, dimension_kind, method, and recorded_at are declared as first-class properties; in the directive domain, effective_date, enforcement, mandatory, and priority perform the same role for compliance instruments. Attributes matter because they encode the vocabulary of control: without a normalized attr, the same fact cannot be queried consistently, validated uniformly, or compared across populations of records. The separation of entity from attr is what permits one Sensor Drift Note to carry a decimal confidence of 0.736 while another governed record carries an entirely different property set under the same organizational namespace, and what permits a GDPR Compliance Mandate and a PCI DSS v4.0 Compliance directive to share the attribute name mandatory while diverging in every other asserted dimension.

Attr type supplies the interpretive contract under which each attribute may legally hold data. Typing is expressed here through XML Schema datatypes—xsd:decimal for confidence, xsd:string for dimension_kind and enforcement, xsd:dateTime for recorded_at, xsd:date for effective_date, xsd:boolean for mandatory, xsd:integer for priority—and that declaration governs storage, comparison, and conformance checking before any value is accepted. A recorded_at assertion must parse as an instant in time (2024-02-12T07:34:36 for one lineage, 2025-01-21T18:04:20 for another); a mandatory flag must reduce to true or false, as when ISO 27001, SOC 2 Type II, and GDPR are marked true while PCI DSS v4.0 is marked false; a priority must remain integral (5 and 959 on one axis, 4 and 97 on another) rather than collapsing into free text. Attr type is therefore the enforcement layer that prevents semantically incompatible literals from entering the same logical slot, and it is what justifies partitioning persisted values into datatype-aligned stores rather than forcing all assertions through a single undifferentiated column.

The misc value is the instantiated fact—the literal payload stored once entity, attr, and attr type have already fixed the subject, predicate, and permissible shape of the assertion. Decimal misc holds quantities such as 0.736 and 0.217 confidence scores or 273.61 and 449.86 where measurement is required; varchar misc carries classifiers and encodings (Dimension Kind 01, Encoding 02, intake form) alongside short language tags; datetime misc anchors provenance in time; boolean misc states obligation; date misc fixes policy commencement (2023-09-27 through 2025-04-15 across directives); integer misc ranks urgency. Because the same attr_id may appear across multiple rows, misc is always read in conjunction with entity_id: RETR-0001 accumulates several distinct assertions—confidence, alternate decimal measures, varchar classifiers, and a recorded_at instant—while ARTI-0001 combines effective_date, enforcement text, mandatory truth, and priority rank into a composite regulatory profile. Misc is thus the evidentiary residue of the model: dense, typed, and joinable, but meaningless without the identifier triple that situates it.

**t_descriptive_not_retracted_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0004 | 2024-02-12T07:34:36 |
| RETR-0002 | RETR-0002 | RETR-0004 | 2024-08-04T13:26:29 |
| RETR-0003 | RETR-0003 | RETR-0004 | 2024-08-02T08:30:25 |
| RETR-0004 | RETR-0004 | RETR-0004 | 2025-01-21T18:04:20 |
| RETR-0005 | RETR-0005 | RETR-0004 | 2024-03-11T23:18:32 |
| RETR-0006 | RETR-0006 | RETR-0004 | 2024-12-14T04:10:36 |

**t_descriptive_not_retracted_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0001 | 0.736 |
| RETR-0002 | RETR-0001 | RETR-0005 | 273.61 |
| RETR-0003 | RETR-0001 | RETR-0007 | 449.86 |
| RETR-0004 | RETR-0002 | RETR-0001 | 0.217 |
| RETR-0005 | RETR-0002 | RETR-0005 | 724.88 |
| RETR-0006 | RETR-0002 | RETR-0007 | 500.73 |
| RETR-0007 | RETR-0003 | RETR-0001 | 0.920 |
| RETR-0008 | RETR-0003 | RETR-0005 | 966.69 |

Labeltext and language address the human-facing and jurisdictional dimensions that identifiers and typed misc alone cannot supply. Labeltext provides the controlled surface string presented to reviewers and intake workflows—intake form appears repeatedly across SOUR-0001, SOUR-0002, and SOUR-0004, while SOUR-0003 is labeled calibration record—allowing operators to recognize document class without exposing internal keys. Language tags qualify that surface for locale-appropriate handling and disclosure: fr for Francophone summaries, ja for a Japanese-localized workflow artifact, en for an English calibration record, with es appearing as a varchar misc on a descriptive entity where linguistic scope is itself an asserted property. Together, labeltext and language implement the presentation and communication layer of the registry; they do not replace attr and misc for machine validation, but they ensure that evidence objects such as OpenTelemetry Collector, GitHub Actions Workflow, Network Latency Benchmark, and Phase II Clinical Summary remain intelligible to humans and correctly scoped for multilingual compliance review while remaining tethered, through evidence_source and governs links, to the identifier-backed entities and directives that formally own them.

**t_descriptive_not_retracted_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RETR-0001 | RETR-0001 | RETR-0002 | Dimension Kind 01 |
| RETR-0002 | RETR-0001 | RETR-0008 | Encoding 02 |
| RETR-0003 | RETR-0001 | RETR-0009 | intake form |
| RETR-0004 | RETR-0001 | RETR-0010 | es |
| RETR-0005 | RETR-0001 | RETR-0003 | manual |
| RETR-0006 | RETR-0001 | RETR-0006 | ratio |
| RETR-0007 | RETR-0002 | RETR-0002 | Dimension Kind 07 |
| RETR-0008 | RETR-0002 | RETR-0008 | Encoding 08 |

**t_directive_only_governs_artifact**

| id | directive | governs |
| --- | --- | --- |
| ARTI-0001 | ISO 27001 Security Policy | SOUR-0004 |
| ARTI-0002 | SOC 2 Type II Standard | SOUR-0005 |
| ARTI-0003 | GDPR Compliance Mandate | SOUR-0002 |
| ARTI-0004 | PCI DSS v4.0 Compliance | SOUR-0003 |
| ARTI-0005 | FISMA Moderate Baseline | SOUR-0002 |
| ARTI-0006 | OWASP Top Ten Control | SOUR-0001 |
| ARTI-0007 | NIST Cybersecurity Framework | SOUR-0003 |

**t_directive_only_governs_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | effective_date | xsd:date |
| ARTI-0002 | enforcement | xsd:string |
| ARTI-0003 | mandatory | xsd:boolean |
| ARTI-0004 | priority | xsd:integer |
| ARTI-0005 | review_cycle_days | xsd:integer |
| ARTI-0006 | scope | xsd:string |
| ARTI-0007 | encoding | xsd:string |
| ARTI-0008 | label_text | xsd:string |

**t_directive_only_governs_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | false |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | true |
| ARTI-0007 | ARTI-0007 | ARTI-0003 | false |

**t_directive_only_governs_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-09-27 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2025-04-15 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-21 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2024-02-09 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2023-02-02 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-08-24 |
| ARTI-0007 | ARTI-0007 | ARTI-0001 | 2023-05-03 |

**t_directive_only_governs_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 5 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 959 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 4 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 97 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 5 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 179 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 4 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 356 |

**t_directive_only_governs_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | nightly summary |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | pre-release note |

**t_evidence_with_source**

| id | evidence | evidence_source | label_text | language |
| --- | --- | --- | --- | --- |
| SOUR-0001 | OpenTelemetry Collector | RETR-0006 | intake form | fr |
| SOUR-0002 | GitHub Actions Workflow | RETR-0003 | intake form | ja |
| SOUR-0003 | Network Latency Benchmark | RETR-0001 | calibration record | en |
| SOUR-0004 | Phase II Clinical Summary | RETR-0005 | intake form | fr |
| SOUR-0005 | Data Pipeline Integrity Check | RETR-0003 | calibration record | es |
| SOUR-0006 | Incident Root Cause Analysis | RETR-0005 | calibration record | en |

In operational practice, these constructs interlock into a traceable governance graph. Descriptive entities that are not retracted expose their property definitions through attr and attr_type, materialize them as misc across typed value relations, and surface selected literals—including language—as queryable facts. Directive entities bind to governed sources (SOUR-0004 through SOUR-0005, SOUR-0002, SOUR-0003) while their own attrs capture enforceability, scheduling, and rank. Evidence entities carry labeltext and language for operational recognition, yet resolve to underlying source identifiers such as RETR-0006, RETR-0003, RETR-0001, and RETR-0005 for audit reconstruction. Identifier stability, attr normalization, attr type discipline, typed misc storage, and localized labeltext thus form a single compliance architecture: entities name what is governed, attrs name what is known about it, attr types define how it may be known, misc records what was known, and labeltext with language ensure that what was known can be communicated faithfully across regimes and audiences without breaking the evidentiary chain.

**t_descriptive_not_retracted**

| id | descriptive | descriptive_2 |
| --- | --- | --- |
| RETR-0001 | Sensor Drift Note | Metadata Extension Record |
| RETR-0002 | Anomaly Flag Sheet | Batch Processing Note |
| RETR-0003 | Sensor Drift Note | Calibration Reference Sheet |
| RETR-0004 | Metadata Index Card | Anomaly Classification Code |
| RETR-0005 | Data Quality Memo | Data Quality Metric Card |
| RETR-0006 | Observation Summary | Anomaly Classification Code |

**t_descriptive_not_retracted_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RETR-0001 | confidence | xsd:decimal |
| RETR-0002 | dimension_kind | xsd:string |
| RETR-0003 | method | xsd:string |
| RETR-0004 | recorded_at | xsd:dateTime |
| RETR-0005 | uncertainty | xsd:decimal |
| RETR-0006 | unit | xsd:string |
| RETR-0007 | value | xsd:decimal |
| RETR-0008 | encoding | xsd:string |