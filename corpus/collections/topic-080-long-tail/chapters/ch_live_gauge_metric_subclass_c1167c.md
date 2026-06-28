---
chapter_id: ch_live_gauge_metric_subclass_c1167c
topic_id: 80
family: 07_long_tail
cited_terms: ['gauge_metric_subclass', 'lineage_edge_describes_column_flow', 'division_assignment_record']
model: engine-refine
---

Athlete–division assignment constitutes a governed reconciliation process in which operational records bind competitive identities to organizational partitions under explicit epistemic controls. Each assignment is materialized as a fact row carrying a stable identifier—RECO-0001 through RECO-0004 in the reference corpus—together with foreign keys that resolve to dimension members for assigns_athlete and assigns_division. The dimension layers supply human-readable misc attributes (labels such as Assigns Athlete Label 01 and Assigns Division Label 03) and category taxa (Assigns Athlete Category 02, Assigns Division Category 04) that partition the assignment space for policy enforcement, reporting roll-ups, and exception routing. Because the same athlete key may appear against different division keys across records—as when RECO-0001 is paired with RECO-0007 in one fact and RECO-0001 in another—the model treats assignment as an asserted relationship subject to review rather than as a static master record, preserving auditability when rosters, eligibility rules, or bracket structures change between publication cycles.

**dim_assigns_athlete**

| id | assigns_athlete_label | assigns_athlete_category |
| --- | --- | --- |
| RECO-0001 | Assigns Athlete Label 01 | Assigns Athlete Category 01 |
| RECO-0002 | Assigns Athlete Label 02 | Assigns Athlete Category 02 |
| RECO-0003 | Assigns Athlete Label 03 | Assigns Athlete Category 03 |
| RECO-0004 | Assigns Athlete Label 04 | Assigns Athlete Category 04 |
| RECO-0005 | Assigns Athlete Label 05 | Assigns Athlete Category 05 |
| RECO-0006 | Assigns Athlete Label 06 | Assigns Athlete Category 06 |
| RECO-0007 | Assigns Athlete Label 07 | Assigns Athlete Category 07 |

**dim_assigns_division**

| id | assigns_division_label | assigns_division_category |
| --- | --- | --- |
| RECO-0001 | Assigns Division Label 01 | Assigns Division Category 01 |
| RECO-0002 | Assigns Division Label 02 | Assigns Division Category 02 |
| RECO-0003 | Assigns Division Label 03 | Assigns Division Category 03 |
| RECO-0004 | Assigns Division Label 04 | Assigns Division Category 04 |
| RECO-0005 | Assigns Division Label 05 | Assigns Division Category 05 |
| RECO-0006 | Assigns Division Label 06 | Assigns Division Category 06 |
| RECO-0007 | Assigns Division Label 07 | Assigns Division Category 07 |

Confidence and uncertainty jointly quantify the reliability of those assertions and therefore determine whether an assignment may be promoted to authoritative status or must remain provisional. Confidence expresses normalized belief on a unit interval: values such as 0.806 on RECO-0002 signal comparatively strong acceptance, whereas 0.083 on RECO-0004 falls below thresholds that most governance playbooks reserve for automated confirmation. Uncertainty, recorded in the same units as the accompanying misc value field, supplies a complementary dispersion measure—96.89 versus 740.08 on the division facts—so that reviewers can distinguish high-confidence claims backed by tight error bands from brittle matches where belief and spread diverge. Operational practice pairs the two: a lineage fact may register confidence 0.779 alongside uncertainty 708.23, instructing downstream consumers to weight the associated misc value (259.55) as directionally informative but not contractually binding until manual attestation or a second-source corroboration event is logged.

Metric kind governance addresses a parallel concern—how measured quantities are classified, versioned, and sized before they enter compliance-facing aggregates. Gauge facts anchor on identifier keys METR-0001–METR-0004 and reference metric_kind members whose labels and categories (Metric Kind Label 04 within Metric Kind Category 04, for example) establish the semantic contract under which size_bytes and version are interpreted. Size_bytes records the on-disk or in-pipeline footprint of the governed artifact—944581501 for one kind association versus 15628556 for another—so that retention policies, transfer controls, and cost attestations can be enforced without re-scanning raw storage. Version, in turn, pins the definitional epoch: two records may share version 10 while a third advances to 11, signaling schema or calculation drift that obliges consumers to re-validate historical comparability before blending cohorts across reporting periods.

**fact_gauge**

| id | metric_kind_key | size_bytes | version |
| --- | --- | --- | --- |
| METR-0001 | METR-0004 | 944581501 | 10 |
| METR-0002 | METR-0002 | 721525656 | 10 |
| METR-0003 | METR-0006 | 182468524 | 11 |
| METR-0004 | METR-0005 | 15628556 | 4 |
| METR-0005 | METR-0001 | 256894862 | 9 |
| METR-0006 | METR-0007 | 696827242 | 7 |
| METR-0007 | METR-0003 | 732080346 | 4 |
| METR-0008 | METR-0005 | 330247350 | 8 |

Column-flow description extends the same evidentiary discipline from entity assignment to structural provenance—documenting how attributes propagate from ingestion through transformation to publication. Facts in the lineage stream reference describes_column_flow keys (FLOW-0006, FLOW-0005, FLOW-0004 in the observed bindings) that resolve to dimension labels and categories such as Describes Column Flow Label 02 within Describes Column Flow Category 02. The pattern mirrors athlete–division assignment: identifier stability for the fact row, categorical misc for operational retrieval, and confidence–uncertainty envelopes that grade each asserted flow. A comparatively low confidence of 0.071 on FLOW-0002, coupled with uncertainty 133.03, would typically trigger lineage quarantine or re-derivation, whereas 0.645 on FLOW-0001 invites targeted review rather than wholesale rejection. The misc value column captures the quantified outcome of the described flow—903.86, 832.18, 862.00—so auditors can reconcile graph-level assertions against spot measurements without collapsing provenance metadata into the measure itself.

**fact_lineage**

| id | describes_column_flow_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| FLOW-0001 | FLOW-0006 | 0.645 | 612.22 | 903.86 |
| FLOW-0002 | FLOW-0005 | 0.071 | 133.03 | 832.18 |
| FLOW-0003 | FLOW-0004 | 0.404 | 76.69 | 862.00 |
| FLOW-0004 | FLOW-0005 | 0.779 | 708.23 | 259.55 |
| FLOW-0005 | FLOW-0002 | 0.376 | 801.99 | 986.33 |
| FLOW-0006 | FLOW-0003 | 0.744 | 956.79 | 34.40 |

**dim_describes_column_flow**

| id | describes_column_flow_label | describes_column_flow_category |
| --- | --- | --- |
| FLOW-0001 | Describes Column Flow Label 01 | Describes Column Flow Category 01 |
| FLOW-0002 | Describes Column Flow Label 02 | Describes Column Flow Category 02 |
| FLOW-0003 | Describes Column Flow Label 03 | Describes Column Flow Category 03 |
| FLOW-0004 | Describes Column Flow Label 04 | Describes Column Flow Category 04 |
| FLOW-0005 | Describes Column Flow Label 05 | Describes Column Flow Category 05 |
| FLOW-0006 | Describes Column Flow Label 06 | Describes Column Flow Category 06 |
| FLOW-0007 | Describes Column Flow Label 07 | Describes Column Flow Category 07 |

**fact_division**

| id | assigns_athlete_key | assigns_division_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- | --- |
| RECO-0001 | RECO-0001 | RECO-0007 | 0.517 | 96.89 | 330.50 |
| RECO-0002 | RECO-0004 | RECO-0003 | 0.806 | 738.86 | 254.97 |
| RECO-0003 | RECO-0001 | RECO-0001 | 0.257 | 500.56 | 407.11 |
| RECO-0004 | RECO-0007 | RECO-0001 | 0.083 | 740.08 | 404.52 |
| RECO-0005 | RECO-0006 | RECO-0007 | 0.281 | 881.15 | 8.05 |
| RECO-0006 | RECO-0007 | RECO-0004 | 0.538 | 6.12 | 177.48 |
| RECO-0007 | RECO-0003 | RECO-0005 | 0.833 | 343.27 | 857.73 |

Identifier discipline threads every subdomain: keys are opaque, immutable tokens (METR-, FLOW-, RECO- prefixes with zero-padded sequence) that survive relabeling of misc fields and reclassification of category values. Category and misc therefore remain mutable presentation and policy layers, while identifiers and their foreign-key pairings preserve join integrity across fact and dimension relations. In routine operations, reviewers traverse from a suspect fact identifier to its dimension categories to determine jurisdiction, then inspect confidence, uncertainty, version, and size_bytes to decide whether the record satisfies publication gates. Where keys in fact tables point outside the illustrated dimension enumerations—assigns_athlete_key RECO-0007 or describes_column_flow_key FLOW-0006, for instance—the handbook treats the mismatch not as defective storage but as evidence of partial coverage or staged onboarding, requiring either dimension backfill or explicit waiver documentation before the assignment or lineage claim enters the certified corpus.

Taken together, assigns_athlete, assigns_division, describes_column_flow, metric_kind, category, confidence, uncertainty, version, size_bytes, identifier, and misc form an interlocking compliance vocabulary: entities and flows are named and classified, measurements are sized and version-stamped, and every automated judgment carries a quantitative statement of doubt. Dense reference corpora exemplify why the separation of keys, taxa, and measures matters in practice—high-confidence division assignment on RECO-0002 (0.806) can coexist with low-confidence lineage on FLOW-0002 (0.071) within the same governance cycle, and metric payloads at version 10 may dwarf later kinds in byte weight while remaining valid for their pinned epoch. Institutions that internalize this structure publish faster because disputes route to the correct control (assignment, lineage, or metric definition) and because downstream systems inherit not only values but the evidential terms under which those values were produced.

**dim_metric_kind**

| id | metric_kind_label | metric_kind_category |
| --- | --- | --- |
| METR-0001 | Metric Kind Label 01 | Metric Kind Category 01 |
| METR-0002 | Metric Kind Label 02 | Metric Kind Category 02 |
| METR-0003 | Metric Kind Label 03 | Metric Kind Category 03 |
| METR-0004 | Metric Kind Label 04 | Metric Kind Category 04 |
| METR-0005 | Metric Kind Label 05 | Metric Kind Category 05 |
| METR-0006 | Metric Kind Label 06 | Metric Kind Category 06 |
| METR-0007 | Metric Kind Label 07 | Metric Kind Category 07 |