The educational supply chain domain captures the procurement and allocation of learning materials across a school system. At its core, the domain distinguishes three product families—textbooks, exercise books, and stationery items—each bound to a grade level and a subject, while textbooks carry an additional publisher dimension. The relational schema normalizes these entities into six base tables, four junction tables that resolve many-to-many associations, and twelve materialized views that reassemble domain facts for reporting. The following chapter walks through the ontology, the normalization decisions, and the join logic that each view encodes.

**Table `textbooks`**

| id | isbn | title | publisher | edition | price | subject | grade_level | part_identifier | grade_level_id | publisher_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2618568 | Compact Initiative | pilot-publishe-50 | baseline-edition-91 | 12.87 | adaptive-subject-83 | 29 | PAR-2423 | 1 | 1000 |
| 1001 | 4277024 | Legacy Model | extended-publishe-51 | pilot-edition-92 | 35.45 | distributed-subject-84 | 33 | PAR-2427 | 2 | 1001 |
| 1002 | 1208-0004-M | Regional Cluster A | integrated-publishe-52 | extended-edition-93 | 29.24 | baseline-subject-85 | 37 | PAR-2431 | 3 | 1002 |
| 1003 | 3717612 | Seasonal Review | seasonal-publishe-53 | integrated-edition-94 | 29.99 | pilot-subject-86 | 41 | PAR-2435 | 4 | 1003 |

The `textbooks` table is the primary entity for curriculum books. Its surrogate key `id` (e.g. `1000`, `1001`) uniquely identifies each row, while the business identifier `isbn` carries values such as `2618568` and `1208-0004-M`. The descriptive columns `title` (e.g. `Compact Initiative`, `Legacy Model`) and `part_identifier` (e.g. `PAR-2423`) provide human-readable labels. Publishing metadata lives in `publisher` (a denormalized name like `pilot-publishe-50`), `edition` (`baseline-edition-91`), and `price` (`12.87`). The columns `subject` and `grade_level` store denormalized labels (`adaptive-subject-83`, `29`), while the foreign keys `grade_level_id` and `publisher_id` resolve to the `grade_levels` and `publishers` tables respectively. This dual representation—denormalized labels alongside normalized foreign keys—allows quick inspection while preserving referential integrity.

**Table `exercise_books`**

| exercise_book_id | code | description | size | line_type | unit_price | required_quantity | subject | is_compulsory | grade_level_id | subject_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m_I_4 | Extended Survey | adaptive-size-83 | pilot-line-38 | 5,692 | 9 | adaptive-subject-83 | false | 1 | 1 |
| 101 | 2986219 | Pilot Corridor A | distributed-size-84 | extended-line-39 | 45,650 | 2 | distributed-subject-84 | true | 2 | 2 |
| 102 | 8928520 | Baseline Series | baseline-size-85 | integrated-line-40 | 2,705 | 4 | baseline-subject-85 | false | 3 | 3 |
| 103 | 195369 | Distributed Assessment | pilot-size-86 | seasonal-line-41 | 211.07 | 5 | pilot-subject-86 | true | 4 | 4 |

Exercise books are captured in `exercise_books`, where the surrogate key `exercise_book_id` (e.g. `100`, `101`) anchors each record. The business code `code` (e.g. `lu_tax_code_template_m_I_4`, `2986219`) and the free-text `description` (`Extended Survey`, `Pilot Corridor A`) identify the product. Physical and formatting attributes appear in `size` (`adaptive-size-83`) and `line_type` (`pilot-line-38`). Procurement data includes `unit_price` (`5,692`), `required_quantity` (`9`), and the boolean flag `is_compulsory` (`false`, `true`). The foreign keys `grade_level_id` and `subject_id` link the exercise book to its target grade and subject.

**Table `stationery_items`**

| code | description | unit_price | required_quantity | is_compulsory | color | grade_level_id | subject_id |
|---|---|---|---|---|---|---|---|
| lu_tax_code_template_m_I_4 | Extended Survey | 5,692 | 9 | false | Green | 1 | 1 |
| 2986219 | Pilot Corridor A | 45,650 | 2 | true | Brown | 2 | 2 |
| 8928520 | Baseline Series | 2,705 | 4 | false | Brown | 3 | 3 |
| 195369 | Distributed Assessment | 211.07 | 5 | true | Pink | 4 | 4 |

Stationery items are the simplest product entity. The table `stationery_items` uses `code` as its business key (e.g. `lu_tax_code_template_m_I_4`, `8928520`) alongside `description` (`Extended Survey`, `Baseline Series`). Pricing and procurement fields mirror exercise books: `unit_price` (`5,692`), `required_quantity` (`9`), and `is_compulsory` (`false`). A `color` column (`Green`, `Brown`, `Pink`) is unique to stationery. Foreign keys `grade_level_id` and `subject_id` bind each item to a grade and subject.

**Table `grade_levels`**

| id | grade_number | academic_year | school_name |
|---|---|---|---|
| 1 | 29 | 42 | Seasonal Standard |
| 2 | 33 | 51 | Integrated Framework |
| 3 | 37 | 60 | Extended Protocol D |
| 4 | 41 | 69 | Pilot Programme |

The `grade_levels` table normalizes the grade dimension. Its surrogate key `id` (`1`, `2`, `3`, `4`) is referenced by foreign keys across product tables. The business column `grade_number` holds values `29`, `33`, `37`, `41`, while `academic_year` stores `42`, `51`, `60`, `69`. The `school_name` column (`Seasonal Standard`, `Integrated Framework`, `Extended Protocol D`, `Pilot Programme`) identifies the institution. This table is a classic lookup dimension, small and stable.

**Table `subjects`**

| id | name | language_code | textbook_id | exercise_book_id |
|---|---|---|---|---|
| 1 | Extended Review | 20723567 | 1000 | 100 |
| 2 | Pilot Initiative A | 32825 | 1001 | 101 |
| 3 | Baseline Model | b_VB-EC-15 | 1002 | 102 |
| 4 | Distributed Cluster | 974927 | 1003 | 103 |

Subjects are stored in `subjects`, keyed by `id` (`1`–`4`). The `name` column (`Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`) is the human-readable label. The `language_code` column carries opaque identifiers such as `20723567` and `b_VB-EC-15`. The columns `textbook_id` and `exercise_book_id` are denormalized references that point back to the `textbooks` and `exercise_books` tables, creating a bidirectional link between the subject dimension and the two product families.

**Table `publishers`**

| publisher_id | name | created_at | updated_at |
|---|---|---|---|
| 1000 | Extended Review | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Pilot Initiative A | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Baseline Model | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Distributed Cluster | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Publishers are normalized in `publishers`, keyed by `publisher_id` (`1000`–`1003`). The `name` column (`Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`) stores the organization label. Audit timestamps `created_at` and `updated_at` (e.g. `2025-01-01 00:14:00`) track lifecycle events. The `textbooks` table references this table through `publisher_id`.

The three product families are each associated with grade levels and subjects. Rather than embedding grade and subject identifiers directly in every product table, the schema introduces three junction tables to resolve the many-to-many relationships.

**Table `levels_textbooks`**

| grade_level_id | textbook_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `levels_textbooks` junction table links `textbooks` to `grade_levels`. Each row represents a valid pairing of a textbook with a grade level, enabling a single textbook to serve multiple grades and a single grade to carry multiple textbooks. The foreign keys reference `textbooks.id` and `grade_levels.id`.

**Table `levels_books`**

| grade_level_id | exercise_book_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

Similarly, `levels_books` connects `exercise_books` to `grade_levels`. The many-to-many relationship allows flexible assignment of exercise books across grades.

**Table `levels_items`**

| grade_level_id | stationery_item_code |
|---|---|
| 1 | lu_tax_code_template_m_I_4 |
| 1 | 2986219 |
| 2 | 2986219 |
| 2 | 8928520 |
| 3 | 8928520 |
| 3 | 195369 |
| 4 | 195369 |
| 4 | lu_tax_code_template_m_I_4 |

The `levels_items` junction table resolves the relationship between `stationery_items` and `grade_levels`. Stationery items, like the other product families, can be assigned to multiple grades.

**Table `publishers_textbooks`**

| publisher_id | textbook_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

The `publishers_textbooks` junction table links `publishers` to `textbooks`. This many-to-many association permits a publisher to produce multiple textbooks and a textbook to be co-published. The foreign keys reference `publishers.publisher_id` and `textbooks.id`.

With the base and junction tables defined, the schema materializes twelve views that reassemble normalized data into domain-relevant facts. Each view is a `SELECT` with explicit `JOIN` clauses that reconstruct the relationships the foreign keys encode.

**View `textbook_grade_level_view`**

```sql
CREATE VIEW textbook_grade_level_view AS
SELECT a.id, a.isbn, a.title, a.publisher, b.id AS level_id, b.grade_number AS level_grade_number, b.academic_year AS level_academic_year
FROM textbooks a JOIN grade_levels b ON a.grade_level_id = b.id;
```

| id | isbn | title | publisher | level_id | level_grade_number | level_academic_year |
|---|---|---|---|---|---|---|
| 1000 | 2618568 | Compact Initiative | pilot-publishe-50 | 1 | 29 | 42 |
| 1001 | 4277024 | Legacy Model | extended-publishe-51 | 2 | 33 | 51 |
| 1002 | 1208-0004-M | Regional Cluster A | integrated-publishe-52 | 3 | 37 | 60 |
| 1003 | 3717612 | Seasonal Review | seasonal-publishe-53 | 4 | 41 | 69 |

The `textbook_grade_level_view` joins `textbooks` to `grade_levels` on `textbooks.grade_level_id = grade_levels.id`. It answers the question: *Which grade level is each textbook assigned to?* Reading the first row, textbook `id = 1000` (`Compact Initiative`, ISBN `2618568`) is associated with `grade_number = 29` at `Seasonal Standard`. The second row shows textbook `1001` (`Legacy Model`) linked to `grade_number = 33` at `Integrated Framework`. This view collapses the denormalized `grade_level` column in `textbooks` into the authoritative grade dimension, providing a clean grade-to-textbook mapping.

**View `textbook_publisher_view`**

```sql
CREATE VIEW textbook_publisher_view AS
SELECT a.id, a.isbn, a.title, a.publisher, b.publisher_id AS publisher_publisher_id, b.name AS publisher_name, b.created_at AS publisher_created_at
FROM textbooks a JOIN publishers b ON a.publisher_id = b.publisher_id;
```

| id | isbn | title | publisher | publisher_publisher_id | publisher_name | publisher_created_at |
|---|---|---|---|---|---|---|
| 1000 | 2618568 | Compact Initiative | pilot-publishe-50 | 1000 | Extended Review | 2025-01-01 00:14:00 |
| 1001 | 4277024 | Legacy Model | extended-publishe-51 | 1001 | Pilot Initiative A | 2025-02-06 03:14:00 |
| 1002 | 1208-0004-M | Regional Cluster A | integrated-publishe-52 | 1002 | Baseline Model | 2025-03-11 06:14:00 |
| 1003 | 3717612 | Seasonal Review | seasonal-publishe-53 | 1003 | Distributed Cluster | 2025-04-16 09:14:00 |

The `textbook_publisher_view` joins `textbooks` to `publishers` via `textbooks.publisher_id = publishers.publisher_id`. It answers: *Which publisher produced each textbook?* Row one shows textbook `1000` (`Compact Initiative`) published by `Extended Review` (`publisher_id = 1000`), created on `2025-01-01 00:14:00`. Row two links textbook `1001` (`Legacy Model`) to `Pilot Initiative A` (`publisher_id = 1001`). This view replaces the denormalized `publisher` column in `textbooks` with the full publisher record, including audit timestamps.

**View `exercise_book_grade_level_view`**

```sql
CREATE VIEW exercise_book_grade_level_view AS
SELECT a.exercise_book_id, a.code, a.description, a.size, b.id AS level_id, b.grade_number AS level_grade_number, b.academic_year AS level_academic_year
FROM exercise_books a JOIN grade_levels b ON a.grade_level_id = b.id;
```

| exercise_book_id | code | description | size | level_id | level_grade_number | level_academic_year |
|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m_I_4 | Extended Survey | adaptive-size-83 | 1 | 29 | 42 |
| 101 | 2986219 | Pilot Corridor A | distributed-size-84 | 2 | 33 | 51 |
| 102 | 8928520 | Baseline Series | baseline-size-85 | 3 | 37 | 60 |
| 103 | 195369 | Distributed Assessment | pilot-size-86 | 4 | 41 | 69 |

The `exercise_book_grade_level_view` joins `exercise_books` to `grade_levels` on `exercise_books.grade_level_id = grade_levels.id`. It answers: *Which grade level requires each exercise book?* The first row pairs exercise book `100` (`Extended Survey`, code `lu_tax_code_template_m_I_4`) with `grade_number = 29` at `Seasonal Standard`. The second row links exercise book `101` (`Pilot Corridor A`) to `grade_number = 33` at `Integrated Framework`. This view is useful for grade-level procurement planning.

**View `exercise_book_subject_view`**

```sql
CREATE VIEW exercise_book_subject_view AS
SELECT a.exercise_book_id, a.code, a.description, a.size, b.id AS subject_id, b.name AS subject_name, b.language_code AS subject_language_code
FROM exercise_books a JOIN subjects b ON a.subject_id = b.id;
```

| exercise_book_id | code | description | size | subject_id | subject_name | subject_language_code |
|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m_I_4 | Extended Survey | adaptive-size-83 | 1 | Extended Review | 20723567 |
| 101 | 2986219 | Pilot Corridor A | distributed-size-84 | 2 | Pilot Initiative A | 32825 |
| 102 | 8928520 | Baseline Series | baseline-size-85 | 3 | Baseline Model | b_VB-EC-15 |
| 103 | 195369 | Distributed Assessment | pilot-size-86 | 4 | Distributed Cluster | 974927 |

The `exercise_book_subject_view` joins `exercise_books` to `subjects` via `exercise_books.subject_id = subjects.id`. It answers: *Which subject does each exercise book serve?* Row one shows exercise book `100` (`Extended Survey`) mapped to subject `Extended Review` (`id = 1`). Row two links exercise book `101` (`Pilot Corridor A`) to subject `Pilot Initiative A` (`id = 2`). This view supports subject-based inventory analysis.

**View `stationery_item_grade_level_view`**

```sql
CREATE VIEW stationery_item_grade_level_view AS
SELECT a.code, a.description, a.unit_price, a.required_quantity, b.id AS level_id, b.grade_number AS level_grade_number, b.academic_year AS level_academic_year
FROM stationery_items a JOIN grade_levels b ON a.grade_level_id = b.id;
```

| code | description | unit_price | required_quantity | level_id | level_grade_number | level_academic_year |
|---|---|---|---|---|---|---|
| lu_tax_code_template_m_I_4 | Extended Survey | 5,692 | 9 | 1 | 29 | 42 |
| 2986219 | Pilot Corridor A | 45,650 | 2 | 2 | 33 | 51 |
| 8928520 | Baseline Series | 2,705 | 4 | 3 | 37 | 60 |
| 195369 | Distributed Assessment | 211.07 | 5 | 4 | 41 | 69 |

The `stationery_item_grade_level_view` joins `stationery_items` to `grade_levels` on `stationery_items.grade_level_id = grade_levels.id`. It answers: *Which grade level requires each stationery item?* The first row associates stationery code `lu_tax_code_template_m_I_4` (`Extended Survey`, Green, unit price `5,692`) with `grade_number = 29` at `Seasonal Standard`. The second row links code `2986219` (`Pilot Corridor A`, Brown) to `grade_number = 33` at `Integrated Framework`. This view is essential for grade-level supply lists.

**View `stationery_item_subject_view`**

```sql
CREATE VIEW stationery_item_subject_view AS
SELECT a.code, a.description, a.unit_price, a.required_quantity, b.id AS subject_id, b.name AS subject_name, b.language_code AS subject_language_code
FROM stationery_items a JOIN subjects b ON a.subject_id = b.id;
```

| code | description | unit_price | required_quantity | subject_id | subject_name | subject_language_code |
|---|---|---|---|---|---|---|
| lu_tax_code_template_m_I_4 | Extended Survey | 5,692 | 9 | 1 | Extended Review | 20723567 |
| 2986219 | Pilot Corridor A | 45,650 | 2 | 2 | Pilot Initiative A | 32825 |
| 8928520 | Baseline Series | 2,705 | 4 | 3 | Baseline Model | b_VB-EC-15 |
| 195369 | Distributed Assessment | 211.07 | 5 | 4 | Distributed Cluster | 974927 |

The `stationery_item_subject_view` joins `stationery_items` to `subjects` via `stationery_items.subject_id = subjects.id`. It answers: *Which subject is each stationery item allocated to?* Row one shows stationery code `lu_tax_code_template_m_I_4` (`Extended Survey`) mapped to subject `Extended Review` (`id = 1`). Row two links code `2986219` (`Pilot Corridor A`) to subject `Pilot Initiative A` (`id = 2`). This view supports subject-based procurement analysis.

**View `grade_level_textbook_detail_view`**

```sql
CREATE VIEW grade_level_textbook_detail_view AS
SELECT a.id, a.grade_number, a.academic_year, b.id AS textbook_id, b.isbn AS textbook_isbn, b.title AS textbook_title
FROM grade_levels a
  JOIN levels_textbooks j ON j.grade_level_id = a.id
  JOIN textbooks b ON b.id = j.textbook_id;
```

| id | grade_number | academic_year | textbook_id | textbook_isbn | textbook_title |
|---|---|---|---|---|---|
| 1 | 29 | 42 | 1000 | 2618568 | Compact Initiative |
| 1 | 29 | 42 | 1001 | 4277024 | Legacy Model |
| 2 | 33 | 51 | 1001 | 4277024 | Legacy Model |
| 2 | 33 | 51 | 1002 | 1208-0004-M | Regional Cluster A |
| 3 | 37 | 60 | 1002 | 1208-0004-M | Regional Cluster A |
| 3 | 37 | 60 | 1003 | 3717612 | Seasonal Review |
| 4 | 41 | 69 | 1003 | 3717612 | Seasonal Review |
| 4 | 41 | 69 | 1000 | 2618568 | Compact Initiative |

The `grade_level_textbook_detail_view` performs a three-way join: `grade_levels` → `levels_textbooks` → `textbooks`. It answers: *What is the complete textbook roster for each grade level?* This view materializes the many-to-many relationship as a denormalized detail list. For example, a row might show `grade_number = 29` at `Seasonal Standard` carrying textbook `1000` (`Compact Initiative`, ISBN `2618568`, price `12.87`, edition `baseline-edition-91`). The join reconstructs the full textbook record from the normalized tables, enabling grade-level curriculum reports.

**View `grade_level_exercise_book_detail_view`**

```sql
CREATE VIEW grade_level_exercise_book_detail_view AS
SELECT a.id, a.grade_number, a.academic_year, b.exercise_book_id AS book_exercise_book_id, b.code AS book_code, b.description AS book_description
FROM grade_levels a
  JOIN levels_books j ON j.grade_level_id = a.id
  JOIN exercise_books b ON b.exercise_book_id = j.exercise_book_id;
```

| id | grade_number | academic_year | book_exercise_book_id | book_code | book_description |
|---|---|---|---|---|---|
| 1 | 29 | 42 | 100 | lu_tax_code_template_m_I_4 | Extended Survey |
| 1 | 29 | 42 | 101 | 2986219 | Pilot Corridor A |
| 2 | 33 | 51 | 101 | 2986219 | Pilot Corridor A |
| 2 | 33 | 51 | 102 | 8928520 | Baseline Series |
| 3 | 37 | 60 | 102 | 8928520 | Baseline Series |
| 3 | 37 | 60 | 103 | 195369 | Distributed Assessment |
| 4 | 41 | 69 | 103 | 195369 | Distributed Assessment |
| 4 | 41 | 69 | 100 | lu_tax_code_template_m_I_4 | Extended Survey |

The `grade_level_exercise_book_detail_view` joins `grade_levels` → `levels_books` → `exercise_books`. It answers: *What exercise books are assigned to each grade?* A representative row links `grade_number = 29` at `Seasonal Standard` to exercise book `100` (`Extended Survey`, code `lu_tax_code_template_m_I_4`, unit price `5,692`, required quantity `9`, compulsory `false`). This view supports grade-level exercise book procurement.

**View `grade_level_stationery_item_detail_view`**

```sql
CREATE VIEW grade_level_stationery_item_detail_view AS
SELECT a.id, a.grade_number, a.academic_year, b.code AS item_code, b.description AS item_description, b.unit_price AS item_unit_price
FROM grade_levels a
  JOIN levels_items j ON j.grade_level_id = a.id
  JOIN stationery_items b ON b.code = j.stationery_item_code;
```

| id | grade_number | academic_year | item_code | item_description | item_unit_price |
|---|---|---|---|---|---|
| 1 | 29 | 42 | lu_tax_code_template_m_I_4 | Extended Survey | 5,692 |
| 1 | 29 | 42 | 2986219 | Pilot Corridor A | 45,650 |
| 2 | 33 | 51 | 2986219 | Pilot Corridor A | 45,650 |
| 2 | 33 | 51 | 8928520 | Baseline Series | 2,705 |
| 3 | 37 | 60 | 8928520 | Baseline Series | 2,705 |
| 3 | 37 | 60 | 195369 | Distributed Assessment | 211.07 |
| 4 | 41 | 69 | 195369 | Distributed Assessment | 211.07 |
| 4 | 41 | 69 | lu_tax_code_template_m_I_4 | Extended Survey | 5,692 |

The `grade_level_stationery_item_detail_view` joins `grade_levels` → `levels_items` → `stationery_items`. It answers: *What stationery items are required for each grade?* A row might show `grade_number = 29` at `Seasonal Standard` requiring stationery code `lu_tax_code_template_m_I_4` (`Extended Survey`, Green, unit price `5,692`, required quantity `9`, compulsory `false`). This view is the basis for grade-level supply ordering.

**View `subject_textbook_view`**

```sql
CREATE VIEW subject_textbook_view AS
SELECT a.id, a.name, a.language_code, a.exercise_book_id, b.id AS textbook_id, b.isbn AS textbook_isbn, b.title AS textbook_title
FROM subjects a JOIN textbooks b ON a.textbook_id = b.id;
```

| id | name | language_code | exercise_book_id | textbook_id | textbook_isbn | textbook_title |
|---|---|---|---|---|---|---|
| 1 | Extended Review | 20723567 | 100 | 1000 | 2618568 | Compact Initiative |
| 2 | Pilot Initiative A | 32825 | 101 | 1001 | 4277024 | Legacy Model |
| 3 | Baseline Model | b_VB-EC-15 | 102 | 1002 | 1208-0004-M | Regional Cluster A |
| 4 | Distributed Cluster | 974927 | 103 | 1003 | 3717612 | Seasonal Review |

The `subject_textbook_view` joins `subjects` to `textbooks` via `subjects.textbook_id = textbooks.id`. It answers: *Which textbooks are associated with each subject?* Row one links subject `Extended Review` (`id = 1`) to textbook `1000` (`Compact Initiative`, ISBN `2618568`). Row two maps subject `Pilot Initiative A` (`id = 2`) to textbook `1001` (`Legacy Model`). This view supports subject-based textbook inventory.

**View `subject_exercise_book_view`**

```sql
CREATE VIEW subject_exercise_book_view AS
SELECT a.id, a.name, a.language_code, a.textbook_id, b.exercise_book_id AS book_exercise_book_id, b.code AS book_code, b.description AS book_description
FROM subjects a JOIN exercise_books b ON a.exercise_book_id = b.exercise_book_id;
```

| id | name | language_code | textbook_id | book_exercise_book_id | book_code | book_description |
|---|---|---|---|---|---|---|
| 1 | Extended Review | 20723567 | 1000 | 100 | lu_tax_code_template_m_I_4 | Extended Survey |
| 2 | Pilot Initiative A | 32825 | 1001 | 101 | 2986219 | Pilot Corridor A |
| 3 | Baseline Model | b_VB-EC-15 | 1002 | 102 | 8928520 | Baseline Series |
| 4 | Distributed Cluster | 974927 | 1003 | 103 | 195369 | Distributed Assessment |

The `subject_exercise_book_view` joins `subjects` to `exercise_books` via `subjects.exercise_book_id = exercise_books.exercise_book_id`. It answers: *Which exercise books serve each subject?* Row one shows subject `Extended Review` (`id = 1`) paired with exercise book `100` (`Extended Survey`, code `lu_tax_code_template_m_I_4`). Row two links subject `Pilot Initiative A` (`id = 2`) to exercise book `101` (`Pilot Corridor A`). This view enables subject-level exercise book analysis.

**View `publisher_textbook_detail_view`**

```sql
CREATE VIEW publisher_textbook_detail_view AS
SELECT a.publisher_id, a.name, a.created_at, b.id AS textbook_id, b.isbn AS textbook_isbn, b.title AS textbook_title
FROM publishers a
  JOIN publishers_textbooks j ON j.publisher_id = a.publisher_id
  JOIN textbooks b ON b.id = j.textbook_id;
```

| publisher_id | name | created_at | textbook_id | textbook_isbn | textbook_title |
|---|---|---|---|---|---|
| 1000 | Extended Review | 2025-01-01 00:14:00 | 1000 | 2618568 | Compact Initiative |
| 1000 | Extended Review | 2025-01-01 00:14:00 | 1001 | 4277024 | Legacy Model |
| 1001 | Pilot Initiative A | 2025-02-06 03:14:00 | 1001 | 4277024 | Legacy Model |
| 1001 | Pilot Initiative A | 2025-02-06 03:14:00 | 1002 | 1208-0004-M | Regional Cluster A |
| 1002 | Baseline Model | 2025-03-11 06:14:00 | 1002 | 1208-0004-M | Regional Cluster A |
| 1002 | Baseline Model | 2025-03-11 06:14:00 | 1003 | 3717612 | Seasonal Review |
| 1003 | Distributed Cluster | 2025-04-16 09:14:00 | 1003 | 3717612 | Seasonal Review |
| 1003 | Distributed Cluster | 2025-04-16 09:14:00 | 1000 | 2618568 | Compact Initiative |

The `publisher_textbook_detail_view` joins `publishers` to `publishers_textbooks` to `textbooks`. It answers: *What textbooks has each publisher produced?* A row might show publisher `Extended Review` (`publisher_id = 1000`, created `2025-01-01 00:14:00`) producing textbook `1000` (`Compact Initiative`, ISBN `2618568`, price `12.87`, edition `baseline-edition-91`). This view supports publisher catalog reports and is the only view that traverses the `publishers_textbooks` junction table.

The schema design follows a clear normalization pattern: product entities (`textbooks`, `exercise_books`, `stationery_items`) store their own attributes and foreign keys to the dimension tables (`grade_levels`, `subjects`, `publishers`). Junction tables (`levels_textbooks`, `levels_books`, `levels_items`, `publishers_textbooks`) resolve many-to-many relationships that cannot be expressed with a single foreign key. The twelve views materialize the most common join paths, each answering a specific analytical question by reassembling normalized data into a denormalized fact. This architecture separates the canonical data model from the reporting layer, allowing the base tables to evolve independently while the views provide stable query interfaces for downstream consumers.