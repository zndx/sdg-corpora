---
chapter_id: ch_live_policy_authored_by_676b1f
topic_id: 135
family: 01_foundation
cited_terms: ['policy_authored_by', 'program_with_entry_exactly_one', 'alert_governed_by_runbook']
model: engine-refine
---

Attributes, their types, encodings, entities, identifiers, mandatory flags, and version numbers constitute the structural vocabulary through which governance frameworks, operational policies, and programmatic resources are described, cross-referenced, and enforced. An identifier serves as the immutable handle by which any entity—whether a policy, a program, or an alert—is addressed across systems. In the policy registry, identifiers such as AUTH-0001 through AUTH-0004 anchor documents like the AWS IAM Permission Boundary, the PCI DSS Access Standards, the ISO 27001 Controls, and the EU AI Risk Framework, each of which is authored by a distinct body: the European Commission, NIST Computer Security, or the Federal Trade Commission. Programs carry their own addressing scheme; the inventory_sync program, for instance, is resolved through the identifier ARN:res/41, while the health_check program is distinguished by ref-8842. Alerts—Data Pipeline Stalled, API Gateway Timeout, CPU Utilization Critical, TLS Certificate Expiry—are similarly keyed by identifiers such as RUNB-0001 through RUNB-0004, enabling unambiguous reference in runbook governance and incident response workflows.

**t_policy_authored_by**

| id | policy | authored_by | mandatory | encoding |
| --- | --- | --- | --- | --- |
| AUTH-0001 | AWS IAM Permission Boundary | European Commission | false | latin1 |
| AUTH-0002 | PCI DSS Access Standards | NIST Computer Security | false | latin1 |
| AUTH-0003 | ISO 27001 Controls | NIST Computer Security | true | ascii |
| AUTH-0004 | EU AI Risk Framework | Federal Trade Commission | true | latin1 |
| AUTH-0005 | PCI DSS Access Standards | Federal Trade Commission | false | latin1 |
| AUTH-0006 | AWS IAM Permission Boundary | AWS Compliance Office | false | ascii |
| AUTH-0007 | PCI DSS Access Standards | SOC 2 Audit Board | true | unicode |
| AUTH-0008 | CCPA Consumer Rights | Federal Trade Commission | false | unicode |

**t_alert_governed_by_runbook_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RUNB-0001 | effective_date | xsd:date |
| RUNB-0002 | enforcement | xsd:string |
| RUNB-0003 | mandatory | xsd:boolean |
| RUNB-0004 | priority | xsd:integer |
| RUNB-0005 | review_cycle_days | xsd:integer |
| RUNB-0006 | scope | xsd:string |
| RUNB-0007 | encoding | xsd:string |
| RUNB-0008 | label_text | xsd:string |

**t_alert_governed_by_runbook_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0003 | false |
| RUNB-0002 | RUNB-0002 | RUNB-0003 | false |
| RUNB-0003 | RUNB-0003 | RUNB-0003 | true |
| RUNB-0004 | RUNB-0004 | RUNB-0003 | true |
| RUNB-0005 | RUNB-0005 | RUNB-0003 | true |
| RUNB-0006 | RUNB-0006 | RUNB-0003 | true |

**t_alert_governed_by_runbook_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0001 | 2023-06-14 |
| RUNB-0002 | RUNB-0002 | RUNB-0001 | 2023-01-20 |
| RUNB-0003 | RUNB-0003 | RUNB-0001 | 2025-03-21 |
| RUNB-0004 | RUNB-0004 | RUNB-0001 | 2025-02-03 |
| RUNB-0005 | RUNB-0005 | RUNB-0001 | 2023-12-24 |
| RUNB-0006 | RUNB-0006 | RUNB-0001 | 2024-09-30 |

**t_alert_governed_by_runbook_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0004 | 3 |
| RUNB-0002 | RUNB-0001 | RUNB-0005 | 802 |
| RUNB-0003 | RUNB-0002 | RUNB-0004 | 2 |
| RUNB-0004 | RUNB-0002 | RUNB-0005 | 702 |
| RUNB-0005 | RUNB-0003 | RUNB-0004 | 5 |
| RUNB-0006 | RUNB-0003 | RUNB-0005 | 87 |
| RUNB-0007 | RUNB-0004 | RUNB-0004 | 1 |
| RUNB-0008 | RUNB-0004 | RUNB-0005 | 47 |

**t_alert_governed_by_runbook_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RUNB-0001 | RUNB-0001 | RUNB-0007 | Encoding 01 |
| RUNB-0002 | RUNB-0001 | RUNB-0002 | Enforcement 02 |
| RUNB-0003 | RUNB-0001 | RUNB-0008 | pre-release note |
| RUNB-0004 | RUNB-0001 | RUNB-0009 | en |
| RUNB-0005 | RUNB-0001 | RUNB-0006 | Scope 05 |
| RUNB-0006 | RUNB-0002 | RUNB-0007 | Encoding 06 |
| RUNB-0007 | RUNB-0002 | RUNB-0002 | Enforcement 07 |
| RUNB-0008 | RUNB-0002 | RUNB-0008 | change rationale |

The attribute system extends this addressing model by attaching named properties to entities, each property carrying a declared type that constrains the shape of permissible values. The attribute registry defines properties such as effective_date, enforcement, mandatory, and priority, with types drawn from the XML Schema Definition namespace: xsd:date for temporal boundaries, xsd:string for free-form text, xsd:boolean for binary flags, and xsd:integer for ordinal or quantitative measures. This type discipline is not merely declarative; it governs how values are stored, validated, and rendered across heterogeneous systems. A boolean attribute on an alert entity resolves to one of two states—false or true—while a date attribute carries values such as 2023-06-14 or 2025-03-21, and an integer attribute encodes magnitudes ranging from 2 to 802. The separation of value tables by type (boolean, date, integer, varchar) reflects a deliberate normalization strategy: each value table enforces its domain constraint at the storage layer, preventing type coercion errors and ensuring that downstream consumers can rely on the semantic integrity of the data they query.

Encoding and mandatory flags introduce further dimensions of control. Character encoding—latin1 or ascii—determines how textual values are serialized and transmitted, a concern that becomes critical when policies authored by international bodies such as the European Commission must interoperate with systems that expect US-ASCII byte ranges. The mandatory flag, present on policy records, signals whether a given policy is a binding requirement or a recommended practice: the ISO 27001 Controls and the EU AI Risk Framework are marked mandatory, whereas the AWS IAM Permission Boundary and the PCI DSS Access Standards are not. This distinction carries operational weight; mandatory policies trigger compliance checks and audit obligations, while non-mandatory ones serve as guidance. The interplay between encoding and mandatory status is subtle but significant: a policy marked mandatory may still carry a latin1 encoding, requiring the consuming system to perform character set conversion before rendering or comparing its textual content against regulatory checklists.

Version numbers provide the temporal axis along which entities evolve. The inventory_sync program exists in at least two revisions—version 12 and version 3—each potentially introducing different entry points (api_gateway versus main.py) while retaining the same program identity. The nightly_etl program carries version 8, and health_check carries version 11. Versioning enables rollback, auditability, and controlled deployment: when an alert such as API Gateway Timeout is governed by a runbook, the runbook's effectiveness is tied to a specific version of the underlying program or policy. The identifier ARN:res/41, for example, resolves to inventory_sync across versions, but the entry point and behavioral semantics may diverge between version 3 and version 12. This versioned addressing model ensures that governance decisions—such as which runbook to invoke for a given alert—are traceable to the exact revision of the resource under management, supporting both compliance reporting and incident post-mortems.

**t_program_with_entry_exactly_one**

| id | program | entry_point | identifier | version |
| --- | --- | --- | --- | --- |
| ONE-0001 | inventory_sync | api_gateway | ARN:res/41 | 12 |
| ONE-0002 | inventory_sync | main.py | ARN:res/41 | 3 |
| ONE-0003 | nightly_etl | api_gateway | ARN:res/41 | 8 |
| ONE-0004 | health_check | cron_trigger | ref-8842 | 11 |
| ONE-0005 | health_check | api_gateway | doi:10.1109/x | 9 |
| ONE-0006 | nightly_etl | command_line | urn:uuid:9f2a | 7 |
| ONE-0007 | health_check | start_service | urn:uuid:9f2a | 1 |

**t_alert_governed_by_runbook**

| id | alert |
| --- | --- |
| RUNB-0001 | Data Pipeline Stalled |
| RUNB-0002 | API Gateway Timeout |
| RUNB-0003 | CPU Utilization Critical |
| RUNB-0004 | TLS Certificate Expiry |
| RUNB-0005 | Disk Space Warning |
| RUNB-0006 | Memory Leak Detected |