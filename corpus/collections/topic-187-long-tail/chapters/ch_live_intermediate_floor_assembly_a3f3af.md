---
chapter_id: ch_live_intermediate_floor_assembly_a3f3af
topic_id: 187
family: 08_derived
cited_terms: ['intermediate_floor_assembly', 'student_privacy_expectation', 'evidence_with_source']
model: engine-refine
---

In physical asset registries, each intermediate floor assembly is anchored by a unique identifier—ASSE-0001 through ASSE-0004—and catalogued under a descriptive designation such as Gearbox Intermediate Shelf, Motor Mount Deck, Wing Spar Floor, or a second Motor Mount Deck entry. The structural composition of each assembly is captured through a component containment field that records which lateral restraint strap or mechanical fastener is integral to the build: a Retaining Clip, Locking Clevis, Shear Pin Assembly, or Damping Mount. This pairing of identifier, assembly name, and contained component forms the backbone of traceability in engineering change management, where any deviation in a Shear Pin Assembly or Damping Mount must be attributable to a specific assembly instance for root-cause analysis and recall procedures.

**t_intermediate_floor_assembly**

| id | intermediate_floor_assembly | contains_component |
| --- | --- | --- |
| ASSE-0001 | Gearbox Intermediate Shelf | Retaining Clip |
| ASSE-0002 | Motor Mount Deck | Locking Clevis |
| ASSE-0003 | Wing Spar Floor | Shear Pin Assembly |
| ASSE-0004 | Motor Mount Deck | Damping Mount |

Privacy governance introduces a parallel taxonomy, one that quantifies the strength of a student's privacy expectation rather than merely asserting its existence. The t_student_privacy_expectation table assigns each expectation a distinct identifier—EXPE-0001 through EXPE-0004—and associates it with a named individual, whether Casey Nguyen, Sam Rivera, Emma Wilson, or David Kim. The expectation applies to a specific protected location, such as a Disciplinary Archive, Counseling Records, or a Biometric Scanner, and is scored on a confidence dimension ranging from 0.047 for Emma Wilson's expectation to 0.908 for Sam Rivera's. These confidence values are not arbitrary; they reflect the degree to which the system can assert, with measurable certainty, that the named individual holds a privacy interest in the designated location. The dimension_kind field further classifies each expectation along physical or operational axes—mass, time, length, pressure—allowing downstream analytics to filter or weight expectations by the type of resource they govern.

**t_student_privacy_expectation**

| id | student_privacy_expectation | applies_to | confidence | dimension_kind |
| --- | --- | --- | --- | --- |
| EXPE-0001 | Casey Nguyen | Disciplinary Archive | 0.655 | mass |
| EXPE-0002 | Sam Rivera | Counseling Records | 0.908 | time |
| EXPE-0003 | Emma Wilson | Biometric Scanner | 0.047 | length |
| EXPE-0004 | David Kim | Biometric Scanner | 0.667 | pressure |
| EXPE-0005 | Emma Wilson | Athletics Roster | 0.940 | temperature |
| EXPE-0006 | Maria Gonzalez | Research Lab Server | 0.441 | temperature |
| EXPE-0007 | Alex Chen | Student Health Portal | 0.209 | time |
| EXPE-0008 | Priya Patel | Cafeteria POS | 0.835 | temperature |

Evidence provenance is captured in a third structure that binds a piece of evidentiary material to its originating source, a human-readable label, and a language code. The evidence column holds items such as OpenTelemetry Collector, GitHub Actions Workflow, Network Latency Benchmark, and Phase II Clinical Summary, each traced back to a source document or framework: Q3 Compliance Audit, Lab Batch Validation Report, NIST Cybersecurity Framework, or Lab Batch Validation Report again. The label_text field provides a short categorical descriptor—intake form appears three times, calibration record once—while the language field records the provenance language as fr, ja, en, or fr. This triad of evidence, source, and label enables auditors to reconstruct the chain of custody for any compliance artifact, ensuring that a Network Latency Benchmark cited in an English-language report can be distinguished from a Phase II Clinical Summary documented in French.

Together, these three registries illustrate a common design pattern: every entity is keyed by a stable identifier, enriched with a human-readable name or description, and linked to related objects through foreign-key relationships. The intermediate floor assembly references its contained lateral restraint strap; the student privacy expectation references its protected location; the evidence record references its source document. The confidence and dimension_kind columns in the privacy table, and the language column in the evidence table, add orthogonal metadata that allows the same base entity to be filtered, ranked, or localized without altering the core relationship graph. In practice, this means that a compliance officer can query all privacy expectations with confidence above 0.6 that apply to a Biometric Scanner, or retrieve all evidence labeled as an intake form in French, and the underlying foreign-key joins resolve these queries across the assembly, privacy, and evidence domains in a single pass.

**t_evidence_with_source**

| id | evidence | evidence_source | label_text | language |
| --- | --- | --- | --- | --- |
| SOUR-0001 | OpenTelemetry Collector | Q3 Compliance Audit | intake form | fr |
| SOUR-0002 | GitHub Actions Workflow | Lab Batch Validation Report | intake form | ja |
| SOUR-0003 | Network Latency Benchmark | NIST Cybersecurity Framework | calibration record | en |
| SOUR-0004 | Phase II Clinical Summary | Lab Batch Validation Report | intake form | fr |
| SOUR-0005 | Data Pipeline Integrity Check | Infrastructure Capacity Forecast | calibration record | es |
| SOUR-0006 | Incident Root Cause Analysis | SOC 2 Audit Report | calibration record | en |