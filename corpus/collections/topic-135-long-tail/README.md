# Collection — topic 135 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **13 chapters** · **26 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 135: topic 1, topic 30, topic 46, topic 53, topic 57, topic 61, topic 89, topic 96, topic 113, topic 118, topic 123, topic 127, topic 136, topic 138, topic 142, topic 144, topic 150, topic 153, topic 160, topic 164, topic 166, topic 169, topic 176, topic 185, topic 186.

> **Topic gist** (representative FinePDFs text): BMC Bioinformatics Introduction Open Access Trends in modeling Biomedical Complex Systems Luciano Milanesi* 1 , Paolo Romano 2 , Gastone Castellani 3 , Daniel Remondini 3 and Pietro Liò 4 Address: 1 Institute of Biomedical Technology, National Research Council, Milan, Italy, 2 Bioinformatics, National Cancer Research Institute, Genoa, Italy, 3 Physics Department of Bologna University, Galvani... …

## Chapters

- [Chapter 4: Quantitative Correlation of Regulatory Directives and Baseline Security Metrics](chapters/07545161d5acc10b.md)
- [Chapter 4: Statistical Validation of Security Controls in Hybrid Healthcare Environments](chapters/0b0e0dc816f508b9.md)
- [Chapter 4: Modeling Directive and Descriptive Information Content Entities in Compliance Audit Trails](chapters/0d77d0869b3e7f67.md)
- [Chapter 7: Statistical Correlation of Compliance Directives and Baseline Metrics](chapters/359e43bd5f639c07.md)
- [Chapter 4: Quantitative Validation of Security Controls and Compliance Metrics](chapters/44b94eb9dcfad9de.md)
- [Chapter 4: Quantitative Metrics in Regulatory Compliance Frameworks](chapters/5a5bc78123a96df9.md)
- [Chapter 4: Quantitative Governance and Compliance Metrics](chapters/652f27e19dca3956.md)
- [Chapter 4: Ontological Formalization of Compliance Metrics and Evidence Correlation](chapters/6a39b8d69bba1398.md)
- [Chapter 7: Statistical Governance and Regulatory Compliance Metrics](chapters/6bcd9ff387c0d687.md)
- [Chapter 12: Quantitative Compliance Metrics and Evidence Correlation in Regulatory Frameworks](chapters/e811ea8ecc839839.md)
- [Chapter 4: Regulatory Compliance Metrics and Evidence Correlation in Healthcare Financial Systems](chapters/ea402410e8c2b920.md)
- [Chapter 4: Quantitative Compliance Metrics and Evidence Correlation](chapters/fb4f0b21cf3bf7e4.md)
- [Chapter 4: Regulatory Compliance Metrics and Evidence Correlation in Healthcare Information Systems](chapters/fc33960451e3c0c6.md)

## Ontology terms grounding this collection

- `evidence_correlated_with` — {X} is a descriptive information content entity that evidence correlated with {Y}
- `hipaa_safeguard_physical` — {X} is a directive information content entity that hipaa safeguard {Y}
- `lift_with_baseline_rate` — {X} is a descriptive information content entity that has baseline rate {Y}
- `pci_dss_requirement` — {X} is a directive information content entity that pci dss requirement {Y}
- `profile_has_null_rate` — {X} is a descriptive information content entity that has null rate {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_evidence_correlated_with`](tables/t_evidence_correlated_with.sql) — realizes `evidence_correlated_with` · _shared with 4 other collection(s)_
- [`t_hipaa_safeguard_physical`](tables/t_hipaa_safeguard_physical.sql) — realizes `hipaa_safeguard_physical` · _shared with 17 other collection(s)_
- [`t_lift_with_baseline_rate`](tables/t_lift_with_baseline_rate.sql) — realizes `lift_with_baseline_rate` · _shared with 5 other collection(s)_
- [`t_pci_dss_requirement`](tables/t_pci_dss_requirement.sql) — realizes `pci_dss_requirement` · _shared with 27 other collection(s)_
- [`t_profile_has_null_rate`](tables/t_profile_has_null_rate.sql) — realizes `profile_has_null_rate`
