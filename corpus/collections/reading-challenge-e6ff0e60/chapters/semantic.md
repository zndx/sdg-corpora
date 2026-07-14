## Ontology-Grounded Relational Modelling of the Reading Challenge Domain

The reading challenge domain captures the lifecycle of institutional reading programs: challenges are launched with temporal boundaries and institutional affiliations, participants enrol and accumulate reading records, each record binds a book to a category and a participant, and award tiers are defined to recognise achievement. The ontology underlying this domain distinguishes six core entity types—`reading_challenge`, `reading_participant`, `reading_record`, `book`, `reading_category`, and `award_tier`—alongside three associative roles that materialise as junction tables. The relational schema normalises these entities into base tables, uses foreign keys for binary relationships, and employs junction tables for many-to-many associations. Views then reconstitute domain facts by joining the normalised tables back together.

### Challenge and Participant Entities

The `reading_challenges` table anchors the domain. Each row represents a discrete reading challenge with a surrogate `id`, a business `challenge_id`, a `start_date` and `end_date` that bound the challenge window, an `institution_name` describing the sponsoring organisation, a `year_group` classifying the cohort, and a `status` flag. Challenge `1` (business key `7119777`) ran from 2022-09-05 to 2022-09-01 under the institution "Extended Corridor" for the `seasonal-year-35` cohort and carries status `active`. Challenge `2` (business key `4005`) spanned 2023-02-16 to 2023-02-12 under "Pilot Series A" for `regional-year-36` and is marked `completed`. Challenge `3` (business key `9085252`) is `cancelled`, and challenge `4` (business key `ebdf79bc-8fd1-11eb-924d-9cd76263cbd0`) is `active`.

**Table `reading_challenges`**

| id | challenge_id | start_date | end_date | institution_name | year_group | status |
|---|---|---|---|---|---|---|
| 1 | 7119777 | 2022-09-05 | 2022-09-01 | Extended Corridor | seasonal-year-35 | active |
| 2 | 4005 | 2023-02-16 | 2023-02-12 | Pilot Series A | regional-year-36 | completed |
| 3 | 9085252 | 2024-07-27 | 2024-07-23 | Baseline Assessment | legacy-year-37 | cancelled |
| 4 | ebdf79bc-8fd1-11eb-924d-9cd76263cbd0 | 2025-12-11 | 2025-12-07 | Distributed Survey | compact-year-38 | active |

Participants are captured in `reading_participants`, which stores a `participant_id`, a `full_name`, a `year_group`, an `enrollment_date`, a `status`, and a foreign key `reading_challenge_id` referencing `reading_challenges(id)`. Participant `3990185` (Theodore Mcgrath) enrolled on 2022-05-11 into challenge `1` with status `enrolled`. Participant `4716387` (Account Name) enrolled on 2023-10-22 into challenge `2` with status `in_progress`. Participant `69430` (Saipan International Airport) completed enrollment on 2024-03-06 into challenge `3` with status `completed`. Participant `c7460a44-8fcc-11eb-924d-9cd76263cbd0` (Norma Fisher) enrolled on 2025-08-17 into challenge `4` with status `enrolled`.

**Table `reading_participants`**

| participant_id | full_name | year_group | enrollment_date | status | reading_challenge_id |
|---|---|---|---|---|---|
| 3990185 | Theodore Mcgrath | seasonal-year-35 | 2022-05-11 | enrolled | 1 |
| 4716387 | Account Name | regional-year-36 | 2023-10-22 | in_progress | 2 |
| 69430 | Saipan International Airport | legacy-year-37 | 2024-03-06 | completed | 3 |
| c7460a44-8fcc-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-year-38 | 2025-08-17 | enrolled | 4 |

The foreign key `reading_participants.reading_challenge_id → reading_challenges.id` enforces that every participant belongs to exactly one challenge. The cardinality is one-to-many: a single challenge row can be referenced by many participant rows, but a participant row references a single challenge.

### Books and Reading Categories

The `books` table stores canonical book metadata. Each row carries a `book_id`, `title`, `author_name`, `page_count`, `genre`, `cover_color`, and four boolean flags: `has_award`, `is_poetry`, `is_non_fiction`, and `is_wordless`. Book `1` (Compact Initiative by Sarah Villanueva, 6 pages, Purple cover) has all four boolean flags set to `true`. Book `2` (Legacy Model by Terry Pratchett, 7 pages, White cover) has all four flags set to `false`. Book `3` (Regional Cluster A by Nicole Smith, 0 pages, Blue cover) mirrors book `1` with all flags `true`. Book `4` (Seasonal Review by Collin Lopez, 15 pages, Pink cover) mirrors book `2` with all flags `false`.

**Table `books`**

| book_id | title | author_name | page_count | genre | cover_color | has_award | is_poetry | is_non_fiction | is_wordless |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Compact Initiative | Sarah Villanueva | 6 | primary-genre-40 | Purple | true | true | true | true |
| 2 | Legacy Model | Terry Pratchett | 7 | adaptive-genre-41 | White | false | false | false | false |
| 3 | Regional Cluster A | Nicole Smith | 0 | distributed-genre-42 | Blue | true | true | true | true |
| 4 | Seasonal Review | Collin Lopez | 15 | baseline-genre-43 | Pink | false | false | false | false |

The `reading_categories` table defines category constraints scoped to a challenge. Columns include `reading_category_id`, `category_id`, `category_name`, `description`, `is_required`, `year_group`, and a foreign key `reading_challenge_id` referencing `reading_challenges(id)`. Category `1` (Legacy Programme D, "Extended Survey", required, `seasonal-year-35`) is tied to challenge `1`. Category `2` (Regional Standard, "Pilot Corridor A", not required, `regional-year-36`) is tied to challenge `2`. Category `3` (Seasonal Framework, "Baseline Series", required, `legacy-year-37`) is tied to challenge `3`. Category `4` (Integrated Protocol A, "Distributed Assessment", not required, `compact-year-38`) is tied to challenge `4`.

**Table `reading_categories`**

| reading_category_id | category_id | category_name | description | is_required | year_group | reading_challenge_id |
|---|---|---|---|---|---|---|
| 1 | state_et_9 | Legacy Programme D | Extended Survey | true | seasonal-year-35 | 1 |
| 2 | c744c896-8fcc-11eb-924d-9cd76263cbd0 | Regional Standard | Pilot Corridor A | false | regional-year-36 | 2 |
| 3 | 1186099 | Seasonal Framework | Baseline Series | true | legacy-year-37 | 3 |
| 4 | 2b2c096e-8fcd-11eb-924d-9cd76263cbd0 | Integrated Protocol A | Distributed Assessment | false | compact-year-38 | 4 |

The foreign key `reading_categories.reading_challenge_id → reading_challenges.id` ensures every category is scoped to exactly one challenge. The cardinality is one-to-many: a challenge can define multiple categories, but each category belongs to one challenge.

### Award Tiers

The `award_tiers` table defines recognition levels within a challenge. Columns include `id`, `award_id`, `award_name`, `required_count` (the number of records needed to qualify), `ceremony_date`, `status`, and a foreign key `reading_challenge_id` referencing `reading_challenges(id)`. Award `1` (Primary Review A, requires 16 records, ceremony 2024-07-10, status `available`) is scoped to challenge `1`. Award `2` (Composite Initiative, requires 13 records, ceremony 2025-12-21, status `awarded`) is scoped to challenge `2`. Award `3` (Compact Model, requires 9 records, ceremony 2022-05-05, status `pending`) is scoped to challenge `3`. Award `4` (Legacy Cluster D, requires 7 records, ceremony 2023-10-16, status `available`) is scoped to challenge `4`.

**Table `award_tiers`**

| id | award_id | award_name | required_count | ceremony_date | status | reading_challenge_id |
|---|---|---|---|---|---|---|
| 1 | e02275d4-8fd1-11eb-924d-9cd76263cbd0 | Primary Review A | 16 | 2024-07-10 | available | 1 |
| 2 | 3012811 | Composite Initiative | 13 | 2025-12-21 | awarded | 2 |
| 3 | 15493350 | Compact Model | 9 | 2022-05-05 | pending | 3 |
| 4 | state_uk_17 | Legacy Cluster D | 7 | 2023-10-16 | available | 4 |

The foreign key `award_tiers.reading_challenge_id → reading_challenges.id` enforces that every award tier belongs to exactly one challenge.

### The Reading Record Entity

The `reading_records` table is the central fact table. Each row records a participant's completion of a book, with columns `id`, `record_id`, `book_title`, `author_name`, `completion_date`, `category`, `page_count`, `cover_color`, `is_recommended`, `recommended_by`, and three foreign keys: `participant_id` referencing `reading_participants(participant_id)`, `reading_category_id` referencing `reading_categories(reading_category_id)`, and `book_id` referencing `books(book_id)`. Record `1000` (book_title "Primary Corridor A", author "Sarah Villanueva", completed 2024-03-14, 6 pages, Purple cover, recommended by teacher) belongs to participant `3990185`, category `1`, and book `1`. Record `1001` (book_title "Composite Series", author "Terry Pratchett", completed 2025-08-25, 7 pages, White cover, not recommended) belongs to participant `4716387`, category `2`, and book `2`. Record `1002` (book_title "Compact Assessment", author "Nicole Smith", completed 2022-01-09, 0 pages, Blue cover, recommended by list) belongs to participant `69430`, category `3`, and book `3`. Record `1003` (book_title "Legacy Survey D", author "Collin Lopez", completed 2023-06-20, 15 pages, Pink cover, not recommended) belongs to participant `c7460a44-8fcc-11eb-924d-9cd76263cbd0`, category `4`, and book `4`.

**Table `reading_records`**

| id | record_id | book_title | author_name | completion_date | category | page_count | cover_color | is_recommended | recommended_by | participant_id | reading_category_id | book_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 10449530 | Primary Corridor A | Sarah Villanueva | 2024-03-14 | compact-category-92 | 6 | Purple | true | teacher | 3990185 | 1 | 1 |
| 1001 | 10445619 | Composite Series | Terry Pratchett | 2025-08-25 | composite-category-93 | 7 | White | false | family | 4716387 | 2 | 2 |
| 1002 | 9568457 | Compact Assessment | Nicole Smith | 2022-01-09 | primary-category-94 | 0 | Blue | true | list | 69430 | 3 | 3 |
| 1003 | 20743593 | Legacy Survey D | Collin Lopez | 2023-06-20 | adaptive-category-95 | 15 | Pink | false | teacher | c7460a44-8fcc-11eb-924d-9cd76263cbd0 | 4 | 4 |

The three foreign keys on `reading_records` enforce referential integrity: each record must reference a valid participant, category, and book. The cardinality is one-to-many from each dimension table to `reading_records`—a single participant can have many records, a single book can appear in many records, and a single category can be referenced by many records.

### Junction Tables for Many-to-Many Relationships

The schema employs seven junction tables to resolve many-to-many associations that the ontology specifies but the base tables cannot express directly. The `challenges_participants` table links `reading_challenges` to `reading_participants`, allowing a participant to be associated with multiple challenges beyond the single FK on `reading_participants`. The `challenges_tiers` table links `reading_challenges` to `award_tiers`, enabling a challenge to define multiple award tiers and a tier to be reused across challenges. The `participants_records` table links `reading_participants` to `reading_records`, providing an alternative join path from participant to record. The `books_records` table links `books` to `reading_records`, enabling a book to be referenced by multiple records and a record to carry multiple book associations. The `books_categories` and `categories_books` tables both link `books` to `reading_categories`, providing bidirectional many-to-many navigation between books and categories. The `tiers_participants` table links `award_tiers` to `reading_participants`, allowing a participant to qualify for multiple award tiers and a tier to be assigned to multiple participants.

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

### View: reading_challenge_reading_participant_detail_view

This view joins `reading_challenges` to `reading_participants` on `reading_challenges.id = reading_participants.reading_challenge_id`, producing one row per participant within each challenge. It answers the question: "Which participants belong to which challenge, and what are their enrollment details?" The row for participant `3990185` (Theodore Mcgrath) shows enrollment on 2022-05-11 into challenge `1` (Extended Corridor, `seasonal-year-35`, `active`). The row for participant `4716387` (Account Name) shows enrollment on 2023-10-22 into challenge `2` (Pilot Series A, `regional-year-36`, `completed`).

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

### View: reading_challenge_award_tier_detail_view

This view joins `reading_challenges` to `award_tiers` on `reading_challenges.id = award_tiers.reading_challenge_id`, producing one row per award tier within each challenge. It answers: "What award tiers are defined for each challenge, and what are their qualification thresholds?" The row for award `1` (Primary Review A, required_count 16, ceremony 2024-07-10, status `available`) is scoped to challenge `1`. The row for award `2` (Composite Initiative, required_count 13, ceremony 2025-12-21, status `awarded`) is scoped to challenge `2`.

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

### View: reading_participant_reading_challenge_view

This view joins `reading_participants` to `reading_challenges` on `reading_participants.reading_challenge_id = reading_challenges.id`, producing the inverse of the previous view: one row per challenge per participant. It answers: "For each participant, which challenge are they enrolled in, and what is the challenge's temporal scope?" The row for participant `3990185` (Theodore Mcgrath, status `enrolled`) shows challenge `1` running from 2022-09-05 to 2022-09-01. The row for participant `c7460a44-8fcc-11eb-924d-9cd76263cbd0` (Norma Fisher, status `enrolled`) shows challenge `4` running from 2025-12-11 to 2025-12-07.

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

### View: reading_participant_reading_record_detail_view

This view joins `reading_participants` to `reading_records` on `reading_participants.participant_id = reading_records.participant_id`, producing one row per record per participant. It answers: "What reading records has each participant completed, and what are the book details?" The row for participant `3990185` shows record `1000` (book_title "Primary Corridor A", completed 2024-03-14, 6 pages, Purple, recommended by teacher). The row for participant `4716387` shows record `1001` (book_title "Composite Series", completed 2025-08-25, 7 pages, White, not recommended).

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

### View: reading_record_reading_participant_view

This view joins `reading_records` to `reading_participants` on `reading_records.participant_id = reading_participants.participant_id`, producing the inverse: one row per participant per record. It answers: "For each reading record, who is the participant and what is their enrollment status?" The row for record `1000` shows participant `3990185` (Theodore Mcgrath, status `enrolled`, enrolled 2022-05-11). The row for record `1003` shows participant `c7460a44-8fcc-11eb-924d-9cd76263cbd0` (Norma Fisher, status `enrolled`, enrolled 2025-08-17).

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

### View: reading_record_reading_category_view

This view joins `reading_records` to `reading_categories` on `reading_records.reading_category_id = reading_categories.reading_category_id`, producing one row per record per category. It answers: "What category constraint applies to each reading record?" The row for record `1000` shows category `1` (Legacy Programme D, "Extended Survey", required, `seasonal-year-35`). The row for record `1001` shows category `2` (Regional Standard, "Pilot Corridor A", not required, `regional-year-36`).

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

### View: reading_record_book_view

This view joins `reading_records` to `books` on `reading_records.book_id = books.book_id`, producing one row per record per book. It answers: "What are the canonical book details for each reading record?" The row for record `1000` shows book `1` (Compact Initiative, Sarah Villanueva, 6 pages, primary-genre-40, Purple, has_award true, is_poetry true, is_non_fiction true, is_wordless true). The row for record `1002` shows book `3` (Regional Cluster A, Nicole Smith, 0 pages, distributed-genre-42, Blue, has_award true, is_poetry true, is_non_fiction true, is_wordless true).

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

### View: book_reading_record_detail_view

This view joins `books` to `reading_records` on `books.book_id = reading_records.book_id`, producing the inverse: one row per record per book. It answers: "For each book, what reading records reference it?" The row for book `1` (Compact Initiative) shows record `1000` (book_title "Primary Corridor A", completed 2024-03-14, recommended by teacher). The row for book `4` (Seasonal Review) shows record `1003` (book_title "Legacy Survey D", completed 2023-06-20, not recommended).

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

### View: book_reading_category_detail_view

This view joins `books` to `reading_categories` through the `books_categories` junction table, producing one row per book-category association. It answers: "Which categories are associated with each book?" The row for book `1` (Compact Initiative) is associated with category `1` (Legacy Programme D, "Extended Survey", required). The row for book `2` (Legacy Model) is associated with category `2` (Regional Standard, "Pilot Corridor A", not required).

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

### View: reading_category_reading_challenge_view

This view joins `reading_categories` to `reading_challenges` on `reading_categories.reading_challenge_id = reading_challenges.id`, producing one row per category per challenge. It answers: "Which categories are defined within each challenge?" The row for category `1` (Legacy Programme D, required) is scoped to challenge `1` (Extended Corridor, `seasonal-year-35`, `active`). The row for category `4` (Integrated Protocol A, not required) is scoped to challenge `4` (Distributed Survey, `compact-year-38`, `active`).

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

### View: reading_category_book_detail_view

This view joins `reading_categories` to `books` through the `categories_books` junction table, producing one row per category-book association. It answers: "For each category, which books are associated with it?" The row for category `1` (Legacy Programme D) is associated with book `1` (Compact Initiative, Sarah Villanueva, 6 pages, Purple). The row for category `3` (Seasonal Framework) is associated with book `3` (Regional Cluster A, Nicole Smith, 0 pages, Blue).

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

### View: award_tier_reading_challenge_view

This view joins `award_tiers` to `reading_challenges` on `award_tiers.reading_challenge_id = reading_challenges.id`, producing one row per tier per challenge. It answers: "Which award tiers belong to each challenge?" The row for award `1` (Primary Review A, required_count 16, ceremony 2024-07-10, status `available`) is scoped to challenge `1` (Extended Corridor, `seasonal-year-35`). The row for award `4` (Legacy Cluster D, required_count 7, ceremony 2023-10-16, status `available`) is scoped to challenge `4` (Distributed Survey, `compact-year-38`).

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

### View: award_tier_reading_participant_detail_view

This view joins `award_tiers` to `reading_participants` through the `tiers_participants` junction table, producing one row per tier-participant association. It answers: "Which participants are associated with each award tier?" The row for award `1` (Primary Review A, required_count 16) is associated with participant `3990185` (Theodore Mcgrath, status `enrolled`, enrolled 2022-05-11). The row for award `2` (Composite Initiative, required_count 13) is associated with participant `4716387` (Account Name, status `in_progress`, enrolled 2023-10-22).

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

### Synthesis

The reading challenge domain is modelled as a star-like schema centred on `reading_records`, with foreign keys pointing to `reading_participants`, `books`, and `reading_categories`, and with `award_tiers` and `reading_challenges` providing additional dimensionality. The seven junction tables (`challenges_participants`, `challenges_tiers`, `participants_records`, `books_records`, `books_categories`, `categories_books`, `tiers_participants`) resolve the many-to-many relationships that the ontology prescribes but the base tables cannot express directly. The twelve views reconstitute domain facts by joining the normalised tables back together, each view answering a specific analytical question: participant-to-challenge membership, record-to-book provenance, category-to-challenge scoping, and tier-to-participant qualification. The concrete values in the data—challenge `1` (Extended Corridor, `seasonal-year-35`, `active`), participant `3990185` (Theodore Mcgrath, `enrolled`), record `1000` (Primary Corridor A, completed 2024-03-14, recommended by teacher), book `1` (Compact Initiative, 6 pages, Purple, all boolean flags true), category `1` (Legacy Programme D, required), and award `1` (Primary Review A, required_count 16, ceremony 2024-07-10)—illustrate how the schema captures the full lifecycle of a reading challenge from launch through participant enrollment, record accumulation, and award qualification.