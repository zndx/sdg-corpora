# Collection — topic 33 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): Coordination Plan I-15 Environmental Impact Statement Farmington to Salt Lake City Lead agency: Utah Department of Transportation Revision 0 July 14, 2022 Contents 1.0 Introduction The Utah Department of Transportation (UDOT) is preparing an environmental impact statement (EIS) to improve safety, replace aging infrastructure, provide better mobility for all travel modes, strengthen the sta... …

## Chapters

- [Chapter 4: Governance Frameworks and Compliance Verification Mechanisms](chapters/1dd3fec6acbb07f1.md)
- [PCI DSS Directive Governance in Audit Ontologies](chapters/2b7d30873ccfd157.md)
- [Chapter 4: Ontological Formalization of Audit and Compliance Directives](chapters/3135fe9c6fe8ca49.md)
- [Governance Frameworks and Compliance Verification Mechanisms](chapters/42adbe5e61d9e967.md)
- [Chapter 4: Governance Frameworks and Compliance Verification Protocols](chapters/6ef0e472ed2007c9.md)
- [Chapter 4: Governance Frameworks and Audit Verification Protocols](chapters/8b8e8a9ff25d49ab.md)
- [Chapter 4: Governance Frameworks and Audit Verification Protocols](chapters/be96c8f84ab54c71.md)
- [Chapter 4: Ontological Mapping of Compliance Directives and Audit Processes](chapters/e445ce7f12c40834.md)
- [Modeling Directive Governance in PCI DSS Compliance Audits](chapters/e8897cfc0a3745a7.md)

## Ontology terms grounding this collection

- `attestation_at_period` — {X} is a process that at attestation period {Y}
- `audit_conducted_by` — {X} is a process that conducted by person
- `pci_dss_requirement` — {X} is a directive information content entity that pci dss requirement {Y}
- `requirement_min_one_verification` — {X} is a directive information content entity
- `requirement_only_satisfied_by` — {X} is a directive information content entity that satisfied by {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_at_period`](tables/t_attestation_at_period.sql) — realizes `attestation_at_period`
- [`t_audit_conducted_by`](tables/t_audit_conducted_by.sql) — realizes `audit_conducted_by`
- [`t_pci_dss_requirement`](tables/t_pci_dss_requirement.sql) — realizes `pci_dss_requirement`
- [`t_requirement_min_one_verification`](tables/t_requirement_min_one_verification.sql) — realizes `requirement_min_one_verification`
- [`t_requirement_only_satisfied_by`](tables/t_requirement_only_satisfied_by.sql) — realizes `requirement_only_satisfied_by`
