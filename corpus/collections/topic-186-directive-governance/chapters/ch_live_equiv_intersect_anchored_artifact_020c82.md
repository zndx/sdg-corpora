---
chapter_id: ch_live_equiv_intersect_anchored_artifact_020c82
topic_id: 186
family: 01_foundation
cited_terms: ['equiv_intersect_anchored_artifact', 'information_dissemination_event', 'artifact_with_existential']
model: engine-refine
---

In information governance frameworks, every artifact and event is anchored by a unique identifier—such as ARTI-0001 or EVEN-0001—that serves as the immutable reference point for all downstream relationships. These identifiers are not merely labels; they are the primary keys that enable cross-referencing between disparate data domains, from artifact registries to dissemination event logs. An artifact record might carry properties like checksum (e.g., 7b14de08 or 5e8f3c91) and license (e.g., proprietary, GPL-3.0, MIT), while a dissemination event might be titled Data Retention Policy v3 or Security Bulletin 2024-05. The integrity of these records depends on the fidelity of their attributes, which are themselves typed and versioned. Attribute definitions—such as checksum, created_date, identifier, and license—are declared with explicit types like xsd:string, xsd:date, or cco:DesignativeICE, ensuring that every value assigned to an entity conforms to a known schema. This type discipline prevents semantic drift and enables automated validation across the data lifecycle.

**t_equiv_intersect_anchored_artifact**

| id | equiv | equiv_2 | checksum | license |
| --- | --- | --- | --- | --- |
| ARTI-0001 | LabSampleMetadata | IntegrityFile | 7b14de08 | proprietary |
| ARTI-0002 | IngestionPipeline | ComplianceDocument | 5e8f3c91 | GPL-3.0 |
| ARTI-0003 | ValidationRuleSet | SecurityAuditLog | 7b14de08 | MIT |
| ARTI-0004 | AuditTrailLog | IntegrityFile | a3f9c21e | proprietary |
| ARTI-0005 | FeatureVectorStore | ConfigurationArtifact | a3f9c21e | GPL-3.0 |
| ARTI-0006 | AuditTrailLog | ConstraintDefinition | a3f9c21e | BSD-3-Clause |

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

**t_artifact_with_existential**

| id | artifact | related |
| --- | --- | --- |
| EXIS-0001 | provenance-cert | backup-storage-array |
| EXIS-0002 | edge-gateway | environmental-monitor |
| EXIS-0003 | edge-gateway | network-traffic-capture |
| EXIS-0004 | audit-log-2023 | field-site-alpha |
| EXIS-0005 | edge-gateway | ingestion-pipeline |
| EXIS-0006 | audit-log-2023 | data-retention-policy |

**t_artifact_with_existential_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EXIS-0001 | checksum | xsd:string |
| EXIS-0002 | created_date | xsd:date |
| EXIS-0003 | identifier | cco:DesignativeICE |
| EXIS-0004 | license | xsd:string |
| EXIS-0005 | mime_type | xsd:string |
| EXIS-0006 | size_bytes | xsd:long |
| EXIS-0007 | uri | xsd:string |
| EXIS-0008 | version | xsd:integer |

**t_artifact_with_existential_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0002 | 2024-03-17 |
| EXIS-0002 | EXIS-0002 | EXIS-0002 | 2024-10-14 |
| EXIS-0003 | EXIS-0003 | EXIS-0002 | 2023-12-18 |
| EXIS-0004 | EXIS-0004 | EXIS-0002 | 2023-02-05 |
| EXIS-0005 | EXIS-0005 | EXIS-0002 | 2024-03-19 |
| EXIS-0006 | EXIS-0006 | EXIS-0002 | 2025-01-11 |

**t_artifact_with_existential_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0006 | 401 |
| EXIS-0002 | EXIS-0001 | EXIS-0008 | 10 |
| EXIS-0003 | EXIS-0002 | EXIS-0006 | 361 |
| EXIS-0004 | EXIS-0002 | EXIS-0008 | 7 |
| EXIS-0005 | EXIS-0003 | EXIS-0006 | 386 |
| EXIS-0006 | EXIS-0003 | EXIS-0008 | 10 |
| EXIS-0007 | EXIS-0004 | EXIS-0006 | 351 |
| EXIS-0008 | EXIS-0004 | EXIS-0008 | 8 |

**t_artifact_with_existential_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0001 | 5e8f3c91 |
| EXIS-0002 | EXIS-0001 | EXIS-0003 | urn:uuid:9f2a |
| EXIS-0003 | EXIS-0001 | EXIS-0004 | proprietary |
| EXIS-0004 | EXIS-0001 | EXIS-0009 | on-prem-dc1 |
| EXIS-0005 | EXIS-0001 | EXIS-0005 | application/json |
| EXIS-0006 | EXIS-0001 | EXIS-0010 | Name 06 |
| EXIS-0007 | EXIS-0001 | EXIS-0011 | platform-team |
| EXIS-0008 | EXIS-0001 | EXIS-0012 | Tags 08 |

The actual values of these attributes are stored separately from their definitions, linked through an entity reference that ties a specific attribute instance to its concrete value. For example, the artifact identified as EXIS-0001 carries a checksum value of 5e8f3c91, a license of proprietary, and a created_date of 2024-03-17, each resolved through foreign-key joins between the entity table, the attribute definition table, and the value tables. The value column—typed generically as misc—accommodates heterogeneous data: dates like 2024-10-14, strings like urn:uuid:9f2a, integers like 401 or 10, and freeform descriptors like on-prem-dc1. This separation of attribute schema from attribute value is a deliberate design choice that supports extensibility; new attributes can be introduced without altering the underlying value storage, and the same attribute definition can be reused across multiple entities. The checksum attribute, in particular, plays a dual role: it is both a data property (recording the hash of an artifact) and a mechanism for detecting corruption or unauthorized modification, as evidenced by artifacts ARTI-0001 and ARTI-0003 sharing the identical checksum 7b14de08, which may indicate they are duplicates or derived from the same source.

Information dissemination events form a parallel domain of records that describe how organizational knowledge is distributed. An event such as Firmware Rollout v4.2 or Data Retention Policy v3 is not an abstract concept but a concrete action with channels, audiences, and participants. Dissemination channels—SMS Gateway, Mailing List, CDN Distribution, Intranet Portal—serve as the delivery mechanisms through which events reach their intended recipients. The relationship between an event and a channel is not always direct; instead, it is mediated through a junction table that captures the role each party plays in the dissemination. A participant might act as contributor, owner, reviewer, or observer, and these roles are not static—they are recorded with a since timestamp that marks when the role assignment became effective. For instance, the participant linked to event EVEN-0002 assumed the reviewer role as of 2024-10-02, while the participant associated with EVEN-0007 has been a contributor since 2023-02-27. This temporal dimension is critical for auditability: it allows an organization to reconstruct who was responsible for what, and when, at any point in the past.

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

Cardinality notes further refine these relationships by documenting constraints on how many times a given association can occur. A note such as Cardinality Note 01 or Cardinality Note 04 is attached to a relationship record to indicate whether the link is one-to-one, one-to-many, or many-to-many, and whether certain combinations are permitted or prohibited. In the context of dissemination events, this might mean that a single event can reach multiple audiences (e.g., Partner Integrators, Emergency Responders, Public Sector, External Developers) but that each audience can only be reached through a specific set of channels. The role column in these junction tables—whether contributor, owner, reviewer, or observer—adds a layer of semantic richness that goes beyond simple association. It encodes the governance model: who creates the content, who approves it, who is responsible for its accuracy, and who merely observes its distribution. Together, identifiers, attributes, types, values, roles, cardinality notes, and temporal markers form a coherent framework for tracking not just what data exists, but how it was produced, who is accountable for it, and how it has been shared across the organization.

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