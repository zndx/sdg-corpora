---
chapter_id: ch_live_existential_anchored_to_artifact_via_part_1f9c7d
topic_id: 106
family: 01_foundation
cited_terms: ['existential_anchored_to_artifact_via_part', 'attestation_basic', 'syscall_max_one_return']
model: engine-refine
---

The foundational architecture of any governance framework rests upon the precise identification and classification of entities, where each entity is anchored to a unique identifier that serves as its immutable reference point across distributed systems. An identifier such as PART-0001 or ATTE-0001 functions not merely as a label but as the primary key through which all downstream relationships are resolved, ensuring that every artifact, attestation, or system call can be traced to its authoritative source. These identifiers bind to existential entities—GovernanceRule77, ObservationDrone04, EdgeGateway-12, LabSampleVial-7—that represent the actual objects of governance concern, whether they be software components, physical infrastructure, or compliance procedures. The distinction between the identifier and the entity it references is critical: the identifier is the stable handle used in queries and joins, while the entity carries the semantic meaning that governance policies act upon.

**t_existential_anchored_to_artifact_via_part**

| id | existential | uri | location |
| --- | --- | --- | --- |
| PART-0001 | GovernanceRule77 | hdfs://cluster/staging | rack-7 |
| PART-0002 | ObservationDrone04 | abfss://prod/silver | eu-west-3 |
| PART-0003 | EdgeGateway-12 | abfss://prod/silver | on-prem-dc1 |
| PART-0004 | LabSampleVial-7 | s3://lake/raw | rack-7 |
| PART-0005 | ObservationDrone04 | abfss://prod/silver | zone-b |
| PART-0006 | ProvenanceLedger2 | s3://lake/raw | on-prem-dc1 |

**t_attestation_basic**

| id | attestation |
| --- | --- |
| ATTE-0001 | Vendor risk assessment |
| ATTE-0002 | HIPAA compliance review |
| ATTE-0003 | ML model fairness audit |
| ATTE-0004 | HIPAA compliance review |
| ATTE-0005 | SOC 2 Type II audit |
| ATTE-0006 | Vendor risk assessment |

**t_syscall_max_one_return**

| id | syscall |
| --- | --- |
| RETU-0001 | socket |
| RETU-0002 | write |
| RETU-0003 | read |
| RETU-0004 | fstat |
| RETU-0005 | execve |
| RETU-0006 | execve |
| RETU-0007 | read |
| RETU-0008 | execve |

Attributes and their associated types provide the dimensional structure through which entities are characterized and measured. An attribute such as duration_seconds, end_time, exit_code, or host_name defines a specific property of an entity, while its type—xsd:decimal, xsd:dateTime, xsd:integer, or xsd:string—constrains the domain of permissible values and determines how comparisons, aggregations, and validations are performed. This separation of attribute definition from attribute value is deliberate: the schema-level declaration of what properties exist and how they are typed remains constant, while the actual values—7132.97 for a duration, 2024-11-18T12:26:52 for an end time, 898 for an exit code, ingest-21 for a host name—are instantiated per entity and can evolve independently. The type system enforces data integrity at the point of ingestion, ensuring that a decimal duration cannot be conflated with a string classification, and that temporal comparisons operate on properly formatted datetime values rather than opaque text.

The provenance and physical placement of entities are captured through URIs and locations, which establish the spatial and logical context necessary for auditability and incident response. A URI such as hdfs://cluster/staging, abfss://prod/silver, or s3://lake/raw identifies the data lake layer or storage system where an artifact resides, while a location like rack-7, eu-west-3, or on-prem-dc1 specifies the physical or geographic deployment zone. These fields are not decorative metadata; they are operational necessities that determine data residency compliance, inform disaster recovery procedures, and enable precise scoping of security investigations. When an artifact identified as PART-0001 is observed at rack-7 with its data stored in abfss://prod/silver, the combination of location and URI creates a reproducible chain of custody that can be verified against infrastructure inventories and access logs.

Attestations serve as the formal declarations of compliance or assessment status, with each attestation—Vendor risk assessment, HIPAA compliance review, ML model fairness audit—representing a discrete governance action that has been performed or is in progress. The lifecycle of an attestation is tracked through its attribute values, which record temporal boundaries (2023-12-15T15:31:35, 2023-03-05T20:41:52), operational outcomes (exit codes of 71 or 180), and state transitions (initiation, superseded). The varchar values capture categorical states and identifiers that cannot be expressed through numeric or temporal types, while the decimal and integer values quantify measurable aspects of the attestation process. This multi-typed attribute model allows a single attestation entity to carry heterogeneous evidence: a duration of 6429.54 seconds alongside a log level designation of Log Level 02, both contributing to the overall assessment of whether the attestation was completed satisfactorily.

**t_attestation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2024-11-18T12:26:52 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2023-12-15T15:31:35 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2023-03-05T20:41:52 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2023-09-08T13:00:56 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-07-29T18:29:50 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2024-08-01T11:14:05 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2023-01-08T06:41:42 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2025-06-10T02:28:19 |

**t_attestation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 7132.97 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 6429.54 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 3894.03 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 6507.32 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5722.64 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 4627.41 |

**t_attestation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 898 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 487 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 71 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 180 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 107 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 326 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 620 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 392 |

**t_attestation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | ingest-21 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | initiation |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | gw-12 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | execution |

**t_syscall_max_one_return_return_type**

| id | return_type |
| --- | --- |
| RETU-0001 | process_id |
| RETU-0002 | error_code |
| RETU-0003 | pointer_addr |
| RETU-0004 | memory_size |
| RETU-0005 | pointer_addr |
| RETU-0006 | stat_struct |
| RETU-0007 | process_id |

The relationship model that connects subjects to targets through roles completes the governance graph by specifying not just what entities exist and how they are characterized, but how they interact and what responsibilities they bear. In the system call return type mapping, a subject such as RETU-0001 (the socket system call) is linked to a target such as RETU-0007 (the process_id return type) through a role—observer, contributor, owner, or reviewer—that defines the nature of the relationship. This triadic structure (subject, target, role) is more expressive than a simple binary association because it captures the semantic directionality of interactions: a system call may observe a return value, contribute to a process state, own a resource handle, or be reviewed as part of an audit trail. The same pattern applies across the broader governance domain, where entities are not merely catalogued but positioned within a network of obligations, authorities, and dependencies that can be queried, enforced, and reported upon.

**t_syscall_max_one_return__return_type**

| id | syscall_id | return_type_id | role |
| --- | --- | --- | --- |
| RETU-0001 | RETU-0005 | RETU-0003 | observer |
| RETU-0002 | RETU-0001 | RETU-0007 | contributor |
| RETU-0003 | RETU-0004 | RETU-0004 | owner |
| RETU-0004 | RETU-0008 | RETU-0006 | reviewer |
| RETU-0005 | RETU-0006 | RETU-0007 | owner |
| RETU-0006 | RETU-0006 | RETU-0007 | owner |
| RETU-0007 | RETU-0007 | RETU-0002 | contributor |
| RETU-0008 | RETU-0003 | RETU-0005 | reviewer |