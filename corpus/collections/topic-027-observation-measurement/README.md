# Collection — topic 27 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **10 chapters** · **3 ontology terms** · **3 underlying tables**.

> **Topic gist** (representative FinePDFs text): CHANNEL ASSIGNMENT IN MULTI-HOP TDD W-CDMA CELLULAR NETWORKS BY MOHAMMED K. AL-RIYAMI A thesis submitted to the School of Computing In conformity with the requirement for the degree of Master of Science Queen’s University Kingston, Ontario, Canada April 2004 Copyright © Mohammed K. Al-Riyami, 2004 NOTICE: The author has granted a non-exclusive license allowing Library and Archives Canada to ... …

## Chapters

- [Chapter 4: Ontological Mapping of GRC Frameworks and Metric Emission](chapters/0f01499c569368bf.md)
- [Chapter 4: Ontological Mapping of SOC2 Control Frameworks and Metric Emission Processes](chapters/123f863798576036.md)
- [Chapter 4: Ontological Formalization of Metric Emission and Compliance Directives](chapters/173dc92c329008bb.md)
- [Chapter 7: Ontological Mapping of Operational Metrics and Compliance Directives](chapters/25adb2c8419eed7f.md)
- [Chapter 4: Formal Specification of Control Directives and Metric Emissions](chapters/3220587c87a1ab9e.md)
- [Chapter 4: Ontological Formalization of System Metrics and Compliance Directives](chapters/4c3ded54234bffd1.md)
- [Chapter 7: Formal Ontology for SOC2 Governance and Metric Emission](chapters/646d98a8661959c5.md)
- [Chapter 4: Ontological Mapping of Governance Directives and Metric Emissions](chapters/854fc5cf3693ee10.md)
- [Chapter 4: Ontological Mapping for Automated Compliance Verification](chapters/e997cbdcb22d1a70.md)
- [SOC2 Compliance Ontology for Equipment Monitoring Processes](chapters/ee6c2fe0b335dab8.md)

## Ontology terms grounding this collection

- `metric_emission_subclass` — {X} is a process that emits metric {Y}
- `soc2_privacy_subclass` — {X} is a directive information content entity that for soc2 domain {Y}
- `soc2_security_subclass` — {X} is a directive information content entity that for soc2 domain {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_metric_emission_subclass`](tables/t_metric_emission_subclass.sql) — realizes `metric_emission_subclass`
- [`t_soc2_privacy_subclass`](tables/t_soc2_privacy_subclass.sql) — realizes `soc2_privacy_subclass`
- [`t_soc2_security_subclass`](tables/t_soc2_security_subclass.sql) — realizes `soc2_security_subclass`
