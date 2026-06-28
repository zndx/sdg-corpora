---
chapter_id: ch_live_ebpf_program_governed_by_directive_5f3a17
topic_id: 23
family: 07_long_tail
cited_terms: ['ebpf_program_governed_by_directive', 'measurement_subclass', 'evidence_refutes_claim']
model: engine-refine
---

Governance metadata for regulated kernel instrumentation and cross-domain measurement classification rests on a small set of relational primitives—identifier, entity, attr, attr_type, misc, subject, target, role, method, and labeltext—whose joint operation determines whether a compliance assertion can be validated, versioned, and contested with traceable evidence. An identifier is the durable surrogate key that binds a record across tables and lifecycle events without collapsing distinct policy objects into a single namespace; directives DIRE-0001 through DIRE-0004 each denote a separable governance object whose obligations attach to a concrete eBPF program class—tracepoint_sched, xdp_fwd, tc_egress, and again xdp_fwd—so that identical program names under different directive identifiers remain independently auditable. The entity primitive names the object to which attribute values accrue: in typed value stores, entity_id aligns with the directive identifier, ensuring that effective dates, enforcement strings, mandatory flags, and priority integers are always interpreted as properties of a specific governed program instance rather than as free-floating literals in a shared pool.

**t_ebpf_program_governed_by_directive**

| id | ebpf |
| --- | --- |
| DIRE-0001 | tracepoint_sched |
| DIRE-0002 | xdp_fwd |
| DIRE-0003 | tc_egress |
| DIRE-0004 | xdp_fwd |
| DIRE-0005 | tracepoint_sched |
| DIRE-0006 | tc_egress |

**t_ebpf_program_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_ebpf_program_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | false |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | true |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

**t_ebpf_program_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-06-04 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-23 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2025-01-20 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-06-12 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-15 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-12-23 |

**t_ebpf_program_governed_by_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 5 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 280 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 996 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 5 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 471 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 1 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 105 |

**t_ebpf_program_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | audit excerpt |

Attribute definition separates what may be said about an entity from how it is stored and validated. Each attr carries a semantic name—effective_date, enforcement, mandatory, priority—and an attr_type drawn from a constrained vocabulary such as xsd:date, xsd:string, xsd:boolean, and xsd:integer, which routes persisted facts into type-appropriate value relations and enforces parseability at ingestion. The misc field holds the instantiated value once typing is resolved: calendar dates including 2024-06-04 and 2025-03-23 for effective_date on DIRE-0001 and DIRE-0002; boolean true for mandatory on DIRE-0002, DIRE-0003, and DIRE-0004 versus false on DIRE-0001; integers 5 and 280 paired with DIRE-0001 and 3 and 996 with DIRE-0002 under distinct attr bindings; and varchar payloads such as Encoding 01, Enforcement 02, audit excerpt, and en when textual or enumerated semantics exceed scalar typing alone. This partition matters in practice because compliance engines can reject structurally valid but semantically incoherent submissions—an integer in a date slot, or a boolean where enforcement prose is required—before those errors propagate into enforcement graphs or audit trails.

Association semantics extend the entity–attribute model into directed relationships among independently identified records. Subject and target designate the endpoints of such a link: a measurement subclass identifier on the subject side and a dimension identifier on the target side, as when MEAS-0004 (Soil moisture) is linked to MEAS-0003 (Energy) and MEAS-0005 (Mass) under distinct association rows. Role qualifies the subject’s capacity relative to the target—owner versus reviewer—so that the same measurement–dimension pairing can express custody, approval authority, or review responsibility without duplicating either endpoint’s definition; MEAS-0006 and MEAS-0005 appear as subjects with reviewer role toward MEAS-0005, while MEAS-0004 carries owner role toward both MEAS-0003 and MEAS-0005. In operational terms, role prevents ambiguous many-to-many graphs from collapsing into undifferentiated adjacency lists, which is essential when dimensional provenance must survive reorganizations of measurement taxonomies or when Soil moisture must be tracked separately under Energy and Mass contexts even when the surface label repeats.

**t_measurement_subclass**

| id | measurement |
| --- | --- |
| MEAS-0001 | Heart rate |
| MEAS-0002 | Seismic magnitude |
| MEAS-0003 | Soil moisture |
| MEAS-0004 | Soil moisture |
| MEAS-0005 | Bandwidth throughput |
| MEAS-0006 | Seismic magnitude |

**t_measurement_subclass_dimension**

| id | dimension |
| --- | --- |
| MEAS-0001 | Electric current |
| MEAS-0002 | Power |
| MEAS-0003 | Energy |
| MEAS-0004 | Mass |
| MEAS-0005 | Mass |
| MEAS-0006 | Luminous intensity |

**t_measurement_subclass__dimension**

| id | measurement_id | dimension_id | role |
| --- | --- | --- | --- |
| MEAS-0001 | MEAS-0004 | MEAS-0003 | owner |
| MEAS-0002 | MEAS-0004 | MEAS-0005 | owner |
| MEAS-0003 | MEAS-0006 | MEAS-0005 | reviewer |
| MEAS-0004 | MEAS-0005 | MEAS-0001 | reviewer |
| MEAS-0005 | MEAS-0003 | MEAS-0002 | owner |
| MEAS-0006 | MEAS-0005 | MEAS-0006 | contributor |
| MEAS-0007 | MEAS-0003 | MEAS-0006 | contributor |
| MEAS-0008 | MEAS-0004 | MEAS-0001 | contributor |

Evidentiary challenge introduces method and labeltext as the human- and machine-readable interface between external artifacts and internal claim identifiers. A refutation record binds evidence—Benchmark result v2.1, Audit report FY2023, Sensor drift calibration, Data lineage snapshot—to the claim or directive it undermines, here including repeated contestation of DIRE-0004 and targeted refutation of DIRE-0002, while method records the verification pathway as manual, hybrid, or automated, encoding how much human attestation versus instrumented checking participated in the determination. Labeltext supplies the concise documentary handle—calibration record, audit excerpt, intake form, pre-release note—that auditors and operators use to locate the authoritative source without parsing the full evidence string, and its appearance as a varchar misc value under DIRE-0001 (audit excerpt) illustrates how the same lexical convention bridges typed attribute storage and free-standing evidence catalogs. Together, method and labeltext govern reproducibility: hybrid and automated methods on CLAI-0003 and CLAI-0004 imply partial or full pipeline validation, whereas manual method on CLAI-0001 signals reliance on expert review of Benchmark result v2.1.

**t_evidence_refutes_claim**

| id | evidence | refutes_claim | method | label_text |
| --- | --- | --- | --- | --- |
| CLAI-0001 | Benchmark result v2.1 | DIRE-0004 | manual | calibration record |
| CLAI-0002 | Audit report FY2023 | DIRE-0004 | hybrid | audit excerpt |
| CLAI-0003 | Sensor drift calibration | DIRE-0002 | automated | intake form |
| CLAI-0004 | Data lineage snapshot | DIRE-0006 | hybrid | pre-release note |
| CLAI-0005 | Audit report FY2023 | DIRE-0005 | hybrid | calibration record |
| CLAI-0006 | Compliance checklist 7.4 | DIRE-0003 | automated | change rationale |
| CLAI-0007 | Incident summary Aug | DIRE-0006 | inferred | intake form |

Taken as an integrated governance fabric, these primitives enforce a separation of concerns that scales from kernel program directives to geophysical and physiological measurement subclasses. Identifiers stabilize reference; entities anchor attribute cardinality; attr and attr_type couple semantics to validation; misc materializes enforceable facts; subject, target, and role structure relational accountability across taxonomies; and method with labeltext close the loop between policy objects and the evidentiary artifacts that confirm or refute them. A practitioner who treats DIRE-0003’s mandatory=true alongside its 2025-01-20 effective_date as independent fields rather than as a typed, entity-scoped assertion will misread enforcement timing; likewise, ignoring reviewer role on measurement–dimension edges or the hybrid method on Sensor drift calibration against DIRE-0002 will understate which refutations demand re-validation after toolchain change. The architecture’s practical force lies precisely in this disciplined decomposition: every compliance statement decomposes into identifiable entities, typed attributes, qualified relationships, and labeled, method-tagged evidence—each inspectable, each independently versionable, and each necessary for defensible operational governance.