## Structured Canine Fitness Programs

A disciplined approach to canine conditioning requires coordinating people, animals, schedules, and events into a coherent operational framework. Owners design multi-week training programs aimed at specific physical events, breaking those programs into weekly targets and then into daily activities. The system records every layer of this hierarchy, capturing distances, intensities, rest days, and health statuses so that progress can be tracked from the broadest event down to the individual walk on any given Tuesday.

**Table `training_plans`**

| id | plan_identifier | plan_title | target_event | duration_weeks | start_date | end_date | status | physical_event_id |
|---|---|---|---|---|---|---|---|---|
| 1 | PLA-2674 | Regional Framework | legacy-target-55 | 22 | 2022-09-05 | 2022-09-01 | draft | 1 |
| 2 | PLA-2676 | Seasonal Protocol D | compact-target-56 | 31 | 2023-02-16 | 2023-02-12 | active | 2 |
| 3 | PLA-2678 | Integrated Programme | composite-target-57 | 40 | 2024-07-27 | 2024-07-23 | completed | 3 |
| 4 | PLA-2680 | Extended Standard | primary-target-58 | 49 | 2025-12-11 | 2025-12-07 | archived | 4 |

Each training plan anchors a preparation cycle for a single physical event. Plans carry a unique identifier such as PLA-2674, a human-readable title like Regional Framework, and a target event reference such as legacy-target-55. The duration spans a defined number of weeks — twenty-two for the first plan, thirty-one for the second — with explicit start and end dates that frame the preparation window. A status field tracks the lifecycle stage: draft, active, completed, or archived. The plan links to a physical event through a foreign key, establishing the north star toward which all subsequent scheduling effort is directed.

**Table `physical_events`**

| physical_event_id | event_identifier | event_name | event_date | distance_km | event_status |
|---|---|---|---|---|---|
| 1 | EVE-2706 | Seasonal Standard | 2025-04-15T15:21:00 | 254.69342 | upcoming |
| 2 | EVE-2707 | Integrated Framework | 2022-09-26T22:38:00 | 0.075 | ongoing |
| 3 | EVE-2708 | Extended Protocol D | 2023-02-10T05:55:00 | 150.80444 | completed |
| 4 | EVE-2709 | Pilot Programme | 2024-07-21T12:12:00 | 37.5 | cancelled |

Physical events represent the competitive or demonstrative milestones that motivate the training cycle. Each event carries an identifier like EVE-2706, a descriptive name such as Seasonal Standard, a scheduled date-time, an expected distance in kilometers, and a status indicating whether the event is upcoming, ongoing, completed, or cancelled. The distance field on the event — 254.69342 km for the first event, for instance — often serves as a reference point against which training distances are compared. The relationship between events and plans is many-to-many in practice: a single event may have multiple overlapping preparation cycles, and a plan may reference a primary event while incorporating elements from others.

**Table `weekly_schedules`**

| weekly_schedule_id | week_number | plan_identifier | total_distance | target_distance | intensity_level | training_plan_id |
|---|---|---|---|---|---|---|
| 100 | 7 | PLA-2674 | 249.44281 | 1.09 | low | 1 |
| 101 | 14 | PLA-2676 | 34.366668701171875 | 0.04999995 | moderate | 2 |
| 102 | 21 | PLA-2678 | 256.0 | 0.4 | high | 3 |
| 103 | 28 | PLA-2680 | 0.07499999 | 0.01999998 | low | 4 |

Weekly schedules decompose a training plan into manageable increments. Each weekly schedule record belongs to a specific plan via the training_plan_id foreign key and carries a week_number that orders the sequence. The system records both the total_distance covered in that week and a target_distance that serves as a benchmark. Intensity_level categorizes the week as low, moderate, or high, providing a quick heuristic for workload assessment. For example, week 7 of plan PLA-2674 logged a total distance of 249.44281 against a target of 1.09 with a low intensity rating, while week 21 of plan PLA-2678 recorded 256.0 total distance at a high intensity level. The weekly schedule acts as the bridge between the abstract plan and the concrete daily activities that fill it.

**Table `daily_activities`**

| id | activity_type | scheduled_day | duration_minutes | distance_km | pace | is_rest_day | weekly_schedule_id | dog_id | owner_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | rest | Monday | 35 | 254.69342 | walk | false | 100 | 1 | 1 |
| 1001 | walk | Tuesday | 38 | 0.075 | jog | true | 101 | 2 | 2 |
| 1002 | jog | Wednesday | 41 | 150.80444 | run | false | 102 | 3 | 3 |
| 1003 | interval | Thursday | 44 | 37.5 | walk | true | 103 | 4 | 4 |

Daily activities are the atomic units of training execution. Each record specifies an activity_type — rest, walk, jog, or interval — along with the scheduled_day of the week, a duration in minutes, a distance in kilometers, a pace descriptor such as walk, jog, or run, and a boolean flag indicating whether the day is a rest day. The activity is assigned to a specific weekly_schedule_id, a dog_id, and an owner_id, creating a three-way linkage that ties the training action to both the animal and the human responsible. Activity 1000, for instance, is a rest day on Monday with 35 minutes duration and 254.69342 km distance, assigned to dog 1 and owner 1 within weekly schedule 100.

**Table `dogs`**

| dog_id | dog_identifier | breed | age_years | weight_kg | fitness_level | health_status |
|---|---|---|---|---|---|---|
| 1 | DOG-2327 | compact-breed-80 | 37 | 1.48 | beginner | healthy |
| 2 | DOG-2331 | composite-breed-81 | 48 | 0.385 | intermediate | recovering |
| 3 | DOG-2335 | primary-breed-82 | 59 | 0.5465680900000001 | advanced | injured |
| 4 | DOG-2339 | adaptive-breed-83 | 70 | 0.9 | beginner | healthy |

Dogs are the central subjects of the training program. Each dog record carries an identifier such as DOG-2327, a breed classification like compact-breed-80, an age in years, a weight in kilograms, a fitness_level ranging from beginner to advanced, and a health_status that may be healthy, recovering, or injured. The data includes dogs at various stages of development: a 37-year-old beginner dog weighing 1.48 kg, a 48-year-old intermediate dog at 0.385 kg, a 59-year-old advanced dog at 0.54656809 kg, and a 70-year-old beginner dog at 0.9 kg. The fitness_level and health_status fields directly influence how training intensity and volume are calibrated for each animal.

**Table `owners`**

| id | owner_identifier | full_name | contact_email | experience_level | dog_id |
|---|---|---|---|---|---|
| 1 | Brian Hamilton | Theodore Mcgrath | Christopher Wilson | novice | 1 |
| 2 | Omar Davis | Account Name | Charles Larsen | experienced | 2 |
| 3 | Michelle Kelley | Saipan International Airport | Mary Alvarez | expert | 3 |
| 4 | James Schmidt | Norma Fisher | April Snyder | novice | 4 |

Owners are the humans managing the training programs. Each owner record includes an identifier, a full_name, a contact_email, an experience_level classified as novice, experienced, or expert, and a dog_id linking the owner to their primary dog. The dataset includes owners at all experience tiers: Brian Hamilton (Theodore Mcgrath) at novice level, Omar Davis (Charles Larsen) at experienced level, Michelle Kelley (Mary Alvarez) at expert level, and James Schmidt (April Snyder) at novice level. The experience_level of the owner is a relevant factor when evaluating whether training targets are appropriately calibrated.

### Relational Architecture

The system employs junction tables to manage many-to-many relationships that arise when entities cross traditional boundaries. The plans_schedules table links training plans to weekly schedules, enabling a single plan to span multiple weekly cycles and a weekly schedule to potentially reference multiple plans. The schedules_activities table connects weekly schedules to daily activities, allowing the system to track which activities belong to which week.

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

The dogs_plans table establishes which dogs are enrolled in which training plans, supporting scenarios where a dog participates in multiple plans or a plan covers multiple dogs. Similarly, the dogs_activities table links individual daily activities to specific dogs, providing a direct audit trail of each animal's training history independent of the weekly schedule structure.

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

The owners_activities table connects daily activities to owners, creating a record of which owner supervised which training session. This is distinct from the owner-to-dog relationship in the owners table, as it captures the actual execution of training rather than the assignment relationship. The events_plans table manages the many-to-many relationship between physical events and training plans, allowing flexible event planning where multiple preparation cycles may target a single event.

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

### Analytical Views

The system provides a suite of analytical views that join these tables to answer specific operational questions. Each view assembles data from multiple layers of the hierarchy into a single readable result set.

The view v_training_plan_physical_event joins training plans with their target physical events, answering the question of which event each plan is designed for and whether that event is still upcoming, already completed, or cancelled. For plan PLA-2674 (Regional Framework), the joined result shows target event legacy-target-55 with the associated event details, allowing a practitioner to see at a glance whether the preparation is still relevant.

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

The view v_training_plan_weekly_schedule_detail combines training plans with their weekly schedules, providing a consolidated view of how a plan's duration is distributed across weeks. This view reveals the progression of a plan from its first week to its last, showing how total_distance and intensity_level evolve over the training cycle.

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

The view v_weekly_schedule_training_plan performs the inverse join, presenting weekly schedules with their parent plan information. This perspective is useful when reviewing a specific week and needing to understand the broader plan context, including the plan's status and target event.

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

The view v_weekly_schedule_daily_activity_detail joins weekly schedules with their constituent daily activities, answering the question of what specific training actions were scheduled within a given week. This view is essential for reviewing weekly compliance — comparing what was planned against what was actually executed.

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

The view v_daily_activity_weekly_schedule presents daily activities with their parent weekly schedule information, providing context for any individual activity record. This is the most granular analytical view, showing each activity in the context of its week, plan, and the overall training structure.

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

The view v_daily_activity_dog joins daily activities with dog records, answering which dog performed which activity and under what fitness and health conditions. This view is critical for monitoring individual animal progress and ensuring that training loads are appropriate for each dog's current condition. For example, reviewing the activities of dog DOG-2335 (an advanced, injured dog) requires careful attention to whether the prescribed activities account for the injured health status.

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

The view v_daily_activity_owner joins daily activities with owner records, showing which owner supervised each training session and at what experience level. This view supports quality assurance by correlating activity outcomes with the experience level of the supervising owner.

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

The view v_dog_training_plan_detail combines dog records with their associated training plans, providing a comprehensive view of which dogs are enrolled in which programs and the status of those programs. This view is useful for program administrators who need to see the full picture of dog-to-plan assignments.

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

The view v_dog_daily_activity_detail joins dog records with their daily activities, creating a complete training history for each dog. This view aggregates all activities across all weeks and plans for a given dog, enabling longitudinal analysis of an animal's conditioning over time.

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

The view v_owner_daily_activity_detail joins owner records with their supervised daily activities, providing a complete record of each owner's training supervision history. This view supports accountability and performance review by showing the volume and variety of activities each owner has overseen.

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

The view v_owner_dog joins owner records with their assigned dogs, answering the question of which owner is responsible for which dog. This is a foundational view for understanding the human-animal pairing structure of the training program.

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

The view v_physical_event_training_plan_detail joins physical events with their associated training plans, providing a comprehensive view of all preparation cycles targeting a given event. This view is essential for event coordinators who need to see the full landscape of training activity surrounding a specific competition or demonstration.

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

The domain of structured canine fitness programs operates through a layered hierarchy: physical events motivate training plans, plans decompose into weekly schedules, and weekly schedules are filled with daily activities. Each layer is populated by records that capture quantitative measures — distances, durations, intensities — alongside qualitative descriptors — breed classifications, health statuses, experience levels. The junction tables and analytical views provide the connective tissue that allows practitioners to navigate this hierarchy in either direction, from the broadest event down to the individual walk, or from a single activity up to the event that motivated it. The system's design ensures that every training action can be traced to its source in a plan, its context within a week, and its purpose in relation to an event, creating a complete audit trail that supports both operational management and long-term program evaluation.