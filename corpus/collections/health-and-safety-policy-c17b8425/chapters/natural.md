## Occupational Health, Safety, and Compliance Management

Organizations that manage multi-site operations must coordinate three interlocking concerns: the policies that govern safe conduct, the workers who execute daily tasks, and the physical zones where those tasks unfold. When incidents occur—whether harassment, violence, or unsafe conditions—the organization must trace every event back to the people involved, the locations affected, and the policies that should have prevented them. The records below capture that traceability end to end.

**Table `health_and_safety_policies`**

| id | policy_identifier | effective_date | issuing_authority | compliance_standard | policy_status | workplace_activity_id |
|---|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | extended-issuing-33 | primary-complian-88 | active | 1000 |
| 2 | POL-2486 | 2024-07-25 | integrated-issuing-34 | adaptive-complian-89 | draft | 1001 |
| 3 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | distributed-complian-90 | superseded | 1002 |
| 4 | POL-2498 | 2022-05-20 | regional-issuing-36 | baseline-complian-91 | pending_review | 1003 |

Health and safety policies form the regulatory backbone of the operation. Each policy carries a unique identifier such as `POL-2480` or `POL-2498`, an effective date, and an issuing authority like `extended-issuing-33` or `regional-issuing-36`. The compliance standard column records the benchmark against which the organization measures itself—`primary-complian-88`, `adaptive-complian-89`, and so on. Policies move through a lifecycle reflected in the `policy_status` field: `active`, `draft`, `superseded`, and `pending_review`. A policy is linked to a specific workplace activity through `workplace_activity_id`, ensuring that every task on the floor has a corresponding regulatory reference.

**Table `workplace_activities`**

| id | activity_code | location_zone | risk_level | scheduled_date | status | worker_id | facility_zone_id | health_and_safety_policy_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 12585 | integrated-location-40 | low | 2024-11-27T22:18:00 | planned | 1 | 1 | 1 |
| 1001 | 2bc26b8a-8fcc-11eb-924d-9cd76263cbd0 | seasonal-location-41 | medium | 2025-04-11T05:35:00 | in_progress | 2 | 2 | 2 |
| 1002 | 195368 | regional-location-42 | high | 2022-09-22T12:52:00 | completed | 3 | 3 | 3 |
| 1003 | 9085257 | legacy-location-43 | critical | 2023-02-06T19:09:00 | suspended | 4 | 4 | 4 |

Workplace activities are the operational units where workers perform their duties. Each activity has an `activity_code`—ranging from simple numeric codes like `12585` to UUID-style identifiers such as `2bc26b8a-8fcc-11eb-924d-9cd76263cbd0`—and a `location_zone` that describes the general area, for example `integrated-location-40` or `seasonal-location-41`. Activities are classified by `risk_level` (`low`, `medium`, `high`, `critical`) and tracked through a `status` lifecycle (`planned`, `in_progress`, `completed`, `suspended`). The `scheduled_date` records when the activity is set to occur, while the foreign keys `worker_id`, `facility_zone_id`, and `health_and_safety_policy_id` tie the activity to a responsible worker, a physical zone, and the governing policy.

**Table `workers`**

| worker_id | role | department | safety_training_status | certification_expiry | workplace_activity_id | reports_to_worker_id | harassment_policy_id |
|---|---|---|---|---|---|---|---|
| 1 | employee | adaptive-departme-89 | completed | 2023-02-10 | 1000 | 1 | 1000 |
| 2 | manager | distributed-departme-90 | in_progress | 2024-07-21 | 1001 | 2 | 1001 |
| 3 | supervisor | baseline-departme-91 | not_started | 2025-12-05 | 1002 | 3 | 1002 |
| 4 | contractor | pilot-departme-92 | expired | 2022-05-16 | 1003 | 4 | 1003 |

Workers are the human element at the center of every activity and incident. The `workers` table records each person's `role` (`employee`, `manager`, `supervisor`, `contractor`), `department` (such as `adaptive-departme-89` or `pilot-departme-92`), and `safety_training_status` (`completed`, `in_progress`, `not_started`, `expired`). The `certification_expiry` date flags when a worker's safety certification lapses. Each worker is assigned to a `workplace_activity_id` and may `reports_to_worker_id` another worker, establishing a reporting hierarchy. The `harassment_policy_id` links the worker to the specific harassment policy that governs their conduct.

**Table `safety_incidents`**

| id | incident_id | incident_type | severity_level | reported_date | investigation_status | worker_id | facility_zone_id | investigated_by_worker_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 1336174 | harassment | minor | 2025-04-27T03:09:00 | open | 1 | 1 | 1 |
| 2 | state_uk_4 | violence | moderate | 2022-09-11T10:26:00 | under_review | 2 | 2 | 2 |
| 3 | 2933483 | unsafe_condition | severe | 2023-02-22T17:43:00 | closed | 3 | 3 | 3 |
| 4 | 2986243 | near_miss | critical | 2024-07-06T00:00:00 | escalated | 4 | 4 | 4 |

Safety incidents capture events that breach the expected standard of safety. Each incident has a unique `incident_id` (e.g., `1336174`, `state_uk_4`), an `incident_type` (`harassment`, `violence`, `unsafe_condition`, `near_miss`), and a `severity_level` (`minor`, `moderate`, `severe`, `critical`). The `reported_date` records when the incident was logged, and `investigation_status` tracks the progress of the response (`open`, `under_review`, `closed`, `escalated`). The `worker_id` identifies the affected worker, `facility_zone_id` pinpoints the location, and `investigated_by_worker_id` names the person conducting the investigation.

**Table `facility_zones`**

| facility_zone_id | zone_code | zone_name | occupancy_limit | hazard_rating | last_inspection_date | safety_incident_id | workplace_activity_id |
|---|---|---|---|---|---|---|---|
| 1 | 974943 | Pilot Series | 21 | low | 2025-04-12 | 1 | 1000 |
| 2 | 2002007020170 | Baseline Assessment | 27 | medium | 2022-09-23 | 2 | 1001 |
| 3 | 9424913 | Distributed Survey A | 33 | high | 2023-02-07 | 3 | 1002 |
| 4 | lu_tax_code_template_m14 | Adaptive Corridor | 39 | low | 2024-07-18 | 4 | 1003 |

Facility zones define the physical spaces where work occurs. Each zone has a `zone_code` (such as `974943` or `lu_tax_code_template_m14`), a `zone_name` (`Pilot Series`, `Baseline Assessment`, `Distributed Survey A`, `Adaptive Corridor`), and an `occupancy_limit` (ranging from 21 to 39 persons). The `hazard_rating` (`low`, `medium`, `high`) provides a quick risk indicator, while `last_inspection_date` records the most recent safety inspection. Each zone is linked to a `safety_incident_id` and a `workplace_activity_id`, anchoring the physical space to both the events that have occurred there and the tasks being performed.

**Table `harassment_policies`**

| id | policy_identifier | effective_date | issuing_authority | compliance_standard | policy_status | worker_id | safety_incident_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | POL-2480 | 2023-02-14 | extended-issuing-33 | primary-complian-88 | active | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | POL-2486 | 2024-07-25 | integrated-issuing-34 | adaptive-complian-89 | draft | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | distributed-complian-90 | superseded | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | POL-2498 | 2022-05-20 | regional-issuing-36 | baseline-complian-91 | pending_review | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Harassment policies provide the specific behavioral standards that apply to workers and incidents alike. Each policy carries a `policy_identifier` (`POL-2480` through `POL-2498`), an `effective_date`, an `issuing_authority`, and a `compliance_standard`. The `policy_status` field (`active`, `draft`, `superseded`, `pending_review`) mirrors the lifecycle of the broader health and safety policies. The `worker_id` and `safety_incident_id` columns link each harassment policy to the individual it governs and the incident it addresses. Timestamps `created_at` and `updated_at` record when the policy was first established and last modified.

**Table `violence_policies`**

| id | policy_identifier | effective_date | issuing_authority | compliance_standard | policy_status | worker_id | safety_incident_id |
|---|---|---|---|---|---|---|---|
| 1 | POL-2480 | 2023-02-14 | extended-issuing-33 | primary-complian-88 | active | 1 | 1 |
| 2 | POL-2486 | 2024-07-25 | integrated-issuing-34 | adaptive-complian-89 | draft | 2 | 2 |
| 3 | POL-2492 | 2025-12-09 | seasonal-issuing-35 | distributed-complian-90 | superseded | 3 | 3 |
| 4 | POL-2498 | 2022-05-20 | regional-issuing-36 | baseline-complian-91 | pending_review | 4 | 4 |

Violence policies establish the organization's standards for preventing and responding to violent incidents. Like the harassment policies, each record includes a `policy_identifier`, `effective_date`, `issuing_authority`, and `compliance_standard`. The `policy_status` reflects the current state of the policy, while `worker_id` and `safety_incident_id` tie the policy to the affected worker and the specific incident. The `created_at` and `updated_at` timestamps provide an audit trail of policy changes.

### Policy-Activity Alignment

The view `v_health_and_safety_policy_workplace_activity` joins health and safety policies with the workplace activities they govern, answering the question: which policy applies to which activity? In the joined result, row 1 shows policy `POL-2480` (issued by `extended-issuing-33`, status `active`) linked to workplace activity `12585` at `integrated-location-40` with a `low` risk level. Row 2 pairs policy `POL-2486` (status `draft`) with activity `2bc26b8a-8fcc-11eb-924d-9cd76263cbd0` at `seasonal-location-41`, which carries a `medium` risk level and is currently `in_progress`. This view ensures that every activity has a traceable policy anchor.

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

The complementary view `v_workplace_activity_health_and_safety_policy` presents the same relationship from the activity's perspective, answering: what policy governs this activity? Row 1 confirms that activity `12585` is governed by policy `POL-2480` with compliance standard `primary-complian-88`. Row 4 shows that the `critical`-risk activity `9085257` at `legacy-location-43` is tied to policy `POL-2498`, which is in `pending_review` status—a potential compliance gap worth flagging.

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

### Worker-Activity Assignment

The view `v_workplace_activity_worker` connects workplace activities to the workers assigned to them, answering: who is responsible for this task? Row 1 shows worker `1` (an `employee` in `adaptive-departme-89` with `completed` safety training) assigned to activity `12585`. Row 4 reveals worker `4` (a `contractor` in `pilot-departme-92` with `expired` safety training) assigned to the `critical`-risk activity `9085257`. The expired certification on a contractor handling critical-risk work is a notable compliance concern.

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

The view `v_worker_workplace_activity` presents the same relationship from the worker's perspective, answering: what activity is this worker assigned to? Row 2 shows worker `2` (a `manager` in `distributed-departme-90` with `in_progress` training) assigned to activity `2bc26b8a-8fcc-11eb-924d-9cd76263cbd0`, which is `in_progress` at `seasonal-location-41`. Row 3 places worker `3` (a `supervisor` with `not_started` training) on activity `195368`, which is already `completed`—suggesting the worker was assigned after the activity concluded.

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

The view `v_worker_worker` exposes the reporting hierarchy among workers. Row 1 shows worker `1` reporting to worker `1` (self-reporting, which may indicate a top-level position). Row 2 shows worker `2` reporting to worker `2`, and similarly for workers `3` and `4`. This self-referential pattern suggests that each worker operates at the top of their own reporting chain, or that the hierarchy is defined at a higher organizational level not captured in this dataset.

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

### Worker-Policy Linkage

The view `v_worker_harassment_policy` joins workers with the harassment policies that govern their conduct. Row 1 links worker `1` (employee, `adaptive-departme-89`) to harassment policy `POL-2480` (status `active`). Row 4 links worker `4` (contractor, `pilot-departme-92`) to harassment policy `POL-2498` (status `pending_review`). The mismatch between a contractor with expired safety training and a harassment policy still under review creates a dual compliance exposure.

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

The view `v_harassment_policy_worker` presents the same relationship from the policy's perspective, answering: which workers are covered by this harassment policy? Row 2 shows harassment policy `POL-2486` (status `draft`) covering worker `2` (manager, `distributed-departme-90`). A draft policy covering an active manager is a procedural risk—the policy should be finalized before it is relied upon.

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

### Zone-Activity and Zone-Incident Relationships

The view `v_workplace_activity_facility_zone` joins workplace activities with the facility zones where they occur. Row 1 shows activity `12585` taking place in facility zone `974943` (`Pilot Series`), which has an occupancy limit of 21 and a `low` hazard rating. Row 3 places activity `195368` in zone `9424913` (`Distributed Survey A`), which has an occupancy limit of 33 and a `high` hazard rating. The view confirms that high-risk activities are occurring in high-hazard zones, which is consistent but warrants close monitoring.

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

The view `v_facility_zone_workplace_activity` presents the same relationship from the zone's perspective, answering: what activities are scheduled in this zone? Row 2 shows zone `2002007020170` (`Baseline Assessment`) hosting activity `2bc26b8a-8fcc-11eb-924d-9cd76263cbd0`, which is `in_progress` with a `medium` risk level. The zone itself has a `medium` hazard rating and an occupancy limit of 27.

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

The view `v_safety_incident_facility_zone` joins safety incidents with the facility zones where they occurred. Row 1 shows incident `1336174` (type `harassment`, severity `minor`) occurring in zone `974943` (`Pilot Series`). Row 4 shows incident `2986243` (type `near_miss`, severity `critical`) in zone `lu_tax_code_template_m14` (`Adaptive Corridor`). The critical near-miss in a zone with a `low` hazard rating is counterintuitive and suggests the hazard rating may not fully capture the risk profile of that space.

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

The view `v_facility_zone_safety_incident` presents the same relationship from the zone's perspective, answering: what incidents have occurred in this zone? Row 3 shows zone `9424913` (`Distributed Survey A`) associated with incident `2933483` (type `unsafe_condition`, severity `severe`, status `closed`). The zone has a `high` hazard rating and an occupancy limit of 33, making the severe incident consistent with its risk profile.

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

### Incident-Worker and Incident-Policy Relationships

The view `v_safety_incident_worker` joins safety incidents with the workers involved. Row 1 shows incident `1336174` (harassment, minor) involving worker `1` (employee, `adaptive-departme-89`), who was also the investigator (`investigated_by_worker_id = 1`). Row 2 shows incident `state_uk_4` (violence, moderate) involving worker `2` (manager), who was also the investigator. Self-investigation of incidents is a common pattern in this dataset and may raise questions about independence of review.

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

The view `v_violence_policy_worker` joins violence policies with the workers they cover. Row 1 links violence policy `POL-2480` (status `active`) to worker `1` (employee). Row 4 links violence policy `POL-2498` (status `pending_review`) to worker `4` (contractor). A contractor covered by a policy still under review is a compliance gap analogous to the harassment policy situation.

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

The view `v_violence_policy_safety_incident` joins violence policies with the safety incidents they address. Row 2 links violence policy `POL-2486` (status `draft`) to incident `state_uk_4` (violence, moderate, status `under_review`). A draft policy being applied to an active investigation is a procedural concern—the policy should be finalized before it serves as the basis for incident response.

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

The view `v_harassment_policy_safety_incident` joins harassment policies with the safety incidents they address. Row 1 links harassment policy `POL-2480` (status `active`) to incident `1336174` (harassment, minor, status `open`). Row 3 links harassment policy `POL-2492` (status `superseded`) to incident `2933483` (unsafe condition, severe, status `closed`). Applying a superseded policy to a closed incident is acceptable since the incident is resolved, but it highlights the need to ensure that open incidents are always addressed under active policies.

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

### Synthesis

The records presented here form a coherent picture of an organization managing health, safety, and compliance across multiple sites. Policies govern activities, workers execute activities in physical zones, and incidents—when they occur—are traced back to the people, places, and policies involved. The data reveals several areas of operational risk: contractors with expired certifications assigned to critical-risk activities, draft and superseded policies covering active incidents, and self-investigation patterns that may compromise incident review independence. The views provided enable managers to query these relationships from any angle—policy to activity, worker to zone, incident to policy—ensuring that no gap goes unexamined.