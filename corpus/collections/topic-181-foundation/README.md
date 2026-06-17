# Collection — topic 181 · 01_foundation

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): | This is a Controlled Document that complies with | |---| | Wesfarmers Chemicals, Energy & Fertilisers formatting and Quality Control standards. | | Please check that this is the latest available version before use. | | Title: | | Number: | | Version Number: | | Date Revised: | | Owner: | | Authoriser: | | Reasons for Creating | | or Amending | | Document | | Actual Change Details: | TABLE OF CO. …

## Chapters

- [Directive ICE Modeling for HIPAA and PCI DSS Compliance](chapters/0f4997c7302f0354.md)
- [Chapter 4: Governance of Information Security Directives and Risk Classifications](chapters/2b12c53510019cc5.md)
- [Chapter 4: Governance Frameworks for Information Security Compliance](chapters/5cce3f0dfd1afebc.md)
- [Governance Frameworks: Ontological Mapping of Compliance Directives](chapters/7ee5623645efd8c7.md)
- [Governance Frameworks: Compliance Directives and Risk Mitigation Controls](chapters/a6d21097180b35d8.md)
- [Regulatory Compliance and Information Security Governance: A Formal Ontology](chapters/c864e12b014bc43f.md)
- [Chapter 4: Cross-Regulatory Control Mapping and Risk Mitigation Frameworks](chapters/e5e517c9a5085d61.md)
- [Chapter 4: Directive ICE Modeling for Regulatory Safeguards](chapters/f22e27dfb2055560.md)
- [Chapter 7: Ontological Mapping of Regulatory Directives to Risk Controls](chapters/fc27391e0513a900.md)

## Ontology terms grounding this collection

- `control_only_addresses_threat_class` — {X} is a directive information content entity that addresses risk {Y}
- `hipaa_safeguard_admin` — {X} is a directive information content entity that hipaa safeguard {Y}
- `hipaa_safeguard_physical` — {X} is a directive information content entity that hipaa safeguard {Y}
- `hipaa_safeguard_technical` — {X} is a directive information content entity that hipaa safeguard {Y}
- `pci_dss_requirement` — {X} is a directive information content entity that pci dss requirement {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_control_only_addresses_threat_class`](tables/t_control_only_addresses_threat_class.sql) — realizes `control_only_addresses_threat_class`
- [`t_hipaa_safeguard_admin`](tables/t_hipaa_safeguard_admin.sql) — realizes `hipaa_safeguard_admin`
- [`t_hipaa_safeguard_physical`](tables/t_hipaa_safeguard_physical.sql) — realizes `hipaa_safeguard_physical`
- [`t_hipaa_safeguard_technical`](tables/t_hipaa_safeguard_technical.sql) — realizes `hipaa_safeguard_technical`
- [`t_pci_dss_requirement`](tables/t_pci_dss_requirement.sql) — realizes `pci_dss_requirement`
