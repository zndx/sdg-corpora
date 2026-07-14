## Domain Modeling and Relational Materialization in Workplace Safety Management

The workplace safety management domain captures the interplay between organizational policies, human resources, physical environments, and operational activities within a facility. At its core, the model tracks who does what, where, under which rules, and what goes wrong when things deviate from plan. Seven base tables materialize this domain: `health_and_safety_policies`, `workplace_activities`, `workers`, `safety_incidents`, `facility_zones`, `harassment_policies`, and `violence_policies`. These tables are linked through foreign-key relationships that encode cardinality-bounded associations — each workplace activity belongs to exactly one worker, one facility zone, and one health-and-safety policy; each safety incident is tied to a worker, a facility zone, and an investigator; each worker is assigned to one workplace activity, reports to one supervisor, and is governed by one harassment policy. The views then reconstruct denormalized facts by joining these normalized tables back together, answering operational questions that span entity boundaries.

**Table `health_and_safety_policies`**

| id | policy_identifier | effective_date | issuing_authority | compliance_standard | policy_status | workplace_activity_id |
|---|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | extended-issuing-33 | primary-complian-88 | active | 1000 |
| 2 | POL-2486 | 2024-07-25 | integrated-issuing-34 | adaptive-complian-89 | draft | 1001 |
| 3 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | distributed-complian-90 | superseded | 1002 |
| 4 | POL-2498 | 2022-05-20 | regional-issuing-36 | baseline-complian-91 | pending_review | 1003 |

The `health_and_safety_policies` table is the policy anchor of the model. Each row represents a formal safety directive issued by an authority and tied to a specific workplace activity. The primary key `id` is a surrogate integer (values 1 through 4), while the business identifier `policy_identifier` carries human-readable codes such as `POL-2480` and `POL-2498`. Temporal governance is captured by `effective_date` (e.g., `2023-02-14`) and `policy_status` enumerates the lifecycle state of a policy — `active`, `draft`, `superseded`, and `pending_review` appear in the data. The `issuing_authority` column names the originating body (`extended-issuing-33`, `integrated-issuing-34`, etc.), and `compliance_standard` references the regulatory framework (`primary-complian-88`, `adaptive-complian-89`). The critical foreign key `workplace_activity_id` binds each policy to exactly one workplace activity, establishing a one-to-one association from policy to activity. This means a policy like `POL-2480` (id 1, status `active`) is exclusively applicable to workplace activity 1000.

**Table `workplace_activities`**

| id | activity_code | location_zone | risk_level | scheduled_date | status | worker_id | facility_zone_id | health_and_safety_policy_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 12585 | integrated-location-40 | low | 2024-11-27T22:18:00 | planned | 1 | 1 | 1 |
| 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | seasonal-location-41 | medium | 2025-04-11T05:35:00 | in_progress | 2 | 2 | 2 |
| 1002 | 195368 | regional-location-42 | high | 2022-09-22T12:52:00 | completed | 3 | 3 | 3 |
| 1003 | 9085257 | legacy-location-43 | critical | 2023-02-06T19:09:00 | suspended | 4 | 4 | 4 |

`workplace_activities` is the central operational entity — the nexus where workers, zones, and policies converge. Its surrogate primary key `id` takes values 1000 through 1003. The `activity_code` column is notably heterogeneous: some entries are plain integers (`12585`, `195368`), while others are UUIDs (`2bc26b8a-8fcc-11eb-924d-9cd76263cbd0`). The `location_zone` column provides a textual descriptor of the activity's setting (`integrated-location-40`, `seasonal-location-41`), and `risk_level` classifies the inherent danger as `low`, `medium`, `high`, or `critical`. The `scheduled_date` column records when the activity is planned or executed (e.g., `2024-11-27T22:18:00`), and `status` tracks its execution state: `planned`, `in_progress`, `completed`, or `suspended`. Three foreign keys anchor this table: `worker_id` references `workers.worker_id`, `facility_zone_id` references `facility_zones.facility_zone_id`, and `health_and_safety_policy_id` references `health_and_safety_policies.id`. Each workplace activity thus belongs to exactly one worker, one facility zone, and one health-and-safety policy — a cardinality-one constraint enforced by the schema.

**Table `workers`**

| worker_id | role | department | safety_training_status | certification_expiry | workplace_activity_id | reports_to_worker_id | harassment_policy_id |
|---|---|---|---|---|---|---|---|
| 1 | employee | adaptive-departme-89 | completed | 2023-02-10 | 1000 | 1 | 1000 |
| 2 | manager | distributed-departme-90 | in_progress | 2024-07-21 | 1001 | 2 | 1001 |
| 3 | supervisor | baseline-departme-91 | not_started | 2025-12-05 | 1002 | 3 | 1002 |
| 4 | contractor | pilot-departme-92 | expired | 2022-05-16 | 1003 | 4 | 1003 |

The `workers` table models the human element of the safety domain. Its primary key is `worker_id` (values 1 through 4), and each row describes an individual's role within the organization. The `role` column distinguishes `employee`, `manager`, `supervisor`, and `contractor` — four distinct employment categories. The `department` column assigns each worker to a functional unit (`adaptive-departme-89`, `distributed-departme-90`, etc.). Safety readiness is tracked through `safety_training_status` (`completed`, `in_progress`, `not_started`, `expired`) and `certification_expiry` (e.g., `2023-02-10`). Three foreign keys define the worker's contextual relationships: `workplace_activity_id` links the worker to their assigned activity (e.g., worker 1 is assigned to activity 1000); `reports_to_worker_id` creates a self-referential hierarchy where each worker reports to exactly one supervisor (worker 1 reports to worker 1, worker 2 to worker 2, and so on); and `harassment_policy_id` binds the worker to a specific harassment policy. The one-to-one cardinality between worker and harassment policy means worker 1 is governed by harassment policy 1000, and worker 4 by policy 1003.

**Table `safety_incidents`**

| id | incident_id | incident_type | severity_level | reported_date | investigation_status | worker_id | facility_zone_id | investigated_by_worker_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1336174 | harassment | minor | 2025-04-27T03:09:00 | open | 1 | 1 | 1 |
| 2 | state_uk_4 | violence | moderate | 2022-09-11T10:26:00 | under_review | 2 | 2 | 2 |
| 3 | 2933483 | unsafe_condition | severe | 2023-02-22T17:43:00 | closed | 3 | 3 | 3 |
| 4 | 2986243 | near_miss | critical | 2024-07-06T00:00:00 | escalated | 4 | 4 | 4 |

`safety_incidents` records deviations from normal operations — the negative events that the safety management system exists to track and investigate. Its surrogate primary key `id` runs from 1 to 4, while `incident_id` provides a business-level identifier (`1336174`, `state_uk_4`, `2933483`). The `incident_type` column classifies the nature of the event: `harassment`, `violence`, `unsafe_condition`, and `near_miss`. The `severity_level` column (`minor`, `moderate`, `severe`, `critical`) quantifies the impact, and `reported_date` timestamps when the incident was logged (e.g., `2025-04-27T03:09:00`). The `investigation_status` column tracks the investigative lifecycle: `open`, `under_review`, `closed`, and `escalated`. Three foreign keys anchor each incident: `worker_id` identifies the affected worker, `facility_zone_id` identifies where it occurred, and `investigated_by_worker_id` identifies the investigator. Each safety incident is thus associated with exactly one worker, one facility zone, and one investigator — all drawn from the `workers` table.

**Table `facility_zones`**

| facility_zone_id | zone_code | zone_name | occupancy_limit | hazard_rating | last_inspection_date | safety_incident_id | workplace_activity_id |
|---|---|---|---|---|---|---|---|
| 1 | 974943 | Pilot Series | 21 | low | 2025-04-12 | 1 | 1000 |
| 2 | 2002007020170 | Baseline Assessment | 27 | medium | 2022-09-23 | 2 | 1001 |
| 3 | 9424913 | Distributed Survey A | 33 | high | 2023-02-07 | 3 | 1002 |
| 4 | lu_tax_code_template_m14 | Adaptive Corridor | 39 | low | 2024-07-18 | 4 | 1003 |

`facility_zones` models the physical environment — the discrete areas of a facility where activities take place and incidents occur. Its primary key is `facility_zone_id` (values 1 through 4). The `zone_code` column provides a machine-readable identifier (`974943`, `2002007020170`, `lu_tax_code_template_m14`), while `zone_name` gives a human-readable label (`Pilot Series`, `Baseline Assessment`, `Distributed Survey A`, `Adaptive Corridor`). Operational parameters include `occupancy_limit` (integer values 21 through 39) and `hazard_rating` (`low`, `medium`, `high`). The `last_inspection_date` column records the most recent safety inspection (`2025-04-12`, `2022-09-23`, etc.). Two foreign keys link the zone to operational context: `safety_incident_id` associates the zone with a specific incident, and `workplace_activity_id` ties the zone to a workplace activity. Each facility zone thus has exactly one associated safety incident and one associated workplace activity in the current data.

**Table `harassment_policies`**

| id | policy_identifier | effective_date | issuing_authority | compliance_standard | policy_status | worker_id | safety_incident_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | POL-2480 | 2023-02-14 | extended-issuing-33 | primary-complian-88 | active | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | POL-2486 | 2024-07-25 | integrated-issuing-34 | adaptive-complian-89 | draft | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | distributed-complian-90 | superseded | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | POL-2498 | 2022-05-20 | regional-issuing-36 | baseline-complian-91 | pending_review | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

`harassment_policies` is a specialized policy table that mirrors the structure of `health_and_safety_policies` but is scoped to harassment-specific directives. Its primary key `id` runs from 1000 to 1003, and it shares the same structural columns: `policy_identifier` (`POL-2480` through `POL-2498`), `effective_date`, `issuing_authority`, `compliance_standard`, and `policy_status`. The two additional foreign keys `worker_id` and `safety_incident_id` create direct associations: each harassment policy is assigned to exactly one worker and one safety incident. The temporal audit columns `created_at` and `updated_at` record when each policy was authored and last modified (e.g., policy 1000 was created on `2025-01-01 00:14:00` and updated on `2025-01-02 00:41:00`). This table thus serves as a bridge between the harassment policy domain and both the worker and incident domains.

**Table `violence_policies`**

| id | policy_identifier | effective_date | issuing_authority | compliance_standard | policy_status | worker_id | safety_incident_id |
|---|---|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | extended-issuing-33 | primary-complian-88 | active | 1 | 1 |
| 2 | POL-2486 | 2024-07-25 | integrated-issuing-34 | adaptive-complian-89 | draft | 2 | 2 |
| 3 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | distributed-complian-90 | superseded | 3 | 3 |
| 4 | POL-2498 | 2022-05-20 | regional-issuing-36 | baseline-complian-91 | pending_review | 4 | 4 |

`violence_policies` follows the same structural pattern as `harassment_policies` — it is a specialized policy table for violence-related directives. Although the data sample does not display rows from this table, its schema is identical: surrogate primary key `id`, business identifier `policy_identifier`, `effective_date`, `issuing_authority`, `compliance_standard`, `policy_status`, foreign keys `worker_id` and `safety_incident_id`, and audit columns `created_at` and `updated_at`. The existence of this table alongside `harassment_policies` indicates a deliberate domain separation between harassment and violence policy management, even though both share the same attribute vocabulary.

The foreign-key topology of the base tables forms a star-like structure centered on `workplace_activities`. Each workplace activity pulls in exactly one worker, one facility zone, and one health-and-safety policy. Each safety incident pulls in one worker (the affected party), one facility zone (the location), and one worker (the investigator). Each worker pulls in one workplace activity, one supervisor, and one harassment policy. Each facility zone pulls in one safety incident and one workplace activity. Each harassment policy pulls in one worker and one safety incident. This topology ensures that every operational fact — who is doing what, where, under which rules, and what went wrong — is captured in a single normalized row and can be reconstructed through joins.

**View `v_health_and_safety_policy_workplace_activity`**

```sql
CREATE VIEW v_health_and_safety_policy_workplace_activity AS
SELECT a.id, a.policy_identifier, a.effective_date, a.issuing_authority, b.id AS activity_id, b.activity_code AS activity_activity_code, b.location_zone AS activity_location_zone
FROM health_and_safety_policies a JOIN workplace_activities b ON a.workplace_activity_id = b.id;
```

| id | policy_identifier | effective_date | issuing_authority | activity_id | activity_activity_code | activity_location_zone |
|---|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | extended-issuing-33 | 1000 | 12585 | integrated-location-40 |
| 2 | POL-2486 | 2024-07-25 | integrated-issuing-34 | 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | seasonal-location-41 |
| 3 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | 1002 | 195368 | regional-location-42 |
| 4 | POL-2498 | 2022-05-20 | regional-issuing-36 | 1003 | 9085257 | legacy-location-43 |

The view `v_health_and_safety_policy_workplace_activity` joins `health_and_safety_policies` with `workplace_activities` on the `workplace_activity_id` foreign key. It answers the question: "Which health-and-safety policy governs which workplace activity?" Reading the first row, policy `POL-2480` (id 1, status `active`, issued by `extended-issuing-33` under standard `primary-complian-88`) governs workplace activity 1000, which is a `low`-risk activity at `integrated-location-40` scheduled for `2024-11-27T22:18:00` with status `planned`. The second row shows policy `POL-2486` (id 2, status `draft`) governing activity 1001, a `medium`-risk activity at `seasonal-location-41` with status `in_progress`. This view materializes the policy-to-activity binding that is otherwise implicit in the foreign key.

**View `v_workplace_activity_worker`**

```sql
CREATE VIEW v_workplace_activity_worker AS
SELECT a.id, a.activity_code, a.location_zone, a.risk_level, b.worker_id AS worker_worker_id, b.role AS worker_role, b.department AS worker_department
FROM workplace_activities a JOIN workers b ON a.worker_id = b.worker_id;
```

| id | activity_code | location_zone | risk_level | worker_worker_id | worker_role | worker_department |
|---|---|---|---|---|---|---|
| 1000 | 12585 | integrated-location-40 | low | 1 | employee | adaptive-departme-89 |
| 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | seasonal-location-41 | medium | 2 | manager | distributed-departme-90 |
| 1002 | 195368 | regional-location-42 | high | 3 | supervisor | baseline-departme-91 |
| 1003 | 9085257 | legacy-location-43 | critical | 4 | contractor | pilot-departme-92 |

`v_workplace_activity_worker` joins `workplace_activities` with `workers` on `worker_id`. It answers: "Which worker is assigned to which workplace activity?" The first row reveals that worker 1, an `employee` in `adaptive-departme-89` with `completed` safety training, is assigned to activity 1000. The second row shows worker 2, a `manager` in `distributed-departme-90` with `in_progress` training, assigned to activity 1001. The third row pairs worker 3, a `supervisor` in `baseline-departme-91` whose training is `not_started`, with activity 1002 (a `high`-risk, `completed` activity). The fourth row links worker 4, a `contractor` in `pilot-departme-92` with `expired` certification, to activity 1003 (a `critical`-risk, `suspended` activity). This view is essential for workforce planning and compliance auditing.

**View `v_workplace_activity_facility_zone`**

```sql
CREATE VIEW v_workplace_activity_facility_zone AS
SELECT a.id, a.activity_code, a.location_zone, a.risk_level, b.facility_zone_id AS zone_facility_zone_id, b.zone_code AS zone_zone_code, b.zone_name AS zone_zone_name
FROM workplace_activities a JOIN facility_zones b ON a.facility_zone_id = b.facility_zone_id;
```

| id | activity_code | location_zone | risk_level | zone_facility_zone_id | zone_zone_code | zone_zone_name |
|---|---|---|---|---|---|---|
| 1000 | 12585 | integrated-location-40 | low | 1 | 974943 | Pilot Series |
| 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | seasonal-location-41 | medium | 2 | 2002007020170 | Baseline Assessment |
| 1002 | 195368 | regional-location-42 | high | 3 | 9424913 | Distributed Survey A |
| 1003 | 9085257 | legacy-location-43 | critical | 4 | lu_tax_code_template_m14 | Adaptive Corridor |

`v_workplace_activity_facility_zone` joins `workplace_activities` with `facility_zones` on `facility_zone_id`. It answers: "In which facility zone does each workplace activity take place?" The first row shows activity 1000 occurring in zone 1 (`Pilot Series`, code `974943`, occupancy limit 21, `low` hazard rating, last inspected `2025-04-12`). The second row places activity 1001 in zone 2 (`Baseline Assessment`, code `2002007020170`, occupancy limit 27, `medium` hazard rating). The third row associates activity 1002 with zone 3 (`Distributed Survey A`, code `9424913`, occupancy limit 33, `high` hazard rating). The fourth row links activity 1003 to zone 4 (`Adaptive Corridor`, code `lu_tax_code_template_m14`, occupancy limit 39, `low` hazard rating). This view supports spatial risk analysis by combining activity risk levels with zone hazard ratings.

**View `v_workplace_activity_health_and_safety_policy`**

```sql
CREATE VIEW v_workplace_activity_health_and_safety_policy AS
SELECT a.id, a.activity_code, a.location_zone, a.risk_level, b.id AS policy_id, b.policy_identifier AS policy_policy_identifier, b.effective_date AS policy_effective_date
FROM workplace_activities a JOIN health_and_safety_policies b ON a.health_and_safety_policy_id = b.id;
```

| id | activity_code | location_zone | risk_level | policy_id | policy_policy_identifier | policy_effective_date |
|---|---|---|---|---|---|---|
| 1000 | 12585 | integrated-location-40 | low | 1 | POL-2480 | 2023-02-14 |
| 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | seasonal-location-41 | medium | 2 | POL-2486 | 2024-07-25 |
| 1002 | 195368 | regional-location-42 | high | 3 | POL-2492 | 2025-12-09 |
| 1003 | 9085257 | legacy-location-43 | critical | 4 | POL-2498 | 2022-05-20 |

`v_workplace_activity_health_and_safety_policy` joins `workplace_activities` with `health_and_safety_policies` on `health_and_safety_policy_id`. It answers: "Under which health-and-safety policy is each workplace activity conducted?" The first row shows activity 1000 conducted under policy `POL-2480` (id 1, status `active`, effective `2023-02-14`, issued by `extended-issuing-33`). The second row links activity 1001 to policy `POL-2486` (id 2, status `draft`, effective `2024-07-25`). The third row associates activity 1002 with policy `POL-2492` (id 3, status `superseded`, effective `2025-12-09`). The fourth row ties activity 1003 to policy `POL-2498` (id 4, status `pending_review`, effective `2022-05-20`). This view is critical for compliance verification — it allows auditors to confirm that every active activity is governed by an active policy.

**View `v_worker_workplace_activity`**

```sql
CREATE VIEW v_worker_workplace_activity AS
SELECT a.worker_id, a.role, a.department, a.safety_training_status, b.id AS activity_id, b.activity_code AS activity_activity_code, b.location_zone AS activity_location_zone
FROM workers a JOIN workplace_activities b ON a.workplace_activity_id = b.id;
```

| worker_id | role | department | safety_training_status | activity_id | activity_activity_code | activity_location_zone |
|---|---|---|---|---|---|---|
| 1 | employee | adaptive-departme-89 | completed | 1000 | 12585 | integrated-location-40 |
| 2 | manager | distributed-departme-90 | in_progress | 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | seasonal-location-41 |
| 3 | supervisor | baseline-departme-91 | not_started | 1002 | 195368 | regional-location-42 |
| 4 | contractor | pilot-departme-92 | expired | 1003 | 9085257 | legacy-location-43 |

`v_worker_workplace_activity` joins `workers` with `workplace_activities` on `workplace_activity_id`. It answers: "What workplace activity is each worker assigned to?" The first row shows worker 1 (employee, `adaptive-departme-89`, training `completed`, certification expiring `2023-02-10`) assigned to activity 1000 (`12585`, `low` risk, `planned`). The second row links worker 2 (manager, `distributed-departme-90`, training `in_progress`, certification expiring `2024-07-21`) to activity 1001 (`2bc26b8a-8fcc-11eb-924d-9cd76263cbd0`, `medium` risk, `in_progress`). The third row associates worker 3 (supervisor, `baseline-departme-91`, training `not_started`, certification expiring `2025-12-05`) with activity 1002 (`195368`, `high` risk, `completed`). The fourth row ties worker 4 (contractor, `pilot-departme-92`, training `expired`, certification expiring `2022-05-16`) to activity 1003 (`9085257`, `critical` risk, `suspended`). This view is the inverse of `v_workplace_activity_worker` and is useful for worker-centric reporting.

**View `v_worker_worker`**

```sql
CREATE VIEW v_worker_worker AS
SELECT a.worker_id, a.role, a.department, a.safety_training_status, b.worker_id AS worker_worker_id, b.role AS worker_role, b.department AS worker_department
FROM workers a JOIN workers b ON a.reports_to_worker_id = b.worker_id;
```

| worker_id | role | department | safety_training_status | worker_worker_id | worker_role | worker_department |
|---|---|---|---|---|---|---|
| 1 | employee | adaptive-departme-89 | completed | 1 | employee | adaptive-departme-89 |
| 2 | manager | distributed-departme-90 | in_progress | 2 | manager | distributed-departme-90 |
| 3 | supervisor | baseline-departme-91 | not_started | 3 | supervisor | baseline-departme-91 |
| 4 | contractor | pilot-departme-92 | expired | 4 | contractor | pilot-departme-92 |

`v_worker_worker` performs a self-join on the `workers` table through the `reports_to_worker_id` foreign key. It answers: "Who reports to whom in the organizational hierarchy?" The first row shows worker 1 reporting to worker 1 (self-reporting, which may indicate a top-level role or a data artifact). The second row shows worker 2 reporting to worker 2, the third row shows worker 3 reporting to worker 3, and the fourth row shows worker 4 reporting to worker 4. In this dataset, each worker reports to themselves, suggesting either a flat organizational structure or that the reporting relationships are not yet populated. In a production system, this view would reveal the chain of command — for example, a contractor reporting to a supervisor, who reports to a manager, who reports to a director.

**View `v_worker_harassment_policy`**

```sql
CREATE VIEW v_worker_harassment_policy AS
SELECT a.worker_id, a.role, a.department, a.safety_training_status, b.id AS policy_id, b.policy_identifier AS policy_policy_identifier, b.effective_date AS policy_effective_date
FROM workers a JOIN harassment_policies b ON a.harassment_policy_id = b.id;
```

| worker_id | role | department | safety_training_status | policy_id | policy_policy_identifier | policy_effective_date |
|---|---|---|---|---|---|---|
| 1 | employee | adaptive-departme-89 | completed | 1000 | POL-2480 | 2023-02-14 |
| 2 | manager | distributed-departme-90 | in_progress | 1001 | POL-2486 | 2024-07-25 |
| 3 | supervisor | baseline-departme-91 | not_started | 1002 | POL-2492 | 2025-12-09 |
| 4 | contractor | pilot-departme-92 | expired | 1003 | POL-2498 | 2022-05-20 |

`v_worker_harassment_policy` joins `workers` with `harassment_policies` on `harassment_policy_id`. It answers: "Which harassment policy governs each worker?" The first row shows worker 1 (employee, `adaptive-departme-89`) governed by harassment policy 1000 (`POL-2480`, status `active`, effective `2023-02-14`, issued by `extended-issuing-33`). The second row links worker 2 (manager, `distributed-departme-90`) to policy 1001 (`POL-2486`, status `draft`, effective `2024-07-25`). The third row associates worker 3 (supervisor, `baseline-departme-91`) with policy 1002 (`POL-2492`, status `superseded`, effective `2025-12-09`). The fourth row ties worker 4 (contractor, `pilot-departme-92`) to policy 1003 (`POL-2498`, status `pending_review`, effective `2022-05-20`). This view is essential for HR compliance — it ensures every worker is covered by a harassment policy, regardless of their employment category.

**View `v_safety_incident_worker`**

```sql
CREATE VIEW v_safety_incident_worker AS
SELECT a.id, a.incident_id, a.incident_type, a.severity_level, b.worker_id AS worker_worker_id, b.role AS worker_role, b.department AS worker_department
FROM safety_incidents a JOIN workers b ON a.worker_id = b.worker_id;
```

| id | incident_id | incident_type | severity_level | worker_worker_id | worker_role | worker_department |
|---|---|---|---|---|---|---|
| 1 | 1336174 | harassment | minor | 1 | employee | adaptive-departme-89 |
| 2 | state_uk_4 | violence | moderate | 2 | manager | distributed-departme-90 |
| 3 | 2933483 | unsafe_condition | severe | 3 | supervisor | baseline-departme-91 |
| 4 | 2986243 | near_miss | critical | 4 | contractor | pilot-departme-92 |

`v_safety_incident_worker` joins `safety_incidents` with `workers` on `worker_id`. It answers: "Which worker is affected by each safety incident?" The first row shows incident 1 (type `harassment`, severity `minor`, reported `2025-04-27T03:09:00`, status `open`) affecting worker 1 (employee, `adaptive-departme-89`). The second row links incident 2 (type `violence`, severity `moderate`, reported `2022-09-11T10:26:00`, status `under_review`) to worker 2 (manager, `distributed-departme-90`). The third row associates incident 3 (type `unsafe_condition`, severity `severe`, reported `2023-02-22T17:43:00`, status `closed`) with worker 3 (supervisor, `baseline-departme-91`). The fourth row ties incident 4 (type `near_miss`, severity `critical`, reported `2024-07-06T00:00:00`, status `escalated`) to worker 4 (contractor, `pilot-departme-92`). This view supports incident response by identifying the affected party for each event.

**View `v_safety_incident_facility_zone`**

```sql
CREATE VIEW v_safety_incident_facility_zone AS
SELECT a.id, a.incident_id, a.incident_type, a.severity_level, b.facility_zone_id AS zone_facility_zone_id, b.zone_code AS zone_zone_code, b.zone_name AS zone_zone_name
FROM safety_incidents a JOIN facility_zones b ON a.facility_zone_id = b.facility_zone_id;
```

| id | incident_id | incident_type | severity_level | zone_facility_zone_id | zone_zone_code | zone_zone_name |
|---|---|---|---|---|---|---|
| 1 | 1336174 | harassment | minor | 1 | 974943 | Pilot Series |
| 2 | state_uk_4 | violence | moderate | 2 | 2002007020170 | Baseline Assessment |
| 3 | 2933483 | unsafe_condition | severe | 3 | 9424913 | Distributed Survey A |
| 4 | 2986243 | near_miss | critical | 4 | lu_tax_code_template_m14 | Adaptive Corridor |

`v_safety_incident_facility_zone` joins `safety_incidents` with `facility_zones` on `facility_zone_id`. It answers: "In which facility zone did each safety incident occur?" The first row shows incident 1 (harassment, `minor`) occurring in zone 1 (`Pilot Series`, code `974943`, occupancy limit 21, `low` hazard rating, last inspected `2025-04-12`). The second row links incident 2 (violence, `moderate`) to zone 2 (`Baseline Assessment`, code `2002007020170`, occupancy limit 27, `medium` hazard rating). The third row associates incident 3 (unsafe_condition, `severe`) with zone 3 (`Distributed Survey A`, code `9424913`, occupancy limit 33, `high` hazard rating). The fourth row ties incident 4 (near_miss, `critical`) to zone 4 (`Adaptive Corridor`, code `lu_tax_code_template_m14`, occupancy limit 39, `low` hazard rating). This view enables spatial incident analysis — for example, identifying whether high-hazard zones correlate with higher-severity incidents.

**View `v_facility_zone_safety_incident`**

```sql
CREATE VIEW v_facility_zone_safety_incident AS
SELECT a.facility_zone_id, a.zone_code, a.zone_name, a.occupancy_limit, b.id AS incident_id, b.incident_id AS incident_incident_id, b.incident_type AS incident_incident_type
FROM facility_zones a JOIN safety_incidents b ON a.safety_incident_id = b.id;
```

| facility_zone_id | zone_code | zone_name | occupancy_limit | incident_id | incident_incident_id | incident_incident_type |
|---|---|---|---|---|---|---|
| 1 | 974943 | Pilot Series | 21 | 1 | 1336174 | harassment |
| 2 | 2002007020170 | Baseline Assessment | 27 | 2 | state_uk_4 | violence |
| 3 | 9424913 | Distributed Survey A | 33 | 3 | 2933483 | unsafe_condition |
| 4 | lu_tax_code_template_m14 | Adaptive Corridor | 39 | 4 | 2986243 | near_miss |

`v_facility_zone_safety_incident` joins `facility_zones` with `safety_incidents` on `safety_incident_id`. It answers: "Which safety incident is associated with each facility zone?" This is the inverse of `v_safety_incident_facility_zone`. The first row shows zone 1 (`Pilot Series`, `low` hazard, last inspected `2025-04-12`) associated with incident 1 (harassment, `minor`, reported `2025-04-27T03:09:00`, status `open`). The second row links zone 2 (`Baseline Assessment`, `medium` hazard) to incident 2 (violence, `moderate`, status `under_review`). The third row associates zone 3 (`Distributed Survey A`, `high` hazard) with incident 3 (unsafe_condition, `severe`, status `closed`). The fourth row ties zone 4 (`Adaptive Corridor`, `low` hazard) to incident 4 (near_miss, `critical`, status `escalated`). This view is useful for zone-level risk dashboards that aggregate incident data by location.

**View `v_facility_zone_workplace_activity`**

```sql
CREATE VIEW v_facility_zone_workplace_activity AS
SELECT a.facility_zone_id, a.zone_code, a.zone_name, a.occupancy_limit, b.id AS activity_id, b.activity_code AS activity_activity_code, b.location_zone AS activity_location_zone
FROM facility_zones a JOIN workplace_activities b ON a.workplace_activity_id = b.id;
```

| facility_zone_id | zone_code | zone_name | occupancy_limit | activity_id | activity_activity_code | activity_location_zone |
|---|---|---|---|---|---|---|
| 1 | 974943 | Pilot Series | 21 | 1000 | 12585 | integrated-location-40 |
| 2 | 2002007020170 | Baseline Assessment | 27 | 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | seasonal-location-41 |
| 3 | 9424913 | Distributed Survey A | 33 | 1002 | 195368 | regional-location-42 |
| 4 | lu_tax_code_template_m14 | Adaptive Corridor | 39 | 1003 | 9085257 | legacy-location-43 |

`v_facility_zone_workplace_activity` joins `facility_zones` with `workplace_activities` on `workplace_activity_id`. It answers: "Which workplace activity is associated with each facility zone?" The first row shows zone 1 (`Pilot Series`, occupancy limit 21, `low` hazard) associated with activity 1000 (`12585`, `low` risk, `planned`, scheduled `2024-11-27T22:18:00`). The second row links zone 2 (`Baseline Assessment`, occupancy limit 27, `medium` hazard) to activity 1001 (`2bc26b8a-8fcc-11eb-924d-9cd76263cbd0`, `medium` risk, `in_progress`). The third row associates zone 3 (`Distributed Survey A`, occupancy limit 33, `high` hazard) with activity 1002 (`195368`, `high` risk, `completed`). The fourth row ties zone 4 (`Adaptive Corridor`, occupancy limit 39, `low` hazard) to activity 1003 (`9085257`, `critical` risk, `suspended`). This view supports capacity planning by combining zone occupancy limits with activity risk profiles.

**View `v_harassment_policy_worker`**

```sql
CREATE VIEW v_harassment_policy_worker AS
SELECT a.id, a.policy_identifier, a.effective_date, a.issuing_authority, b.worker_id AS worker_worker_id, b.role AS worker_role, b.department AS worker_department
FROM harassment_policies a JOIN workers b ON a.worker_id = b.worker_id;
```

| id | policy_identifier | effective_date | issuing_authority | worker_worker_id | worker_role | worker_department |
|---|---|---|---|---|---|---|
| 1000 | POL-2480 | 2023-02-14 | extended-issuing-33 | 1 | employee | adaptive-departme-89 |
| 1001 | POL-2486 | 2024-07-25 | integrated-issuing-34 | 2 | manager | distributed-departme-90 |
| 1002 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | 3 | supervisor | baseline-departme-91 |
| 1003 | POL-2498 | 2022-05-20 | regional-issuing-36 | 4 | contractor | pilot-departme-92 |

`v_harassment_policy_worker` joins `harassment_policies` with `workers` on `worker_id`. It answers: "Which worker is governed by each harassment policy?" The first row shows harassment policy 1000 (`POL-2480`, status `active`, effective `2023-02-14`, issued by `extended-issuing-33`, created `2025-01-01 00:14:00`) governing worker 1 (employee, `adaptive-departme-89`, training `completed`). The second row links policy 1001 (`POL-2486`, status `draft`) to worker 2 (manager, `distributed-departme-90`, training `in_progress`). The third row associates policy 1002 (`POL-2492`, status `superseded`) with worker 3 (supervisor, `baseline-departme-91`, training `not_started`). The fourth row ties policy 1003 (`POL-2498`, status `pending_review`) to worker 4 (contractor, `pilot-departme-92`, training `expired`). This view is the inverse of `v_worker_harassment_policy` and is useful for policy-level compliance reporting.

**View `v_harassment_policy_safety_incident`**

```sql
CREATE VIEW v_harassment_policy_safety_incident AS
SELECT a.id, a.policy_identifier, a.effective_date, a.issuing_authority, b.id AS incident_id, b.incident_id AS incident_incident_id, b.incident_type AS incident_incident_type
FROM harassment_policies a JOIN safety_incidents b ON a.safety_incident_id = b.id;
```

| id | policy_identifier | effective_date | issuing_authority | incident_id | incident_incident_id | incident_incident_type |
|---|---|---|---|---|---|---|
| 1000 | POL-2480 | 2023-02-14 | extended-issuing-33 | 1 | 1336174 | harassment |
| 1001 | POL-2486 | 2024-07-25 | integrated-issuing-34 | 2 | state_uk_4 | violence |
| 1002 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | 3 | 2933483 | unsafe_condition |
| 1003 | POL-2498 | 2022-05-20 | regional-issuing-36 | 4 | 2986243 | near_miss |

`v_harassment_policy_safety_incident` joins `harassment_policies` with `safety_incidents` on `safety_incident_id`. It answers: "Which safety incident is associated with each harassment policy?" The first row shows harassment policy 1000 (`POL-2480`, status `active`) associated with incident 1 (type `harassment`, severity `minor`, reported `2025-04-27T03:09:00`, status `open`). The second row links policy 1001 (`POL-2486`, status `draft`) to incident 2 (type `violence`, severity `moderate`, status `under_review`). The third row associates policy 1002 (`POL-2492`, status `superseded`) with incident 3 (type `unsafe_condition`, severity `severe`, status `closed`). The fourth row ties policy 1003 (`POL-2498`, status `pending_review`) to incident 4 (type `near_miss`, severity `critical`, status `escalated`). This view reveals the relationship between harassment policy governance and incident types — for instance, policy 1000 is associated with a harassment incident, while policy 1001 is associated with a violence incident.

**View `v_violence_policy_worker`**

```sql
CREATE VIEW v_violence_policy_worker AS
SELECT a.id, a.policy_identifier, a.effective_date, a.issuing_authority, b.worker_id AS worker_worker_id, b.role AS worker_role, b.department AS worker_department
FROM violence_policies a JOIN workers b ON a.worker_id = b.worker_id;
```

| id | policy_identifier | effective_date | issuing_authority | worker_worker_id | worker_role | worker_department |
|---|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | extended-issuing-33 | 1 | employee | adaptive-departme-89 |
| 2 | POL-2486 | 2024-07-25 | integrated-issuing-34 | 2 | manager | distributed-departme-90 |
| 3 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | 3 | supervisor | baseline-departme-91 |
| 4 | POL-2498 | 2022-05-20 | regional-issuing-36 | 4 | contractor | pilot-departme-92 |

`v_violence_policy_worker` joins `violence_policies` with `workers` on `worker_id`. It answers: "Which worker is governed by each violence policy?" Although the data sample does not display rows from `violence_policies`, the view's structure mirrors `v_harassment_policy_worker`: each violence policy row would be joined with the worker referenced by its `worker_id` foreign key. In a production dataset, this view would reveal which employees, managers, supervisors, or contractors are covered by violence-specific policies, enabling targeted training and compliance audits.

**View `v_violence_policy_safety_incident`**

```sql
CREATE VIEW v_violence_policy_safety_incident AS
SELECT a.id, a.policy_identifier, a.effective_date, a.issuing_authority, b.id AS incident_id, b.incident_id AS incident_incident_id, b.incident_type AS incident_incident_type
FROM violence_policies a JOIN safety_incidents b ON a.safety_incident_id = b.id;
```

| id | policy_identifier | effective_date | issuing_authority | incident_id | incident_incident_id | incident_incident_type |
|---|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | extended-issuing-33 | 1 | 1336174 | harassment |
| 2 | POL-2486 | 2024-07-25 | integrated-issuing-34 | 2 | state_uk_4 | violence |
| 3 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | 3 | 2933483 | unsafe_condition |
| 4 | POL-2498 | 2022-05-20 | regional-issuing-36 | 4 | 2986243 | near_miss |

`v_violence_policy_safety_incident` joins `violence_policies` with `safety_incidents` on `safety_incident_id`. It answers: "Which safety incident is associated with each violence policy?" Like `v_violence_policy_worker`, this view's structure mirrors `v_harassment_policy_safety_incident`. In a production dataset, it would reveal whether violence policies are associated with violence-type incidents, harassment-type incidents, or other incident categories, providing insight into policy coverage and effectiveness.

The relational materialization of this domain follows a disciplined normalization pattern. Each entity type is represented by a single table with a surrogate primary key. Attributes that are intrinsic to the entity become columns; relationships that are cardinality-bounded (one-to-one or many-to-one) become foreign keys in the referencing table. No junction tables are needed because the domain does not require many-to-many relationships — each workplace activity has exactly one worker, one zone, and one policy; each incident has exactly one affected worker, one zone, and one investigator. The views then serve as denormalized lenses, joining the normalized tables to answer operational questions that span entity boundaries. Each view corresponds to a single join between two base tables, reconstructing a domain fact from its normalized components. This architecture balances data integrity (enforced by foreign keys) with query convenience (provided by views), ensuring that the schema remains both sound and usable.