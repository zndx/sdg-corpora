## Sacred Texts and Their Human Context

The study of sacred literature rests on a structured understanding of how writings are organized, who they concern, and what transformative events they record. At the foundation of this domain are testaments—major divisions that group scriptures into coherent collections. Each testament carries descriptive flags indicating whether it contains gospels, law, or prophecy, and whether it spans pre-Christian or post-resurrection periods. Within these divisions, individual scriptures are catalogued with metadata about their scope, language, and canonical standing. The records show scriptures ranging from a single chapter to dozens, written in Hebrew, Arramaic, or Greek, and marked as either immutable or subject to revision.

**Table `testaments`**

| testament_id | name | is_pre_christian | is_post_resurrection | contains_gospels | contains_law | contains_prophecy |
|---|---|---|---|---|---|---|
| 1 | Old Testament | false | false | true | false | false |
| 2 | New Testament | true | true | false | true | true |
| 3 | Old Testament | false | false | true | false | false |
| 4 | New Testament | true | true | false | true | true |

The testament records reveal a deliberate taxonomy. The first testament, identified as the Old Testament, is flagged as containing gospels but not law or prophecy, and it sits outside the post-resurrection period. The second testament, also labelled New Testament, carries the opposite pattern: it contains law and prophecy but not gospels, and it is explicitly post-resurrection. This cross-classification suggests that the taxonomy is not a simple binary but a multi-dimensional classification where each testament can carry several independent attributes.

**Table `scriptures`**

| id | book_count | canonical_status | is_god_breathed | total_chapters | total_verses | original_language | is_immutable | testament_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10 | Old Testament | true | 19 | 1 | Hebrew | true | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 0 | New Testament | false | 2 | 0 | Aramaic | false | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 1 | Old Testament | true | 3 | 15 | Greek | true | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 47 | New Testament | false | 3 | 14 | Hebrew | false | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Scriptures are the primary textual units. Each scripture record carries a `book_count` that indicates how many books it encompasses—ranging from zero for scripture 2 to forty-seven for scripture 4. The `canonical_status` field mirrors the testament name, while `is_god_breathed` and `is_immutable` are boolean flags that together describe the theological weight of the text. Scripture 1, for instance, is both god-breathed and immutable, written in Hebrew with nineteen chapters and one verse. Scripture 4, by contrast, is neither god-breathed nor immutable, yet it spans forty-seven books across three chapters and fourteen verses. The `original_language` column records Hebrew, Aramaic, or Greek, and the `testament_id` foreign key anchors each scripture to its parent testament.

**Table `verses`**

| id | book_reference | chapter_number | verse_number | text_content | is_promise | is_teaching | is_prophecy | is_historical | scripture_id | person_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | integrated-book-16 | 49 | 12 | integrated-text-58 | true | false | false | false | 1 | 1 |
| 2 | seasonal-book-17 | 60 | 23 | seasonal-text-59 | false | true | true | true | 2 | 2 |
| 3 | regional-book-18 | 71 | 34 | regional-text-60 | true | false | false | false | 3 | 3 |
| 4 | legacy-book-19 | 82 | 45 | legacy-text-61 | false | true | true | true | 4 | 4 |

Verses are the smallest citable units of text. Each verse carries a `book_reference` such as `integrated-book-16` or `seasonal-book-17`, a `chapter_number` and `verse_number` for precise location, and the `text_content` itself. Beyond the raw text, verses are annotated with four boolean flags: `is_promise`, `is_teaching`, `is_prophecy`, and `is_historical`. Verse 1 is classified as a promise but not as teaching, prophecy, or historical material. Verse 2, on the other hand, is simultaneously a teaching, a prophecy, and a historical record, though it is not a promise. These flags allow practitioners to filter and cross-reference verses by their literary and theological genre.

The relationship between scriptures and verses is mediated by the junction table `scriptures_verses`, which records which verses belong to which scriptures. Similarly, the `testaments_scriptures` table links testaments to their constituent scriptures, forming the hierarchical backbone of the collection.

**Table `scriptures_verses`**

| scripture_id | verse_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `testaments_scriptures`**

| testament_id | scripture_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

## Persons and Their Roles

The domain tracks persons who appear in or are associated with the sacred texts. The `persons` table records each individual's name and a set of role flags: `is_divine`, `is_apostle`, `is_prophet`, `is_disciple`, and `is_messiah`. Each person is also linked to a specific verse through `verse_id` and may be designated as the subject of a verse via `is_subject_of_verse_id`.

**Table `persons`**

| id | name | is_divine | is_apostle | is_prophet | is_disciple | is_messiah | verse_id | is_subject_of_verse_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Dana Nguyen | false | true | false | true | false | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Kimberly Myers | true | false | true | false | true | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Kimberly Myers | false | true | false | true | false | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Guam International Airport | true | false | true | false | true | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The person records illustrate a range of roles. Dana Nguyen (id 1) is an apostle and disciple but not divine, not a prophet, and not the messiah; she is linked to verse 1 and is the subject of that same verse. Kimberly Myers appears twice in the dataset: as id 2, where she is divine, a prophet, and the messiah (linked to verse 2), and as id 3, where she is an apostle and disciple (linked to verse 3). The fourth record, Guam International Airport (id 4), is divine, a prophet, and the messiah, linked to verse 4. The duplication of the name Kimberly Myers across two distinct records with different role profiles suggests that the system supports multiple person entries for the same name, differentiated by their theological attributes and verse associations.

The `events_persons` and `changes_persons` junction tables connect persons to salvation events and spiritual changes respectively, enabling queries that trace which individuals are associated with which transformative occurrences.

**Table `events_persons`**

| salvation_event_id | person_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `changes_persons`**

| spiritual_change_id | person_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

## Salvation Events and Spiritual Changes

Two categories of transformative occurrences are tracked: salvation events and spiritual changes. Each category is a standalone table with descriptive boolean attributes, and each is linked to verses and persons through separate junction tables.

**Table `salvation_events`**

| salvation_event_id | is_instantaneous | requires_faith | is_by_grace | is_through_word | is_irreversible |
|---|---|---|---|---|---|
| 1 | true | false | true | true | false |
| 2 | false | true | false | false | true |
| 3 | true | false | true | true | false |
| 4 | false | true | false | false | true |

Salvation events are characterized by five attributes. The `is_instantaneous` flag distinguishes events that occur at a single moment from those that unfold over time. The `requires_faith` flag indicates whether the event demands active faith from the recipient. The `is_by_grace` flag marks events that are unmerited gifts. The `is_through_word` flag identifies events mediated through the spoken or written word. Finally, `is_irreversible` marks events that cannot be undone. Event 1 is instantaneous, by grace, and through the word, but does not require faith and is reversible. Event 2 is non-instantaneous, requires faith, is not by grace, is not through the word, and is irreversible. The alternating pattern across the four records suggests a typology of salvation experiences.

**Table `spiritual_changes`**

| spiritual_change_id | is_healing | is_sanctification | is_empowerment | is_ongoing | is_internal |
|---|---|---|---|---|---|
| 1 | true | true | true | true | false |
| 2 | false | false | false | false | true |
| 3 | true | true | true | true | false |
| 4 | false | false | false | false | true |

Spiritual changes are described by five attributes as well. `is_healing` marks restorative changes, `is_sanctification` marks consecratory changes, and `is_empowerment` marks changes that confer ability. The `is_ongoing` flag distinguishes continuous processes from punctiliar ones, and `is_internal` marks changes that occur within the person rather than in the external world. Change 1 is healing, sanctification, empowerment, ongoing, and external. Change 2 is none of these—it is a baseline or null-type record. Change 3 mirrors change 1 exactly, while change 4 mirrors change 2. This pairing pattern suggests the data may encode contrasting or complementary types of spiritual transformation.

The `events_verses` and `changes_verses` junction tables link salvation events and spiritual changes to specific verses, allowing practitioners to trace which scriptural passages are associated with which events and changes.

**Table `events_verses`**

| salvation_event_id | verse_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `changes_verses`**

| spiritual_change_id | verse_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

## Joined Perspectives: Views as Analytical Lenses

The views in this domain synthesize the base tables into readable perspectives that answer specific analytical questions. Each view joins multiple tables to produce a unified record that combines textual, personal, and event-level information.

The view `v_scripture_verse_detail` combines scripture metadata with verse information, answering the question: "What are the verses within each scripture, and what are the scripture's properties?" A row from this view would show a scripture's book count, language, and testament alongside the verse's reference, chapter, verse number, and text content.

**View `v_scripture_verse_detail`**

```sql
CREATE VIEW v_scripture_verse_detail AS
SELECT a.id, a.book_count, a.canonical_status, b.id AS verse_id, b.book_reference AS verse_book_reference, b.chapter_number AS verse_chapter_number
FROM scriptures a
  JOIN scriptures_verses j ON j.scripture_id = a.id
  JOIN verses b ON b.id = j.verse_id;
```

| id | book_count | canonical_status | verse_id | verse_book_reference | verse_chapter_number |
|---|---|---|---|---|---|
| 1 | 10 | Old Testament | 1 | integrated-book-16 | 49 |
| 1 | 10 | Old Testament | 2 | seasonal-book-17 | 60 |
| 2 | 0 | New Testament | 2 | seasonal-book-17 | 60 |
| 2 | 0 | New Testament | 3 | regional-book-18 | 71 |
| 3 | 1 | Old Testament | 3 | regional-book-18 | 71 |
| 3 | 1 | Old Testament | 4 | legacy-book-19 | 82 |
| 4 | 47 | New Testament | 4 | legacy-book-19 | 82 |
| 4 | 47 | New Testament | 1 | integrated-book-16 | 49 |

The view `v_scripture_testament` joins scriptures to their parent testaments, answering: "Which scriptures belong to which testament, and what are the testament's characteristics?" This view would surface the testament's name and flags (contains_gospels, contains_law, contains_prophecy) alongside the scripture's metadata.

**View `v_scripture_testament`**

```sql
CREATE VIEW v_scripture_testament AS
SELECT a.id, a.book_count, a.canonical_status, a.is_god_breathed, b.testament_id AS testament_testament_id, b.name AS testament_name, b.is_pre_christian AS testament_is_pre_christian
FROM scriptures a JOIN testaments b ON a.testament_id = b.testament_id;
```

| id | book_count | canonical_status | is_god_breathed | testament_testament_id | testament_name | testament_is_pre_christian |
|---|---|---|---|---|---|---|
| 1 | 10 | Old Testament | true | 1 | Old Testament | false |
| 2 | 0 | New Testament | false | 2 | New Testament | true |
| 3 | 1 | Old Testament | true | 3 | Old Testament | false |
| 4 | 47 | New Testament | false | 4 | New Testament | true |

The view `v_verse_scripture` reverses the perspective, presenting verses with their parent scripture's details. It answers: "Which scripture does this verse belong to, and what are that scripture's attributes?"

**View `v_verse_scripture`**

```sql
CREATE VIEW v_verse_scripture AS
SELECT a.id, a.book_reference, a.chapter_number, a.verse_number, b.id AS scripture_id, b.book_count AS scripture_book_count, b.canonical_status AS scripture_canonical_status
FROM verses a JOIN scriptures b ON a.scripture_id = b.id;
```

| id | book_reference | chapter_number | verse_number | scripture_id | scripture_book_count | scripture_canonical_status |
|---|---|---|---|---|---|---|
| 1 | integrated-book-16 | 49 | 12 | 1 | 10 | Old Testament |
| 2 | seasonal-book-17 | 60 | 23 | 2 | 0 | New Testament |
| 3 | regional-book-18 | 71 | 34 | 3 | 1 | Old Testament |
| 4 | legacy-book-19 | 82 | 45 | 4 | 47 | New Testament |

The view `v_verse_person` joins verses to the persons associated with them, answering: "Which persons are linked to which verses?" A row would show the verse's text and flags alongside the person's name and role flags.

**View `v_verse_person`**

```sql
CREATE VIEW v_verse_person AS
SELECT a.id, a.book_reference, a.chapter_number, a.verse_number, b.id AS person_id, b.name AS person_name, b.is_divine AS person_is_divine
FROM verses a JOIN persons b ON a.person_id = b.id;
```

| id | book_reference | chapter_number | verse_number | person_id | person_name | person_is_divine |
|---|---|---|---|---|---|---|
| 1 | integrated-book-16 | 49 | 12 | 1 | Dana Nguyen | false |
| 2 | seasonal-book-17 | 60 | 23 | 2 | Kimberly Myers | true |
| 3 | regional-book-18 | 71 | 34 | 3 | Kimberly Myers | false |
| 4 | legacy-book-19 | 82 | 45 | 4 | Guam International Airport | true |

The view `v_testament_scripture_detail` provides a detailed listing of all scriptures within each testament, enriched with testament-level metadata. It answers: "What is the full inventory of scriptures in each testament, and how do the testaments differ?"

**View `v_testament_scripture_detail`**

```sql
CREATE VIEW v_testament_scripture_detail AS
SELECT a.testament_id, a.name, a.is_pre_christian, b.id AS scripture_id, b.book_count AS scripture_book_count, b.canonical_status AS scripture_canonical_status
FROM testaments a
  JOIN testaments_scriptures j ON j.testament_id = a.testament_id
  JOIN scriptures b ON b.id = j.scripture_id;
```

| testament_id | name | is_pre_christian | scripture_id | scripture_book_count | scripture_canonical_status |
|---|---|---|---|---|---|
| 1 | Old Testament | false | 1 | 10 | Old Testament |
| 1 | Old Testament | false | 2 | 0 | New Testament |
| 2 | New Testament | true | 2 | 0 | New Testament |
| 2 | New Testament | true | 3 | 1 | Old Testament |
| 3 | Old Testament | false | 3 | 1 | Old Testament |
| 3 | Old Testament | false | 4 | 47 | New Testament |
| 4 | New Testament | true | 4 | 47 | New Testament |
| 4 | New Testament | true | 1 | 10 | Old Testament |

The view `v_person_verse` presents persons alongside their associated verses, answering: "What verses is this person connected to, and what are the verse's characteristics?" This view is the person-centric counterpart to `v_verse_person`.

**View `v_person_verse`**

```sql
CREATE VIEW v_person_verse AS
SELECT a.id, a.name, a.is_divine, a.is_apostle, b.id AS verse_id, b.book_reference AS verse_book_reference, b.chapter_number AS verse_chapter_number
FROM persons a JOIN verses b ON a.verse_id = b.id;
```

| id | name | is_divine | is_apostle | verse_id | verse_book_reference | verse_chapter_number |
|---|---|---|---|---|---|---|
| 1 | Dana Nguyen | false | true | 1 | integrated-book-16 | 49 |
| 2 | Kimberly Myers | true | false | 2 | seasonal-book-17 | 60 |
| 3 | Kimberly Myers | false | true | 3 | regional-book-18 | 71 |
| 4 | Guam International Airport | true | false | 4 | legacy-book-19 | 82 |

The view `v_salvation_event_verse_detail` joins salvation events to their associated verses, answering: "Which verses are linked to which salvation events, and what are the event's theological attributes?" A row would combine the event's flags (is_instantaneous, requires_faith, is_by_grace, is_through_word, is_irreversible) with the verse's reference, text, and genre flags.

**View `v_salvation_event_verse_detail`**

```sql
CREATE VIEW v_salvation_event_verse_detail AS
SELECT a.salvation_event_id, a.is_instantaneous, a.requires_faith, b.id AS verse_id, b.book_reference AS verse_book_reference, b.chapter_number AS verse_chapter_number
FROM salvation_events a
  JOIN events_verses j ON j.salvation_event_id = a.salvation_event_id
  JOIN verses b ON b.id = j.verse_id;
```

| salvation_event_id | is_instantaneous | requires_faith | verse_id | verse_book_reference | verse_chapter_number |
|---|---|---|---|---|---|
| 1 | true | false | 1 | integrated-book-16 | 49 |
| 1 | true | false | 2 | seasonal-book-17 | 60 |
| 2 | false | true | 2 | seasonal-book-17 | 60 |
| 2 | false | true | 3 | regional-book-18 | 71 |
| 3 | true | false | 3 | regional-book-18 | 71 |
| 3 | true | false | 4 | legacy-book-19 | 82 |
| 4 | false | true | 4 | legacy-book-19 | 82 |
| 4 | false | true | 1 | integrated-book-16 | 49 |

The view `v_salvation_event_person_detail` joins salvation events to persons, answering: "Which persons are associated with which salvation events?" This view would surface the person's name and role flags alongside the event's attributes.

**View `v_salvation_event_person_detail`**

```sql
CREATE VIEW v_salvation_event_person_detail AS
SELECT a.salvation_event_id, a.is_instantaneous, a.requires_faith, b.id AS person_id, b.name AS person_name, b.is_divine AS person_is_divine
FROM salvation_events a
  JOIN events_persons j ON j.salvation_event_id = a.salvation_event_id
  JOIN persons b ON b.id = j.person_id;
```

| salvation_event_id | is_instantaneous | requires_faith | person_id | person_name | person_is_divine |
|---|---|---|---|---|---|
| 1 | true | false | 1 | Dana Nguyen | false |
| 1 | true | false | 2 | Kimberly Myers | true |
| 2 | false | true | 2 | Kimberly Myers | true |
| 2 | false | true | 3 | Kimberly Myers | false |
| 3 | true | false | 3 | Kimberly Myers | false |
| 3 | true | false | 4 | Guam International Airport | true |
| 4 | false | true | 4 | Guam International Airport | true |
| 4 | false | true | 1 | Dana Nguyen | false |

The view `v_spiritual_change_verse_detail` joins spiritual changes to their associated verses, answering: "Which verses are linked to which spiritual changes, and what are the change's characteristics?" A row would combine the change's flags (is_healing, is_sanctification, is_empowerment, is_ongoing, is_internal) with the verse's metadata.

**View `v_spiritual_change_verse_detail`**

```sql
CREATE VIEW v_spiritual_change_verse_detail AS
SELECT a.spiritual_change_id, a.is_healing, a.is_sanctification, b.id AS verse_id, b.book_reference AS verse_book_reference, b.chapter_number AS verse_chapter_number
FROM spiritual_changes a
  JOIN changes_verses j ON j.spiritual_change_id = a.spiritual_change_id
  JOIN verses b ON b.id = j.verse_id;
```

| spiritual_change_id | is_healing | is_sanctification | verse_id | verse_book_reference | verse_chapter_number |
|---|---|---|---|---|---|
| 1 | true | true | 1 | integrated-book-16 | 49 |
| 1 | true | true | 2 | seasonal-book-17 | 60 |
| 2 | false | false | 2 | seasonal-book-17 | 60 |
| 2 | false | false | 3 | regional-book-18 | 71 |
| 3 | true | true | 3 | regional-book-18 | 71 |
| 3 | true | true | 4 | legacy-book-19 | 82 |
| 4 | false | false | 4 | legacy-book-19 | 82 |
| 4 | false | false | 1 | integrated-book-16 | 49 |

The view `v_spiritual_change_person_detail` joins spiritual changes to persons, answering: "Which persons are associated with which spiritual changes?" This view would surface the person's name and role flags alongside the change's attributes.

**View `v_spiritual_change_person_detail`**

```sql
CREATE VIEW v_spiritual_change_person_detail AS
SELECT a.spiritual_change_id, a.is_healing, a.is_sanctification, b.id AS person_id, b.name AS person_name, b.is_divine AS person_is_divine
FROM spiritual_changes a
  JOIN changes_persons j ON j.spiritual_change_id = a.spiritual_change_id
  JOIN persons b ON b.id = j.person_id;
```

| spiritual_change_id | is_healing | is_sanctification | person_id | person_name | person_is_divine |
|---|---|---|---|---|---|
| 1 | true | true | 1 | Dana Nguyen | false |
| 1 | true | true | 2 | Kimberly Myers | true |
| 2 | false | false | 2 | Kimberly Myers | true |
| 2 | false | false | 3 | Kimberly Myers | false |
| 3 | true | true | 3 | Kimberly Myers | false |
| 3 | true | true | 4 | Guam International Airport | true |
| 4 | false | false | 4 | Guam International Airport | true |
| 4 | false | false | 1 | Dana Nguyen | false |

## Synthesis

The domain models sacred literature as a multi-layered structure: testaments contain scriptures, scriptures contain verses, and verses are annotated with theological genre flags. Persons are linked to verses and to events, while salvation events and spiritual changes are each linked to both verses and persons through junction tables. The views synthesize these relationships into readable perspectives that support queries about textual provenance, person-verse associations, and the theological character of events and changes.

The data records themselves—scriptures ranging from one to forty-seven books, verses classified as promises, teachings, prophecies, or historical accounts, persons bearing roles from apostle to messiah, and events characterized by attributes like grace, faith, and irreversibility—form a coherent framework for studying the intersections of text, person, and transformation. The junction tables and views together enable practitioners to navigate from the macro-level of testaments down to the micro-level of individual verses and the persons and events they reference, providing a complete analytical infrastructure for the domain.