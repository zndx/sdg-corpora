---
chapter_id: ch_live_human_rights_impact_report_8f9759
topic_id: 140
family: 08_derived
cited_terms: ['human_rights_impact_report', 'mass_function_subclass', 'control_basic']
model: engine-refine
---

In operational governance and evidence-based assurance, stable identifiers anchor every auditable assertion to a durable referent that survives relabeling, reclassification, and successive reporting cycles. Repository-scoped keys such as REPO-0001 through REPO-0004 do not merely name rows; they establish the canonical handles by which human-reported facts, dimensional metadata, and downstream control obligations may be joined without ambiguity. When REPO-0001 records 369 events while REPO-0002 records 491, the disparity is interpretable only because each count remains tethered to the same identifier across extracts, reconciliations, and retrospective review; the identifier therefore functions as the non-negotiable spine of traceability, permitting analysts to distinguish recurrence from duplication and to attribute material changes to the correct reporting object rather than to superficial label drift.

**fact_human**

| id | reports_on_key | event_count |
| --- | --- | --- |
| REPO-0001 | REPO-0006 | 369 |
| REPO-0002 | REPO-0006 | 491 |
| REPO-0003 | REPO-0005 | 354 |
| REPO-0004 | REPO-0007 | 167 |
| REPO-0005 | REPO-0007 | 8 |
| REPO-0006 | REPO-0001 | 333 |
| REPO-0007 | REPO-0001 | 488 |
| REPO-0008 | REPO-0002 | 207 |

**t_control_basic**

| id | control | effective_date | mandatory |
| --- | --- | --- | --- |
| CONT-0001 | Anomaly detection limit | 2025-01-22 | false |
| CONT-0002 | Audit logging standard | 2025-04-27 | false |
| CONT-0003 | Data retention mandate | 2024-12-05 | true |
| CONT-0004 | Anomaly detection limit | 2025-05-27 | true |
| CONT-0005 | PII masking policy | 2025-02-05 | false |
| CONT-0006 | Rate limiting rule | 2023-06-05 | false |
| CONT-0007 | Checksum verification rule | 2024-10-11 | false |

The reports-on construct specifies what a given human fact purports to describe, and in mature implementations it is deliberately bifurcated between the operational foreign key that binds facts to dimensions and the human-legible miscellany that renders those bindings intelligible to reviewers. In the present corpus, fact records point at reports_on_key values REPO-0006, REPO-0005, and REPO-0007 while the dimensional plane exposes REPO-0001 through REPO-0004 with misc labels such as Reports On Label 01 and parallel category assignments Reports On Category 01 through Reports On Category 04. Category supplies the coarse taxonomic frame within which misc labels acquire operational meaning: two facts may share superficial wording yet diverge in assurance treatment if their categories differ, whereas two facts in the same category may still require distinct misc disambiguation when auditors must know precisely which monitored surface—signal plane, topology plane, or utilization plane—was implicated. Event count then quantifies the observable activity attributed to each bound fact, transforming categorical and misc context into a measurable burden of review; counts of 369, 491, 354, and 167 are not interchangeable magnitudes but workload signals whose interpretation depends on the reports-on linkage that defines the evidentiary scope.

Mass-function governance extends the same identifier discipline into functional subclasses whose evidentiary mass—fault_detection_assignment, signal_quality_mass, or network_topology_confidence—must be evaluated over an explicit frame of discernment. Frames such as resource_utilization_buckets, signal_strength_levels, and protocol_compliance_status delimit the universe within which a mass function may legitimately assign belief or responsibility; without that delimitation, functional claims float free of the operational partitions auditors are authorized to inspect. The architecture therefore treats subject and target as relational primitives rather than decorative column names: the subject names the mass-bearing function (for instance FUNC-0006 or FUNC-0007), the target names the frame instance (FUNC-0001, FUNC-0002, or FUNC-0005), and their pairing is insufficient unless accompanied by a role that states how the subject participates relative to the target. Where FUNC-0007 is linked to FUNC-0001 twice, once as reviewer and once as contributor, the duplication of endpoints does not imply redundancy of obligation; it encodes differentiated duties within the same frame, whereas FUNC-0004’s assignment to FUNC-0005 as owner marks a qualitatively different accountability posture—ownership typically carrying attestation authority that review or contribution alone does not confer.

**t_mass_function_subclass**

| id | mass |
| --- | --- |
| FUNC-0001 | fault_detection_assignment |
| FUNC-0002 | signal_quality_mass |
| FUNC-0003 | network_topology_confidence |
| FUNC-0004 | network_topology_confidence |
| FUNC-0005 | signal_quality_mass |
| FUNC-0006 | network_topology_confidence |
| FUNC-0007 | signal_quality_mass |

**t_mass_function_subclass_over_frame_of_discernment**

| id | over_frame_of_discernment |
| --- | --- |
| FUNC-0001 | resource_utilization_buckets |
| FUNC-0002 | signal_strength_levels |
| FUNC-0003 | signal_strength_levels |
| FUNC-0004 | protocol_compliance_status |
| FUNC-0005 | incident_severity_levels |
| FUNC-0006 | protocol_compliance_status |

**t_mass_function_subclass__over_frame_of_discernment**

| id | mass_id | over_frame_of_discernment_id | role |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0006 | FUNC-0002 | reviewer |
| FUNC-0002 | FUNC-0007 | FUNC-0001 | reviewer |
| FUNC-0003 | FUNC-0007 | FUNC-0001 | contributor |
| FUNC-0004 | FUNC-0004 | FUNC-0005 | owner |
| FUNC-0005 | FUNC-0003 | FUNC-0005 | owner |
| FUNC-0006 | FUNC-0003 | FUNC-0002 | reviewer |
| FUNC-0007 | FUNC-0005 | FUNC-0001 | observer |
| FUNC-0008 | FUNC-0006 | FUNC-0001 | contributor |

Control baselines close the loop between descriptive reporting and enforceable expectation by binding plain-language control statements to temporal validity and compulsion. Controls identified as CONT-0001 through CONT-0004 articulate requirements ranging from Anomaly detection limit and Audit logging standard to Data retention mandate, each stamped with an effective date that governs when the obligation enters the compliance calendar: 2024-12-05 for retention, 2025-01-22 and 2025-04-27 for non-mandatory instrumentation thresholds, and 2025-05-27 for a later mandatory restatement of anomaly limits. The ismandatory flag separates guidance that may be waived under documented exception from duties that tolerate no silent noncompliance; false on audit logging and the earlier anomaly limit signals discretionary adoption subject to risk acceptance, while true on retention and the May 2025 anomaly limit signals that deficiency constitutes a hard gap regardless of contemporaneous event volumes. Effective date and mandatory status interact materially with event counts and reports-on scope: a surge to 491 events under REPO-0002 may trigger escalated review under a mandatory retention regime already in force since December 2024, yet fall short of automatic breach if linked controls remain non-mandatory until their respective effective dates arrive.

Taken together, identifier, reports-on, category, misc, event count, subject, target, role, effective date, and mandatory compulsion describe a single assurance grammar in which facts are counted against named surfaces, functions are scoped to discernible frames, participants bear typed responsibilities, and controls time-bound the permissible state of the system. Practitioners who respect that grammar can reconstruct, from isolated values embedded in operational stores, a coherent narrative of what was observed, over what domain it was evaluated, who owned the evaluation, and which obligations were legally and procedurally binding at the moment of observation—without collapsing distinct REPO, FUNC, and CONT namespaces or mistaking label text for the authoritative key that must survive every subsequent audit pass.

**dim_reports_on**

| id | reports_on_label | reports_on_category |
| --- | --- | --- |
| REPO-0001 | Reports On Label 01 | Reports On Category 01 |
| REPO-0002 | Reports On Label 02 | Reports On Category 02 |
| REPO-0003 | Reports On Label 03 | Reports On Category 03 |
| REPO-0004 | Reports On Label 04 | Reports On Category 04 |
| REPO-0005 | Reports On Label 05 | Reports On Category 05 |
| REPO-0006 | Reports On Label 06 | Reports On Category 06 |
| REPO-0007 | Reports On Label 07 | Reports On Category 07 |