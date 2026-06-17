# Collection — topic 54 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **10 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): Mathieu Blanchette - Curriculum Vitae in a Nutshell Career path: * PhD in computer science (2002) from U. of Washington. * Assistant (2003-2008) and associate (2008-now) professor at McGill's School of Computer Science since 2003. Research topics and productivity: * Research area: bioinformatics, with applications in genomics, epigenomics, evolution, phylogenetics, gene regulation, and proteom... …

## Chapters

- [Chapter 4: Ontological Formalization of Anomaly Detection and Evidence Correlation](chapters/3852c4e10ac65540.md)
- [Outlier Detection in Climatic Data Records](chapters/3c28fa72b4de46d6.md)
- [Chapter 4: Ontological Foundations of Statistical Anomaly Detection in Financial Audits](chapters/42ff23d3eea76fbc.md)
- [Chapter 4: Ontological Formalization of Anomaly Detection in Regulatory Compliance Frameworks](chapters/56d36437233fe5f6.md)
- [Chapter 4: Ontological Formalization of Anomaly Detection in Regulatory Auditing](chapters/7d5c46b0cca07556.md)
- [Outlier Detection in Climatic Data Records](chapters/928a88dc424a57dc.md)
- [Ontological Representation of Outlier Claims in Climatic Data Processing](chapters/a6703627b7e99f62.md)
- [Chapter 7: Formal Ontology for Anomalous Transaction Detection and Evidence Correlation](chapters/cbf5918f318ab4b7.md)
- [Chapter 4: Statistical Anomalies and Evidence Correlation in Forensic Audits](chapters/e6bbbbdaf30b013f.md)
- [Chapter 4: Ontological Foundations for Anomaly Detection and Evidence Correlation](chapters/f2b359e4302b1b28.md)

## Ontology terms grounding this collection

- `evidence_correlated_with` — {X} is a descriptive information content entity that evidence correlated with {Y}
- `lift_with_baseline_rate` — {X} is a descriptive information content entity that has baseline rate {Y}
- `outlier_claim_basic` — {X} is a descriptive information content entity
- `outlier_detection_produces_claim` — {X} is a process that produces {Y}
- `outlier_detection_with_baseline` — {X} is a process that against {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_evidence_correlated_with`](tables/t_evidence_correlated_with.sql) — realizes `evidence_correlated_with`
- [`t_lift_with_baseline_rate`](tables/t_lift_with_baseline_rate.sql) — realizes `lift_with_baseline_rate`
- [`t_outlier_claim_basic`](tables/t_outlier_claim_basic.sql) — realizes `outlier_claim_basic`
- [`t_outlier_detection_produces_claim`](tables/t_outlier_detection_produces_claim.sql) — realizes `outlier_detection_produces_claim`
- [`t_outlier_detection_with_baseline`](tables/t_outlier_detection_with_baseline.sql) — realizes `outlier_detection_with_baseline`
