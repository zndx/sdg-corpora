---
chapter_id: ch_live_information_dissemination_event_ccac28
topic_id: 25
family: 08_derived
cited_terms: ['information_dissemination_event', 'kernel_event_with_tid', 'requirement_only_satisfied_by']
model: engine-refine
---

Information dissemination events serve as the primary operational anchors for tracking how organizational knowledge and directives propagate across technical and administrative boundaries. Each event carries a stable identifier—EVEN-0001 through EVEN-0004 in the working set—and is associated with a descriptive title such as Data Retention Policy v3, Security Bulletin 2024-05, or Firmware Rollout v4.2. These events do not exist in isolation; they are connected to dissemination channels like SMS Gateway, Mailing List, CDN Distribution, and Intranet Portal through a dedicated relationship table that records which channel serves which event. The linkage is not merely referential: the relationship table introduces a role column that distinguishes whether an event acts as contributor, owner, or observer in its connection to a given channel, thereby encoding the nature of the association rather than leaving it implicit.

**t_information_dissemination_event**

| id | information_dissemination_event |
| --- | --- |
| EVEN-0001 | Data Retention Policy v3 |
| EVEN-0002 | Security Bulletin 2024-05 |
| EVEN-0003 | Data Retention Policy v3 |
| EVEN-0004 | Firmware Rollout v4.2 |
| EVEN-0005 | Data Retention Policy v3 |
| EVEN-0006 | TLS 1.3 Migration Notice |
| EVEN-0007 | GDPR Compliance Update |

**t_information_dissemination_event_utilizes_channel**

| id | utilizes_channel |
| --- | --- |
| EVEN-0001 | SMS Gateway |
| EVEN-0002 | Mailing List |
| EVEN-0003 | CDN Distribution |
| EVEN-0004 | Intranet Portal |
| EVEN-0005 | RSS Feed |
| EVEN-0006 | Slack Workspace |

**t_information_dissemination_event__utilizes_channel**

| id | information_id | utilizes_channel_id | role |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0004 | EVEN-0001 | contributor |
| EVEN-0002 | EVEN-0004 | EVEN-0005 | contributor |
| EVEN-0003 | EVEN-0001 | EVEN-0005 | owner |
| EVEN-0004 | EVEN-0004 | EVEN-0003 | observer |
| EVEN-0005 | EVEN-0001 | EVEN-0006 | contributor |
| EVEN-0006 | EVEN-0004 | EVEN-0002 | observer |
| EVEN-0007 | EVEN-0001 | EVEN-0005 | owner |
| EVEN-0008 | EVEN-0005 | EVEN-0006 | reviewer |

**t_information_dissemination_event_reaches_audience**

| id | reaches_audience |
| --- | --- |
| EVEN-0001 | Partner Integrators |
| EVEN-0002 | Emergency Responders |
| EVEN-0003 | Public Sector |
| EVEN-0004 | External Developers |
| EVEN-0005 | Field Technicians |
| EVEN-0006 | Internal Auditors |
| EVEN-0007 | Compliance Officers |

**t_information_dissemination_event_has_participant**

| id | has_participant |
| --- | --- |
| EVEN-0001 | Product Manager |
| EVEN-0002 | Legal Counsel |
| EVEN-0003 | Operations Manager |
| EVEN-0004 | Technical Writer |
| EVEN-0005 | Legal Counsel |
| EVEN-0006 | Legal Counsel |
| EVEN-0007 | Security Officer |

Audience reach and participant composition extend the event model into a multi-dimensional provenance framework. Events are linked to target audiences—Partner Integrators, Emergency Responders, Public Sector, External Developers—through a separate relationship table that carries both a role and a cardinality note. The cardinality note, exemplified by entries such as Cardinality Note 01 through Cardinality Note 04, captures metadata about the multiplicity constraints governing the relationship, ensuring that downstream consumers of the data can distinguish one-to-one associations from many-to-many mappings. Similarly, the participant relationship connects events to temporal intervals representing human roles such as Product Manager, Legal Counsel, Operations Manager, and Technical Writer, and this relationship table enriches the linkage with a since column that records the effective date of the association—2025-05-08, 2024-10-02, 2024-02-16, 2023-02-27—providing a temporal audit trail for when particular participants assumed their stated roles.

**t_information_dissemination_event__reaches_audience**

| id | information_id | reaches_audience_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | EVEN-0007 | owner | Cardinality Note 01 |
| EVEN-0002 | EVEN-0007 | EVEN-0001 | contributor | Cardinality Note 02 |
| EVEN-0003 | EVEN-0003 | EVEN-0005 | reviewer | Cardinality Note 03 |
| EVEN-0004 | EVEN-0003 | EVEN-0004 | reviewer | Cardinality Note 04 |
| EVEN-0005 | EVEN-0004 | EVEN-0003 | contributor | Cardinality Note 05 |
| EVEN-0006 | EVEN-0007 | EVEN-0003 | owner | Cardinality Note 06 |
| EVEN-0007 | EVEN-0004 | EVEN-0005 | reviewer | Cardinality Note 07 |
| EVEN-0008 | EVEN-0007 | EVEN-0006 | reviewer | Cardinality Note 08 |

**t_information_dissemination_event__has_participant**

| id | information_id | has_participant_id | role | cardinality_note | since |
| --- | --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | EVEN-0005 | reviewer | Cardinality Note 01 | 2025-05-08 |
| EVEN-0002 | EVEN-0007 | EVEN-0006 | contributor | Cardinality Note 02 | 2024-10-02 |
| EVEN-0003 | EVEN-0003 | EVEN-0002 | contributor | Cardinality Note 03 | 2024-02-16 |
| EVEN-0004 | EVEN-0007 | EVEN-0003 | contributor | Cardinality Note 04 | 2023-02-27 |
| EVEN-0005 | EVEN-0003 | EVEN-0005 | contributor | Cardinality Note 05 | 2024-08-08 |
| EVEN-0006 | EVEN-0003 | EVEN-0002 | reviewer | Cardinality Note 06 | 2024-01-28 |
| EVEN-0007 | EVEN-0003 | EVEN-0004 | owner | Cardinality Note 07 | 2025-02-17 |
| EVEN-0008 | EVEN-0007 | EVEN-0001 | contributor | Cardinality Note 08 | 2025-04-14 |

Beyond the dissemination domain, the same relational pattern recurs in kernel event tracking and requirement satisfaction, demonstrating the generality of the subject–target–role triad. Kernel events identified as TID-0001 through TID-0004 are associated with kernel platforms including ZFS on Linux, Darwin 22.4.0, FreeBSD 13.2, and Linux 5.15.0, and are cross-referenced to thread identifiers such as SATI-0003, SATI-0006, SATI-0001, and SATI-0002. Attributes of these kernel events—duration_seconds typed as xsd:decimal, end_time typed as xsd:dateTime, exit_code typed as xsd:integer, and host_name typed as xsd:string—are stored in value tables that reference an entity column pointing back to the kernel event and an attr column pointing to the attribute definition. The misc column in these value tables holds the actual data: 2025-02-14T18:33:06 for a datetime value, 5060.73 for a decimal duration, 883 for an integer exit code, and gw-12 for a string hostname.

**t_kernel_event_with_tid**

| id | kernel | with_thread_id |
| --- | --- | --- |
| TID-0001 | ZFS on Linux | SATI-0003 |
| TID-0002 | Darwin 22.4.0 | SATI-0006 |
| TID-0003 | FreeBSD 13.2 | SATI-0001 |
| TID-0004 | Linux 5.15.0 | SATI-0002 |
| TID-0005 | ZFS on Linux | SATI-0003 |
| TID-0006 | Red Hat 4.18 | SATI-0006 |

**t_kernel_event_with_tid_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TID-0001 | duration_seconds | xsd:decimal |
| TID-0002 | end_time | xsd:dateTime |
| TID-0003 | exit_code | xsd:integer |
| TID-0004 | host_name | xsd:string |
| TID-0005 | log_level | xsd:string |
| TID-0006 | phase | xsd:string |
| TID-0007 | retry_count | xsd:integer |
| TID-0008 | scheduled_at | xsd:dateTime |

**t_kernel_event_with_tid_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0002 | 2025-02-14T18:33:06 |
| TID-0002 | TID-0001 | TID-0008 | 2024-07-20T10:27:40 |
| TID-0003 | TID-0001 | TID-0009 | 2024-06-11T20:07:21 |
| TID-0004 | TID-0002 | TID-0002 | 2025-04-06T19:50:52 |
| TID-0005 | TID-0002 | TID-0008 | 2025-02-15T21:22:11 |
| TID-0006 | TID-0002 | TID-0009 | 2024-07-12T03:26:24 |
| TID-0007 | TID-0003 | TID-0002 | 2024-05-24T01:52:05 |
| TID-0008 | TID-0003 | TID-0008 | 2023-12-06T07:40:08 |

**t_kernel_event_with_tid_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0001 | 5060.73 |
| TID-0002 | TID-0002 | TID-0001 | 6983.04 |
| TID-0003 | TID-0003 | TID-0001 | 363.99 |
| TID-0004 | TID-0004 | TID-0001 | 6644.72 |
| TID-0005 | TID-0005 | TID-0001 | 5301.35 |
| TID-0006 | TID-0006 | TID-0001 | 4668.07 |

**t_kernel_event_with_tid_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0003 | 883 |
| TID-0002 | TID-0001 | TID-0007 | 384 |
| TID-0003 | TID-0002 | TID-0003 | 644 |
| TID-0004 | TID-0002 | TID-0007 | 289 |
| TID-0005 | TID-0003 | TID-0003 | 158 |
| TID-0006 | TID-0003 | TID-0007 | 165 |
| TID-0007 | TID-0004 | TID-0003 | 803 |
| TID-0008 | TID-0004 | TID-0007 | 36 |

**t_kernel_event_with_tid_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TID-0001 | TID-0001 | TID-0004 | gw-12 |
| TID-0002 | TID-0001 | TID-0005 | Log Level 02 |
| TID-0003 | TID-0001 | TID-0006 | review |
| TID-0004 | TID-0001 | TID-0010 | running |
| TID-0005 | TID-0001 | TID-0011 | Triggered By 05 |
| TID-0006 | TID-0002 | TID-0004 | node-b14 |
| TID-0007 | TID-0002 | TID-0005 | Log Level 07 |
| TID-0008 | TID-0002 | TID-0006 | execution |

**t_requirement_only_satisfied_by**

| id | requirement |
| --- | --- |
| SATI-0001 | OWASP authentication flow |
| SATI-0002 | IEEE 802.1Q tagging |
| SATI-0003 | IEEE 802.1Q tagging |
| SATI-0004 | TLS 1.3 cipher suite |
| SATI-0005 | NIST 800-53 audit logging |
| SATI-0006 | GDPR data residency |

**t_requirement_only_satisfied_by_satisfied_by**

| id | satisfied_by |
| --- | --- |
| SATI-0001 | Let's Encrypt |
| SATI-0002 | OpenSSL 3.0 |
| SATI-0003 | FIPS 140-3 module |
| SATI-0004 | Zstd library |
| SATI-0005 | AWS KMS |
| SATI-0006 | AWS KMS |
| SATI-0007 | Zstd library |

**t_requirement_only_satisfied_by__satisfied_by**

| id | requirement_id | satisfied_by_id | role |
| --- | --- | --- | --- |
| SATI-0001 | SATI-0001 | SATI-0004 | reviewer |
| SATI-0002 | SATI-0003 | SATI-0005 | observer |
| SATI-0003 | SATI-0002 | SATI-0002 | reviewer |
| SATI-0004 | SATI-0003 | SATI-0003 | reviewer |
| SATI-0005 | SATI-0006 | SATI-0002 | observer |
| SATI-0006 | SATI-0001 | SATI-0003 | contributor |
| SATI-0007 | SATI-0003 | SATI-0004 | observer |
| SATI-0008 | SATI-0005 | SATI-0001 | owner |

The requirement satisfaction domain mirrors this structure with its own subject–target–role relationships. Requirements such as OWASP authentication flow, IEEE 802.1Q tagging, and TLS 1.3 cipher suite are linked to satisfying artifacts including Let's Encrypt, OpenSSL 3.0, FIPS 140-3 module, and Zstd library through a relationship table that again employs the role column to classify the nature of the satisfaction—reviewer, observer, or other functional designations. Across all three domains, the identifier column provides the stable primary key for every entity, the subject and target columns encode the two endpoints of each relationship, the role column qualifies the semantic direction of the link, and the cardinality note and since columns supply additional metadata where the relationship model requires it. This consistent schema design enables a unified query surface across disparate data types while preserving the semantic richness of each relationship through typed attributes and temporal provenance.