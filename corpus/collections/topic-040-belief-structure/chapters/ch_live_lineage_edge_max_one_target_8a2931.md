---
chapter_id: ch_live_lineage_edge_max_one_target_8a2931
topic_id: 40
family: 05_provo_lineage
cited_terms: ['lineage_edge_max_one_target', 'ontology_class_match', 'agent_acts_on_behalf_of']
model: engine-refine
---

In governed data environments, lineage, ontology alignment, and delegated agency are not optional metadata overlays but operational primitives that determine whether an artefact may be trusted, reused, or attributed. Every assertion in such a framework rests on a stable identifier—a durable key that survives joins, audits, and downstream propagation without semantic drift. Identifiers such as TARG-0001, MATC-0003, and BEHA-0002 function as the atomic handles through which compliance officers, model owners, and automated schedulers refer to the same entity across heterogeneous stores; without them, a calibration chain cannot be traced to its consuming dashboard, nor can an ontology match be reconciled with the class taxonomy that authorised it.

Subject and target articulate directed relationships in which governance meaning inheres. In lineage graphs constrained to a single downstream target per edge, the subject denotes the upstream lineage node—TARG-0006 feeding TARG-0001, or TARG-0003 feeding both TARG-0005 and TARG-0006—while the target names the governed artefact that receives influence, obligation, or provenance: Compliance audit log, Risk scoring model, Feature vector store, Executive dashboard. The pairing is directional and auditable; reversing subject and target would misstate accountability. Parallel subject–target patterns appear in delegation records, where AuditLogger and ProvenanceTracker act as subjects acting on behalf of targets such as DataGovernanceBoard and AnalyticsDivision, encoding who exercised authority and under whose mandate.

Role qualifies those directed edges without collapsing them into undifferentiated links. The same lineage subject may attach to a target as contributor or owner, and the distinction governs escalation paths, change-control rights, and evidentiary weight in investigations. An owner on the path from Feature store refresh to Feature vector store carries qualitatively different obligations than a contributor linking Sensor calibration chain to Executive dashboard; likewise, an agent recorded as observer, contributor, owner, or reviewer when acting on behalf of a board or division signals whether the action was supervisory, executional, or attestational. Role therefore operationalises the difference between participation and accountability in both technical lineage and organisational delegation.

**t_agent_acts_on_behalf_of**

| id | agent |
| --- | --- |
| BEHA-0001 | AuditLogger |
| BEHA-0002 | LogAggregator |
| BEHA-0003 | ProvenanceTracker |
| BEHA-0004 | ETLBatchScheduler |
| BEHA-0005 | ReconciliationBot |
| BEHA-0006 | ETLBatchScheduler |

**t_agent_acts_on_behalf_of_acted_on_behalf_of**

| id | acted_on_behalf_of |
| --- | --- |
| BEHA-0001 | DataGovernanceBoard |
| BEHA-0002 | DataGovernanceBoard |
| BEHA-0003 | AnalyticsDivision |
| BEHA-0004 | SecurityOperations |
| BEHA-0005 | ComplianceAudit |
| BEHA-0006 | SecurityOperations |

**t_agent_acts_on_behalf_of__acted_on_behalf_of**

| id | agent_id | acted_on_behalf_of_id | role |
| --- | --- | --- | --- |
| BEHA-0001 | BEHA-0005 | BEHA-0003 | observer |
| BEHA-0002 | BEHA-0001 | BEHA-0006 | contributor |
| BEHA-0003 | BEHA-0003 | BEHA-0001 | owner |
| BEHA-0004 | BEHA-0006 | BEHA-0005 | reviewer |
| BEHA-0005 | BEHA-0003 | BEHA-0002 | observer |
| BEHA-0006 | BEHA-0006 | BEHA-0001 | reviewer |
| BEHA-0007 | BEHA-0005 | BEHA-0001 | contributor |
| BEHA-0008 | BEHA-0006 | BEHA-0006 | owner |

Ontology alignment introduces semantic discipline atop structural graphs. A fact that matches an ontology class binds a concrete observation—labelled under categories such as Matches Ontology Class Category 01 through Category 04—to a canonical class key, enabling cross-system interoperability and policy rules keyed to class rather than to brittle string literals. Confidence and uncertainty quantify the epistemic status of that binding: a match at 0.829 confidence with uncertainty 27.88 warrants automated acceptance into governed catalogues, whereas 0.272 confidence paired with uncertainty 112.66 demands human review or quarantine before the match may inform risk scoring or audit logging. These paired measures are not decorative; they drive routing in compliance workflows, thresholding in model governance, and retention of provisional versus certified classifications.

Category and miscellaneous attributes complete the reference layer by situating each match within a navigable taxonomy and carrying values that resist reduction to a single typed column. Category groups ontology classes for reporting, access control, and regulatory mapping—Category 02 may denote a distinct control family from Category 03 even when both share similar labels—while miscellaneous fields hold auxiliary quantities and display strings, such as the observed values 237.27, 381.96, 882.98, and 768.24 that accompany match records and support reconciliation against source measurements. Together, category and misc preserve human-readable context alongside machine keys, so auditors can read a label, operators can filter by control family, and engineers can retain raw magnitudes without overloading the ontology key itself.

In practice, these elements interlock across Sensor calibration chain lineages terminating in compliance and executive surfaces, feature-store refresh paths owned rather than merely contributed to, and agents—LogAggregator, ETLBatchScheduler, ProvenanceTracker—operating under board or divisional mandate. An investigator begins from identifier TARG-0003, walks subject-to-target edges to establish provenance into the Feature vector store, inspects role to determine who owned the refresh, consults matches_ontology_class and category to see how the artefact is classified for policy, and weighs confidence against uncertainty before certifying the chain for audit export. The architecture succeeds when every edge is keyed, every semantic claim is scored, and every automated action is attributable through subject, target, and role—a closed loop in which governance is encoded in the data model itself rather than reconstructed after the fact from logs alone.

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

**fact_ontology**

| id | matches_ontology_class_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MATC-0001 | MATC-0008 | 0.796 | 236.57 | 237.27 |
| MATC-0002 | MATC-0002 | 0.272 | 112.66 | 381.96 |
| MATC-0003 | MATC-0008 | 0.829 | 27.88 | 882.98 |
| MATC-0004 | MATC-0008 | 0.584 | 688.77 | 768.24 |
| MATC-0005 | MATC-0003 | 0.900 | 848.34 | 62.60 |
| MATC-0006 | MATC-0005 | 0.038 | 1.40 | 737.81 |
| MATC-0007 | MATC-0001 | 0.986 | 660.49 | 169.21 |
| MATC-0008 | MATC-0004 | 0.900 | 507.89 | 697.45 |

**dim_matches_ontology_class**

| id | matches_ontology_class_label | matches_ontology_class_category |
| --- | --- | --- |
| MATC-0001 | Matches Ontology Class Label 01 | Matches Ontology Class Category 01 |
| MATC-0002 | Matches Ontology Class Label 02 | Matches Ontology Class Category 02 |
| MATC-0003 | Matches Ontology Class Label 03 | Matches Ontology Class Category 03 |
| MATC-0004 | Matches Ontology Class Label 04 | Matches Ontology Class Category 04 |
| MATC-0005 | Matches Ontology Class Label 05 | Matches Ontology Class Category 05 |
| MATC-0006 | Matches Ontology Class Label 06 | Matches Ontology Class Category 06 |
| MATC-0007 | Matches Ontology Class Label 07 | Matches Ontology Class Category 07 |
| MATC-0008 | Matches Ontology Class Label 08 | Matches Ontology Class Category 08 |