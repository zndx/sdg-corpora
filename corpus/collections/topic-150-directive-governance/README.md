# Collection — topic 150 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **11 chapters** · **22 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 150: topic 2, topic 6, topic 7, topic 26, topic 34, topic 35, topic 43, topic 47, topic 53, topic 57, topic 73, topic 90, topic 103, topic 110, topic 157, topic 163, topic 165, topic 169, topic 187, topic 190, topic 199.

> **Topic gist** (representative FinePDFs text): Special Education: Nonpublic School and Nonpublic Agency Study Final Report Thomas Parrish, Project Director Gina Chen Heather Shaw September 30, 1998 Submitted to: Office of the Legislative Analyst 925 L Street, Suite 1000 Sacramento, CA 95814 California Department of Education Special Education Division 515 L Street, Suite 270 Sacramento, CA 95814 California Department of Finance 915 L Str... …

## Chapters

- [Chapter 4: Directive Governance and Attestation Structures in Compliance Audits](chapters/2c0f0bc8501823a7.md)
- [Chapter 4: Ontological Formalization of Governance and Audit Frameworks](chapters/3de4e26b13006d0e.md)
- [Chapter 4: Governance Frameworks and Audit Trail Integrity in PCI-DSS Environments](chapters/49567b0e3d5f0667.md)
- [Chapter 4: Formal Ontologies in Governance and Compliance Assurance](chapters/49ecb3f8f944bd74.md)
- [Chapter 4: Formal Ontology of Governance and Compliance Mechanisms](chapters/5a04fe783c5a4642.md)
- [Chapter 7: Ontological Formalization of Governance and Compliance Protocols](chapters/7826d2cbcd588fff.md)
- [Chapter 4: Governance Mechanisms and Attestation Protocols in PCI-DSS Compliance Frameworks](chapters/8172dadc39bf7711.md)
- [Chapter 7: Directive Governance in PCI DSS Audit Trails](chapters/a61090979e9dfdea.md)
- [Chapter 7: Formal Ontology of Governance and Compliance Mechanisms](chapters/aedcfb550ceccb77.md)
- [Chapter 4: Governance Frameworks and Compliance Verification Protocols](chapters/d7d02e388c9ec6b6.md)
- [Chapter 4: Governance Frameworks and Compliance Verification Protocols](chapters/f420ef8043e75208.md)

## Ontology terms grounding this collection

- `attestation_min_one_signer` — {X} is a process
- `attestation_signed_by` — {X} is a process that signed by person
- `audit_conducted_by` — {X} is a process that conducted by person
- `pci_dss_requirement` — {X} is a directive information content entity that pci dss requirement {Y}
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_min_one_signer`](tables/t_attestation_min_one_signer.sql) — realizes `attestation_min_one_signer` · _shared with 16 other collection(s)_
- [`t_attestation_signed_by`](tables/t_attestation_signed_by.sql) — realizes `attestation_signed_by` · _shared with 21 other collection(s)_
- [`t_audit_conducted_by`](tables/t_audit_conducted_by.sql) — realizes `audit_conducted_by` · _shared with 19 other collection(s)_
- [`t_pci_dss_requirement`](tables/t_pci_dss_requirement.sql) — realizes `pci_dss_requirement` · _shared with 27 other collection(s)_
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target` · _shared with 27 other collection(s)_
