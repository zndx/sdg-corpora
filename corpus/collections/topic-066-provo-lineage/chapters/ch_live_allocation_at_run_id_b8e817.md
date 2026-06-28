---
chapter_id: ch_live_allocation_at_run_id_b8e817
topic_id: 66
family: 05_provo_lineage
cited_terms: ['allocation_at_run_id', 'agent_software_or_human', 'entity_match_link']
model: engine-refine
---

At the foundation of any rigorous data governance framework lies the precise definition of an *entity* and its immutable *identifier*, which together establish the atomic units of accountability and traceability. Whether tracking a physical Lab instrument SN-4491 or a digital Dataset v4.2.1, the system relies on unique identifiers—such as RUN-0001 or LINK-0001—to anchor every operational record and ensure that a Governance policy DOC-992 can be unambiguously linked to a Standard template ST-099 without risk of conflation. These identifiers serve as the primary keys that bind disparate data points, allowing the architecture to maintain a coherent lineage from raw operational data to high-level compliance artifacts, while simultaneously supporting complex match links, such as associating a Sample batch SB-2214 with a Validation suite VS-605.

**t_entity_match_link**

| id | entity | matches_entity |
| --- | --- | --- |
| LINK-0001 | Lab instrument SN-4491 | Reference standard RS-004 |
| LINK-0002 | Sample batch SB-2214 | Validation suite VS-605 |
| LINK-0003 | Dataset v4.2.1 | Validation suite VS-605 |
| LINK-0004 | Governance policy DOC-992 | Standard template ST-099 |
| LINK-0005 | Governance policy DOC-992 | Matched registry MR-881 |
| LINK-0006 | Provenance log PR-7741 | Validation suite VS-605 |

**t_entity_match_link_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LINK-0001 | confidence | xsd:decimal |
| LINK-0002 | dimension_kind | xsd:string |
| LINK-0003 | method | xsd:string |
| LINK-0004 | recorded_at | xsd:dateTime |
| LINK-0005 | uncertainty | xsd:decimal |
| LINK-0006 | unit | xsd:string |
| LINK-0007 | value | xsd:decimal |
| LINK-0008 | encoding | xsd:string |

**t_entity_match_link_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0004 | 2025-02-02T03:38:54 |
| LINK-0002 | LINK-0002 | LINK-0004 | 2024-07-01T04:17:43 |
| LINK-0003 | LINK-0003 | LINK-0004 | 2023-10-04T15:34:58 |
| LINK-0004 | LINK-0004 | LINK-0004 | 2025-05-20T07:58:08 |
| LINK-0005 | LINK-0005 | LINK-0004 | 2023-04-10T04:16:09 |
| LINK-0006 | LINK-0006 | LINK-0004 | 2023-09-16T03:40:04 |

**t_entity_match_link_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0001 | 0.249 |
| LINK-0002 | LINK-0001 | LINK-0005 | 448.20 |
| LINK-0003 | LINK-0001 | LINK-0007 | 699.43 |
| LINK-0004 | LINK-0002 | LINK-0001 | 0.772 |
| LINK-0005 | LINK-0002 | LINK-0005 | 156.67 |
| LINK-0006 | LINK-0002 | LINK-0007 | 439.51 |
| LINK-0007 | LINK-0003 | LINK-0001 | 0.389 |
| LINK-0008 | LINK-0003 | LINK-0005 | 388.52 |

**t_entity_match_link_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LINK-0001 | LINK-0001 | LINK-0002 | Dimension Kind 01 |
| LINK-0002 | LINK-0001 | LINK-0008 | Encoding 02 |
| LINK-0003 | LINK-0001 | LINK-0009 | audit excerpt |
| LINK-0004 | LINK-0001 | LINK-0010 | es |
| LINK-0005 | LINK-0001 | LINK-0003 | manual |
| LINK-0006 | LINK-0001 | LINK-0006 | count |
| LINK-0007 | LINK-0002 | LINK-0002 | Dimension Kind 07 |
| LINK-0008 | LINK-0002 | LINK-0008 | Encoding 08 |

Beyond mere identification, the system captures the nuanced characteristics of these entities through a structured schema of *attr* (attribute names) and *attr type* (data types), which dictate how metadata is interpreted, validated, and stored. For instance, a match between entities might be quantified by a confidence score typed as xsd:decimal, yielding precise numerical evidence such as 0.249 or 448.20, while temporal provenance is preserved through xsd:dateTime attributes that record events with strict formatting, such as 2025-02-02T03:38:54. When textual context is required, the *misc* column accommodates free-form data, storing critical details like audit excerpt or Dimension Kind 01, thereby bridging the gap between rigid schema enforcement and the unstructured nature of real-world operational logs.

The dynamic relationships between system components are governed by the interplay of *subject*, *target*, and *role*, which collectively define the permissions, workflows, and allocation states inherent to each operation. In allocation workflows, a specific allocation_id acts as the *subject*—such as RUN-0001 designated for a batch-etl-override—while the at_run_identifier_id serves as the *target*, pointing to an execution context like exec-token-4491 or job-context-99a. The *role* column then specifies the nature of this interaction, assigning functional designations such as observer or reviewer to the linkage, ensuring that every connection, whether it involves an MLopsSpecialist coordinating with a PrometheusCollector or a SecurityAnalyst responding to an incident, is explicitly categorized and auditable.

**t_allocation_at_run_id**

| id | allocation |
| --- | --- |
| RUN-0001 | batch-etl-override |
| RUN-0002 | model-training-v3 |
| RUN-0003 | data-sync-nightly |
| RUN-0004 | ml-inference-run |
| RUN-0005 | ml-inference-run |
| RUN-0006 | batch-etl-override |
| RUN-0007 | ml-inference-run |

**t_allocation_at_run_id_at_run_identifier**

| id | at_run_identifier |
| --- | --- |
| RUN-0001 | exec-token-4491 |
| RUN-0002 | job-context-99a |
| RUN-0003 | tx-id-7721b |
| RUN-0004 | run-7a2b4c1d |
| RUN-0005 | run-hash-66d |
| RUN-0006 | epoch-tag-8812 |
| RUN-0007 | pipeline-run-zeta |
| RUN-0008 | job-context-99a |

**t_allocation_at_run_id__at_run_identifier**

| id | allocation_id | at_run_identifier_id | role |
| --- | --- | --- | --- |
| RUN-0001 | RUN-0001 | RUN-0003 | observer |
| RUN-0002 | RUN-0004 | RUN-0007 | reviewer |
| RUN-0003 | RUN-0003 | RUN-0004 | observer |
| RUN-0004 | RUN-0005 | RUN-0001 | observer |
| RUN-0005 | RUN-0007 | RUN-0002 | contributor |
| RUN-0006 | RUN-0007 | RUN-0001 | reviewer |
| RUN-0007 | RUN-0003 | RUN-0005 | owner |
| RUN-0008 | RUN-0007 | RUN-0004 | contributor |

Finally, the operational ecosystem is populated by a diverse array of agents—ranging from LegacySystemBridge to Human operators like the IncidentTriage unit—each bound by specific *license* agreements that dictate their deployment, usage rights, and intellectual property obligations. Software components are rigorously cataloged under licenses such as GPL-3.0, Apache-2.0, MPL-2.0, or MIT, ensuring that compliance standards are transparently managed across the entire stack. The *misc* column further enriches this registry by capturing secondary designations, such as ComplianceChecker or ModelValidator, which provide additional context for the agents' functions. By maintaining a comprehensive ledger of these agents, their licenses, and their operational roles, the framework guarantees that every interaction within the system is traceable, legally compliant, and aligned with organizational governance standards.

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