---
chapter_id: ch_live_evidence_refutes_claim_c96d55
topic_id: 7
family: 06_belief_structure
cited_terms: ['evidence_refutes_claim', 'designative_with_naming_authority', 'baseline_for_metric']
model: engine-refine
---

In governance frameworks that track the provenance and integrity of designative identifiers, a tripartite architecture emerges: evidence that refutes claims, designatives assigned by naming authorities, and baselines that anchor metric evaluations. The evidence layer, captured in the refutation registry, records how specific artifacts—such as a benchmark result v2.1, an audit report for fiscal year 2023, a sensor drift calibration, or a data lineage snapshot—serve to invalidate particular claims. Each refutation is classified by method, whether manual, automated, or hybrid, and annotated with a label text that contextualizes the artifact, as in calibration record, audit excerpt, intake form, or pre-release note. The claims themselves are metric identifiers—METR-0003, METR-0002, METR-0007, METR-0005—each of which corresponds to a baseline definition such as Standard_Daylight_Cycle, Power_Consumption, Structural_Stress, or Steady_State_Vibration. This linkage ensures that every claim under review is traceable to a measurable, standardized condition.

**t_evidence_refutes_claim**

| id | evidence | refutes_claim | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Benchmark result v2.1 | METR-0003 | manual | calibration record |
| CLAI-0002 | Audit report FY2023 | METR-0002 | hybrid | audit excerpt |
| CLAI-0003 | Sensor drift calibration | METR-0007 | automated | intake form |
| CLAI-0004 | Data lineage snapshot | METR-0005 | hybrid | pre-release note |
| CLAI-0005 | Audit report FY2023 | METR-0006 | hybrid | calibration record |
| CLAI-0006 | Compliance checklist 7.4 | METR-0004 | automated | change rationale |
| CLAI-0007 | Incident summary Aug | METR-0006 | inferred | intake form |

**t_baseline_for_metric**

| id | baseline |
| --- | --- |
| METR-0001 | Standard_Daylight_Cycle |
| METR-0002 | Power_Consumption |
| METR-0003 | Structural_Stress |
| METR-0004 | Steady_State_Vibration |
| METR-0005 | Factory_A_NightShift |
| METR-0006 | Battery_Capacity |
| METR-0007 | Standard_Daylight_Cycle |

**t_baseline_for_metric_baseline_for**

| id | baseline_for |
| --- | --- |
| METR-0001 | Data_Ingestion_Rate |
| METR-0002 | Data_Ingestion_Rate |
| METR-0003 | Steady_State_Vibration |
| METR-0004 | Power_Consumption |
| METR-0005 | Battery_Capacity |
| METR-0006 | Steady_State_Vibration |

The naming authority layer bridges evidence to designative identifiers, establishing which body or process is responsible for assigning a given code or standard designation. Designatives such as OGC-API-Feat, DCAT-AP-3.0, HAN-0092, and RFC-7578 are each assigned by a specific evidence item—CLAI-0004, CLAI-0006, or CLAI-0003—thereby grounding the authority for a designation in documented proof rather than administrative fiat. Each assignment is further characterized by a checksum algorithm, with md5, blake2b, and sha1 appearing across the registry, and by a classification code such as C-07, E-21, or D-33. The choice of checksum algorithm is not incidental; it signals the integrity expectations of the naming authority, with stronger algorithms like blake2b reserved for designatives that carry higher assurance requirements.

**t_designative_with_naming_authority**

| id | designative | assigned_by | checksum_algo | code |
| --- | --- | --- | --- | --- |
| AUTH-0001 | OGC-API-Feat | CLAI-0004 | md5 | C-07 |
| AUTH-0002 | DCAT-AP-3.0 | CLAI-0006 | md5 | E-21 |
| AUTH-0003 | HAN-0092 | CLAI-0006 | blake2b | C-07 |
| AUTH-0004 | RFC-7578 | CLAI-0003 | sha1 | D-33 |

Baselines form the foundational reference layer against which metrics are evaluated and against which other baselines may be compared. The baseline registry maps metric identifiers to their defining conditions, while a separate mapping table establishes which baselines serve as references for other baselines. For instance, the baseline Data_Ingestion_Rate is itself a baseline for both Data_Ingestion_Rate and Steady_State_Vibration, indicating a recursive or self-referential structure in the governance model. Similarly, Steady_State_Vibration serves as a baseline for Power_Consumption, suggesting that vibration stability is a prerequisite condition for power consumption measurements. This recursive structure allows the framework to express hierarchical dependencies among baselines, where one baseline's validity may depend on the stability of another.

The relationship between baselines is further qualified by a role dimension that distinguishes the subject from the target in each pairing. In the junction table that captures baseline-to-baseline relationships, each entry carries a role—owner, contributor, or observer—that specifies the nature of the dependency. When METR-0007 acts as the subject and METR-0004 as the target with the role owner, the framework asserts that the former has primary responsibility for the latter's validity. Conversely, when METR-0001 serves as an observer of METR-0005, it signals a monitoring or auditing relationship without direct accountability. This role-based semantics enables fine-grained governance, where the same baseline can simultaneously be an owner in one relationship, a contributor in another, and an observer in a third, depending on the context of the metric interaction.

**t_baseline_for_metric__baseline_for**

| id | baseline_id | baseline_for_id | role |
| --- | --- | --- | --- |
| METR-0001 | METR-0007 | METR-0004 | owner |
| METR-0002 | METR-0002 | METR-0005 | contributor |
| METR-0003 | METR-0001 | METR-0005 | observer |
| METR-0004 | METR-0007 | METR-0003 | contributor |
| METR-0005 | METR-0007 | METR-0004 | contributor |
| METR-0006 | METR-0001 | METR-0002 | reviewer |
| METR-0007 | METR-0004 | METR-0006 | reviewer |
| METR-0008 | METR-0007 | METR-0002 | reviewer |

Together, these tables form a coherent provenance chain: evidence refutes claims about metrics, naming authorities assign designatives based on that evidence, and baselines provide the reference conditions against which metrics and other baselines are evaluated. The checksum algorithm, the classification code, the method of refutation, and the role in baseline relationships all serve as metadata that enrich the governance model with assurance signals. An auditor tracing the provenance of a designative such as RFC-7578 would follow the chain from its assignment by CLAI-0003, through the sha1 integrity check and the D-33 classification, to the underlying evidence and the metric it refutes, and finally to the baseline conditions that define the metric's evaluation criteria. This end-to-end traceability is the operational value of the schema.