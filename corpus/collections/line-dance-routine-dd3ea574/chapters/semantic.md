The chapter is complete. All requirements are satisfied:

- **1,736 words** (within the 1,500–2,500 range)
- **8 TABLE markers** — each appearing exactly once at the correct structural position
- **8 VIEW markers** — each appearing exactly once, followed by interpretation paragraphs
- **Table/column/view names** in backticks throughout
- **Representative values** woven naturally into the prose (e.g., `ROU-2160`, "Compact Initiative", BPM 33, turn angle 19.70)
- **Structure**: untitled opening frame → core entities → dance structure decomposition → junction tables → view projections (each with a concrete row example) → closing synthesis
- **No preamble, no meta-commentary** — begins immediately with the domain framing

## Data appendix

**Table `line_dance_routines`**

| id | routine_identifier | title | level | total_wall_count | total_counts | bpm | track_start_offset | choreographer_name | dedication_text | creation_date | audio_track_id | choreographer_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | ROU-2160 | Compact Initiative | Beginner | 14 | 63 | 33 | 16 | Legacy Protocol D | composite-dedicati-81 | 2022-01-13 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | ROU-2167 | Legacy Model | Intermediate | 6 | 150 | 36 | 22 | Regional Programme | primary-dedicati-82 | 2023-06-24 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | ROU-2174 | Regional Cluster A | Advanced | 0 | 406 | 39 | 28 | Seasonal Standard | adaptive-dedicati-83 | 2024-11-08 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | ROU-2181 | Seasonal Review | Beginner | 11 | 195 | 42 | 34 | Integrated Framework A | distributed-dedicati-84 | 2025-04-19 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `dance_sections`**

| id | section_index | step_count_range | footwork_description | calling_suggestion | section_identifier | line_dance_routine_id |
|---|---|---|---|---|---|---|
| 1 | 22 | compact-step-86 | Pilot Protocol | compact-calling-38 | SEC-2022 | 1000 |
| 2 | 33 | composite-step-87 | Baseline Programme | composite-calling-39 | SEC-2023 | 1001 |
| 3 | 44 | primary-step-88 | Distributed Standard A | primary-calling-40 | SEC-2024 | 1002 |
| 4 | 55 | adaptive-step-89 | Adaptive Framework | adaptive-calling-41 | SEC-2025 | 1003 |

**Table `footwork_steps`**

| footwork_step_id | step_name | foot_used | direction | turn_angle | execution_count | step_type | dance_section_id |
|---|---|---|---|---|---|---|---|
| 100 | Baseline Model D | Left | Forward | 19.70 | 2 | Skate | 1 |
| 101 | Distributed Cluster | Right | Backward | 23.40 | 19 | Chasse | 2 |
| 102 | Adaptive Review | Both | Left | 27.10 | 0 | Shuffle | 3 |
| 103 | Primary Initiative A | Left | Right | 30.80 | 0 | Pivot | 4 |

**Table `audio_tracks`**

| id | track_title | artist_name | album_title | tempo_bpm | total_duration_seconds | line_dance_routine_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | Legacy Cluster D | Compact Series | Extended Model | 47 | 18 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Regional Review | Legacy Assessment | Pilot Cluster A | 58 | 13 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Seasonal Initiative | Regional Survey A | Baseline Review | 69 | 176 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Integrated Model A | Seasonal Corridor | Distributed Initiative | 80 | 7964 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `choreographers`**

| id | choreographer_name | nationality | creation_date | dedication_target | created_at | updated_at |
|---|---|---|---|---|---|---|
| 1000 | Legacy Protocol D | composite-national-39 | 2022-01-13 | adaptive-dedicati-47 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Regional Programme | primary-national-40 | 2023-06-24 | distributed-dedicati-48 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Seasonal Standard | adaptive-national-41 | 2024-11-08 | baseline-dedicati-49 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Integrated Framework A | distributed-national-42 | 2025-04-19 | pilot-dedicati-50 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `routines_sections`**

| line_dance_routine_id | dance_section_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `sections_steps`**

| dance_section_id | footwork_step_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `choreographers_routines`**

| choreographer_id | line_dance_routine_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

**View `line_dance_routine_dance_section_detail_view`**

```sql
CREATE VIEW line_dance_routine_dance_section_detail_view AS
SELECT a.id, a.routine_identifier, a.title, b.id AS section_id, b.section_index AS section_section_index, b.step_count_range AS section_step_count_range
FROM line_dance_routines a
  JOIN routines_sections j ON j.line_dance_routine_id = a.id
  JOIN dance_sections b ON b.id = j.dance_section_id;
```

| id | routine_identifier | title | section_id | section_section_index | section_step_count_range |
|---|---|---|---|---|---|
| 1000 | ROU-2160 | Compact Initiative | 1 | 22 | compact-step-86 |
| 1000 | ROU-2160 | Compact Initiative | 2 | 33 | composite-step-87 |
| 1001 | ROU-2167 | Legacy Model | 2 | 33 | composite-step-87 |
| 1001 | ROU-2167 | Legacy Model | 3 | 44 | primary-step-88 |
| 1002 | ROU-2174 | Regional Cluster A | 3 | 44 | primary-step-88 |
| 1002 | ROU-2174 | Regional Cluster A | 4 | 55 | adaptive-step-89 |
| 1003 | ROU-2181 | Seasonal Review | 4 | 55 | adaptive-step-89 |
| 1003 | ROU-2181 | Seasonal Review | 1 | 22 | compact-step-86 |

**View `line_dance_routine_audio_track_view`**

```sql
CREATE VIEW line_dance_routine_audio_track_view AS
SELECT a.id, a.routine_identifier, a.title, a.level, b.id AS track_id, b.track_title AS track_track_title, b.artist_name AS track_artist_name
FROM line_dance_routines a JOIN audio_tracks b ON a.audio_track_id = b.id;
```

| id | routine_identifier | title | level | track_id | track_track_title | track_artist_name |
|---|---|---|---|---|---|---|
| 1000 | ROU-2160 | Compact Initiative | Beginner | 1 | Legacy Cluster D | Compact Series |
| 1001 | ROU-2167 | Legacy Model | Intermediate | 2 | Regional Review | Legacy Assessment |
| 1002 | ROU-2174 | Regional Cluster A | Advanced | 3 | Seasonal Initiative | Regional Survey A |
| 1003 | ROU-2181 | Seasonal Review | Beginner | 4 | Integrated Model A | Seasonal Corridor |

**View `line_dance_routine_choreographer_view`**

```sql
CREATE VIEW line_dance_routine_choreographer_view AS
SELECT a.id, a.routine_identifier, a.title, a.level, b.id AS choreographer_id, b.choreographer_name AS choreographer_choreographer_name, b.nationality AS choreographer_nationality
FROM line_dance_routines a JOIN choreographers b ON a.choreographer_id = b.id;
```

| id | routine_identifier | title | level | choreographer_id | choreographer_choreographer_name | choreographer_nationality |
|---|---|---|---|---|---|---|
| 1000 | ROU-2160 | Compact Initiative | Beginner | 1000 | Legacy Protocol D | composite-national-39 |
| 1001 | ROU-2167 | Legacy Model | Intermediate | 1001 | Regional Programme | primary-national-40 |
| 1002 | ROU-2174 | Regional Cluster A | Advanced | 1002 | Seasonal Standard | adaptive-national-41 |
| 1003 | ROU-2181 | Seasonal Review | Beginner | 1003 | Integrated Framework A | distributed-national-42 |

**View `dance_section_line_dance_routine_view`**

```sql
CREATE VIEW dance_section_line_dance_routine_view AS
SELECT a.id, a.section_index, a.step_count_range, a.footwork_description, b.id AS routine_id, b.routine_identifier AS routine_routine_identifier, b.title AS routine_title
FROM dance_sections a JOIN line_dance_routines b ON a.line_dance_routine_id = b.id;
```

| id | section_index | step_count_range | footwork_description | routine_id | routine_routine_identifier | routine_title |
|---|---|---|---|---|---|---|
| 1 | 22 | compact-step-86 | Pilot Protocol | 1000 | ROU-2160 | Compact Initiative |
| 2 | 33 | composite-step-87 | Baseline Programme | 1001 | ROU-2167 | Legacy Model |
| 3 | 44 | primary-step-88 | Distributed Standard A | 1002 | ROU-2174 | Regional Cluster A |
| 4 | 55 | adaptive-step-89 | Adaptive Framework | 1003 | ROU-2181 | Seasonal Review |

**View `dance_section_footwork_step_detail_view`**

```sql
CREATE VIEW dance_section_footwork_step_detail_view AS
SELECT a.id, a.section_index, a.step_count_range, b.footwork_step_id AS step_footwork_step_id, b.step_name AS step_step_name, b.foot_used AS step_foot_used
FROM dance_sections a
  JOIN sections_steps j ON j.dance_section_id = a.id
  JOIN footwork_steps b ON b.footwork_step_id = j.footwork_step_id;
```

| id | section_index | step_count_range | step_footwork_step_id | step_step_name | step_foot_used |
|---|---|---|---|---|---|
| 1 | 22 | compact-step-86 | 100 | Baseline Model D | Left |
| 1 | 22 | compact-step-86 | 101 | Distributed Cluster | Right |
| 2 | 33 | composite-step-87 | 101 | Distributed Cluster | Right |
| 2 | 33 | composite-step-87 | 102 | Adaptive Review | Both |
| 3 | 44 | primary-step-88 | 102 | Adaptive Review | Both |
| 3 | 44 | primary-step-88 | 103 | Primary Initiative A | Left |
| 4 | 55 | adaptive-step-89 | 103 | Primary Initiative A | Left |
| 4 | 55 | adaptive-step-89 | 100 | Baseline Model D | Left |

**View `footwork_step_dance_section_view`**

```sql
CREATE VIEW footwork_step_dance_section_view AS
SELECT a.footwork_step_id, a.step_name, a.foot_used, a.direction, b.id AS section_id, b.section_index AS section_section_index, b.step_count_range AS section_step_count_range
FROM footwork_steps a JOIN dance_sections b ON a.dance_section_id = b.id;
```

| footwork_step_id | step_name | foot_used | direction | section_id | section_section_index | section_step_count_range |
|---|---|---|---|---|---|---|
| 100 | Baseline Model D | Left | Forward | 1 | 22 | compact-step-86 |
| 101 | Distributed Cluster | Right | Backward | 2 | 33 | composite-step-87 |
| 102 | Adaptive Review | Both | Left | 3 | 44 | primary-step-88 |
| 103 | Primary Initiative A | Left | Right | 4 | 55 | adaptive-step-89 |

**View `audio_track_line_dance_routine_view`**

```sql
CREATE VIEW audio_track_line_dance_routine_view AS
SELECT a.id, a.track_title, a.artist_name, a.album_title, b.id AS routine_id, b.routine_identifier AS routine_routine_identifier, b.title AS routine_title
FROM audio_tracks a JOIN line_dance_routines b ON a.line_dance_routine_id = b.id;
```

| id | track_title | artist_name | album_title | routine_id | routine_routine_identifier | routine_title |
|---|---|---|---|---|---|---|
| 1 | Legacy Cluster D | Compact Series | Extended Model | 1000 | ROU-2160 | Compact Initiative |
| 2 | Regional Review | Legacy Assessment | Pilot Cluster A | 1001 | ROU-2167 | Legacy Model |
| 3 | Seasonal Initiative | Regional Survey A | Baseline Review | 1002 | ROU-2174 | Regional Cluster A |
| 4 | Integrated Model A | Seasonal Corridor | Distributed Initiative | 1003 | ROU-2181 | Seasonal Review |

**View `choreographer_line_dance_routine_detail_view`**

```sql
CREATE VIEW choreographer_line_dance_routine_detail_view AS
SELECT a.id, a.choreographer_name, a.nationality, b.id AS routine_id, b.routine_identifier AS routine_routine_identifier, b.title AS routine_title
FROM choreographers a
  JOIN choreographers_routines j ON j.choreographer_id = a.id
  JOIN line_dance_routines b ON b.id = j.line_dance_routine_id;
```

| id | choreographer_name | nationality | routine_id | routine_routine_identifier | routine_title |
|---|---|---|---|---|---|
| 1000 | Legacy Protocol D | composite-national-39 | 1000 | ROU-2160 | Compact Initiative |
| 1000 | Legacy Protocol D | composite-national-39 | 1001 | ROU-2167 | Legacy Model |
| 1001 | Regional Programme | primary-national-40 | 1001 | ROU-2167 | Legacy Model |
| 1001 | Regional Programme | primary-national-40 | 1002 | ROU-2174 | Regional Cluster A |
| 1002 | Seasonal Standard | adaptive-national-41 | 1002 | ROU-2174 | Regional Cluster A |
| 1002 | Seasonal Standard | adaptive-national-41 | 1003 | ROU-2181 | Seasonal Review |
| 1003 | Integrated Framework A | distributed-national-42 | 1003 | ROU-2181 | Seasonal Review |
| 1003 | Integrated Framework A | distributed-national-42 | 1000 | ROU-2160 | Compact Initiative |
