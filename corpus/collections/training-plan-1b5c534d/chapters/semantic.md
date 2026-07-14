## Domain Modeling and Relational Materialization

The domain under consideration is a dog-training management system in which owners design structured training plans for their dogs, break those plans into weekly schedules, and record daily activities that execute within those schedules. Physical events—races, trials, or competitions—serve as the external targets that training plans aim to prepare for. The relational schema captures this hierarchy through six core entity tables, four associative junction tables that resolve many-to-many relationships, and twelve materialized views that reconstruct domain facts from the normalized base tables.

### Entity Types and Their Attributes

The foundational entity is `training_plans`, which stores the high-level design of a dog-training program. Each row carries a surrogate primary key `id`, a business key `plan_identifier` (such as `PLA-2674`), a human-readable `plan_title` like "Regional Framework", a `target_event` string (e.g. `legacy-target-55`), a `duration_weeks` integer, `start_date` and `end_date` fields, a `status` enum (`draft`, `active`, `completed`, `archived`), and a foreign key `physical_event_id` that anchors the plan to a specific event. The four rows in this table illustrate the full lifecycle: plan `PLA-2674` is in `draft` status with a 22-week duration targeting event `legacy-target-55`, while plan `PLA-2678` is `completed` after 40 weeks targeting `composite-target-57`.

**Table `training_plans`**

| id | plan_identifier | plan_title | target_event | duration_weeks | start_date | end_date | status | physical_event_id |
|---|---|---|---|---|---|---|---|---|
| 1 | PLA-2674 | Regional Framework | legacy-target-55 | 22 | 2022-09-05 | 2022-09-01 | draft | 1 |
| 2 | PLA-2676 | Seasonal Protocol D | compact-target-56 | 31 | 2023-02-16 | 2023-02-12 | active | 2 |
| 3 | PLA-2678 | Integrated Programme | composite-target-57 | 40 | 2024-07-27 | 2024-07-23 | completed | 3 |
| 4 | PLA-2680 | Extended Standard | primary-target-58 | 49 | 2025-12-11 | 2025-12-07 | archived | 4 |

The `weekly_schedules` table decomposes each training plan into weekly increments. Its primary key is `weekly_schedule_id`, and each row records a `week_number` (7, 14, 21, 28), a `plan_identifier` that echoes the parent plan's business key, aggregate metrics `total_distance` and `target_distance` (floating-point values such as 249.44281 and 1.09), an `intensity_level` (`low`, `moderate`, `high`), and a foreign key `training_plan_id` pointing back to `training_plans`. The week-number sequence 7, 14, 21, 28 suggests that each plan is partitioned into four weekly buckets, though the actual number of weeks per plan is governed by `duration_weeks` in the parent table.

**Table `weekly_schedules`**

| weekly_schedule_id | week_number | plan_identifier | total_distance | target_distance | intensity_level | training_plan_id |
|---|---|---|---|---|---|---|
| 100 | 7 | PLA-2674 | 249.44281 | 1.09 | low | 1 |
| 101 | 14 | PLA-2676 | 34.366668701171875 | 0.04999995 | moderate | 2 |
| 102 | 21 | PLA-2678 | 256.0 | 0.4 | high | 3 |
| 103 | 28 | PLA-2680 | 0.07499999 | 0.01999998 | low | 4 |

The `daily_activities` table is the most granular entity, capturing individual training sessions. Its primary key `id` (1000–1003) identifies rows that record an `activity_type` (`rest`, `walk`, `jog`, `interval`), a `scheduled_day` of the week (`Monday` through `Thursday`), `duration_minutes` (35–44), `distance_km` (ranging from 0.075 to 254.69342), a `pace` (`walk`, `jog`, `run`), a boolean `is_rest_day`, and two foreign keys: `weekly_schedule_id` linking to `weekly_schedules` and `dog_id` linking to `dogs`. An additional foreign key `owner_id` connects the activity to an `owners` row. The sample rows show a `rest` activity on Monday with 35 minutes and 254.69342 km, and an `interval` activity on Thursday with 44 minutes and 37.5 km.

**Table `daily_activities`**

| id | activity_type | scheduled_day | duration_minutes | distance_km | pace | is_rest_day | weekly_schedule_id | dog_id | owner_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | rest | Monday | 35 | 254.69342 | walk | false | 100 | 1 | 1 |
| 1001 | walk | Tuesday | 38 | 0.075 | jog | true | 101 | 2 | 2 |
| 1002 | jog | Wednesday | 41 | 150.80444 | run | false | 102 | 3 | 3 |
| 1003 | interval | Thursday | 44 | 37.5 | walk | true | 103 | 4 | 4 |

The `dogs` table stores canine profiles with primary key `dog_id`, a business key `dog_identifier` (`DOG-2327`, `DOG-2331`, `DOG-2335`, `DOG-2339`), a `breed` field (`compact-breed-80`, `composite-breed-81`, `primary-breed-82`, `adaptive-breed-83`), `age_years` (37, 48, 59, 70), `weight_kg` (1.48, 0.385, 0.5465680900000001, 0.9), a `fitness_level` (`beginner`, `intermediate`, `advanced`), and a `health_status` (`healthy`, `recovering`, `injured`). The wide age range and varied fitness levels underscore why the system needs per-dog activity tracking.

**Table `dogs`**

| dog_id | dog_identifier | breed | age_years | weight_kg | fitness_level | health_status |
|---|---|---|---|---|---|---|
| 1 | DOG-2327 | compact-breed-80 | 37 | 1.48 | beginner | healthy |
| 2 | DOG-2331 | composite-breed-81 | 48 | 0.385 | intermediate | recovering |
| 3 | DOG-2335 | primary-breed-82 | 59 | 0.5465680900000001 | advanced | injured |
| 4 | DOG-2339 | adaptive-breed-83 | 70 | 0.9 | beginner | healthy |

The `owners` table holds human profiles with primary key `id`, an `owner_identifier` (which in the sample data appears to store a full name such as `Brian Hamilton` or `Omar Davis`), a `full_name` column (containing values like `Theodore Mcgrath` or `Account Name`), a `contact_email` (`Christopher Wilson`, `Charles Larsen`, `Mary Alvarez`, `April Snyder`), an `experience_level` (`novice`, `experienced`, `expert`), and a `dog_id` foreign key that associates each owner with a dog. The four owners map to dogs 1 through 4 respectively, with experience levels spanning the full range from novice to expert.

**Table `owners`**

| id | owner_identifier | full_name | contact_email | experience_level | dog_id |
|---|---|---|---|---|---|
| 1 | Brian Hamilton | Theodore Mcgrath | Christopher Wilson | novice | 1 |
| 2 | Omar Davis | Account Name | Charles Larsen | experienced | 2 |
| 3 | Michelle Kelley | Saipan International Airport | Mary Alvarez | expert | 3 |
| 4 | James Schmidt | Norma Fisher | April Snyder | novice | 4 |

The `physical_events` table defines external competitions or trials. Its primary key is `physical_event_id`, with columns `event_identifier` (`EVE-2706` through `EVE-2709`), `event_name` (`Seasonal Standard`, `Integrated Framework`, `Extended Protocol D`, `Pilot Programme`), `event_date` (ISO 8601 timestamps such as `2025-04-15T15:21:00`), `distance_km` (254.69342, 0.075, 150.80444, 37.5), and `event_status` (`upcoming`, `ongoing`, `completed`, `cancelled`). The distance values in this table match the `distance_km` values found in `daily_activities`, suggesting that daily distances are measured against the event's total distance.

**Table `physical_events`**

| physical_event_id | event_identifier | event_name | event_date | distance_km | event_status |
|---|---|---|---|---|---|
| 1 | EVE-2706 | Seasonal Standard | 2025-04-15T15:21:00 | 254.69342 | upcoming |
| 2 | EVE-2707 | Integrated Framework | 2022-09-26T22:38:00 | 0.075 | ongoing |
| 3 | EVE-2708 | Extended Protocol D | 2023-02-10T05:55:00 | 150.80444 | completed |
| 4 | EVE-2709 | Pilot Programme | 2024-07-21T12:12:00 | 37.5 | cancelled |

### Associative Junction Tables

Four junction tables resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `plans_schedules` table links `training_plans` to `weekly_schedules`, allowing a single plan to be associated with multiple weekly schedules and vice versa. The `schedules_activities` table connects `weekly_schedules` to `daily_activities`, enabling a schedule to contain multiple activities across different days.

The `dogs_plans` table establishes the relationship between `dogs` and `training_plans`, meaning a dog can participate in multiple training plans and a plan can target multiple dogs. The `dogs_activities` table links `dogs` to `daily_activities`, providing an additional association path beyond the direct `dog_id` foreign key already present in `daily_activities`.

The `owners_activities` table connects `owners` to `daily_activities`, allowing an owner to be associated with multiple activities. The `events_plans` table links `physical_events` to `training_plans`, enabling an event to have multiple training plans and a plan to target multiple events. These junction tables collectively transform what would otherwise be rigid one-to-many hierarchies into flexible many-to-many graphs, supporting scenarios where a single dog trains for multiple events or an owner supervises activities for multiple dogs.

### Foreign-Key Topology

The foreign-key graph forms a directed acyclic structure with several branching paths. At the top level, `physical_events` is referenced by `training_plans` through the `physical_event_id` column and by `events_plans` as the junction table's event side. Each `training_plan` row is referenced by `weekly_schedules` via `training_plan_id` and by `plans_schedules` as the plan side. Each `weekly_schedule` row is referenced by `daily_activities` through `weekly_schedule_id` and by `schedules_activities` as the schedule side. The `daily_activities` table itself carries two foreign keys: `dog_id` pointing to `dogs` and `owner_id` pointing to `owners`. The `owners` table also carries a `dog_id` column, creating a direct owner-to-dog association alongside the indirect path through `owners_activities` and `dogs_activities`.

This topology means that any domain fact involving multiple entity types requires a join path through the foreign-key chain. For example, retrieving the owner of a daily activity requires joining `daily_activities.owner_id` to `owners.id`, while retrieving the training plan for a weekly schedule requires joining `weekly_schedules.training_plan_id` to `training_plans.id`. The junction tables add additional join paths: `dogs_plans` connects `dogs.dog_id` to `training_plans.id`, and `events_plans` connects `physical_events.physical_event_id` to `training_plans.id`.

### View-Based Fact Reconstruction

The twelve views materialize common join paths into queryable result sets, each answering a specific domain question.

The view `v_training_plan_physical_event` joins `training_plans` to `physical_events` on `training_plans.physical_event_id = physical_events.physical_event_id`, answering the question "which physical event does each training plan target?" A row from this view would show plan `PLA-2674` ("Regional Framework") linked to event `EVE-2706` ("Seasonal Standard"), with the plan's 22-week duration and `draft` status alongside the event's `upcoming` status and 254.69342 km distance.

**View `v_training_plan_physical_event`**

```sql
CREATE VIEW v_training_plan_physical_event AS
SELECT a.id, a.plan_identifier, a.plan_title, a.target_event, b.physical_event_id AS event_physical_event_id, b.event_identifier AS event_event_identifier, b.event_name AS event_event_name
FROM training_plans a JOIN physical_events b ON a.physical_event_id = b.physical_event_id;
```

| id | plan_identifier | plan_title | target_event | event_physical_event_id | event_event_identifier | event_event_name |
|---|---|---|---|---|---|---|
| 1 | PLA-2674 | Regional Framework | legacy-target-55 | 1 | EVE-2706 | Seasonal Standard |
| 2 | PLA-2676 | Seasonal Protocol D | compact-target-56 | 2 | EVE-2707 | Integrated Framework |
| 3 | PLA-2678 | Integrated Programme | composite-target-57 | 3 | EVE-2708 | Extended Protocol D |
| 4 | PLA-2680 | Extended Standard | primary-target-58 | 4 | EVE-2709 | Pilot Programme |

The view `v_training_plan_weekly_schedule_detail` joins `training_plans` to `weekly_schedules` on `training_plans.id = weekly_schedules.training_plan_id`, answering "what weekly schedules belong to each training plan?" A representative row would show plan `PLA-2676` ("Seasonal Protocol D") with its week-14 schedule carrying a `moderate` intensity level, total distance of 34.366668701171875, and target distance of 0.04999995.

**View `v_training_plan_weekly_schedule_detail`**

```sql
CREATE VIEW v_training_plan_weekly_schedule_detail AS
SELECT a.id, a.plan_identifier, a.plan_title, b.weekly_schedule_id AS schedule_weekly_schedule_id, b.week_number AS schedule_week_number, b.plan_identifier AS schedule_plan_identifier
FROM training_plans a
  JOIN plans_schedules j ON j.training_plan_id = a.id
  JOIN weekly_schedules b ON b.weekly_schedule_id = j.weekly_schedule_id;
```

| id | plan_identifier | plan_title | schedule_weekly_schedule_id | schedule_week_number | schedule_plan_identifier |
|---|---|---|---|---|---|
| 1 | PLA-2674 | Regional Framework | 100 | 7 | PLA-2674 |
| 1 | PLA-2674 | Regional Framework | 101 | 14 | PLA-2676 |
| 2 | PLA-2676 | Seasonal Protocol D | 101 | 14 | PLA-2676 |
| 2 | PLA-2676 | Seasonal Protocol D | 102 | 21 | PLA-2678 |
| 3 | PLA-2678 | Integrated Programme | 102 | 21 | PLA-2678 |
| 3 | PLA-2678 | Integrated Programme | 103 | 28 | PLA-2680 |
| 4 | PLA-2680 | Extended Standard | 103 | 28 | PLA-2680 |
| 4 | PLA-2680 | Extended Standard | 100 | 7 | PLA-2674 |

The view `v_weekly_schedule_training_plan` performs the reverse join, answering "which training plan does each weekly schedule belong to?" A row would show weekly schedule 101 (week 14) associated with plan `PLA-2676` ("Seasonal Protocol D"), carrying the plan's 31-week duration and `active` status.

**View `v_weekly_schedule_training_plan`**

```sql
CREATE VIEW v_weekly_schedule_training_plan AS
SELECT a.weekly_schedule_id, a.week_number, a.plan_identifier, a.total_distance, b.id AS plan_id, b.plan_identifier AS plan_plan_identifier, b.plan_title AS plan_plan_title
FROM weekly_schedules a JOIN training_plans b ON a.training_plan_id = b.id;
```

| weekly_schedule_id | week_number | plan_identifier | total_distance | plan_id | plan_plan_identifier | plan_plan_title |
|---|---|---|---|---|---|---|
| 100 | 7 | PLA-2674 | 249.44281 | 1 | PLA-2674 | Regional Framework |
| 101 | 14 | PLA-2676 | 34.366668701171875 | 2 | PLA-2676 | Seasonal Protocol D |
| 102 | 21 | PLA-2678 | 256.0 | 3 | PLA-2678 | Integrated Programme |
| 103 | 28 | PLA-2680 | 0.07499999 | 4 | PLA-2680 | Extended Standard |

The view `v_weekly_schedule_daily_activity_detail` joins `weekly_schedules` to `daily_activities` on `weekly_schedules.weekly_schedule_id = daily_activities.weekly_schedule_id`, answering "what daily activities are scheduled within each weekly schedule?" A row would show weekly schedule 100 (week 7) containing daily activity 1000, which is a `rest` activity on `Monday` with 35 minutes duration and 254.69342 km distance.

**View `v_weekly_schedule_daily_activity_detail`**

```sql
CREATE VIEW v_weekly_schedule_daily_activity_detail AS
SELECT a.weekly_schedule_id, a.week_number, a.plan_identifier, b.id AS activity_id, b.activity_type AS activity_activity_type, b.scheduled_day AS activity_scheduled_day
FROM weekly_schedules a
  JOIN schedules_activities j ON j.weekly_schedule_id = a.weekly_schedule_id
  JOIN daily_activities b ON b.id = j.daily_activity_id;
```

| weekly_schedule_id | week_number | plan_identifier | activity_id | activity_activity_type | activity_scheduled_day |
|---|---|---|---|---|---|
| 100 | 7 | PLA-2674 | 1000 | rest | Monday |
| 100 | 7 | PLA-2674 | 1001 | walk | Tuesday |
| 101 | 14 | PLA-2676 | 1001 | walk | Tuesday |
| 101 | 14 | PLA-2676 | 1002 | jog | Wednesday |
| 102 | 21 | PLA-2678 | 1002 | jog | Wednesday |
| 102 | 21 | PLA-2678 | 1003 | interval | Thursday |
| 103 | 28 | PLA-2680 | 1003 | interval | Thursday |
| 103 | 28 | PLA-2680 | 1000 | rest | Monday |

The view `v_daily_activity_weekly_schedule` performs the reverse join, answering "which weekly schedule contains each daily activity?" A row would show daily activity 1000 (a `rest` activity on `Monday`) belonging to weekly schedule 100 (week 7) with `low` intensity level.

**View `v_daily_activity_weekly_schedule`**

```sql
CREATE VIEW v_daily_activity_weekly_schedule AS
SELECT a.id, a.activity_type, a.scheduled_day, a.duration_minutes, b.weekly_schedule_id AS schedule_weekly_schedule_id, b.week_number AS schedule_week_number, b.plan_identifier AS schedule_plan_identifier
FROM daily_activities a JOIN weekly_schedules b ON a.weekly_schedule_id = b.weekly_schedule_id;
```

| id | activity_type | scheduled_day | duration_minutes | schedule_weekly_schedule_id | schedule_week_number | schedule_plan_identifier |
|---|---|---|---|---|---|---|
| 1000 | rest | Monday | 35 | 100 | 7 | PLA-2674 |
| 1001 | walk | Tuesday | 38 | 101 | 14 | PLA-2676 |
| 1002 | jog | Wednesday | 41 | 102 | 21 | PLA-2678 |
| 1003 | interval | Thursday | 44 | 103 | 28 | PLA-2680 |

The view `v_daily_activity_dog` joins `daily_activities` to `dogs` on `daily_activities.dog_id = dogs.dog_id`, answering "which dog performs each daily activity?" A row would show daily activity 1000 (a `rest` activity) performed by dog `DOG-2327` (a 37-year-old `compact-breed-80` with `beginner` fitness level and `healthy` status).

**View `v_daily_activity_dog`**

```sql
CREATE VIEW v_daily_activity_dog AS
SELECT a.id, a.activity_type, a.scheduled_day, a.duration_minutes, b.dog_id AS dog_dog_id, b.dog_identifier AS dog_dog_identifier, b.breed AS dog_breed
FROM daily_activities a JOIN dogs b ON a.dog_id = b.dog_id;
```

| id | activity_type | scheduled_day | duration_minutes | dog_dog_id | dog_dog_identifier | dog_breed |
|---|---|---|---|---|---|---|
| 1000 | rest | Monday | 35 | 1 | DOG-2327 | compact-breed-80 |
| 1001 | walk | Tuesday | 38 | 2 | DOG-2331 | composite-breed-81 |
| 1002 | jog | Wednesday | 41 | 3 | DOG-2335 | primary-breed-82 |
| 1003 | interval | Thursday | 44 | 4 | DOG-2339 | adaptive-breed-83 |

The view `v_daily_activity_owner` joins `daily_activities` to `owners` on `daily_activities.owner_id = owners.id`, answering "which owner is associated with each daily activity?" A row would show daily activity 1000 associated with owner `id 1` (owner identifier `Brian Hamilton`, full name `Theodore Mcgrath`, contact `Christopher Wilson`, `novice` experience level).

**View `v_daily_activity_owner`**

```sql
CREATE VIEW v_daily_activity_owner AS
SELECT a.id, a.activity_type, a.scheduled_day, a.duration_minutes, b.id AS owner_id, b.owner_identifier AS owner_owner_identifier, b.full_name AS owner_full_name
FROM daily_activities a JOIN owners b ON a.owner_id = b.id;
```

| id | activity_type | scheduled_day | duration_minutes | owner_id | owner_owner_identifier | owner_full_name |
|---|---|---|---|---|---|---|
| 1000 | rest | Monday | 35 | 1 | Brian Hamilton | Theodore Mcgrath |
| 1001 | walk | Tuesday | 38 | 2 | Omar Davis | Account Name |
| 1002 | jog | Wednesday | 41 | 3 | Michelle Kelley | Saipan International Airport |
| 1003 | interval | Thursday | 44 | 4 | James Schmidt | Norma Fisher |

The view `v_dog_training_plan_detail` joins `dogs` to `training_plans` through the `dogs_plans` junction table, answering "which training plans is each dog enrolled in?" A row would show dog `DOG-2327` (a `beginner`-level `compact-breed-80`) enrolled in plan `PLA-2674` ("Regional Framework"), a 22-week `draft` plan targeting event `legacy-target-55`.

**View `v_dog_training_plan_detail`**

```sql
CREATE VIEW v_dog_training_plan_detail AS
SELECT a.dog_id, a.dog_identifier, a.breed, b.id AS plan_id, b.plan_identifier AS plan_plan_identifier, b.plan_title AS plan_plan_title
FROM dogs a
  JOIN dogs_plans j ON j.dog_id = a.dog_id
  JOIN training_plans b ON b.id = j.training_plan_id;
```

| dog_id | dog_identifier | breed | plan_id | plan_plan_identifier | plan_plan_title |
|---|---|---|---|---|---|
| 1 | DOG-2327 | compact-breed-80 | 1 | PLA-2674 | Regional Framework |
| 1 | DOG-2327 | compact-breed-80 | 2 | PLA-2676 | Seasonal Protocol D |
| 2 | DOG-2331 | composite-breed-81 | 2 | PLA-2676 | Seasonal Protocol D |
| 2 | DOG-2331 | composite-breed-81 | 3 | PLA-2678 | Integrated Programme |
| 3 | DOG-2335 | primary-breed-82 | 3 | PLA-2678 | Integrated Programme |
| 3 | DOG-2335 | primary-breed-82 | 4 | PLA-2680 | Extended Standard |
| 4 | DOG-2339 | adaptive-breed-83 | 4 | PLA-2680 | Extended Standard |
| 4 | DOG-2339 | adaptive-breed-83 | 1 | PLA-2674 | Regional Framework |

The view `v_dog_daily_activity_detail` joins `dogs` to `daily_activities` through the `dogs_activities` junction table, answering "which daily activities is each dog involved in?" A row would show dog `DOG-2327` involved in daily activity 1000, a `rest` activity on `Monday` with 35 minutes duration.

**View `v_dog_daily_activity_detail`**

```sql
CREATE VIEW v_dog_daily_activity_detail AS
SELECT a.dog_id, a.dog_identifier, a.breed, b.id AS activity_id, b.activity_type AS activity_activity_type, b.scheduled_day AS activity_scheduled_day
FROM dogs a
  JOIN dogs_activities j ON j.dog_id = a.dog_id
  JOIN daily_activities b ON b.id = j.daily_activity_id;
```

| dog_id | dog_identifier | breed | activity_id | activity_activity_type | activity_scheduled_day |
|---|---|---|---|---|---|
| 1 | DOG-2327 | compact-breed-80 | 1000 | rest | Monday |
| 1 | DOG-2327 | compact-breed-80 | 1001 | walk | Tuesday |
| 2 | DOG-2331 | composite-breed-81 | 1001 | walk | Tuesday |
| 2 | DOG-2331 | composite-breed-81 | 1002 | jog | Wednesday |
| 3 | DOG-2335 | primary-breed-82 | 1002 | jog | Wednesday |
| 3 | DOG-2335 | primary-breed-82 | 1003 | interval | Thursday |
| 4 | DOG-2339 | adaptive-breed-83 | 1003 | interval | Thursday |
| 4 | DOG-2339 | adaptive-breed-83 | 1000 | rest | Monday |

The view `v_owner_daily_activity_detail` joins `owners` to `daily_activities` through the `owners_activities` junction table, answering "which daily activities is each owner supervising?" A row would show owner `id 1` (Brian Hamilton, `novice` level) supervising daily activity 1000, a `rest` activity on `Monday` with 35 minutes duration and 254.69342 km distance.

**View `v_owner_daily_activity_detail`**

```sql
CREATE VIEW v_owner_daily_activity_detail AS
SELECT a.id, a.owner_identifier, a.full_name, b.id AS activity_id, b.activity_type AS activity_activity_type, b.scheduled_day AS activity_scheduled_day
FROM owners a
  JOIN owners_activities j ON j.owner_id = a.id
  JOIN daily_activities b ON b.id = j.daily_activity_id;
```

| id | owner_identifier | full_name | activity_id | activity_activity_type | activity_scheduled_day |
|---|---|---|---|---|---|
| 1 | Brian Hamilton | Theodore Mcgrath | 1000 | rest | Monday |
| 1 | Brian Hamilton | Theodore Mcgrath | 1001 | walk | Tuesday |
| 2 | Omar Davis | Account Name | 1001 | walk | Tuesday |
| 2 | Omar Davis | Account Name | 1002 | jog | Wednesday |
| 3 | Michelle Kelley | Saipan International Airport | 1002 | jog | Wednesday |
| 3 | Michelle Kelley | Saipan International Airport | 1003 | interval | Thursday |
| 4 | James Schmidt | Norma Fisher | 1003 | interval | Thursday |
| 4 | James Schmidt | Norma Fisher | 1000 | rest | Monday |

The view `v_owner_dog` joins `owners` to `dogs` on `owners.dog_id = dogs.dog_id`, answering "which dog is assigned to each owner?" A row would show owner `id 1` (Brian Hamilton, `novice` experience level) assigned to dog `DOG-2327` (a 37-year-old `compact-breed-80` with `beginner` fitness level and `healthy` status).

**View `v_owner_dog`**

```sql
CREATE VIEW v_owner_dog AS
SELECT a.id, a.owner_identifier, a.full_name, a.contact_email, b.dog_id AS dog_dog_id, b.dog_identifier AS dog_dog_identifier, b.breed AS dog_breed
FROM owners a JOIN dogs b ON a.dog_id = b.dog_id;
```

| id | owner_identifier | full_name | contact_email | dog_dog_id | dog_dog_identifier | dog_breed |
|---|---|---|---|---|---|---|
| 1 | Brian Hamilton | Theodore Mcgrath | Christopher Wilson | 1 | DOG-2327 | compact-breed-80 |
| 2 | Omar Davis | Account Name | Charles Larsen | 2 | DOG-2331 | composite-breed-81 |
| 3 | Michelle Kelley | Saipan International Airport | Mary Alvarez | 3 | DOG-2335 | primary-breed-82 |
| 4 | James Schmidt | Norma Fisher | April Snyder | 4 | DOG-2339 | adaptive-breed-83 |

The view `v_physical_event_training_plan_detail` joins `physical_events` to `training_plans` through the `events_plans` junction table, answering "which training plans target each physical event?" A row would show event `EVE-2706` ("Seasonal Standard", an `upcoming` event on `2025-04-15T15:21:00` with 254.69342 km distance) targeted by plan `PLA-2674` ("Regional Framework"), a 22-week `draft` plan.

**View `v_physical_event_training_plan_detail`**

```sql
CREATE VIEW v_physical_event_training_plan_detail AS
SELECT a.physical_event_id, a.event_identifier, a.event_name, b.id AS plan_id, b.plan_identifier AS plan_plan_identifier, b.plan_title AS plan_plan_title
FROM physical_events a
  JOIN events_plans j ON j.physical_event_id = a.physical_event_id
  JOIN training_plans b ON b.id = j.training_plan_id;
```

| physical_event_id | event_identifier | event_name | plan_id | plan_plan_identifier | plan_plan_title |
|---|---|---|---|---|---|
| 1 | EVE-2706 | Seasonal Standard | 1 | PLA-2674 | Regional Framework |
| 1 | EVE-2706 | Seasonal Standard | 2 | PLA-2676 | Seasonal Protocol D |
| 2 | EVE-2707 | Integrated Framework | 2 | PLA-2676 | Seasonal Protocol D |
| 2 | EVE-2707 | Integrated Framework | 3 | PLA-2678 | Integrated Programme |
| 3 | EVE-2708 | Extended Protocol D | 3 | PLA-2678 | Integrated Programme |
| 3 | EVE-2708 | Extended Protocol D | 4 | PLA-2680 | Extended Standard |
| 4 | EVE-2709 | Pilot Programme | 4 | PLA-2680 | Extended Standard |
| 4 | EVE-2709 | Pilot Programme | 1 | PLA-2674 | Regional Framework |

### Synthesis

The schema models dog training as a four-level hierarchy—physical events at the top, training plans below them, weekly schedules beneath plans, and daily activities at the leaf level—with dogs and owners as parallel entities that attach to plans and activities through junction tables. The foreign-key chain `physical_events → training_plans → weekly_schedules → daily_activities` enforces the core planning hierarchy, while the junction tables `dogs_plans`, `dogs_activities`, `owners_activities`, and `events_plans` add the flexibility needed for real-world scenarios where dogs train for multiple events, owners supervise multiple activities, and plans target multiple events. The twelve views materialize the most common join paths, allowing analysts to answer questions about any entity's relationships without manually constructing multi-table joins. Each view's result set can be read as a denormalized fact: a single row tells the complete story of how a dog, an owner, a daily activity, a weekly schedule, a training plan, and a physical event interconnect.

## Data appendix

**Table `plans_schedules`**

| training_plan_id | weekly_schedule_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `schedules_activities`**

| weekly_schedule_id | daily_activity_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

**Table `dogs_plans`**

| dog_id | training_plan_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `dogs_activities`**

| dog_id | daily_activity_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `owners_activities`**

| owner_id | daily_activity_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `events_plans`**

| physical_event_id | training_plan_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |
