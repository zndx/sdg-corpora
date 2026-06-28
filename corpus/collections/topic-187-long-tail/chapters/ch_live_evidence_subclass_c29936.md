---
chapter_id: ch_live_evidence_subclass_c29936
topic_id: 187
family: 06_belief_structure
cited_terms: ['evidence_subclass', 'evidence_with_mass_function', 'evidence_with_source']
model: engine-refine
---

Evidence in analytical systems is never a monolith; it is stratified along multiple orthogonal axes that together determine how a datum may be consumed, weighted, and traced. An identifier serves as the immutable anchor for each evidence item, a stable key that survives across provenance, classification, and probabilistic modelling layers. The same underlying artefact—telemetry dump, for instance—may appear under the identifier EVID-0003 in one classification context, FUNC-0003 in a mass-function context, and SOUR-0004 in a provenance context, each registration carrying its own metadata envelope without altering the core observation. This multiplicity of registration is not redundancy but a deliberate design: it permits the evidence to be addressed by the lens most appropriate to the downstream task, whether that task is claim evaluation, dimensional calibration, or source attribution.

**t_evidence_subclass**

| id | evidence | supports_claim | uncertainty | language |
| --- | --- | --- | --- | --- |
| EVID-0001 | batch production record | Memory leak detected | 777.57 | ja |
| EVID-0002 | SOC 2 Audit Report | GDPR compliance met | 535.87 | es |
| EVID-0003 | Network Latency Benchmark | Reagent purity verified | 239.52 | fr |
| EVID-0004 | telemetry dump | Schema version locked | 418.27 | fr |
| EVID-0005 | Q3 Compliance Audit | Schema version locked | 969.30 | es |
| EVID-0006 | Internal QA Database | Memory leak detected | 692.45 | fr |

**t_evidence_with_mass_function**

| id | evidence | mass_function | dimension_kind | method |
| --- | --- | --- | --- | --- |
| FUNC-0001 | FDA 21 CFR Guidance | Gaussian distribution | pressure | automated |
| FUNC-0002 | GitHub Actions Workflow | calibration curve | temperature | automated |
| FUNC-0003 | telemetry dump | normalized weight vector | mass | inferred |
| FUNC-0004 | Server CPU spike trace | Gaussian distribution | mass | hybrid |
| FUNC-0005 | Spectroscopy raw data | posterior distribution | length | automated |

**t_evidence_with_source**

| id | evidence | evidence_source | label_text | language |
| --- | --- | --- | --- | --- |
| SOUR-0001 | provenance trace log | Spectroscopy raw data | intake form | fr |
| SOUR-0002 | Incident Root Cause Analysis | calibration certificate | intake form | ja |
| SOUR-0003 | Network Latency Benchmark | Data Pipeline Integrity Check | calibration record | en |
| SOUR-0004 | telemetry dump | Q4 sensor readings | intake form | fr |
| SOUR-0005 | Data Pipeline Integrity Check | OpenTelemetry Collector | calibration record | es |
| SOUR-0006 | Western blot film | Network Latency Benchmark | calibration record | en |

The label text provides the categorical handle by which practitioners locate and reason about evidence in operational workflows. Intake form appears repeatedly as a label across disparate evidence items, signalling a common ingestion pathway that groups otherwise heterogeneous artefacts—provenance trace log, Incident Root Cause Analysis, telemetry dump—under a single procedural umbrella. Calibration record, by contrast, marks a different intake channel, one associated with measurement-grade artefacts such as the Network Latency Benchmark. These labels are not merely cosmetic; they encode the expected handling procedures, retention policies, and audit requirements for the evidence they annotate.

Language and dimension kind operate as orthogonal classification dimensions that constrain interpretation and computation. Language—ja, es, fr, en—determines the linguistic context in which the evidence must be parsed and understood; a batch production record registered in Japanese (ja) carries different parsing and validation expectations than the same document type in Spanish (es) or French (fr). Dimension kind—pressure, temperature, mass—serves a parallel function in the probabilistic modelling layer, where the mass function assigned to evidence must be compatible with the physical or abstract quantity it represents. A Gaussian distribution mass function applied to a dimension of type mass is semantically coherent; the same distribution applied to a dimension of type pressure would require explicit justification. The method field—automated, inferred, hybrid—further qualifies how the mass function was derived, with automated derivations carrying higher confidence than inferred or hybrid approaches, a distinction that directly affects downstream weighting.

Uncertainty quantification closes the evidential loop by attaching a numerical confidence bound to each claim-support relationship. The value 777.57 attached to the evidence item supporting the claim "Memory leak detected" signals a substantially higher degree of doubt than the value 239.52 attached to "Reagent purity verified." These are not arbitrary scores but calibrated measures that feed directly into aggregation engines, where evidence items are combined, weighted, and resolved into final determinations. The SOC 2 Audit Report, supporting the claim "GDPR compliance met" with an uncertainty of 535.87, occupies an intermediate position, reflecting the inherent complexity of cross-jurisdictional compliance verification. Such uncertainty values are not static; they may be updated as new evidence arrives or as the analytical model is refined, but at any given point they provide the quantitative foundation for risk assessment and decision-making.