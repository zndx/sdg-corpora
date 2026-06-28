---
chapter_id: ch_live_verification_subclass_827fe1
topic_id: 38
family: 03_directive_governance
cited_terms: ['verification_subclass', 'cardinality_min_two_generic', 'internal_communication_requirement']
model: engine-refine
---

Verification subclasses constitute the foundational classification layer for audit and compliance activities, each identified by a structured identifier such as VERI-0001 through VERI-0004 and assigned a descriptive classification—Compliance renewal verification, GDPR data flow review, Security posture assessment—that determines the scope and regulatory context of the underlying assessment. These subclasses serve as the primary entity to which typed attribute values are bound, enabling a normalized schema where the structural definition of each attribute is decoupled from its runtime values. The attribute registry defines metadata properties including duration_seconds, end_time, exit_code, and host_name, each annotated with an XSD type constraint—xsd:decimal, xsd:dateTime, xsd:integer, xsd:string—that governs validation and serialization across the system. This separation of schema from instance data permits heterogeneous verification subclasses to share a common attribute vocabulary while maintaining type safety at the point of value assignment.

**t_verification_subclass**

| id | verification |
| --- | --- |
| VERI-0001 | Compliance renewal verification |
| VERI-0002 | GDPR data flow review |
| VERI-0003 | GDPR data flow review |
| VERI-0004 | Security posture assessment |
| VERI-0005 | Regulatory compliance sweep |
| VERI-0006 | Traceability certification run |
| VERI-0007 | Security posture assessment |

**t_verification_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERI-0001 | duration_seconds | xsd:decimal |
| VERI-0002 | end_time | xsd:dateTime |
| VERI-0003 | exit_code | xsd:integer |
| VERI-0004 | host_name | xsd:string |
| VERI-0005 | log_level | xsd:string |
| VERI-0006 | phase | xsd:string |
| VERI-0007 | retry_count | xsd:integer |
| VERI-0008 | scheduled_at | xsd:dateTime |

**t_verification_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0002 | 2024-10-23T14:58:17 |
| VERI-0002 | VERI-0001 | VERI-0008 | 2024-02-27T03:56:28 |
| VERI-0003 | VERI-0001 | VERI-0009 | 2024-10-31T01:53:25 |
| VERI-0004 | VERI-0002 | VERI-0002 | 2024-01-09T21:40:31 |
| VERI-0005 | VERI-0002 | VERI-0008 | 2023-01-30T12:31:57 |
| VERI-0006 | VERI-0002 | VERI-0009 | 2024-01-31T06:48:16 |
| VERI-0007 | VERI-0003 | VERI-0002 | 2024-07-16T09:25:28 |
| VERI-0008 | VERI-0003 | VERI-0008 | 2025-02-02T11:50:21 |

**t_verification_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0001 | 5469.69 |
| VERI-0002 | VERI-0002 | VERI-0001 | 821.61 |
| VERI-0003 | VERI-0003 | VERI-0001 | 4016.93 |
| VERI-0004 | VERI-0004 | VERI-0001 | 4484.04 |
| VERI-0005 | VERI-0005 | VERI-0001 | 1841.34 |
| VERI-0006 | VERI-0006 | VERI-0001 | 4375.47 |
| VERI-0007 | VERI-0007 | VERI-0001 | 6751.14 |

**t_verification_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0003 | 616 |
| VERI-0002 | VERI-0001 | VERI-0007 | 105 |
| VERI-0003 | VERI-0002 | VERI-0003 | 713 |
| VERI-0004 | VERI-0002 | VERI-0007 | 29 |
| VERI-0005 | VERI-0003 | VERI-0003 | 18 |
| VERI-0006 | VERI-0003 | VERI-0007 | 388 |
| VERI-0007 | VERI-0004 | VERI-0003 | 901 |
| VERI-0008 | VERI-0004 | VERI-0007 | 260 |

**t_verification_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERI-0001 | VERI-0001 | VERI-0004 | node-a01 |
| VERI-0002 | VERI-0001 | VERI-0005 | Log Level 02 |
| VERI-0003 | VERI-0001 | VERI-0006 | review |
| VERI-0004 | VERI-0001 | VERI-0010 | running |
| VERI-0005 | VERI-0001 | VERI-0011 | Triggered By 05 |
| VERI-0006 | VERI-0002 | VERI-0004 | ingest-21 |
| VERI-0007 | VERI-0002 | VERI-0005 | Log Level 07 |
| VERI-0008 | VERI-0002 | VERI-0006 | execution |

Value storage is partitioned by data type into four dedicated tables, each keyed to a verification subclass identifier and an attribute reference, ensuring that decimal measurements such as 5469.69, 821.61, 4016.93, and 4484.04 are stored alongside integer codes like 616, 105, 713, and 29, timestamped event markers including 2024-10-23T14:58:17 and 2024-02-27T03:56:28, and free-form strings such as node-a01, Log Level 02, review, and running. The entity_id column in each value table establishes a many-to-one relationship back to the verification subclass, allowing a single assessment record to accumulate a heterogeneous set of typed properties without requiring a wide denormalized row. The attr_id column cross-references the attribute definition table, creating a foreign-key chain from instance value through attribute metadata to the parent verification subclass, thereby enforcing referential integrity across the entire attribute-value graph. Cardinality constraints further govern the composition of verification subclasses: entries in the generic cardinality table impose requirements such as AtLeastTwo and MinTwoRequired on specific attribute references, ensuring that critical assessments like VERI-0004 and VERI-0001 carry a minimum set of defined attributes before they are considered structurally complete.

**t_cardinality_min_two_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | AtLeastTwo | VERI-0006 |
| GENE-0002 | MinTwoRequired | VERI-0007 |
| GENE-0003 | AtLeastTwo | VERI-0004 |
| GENE-0004 | AtLeastTwo | VERI-0001 |
| GENE-0005 | DualAssociation | VERI-0003 |
| GENE-0006 | TwinConstraint | VERI-0002 |

Internal communication requirements form a parallel governance construct that maps organizational mandates to specific collaboration platforms and compliance objectives. Each requirement record—identified by codes such as REQU-0001 through REQU-0004—specifies a policy directive like Remote Work Policy Update, Employee Feedback Loop Mandate, or Incident Response Notification Rule, and binds that directive to an enterprise social media platform including Yammer, Discord Internal, or Chatter. The targets_goal column anchors each requirement to an organizational outcome such as Safety Protocol Awareness, Change Management Adoption, or Regulatory Compliance, while the review_cycle_days field imposes a temporal governance cadence ranging from 186 days for incident response notifications to 750 days for remote work policy updates. Language specifications—en for English, ja for Japanese—ensure that communication artifacts are rendered in the appropriate locale, supporting multinational compliance frameworks where regulatory language requirements vary by jurisdiction. The convergence of these two data domains—the verification subclass attribute system and the internal communication requirement registry—establishes a unified model for tracking both the technical execution of compliance assessments and the organizational communication channels through which their results are disseminated and reviewed.

**t_internal_communication_requirement**

| id | internal_communication_requirement | specifies_platform | targets_goal | review_cycle_days | language |
| --- | --- | --- | --- | --- | --- |
| REQU-0001 | Remote Work Policy Update | Yammer | Safety Protocol Awareness | 750 | en |
| REQU-0002 | Employee Feedback Loop Mandate | Discord Internal | Change Management Adoption | 478 | en |
| REQU-0003 | Employee Feedback Loop Mandate | Chatter | Regulatory Compliance | 606 | ja |
| REQU-0004 | Incident Response Notification Rule | Yammer | Regulatory Compliance | 186 | en |
| REQU-0005 | Q3 Transparency Directive | Yammer | Regulatory Compliance | 572 | en |
| REQU-0006 | Internal Knowledge Sharing Standard | Mattermost | Culture Reinforcement | 940 | ja |