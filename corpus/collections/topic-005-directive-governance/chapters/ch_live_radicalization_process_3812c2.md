---
chapter_id: ch_live_radicalization_process_3812c2
topic_id: 5
family: 08_derived
cited_terms: ['radicalization_process', 'subclass_basic', 'evidence_correlated_with']
model: engine-refine
---

Affiliated organizations sit at the boundary between a radicalization process and the operational entities that instantiate it in the field, and governance frameworks treat that linkage as a first-class assertion rather than incidental metadata. A radicalization process names the phase or vector through which individuals or cells move toward violent or extremist commitment—whether a Militia Formation Phase, a recurring Network Recruit Wave, or a Radicalization Vector Delta that marks a discrete shift in messaging, access, or capability. Each such process is keyed by a stable identifier (for example PROC-0001 through PROC-0004) so that analysts, auditors, and downstream systems can refer to the same event sequence without conflating homonymous labels. The affiliated organization attached to a process—Sympathizer Network Alpha, an Al-Shabaab Recruitment Cell, or a Regional Coordination Cell—answers the question of who participated in or hosted that process, not merely what the process was called. When Network Recruit Wave appears under both PROC-0002 and PROC-0004 but with different organizational anchors, the duplicate process label is deliberately preserved while organizational attribution disambiguates scope; compliance reviewers use that pattern to detect parallel recruitment channels operating under shared nomenclature.

Category assignment supplies the taxonomic layer that makes evidence correlation legible across disparate collection modalities and analytic workflows. In the evidence-correlated-with dimension, each correlation target carries both a human-readable label and a category bucket—Evidence Correlated With Category 01 through Category 04 paired with corresponding labels—so that policy rules, retention schedules, and disclosure thresholds can be applied by class rather than by opaque key alone. Category is not decorative taxonomy; it governs which corroboration standards apply, which fusion pipelines may consume a record, and which oversight bodies receive automated escalation. Subclass records in parallel domains illustrate why category must remain orthogonal to identifier: a subject such as an ISO 8601 timestamp or a Parquet row group may relate to a subject_2 such as a Query execution engine or a Kestrel telemetry probe, showing that the same identifier discipline (TSUB-0001 through TSUB-0004) supports heterogeneous entity types without collapsing them into a single flat ontology. Radicalization-process governance imports that lesson directly—process type, participating organization, and evidentiary subclass remain separate axes so that retractions or reclassifications in one axis do not silently rewrite another.

**t_subclass_basic**

| id | subject | subject_2 |
| --- | --- | --- |
| TSUB-0001 | ISO 8601 timestamp | Query execution engine |
| TSUB-0002 | Parquet row group | Kestrel telemetry probe |
| TSUB-0003 | Remote sensing platform | Atmospheric instrument |
| TSUB-0004 | Query execution engine | Edge gateway node |
| TSUB-0005 | Edge gateway node | Data serialization method |
| TSUB-0006 | Argo float array | ISO 8601 timestamp |
| TSUB-0007 | Measurement apparatus | Environmental monitoring device |

Evidence correlated with is the relational spine of the fact layer: it states that a given evidentiary artifact points at, supports, or constrains another keyed entity in the corpus. Fact rows reference correlation targets by key—WITH-0005, WITH-0003, WITH-0006, WITH-0002 in the illustrative set—while the dimension table resolves those keys to labels and categories for reporting and access control. In practice, an analyst tracing PROC-0003 does not stop at the radicalization process record; she follows evidence_correlated_with edges to determine which collection products, witness statements, or technical intercepts substantiate the Regional Coordination Cell attribution. The identifier on each fact row (WITH-0001 through WITH-0004) ensures provenance: every correlation is addressable, versionable, and subject to audit without re-deriving identity from narrative text. Operational guides therefore require that new evidence be ingested with both a local identifier and an explicit correlated-with key, even when confidence is low, so that the graph remains connected and null hypotheses remain visible rather than omitted.

Confidence and uncertainty are paired epistemic measures that prevent single-score overconfidence from driving enforcement or resource allocation. Confidence values in the sample range from 0.052 on the weakest link through 0.474 on the strongest—orders of magnitude that matter when automated thresholds default to binary admit/deny. A confidence of 0.474 on the WITH-0003 correlation signals that multiple weak signals may still fail to clear a prosecution-grade bar, while 0.052 on WITH-0001 flags a tether that should appear in dashboards but not trigger disruptive action without human review. Uncertainty, recorded separately at 125.66, 477.82, 366.82, and 430.96, captures dispersion or model disagreement around the point estimate rather than substituting for it; high uncertainty alongside middling confidence (as on WITH-0002 and WITH-0004) is a standard prompt for collection gap analysis or for requesting subclass corroboration from technical sources such as remote sensing platforms or edge gateway nodes referenced elsewhere in the knowledge base. Governance frameworks mandate reporting both fields because rescoring confidence without updating uncertainty has repeatedly produced false stabilization in historical review cycles.

The misc dimension—carried as value on facts and as supplemental labels on dimension rows—holds quantities or descriptors that do not belong to the core taxonomic keys but materially affect interpretation. Fact values such as 192.81, 84.19, 641.37, and 8.37 may represent derived scores, exposure counts, elapsed intervals, or normalized feature weights depending on pipeline configuration; the handbook does not fix a single semantic, but it does require that misc values never float without a documented mapping in the operational data dictionary. Evidence Correlated With Label 01 through Label 04 perform a parallel human-facing function, giving briefers and external partners a stable phrase while identifiers remain internal. Where misc on a fact row diverges sharply from peer records in the same category—as 8.37 against 641.37 within the same analytic batch—reviewers treat the delta as a sanity signal, not as noise to be smoothed away.

**dim_evidence_correlated_with**

| id | evidence_correlated_with_label | evidence_correlated_with_category |
| --- | --- | --- |
| WITH-0001 | Evidence Correlated With Label 01 | Evidence Correlated With Category 01 |
| WITH-0002 | Evidence Correlated With Label 02 | Evidence Correlated With Category 02 |
| WITH-0003 | Evidence Correlated With Label 03 | Evidence Correlated With Category 03 |
| WITH-0004 | Evidence Correlated With Label 04 | Evidence Correlated With Category 04 |
| WITH-0005 | Evidence Correlated With Label 05 | Evidence Correlated With Category 05 |
| WITH-0006 | Evidence Correlated With Label 06 | Evidence Correlated With Category 06 |
| WITH-0007 | Evidence Correlated With Label 07 | Evidence Correlated With Category 07 |

Taken together, these elements define a compliance-ready radicalization intelligence model: radicalizationprocess names the phenomenon, affiliatedorganization names the actor envelope, identifier keys every assertable fact, evidence correlated with wires facts into a navigable graph, category enforces policy-consistent grouping, and confidence plus uncertainty quantify what is known and how firmly it is known, with misc capturing the residual measurements that complete the picture. Mature operations review PROC-0004’s second Network Recruit Wave entry against Sympathizer Network Alpha in light of correlated evidence whose strongest confidence still sits below 0.5, escalate category-03 items through enhanced oversight, and refuse to merge subclass technical entities with human-network attribution without an explicit edge. That discipline—dense identifiers, explicit correlation, separated epistemic metrics—is what allows the framework to survive adversarial renaming, duplicate process labels, and partial collection without collapsing into either paralysis or overreach.

**t_radicalization_process**

| id | radicalization_process | has_participant |
| --- | --- | --- |
| PROC-0001 | Militia Formation Phase | Sympathizer Network Alpha |
| PROC-0002 | Network Recruit Wave | Al-Shabaab Recruitment Cell |
| PROC-0003 | Radicalization Vector Delta | Regional Coordination Cell |
| PROC-0004 | Network Recruit Wave | Sympathizer Network Alpha |
| PROC-0005 | Ideological Shift Cycle | Militia Training Outpost |
| PROC-0006 | Radicalization Vector Delta | Ideological Mentorship Program |

**fact_evidence**

| id | evidence_correlated_with_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| WITH-0001 | WITH-0005 | 0.052 | 125.66 | 192.81 |
| WITH-0002 | WITH-0003 | 0.146 | 477.82 | 84.19 |
| WITH-0003 | WITH-0006 | 0.474 | 366.82 | 641.37 |
| WITH-0004 | WITH-0002 | 0.138 | 430.96 | 8.37 |