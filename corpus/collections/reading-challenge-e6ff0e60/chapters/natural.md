## The Architecture of Structured Reading Programs

Reading programs organized around challenges, participants, and measurable outcomes require a disciplined data model to track progress, classify content, and recognize achievement. At the center of this domain sits the reading challenge—a time-bound initiative with a defined start and end date, an associated institution, and a lifecycle status that moves from active through completed to cancelled. Each challenge anchors a cohort of participants, a set of reading categories, and a hierarchy of award tiers. The records that flow through this system connect individual readers to the books they have consumed, the categories those books belong to, and the milestones they have reached. Understanding how these pieces interlock is essential for anyone managing program operations, generating progress reports, or designing recognition criteria.

The foundation of any reading program is the challenge itself, which establishes the temporal and organizational boundaries within which all activity occurs.

**Table `reading_challenges`**

| id | challenge_id | start_date | end_date | institution_name | year_group | status |
|---|---|---|---|---|---|---|
| 1 | 7119777 | 2022-09-05 | 2022-09-01 | Extended Corridor | seasonal-year-35 | active |
| 2 | 4005 | 2023-02-16 | 2023-02-12 | Pilot Series A | regional-year-36 | completed |
| 3 | 9085252 | 2024-07-27 | 2024-07-23 | Baseline Assessment | legacy-year-37 | cancelled |
| 4 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-11 | 2025-12-07 | Distributed Survey | compact-year-38 | active |

A challenge such as the one identified by `7119777` and named "Extended Corridor" runs from September 5 to September 1, 2022, under the institution label "Extended Corridor" and carries the status `active`. The year group `seasonal-year-35` provides an additional cohort dimension. Challenges progress through a lifecycle: the challenge `4005` ("Pilot Series A") has reached `completed` status, while `9085252` ("Baseline Assessment") was `cancelled` before its conclusion. The UUID-based identifier `ebdf79bc-8fd1-11eb-924d-9cd76263cbd0` for the "Distributed Survey" challenge demonstrates that the system supports both numeric and universally unique identifiers for challenge resolution.

Participants join challenges through an enrollment process that records their identity, their assigned year group, and their current standing within the program.

**Table `reading_participants`**

| participant_id | full_name | year_group | enrollment_date | status | reading_challenge_id |
|---|---|---|---|---|---|
| 3990185 | Theodore Mcgrath | seasonal-year-35 | 2022-05-11 | enrolled | 1 |
| 4716387 | Account Name | regional-year-36 | 2023-10-22 | in_progress | 2 |
| 69430 | Saipan International Airport | legacy-year-37 | 2024-03-06 | completed | 3 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-year-38 | 2025-08-17 | enrolled | 4 |

The participant `3990185`, named Theodore Mcgrath, enrolled on May 11, 2022, and holds the status `enrolled` within challenge `1`. Another participant, `4716387` ("Account Name"), is marked `in_progress` in challenge `2`, while `69430` ("Saipan International Airport") has reached `completed` status in challenge `3`. The participant `c7460a44-8fcc-11eb-924d-9cd76263cbd0` (Norma Fisher) is newly `enrolled` in challenge `4`. The year group assigned to each participant—`seasonal-year-35`, `regional-year-36`, `legacy-year-37`, `compact-year-38`—mirrors the cohort structure of the challenges they join, ensuring that progress is evaluated within the appropriate peer group.

The relationship between challenges and participants is mediated through a junction table that captures the explicit assignment of a participant to a challenge, allowing for many-to-many enrollment patterns where a single participant may join multiple challenges or a challenge may admit participants from diverse sources.

**Table `challenges_participants`**

| reading_challenge_id | participant_id |
|---|---|
| 1 | 3990185 |
| 1 | 4716387 |
| 2 | 4716387 |
| 2 | 69430 |
| 3 | 69430 |
| 3 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 |
| 4 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 |
| 4 | 3990185 |

Once enrolled, participants generate reading records that document each book they have read, including the completion date, the category under which the reading is classified, and metadata about the book itself.

**Table `reading_records`**

| id | record_id | book_title | author_name | completion_date | category | page_count | cover_color | is_recommended | recommended_by | participant_id | reading_category_id | book_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 10449530 | Primary Corridor A | Sarah Villanueva | 2024-03-14 | compact-category-92 | 6 | Purple | true | teacher | 3990185 | 1 | 1 |
| 1001 | 10445619 | Composite Series | Terry Pratchett | 2025-08-25 | composite-category-93 | 7 | White | false | family | 4716387 | 2 | 2 |
| 1002 | 9568457 | Compact Assessment | Nicole Smith | 2022-01-09 | primary-category-94 | 0 | Blue | true | list | 69430 | 3 | 3 |
| 1003 | 20743593 | Legacy Survey D | Collin Lopez | 2023-06-20 | adaptive-category-95 | 15 | Pink | false | teacher | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 4 | 4 |

Record `1000` documents that participant `3990185` completed "Primary Corridor A" by Sarah Villanueva on March 14, 2024. The book carries `6` pages, has a `Purple` cover, and is marked as `recommended` by a `teacher`. Record `1001` shows participant `4716387` finishing "Composite Series" by Terry Pratchett on August 25, 2025—a `7`-page `White`-covered book that is not recommended. Record `1002` for participant `69430` covers "Compact Assessment" by Nicole Smith, a `0`-page `Blue` book recommended via `list`. Record `1003` for participant `c7460a44-8fcc-11eb-924d-9cd76263cbd0` documents "Legacy Survey D" by Collin Lopez, a `15`-page `Pink` book not recommended, completed on June 20, 2023. Each record carries a `reading_category_id` and a `book_id`, linking the reading event to both a classification and a bibliographic entity.

The books themselves form a catalog with attributes that support filtering, recommendation logic, and award eligibility.

**Table `books`**

| book_id | title | author_name | page_count | genre | cover_color | has_award | is_poetry | is_non_fiction | is_wordless |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Compact Initiative | Sarah Villanueva | 6 | primary-genre-40 | Purple | true | true | true | true |
| 2 | Legacy Model | Terry Pratchett | 7 | adaptive-genre-41 | White | false | false | false | false |
| 3 | Regional Cluster A | Nicole Smith | 0 | distributed-genre-42 | Blue | true | true | true | true |
| 4 | Seasonal Review | Collin Lopez | 15 | baseline-genre-43 | Pink | false | false | false | false |

Book `1`, "Compact Initiative" by Sarah Villanueva, spans `6` pages, belongs to `primary-genre-40`, has a `Purple` cover, and carries the flags `has_award`, `is_poetry`, `is_non_fiction`, and `is_wordless` all set to `true`. Book `2`, "Legacy Model" by Terry Pratchett, is a `7`-page `White` book in `adaptive-genre-41` with all flags set to `false`. Book `3`, "Regional Cluster A" by Nicole Smith, is a `0`-page `Blue` book in `distributed-genre-42` with all flags `true`. Book `4`, "Seasonal Review" by Collin Lopez, is a `15`-page `Pink` book in `baseline-genre-43` with all flags `false`. The page counts range from zero to fifteen, reflecting the diversity of reading material from picture books to longer works.

Reading categories provide the classification framework through which books are organized and progress is measured.

**Table `reading_categories`**

| reading_category_id | category_id | category_name | description | is_required | year_group | reading_challenge_id |
|---|---|---|---|---|---|---|
| 1 | state_et_9 | Legacy Programme D | Extended Survey | true | seasonal-year-35 | 1 |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | Pilot Corridor A | false | regional-year-36 | 2 |
| 3 | 1186099 | Seasonal Framework | Baseline Series | true | legacy-year-37 | 3 |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | Distributed Assessment | false | compact-year-38 | 4 |

Category `1` (identifier `state_et_9`, named "Legacy Programme D") is described as "Extended Survey", is marked `is_required`, belongs to year group `seasonal-year-35`, and is associated with challenge `1`. Category `2` (identifier `c744c896-8fcc-11eb-924d-9cd76263cbd0`, named "Regional Standard") is described as "Pilot Corridor A", is not required, belongs to `regional-year-36`, and links to challenge `2`. Category `3` ("Seasonal Framework", "Baseline Series") is required and tied to challenge `3`. Category `4` ("Integrated Protocol A", "Distributed Assessment") is optional and tied to challenge `4`. The `is_required` flag determines whether a category counts toward mandatory program completion.

Award tiers define the milestones that participants can achieve, each specifying a required number of readings and a ceremony date.

**Table `award_tiers`**

| id | award_id | award_name | required_count | ceremony_date | status | reading_challenge_id |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | 16 | 2024-07-10 | available | 1 |
| 2 | 3012811 | Composite Initiative | 13 | 2025-12-21 | awarded | 2 |
| 3 | 15493350 | Compact Model | 9 | 2022-05-05 | pending | 3 |
| 4 | state_uk_17 | Legacy Cluster D | 7 | 2023-10-16 | available | 4 |

Tier `1` (identifier `e02275d4-8fd1-11eb-924d-9cd76263cbd0`, named "Primary Review A") requires `16` readings, has a ceremony date of July 10, 2024, and is currently `available`. Tier `2` ("Composite Initiative") requires `13` readings, has a ceremony date of December 21, 2025, and is `awarded`. Tier `3` ("Compact Model") requires `9` readings, has a ceremony date of May 5, 2022, and is `pending`. Tier `4` ("Legacy Cluster D") requires `7` readings, has a ceremony date of October 16, 2023, and is `available`. The `status` field tracks whether a tier is open for earning, has been awarded, or is awaiting finalization.

The relationship between challenges and award tiers is captured in a junction table that allows a single challenge to offer multiple tiers and a tier to potentially span multiple challenges.

**Table `challenges_tiers`**

| reading_challenge_id | award_tier_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The assignment of participants to specific award tiers is recorded in a dedicated junction table, enabling granular tracking of which participants are pursuing which recognition levels.

**Table `tiers_participants`**

| award_tier_id | participant_id |
|---|---|
| 1 | 3990185 |
| 1 | 4716387 |
| 2 | 4716387 |
| 2 | 69430 |
| 3 | 69430 |
| 3 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 |
| 4 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 |
| 4 | 3990185 |

The linkage between participants and their reading records is managed through a junction table that supports the many-to-many relationship between a participant and the records they generate.

**Table `participants_records`**

| participant_id | reading_record_id |
|---|---|
| 3990185 | 1000 |
| 3990185 | 1001 |
| 4716387 | 1001 |
| 4716387 | 1002 |
| 69430 | 1002 |
| 69430 | 1003 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 1003 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 1000 |

Similarly, the relationship between books and reading records is captured in a junction table that allows a single book to appear across multiple reading records and a single record to reference multiple books.

**Table `books_records`**

| book_id | reading_record_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The classification of books into reading categories is managed through two complementary junction tables that support flexible many-to-many relationships between books and categories.

**Table `books_categories`**

| book_id | reading_category_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `categories_books`**

| reading_category_id | book_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

With the base tables established, the system provides a suite of detail views that join these tables to answer specific operational questions. Each view assembles data from multiple sources to produce a coherent snapshot for reporting and analysis.

The reading challenge participant detail view assembles all participants enrolled in a given challenge, providing a roster with their enrollment dates, statuses, and year groups.

**View `reading_challenge_reading_participant_detail_view`**

```sql
CREATE VIEW reading_challenge_reading_participant_detail_view AS
SELECT a.id, a.challenge_id, a.start_date, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name, b.year_group AS participant_year_group
FROM reading_challenges a
  JOIN challenges_participants j ON j.reading_challenge_id = a.id
  JOIN reading_participants b ON b.participant_id = j.participant_id;
```

| id | challenge_id | start_date | participant_participant_id | participant_full_name | participant_year_group |
|---|---|---|---|---|---|
| 1 | 7119777 | 2022-09-05 | 3990185 | Theodore Mcgrath | seasonal-year-35 |
| 1 | 7119777 | 2022-09-05 | 4716387 | Account Name | regional-year-36 |
| 2 | 4005 | 2023-02-16 | 4716387 | Account Name | regional-year-36 |
| 2 | 4005 | 2023-02-16 | 69430 | Saipan International Airport | legacy-year-37 |
| 3 | 9085252 | 2024-07-27 | 69430 | Saipan International Airport | legacy-year-37 |
| 3 | 9085252 | 2024-07-27 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-year-38 |
| 4 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-11 | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-year-38 |
| 4 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-11 | 3990185 | Theodore Mcgrath | seasonal-year-35 |

This view answers the question: "Who is participating in this challenge and how far along are they?" For challenge `1`, the view would surface Theodore Mcgrath (`3990185`) with his `enrolled` status and enrollment date of May 11, 2022, alongside any other participants linked to that challenge.

The reading challenge award tier detail view joins challenges with their associated award tiers, presenting the recognition structure available within each challenge.

**View `reading_challenge_award_tier_detail_view`**

```sql
CREATE VIEW reading_challenge_award_tier_detail_view AS
SELECT a.id, a.challenge_id, a.start_date, b.id AS tier_id, b.award_id AS tier_award_id, b.award_name AS tier_award_name
FROM reading_challenges a
  JOIN challenges_tiers j ON j.reading_challenge_id = a.id
  JOIN award_tiers b ON b.id = j.award_tier_id;
```

| id | challenge_id | start_date | tier_id | tier_award_id | tier_award_name |
|---|---|---|---|---|---|
| 1 | 7119777 | 2022-09-05 | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A |
| 1 | 7119777 | 2022-09-05 | 2 | 3012811 | Composite Initiative |
| 2 | 4005 | 2023-02-16 | 2 | 3012811 | Composite Initiative |
| 2 | 4005 | 2023-02-16 | 3 | 15493350 | Compact Model |
| 3 | 9085252 | 2024-07-27 | 3 | 15493350 | Compact Model |
| 3 | 9085252 | 2024-07-27 | 4 | state_uk_17 | Legacy Cluster D |
| 4 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-11 | 4 | state_uk_17 | Legacy Cluster D |
| 4 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-11 | 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A |

This view answers: "What awards are available in this challenge and what are the requirements?" For challenge `1`, it would display "Primary Review A" requiring `16` readings with a ceremony on July 10, 2024, and status `available`.

The participant reading challenge view provides the inverse perspective, showing which challenges a given participant is enrolled in.

**View `reading_participant_reading_challenge_view`**

```sql
CREATE VIEW reading_participant_reading_challenge_view AS
SELECT a.participant_id, a.full_name, a.year_group, a.enrollment_date, b.id AS challenge_id, b.challenge_id AS challenge_challenge_id, b.start_date AS challenge_start_date
FROM reading_participants a JOIN reading_challenges b ON a.reading_challenge_id = b.id;
```

| participant_id | full_name | year_group | enrollment_date | challenge_id | challenge_challenge_id | challenge_start_date |
|---|---|---|---|---|---|---|
| 3990185 | Theodore Mcgrath | seasonal-year-35 | 2022-05-11 | 1 | 7119777 | 2022-09-05 |
| 4716387 | Account Name | regional-year-36 | 2023-10-22 | 2 | 4005 | 2023-02-16 |
| 69430 | Saipan International Airport | legacy-year-37 | 2024-03-06 | 3 | 9085252 | 2024-07-27 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-year-38 | 2025-08-17 | 4 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-11 |

This view answers: "Which challenges is this participant involved in?" For participant `3990185`, it would show challenge `1` ("Extended Corridor") with its dates and institution.

The participant reading record detail view aggregates all reading records for a specific participant, giving a complete picture of their reading activity.

**View `reading_participant_reading_record_detail_view`**

```sql
CREATE VIEW reading_participant_reading_record_detail_view AS
SELECT a.participant_id, a.full_name, a.year_group, b.id AS record_id, b.record_id AS record_record_id, b.book_title AS record_book_title
FROM reading_participants a
  JOIN participants_records j ON j.participant_id = a.participant_id
  JOIN reading_records b ON b.id = j.reading_record_id;
```

| participant_id | full_name | year_group | record_id | record_record_id | record_book_title |
|---|---|---|---|---|---|
| 3990185 | Theodore Mcgrath | seasonal-year-35 | 1000 | 10449530 | Primary Corridor A |
| 3990185 | Theodore Mcgrath | seasonal-year-35 | 1001 | 10445619 | Composite Series |
| 4716387 | Account Name | regional-year-36 | 1001 | 10445619 | Composite Series |
| 4716387 | Account Name | regional-year-36 | 1002 | 9568457 | Compact Assessment |
| 69430 | Saipan International Airport | legacy-year-37 | 1002 | 9568457 | Compact Assessment |
| 69430 | Saipan International Airport | legacy-year-37 | 1003 | 20743593 | Legacy Survey D |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-year-38 | 1003 | 20743593 | Legacy Survey D |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-year-38 | 1000 | 10449530 | Primary Corridor A |

This view answers: "What has this participant read?" For participant `3990185`, it would list "Primary Corridor A" completed on March 14, 2024, with its category and book details.

The reading record participant view links each reading record back to the participant who completed it, providing traceability from individual achievements to their owners.

**View `reading_record_reading_participant_view`**

```sql
CREATE VIEW reading_record_reading_participant_view AS
SELECT a.id, a.record_id, a.book_title, a.author_name, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name, b.year_group AS participant_year_group
FROM reading_records a JOIN reading_participants b ON a.participant_id = b.participant_id;
```

| id | record_id | book_title | author_name | participant_participant_id | participant_full_name | participant_year_group |
|---|---|---|---|---|---|---|
| 1000 | 10449530 | Primary Corridor A | Sarah Villanueva | 3990185 | Theodore Mcgrath | seasonal-year-35 |
| 1001 | 10445619 | Composite Series | Terry Pratchett | 4716387 | Account Name | regional-year-36 |
| 1002 | 9568457 | Compact Assessment | Nicole Smith | 69430 | Saipan International Airport | legacy-year-37 |
| 1003 | 20743593 | Legacy Survey D | Collin Lopez | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-year-38 |

This view answers: "Who completed this reading record?" Record `1000` ("Primary Corridor A") would be attributed to participant `3990185` (Theodore Mcgrath).

The reading record category view associates each reading record with its classification category, enabling analysis of reading distribution across categories.

**View `reading_record_reading_category_view`**

```sql
CREATE VIEW reading_record_reading_category_view AS
SELECT a.id, a.record_id, a.book_title, a.author_name, b.reading_category_id AS category_reading_category_id, b.category_id AS category_category_id, b.category_name AS category_category_name
FROM reading_records a JOIN reading_categories b ON a.reading_category_id = b.reading_category_id;
```

| id | record_id | book_title | author_name | category_reading_category_id | category_category_id | category_category_name |
|---|---|---|---|---|---|---|
| 1000 | 10449530 | Primary Corridor A | Sarah Villanueva | 1 | state_et_9 | Legacy Programme D |
| 1001 | 10445619 | Composite Series | Terry Pratchett | 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard |
| 1002 | 9568457 | Compact Assessment | Nicole Smith | 3 | 1186099 | Seasonal Framework |
| 1003 | 20743593 | Legacy Survey D | Collin Lopez | 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A |

This view answers: "Which category does this reading belong to?" Record `1000` would be classified under category `1` ("Legacy Programme D"), a required category for challenge `1`.

The reading record book view connects each reading record to the bibliographic details of the book read, providing full context for each entry.

**View `reading_record_book_view`**

```sql
CREATE VIEW reading_record_book_view AS
SELECT a.id, a.record_id, a.book_title, a.author_name, b.book_id AS book_book_id, b.title AS book_title, b.author_name AS book_author_name
FROM reading_records a JOIN books b ON a.book_id = b.book_id;
```

| id | record_id | book_title | author_name | book_book_id | book_title | book_author_name |
|---|---|---|---|---|---|---|
| 1000 | 10449530 | Primary Corridor A | Sarah Villanueva | 1 | Compact Initiative | Sarah Villanueva |
| 1001 | 10445619 | Composite Series | Terry Pratchett | 2 | Legacy Model | Terry Pratchett |
| 1002 | 9568457 | Compact Assessment | Nicole Smith | 3 | Regional Cluster A | Nicole Smith |
| 1003 | 20743593 | Legacy Survey D | Collin Lopez | 4 | Seasonal Review | Collin Lopez |

This view answers: "What book was read in this record?" Record `1000` would show "Compact Initiative" by Sarah Villanueva, a `6`-page `Purple` book with award and poetry flags set.

The book reading record detail view provides the reverse lookup from book to all records in which it appears, useful for tracking which books are most frequently read.

**View `book_reading_record_detail_view`**

```sql
CREATE VIEW book_reading_record_detail_view AS
SELECT a.book_id, a.title, a.author_name, b.id AS record_id, b.record_id AS record_record_id, b.book_title AS record_book_title
FROM books a
  JOIN books_records j ON j.book_id = a.book_id
  JOIN reading_records b ON b.id = j.reading_record_id;
```

| book_id | title | author_name | record_id | record_record_id | record_book_title |
|---|---|---|---|---|---|
| 1 | Compact Initiative | Sarah Villanueva | 1000 | 10449530 | Primary Corridor A |
| 1 | Compact Initiative | Sarah Villanueva | 1001 | 10445619 | Composite Series |
| 2 | Legacy Model | Terry Pratchett | 1001 | 10445619 | Composite Series |
| 2 | Legacy Model | Terry Pratchett | 1002 | 9568457 | Compact Assessment |
| 3 | Regional Cluster A | Nicole Smith | 1002 | 9568457 | Compact Assessment |
| 3 | Regional Cluster A | Nicole Smith | 1003 | 20743593 | Legacy Survey D |
| 4 | Seasonal Review | Collin Lopez | 1003 | 20743593 | Legacy Survey D |
| 4 | Seasonal Review | Collin Lopez | 1000 | 10449530 | Primary Corridor A |

This view answers: "Which reading records reference this book?" Book `1` ("Compact Initiative") would be linked to record `1000` by participant `3990185`.

The book reading category detail view joins books with their assigned reading categories, showing the classification structure applied to each title.

**View `book_reading_category_detail_view`**

```sql
CREATE VIEW book_reading_category_detail_view AS
SELECT a.book_id, a.title, a.author_name, b.reading_category_id AS category_reading_category_id, b.category_id AS category_category_id, b.category_name AS category_category_name
FROM books a
  JOIN books_categories j ON j.book_id = a.book_id
  JOIN reading_categories b ON b.reading_category_id = j.reading_category_id;
```

| book_id | title | author_name | category_reading_category_id | category_category_id | category_category_name |
|---|---|---|---|---|---|
| 1 | Compact Initiative | Sarah Villanueva | 1 | state_et_9 | Legacy Programme D |
| 1 | Compact Initiative | Sarah Villanueva | 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard |
| 2 | Legacy Model | Terry Pratchett | 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard |
| 2 | Legacy Model | Terry Pratchett | 3 | 1186099 | Seasonal Framework |
| 3 | Regional Cluster A | Nicole Smith | 3 | 1186099 | Seasonal Framework |
| 3 | Regional Cluster A | Nicole Smith | 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A |
| 4 | Seasonal Review | Collin Lopez | 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A |
| 4 | Seasonal Review | Collin Lopez | 1 | state_et_9 | Legacy Programme D |

This view answers: "How is this book classified?" Book `1` would be associated with category `1` ("Legacy Programme D"), indicating it falls under the required reading scope of challenge `1`.

The reading category reading challenge view links categories to their parent challenges, showing which categories are active within each challenge.

**View `reading_category_reading_challenge_view`**

```sql
CREATE VIEW reading_category_reading_challenge_view AS
SELECT a.reading_category_id, a.category_id, a.category_name, a.description, b.id AS challenge_id, b.challenge_id AS challenge_challenge_id, b.start_date AS challenge_start_date
FROM reading_categories a JOIN reading_challenges b ON a.reading_challenge_id = b.id;
```

| reading_category_id | category_id | category_name | description | challenge_id | challenge_challenge_id | challenge_start_date |
|---|---|---|---|---|---|---|
| 1 | state_et_9 | Legacy Programme D | Extended Survey | 1 | 7119777 | 2022-09-05 |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | Pilot Corridor A | 2 | 4005 | 2023-02-16 |
| 3 | 1186099 | Seasonal Framework | Baseline Series | 3 | 9085252 | 2024-07-27 |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | Distributed Assessment | 4 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-11 |

This view answers: "Which categories belong to this challenge?" Category `1` ("Legacy Programme D") would be shown as part of challenge `1` ("Extended Corridor").

The reading category book detail view provides the inverse mapping from categories to the books they contain, supporting curriculum planning and content discovery.

**View `reading_category_book_detail_view`**

```sql
CREATE VIEW reading_category_book_detail_view AS
SELECT a.reading_category_id, a.category_id, a.category_name, b.book_id AS book_book_id, b.title AS book_title, b.author_name AS book_author_name
FROM reading_categories a
  JOIN categories_books j ON j.reading_category_id = a.reading_category_id
  JOIN books b ON b.book_id = j.book_id;
```

| reading_category_id | category_id | category_name | book_book_id | book_title | book_author_name |
|---|---|---|---|---|---|
| 1 | state_et_9 | Legacy Programme D | 1 | Compact Initiative | Sarah Villanueva |
| 1 | state_et_9 | Legacy Programme D | 2 | Legacy Model | Terry Pratchett |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | 2 | Legacy Model | Terry Pratchett |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | 3 | Regional Cluster A | Nicole Smith |
| 3 | 1186099 | Seasonal Framework | 3 | Regional Cluster A | Nicole Smith |
| 3 | 1186099 | Seasonal Framework | 4 | Seasonal Review | Collin Lopez |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | 4 | Seasonal Review | Collin Lopez |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | 1 | Compact Initiative | Sarah Villanueva |

This view answers: "Which books are classified under this category?" Category `1` would list book `1` ("Compact Initiative") and any other books assigned to it.

The award tier reading challenge view connects award tiers to their parent challenges, presenting the recognition framework available within each challenge.

**View `award_tier_reading_challenge_view`**

```sql
CREATE VIEW award_tier_reading_challenge_view AS
SELECT a.id, a.award_id, a.award_name, a.required_count, b.id AS challenge_id, b.challenge_id AS challenge_challenge_id, b.start_date AS challenge_start_date
FROM award_tiers a JOIN reading_challenges b ON a.reading_challenge_id = b.id;
```

| id | award_id | award_name | required_count | challenge_id | challenge_challenge_id | challenge_start_date |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | 16 | 1 | 7119777 | 2022-09-05 |
| 2 | 3012811 | Composite Initiative | 13 | 2 | 4005 | 2023-02-16 |
| 3 | 15493350 | Compact Model | 9 | 3 | 9085252 | 2024-07-27 |
| 4 | state_uk_17 | Legacy Cluster D | 7 | 4 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-11 |

This view answers: "Which award tiers are associated with this challenge?" Tier `1` ("Primary Review A") would be shown as part of challenge `1`.

The award tier reading participant detail view joins award tiers with the participants who have achieved them, providing a recognition report.

**View `award_tier_reading_participant_detail_view`**

```sql
CREATE VIEW award_tier_reading_participant_detail_view AS
SELECT a.id, a.award_id, a.award_name, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name, b.year_group AS participant_year_group
FROM award_tiers a
  JOIN tiers_participants j ON j.award_tier_id = a.id
  JOIN reading_participants b ON b.participant_id = j.participant_id;
```

| id | award_id | award_name | participant_participant_id | participant_full_name | participant_year_group |
|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | 3990185 | Theodore Mcgrath | seasonal-year-35 |
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | 4716387 | Account Name | regional-year-36 |
| 2 | 3012811 | Composite Initiative | 4716387 | Account Name | regional-year-36 |
| 2 | 3012811 | Composite Initiative | 69430 | Saipan International Airport | legacy-year-37 |
| 3 | 15493350 | Compact Model | 69430 | Saipan International Airport | legacy-year-37 |
| 3 | 15493350 | Compact Model | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-year-38 |
| 4 | state_uk_17 | Legacy Cluster D | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-year-38 |
| 4 | state_uk_17 | Legacy Cluster D | 3990185 | Theodore Mcgrath | seasonal-year-35 |

This view answers: "Which participants have earned this award tier?" For tier `2` ("Composite Initiative") with status `awarded`, it would list the participants who met the `13`-reading requirement.

Together, these tables and views form a coherent system for managing reading programs at scale. The base tables capture the raw entities and their relationships, while the views synthesize these into actionable reports. A program administrator can use the challenge-participant view to roster enrollments, the participant-record view to track individual progress, the record-category view to analyze reading distribution, and the award-tier-participant view to recognize achievements. The data model supports the full lifecycle of a reading program—from challenge creation through participant enrollment, reading documentation, and award recognition—while maintaining the flexibility to handle diverse book types, category structures, and year-group cohorts.