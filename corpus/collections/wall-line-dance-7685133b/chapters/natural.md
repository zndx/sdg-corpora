## The Choreographic Record

Wall line dance choreography and event production form a structured ecosystem where artistic composition, musical accompaniment, and venue logistics intersect. Each choreographed routine — catalogued as a wall line dance — carries a complete production profile: a difficulty level, a target participant count, a musical tempo, and a dedication. These routines are decomposed into ordered sections, each section into discrete steps, and each routine is paired with a music track for performance. Events bring these choreographies to physical venues, where participant counts and competition levels define the scale of the gathering. The data model captures every layer of this pipeline, from the initial choreographic concept through to the final event execution.

**Table `wall_line_dances`**

| id | dance_id | title | level | total_counts | music_bpm | start_offset_seconds | choreographer_name | choreography_date | dedication_text | music_track_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 726036 | Compact Initiative | Beginner | 63 | 24 | 10.45 | Legacy Protocol D | 2024-11-14 | composite-dedicati-81 | 1 |
| 2 | bss | Legacy Model | Intermediate | 150 | 33 | 14.90 | Regional Programme | 2025-04-25 | primary-dedicati-82 | 2 |
| 3 | 611500 | Regional Cluster A | Advanced | 406 | 42 | 19.35 | Seasonal Standard | 2022-09-09 | adaptive-dedicati-83 | 3 |
| 4 | 2986226 | Seasonal Review | Beginner | 195 | 51 | 23.80 | Integrated Framework A | 2023-02-20 | distributed-dedicati-84 | 4 |

A wall line dance serves as the root entity in the choreographic record. The `id` column provides a surrogate key for internal lookups, while `dance_id` carries the external identifier — values such as `726036` for "Compact Initiative" and `bss` for "Legacy Model" — that link to external choreography registries. The `title` field holds the human-readable name, and `level` classifies the routine into one of three tiers: Beginner, Intermediate, or Advanced. The `total_counts` column records the expected number of participants, ranging from 40 for "Regional Cluster A" to 150 for "Legacy Model." Musical direction is captured in `music_bpm`, which specifies the beats per minute for the accompanying track, and `start_offset_seconds` indicates the delay before dancers begin, measured in seconds from the music's onset. The `choreographer_name` field attributes authorship — "Legacy Protocol D" for the first routine, "Regional Programme" for the second — while `choreography_date` records when the routine was finalized. A `dedication_text` field, holding values like `composite-dedicati-81`, provides a textual dedication, and `music_track_id` links the routine to its associated music track in the `music_tracks` table.

**Table `dance_sections`**

| section_id | section_number | count_range | actual_footwork | calling_suggestion | step_count | wall_line_dance_id |
|---|---|---|---|---|---|---|
| 195362 | 43 | primary-count-76 | seasonal-actual-23 | compact-calling-38 | 259 | 1 |
| 7731870 | 54 | adaptive-count-77 | regional-actual-24 | composite-calling-39 | 13 | 2 |
| 4447016 | 65 | distributed-count-78 | legacy-actual-25 | primary-calling-40 | 1147 | 3 |
| 3001009030220 | 76 | baseline-count-79 | compact-actual-26 | adaptive-calling-41 | 19 | 4 |

Each wall line dance is partitioned into sections, recorded in the `dance_sections` table. The `section_id` is the primary key, while `section_number` provides a human-readable ordering — values such as 43, 54, 65, and 76 appear in the sample data. The `count_range` column describes the expected participant band for that section, using coded values like `primary-count-76` and `adaptive-count-77`. The `actual_footwork` field specifies the footwork pattern, with entries such as `seasonal-actual-23` and `regional-actual-24`. The `calling_suggestion` column holds the verbal cue given by the caller, for instance `compact-calling-38` or `composite-calling-39`. The `step_count` records how many individual steps compose the section — ranging from 13 steps in section 7731870 to 1,147 steps in section 4447016 — and `wall_line_dance_id` links the section back to its parent routine.

**Table `dance_steps`**

| id | step_id | step_name | foot_used | direction | turn_angle | execution_order | section_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 8667ec1da10c4a0293d91388b49bc77c | Baseline Model D | Left | Forward | 19.70 | 23 | 195362 | 2025-01-01 00:14:00 |
| 2 | 1996940 | Distributed Cluster | Right | Backward | 23.40 | 26 | 7731870 | 2025-02-06 03:14:00 |
| 3 | 18355501 | Adaptive Review | Both | Left | 27.10 | 29 | 4447016 | 2025-03-11 06:14:00 |
| 4 | 22073356 | Primary Initiative A | Left | Right | 30.80 | 32 | 3001009030220 | 2025-04-16 09:14:00 |

The atomic unit of choreography is the dance step, stored in `dance_steps`. Each step carries a UUID-style `step_id` — for example, `8667ec1da10c4a0293d91388b49bc77c` for "Baseline Model D" — alongside a human-readable `step_name`. The `foot_used` column indicates whether the dancer uses the Left foot, Right foot, or Both feet. The `direction` field specifies the movement vector: Forward, Backward, Left, or Right. The `turn_angle` records the angular displacement in degrees, with sample values ranging from 19.70° to 30.80°. The `execution_order` column defines the step's position within its section, and `section_id` links the step to its parent section. A `created_at` timestamp records when the step was entered into the system.

**Table `music_tracks`**

| id | track_id | title | artist_name | album_title | tempo_bpm | duration_seconds | release_year | wall_line_dance_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | Compact Initiative | Compact Series | Extended Model | 47 | 7.45 | 36 | 1 |
| 2 | c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | Legacy Model | Legacy Assessment | Pilot Cluster A | 58 | 9.90 | 45 | 2 |
| 3 | ChIJAQAAAEdu5kcRp4d7TOT5gNw | Regional Cluster A | Regional Survey A | Baseline Review | 69 | 12.35 | 54 | 3 |
| 4 | 3743998 | Seasonal Review | Seasonal Corridor | Distributed Initiative | 80 | 14.80 | 63 | 4 |

Every wall line dance is paired with a music track, recorded in the `music_tracks` table. The `id` column is the surrogate key, while `track_id` carries the external identifier — a UUID such as `9229485c-9bad-11eb-a8a2-19ed5c03f8d3` for the first track, or a numeric code like `3743998` for the fourth. The `title` and `artist_name` fields identify the composition and its creator, while `album_title` provides the album context. The `tempo_bpm` column specifies the track's tempo, ranging from 47 BPM for "Compact Initiative" to 80 BPM for "Seasonal Review." The `duration_seconds` field records the track length, and `release_year` provides the year of release. The `wall_line_dance_id` column links the track back to its associated routine.

**Table `dance_events`**

| id | event_id | event_name | event_date | location | competition_level | participant_count | wall_line_dance_id | venue_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | Seasonal Standard | 2025-04-15 | extended-location-99 | Regional | 100 | 1 | 1000 |
| 2 | 168535 | Integrated Framework | 2022-09-26 | integrated-location-100 | National | 27 | 2 | 1001 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10 | seasonal-location-101 | Worlds | 23 | 3 | 1002 |
| 4 | 1186089 | Pilot Programme | 2024-07-21 | regional-location-102 | Regional | 34 | 4 | 1003 |

Events operationalize choreographies in physical spaces. The `dance_events` table records each event with a surrogate `id`, an external `event_id`, and an `event_name` such as "Seasonal Standard" or "Integrated Framework." The `event_date` records when the event occurs, `location` provides a coded venue descriptor, and `competition_level` classifies the event as Regional, National, or Worlds. The `participant_count` column records the number of attendees, ranging from 27 for "Integrated Framework" to 100 for "Seasonal Standard." The `wall_line_dance_id` links the event to the choreography being performed, and `venue_id` links it to the physical venue.

**Table `venues`**

| venue_id | venue_name | city | country | floor_type | capacity |
|---|---|---|---|---|---|
| 1000 | Legacy Review D | integrated-city-34 | compact-country-26 | Wood | 32 |
| 1001 | Regional Initiative | seasonal-city-35 | composite-country-27 | Marley | 41 |
| 1002 | Seasonal Model | regional-city-36 | primary-country-28 | Concrete | 50 |
| 1003 | Integrated Cluster A | legacy-city-37 | adaptive-country-29 | Synthetic | 59 |

Venues provide the physical infrastructure for events. The `venue_id` is the surrogate key, while `venue_name` holds the human-readable name — "Legacy Review D," "Regional Initiative," "Seasonal Model," and "Integrated Cluster A" in the sample data. The `city` and `country` fields locate the venue geographically, using coded values such as `integrated-city-34` and `compact-country-26`. The `floor_type` column specifies the dance floor surface — Wood, Marley, Concrete, or Synthetic — and `capacity` records the maximum occupancy, ranging from 32 for "Legacy Review D" to 59 for "Integrated Cluster A."

The choreographic record is further structured through associative tables that resolve many-to-many relationships. The `dances_sections` table links wall line dances to their sections, the `sections_steps` table links sections to their constituent steps, and the `venues_events` table links venues to their hosted events. These junction tables enable flexible composition: a single dance can appear across multiple events, a venue can host multiple events, and a section can contain multiple steps.

**Table `dances_sections`**

| wall_line_dance_id | section_id |
|---|---|
| 1 | 195362 |
| 1 | 7731870 |
| 2 | 7731870 |
| 2 | 4447016 |
| 3 | 4447016 |
| 3 | 3001009030220 |
| 4 | 3001009030220 |
| 4 | 195362 |

**Table `sections_steps`**

| section_id | dance_step_id |
|---|---|
| 195362 | 1 |
| 195362 | 2 |
| 7731870 | 2 |
| 7731870 | 3 |
| 4447016 | 3 |
| 4447016 | 4 |
| 3001009030220 | 4 |
| 3001009030220 | 1 |

**Table `venues_events`**

| venue_id | dance_event_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

Analytical views synthesize these base tables into queryable structures that answer specific operational questions. Each view joins the relevant tables to produce a flattened record that combines choreographic, musical, and logistical data.

**View `v_wall_line_dance_dance_section_detail`**

```sql
CREATE VIEW v_wall_line_dance_dance_section_detail AS
SELECT a.id, a.dance_id, a.title, b.section_id AS section_section_id, b.section_number AS section_section_number, b.count_range AS section_count_range
FROM wall_line_dances a
  JOIN dances_sections j ON j.wall_line_dance_id = a.id
  JOIN dance_sections b ON b.section_id = j.section_id;
```

| id | dance_id | title | section_section_id | section_section_number | section_count_range |
|---|---|---|---|---|---|
| 1 | 726036 | Compact Initiative | 195362 | 43 | primary-count-76 |
| 1 | 726036 | Compact Initiative | 7731870 | 54 | adaptive-count-77 |
| 2 | bss | Legacy Model | 7731870 | 54 | adaptive-count-77 |
| 2 | bss | Legacy Model | 4447016 | 65 | distributed-count-78 |
| 3 | 611500 | Regional Cluster A | 4447016 | 65 | distributed-count-78 |
| 3 | 611500 | Regional Cluster A | 3001009030220 | 76 | baseline-count-79 |
| 4 | 2986226 | Seasonal Review | 3001009030220 | 76 | baseline-count-79 |
| 4 | 2986226 | Seasonal Review | 195362 | 43 | primary-count-76 |

This view joins wall line dances with their sections, answering the question of which sections belong to which routine and what their structural properties are. A row from this view would show, for example, that the wall line dance "Compact Initiative" (id 1) contains section 195362, which has section number 43, a step count of 259, and a calling suggestion of `compact-calling-38`. The join preserves all level, BPM, and choreographer metadata from the dance alongside the section-specific footwork and count-range data.

**View `v_wall_line_dance_music_track`**

```sql
CREATE VIEW v_wall_line_dance_music_track AS
SELECT a.id, a.dance_id, a.title, a.level, b.id AS track_id, b.track_id AS track_track_id, b.title AS track_title
FROM wall_line_dances a JOIN music_tracks b ON a.music_track_id = b.id;
```

| id | dance_id | title | level | track_id | track_track_id | track_title |
|---|---|---|---|---|---|---|
| 1 | 726036 | Compact Initiative | Beginner | 1 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | Compact Initiative |
| 2 | bss | Legacy Model | Intermediate | 2 | c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | Legacy Model |
| 3 | 611500 | Regional Cluster A | Advanced | 3 | ChIJAQAAAEdu5kcRp4d7TOT5gNw | Regional Cluster A |
| 4 | 2986226 | Seasonal Review | Beginner | 4 | 3743998 | Seasonal Review |

This view pairs each wall line dance with its music track, answering the question of which track accompanies which routine and what the musical parameters are. A representative row would show that "Compact Initiative" (id 1) is paired with track `9229485c-9bad-11eb-a8a2-19ed5c03f8d3`, titled "Compact Initiative" by the Compact Series, at 47 BPM with a duration of 7.45 seconds. The view merges the dance's `music_bpm` with the track's `tempo_bpm`, allowing comparison between the choreographer's intended tempo and the actual track tempo.

**View `v_dance_section_wall_line_dance`**

```sql
CREATE VIEW v_dance_section_wall_line_dance AS
SELECT a.section_id, a.section_number, a.count_range, a.actual_footwork, b.id AS dance_id, b.dance_id AS dance_dance_id, b.title AS dance_title
FROM dance_sections a JOIN wall_line_dances b ON a.wall_line_dance_id = b.id;
```

| section_id | section_number | count_range | actual_footwork | dance_id | dance_dance_id | dance_title |
|---|---|---|---|---|---|---|
| 195362 | 43 | primary-count-76 | seasonal-actual-23 | 1 | 726036 | Compact Initiative |
| 7731870 | 54 | adaptive-count-77 | regional-actual-24 | 2 | bss | Legacy Model |
| 4447016 | 65 | distributed-count-78 | legacy-actual-25 | 3 | 611500 | Regional Cluster A |
| 3001009030220 | 76 | baseline-count-79 | compact-actual-26 | 4 | 2986226 | Seasonal Review |

This view inverts the relationship, starting from sections and resolving their parent dance. It answers the question of which dance a given section belongs to, carrying the dance's title, level, and choreographer into the section context. A row would show that section 195362 (section number 43, with 259 steps) belongs to the wall line dance "Compact Initiative," a Beginner-level routine choreographed by "Legacy Protocol D" on 2024-11-14.

**View `v_dance_section_dance_step_detail`**

```sql
CREATE VIEW v_dance_section_dance_step_detail AS
SELECT a.section_id, a.section_number, a.count_range, b.id AS step_id, b.step_id AS step_step_id, b.step_name AS step_step_name
FROM dance_sections a
  JOIN sections_steps j ON j.section_id = a.section_id
  JOIN dance_steps b ON b.id = j.dance_step_id;
```

| section_id | section_number | count_range | step_id | step_step_id | step_step_name |
|---|---|---|---|---|---|
| 195362 | 43 | primary-count-76 | 1 | 8667ec1da10c4a0293d91388b49bc77c | Baseline Model D |
| 195362 | 43 | primary-count-76 | 2 | 1996940 | Distributed Cluster |
| 7731870 | 54 | adaptive-count-77 | 2 | 1996940 | Distributed Cluster |
| 7731870 | 54 | adaptive-count-77 | 3 | 18355501 | Adaptive Review |
| 4447016 | 65 | distributed-count-78 | 3 | 18355501 | Adaptive Review |
| 4447016 | 65 | distributed-count-78 | 4 | 22073356 | Primary Initiative A |
| 3001009030220 | 76 | baseline-count-79 | 4 | 22073356 | Primary Initiative A |
| 3001009030220 | 76 | baseline-count-79 | 1 | 8667ec1da10c4a0293d91388b49bc77c | Baseline Model D |

This view joins dance sections with their constituent steps, answering the question of which steps compose each section and in what order. A representative row would show that section 195362 contains the step "Baseline Model D" (`8667ec1da10c4a0293d91388b49bc77c`), which uses the Left foot, moves Forward, has a turn angle of 19.70°, and executes at order position 23. The view provides a complete step-by-step breakdown of each section's choreography.

**View `v_dance_step_dance_section`**

```sql
CREATE VIEW v_dance_step_dance_section AS
SELECT a.id, a.step_id, a.step_name, a.foot_used, b.section_id AS section_section_id, b.section_number AS section_section_number, b.count_range AS section_count_range
FROM dance_steps a JOIN dance_sections b ON a.section_id = b.section_id;
```

| id | step_id | step_name | foot_used | section_section_id | section_section_number | section_count_range |
|---|---|---|---|---|---|---|
| 1 | 8667ec1da10c4a0293d91388b49bc77c | Baseline Model D | Left | 195362 | 43 | primary-count-76 |
| 2 | 1996940 | Distributed Cluster | Right | 7731870 | 54 | adaptive-count-77 |
| 3 | 18355501 | Adaptive Review | Both | 4447016 | 65 | distributed-count-78 |
| 4 | 22073356 | Primary Initiative A | Left | 3001009030220 | 76 | baseline-count-79 |

This view inverts the step-to-section relationship, starting from individual steps and resolving their parent section. It answers the question of which section a given step belongs to, carrying the section's number, step count, and calling suggestion into the step context. A row would show that the step "Adaptive Review" (`18355501`), which uses Both feet and moves Left with a 27.10° turn, belongs to section 4447016 (section number 65, with 1,147 steps and a calling suggestion of `primary-calling-40`).

**View `v_music_track_wall_line_dance`**

```sql
CREATE VIEW v_music_track_wall_line_dance AS
SELECT a.id, a.track_id, a.title, a.artist_name, b.id AS dance_id, b.dance_id AS dance_dance_id, b.title AS dance_title
FROM music_tracks a JOIN wall_line_dances b ON a.wall_line_dance_id = b.id;
```

| id | track_id | title | artist_name | dance_id | dance_dance_id | dance_title |
|---|---|---|---|---|---|---|
| 1 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | Compact Initiative | Compact Series | 1 | 726036 | Compact Initiative |
| 2 | c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | Legacy Model | Legacy Assessment | 2 | bss | Legacy Model |
| 3 | ChIJAQAAAEdu5kcRp4d7TOT5gNw | Regional Cluster A | Regional Survey A | 3 | 611500 | Regional Cluster A |
| 4 | 3743998 | Seasonal Review | Seasonal Corridor | 4 | 2986226 | Seasonal Review |

This view pairs music tracks with their associated wall line dances, answering the question of which dance uses which track. A representative row would show that the track "Regional Cluster A" by Regional Survey A (69 BPM, 12.35 seconds, released in year 54) is associated with the wall line dance "Regional Cluster A" (id 3), an Advanced-level routine with 406 total counts and a music BPM of 42. The view enables cross-referencing between the track's actual tempo and the dance's intended BPM.

**View `v_dance_event_wall_line_dance`**

```sql
CREATE VIEW v_dance_event_wall_line_dance AS
SELECT a.id, a.event_id, a.event_name, a.event_date, b.id AS dance_id, b.dance_id AS dance_dance_id, b.title AS dance_title
FROM dance_events a JOIN wall_line_dances b ON a.wall_line_dance_id = b.id;
```

| id | event_id | event_name | event_date | dance_id | dance_dance_id | dance_title |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | Seasonal Standard | 2025-04-15 | 1 | 726036 | Compact Initiative |
| 2 | 168535 | Integrated Framework | 2022-09-26 | 2 | bss | Legacy Model |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10 | 3 | 611500 | Regional Cluster A |
| 4 | 1186089 | Pilot Programme | 2024-07-21 | 4 | 2986226 | Seasonal Review |

This view joins dance events with their associated wall line dances, answering the question of which choreography is performed at which event. A representative row would show that the event "Seasonal Standard" (event_id `2002007020060`), held on 2025-04-15 at `extended-location-99` with 100 participants at Regional competition level, features the wall line dance "Compact Initiative" (id 1), a Beginner-level routine with 63 total counts. The view connects event logistics with choreographic metadata.

**View `v_dance_event_venue`**

```sql
CREATE VIEW v_dance_event_venue AS
SELECT a.id, a.event_id, a.event_name, a.event_date, b.venue_id AS venue_venue_id, b.venue_name AS venue_venue_name, b.city AS venue_city
FROM dance_events a JOIN venues b ON a.venue_id = b.venue_id;
```

| id | event_id | event_name | event_date | venue_venue_id | venue_venue_name | venue_city |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | Seasonal Standard | 2025-04-15 | 1000 | Legacy Review D | integrated-city-34 |
| 2 | 168535 | Integrated Framework | 2022-09-26 | 1001 | Regional Initiative | seasonal-city-35 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10 | 1002 | Seasonal Model | regional-city-36 |
| 4 | 1186089 | Pilot Programme | 2024-07-21 | 1003 | Integrated Cluster A | legacy-city-37 |

This view joins dance events with their venues, answering the question of which venue hosts which event and what the venue's physical characteristics are. A representative row would show that the event "Integrated Framework" (event_id `168535`), held on 2022-09-26 with 27 participants at National competition level, takes place at "Regional Initiative" (venue_id 1001), located in `seasonal-city-35` within `composite-country-27`, featuring a Marley floor with a capacity of 41. The view enables capacity planning and floor-type matching.

**View `v_venue_dance_event_detail`**

```sql
CREATE VIEW v_venue_dance_event_detail AS
SELECT a.venue_id, a.venue_name, a.city, b.id AS event_id, b.event_id AS event_event_id, b.event_name AS event_event_name
FROM venues a
  JOIN venues_events j ON j.venue_id = a.venue_id
  JOIN dance_events b ON b.id = j.dance_event_id;
```

| venue_id | venue_name | city | event_id | event_event_id | event_event_name |
|---|---|---|---|---|---|
| 1000 | Legacy Review D | integrated-city-34 | 1 | 2002007020060 | Seasonal Standard |
| 1000 | Legacy Review D | integrated-city-34 | 2 | 168535 | Integrated Framework |
| 1001 | Regional Initiative | seasonal-city-35 | 2 | 168535 | Integrated Framework |
| 1001 | Regional Initiative | seasonal-city-35 | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 1002 | Seasonal Model | regional-city-36 | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D |
| 1002 | Seasonal Model | regional-city-36 | 4 | 1186089 | Pilot Programme |
| 1003 | Integrated Cluster A | legacy-city-37 | 4 | 1186089 | Pilot Programme |
| 1003 | Integrated Cluster A | legacy-city-37 | 1 | 2002007020060 | Seasonal Standard |

This view inverts the venue-to-event relationship, starting from venues and resolving their hosted events. It answers the question of which events occur at a given venue, carrying the event's name, date, competition level, and participant count into the venue context. A row would show that "Legacy Review D" (venue_id 1000), a Wood-floor venue in `integrated-city-34` with a capacity of 32, hosts the event "Seasonal Standard" (event_id `2002007020060`) on 2025-04-15 with 100 participants at Regional competition level. This view supports venue utilization analysis and scheduling.

The complete data model — from individual dance steps through to venue logistics — forms a coherent record of wall line dance choreography and event production. Each table captures a distinct layer of the domain: the choreographic decomposition into sections and steps, the musical accompaniment, the event scheduling, and the venue infrastructure. The associative tables resolve the many-to-many relationships that connect these layers, while the analytical views provide flattened structures for operational queries. Together, they enable practitioners to trace a routine from its initial choreographic concept, through its section-by-section breakdown, to its performance at a specific venue on a specific date.