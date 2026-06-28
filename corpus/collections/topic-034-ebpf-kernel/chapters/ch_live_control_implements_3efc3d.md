---
chapter_id: ch_live_control_implements_3efc3d
topic_id: 34
family: 03_directive_governance
cited_terms: ['control_implements', 'soc2_privacy_subclass', 'control_under_framework']
model: engine-refine
---

In compliance architectures, every artifact must be uniquely addressable through an identifier, a stable key that survives refactoring and cross-referencing. The system assigns identifiers such as IMPL-0001 for control-implementation links, PRIV-0001 through PRIV-0006 for SOC 2 privacy subclasses, and FRAM-0001 through FRAM-0004 for framework-level controls. These identifiers serve as the primary keys across all tables, enabling unambiguous joins between the control-implements registry, the privacy-subclass catalog, and the framework-assignment matrix. A single identifier like PRIV-0003, for instance, simultaneously references the SOC2-Processing-Integrity subclass, the accessControl domain, and the Change Advisory Board control that implements it.

**t_control_implements**

| id | control | implements | priority | scope |
| --- | --- | --- | --- | --- |
| IMPL-0001 | Change Advisory Board | PRIV-0006 | 5 | regional |
| IMPL-0002 | Data Retention Schedule | PRIV-0005 | 3 | global |
| IMPL-0003 | Access Review Cycle | PRIV-0003 | 1 | team |
| IMPL-0004 | Data Retention Schedule | PRIV-0003 | 3 | team |
| IMPL-0005 | GDPR Data Minimization | PRIV-0005 | 1 | global |
| IMPL-0006 | Incident Response Protocol | PRIV-0006 | 1 | global |
| IMPL-0007 | NIST SP 800-53 | PRIV-0005 | 2 | local |

**t_soc2_privacy_subclass**

| id | soc |
| --- | --- |
| PRIV-0001 | SOC1-Control-Statement |
| PRIV-0002 | SOC1-TypeII |
| PRIV-0003 | SOC2-Processing-Integrity |
| PRIV-0004 | SOC1-TypeII |
| PRIV-0005 | SOC1-TypeII |
| PRIV-0006 | SOC2-Business-Critical |

**t_soc2_privacy_subclass_for_s_o_c2_domain**

| id | for_s_o_c2_domain |
| --- | --- |
| PRIV-0001 | auditLogging |
| PRIV-0002 | auditLogging |
| PRIV-0003 | accessControl |
| PRIV-0004 | encryptionStandards |
| PRIV-0005 | GDPR |
| PRIV-0006 | processingIntegrity |

**t_control_under_framework**

| id | control | under_framework |
| --- | --- | --- |
| FRAM-0001 | Network firewall | PRIV-0005 |
| FRAM-0002 | Threat detection | PRIV-0005 |
| FRAM-0003 | Session timeout | PRIV-0002 |
| FRAM-0004 | Configuration baseline | PRIV-0005 |
| FRAM-0005 | Vulnerability scan | PRIV-0003 |
| FRAM-0006 | Access review | PRIV-0004 |

Attributes and their types form the metadata backbone that allows controls to carry structured, typed properties without schema changes. The attribute definition table declares names such as effective_date, enforcement, mandatory, and priority, each bound to an XML Schema data type—xsd:date, xsd:string, xsd:boolean, or xsd:integer. This separation of attribute schema from attribute values means the system can add new properties to any control entity without altering the underlying table structure. The entity column in each value table then ties a concrete value back to its owning control record, so that FRAM-0001 carries an effective_date of 2024-07-12, a mandatory flag set to true, and a priority of 3, while FRAM-0002 records an effective_date of 2023-06-25 and a priority of 1.

**t_control_under_framework_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FRAM-0001 | effective_date | xsd:date |
| FRAM-0002 | enforcement | xsd:string |
| FRAM-0003 | mandatory | xsd:boolean |
| FRAM-0004 | priority | xsd:integer |
| FRAM-0005 | review_cycle_days | xsd:integer |
| FRAM-0006 | scope | xsd:string |
| FRAM-0007 | encoding | xsd:string |
| FRAM-0008 | label_text | xsd:string |

**t_control_under_framework_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0003 | true |
| FRAM-0002 | FRAM-0002 | FRAM-0003 | true |
| FRAM-0003 | FRAM-0003 | FRAM-0003 | true |
| FRAM-0004 | FRAM-0004 | FRAM-0003 | false |
| FRAM-0005 | FRAM-0005 | FRAM-0003 | false |
| FRAM-0006 | FRAM-0006 | FRAM-0003 | false |

**t_control_under_framework_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0001 | 2024-07-12 |
| FRAM-0002 | FRAM-0002 | FRAM-0001 | 2023-06-25 |
| FRAM-0003 | FRAM-0003 | FRAM-0001 | 2024-04-08 |
| FRAM-0004 | FRAM-0004 | FRAM-0001 | 2023-08-28 |
| FRAM-0005 | FRAM-0005 | FRAM-0001 | 2025-04-10 |
| FRAM-0006 | FRAM-0006 | FRAM-0001 | 2024-04-05 |

**t_control_under_framework_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0004 | 3 |
| FRAM-0002 | FRAM-0001 | FRAM-0005 | 104 |
| FRAM-0003 | FRAM-0002 | FRAM-0004 | 1 |
| FRAM-0004 | FRAM-0002 | FRAM-0005 | 994 |
| FRAM-0005 | FRAM-0003 | FRAM-0004 | 5 |
| FRAM-0006 | FRAM-0003 | FRAM-0005 | 358 |
| FRAM-0007 | FRAM-0004 | FRAM-0004 | 3 |
| FRAM-0008 | FRAM-0004 | FRAM-0005 | 95 |

**t_control_under_framework_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FRAM-0001 | FRAM-0001 | FRAM-0007 | Encoding 01 |
| FRAM-0002 | FRAM-0001 | FRAM-0002 | Enforcement 02 |
| FRAM-0003 | FRAM-0001 | FRAM-0008 | pre-release note |
| FRAM-0004 | FRAM-0001 | FRAM-0009 | ja |
| FRAM-0005 | FRAM-0001 | FRAM-0006 | Scope 05 |
| FRAM-0006 | FRAM-0002 | FRAM-0007 | Encoding 06 |
| FRAM-0007 | FRAM-0002 | FRAM-0002 | Enforcement 07 |
| FRAM-0008 | FRAM-0002 | FRAM-0008 | calibration record |

The misc column is the generic value store that holds the actual attribute data, partitioned into type-specific tables to enforce schema discipline. Boolean values like true and false populate the boolean value table, date literals such as 2024-04-08 and 2023-08-28 reside in the date table, integers including 3, 104, 1, and 994 fill the integer table, and free-form strings like Encoding 01, Enforcement 02, pre-release note, and ja occupy the varchar table. This type-dispatched design ensures that a control's mandatory attribute is always validated as a boolean, while its effective_date is always a valid date, and its priority is always an integer—eliminating type coercion errors at query time.

Scope and priority provide the governance dimensions that determine how broadly a control applies and how urgently it must be addressed. Scope values of regional, global, and team classify the organizational reach of a control implementation, so that the Data Retention Schedule control applies at both the regional and global levels, while the Access Review Cycle is scoped to a single team. Priority is a numeric ranking—1 being the highest urgency, 5 the lowest—that orders remediation effort; the Access Review Cycle carries priority 1, the Data Retention Schedule carries priority 3, and the Change Advisory Board carries priority 5. Together, these two attributes enable auditors to filter controls by both breadth and urgency, producing matrices that answer which team-level controls demand immediate attention versus which global controls can be scheduled.

Subject, target, and role define the relationship graph that connects privacy subclasses to SOC 2 domains and assigns accountability. The junction table maps a subject—identified by soc_id, such as PRIV-0003 or PRIV-0006—to a target—identified by for_s_o_c2_domain_id, such as PRIV-0001 or PRIV-0005—and labels the relationship with a role of either contributor or owner. This three-column pattern captures not just which privacy subclass supports which domain, but who is responsible for that linkage. In the data, PRIV-0003 appears as a subject linked to PRIV-0003 as a target with the role of owner, while PRIV-0006 appears as a subject linked to PRIV-0005 as a target with the role of contributor, establishing a clear chain of ownership across the compliance mapping.

**t_soc2_privacy_subclass__for_s_o_c2_domain**

| id | soc_id | for_s_o_c2_domain_id | role |
| --- | --- | --- | --- |
| PRIV-0001 | PRIV-0003 | PRIV-0001 | contributor |
| PRIV-0002 | PRIV-0006 | PRIV-0005 | contributor |
| PRIV-0003 | PRIV-0003 | PRIV-0003 | owner |
| PRIV-0004 | PRIV-0002 | PRIV-0006 | contributor |
| PRIV-0005 | PRIV-0003 | PRIV-0003 | contributor |
| PRIV-0006 | PRIV-0005 | PRIV-0006 | contributor |
| PRIV-0007 | PRIV-0006 | PRIV-0003 | observer |
| PRIV-0008 | PRIV-0002 | PRIV-0002 | observer |