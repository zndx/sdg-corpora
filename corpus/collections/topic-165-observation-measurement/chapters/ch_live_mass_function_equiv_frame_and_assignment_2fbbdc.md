---
chapter_id: ch_live_mass_function_equiv_frame_and_assignment_2fbbdc
topic_id: 165
family: 06_belief_structure
cited_terms: ['mass_function_equiv_frame_and_assignment', 'trace_originates_from', 'bpf_helper_called_by']
model: engine-refine
---

In governed observability and measurement pipelines, the identifier anchors every auditable fact to a stable, referencable key that survives joins across assignment, attribute, and trace subsystems without ambiguity. Assignments such as ASSI-0001 through ASSI-0004 denote discrete mass-function equivalences—corrosion_rate_measurement, optical_transmittance_run, magnetic_offset_calibration, vibration_profile_test—each bound to a frame of discernment (CALL-0001, CALL-0005, CALL-0003) and routed toward a semantic target such as fault_or_failure, land_or_sea_only, or degraded_state_only. The identifier is not merely a surrogate primary key; it is the contractual handle by which downstream compliance queries, lineage reconstructions, and cross-program attribution resolve the same logical object whether it appears in an assignment header, a BPF invocation record, or a provenance trace. Where CALL-0001 is referenced both as the over_frame_of_discernment for ASSI-0001 and ASSI-0004 and as the entity carrying checksum and license attributes, identifier consistency is what permits auditors to assert, without conflation, that socket_connect_trace and tracepoint:sched_process_exit share a discernment frame yet diverge in assigned mass and exit behaviour.

**t_mass_function_equiv_frame_and_assignment**

| id | mass | over_frame_of_discernment | assigns_mass_to |
| --- | --- | --- | --- |
| ASSI-0001 | corrosion_rate_measurement | CALL-0001 | fault_or_failure |
| ASSI-0002 | optical_transmittance_run | CALL-0005 | land_or_sea_only |
| ASSI-0003 | magnetic_offset_calibration | CALL-0003 | degraded_state_only |
| ASSI-0004 | vibration_profile_test | CALL-0001 | degraded_state_only |
| ASSI-0005 | pressure_deviation_check | CALL-0003 | high_or_extreme_only |
| ASSI-0006 | vibration_profile_test | CALL-0003 | degraded_state_only |

**t_mass_function_equiv_frame_and_assignment_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ASSI-0001 | confidence | xsd:decimal |
| ASSI-0002 | dimension_kind | xsd:string |
| ASSI-0003 | method | xsd:string |
| ASSI-0004 | recorded_at | xsd:dateTime |
| ASSI-0005 | uncertainty | xsd:decimal |
| ASSI-0006 | unit | xsd:string |
| ASSI-0007 | value | xsd:decimal |
| ASSI-0008 | encoding | xsd:string |

**t_mass_function_equiv_frame_and_assignment_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0004 | 2025-06-10T14:56:29 |
| ASSI-0002 | ASSI-0002 | ASSI-0004 | 2024-06-25T12:59:02 |
| ASSI-0003 | ASSI-0003 | ASSI-0004 | 2024-03-24T16:20:19 |
| ASSI-0004 | ASSI-0004 | ASSI-0004 | 2025-03-04T17:25:44 |
| ASSI-0005 | ASSI-0005 | ASSI-0004 | 2024-07-15T05:15:18 |
| ASSI-0006 | ASSI-0006 | ASSI-0004 | 2023-09-16T23:06:46 |

**t_mass_function_equiv_frame_and_assignment_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0001 | 0.002 |
| ASSI-0002 | ASSI-0001 | ASSI-0005 | 724.48 |
| ASSI-0003 | ASSI-0001 | ASSI-0007 | 469.73 |
| ASSI-0004 | ASSI-0002 | ASSI-0001 | 0.018 |
| ASSI-0005 | ASSI-0002 | ASSI-0005 | 449.10 |
| ASSI-0006 | ASSI-0002 | ASSI-0007 | 350.09 |
| ASSI-0007 | ASSI-0003 | ASSI-0001 | 0.405 |
| ASSI-0008 | ASSI-0003 | ASSI-0005 | 839.88 |

**t_mass_function_equiv_frame_and_assignment_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ASSI-0001 | ASSI-0001 | ASSI-0002 | Dimension Kind 01 |
| ASSI-0002 | ASSI-0001 | ASSI-0008 | Encoding 02 |
| ASSI-0003 | ASSI-0001 | ASSI-0009 | pre-release note |
| ASSI-0004 | ASSI-0001 | ASSI-0010 | fr |
| ASSI-0005 | ASSI-0001 | ASSI-0003 | manual |
| ASSI-0006 | ASSI-0001 | ASSI-0006 | kg |
| ASSI-0007 | ASSI-0002 | ASSI-0002 | Dimension Kind 07 |
| ASSI-0008 | ASSI-0002 | ASSI-0008 | Encoding 08 |

Attributes and attribute types constitute the typed metadata layer through which entities acquire inspectable, machine-validated properties without hard-coding schema for every domain variant. An attr—confidence, dimension_kind, method, recorded_at on assignments, or checksum, created_date, identifier, license on BPF helper call records—names the semantic slot; attr_type declares the governing datatype, whether xsd:decimal, xsd:string, xsd:dateTime, xsd:date, or a domain-specific constraint such as cco:DesignativeICE. This separation matters because governance frameworks must enforce parseability and comparability at ingestion: a recorded_at value of 2025-06-10T14:56:29 is admissible only under xsd:dateTime, whereas created_date on CALL-0002 at 2025-01-26 falls under xsd:date and must not be coerced into a datetime comparison against assignment timestamps. Attribute typing further partitions physical storage: decimal misc values (0.002, 724.48, 469.73, 0.018) land in decimal-valued tables, varchar misc (Dimension Kind 01, Encoding 02, pre-release note, fr) in string tables, and temporal misc in datetime or date tables—each keyed by entity and attr so that ASSI-0001 may simultaneously hold confidence 0.002, dimension_kind Dimension Kind 01, and a shared recorded_at without violating type integrity.

**t_bpf_helper_called_by**

| id | bpf | called_by_program |
| --- | --- | --- |
| CALL-0001 | socket_connect_trace | ASSI-0003 |
| CALL-0002 | xdp_router | ASSI-0006 |
| CALL-0003 | lsm:inode_create | ASSI-0005 |
| CALL-0004 | tracepoint:sched_process_exit | ASSI-0001 |
| CALL-0005 | raw_tracepoint:sys_enter | ASSI-0006 |
| CALL-0006 | cgroup_skb_ingress | ASSI-0004 |

**t_bpf_helper_called_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CALL-0001 | checksum | xsd:string |
| CALL-0002 | created_date | xsd:date |
| CALL-0003 | identifier | cco:DesignativeICE |
| CALL-0004 | license | xsd:string |
| CALL-0005 | mime_type | xsd:string |
| CALL-0006 | size_bytes | xsd:long |
| CALL-0007 | uri | xsd:string |
| CALL-0008 | version | xsd:integer |

**t_bpf_helper_called_by_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0002 | 2024-07-02 |
| CALL-0002 | CALL-0002 | CALL-0002 | 2025-01-26 |
| CALL-0003 | CALL-0003 | CALL-0002 | 2024-10-16 |
| CALL-0004 | CALL-0004 | CALL-0002 | 2023-11-11 |
| CALL-0005 | CALL-0005 | CALL-0002 | 2024-05-09 |
| CALL-0006 | CALL-0006 | CALL-0002 | 2025-02-22 |

**t_bpf_helper_called_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0006 | 67 |
| CALL-0002 | CALL-0001 | CALL-0008 | 11 |
| CALL-0003 | CALL-0002 | CALL-0006 | 259 |
| CALL-0004 | CALL-0002 | CALL-0008 | 9 |
| CALL-0005 | CALL-0003 | CALL-0006 | 333 |
| CALL-0006 | CALL-0003 | CALL-0008 | 11 |
| CALL-0007 | CALL-0004 | CALL-0006 | 103 |
| CALL-0008 | CALL-0004 | CALL-0008 | 4 |

**t_bpf_helper_called_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CALL-0001 | CALL-0001 | CALL-0001 | 1a4b6c2d |
| CALL-0002 | CALL-0001 | CALL-0003 | ARN:res/41 |
| CALL-0003 | CALL-0001 | CALL-0004 | proprietary |
| CALL-0004 | CALL-0001 | CALL-0009 | zone-b |
| CALL-0005 | CALL-0001 | CALL-0005 | application/octet-stream |
| CALL-0006 | CALL-0001 | CALL-0010 | Name 06 |
| CALL-0007 | CALL-0001 | CALL-0011 | data-engineering |
| CALL-0008 | CALL-0001 | CALL-0012 | Tags 08 |

The entity, in this pattern, is the bearer of attribute values: entity_id ties each misc datum to the object under description, which may be the assignment itself (ASSI-0001 carrying multiple attrs on ASSI-0001) or a related call record (CALL-0001 hosting checksum 1a4b6c2d and license proprietary). Misc therefore denotes the polymorphic payload—the literal stored value once attr and attr_type have fixed meaning and validation rules. Operational guides treat misc not as an undifferentiated junk field but as evidence whose interpretability is entirely delegated to its attr–attr_type–entity triple; fr on ASSI-0001 is meaningless without knowing it sits on attr_id ASSI-0010 under a string type, just as integer misc 67 and 259 on CALL-0001 and CALL-0002 are intelligible only when resolved to their attr slots. This entity-centric value model enables heterogeneous programs—ASSI-0003 calling lsm:inode_create, ASSI-0001 invoking tracepoint:sched_process_exit—to publish comparable attribute surfaces without flattening their distinct internal representations.

Category and originates_from address provenance and taxonomic placement: category classifies the source dimension (Originates From Category 01 through 04 paired with Originates From Label 01 through 04), while originates_from_key in fact_trace encodes lineage among execution origins (FROM-0002 descending from FROM-0001, FROM-0003 from FROM-0005, FROM-0004 chaining back to FROM-0004). Together they answer compliance questions of the form *which class of upstream actor produced this trace and from what antecedent*. Category supports aggregate reporting and policy scoping—thresholds, retention, or escalation rules may differ by originates_from_category—whereas originates_from resolves instance-level ancestry for forensic replay. When duration_seconds, exit, and retry_count attach to the same trace row, provenance context determines whether a 3940.66-second run exiting 420 after 396 retries signals acceptable resilience within Category 03 or a breach under Category 01 controls.

**fact_trace**

| id | originates_from_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | 1874.27 | 491 | 399 |
| FROM-0002 | FROM-0001 | 2092.44 | 900 | 179 |
| FROM-0003 | FROM-0005 | 3940.66 | 420 | 396 |
| FROM-0004 | FROM-0004 | 3336.66 | 60 | 459 |

**dim_originates_from**

| id | originates_from_label | originates_from_category |
| --- | --- | --- |
| FROM-0001 | Originates From Label 01 | Originates From Category 01 |
| FROM-0002 | Originates From Label 02 | Originates From Category 02 |
| FROM-0003 | Originates From Label 03 | Originates From Category 03 |
| FROM-0004 | Originates From Label 04 | Originates From Category 04 |
| FROM-0005 | Originates From Label 05 | Originates From Category 05 |
| FROM-0006 | Originates From Label 06 | Originates From Category 06 |
| FROM-0007 | Originates From Label 07 | Originates From Category 07 |

Duration_seconds, exit, and retry_count quantify runtime behaviour at the boundary where measurement assignments meet executed instrumentation. Duration_seconds records elapsed wall or processor time for a traced origin (1874.27, 2092.44, 3336.66 among observed values), supplying the temporal evidence needed for SLA attestation and capacity review. Exit—here exit_code—captures termination status: codes 491, 900, 420, and 60 are not interchangeable semantically; governance mappings must define which exits constitute success, degraded completion, or hard failure per program class. Retry_count documents resumption pressure before final exit; counts of 399, 179, 396, and 459 indicate environments where helpers or mass-assignment workflows encountered substantial re-attempt load, a signal auditors correlate with identifier stability (did ASSI-0004’s assignment to degraded_state_only persist across retries?) and with attr-recorded timestamps (recorded_at 2025-03-04T17:25:44 versus 2024-03-24T16:20:19) to determine whether retries spanned maintenance windows or reflected chronic instability. In practice, teams wire these fields into control dashboards so that high retry_count paired with non-zero exit codes triggers review of the originating category, while clean exits after moderate duration support attestation that the assigned mass function executed within the frame of discernment declared at assignment time.