---
chapter_id: ch_live_lineage_observed_by_event_172b4b
topic_id: 120
family: 05_provo_lineage
cited_terms: ['lineage_observed_by_event', 'flood_asset_vulnerability_assessment', 'kernelhook_max_one_program_attached']
model: engine-refine
---

Data lineage in distributed systems requires precise, typed provenance records that capture not only what was processed but how, when, and with what quality characteristics. The lineage event model anchors each processing step with a unique identifier—EVEN-0001 through EVEN-0004 in the observed corpus—and associates it with a descriptive lineage name such as sensor-fusion-pipeline, financial-risk-model, data-lake-ingestion, or quality-control-assay. These identifiers serve as the primary key for a rich attribute system that distinguishes between metadata types through explicit schema declarations: confidence scores are stored as xsd:decimal values (0.142, 0.607), dimensional classifications as xsd:string entries (Dimension Kind 01, Encoding 02), procedural notes as free-form text (pre-release note), and temporal stamps as xsd:dateTime values (2024-07-15T19:59:01, 2023-01-03T08:23:46). The attribute type definitions—attr_name and attr_type columns—establish a formal vocabulary that constrains what can be recorded and how values are validated, ensuring that downstream consumers of lineage data can interpret numeric precision, string semantics, and temporal resolution without ambiguity. This typed attribute architecture separates the schema definition from the value storage, with dedicated value tables for datetime, decimal, and varchar types each linking back to the attribute definition through an attr_id foreign key and to the originating event through an entity_id reference, creating a normalized structure that supports extensibility without schema migration.

**t_lineage_observed_by_event**

| id | lineage |
| --- | --- |
| EVEN-0001 | sensor-fusion-pipeline |
| EVEN-0002 | financial-risk-model |
| EVEN-0003 | data-lake-ingestion |
| EVEN-0004 | quality-control-assay |
| EVEN-0005 | iot-telemetry-ingest |
| EVEN-0006 | financial-risk-model |

**t_lineage_observed_by_event_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVEN-0001 | confidence | xsd:decimal |
| EVEN-0002 | dimension_kind | xsd:string |
| EVEN-0003 | method | xsd:string |
| EVEN-0004 | recorded_at | xsd:dateTime |
| EVEN-0005 | uncertainty | xsd:decimal |
| EVEN-0006 | unit | xsd:string |
| EVEN-0007 | value | xsd:decimal |
| EVEN-0008 | encoding | xsd:string |

**t_lineage_observed_by_event_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0004 | 2024-07-15T19:59:01 |
| EVEN-0002 | EVEN-0002 | EVEN-0004 | 2023-01-03T08:23:46 |
| EVEN-0003 | EVEN-0003 | EVEN-0004 | 2024-06-13T23:29:26 |
| EVEN-0004 | EVEN-0004 | EVEN-0004 | 2023-03-31T12:19:15 |
| EVEN-0005 | EVEN-0005 | EVEN-0004 | 2023-03-05T06:53:09 |
| EVEN-0006 | EVEN-0006 | EVEN-0004 | 2023-03-19T16:32:15 |

**t_lineage_observed_by_event_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0001 | 0.142 |
| EVEN-0002 | EVEN-0001 | EVEN-0005 | 754.57 |
| EVEN-0003 | EVEN-0001 | EVEN-0007 | 852.05 |
| EVEN-0004 | EVEN-0002 | EVEN-0001 | 0.607 |
| EVEN-0005 | EVEN-0002 | EVEN-0005 | 551.25 |
| EVEN-0006 | EVEN-0002 | EVEN-0007 | 531.16 |
| EVEN-0007 | EVEN-0003 | EVEN-0001 | 0.333 |
| EVEN-0008 | EVEN-0003 | EVEN-0005 | 159.50 |

**t_lineage_observed_by_event_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVEN-0001 | EVEN-0001 | EVEN-0002 | Dimension Kind 01 |
| EVEN-0002 | EVEN-0001 | EVEN-0008 | Encoding 02 |
| EVEN-0003 | EVEN-0001 | EVEN-0009 | pre-release note |
| EVEN-0004 | EVEN-0001 | EVEN-0010 | en |
| EVEN-0005 | EVEN-0001 | EVEN-0003 | manual |
| EVEN-0006 | EVEN-0001 | EVEN-0006 | ratio |
| EVEN-0007 | EVEN-0002 | EVEN-0002 | Dimension Kind 07 |
| EVEN-0008 | EVEN-0002 | EVEN-0008 | Encoding 08 |

Flood infrastructure vulnerability assessment operates within a parallel but distinct domain, where the primary entity is the assessment itself—identified by codes such as ASSE-0001 through ASSE-0004—and enriched with multiple layers of contextual metadata. Each assessment record carries a flood_asset_vulnerability_assessment label that situates the evaluation within a specific event or scenario (2022 Pakistan Monsoon, Partial System Failure, Levee Seepage, Bridge Foundation Scour), an assesses_asset_condition field that describes the physical state under evaluation (High Erosion Risk, Critical Structural Failure, Complete Bypass Failure), and an identifies_vulnerability_state field that pinpoints the failure mode or exposure pathway (Water Treatment Inundation, Thames Spring Overflow, Hurricane Ida Surge). The assessment framework further incorporates multilingual support through a language column accepting ISO language codes (de, fr, ja) and a label_text column that stores human-readable annotations (calibration record, nightly summary) in the corresponding language. This structure enables a single vulnerability assessment to be documented, reviewed, and communicated across linguistic boundaries while maintaining a unified identifier and structured condition taxonomy.

**t_flood_asset_vulnerability_assessment**

| id | flood_asset_vulnerability_assessment | assesses_asset_condition | identifies_vulnerability_state | label_text | language |
| --- | --- | --- | --- | --- | --- |
| ASSE-0001 | 2022 Pakistan Monsoon | 2022 Pakistan Monsoon | Water Treatment Inundation | calibration record | de |
| ASSE-0002 | Partial System Failure | High Erosion Risk | Thames Spring Overflow | nightly summary | fr |
| ASSE-0003 | Levee Seepage | Critical Structural Failure | Thames Spring Overflow | nightly summary | fr |
| ASSE-0004 | Bridge Foundation Scour | Complete Bypass Failure | Hurricane Ida Surge | nightly summary | ja |
| ASSE-0005 | Moderate Siltation | Complete Bypass Failure | Elevated Seepage Rate | intake form | es |
| ASSE-0006 | Low Drainage Capacity | Total Inundation | Moderate Siltation | audit excerpt | fr |
| ASSE-0007 | Severe Foundation Compromise | Water Treatment Inundation | Gulf Coast Storm Flood | intake form | es |
| ASSE-0008 | Critical Structural Failure | Critical Structural Failure | Pump Station Submersion | pre-release note | en |

The kernel hook attachment model introduces a third relational pattern centered on system-level instrumentation and security enforcement. Here, the kernelhook table enumerates attachment points—netfilter_hook, kprobe_trace, sys_read, ext4_write—each representing a location in the kernel execution path where external programs can intercept, observe, or modify behavior. The attached_program table catalogs the software modules that bind to these hooks (apparmor_module, bpftrace_script, eBPF_loader, auditd_agent), and the relationship between them is mediated by a junction table that records not only which program attaches to which hook but the role that program assumes in that context (owner, reviewer). The owner role designates the program that owns or primarily manages the hook attachment, while reviewer indicates a secondary program that monitors or audits the attachment without controlling it. This role-based relationship model allows a single kernel hook to support multiple attached programs with distinct responsibilities, and a single program to attach to multiple hooks across different subsystems, creating a many-to-many relationship that is explicitly typed by role rather than left implicit.

**t_kernelhook_max_one_program_attached**

| id | kernelhook |
| --- | --- |
| ATTA-0001 | netfilter_hook |
| ATTA-0002 | kprobe_trace |
| ATTA-0003 | sys_read |
| ATTA-0004 | ext4_write |
| ATTA-0005 | sys_read |
| ATTA-0006 | kprobe_trace |

**t_kernelhook_max_one_program_attached_attached_program**

| id | attached_program |
| --- | --- |
| ATTA-0001 | apparmor_module |
| ATTA-0002 | bpftrace_script |
| ATTA-0003 | eBPF_loader |
| ATTA-0004 | auditd_agent |
| ATTA-0005 | perf_event |
| ATTA-0006 | bpftrace_script |

**t_kernelhook_max_one_program_attached__attached_program**

| id | kernelhook_id | attached_program_id | role |
| --- | --- | --- | --- |
| ATTA-0001 | ATTA-0002 | ATTA-0006 | owner |
| ATTA-0002 | ATTA-0005 | ATTA-0005 | owner |
| ATTA-0003 | ATTA-0003 | ATTA-0003 | reviewer |
| ATTA-0004 | ATTA-0004 | ATTA-0004 | owner |
| ATTA-0005 | ATTA-0005 | ATTA-0003 | reviewer |
| ATTA-0006 | ATTA-0002 | ATTA-0005 | observer |
| ATTA-0007 | ATTA-0003 | ATTA-0006 | reviewer |
| ATTA-0008 | ATTA-0001 | ATTA-0003 | contributor |

Across all three domains—data lineage, flood vulnerability assessment, and kernel hook attachment—the common architectural principle is the separation of entity identity from entity attributes and from inter-entity relationships. The identifier column serves as the stable anchor point across all tables, enabling cross-referencing without semantic drift. Attribute definitions are decoupled from their values, with the attr_name and attr_type columns establishing a schema that governs what can be recorded, while the value tables (val_datetime, val_decimal, val_varchar) store the actual data in type-appropriate formats. Relationships between entities are not implicit in the data but are explicitly modeled through junction tables that carry their own metadata—in the case of kernel hook attachments, the role column adds semantic richness to the relationship that would be lost in a simple foreign-key pair. This pattern of explicit, typed, and role-aware relationships ensures that the data model remains both machine-readable and semantically precise, supporting governance requirements such as auditability, compliance reporting, and cross-domain correlation.