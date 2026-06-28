---
chapter_id: ch_live_mass_function_with_focal_element_7af630
topic_id: 4
family: 06_belief_structure
cited_terms: ['mass_function_with_focal_element', 'constraint_check_subclass', 'profiling_with_method']
model: engine-refine
---

In governed data-quality and compliance pipelines, every auditable artifact carries a stable identifier that threads together evidence, obligations, and execution history without ambiguity. Elements such as ELEM-0001 and ELEM-0003 name concrete material instances—a 1.5L coolant sample and a 920g polymer pellet—while checks such as CHEC-0002 and CHEC-0003 name the constraint subclasses those materials must satisfy. Methods such as METH-0001 through METH-0004 name the applies-method definitions under which profiling and validation are performed. Identifiers are not decorative labels; they are the join keys that let operators reconstruct, for any single row of evidence, which physical or logical specimen was evaluated, which rule applied, and which execution profile produced the outcome.

The applies method is the operational unit of work: a named procedure whose human-readable label and categorical placement determine how it is selected, scheduled, and interpreted in reporting. Dimension records pair each method with a category—Category Name 01 through Category Name 04—so that Applies Method Label 01 and Applies Method Label 04 can share Applies Method Category 01 via category_id METH-0001 even when their runtime behavior diverges. Category therefore governs portfolio-level policy: which methods belong to the same compliance family, which dashboards aggregate them, and which escalation paths apply when profiling fails. The misc field, realized here as applies_method_label, supplies the prose operators need during incident review; it sits alongside the terse identifier so automated systems and humans can refer to the same entity without conflating machine keys with display names.

**dim_applies_method_category**

| id | category_name |
| --- | --- |
| METH-0001 | Category Name 01 |
| METH-0002 | Category Name 02 |
| METH-0003 | Category Name 03 |
| METH-0004 | Category Name 04 |
| METH-0005 | Category Name 05 |
| METH-0006 | Category Name 06 |

**dim_applies_method**

| id | applies_method_label | applies_method_category | category_id |
| --- | --- | --- | --- |
| METH-0001 | Applies Method Label 01 | Applies Method Category 01 | METH-0006 |
| METH-0002 | Applies Method Label 02 | Applies Method Category 02 | METH-0001 |
| METH-0003 | Applies Method Label 03 | Applies Method Category 03 | METH-0003 |
| METH-0004 | Applies Method Label 04 | Applies Method Category 04 | METH-0001 |
| METH-0005 | Applies Method Label 05 | Applies Method Category 05 | METH-0002 |
| METH-0006 | Applies Method Label 06 | Applies Method Category 06 | METH-0001 |
| METH-0007 | Applies Method Label 07 | Applies Method Category 07 | METH-0001 |

Confidence and method, in the mass-function layer, quantify how firmly a specimen is bound to a focal check and how that binding was established. A hybrid mapping of the 920g polymer pellet to CHEC-0002 carries confidence 0.941, signaling that downstream mandatory gates may safely treat the association as authoritative, whereas the same 3.7g soil core linked to CHEC-0003 at 0.033 reflects substantial uncertainty that should trigger re-measurement or human adjudication before results propagate. The method dimension—manual, hybrid, or automated—explains why those confidence levels differ: automated linkage tends to produce high-trust pairings when instrumentation is calibrated, while manual or hybrid paths preserve expert judgment at the cost of wider variance. In practice, confidence is not a cosmetic score; it is the bridge between physical sampling and rule enforcement, telling reviewers whether a focal_element reference is fit to drive a pass/fail decision.

**t_mass_function_with_focal_element**

| id | mass | focal_element | confidence | method |
| --- | --- | --- | --- | --- |
| ELEM-0001 | 1.5L coolant sample | CHEC-0002 | 0.863 | manual |
| ELEM-0002 | 3.7g soil core | CHEC-0005 | 0.119 | hybrid |
| ELEM-0003 | 920g polymer pellet | CHEC-0002 | 0.941 | automated |
| ELEM-0004 | 3.7g soil core | CHEC-0003 | 0.033 | hybrid |
| ELEM-0005 | 500MB telemetry dump | CHEC-0005 | 0.250 | hybrid |
| ELEM-0006 | 3.8kg sensor housing | CHEC-0006 | 0.713 | manual |

Constraint governance separates what must hold from what is merely recommended, and priority orders contention when multiple checks compete for remediation resources. Mandatory checks—Null field rejection bound to CHEC-0001 and CHEC-0002, and anomaly detection threshold under CHEC-0003—cannot be waived without explicit exception authority; a non-mandatory header presence check under CHEC-0004 may still be logged but will not block release on its own. Priority values such as 1 versus 5 versus 4 encode relative urgency within a subclass: two checks at priority 1 demand immediate attention, while a priority-5 null-field rejection still matters but yields precedence to higher-priority failures in triage queues. Operators use ismandatory and priority together to construct defensible release criteria—hard stops for regulatory minima, ranked soft signals for operational hygiene.

**t_constraint_check_subclass**

| id | constraint | checks | mandatory | priority |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Null field rejection | ELEM-0005 | true | 1 |
| CHEC-0002 | Null field rejection | ELEM-0003 | true | 5 |
| CHEC-0003 | Anomaly detection threshold | ELEM-0005 | true | 4 |
| CHEC-0004 | Header presence check | ELEM-0002 | false | 1 |
| CHEC-0005 | Batch size limit | ELEM-0002 | false | 4 |
| CHEC-0006 | Anomaly detection threshold | ELEM-0001 | false | 1 |

Runtime profiling closes the loop between policy definition and field behavior by recording how each applies method actually performs in production. Duration_seconds captures elapsed wall time—6716.87 seconds for one METH-0001 execution versus 1113.38 for a METH-0007 profile—so capacity planners can distinguish chronic stragglers from healthy jobs and set timeouts that reflect observed distributions rather than guesses. Exit codes such as 725, 809, 348, and 827 are the machine vocabulary of completion: they classify success, retriable faults, configuration errors, and hard failures so orchestrators know whether to advance workflow state or halt for remediation. Retry_count makes resilience visible; counts in the hundreds (209, 303, 264) indicate methods or environments under stress—unstable dependencies, flaky inputs, or aggressive reconciliation policies—and distinguish transient noise from structural defect when paired with exit and duration trends.

Taken together, these attributes define an evidence-anchored compliance posture. Identifiers stitch specimens to checks and methods; category and applies_method metadata frame each procedure within organizational policy; confidence and acquisition method qualify whether elemental mappings merit enforcement; ismandatory and priority encode non-negotiable versus ranked obligations; and duration_seconds, exit, and retry_count supply the operational telemetry that proves whether the framework runs as designed. A reviewer confronting a failed release does not need to infer causality from a single field: they follow the identifier graph from ELEM-0004’s low-confidence hybrid soil mapping, through CHEC-0003’s mandatory anomaly threshold at priority 4, to the METH-0007 profiling row that exited 348 after 2546.61 seconds and 303 retries—each datum narrowing the story from abstract rule to accountable outcome. That integrative reading is the practical purpose of the model: not to catalog columns, but to make compliance decisions traceable, comparable, and actionable under load.

**fact_profiling**

| id | applies_method_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| METH-0001 | METH-0001 | 6716.87 | 725 | 209 |
| METH-0002 | METH-0007 | 1113.38 | 809 | 186 |
| METH-0003 | METH-0007 | 2546.61 | 348 | 303 |
| METH-0004 | METH-0004 | 2074.93 | 827 | 264 |