---
chapter_id: ch_live_entity_type_belongs_to_729787
topic_id: 65
family: 07_long_tail
cited_terms: ['entity_type_belongs_to', 'syscall_only_in_kernel_subsystem', 'vehicle_equipment_specification']
model: engine-refine
---

Entity governance begins with the stable naming of things that must be auditable across policy, infrastructure, and operational domains. An entity is not merely a label but a durable referent whose identity persists while its class membership, attributes, and relationships evolve; identifiers such as BELO-0001 and SPEC-0003 exist precisely so that distinct records—edge_gateway_12 typed as an IoT Edge Device, sensor_node_47 appearing under both Message Broker Topic and Data Quality Rule classifications—can be cited unambiguously in controls, lineage reports, and exception workflows without conflating homonymous instances. The identifier therefore anchors traceability: when a decimal confidence of 0.703 is asserted against BELO-0001, or when recorded_at resolves to 2025-04-30T12:57:36 for the same membership row, downstream reviewers can reconstruct which governed object carried which evidentiary payload at which moment, rather than inferring identity from free-text names that may recur across environments.

**t_entity_type_belongs_to**

| id | entity | entity_type_belongs_to |
| --- | --- | --- |
| BELO-0001 | edge_gateway_12 | IoT Edge Device |
| BELO-0002 | sensor_node_47 | Message Broker Topic |
| BELO-0003 | governance_policy_fin | Cloud Storage Bucket |
| BELO-0004 | sensor_node_47 | Data Quality Rule |
| BELO-0005 | edge_gateway_12 | Network Telemetry |
| BELO-0006 | edge_gateway_12 | Data Quality Rule |
| BELO-0007 | ml_feature_store_prod | Message Broker Topic |

**t_entity_type_belongs_to_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BELO-0001 | confidence | xsd:decimal |
| BELO-0002 | dimension_kind | xsd:string |
| BELO-0003 | method | xsd:string |
| BELO-0004 | recorded_at | xsd:dateTime |
| BELO-0005 | uncertainty | xsd:decimal |
| BELO-0006 | unit | xsd:string |
| BELO-0007 | value | xsd:decimal |
| BELO-0008 | encoding | xsd:string |

**t_entity_type_belongs_to_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0001 | 0.703 |
| BELO-0002 | BELO-0001 | BELO-0005 | 525.54 |
| BELO-0003 | BELO-0001 | BELO-0007 | 691.11 |
| BELO-0004 | BELO-0002 | BELO-0001 | 0.351 |
| BELO-0005 | BELO-0002 | BELO-0005 | 906.27 |
| BELO-0006 | BELO-0002 | BELO-0007 | 385.85 |
| BELO-0007 | BELO-0003 | BELO-0001 | 0.357 |
| BELO-0008 | BELO-0003 | BELO-0005 | 529.91 |

Attributes extend identity into measurable or declarative fact. Each attr declares what is being said—confidence, dimension_kind, method, recorded_at—while attr_type constrains how the assertion may be interpreted and validated, binding confidence to xsd:decimal, categorical descriptors to xsd:string, and temporal stamps to xsd:dateTime so that type-incorrect values are rejected before they enter compliance artifacts. In practice, attr functions as the contract between schema and evidence: a governance analyst knows that 525.54 and 691.11 are numeric quantities comparable under common rules, that Encoding 02 and nightly summary are lexical encodings requiring dictionary alignment, and that es denotes a language or locale token rather than a scalar measurement. The misc field, though generically named, carries the instantiated value itself—the concrete datum that satisfies the attr under its declared type—and thus forms the evidential substrate on which pass/fail determinations, threshold checks, and cross-entity reconciliation ultimately depend.

**t_entity_type_belongs_to_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0004 | 2025-04-30T12:57:36 |
| BELO-0002 | BELO-0002 | BELO-0004 | 2023-11-10T02:05:22 |
| BELO-0003 | BELO-0003 | BELO-0004 | 2023-12-19T19:26:36 |
| BELO-0004 | BELO-0004 | BELO-0004 | 2023-01-25T21:39:36 |
| BELO-0005 | BELO-0005 | BELO-0004 | 2023-12-09T03:03:32 |
| BELO-0006 | BELO-0006 | BELO-0004 | 2023-09-18T08:14:48 |
| BELO-0007 | BELO-0007 | BELO-0004 | 2024-05-10T13:50:46 |

Temporal and procedural provenance receive comparable treatment through issueddate and analogous datetime attributes. Kernel-subsystem mappings record when a syscall classification entered force—read associated with namespaces on 2024-01-17, execve with vDSO on 2024-04-20—so that retrospective audits can determine which rule revision governed a deployment window. That issueddate is distinct from recorded_at on membership attributes: the former marks policy issuance or catalog publication, the latter marks observation or capture within an entity’s lifecycle. Together they prevent a common governance failure in which operational telemetry is mistaken for authoritative effective dating, or in which a superseded control appears current because its observation timestamp postdates an earlier but still-binding issuance record.

Vehicle equipment governance illustrates how entities participate in directed relationships whose semantics are not exhausted by typing alone. A motorvehicleclass—Tesla Model Y, Daf XF105, Toyota Hilux, Light Utility Vehicle—scopes which equipment specifications apply, while vehiclecomponent entries such as Auxiliary Power Unit, Adaptive Cruise Control, and Electronic Stability Control name mandated or referenced physical or functional elements. Specifications including CAT 320 Excavator, Emergency Response, and Scania R500 therefore mediate between abstract class and concrete component requirements, enabling auditors to ask not only whether a class is in scope but which components a given specification obligates. Syscall-to-subsystem rows (openat within fsnotify, write within inotify, code E-21) show the same pattern in a different domain: governed artifacts are linked to the subsystem context that interprets them, with issueddate and code supplying revision and catalog coordinates for change control.

**t_vehicle_equipment_specification**

| id | vehicle_equipment_specification |
| --- | --- |
| SPEC-0001 | CAT 320 Excavator |
| SPEC-0002 | Emergency Response |
| SPEC-0003 | Scania R500 |
| SPEC-0004 | Medium Duty |
| SPEC-0005 | Volvo FH16 |
| SPEC-0006 | Mercedes Sprinter |

**t_vehicle_equipment_specification_applies_to_vehicle_class**

| id | applies_to_vehicle_class |
| --- | --- |
| SPEC-0001 | Tesla Model Y |
| SPEC-0002 | Daf XF105 |
| SPEC-0003 | Toyota Hilux |
| SPEC-0004 | Light Utility Vehicle |
| SPEC-0005 | Ford F-150 |
| SPEC-0006 | Hybrid Electric |

**t_vehicle_equipment_specification_mandates_component**

| id | mandates_component |
| --- | --- |
| SPEC-0001 | Auxiliary Power Unit |
| SPEC-0002 | Engine Block Heater |
| SPEC-0003 | Adaptive Cruise Control |
| SPEC-0004 | Electronic Stability Control |
| SPEC-0005 | Backup Camera |
| SPEC-0006 | Adaptive Cruise Control |

Where binary associations would erase nuance, subject, target, and role articulate directed participation in a relationship instance. Subject identifies the anchoring specification or vehicle record—SPEC-0005 linked to SPEC-0001—while target identifies the class or component node on the opposite shore of the association; role then states how that subject bears on the target, distinguishing contributor from owner, reviewer from observer, so that accountability matrices remain legible when a single specification touches multiple classes or when one component mandate implicates several stakeholders. A Scania R500 specification may own one class association yet review another; an Emergency Response profile may observe a mandated Engine Block Heater while a separate row assigns contributor responsibility elsewhere. Without role, junction tables collapse into undifferentiated edges that cannot support segregation-of-duties reviews or attestations of independent verification.

Cardinality_note closes the loop on relationship integrity by documenting multiplicity constraints and interpretation guards that pure foreign-key wiring cannot express. Entries labeled Cardinality Note 01 through Cardinality Note 04 accompany mandate edges between specifications and components, signaling whether a requirement is singular or repeatable, optional or exhaustive, or subject to contextual exceptions that must be read before inferring compliance coverage. In operational terms, cardinality_note prevents both over- and under-application: an observer role on a component mandate paired with Cardinality Note 04 may indicate qualified monitoring rather than full installation liability, whereas contributor cardinality on Adaptive Cruise Control may permit multiple fulfilling implementations only where the note explicitly allows plural satisfaction. Taken together, entity and identifier establish what is governed; attr, attr_type, and misc state what is true about it under typed evidence rules; issueddate and recorded_at bound those truths in time; and motorvehicleclass, vehiclecomponent, subject, target, role, and cardinality_note specify how governed objects relate, who stands in which capacity, and under what structural limits those relationships must be read—forming the minimum vocabulary for defensible, queryable compliance knowledge across heterogeneous subsystems.

**t_entity_type_belongs_to_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BELO-0001 | BELO-0001 | BELO-0002 | Dimension Kind 01 |
| BELO-0002 | BELO-0001 | BELO-0008 | Encoding 02 |
| BELO-0003 | BELO-0001 | BELO-0009 | nightly summary |
| BELO-0004 | BELO-0001 | BELO-0010 | es |
| BELO-0005 | BELO-0001 | BELO-0003 | hybrid |
| BELO-0006 | BELO-0001 | BELO-0006 | ms |
| BELO-0007 | BELO-0002 | BELO-0002 | Dimension Kind 07 |
| BELO-0008 | BELO-0002 | BELO-0008 | Encoding 08 |

**t_syscall_only_in_kernel_subsystem**

| id | syscall | in_syscall_subsystem | code | issued_date |
| --- | --- | --- | --- | --- |
| SUBS-0001 | read | namespaces | C-07 | 2024-01-17 |
| SUBS-0002 | write | inotify | B-12 | 2023-04-09 |
| SUBS-0003 | openat | fsnotify | E-21 | 2024-01-29 |
| SUBS-0004 | execve | vDSO | E-21 | 2024-04-20 |
| SUBS-0005 | read | inotify | C-07 | 2025-01-29 |

**t_vehicle_equipment_specification__applies_to_vehicle_class**

| id | vehicle_id | applies_to_vehicle_class_id | role |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0005 | SPEC-0001 | contributor |
| SPEC-0002 | SPEC-0002 | SPEC-0005 | owner |
| SPEC-0003 | SPEC-0006 | SPEC-0004 | owner |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | reviewer |
| SPEC-0005 | SPEC-0001 | SPEC-0004 | reviewer |
| SPEC-0006 | SPEC-0006 | SPEC-0005 | contributor |
| SPEC-0007 | SPEC-0003 | SPEC-0003 | contributor |
| SPEC-0008 | SPEC-0001 | SPEC-0005 | owner |

**t_vehicle_equipment_specification__mandates_component**

| id | vehicle_id | mandates_component_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| SPEC-0001 | SPEC-0004 | SPEC-0003 | observer | Cardinality Note 01 |
| SPEC-0002 | SPEC-0003 | SPEC-0002 | contributor | Cardinality Note 02 |
| SPEC-0003 | SPEC-0006 | SPEC-0001 | contributor | Cardinality Note 03 |
| SPEC-0004 | SPEC-0006 | SPEC-0006 | observer | Cardinality Note 04 |
| SPEC-0005 | SPEC-0006 | SPEC-0006 | owner | Cardinality Note 05 |
| SPEC-0006 | SPEC-0005 | SPEC-0004 | observer | Cardinality Note 06 |
| SPEC-0007 | SPEC-0002 | SPEC-0005 | contributor | Cardinality Note 07 |
| SPEC-0008 | SPEC-0005 | SPEC-0004 | owner | Cardinality Note 08 |