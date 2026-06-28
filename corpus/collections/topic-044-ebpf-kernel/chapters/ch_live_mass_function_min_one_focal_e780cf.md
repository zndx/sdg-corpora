---
chapter_id: ch_live_mass_function_min_one_focal_e780cf
topic_id: 44
family: 06_belief_structure
cited_terms: ['mass_function_min_one_focal', 'ebpfmap_used_by_program', 'ebpfprogram_writes_to_map']
model: engine-refine
---

In governed observability and metadata systems, stable identifiers anchor every auditable fact to a durable referent that survives schema drift, personnel turnover, and toolchain replacement. An identifier such as FOCA-0001 is not merely a surrogate key; it is the contractual handle by which lineage, calibration state, and downstream analytics reconcile the same logical object across ingestion, validation, and retention. Entity, in this sense, denotes the governed unit those identifiers name—the focal mass-function record, the eBPF program instance, or the kernel map artifact—while foreign-key references (entity_id paired with attr_id) express membership in a typed attribute graph rather than denormalized wide tables. When FOCA-0001 carries decimal measurements under attr_id FOCA-0001 and FOCA-0005 while FOCA-0002 receives a distinct confidence reading under the same attribute definition, the pattern demonstrates why entity and identifier must be distinguished: one names the row’s authority, the other names what is being described, and conflating them breaks join integrity under schema extension.

**t_mass_function_min_one_focal**

| id | mass | focal_element |
| --- | --- | --- |
| FOCA-0001 | audit_trail_eta | calibration_status |
| FOCA-0002 | audit_trail_eta | calibration_status |
| FOCA-0003 | provenance_record_epsilon | user_agent |
| FOCA-0004 | sensor_array_gamma | data_quality_flag |
| FOCA-0005 | governance_log_delta | network_latency |
| FOCA-0006 | provenance_record_epsilon | location_geo |

**t_mass_function_min_one_focal_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FOCA-0001 | confidence | xsd:decimal |
| FOCA-0002 | dimension_kind | xsd:string |
| FOCA-0003 | method | xsd:string |
| FOCA-0004 | recorded_at | xsd:dateTime |
| FOCA-0005 | uncertainty | xsd:decimal |
| FOCA-0006 | unit | xsd:string |
| FOCA-0007 | value | xsd:decimal |
| FOCA-0008 | encoding | xsd:string |

**t_mass_function_min_one_focal_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0001 | 0.223 |
| FOCA-0002 | FOCA-0001 | FOCA-0005 | 391.04 |
| FOCA-0003 | FOCA-0001 | FOCA-0007 | 110.73 |
| FOCA-0004 | FOCA-0002 | FOCA-0001 | 0.161 |
| FOCA-0005 | FOCA-0002 | FOCA-0005 | 309.80 |
| FOCA-0006 | FOCA-0002 | FOCA-0007 | 695.08 |
| FOCA-0007 | FOCA-0003 | FOCA-0001 | 0.178 |
| FOCA-0008 | FOCA-0003 | FOCA-0005 | 14.20 |

Attributes and attribute types constitute the semantic contract that separates permissible metadata from arbitrary key–value sprawl. An attr such as confidence, dimension_kind, method, or recorded_at declares the meaning of a slot; attr_type—here expressed as XSD-aligned literals including xsd:decimal, xsd:string, and xsd:dateTime—declares the validation surface, storage partition, and interchange behavior that consumers may assume. Governance therefore routes values into type-homogeneous stores: decimals land where 0.223 and 391.04 can be range-checked, datetimes where 2023-06-19T06:37:58 and 2024-04-19T20:46:34 support temporal ordering, and strings where lexical constraints apply to entries such as Dimension Kind 01 or calibration record. The attr_type is not decorative typing; it is the enforcement boundary that prevents a program from coercing a timestamp into a numeric aggregate or treating a categorical label as a measured quantity. Where every datetime-valued row for recorded_at references attr_id FOCA-0004 across entities FOCA-0001 through FOCA-0004, the model shows attribute identity as global and entity binding as local—a design that scales attribute dictionaries without duplicating type metadata per instance.

The misc designation marks fields that carry domain payload or human-readable annotation without warranting a dedicated typed relation at the present normalization tier. In dimension tables, misc commonly holds labels—Used By Program Label 02, Writes To Map Label 04—that operational staff recognize in dashboards and change tickets; in value relations, the same column holds the instantiated fact (Encoding 02, es) once attr and attr_type have fixed interpretation. Category complements misc by supplying the coarse taxonomy that groups otherwise heterogeneous misc strings into comparable cohorts: Used By Program Category 03 and Writes To Map Category 01 partition the program and map populations for policy application, chargeback, and risk tiering without encoding classification logic into free text. Category is deliberately orthogonal to identifier: MAP-0003 may appear under multiple governance narratives, but its category assignment determines which retention rule, access control template, or capacity review cadence applies. Together, misc and category implement the handbook’s recurring tension between expressive surface labels and enforceable class membership.

**dim_used_by_program**

| id | used_by_program_label | used_by_program_category |
| --- | --- | --- |
| PROG-0001 | Used By Program Label 01 | Used By Program Category 01 |
| PROG-0002 | Used By Program Label 02 | Used By Program Category 02 |
| PROG-0003 | Used By Program Label 03 | Used By Program Category 03 |
| PROG-0004 | Used By Program Label 04 | Used By Program Category 04 |
| PROG-0005 | Used By Program Label 05 | Used By Program Category 05 |
| PROG-0006 | Used By Program Label 06 | Used By Program Category 06 |

**dim_writes_to_map**

| id | writes_to_map_label | writes_to_map_category |
| --- | --- | --- |
| MAP-0001 | Writes To Map Label 01 | Writes To Map Category 01 |
| MAP-0002 | Writes To Map Label 02 | Writes To Map Category 02 |
| MAP-0003 | Writes To Map Label 03 | Writes To Map Category 03 |
| MAP-0004 | Writes To Map Label 04 | Writes To Map Category 04 |
| MAP-0005 | Writes To Map Label 05 | Writes To Map Category 05 |
| MAP-0006 | Writes To Map Label 06 | Writes To Map Category 06 |
| MAP-0007 | Writes To Map Label 07 | Writes To Map Category 07 |

Kernel-side eBPF artifacts introduce a parallel fact layer in which programs and maps are first-class entities linked by consumption and production roles rather than by attribute graphs alone. used_by_program expresses which executable context depends on a map’s contents—fact_ebpfmap rows tie map identifiers to program keys such as PROG-0005 and PROG-0004—while writes_to_map inverts the dependency for writers: a program row references the map it mutates, as when MAP-0003 and MAP-0001 appear as write targets across MAP-0001 through MAP-0004. These directed relationships matter for blast-radius analysis: a policy change on a map consumed by multiple programs propagates along used_by_program edges, whereas a defective writer is isolated by tracing writes_to_map back to the offending program key. Dimension tables supply the misc labels and category bands that make those keys legible to auditors who do not read hexadecimal map names in bpftool output.

size_bytes and version close the loop between semantic governance and operational fitness. size_bytes quantifies resident footprint—here spanning roughly 31 MB through roughly 785 MB across map and program facts—so capacity planning, cgroup budgeting, and anomaly detection can treat sudden inflation as a first-class signal distinct from logical schema change. version, recorded in parallel on maps and programs (for example map version 6 versus 12, program version 9 versus 12), captures generational compatibility: loaders, CO-RE relocations, and map layout contracts must agree on version or silent corruption and probe attach failures follow. Pairing version with identifier allows staged rollout: PROG-0002 may remain on version 5 while PROG-0004 advances to version 6, provided fact tables document which map instances each generation expects. In practice, compliance reviewers treat mismatched version and size_bytes trajectories—stable version with climbing bytes, or version bump without expected layout delta—as evidence gaps warranting instrumentation verification rather than spreadsheet attestation alone.

Read end to end, the domain model binds focal mass-function entities (audit_trail_eta paired with calibration_status, provenance_record_epsilon with user_agent, sensor_array_gamma with data_quality_flag) to a typed attribute plane on one side and to eBPF program–map economics on the other. Identifiers stabilize reference; entities carry identity; attr and attr_type define what may be said and how it may be stored; misc and category translate storage into operable language; used_by_program and writes_to_map orient runtime dependencies; size_bytes and version quantify whether the deployed system still matches the governed description. Evidence such as four focal keys, four XSD-typed attributes, parallel typed value stores, and eight fact-dimension pairings across program and map roles is representative of production posture: heterogeneous semantics, homogeneous enforcement, and dependency edges explicit enough for audit without collapsing into a single undifferentiated configuration dump.

**t_mass_function_min_one_focal_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0004 | 2023-06-19T06:37:58 |
| FOCA-0002 | FOCA-0002 | FOCA-0004 | 2023-01-26T15:54:26 |
| FOCA-0003 | FOCA-0003 | FOCA-0004 | 2024-04-19T20:46:34 |
| FOCA-0004 | FOCA-0004 | FOCA-0004 | 2023-08-08T03:21:21 |
| FOCA-0005 | FOCA-0005 | FOCA-0004 | 2023-12-10T16:04:01 |
| FOCA-0006 | FOCA-0006 | FOCA-0004 | 2024-10-11T01:06:45 |

**t_mass_function_min_one_focal_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FOCA-0001 | FOCA-0001 | FOCA-0002 | Dimension Kind 01 |
| FOCA-0002 | FOCA-0001 | FOCA-0008 | Encoding 02 |
| FOCA-0003 | FOCA-0001 | FOCA-0009 | calibration record |
| FOCA-0004 | FOCA-0001 | FOCA-0010 | es |
| FOCA-0005 | FOCA-0001 | FOCA-0003 | hybrid |
| FOCA-0006 | FOCA-0001 | FOCA-0006 | ratio |
| FOCA-0007 | FOCA-0002 | FOCA-0002 | Dimension Kind 07 |
| FOCA-0008 | FOCA-0002 | FOCA-0008 | Encoding 08 |

**fact_ebpfmap**

| id | used_by_program_key | size_bytes | version |
| --- | --- | --- | --- |
| PROG-0001 | PROG-0005 | 208979093 | 3 |
| PROG-0002 | PROG-0004 | 156714508 | 6 |
| PROG-0003 | PROG-0005 | 31105012 | 12 |
| PROG-0004 | PROG-0002 | 354373995 | 5 |
| PROG-0005 | PROG-0004 | 866267293 | 2 |

**fact_ebpfprogram**

| id | writes_to_map_key | size_bytes | version |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0003 | 784335640 | 12 |
| MAP-0002 | MAP-0005 | 641704069 | 9 |
| MAP-0003 | MAP-0003 | 113209263 | 11 |
| MAP-0004 | MAP-0001 | 161013093 | 12 |
| MAP-0005 | MAP-0002 | 352203820 | 12 |
| MAP-0006 | MAP-0006 | 167519051 | 1 |