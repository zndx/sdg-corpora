---
chapter_id: ch_live_appointment_scheduling_process_e7dad6
topic_id: 10
family: 08_derived
cited_terms: ['appointment_scheduling_process', 'artifact_described_by_attrkey', 'artifact_either_active_or_archived']
model: engine-refine
---

INTERNATIONAL UNION OF HEALTH INFORMATION MANAGEMENT

CLINICAL OPERATIONS DIVISION COMMISSION ON APPOINTMENT GOVERNANCE*

APPOINTMENT SCHEDULING PROCESS REGISTRY AND ARTIFACT LIFECYCLE MANAGEMENT

PART I. PROCESS DEFINITIONS AND OPERATOR ASSIGNMENTS

(Technical Reference)

Prepared for publication by CLINICAL DATA STANDARDS COMMITTEE

The appointment scheduling process constitutes the foundational workflow construct within the clinical scheduling architecture, each instance identified by a canonical process identifier such as PROC-0001 through PROC-0004 and designated by a descriptive label including Appointment Scheduling Process 01, Appointment Scheduling Process 02, Appointment Scheduling Process 03, and Appointment Scheduling Process 04. These process definitions serve as the authoritative schema against which all scheduling activity is validated, ensuring that every appointment creation, modification, or cancellation adheres to a pre-registered operational template. The process registry is maintained as a discrete entity table wherein the identifier column provides the immutable primary key and the appointment_scheduling_process column carries the human-readable process designation, together forming the basis for all downstream referential integrity constraints.

**t_appointment_scheduling_process**

| id | appointment_scheduling_process |
| --- | --- |
| PROC-0001 | Appointment Scheduling Process 01 |
| PROC-0002 | Appointment Scheduling Process 02 |
| PROC-0003 | Appointment Scheduling Process 03 |
| PROC-0004 | Appointment Scheduling Process 04 |
| PROC-0005 | Appointment Scheduling Process 05 |
| PROC-0006 | Appointment Scheduling Process 06 |

Operator assignment to scheduling processes is mediated through the receptionist agent construct, which represents the human or automated actor responsible for executing a given process instance. The operator registration table establishes a one-to-one correspondence between process identifiers and their designated receptionist agents, with Operator 01 through Operator 04 mapped respectively to processes PROC-0001 through PROC-0004. This direct mapping provides a clear accountability chain, yet the operational reality of multi-actor scheduling environments necessitates a more granular relationship model. The junction table t_appointment_scheduling_process__operator resolves this complexity by decoupling the appointment subject from the operator target, permitting a single appointment to be associated with multiple operators each assigned a distinct role. Within this relationship model, the role attribute assumes values of owner or observer, thereby distinguishing between actors with full modification privileges and those granted read-only visibility. Representative assignments include PROC-0001 paired with PROC-0002 under the owner role, PROC-0006 linked to PROC-0004 as observer, and PROC-0004 associated with PROC-0007 in the observer capacity, collectively demonstrating the flexibility of the role-based access model across heterogeneous process-operator pairings.

**t_appointment_scheduling_process_operator**

| id | operator |
| --- | --- |
| PROC-0001 | Operator 01 |
| PROC-0002 | Operator 02 |
| PROC-0003 | Operator 03 |
| PROC-0004 | Operator 04 |
| PROC-0005 | Operator 05 |
| PROC-0006 | Operator 06 |
| PROC-0007 | Operator 07 |

**t_appointment_scheduling_process__operator**

| id | appointment_id | operator_id | role |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0001 | PROC-0002 | owner |
| PROC-0002 | PROC-0006 | PROC-0004 | owner |
| PROC-0003 | PROC-0004 | PROC-0007 | observer |
| PROC-0004 | PROC-0001 | PROC-0004 | observer |
| PROC-0005 | PROC-0006 | PROC-0001 | contributor |
| PROC-0006 | PROC-0002 | PROC-0001 | reviewer |
| PROC-0007 | PROC-0002 | PROC-0005 | owner |
| PROC-0008 | PROC-0005 | PROC-0002 | reviewer |

The target artifact of each scheduling process is the patient appointment schedule, a structured data object that encapsulates all temporal and resource allocation details for a clinical encounter. The artifact registration table t_appointment_scheduling_process_targets_artifact enumerates the scheduled targets with identifiers Targets Artifact 01 through Targets Artifact 04, each corresponding to a process instance. The relationship between scheduling processes and their target artifacts is governed by a dedicated junction table that introduces two additional dimensions of control: the role attribute and the cardinality note. Role values in this context include owner, reviewer, and observer, extending the operator role taxonomy to encompass artifact-level access control. The cardinality note column, populated with values Cardinality Note 01 through Cardinality Note 04, encodes multiplicity constraints that dictate whether a process may reference a single target artifact, multiple target artifacts, or a bounded set thereof. Notable associations include PROC-0005 linked to PROC-0004 under the owner role, PROC-0001 connected to PROC-0006 as owner, PROC-0004 assigned to PROC-0004 with reviewer status, and PROC-0006 related to PROC-0002 as observer, illustrating the matrix of access permissions that govern artifact interaction.

**t_appointment_scheduling_process_targets_artifact**

| id | targets_artifact |
| --- | --- |
| PROC-0001 | Targets Artifact 01 |
| PROC-0002 | Targets Artifact 02 |
| PROC-0003 | Targets Artifact 03 |
| PROC-0004 | Targets Artifact 04 |
| PROC-0005 | Targets Artifact 05 |
| PROC-0006 | Targets Artifact 06 |

**t_appointment_scheduling_process__targets_artifact**

| id | appointment_id | targets_artifact_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| PROC-0001 | PROC-0005 | PROC-0004 | owner | Cardinality Note 01 |
| PROC-0002 | PROC-0001 | PROC-0006 | owner | Cardinality Note 02 |
| PROC-0003 | PROC-0004 | PROC-0004 | reviewer | Cardinality Note 03 |
| PROC-0004 | PROC-0006 | PROC-0002 | observer | Cardinality Note 04 |
| PROC-0005 | PROC-0001 | PROC-0005 | observer | Cardinality Note 05 |
| PROC-0006 | PROC-0005 | PROC-0002 | reviewer | Cardinality Note 06 |
| PROC-0007 | PROC-0004 | PROC-0003 | owner | Cardinality Note 07 |
| PROC-0008 | PROC-0005 | PROC-0006 | observer | Cardinality Note 08 |

**t_artifact_described_by_attrkey**

| id | artifact | uri | location |
| --- | --- | --- | --- |
| ATTR-0001 | telemetry-stream-88f | hdfs://cluster/staging | us-east-1 |
| ATTR-0002 | lab-report-mutation | s3://lake/curated | us-east-1 |
| ATTR-0003 | manifest-checksum-a1b | hdfs://cluster/staging | zone-b |
| ATTR-0004 | telemetry-stream-88f | gs://warehouse/gold | ap-south-2 |
| ATTR-0005 | provenance-trace-log | s3://lake/curated | ap-south-2 |

Artifact metadata and lifecycle state are managed through a complementary schema that supports both active and archived artifact registries. The artifact description table records the physical or logical location of each artifact, with entries such as telemetry-stream-88f stored at hdfs://cluster/staging in the us-east-1 region, lab-report-mutation persisted at s3://lake/curated within us-east-1, manifest-checksum-a1b located at hdfs://cluster/staging in zone-b, and telemetry-stream-88f replicated to gs://warehouse/gold in ap-south-2. The tripartite artifact registry—comprising artifact, artifact_2, and artifact_3 columns—captures the primary artifact alongside its dependent and derived counterparts, with representative triples including sensor-telemetry-v4 with output-sink-delta and test-dataset, config-repo-main with schema-registry and deployment-target, data-catalog-index with upstream-source-beta and test-dataset, and event-stream-kafka with checksum-validator and compliance-tier. This structure enables the tracking of artifact lineage across transformation pipelines.

**t_artifact_either_active_or_archived**

| id | artifact | artifact_2 | artifact_3 |
| --- | --- | --- | --- |
| ARCH-0001 | sensor-telemetry-v4 | output-sink-delta | test-dataset |
| ARCH-0002 | config-repo-main | schema-registry | deployment-target |
| ARCH-0003 | data-catalog-index | upstream-source-beta | test-dataset |
| ARCH-0004 | event-stream-kafka | checksum-validator | compliance-tier |
| ARCH-0005 | config-repo-main | checksum-validator | production-cluster |
| ARCH-0006 | ml-feature-store | validation-module | test-dataset |
| ARCH-0007 | sensor-telemetry-v4 | validation-module | deployment-target |
| ARCH-0008 | batch-ingest-queue | validation-module | dev-sandbox |

Attribute definitions for artifact metadata are formalized through the attribute type registry, which assigns a semantic type to each attribute name. The attribute type column employs a namespace-qualified type system including xsd:string for textual values, xsd:date for temporal values, and cco:DesignativeICE for clinical concept identifiers, as exemplified by the attributes checksum typed as xsd:string, created_date typed as xsd:date, identifier typed as cco:DesignativeICE, and license typed as xsd:string. Attribute values are stored in a normalized entity-attribute-value pattern across three value tables distinguished by type: date values such as 2024-02-12, 2023-06-04, 2025-05-16, and 2024-07-03; integer values including 356, 2, 77, and 4; and variable-character values encompassing 7b14de08, ref-8842, BSD-3-Clause, and ap-south-2. Each value record references its owning entity through the entity_id foreign key and its attribute definition through the attr_id foreign key, ensuring that all metadata is traceable to both its source artifact and its schema definition.

**t_artifact_either_active_or_archived_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARCH-0001 | checksum | xsd:string |
| ARCH-0002 | created_date | xsd:date |
| ARCH-0003 | identifier | cco:DesignativeICE |
| ARCH-0004 | license | xsd:string |
| ARCH-0005 | mime_type | xsd:string |
| ARCH-0006 | size_bytes | xsd:long |
| ARCH-0007 | uri | xsd:string |
| ARCH-0008 | version | xsd:integer |

**t_artifact_either_active_or_archived_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0002 | 2024-02-12 |
| ARCH-0002 | ARCH-0002 | ARCH-0002 | 2023-06-04 |
| ARCH-0003 | ARCH-0003 | ARCH-0002 | 2025-05-16 |
| ARCH-0004 | ARCH-0004 | ARCH-0002 | 2024-07-03 |
| ARCH-0005 | ARCH-0005 | ARCH-0002 | 2024-07-21 |
| ARCH-0006 | ARCH-0006 | ARCH-0002 | 2024-03-16 |
| ARCH-0007 | ARCH-0007 | ARCH-0002 | 2025-02-16 |
| ARCH-0008 | ARCH-0008 | ARCH-0002 | 2024-07-02 |

**t_artifact_either_active_or_archived_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0006 | 356 |
| ARCH-0002 | ARCH-0001 | ARCH-0008 | 2 |
| ARCH-0003 | ARCH-0002 | ARCH-0006 | 77 |
| ARCH-0004 | ARCH-0002 | ARCH-0008 | 4 |
| ARCH-0005 | ARCH-0003 | ARCH-0006 | 218 |
| ARCH-0006 | ARCH-0003 | ARCH-0008 | 10 |
| ARCH-0007 | ARCH-0004 | ARCH-0006 | 431 |
| ARCH-0008 | ARCH-0004 | ARCH-0008 | 2 |

**t_artifact_either_active_or_archived_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARCH-0001 | ARCH-0001 | ARCH-0001 | 7b14de08 |
| ARCH-0002 | ARCH-0001 | ARCH-0003 | ref-8842 |
| ARCH-0003 | ARCH-0001 | ARCH-0004 | BSD-3-Clause |
| ARCH-0004 | ARCH-0001 | ARCH-0009 | ap-south-2 |
| ARCH-0005 | ARCH-0001 | ARCH-0005 | text/csv |
| ARCH-0006 | ARCH-0001 | ARCH-0010 | Name 06 |
| ARCH-0007 | ARCH-0001 | ARCH-0011 | analytics |
| ARCH-0008 | ARCH-0001 | ARCH-0012 | Tags 08 |