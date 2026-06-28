---
chapter_id: ch_live_dataset_snapshot_subclass_f672c5
topic_id: 26
family: 07_long_tail
cited_terms: ['dataset_snapshot_subclass', 'annotation_governed_by_classification_policy', 'conjunctive_combination']
model: engine-refine
---

In governed data environments, every durable object must be addressable without ambiguity, which is why identifiers serve as the stable spine of compliance metadata. A snapshot record such as SNAP-0001 is not merely a row in a catalog; it is the canonical handle auditors, lineage tools, and retention policies use when they must prove which artifact was in force at a given moment. Identifiers propagate across related assertions—POLI-0001 for an annotation, COMB-0001 for a conjunctive rule—so that evidence chains remain traceable even when human-readable labels change. The identifier therefore anchors accountability: when a control fails or a dataset must be recalled, operations teams resolve the dispute by key, not by description.

Version and physical extent turn that abstract handle into an auditable fact about what was stored and when it evolved. Version numbers distinguish successive states of the same logical lineage—SNAP-0001 at version 10 versus SNAP-0002 at version 2 signals that two snapshots are not interchangeable even if they share a naming pattern, and that downstream consumers must re-validate assumptions when the version increments. Size in bytes makes the obligation concrete: a snapshot occupying roughly 676 million bytes imposes different backup, transfer, and cost controls than one of about 31 million bytes. Together, version and size_bytes support capacity planning, integrity checks, and regulatory arguments about proportionality—demonstrating not only that a record existed, but that its footprint and revision history were knowable and bounded.

**fact_dataset**

| id | snapshot_of_key | size_bytes | version |
| --- | --- | --- | --- |
| SNAP-0001 | SNAP-0004 | 350697080 | 10 |
| SNAP-0002 | SNAP-0003 | 501391865 | 2 |
| SNAP-0003 | SNAP-0002 | 31504133 | 5 |
| SNAP-0004 | SNAP-0003 | 676110880 | 5 |
| SNAP-0005 | SNAP-0002 | 632357991 | 7 |
| SNAP-0006 | SNAP-0001 | 81640033 | 1 |
| SNAP-0007 | SNAP-0007 | 351254327 | 12 |
| SNAP-0008 | SNAP-0001 | 94866870 | 11 |

The snapshot_of relationship expresses derivation and dependency, which is where governance meets operational reality. When SNAP-0001 is recorded as a snapshot of SNAP-0004, the model states that one captured state was produced from—or materially depends upon—another. That edge is how organizations reconstruct provenance: which upstream capture fed a derivative, and which downstream artifacts must be invalidated if the parent changes. Descriptive misc fields such as “Snapshot Of Label 01” and categorical placement in “Snapshot Of Category 01” do not replace the key, but they translate lineage into language compliance officers and data owners share. Category partitions the snapshot population so policies, access tiers, and review cadences can differ by class without collapsing distinct assets into a single undifferentiated pool.

Annotations attach interpretive or policy-bearing metadata to the governed corpus, and they carry explicit epistemic weight. Each annotation assertion—identified, for example, as POLI-0001 and typed through “Annotation Label 01” within “Annotation Category 01”—binds a misc value (such as 284.47) to a subject, but compliance hinges on how firmly that binding is held. Confidence scores near 0.845 indicate a judgment the organization is prepared to automate or treat as reliable, whereas confidence near 0.236 flags a weak inference that should trigger human review before it drives enforcement. Uncertainty, recorded in parallel (690.59 versus 22.02 on other assertions), quantifies residual doubt in units meaningful to the domain—often variance, bounded error, or an index derived from measurement—so risk committees can set thresholds: high-confidence, low-uncertainty annotations may flow into default controls, while the inverse combination demands escalation. The misc value field holds the substantive payload the annotation communicates; category and label supply the semantic frame that determines which control catalog applies.

Conjunctive combination is the mechanism by which multiple conditions must all hold simultaneously before a composite rule fires—logical AND, not OR. A conjunctively_combines record such as COMB-0001 references another combination key (here, COMB-0004), encoding how primitive predicates assemble into enforceable clauses labeled under “Conjunctively Combines Category 01.” This pattern matters in practice because many compliance tests are inherently multi-part: retention satisfied and classification correct and access logged. Treating those requirements conjunctively prevents a single passing check from masking failure elsewhere. The same confidence and uncertainty apparatus applies—COMB-0002’s confidence of 0.045 paired with uncertainty 898.42 is a conspicuously fragile composite that responsible workflows would not treat as binding without corroboration, while COMB-0004’s 0.799 confidence supports stronger automated action. Values in the misc column (793.45, 980.44, and similar) typically encode scores, weights, or computed aggregates that the conjunctive evaluator emits once all conjuncts are evaluated.

**fact_conjunctive**

| id | conjunctively_combines_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| COMB-0001 | COMB-0004 | 0.738 | 736.08 | 793.45 |
| COMB-0002 | COMB-0004 | 0.045 | 898.42 | 791.51 |
| COMB-0003 | COMB-0006 | 0.764 | 666.33 | 598.69 |
| COMB-0004 | COMB-0003 | 0.799 | 785.73 | 980.44 |
| COMB-0005 | COMB-0006 | 0.312 | 470.05 | 427.17 |
| COMB-0006 | COMB-0003 | 0.643 | 227.57 | 137.91 |
| COMB-0007 | COMB-0004 | 0.630 | 30.12 | 467.22 |

**dim_conjunctively_combines**

| id | conjunctively_combines_label | conjunctively_combines_category |
| --- | --- | --- |
| COMB-0001 | Conjunctively Combines Label 01 | Conjunctively Combines Category 01 |
| COMB-0002 | Conjunctively Combines Label 02 | Conjunctively Combines Category 02 |
| COMB-0003 | Conjunctively Combines Label 03 | Conjunctively Combines Category 03 |
| COMB-0004 | Conjunctively Combines Label 04 | Conjunctively Combines Category 04 |
| COMB-0005 | Conjunctively Combines Label 05 | Conjunctively Combines Category 05 |
| COMB-0006 | Conjunctively Combines Label 06 | Conjunctively Combines Category 06 |

Operationally, these elements interlock into a defensible control surface. Identifiers stitch snapshots, annotations, and conjunctive rules into one referential fabric; version and size_bytes ground that fabric in mutable reality; snapshot_of supplies lineage; category and misc fields make the model legible to humans and machine classifiers alike; and the paired confidence–uncertainty pair forces every automated or semi-automated judgment to declare its evidentiary strength. Mature programs use that declaration to route work: auto-approve where confidence is high and uncertainty low, sample-audit in the middle band, and halt or quarantine where conjunctive rules or annotations fail both tests. The examples above are not decorative—they illustrate how the same schema expresses a mature snapshot at version 10, a lightweight derivative, a strong annotation, a doubtful one, and a conjunctive rule too uncertain to trust. That is the domain’s practical contract: metadata precise enough to automate, uncertain enough to be honest, and linked tightly enough that an auditor can follow any identifier from assertion back to the snapshot it governed.

**dim_snapshot_of**

| id | snapshot_of_label | snapshot_of_category |
| --- | --- | --- |
| SNAP-0001 | Snapshot Of Label 01 | Snapshot Of Category 01 |
| SNAP-0002 | Snapshot Of Label 02 | Snapshot Of Category 02 |
| SNAP-0003 | Snapshot Of Label 03 | Snapshot Of Category 03 |
| SNAP-0004 | Snapshot Of Label 04 | Snapshot Of Category 04 |
| SNAP-0005 | Snapshot Of Label 05 | Snapshot Of Category 05 |
| SNAP-0006 | Snapshot Of Label 06 | Snapshot Of Category 06 |
| SNAP-0007 | Snapshot Of Label 07 | Snapshot Of Category 07 |

**fact_annotation**

| id | annotation_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| POLI-0001 | POLI-0005 | 0.845 | 690.59 | 979.94 |
| POLI-0002 | POLI-0003 | 0.236 | 593.98 | 370.63 |
| POLI-0003 | POLI-0004 | 0.271 | 104.01 | 360.27 |
| POLI-0004 | POLI-0001 | 0.303 | 22.02 | 284.47 |
| POLI-0005 | POLI-0003 | 0.002 | 328.54 | 25.47 |

**dim_annotation**

| id | annotation_label | annotation_category |
| --- | --- | --- |
| POLI-0001 | Annotation Label 01 | Annotation Category 01 |
| POLI-0002 | Annotation Label 02 | Annotation Category 02 |
| POLI-0003 | Annotation Label 03 | Annotation Category 03 |
| POLI-0004 | Annotation Label 04 | Annotation Category 04 |
| POLI-0005 | Annotation Label 05 | Annotation Category 05 |
| POLI-0006 | Annotation Label 06 | Annotation Category 06 |