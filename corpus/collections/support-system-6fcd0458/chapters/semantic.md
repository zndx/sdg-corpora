## Ontology-Grounded Relational Modelling of Support System Lifecycle Management

The domain under examination concerns the governance of engineered support systems within a regulated operational environment—specifically, the tracking of system identifiers, their operability states, the limiting conditions that constrain their use, the hazard barriers that mitigate risk, and the maintenance and temporary replacement actions that sustain compliance over time. Each support system is a first-class entity, identified by a human-readable code such as `SYS-2050` or `SYS-2053`, and is annotated with metadata that captures whether it is bound by a technical specification, its current operability status, and its risk significance level. The relational schema materialises this ontology through a set of base tables that are normalised to third normal form, linked by foreign keys that encode one-to-one and one-to-many relationships, and a suite of denormalised views that reconstruct domain facts for downstream consumption.

### Base Tables and Their Ontological Roles

The central entity is `support_systems`, which anchors the entire schema. Every other table either references a support system directly or is reachable through a chain of foreign keys originating from this table.

**Table `support_systems`**

| support_system_id | system_identifier | system_name | is_technical_specification_bound | operability_status | risk_significance_level | limiting_condition_of_operation_id | hazard_barrier_id | maintenance_action_id | alternate_temporary_system_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | SYS-2050 | Legacy Programme D | false | Operable | High | 100 | 1 | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | SYS-2051 | Regional Standard | true | Inoperable | Medium | 101 | 2 | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | SYS-2052 | Seasonal Framework | false | Degraded | Low | 102 | 3 | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | SYS-2053 | Integrated Protocol A | true | Functional | Negligible | 103 | 4 | 103 | 4 | 2025-04-16 09:14:00 |

The column `support_system_id` serves as the primary key and is an auto-incrementing integer (values 1 through 4 in the sample data). The column `system_identifier` carries the business key—`SYS-2050`, `SYS-2051`, and so on—while `system_name` provides a descriptive label such as "Legacy Programme D" or "Integrated Protocol A". The boolean flag `is_technical_specification_bound` distinguishes systems that are contractually constrained from those that are not; for instance, `SYS-2050` (id 1) is not bound, whereas `SYS-2051` (id 2) is. The `operability_status` column is a categorical attribute with values like `Operable`, `Inoperable`, `Degraded`, and `Functional`. The `risk_significance_level` column uses a four-level ordinal scale: `High`, `Medium`, `Low`, and `Negligible`. The timestamp `created_at` records when the record was inserted.

Critically, `support_systems` carries four nullable foreign-key columns—`limiting_condition_of_operation_id`, `hazard_barrier_id`, `maintenance_action_id`, and `alternate_temporary_system_id`—that point into the four companion tables. These columns encode a one-to-one relationship between a support system and each of its associated limiting condition, hazard barrier, maintenance action, and alternate temporary system. The presence of these columns means that every support system row is a hub from which four radial relationships emanate.

The table `limiting_condition_of_operations` captures the operational constraints that apply to a support system.

**Table `limiting_condition_of_operations`**

| limiting_condition_of_operation_id | lco_identifier | lco_description | is_necessary | is_required | compliance_deadline | support_system_id |
|---|---|---|---|---|---|---|
| 100 | LCO-2337 | Regional Model | true | true | 2023-02-24T01:03:00 | 1 |
| 101 | LCO-2343 | Seasonal Cluster D | false | false | 2024-07-08T08:20:00 | 2 |
| 102 | LCO-2349 | Integrated Review | true | true | 2025-12-19T15:37:00 | 3 |
| 103 | LCO-2355 | Extended Initiative | false | false | 2022-05-03T22:54:00 | 4 |

Its primary key is `limiting_condition_of_operation_id` (values 100–103). The business key `lco_identifier` carries codes like `LCO-2337` or `LCO-2349`. The `lco_description` column holds free-text labels such as "Regional Model" or "Integrated Review". Two boolean columns, `is_necessary` and `is_required`, encode distinct compliance dimensions; for example, LCO 100 has both flags set to `true`, while LCO 101 has both set to `false`. The `compliance_deadline` column stores an ISO-8601 timestamp (e.g., `2023-02-24T01:03:00`). The foreign key `support_system_id` creates a one-to-one link back to `support_systems`, meaning each limiting condition is associated with exactly one support system and vice versa.

The table `hazard_barriers` models the risk-mitigation mechanisms attached to a support system.

**Table `hazard_barriers`**

| id | barrier_identifier | barrier_type | effectiveness_rating | regulatory_initiative | support_system_id |
|---|---|---|---|---|---|
| 1 | BAR-2641 | Physical | 4.20 | RITSTF-427 | 1 |
| 2 | BAR-2643 | Administrative | 7.40 | TSTF-372 | 2 |
| 3 | BAR-2645 | Procedural | 10.60 | GL-91-18 | 3 |
| 4 | BAR-2647 | Physical | 13.80 | RITSTF-427 | 4 |

The primary key is `id` (values 1–4). The business key `barrier_identifier` carries codes such as `BAR-2641` or `BAR-2645`. The `barrier_type` column is categorical with values `Physical`, `Administrative`, and `Procedural`. The `effectiveness_rating` column is a numeric measure (e.g., 4.20, 7.40, 10.60, 13.80), and `regulatory_initiative` references a regulatory programme identifier like `RITSTF-427` or `GL-91-18`. The foreign key `support_system_id` again enforces a one-to-one relationship with `support_systems`.

The table `alternate_temporary_systems` records temporary replacement systems deployed in lieu of the primary support system.

**Table `alternate_temporary_systems`**

| alternate_temporary_system_id | ats_identifier | deployment_date | removal_date | acceptability_status | evaluation_criteria_met | support_system_id | evaluation_id |
|---|---|---|---|---|---|---|---|
| 1 | ATS-2400 | 2023-02-14T13:51:00 | 2024-11-27T22:18:00 | Accepted | true | 1 | comi |
| 2 | ATS-2404 | 2024-07-25T20:08:00 | 2025-04-11T05:35:00 | PendingEvaluation | false | 2 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 |
| 3 | ATS-2408 | 2025-12-09T03:25:00 | 2022-09-22T12:52:00 | Rejected | true | 3 | 1210-0007-S |
| 4 | ATS-2412 | 2022-05-20T10:42:00 | 2023-02-06T19:09:00 | Accepted | false | 4 | 727042 |

Its primary key is `alternate_temporary_system_id` (values 1–4). The business key `ats_identifier` carries codes like `ATS-2400` or `ATS-2408`. The columns `deployment_date` and `removal_date` are timestamps that delimit the deployment window; notably, the sample data contains a temporal anomaly where `removal_date` precedes `deployment_date` for ATS 3 (deployment `2025-12-09`, removal `2022-09-22`), which may indicate data entry error or a backdated correction. The `acceptability_status` column is categorical with values `Accepted`, `PendingEvaluation`, and `Rejected`. The boolean `evaluation_criteria_met` indicates whether formal evaluation criteria were satisfied. The foreign key `support_system_id` links the ATS to its parent support system, and the column `evaluation_id` is a nullable foreign key into `acceptability_evaluations`.

The table `acceptability_evaluations` stores the outcomes of formal evaluations of alternate temporary systems.

**Table `acceptability_evaluations`**

| evaluation_id | evaluation_date | risk_consideration_included | result | evaluator_licensee_id | alternate_temporary_system_id |
|---|---|---|---|---|---|
| comi | 2023-10-09T21:51:00 | true | Pass | 10207146 | 1 |
| eff2857c-8fcb-11eb-924d-9cd76263cbd0 | 2024-03-20T04:08:00 | false | Fail | 3001009030190 | 2 |
| 1210-0007-S | 2025-08-04T11:25:00 | true | ConditionalPass | 10445637 | 3 |
| 727042 | 2022-01-15T18:42:00 | false | Pass | 195339 | 4 |

Its primary key is `evaluation_id`, which is a string (not an integer) with values such as `comi`, `eff2857c-8fcb-11eb-924d-9cd76263cbd0`, `1210-0007-S`, and `727042`. The `evaluation_date` column stores an ISO-8601 timestamp. The boolean `risk_consideration_included` indicates whether risk was factored into the evaluation. The `result` column is categorical with values `Pass`, `Fail`, and `ConditionalPass`. The `evaluator_licensee_id` is an integer identifying the licensee who performed the evaluation (e.g., `10207146`, `3001009030190`). The foreign key `alternate_temporary_system_id` links the evaluation to its parent ATS, establishing a one-to-one relationship in the sample data.

The table `maintenance_actions` records maintenance activities performed on support systems.

**Table `maintenance_actions`**

| id | maintenance_id | start_date | end_date | action_type | completes_on_schedule | support_system_id | limiting_condition_of_operation_id |
|---|---|---|---|---|---|---|---|
| 100 | 7731858 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | Preventive | true | 1 | 100 |
| 101 | 790469 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | Corrective | false | 2 | 101 |
| 102 | ChIJva--s4Ft5kcRMr0K3mWJ1W4 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | Inspection | true | 3 | 102 |
| 103 | 1996917 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | Preventive | false | 4 | 103 |

Its primary key is `id` (values 100–103). The column `maintenance_id` is a business key with values like `7731858`, `790469`, `ChIJva--s4Ft5kcRMr0K3mWJ1W4`, and `1996917`. The columns `start_date` and `end_date` are timestamps delimiting the maintenance window; again, the sample data contains anomalies where `end_date` precedes `start_date` (e.g., maintenance 100: start `2022-09-05`, end `2022-09-01`). The `action_type` column is categorical with values `Preventive`, `Corrective`, and `Inspection`. The boolean `completes_on_schedule` indicates whether the maintenance was completed on time. The foreign key `support_system_id` links the action to its parent support system, and the nullable foreign key `limiting_condition_of_operation_id` links it to a limiting condition, creating a many-to-one relationship from maintenance actions to limiting conditions.

The table `snubbers` is a base table in the schema.

**Table `snubbers`**

| snubber_id | location | is_operable | is_functional | regulatory_address | support_system_id | maintenance_action_id |
|---|---|---|---|---|---|---|
| 195345 | extended-location-99 | false | false | seasonal-regulato-41 | 1 | 100 |
| influencing | integrated-location-100 | true | true | regional-regulato-42 | 2 | 101 |
| X7ON99 | seasonal-location-101 | false | false | legacy-regulato-43 | 3 | 102 |
| e6196808-8fd1-11eb-924d-9cd76263cbd0 | regional-location-102 | true | true | compact-regulato-44 | 4 | 103 |

In the provided data sample, this table is empty, but its structural role in the ontology is that of a component or sub-assembly entity that is associated with a support system. Its presence in the schema implies a one-to-many or one-to-one relationship with `support_systems`, and it participates in the view layer through `snubber_support_system_view` and `snubber_maintenance_action_view`.

### View Layer: Reconstructing Domain Facts

The view layer denormalises the base tables to answer specific analytical questions. Each view is a `SELECT` with `JOIN` clauses that reconstruct a domain fact from the normalised tables.

The view `support_system_limiting_condition_of_operation_view` joins `support_systems` to `limiting_condition_of_operations` on `support_system_id = limiting_condition_of_operation_id`. It answers the question: "What limiting condition applies to each support system?" Reading the first row, we see that `SYS-2050` (id 1) is associated with LCO `LCO-2337` ("Regional Model"), which is both necessary and required, with a compliance deadline of `2023-02-24T01:03:00`.

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

The view `support_system_hazard_barrier_view` joins `support_systems` to `hazard_barriers` on `support_system_id = hazard_barrier_id`. It answers: "What hazard barrier protects each support system?" The first row shows that `SYS-2050` (id 1) has a `Physical` barrier (`BAR-2641`) with an effectiveness rating of 4.20, governed by regulatory initiative `RITSTF-427`.

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

The view `support_system_maintenance_action_view` joins `support_systems` to `maintenance_actions` on `support_system_id = maintenance_action_id`. It answers: "What maintenance action is associated with each support system?" The first row reveals that `SYS-2050` (id 1) has a `Preventive` maintenance action (id 100, maintenance_id `7731858`) that was scheduled from `2022-09-05T20:24:00` to `2022-09-01T08:00:00` and completed on schedule.

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

The view `support_system_alternate_temporary_system_view` joins `support_systems` to `alternate_temporary_systems` on `support_system_id = alternate_temporary_system_id`. It answers: "What alternate temporary system is deployed for each support system?" The first row shows that `SYS-2050` (id 1) has ATS `ATS-2400`, deployed on `2023-02-14T13:51:00` and removed on `2024-11-27T22:18:00`, with an acceptability status of `Accepted` and evaluation criteria met.

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

The view `limiting_condition_of_operation_support_system_view` performs the inverse join: it starts from `limiting_condition_of_operations` and joins to `support_systems`. It answers: "Which support system is governed by each limiting condition?" The first row shows that LCO `LCO-2337` governs `SYS-2050` ("Legacy Programme D"), which is `Operable` with `High` risk significance.

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

The view `hazard_barrier_support_system_view` starts from `hazard_barriers` and joins to `support_systems`. It answers: "Which support system does each hazard barrier protect?" The first row shows that barrier `BAR-2641` (Physical, rating 4.20) protects `SYS-2050` ("Legacy Programme D").

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

The view `alternate_temporary_system_support_system_view` starts from `alternate_temporary_systems` and joins to `support_systems`. It answers: "Which support system does each alternate temporary system serve?" The first row shows that ATS `ATS-2400` serves `SYS-2050` ("Legacy Programme D"), which is `Operable` with `High` risk significance.

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

The view `alternate_temporary_system_acceptability_evaluation_view` joins `alternate_temporary_systems` to `acceptability_evaluations` on `alternate_temporary_system_id = evaluation_id`. It answers: "What is the evaluation outcome for each alternate temporary system?" The first row shows that ATS `ATS-2400` received evaluation `comi` on `2023-10-09T21:51:00`, with risk consideration included, resulting in `Pass`, evaluated by licensee `10207146`.

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

The view `acceptability_evaluation_alternate_temporary_system_view` performs the inverse join from `acceptability_evaluations` to `alternate_temporary_systems`. It answers: "Which alternate temporary system was evaluated in each evaluation?" The first row shows that evaluation `comi` pertains to ATS `ATS-2400`, which was deployed on `2023-02-14T13:51:00` and removed on `2024-11-27T22:18:00`, with status `Accepted`.

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

The view `maintenance_action_support_system_view` starts from `maintenance_actions` and joins to `support_systems`. It answers: "Which support system received each maintenance action?" The first row shows that maintenance action 100 (maintenance_id `7731858`, type `Preventive`) was performed on `SYS-2050` ("Legacy Programme D"), which is `Operable` with `High` risk significance.

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

The view `maintenance_action_limiting_condition_of_operation_view` joins `maintenance_actions` to `limiting_condition_of_operations` on `limiting_condition_of_operation_id`. It answers: "Which limiting condition is associated with each maintenance action?" The first row shows that maintenance action 100 is associated with LCO `LCO-2337` ("Regional Model"), which is both necessary and required.

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

The view `snubber_support_system_view` joins `snubbers` to `support_systems`. It answers: "Which support system is each snubber attached to?" Since the `snubbers` table is empty in the sample data, this view currently returns no rows, but its structure is designed to enumerate snubber-to-system associations when data is populated.

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

The view `snubber_maintenance_action_view` joins `snubbers` to `maintenance_actions`. It answers: "Which maintenance action is associated with each snubber?" Again, with an empty `snubbers` table, this view returns no rows, but it is structured to link snubber-level maintenance records to their parent actions when data exists.

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

### Synthesis

The schema models a support system as a hub entity with four radial one-to-one relationships: to a limiting condition of operation, a hazard barrier, a maintenance action, and an alternate temporary system. The alternate temporary system, in turn, has a one-to-one relationship to an acceptability evaluation. The maintenance action has an additional optional many-to-one relationship to a limiting condition, creating a cross-link between two of the radial arms. The `snubbers` table, though empty in the sample data, represents a component-level entity that is linked to both support systems and maintenance actions.

The view layer provides two perspectives for each relationship: a forward view that starts from the hub (`support_systems`) and reaches outward, and a reverse view that starts from the leaf entity and reaches back to the hub. This bidirectional coverage ensures that queries can be answered from either direction without requiring the application layer to construct joins manually. The schema is normalised to eliminate redundancy—each entity type has its own table—and the foreign keys enforce referential integrity at the database level. The use of string primary keys in `acceptability_evaluations` (e.g., `comi`, `eff2857c-8fcb-11eb-924d-9cd76263cbd0`) contrasts with the integer primary keys in all other tables, reflecting the heterogeneous nature of evaluation identifiers in the source domain.