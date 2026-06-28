---
chapter_id: ch_live_constraint_subclass_94d42f
topic_id: 186
family: 01_foundation
cited_terms: ['constraint_subclass', 'constraint_with_predicate', 'constraint_with_severity_classification']
model: engine-refine
---

In governance frameworks that map compliance obligations to technical predicates, every artifact is anchored by a unique identifier that serves as the primary key across interrelated registries. Constraint subclasses carry identifiers such as CONS-0001 through CONS-0004, each denoting a distinct compliance standard, authentication requirement, audit log retention mandate, or encryption standard. Predicates—representing concrete technical specifications like log retention period, batch processing timeout, error tolerance bound, and batch size limit—are similarly identified with codes such as PRED-0001 through PRED-0004. Severity classifications bear their own identifier namespace (CLAS-0001 through CLAS-0004), enabling cross-referencing between abstract compliance obligations and their operational manifestations. This identifier discipline ensures that every constraint, predicate, and classification can be traced unambiguously through the governance graph, regardless of which subsystem or regulatory domain it originates from.

**t_constraint_subclass**

| id | constraint | constrains | priority | review_cycle_days |
| --- | --- | --- | --- | --- |
| CONS-0001 | Compliance standard | PRED-0008 | 3 | 311 |
| CONS-0002 | Authentication requirement | PRED-0007 | 3 | 467 |
| CONS-0003 | Audit log retention | PRED-0003 | 4 | 185 |
| CONS-0004 | Encryption standard | PRED-0005 | 2 | 391 |
| CONS-0005 | Compliance standard | PRED-0002 | 2 | 713 |
| CONS-0006 | Encryption standard | PRED-0007 | 4 | 60 |

**t_constraint_with_predicate**

| id | constraint |
| --- | --- |
| PRED-0001 | Log retention period |
| PRED-0002 | Batch processing timeout |
| PRED-0003 | Error tolerance bound |
| PRED-0004 | Batch size limit |
| PRED-0005 | Max latency threshold |
| PRED-0006 | Audit trail retention |
| PRED-0007 | Sensor calibration rule |
| PRED-0008 | Rate limit policy |

**t_constraint_with_predicate_predicate**

| id | predicate |
| --- | --- |
| PRED-0001 | authRequirement |
| PRED-0002 | authRequirement |
| PRED-0003 | unitSpecification |
| PRED-0004 | checksumValidation |
| PRED-0005 | targetDataset |
| PRED-0006 | formatRule |

**t_constraint_with_severity_classification**

| id | constraint | severity | priority | language |
| --- | --- | --- | --- | --- |
| CLAS-0001 | Encryption standard | CONS-0001 | 3 | es |
| CLAS-0002 | Sensor calibration interval | CONS-0001 | 5 | en |
| CLAS-0003 | Log retention period | CONS-0001 | 3 | es |
| CLAS-0004 | Voltage threshold | CONS-0004 | 3 | fr |
| CLAS-0005 | Audit log retention | CONS-0002 | 3 | ja |
| CLAS-0006 | Audit log retention | CONS-0002 | 2 | fr |

Priority levels impose a structured ranking on compliance obligations, typically expressed as integer values ranging from 1 to 5, where higher numbers indicate greater urgency or impact. Within the constraint subclass registry, the authentication requirement and the compliance standard both carry a priority of 3, while the audit log retention mandate is elevated to priority 4, and the encryption standard holds priority 2. The severity classification table reinforces this hierarchy: the encryption standard appears with priority 3 across multiple classifications, whereas the sensor calibration interval is assigned the maximum priority of 5, signaling that deviations in this area demand the most immediate remediation. Priority functions as the primary triage mechanism, determining which obligations receive attention first during audits, incident response, and resource allocation cycles.

Review cycle days quantify the frequency with which each compliance obligation must be re-evaluated, expressed as the number of calendar days between successive reviews. The audit log retention mandate requires review every 185 days—approximately semi-annually—while the authentication requirement carries the longest review interval at 467 days, reflecting its relative stability or the cost of reassessment. The encryption standard demands review every 391 days, and the compliance standard every 311 days. These intervals are not arbitrary; they are calibrated against regulatory change velocity, the operational impact of non-compliance, and the cost of verification. Shorter review cycles impose greater operational overhead but reduce the window of undetected drift, making them appropriate for rapidly evolving threat landscapes or frequently amended regulations.

Language designations in the severity classification table—en, es, and fr—indicate the linguistic locale for which a particular classification or compliance artifact is authored or applicable. The encryption standard appears in both English (en) and French (fr) classifications, while the compliance standard and sensor calibration interval are documented in Spanish (es). This multilingual dimension is critical in multinational organizations where regulatory obligations must be communicated, interpreted, and enforced across language boundaries. Language serves as both a localization marker and a compliance boundary: a classification documented in one language may not carry legal weight in a jurisdiction requiring documentation in another, and translation must preserve the technical precision of terms like checksum validation and unit specification.

The relationship between constraints and predicates is governed by a subject-target-role triad that defines how obligations map to technical specifications and who bears responsibility for each linkage. In the predicate relationship registry, the constraint identified as PRED-0003 (batch processing timeout) assumes the role of subject when linked to the predicate PRED-0001 (authRequirement), with the relationship role designated as owner. Conversely, PRED-0005 and PRED-0007 both assume the contributor role when linked to predicates PRED-0003 and PRED-0001 respectively, while PRED-0004 serves as a contributor linking to PRED-0002. The role field—taking values such as owner, observer, and contributor—establishes accountability: the owner is directly responsible for compliance with the predicate, the observer monitors adherence without authority to remediate, and the contributor provides supporting evidence or partial implementation. This role-based assignment transforms abstract constraint-predicate mappings into actionable governance workflows with clear lines of responsibility.

**t_constraint_with_predicate__predicate**

| id | constraint_id | predicate_id | role |
| --- | --- | --- | --- |
| PRED-0001 | PRED-0003 | PRED-0001 | owner |
| PRED-0002 | PRED-0005 | PRED-0003 | observer |
| PRED-0003 | PRED-0004 | PRED-0002 | contributor |
| PRED-0004 | PRED-0007 | PRED-0001 | contributor |
| PRED-0005 | PRED-0008 | PRED-0001 | reviewer |
| PRED-0006 | PRED-0002 | PRED-0003 | reviewer |
| PRED-0007 | PRED-0006 | PRED-0002 | reviewer |
| PRED-0008 | PRED-0001 | PRED-0005 | observer |