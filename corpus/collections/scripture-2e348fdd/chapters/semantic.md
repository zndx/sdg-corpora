## Ontology-Grounded Relational Modelling of the Scriptural Domain

The domain under examination is a theological knowledge base that captures the structure of sacred texts, the persons who authored or appear within them, and the soteriological and spiritual transformations that verses are understood to effect. At the conceptual level, the ontology distinguishes six entity types: `Scripture` (a book or collection of books), `Verse` (an individual textual unit), `Testament` (a high-level division of the canon), `Person` (an agent—human or divine—who speaks or is spoken of), `SalvationEvent` (a discrete act of salvation with theological attributes), and `SpiritualChange` (a transformation such as healing, sanctification, or empowerment). These concepts materialise as twelve relational tables: six base tables holding entity attributes, and six junction tables encoding many-to-many relationships. On top of this normalised core, eleven views reconstruct denormalised facts that answer concrete domain queries.

**Table `scriptures`**

| id | book_count | canonical_status | is_god_breathed | total_chapters | total_verses | original_language | is_immutable | testament_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10 | Old Testament | true | 19 | 1 | Hebrew | true | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 0 | New Testament | false | 2 | 0 | Aramaic | false | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 1 | Old Testament | true | 3 | 15 | Greek | true | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 47 | New Testament | false | 3 | 14 | Hebrew | false | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `scriptures` table is the primary entity for sacred books. Each row represents one scripture with a surrogate `id` (1 through 4 in the sample), a `book_count` indicating how many constituent books it contains (ranging from 0 to 47), a `canonical_status` string such as "Old Testament" or "New Testament", and a pair of boolean flags—`is_god_breathed` and `is_immutable`—that encode theological properties. The `total_chapters` and `total_verses` columns store aggregate counts; for instance, scripture 1 has 19 chapters and 1 verse, while scripture 3 carries 15 verses. The `original_language` column records the language of composition (Hebrew, Aramaic, or Greek). A foreign key `testament_id` links each scripture to its parent testament. Timestamps `created_at` and `updated_at` track the lifecycle of the record. The data shows a mix of canonical and non-canonical entries: scripture 1 is marked `is_god_breathed = true` and `is_immutable = true`, whereas scripture 2 has both flags set to `false`.

**Table `testaments`**

| testament_id | name | is_pre_christian | is_post_resurrection | contains_gospels | contains_law | contains_prophecy |
|---|---|---|---|---|---|---|
| 1 | Old Testament | false | false | true | false | false |
| 2 | New Testament | true | true | false | true | true |
| 3 | Old Testament | false | false | true | false | false |
| 4 | New Testament | true | true | false | true | true |

The `testaments` table defines the high-level divisions of the canon. Each row carries a `testament_id` (1–4), a `name` (either "Old Testament" or "New Testament"), and five boolean attributes: `is_pre_christian`, `is_post_resurrection`, `contains_gospels`, `contains_law`, and `contains_prophecy`. The sample data reveals that testament 1 is labelled "Old Testament" with `is_pre_christian = false` and `contains_gospels = true`, while testament 2 is labelled "New Testament" with `is_pre_christian = true` and `is_post_resurrection = true`. The foreign key from `scriptures.testament_id` to `testaments.testament_id` establishes a many-to-one relationship: many scriptures belong to one testament. This relationship is also materialised explicitly in the junction table `testaments_scriptures`, which allows a testament to be associated with multiple scriptures and a scripture to reference multiple testaments in more complex ontologies.

**Table `verses`**

| id | book_reference | chapter_number | verse_number | text_content | is_promise | is_teaching | is_prophecy | is_historical | scripture_id | person_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | integrated-book-16 | 49 | 12 | integrated-text-58 | true | false | false | false | 1 | 1 |
| 2 | seasonal-book-17 | 60 | 23 | seasonal-text-59 | false | true | true | true | 2 | 2 |
| 3 | regional-book-18 | 71 | 34 | regional-text-60 | true | false | false | false | 3 | 3 |
| 4 | legacy-book-19 | 82 | 45 | legacy-text-61 | false | true | true | true | 4 | 4 |

The `verses` table stores individual textual units. Each row has a surrogate `id`, a `book_reference` string (e.g. "integrated-book-16", "seasonal-book-17"), `chapter_number` and `verse_number` integers, and `text_content` holding the actual verse text. Four boolean flags—`is_promise`, `is_teaching`, `is_prophecy`, and `is_historical`—classify the verse's genre or function. Foreign keys `scripture_id` and `person_id` link the verse to its parent scripture and to a person associated with it. In the sample, verse 1 belongs to scripture 1 and person 1, carries the text "integrated-text-58", and is flagged as a promise (`is_promise = true`) but not as teaching, prophecy, or historical content. Verse 2, by contrast, is a teaching, prophecy, and historical verse associated with scripture 2 and person 2.

**Table `persons`**

| id | name | is_divine | is_apostle | is_prophet | is_disciple | is_messiah | verse_id | is_subject_of_verse_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Dana Nguyen | false | true | false | true | false | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Kimberly Myers | true | false | true | false | true | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Kimberly Myers | false | true | false | true | false | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Guam International Airport | true | false | true | false | true | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `persons` table captures agents in the domain. Each row has a surrogate `id`, a `name` (such as "Dana Nguyen" or "Kimberly Myers"), and five boolean role flags: `is_divine`, `is_apostle`, `is_prophet`, `is_disciple`, and `is_messiah`. Two foreign keys, `verse_id` and `is_subject_of_verse_id`, link a person to a verse they authored and to a verse in which they are the subject, respectively. Timestamps `created_at` and `updated_at` track record lifecycle. Person 1, "Dana Nguyen", is an apostle and disciple but not divine or messianic; person 2, "Kimberly Myers", is divine, a prophet, and the messiah; person 4, "Guam International Airport", is also divine, prophetic, and messianic—a fictional entity included for completeness.

**Table `salvation_events`**

| salvation_event_id | is_instantaneous | requires_faith | is_by_grace | is_through_word | is_irreversible |
|---|---|---|---|---|---|
| 1 | true | false | true | true | false |
| 2 | false | true | false | false | true |
| 3 | true | false | true | true | false |
| 4 | false | true | false | false | true |

The `salvation_events` table models discrete acts of salvation. Each row has a surrogate `salvation_event_id` and five boolean attributes: `is_instantaneous`, `requires_faith`, `is_by_grace`, `is_through_word`, and `is_irreversible`. Event 1 is instantaneous, by grace, and through the word, but not irreversible; event 2 is non-instantaneous, requires faith, and is irreversible. These flags allow theological queries about the nature of salvation across the corpus.

**Table `spiritual_changes`**

| spiritual_change_id | is_healing | is_sanctification | is_empowerment | is_ongoing | is_internal |
|---|---|---|---|---|---|
| 1 | true | true | true | true | false |
| 2 | false | false | false | false | true |
| 3 | true | true | true | true | false |
| 4 | false | false | false | false | true |

The `spiritual_changes` table records transformations such as healing, sanctification, and empowerment. Each row has a surrogate `spiritual_change_id` and five boolean attributes: `is_healing`, `is_sanctification`, `is_empowerment`, `is_ongoing`, and `is_internal`. Change 1 is simultaneously a healing, sanctification, and empowerment that is ongoing but not internal; change 2 is none of those and is internal. This table, like `salvation_events`, is a pure attribute store with no direct foreign keys to other base tables—relationships are mediated through junction tables.

The six junction tables encode the many-to-many relationships that the ontology requires but that cannot be expressed through simple foreign keys. The `scriptures_verses` table links `scriptures` to `verses`, allowing a scripture to contain many verses and a verse to be referenced by multiple scriptures in cross-referencing scenarios. The `testaments_scriptures` table links `testaments` to `scriptures`, providing an explicit many-to-many bridge that complements the direct `scriptures.testament_id` foreign key. The `events_verses` table associates `salvation_events` with `verses`, enabling queries about which verses are implicated in which acts of salvation. The `events_persons` table links `salvation_events` to `persons`, identifying who is involved in each salvation event. The `changes_verses` table associates `spiritual_changes` with `verses`, and the `changes_persons` table links `spiritual_changes` to `persons`. Together, these six junction tables form the relational backbone that reconstructs the full ontology graph from normalised tables.

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

The eleven views sit on top of this normalised core and each answers a specific domain question by joining two or more base or junction tables. A view does not store data; it materialises a fact at query time by reconstructing the join path that the ontology prescribes.

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

The view `v_scripture_verse_detail` joins `scriptures` to `verses` (directly or through `scriptures_verses`) and returns one row per verse enriched with its parent scripture's metadata. It answers the question: "What scripture does this verse belong to, and what are the scripture's theological attributes?" Reading the sample, a row might show verse 1 ("integrated-text-58") alongside scripture 1's `canonical_status = 'Old Testament'`, `is_god_breathed = true`, and `original_language = 'Hebrew'`. This view is the primary detail view for verse-level exploration.

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

The view `v_scripture_testament` joins `scriptures` to `testaments` via `testaments_scriptures` (or the direct `scriptures.testament_id` FK) and returns one row per scripture with its testament's classification. It answers: "Which testament does this scripture belong to, and what are the testament's properties?" A sample row would pair scripture 1 with testament 1, showing `testaments.name = 'Old Testament'`, `testaments.contains_gospels = true`, and `testaments.is_pre_christian = false`.

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

The view `v_verse_scripture` is the inverse of `v_scripture_verse_detail`: it starts from `verses` and joins to `scriptures`, returning one row per verse with the scripture's identifying columns. It answers: "Given a verse, what is its parent scripture?" A sample row shows verse 1 with `scriptures.id = 1`, `scriptures.book_count = 10`, and `scriptures.total_chapters = 19`.

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

The view `v_verse_person` joins `verses` to `persons` via the `verses.person_id` foreign key and returns one row per verse enriched with the associated person's name and role flags. It answers: "Which person is associated with this verse?" A sample row pairs verse 1 with person 1 ("Dana Nguyen", `is_apostle = true`, `is_disciple = true`), and verse 2 with person 2 ("Kimberly Myers", `is_divine = true`, `is_messiah = true`).

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

The view `v_testament_scripture_detail` joins `testaments` to `scriptures` and returns one row per scripture enriched with its testament's classification. It answers: "What is the full detail of each scripture including its testament context?" A sample row shows testament 1 ("Old Testament", `contains_gospels = true`) alongside scripture 1 (`book_count = 10`, `total_chapters = 19`, `original_language = 'Hebrew'`).

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

The view `v_person_verse` is the inverse of `v_verse_person`: it starts from `persons` and joins to `verses`, returning one row per person with the verses they are associated with. It answers: "Which verses are linked to this person?" A sample row shows person 1 ("Dana Nguyen") alongside verse 1 (`book_reference = 'integrated-book-16'`, `chapter_number = 49`, `verse_number = 12`).

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

The view `v_salvation_event_verse_detail` joins `salvation_events` to `verses` through the `events_verses` junction table and returns one row per (event, verse) pair enriched with both the event's theological flags and the verse's text and classification. It answers: "Which verses are implicated in which salvation events, and what are the event's attributes?" A sample row might pair salvation event 1 (`is_instantaneous = true`, `is_by_grace = true`, `is_through_word = true`) with verse 1 ("integrated-text-58", `is_promise = true`).

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

The view `v_salvation_event_person_detail` joins `salvation_events` to `persons` through the `events_persons` junction table and returns one row per (event, person) pair. It answers: "Which persons are involved in which salvation events?" A sample row might pair event 1 with person 1 ("Dana Nguyen"), showing the event's `is_irreversible = false` alongside the person's `is_apostle = true`.

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

The view `v_spiritual_change_verse_detail` joins `spiritual_changes` to `verses` through the `changes_verses` junction table and returns one row per (change, verse) pair enriched with both the change's transformation flags and the verse's metadata. It answers: "Which verses are associated with which spiritual changes, and what kind of change is it?" A sample row might pair change 1 (`is_healing = true`, `is_sanctification = true`, `is_empowerment = true`, `is_ongoing = true`) with verse 1 ("integrated-text-58").

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

The view `v_spiritual_change_person_detail` joins `spiritual_changes` to `persons` through the `changes_persons` junction table and returns one row per (change, person) pair. It answers: "Which persons are associated with which spiritual changes?" A sample row might pair change 1 with person 1 ("Dana Nguyen"), showing the change's `is_internal = false` alongside the person's `is_prophet = false`.

The relational schema presented here faithfully materialises the underlying ontology. Six base tables hold the entity attributes in first normal form, with surrogate keys and boolean flags encoding the domain's classification taxonomy. Six junction tables resolve the many-to-many relationships that the ontology requires—linking scriptures to verses, testaments to scriptures, salvation events to verses and persons, and spiritual changes to verses and persons. The eleven views then reconstruct the denormalised facts that domain analysts and theologians need: verse-level detail with scripture context, testament-level classification of scriptures, person-verse associations, and the cross-referencing of salvation events and spiritual changes with both verses and persons. Every join path in the views corresponds directly to a relationship in the ontology, ensuring that the relational schema is not merely a storage mechanism but a faithful, queryable representation of the domain model.