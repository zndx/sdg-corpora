---
chapter_id: ch_live_indoor_environmental_monitoring_process_da0b38
topic_id: 188
family: 08_derived
cited_terms: ['indoor_environmental_monitoring_process', 'nist80053_control_subclass', 'ebpfmap_with_max_entries']
model: engine-refine
---

Indoor environmental governance rests on a small set of compositional primitives—identifier, entity, attribute, and typed value—that permit heterogeneous compliance artifacts to be referenced, classified, and evaluated under a single operational semantics. An identifier supplies the durable handle by which any record may be retrieved, correlated across revisions, and bound to external audit trails; in operational corpora these handles take the form of stable tokens such as PROC-0001 through PROC-0004 for monitoring workflows or CONT-0001 through CONT-0004 for security-control subclasses. The entity is the governed object itself—the control subclass, the monitoring process, the eBPF map configuration—not merely its name but the unit to which obligations, measurements, and relational assertions attach. Without entity resolution anchored to identifiers, cross-domain reconciliation (for example, demonstrating that a particulate-sweep protocol executed in a server hall satisfies an SI-4 monitoring expectation) collapses into narrative assertion rather than evidence.

Attributes name the facets along which an entity may be characterized, while attr_type constrains how each facet may legally be expressed and therefore which persistence pathway must receive its value. A control subclass may carry effective_date as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer; the type declaration is not decorative metadata but the enforcement gate that routes each assignment to the appropriate value store and rejects structurally invalid encodings at ingest. The misc designation, in practice, denotes the payload held for a given entity–attribute pair once type compatibility is established: boolean rows record mandatory=true for CONT-0001, CONT-0002, and CONT-0003 but mandatory=false for CONT-0004; date rows anchor effective_date at 2023-01-02, 2024-11-29, 2024-03-23, and 2025-03-12 respectively; integer rows associate priority values 3 and 776 with CONT-0001 and 4 and 46 with CONT-0002; varchar rows retain enforcement strings such as Enforcement 02 and Encoding 01 alongside domain-specific miscellany including calibration record and locale token es. Typed decomposition prevents a single overloaded column from silently coercing dates into strings or priorities into booleans, which is essential when downstream assessors compute coverage, staleness, or exception rates across large control inventories.

**t_nist80053_control_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0003 | true |
| CONT-0002 | CONT-0002 | CONT-0003 | true |
| CONT-0003 | CONT-0003 | CONT-0003 | true |
| CONT-0004 | CONT-0004 | CONT-0003 | false |
| CONT-0005 | CONT-0005 | CONT-0003 | true |
| CONT-0006 | CONT-0006 | CONT-0003 | true |

The NIST control-subclass pattern illustrates why entity-centric attribute modeling matters for framework heterogeneity. Each entity identifier maps a governing publication—NIST SP 800-53 Rev 5, NIST SP 800-171, NIST CSF 2.0, or NIST SP 800-207—to a concrete control designation such as AC-3, CM-3, SI-4, or SA-4, while parallel attribute rows supply the operational metadata assessors require when determining applicability and enforcement posture. Mandatory=true on three of four subclasses signals near-universal obligation within the scoped population, whereas mandatory=false on CONT-0004 marks a deliberate exception that must be justified in risk acceptance records rather than assumed away. Divergent effective_date values establish independent control lifecycles: a 2023-01-02 baseline may govern access-enforcement logic under AC-3 while a 2025-03-12 effective date defers SA-4 procurement scrutiny to a later assessment window. Priority integers that range from single digits to hundreds (3 versus 776 on CONT-0001) demonstrate that priority is not merely ordinal rank within a small set but may encode enterprise ticketing or workflow sequencing semantics; enforcement varchar values further differentiate machine-readable policy encodings from human-readable calibration artifacts. Readers should treat each entity as a bundle of typed assertions, not as a flat row, because compliance conclusions emerge from the intersection of framework mapping, temporal validity, obligation flags, and enforcement encodings.

**t_nist80053_control_subclass**

| id | nist | nist80053_control |
| --- | --- | --- |
| CONT-0001 | NIST SP 800-53 Rev 5 | AC-3 |
| CONT-0002 | NIST SP 800-171 | CM-3 |
| CONT-0003 | NIST CSF 2.0 | SI-4 |
| CONT-0004 | NIST SP 800-207 | SA-4 |
| CONT-0005 | FIPS 140-3 | SR-1 |
| CONT-0006 | NIST SP 800-171 | AU-6 |

**t_nist80053_control_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | effective_date | xsd:date |
| CONT-0002 | enforcement | xsd:string |
| CONT-0003 | mandatory | xsd:boolean |
| CONT-0004 | priority | xsd:integer |
| CONT-0005 | review_cycle_days | xsd:integer |
| CONT-0006 | scope | xsd:string |
| CONT-0007 | encoding | xsd:string |
| CONT-0008 | label_text | xsd:string |

**t_nist80053_control_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | 2023-01-02 |
| CONT-0002 | CONT-0002 | CONT-0001 | 2024-11-29 |
| CONT-0003 | CONT-0003 | CONT-0001 | 2024-03-23 |
| CONT-0004 | CONT-0004 | CONT-0001 | 2025-03-12 |
| CONT-0005 | CONT-0005 | CONT-0001 | 2024-03-19 |
| CONT-0006 | CONT-0006 | CONT-0001 | 2023-10-15 |

**t_nist80053_control_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0004 | 3 |
| CONT-0002 | CONT-0001 | CONT-0005 | 776 |
| CONT-0003 | CONT-0002 | CONT-0004 | 4 |
| CONT-0004 | CONT-0002 | CONT-0005 | 46 |
| CONT-0005 | CONT-0003 | CONT-0004 | 1 |
| CONT-0006 | CONT-0003 | CONT-0005 | 151 |
| CONT-0007 | CONT-0004 | CONT-0004 | 4 |
| CONT-0008 | CONT-0004 | CONT-0005 | 507 |

**t_nist80053_control_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0007 | Encoding 01 |
| CONT-0002 | CONT-0001 | CONT-0002 | Enforcement 02 |
| CONT-0003 | CONT-0001 | CONT-0008 | calibration record |
| CONT-0004 | CONT-0001 | CONT-0009 | es |
| CONT-0005 | CONT-0001 | CONT-0006 | Scope 05 |
| CONT-0006 | CONT-0002 | CONT-0007 | Encoding 06 |
| CONT-0007 | CONT-0002 | CONT-0002 | Enforcement 07 |
| CONT-0008 | CONT-0002 | CONT-0008 | audit excerpt |

Indoor environmental monitoring processes instantiate the same identifier–entity–relation vocabulary in a physical operations domain. An indoorenvironmentalmonitoringprocess such as Library Climate Calibration, Office Floor CO2 Mapping, Server Hall Alpha, or Cafeteria Zone C is an entity identified by PROC-0001 through PROC-0004 and defined by what it monitors and how it monitors. The indoorenvironment names the spatial or functional target of observation—Server Hall Alpha, West Wing HVAC Survey, ICU Wing South, Dormitory Radon Campaign—while the monitoringprotocol names the standardized procedure applied—Chemical Storage Vault, Cafeteria Ventilation Test, Cleanroom Particulate Sweep, Office Floor CO2 Mapping. Operational integrity depends on explicit binding: Server Hall Alpha as a process label is not interchangeable with Server Hall Alpha as the environment under survey unless the governance model records that binding; likewise, reusing Office Floor CO2 Mapping as both process title and protocol signals either deliberate alignment (the process executes exactly the published CO2 mapping method) or a documentation defect that auditors must resolve. Facilities teams use these triples to schedule campaigns, allocate sensors, and demonstrate that ICU Wing South radon surveillance or dormitory radon campaigns were conducted under named protocols suitable for chemical-storage, ventilation, or particulate regimes.

**t_indoor_environmental_monitoring_process**

| id | indoor_environmental_monitoring_process | monitors_indoor_environment | uses_monitoring_protocol |
| --- | --- | --- | --- |
| PROC-0001 | Library Climate Calibration | Server Hall Alpha | Chemical Storage Vault |
| PROC-0002 | Office Floor CO2 Mapping | West Wing HVAC Survey | Cafeteria Ventilation Test |
| PROC-0003 | Server Hall Alpha | ICU Wing South | Cleanroom Particulate Sweep |
| PROC-0004 | Cafeteria Zone C | Dormitory Radon Campaign | Office Floor CO2 Mapping |

Relational governance extends the entity model with subject, target, and role when two typed entities must be associated under a declared participation semantics. In capacity-constrained kernel map configurations, an ebpfmap entity (devmap, cgroup_storage, queue, stack_trace) may be linked to a max_entries entity (1048576, 262144, 16384, 16384) through assertions in which the subject identifies the originating map record, the target identifies the capacity record, and the role states how the asserting party relates to that pairing—reviewer, owner, or observer. A subject of ENTR-0004 tied to target ENTR-0002 under role reviewer differs materially from ENTR-0001 subject with ENTR-0001 target under role owner: the former is an oversight relationship across distinct identifiers, the latter an ownership self-association on the same capacity tier. Roles are not decorative labels; they govern who may approve changes to max_entries, who bears accountability for devmap sizing at 1048576 entries, and who may observe without mutating queue or stack_trace limits held at 16384. The same subject–target–role machinery applies wherever governance must express directed edges—monitoring process to protocol adoption, control subclass to assessment reviewer—without collapsing heterogeneous endpoints into undifferentiated foreign keys.

**t_ebpfmap_with_max_entries**

| id | ebpfmap |
| --- | --- |
| ENTR-0001 | devmap |
| ENTR-0002 | cgroup_storage |
| ENTR-0003 | queue |
| ENTR-0004 | stack_trace |
| ENTR-0005 | sockhash |
| ENTR-0006 | queue |

**t_ebpfmap_with_max_entries_max_entries**

| id | max_entries |
| --- | --- |
| ENTR-0001 | 1048576 |
| ENTR-0002 | 262144 |
| ENTR-0003 | 16384 |
| ENTR-0004 | 16384 |
| ENTR-0005 | 32768 |
| ENTR-0006 | 1048576 |
| ENTR-0007 | 524288 |

**t_ebpfmap_with_max_entries__max_entries**

| id | ebpfmap_id | max_entries_id | role |
| --- | --- | --- | --- |
| ENTR-0001 | ENTR-0004 | ENTR-0002 | reviewer |
| ENTR-0002 | ENTR-0001 | ENTR-0001 | owner |
| ENTR-0003 | ENTR-0004 | ENTR-0006 | reviewer |
| ENTR-0004 | ENTR-0002 | ENTR-0004 | observer |
| ENTR-0005 | ENTR-0006 | ENTR-0002 | observer |
| ENTR-0006 | ENTR-0006 | ENTR-0006 | owner |
| ENTR-0007 | ENTR-0004 | ENTR-0005 | owner |
| ENTR-0008 | ENTR-0006 | ENTR-0004 | observer |

Taken together, identifier stability, entity-centered attribute typing with misc-valued stores, domain-specific process–environment–protocol composition, and subject–target–role association constitute the practical grammar through which compliance and operations corpora remain queryable, auditable, and extensible. New indoor campaigns receive PROC identifiers; new framework editions attach to CONT entities with fresh effective_date and enforcement attrs; new kernel maps enter the ENTR namespace with explicit capacity bindings and accountable roles. Assessors query mandatory booleans and priority integers to rank remediation; facilities managers trace which protocol governed a given environment; platform engineers verify that reviewers and owners are recorded before max_entries change. The architecture succeeds when every evidentiary value—true, 2024-03-23, Cleanroom Particulate Sweep, reviewer—can be traced to its entity, attribute type, and governing identifier without ambiguity, for ambiguity at any layer propagates directly into false compliance claims and unsafe operational assumptions.