---
chapter_id: ch_live_audit_produces_evidence_c558e0
topic_id: 12
family: 07_long_tail
cited_terms: ['audit_produces_evidence', 'frozen_artifact_governed_by', 'directive_only_governs_artifact']
model: engine-refine
---

An attribute in a compliance framework is a named property of an entity that carries a typed value, and the integrity of the framework depends on separating the definition of that property from the storage of its concrete values. An entity is any governed or auditable object—evidence of a security audit, a frozen snapshot of a production artifact, or a directive governing a data asset. Identifiers such as EVID-0001, GOVE-0001, and ARTI-0001 serve as stable keys that bind the entity to its attributes and to the values those attributes hold. The attribute definition itself specifies a name and a type from the XML Schema namespace: xsd:decimal for numeric confidence scores, xsd:dateTime for timestamps, xsd:boolean for mandatory flags, xsd:integer for priority levels, and xsd:string for free-form descriptors. This separation of schema from data ensures that type validation, indexing, and query optimization can be applied per-type without entangling the attribute catalog with the value store.

**t_audit_produces_evidence**

| id | audit |
| --- | --- |
| EVID-0001 | Data Retention Policy Audit |
| EVID-0002 | ISO27001 Certification |
| EVID-0003 | Cloud Infrastructure Scan |
| EVID-0004 | Cloud Infrastructure Scan |
| EVID-0005 | Data Retention Policy Audit |
| EVID-0006 | Data Retention Policy Audit |

**t_audit_produces_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

**t_audit_produces_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2025-03-28T10:19:21 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-02-07T18:23:26 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2025-03-19T12:10:16 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2023-11-17T00:14:22 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2023-04-23T17:18:39 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-01-14T13:39:09 |

**t_audit_produces_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.658 |
| EVID-0002 | EVID-0001 | EVID-0005 | 291.89 |
| EVID-0003 | EVID-0001 | EVID-0007 | 838.98 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.814 |
| EVID-0005 | EVID-0002 | EVID-0005 | 409.44 |
| EVID-0006 | EVID-0002 | EVID-0007 | 534.69 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.935 |
| EVID-0008 | EVID-0003 | EVID-0005 | 954.22 |

**t_audit_produces_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | calibration record |
| EVID-0004 | EVID-0001 | EVID-0010 | en |
| EVID-0005 | EVID-0001 | EVID-0003 | manual |
| EVID-0006 | EVID-0001 | EVID-0006 | deg_C |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

**t_frozen_artifact_governed_by**

| id | frozen |
| --- | --- |
| GOVE-0001 | Log-Archive-23Q4 |
| GOVE-0002 | Model-Prod-v4 |
| GOVE-0003 | Q3-2023-Snapshot |
| GOVE-0004 | Compliance-09 |
| GOVE-0005 | Audit-Baseline-2024 |
| GOVE-0006 | Log-Archive-23Q4 |

**t_frozen_artifact_governed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GOVE-0001 | effective_date | xsd:date |
| GOVE-0002 | enforcement | xsd:string |
| GOVE-0003 | mandatory | xsd:boolean |
| GOVE-0004 | priority | xsd:integer |
| GOVE-0005 | review_cycle_days | xsd:integer |
| GOVE-0006 | scope | xsd:string |
| GOVE-0007 | encoding | xsd:string |
| GOVE-0008 | label_text | xsd:string |

**t_frozen_artifact_governed_by_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0003 | false |
| GOVE-0002 | GOVE-0002 | GOVE-0003 | true |
| GOVE-0003 | GOVE-0003 | GOVE-0003 | false |
| GOVE-0004 | GOVE-0004 | GOVE-0003 | true |
| GOVE-0005 | GOVE-0005 | GOVE-0003 | false |
| GOVE-0006 | GOVE-0006 | GOVE-0003 | false |

**t_frozen_artifact_governed_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0001 | 2025-04-28 |
| GOVE-0002 | GOVE-0002 | GOVE-0001 | 2024-02-08 |
| GOVE-0003 | GOVE-0003 | GOVE-0001 | 2024-10-20 |
| GOVE-0004 | GOVE-0004 | GOVE-0001 | 2024-01-16 |
| GOVE-0005 | GOVE-0005 | GOVE-0001 | 2024-06-17 |
| GOVE-0006 | GOVE-0006 | GOVE-0001 | 2024-04-05 |

**t_frozen_artifact_governed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0004 | 1 |
| GOVE-0002 | GOVE-0001 | GOVE-0005 | 718 |
| GOVE-0003 | GOVE-0002 | GOVE-0004 | 5 |
| GOVE-0004 | GOVE-0002 | GOVE-0005 | 330 |
| GOVE-0005 | GOVE-0003 | GOVE-0004 | 4 |
| GOVE-0006 | GOVE-0003 | GOVE-0005 | 316 |
| GOVE-0007 | GOVE-0004 | GOVE-0004 | 5 |
| GOVE-0008 | GOVE-0004 | GOVE-0005 | 796 |

**t_frozen_artifact_governed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GOVE-0001 | GOVE-0001 | GOVE-0007 | Encoding 01 |
| GOVE-0002 | GOVE-0001 | GOVE-0002 | Enforcement 02 |
| GOVE-0003 | GOVE-0001 | GOVE-0008 | calibration record |
| GOVE-0004 | GOVE-0001 | GOVE-0009 | es |
| GOVE-0005 | GOVE-0001 | GOVE-0006 | Scope 05 |
| GOVE-0006 | GOVE-0002 | GOVE-0007 | Encoding 06 |
| GOVE-0007 | GOVE-0002 | GOVE-0002 | Enforcement 07 |
| GOVE-0008 | GOVE-0002 | GOVE-0008 | nightly summary |

**t_directive_only_governs_artifact**

| id | directive | governs |
| --- | --- | --- |
| ARTI-0001 | ISO 27001 Security Policy | Sensor Data Streams |
| ARTI-0002 | SOC 2 Type II Standard | Network Access Control Lists |
| ARTI-0003 | GDPR Compliance Mandate | Data Lake Metadata Catalog |
| ARTI-0004 | PCI DSS v4.0 Compliance | Data Lake Metadata Catalog |
| ARTI-0005 | FISMA Moderate Baseline | Laboratory Reagent Inventory |
| ARTI-0006 | OWASP Top Ten Control | Access Control Matrices |
| ARTI-0007 | NIST Cybersecurity Framework | Sensor Data Streams |

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

Audit evidence illustrates the pattern. An evidence record identified as EVID-0001 is produced by a Data Retention Policy Audit; EVID-0002 and EVID-0003 both derive from ISO27001 Certification engagements, while EVID-0004 and EVID-0004 are associated with a Cloud Infrastructure Scan. Each evidence entity carries attributes such as confidence, dimension_kind, method, and recorded_at. The confidence attribute is typed as xsd:decimal and stores values like 0.658 and 0.814, representing the assessor's quantified certainty. The recorded_at attribute, typed as xsd:dateTime, anchors the evidence to a point in time—2025-03-28T10:19:21, 2023-02-07T18:23:26, 2025-03-19T12:10:16, or 2023-11-17T00:14:22—enabling temporal queries across audit cycles. The dimension_kind and method attributes, both xsd:string, hold values such as Dimension Kind 01, Encoding 02, and calibration record, providing contextual metadata about how the evidence was derived.

Governance relationships follow the same structural discipline. A frozen artifact such as Log-Archive-23Q4, Model-Prod-v4, Q3-2023-Snapshot, or Compliance-09 is governed by a policy record identified as GOVE-0001 through GOVE-0004. The governing attributes include effective_date (xsd:date), enforcement (xsd:string), mandatory (xsd:boolean), and priority (xsd:integer). The mandatory flag, stored as a boolean, takes values of true or false—true for GOVE-0002 and GOVE-0004, false for GOVE-0001 and GOVE-0003—signaling whether compliance with the governing policy is obligatory. Effective dates such as 2025-04-28, 2024-02-08, 2024-10-20, and 2024-01-16 establish when each governance relationship becomes operative. Priority values like 1, 718, 5, and 330, alongside enforcement descriptors such as Enforcement 02 and Encoding 01, allow operators to rank and filter governance obligations by urgency and scope.

Directive-to-artifact mappings extend the pattern into the regulatory domain. A directive such as ISO 27001 Security Policy, SOC 2 Type II Standard, GDPR Compliance Mandate, or PCI DSS v4.0 Compliance governs an artifact like Sensor Data Streams, Network Access Control Lists, or Data Lake Metadata Catalog. The governing relationship is itself attributed: mandatory flags are true for the first three directives and false for PCI DSS v4.0 Compliance, indicating the relative enforceability of each standard. Effective dates—2023-09-27, 2025-04-15, 2024-03-21, 2024-02-09—anchor the applicability window of each directive. Priority integers such as 5, 959, 4, and 97, together with enforcement labels like Enforcement 02 and Encoding 01, and free-form notes such as nightly summary, provide the operational granularity needed for compliance tracking and reporting.

The value store is partitioned by type: decimal values reside in one table, boolean values in another, dates in a third, integers in a fourth, and variable-length strings in a fifth. Each value row carries an entity identifier that references the governed or audited object, an attribute identifier that references the attribute definition, and the typed value itself. This design means that a single entity—say, EVID-0001—can simultaneously hold a decimal confidence of 0.658, a recorded_at timestamp of 2025-03-28T10:19:21, and a dimension_kind of Dimension Kind 01, each stored in its appropriate type-specific table and joined through the entity and attribute keys. The result is a schema that scales to any number of attributes and value types without requiring structural changes to the underlying tables, while preserving the type safety and query efficiency that a compliance framework demands.