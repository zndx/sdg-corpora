---
chapter_id: ch_live_lineage_edge_at_run_time_bffe22
topic_id: 26
family: 05_provo_lineage
cited_terms: ['lineage_edge_at_run_time', 'clinical_performance_evaluation', 'legal_advocate_role']
model: engine-refine
---

In governed data environments, every entity that must be auditable, joinable, and defensible in compliance review is anchored by a stable identifier. Identifiers such as `TIME-0001` or `EVAL-0003` are not merely surrogate keys; they are the durable handles through which lineage records, clinical facts, and legal-advocacy assignments remain traceable across systems, time, and organizational boundaries. When a revenue-aggregation batch, a customer-churn pipeline, or a genomic-sequence-align job is recorded under `TIME-0001` through `TIME-0004`, each identifier becomes the point of reconciliation between what the pipeline is supposed to do and where and how it actually ran—on `worker-node-12`, as `job-run-8842`, or through `batch-queue-primary`. Without such keys, governance cannot answer the basic accountability questions: which artifact, which run, which actor, which outcome.

Relationship semantics in these models are rarely expressed as simple foreign keys alone. Subject–target–role triples encode directed participation: a subject entity is linked to a target entity with an explicit role that qualifies the nature of the link. In runtime lineage, `TIME-0004` (genomic-sequence-align) may connect to `TIME-0005` as owner while another edge assigns reviewer to the same lineage against `TIME-0001`; the role disambiguates otherwise identical structural links. The same pattern governs legal advocacy: advocate roles (`LegalAid-Case33`, `CourtAdvoc-15B`, `SurvivorAdvoc-118`) attach to persons—Priya Nair, Robert Kim, Aisha B. Williams, Marcus Chen—through bearer assignments where legal_id and role_bearer_id pairs carry roles such as reviewer or contributor. Subject and target therefore name the endpoints of obligation and authority; role names the capacity in which that endpoint participates. Compliance frameworks depend on this triad because access reviews, duty-of-care documentation, and incident reconstruction all require knowing not just who touched what, but in what capacity.

**t_legal_advocate_role_role_bearer**

| id | role_bearer |
| --- | --- |
| ROLE-0001 | Priya Nair |
| ROLE-0002 | Robert Kim |
| ROLE-0003 | Aisha B. Williams |
| ROLE-0004 | Marcus Chen |
| ROLE-0005 | James T. Vance |
| ROLE-0006 | Maria G. Delgado |
| ROLE-0007 | David Okafor |

**t_legal_advocate_role__role_bearer**

| id | legal_id | role_bearer_id | role |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0006 | ROLE-0007 | reviewer |
| ROLE-0002 | ROLE-0008 | ROLE-0007 | reviewer |
| ROLE-0003 | ROLE-0005 | ROLE-0007 | reviewer |
| ROLE-0004 | ROLE-0007 | ROLE-0005 | contributor |
| ROLE-0005 | ROLE-0007 | ROLE-0007 | reviewer |
| ROLE-0006 | ROLE-0005 | ROLE-0001 | owner |
| ROLE-0007 | ROLE-0001 | ROLE-0006 | reviewer |
| ROLE-0008 | ROLE-0002 | ROLE-0007 | reviewer |

Clinical and operational analytics introduce a parallel layer in which dimensions classify entities and facts measure what happened between them. Dimension tables hold descriptive attributes: utilizes and evaluates labels (miscellaneous display or reference text such as “Utilizes Label 02” or “Evaluates Label 04”) sit alongside category values that group those labels into governed taxonomies (“Utilizes Category 01,” “Evaluates Category 03”). Categories matter because policy rules, reporting rollups, and data-quality thresholds are applied at the category level far more often than at individual label grain. The fact table `fact_clinical` then records evaluations as observable events: each row ties a utilizes_key to an evaluates_key and carries an event_count—306, 371, 304, or 206 in the sample—quantifying how often or how intensely that utilization was assessed against a given evaluation criterion. Event count is the evidentiary measure auditors and clinical governance committees use to detect under-documentation, surges in assessed activity, or mismatches between expected and observed evaluation volume.

**fact_clinical**

| id | utilizes_key | evaluates_key | event_count |
| --- | --- | --- | --- |
| EVAL-0001 | EVAL-0002 | EVAL-0002 | 306 |
| EVAL-0002 | EVAL-0002 | EVAL-0006 | 371 |
| EVAL-0003 | EVAL-0004 | EVAL-0001 | 304 |
| EVAL-0004 | EVAL-0006 | EVAL-0001 | 206 |
| EVAL-0005 | EVAL-0006 | EVAL-0003 | 268 |
| EVAL-0006 | EVAL-0008 | EVAL-0003 | 303 |

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

Legal advocacy governance for domestic violence survivors adds sensitive-party modeling on top of the same relational discipline. The domesticviolencesurvivor entity—represented in assists records as case or survivor references such as `Case-Client-004`, `DV-Record-338`, or `Ref-Survivor-091`—is the protected subject of service relationships, distinct from the person who bears an advocate role. An advocate assignment (legaladvocaterole) does not fully describe the compliance picture until it is joined to whom that advocate assists and under what participation role: observer, contributor, or owner. Those roles mirror lineage and bearer patterns but carry heightened privacy and ethical weight because they document proximity to survivors, not merely technical system access.

**t_legal_advocate_role_assists**

| id | assists |
| --- | --- |
| ROLE-0001 | Case-Client-004 |
| ROLE-0002 | DV-Record-338 |
| ROLE-0003 | Case-Client-004 |
| ROLE-0004 | Ref-Survivor-091 |
| ROLE-0005 | Survivor-Ref-115 |
| ROLE-0006 | Client-Code-773 |
| ROLE-0007 | DV-Client-8842 |

Cardinality notes exist precisely where many-to-many or ambiguous multiplicity would otherwise obscure accountability. When `ROLE-0001` links legal_id `ROLE-0007` to assists_id `ROLE-0004` with role observer and Cardinality Note 01, while `ROLE-0004` pairs `ROLE-0006` with `ROLE-0005` as owner under Cardinality Note 04, the note documents the intended or observed multiplicity of the advocate–survivor relationship—whether one advocate may assist multiple survivors, whether duplicate assignments are permitted, or whether a survivor must map to a single primary owner. In practice, cardinality notes are the governance layer’s hedge against silent data-model assumptions: they make explicit what a schema diagram alone cannot, namely whether a join path implies one-to-one supervision, one-to-many caseload, or a bounded many-to-many arrangement that requires periodic reconciliation.

Taken together, identifiers stabilize reference; subject, target, and role articulate directed relationships; category and misc attributes supply governed classification and human-readable context; event_count supplies measurable proof of evaluation activity; legaladvocaterole, person, and domesticviolencesurvivor instantiate high-stakes human-service accountability; and cardinality notes record the multiplicity constraints that keep those relationships legally and operationally interpretable. Operators who maintain lineage at runtime and advocates who assist survivors inhabit different domains, yet both depend on the same compliance primitives: every edge must be keyed, every participation must be roled, every sensitive assist relationship must declare its cardinality, and every clinical evaluation must be countable against categorized criteria. That uniformity is what allows a single governance handbook to span pipelines running on `batch-queue-primary` and advocates assisting `Case-Client-004` without collapsing distinct ethical obligations into undifferentiated “links” in a database.

**t_lineage_edge_at_run_time**

| id | lineage |
| --- | --- |
| TIME-0001 | batch-revenue-aggregation |
| TIME-0002 | customer-churn-pipeline |
| TIME-0003 | climate-data-ingest |
| TIME-0004 | genomic-sequence-align |
| TIME-0005 | model-training-workflow |
| TIME-0006 | user-behavior-trace |

**t_lineage_edge_at_run_time_at_run_time**

| id | at_run_time |
| --- | --- |
| TIME-0001 | worker-node-12 |
| TIME-0002 | job-run-8842 |
| TIME-0003 | worker-node-12 |
| TIME-0004 | batch-queue-primary |
| TIME-0005 | job-run-8842 |
| TIME-0006 | execution-window-4 |

**t_lineage_edge_at_run_time__at_run_time**

| id | lineage_id | at_run_time_id | role |
| --- | --- | --- | --- |
| TIME-0001 | TIME-0004 | TIME-0005 | owner |
| TIME-0002 | TIME-0006 | TIME-0003 | observer |
| TIME-0003 | TIME-0004 | TIME-0005 | owner |
| TIME-0004 | TIME-0004 | TIME-0001 | reviewer |
| TIME-0005 | TIME-0002 | TIME-0006 | contributor |
| TIME-0006 | TIME-0004 | TIME-0006 | owner |
| TIME-0007 | TIME-0005 | TIME-0004 | contributor |
| TIME-0008 | TIME-0005 | TIME-0003 | observer |

**t_legal_advocate_role**

| id | legal_advocate_role |
| --- | --- |
| ROLE-0001 | LegalAid-Case33 |
| ROLE-0002 | CourtAdvoc-15B |
| ROLE-0003 | SurvivorAdvoc-118 |
| ROLE-0004 | CourtAdvoc-15B |
| ROLE-0005 | LegalShield-Intake |
| ROLE-0006 | LegalAid-Case33 |
| ROLE-0007 | LegalShield-Intake |
| ROLE-0008 | LegalAid-Case33 |

**t_legal_advocate_role__assists**

| id | legal_id | assists_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| ROLE-0001 | ROLE-0007 | ROLE-0004 | observer | Cardinality Note 01 |
| ROLE-0002 | ROLE-0002 | ROLE-0003 | contributor | Cardinality Note 02 |
| ROLE-0003 | ROLE-0003 | ROLE-0004 | observer | Cardinality Note 03 |
| ROLE-0004 | ROLE-0006 | ROLE-0005 | owner | Cardinality Note 04 |
| ROLE-0005 | ROLE-0004 | ROLE-0007 | observer | Cardinality Note 05 |
| ROLE-0006 | ROLE-0007 | ROLE-0002 | observer | Cardinality Note 06 |
| ROLE-0007 | ROLE-0002 | ROLE-0004 | contributor | Cardinality Note 07 |
| ROLE-0008 | ROLE-0003 | ROLE-0001 | reviewer | Cardinality Note 08 |