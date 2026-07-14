## Support Systems and Operational Integrity

Industrial facilities rely on an intricate web of support systems to maintain safe, compliant operations. Each support system carries a unique identifier, a descriptive name, and a set of operational attributes that determine its readiness and regulatory standing. The integrity of these systems is monitored through limiting conditions of operation, hazard barriers, maintenance schedules, and temporary deployment protocols. When a support system deviates from its expected state, the facility must evaluate alternate arrangements, document acceptability, and execute corrective or preventive maintenance. This chapter describes the data model that captures these relationships, using concrete records to illustrate how operational status, regulatory compliance, and maintenance activities interlock across the facility's infrastructure.

**Table `support_systems`**

| support_system_id | system_identifier | system_name | is_technical_specification_bound | operability_status | risk_significance_level | limiting_condition_of_operation_id | hazard_barrier_id | maintenance_action_id | alternate_temporary_system_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | SYS-2050 | Legacy Programme D | false | Operable | High | 100 | 1 | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | SYS-2051 | Regional Standard | true | Inoperable | Medium | 101 | 2 | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | SYS-2052 | Seasonal Framework | false | Degraded | Low | 102 | 3 | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | SYS-2053 | Integrated Protocol A | true | Functional | Negligible | 103 | 4 | 103 | 4 | 2025-04-16 09:14:00 |

The support systems table forms the central registry of the facility's infrastructure. Each row represents a distinct system, identified by a code such as SYS-2050 or SYS-2053, and given a human-readable name like Legacy Programme D or Integrated Protocol A. The boolean flag `is_technical_specification_bound` indicates whether the system falls under formal technical specification requirements; systems like Regional Standard and Integrated Protocol A carry this designation, while Legacy Programme D and Seasonal Framework do not. Operability status ranges from Operable through Functional to Degraded and Inoperable, providing a quick snapshot of system health. Risk significance levels—High, Medium, Low, and Negligible—help prioritize attention. Every support system links outward to a limiting condition of operation, a hazard barrier, a maintenance action, and an alternate temporary system, creating a network of dependencies that the views below make explicit.

**Table `limiting_condition_of_operations`**

| limiting_condition_of_operation_id | lco_identifier | lco_description | is_necessary | is_required | compliance_deadline | support_system_id |
|---|---|---|---|---|---|---|
| 100 | LCO-2337 | Regional Model | true | true | 2023-02-24T01:03:00 | 1 |
| 101 | LCO-2343 | Seasonal Cluster D | false | false | 2024-07-08T08:20:00 | 2 |
| 102 | LCO-2349 | Integrated Review | true | true | 2025-12-19T15:37:00 | 3 |
| 103 | LCO-2355 | Extended Initiative | false | false | 2022-05-03T22:54:00 | 4 |

Limiting conditions of operations define the minimum functional requirements a support system must satisfy to remain in compliance. Each LCO carries an identifier such as LCO-2337 and a description like Regional Model. The flags `is_necessary` and `is_required` distinguish between conditions that are fundamentally essential versus those that are procedurally mandated. For instance, LCO-2337 and LCO-2349 are both necessary and required, whereas LCO-2343 and LCO-2355 are neither. A compliance deadline anchors each condition to a specific date and time, ranging from 2022-05-03 for Extended Initiative to 2025-12-19 for Integrated Review. Each LCO is associated with exactly one support system, establishing a one-to-one correspondence that the support system limitings condition of operation view captures directly.

**Table `hazard_barriers`**

| id | barrier_identifier | barrier_type | effectiveness_rating | regulatory_initiative | support_system_id |
|---|---|---|---|---|---|
| 1 | BAR-2641 | Physical | 4.20 | RITSTF-427 | 1 |
| 2 | BAR-2643 | Administrative | 7.40 | TSTF-372 | 2 |
| 3 | BAR-2645 | Procedural | 10.60 | GL-91-18 | 3 |
| 4 | BAR-2647 | Physical | 13.80 | RITSTF-427 | 4 |

Hazard barriers provide the physical, administrative, or procedural safeguards that mitigate risk within a support system. The barrier identifier, such as BAR-2641, serves as the primary key, while the barrier type classifies the nature of the safeguard—Physical, Administrative, or Procedural. Effectiveness ratings, expressed as decimal values, quantify barrier performance; values in the dataset range from 4.20 for BAR-2641 to 13.80 for BAR-2647. Regulatory initiatives like RITSTF-427, TSTF-372, and GL-91-18 tie each barrier to a specific regulatory framework. Every barrier is linked to a single support system, and the support system hazard barrier view presents this association alongside the system's own attributes.

**Table `alternate_temporary_systems`**

| alternate_temporary_system_id | ats_identifier | deployment_date | removal_date | acceptability_status | evaluation_criteria_met | support_system_id | evaluation_id |
|---|---|---|---|---|---|---|---|
| 1 | ATS-2400 | 2023-02-14T13:51:00 | 2024-11-27T22:18:00 | Accepted | true | 1 | comi |
| 2 | ATS-2404 | 2024-07-25T20:08:00 | 2025-04-11T05:35:00 | PendingEvaluation | false | 2 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 |
| 3 | ATS-2408 | 2025-12-09T03:25:00 | 2022-09-22T12:52:00 | Rejected | true | 3 | 1210-0007-S |
| 4 | ATS-2412 | 2022-05-20T10:42:00 | 2023-02-06T19:09:00 | Accepted | false | 4 | 727042 |

When a primary support system is unavailable or degraded, alternate temporary systems provide interim capability. Each ATS record includes an identifier such as ATS-2400, deployment and removal timestamps that define its active window, and an acceptability status of Accepted, PendingEvaluation, or Rejected. The boolean `evaluation_criteria_met` indicates whether the system satisfied the required evaluation thresholds at the time of deployment. Each alternate temporary system references its parent support system and an associated acceptability evaluation, forming a chain from deployment through evaluation to final acceptability determination.

**Table `acceptability_evaluations`**

| evaluation_id | evaluation_date | risk_consideration_included | result | evaluator_licensee_id | alternate_temporary_system_id |
|---|---|---|---|---|---|
| comi | 2023-10-09T21:51:00 | true | Pass | 10207146 | 1 |
| eff2857c-8fcb-11eb-924d-9cd76263cbd0 | 2024-03-20T04:08:00 | false | Fail | 3001009030190 | 2 |
| 1210-0007-S | 2025-08-04T11:25:00 | true | ConditionalPass | 10445637 | 3 |
| 727042 | 2022-01-15T18:42:00 | false | Pass | 195339 | 4 |

Acceptability evaluations document the formal review of an alternate temporary system's suitability. The evaluation identifier, which in this dataset takes varied forms such as comi, eff2857c-8fcb-11eb-924d-9cd76263cbd0, or 1210-0007-S, serves as the primary key. An evaluation date records when the review occurred, while `risk_consideration_included` notes whether risk analysis was part of the assessment. The result field captures the outcome—Pass, Fail, or ConditionalPass—and the `evaluator_licensee_id` identifies the reviewing authority. Each evaluation is tied to exactly one alternate temporary system, and the alternate temporary system acceptability evaluation view joins these records to show the full evaluation context.

**Table `maintenance_actions`**

| id | maintenance_id | start_date | end_date | action_type | completes_on_schedule | support_system_id | limiting_condition_of_operation_id |
|---|---|---|---|---|---|---|---|
| 100 | 7731858 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | Preventive | true | 1 | 100 |
| 101 | 790469 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | Corrective | false | 2 | 101 |
| 102 | ChIJva--s4Ft5kcRMr0K3mWJ1W4 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | Inspection | true | 3 | 102 |
| 103 | 1996917 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | Preventive | false | 4 | 103 |

Maintenance actions record the interventions performed on support systems to restore or preserve their operability. Each action carries a maintenance identifier, a start date, and an end date. The action type—Preventive, Corrective, or Inspection—describes the nature of the work. The `completes_on_schedule` flag indicates whether the maintenance concluded within the planned timeframe. Notably, several records show end dates preceding start dates, suggesting either scheduling anomalies or retrospective data entry. Each maintenance action links to its parent support system and, in some cases, to a limiting condition of operation, enabling the maintenance action limiting condition of operation view to trace maintenance back to its regulatory driver.

**Table `snubbers`**

| snubber_id | location | is_operable | is_functional | regulatory_address | support_system_id | maintenance_action_id |
|---|---|---|---|---|---|---|
| 195345 | extended-location-99 | false | false | seasonal-regulato-41 | 1 | 100 |
| influencing | integrated-location-100 | true | true | regional-regulato-42 | 2 | 101 |
| X7ON99 | seasonal-location-101 | false | false | legacy-regulato-43 | 3 | 102 |
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | regional-location-102 | true | true | compact-regulato-44 | 4 | 103 |

Snubbers are mechanical devices installed on support systems to restrict motion and absorb dynamic loads. The snubber table records each device's identifier, its type, the support system to which it is attached, and its installation and removal dates. The snubber support system view joins snubber records to their parent systems, while the snubber maintenance action view cross-references snubbers with the maintenance actions that affected them, revealing which interventions targeted specific snubber installations.

**View `support_system_limiting_condition_of_operation_view`**

```sql
CREATE VIEW support_system_limiting_condition_of_operation_view AS
SELECT a.support_system_id, a.system_identifier, a.system_name, a.is_technical_specification_bound, b.limiting_condition_of_operation_id AS operation_limiting_condition_of_operation_id, b.lco_identifier AS operation_lco_identifier, b.lco_description AS operation_lco_description
FROM support_systems a JOIN limiting_condition_of_operations b ON a.limiting_condition_of_operation_id = b.limiting_condition_of_operation_id;
```

| support_system_id | system_identifier | system_name | is_technical_specification_bound | operation_limiting_condition_of_operation_id | operation_lco_identifier | operation_lco_description |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | Legacy Programme D | false | 100 | LCO-2337 | Regional Model |
| 2 | SYS-2051 | Regional Standard | true | 101 | LCO-2343 | Seasonal Cluster D |
| 3 | SYS-2052 | Seasonal Framework | false | 102 | LCO-2349 | Integrated Review |
| 4 | SYS-2053 | Integrated Protocol A | true | 103 | LCO-2355 | Extended Initiative |

This view joins support systems with their corresponding limiting conditions of operation, answering the question: which LCO governs each support system, and what are the compliance implications? The first row pairs SYS-2050 (Legacy Programme D) with LCO-2337 (Regional Model), a condition that is both necessary and required with a compliance deadline of 2023-02-24. The second row links SYS-2051 (Regional Standard) to LCO-2343 (Seasonal Cluster D), which is neither necessary nor required and carries a deadline of 2024-07-08. These pairings allow operators to quickly assess whether a system's LCO imposes strict regulatory obligations or represents a more flexible procedural requirement.

**View `support_system_hazard_barrier_view`**

```sql
CREATE VIEW support_system_hazard_barrier_view AS
SELECT a.support_system_id, a.system_identifier, a.system_name, a.is_technical_specification_bound, b.id AS barrier_id, b.barrier_identifier AS barrier_barrier_identifier, b.barrier_type AS barrier_barrier_type
FROM support_systems a JOIN hazard_barriers b ON a.hazard_barrier_id = b.id;
```

| support_system_id | system_identifier | system_name | is_technical_specification_bound | barrier_id | barrier_barrier_identifier | barrier_barrier_type |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | Legacy Programme D | false | 1 | BAR-2641 | Physical |
| 2 | SYS-2051 | Regional Standard | true | 2 | BAR-2643 | Administrative |
| 3 | SYS-2052 | Seasonal Framework | false | 3 | BAR-2645 | Procedural |
| 4 | SYS-2053 | Integrated Protocol A | true | 4 | BAR-2647 | Physical |

By joining support systems with their hazard barriers, this view reveals the safeguarding posture of each system. SYS-2050 (Legacy Programme D) is protected by BAR-2641, a Physical barrier with an effectiveness rating of 4.20 under the RITSTF-427 regulatory initiative. In contrast, SYS-2052 (Seasonal Framework) is associated with BAR-2645, a Procedural barrier rated at 10.60 and governed by GL-91-18. The variation in barrier types and effectiveness ratings across systems highlights the facility's differentiated approach to hazard mitigation, where some systems rely on robust physical safeguards while others depend on procedural controls with higher measured effectiveness.

**View `support_system_maintenance_action_view`**

```sql
CREATE VIEW support_system_maintenance_action_view AS
SELECT a.support_system_id, a.system_identifier, a.system_name, a.is_technical_specification_bound, b.id AS action_id, b.maintenance_id AS action_maintenance_id, b.start_date AS action_start_date
FROM support_systems a JOIN maintenance_actions b ON a.maintenance_action_id = b.id;
```

| support_system_id | system_identifier | system_name | is_technical_specification_bound | action_id | action_maintenance_id | action_start_date |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | Legacy Programme D | false | 100 | 7731858 | 2022-09-05T20:24:00 |
| 2 | SYS-2051 | Regional Standard | true | 101 | 790469 | 2023-02-16T03:41:00 |
| 3 | SYS-2052 | Seasonal Framework | false | 102 | ChIJva--s4Ft5kcRMr0K3mWJ1W4 | 2024-07-27T10:58:00 |
| 4 | SYS-2053 | Integrated Protocol A | true | 103 | 1996917 | 2025-12-11T17:15:00 |

This view connects support systems to their maintenance actions, providing a clear picture of which interventions have been performed on each system. SYS-2050 (Legacy Programme D) has a Preventive maintenance action (ID 7731858) that started on 2022-09-05 and completed on schedule. SYS-2051 (Regional Standard) received Corrective maintenance (ID 790469) that did not complete on schedule, with a start date of 2023-02-16 and an end date of 2023-02-12. The misalignment between start and end dates in several records warrants investigation, as it may indicate scheduling discrepancies or data entry errors that could affect maintenance tracking accuracy.

**View `support_system_alternate_temporary_system_view`**

```sql
CREATE VIEW support_system_alternate_temporary_system_view AS
SELECT a.support_system_id, a.system_identifier, a.system_name, a.is_technical_specification_bound, b.alternate_temporary_system_id AS system_alternate_temporary_system_id, b.ats_identifier AS system_ats_identifier, b.deployment_date AS system_deployment_date
FROM support_systems a JOIN alternate_temporary_systems b ON a.alternate_temporary_system_id = b.alternate_temporary_system_id;
```

| support_system_id | system_identifier | system_name | is_technical_specification_bound | system_alternate_temporary_system_id | system_ats_identifier | system_deployment_date |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | Legacy Programme D | false | 1 | ATS-2400 | 2023-02-14T13:51:00 |
| 2 | SYS-2051 | Regional Standard | true | 2 | ATS-2404 | 2024-07-25T20:08:00 |
| 3 | SYS-2052 | Seasonal Framework | false | 3 | ATS-2408 | 2025-12-09T03:25:00 |
| 4 | SYS-2053 | Integrated Protocol A | true | 4 | ATS-2412 | 2022-05-20T10:42:00 |

This view links support systems to their alternate temporary systems, showing which interim arrangements have been deployed for each primary system. SYS-2050 (Legacy Programme D) has ATS-2400, which was deployed on 2023-02-14 and removed on 2024-11-27, with an Accepted status and evaluation criteria met. SYS-2052 (Seasonal Framework) has ATS-2408, deployed on 2025-12-09 but removed on 2022-09-22—a temporal inversion that suggests either a data anomaly or a retroactively recorded deployment. The acceptability status of Rejected for this record indicates that the alternate system did not meet operational requirements.

**View `limiting_condition_of_operation_support_system_view`**

```sql
CREATE VIEW limiting_condition_of_operation_support_system_view AS
SELECT a.limiting_condition_of_operation_id, a.lco_identifier, a.lco_description, a.is_necessary, b.support_system_id AS system_support_system_id, b.system_identifier AS system_system_identifier, b.system_name AS system_system_name
FROM limiting_condition_of_operations a JOIN support_systems b ON a.support_system_id = b.support_system_id;
```

| limiting_condition_of_operation_id | lco_identifier | lco_description | is_necessary | system_support_system_id | system_system_identifier | system_system_name |
|---|---|---|---|---|---|---|
| 100 | LCO-2337 | Regional Model | true | 1 | SYS-2050 | Legacy Programme D |
| 101 | LCO-2343 | Seasonal Cluster D | false | 2 | SYS-2051 | Regional Standard |
| 102 | LCO-2349 | Integrated Review | true | 3 | SYS-2052 | Seasonal Framework |
| 103 | LCO-2355 | Extended Initiative | false | 4 | SYS-2053 | Integrated Protocol A |

This view reverses the perspective, starting from limiting conditions of operation and showing the support systems they govern. LCO-2337 (Regional Model) governs SYS-2050 (Legacy Programme D), a system that is Operable with High risk significance. LCO-2355 (Extended Initiative) governs SYS-2053 (Integrated Protocol A), which is Functional with Negligible risk significance. This orientation is useful for compliance officers who need to trace from a regulatory requirement down to the specific systems it affects, ensuring that no governed system falls outside the scope of oversight.

**View `hazard_barrier_support_system_view`**

```sql
CREATE VIEW hazard_barrier_support_system_view AS
SELECT a.id, a.barrier_identifier, a.barrier_type, a.effectiveness_rating, b.support_system_id AS system_support_system_id, b.system_identifier AS system_system_identifier, b.system_name AS system_system_name
FROM hazard_barriers a JOIN support_systems b ON a.support_system_id = b.support_system_id;
```

| id | barrier_identifier | barrier_type | effectiveness_rating | system_support_system_id | system_system_identifier | system_system_name |
|---|---|---|---|---|---|---|
| 1 | BAR-2641 | Physical | 4.20 | 1 | SYS-2050 | Legacy Programme D |
| 2 | BAR-2643 | Administrative | 7.40 | 2 | SYS-2051 | Regional Standard |
| 3 | BAR-2645 | Procedural | 10.60 | 3 | SYS-2052 | Seasonal Framework |
| 4 | BAR-2647 | Physical | 13.80 | 4 | SYS-2053 | Integrated Protocol A |

Starting from hazard barriers, this view maps each safeguard to its parent support system. BAR-2643 (Administrative type, effectiveness 7.40, regulatory initiative TSTF-372) protects SYS-2051 (Regional Standard), a system marked as Inoperable with Medium risk significance. The combination of an Administrative barrier type and an Inoperable status raises questions about whether the barrier's effectiveness is sufficient to compensate for the system's degraded state. BAR-2647, a Physical barrier with the highest effectiveness rating of 13.80, protects SYS-2053 (Integrated Protocol A), which carries the lowest risk significance level.

**View `alternate_temporary_system_support_system_view`**

```sql
CREATE VIEW alternate_temporary_system_support_system_view AS
SELECT a.alternate_temporary_system_id, a.ats_identifier, a.deployment_date, a.removal_date, b.support_system_id AS system_support_system_id, b.system_identifier AS system_system_identifier, b.system_name AS system_system_name
FROM alternate_temporary_systems a JOIN support_systems b ON a.support_system_id = b.support_system_id;
```

| alternate_temporary_system_id | ats_identifier | deployment_date | removal_date | system_support_system_id | system_system_identifier | system_system_name |
|---|---|---|---|---|---|---|
| 1 | ATS-2400 | 2023-02-14T13:51:00 | 2024-11-27T22:18:00 | 1 | SYS-2050 | Legacy Programme D |
| 2 | ATS-2404 | 2024-07-25T20:08:00 | 2025-04-11T05:35:00 | 2 | SYS-2051 | Regional Standard |
| 3 | ATS-2408 | 2025-12-09T03:25:00 | 2022-09-22T12:52:00 | 3 | SYS-2052 | Seasonal Framework |
| 4 | ATS-2412 | 2022-05-20T10:42:00 | 2023-02-06T19:09:00 | 4 | SYS-2053 | Integrated Protocol A |

This view presents alternate temporary systems alongside their parent support systems, providing a consolidated view of interim arrangements. ATS-2404 (deployed 2024-07-25, removed 2025-04-11) serves SYS-2051 (Regional Standard) and carries a PendingEvaluation status with evaluation criteria not met. The pending status suggests that the alternate system's acceptability remains unresolved, which could pose compliance risks if the primary system remains unavailable. ATS-2412, serving SYS-2053 (Integrated Protocol A), was Accepted despite evaluation criteria not being met, indicating that acceptability can be granted under exceptional circumstances.

**View `alternate_temporary_system_acceptability_evaluation_view`**

```sql
CREATE VIEW alternate_temporary_system_acceptability_evaluation_view AS
SELECT a.alternate_temporary_system_id, a.ats_identifier, a.deployment_date, a.removal_date, b.evaluation_id AS evaluation_evaluation_id, b.evaluation_date AS evaluation_evaluation_date, b.risk_consideration_included AS evaluation_risk_consideration_included
FROM alternate_temporary_systems a JOIN acceptability_evaluations b ON a.evaluation_id = b.evaluation_id;
```

| alternate_temporary_system_id | ats_identifier | deployment_date | removal_date | evaluation_evaluation_id | evaluation_evaluation_date | evaluation_risk_consideration_included |
|---|---|---|---|---|---|---|
| 1 | ATS-2400 | 2023-02-14T13:51:00 | 2024-11-27T22:18:00 | comi | 2023-10-09T21:51:00 | true |
| 2 | ATS-2404 | 2024-07-25T20:08:00 | 2025-04-11T05:35:00 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | 2024-03-20T04:08:00 | false |
| 3 | ATS-2408 | 2025-12-09T03:25:00 | 2022-09-22T12:52:00 | 1210-0007-S | 2025-08-04T11:25:00 | true |
| 4 | ATS-2412 | 2022-05-20T10:42:00 | 2023-02-06T19:09:00 | 727042 | 2022-01-15T18:42:00 | false |

This view joins alternate temporary systems with their acceptability evaluations, showing the full evaluation lifecycle for each interim arrangement. ATS-2400 was evaluated on 2023-10-09 by licensee 10207146, with risk consideration included and a Pass result. ATS-2404 was evaluated on 2024-03-20 by licensee 3001009030190, with risk consideration excluded and a Fail result—consistent with its PendingEvaluation status in the alternate temporary systems table. The evaluation identifiers vary in format, from alphanumeric codes like comi to UUIDs and structured identifiers, reflecting the diverse origins of evaluation records.

**View `acceptability_evaluation_alternate_temporary_system_view`**

```sql
CREATE VIEW acceptability_evaluation_alternate_temporary_system_view AS
SELECT a.evaluation_id, a.evaluation_date, a.risk_consideration_included, a.result, b.alternate_temporary_system_id AS system_alternate_temporary_system_id, b.ats_identifier AS system_ats_identifier, b.deployment_date AS system_deployment_date
FROM acceptability_evaluations a JOIN alternate_temporary_systems b ON a.alternate_temporary_system_id = b.alternate_temporary_system_id;
```

| evaluation_id | evaluation_date | risk_consideration_included | result | system_alternate_temporary_system_id | system_ats_identifier | system_deployment_date |
|---|---|---|---|---|---|---|
| comi | 2023-10-09T21:51:00 | true | Pass | 1 | ATS-2400 | 2023-02-14T13:51:00 |
| eff2857c-8fcb-11eb-924d-9cd76263cbd0 | 2024-03-20T04:08:00 | false | Fail | 2 | ATS-2404 | 2024-07-25T20:08:00 |
| 1210-0007-S | 2025-08-04T11:25:00 | true | ConditionalPass | 3 | ATS-2408 | 2025-12-09T03:25:00 |
| 727042 | 2022-01-15T18:42:00 | false | Pass | 4 | ATS-2412 | 2022-05-20T10:42:00 |

Reversing the join, this view starts from acceptability evaluations and shows the alternate temporary systems they assessed. The evaluation comi (dated 2023-10-09, result Pass) corresponds to ATS-2400, which was Accepted and had evaluation criteria met. The evaluation 1210-0007-S (dated 2025-08-04, result ConditionalPass) corresponds to ATS-2408, which carries a Rejected status—suggesting that a ConditionalPass evaluation result does not necessarily translate to an Accepted deployment status. This discrepancy highlights the distinction between evaluation outcomes and operational acceptability determinations.

**View `maintenance_action_support_system_view`**

```sql
CREATE VIEW maintenance_action_support_system_view AS
SELECT a.id, a.maintenance_id, a.start_date, a.end_date, b.support_system_id AS system_support_system_id, b.system_identifier AS system_system_identifier, b.system_name AS system_system_name
FROM maintenance_actions a JOIN support_systems b ON a.support_system_id = b.support_system_id;
```

| id | maintenance_id | start_date | end_date | system_support_system_id | system_system_identifier | system_system_name |
|---|---|---|---|---|---|---|
| 100 | 7731858 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | SYS-2050 | Legacy Programme D |
| 101 | 790469 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | SYS-2051 | Regional Standard |
| 102 | ChIJva--s4Ft5kcRMr0K3mWJ1W4 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | SYS-2052 | Seasonal Framework |
| 103 | 1996917 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | SYS-2053 | Integrated Protocol A |

This view connects maintenance actions to their parent support systems, providing a maintenance history for each system. SYS-2050 (Legacy Programme D) received Preventive maintenance (ID 100) that completed on schedule, while SYS-2053 (Integrated Protocol A) received Preventive maintenance (ID 103) that did not complete on schedule. The action type Inspection appears for SYS-2052 (Seasonal Framework), with a maintenance identifier that follows a Google Places-style format (ChIJva--s4Ft5kcRMr0K3mWJ1W4), suggesting integration with external scheduling or asset management systems.

**View `maintenance_action_limiting_condition_of_operation_view`**

```sql
CREATE VIEW maintenance_action_limiting_condition_of_operation_view AS
SELECT a.id, a.maintenance_id, a.start_date, a.end_date, b.limiting_condition_of_operation_id AS operation_limiting_condition_of_operation_id, b.lco_identifier AS operation_lco_identifier, b.lco_description AS operation_lco_description
FROM maintenance_actions a JOIN limiting_condition_of_operations b ON a.limiting_condition_of_operation_id = b.limiting_condition_of_operation_id;
```

| id | maintenance_id | start_date | end_date | operation_limiting_condition_of_operation_id | operation_lco_identifier | operation_lco_description |
|---|---|---|---|---|---|---|
| 100 | 7731858 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 100 | LCO-2337 | Regional Model |
| 101 | 790469 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 101 | LCO-2343 | Seasonal Cluster D |
| 102 | ChIJva--s4Ft5kcRMr0K3mWJ1W4 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 102 | LCO-2349 | Integrated Review |
| 103 | 1996917 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 103 | LCO-2355 | Extended Initiative |

This view links maintenance actions to their governing limiting conditions of operation, answering the question: which LCO drove each maintenance intervention? Maintenance action 100 (Preventive, on schedule) is associated with LCO-2337 (Regional Model), a necessary and required condition. Maintenance action 101 (Corrective, not on schedule) is associated with LCO-2343 (Seasonal Cluster D), which is neither necessary nor required. This relationship allows auditors to verify that maintenance activities are properly aligned with regulatory requirements and that corrective actions are taken for systems under strict LCO governance.

**View `snubber_support_system_view`**

```sql
CREATE VIEW snubber_support_system_view AS
SELECT a.snubber_id, a.location, a.is_operable, a.is_functional, b.support_system_id AS system_support_system_id, b.system_identifier AS system_system_identifier, b.system_name AS system_system_name
FROM snubbers a JOIN support_systems b ON a.support_system_id = b.support_system_id;
```

| snubber_id | location | is_operable | is_functional | system_support_system_id | system_system_identifier | system_system_name |
|---|---|---|---|---|---|---|
| 195345 | extended-location-99 | false | false | 1 | SYS-2050 | Legacy Programme D |
| influencing | integrated-location-100 | true | true | 2 | SYS-2051 | Regional Standard |
| X7ON99 | seasonal-location-101 | false | false | 3 | SYS-2052 | Seasonal Framework |
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | regional-location-102 | true | true | 4 | SYS-2053 | Integrated Protocol A |

This view joins snubber records to their parent support systems, showing which systems have snubber installations and when those installations occurred. The snubber table captures the device identifier, type, and the temporal window of its deployment on the support system. By joining to the support systems table, operators can assess whether snubber coverage is adequate across all critical systems and whether any snubber installations have expired or require replacement.

**View `snubber_maintenance_action_view`**

```sql
CREATE VIEW snubber_maintenance_action_view AS
SELECT a.snubber_id, a.location, a.is_operable, a.is_functional, b.id AS action_id, b.maintenance_id AS action_maintenance_id, b.start_date AS action_start_date
FROM snubbers a JOIN maintenance_actions b ON a.maintenance_action_id = b.id;
```

| snubber_id | location | is_operable | is_functional | action_id | action_maintenance_id | action_start_date |
|---|---|---|---|---|---|---|
| 195345 | extended-location-99 | false | false | 100 | 7731858 | 2022-09-05T20:24:00 |
| influencing | integrated-location-100 | true | true | 101 | 790469 | 2023-02-16T03:41:00 |
| X7ON99 | seasonal-location-101 | false | false | 102 | ChIJva--s4Ft5kcRMr0K3mWJ1W4 | 2024-07-27T10:58:00 |
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | regional-location-102 | true | true | 103 | 1996917 | 2025-12-11T17:15:00 |

This view cross-references snubbers with maintenance actions, revealing which interventions targeted specific snubber installations. If a maintenance action's scope includes snubber work, this view surfaces the connection, allowing maintenance planners to verify that snubber inspections or replacements are properly scheduled and documented. The view supports lifecycle tracking of snubbers by linking their installation and removal dates to the maintenance actions that triggered those events.

The data model described in this chapter captures the operational reality of support system management: systems are governed by limiting conditions, protected by hazard barriers, maintained through scheduled and corrective actions, and supported by temporary arrangements when primary systems are unavailable. The views provide multiple entry points into this network, allowing operators, compliance officers, and maintenance planners to query the data from whichever perspective their role demands. The concrete records—SYS-2050 through SYS-2053, their associated LCOs, barriers, and maintenance actions—demonstrate how the model handles real-world complexity, including temporal anomalies, varied evaluation outcomes, and differentiated regulatory requirements. Together, these tables and views form a comprehensive record of the facility's support system integrity, enabling informed decision-making across all operational domains.