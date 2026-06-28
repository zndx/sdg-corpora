---
chapter_id: ch_live_verification_produces_evidence_672d62
topic_id: 6
family: 03_directive_governance
cited_terms: ['verification_produces_evidence', 'policy_authored_by', 'disjunctive_combination']
model: engine-refine
---

Operational compliance frameworks rely on immutable reference anchors to maintain audit integrity across distributed verification events. Each assessment is assigned a stable identifier—EVID-0001, AUTH-0008, or COMB-0001—that persists through the evidence lifecycle, ensuring traceability from initial audit to final policy enactment. The operational posture of each verification is captured through a dual-layer telemetry system: a semantic status field (complete, failed, pending) paired with a machine-parseable exitcode that quantifies the procedural outcome. A compliance audit Q3 may terminate with status complete and exitcode 568, whereas an identical procedural run might yield status failed with exitcode 821 or remain in a pending state with exitcode 88. This separation of semantic state from numeric exit telemetry allows governance engines to route remediation workflows automatically while preserving a deterministic audit trail for regulatory review.

**t_verification_produces_evidence**

| id | verification | produces_evidence | exit_code | status |
| --- | --- | --- | --- | --- |
| EVID-0001 | Compliance audit Q3 | AUTH-0008 | 568 | complete |
| EVID-0002 | Compliance audit Q3 | AUTH-0001 | 821 | failed |
| EVID-0003 | Compliance audit Q3 | AUTH-0005 | 938 | failed |
| EVID-0004 | Compliance audit Q3 | AUTH-0001 | 88 | pending |
| EVID-0005 | Compliance audit Q3 | AUTH-0004 | 761 | pending |
| EVID-0006 | Compliance audit Q3 | AUTH-0007 | 718 | running |

Once evidence is established, it propagates into policy authorship matrices where regulatory enforceability and data interoperability are formally declared. The ismandatory flag serves as the primary enforcement gate, distinguishing binding controls from advisory guidance; frameworks such as ISO 27001 Controls and the EU AI Risk Framework are explicitly marked true, whereas operational baselines like the AWS IAM Permission Boundary and PCI DSS Access Standards carry a false designation, reflecting their contextual applicability. Concurrently, the encoding attribute standardizes character representation across jurisdictional and technical boundaries. Whether a policy document is rendered in latin1 or ascii, the declared encoding guarantees that downstream parsing engines, automated compliance scanners, and multilingual audit interfaces interpret special characters, numeric symbols, and regulatory terminology without corruption or truncation.

**t_policy_authored_by**

| id | policy | authored_by | mandatory | encoding |
| --- | --- | --- | --- | --- |
| AUTH-0001 | AWS IAM Permission Boundary | EVID-0004 | false | latin1 |
| AUTH-0002 | PCI DSS Access Standards | EVID-0003 | false | latin1 |
| AUTH-0003 | ISO 27001 Controls | EVID-0004 | true | ascii |
| AUTH-0004 | EU AI Risk Framework | EVID-0006 | true | latin1 |
| AUTH-0005 | PCI DSS Access Standards | EVID-0003 | false | latin1 |
| AUTH-0006 | AWS IAM Permission Boundary | EVID-0003 | false | ascii |
| AUTH-0007 | PCI DSS Access Standards | EVID-0003 | true | unicode |
| AUTH-0008 | CCPA Consumer Rights | EVID-0003 | false | unicode |

The structural scaffolding that attaches granular metadata to these governance entities operates through a normalized attribute-value architecture. Rather than embedding heterogeneous properties directly into policy or verification records, the system isolates them into discrete attr definitions, each bound to a strict attr_type that enforces semantic validation. Properties such as confidence, dimension_kind, method, and recorded_at are typed as xsd:decimal, xsd:string, or xsd:dateTime, respectively, preventing type coercion errors during cross-system reconciliation. The entity column functions as the binding key, linking each attribute definition to its parent combination record, while the misc column houses the actual payload—whether a precision float like 0.084 or 689.68, a timestamp such as 2023-12-19T10:56:22, or a categorical string like calibration record or ja. This decoupled design ensures that attribute schemas can evolve independently of the core governance entities without disrupting relational integrity.

**t_disjunctive_combination_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0004 | 2023-12-19T10:56:22 |
| COMB-0002 | COMB-0002 | COMB-0004 | 2025-06-13T05:31:45 |
| COMB-0003 | COMB-0003 | COMB-0004 | 2023-09-21T03:35:03 |
| COMB-0004 | COMB-0004 | COMB-0004 | 2025-01-18T01:14:05 |
| COMB-0005 | COMB-0005 | COMB-0004 | 2023-04-13T14:48:56 |
| COMB-0006 | COMB-0006 | COMB-0004 | 2023-06-17T09:04:58 |

**t_disjunctive_combination_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0001 | 0.084 |
| COMB-0002 | COMB-0001 | COMB-0005 | 689.68 |
| COMB-0003 | COMB-0001 | COMB-0007 | 250.05 |
| COMB-0004 | COMB-0002 | COMB-0001 | 0.409 |
| COMB-0005 | COMB-0002 | COMB-0005 | 133.59 |
| COMB-0006 | COMB-0002 | COMB-0007 | 440.04 |
| COMB-0007 | COMB-0003 | COMB-0001 | 0.271 |
| COMB-0008 | COMB-0003 | COMB-0005 | 418.58 |

**t_disjunctive_combination_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| COMB-0001 | COMB-0001 | COMB-0002 | Dimension Kind 01 |
| COMB-0002 | COMB-0001 | COMB-0008 | Encoding 02 |
| COMB-0003 | COMB-0001 | COMB-0009 | calibration record |
| COMB-0004 | COMB-0001 | COMB-0010 | ja |
| COMB-0005 | COMB-0001 | COMB-0003 | hybrid |
| COMB-0006 | COMB-0001 | COMB-0006 | count |
| COMB-0007 | COMB-0002 | COMB-0002 | Dimension Kind 07 |
| COMB-0008 | COMB-0002 | COMB-0008 | Encoding 08 |

In practice, this architecture transforms static compliance documentation into a dynamic, queryable control plane. Verification outcomes generate evidence identifiers that trigger policy authorship, which in turn inherits mandatory constraints and encoding standards. Disjunctive combination records then aggregate these artifacts, attaching typed attributes that capture confidence intervals, dimensional classifications, and temporal markers. When an auditor queries the system, they do not retrieve a monolithic document; they retrieve a structured graph of identifiers, status flags, exit codes, mandatory flags, encoding declarations, and typed attribute values. This granular composition enables automated gap analysis, precise remediation targeting, and deterministic reporting across multi-jurisdictional regulatory environments, ensuring that every compliance assertion is both machine-verifiable and human-auditable.

**t_disjunctive_combination**

| id | disjunctive | disjunctively_combines |
| --- | --- | --- |
| COMB-0001 | Schema_validation_union | EVID-0006 |
| COMB-0002 | OR_filter_rule | EVID-0005 |
| COMB-0003 | OR_filter_rule | EVID-0001 |
| COMB-0004 | Schema_validation_union | EVID-0005 |
| COMB-0005 | Metric_aggregation_branch | EVID-0004 |
| COMB-0006 | Compliance_check_union | EVID-0004 |

**t_disjunctive_combination_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| COMB-0001 | confidence | xsd:decimal |
| COMB-0002 | dimension_kind | xsd:string |
| COMB-0003 | method | xsd:string |
| COMB-0004 | recorded_at | xsd:dateTime |
| COMB-0005 | uncertainty | xsd:decimal |
| COMB-0006 | unit | xsd:string |
| COMB-0007 | value | xsd:decimal |
| COMB-0008 | encoding | xsd:string |