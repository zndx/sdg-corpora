## Community Engagement and Support Operations

Organizations that coordinate small group gatherings, marriage-focused ministries, and community building programs maintain detailed records of every session, concept taught, question posed, and financial arrangement made. The operational data captured across these systems tells a complete story of how groups form, what they study, how they are funded, and which communities they serve. At the center of this ecosystem are the small group sessions themselves—scheduled gatherings with assigned facilitators, defined topics, and measurable attendance. Each session anchors a network of related records: the relational concepts explored during the meeting, the discussion questions prepared in advance, the financial support tied to associated marriage prayer focuses, and the broader grow group communities that host or sponsor the gathering. Understanding how these records interlock is essential for anyone responsible for planning, reporting, or auditing community programs.

**Table `small_group_sessions`**

| small_group_session_id | session_id | session_date | facilitator_name | topic_theme | discussion_format | attendance_count | concept_id |
|---|---|---|---|---|---|---|---|
| 1 | 1186087 | 2022-09-11T20:24:00 | Regional Model | integrated-topic-16 | open_discussion | 42 | 884350 |
| 2 | 2087748 | 2023-02-22T03:41:00 | Seasonal Cluster D | seasonal-topic-17 | structured_questions | 1 | 392497 |
| 3 | 4716414 | 2024-07-06T10:58:00 | Integrated Review | regional-topic-18 | scripture_study | 5 | 2106713 |
| 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2025-12-17T17:15:00 | Extended Initiative | legacy-topic-19 | open_discussion | 30 | 4463648 |

The small group sessions table records every scheduled gathering with a unique session identifier, a date and time stamp, the name of the facilitator, the topic theme, the discussion format used, the number of attendees, and the relational concept under study. Session identifiers range from short numeric strings like `1186087` to UUIDs such as `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`, reflecting a system that has evolved over time. Facilitator names follow a structured naming convention—`Regional Model`, `Seasonal Cluster D`, `Integrated Review`, `Extended Initiative`—suggesting that facilitators are assigned to rotating regional or thematic clusters rather than operating as individuals. Topic themes (`integrated-topic-16`, `seasonal-topic-17`, `regional-topic-18`, `legacy-topic-19`) and discussion formats (`open_discussion`, `structured_questions`, `scripture_study`) provide a quick classification of each session's character. Attendance counts vary widely, from a single attendee in session `2087748` to forty-two in session `1186087`, indicating that group size is not standardized and may depend on the topic, facilitator, or community demand. The `concept_id` column links each session to a specific relational concept, establishing the first of several cross-table relationships that connect session logistics to curriculum content.

**Table `relational_concepts`**

| concept_id | concept_name | concept_category | description | scripture_reference | small_group_session_id |
|---|---|---|---|---|---|
| 884350 | Pilot Cluster | physical | Extended Survey | legacy-scriptur-73 | 1 |
| 392497 | Baseline Review | emotional | Pilot Corridor A | compact-scriptur-74 | 2 |
| 2106713 | Distributed Initiative A | psychological | Baseline Series | composite-scriptur-75 | 3 |
| 4463648 | Adaptive Model | spiritual | Distributed Assessment | primary-scriptur-76 | 4 |

Relational concepts form the curriculum backbone of the program. Each concept carries an identifier, a name, a category, a description, a scripture reference, and a link back to the session in which it was taught. Concept categories span `physical`, `emotional`, `psychological`, and `spiritual` dimensions, suggesting a holistic approach to group study. The concept names—`Pilot Cluster`, `Baseline Review`, `Distributed Initiative A`, `Adaptive Model`—follow a consistent naming pattern that mirrors the facilitator naming convention, reinforcing the idea that curriculum is organized into structured series. Scripture references (`legacy-scriptur-73`, `compact-scriptur-74`, `composite-scriptur-75`, `primary-scriptur-76`) are coded identifiers rather than traditional citations, likely pointing to an internal scripture index. The `small_group_session_id` column creates a direct foreign-key relationship back to the sessions table, meaning every concept taught is traceable to a specific scheduled gathering. This linkage ensures that curriculum delivery can be audited: any concept can be traced to its session, facilitator, attendance, and format.

**Table `discussion_questions`**

| id | question_id | question_text | question_number | requires_personal_reflection | references_scripture | small_group_session_id | concept_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 325448 | composite-question-63 | 9 | true | true | 1 | 884350 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 5006438 | primary-question-64 | 15 | false | false | 2 | 392497 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | dc0d0562-8fcd-11eb-924d-9cd76263cbd0 | adaptive-question-65 | 21 | true | true | 3 | 2106713 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | ChIJEctqrYFt5kcRUrBEPR-XXBE | distributed-question-66 | 27 | false | false | 4 | 4463648 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Discussion questions are the interactive component of each session. The questions table stores a unique record identifier, a question identifier, the full question text, a question number within the session, flags indicating whether personal reflection is required and whether the question references scripture, the session and concept it belongs to, and timestamps for creation and last update. Question identifiers follow the same mixed-format pattern as session IDs, with entries like `325448`, `5006438`, `dc0d0562-8fcd-11eb-924d-9cd76263cbd0`, and `ChIJEctqrYFt5kcRUrBEPR-XXBE`. Question text values (`composite-question-63`, `primary-question-64`, `adaptive-question-65`, `distributed-question-66`) are coded labels rather than the actual question content, suggesting that the full text may be stored elsewhere or rendered dynamically. Question numbers (`9`, `15`, `21`, `27`) indicate the sequence within a session, and the reflection and scripture flags allow organizers to filter questions by their pedagogical style. The dual foreign-key relationship—linking to both `small_group_session_id` and `concept_id`—ensures that every question is anchored to both the session in which it was used and the concept it was designed to explore.

**Table `financial_support_records`**

| id | record_id | record_date | amount_needed | amount_given | funding_gap | support_status | marriage_prayer_focus_id |
|---|---|---|---|---|---|---|---|
| 1 | 10449530 | 2023-10-23 | 18.47 | 13.49 | 19.45 | under_funded | 100 |
| 2 | 10445619 | 2024-03-07 | 12.36 | 47.66 | 23.90 | fully_funded | 101 |
| 3 | 9568457 | 2025-08-18 | 18.47 | 47.66 | 28.35 | over_funded | 102 |
| 4 | 20743593 | 2022-01-02 | 26.04 | 18.47 | 32.80 | under_funded | 103 |

Financial support records track the funding status of marriage prayer focuses. Each record includes an internal identifier, a public-facing record ID, a date, the amount needed, the amount given, the resulting funding gap, the support status (`under_funded`, `fully_funded`, `over_funded`), and a link to the associated marriage prayer focus. The amounts are modest, ranging from `12.36` to `26.04` in need and from `13.49` to `47.66` in contributions, suggesting that these are micro-grants or stipends rather than large-scale funding. The funding gap is calculated as the difference between need and contribution, and the support status categorizes each record accordingly. Record `10449530` shows a gap of `19.45` with an `under_funded` status, while record `10445619` shows a gap of `23.90` despite being `fully_funded`—indicating that the gap figure may represent a target or baseline rather than a simple arithmetic difference. The `marriage_prayer_focus_id` column creates the financial link to the prayer focus system.

**Table `marriage_prayer_focuses`**

| id | focus_id | focus_month | primary_intention | target_group | community_goal | financial_support_record_id | grow_group_community_id |
|---|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m424 | distributed-focus-90 | primary-primary-76 | married_couples | adaptive-communit-89 | 1 | 1000 |
| 101 | 5f91e192-8fcd-11eb-924d-9cd76263cbd0 | baseline-focus-91 | adaptive-primary-77 | singles | distributed-communit-90 | 2 | 1001 |
| 102 | 5917293 | pilot-focus-92 | distributed-primary-78 | engaged_couples | baseline-communit-91 | 3 | 1002 |
| 103 | 23045878 | extended-focus-93 | baseline-primary-79 | married_couples | pilot-communit-92 | 4 | 1003 |

Marriage prayer focuses serve as the bridge between financial support and community engagement. Each focus has an internal ID, a focus identifier, a target month, a primary intention, a target group (`married_couples`, `singles`, `engaged_couples`), a community goal, a link to a financial support record, and a link to a grow group community. Focus identifiers follow the same mixed-format convention, with entries like `lu_tax_code_template_m424`, `5f91e192-8fcd-11eb-924d-9cd76263cbd0`, `5917293`, and `23045878`. Primary intentions (`primary-primary-76`, `adaptive-primary-77`, `distributed-primary-78`, `baseline-primary-79`) and community goals (`adaptive-communit-89`, `distributed-communit-90`, `baseline-communit-91`, `pilot-communit-92`) use coded labels that correspond to the naming patterns seen across the entire dataset. The dual foreign-key relationships—linking to both `financial_support_record_id` and `grow_group_community_id`—make the prayer focus table the central hub connecting financial data to community operations.

**Table `grow_group_communities`**

| grow_group_community_id | group_id | group_name | group_type | duration_weeks | cost_per_couple | start_date | registration_status | marriage_prayer_focus_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 10449530 | Baseline Corridor D | marriage_builder | 22 | 29.43 | 2022-09-05 | open | 100 |
| 1001 | 8189483 | Distributed Series | general_small_group | 31 | 12.74 | 2023-02-16 | closed | 101 |
| 1002 | 3718658437 | Adaptive Assessment | singles_fellowship | 40 | 37.54 | 2024-07-27 | full | 102 |
| 1003 | IVC0 | Primary Survey A | marriage_builder | 49 | 25.36 | 2025-12-11 | open | 103 |

Grow group communities represent the organizational containers in which programs operate. Each community has an internal ID, a group identifier, a group name, a group type (`marriage_builder`, `general_small_group`, `singles_fellowship`), a duration in weeks, a cost per couple, a start date, a registration status (`open`, `closed`, `full`), and a link to a marriage prayer focus. Group names (`Baseline Corridor D`, `Distributed Series`, `Adaptive Assessment`, `Primary Survey A`) and group types reflect the structured naming conventions throughout the system. Durations range from 22 to 49 weeks, and costs per couple range from `12.74` to `37.54`. Registration status provides a real-time indicator of capacity. The `marriage_prayer_focus_id` column links each community to its associated prayer focus, completing the chain from community through prayer focus to financial support.

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

The sessions_questions table establishes the many-to-many relationship between sessions and discussion questions. This junction table allows a single session to feature multiple questions and a single question to be reused across sessions, providing flexibility in curriculum design and reuse. The table captures the structural relationship that the `discussion_questions` table references through its `small_group_session_id` column, serving as the operational link that ensures questions are properly associated with their intended sessions.

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

The communities_sessions table establishes the relationship between grow group communities and small group sessions. This junction table enables a community to host multiple sessions and a session to be associated with multiple communities, reflecting the reality that programs often span organizational boundaries. The table provides the structural foundation for understanding which communities are responsible for which sessions, enabling reporting on community-level activity and resource allocation.

### Session-Concept Relationships

The view `vw_small_group_session_relational_concept` joins the sessions table with the concepts table to answer the question: what concept was taught in each session, and how is that concept classified? This view is essential for curriculum auditing and for understanding the thematic distribution of sessions across categories.

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

Reading the first row of this view reveals that session `1186087`, facilitated by `Regional Model` on `2022-09-11` with `42` attendees, explored the `Pilot Cluster` concept in the `physical` category. The second row shows session `2087748`, facilitated by `Seasonal Cluster D` on `2023-02-22` with only `1` attendee, covered the `Baseline Review` concept in the `emotional` category. These rows demonstrate that concept categories are not tied to session size or format—open discussions and structured questions alike can cover any conceptual dimension.

### Session-Question Relationships

The view `vw_small_group_session_discussion_question_detail` joins sessions with their associated discussion questions to answer: which questions were used in which sessions, and what are their characteristics? This view supports facilitator preparation and post-session review.

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

The first row of this view shows that session `1186087` included question `325448` (`composite-question-63`), numbered `9`, which requires personal reflection and references scripture. The third row reveals that session `4716414` featured question `dc0d0562-8fcd-11eb-924d-9cd76263cbd0` (`adaptive-question-65`), numbered `21`, also requiring reflection and scripture reference. The pattern suggests that questions are numbered sequentially within sessions and that the reflection and scripture flags are distributed across the question set, allowing facilitators to balance introspective and doctrinal elements.

### Concept-Session Relationships

The view `vw_relational_concept_small_group_session` inverts the session-concept relationship, answering: in which sessions was each concept taught, and what were the session conditions? This perspective is useful for concept-level reporting and for understanding how often each concept is revisited.

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

The first row indicates that concept `884350` (`Pilot Cluster`, category `physical`) was taught in session `1186087` with `42` attendees under the `open_discussion` format. The fourth row shows concept `4463648` (`Adaptive Model`, category `spiritual`) was taught in session `005588c4-9bac-11eb-a8a2-19ed5c03f8d3` with `30` attendees. These rows confirm that each concept in the sample data appears in exactly one session, though the schema supports multiple sessions per concept.

### Question-Session Relationships

The view `vw_discussion_question_small_group_session` joins questions with their sessions to answer: what session hosted each question, and what were the session's logistical details? This view supports question-level analysis and helps identify which sessions generated the most discussion activity.

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

The first row shows question `325448` was used in session `1186087`, facilitated by `Regional Model` on `2022-09-11` with `42` attendees. The second row links question `5006438` to session `2087748`, facilitated by `Seasonal Cluster D` on `2023-02-22` with only `1` attendee. The disparity in attendance between these two sessions—forty-two versus one—highlights the variability in session scale and suggests that question effectiveness should be evaluated in context rather than in isolation.

### Question-Concept Relationships

The view `vw_discussion_question_relational_concept` joins questions with their associated concepts to answer: which concept does each question explore, and how is that concept categorized? This view is essential for ensuring that questions align with their intended curriculum objectives.

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

The first row reveals that question `325448` (`composite-question-63`) is associated with concept `884350` (`Pilot Cluster`, category `physical`). The third row links question `dc0d0562-8fcd-11eb-924d-9cd76263cbd0` (`adaptive-question-65`) to concept `2106713` (`Distributed Initiative A`, category `psychological`). These pairings demonstrate that questions are deliberately matched to concepts across all four category types, ensuring comprehensive coverage of the curriculum's physical, emotional, psychological, and spiritual dimensions.

### Financial Support-Prayer Focus Relationships

The view `vw_financial_support_record_marriage_prayer_focus` joins financial records with their associated prayer focuses to answer: which prayer focus is funded by which financial record, and what is the funding status? This view is critical for financial oversight and for ensuring that prayer focuses have the resources they need.

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

The first row shows that financial record `10449530`, with an amount needed of `18.47` and an amount given of `13.49`, supports prayer focus `lu_tax_code_template_m424` targeting `married_couples` with an `under_funded` status. The third row reveals that record `9568457`, with an amount given of `47.66` against a need of `18.47`, supports prayer focus `5917293` targeting `engaged_couples` with an `over_funded` status. These rows illustrate the range of funding outcomes and the importance of monitoring the funding gap to ensure equitable resource distribution.

### Prayer Focus-Financial Relationships

The view `vw_marriage_prayer_focus_financial_support_record` inverts the financial-prayer focus relationship, answering: what financial record supports each prayer focus, and what are the financial details? This perspective supports prayer focus-level budgeting and reporting.

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

The first row indicates that prayer focus `lu_tax_code_template_m424`, targeting `married_couples` with community goal `adaptive-communit-89`, is supported by financial record `10449530` with an `under_funded` status and a gap of `19.45`. The second row shows prayer focus `5f91e192-8fcd-11eb-924d-9cd76263cbd0`, targeting `singles` with goal `distributed-communit-90`, is supported by record `10445619` with a `fully_funded` status despite a gap of `23.90`. The apparent contradiction between full funding and a positive gap underscores that the gap metric may represent a target threshold rather than a simple arithmetic difference.

### Prayer Focus-Community Relationships

The view `vw_marriage_prayer_focus_grow_group_community` joins prayer focuses with their associated grow group communities to answer: which community implements each prayer focus, and what are the community's operational details? This view connects the spiritual and financial planning layer to the operational community layer.

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

The first row reveals that prayer focus `lu_tax_code_template_m424`, targeting `married_couples`, is implemented by community `1000` (`Baseline Corridor D`), a `marriage_builder` group with a `22`-week duration, a cost of `29.43` per couple, and an `open` registration status. The third row links prayer focus `5917293`, targeting `engaged_couples`, to community `1002` (`Adaptive Assessment`), a `singles_fellowship` group running for `40` weeks at `37.54` per couple with a `full` registration status. These rows demonstrate the diversity of community types and the flexibility of the system in matching prayer focuses to appropriate community structures.

### Community-Prayer Focus Relationships

The view `vw_grow_group_community_marriage_prayer_focus` inverts the community-prayer focus relationship, answering: which prayer focus is associated with each community, and what are the focus details? This perspective supports community-level reporting and helps administrators understand the spiritual objectives of each group.

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

The first row shows that community `1000` (`Baseline Corridor D`), a `marriage_builder` group with `22` weeks of duration and `open` registration, is associated with prayer focus `lu_tax_code_template_m424` targeting `married_couples` with intention `primary-primary-76`. The fourth row links community `1003` (`Primary Survey A`), a `marriage_builder` group with `49` weeks of duration and `open` registration, to prayer focus `23045878` targeting `married_couples` with intention `baseline-primary-79`. The consistency of `married_couples` as a target group for `marriage_builder` communities confirms the alignment between community type and prayer focus intent.

### Community-Session Relationships

The view `vw_grow_group_community_small_group_session_detail` joins communities with their associated sessions to answer: which sessions are hosted by or associated with each community, and what are the session details? This view provides the most comprehensive operational picture, connecting community structure to session execution.

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

The first row of this view reveals that community `1000` (`Baseline Corridor D`), a `marriage_builder` group with `22` weeks of duration and `open` registration, is associated with session `1186087`, facilitated by `Regional Model` on `2022-09-11` with `42` attendees exploring the `Pilot Cluster` concept. The second row links community `1001` (`Distributed Series`), a `general_small_group` with `31` weeks of duration and `closed` registration, to session `2087748`, facilitated by `Seasonal Cluster D` on `2023-02-22` with `1` attendee covering the `Baseline Review` concept. These rows demonstrate the full chain of relationships: from community through prayer focus to session, with each layer providing context for the next. The wide variation in attendance and community status—`open` versus `closed`—underscores the dynamic nature of community operations and the importance of real-time data in managing resources.

### Synthesis

The data across these tables and views forms a coherent operational model for community-based programs. Small group sessions serve as the primary event records, each linked to a relational concept for curriculum alignment and to discussion questions for interactive engagement. Financial support records track the funding of marriage prayer focuses, which in turn connect to grow group communities that host or sponsor sessions. The junction tables—`sessions_questions` and `communities_sessions`—enable flexible many-to-many relationships, while the views provide ready-made lenses for answering specific operational questions. Facilitator names, topic themes, discussion formats, attendance counts, concept categories, question flags, funding statuses, community types, and registration statuses all contribute to a rich operational picture that supports planning, execution, and reporting. The consistent naming conventions and coded identifiers across all tables suggest a mature data architecture designed for scalability and auditability, where every record can be traced through its relationships to provide a complete account of program activity.