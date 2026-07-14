## Domain Modelling and Relational Materialisation

The domain under examination concerns the administration of educational programmes, the management of chapter-level organisations, and the assignment of educators to both. At its core, the schema captures a tripartite relationship between people (educators), local groups (chapters), and structured initiatives (programs), with an additional dimension of professional specialisation. The relational model normalises these concepts into seven base tables and seven materialised views, each serving a distinct analytical purpose. The design follows a star-like pattern where the three core entities—`educators`, `chapters`, and `programs`—are linked through three many-to-many junction tables, while `specializations` provides a lookup dimension. This chapter walks through the entity types, their attributes, the cardinality-bounded relationships that become foreign keys and junction tables, and finally how each view reconstructs a domain fact from the normalised tables.

### Core Entity Tables

The foundation of the schema consists of four entity tables, each representing a distinct concept in the educational administration domain.

**Table `educators`**

| id | educator_id | first_name | last_name | years_of_experience | specialization | membership_status | chapter_id | program_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 8387540 | Stephanie Collins | Paul Allen | 7 | legacy-speciali-13 | active | 1000 | 1 |
| 2 | 575219 | Janice Johnston | Heather Beasley | 10 | compact-speciali-14 | inactive | 1001 | 2 |
| 3 | 3001009030060 | Upal Saha | Audrey Taylor | 13 | composite-speciali-15 | probationary | 1002 | 3 |
| 4 | 195358 | Katherine Snyder | Susan Wagner | 16 | primary-speciali-16 | active | 1003 | 4 |

The `educators` table stores the canonical roster of teaching professionals. Each row is identified by a surrogate `id` (an auto-incrementing integer) and a business-level `educator_id` (a large integer such as `8387540` or `3001009030060`). The name fields `first_name` and `last_name` hold values like `Stephanie Collins` and `Audrey Taylor`. The attribute `years_of_experience` is an integer ranging from `7` to `16` across the sample, while `specialization` stores a short code such as `legacy-speciali-13` or `composite-speciali-15`. The `membership_status` column is a categorical field with values `active`, `inactive`, and `probationary`. Notably, the `educators` table also carries `chapter_id` and `program_id` columns, which act as denormalised pointers to the educator's primary chapter and program assignments. In the sample data, educator `8387540` (Stephanie Collins) is associated with `chapter_id` `1000` and `program_id` `1`, while educator `3001009030060` (Upal Saha) links to `chapter_id` `1002` and `program_id` `3`. These columns provide a convenient single-table lookup for the primary assignment but do not replace the junction tables that capture the full many-to-many relationships.

**Table `chapters`**

| id | chapter_id | chapter_name | location | founding_date | current_members | program_id |
|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_b_VB-EC-Tab | Legacy Cluster D | extended-location-99 | 2023-06-24 | 29 | 1 |
| 1001 | 8350033 | Regional Review | integrated-location-100 | 2024-11-08 | 35 | 2 |
| 1002 | 325441 | Seasonal Initiative | seasonal-location-101 | 2025-04-19 | 41 | 3 |
| 1003 | 2839520 | Integrated Model A | regional-location-102 | 2022-09-03 | 47 | 4 |

The `chapters` table models local chapter organisations. Each chapter has a surrogate `id`, a business `chapter_id` (e.g. `lu_tax_code_template_b_VB-EC-Tab` or `8350033`), a human-readable `chapter_name` such as `Legacy Cluster D` or `Seasonal Initiative`, and a `location` field with values like `extended-location-99` and `seasonal-location-101`. The `founding_date` is stored as a date (e.g. `2023-06-24`), and `current_members` is an integer counting active members, ranging from `29` to `47` in the sample. The `program_id` column on `chapters` creates a direct foreign-key link from a chapter to its parent programme, establishing that chapter `1000` (Legacy Cluster D) belongs to programme `1` (Legacy Review D), while chapter `1003` (Integrated Model A) belongs to programme `4` (Integrated Cluster A).

**Table `programs`**

| id | program_id | program_title | duration | status | target_audience | chapter_id |
|---|---|---|---|---|---|---|
| 1 | 103176 | Legacy Review D | 4.20 | planned | student teachers | 1000 |
| 2 | 2986219 | Regional Initiative | 8.40 | ongoing | teaching interns | 1001 |
| 3 | 1186079 | Seasonal Model | 12.60 | completed | first year teachers | 1002 |
| 4 | 1562855 | Integrated Cluster A | 16.80 | cancelled | second year teachers | 1003 |

The `programs` table captures structured educational initiatives. Each programme has a surrogate `id`, a business `program_id` (e.g. `103176` or `1562855`), a `program_title` such as `Legacy Review D` or `Integrated Cluster A`, a `duration` stored as a decimal (ranging from `4.20` to `16.80`), a `status` enum with values `planned`, `ongoing`, `completed`, and `cancelled`, and a `target_audience` field with values like `student teachers`, `teaching interns`, `first year teachers`, and `second year teachers`. The `chapter_id` column on `programs` creates the reverse foreign-key link from programme to chapter, meaning programme `103176` (Legacy Review D) is anchored to chapter `1000`, and programme `1562855` (Integrated Cluster A) to chapter `1003`. This bidirectional chapter–programme linkage allows queries to traverse from either side.

**Table `specializations`**

| specialization_id | specialization_name | description |
|---|---|---|
| 1000 | Seasonal Initiative | Extended Survey |
| 1001 | Integrated Model | Pilot Corridor A |
| 1002 | Extended Cluster D | Baseline Series |
| 1003 | Pilot Review | Distributed Assessment |

The `specializations` table is a lookup dimension providing detailed descriptions for professional specialisations. It has a `specialization_id` (integer, e.g. `1000` to `1003`), a `specialization_name` (e.g. `Seasonal Initiative`, `Integrated Model`), and a `description` field (e.g. `Extended Survey`, `Pilot Corridor A`). The `educators` table references this dimension via its `specialization` column, which stores short codes like `legacy-speciali-13` rather than the full `specialization_id`. In the sample data, the specialization lookup itself contains four entries, each with a distinct name and description pair, forming a small but structured reference table.

### Many-to-Many Junction Tables

The relationships between educators and chapters, educators and programs, and educators and specializations are all many-to-many in nature. These relationships are materialised through three junction tables, each containing exactly two foreign-key columns.

**Table `chapters_educators`**

| chapter_id | educator_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `chapters_educators` junction table links educators to chapters. It has two columns: `chapter_id` and `educator_id`. In the sample data, educator `1` (Stephanie Collins) is assigned to chapters `1000` and `1003`, while educator `2` (Janice Johnston) is assigned to chapters `1000` and `1001`. This means that a single educator can belong to multiple chapters, and a single chapter can have multiple educators. The table contains eight rows, forming a bipartite graph between the four educators and the four chapters.

**Table `programs_educators`**

| program_id | educator_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `programs_educators` junction table links educators to programs. It has two columns: `program_id` and `educator_id`. Educator `1` is assigned to programs `1` and `4`, educator `2` to programs `1` and `2`, educator `3` to programs `2` and `3`, and educator `4` to programs `3` and `4`. The eight rows mirror the structure of `chapters_educators`, creating a parallel bipartite graph between educators and programs.

**Table `specializations_educators`**

| specialization_id | educator_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `specializations_educators` junction table links educators to specializations. While the sample data for this table is not displayed in the reference excerpt, its structure follows the same pattern: two foreign-key columns, `specialization_id` and `educator_id`, forming a many-to-many relationship between the specialization dimension and the educator entity.

### Materialised Views

The seven views materialise common analytical queries by joining the base tables. Each view answers a specific domain question and presents the result as a flat, denormalised table.

**View `v_educator_chapter`**

```sql
CREATE VIEW v_educator_chapter AS
SELECT a.id, a.educator_id, a.first_name, a.last_name, b.id AS chapter_id, b.chapter_id AS chapter_chapter_id, b.chapter_name AS chapter_chapter_name
FROM educators a JOIN chapters b ON a.chapter_id = b.id;
```

| id | educator_id | first_name | last_name | chapter_id | chapter_chapter_id | chapter_chapter_name |
|---|---|---|---|---|---|---|
| 1 | 8387540 | Stephanie Collins | Paul Allen | 1000 | lu_tax_code_template_b_VB-EC-Tab | Legacy Cluster D |
| 2 | 575219 | Janice Johnston | Heather Beasley | 1001 | 8350033 | Regional Review |
| 3 | 3001009030060 | Upal Saha | Audrey Taylor | 1002 | 325441 | Seasonal Initiative |
| 4 | 195358 | Katherine Snyder | Susan Wagner | 1003 | 2839520 | Integrated Model A |

The view `v_educator_chapter` answers the question: "Which educators are assigned to which chapters?" It joins `educators` with `chapters_educators` and `chapters`, producing a flat table where each row represents an educator–chapter assignment. A row from this view might show educator `8387540` (Stephanie Collins, `active` status, `7` years of experience) assigned to chapter `1000` (Legacy Cluster D, located at `extended-location-99`, founded `2023-06-24`, with `29` current members). Another row could show educator `3001009030060` (Upal Saha, `probationary`, `13` years) assigned to chapter `1002` (Seasonal Initiative, `seasonal-location-101`, `41` members). This view is the primary tool for roster management and chapter staffing analysis.

**View `v_educator_program`**

```sql
CREATE VIEW v_educator_program AS
SELECT a.id, a.educator_id, a.first_name, a.last_name, b.id AS program_id, b.program_id AS program_program_id, b.program_title AS program_program_title
FROM educators a JOIN programs b ON a.program_id = b.id;
```

| id | educator_id | first_name | last_name | program_id | program_program_id | program_program_title |
|---|---|---|---|---|---|---|
| 1 | 8387540 | Stephanie Collins | Paul Allen | 1 | 103176 | Legacy Review D |
| 2 | 575219 | Janice Johnston | Heather Beasley | 2 | 2986219 | Regional Initiative |
| 3 | 3001009030060 | Upal Saha | Audrey Taylor | 3 | 1186079 | Seasonal Model |
| 4 | 195358 | Katherine Snyder | Susan Wagner | 4 | 1562855 | Integrated Cluster A |

The view `v_educator_program` answers: "Which educators are assigned to which programs?" It joins `educators` with `programs_educators` and `programs`. A representative row might pair educator `575219` (Janice Johnston, `inactive`, `10` years of experience, `compact-speciali-14`) with program `2986219` (Regional Initiative, duration `8.40`, status `ongoing`, targeting `teaching interns`). Another row could link educator `195358` (Katherine Snyder, `active`, `16` years, `primary-speciali-16`) with program `1562855` (Integrated Cluster A, duration `16.80`, status `cancelled`, targeting `second year teachers`). This view supports programme staffing and resource allocation analysis.

**View `v_chapter_program`**

```sql
CREATE VIEW v_chapter_program AS
SELECT a.id, a.chapter_id, a.chapter_name, a.location, b.id AS program_id, b.program_id AS program_program_id, b.program_title AS program_program_title
FROM chapters a JOIN programs b ON a.program_id = b.id;
```

| id | chapter_id | chapter_name | location | program_id | program_program_id | program_program_title |
|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_b_VB-EC-Tab | Legacy Cluster D | extended-location-99 | 1 | 103176 | Legacy Review D |
| 1001 | 8350033 | Regional Review | integrated-location-100 | 2 | 2986219 | Regional Initiative |
| 1002 | 325441 | Seasonal Initiative | seasonal-location-101 | 3 | 1186079 | Seasonal Model |
| 1003 | 2839520 | Integrated Model A | regional-location-102 | 4 | 1562855 | Integrated Cluster A |

The view `v_chapter_program` answers: "Which chapters are associated with which programs?" It joins `chapters` with `programs` through their mutual `program_id` and `chapter_id` foreign-key columns. A row from this view might show chapter `lu_tax_code_template_b_VB-EC-Tab` (Legacy Cluster D, `extended-location-99`, `29` members) linked to program `103176` (Legacy Review D, duration `4.20`, status `planned`, `student teachers`). Another row could pair chapter `325441` (Seasonal Initiative, `seasonal-location-101`, `41` members) with program `1186079` (Seasonal Model, duration `12.60`, status `completed`, `first year teachers`). This view is useful for understanding the chapter–programme mapping and for capacity planning.

**View `v_chapter_educator_detail`**

```sql
CREATE VIEW v_chapter_educator_detail AS
SELECT a.id, a.chapter_id, a.chapter_name, b.id AS educator_id, b.educator_id AS educator_educator_id, b.first_name AS educator_first_name
FROM chapters a
  JOIN chapters_educators j ON j.chapter_id = a.id
  JOIN educators b ON b.id = j.educator_id;
```

| id | chapter_id | chapter_name | educator_id | educator_educator_id | educator_first_name |
|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_b_VB-EC-Tab | Legacy Cluster D | 1 | 8387540 | Stephanie Collins |
| 1000 | lu_tax_code_template_b_VB-EC-Tab | Legacy Cluster D | 2 | 575219 | Janice Johnston |
| 1001 | 8350033 | Regional Review | 2 | 575219 | Janice Johnston |
| 1001 | 8350033 | Regional Review | 3 | 3001009030060 | Upal Saha |
| 1002 | 325441 | Seasonal Initiative | 3 | 3001009030060 | Upal Saha |
| 1002 | 325441 | Seasonal Initiative | 4 | 195358 | Katherine Snyder |
| 1003 | 2839520 | Integrated Model A | 4 | 195358 | Katherine Snyder |
| 1003 | 2839520 | Integrated Model A | 1 | 8387540 | Stephanie Collins |

The view `v_chapter_educator_detail` answers: "What is the detailed profile of each educator within their chapter context?" It joins `chapters`, `chapters_educators`, and `educators`, producing a rich row per assignment. A sample row might show chapter `2839520` (Integrated Model A, `regional-location-102`, founded `2022-09-03`, `47` members) with educator `195358` (Katherine Snyder, `active`, `16` years of experience, `primary-speciali-16`). Another row could pair chapter `325441` (Seasonal Initiative, `seasonal-location-101`, `41` members) with educator `3001009030060` (Upal Saha, `probationary`, `13` years, `composite-speciali-15`). This view is ideal for chapter-level reporting on educator experience and status distribution.

**View `v_program_chapter`**

```sql
CREATE VIEW v_program_chapter AS
SELECT a.id, a.program_id, a.program_title, a.duration, b.id AS chapter_id, b.chapter_id AS chapter_chapter_id, b.chapter_name AS chapter_chapter_name
FROM programs a JOIN chapters b ON a.chapter_id = b.id;
```

| id | program_id | program_title | duration | chapter_id | chapter_chapter_id | chapter_chapter_name |
|---|---|---|---|---|---|---|
| 1 | 103176 | Legacy Review D | 4.20 | 1000 | lu_tax_code_template_b_VB-EC-Tab | Legacy Cluster D |
| 2 | 2986219 | Regional Initiative | 8.40 | 1001 | 8350033 | Regional Review |
| 3 | 1186079 | Seasonal Model | 12.60 | 1002 | 325441 | Seasonal Initiative |
| 4 | 1562855 | Integrated Cluster A | 16.80 | 1003 | 2839520 | Integrated Model A |

The view `v_program_chapter` answers: "What is the detailed profile of each chapter within its program context?" It joins `programs`, `chapters`, and the relevant foreign-key columns. A row from this view might show program `103176` (Legacy Review D, duration `4.20`, status `planned`, `student teachers`) linked to chapter `lu_tax_code_template_b_VB-EC-Tab` (Legacy Cluster D, `extended-location-99`, `29` members, founded `2023-06-24`). Another row could pair program `1562855` (Integrated Cluster A, duration `16.80`, status `cancelled`, `second year teachers`) with chapter `2839520` (Integrated Model A, `regional-location-102`, `47` members, founded `2022-09-03`). This view supports programme-level analysis of chapter composition and maturity.

**View `v_program_educator_detail`**

```sql
CREATE VIEW v_program_educator_detail AS
SELECT a.id, a.program_id, a.program_title, b.id AS educator_id, b.educator_id AS educator_educator_id, b.first_name AS educator_first_name
FROM programs a
  JOIN programs_educators j ON j.program_id = a.id
  JOIN educators b ON b.id = j.educator_id;
```

| id | program_id | program_title | educator_id | educator_educator_id | educator_first_name |
|---|---|---|---|---|---|
| 1 | 103176 | Legacy Review D | 1 | 8387540 | Stephanie Collins |
| 1 | 103176 | Legacy Review D | 2 | 575219 | Janice Johnston |
| 2 | 2986219 | Regional Initiative | 2 | 575219 | Janice Johnston |
| 2 | 2986219 | Regional Initiative | 3 | 3001009030060 | Upal Saha |
| 3 | 1186079 | Seasonal Model | 3 | 3001009030060 | Upal Saha |
| 3 | 1186079 | Seasonal Model | 4 | 195358 | Katherine Snyder |
| 4 | 1562855 | Integrated Cluster A | 4 | 195358 | Katherine Snyder |
| 4 | 1562855 | Integrated Cluster A | 1 | 8387540 | Stephanie Collins |

The view `v_program_educator_detail` answers: "What is the detailed profile of each educator within their program context?" It joins `programs`, `programs_educators`, and `educators`. A representative row might show program `2986219` (Regional Initiative, duration `8.40`, status `ongoing`, `teaching interns`) with educator `575219` (Janice Johnston, `inactive`, `10` years of experience, `compact-speciali-14`). Another row could pair program `1186079` (Seasonal Model, duration `12.60`, status `completed`, `first year teachers`) with educator `3001009030060` (Upal Saha, `probationary`, `13` years, `composite-speciali-15`). This view is valuable for programme-level educator analytics, including experience distribution and status tracking.

**View `v_specialization_educator_detail`**

```sql
CREATE VIEW v_specialization_educator_detail AS
SELECT a.specialization_id, a.specialization_name, a.description, b.id AS educator_id, b.educator_id AS educator_educator_id, b.first_name AS educator_first_name
FROM specializations a
  JOIN specializations_educators j ON j.specialization_id = a.specialization_id
  JOIN educators b ON b.id = j.educator_id;
```

| specialization_id | specialization_name | description | educator_id | educator_educator_id | educator_first_name |
|---|---|---|---|---|---|
| 1000 | Seasonal Initiative | Extended Survey | 1 | 8387540 | Stephanie Collins |
| 1000 | Seasonal Initiative | Extended Survey | 2 | 575219 | Janice Johnston |
| 1001 | Integrated Model | Pilot Corridor A | 2 | 575219 | Janice Johnston |
| 1001 | Integrated Model | Pilot Corridor A | 3 | 3001009030060 | Upal Saha |
| 1002 | Extended Cluster D | Baseline Series | 3 | 3001009030060 | Upal Saha |
| 1002 | Extended Cluster D | Baseline Series | 4 | 195358 | Katherine Snyder |
| 1003 | Pilot Review | Distributed Assessment | 4 | 195358 | Katherine Snyder |
| 1003 | Pilot Review | Distributed Assessment | 1 | 8387540 | Stephanie Collins |

The view `v_specialization_educator_detail` answers: "What is the detailed profile of each educator within their specialization context?" It joins `specializations`, `specializations_educators`, and `educators`. A sample row might show specialization `1000` (Seasonal Initiative, description `Extended Survey`) with educator `8387540` (Stephanie Collins, `active`, `7` years of experience). Another row could pair specialization `1003` (Pilot Review, description `Distributed Assessment`) with educator `195358` (Katherine Snyder, `active`, `16` years, `primary-speciali-16`). This view supports workforce planning by revealing the distribution of educator experience and membership status across specialisation categories.

### Synthesis

The schema models the educational administration domain through a clean separation of concerns: four entity tables capture the core concepts, three junction tables materialise the many-to-many relationships, and seven views provide denormalised lenses for common analytical queries. The foreign-key relationships form a connected graph—`educators` links to `chapters` and `programs` through their respective junction tables, while `chapters` and `programs` are also directly linked through their mutual `chapter_id` and `program_id` columns. The `specializations` table serves as a lookup dimension, enriching the educator entity with professional context. Each view reconstructs a domain fact by joining the appropriate subset of base tables, trading storage for query convenience. The design supports both operational queries (e.g., "list all educators in chapter 1000") and analytical queries (e.g., "what is the average experience of educators in ongoing programs") without requiring ad-hoc joins at query time.