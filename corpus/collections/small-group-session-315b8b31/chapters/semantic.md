The domain under examination models the lifecycle of small-group gatherings within a faith-based organizational ecosystem, where each session is anchored to a relational concept, enriched with discussion questions, and situated within a broader community structure that includes financial stewardship and marriage-focused prayer initiatives. The relational schema normalizes this domain into eight base tables and ten materialized views, each serving a distinct analytical purpose. The base tables capture sessions, concepts, questions, financial records, prayer focuses, and communities, while junction tables mediate many-to-many relationships between sessions and questions, and between communities and sessions. The views then reconstruct domain facts by joining these normalized tables, enabling queries that span the full breadth of the domain without requiring ad-hoc joins at query time.

## Core Session and Concept Entities

The anchor of the schema is the `small_group_sessions` table, which records individual gatherings with a surrogate key `small_group_session_id`, a business identifier `session_id`, a timestamp `session_date`, and descriptive metadata including `facilitator_name`, `topic_theme`, `discussion_format`, and `attendance_count`. Each session is associated with exactly one relational concept through the foreign key `concept_id`. For example, session `1186087` facilitated by "Regional Model" on 2022-09-11 with 42 attendees explored the topic theme `integrated-topic-16` using an `open_discussion` format and was linked to concept `884350`.

**Table `small_group_sessions`**

| small_group_session_id | session_id | session_date | facilitator_name | topic_theme | discussion_format | attendance_count | concept_id |
|---|---|---|---|---|---|---|---|
| 1 | 1186087 | 2022-09-11T20:24:00 | Regional Model | integrated-topic-16 | open_discussion | 42 | 884350 |
| 2 | 2087748 | 2023-02-22T03:41:00 | Seasonal Cluster D | seasonal-topic-17 | structured_questions | 1 | 392497 |
| 3 | 4716414 | 2024-07-06T10:58:00 | Integrated Review | regional-topic-18 | scripture_study | 5 | 2106713 |
| 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-17T17:15:00 | Extended Initiative | legacy-topic-19 | open_discussion | 30 | 4463648 |

The `relational_concepts` table defines the conceptual framework applied during each session. Its primary key `concept_id` is referenced by `small_group_sessions.concept_id`, establishing a one-to-many relationship: one concept can appear across multiple sessions, but each session references a single concept. The table stores `concept_name`, `concept_category` (such as `physical`, `emotional`, `psychological`, or `spiritual`), a `description`, and a `scripture_reference`. Additionally, `relational_concepts` carries a back-reference column `small_group_session_id` that points to the session that introduced the concept, creating a bidirectional navigational path. Concept `884350`, named "Pilot Cluster" in the `physical` category, carries the description "Extended Survey" and scripture reference `legacy-scriptur-73`, and is associated with session `1`.

**Table `relational_concepts`**

| concept_id | concept_name | concept_category | description | scripture_reference | small_group_session_id |
|---|---|---|---|---|---|
| 884350 | Pilot Cluster | physical | Extended Survey | legacy-scriptur-73 | 1 |
| 392497 | Baseline Review | emotional | Pilot Corridor A | compact-scriptur-74 | 2 |
| 2106713 | Distributed Initiative A | psychological | Baseline Series | composite-scriptur-75 | 3 |
| 4463648 | Adaptive Model | spiritual | Distributed Assessment | primary-scriptur-76 | 4 |

Discussion questions are captured in the `discussion_questions` table, which serves as a repository of prompts used during sessions. Each row carries a surrogate `id`, a business `question_id`, the `question_text`, a `question_number` indicating its position in the session flow, boolean flags `requires_personal_reflection` and `references_scripture`, and two foreign keys: `small_group_session_id` linking the question to the session it belongs to, and `concept_id` linking it to the concept it explores. Question `325448`, text `composite-question-63`, appears as question number 9 in session `1`, requires personal reflection, references scripture, and is tied to concept `884350`.

**Table `discussion_questions`**

| id | question_id | question_text | question_number | requires_personal_reflection | references_scripture | small_group_session_id | concept_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 325448 | composite-question-63 | 9 | true | true | 1 | 884350 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 5006438 | primary-question-64 | 15 | false | false | 2 | 392497 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 | 21 | true | true | 3 | 2106713 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 | 27 | false | false | 4 | 4463648 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

## Financial Stewardship and Community Structure

The financial dimension of the domain is captured in `financial_support_records`, which tracks funding events with columns `id`, `record_id`, `record_date`, `amount_needed`, `amount_given`, `funding_gap`, and `support_status` (one of `under_funded`, `fully_funded`, or `over_funded`). Each record is linked to a `marriage_prayer_focus_id`, establishing a foreign-key relationship to the `marriage_prayer_focuses` table. Record `10449530` dated 2023-10-23 shows an `amount_needed` of 18.47, an `amount_given` of 13.49, a `funding_gap` of 19.45, and a `support_status` of `under_funded`, associated with prayer focus `100`.

**Table `financial_support_records`**

| id | record_id | record_date | amount_needed | amount_given | funding_gap | support_status | marriage_prayer_focus_id |
|---|---|---|---|---|---|---|---|
| 1 | 10449530 | 2023-10-23 | 18.47 | 13.49 | 19.45 | under_funded | 100 |
| 2 | 10445619 | 2024-03-07 | 12.36 | 47.66 | 23.90 | fully_funded | 101 |
| 3 | 9568457 | 2025-08-18 | 18.47 | 47.66 | 28.35 | over_funded | 102 |
| 4 | 20743593 | 2022-01-02 | 26.04 | 18.47 | 32.80 | under_funded | 103 |

The `marriage_prayer_focuses` table defines prayer intentions organized around marriage and relationship themes. Its primary key `id` is referenced by `financial_support_records.marriage_prayer_focus_id`. The table stores `focus_id` (a business identifier), `focus_month`, `primary_intention`, `target_group` (such as `married_couples`, `singles`, or `engaged_couples`), and `community_goal`. It also carries two additional foreign keys: `financial_support_record_id` pointing back to the financial record, and `grow_group_community_id` pointing to the community associated with the focus. Focus `lu_tax_code_template_m424` (id `100`) has the primary intention `primary-primary-76`, targets `married_couples`, carries the community goal `adaptive-communit-89`, is linked to financial record `1`, and belongs to community `1000`.

**Table `marriage_prayer_focuses`**

| id | focus_id | focus_month | primary_intention | target_group | community_goal | financial_support_record_id | grow_group_community_id |
|---|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m424 | distributed-focus-90 | primary-primary-76 | married_couples | adaptive-communit-89 | 1 | 1000 |
| 101 | 5f91e192-8fcd-11eb-924d-9cd76263cbd0 | baseline-focus-91 | adaptive-primary-77 | singles | distributed-communit-90 | 2 | 1001 |
| 102 | 5917293 | pilot-focus-92 | distributed-primary-78 | engaged_couples | baseline-communit-91 | 3 | 1002 |
| 103 | 23045878 | extended-focus-93 | baseline-primary-79 | married_couples | pilot-communit-92 | 4 | 1003 |

Communities are represented by `grow_group_communities`, which stores `grow_group_community_id` as its primary key, along with `group_id`, `group_name`, `group_type` (such as `marriage_builder`, `general_small_group`, or `singles_fellowship`), `duration_weeks`, `cost_per_couple`, `start_date`, and `registration_status` (one of `open`, `closed`, or `full`). The table includes a foreign key `marriage_prayer_focus_id` that references `marriage_prayer_focuses.id`, creating a bidirectional link with the prayer focuses table. Community `1000`, named "Baseline Corridor D" of type `marriage_builder`, runs for 22 weeks at a cost of 29.43 per couple, started on 2022-09-05, has `open` registration status, and is linked to prayer focus `100`.

**Table `grow_group_communities`**

| grow_group_community_id | group_id | group_name | group_type | duration_weeks | cost_per_couple | start_date | registration_status | marriage_prayer_focus_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 10449530 | Baseline Corridor D | marriage_builder | 22 | 29.43 | 2022-09-05 | open | 100 |
| 1001 | 8189483 | Distributed Series | general_small_group | 31 | 12.74 | 2023-02-16 | closed | 101 |
| 1002 | 3718658437 | Adaptive Assessment | singles_fellowship | 40 | 37.54 | 2024-07-27 | full | 102 |
| 1003 | IVC0 | Primary Survey A | marriage_builder | 49 | 25.36 | 2025-12-11 | open | 103 |

## Junction Tables and Many-to-Many Relationships

The schema employs two junction tables to resolve many-to-many relationships. The `sessions_questions` table mediates the relationship between `small_group_sessions` and `discussion_questions`, allowing a single session to be associated with multiple questions and a question to potentially appear across multiple sessions. This table contains foreign keys referencing both `small_group_sessions.small_group_session_id` and `discussion_questions.id`, effectively materializing the intersection of sessions and questions.

**Table `sessions_questions`**

| small_group_session_id | discussion_question_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Similarly, the `communities_sessions` table resolves the many-to-many relationship between `grow_group_communities` and `small_group_sessions`. It contains foreign keys pointing to `grow_group_communities.grow_group_community_id` and `small_group_sessions.small_group_session_id`, enabling any community to host multiple sessions and any session to be associated with multiple communities. This design supports flexible organizational structures where communities and sessions are not rigidly paired.

**Table `communities_sessions`**

| grow_group_community_id | small_group_session_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

## Materialized Views: Reconstructing Domain Facts

The ten views in the schema materialize common join patterns, each answering a specific analytical question by combining data from two or more base tables.

The view `vw_small_group_session_relational_concept` joins `small_group_sessions` with `relational_concepts` on `concept_id`, producing a flat record that pairs each session with its associated concept. This view answers the question: "What concept was explored in each session, and what are the concept's attributes?" For session `1186087`, the view yields the concept "Pilot Cluster" in the `physical` category with description "Extended Survey" and scripture reference `legacy-scriptur-73`.

**View `vw_small_group_session_relational_concept`**

```sql
CREATE VIEW vw_small_group_session_relational_concept AS
SELECT a.small_group_session_id, a.session_id, a.session_date, a.facilitator_name, b.concept_id AS concept_concept_id, b.concept_name AS concept_concept_name, b.concept_category AS concept_concept_category
FROM small_group_sessions a JOIN relational_concepts b ON a.concept_id = b.concept_id;
```

| small_group_session_id | session_id | session_date | facilitator_name | concept_concept_id | concept_concept_name | concept_concept_category |
|---|---|---|---|---|---|---|
| 1 | 1186087 | 2022-09-11T20:24:00 | Regional Model | 884350 | Pilot Cluster | physical |
| 2 | 2087748 | 2023-02-22T03:41:00 | Seasonal Cluster D | 392497 | Baseline Review | emotional |
| 3 | 4716414 | 2024-07-06T10:58:00 | Integrated Review | 2106713 | Distributed Initiative A | psychological |
| 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-17T17:15:00 | Extended Initiative | 4463648 | Adaptive Model | spiritual |

The view `vw_small_group_session_discussion_question_detail` joins `small_group_sessions` with `discussion_questions` on `small_group_session_id`, producing a row for each question within each session. This view answers: "What questions were asked in each session, and what are their properties?" For session `1186087`, the view returns question `325448` (`composite-question-63`), question number 9, which requires personal reflection and references scripture, tied to concept `884350`.

**View `vw_small_group_session_discussion_question_detail`**

```sql
CREATE VIEW vw_small_group_session_discussion_question_detail AS
SELECT a.small_group_session_id, a.session_id, a.session_date, b.id AS question_id, b.question_id AS question_question_id, b.question_text AS question_question_text
FROM small_group_sessions a
  JOIN sessions_questions j ON j.small_group_session_id = a.small_group_session_id
  JOIN discussion_questions b ON b.id = j.discussion_question_id;
```

| small_group_session_id | session_id | session_date | question_id | question_question_id | question_question_text |
|---|---|---|---|---|---|
| 1 | 1186087 | 2022-09-11T20:24:00 | 1 | 325448 | composite-question-63 |
| 1 | 1186087 | 2022-09-11T20:24:00 | 2 | 5006438 | primary-question-64 |
| 2 | 2087748 | 2023-02-22T03:41:00 | 2 | 5006438 | primary-question-64 |
| 2 | 2087748 | 2023-02-22T03:41:00 | 3 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 3 | 4716414 | 2024-07-06T10:58:00 | 3 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 |
| 3 | 4716414 | 2024-07-06T10:58:00 | 4 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |
| 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-17T17:15:00 | 4 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 |
| 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-17T17:15:00 | 1 | 325448 | composite-question-63 |

The view `vw_relational_concept_small_group_session` reverses the join direction of the first view, starting from `relational_concepts` and joining to `small_group_sessions`. It answers: "Which sessions explored each concept?" Concept `884350` ("Pilot Cluster") is shown to have been explored in session `1186087` facilitated by "Regional Model" with 42 attendees.

**View `vw_relational_concept_small_group_session`**

```sql
CREATE VIEW vw_relational_concept_small_group_session AS
SELECT a.concept_id, a.concept_name, a.concept_category, a.description, b.small_group_session_id AS session_small_group_session_id, b.session_id AS session_session_id, b.session_date AS session_session_date
FROM relational_concepts a JOIN small_group_sessions b ON a.small_group_session_id = b.small_group_session_id;
```

| concept_id | concept_name | concept_category | description | session_small_group_session_id | session_session_id | session_session_date |
|---|---|---|---|---|---|---|
| 884350 | Pilot Cluster | physical | Extended Survey | 1 | 1186087 | 2022-09-11T20:24:00 |
| 392497 | Baseline Review | emotional | Pilot Corridor A | 2 | 2087748 | 2023-02-22T03:41:00 |
| 2106713 | Distributed Initiative A | psychological | Baseline Series | 3 | 4716414 | 2024-07-06T10:58:00 |
| 4463648 | Adaptive Model | spiritual | Distributed Assessment | 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-17T17:15:00 |

The view `vw_discussion_question_small_group_session` joins `discussion_questions` with `small_group_sessions` on `small_group_session_id`, answering: "Which session did each question belong to?" Question `325448` (`composite-question-63`) is shown to belong to session `1186087` with topic theme `integrated-topic-16` and format `open_discussion`.

**View `vw_discussion_question_small_group_session`**

```sql
CREATE VIEW vw_discussion_question_small_group_session AS
SELECT a.id, a.question_id, a.question_text, a.question_number, b.small_group_session_id AS session_small_group_session_id, b.session_id AS session_session_id, b.session_date AS session_session_date
FROM discussion_questions a JOIN small_group_sessions b ON a.small_group_session_id = b.small_group_session_id;
```

| id | question_id | question_text | question_number | session_small_group_session_id | session_session_id | session_session_date |
|---|---|---|---|---|---|---|
| 1 | 325448 | composite-question-63 | 9 | 1 | 1186087 | 2022-09-11T20:24:00 |
| 2 | 5006438 | primary-question-64 | 15 | 2 | 2087748 | 2023-02-22T03:41:00 |
| 3 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 | 21 | 3 | 4716414 | 2024-07-06T10:58:00 |
| 4 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 | 27 | 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-17T17:15:00 |

The view `vw_discussion_question_relational_concept` joins `discussion_questions` with `relational_concepts` on `concept_id`, answering: "Which concept does each question explore?" Question `325448` is linked to concept `884350` ("Pilot Cluster") in the `physical` category with description "Extended Survey".

**View `vw_discussion_question_relational_concept`**

```sql
CREATE VIEW vw_discussion_question_relational_concept AS
SELECT a.id, a.question_id, a.question_text, a.question_number, b.concept_id AS concept_concept_id, b.concept_name AS concept_concept_name, b.concept_category AS concept_concept_category
FROM discussion_questions a JOIN relational_concepts b ON a.concept_id = b.concept_id;
```

| id | question_id | question_text | question_number | concept_concept_id | concept_concept_name | concept_concept_category |
|---|---|---|---|---|---|---|
| 1 | 325448 | composite-question-63 | 9 | 884350 | Pilot Cluster | physical |
| 2 | 5006438 | primary-question-64 | 15 | 392497 | Baseline Review | emotional |
| 3 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 | 21 | 2106713 | Distributed Initiative A | psychological |
| 4 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 | 27 | 4463648 | Adaptive Model | spiritual |

The view `vw_financial_support_record_marriage_prayer_focus` joins `financial_support_records` with `marriage_prayer_focuses` on `marriage_prayer_focus_id`, answering: "Which prayer focus is associated with each financial record?" Record `10449530` (under-funded, gap 19.45) is linked to focus `lu_tax_code_template_m424` targeting `married_couples` with community goal `adaptive-communit-89`.

**View `vw_financial_support_record_marriage_prayer_focus`**

```sql
CREATE VIEW vw_financial_support_record_marriage_prayer_focus AS
SELECT a.id, a.record_id, a.record_date, a.amount_needed, b.id AS focus_id, b.focus_id AS focus_focus_id, b.focus_month AS focus_focus_month
FROM financial_support_records a JOIN marriage_prayer_focuses b ON a.marriage_prayer_focus_id = b.id;
```

| id | record_id | record_date | amount_needed | focus_id | focus_focus_id | focus_focus_month |
|---|---|---|---|---|---|---|
| 1 | 10449530 | 2023-10-23 | 18.47 | 100 | lu_tax_code_template_m424 | distributed-focus-90 |
| 2 | 10445619 | 2024-03-07 | 12.36 | 101 | 5f91e192-8fcd-11eb-924d-9cd76263cbd0 | baseline-focus-91 |
| 3 | 9568457 | 2025-08-18 | 18.47 | 102 | 5917293 | pilot-focus-92 |
| 4 | 20743593 | 2022-01-02 | 26.04 | 103 | 23045878 | extended-focus-93 |

The view `vw_marriage_prayer_focus_financial_support_record` reverses the join, starting from `marriage_prayer_focuses` and joining to `financial_support_records`. It answers: "What financial records support each prayer focus?" Focus `lu_tax_code_template_m424` (id `100`) is associated with financial record `10449530` showing an amount needed of 18.47 and amount given of 13.49.

**View `vw_marriage_prayer_focus_financial_support_record`**

```sql
CREATE VIEW vw_marriage_prayer_focus_financial_support_record AS
SELECT a.id, a.focus_id, a.focus_month, a.primary_intention, b.id AS record_id, b.record_id AS record_record_id, b.record_date AS record_record_date
FROM marriage_prayer_focuses a JOIN financial_support_records b ON a.financial_support_record_id = b.id;
```

| id | focus_id | focus_month | primary_intention | record_id | record_record_id | record_record_date |
|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m424 | distributed-focus-90 | primary-primary-76 | 1 | 10449530 | 2023-10-23 |
| 101 | 5f91e192-8fcd-11eb-924d-9cd76263cbd0 | baseline-focus-91 | adaptive-primary-77 | 2 | 10445619 | 2024-03-07 |
| 102 | 5917293 | pilot-focus-92 | distributed-primary-78 | 3 | 9568457 | 2025-08-18 |
| 103 | 23045878 | extended-focus-93 | baseline-primary-79 | 4 | 20743593 | 2022-01-02 |

The view `vw_marriage_prayer_focus_grow_group_community` joins `marriage_prayer_focuses` with `grow_group_communities` on `grow_group_community_id`, answering: "Which community is associated with each prayer focus?" Focus `lu_tax_code_template_m424` is linked to community `1000` ("Baseline Corridor D"), a `marriage_builder` group running for 22 weeks at 29.43 per couple.

**View `vw_marriage_prayer_focus_grow_group_community`**

```sql
CREATE VIEW vw_marriage_prayer_focus_grow_group_community AS
SELECT a.id, a.focus_id, a.focus_month, a.primary_intention, b.grow_group_community_id AS community_grow_group_community_id, b.group_id AS community_group_id, b.group_name AS community_group_name
FROM marriage_prayer_focuses a JOIN grow_group_communities b ON a.grow_group_community_id = b.grow_group_community_id;
```

| id | focus_id | focus_month | primary_intention | community_grow_group_community_id | community_group_id | community_group_name |
|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m424 | distributed-focus-90 | primary-primary-76 | 1000 | 10449530 | Baseline Corridor D |
| 101 | 5f91e192-8fcd-11eb-924d-9cd76263cbd0 | baseline-focus-91 | adaptive-primary-77 | 1001 | 8189483 | Distributed Series |
| 102 | 5917293 | pilot-focus-92 | distributed-primary-78 | 1002 | 3718658437 | Adaptive Assessment |
| 103 | 23045878 | extended-focus-93 | baseline-primary-79 | 1003 | IVC0 | Primary Survey A |

The view `vw_grow_group_community_marriage_prayer_focus` reverses the join, starting from `grow_group_communities` and joining to `marriage_prayer_focuses`. It answers: "Which prayer focus belongs to each community?" Community `1000` ("Baseline Corridor D") is associated with focus `lu_tax_code_template_m424` targeting `married_couples` with primary intention `primary-primary-76`.

**View `vw_grow_group_community_marriage_prayer_focus`**

```sql
CREATE VIEW vw_grow_group_community_marriage_prayer_focus AS
SELECT a.grow_group_community_id, a.group_id, a.group_name, a.group_type, b.id AS focus_id, b.focus_id AS focus_focus_id, b.focus_month AS focus_focus_month
FROM grow_group_communities a JOIN marriage_prayer_focuses b ON a.marriage_prayer_focus_id = b.id;
```

| grow_group_community_id | group_id | group_name | group_type | focus_id | focus_focus_id | focus_focus_month |
|---|---|---|---|---|---|---|
| 1000 | 10449530 | Baseline Corridor D | marriage_builder | 100 | lu_tax_code_template_m424 | distributed-focus-90 |
| 1001 | 8189483 | Distributed Series | general_small_group | 101 | 5f91e192-8fcd-11eb-924d-9cd76263cbd0 | baseline-focus-91 |
| 1002 | 3718658437 | Adaptive Assessment | singles_fellowship | 102 | 5917293 | pilot-focus-92 |
| 1003 | IVC0 | Primary Survey A | marriage_builder | 103 | 23045878 | extended-focus-93 |

The view `vw_grow_group_community_small_group_session_detail` joins `grow_group_communities` with `small_group_sessions` through the `communities_sessions` junction table, answering: "Which sessions are hosted by which communities?" Community `1000` ("Baseline Corridor D") is shown to host session `1186087` facilitated by "Regional Model" with 42 attendees on 2022-09-11.

**View `vw_grow_group_community_small_group_session_detail`**

```sql
CREATE VIEW vw_grow_group_community_small_group_session_detail AS
SELECT a.grow_group_community_id, a.group_id, a.group_name, b.small_group_session_id AS session_small_group_session_id, b.session_id AS session_session_id, b.session_date AS session_session_date
FROM grow_group_communities a
  JOIN communities_sessions j ON j.grow_group_community_id = a.grow_group_community_id
  JOIN small_group_sessions b ON b.small_group_session_id = j.small_group_session_id;
```

| grow_group_community_id | group_id | group_name | session_small_group_session_id | session_session_id | session_session_date |
|---|---|---|---|---|---|
| 1000 | 10449530 | Baseline Corridor D | 1 | 1186087 | 2022-09-11T20:24:00 |
| 1000 | 10449530 | Baseline Corridor D | 2 | 2087748 | 2023-02-22T03:41:00 |
| 1001 | 8189483 | Distributed Series | 2 | 2087748 | 2023-02-22T03:41:00 |
| 1001 | 8189483 | Distributed Series | 3 | 4716414 | 2024-07-06T10:58:00 |
| 1002 | 3718658437 | Adaptive Assessment | 3 | 4716414 | 2024-07-06T10:58:00 |
| 1002 | 3718658437 | Adaptive Assessment | 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-17T17:15:00 |
| 1003 | IVC0 | Primary Survey A | 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-17T17:15:00 |
| 1003 | IVC0 | Primary Survey A | 1 | 1186087 | 2022-09-11T20:24:00 |

## Synthesis

The schema models a domain where small-group sessions serve as the central event, enriched by relational concepts and discussion questions, embedded within communities that organize around marriage-focused prayer intentions and financial stewardship. The base tables normalize this domain into six core entities and two junction tables, with foreign keys establishing navigable paths in both directions between related entities. The ten views materialize the most common join patterns, each answering a specific analytical question by flattening the normalized structure into a denormalized result set. Together, the tables and views provide a complete relational representation of the domain, supporting both operational queries against individual entities and analytical queries that span the full breadth of the organizational ecosystem.