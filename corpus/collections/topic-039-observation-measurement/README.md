# Collection — topic 39 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **7 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): SNOQUALMIE WATERSHED AQUATIC HABITAT CONDITIONS REPORT: SUMMARY OF 1999-2001 DATA November 2002 Fran Solomon and Melissa Boles King County Department of Natural Resources and Parks Water and Land Resources Division LIST OF ABBREVIATIONS AND ACRONYMS ACOE....... Army Corps of Engineers AFS ........ American Fisheries Society APD ......... Agricultural Production District C ............ Celsius... …

## Chapters

- [Regulatory Compliance Frameworks: Safeguard Implementation and Baseline Metrics](chapters/046e3e10fb679aab.md)
- [Data Safeguard Ontologies in Relational Audit Models](chapters/0eeb5a35fd8328d4.md)
- [Chapter 7: Relational Encoding of HIPAA and PCI DSS Directive Classes](chapters/3c407c94623ad5c2.md)
- [Chapter 12: Quantitative Governance and Compliance Frameworks](chapters/46a3dd170b650ad2.md)
- [Chapter 4: Interoperability of Regulatory Safeguards and Quantitative Lift Metrics](chapters/52a6ce692cc03d7f.md)
- [Chapter 4: Compliance Directives and Metric Anchoring in Secure Environments](chapters/8127fb2beb6df1dc.md)
- [Chapter 4: Integrated Compliance Frameworks and Metric-Based Governance](chapters/d3b6703a98df2acb.md)

## Ontology terms grounding this collection

- `hipaa_safeguard_admin` — {X} is a directive information content entity that hipaa safeguard {Y}
- `hipaa_safeguard_physical` — {X} is a directive information content entity that hipaa safeguard {Y}
- `hipaa_safeguard_technical` — {X} is a directive information content entity that hipaa safeguard {Y}
- `lift_with_baseline_rate` — {X} is a descriptive information content entity that has baseline rate {Y}
- `pci_dss_requirement` — {X} is a directive information content entity that pci dss requirement {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_hipaa_safeguard_admin`](tables/t_hipaa_safeguard_admin.sql) — realizes `hipaa_safeguard_admin`
- [`t_hipaa_safeguard_physical`](tables/t_hipaa_safeguard_physical.sql) — realizes `hipaa_safeguard_physical`
- [`t_hipaa_safeguard_technical`](tables/t_hipaa_safeguard_technical.sql) — realizes `hipaa_safeguard_technical`
- [`t_lift_with_baseline_rate`](tables/t_lift_with_baseline_rate.sql) — realizes `lift_with_baseline_rate`
- [`t_pci_dss_requirement`](tables/t_pci_dss_requirement.sql) — realizes `pci_dss_requirement`
