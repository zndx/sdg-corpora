Choreography in the wall line dance domain is modelled as a hierarchy of structured artefacts: a dance is a first-class entity that carries metadata about its difficulty, tempo, and dedication; it is decomposed into ordered sections, each of which is further decomposed into atomic steps. Music tracks are attached to dances as their accompaniment, and dances are scheduled into events that take place at physical venues. The relational schema captures this hierarchy through a set of base tables linked by foreign keys, with junction tables mediating many-to-many relationships, and a suite of views that reassemble the normalised facts into domain-meaningful rows.

## The core entity: `wall_line_dances`

The anchor of the schema is the `wall_line_dances` table, which stores one row per choreographed dance. Its primary key is `id`, an auto-incrementing integer, while `dance_id` carries a business-level identifier that may be numeric or alphabetic. The remaining columns describe the dance's attributes: `title` holds the human-readable name, `level` is a categorical field (Beginner, Intermediate, Advanced), `total_counts` records the number of counts in the full choreography, `music_bpm` stores the intended beats-per-minute, `start_offset_seconds` gives the silence before the music begins, `choreographer_name` names the creator, `choreography_date` records when the work was completed, `dedication_text` carries a free-form dedication, and `music_track_id` is a foreign key pointing to the `music_tracks` table.

**Table `wall_line_dances`**

| id | dance_id | title | level | total_counts | music_bpm | start_offset_seconds | choreographer_name | choreography_date | dedication_text | music_track_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 726036 | Compact Initiative | Beginner | 63 | 24 | 10.45 | Legacy Protocol D | 2024-11-14 | composite-dedicati-81 | 1 |
| 2 | bss | Legacy Model | Intermediate | 150 | 33 | 14.90 | Regional Programme | 2025-04-25 | primary-dedicati-82 | 2 |
| 3 | 611500 | Regional Cluster A | Advanced | 406 | 42 | 19.35 | Seasonal Standard | 2022-09-09 | adaptive-dedicati-83 | 3 |
| 4 | 2986226 | Seasonal Review | Beginner | 195 | 51 | 23.80 | Integrated Framework A | 2023-02-20 | distributed-dedicati-84 | 4 |

Consider the first row: dance `id` 1 carries `dance_id` 726036, is titled "Compact Initiative", is marked Beginner, has 63 total counts, a music tempo of 24 BPM, a start offset of 10.45 seconds, was choreographed by "Legacy Protocol D" on 2024-11-14, bears the dedication "composite-dedicati-81", and references music track `id` 1. The second row, with `dance_id` "bss", is titled "Legacy Model" at Intermediate level with 150 counts and 33 BPM. These values illustrate the range of business identifiers and the structured metadata that accompanies each dance.

## Decomposition into sections: `dance_sections`

Each dance is broken into ordered sections stored in `dance_sections`. The table's primary key is `section_id`, and the foreign key `wall_line_dance_id` links each section back to its parent dance. The column `section_number` gives the ordinal position within the dance, while `count_range`, `actual_footwork`, and `calling_suggestion` are categorical descriptors of the section's movement vocabulary. `step_count` records how many atomic steps belong to the section.

**Table `dance_sections`**

| section_id | section_number | count_range | actual_footwork | calling_suggestion | step_count | wall_line_dance_id |
|---|---|---|---|---|---|---|
| 195362 | 43 | primary-count-76 | seasonal-actual-23 | compact-calling-38 | 259 | 1 |
| 7731870 | 54 | adaptive-count-77 | regional-actual-24 | composite-calling-39 | 13 | 2 |
| 4447016 | 65 | distributed-count-78 | legacy-actual-25 | primary-calling-40 | 1147 | 3 |
| 3001009030220 | 76 | baseline-count-79 | compact-actual-26 | adaptive-calling-41 | 19 | 4 |

Section `section_id` 195362 belongs to dance `wall_line_dance_id` 1 ("Compact Initiative"), is section number 43, has `count_range` "primary-count-76", `actual_footwork` "seasonal-actual-23", `calling_suggestion` "compact-calling-38", and contains 259 steps. Section `section_id` 7731870 belongs to dance 2 ("Legacy Model"), is section number 54, and holds 13 steps. The `step_count` column thus provides a cardinality hint: a section with 1147 steps (row 3, belonging to dance 3) is substantially more complex than one with 13.

## Atomic movements: `dance_steps`

The finest-grained entity is the dance step, stored in `dance_steps`. Its primary key is `id`, and `step_id` carries a business-level identifier that may be a UUID or a numeric code. The column `step_name` gives the step's name, `foot_used` records whether the step uses "Left", "Right", or "Both" feet, `direction` is a categorical field (Forward, Backward, Left, Right), `turn_angle` is a floating-point angle in degrees, `execution_order` is the ordinal position of the step within its section, `section_id` is a foreign key to `dance_sections`, and `created_at` is a timestamp.

**Table `dance_steps`**

| id | step_id | step_name | foot_used | direction | turn_angle | execution_order | section_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 8667ec1da10c4a0293d91388b49bc77c | Baseline Model D | Left | Forward | 19.70 | 23 | 195362 | 2025-01-01 00:14:00 |
| 2 | 1996940 | Distributed Cluster | Right | Backward | 23.40 | 26 | 7731870 | 2025-02-06 03:14:00 |
| 3 | 18355501 | Adaptive Review | Both | Left | 27.10 | 29 | 4447016 | 2025-03-11 06:14:00 |
| 4 | 22073356 | Primary Initiative A | Left | Right | 30.80 | 32 | 3001009030220 | 2025-04-16 09:14:00 |

Step `id` 1 has `step_id` "8667ec1da10c4a0293d91388b49bc77c", is named "Baseline Model D", uses the Left foot, moves Forward with a 19.70° turn, is execution order 23 within section `section_id` 195362, and was created on 2025-01-01. Step `id` 2, named "Distributed Cluster", uses the Right foot, moves Backward with a 23.40° turn, is order 26 in section 7731870, and was created on 2025-02-06. The `execution_order` column enforces the sequential nature of steps within a section.

## Accompaniment: `music_tracks`

Music is modelled in the `music_tracks` table, which stores one row per track. The primary key is `id`, and `track_id` carries a business identifier (often a UUID). The columns `title`, `artist_name`, and `album_title` describe the track's metadata, `tempo_bpm` records its beats-per-minute, `duration_seconds` its length, `release_year` its year of release, and `wall_line_dance_id` is a foreign key linking the track to the dance it accompanies.

**Table `music_tracks`**

| id | track_id | title | artist_name | album_title | tempo_bpm | duration_seconds | release_year | wall_line_dance_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | Compact Initiative | Compact Series | Extended Model | 47 | 7.45 | 36 | 1 |
| 2 | c7476bbe-8fcc-11eb-924d-9cd76263cbd0 | Legacy Model | Legacy Assessment | Pilot Cluster A | 58 | 9.90 | 45 | 2 |
| 3 | ChIJAQAAAEdu5kcRp4d7TOT5gNw | Regional Cluster A | Regional Survey A | Baseline Review | 69 | 12.35 | 54 | 3 |
| 4 | 3743998 | Seasonal Review | Seasonal Corridor | Distributed Initiative | 80 | 14.80 | 63 | 4 |

Track `id` 1 has `track_id` "9229485c-9bad-11eb-a8a2-19ed5c03f8d3", is titled "Compact Initiative" by "Compact Series" from the album "Extended Model", has a tempo of 47 BPM, lasts 7.45 seconds, was released in year 36, and accompanies dance `wall_line_dance_id` 1. Track `id` 4, titled "Seasonal Review" by "Seasonal Corridor", has 80 BPM, lasts 14.80 seconds, and accompanies dance 4. The `tempo_bpm` values (47, 58, 69, 80) show a spread across the sample, while the `wall_line_dance_id` foreign key creates a direct association between each track and its dance.

## Events and venues: `dance_events` and `venues`

Dances are scheduled into events stored in `dance_events`. The table's primary key is `id`, and `event_id` carries a business identifier. Columns include `event_name`, `event_date`, `location`, `competition_level` (Regional, National, Worlds), `participant_count`, `wall_line_dance_id` (FK to the dance), and `venue_id` (FK to the venue).

**Table `dance_events`**

| id | event_id | event_name | event_date | location | competition_level | participant_count | wall_line_dance_id | venue_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020060 | Seasonal Standard | 2025-04-15 | extended-location-99 | Regional | 100 | 1 | 1000 |
| 2 | 168535 | Integrated Framework | 2022-09-26 | integrated-location-100 | National | 27 | 2 | 1001 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Extended Protocol D | 2023-02-10 | seasonal-location-101 | Worlds | 23 | 3 | 1002 |
| 4 | 1186089 | Pilot Programme | 2024-07-21 | regional-location-102 | Regional | 34 | 4 | 1003 |

Event `id` 1 is named "Seasonal Standard", occurs on 2025-04-15 at "extended-location-99", is at Regional competition level with 100 participants, is associated with dance `wall_line_dance_id` 1, and takes place at `venue_id` 1000. Event `id` 3, "Extended Protocol D", is a Worlds-level event on 2023-02-10 with 23 participants, linked to dance 3 and venue 1002.

The `venues` table stores physical locations. Its primary key is `venue_id`, and columns include `venue_name`, `city`, `country`, `floor_type` (Wood, Marley, Concrete, Synthetic), and `capacity`.

**Table `venues`**

| venue_id | venue_name | city | country | floor_type | capacity |
|---|---|---|---|---|---|
| 1000 | Legacy Review D | integrated-city-34 | compact-country-26 | Wood | 32 |
| 1001 | Regional Initiative | seasonal-city-35 | composite-country-27 | Marley | 41 |
| 1002 | Seasonal Model | regional-city-36 | primary-country-28 | Concrete | 50 |
| 1003 | Integrated Cluster A | legacy-city-37 | adaptive-country-29 | Synthetic | 59 |

Venue `venue_id` 1000 is "Legacy Review D" in "integrated-city-34", country "compact-country-26", with Wood flooring and capacity 32. Venue `venue_id` 1003 is "Integrated Cluster A" in "legacy-city-37", country "adaptive-country-29", with Synthetic flooring and capacity 59.

## Junction tables and many-to-many relationships

The schema includes three junction tables — `dances_sections`, `sections_steps`, and `venues_events` — that mediate many-to-many relationships. The `dances_sections` table links dances to sections beyond the one-to-many relationship already expressed by `dance_sections.wall_line_dance_id`, allowing a section to belong to multiple dances or a dance to have sections referenced from multiple contexts. The `sections_steps` table similarly allows a step to appear in multiple sections. The `venues_events` table enables a venue to host multiple events and an event to span multiple venues. These junction tables are the relational mechanism by which the model supports flexible, non-hierarchical associations.

## Views: reconstructing domain facts

The views reassemble the normalised tables into rows that answer specific domain questions. Each view performs a join that traces foreign-key paths back to the `wall_line_dances` anchor.

### `v_wall_line_dance_dance_section_detail`

This view joins `wall_line_dances` with `dance_sections` on `wall_line_dances.id = dance_sections.wall_line_dance_id`, producing one row per section with the parent dance's metadata alongside the section's own attributes. It answers the question: "What are the sections of each dance, and what are their properties?" A row from this view would show dance "Compact Initiative" (level Beginner, 63 counts) alongside its section 195362 (section number 43, 259 steps, count_range "primary-count-76").

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

### `v_wall_line_dance_music_track`

This view joins `wall_line_dances` with `music_tracks` on `wall_line_dances.id = music_tracks.wall_line_dance_id`, pairing each dance with its accompanying track. It answers: "Which music track accompanies each dance, and what are the track's details?" A row would show dance "Compact Initiative" alongside track "Compact Initiative" by "Compact Series" at 47 BPM, duration 7.45 seconds.

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

### `v_dance_section_wall_line_dance`

This is the inverse of the first view: it joins `dance_sections` with `wall_line_dances`, presenting sections as the primary entity with the parent dance's metadata appended. It answers: "For each section, which dance does it belong to?" A row would show section 195362 (section number 43, 259 steps) alongside its parent dance "Compact Initiative" at Beginner level.

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

### `v_dance_section_dance_step_detail`

This view joins `dance_sections` with `dance_steps` on `dance_sections.section_id = dance_steps.section_id`, producing one row per step with the section's metadata alongside the step's own attributes. It answers: "What are the steps within each section, and what are their properties?" A row would show section 195362 (259 steps, count_range "primary-count-76") alongside step "Baseline Model D" (Left foot, Forward direction, 19.70° turn, execution order 23).

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

### `v_dance_step_dance_section`

This is the inverse of the previous view: it joins `dance_steps` with `dance_sections`, presenting steps as the primary entity with the parent section's metadata appended. It answers: "For each step, which section does it belong to?" A row would show step "Baseline Model D" (execution order 23, 19.70° turn) alongside its parent section 195362 (section number 43, 259 steps).

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

### `v_music_track_wall_line_dance`

This is the inverse of `v_wall_line_dance_music_track`: it joins `music_tracks` with `wall_line_dances`, presenting tracks as the primary entity with the parent dance's metadata appended. It answers: "For each music track, which dance does it accompany?" A row would show track "Compact Initiative" (47 BPM, 7.45 seconds) alongside its parent dance "Compact Initiative" at Beginner level with 63 counts.

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

### `v_dance_event_wall_line_dance`

This view joins `dance_events` with `wall_line_dances` on `dance_events.wall_line_dance_id = wall_line_dances.id`, pairing each event with its associated dance. It answers: "Which dance is featured at each event?" A row would show event "Seasonal Standard" (2025-04-15, Regional level, 100 participants) alongside dance "Compact Initiative" (Beginner, 63 counts, choreographed by "Legacy Protocol D").

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

### `v_dance_event_venue`

This view joins `dance_events` with `venues` on `dance_events.venue_id = venues.venue_id`, pairing each event with its host venue. It answers: "At which venue does each event take place?" A row would show event "Seasonal Standard" (2025-04-15, Regional level) alongside venue "Legacy Review D" in "integrated-city-34", country "compact-country-26", with Wood flooring and capacity 32.

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

### `v_venue_dance_event_detail`

This is the inverse of the previous view: it joins `venues` with `dance_events`, presenting venues as the primary entity with the event's metadata appended. It answers: "For each venue, what events are held there?" A row would show venue "Legacy Review D" (Wood flooring, capacity 32) alongside event "Seasonal Standard" (2025-04-15, Regional level, 100 participants).

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

## Synthesis

The wall line dance domain is modelled as a directed acyclic graph rooted at `wall_line_dances`. The primary hierarchy — dance to sections to steps — is expressed through foreign keys `dance_sections.wall_line_dance_id` and `dance_steps.section_id`, with the junction tables `dances_sections` and `sections_steps` providing additional flexibility for many-to-many associations. Music tracks are attached to dances via `music_tracks.wall_line_dance_id`, while events and venues are linked through `dance_events.wall_line_dance_id` and `dance_events.venue_id`, with the `venues_events` junction table supporting multi-venue events. The nine views traverse these foreign-key paths in both directions, each answering a specific analytical question by joining the normalised tables back into domain-meaningful rows. The result is a schema that is both normalised — minimising redundancy and update anomalies — and queryable through views that reconstruct the hierarchical and associative structure of the choreography domain.

## Data appendix

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
