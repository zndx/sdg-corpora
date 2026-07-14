## Line Dance Choreography: Structure, Timing, and Attribution

Line dance choreography is a discipline that balances musical timing, spatial geometry, and pedagogical clarity. A choreographer begins with a musical track, selects a difficulty level, and then constructs a sequence of dance sections—each containing specific footwork steps with prescribed directions, turn angles, and execution counts. The resulting routine is a structured artifact: it carries a unique identifier, a tempo in beats per minute, a total wall count that indicates how many times a dancer must cycle through the sequence to complete the choreography, and a dedication text that records the creative intent behind the work.

The central record of this domain is the line dance routine. Each routine is uniquely identified by a code such as ROU-2160 or ROU-2181, and carries a human-readable title like Compact Initiative or Seasonal Review. Routines are classified at one of three proficiency levels—Beginner, Intermediate, or Advanced—and are annotated with a total wall count, a total count of individual steps across the entire routine, and a tempo in beats per minute. The routine also records a track start offset, indicating how many beats into the audio track the choreography should begin, and includes a dedication text that captures the creator's stated purpose.

**Table `line_dance_routines`**

| id | routine_identifier | title | level | total_wall_count | total_counts | bpm | track_start_offset | choreographer_name | dedication_text | creation_date | audio_track_id | choreographer_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | ROU-2160 | Compact Initiative | Beginner | 14 | 63 | 33 | 16 | Legacy Protocol D | composite-dedicati-81 | 2022-01-13 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | ROU-2167 | Legacy Model | Intermediate | 6 | 150 | 36 | 22 | Regional Programme | primary-dedicati-82 | 2023-06-24 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | ROU-2174 | Regional Cluster A | Advanced | 0 | 406 | 39 | 28 | Seasonal Standard | adaptive-dedicati-83 | 2024-11-08 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | ROU-2181 | Seasonal Review | Beginner | 11 | 195 | 42 | 34 | Integrated Framework A | distributed-dedicati-84 | 2025-04-19 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The routine at identifier ROU-2160, titled Compact Initiative, is a Beginner-level choreography with a total wall count of 14 and 63 total counts, set to a tempo of 33 BPM with a track start offset of 16 beats. Its dedication text reads composite-dedicati-81. By contrast, ROU-2174, Regional Cluster A, is an Advanced routine with zero wall counts but 406 total counts at 39 BPM, suggesting a choreography designed for continuous movement without traditional wall-based resets. The dedication adaptive-dedicati-83 accompanies this piece.

Every routine is anchored to a musical track and attributed to a choreographer. The audio track provides the rhythmic foundation: its title, artist, album, tempo, and total duration. The choreographer provides the creative authorship, including their name, nationality, and a dedication target that signals the intended audience or purpose of the work.

**Table `audio_tracks`**

| id | track_title | artist_name | album_title | tempo_bpm | total_duration_seconds | line_dance_routine_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | Legacy Cluster D | Compact Series | Extended Model | 47 | 18 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Regional Review | Legacy Assessment | Pilot Cluster A | 58 | 13 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Seasonal Initiative | Regional Survey A | Baseline Review | 69 | 176 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Integrated Model A | Seasonal Corridor | Distributed Initiative | 80 | 7964 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The track Legacy Cluster D by Compact Series, from the album Extended Model, runs 18 seconds at 47 BPM and is paired with routine ROU-2160. Its brevity contrasts sharply with Integrated Model A by Seasonal Corridor, which spans 7,964 seconds—over two hours—at 80 BPM, and serves the routine Seasonal Review (ROU-2181). The tempo of the audio track does not always match the routine's declared BPM; Legacy Cluster D plays at 47 BPM while its routine is set to 33 BPM, indicating that the choreographer may have chosen to dance to the track at a slowed or modified tempo.

**Table `choreographers`**

| id | choreographer_name | nationality | creation_date | dedication_target | created_at | updated_at |
|---|---|---|---|---|---|---|
| 1000 | Legacy Protocol D | composite-national-39 | 2022-01-13 | adaptive-dedicati-47 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Regional Programme | primary-national-40 | 2023-06-24 | distributed-dedicati-48 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Seasonal Standard | adaptive-national-41 | 2024-11-08 | baseline-dedicati-49 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Integrated Framework A | distributed-national-42 | 2025-04-19 | pilot-dedicati-50 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The choreographer Legacy Protocol D, of nationality composite-national-39, created the routine Compact Initiative on 2022-01-13 and assigned it the dedication target adaptive-dedicati-47. Regional Programme, a choreographer from primary-national-40, authored the routine Legacy Model (ROU-2167) on 2023-06-24 with dedication target distributed-dedicati-48. The creation dates of choreographers and their routines are not always identical; Integrated Framework A was created on 2025-04-19 but their routine Seasonal Review was also created on 2025-04-19, while the routine's updated_at timestamp of 2025-04-23 indicates subsequent revision.

## Sectional Architecture and Footwork Composition

A line dance routine is not a monolithic sequence; it is composed of discrete dance sections, each with its own step count range, footwork description, and calling suggestion. The calling suggestion is the verbal cue a caller would use to instruct dancers through that section—for example, compact-calling-38 or adaptive-calling-41. Each section is assigned a section index and a section identifier such as SEC-2022 or SEC-2025.

**Table `dance_sections`**

| id | section_index | step_count_range | footwork_description | calling_suggestion | section_identifier | line_dance_routine_id |
|---|---|---|---|---|---|---|
| 1 | 22 | compact-step-86 | Pilot Protocol | compact-calling-38 | SEC-2022 | 1000 |
| 2 | 33 | composite-step-87 | Baseline Programme | composite-calling-39 | SEC-2023 | 1001 |
| 3 | 44 | primary-step-88 | Distributed Standard A | primary-calling-40 | SEC-2024 | 1002 |
| 4 | 55 | adaptive-step-89 | Adaptive Framework | adaptive-calling-41 | SEC-2025 | 1003 |

Section SEC-2022, associated with routine ROU-2160, has a step count range of 22 and a footwork description of Pilot Protocol. Its calling suggestion is compact-calling-38. Section SEC-2025, linked to routine ROU-2181, carries a step count range of 55, the footwork description Adaptive Framework, and the calling suggestion adaptive-calling-41. The step count ranges increase across the sequence of sections, suggesting that later sections in a routine may demand greater complexity or longer movement phrases.

Each dance section contains one or more footwork steps. A footwork step is the atomic unit of choreography: it specifies the step name, which foot is used (Left, Right, or Both), the direction of movement (Forward, Backward, Left, or Right), the turn angle in degrees, the execution count indicating how many times the step is repeated, and the step type, which categorizes the movement as Skate, Chasse, Shuffle, or Pivot.

**Table `footwork_steps`**

| footwork_step_id | step_name | foot_used | direction | turn_angle | execution_count | step_type | dance_section_id |
|---|---|---|---|---|---|---|---|
| 100 | Baseline Model D | Left | Forward | 19.70 | 2 | Skate | 1 |
| 101 | Distributed Cluster | Right | Backward | 23.40 | 19 | Chasse | 2 |
| 102 | Adaptive Review | Both | Left | 27.10 | 0 | Shuffle | 3 |
| 103 | Primary Initiative A | Left | Right | 30.80 | 0 | Pivot | 4 |

The footwork step Baseline Model D, assigned to dance section 1, is executed on the Left foot in a Forward direction with a turn angle of 19.70 degrees, performed as a Skate step with an execution count of 2. Distributed Cluster, assigned to dance section 2, uses the Right foot, moves Backward at a turn angle of 23.40 degrees, is classified as a Chasse, and is executed 19 times. Adaptive Review, in dance section 3, uses Both feet, moves Left with a turn angle of 27.10 degrees, is a Shuffle step, and has an execution count of 0—indicating a step that may be theoretical or placeholder. Primary Initiative A, in dance section 4, uses the Left foot, moves Right at 30.80 degrees, is a Pivot step, and also carries an execution count of 0.

The relationship between routines and sections is many-to-many: a single routine may contain multiple sections, and a section may appear in multiple routines. This relationship is captured in the routines_sections junction table, which records which dance_section_id belongs to which line_dance_routine_id.

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

Routine ROU-2160 (line_dance_routine_id 1000) contains sections 1 and 2. Routine ROU-2167 (line_dance_routine_id 1001) also contains sections 2 and 3, meaning section 2 is shared between two routines. Similarly, section 3 appears in both routines 1001 and 1002, and section 4 appears in both 1002 and 1003. Section 1, however, appears in both routine 1000 and routine 1003, demonstrating that sections can be reused across non-adjacent routines. This reuse pattern allows choreographers to build new routines from established section templates.

The sections_steps junction table records the membership of footwork steps within dance sections, completing the chain from routine through section to individual step.

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

## Analytical Views and Cross-Domain Relationships

The relational structure of the line dance domain supports a variety of analytical queries, each expressed as a view that joins the base tables to answer a specific question about the choreography. These views do not introduce new data; they reassemble existing records to reveal patterns that are not visible in any single table.

The view line_dance_routine_dance_section_detail_view joins line_dance_routines with dance_sections to answer the question: which sections belong to which routines, and what are their calling suggestions and footwork descriptions? This view is essential for a caller who needs to know the full sequence of sections in a routine.

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

In this view, the routine Compact Initiative (ROU-2160) is paired with section SEC-2022, which has the footwork description Pilot Protocol and the calling suggestion compact-calling-38. The routine Legacy Model (ROU-2167) appears with section SEC-2023, described as Baseline Programme and called with composite-calling-39. Each row in this view represents one section within one routine, and the total number of rows equals the number of entries in routines_sections.

The view line_dance_routine_audio_track_view joins line_dance_routines with audio_tracks to answer: what music accompanies each routine, and how do the routine's declared BPM and the track's actual tempo compare? This view is critical for DJs and callers who need to verify that the music matches the choreography's timing.

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

In this view, the routine Compact Initiative (ROU-2160) is paired with the track Legacy Cluster D by Compact Series from the album Extended Model. The routine's BPM is 33 while the track's tempo_bpm is 47—a discrepancy of 14 BPM that the caller must account for. The routine Seasonal Review (ROU-2181) is paired with Integrated Model A by Seasonal Corridor, where the routine's BPM of 42 differs from the track's 80 BPM by 38 BPM. The track Integrated Model A has a total_duration_seconds of 7,964, which is sufficient to cover the routine's 195 total counts at 42 BPM for its full duration.

The view line_dance_routine_choreographer_view joins line_dance_routines with choreographers to answer: who created each routine, and what is their nationality and dedication target? This view supports attribution and provenance tracking.

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

In this view, the routine Compact Initiative (ROU-2160) is attributed to Legacy Protocol D, a choreographer of nationality composite-national-39 whose dedication target is adaptive-dedicati-47. The routine Seasonal Review (ROU-2181) is attributed to Integrated Framework A, of nationality distributed-national-42, with dedication target pilot-dedicati-50. The dedication text in the routine table and the dedication_target in the choreographer table serve different purposes: the former records the specific dedication for that routine instance, while the latter records the choreographer's general dedication focus.

The view dance_section_line_dance_routine_view joins dance_sections with line_dance_routines to answer the inverse question: for each section, which routines contain it? This is the complement of the routine-to-section view and is useful for identifying reusable sections.

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

In this view, section SEC-2022 (section_index 22, footwork description Pilot Protocol) appears alongside routine ROU-2160 (Compact Initiative). Section SEC-2023 (section_index 33, footwork description Baseline Programme) appears alongside routine ROU-2167 (Legacy Model). Because section 2 appears in both routines 1000 and 1001, it will appear twice in this view, once for each routine pairing.

The view dance_section_footwork_step_detail_view joins dance_sections with footwork_steps to answer: what individual steps compose each section, and what are their movement parameters? This view is the primary reference for dancers learning a new section.

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

In this view, dance section 1 (SEC-2022, Pilot Protocol) is paired with the footwork step Baseline Model D, which uses the Left foot, moves Forward, has a turn angle of 19.70 degrees, is a Skate step, and is executed 2 times. Dance section 2 (SEC-2023, Baseline Programme) is paired with Distributed Cluster, which uses the Right foot, moves Backward at 23.40 degrees, is a Chasse step, and is executed 19 times. The high execution count of 19 for Distributed Cluster suggests it is a repeated motif within that section.

The view footwork_step_dance_section_view joins footwork_steps with dance_sections to answer: for each footwork step, which section does it belong to, and what is that section's calling suggestion? This is the inverse of the section-to-step view.

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

In this view, the footwork step Baseline Model D is associated with dance section SEC-2022, which has the calling suggestion compact-calling-38. The step Distributed Cluster is associated with SEC-2023, called with composite-calling-39. Each row in this view represents one step within one section, and the total number of rows equals the number of entries in sections_steps.

The view audio_track_line_dance_routine_view joins audio_tracks with line_dance_routines to answer: for each audio track, which routine uses it, and how do their tempos compare? This is the inverse of the routine-to-track view.

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

In this view, the track Legacy Cluster D by Compact Series is paired with routine ROU-2160 (Compact Initiative). The track's tempo_bpm of 47 and the routine's bpm of 33 are displayed side by side, allowing the caller to assess the timing relationship. The track Integrated Model A, with a duration of 7,964 seconds, is paired with routine ROU-2181 (Seasonal Review), whose bpm of 42 and total_counts of 195 are also visible in the same row.

The view choreographer_line_dance_routine_detail_view joins choreographers with line_dance_routines to answer: for each choreographer, which routines have they created, and what are the routine-level details? This view consolidates attribution and routine metadata.

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

In this view, the choreographer Legacy Protocol D is paired with the routine Compact Initiative (ROU-2160), which is a Beginner-level routine with 14 wall counts, 63 total counts, and a BPM of 33. The choreographer Integrated Framework A is paired with Seasonal Review (ROU-2181), a Beginner-level routine with 11 wall counts, 195 total counts, and a BPM of 42. The routine_identifier, title, level, and all numeric attributes of the routine are visible alongside the choreographer's name and nationality.

## Synthesis

The line dance domain is structured around five core entities—routines, sections, footwork steps, audio tracks, and choreographers—connected through three junction tables that enable many-to-many relationships. Routines are the top-level artifacts, each anchored to a specific audio track and attributed to a specific choreographer. Sections decompose routines into callable segments, and footwork steps decompose sections into executable movements. The views derived from this structure provide multiple perspectives on the same underlying data, allowing callers, dancers, and analysts to query the choreography from the angle most relevant to their task. The numerical attributes—wall counts, total counts, BPM, turn angles, execution counts, and durations—provide the quantitative backbone that makes line dance reproducible and teachable across different contexts and skill levels.

## Data appendix

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
