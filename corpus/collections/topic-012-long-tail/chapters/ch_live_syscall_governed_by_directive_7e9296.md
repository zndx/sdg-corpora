---
chapter_id: ch_live_syscall_governed_by_directive_7e9296
topic_id: 12
family: 07_long_tail
cited_terms: ['syscall_governed_by_directive', 'labrun_produces_measurement', 'agent_software_or_human']
model: engine-refine
---

Directive governance in the syscall observability layer is structured around a typed attribute model that binds policy metadata to individual system calls. Each directive—identified by a unique identifier such as DIRE-0001 through DIRE-0004—anchors a set of attributes whose names (effective_date, enforcement, mandatory, priority) and attr types (xsd:date, xsd:string, xsd:boolean, xsd:integer) are declared in a canonical registry. The attr type enforces schema-level discipline: an effective_date attribute carries an xsd:date value like 2023-07-14 or 2025-03-29, a mandatory flag is stored as an xsd:boolean with values true or false, and a priority field is an xsd:integer taking values such as 4 or 80. This separation of attribute definition from attribute value permits the same directive to carry heterogeneous metadata—dates, booleans, integers, and free-form strings—without schema drift. The entity column in the value tables serves as the foreign key linking each attribute instance back to its governing directive, ensuring that every value, whether the boolean true attached to entity DIRE-0001 and attr_id DIRE-0003 or the integer 443 bound to entity DIRE-0002 and attr_id DIRE-0005, is traceable to the originating policy.

**t_syscall_governed_by_directive**

| id | syscall |
| --- | --- |
| DIRE-0001 | mmap |
| DIRE-0002 | connect |
| DIRE-0003 | epoll_wait |
| DIRE-0004 | listen |
| DIRE-0005 | socket |
| DIRE-0006 | bind |

**t_syscall_governed_by_directive_attr**

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

**t_syscall_governed_by_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | true |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | false |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | true |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |

**t_syscall_governed_by_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2023-07-14 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2025-03-29 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2024-05-27 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2024-04-25 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2025-03-30 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2024-07-29 |

**t_syscall_governed_by_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 4 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 80 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 4 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 443 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 5 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 564 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 1 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 613 |

**t_syscall_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | fr |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | nightly summary |

The value tables themselves are partitioned by attr type, a design choice that reflects the operational reality that policy attributes are queried, validated, and reported in strongly typed contexts. Boolean values reside in a dedicated table keyed by identifier, entity_id, and attr_id, with the value column (misc) holding the literal true or false. Date values occupy a parallel table where the same composite key resolves to an xsd:date such as 2024-05-27 or 2024-04-25. Integer attributes—priority levels, port numbers, or threshold counts—are stored in a third value table, capturing entries like 4, 80, or 443. Free-form text, including strings such as Encoding 01, Enforcement 02, audit excerpt, and fr, is held in a varchar value table. This type-partitioned architecture eliminates the need for runtime type coercion and guarantees that downstream consumers—whether compliance dashboards, audit exporters, or automated policy engines—receive values in the expected format.

Measurement of directive enforcement is captured in a fact table that records the operational characteristics of each labrun. A labrun, identified by a unique identifier such as MEAS-0001 through MEAS-0004, represents a discrete execution of a syscall under a specific directive and is linked to its parent via the labrun_key foreign key. The duration_seconds column quantifies the wall-clock time of the execution, with observed values ranging from 4308.22 seconds (MEAS-0002) to 5155.73 seconds (MEAS-0004), while the exit_code column records the termination status—values such as 122, 691, 566, and 3 indicate varying degrees of success, failure, or signal-driven termination. The retry_count column, with values spanning 12 to 265, captures how many times the system attempted to satisfy the syscall before reaching a terminal state. Together, duration_seconds, exit_code, and retry_count form the core telemetry of directive enforcement, enabling operators to assess not only whether a syscall was permitted or denied but also the cost and reliability of that enforcement.

**fact_labrun**

| id | labrun_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| MEAS-0001 | MEAS-0002 | 4856.18 | 122 | 265 |
| MEAS-0002 | MEAS-0006 | 4308.22 | 691 | 244 |
| MEAS-0003 | MEAS-0002 | 4764.89 | 566 | 106 |
| MEAS-0004 | MEAS-0005 | 5155.73 | 3 | 12 |
| MEAS-0005 | MEAS-0002 | 385.91 | 81 | 197 |

The dimensional counterpart to the measurement fact table, dim_labrun, enriches each labrun with human-readable metadata. The labrun_label column provides a descriptive name—Labrun Label 01 through Labrun Label 04—while the labrun_category column assigns a categorical classification such as Labrun Category 01 through Labrun Category 04. These labels and categories serve as the primary axes for aggregation and reporting: an auditor can roll up duration_seconds and retry_count by labrun_category to identify which classes of executions are most resource-intensive or most prone to retries, and can correlate those findings with the underlying directive attributes (e.g., whether directives with higher priority values or later effective_dates produce different exit_code distributions). The identifier in dim_labrun is the foreign key that joins the dimension to the fact table, ensuring that every measurement can be contextualized within its categorical and descriptive framework.

**dim_labrun**

| id | labrun_label | labrun_category |
| --- | --- | --- |
| MEAS-0001 | Labrun Label 01 | Labrun Category 01 |
| MEAS-0002 | Labrun Label 02 | Labrun Category 02 |
| MEAS-0003 | Labrun Label 03 | Labrun Category 03 |
| MEAS-0004 | Labrun Label 04 | Labrun Category 04 |
| MEAS-0005 | Labrun Label 05 | Labrun Category 05 |
| MEAS-0006 | Labrun Label 06 | Labrun Category 06 |

The governance model extends beyond directives and measurements to encompass the agents—both software and human—that execute, monitor, or are subject to the policies. The agent registry assigns each agent a unique identifier (HUMA-0001 through HUMA-0004) and a license (GPL-3.0, Apache-2.0, MPL-2.0, MIT) that governs its distribution and modification rights. The agent column records the agent's functional role—LegacySystemBridge, SecurityAnalyst, MLopsSpecialist, AirflowDAGRunner—while additional columns (agent_2, agent_3) capture secondary and tertiary affiliations, such as PlatformEngineer, IncidentResponder, PrometheusCollector, or LegalHoldService. The name column provides a human-readable designation (ComplianceChecker, IncidentTriage, LogAggregator, ModelValidator) that is used in reports and audit trails. This agent dimension is critical for accountability: every labrun execution, every syscall interception, and every directive evaluation can be attributed to a specific agent, whose license and role determine the applicable compliance obligations and audit requirements.

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