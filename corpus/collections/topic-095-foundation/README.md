# Collection — topic 95 · 01_foundation

FinePDFs-grounded topic (carried forward from the coverage audit). **16 chapters** · **28 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 95: topic 1, topic 14, topic 21, topic 31, topic 40, topic 49, topic 58, topic 68, topic 71, topic 83, topic 85, topic 115, topic 120, topic 132, topic 133, topic 135, topic 138, topic 142, topic 148, topic 151, topic 173, topic 178, topic 183, topic 188, topic 195, topic 198, topic 199.

> **Topic gist** (representative FinePDFs text): SAS/IML® 14.3 User’s Guide The correct bibliographic citation for this manual is as follows: SAS Institute Inc. 2017. *SAS/IML® 14.3 User’s Guide*. Cary, NC: SAS Institute Inc. **SAS/IML® 14.3 User’s Guide** Copyright © 2017, SAS Institute Inc., Cary, NC, USA All Rights Reserved. Produced in the United States of America. **For a hard-copy book:** No part of this publication may be reproduced,... …

## Chapters

- [Chapter 4: Directive Governance and Verification Protocols](chapters/011d1f387b1d28d3.md)
- [Chapter 4: Ontological Formalization of Governance Frameworks](chapters/0eef3bc65a47b3f4.md)
- [Chapter 4: Governance Frameworks and Directive Compliance Mechanisms](chapters/1927d0ef76d27280.md)
- [Chapter 7: Ontological Constraints in Governance Frameworks](chapters/2ceee46d52d5d2ae.md)
- [Chapter 4: Governance Directives and Verification Mechanisms](chapters/2d05fd02cd039950.md)
- [Chapter 4: Governance Frameworks for Digital Compliance](chapters/2f90ddfca812f73d.md)
- [Chapter 7: Ontological Structures in Directive Governance and Compliance Verification](chapters/4cba791cf9508258.md)
- [Chapter 4: Structural Governance in Compliance Frameworks](chapters/70b77232e27ec0d5.md)
- [Directive Governance in Regulatory Audits](chapters/76dac89ca640e342.md)
- [Chapter 4: Governance Frameworks and Directive Compliance Mechanisms](chapters/9589773190d70fa3.md)
- [Chapter 7. Directive Governance in Compliance Audit Trails](chapters/a5d103d55688612b.md)
- [Chapter 4: Directive Governance and Assurance Mechanisms](chapters/a602b48c9d6eb031.md)
- [Chapter 4: Governance Frameworks and Compliance Verification Mechanisms](chapters/b2e34ba882692382.md)
- [Chapter 4: Ontological Structures in Directive Governance and Compliance Verification](chapters/b86944b50a93e86e.md)
- [Directive Governance in Audit Trails](chapters/dba03da8873205a9.md)
- [Directive Governance in Regulatory Audit Systems](chapters/f30a3fe59914764e.md)

## Ontology terms grounding this collection

- `attestation_min_one_signer` — {X} is a process
- `audit_conducted_by` — {X} is a process that conducted by person
- `requirement_equiv_specifies_target` — Class: {X:Class} EquivalentTo: cco:DirectiveICE and (sdg:specifies some {Y:Class}) and (sdg:appliesTo some {Z:Class})
- `requirement_only_satisfied_by` — {X} is a directive information content entity that satisfied by {Y}
- `verification_min_one_evidence` — {X} is a process

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attestation_min_one_signer`](tables/t_attestation_min_one_signer.sql) — realizes `attestation_min_one_signer` · _shared with 16 other collection(s)_
- [`t_audit_conducted_by`](tables/t_audit_conducted_by.sql) — realizes `audit_conducted_by` · _shared with 19 other collection(s)_
- [`t_requirement_equiv_specifies_target`](tables/t_requirement_equiv_specifies_target.sql) — realizes `requirement_equiv_specifies_target` · _shared with 27 other collection(s)_
- [`t_requirement_only_satisfied_by`](tables/t_requirement_only_satisfied_by.sql) — realizes `requirement_only_satisfied_by` · _shared with 2 other collection(s)_
- [`t_verification_min_one_evidence`](tables/t_verification_min_one_evidence.sql) — realizes `verification_min_one_evidence` · _shared with 16 other collection(s)_
