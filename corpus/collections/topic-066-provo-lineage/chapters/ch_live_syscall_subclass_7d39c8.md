---
chapter_id: ch_live_syscall_subclass_7d39c8
topic_id: 66
family: 04_ebpf_kernel
cited_terms: ['syscall_subclass', 'agent_software_or_human', 'equiv_intersect_with_two_restrictions']
model: engine-refine
---

In syscall governance and compliance telemetry, the in-syscall subsystem is the operational unit through which kernel-bound activity is partitioned, attributed, and audited. Each subsystem receives a stable identifier—`SYSC-0001` through `SYSC-0004` in the reference dimension—and a categorical assignment that fixes its place within the control taxonomy. Category values such as In Syscall Subsystem Category 01 and In Syscall Subsystem Category 04 are not decorative labels; they encode the compliance boundary within which syscall events may be collected, retained, and cross-referenced. The misc field, realized here as in_syscall_subsystem_label (In Syscall Subsystem Label 01 through In Syscall Subsystem Label 04), supplies the human-readable surface form that operators, auditors, and automated policy engines use when category alone would be too coarse. Together, identifier, category, and misc establish a three-layer naming scheme: machine-stable keys, governance classes, and operational prose.

**dim_in_syscall_subsystem**

| id | in_syscall_subsystem_label | in_syscall_subsystem_category |
| --- | --- | --- |
| SYSC-0001 | In Syscall Subsystem Label 01 | In Syscall Subsystem Category 01 |
| SYSC-0002 | In Syscall Subsystem Label 02 | In Syscall Subsystem Category 02 |
| SYSC-0003 | In Syscall Subsystem Label 03 | In Syscall Subsystem Category 03 |
| SYSC-0004 | In Syscall Subsystem Label 04 | In Syscall Subsystem Category 04 |
| SYSC-0005 | In Syscall Subsystem Label 05 | In Syscall Subsystem Category 05 |
| SYSC-0006 | In Syscall Subsystem Label 06 | In Syscall Subsystem Category 06 |

Event count is the quantitative spine of that scheme. In the fact layer, each syscall record carries an event_count that measures how many discrete syscall observations were attributed to a given subsystem key over the reporting window. The spread in the reference data—238, 52, 198, and 382—is diagnostically meaningful rather than merely volumetric. A count of 382 against subsystem key `SYSC-0004` signals a hot path deserving capacity review, anomaly baselining, or license-scoped agent scrutiny, whereas 52 against `SYSC-0002` may indicate a dormant partition, a misconfigured collector, or a legitimately low-traffic control surface. Event counts do not interpret themselves; they acquire compliance significance only when joined, via identifier, to the dimension that supplies category and misc context. That join is what converts raw frequency into governable evidence.

**fact_syscall**

| id | in_syscall_subsystem_key | event_count |
| --- | --- | --- |
| SYSC-0001 | SYSC-0004 | 238 |
| SYSC-0002 | SYSC-0002 | 52 |
| SYSC-0003 | SYSC-0003 | 198 |
| SYSC-0004 | SYSC-0005 | 382 |
| SYSC-0005 | SYSC-0002 | 283 |
| SYSC-0006 | SYSC-0001 | 288 |

Identifier discipline is what makes such joins reliable across heterogeneous tables. The pattern `SYSC-####` for syscall entities, `HUMA-####` for agent records, and `REST-####` for restriction intersections is deliberate: prefixes disambiguate namespace, while sequential numbering preserves audit lineage. When fact_syscall maps in_syscall_subsystem_key values that include `SYSC-0005` alongside dimension rows ending at `SYSC-0004`, the framework exposes a classic referential integrity signal—activity attributed to a subsystem not yet materialized in the category dimension. Compliance workflows treat that condition as a first-class finding, because uncategorized or orphan-keyed events cannot be routed to the correct retention rule, escalation path, or license obligation. Identifiers therefore function simultaneously as foreign keys, audit handles, and evidentiary anchors.

License enters the domain when syscall telemetry must be reconciled with the software and human agents that produce, transform, or consume it. The agent registry binds identifiers such as `HUMA-0001` through `HUMA-0004` to operational personas—LegacySystemBridge, SecurityAnalyst, MLopsSpecialist, AirflowDAGRunner—and to license declarations spanning copyleft and permissive regimes: GPL-3.0, Apache-2.0, MPL-2.0, and MIT. In practice, license is not a legal footnote appended to telemetry; it is a governance attribute that constrains which agents may participate in syscall collection, which derivative artifacts may be stored alongside event counts, and which cross-table equivalences are permitted without contaminating compliance scope. A misc name such as ComplianceChecker or ModelValidator tells auditors what function an agent performs; the license tells them what obligations attach to that function’s outputs.

**t_agent_software_or_human**

| id | agent | agent_2 | agent_3 | license | name |
| --- | --- | --- | --- | --- | --- |
| HUMA-0001 | LegacySystemBridge | PlatformEngineer | PrometheusCollector | GPL-3.0 | ComplianceChecker |
| HUMA-0002 | SecurityAnalyst | IncidentResponder | LegalHoldService | Apache-2.0 | IncidentTriage |
| HUMA-0003 | MLopsSpecialist | PrometheusCollector | SentinelAuditBot | MPL-2.0 | LogAggregator |
| HUMA-0004 | AirflowDAGRunner | PagerOnCallDispatcher | DevOpsCoordinator | MIT | ModelValidator |
| HUMA-0005 | ShiftSupervisor | AirflowDAGRunner | KafkaStreamProcessor | Apache-2.0 | ModelValidator |
| HUMA-0006 | MLopsSpecialist | VaultSecretRotator | LegalHoldService | Apache-2.0 | LogAggregator |
| HUMA-0007 | IncidentResponder | PrometheusCollector | GlacierRecoveryJob | Apache-2.0 | AccessAuditor |
| HUMA-0008 | QualityAssuranceLead | MLopsSpecialist | PrometheusCollector | MPL-2.0 | IncidentTriage |

The misc attribute, wherever it appears, carries the same semantic burden under different surface names: in_syscall_subsystem_label humanizes subsystem identifiers, while agent name humanizes HUMA keys. Misc fields are deliberately excluded from key constraints because they evolve—renamed during reorganizations, localized for regional review, or enriched for executive reporting—without invalidating the underlying identifier graph. Governance frameworks that freeze misc alongside keys invite silent drift; those that treat misc as descriptive overlay preserve stable joins while permitting operational language to change. Event counts joined to misc labels thus appear in dashboards as “In Syscall Subsystem Label 03: 198 events,” which is the form evidence must take when presented to non-technical control owners.

Equivalence and restriction intersections complete the picture by showing how syscall evidence propagates into adjacent control domains under dual constraints. Records such as `REST-0001`, pairing telemetry_stream_alpha with ml_model_checkpoint and relating them to storage_volume and inference_dataset, demonstrate that syscall-adjacent assets do not exist in isolation; they participate in bounded equivalence classes where two independent restrictions must both be satisfied before data may flow. The repeated appearance of sensor_node_array and pressure_transducer across `REST-0002` and `REST-0004` illustrates how shared infrastructure creates correlated audit surfaces: a spike in syscall event_count for one subsystem may simultaneously implicate physical sensing paths and model artifacts governed under separate identifiers. Category and license supply the policy vocabulary; identifier supplies the join keys; event_count supplies the measurable signal; misc supplies interpretability; in_syscall_subsystem supplies the operational locus. Woven together, they form the evidentiary fabric syscall compliance is built to inspect, retain, and defend.

**t_equiv_intersect_with_two_restrictions**

| id | equiv | equiv_2 | related | related_2 |
| --- | --- | --- | --- | --- |
| REST-0001 | telemetry_stream_alpha | ml_model_checkpoint | storage_volume | inference_dataset |
| REST-0002 | governance_policy_set | sensor_node_array | encryption_key | backup_volume |
| REST-0003 | ml_feature_vector | sensor_node_array | centrifuge_tube | pressure_transducer |
| REST-0004 | lab_assay_batch | ml_model_checkpoint | ingestion_connector | pressure_transducer |
| REST-0005 | edge_gateway_unit | validation_schema | protocol_adapter | incubator_chamber |
| REST-0006 | batch_pipeline_gamma | sensor_node_array | schema_registry | catalog_entry |
| REST-0007 | telemetry_stream_alpha | ml_model_checkpoint | centrifuge_tube | inference_dataset |