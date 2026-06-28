---
chapter_id: ch_live_radicalization_process_0b69a0
topic_id: 26
family: 08_derived
cited_terms: ['radicalization_process', 'audit_targets_data_artifact', 'mental_health_education_program']
model: engine-refine
---

The system relies on unique identifiers to anchor entities across disparate operational domains, ensuring that every tracked event, program, or threat vector maintains a persistent, traceable identity. Whether monitoring a radicalization process or an educational intervention, the entity serves as the foundational unit of analysis. For instance, a radicalization process is assigned a distinct identifier such as PROC-0001, while a specific audit target artifact is tracked under ARTI-0001. These identifiers are not merely labels; they are the keys that bind complex metadata to a central registry, allowing governance frameworks to correlate disparate data points without ambiguity. By standardizing how entities are referenced, the system ensures that downstream analytics and compliance reporting can reliably join data across tables, maintaining the integrity of the audit trail.

**t_radicalization_process**

| id | radicalization_process | has_participant |
| --- | --- | --- |
| PROC-0001 | Militia Formation Phase | Sympathizer Network Alpha |
| PROC-0002 | Network Recruit Wave | Al-Shabaab Recruitment Cell |
| PROC-0003 | Radicalization Vector Delta | Regional Coordination Cell |
| PROC-0004 | Network Recruit Wave | Sympathizer Network Alpha |
| PROC-0005 | Ideological Shift Cycle | Militia Training Outpost |
| PROC-0006 | Radicalization Vector Delta | Ideological Mentorship Program |

**t_audit_targets_data_artifact**

| id | audit |
| --- | --- |
| ARTI-0001 | Cloud-Bucket-Encryption |
| ARTI-0002 | SOC2-Q3-2023 |
| ARTI-0003 | API-Auth-Token-Rotation |
| ARTI-0004 | Vendor-Access-Assessment |
| ARTI-0005 | Cloud-Bucket-Encryption |
| ARTI-0006 | Model-Pipeline-Validation |

In the realm of threat intelligence and security governance, understanding the mechanics of radicalization requires mapping the specific phases of a process to the organizations facilitating them. The system captures these dynamics by linking a defined radicalization process—such as a Militia Formation Phase or a Network Recruit Wave—to the affiliated organizations executing the strategy. For example, the Sympathizer Network Alpha is recorded as a participant in a radicalization vector, while an Al-Shabaab Recruitment Cell is tracked as the active participant in a Network Recruit Wave. This linkage is critical for compliance and security teams, as it allows them to attribute specific radicalization activities to their source organizations, enabling targeted interventions and accurate threat reporting.

Conversely, governance frameworks also track positive interventions designed to counteract these threats, particularly within vulnerable populations. Mental health education programs are meticulously cataloged to ensure that outreach efforts are properly documented and their effectiveness can be measured. A program like the Youth Wellness Initiative might encompass multiple delivered presentations, ranging from a Coping Skills Session to an Emotional Intelligence Talk, while a separate Sources of Strength program delivers a Recognizing Depression Workshop. These programs are explicitly mapped to the youth demographics they are designed to serve, such as Immigrant Adolescents, Foster Care Youths, or College Freshmen. By maintaining a structured record of which presentations target which demographics, organizations can audit their outreach efforts to ensure equitable resource distribution and measure the reach of their preventative mental health strategies.

**t_mental_health_education_program**

| id | mental_health_education_program | delivered_presentation | targets_demographic |
| --- | --- | --- | --- |
| PROG-0001 | Youth Wellness Initiative | Coping Skills Session | Immigrant Adolescents |
| PROG-0002 | Youth Wellness Initiative | Understanding Anxiety Workshop | Foster Care Youths |
| PROG-0003 | Sources of Strength | Recognizing Depression Workshop | Athlete Communities |
| PROG-0004 | Youth Wellness Initiative | Emotional Intelligence Talk | College Freshmen |
| PROG-0005 | Sources of Strength | Understanding Anxiety Workshop | College Freshmen |
| PROG-0006 | Sources of Strength | Mental Health Awareness Brief | High School Students |
| PROG-0007 | Teen Resilience Project | Stress Management Seminar | First Nations Youth |

On the technical compliance side, the system manages complex audit targets through a highly flexible attribute model. An audit target, such as the Cloud-Bucket-Encryption check or the SOC2-Q3-2023 assessment, is treated as an entity that can possess a wide variety of attributes. These attributes—ranging from duration_seconds and host_name to exit_code and end_time—are defined with strict data typing, utilizing standards like xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string. This schema-less approach to value storage allows the system to capture heterogeneous data without rigid structural constraints. For instance, the duration of an audit might be recorded as a decimal value like 4704.44, while the status of the process is captured as a string value such as running or execution.

**t_audit_targets_data_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2024-12-01T01:08:20 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 2025-04-11T08:34:59 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | 2024-01-10T01:48:17 |
| ARTI-0004 | ARTI-0002 | ARTI-0002 | 2023-12-13T07:58:05 |
| ARTI-0005 | ARTI-0002 | ARTI-0008 | 2024-04-04T16:02:49 |
| ARTI-0006 | ARTI-0002 | ARTI-0009 | 2023-03-02T22:50:55 |
| ARTI-0007 | ARTI-0003 | ARTI-0002 | 2025-03-24T22:59:49 |
| ARTI-0008 | ARTI-0003 | ARTI-0008 | 2024-12-31T14:33:38 |

**t_audit_targets_data_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 4704.44 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2823.51 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 460.93 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 4764.85 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 3458.42 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 1214.20 |

The actual values for these attributes are stored in specialized value tables that correspond to their respective data types, ensuring data integrity and efficient querying. A single audit artifact entity can thus accumulate a rich profile of metadata: a host_name of node-a01, a log level of Log Level 02, an exit code of 102, and a precise end_time of 2024-12-01T01:08:20. This granular storage of miscellaneous data allows compliance officers to reconstruct the exact state of an audit target at any given moment. By separating the attribute definitions from their typed values, the framework supports an extensible data model where new audit requirements can be added dynamically, ensuring the system remains adaptable to evolving regulatory standards and operational needs.

**t_audit_targets_data_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | duration_seconds | xsd:decimal |
| ARTI-0002 | end_time | xsd:dateTime |
| ARTI-0003 | exit_code | xsd:integer |
| ARTI-0004 | host_name | xsd:string |
| ARTI-0005 | log_level | xsd:string |
| ARTI-0006 | phase | xsd:string |
| ARTI-0007 | retry_count | xsd:integer |
| ARTI-0008 | scheduled_at | xsd:dateTime |

**t_audit_targets_data_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | 102 |
| ARTI-0002 | ARTI-0001 | ARTI-0007 | 288 |
| ARTI-0003 | ARTI-0002 | ARTI-0003 | 803 |
| ARTI-0004 | ARTI-0002 | ARTI-0007 | 1 |
| ARTI-0005 | ARTI-0003 | ARTI-0003 | 425 |
| ARTI-0006 | ARTI-0003 | ARTI-0007 | 187 |
| ARTI-0007 | ARTI-0004 | ARTI-0003 | 75 |
| ARTI-0008 | ARTI-0004 | ARTI-0007 | 345 |

**t_audit_targets_data_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | node-a01 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | Log Level 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0006 | execution |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | running |
| ARTI-0005 | ARTI-0001 | ARTI-0011 | Triggered By 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0004 | node-a01 |
| ARTI-0007 | ARTI-0002 | ARTI-0005 | Log Level 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0006 | closeout |