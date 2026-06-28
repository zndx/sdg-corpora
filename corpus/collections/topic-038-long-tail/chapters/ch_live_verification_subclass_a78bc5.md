---
chapter_id: ch_live_verification_subclass_a78bc5
topic_id: 38
family: 03_directive_governance
cited_terms: ['verification_subclass', 'school_security_policy', 'ice_exactly_one_subject']
model: engine-refine
---

In governance and compliance systems, every auditable object must be uniquely addressable, and the identifier serves as the durable handle by which records are referenced, joined, and validated across enforcement cycles. Verification subclasses carry identifiers such as VERI-0001 through VERI-0004, each naming a distinct verification activity—Compliance renewal verification, GDPR data flow review, or Security posture assessment—while school security policies are keyed POLI-0001 through POLI-0004 and bound to named institutions including Cedar Ridge Preparatory, Westfield Middle School, Lincoln High School, and Sunrise International School. The entity is the governed subject to which attribute values attach; when a compliance renewal run records duration_seconds as 5469.69 under entity_id VERI-0001, or when Cedar Ridge Preparatory’s mandatory flag resolves to true under entity_id POLI-0001, the identifier names the definition and the entity names the instance receiving the measured or asserted fact. Integrity constraints such as those governing ICE exactly-one-subject artifacts—SUBJ-0001 through SUBJ-0004 linking Calibration Manifest, Provenance Graph Export, and Raw Observation Feed to related verification records VERI-0004, VERI-0001, and VERI-0005—depend on this separation so that cross-domain traceability does not collapse distinct operational events into a single undifferentiated record.

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

**t_ice_exactly_one_subject**

| id | ice | related |
| --- | --- | --- |
| SUBJ-0001 | Calibration Manifest | VERI-0004 |
| SUBJ-0002 | Provenance Graph Export | VERI-0001 |
| SUBJ-0003 | Raw Observation Feed | VERI-0005 |
| SUBJ-0004 | Provenance Graph Export | VERI-0004 |
| SUBJ-0005 | Schema Registry Entry | VERI-0006 |
| SUBJ-0006 | Audit Trail Report | VERI-0007 |
| SUBJ-0007 | Schema Registry Entry | VERI-0001 |
| SUBJ-0008 | Sensor Configuration File | VERI-0003 |

**t_ice_exactly_one_subject_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SUBJ-0001 | encoding | xsd:string |
| SUBJ-0002 | label_text | xsd:string |
| SUBJ-0003 | language | xsd:string |

The attr and attr_type pair constitute the typed contract under which governance data may lawfully be recorded. An attr declares what is being measured or asserted—duration_seconds, end_time, exit_code, host_name for verification subclasses; effective_date, enforcement, mandatory, and priority for school security policies—while attr_type fixes the semantic and syntactic domain in which the value must be interpreted, whether xsd:decimal, xsd:dateTime, xsd:integer, xsd:string, xsd:date, or xsd:boolean. This separation matters because compliance engines cannot treat a timestamp, a duration, and a host label as interchangeable tokens; end_time bound to xsd:dateTime and host_name bound to xsd:string enforce distinct validation, comparison, and retention rules. Where attr_type is honored, a policy analyst may determine that Westfield Middle School’s enforcement attribute, typed xsd:string and valued Enforcement 02, is a categorical assertion distinct from Lincoln High School’s priority integer of 2 or Sunrise International School’s priority of 312, each governed by the integer domain’s ordering and threshold logic rather than by lexical collation.

The misc value is the instantiated fact—the concrete datum that satisfies or fails the attr contract for a given entity at a point in time. Verification telemetry illustrates the pattern across typed stores: decimal durations of 5469.69, 821.61, 4016.93, and 4484.04 seconds; integer exit codes 616, 105, 713, and 29; datetime stamps including 2024-10-23T14:58:17 and 2024-01-09T21:40:31; and varchar observations such as node-a01, Log Level 02, review, and running. Partitioning misc by attr_type rather than coercing all values into a single untyped column preserves evidential fidelity: a GDPR data flow review that records end_time 2024-02-27T03:56:28 and exit_code 105 remains auditable as separately typed facts linked through entity_id and attr_id, not as an ambiguous string that downstream reviewers must reinterpret. The same discipline applies to school security policy values—effective dates from 2023-05-09 through 2024-08-29, mandatory booleans true at Cedar Ridge and false elsewhere, priority integers 2 and 982, and varchar tokens Encoding 01, intake form, and ja—each misc entry carrying probative weight only when read in conjunction with its attr and attr_type.

**t_school_security_policy_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | true |
| POLI-0002 | POLI-0002 | POLI-0003 | false |
| POLI-0003 | POLI-0003 | POLI-0003 | false |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | true |
| POLI-0007 | POLI-0007 | POLI-0003 | true |
| POLI-0008 | POLI-0008 | POLI-0003 | false |

School security policy, as a governed domain object, encodes institutional security posture as a named policy record whose operational meaning is incomplete without its safetyobjective and constitutionalconstraint bindings. The safetyobjective states the protective end the policy is calibrated to achieve: Network intrusion detection at Cedar Ridge Preparatory, Unauthorized access prevention at Westfield Middle School, and Cyber threat intelligence at both Lincoln High School and Sunrise International School. The constitutionalconstraint names the non-negotiable legal, regulatory, or institutional floor the policy must satisfy regardless of tactical method—OSHA workplace safety for Cedar Ridge, the No lethal force rule for Westfield, ADA accessibility standards for Lincoln, and State education statutes for Sunrise. Together, safetyobjective and constitutionalconstraint prevent security programs from drifting into unconstrained capability accumulation; a cyber threat intelligence objective at Lincoln remains subject to ADA accessibility standards, and unauthorized access prevention at Westfield remains bounded by the No lethal force rule even where technical controls might otherwise permit escalation. Attribute extensions—effective_date establishing temporal authority, enforcement and mandatory governing application scope, priority ordering response among competing controls—supply the operational parameters through which abstract policy commitments become schedulable, enforceable obligations.

In practice, auditors and automated validators traverse identifier-linked graphs from policy definition through typed attribute assertions to evidentiary misc values and outward to verification subclasses that substantiate ongoing compliance. A Security posture assessment identified VERI-0004 with duration_seconds 4484.04 and host-level observations may be cross-referenced to a Provenance Graph Export subject SUBJ-0002 related to VERI-0004, while Compliance renewal verification VERI-0001 accumulates multiple datetime terminations, decimal runtimes, integer exit codes, and varchar status tokens across repeated executions. School policies with mandatory false at POLI-0002, POLI-0003, and POLI-0004 but true at POLI-0001 signal differentiated enforcement posture that priority values 982 versus 2 further stratify. The architecture’s force lies in this composability: identifier stabilizes reference, entity anchors instance, attr and attr_type govern permissible assertion, misc carries the probative payload, schoolsecuritypolicy names the institutional security instrument, safetyobjective declares intent, and constitutionalconstraint imposes supremacy rules—yielding a record system in which every compliance claim is typed, attributable, and subject to constraint-aware review without reliance on informal narrative or ad hoc field interpretation.

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

**t_school_security_policy**

| id | school_security_policy | targets | must_satisfy |
| --- | --- | --- | --- |
| POLI-0001 | Cedar Ridge Preparatory | Network intrusion detection | OSHA workplace safety |
| POLI-0002 | Westfield Middle School | Unauthorized access prevention | No lethal force rule |
| POLI-0003 | Lincoln High School | Cyber threat intelligence | ADA accessibility standards |
| POLI-0004 | Sunrise International School | Cyber threat intelligence | State education statutes |
| POLI-0005 | Northview Technical Institute | Emergency evacuation protocols | State education statutes |
| POLI-0006 | Cedar Ridge Preparatory | Visitor management compliance | ISO 27001 framework |
| POLI-0007 | Sunrise International School | Structural integrity monitoring | ADA accessibility standards |
| POLI-0008 | Jefferson STEM Academy | Network intrusion detection | No lethal force rule |

**t_school_security_policy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_school_security_policy_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-05-09 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-07-27 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-12-11 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-08-29 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-05-03 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2024-09-29 |
| POLI-0007 | POLI-0007 | POLI-0001 | 2024-11-04 |
| POLI-0008 | POLI-0008 | POLI-0001 | 2024-06-30 |

**t_school_security_policy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 2 |
| POLI-0002 | POLI-0001 | POLI-0005 | 982 |
| POLI-0003 | POLI-0002 | POLI-0004 | 2 |
| POLI-0004 | POLI-0002 | POLI-0005 | 312 |
| POLI-0005 | POLI-0003 | POLI-0004 | 2 |
| POLI-0006 | POLI-0003 | POLI-0005 | 809 |
| POLI-0007 | POLI-0004 | POLI-0004 | 4 |
| POLI-0008 | POLI-0004 | POLI-0005 | 270 |

**t_school_security_policy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | intake form |
| POLI-0004 | POLI-0001 | POLI-0009 | ja |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | pre-release note |

**t_ice_exactly_one_subject_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SUBJ-0001 | SUBJ-0001 | SUBJ-0001 | Encoding 01 |
| SUBJ-0002 | SUBJ-0001 | SUBJ-0002 | nightly summary |
| SUBJ-0003 | SUBJ-0001 | SUBJ-0003 | fr |
| SUBJ-0004 | SUBJ-0002 | SUBJ-0001 | Encoding 04 |
| SUBJ-0005 | SUBJ-0002 | SUBJ-0002 | intake form |
| SUBJ-0006 | SUBJ-0002 | SUBJ-0003 | de |
| SUBJ-0007 | SUBJ-0003 | SUBJ-0001 | Encoding 07 |
| SUBJ-0008 | SUBJ-0003 | SUBJ-0002 | intake form |