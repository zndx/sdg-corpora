# Collection — topic 115 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **15 chapters** · **27 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 115: topic 1, topic 3, topic 23, topic 26, topic 32, topic 50, topic 64, topic 66, topic 76, topic 77, topic 81, topic 88, topic 90, topic 94, topic 102, topic 126, topic 130, topic 134, topic 144, topic 153, topic 166, topic 170, topic 173, topic 183, topic 185, topic 186.

> **Topic gist** (representative FinePDFs text): Effect of vitamin D replacement on maternal and neonatal outcomes: a randomised controlled trial in pregnant women with hypovitaminosis D. A protocol M Chakhtoura,1 A Nassar,2 A Arabi,1 C Cooper,3 N Harvey,3 Z Mahfoud,4 M Nabulsi,5 G El-Hajj Fuleihan1 ABSTRACT Introduction: The vitamin D recommended doses during pregnancy differ between societies. The WHO guidelines do not recommend routine pre... …

## Chapters

- [Chapter 4: Ontological Foundations for Compliance Evidence and Regulatory Alignment](chapters/08ddda0dbaffb653.md)
- [Chapter 4: Ontological Mapping of Audit Evidence and Compliance Artifacts](chapters/0c1aef1eee3e1d80.md)
- [Compliance Artifact Ontologies in PCI DSS Reporting Systems](chapters/1519eeaa1ddc85f7.md)
- [Chapter 4: Claim-Support Relations in Regulatory Artifact Models](chapters/18ca0fc9d71d0e58.md)
- [Chapter 4: Evidence Lineage and Regulatory Compliance in Automated Auditing Systems](chapters/44d940d8299a8c04.md)
- [Regulatory Compliance Claim Support in Artifact Lineage Systems](chapters/4b6ccc1455977982.md)
- [Chapter 7: Claim-Support Artifacts in PCI DSS Audit Trails](chapters/603d57c7aa50fab8.md)
- [Chapter 4: Artifact Classes Supporting Descriptive Claims in Regulatory Audit Models](chapters/6e3d4218f6175db2.md)
- [Chapter 4: Evidence Lineage and Regulatory Compliance in Digital Forensics](chapters/787c75bf58a9087c.md)
- [Chapter 7: Ontological Mapping of Digital Evidence and Compliance Assertions](chapters/806b90da6f74fa00.md)
- [Chapter 4: Claim-Support Artifacts in Compliance Audit Trails](chapters/aaebc3d751fef4a7.md)
- [Chapter 4: Evidence-Based Compliance and Data Lineage Verification](chapters/bce46d770563db90.md)
- [Chapter 7: Evidence Correlation and Regulatory Compliance Mapping](chapters/c6ee8d4107aed9fc.md)
- [Chapter 7: Evidentiary Frameworks and Regulatory Compliance in Automated Systems](chapters/cf06eaab83033875.md)
- [Chapter 7: Evidentiary Structures in Compliance Data Governance](chapters/f0cd9ba2777aea9e.md)

## Ontology terms grounding this collection

- `column_lineage_for_compliance_claim` — {X} is an artifact that supports claim descriptive information content entity
- `kernel_anomaly_supports_claim` — {X} is an artifact that supports claim descriptive information content entity
- `pci_dss_requirement` — {X} is a directive information content entity that pci dss requirement {Y}
- `schemaorg_org_taxid` — {X} is an artifact that has tax id {Y}
- `trace_supports_claim` — {X} is a process that supports claim descriptive information content entity

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_column_lineage_for_compliance_claim`](tables/t_column_lineage_for_compliance_claim.sql) — realizes `column_lineage_for_compliance_claim` · _shared with 5 other collection(s)_
- [`t_kernel_anomaly_supports_claim`](tables/t_kernel_anomaly_supports_claim.sql) — realizes `kernel_anomaly_supports_claim` · _shared with 5 other collection(s)_
- [`t_pci_dss_requirement`](tables/t_pci_dss_requirement.sql) — realizes `pci_dss_requirement` · _shared with 27 other collection(s)_
- [`t_schemaorg_org_taxid`](tables/t_schemaorg_org_taxid.sql) — realizes `schemaorg_org_taxid` · _shared with 3 other collection(s)_
- [`t_trace_supports_claim`](tables/t_trace_supports_claim.sql) — realizes `trace_supports_claim` · _shared with 13 other collection(s)_
