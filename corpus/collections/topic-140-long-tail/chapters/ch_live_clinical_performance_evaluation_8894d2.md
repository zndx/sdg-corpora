---
chapter_id: ch_live_clinical_performance_evaluation_8894d2
topic_id: 140
family: 08_derived
cited_terms: ['clinical_performance_evaluation', 'lineage_edge_via_transformation', 'lineage_edge_max_one_target']
model: engine-refine
---

In governed clinical and data-lineage environments, stable identifiers anchor every auditable assertion: each evaluation artifact, dimension record, transformation edge, and target binding receives a durable key so that downstream reconciliation, access control, and evidentiary replay can reference the same entity across time and system boundaries. The evaluation registry therefore treats identifiers not as display convenience but as the primary join surface through which utilization relationships, assessed outcomes, and volumetric signals are composed into a single accountable record. When EVAL-0002 both utilizes and evaluates within the same identifier family—linking to EVAL-0002 on the utilization side and EVAL-0001 on the evaluation side—the architecture encodes a reflexive dependency pattern that auditors must interpret as either legitimate self-referential instrumentation or a constraint violation requiring lineage review, rather than as an anonymous row in a fact table.

**fact_clinical**

| id | utilizes_key | evaluates_key | event_count |
| --- | --- | --- | --- |
| EVAL-0001 | EVAL-0002 | EVAL-0002 | 306 |
| EVAL-0002 | EVAL-0002 | EVAL-0006 | 371 |
| EVAL-0003 | EVAL-0004 | EVAL-0001 | 304 |
| EVAL-0004 | EVAL-0006 | EVAL-0001 | 206 |
| EVAL-0005 | EVAL-0006 | EVAL-0003 | 268 |
| EVAL-0006 | EVAL-0008 | EVAL-0003 | 303 |

**t_lineage_edge_max_one_target**

| id | lineage |
| --- | --- |
| TARG-0001 | CSV to Parquet |
| TARG-0002 | Patient Cohort Extraction |
| TARG-0003 | Kafka Stream Filter |
| TARG-0004 | SQL Join Aggregation |
| TARG-0005 | Checksum Verification |
| TARG-0006 | Sensor calibration chain |

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

The paired dimensions of utilizes and evaluates supply semantic structure to those keys by attaching categorical taxonomies and human-readable misc labels that operational staff employ during triage, policy mapping, and control scoping. Category partitions—such as Utilizes Category 02 or Evaluates Category 01—establish the governance vocabulary within which controls are enumerated, while misc fields (Utilizes Label 02, Evaluates Label 03, and their counterparts) carry the operational nuance that category alone cannot express: business meaning, steward ownership hints, and the phrasing auditors quote in workpapers. In practice, category governs *what kind* of relationship or assessment is in play, whereas misc governs *how practitioners name and retrieve* it; together they prevent bare identifiers from collapsing into opaque codes during incident response or regulatory inquiry.

**dim_utilizes**

| id | utilizes_label | utilizes_category |
| --- | --- | --- |
| EVAL-0001 | Utilizes Label 01 | Utilizes Category 01 |
| EVAL-0002 | Utilizes Label 02 | Utilizes Category 02 |
| EVAL-0003 | Utilizes Label 03 | Utilizes Category 03 |
| EVAL-0004 | Utilizes Label 04 | Utilizes Category 04 |
| EVAL-0005 | Utilizes Label 05 | Utilizes Category 05 |
| EVAL-0006 | Utilizes Label 06 | Utilizes Category 06 |
| EVAL-0007 | Utilizes Label 07 | Utilizes Category 07 |
| EVAL-0008 | Utilizes Label 08 | Utilizes Category 08 |

**dim_evaluates**

| id | evaluates_label | evaluates_category |
| --- | --- | --- |
| EVAL-0001 | Evaluates Label 01 | Evaluates Category 01 |
| EVAL-0002 | Evaluates Label 02 | Evaluates Category 02 |
| EVAL-0003 | Evaluates Label 03 | Evaluates Category 03 |
| EVAL-0004 | Evaluates Label 04 | Evaluates Category 04 |
| EVAL-0005 | Evaluates Label 05 | Evaluates Category 05 |
| EVAL-0006 | Evaluates Label 06 | Evaluates Category 06 |

Event count quantifies exposure and materiality at the evaluation grain, transforming abstract linkage into a workload- and risk-weighted signal. Observed volumes—306 for EVAL-0001, 371 for EVAL-0002, 304 for EVAL-0003, and 206 for EVAL-0004—do not merely describe traffic; they calibrate sampling intensity, monitoring thresholds, and the proportional effort allocated to substantiate each evaluation under examination. A higher count such as 371 elevates the evaluation’s prominence in population-based assurance, while a comparatively lower 206 does not diminish compliance obligation but may justify stratified testing rather than exhaustive replay. Event count thus functions as the bridge between topological metadata (who utilizes whom, what evaluates what) and empirical burden-of-proof in operational compliance programs.

Lineage edges extend this logic into transformation provenance, where each via_transformation step—Schema Migration, Data Deduplication, Patient Cohort Extraction, or Clinical trial data flow—must be scored for epistemic reliability through confidence and uncertainty. Confidence values spanning 0.111 to 0.554 express graded belief in edge correctness under observed conditions: an edge at 0.111 signals fragile inference warranting manual corroboration, whereas 0.554 approaches defensible automation only when paired with corroborating controls. Uncertainty, recorded at magnitudes including 878.86 and as low as 350.43, complements confidence by encoding residual doubt not captured in a unit interval—often reflecting model variance, incomplete observability, or conflicting source attestations. Governance teams treat the confidence–uncertainty pair as a composite evidentiary posture: high uncertainty alongside middling confidence, as in Patient Cohort Extraction at 0.554 and 878.86, typically triggers enhanced documentation requirements even when the point estimate appears acceptable.

Terminal lineage resolution constrains many-to-one ambiguity through subject–target bindings that name both the upstream lineage subject and the downstream target artifact, then assign role to disambiguate accountability. Subjects such as TARG-0006 and TARG-0001 attach specific transformation paths—CSV to Parquet, Kafka Stream Filter, SQL Join Aggregation—to targets including Compliance audit log, Feature vector store, and Executive dashboard, while role distinguishes owner from contributor in the control matrix. Where TARG-0003 appears twice as subject yet maps to distinct targets with owner and contributor roles respectively, the framework encodes shared infrastructure with differentiated responsibility rather than collapsing distinct compliance surfaces into a single custodian. This subject–target–role triad is what allows lineage graphs to remain legible under SOX-style segregation, clinical trial traceability, and model-risk management: the graph states not only that data moved, but who bore authoritative ownership at each consumption point.

Taken together, identifier, category, misc, utilizes, evaluates, event count, confidence, uncertainty, subject, target, and role constitute an interlocking evidentiary grammar. Identifiers and categories establish referential integrity and policy vocabulary; utilizes and evaluates orient facts toward instrumental dependency and assessed outcome; event count weights materiality; confidence and uncertainty qualify transformation claims; and subject, target, and role close the loop on accountability at the point of use. Operational maturity in such environments is measured less by the presence of lineage diagrams than by the disciplined co-interpretation of these fields during change review, breach analysis, and periodic attestation—so that a reviewer encountering EVAL-0004’s utilization of EVAL-0006, its evaluation of EVAL-0001, and its 206 counted events can immediately situate the record within category-labeled dimensions, scored transformation edges, and role-bound targets without reconstructing schema from first principles.

**t_lineage_edge_via_transformation**

| id | lineage | via_transformation | confidence | uncertainty |
| --- | --- | --- | --- | --- |
| TRAN-0001 | Schema Migration | Schema Migration | 0.439 | 766.93 |
| TRAN-0002 | Data Deduplication | Data Deduplication | 0.111 | 650.52 |
| TRAN-0003 | Patient Cohort Extraction | Clinical trial data flow | 0.554 | 878.86 |
| TRAN-0004 | Data Deduplication | Schema Migration | 0.532 | 350.43 |
| TRAN-0005 | Financial Risk Pipeline | Credit card transaction flow | 0.034 | 365.80 |
| TRAN-0006 | Financial Risk Pipeline | Credit card transaction flow | 0.440 | 497.03 |

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