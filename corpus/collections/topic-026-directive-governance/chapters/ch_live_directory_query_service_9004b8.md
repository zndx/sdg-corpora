---
chapter_id: ch_live_directory_query_service_9004b8
topic_id: 26
family: 08_derived
cited_terms: ['directory_query_service', 'bullying_response_process', 'control_with_owner']
model: engine-refine
---

Operational tracking relies on a standardized `identifier` to anchor every record, linking incident origins to measurable outcomes. The core analytical layer captures interaction volume through the `event_count` metric, which ties a `targets_user` to a `generates_response` actor. For instance, record SERV-0001 logs 315 occurrences, while SERV-0004 tracks 397, providing auditable frequency data that feeds risk assessments, staffing models, and regulatory reporting. This fact-based structure ensures that every incident stream can be quantified, cross-referenced, and traced back to its source without ambiguity.

**fact_directory**

| id | targets_user_key | generates_response_key | event_count |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0006 | SERV-0007 | 315 |
| SERV-0002 | SERV-0002 | SERV-0002 | 259 |
| SERV-0003 | SERV-0001 | SERV-0006 | 81 |
| SERV-0004 | SERV-0002 | SERV-0005 | 397 |

**t_control_with_owner**

| id | control |
| --- | --- |
| OWNE-0001 | Vendor Risk Assessment |
| OWNE-0002 | Data Retention Policy |
| OWNE-0003 | Vendor Risk Assessment |
| OWNE-0004 | Data Retention Policy |
| OWNE-0005 | Password Complexity Policy |
| OWNE-0006 | MFA Enforcement |
| OWNE-0007 | Data Retention Policy |

These identifiers resolve into structured classifications that standardize reporting across departments and jurisdictions. Each `targets_user` and `generates_response` entry carries a `category` designation alongside supplementary `misc` metadata, enabling granular roll-ups without sacrificing descriptive context. This dimensional approach allows compliance officers to filter incident streams by functional group, policy domain, or stakeholder tier while maintaining a single source of truth for cross-referencing. The separation of categorical routing from free-form notes ensures that automated validation rules can operate on structured fields while preserving room for contextual documentation.

**dim_targets_user**

| id | targets_user_label | targets_user_category |
| --- | --- | --- |
| SERV-0001 | Targets User Label 01 | Targets User Category 01 |
| SERV-0002 | Targets User Label 02 | Targets User Category 02 |
| SERV-0003 | Targets User Label 03 | Targets User Category 03 |
| SERV-0004 | Targets User Label 04 | Targets User Category 04 |
| SERV-0005 | Targets User Label 05 | Targets User Category 05 |
| SERV-0006 | Targets User Label 06 | Targets User Category 06 |

**dim_generates_response**

| id | generates_response_label | generates_response_category |
| --- | --- | --- |
| SERV-0001 | Generates Response Label 01 | Generates Response Category 01 |
| SERV-0002 | Generates Response Label 02 | Generates Response Category 02 |
| SERV-0003 | Generates Response Label 03 | Generates Response Category 03 |
| SERV-0004 | Generates Response Label 04 | Generates Response Category 04 |
| SERV-0005 | Generates Response Label 05 | Generates Response Category 05 |
| SERV-0006 | Generates Response Label 06 | Generates Response Category 06 |
| SERV-0007 | Generates Response Label 07 | Generates Response Category 07 |
| SERV-0008 | Generates Response Label 08 | Generates Response Category 08 |

Translating raw incident volume into actionable governance requires mapping each case to a defined `bullyingresponseprocess`. These procedural workflows—such as Playground-Dispute, Hallway-Shoving-Report, or Exclusion-Plan—are explicitly assigned to designated `schoolstaffrole` holders, including GuidanceCounselor, DeanOfStudents, Principal, and VicePrincipal. By binding procedural steps to specific organizational roles, the framework eliminates ambiguity in escalation chains and creates a verifiable audit trail for regulatory inspections. Role-based assignment also supports workload balancing and ensures that response timelines align with statutory requirements.

**t_bullying_response_process**

| id | bullying_response_process | has_participant |
| --- | --- | --- |
| PROC-0001 | Playground-Dispute | GuidanceCounselor |
| PROC-0002 | Hallway-Shoving-Report | DeanOfStudents |
| PROC-0003 | Cafeteria-Conflict | Principal |
| PROC-0004 | Exclusion-Plan | VicePrincipal |
| PROC-0005 | Cyberbullying-Alert | SchoolNurse |

Underpinning these operational workflows is a control framework that tracks policy adherence through structured `attr` definitions and their corresponding `attr_type` specifications. Attributes like effective_date, enforcement, mandatory, and priority are typed as xsd:date, xsd:string, xsd:boolean, or xsd:integer, ensuring that compliance metadata conforms to strict schema validation. This typed attribute model allows auditors to query exactly when a control takes effect, whether it is legally binding, and how it ranks against other organizational mandates. Standardizing attribute types at the schema level prevents data drift and guarantees that downstream reporting engines can parse governance metadata reliably.

**t_control_with_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | effective_date | xsd:date |
| OWNE-0002 | enforcement | xsd:string |
| OWNE-0003 | mandatory | xsd:boolean |
| OWNE-0004 | priority | xsd:integer |
| OWNE-0005 | review_cycle_days | xsd:integer |
| OWNE-0006 | scope | xsd:string |
| OWNE-0007 | encoding | xsd:string |
| OWNE-0008 | label_text | xsd:string |

The actual compliance state is materialized through the `entity` linkage, which binds control definitions to their concrete values across type-specific storage layers. Boolean flags record whether a policy is mandatory (true or false), date fields capture activation windows like 2024-04-04, and integer fields assign quantitative thresholds such as a priority score of 806. Free-text `misc` values supplement these structured fields with contextual notes like change rationale or encoding standards. Together, this architecture enforces data integrity while providing the granular, queryable evidence required for continuous governance monitoring, internal audits, and external compliance reviews.

**t_control_with_owner_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0003 | true |
| OWNE-0002 | OWNE-0002 | OWNE-0003 | true |
| OWNE-0003 | OWNE-0003 | OWNE-0003 | false |
| OWNE-0004 | OWNE-0004 | OWNE-0003 | true |
| OWNE-0005 | OWNE-0005 | OWNE-0003 | true |
| OWNE-0006 | OWNE-0006 | OWNE-0003 | true |
| OWNE-0007 | OWNE-0007 | OWNE-0003 | true |

**t_control_with_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | 2024-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0001 | 2025-04-01 |
| OWNE-0003 | OWNE-0003 | OWNE-0001 | 2025-05-22 |
| OWNE-0004 | OWNE-0004 | OWNE-0001 | 2024-09-08 |
| OWNE-0005 | OWNE-0005 | OWNE-0001 | 2023-05-30 |
| OWNE-0006 | OWNE-0006 | OWNE-0001 | 2023-06-07 |
| OWNE-0007 | OWNE-0007 | OWNE-0001 | 2025-03-19 |

**t_control_with_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0004 | 4 |
| OWNE-0002 | OWNE-0001 | OWNE-0005 | 806 |
| OWNE-0003 | OWNE-0002 | OWNE-0004 | 5 |
| OWNE-0004 | OWNE-0002 | OWNE-0005 | 150 |
| OWNE-0005 | OWNE-0003 | OWNE-0004 | 1 |
| OWNE-0006 | OWNE-0003 | OWNE-0005 | 596 |
| OWNE-0007 | OWNE-0004 | OWNE-0004 | 2 |
| OWNE-0008 | OWNE-0004 | OWNE-0005 | 663 |

**t_control_with_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0007 | Encoding 01 |
| OWNE-0002 | OWNE-0001 | OWNE-0002 | Enforcement 02 |
| OWNE-0003 | OWNE-0001 | OWNE-0008 | change rationale |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | es |
| OWNE-0005 | OWNE-0001 | OWNE-0006 | Scope 05 |
| OWNE-0006 | OWNE-0002 | OWNE-0007 | Encoding 06 |
| OWNE-0007 | OWNE-0002 | OWNE-0002 | Enforcement 07 |
| OWNE-0008 | OWNE-0002 | OWNE-0008 | intake form |