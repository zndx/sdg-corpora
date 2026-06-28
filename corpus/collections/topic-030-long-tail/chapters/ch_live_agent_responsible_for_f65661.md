---
chapter_id: ch_live_agent_responsible_for_f65661
topic_id: 30
family: 05_provo_lineage
cited_terms: ['agent_responsible_for', 'kernelhook_in_kernel_module', 'lineage_edge_max_one_target']
model: engine-refine
---

Identifiers function as the immutable addressing layer of any governed system, providing the structural pivots that bind disparate components into a verifiable topology. Rather than serving as mere labels, unique codes such as `RESP-0001`, `MODU-0001`, and `TARG-0003` operate as primary keys that anchor relational integrity across distributed architectures. They enable precise cross-referencing between runtime agents, compiled kernel modules, and downstream data targets, ensuring that every dependency can be traced, queried, and audited without ambiguity. When a system scales across microservices, hardware abstraction layers, and multi-tenant pipelines, the identifier becomes the single source of truth that prevents orphaned references, duplicate entitlements, and untracked state mutations.

**t_agent_responsible_for**

| id | agent |
| --- | --- |
| RESP-0001 | KafkaSource |
| RESP-0002 | LabSpectrometer |
| RESP-0003 | AuditDaemon |
| RESP-0004 | ComplianceOfficer |
| RESP-0005 | MetadataIndexer |
| RESP-0006 | MetadataIndexer |
| RESP-0007 | SampleHandler |
| RESP-0008 | PipelineOrchestrator |

**t_agent_responsible_for_responsible_for**

| id | responsible_for |
| --- | --- |
| RESP-0001 | CustomerTransactions |
| RESP-0002 | LabSamples |
| RESP-0003 | PipelineMetrics |
| RESP-0004 | AuditTrail |
| RESP-0005 | ResearchDataset |
| RESP-0006 | PipelineMetrics |

Licenses and locations establish the legal and operational perimeters within which those identifiers operate. A software component’s license—whether `GPL-3.0`, `CC-BY-4.0`, or `MIT`—dictates redistribution rights, modification constraints, and liability boundaries, while its geographic or logical location—such as `us-east-1`, `eu-west-3`, `ap-south-2`, or `zone-b`—enforces data sovereignty, latency thresholds, and regulatory jurisdiction. These attributes are not optional metadata; they are binding compliance markers that must be explicitly recorded alongside technical identifiers. For instance, a kernel hook like `PsSetCreateProcessNotify_Monitor` embedded in `ntoskrnl.exe` under a `GPL-3.0` license carries fundamentally different audit obligations than a driver stub in `hal.dll` distributed under `MIT`, even when both execute within the same virtualized environment.

**t_kernelhook_in_kernel_module**

| id | kernelhook | in_kernel_module | license | location |
| --- | --- | --- | --- | --- |
| MODU-0001 | PsSetCreateProcessNotify_Monitor | ntoskrnl.exe | CC-BY-4.0 | zone-b |
| MODU-0002 | PsSetCreateProcessNotify_Monitor | kdcom.sys | GPL-3.0 | us-east-1 |
| MODU-0003 | nvlddmkm.sys | IDT_KiDispatch_Stub | MIT | eu-west-3 |
| MODU-0004 | storport.sys | hal.dll | MIT | ap-south-2 |
| MODU-0005 | iaStorAC.sys | iaStorAC.sys | proprietary | zone-b |
| MODU-0006 | ntoskrnl.exe | storport.sys | CC-BY-4.0 | eu-west-3 |
| MODU-0007 | nvlddmkm.sys | Inline_NtQuerySystem | CC-BY-4.0 | eu-west-3 |
| MODU-0008 | dxgkrnl.sys | SSDT_Dispatch_Rewrite | MPL-2.0 | zone-b |

Roles, subjects, and targets define the dynamic relationships that govern accountability. A subject—whether an autonomous process like `KafkaSource`, a monitoring daemon such as `AuditDaemon`, or a human operator designated as `ComplianceOfficer`—assumes a specific role relative to a target, which may be a data stream, a compliance artifact, or a computational model. The relational model captures this triad by linking subject and target through a role attribute, transforming static dependencies into actionable governance policies. An `owner` relationship implies full lifecycle responsibility and modification rights, a `reviewer` role enforces validation gates and approval workflows, and an `observer` designation restricts access to read-only telemetry. Consequently, a `LabSpectrometer` acting as an `owner` of `LabSamples` operates under different liability and access controls than a `ComplianceOfficer` serving as an `observer` on an `AuditTrail`.

Lineage chains operationalize these relationships across time and processing stages, mapping how subjects contribute to or consume targets through defined workflows. A `Sensor calibration chain` or a `Feature store refresh` pipeline does not merely move data; it propagates accountability. Each edge in the lineage graph carries a role that clarifies whether the originating subject is a `contributor` feeding raw inputs, an `owner` governing the transformation logic, or a `reviewer` certifying output integrity. When a `Risk scoring model` or a `Compliance audit log` is generated, the system can reconstruct the exact sequence of identifiers, verify the licensing compliance of every intermediate module, and confirm that the designated role holders have satisfied their contractual or regulatory obligations.

**t_agent_responsible_for__responsible_for**

| id | agent_id | responsible_for_id | role |
| --- | --- | --- | --- |
| RESP-0001 | RESP-0004 | RESP-0004 | owner |
| RESP-0002 | RESP-0008 | RESP-0003 | reviewer |
| RESP-0003 | RESP-0007 | RESP-0004 | reviewer |
| RESP-0004 | RESP-0007 | RESP-0006 | observer |
| RESP-0005 | RESP-0007 | RESP-0003 | owner |
| RESP-0006 | RESP-0005 | RESP-0003 | reviewer |
| RESP-0007 | RESP-0007 | RESP-0004 | observer |
| RESP-0008 | RESP-0007 | RESP-0004 | observer |

**t_lineage_edge_max_one_target**

| id | lineage |
| --- | --- |
| TARG-0001 | Sensor calibration chain |
| TARG-0002 | Sensor calibration chain |
| TARG-0003 | Feature store refresh |
| TARG-0004 | Sensor calibration chain |
| TARG-0005 | Feature store refresh |
| TARG-0006 | Model training pipeline |

**t_lineage_edge_max_one_target_to_target**

| id | to_target |
| --- | --- |
| TARG-0001 | Compliance audit log |
| TARG-0002 | Risk scoring model |
| TARG-0003 | Feature vector store |
| TARG-0004 | Executive dashboard |
| TARG-0005 | Executive summary report |
| TARG-0006 | Data lake staging area |
| TARG-0007 | Executive summary report |
| TARG-0008 | ML inference endpoint |

**t_lineage_edge_max_one_target__to_target**

| id | lineage_id | to_target_id | role |
| --- | --- | --- | --- |
| TARG-0001 | TARG-0006 | TARG-0001 | contributor |
| TARG-0002 | TARG-0001 | TARG-0003 | owner |
| TARG-0003 | TARG-0003 | TARG-0005 | owner |
| TARG-0004 | TARG-0003 | TARG-0006 | contributor |
| TARG-0005 | TARG-0002 | TARG-0008 | owner |
| TARG-0006 | TARG-0006 | TARG-0004 | contributor |
| TARG-0007 | TARG-0006 | TARG-0006 | observer |
| TARG-0008 | TARG-0002 | TARG-0008 | reviewer |

In practice, this six-concept framework—identifier, license, location, role, subject, and target—forms the backbone of machine-readable governance. Auditors and automated compliance engines rely on this structured metadata to validate that every deployed component operates within its authorized license, resides in a permitted jurisdiction, and maintains a documented subject-target relationship with a clearly assigned role. By encoding accountability into the relational schema itself, organizations eliminate reliance on tribal knowledge or fragmented documentation, ensuring that provenance, permissions, and policy enforcement remain consistent, auditable, and enforceable across complex, evolving infrastructure.