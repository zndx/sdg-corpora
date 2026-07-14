## Cataloging Educational Materials Across Grade Levels and Subjects

Educational institutions manage a complex ecosystem of learning resources spanning textbooks, exercise books, and stationery supplies. Each resource must be matched to specific grade levels and subjects, tracked through pricing and inventory records, and attributed to publishing organizations. The following reference describes the data structures that support this cataloging workflow, showing how individual items connect to academic contexts and how joined views consolidate those connections for operational queries.

**Table `textbooks`**

| id | isbn | title | publisher | edition | price | subject | grade_level | part_identifier | grade_level_id | publisher_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2618568 | Compact Initiative | pilot-publishe-50 | baseline-edition-91 | 12.87 | adaptive-subject-83 | 29 | PAR-2423 | 1 | 1000 |
| 1001 | 4277024 | Legacy Model | extended-publishe-51 | pilot-edition-92 | 35.45 | distributed-subject-84 | 33 | PAR-2427 | 2 | 1001 |
| 1002 | 1208-0004-M | Regional Cluster A | integrated-publishe-52 | extended-edition-93 | 29.24 | baseline-subject-85 | 37 | PAR-2431 | 3 | 1002 |
| 1003 | 3717612 | Seasonal Review | seasonal-publishe-53 | integrated-edition-94 | 29.99 | pilot-subject-86 | 41 | PAR-2435 | 4 | 1003 |

Textbooks form the primary instructional resource in the catalog. Each record carries a unique identifier, an ISBN, a title, and a publisher reference. The edition field distinguishes between baseline, pilot, extended, and integrated versions of the same work. Pricing is recorded as a decimal value, ranging from 12.87 for the Compact Initiative textbook to 35.45 for the Legacy Model. The subject and grade_level columns store direct categorical references, while the part_identifier provides a secondary grouping code such as PAR-2423. The foreign keys grade_level_id and publisher_id link the textbook to its academic context and its publishing organization respectively.

**Table `exercise_books`**

| exercise_book_id | code | description | size | line_type | unit_price | required_quantity | subject | is_compulsory | grade_level_id | subject_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | lu_tax_code_template_m_I_4 | Extended Survey | adaptive-size-83 | pilot-line-38 | 5,692 | 9 | adaptive-subject-83 | false | 1 | 1 |
| 101 | 2986219 | Pilot Corridor A | distributed-size-84 | extended-line-39 | 45,650 | 2 | distributed-subject-84 | true | 2 | 2 |
| 102 | 8928520 | Baseline Series | baseline-size-85 | integrated-line-40 | 2,705 | 4 | baseline-subject-85 | false | 3 | 3 |
| 103 | 195369 | Distributed Assessment | pilot-size-86 | seasonal-line-41 | 211.07 | 5 | pilot-subject-86 | true | 4 | 4 |

Exercise books serve as supplementary practice materials. Each entry includes a code, a description, and a size classification such as adaptive-size-83 or distributed-size-84. The line_type field captures the format variant—pilot-line-38, extended-line-39, integrated-line-40, or seasonal-line-41. Unit prices are recorded as integer values with comma separators, ranging from 211.07 for the Distributed Assessment to 45,650 for the Pilot Corridor A. The required_quantity field indicates how many copies are needed per student, with values of 2 through 9 across the sample. The is_compulsory flag marks whether the exercise book is mandatory, and the subject and grade_level_id columns anchor the item to its academic context.

**Table `stationery_items`**

| code | description | unit_price | required_quantity | is_compulsory | color | grade_level_id | subject_id |
|---|---|---|---|---|---|---|---|
| lu_tax_code_template_m_I_4 | Extended Survey | 5,692 | 9 | false | Green | 1 | 1 |
| 2986219 | Pilot Corridor A | 45,650 | 2 | true | Brown | 2 | 2 |
| 8928520 | Baseline Series | 2,705 | 4 | false | Brown | 3 | 3 |
| 195369 | Distributed Assessment | 211.07 | 5 | true | Pink | 4 | 4 |

Stationery items represent consumable supplies required for classroom activities. Each record includes a code, a description, a unit price, and a required quantity that mirrors the exercise book quantities. The is_compulsory flag and the color field add procurement detail—Green, Brown, and Pink appear in the sample data. Like exercise books, stationery items are linked to a grade_level_id and a subject_id, ensuring that supply lists are generated per academic context.

**Table `grade_levels`**

| id | grade_number | academic_year | school_name |
|---|---|---|---|
| 1 | 29 | 42 | Seasonal Standard |
| 2 | 33 | 51 | Integrated Framework |
| 3 | 37 | 60 | Extended Protocol D |
| 4 | 41 | 69 | Pilot Programme |

Grade levels provide the academic framework for all resource assignments. Each record contains a grade_number, an academic_year, and a school_name. The sample data includes four grade levels: grade 29 at Seasonal Standard in academic year 42, grade 33 at Integrated Framework in year 51, grade 37 at Extended Protocol D in year 60, and grade 41 at Pilot Programme in year 69. These identifiers serve as the primary join key across all resource tables.

**Table `subjects`**

| id | name | language_code | textbook_id | exercise_book_id |
|---|---|---|---|---|
| 1 | Extended Review | 20723567 | 1000 | 100 |
| 2 | Pilot Initiative A | 32825 | 1001 | 101 |
| 3 | Baseline Model | b_VB-EC-15 | 1002 | 102 |
| 4 | Distributed Cluster | 974927 | 1003 | 103 |

Subjects define the academic disciplines to which resources are assigned. Each subject record carries a name, a language_code, and references to a textbook_id and an exercise_book_id. The sample subjects include Extended Review, Pilot Initiative A, Baseline Model, and Distributed Cluster. The language_code values range from simple integers like 32825 to formatted codes such as b_VB-EC-15. By linking a subject to both a textbook and an exercise book, the catalog ensures that every discipline has a complete instructional pair.

**Table `publishers`**

| publisher_id | name | created_at | updated_at |
|---|---|---|---|
| 1000 | Extended Review | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | Pilot Initiative A | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | Baseline Model | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | Distributed Cluster | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Publishers are the organizations responsible for producing textbooks. Each publisher record includes a name, a created_at timestamp, and an updated_at timestamp. The sample publishers—Extended Review, Pilot Initiative A, Baseline Model, and Distributed Cluster—were created between January and April 2025, with update dates approximately one week after creation. The publisher_id serves as the foreign key referenced by textbooks.

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

The levels_textbooks table establishes the explicit mapping between grade levels and textbooks. This junction table resolves the relationship so that any textbook can be assigned to multiple grade levels and any grade level can receive multiple textbooks. The sample data shows textbook 1000 assigned to grade level 1, textbook 1001 to grade level 2, and so on through textbook 1003 at grade level 4.

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

The levels_books table performs the same junction function for exercise books. It links each exercise book to its designated grade level. In the sample, exercise book 100 maps to grade level 1, exercise book 101 to grade level 2, exercise book 102 to grade level 3, and exercise book 103 to grade level 4. This table ensures that practice materials are correctly distributed across the academic calendar.

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

The levels_items table connects stationery items to grade levels. Each entry records which consumable supplies are required for a given grade. The sample data follows the same sequential pattern: the Extended Survey item at grade level 1, the Pilot Corridor A item at grade level 2, the Baseline Series item at grade level 3, and the Distributed Assessment item at grade level 4.

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

The publishers_textbooks table formalizes the relationship between publishers and the textbooks they produce. This junction table allows a single publisher to be associated with multiple textbooks and supports the tracking of publishing contracts. The sample data links publisher 1000 to textbook 1000, publisher 1001 to textbook 1001, publisher 1002 to textbook 1002, and publisher 1003 to textbook 1003, establishing a one-to-one mapping in this dataset.

The following views consolidate these base tables into queryable formats that answer specific operational questions.

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

The textbook_grade_level_view joins textbooks with their assigned grade levels, answering the question of which textbooks are available at each grade. A representative row shows the Compact Initiative textbook (ISBN 2618568, priced at 12.87) assigned to grade level 1 at Seasonal Standard. Another row pairs the Legacy Model (ISBN 4277024, priced at 35.45) with grade level 2 at Integrated Framework. This view enables procurement officers to verify textbook availability per grade.

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

The textbook_publisher_view links textbooks to their publishing organizations, answering which publisher produced each textbook. The Compact Initiative textbook is published by Extended Review (publisher 1000), while the Legacy Model comes from Pilot Initiative A (publisher 1001). The Regional Cluster A textbook is produced by Baseline Model (publisher 1002), and the Seasonal Review textbook by Distributed Cluster (publisher 1003). This view supports contract management and publisher performance analysis.

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

The exercise_book_grade_level_view connects exercise books to their grade levels, answering which practice materials each grade requires. The Extended Survey exercise book (code lu_tax_code_template_m_I_4, priced at 5,692, requiring 9 copies) is assigned to grade level 1. The Pilot Corridor A book (code 2986219, priced at 45,650, requiring 2 copies) is assigned to grade level 2. This view supports supply chain planning for practice materials.

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

The exercise_book_subject_view joins exercise books with their academic subjects, answering which discipline each practice book supports. The Extended Survey exercise book is linked to the Extended Review subject, while the Pilot Corridor A book supports Pilot Initiative A. The Baseline Series exercise book serves the Baseline Model subject, and the Distributed Assessment book supports Distributed Cluster. This view ensures that exercise books are correctly matched to their curricular contexts.

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

The stationery_item_grade_level_view maps stationery supplies to grade levels, answering which consumables each grade needs. The Extended Survey item (Green, priced at 5,692, requiring 9 units) is assigned to grade level 1. The Pilot Corridor A item (Brown, priced at 45,650, requiring 2 units) is assigned to grade level 2. This view enables accurate budgeting for consumable supplies per grade.

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

The stationery_item_subject_view connects stationery items to their academic subjects, answering which discipline each supply supports. The Extended Survey item serves the Extended Review subject, the Pilot Corridor A item serves Pilot Initiative A, the Baseline Series item serves Baseline Model, and the Distributed Assessment item serves Distributed Cluster. This view ensures that supply orders are discipline-aware.

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

The grade_level_textbook_detail_view provides a comprehensive view of textbooks at each grade level, combining textbook metadata with grade level information. A sample row shows grade level 1 (Seasonal Standard, grade number 29, academic year 42) receiving the Compact Initiative textbook (ISBN 2618568, baseline-edition-91, priced at 12.87, subject adaptive-subject-83). Another row shows grade level 2 (Integrated Framework, grade number 33, academic year 51) receiving the Legacy Model textbook (ISBN 4277024, pilot-edition-92, priced at 35.45, subject distributed-subject-84). This detail view is the primary reference for annual textbook procurement.

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

The grade_level_exercise_book_detail_view combines exercise book data with grade level information, answering which practice books each grade requires. Grade level 1 (Seasonal Standard) receives the Extended Survey exercise book (code lu_tax_code_template_m_I_4, adaptive-size-83, pilot-line-38, priced at 5,692, requiring 9 copies, non-compulsory). Grade level 2 (Integrated Framework) receives the Pilot Corridor A book (code 2986219, distributed-size-84, extended-line-39, priced at 45,650, requiring 2 copies, compulsory). This view supports exercise book distribution planning.

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

The grade_level_stationery_item_detail_view merges stationery item records with grade level data, answering which supplies each grade needs. Grade level 1 (Seasonal Standard) requires the Extended Survey item (Green, priced at 5,692, quantity 9, non-compulsory). Grade level 2 (Integrated Framework) requires the Pilot Corridor A item (Brown, priced at 45,650, quantity 2, compulsory). This view is essential for generating grade-specific supply lists.

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

The subject_textbook_view joins subjects with their associated textbooks, answering which textbook supports each academic discipline. The Extended Review subject is paired with the Compact Initiative textbook (ISBN 2618568, baseline-edition-91, priced at 12.87). The Pilot Initiative A subject is paired with the Legacy Model textbook (ISBN 4277024, pilot-edition-92, priced at 35.45). The Baseline Model subject corresponds to the Regional Cluster A textbook (ISBN 1208-0004-M, extended-edition-93, priced at 29.24). The Distributed Cluster subject maps to the Seasonal Review textbook (ISBN 3717612, integrated-edition-94, priced at 29.99). This view validates that every subject has a designated primary textbook.

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

The subject_exercise_book_view links subjects to their exercise books, answering which practice material accompanies each discipline. The Extended Review subject uses the Extended Survey exercise book (code lu_tax_code_template_m_I_4, adaptive-size-83, priced at 5,692). The Pilot Initiative A subject uses the Pilot Corridor A book (code 2986219, distributed-size-84, priced at 45,650). The Baseline Model subject uses the Baseline Series book (code 8928520, baseline-size-85, priced at 2,705). The Distributed Cluster subject uses the Distributed Assessment book (code 195369, pilot-size-86, priced at 211.07). This view ensures complete subject-resource pairing.

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

The publisher_textbook_detail_view combines publisher information with textbook records, answering which textbooks each organization produces. Extended Review (publisher 1000, created 2025-01-01) publishes the Compact Initiative textbook (ISBN 2618568, baseline-edition-91, priced at 12.87, adaptive-subject-83, grade level 29). Pilot Initiative A (publisher 1001, created 2025-02-06) publishes the Legacy Model textbook (ISBN 4277024, pilot-edition-92, priced at 35.45, distributed-subject-84, grade level 33). Baseline Model (publisher 1002, created 2025-03-11) publishes the Regional Cluster A textbook (ISBN 1208-0004-M, extended-edition-93, priced at 29.24, baseline-subject-85, grade level 37). Distributed Cluster (publisher 1003, created 2025-04-16) publishes the Seasonal Review textbook (ISBN 3717612, integrated-edition-94, priced at 29.99, pilot-subject-86, grade level 41). This view supports publisher performance tracking and contract management.

The catalog structure described above provides a complete framework for managing educational materials across an institution. Base tables store the canonical records for textbooks, exercise books, stationery items, grade levels, subjects, and publishers. Junction tables—levels_textbooks, levels_books, levels_items, and publishers_textbooks—establish the many-to-many relationships that allow resources to be flexibly assigned to academic contexts. The twelve views then present these relationships in purpose-built formats, each answering a specific operational question about resource availability, subject alignment, or publisher attribution. Together, these structures support procurement planning, supply distribution, and academic resource auditing across all grade levels and subjects.