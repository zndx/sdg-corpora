---
chapter_id: ch_live_artifact_with_universal_9382cc
topic_id: 44
family: 01_foundation
cited_terms: ['artifact_with_universal', 'ebpfprogram_governed_by_security_policy', 'artifact_either_active_or_archived']
model: engine-refine
---

The governance of software artifacts and their associated enforcement mechanisms relies on a structured attribution model that distinguishes between identifying metadata, categorical classification, and measured properties. Each artifact carries a unique identifier—UNIV-0001 through UNIV-0004 in the primary artifact registry—that anchors its lineage across the infrastructure. These identifiers are paired with descriptive labels such as Audit_Reporter, Feature_Vector_Store, and Container_Image_Release, each of which is associated with a related component like GPU_Compute_Pool or Compliance_Audit_Log, establishing a dependency graph that traces how artifacts interact within the deployment topology. The location field records the operational region of each artifact, with us-east-1 appearing as the predominant deployment zone and on-prem-dc1 marking a localized data center installation, thereby enabling geographic compliance checks and data residency enforcement.

**t_artifact_with_universal**

| id | artifact | related | created_date | location |
| --- | --- | --- | --- | --- |
| UNIV-0001 | Audit_Reporter | GPU_Compute_Pool | 2024-12-09 | us-east-1 |
| UNIV-0002 | Feature_Vector_Store | Metadata_Registry | 2024-11-04 | us-east-1 |
| UNIV-0003 | Schema_Definition | GPU_Compute_Pool | 2024-10-11 | on-prem-dc1 |
| UNIV-0004 | Container_Image_Release | Compliance_Audit_Log | 2024-10-15 | us-east-1 |
| UNIV-0005 | Data_Pipeline_Export | Metadata_Registry | 2023-07-24 | eu-west-3 |
| UNIV-0006 | Feature_Vector_Store | Metrics_Stream_Prometheus | 2025-04-25 | ap-south-2 |
| UNIV-0007 | Workflow_Scheduler | GPU_Compute_Pool | 2023-11-17 | on-prem-dc1 |

The temporal dimension of artifact governance is captured through the created_date attribute, which records the point at which each artifact was introduced into the system—2024-12-09 for the Audit_Reporter, 2024-11-04 for the Feature_Vector_Store, and earlier dates of 2024-10-11 and 2024-10-15 for the Schema_Definition and Container_Image_Release respectively. These timestamps serve as the basis for retention policies, audit windows, and version lifecycle management. The attribute system extends beyond this single temporal field through a flexible schema that defines attribute names and their corresponding types: checksum and license are stored as xsd:string values, created_date as xsd:date, and identifier as cco:DesignativeICE, a custom designative type that enforces referential integrity across artifact relationships. This type-level discipline ensures that attribute values conform to their declared schemas before being persisted.

Enforcement of system policy is mediated through eBPF programs, which are tracked as a distinct class of artifacts with their own dimensional and factual attributes. The eBPF program dimension table assigns each program a misc label—Ebpfprogram Label 01 through Ebpfprogram Label 04—and a category classification—Ebpfprogram Category 01 through Ebpfprogram Category 04—that groups programs by function or policy domain. The corresponding fact table records the binary size of each program in bytes, ranging from 113,209,263 bytes for POLI-0003 to 784,335,640 bytes for POLI-0001, alongside a version number that increments across the program lifecycle, with versions 9, 11, and 12 observed across the four entries. The ebpfprogram_key column links fact records to their dimensional counterparts, enabling aggregation of size and version metrics by category for capacity planning and compliance auditing.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | 784335640 | 12 |
| POLI-0002 | POLI-0003 | 641704069 | 9 |
| POLI-0003 | POLI-0003 | 113209263 | 11 |
| POLI-0004 | POLI-0005 | 161013093 | 12 |
| POLI-0005 | POLI-0004 | 352203820 | 12 |
| POLI-0006 | POLI-0003 | 167519051 | 1 |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| POLI-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| POLI-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| POLI-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| POLI-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| POLI-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| POLI-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| POLI-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| POLI-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

The artifact lifecycle is further decomposed into an active-or-archived state model that separates the structural identity of an artifact from its mutable attribute values. The state table records the artifact's current designation—sensor-telemetry-v4, config-repo-main, data-catalog-index, event-stream-kafka—alongside two associated artifacts that represent downstream outputs or upstream dependencies, such as output-sink-delta and schema-registry. Attribute values are stored in a normalized, type-dispatched format across three value tables: date values like 2024-02-12 and 2023-06-04 are persisted in the date table, integer values such as 356 and 77 in the integer table, and string values including the checksum 7b14de08, the reference ref-8842, and the license BSD-3-Clause in the varchar table. Each value record is linked to its entity through the entity_id foreign key and to its attribute definition through the attr_id foreign key, creating a star schema where the entity table serves as the central fact and the attribute definitions and value tables form the surrounding dimensions. This separation of attribute schema from attribute values permits schema evolution without migration, as new attribute types can be registered in the attribute definition table and their values stored in the appropriate typed value table without altering the underlying entity structure.

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