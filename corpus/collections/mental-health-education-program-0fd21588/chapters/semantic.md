## Normalised Modelling of a Youth Mental Health Education Domain

The domain under examination tracks the lifecycle of mental health education programmes delivered to youth populations across diverse institutional settings. At its core, the model revolves around `mental_health_education_programs`, a central entity that anchors every other concept: each programme is associated with a trained speaker, a target youth demographic, and an educational venue, while also being linked to one or more mental health issues through junction tables. This chapter walks through the entity types, their attributes, the foreign-key topology that binds them, and the materialised views that reconstruct domain facts from the normalised tables.

**Table `mental_health_education_programs`**

| mental_health_education_program_id | program_identifier | program_title | target_age_group | delivery_mode | is_evidence_based | start_date | end_date | status | trained_speaker_id | youth_demographic_id | educational_venue_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Legacy Review D | middle school | in-school | false | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | 1 | 1 | 100 |
| 2 | PRO-2205 | Regional Initiative | high school | community-wide | true | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | running | 2 | 2 | 101 |
| 3 | PRO-2212 | Seasonal Model | college | in-school | false | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 3 | 3 | 102 |
| 4 | PRO-2219 | Integrated Cluster A | middle school | community-wide | true | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | cancelled | 4 | 4 | 103 |

The `mental_health_education_programs` table is the primary fact table of the schema. Its surrogate key `mental_health_education_program_id` uniquely identifies each programme row, while the business identifier `program_identifier` (for example, `PRO-2198` for the "Legacy Review D" programme) provides a human-readable handle. Descriptive columns capture the programme's `program_title`, the `target_age_group` (such as `middle school`, `high school`, `college`, or `community`), and the `delivery_mode` (`in-school` or `community-wide`). The boolean `is_evidence_based` flag distinguishes evidence-backed interventions from exploratory ones — programme `PRO-2205` ("Regional Initiative") carries `true`, whereas `PRO-2198` carries `false`. Temporal scope is recorded in `start_date` and `end_date`, and the `status` column enumerates the lifecycle stage (`planned`, `running`, `completed`, `cancelled`). Three foreign keys — `trained_speaker_id`, `youth_demographic_id`, and `educational_venue_id` — point respectively to the `trained_speakers`, `youth_demographics`, and `educational_venues` tables, establishing the programme's primary associations.

**Table `trained_speakers`**

| id | speaker_identifier | full_name | training_completion_date | specialization | presentation_count | is_available | bio_url | mental_health_issue_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | SPE-2108 | Theodore Mcgrath | 2024-11-27 | mood disorders | 54 | true | http://en.wikipedia.org/wiki/Arroyo_toad | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | SPE-2113 | Account Name | 2025-04-11 | suicide ideation | 8 | false | https://bugs.launchpad.net/rally/+bug/1596756 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | SPE-2118 | Saipan International Airport | 2022-09-22 | eating disorders | 0 | true | https://ecocyc.org/gene?orgid=ECOLI&id=EG10352 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | SPE-2123 | Norma Fisher | 2023-02-06 | addictive behavior | 56 | false | https://www.nature.com/articles/nphoton.2012.92 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `trained_speakers` table stores the people (or, in the synthetic data, entities) who deliver the programmes. Its primary key `id` is referenced by `mental_health_education_programs.trained_speaker_id`. Each speaker carries a `speaker_identifier` (e.g. `SPE-2108`), a `full_name` such as "Theodore Mcgrath" or "Norma Fisher", and a `training_completion_date` marking when their certification was earned. The `specialization` column captures the clinical focus area — `mood disorders`, `suicide ideation`, `eating disorders`, or `addictive behavior` — while `presentation_count` quantifies experience (54 presentations for Theodore Mcgrath, zero for "Saipan International Airport"). The `is_available` flag indicates current availability, and `bio_url` holds a link to further information. A foreign key `mental_health_issue_id` links each speaker to a specific mental health issue, reflecting their area of expertise.

**Table `youth_demographics`**

| youth_demographic_id | demographic_identifier | age_range_start | age_range_end | role | institution_type | total_reached | mental_health_education_program_id | mental_health_issue_id |
|---|---|---|---|---|---|---|---|---|
| 1 | DEM-2306 | 34 | 19 | student | middle school | 26 | 1 | 1 |
| 2 | DEM-2313 | 37 | 26 | teacher | high school | 9 | 2 | 2 |
| 3 | DEM-2320 | 40 | 33 | family | college | 28 | 3 | 3 |
| 4 | DEM-2327 | 43 | 40 | caregiver | community | 73 | 4 | 4 |

`youth_demographics` describes the populations served by the programmes. Its primary key `youth_demographic_id` is referenced by `mental_health_education_programs.youth_demographic_id`. The `demographic_identifier` (e.g. `DEM-2306`) provides a stable handle. Numeric columns `age_range_start` and `age_range_end` define the age span of the target group — for instance, demographic `DEM-2306` spans ages 34 to 19, while `DEM-2327` spans 43 to 40. The `role` column classifies the individual's relationship to the institution (`student`, `teacher`, `family`, `caregiver`), and `institution_type` specifies the setting (`middle school`, `high school`, `college`, `community`). The `total_reached` column records the number of individuals impacted (73 for `DEM-2327`, the highest in the dataset). Foreign keys `mental_health_education_program_id` and `mental_health_issue_id` tie the demographic to a specific programme and a specific mental health issue.

**Table `mental_health_issues`**

| mental_health_issue_id | issue_code | issue_name | severity_level | is_treatable | prevalence_in_teens | barrier_to_treatment | youth_demographic_id |
|---|---|---|---|---|---|---|---|
| 1 | 505995 | Distributed Review | low | true | 17.95 | stigma | 1 |
| 2 | Harga | Adaptive Initiative D | medium | false | 21.90 | shame | 2 |
| 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model | high | true | 25.85 | lack of awareness | 3 |
| 4 | 4060640 | Composite Cluster | low | false | 29.80 | stigma | 4 |

The `mental_health_issues` table catalogues the clinical conditions addressed across the domain. Its primary key `mental_health_issue_id` is referenced by `trained_speakers.mental_health_issue_id`, `youth_demographics.mental_health_issue_id`, `educational_venues.mental_health_issue_id`, and `prevention_initiatives.mental_health_issue_id`. The `issue_code` column holds a machine-readable code (e.g. `505995`, `Harga`, or a UUID-like string `27cf055a-9bad-11eb-a8a2-19ed5c03f8d3`), while `issue_name` provides a human-readable label such as "Distributed Review" or "Composite Cluster". The `severity_level` column is categorical (`low`, `medium`, `high`), `is_treatable` is a boolean, `prevalence_in_teens` records a percentage (ranging from 17.95 to 29.80), and `barrier_to_treatment` captures the primary obstacle (`stigma`, `shame`, `lack of awareness`). A foreign key `youth_demographic_id` links each issue to the demographic most affected by it.

**Table `educational_venues`**

| educational_venue_id | venue_identifier | venue_name | address | venue_type | capacity | is_accessible | mental_health_education_program_id | youth_demographic_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | VEN-2731 | Legacy Review D | distributed-address-72 | school | 32 | true | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | VEN-2734 | Regional Initiative | baseline-address-73 | community center | 41 | false | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | VEN-2737 | Seasonal Model | pilot-address-74 | conference hall | 50 | true | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | VEN-2740 | Integrated Cluster A | extended-address-75 | online | 59 | false | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

`educational_venues` stores the physical or virtual locations where programmes are delivered. Its primary key `educational_venue_id` is referenced by `mental_health_education_programs.educational_venue_id`. The `venue_identifier` (e.g. `VEN-2731`) and `venue_name` (which in the synthetic data mirrors the programme title, such as "Legacy Review D") provide identification. The `address` column holds a location string, `venue_type` classifies the space (`school`, `community center`, `conference hall`, `online`), and `capacity` records the maximum occupancy (from 32 for `VEN-2731` to 59 for `VEN-2740`). The `is_accessible` flag indicates wheelchair accessibility. Foreign keys `mental_health_education_program_id` and `youth_demographic_id` associate the venue with a programme and a demographic. Timestamps `created_at` and `updated_at` track the record's lifecycle.

**Table `prevention_initiatives`**

| id | initiative_identifier | initiative_name | launch_date | target_behavior | is_best_practice | qualifies_for_training | mental_health_education_program_id | mental_health_issue_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | INI-2234 | Baseline Corridor D | 2022-05-17 | help-seeking | true | true | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | INI-2237 | Distributed Series | 2023-10-01 | advocacy | false | false | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | INI-2240 | Adaptive Assessment | 2024-03-12 | intervention | true | true | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | INI-2243 | Primary Survey A | 2025-08-23 | help-seeking | false | false | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

`prevention_initiatives` captures broader public health campaigns that run in parallel with or alongside the education programmes. Its primary key `id` is referenced by no other table, making it a leaf entity in the FK graph. The `initiative_identifier` (e.g. `INI-2234`) and `initiative_name` (such as "Baseline Corridor D") identify the campaign. The `launch_date` records when the initiative began, `target_behavior` specifies the desired behavioural outcome (`help-seeking`, `advocacy`, `intervention`), and the boolean flags `is_best_practice` and `qualifies_for_training` indicate programme quality and training eligibility. Foreign keys `mental_health_education_program_id` and `mental_health_issue_id` link each initiative to a specific programme and issue, creating a many-to-many bridge between initiatives and the core domain entities.

The schema employs three junction tables to resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `programs_issues` table links `mental_health_education_programs` to `mental_health_issues`, allowing a single programme to address multiple issues and a single issue to be addressed by multiple programmes. Similarly, `speakers_programs` connects `trained_speakers` to `mental_health_education_programs`, enabling a speaker to deliver multiple programmes and a programme to feature multiple speakers. The `issues_programs` table provides a third many-to-many bridge between `mental_health_issues` and `mental_health_education_programs`, reinforcing the relationship captured in `programs_issues` from a different semantic angle. These junction tables contain only foreign key columns — no additional attributes — serving purely as relational connectors.

**Table `programs_issues`**

| mental_health_education_program_id | mental_health_issue_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `speakers_programs`**

| trained_speaker_id | mental_health_education_program_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `issues_programs`**

| mental_health_issue_id | mental_health_education_program_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

With the base tables and junction tables in place, the schema materialises a set of denormalised views that reconstruct domain facts for reporting and analysis. Each view performs a join across two or more base tables, collapsing the normalised structure into a flat, query-ready result.

**View `v_mental_health_education_program_trained_speaker`**

```sql
CREATE VIEW v_mental_health_education_program_trained_speaker AS
SELECT a.mental_health_education_program_id, a.program_identifier, a.program_title, a.target_age_group, b.id AS speaker_id, b.speaker_identifier AS speaker_speaker_identifier, b.full_name AS speaker_full_name
FROM mental_health_education_programs a JOIN trained_speakers b ON a.trained_speaker_id = b.id;
```

| mental_health_education_program_id | program_identifier | program_title | target_age_group | speaker_id | speaker_speaker_identifier | speaker_full_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Legacy Review D | middle school | 1 | SPE-2108 | Theodore Mcgrath |
| 2 | PRO-2205 | Regional Initiative | high school | 2 | SPE-2113 | Account Name |
| 3 | PRO-2212 | Seasonal Model | college | 3 | SPE-2118 | Saipan International Airport |
| 4 | PRO-2219 | Integrated Cluster A | middle school | 4 | SPE-2123 | Norma Fisher |

The view `v_mental_health_education_program_trained_speaker` joins `mental_health_education_programs` with `trained_speakers` on `trained_speaker_id = id`. It answers the question: "Which speaker is assigned to which programme, and what are their qualifications?" A row for programme `PRO-2198` ("Legacy Review D") paired with speaker `SPE-2108` ("Theodore Mcgrath", specialization `mood disorders`, 54 presentations) illustrates a well-experienced match. Conversely, programme `PRO-2212` ("Seasonal Model") is paired with speaker `SPE-2118` ("Saipan International Airport"), who has zero presentations — a signal that the assignment may need review.

**View `v_mental_health_education_program_youth_demographic`**

```sql
CREATE VIEW v_mental_health_education_program_youth_demographic AS
SELECT a.mental_health_education_program_id, a.program_identifier, a.program_title, a.target_age_group, b.youth_demographic_id AS demographic_youth_demographic_id, b.demographic_identifier AS demographic_demographic_identifier, b.age_range_start AS demographic_age_range_start
FROM mental_health_education_programs a JOIN youth_demographics b ON a.youth_demographic_id = b.youth_demographic_id;
```

| mental_health_education_program_id | program_identifier | program_title | target_age_group | demographic_youth_demographic_id | demographic_demographic_identifier | demographic_age_range_start |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Legacy Review D | middle school | 1 | DEM-2306 | 34 |
| 2 | PRO-2205 | Regional Initiative | high school | 2 | DEM-2313 | 37 |
| 3 | PRO-2212 | Seasonal Model | college | 3 | DEM-2320 | 40 |
| 4 | PRO-2219 | Integrated Cluster A | middle school | 4 | DEM-2327 | 43 |

`v_mental_health_education_program_youth_demographic` joins `mental_health_education_programs` with `youth_demographics` on `youth_demographic_id = youth_demographic_id`. It reveals which population segment each programme targets. Programme `PRO-2205` ("Regional Initiative") targets demographic `DEM-2313`, a `teacher` at a `high school` with 9 individuals reached, while programme `PRO-2219` ("Integrated Cluster A") targets `DEM-2327`, a `caregiver` in the `community` with 73 individuals reached — the largest reach in the dataset.

**View `v_mental_health_education_program_mental_health_issue_detail`**

```sql
CREATE VIEW v_mental_health_education_program_mental_health_issue_detail AS
SELECT a.mental_health_education_program_id, a.program_identifier, a.program_title, b.mental_health_issue_id AS issue_mental_health_issue_id, b.issue_code AS issue_issue_code, b.issue_name AS issue_issue_name
FROM mental_health_education_programs a
  JOIN programs_issues j ON j.mental_health_education_program_id = a.mental_health_education_program_id
  JOIN mental_health_issues b ON b.mental_health_issue_id = j.mental_health_issue_id;
```

| mental_health_education_program_id | program_identifier | program_title | issue_mental_health_issue_id | issue_issue_code | issue_issue_name |
|---|---|---|---|---|---|
| 1 | PRO-2198 | Legacy Review D | 1 | 505995 | Distributed Review |
| 1 | PRO-2198 | Legacy Review D | 2 | Harga | Adaptive Initiative D |
| 2 | PRO-2205 | Regional Initiative | 2 | Harga | Adaptive Initiative D |
| 2 | PRO-2205 | Regional Initiative | 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model |
| 3 | PRO-2212 | Seasonal Model | 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model |
| 3 | PRO-2212 | Seasonal Model | 4 | 4060640 | Composite Cluster |
| 4 | PRO-2219 | Integrated Cluster A | 4 | 4060640 | Composite Cluster |
| 4 | PRO-2219 | Integrated Cluster A | 1 | 505995 | Distributed Review |

`v_mental_health_education_program_mental_health_issue_detail` joins `mental_health_education_programs` with `mental_health_issues` (via the `youth_demographics` intermediary or directly through `programs_issues`). It surfaces the clinical issue associated with each programme. Programme `PRO-2198` is linked to issue `505995` ("Distributed Review", severity `low`, treatable, prevalence 17.95%), while programme `PRO-2212` is linked to issue `27cf055a-9bad-11eb-a8a2-19ed5c03f8d3` ("Primary Model", severity `high`, treatable, prevalence 25.85%) — a high-severity condition that the programme is designed to address.

**View `v_mental_health_education_program_educational_venue`**

```sql
CREATE VIEW v_mental_health_education_program_educational_venue AS
SELECT a.mental_health_education_program_id, a.program_identifier, a.program_title, a.target_age_group, b.educational_venue_id AS venue_educational_venue_id, b.venue_identifier AS venue_venue_identifier, b.venue_name AS venue_venue_name
FROM mental_health_education_programs a JOIN educational_venues b ON a.educational_venue_id = b.educational_venue_id;
```

| mental_health_education_program_id | program_identifier | program_title | target_age_group | venue_educational_venue_id | venue_venue_identifier | venue_venue_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Legacy Review D | middle school | 100 | VEN-2731 | Legacy Review D |
| 2 | PRO-2205 | Regional Initiative | high school | 101 | VEN-2734 | Regional Initiative |
| 3 | PRO-2212 | Seasonal Model | college | 102 | VEN-2737 | Seasonal Model |
| 4 | PRO-2219 | Integrated Cluster A | middle school | 103 | VEN-2740 | Integrated Cluster A |

`v_mental_health_education_program_educational_venue` joins `mental_health_education_programs` with `educational_venues` on `educational_venue_id = educational_venue_id`. It answers: "Where is the programme delivered, and what are the venue's capabilities?" Programme `PRO-2198` ("Legacy Review D") is delivered at venue `VEN-2731`, a `school` with capacity 32 that is wheelchair accessible. Programme `PRO-2205` ("Regional Initiative") is delivered at venue `VEN-2734`, a `community center` with capacity 41 that is not accessible — a potential barrier for some participants.

**View `v_trained_speaker_mental_health_education_program_detail`**

```sql
CREATE VIEW v_trained_speaker_mental_health_education_program_detail AS
SELECT a.id, a.speaker_identifier, a.full_name, b.mental_health_education_program_id AS program_mental_health_education_program_id, b.program_identifier AS program_program_identifier, b.program_title AS program_program_title
FROM trained_speakers a
  JOIN speakers_programs j ON j.trained_speaker_id = a.id
  JOIN mental_health_education_programs b ON b.mental_health_education_program_id = j.mental_health_education_program_id;
```

| id | speaker_identifier | full_name | program_mental_health_education_program_id | program_program_identifier | program_program_title |
|---|---|---|---|---|---|
| 1 | SPE-2108 | Theodore Mcgrath | 1 | PRO-2198 | Legacy Review D |
| 1 | SPE-2108 | Theodore Mcgrath | 2 | PRO-2205 | Regional Initiative |
| 2 | SPE-2113 | Account Name | 2 | PRO-2205 | Regional Initiative |
| 2 | SPE-2113 | Account Name | 3 | PRO-2212 | Seasonal Model |
| 3 | SPE-2118 | Saipan International Airport | 3 | PRO-2212 | Seasonal Model |
| 3 | SPE-2118 | Saipan International Airport | 4 | PRO-2219 | Integrated Cluster A |
| 4 | SPE-2123 | Norma Fisher | 4 | PRO-2219 | Integrated Cluster A |
| 4 | SPE-2123 | Norma Fisher | 1 | PRO-2198 | Legacy Review D |

`v_trained_speaker_mental_health_education_program_detail` joins `trained_speakers` with `mental_health_education_programs` on `id = trained_speaker_id`. It inverts the perspective from the previous speaker view, answering: "What programmes is this speaker assigned to?" Speaker `SPE-2108` ("Theodore Mcgrath") is assigned to programme `PRO-2198` ("Legacy Review D"), while speaker `SPE-2123` ("Norma Fisher"), who specialises in `addictive behavior` and has 56 presentations, is assigned to programme `PRO-2219` ("Integrated Cluster A").

**View `v_trained_speaker_mental_health_issue`**

```sql
CREATE VIEW v_trained_speaker_mental_health_issue AS
SELECT a.id, a.speaker_identifier, a.full_name, a.training_completion_date, b.mental_health_issue_id AS issue_mental_health_issue_id, b.issue_code AS issue_issue_code, b.issue_name AS issue_issue_name
FROM trained_speakers a JOIN mental_health_issues b ON a.mental_health_issue_id = b.mental_health_issue_id;
```

| id | speaker_identifier | full_name | training_completion_date | issue_mental_health_issue_id | issue_issue_code | issue_issue_name |
|---|---|---|---|---|---|---|
| 1 | SPE-2108 | Theodore Mcgrath | 2024-11-27 | 1 | 505995 | Distributed Review |
| 2 | SPE-2113 | Account Name | 2025-04-11 | 2 | Harga | Adaptive Initiative D |
| 3 | SPE-2118 | Saipan International Airport | 2022-09-22 | 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model |
| 4 | SPE-2123 | Norma Fisher | 2023-02-06 | 4 | 4060640 | Composite Cluster |

`v_trained_speaker_mental_health_issue` joins `trained_speakers` with `mental_health_issues` on `mental_health_issue_id = mental_health_issue_id`. It reveals the clinical expertise of each speaker. Speaker `SPE-2108` ("Theodore Mcgrath") specialises in `mood disorders` and is linked to issue `505995` ("Distributed Review", severity `low`). Speaker `SPE-2113` ("Account Name") specialises in `suicide ideation` and is linked to issue `Harga` ("Adaptive Initiative D", severity `medium`, not treatable) — a combination that may warrant closer scrutiny given the untreated status.

**View `v_youth_demographic_mental_health_education_program`**

```sql
CREATE VIEW v_youth_demographic_mental_health_education_program AS
SELECT a.youth_demographic_id, a.demographic_identifier, a.age_range_start, a.age_range_end, b.mental_health_education_program_id AS program_mental_health_education_program_id, b.program_identifier AS program_program_identifier, b.program_title AS program_program_title
FROM youth_demographics a JOIN mental_health_education_programs b ON a.mental_health_education_program_id = b.mental_health_education_program_id;
```

| youth_demographic_id | demographic_identifier | age_range_start | age_range_end | program_mental_health_education_program_id | program_program_identifier | program_program_title |
|---|---|---|---|---|---|---|
| 1 | DEM-2306 | 34 | 19 | 1 | PRO-2198 | Legacy Review D |
| 2 | DEM-2313 | 37 | 26 | 2 | PRO-2205 | Regional Initiative |
| 3 | DEM-2320 | 40 | 33 | 3 | PRO-2212 | Seasonal Model |
| 4 | DEM-2327 | 43 | 40 | 4 | PRO-2219 | Integrated Cluster A |

`v_youth_demographic_mental_health_education_program` joins `youth_demographics` with `mental_health_education_programs` on `youth_demographic_id = mental_health_education_program_id`. It answers: "Which programme serves this demographic?" Demographic `DEM-2306` (a `student` at `middle school`, 26 reached) is served by programme `PRO-2198` ("Legacy Review D"), while demographic `DEM-2327` (a `caregiver` in the `community`, 73 reached) is served by programme `PRO-2219` ("Integrated Cluster A").

**View `v_youth_demographic_mental_health_issue`**

```sql
CREATE VIEW v_youth_demographic_mental_health_issue AS
SELECT a.youth_demographic_id, a.demographic_identifier, a.age_range_start, a.age_range_end, b.mental_health_issue_id AS issue_mental_health_issue_id, b.issue_code AS issue_issue_code, b.issue_name AS issue_issue_name
FROM youth_demographics a JOIN mental_health_issues b ON a.mental_health_issue_id = b.mental_health_issue_id;
```

| youth_demographic_id | demographic_identifier | age_range_start | age_range_end | issue_mental_health_issue_id | issue_issue_code | issue_issue_name |
|---|---|---|---|---|---|---|
| 1 | DEM-2306 | 34 | 19 | 1 | 505995 | Distributed Review |
| 2 | DEM-2313 | 37 | 26 | 2 | Harga | Adaptive Initiative D |
| 3 | DEM-2320 | 40 | 33 | 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model |
| 4 | DEM-2327 | 43 | 40 | 4 | 4060640 | Composite Cluster |

`v_youth_demographic_mental_health_issue` joins `youth_demographics` with `mental_health_issues` on `mental_health_issue_id = mental_health_issue_id`. It surfaces the clinical issue most relevant to each demographic. Demographic `DEM-2306` is linked to issue `505995` ("Distributed Review", barrier: `stigma`), while demographic `DEM-2327` is linked to issue `4060640` ("Composite Cluster", barrier: `stigma`, prevalence 29.80%) — the highest prevalence in the dataset, suggesting a significant unmet need.

**View `v_mental_health_issue_mental_health_education_program_detail`**

```sql
CREATE VIEW v_mental_health_issue_mental_health_education_program_detail AS
SELECT a.mental_health_issue_id, a.issue_code, a.issue_name, b.mental_health_education_program_id AS program_mental_health_education_program_id, b.program_identifier AS program_program_identifier, b.program_title AS program_program_title
FROM mental_health_issues a
  JOIN issues_programs j ON j.mental_health_issue_id = a.mental_health_issue_id
  JOIN mental_health_education_programs b ON b.mental_health_education_program_id = j.mental_health_education_program_id;
```

| mental_health_issue_id | issue_code | issue_name | program_mental_health_education_program_id | program_program_identifier | program_program_title |
|---|---|---|---|---|---|
| 1 | 505995 | Distributed Review | 1 | PRO-2198 | Legacy Review D |
| 1 | 505995 | Distributed Review | 2 | PRO-2205 | Regional Initiative |
| 2 | Harga | Adaptive Initiative D | 2 | PRO-2205 | Regional Initiative |
| 2 | Harga | Adaptive Initiative D | 3 | PRO-2212 | Seasonal Model |
| 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model | 3 | PRO-2212 | Seasonal Model |
| 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model | 4 | PRO-2219 | Integrated Cluster A |
| 4 | 4060640 | Composite Cluster | 4 | PRO-2219 | Integrated Cluster A |
| 4 | 4060640 | Composite Cluster | 1 | PRO-2198 | Legacy Review D |

`v_mental_health_issue_mental_health_education_program_detail` joins `mental_health_issues` with `mental_health_education_programs` (via `youth_demographics` or `programs_issues`). It answers: "Which programmes address this mental health issue?" Issue `505995` ("Distributed Review", severity `low`) is addressed by programme `PRO-2198` ("Legacy Review D"), while issue `27cf055a-9bad-11eb-a8a2-19ed5c03f8d3` ("Primary Model", severity `high`) is addressed by programme `PRO-2212` ("Seasonal Model").

**View `v_mental_health_issue_youth_demographic`**

```sql
CREATE VIEW v_mental_health_issue_youth_demographic AS
SELECT a.mental_health_issue_id, a.issue_code, a.issue_name, a.severity_level, b.youth_demographic_id AS demographic_youth_demographic_id, b.demographic_identifier AS demographic_demographic_identifier, b.age_range_start AS demographic_age_range_start
FROM mental_health_issues a JOIN youth_demographics b ON a.youth_demographic_id = b.youth_demographic_id;
```

| mental_health_issue_id | issue_code | issue_name | severity_level | demographic_youth_demographic_id | demographic_demographic_identifier | demographic_age_range_start |
|---|---|---|---|---|---|---|
| 1 | 505995 | Distributed Review | low | 1 | DEM-2306 | 34 |
| 2 | Harga | Adaptive Initiative D | medium | 2 | DEM-2313 | 37 |
| 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model | high | 3 | DEM-2320 | 40 |
| 4 | 4060640 | Composite Cluster | low | 4 | DEM-2327 | 43 |

`v_mental_health_issue_youth_demographic` joins `mental_health_issues` with `youth_demographics` on `youth_demographic_id = youth_demographic_id`. It reveals which demographic is most affected by each issue. Issue `505995` ("Distributed Review") is most relevant to demographic `DEM-2306` (a `student` at `middle school`), while issue `4060640` ("Composite Cluster") is most relevant to demographic `DEM-2327` (a `caregiver` in the `community`).

**View `v_educational_venue_mental_health_education_program`**

```sql
CREATE VIEW v_educational_venue_mental_health_education_program AS
SELECT a.educational_venue_id, a.venue_identifier, a.venue_name, a.address, b.mental_health_education_program_id AS program_mental_health_education_program_id, b.program_identifier AS program_program_identifier, b.program_title AS program_program_title
FROM educational_venues a JOIN mental_health_education_programs b ON a.mental_health_education_program_id = b.mental_health_education_program_id;
```

| educational_venue_id | venue_identifier | venue_name | address | program_mental_health_education_program_id | program_program_identifier | program_program_title |
|---|---|---|---|---|---|---|
| 100 | VEN-2731 | Legacy Review D | distributed-address-72 | 1 | PRO-2198 | Legacy Review D |
| 101 | VEN-2734 | Regional Initiative | baseline-address-73 | 2 | PRO-2205 | Regional Initiative |
| 102 | VEN-2737 | Seasonal Model | pilot-address-74 | 3 | PRO-2212 | Seasonal Model |
| 103 | VEN-2740 | Integrated Cluster A | extended-address-75 | 4 | PRO-2219 | Integrated Cluster A |

`v_educational_venue_mental_health_education_program` joins `educational_venues` with `mental_health_education_programs` on `educational_venue_id = mental_health_education_program_id`. It answers: "Which programme is delivered at this venue?" Venue `VEN-2731` ("Legacy Review D", a `school` with capacity 32) hosts programme `PRO-2198` ("Legacy Review D"), while venue `VEN-2740` ("Integrated Cluster A", `online`, capacity 59) hosts programme `PRO-2219` ("Integrated Cluster A").

**View `v_educational_venue_youth_demographic`**

```sql
CREATE VIEW v_educational_venue_youth_demographic AS
SELECT a.educational_venue_id, a.venue_identifier, a.venue_name, a.address, b.youth_demographic_id AS demographic_youth_demographic_id, b.demographic_identifier AS demographic_demographic_identifier, b.age_range_start AS demographic_age_range_start
FROM educational_venues a JOIN youth_demographics b ON a.youth_demographic_id = b.youth_demographic_id;
```

| educational_venue_id | venue_identifier | venue_name | address | demographic_youth_demographic_id | demographic_demographic_identifier | demographic_age_range_start |
|---|---|---|---|---|---|---|
| 100 | VEN-2731 | Legacy Review D | distributed-address-72 | 1 | DEM-2306 | 34 |
| 101 | VEN-2734 | Regional Initiative | baseline-address-73 | 2 | DEM-2313 | 37 |
| 102 | VEN-2737 | Seasonal Model | pilot-address-74 | 3 | DEM-2320 | 40 |
| 103 | VEN-2740 | Integrated Cluster A | extended-address-75 | 4 | DEM-2327 | 43 |

`v_educational_venue_youth_demographic` joins `educational_venues` with `youth_demographics` on `youth_demographic_id = youth_demographic_id`. It reveals which demographic is served at each venue. Venue `VEN-2731` serves demographic `DEM-2306` (a `student` at `middle school`), while venue `VEN-2740` serves demographic `DEM-2327` (a `caregiver` in the `community`).

**View `v_prevention_initiative_mental_health_education_program`**

```sql
CREATE VIEW v_prevention_initiative_mental_health_education_program AS
SELECT a.id, a.initiative_identifier, a.initiative_name, a.launch_date, b.mental_health_education_program_id AS program_mental_health_education_program_id, b.program_identifier AS program_program_identifier, b.program_title AS program_program_title
FROM prevention_initiatives a JOIN mental_health_education_programs b ON a.mental_health_education_program_id = b.mental_health_education_program_id;
```

| id | initiative_identifier | initiative_name | launch_date | program_mental_health_education_program_id | program_program_identifier | program_program_title |
|---|---|---|---|---|---|---|
| 1 | INI-2234 | Baseline Corridor D | 2022-05-17 | 1 | PRO-2198 | Legacy Review D |
| 2 | INI-2237 | Distributed Series | 2023-10-01 | 2 | PRO-2205 | Regional Initiative |
| 3 | INI-2240 | Adaptive Assessment | 2024-03-12 | 3 | PRO-2212 | Seasonal Model |
| 4 | INI-2243 | Primary Survey A | 2025-08-23 | 4 | PRO-2219 | Integrated Cluster A |

`v_prevention_initiative_mental_health_education_program` joins `prevention_initiatives` with `mental_health_education_programs` on `mental_health_education_program_id = mental_health_education_program_id`. It answers: "Which prevention initiative runs alongside which programme?" Initiative `INI-2234` ("Baseline Corridor D", targeting `help-seeking`, best practice `true`) runs alongside programme `PRO-2198` ("Legacy Review D"), while initiative `INI-2240` ("Adaptive Assessment", targeting `intervention`, best practice `true`) runs alongside programme `PRO-2212` ("Seasonal Model").

**View `v_prevention_initiative_mental_health_issue`**

```sql
CREATE VIEW v_prevention_initiative_mental_health_issue AS
SELECT a.id, a.initiative_identifier, a.initiative_name, a.launch_date, b.mental_health_issue_id AS issue_mental_health_issue_id, b.issue_code AS issue_issue_code, b.issue_name AS issue_issue_name
FROM prevention_initiatives a JOIN mental_health_issues b ON a.mental_health_issue_id = b.mental_health_issue_id;
```

| id | initiative_identifier | initiative_name | launch_date | issue_mental_health_issue_id | issue_issue_code | issue_issue_name |
|---|---|---|---|---|---|---|
| 1 | INI-2234 | Baseline Corridor D | 2022-05-17 | 1 | 505995 | Distributed Review |
| 2 | INI-2237 | Distributed Series | 2023-10-01 | 2 | Harga | Adaptive Initiative D |
| 3 | INI-2240 | Adaptive Assessment | 2024-03-12 | 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model |
| 4 | INI-2243 | Primary Survey A | 2025-08-23 | 4 | 4060640 | Composite Cluster |

`v_prevention_initiative_mental_health_issue` joins `prevention_initiatives` with `mental_health_issues` on `mental_health_issue_id = mental_health_issue_id`. It reveals the clinical focus of each prevention initiative. Initiative `INI-2234` ("Baseline Corridor D") targets issue `505995` ("Distributed Review", severity `low`), while initiative `INI-2240` ("Adaptive Assessment") targets issue `27cf055a-9bad-11eb-a8a2-19ed5c03f8d3` ("Primary Model", severity `high`).

The schema's design reflects a deliberate trade-off between normalisation and query convenience. The six base tables — `mental_health_education_programs`, `trained_speakers`, `youth_demographics`, `mental_health_issues`, `educational_venues`, and `prevention_initiatives` — are normalised to third normal form, with foreign keys enforcing referential integrity and junction tables (`programs_issues`, `speakers_programs`, `issues_programs`) resolving many-to-many relationships. The fourteen views materialise the most common analytical queries as flat result sets, each answering a specific domain question by joining two or more base tables. Together, the tables and views form a coherent model of a youth mental health education ecosystem, where programmes, speakers, demographics, venues, issues, and prevention initiatives are interwoven through a network of foreign keys and denormalised projections.