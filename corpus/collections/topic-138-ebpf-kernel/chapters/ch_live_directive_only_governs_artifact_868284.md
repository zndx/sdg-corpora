---
chapter_id: ch_live_directive_only_governs_artifact_868284
topic_id: 138
family: 07_long_tail
cited_terms: ['directive_only_governs_artifact', 'syscall_traceable', 'claim_min_one_evidence']
model: engine-refine
---

In compliance and governance architectures, directives establish the authoritative linkage between regulatory requirements and the artifacts they govern. A directive such as the ISO 27001 Security Policy or the SOC 2 Type II Standard does not exist in isolation; it explicitly governs specific evidence artifacts, as seen when ARTI-0001 maps to EVID-0006 and ARTI-0004 (PCI DSS v4.0 Compliance) governs EVID-0005. This governance relationship is the foundational binding that ensures every regulatory obligation can be traced to a concrete artifact, and every artifact can be traced back to its originating mandate. The identifier serves as the immutable anchor throughout this chain, appearing consistently across governance, attribute, and value layers to maintain referential integrity.

**t_directive_only_governs_artifact**

| id | directive | governs |
| --- | --- | --- |
| ARTI-0001 | ISO 27001 Security Policy | EVID-0006 |
| ARTI-0002 | SOC 2 Type II Standard | EVID-0006 |
| ARTI-0003 | GDPR Compliance Mandate | EVID-0002 |
| ARTI-0004 | PCI DSS v4.0 Compliance | EVID-0005 |
| ARTI-0005 | FISMA Moderate Baseline | EVID-0007 |
| ARTI-0006 | OWASP Top Ten Control | EVID-0007 |
| ARTI-0007 | NIST Cybersecurity Framework | EVID-0007 |

**t_directive_only_governs_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | effective_date | xsd:date |
| ARTI-0002 | enforcement | xsd:string |
| ARTI-0003 | mandatory | xsd:boolean |
| ARTI-0004 | priority | xsd:integer |
| ARTI-0005 | review_cycle_days | xsd:integer |
| ARTI-0006 | scope | xsd:string |
| ARTI-0007 | encoding | xsd:string |
| ARTI-0008 | label_text | xsd:string |

**t_directive_only_governs_artifact_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | true |
| ARTI-0002 | ARTI-0002 | ARTI-0003 | true |
| ARTI-0003 | ARTI-0003 | ARTI-0003 | true |
| ARTI-0004 | ARTI-0004 | ARTI-0003 | false |
| ARTI-0005 | ARTI-0005 | ARTI-0003 | false |
| ARTI-0006 | ARTI-0006 | ARTI-0003 | true |
| ARTI-0007 | ARTI-0007 | ARTI-0003 | false |

**t_directive_only_governs_artifact_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 2023-09-27 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2025-04-15 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 2024-03-21 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 2024-02-09 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 2023-02-02 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 2024-08-24 |
| ARTI-0007 | ARTI-0007 | ARTI-0001 | 2023-05-03 |

**t_directive_only_governs_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 5 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 959 |
| ARTI-0003 | ARTI-0002 | ARTI-0004 | 4 |
| ARTI-0004 | ARTI-0002 | ARTI-0005 | 97 |
| ARTI-0005 | ARTI-0003 | ARTI-0004 | 5 |
| ARTI-0006 | ARTI-0003 | ARTI-0005 | 179 |
| ARTI-0007 | ARTI-0004 | ARTI-0004 | 4 |
| ARTI-0008 | ARTI-0004 | ARTI-0005 | 356 |

**t_directive_only_governs_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0007 | Encoding 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0002 | Enforcement 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0008 | nightly summary |
| ARTI-0004 | ARTI-0001 | ARTI-0009 | en |
| ARTI-0005 | ARTI-0001 | ARTI-0006 | Scope 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | Encoding 06 |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Enforcement 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | pre-release note |

**t_claim_min_one_evidence**

| id | claim |
| --- | --- |
| EVID-0001 | Antibiotic resistance rising |
| EVID-0002 | Glacier mass loss accelerating |
| EVID-0003 | Antibiotic resistance rising |
| EVID-0004 | Deforestation rate doubled |
| EVID-0005 | Ocean acidity increased 0.3 |
| EVID-0006 | Ocean acidity increased 0.3 |
| EVID-0007 | Deforestation rate doubled |

Attributes and their types provide the structured metadata that gives each governed artifact operational meaning. The attribute schema distinguishes between effective_date, enforcement, mandatory, and priority, each bound to a precise type—xsd:date, xsd:string, xsd:boolean, or xsd:integer—that constrains the kind of value permitted. A date attribute yields concrete temporal markers such as 2023-09-27 or 2025-04-15, while a boolean attribute carries a value of true or false, as observed when ARTI-0003 evaluates to true across three entities and false in a fourth. Integer attributes encode quantitative measures like 959 or 97, and string attributes capture descriptive content including Encoding 01, Enforcement 02, nightly summary, and en. This type discipline ensures that attribute values are not free-form text but semantically constrained data points that can be validated, compared, and aggregated across the compliance corpus.

The entity concept operates as the contextual carrier of these attributes, linking a specific governed artifact to its attribute values through a tripartite relationship. An entity identifier, such as ARTI-0001 or ARTI-0002, appears alongside an attribute identifier and a value to form a complete fact: which artifact possesses which attribute and what that attribute's value is. This structure permits a single artifact to carry multiple attributes simultaneously—ARTI-0001, for instance, holds both a date value of 2023-09-27 and an integer value of 5—while maintaining clear provenance for each datum. The entity thus functions as the intersection point where governance directives, attribute definitions, and concrete values converge into an auditable record.

Traceability introduces a parallel dimension of observability, where events are counted and categorized to support audit and forensic analysis. The fact_syscall table records event counts—238, 52, 198, 382—each associated with a traceable_by_key that references a dimension of traceability. The dim_traceable_by table supplies the categorical context for these keys, assigning labels such as Traceable By Label 01 through Traceable By Label 04 and categories ranging from Traceable By Category 01 to Traceable By Category 04. This separation of event counts from their categorical metadata enables flexible querying: one can aggregate events by category, filter by label, or drill into individual traceability keys without conflating the quantitative measure with its descriptive classification.

**fact_syscall**

| id | traceable_by_key | event_count |
| --- | --- | --- |
| TRAC-0001 | TRAC-0003 | 238 |
| TRAC-0002 | TRAC-0003 | 52 |
| TRAC-0003 | TRAC-0001 | 198 |
| TRAC-0004 | TRAC-0004 | 382 |
| TRAC-0005 | TRAC-0004 | 283 |
| TRAC-0006 | TRAC-0005 | 288 |

**dim_traceable_by**

| id | traceable_by_label | traceable_by_category |
| --- | --- | --- |
| TRAC-0001 | Traceable By Label 01 | Traceable By Category 01 |
| TRAC-0002 | Traceable By Label 02 | Traceable By Category 02 |
| TRAC-0003 | Traceable By Label 03 | Traceable By Category 03 |
| TRAC-0004 | Traceable By Label 04 | Traceable By Category 04 |
| TRAC-0005 | Traceable By Label 05 | Traceable By Category 05 |
| TRAC-0006 | Traceable By Label 06 | Traceable By Category 06 |

Evidence relationships introduce a further layer of relational complexity, where claims are supported by other evidence items through defined roles. A claim such as "Antibiotic resistance rising" or "Glacier mass loss accelerating" is not asserted in a vacuum; it is backed by specific evidence sources, including a Lancet longitudinal cohort study, an ICES marine ecosystem index, and a WHO mortality surveillance Q3 report. The relationship between claim and supporting evidence is mediated by a role—contributor, reviewer, or owner—that specifies the nature of the evidentiary contribution. In one instance, EVID-0004 assumes the role of contributor to EVID-0002, while EVID-0007 appears as both owner and contributor across different relationships. This role-based structure captures the provenance and authority of each evidentiary link, transforming a flat collection of claims and evidence into a navigable graph of justification.

**t_claim_min_one_evidence_supported_by_evidence**

| id | supported_by_evidence |
| --- | --- |
| EVID-0001 | Lancet longitudinal cohort study |
| EVID-0002 | Lancet longitudinal cohort study |
| EVID-0003 | ICES marine ecosystem index |
| EVID-0004 | WHO mortality surveillance Q3 |
| EVID-0005 | WHO mortality surveillance Q3 |
| EVID-0006 | EPA ambient monitor 7B |
| EVID-0007 | IPCC AR6 synthesis report |
| EVID-0008 | ICES marine ecosystem index |

**t_claim_min_one_evidence__supported_by_evidence**

| id | claim_id | supported_by_evidence_id | role |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0004 | EVID-0002 | contributor |
| EVID-0002 | EVID-0003 | EVID-0007 | reviewer |
| EVID-0003 | EVID-0007 | EVID-0004 | owner |
| EVID-0004 | EVID-0007 | EVID-0005 | contributor |
| EVID-0005 | EVID-0005 | EVID-0004 | reviewer |
| EVID-0006 | EVID-0004 | EVID-0005 | reviewer |
| EVID-0007 | EVID-0007 | EVID-0003 | reviewer |
| EVID-0008 | EVID-0004 | EVID-0004 | owner |