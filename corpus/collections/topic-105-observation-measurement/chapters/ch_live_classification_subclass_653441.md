---
chapter_id: ch_live_classification_subclass_653441
topic_id: 105
family: 03_directive_governance
cited_terms: ['classification_subclass', 'executive_leadership_role', 'claim_basic']
model: engine-refine
---

Claims within the governance framework are anchored by a unique identifier—CLAI-0001 through CLAI-0004 in the observed corpus—each carrying a declarative assertion such as "Model accuracy below SLA," "Schema version deprecated," or "File checksum matches." These claims function as the primary subject of audit and compliance review, and their lifecycle is tracked through a classification subsystem that assigns each claim to a subclass bearing an identifier like CLAS-0001. The classification itself may denote an OWASP Risk Rating, a GDPR Data Category, or a CIS Benchmark, and is accompanied by an exit code—493, 301, 581, or 197 in the available records—and a status drawn from the set failed, pending, or complete. This triad of classification, exit code, and status provides the operational signal required to triage claims, determine remediation priority, and close audit cycles.

**t_classification_subclass**

| id | classification | exit_code | status |
| --- | --- | --- | --- |
| CLAS-0001 | OWASP Risk Rating | 493 | failed |
| CLAS-0002 | GDPR Data Category | 301 | pending |
| CLAS-0003 | GDPR Data Category | 581 | complete |
| CLAS-0004 | CIS Benchmark | 197 | complete |
| CLAS-0005 | OWASP Risk Rating | 912 | complete |

**t_claim_basic**

| id | claim |
| --- | --- |
| CLAI-0001 | Model accuracy below SLA |
| CLAI-0002 | Schema version deprecated |
| CLAI-0003 | Model accuracy below SLA |
| CLAI-0004 | File checksum matches |
| CLAI-0005 | Compliance audit passed |
| CLAI-0006 | Compliance audit passed |

The attribute system supplies the dimensional structure through which claims are measured and documented. Each attribute is defined by a name—confidence, dimension_kind, method, recorded_at—and a type drawn from the XSD vocabulary, including xsd:decimal, xsd:string, and xsd:dateTime. The attr_type designation governs not only serialization but also validation and query semantics, ensuring that a confidence score is stored as a decimal value such as 0.443 or 0.828, while a dimension_kind appears as a string like "Dimension Kind 01" or "Encoding 02." The recorded_at attribute, typed as xsd:dateTime, anchors each claim evaluation to a precise timestamp—2025-05-28T11:02:08, 2025-04-22T09:44:09, 2025-01-23T06:41:57, or 2024-03-14T10:07:11—enabling temporal analysis of claim evolution and SLA adherence.

Attribute values are materialized across three typed value tables, each keyed by an identifier and linked to an entity and an attribute. The entity column references the claim or related object being evaluated, while the attr_id column resolves to the corresponding attribute definition. Decimal values such as 443.93 and 257.71 populate the decimal store; string values including "audit excerpt" and "fr" reside in the varchar store; and datetime values occupy their dedicated table. This separation by attr_type enforces type safety at the storage layer and permits each value domain to be indexed, queried, and validated according to its semantic constraints. The misc column, which holds the actual value, is thus contextualized by the attr_type declared in the attribute registry, creating a schema-on-read discipline that remains flexible while preserving structural integrity.

**t_claim_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CLAI-0001 | confidence | xsd:decimal |
| CLAI-0002 | dimension_kind | xsd:string |
| CLAI-0003 | method | xsd:string |
| CLAI-0004 | recorded_at | xsd:dateTime |
| CLAI-0005 | uncertainty | xsd:decimal |
| CLAI-0006 | unit | xsd:string |
| CLAI-0007 | value | xsd:decimal |
| CLAI-0008 | encoding | xsd:string |

**t_claim_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0004 | 2025-05-28T11:02:08 |
| CLAI-0002 | CLAI-0002 | CLAI-0004 | 2025-04-22T09:44:09 |
| CLAI-0003 | CLAI-0003 | CLAI-0004 | 2025-01-23T06:41:57 |
| CLAI-0004 | CLAI-0004 | CLAI-0004 | 2024-03-14T10:07:11 |
| CLAI-0005 | CLAI-0005 | CLAI-0004 | 2023-08-27T20:51:04 |
| CLAI-0006 | CLAI-0006 | CLAI-0004 | 2025-04-10T08:56:25 |

**t_claim_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | 0.443 |
| CLAI-0002 | CLAI-0001 | CLAI-0005 | 443.93 |
| CLAI-0003 | CLAI-0001 | CLAI-0007 | 257.71 |
| CLAI-0004 | CLAI-0002 | CLAI-0001 | 0.828 |
| CLAI-0005 | CLAI-0002 | CLAI-0005 | 729.35 |
| CLAI-0006 | CLAI-0002 | CLAI-0007 | 717.18 |
| CLAI-0007 | CLAI-0003 | CLAI-0001 | 0.004 |
| CLAI-0008 | CLAI-0003 | CLAI-0005 | 534.68 |

**t_claim_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0002 | Dimension Kind 01 |
| CLAI-0002 | CLAI-0001 | CLAI-0008 | Encoding 02 |
| CLAI-0003 | CLAI-0001 | CLAI-0009 | audit excerpt |
| CLAI-0004 | CLAI-0001 | CLAI-0010 | fr |
| CLAI-0005 | CLAI-0001 | CLAI-0003 | automated |
| CLAI-0006 | CLAI-0001 | CLAI-0006 | m/s |
| CLAI-0007 | CLAI-0002 | CLAI-0002 | Dimension Kind 07 |
| CLAI-0008 | CLAI-0002 | CLAI-0008 | Encoding 08 |

Organizational accountability for claims is expressed through the executive leadership role registry, which maps each role to a reporting chain and a governing body. A Chief Technology Officer reports to the Managing Director and sits on the Board Advisory Group; a Chief Operating Officer reports to the Executive Office and belongs to the C-Suite; a Chief Revenue Officer reports to the CEO Office and participates in the Board Advisory Group. The chiefexecutiveofficerrole column captures the reporting target—Managing Director, Executive Office, CEO Office—while the executiveteam column identifies the governance forum, such as Board Advisory Group or C-Suite, to which the role belongs. This structure establishes a clear chain of command: claims classified under high-severity risk ratings or GDPR Data Categories escalate to the appropriate executive leadership role, whose member_of affiliation determines the board-level visibility and whose reports_to relationship defines the remediation authority.

**t_executive_leadership_role**

| id | executive_leadership_role | reports_to | member_of |
| --- | --- | --- | --- |
| ROLE-0001 | Chief Technology Officer | Managing Director | Board Advisory Group |
| ROLE-0002 | Chief Operating Officer | Executive Office | C-Suite |
| ROLE-0003 | Chief Revenue Officer | Managing Director | Board Advisory Group |
| ROLE-0004 | Chief Revenue Officer | CEO Office | Board Advisory Group |
| ROLE-0005 | Chief Revenue Officer | Executive Office | Corporate Governance Board |
| ROLE-0006 | Chief Human Resources Officer | Chief Executive | C-Suite |
| ROLE-0007 | Chief Human Resources Officer | Executive Office | Executive Operations Group |