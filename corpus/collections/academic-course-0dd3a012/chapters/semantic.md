## The Educational Materials Domain as a Normalized Relational Schema

The educational materials domain captures the administrative lifecycle of course offerings, classroom assignments, student enrollments, and the procurement of instructional resources. At its core, the model separates concerns into five base entities—courses, classrooms, students, orders, and materials—then stitches them together through five junction tables that resolve many-to-many associations. The result is a fully normalized schema where every fact is stored once and reconstructed through joins in a set of ten analytical views. This chapter walks through the entity types, their attributes, the foreign-key scaffolding that binds them, and the view-level joins that answer concrete domain questions.

**Table `academic_courses`**

| course_code | course_name | grade_level | is_mother_tongue | is_compulsory | class_code |
|---|---|---|---|---|---|
| MATHS | Legacy Protocol D | 29 | false | false | level-3 |
| CHINESE | Regional Programme | 33 | true | true | state_uk_27 |
| MALAY | Seasonal Standard | 37 | false | false | lu_tax_code_template_m17 |
| TAMIL | Integrated Framework A | 41 | true | true | 8189504 |

The `academic_courses` table anchors the curriculum layer. Each row represents a course identified by `course_code` (a surrogate key such as `MATHS`, `CHINESE`, `MALAY`, or `TAMIL`) and described by `course_name` (e.g. "Legacy Protocol D" or "Regional Programme"). The boolean flags `is_mother_tongue` and `is_compulsory` encode policy constraints—`CHINESE` and `TAMIL` are both mother-tongue and compulsory in the sample data—while `grade_level` (values like 29, 33, 37, 41) and `class_code` (a foreign key pointing to `student_classes.class_code`) tie the course to a specific classroom cohort. The `class_code` column is the first explicit bridge between the curriculum and the organizational structure of schools.

**Table `student_classes`**

| class_code | grade_level | academic_year | school_name |
|---|---|---|---|
| level-3 | 29 | 42 | Seasonal Standard |
| state_uk_27 | 33 | 51 | Integrated Framework |
| lu_tax_code_template_m17 | 37 | 60 | Extended Protocol D |
| 8189504 | 41 | 69 | Pilot Programme |

`student_classes` defines the classroom entity. Its primary key `class_code` (values such as `level-3`, `state_uk_27`, `lu_tax_code_template_m17`, `8189504`) is referenced by `academic_courses.class_code`, `students.class_code`, and the junction tables `classes_students` and `classes_materials`. The columns `grade_level`, `academic_year`, and `school_name` (e.g. "Seasonal Standard", "Integrated Framework") provide the contextual metadata for each cohort. The table is deliberately minimal: it exists to give every course and every student a stable classroom anchor.

**Table `students`**

| id | student_name | contact_number | class_code | order_status | belongs_from_class_class_code |
|---|---|---|---|---|---|
| 1 | Distributed Standard | Peter Mcdowell | level-3 | PENDING | level-3 |
| 2 | Adaptive Framework D | Sophia Meyer | state_uk_27 | ORDERED | state_uk_27 |
| 3 | Primary Protocol | Carol Gaines | lu_tax_code_template_m17 | COLLECTED | lu_tax_code_template_m17 |
| 4 | Composite Programme | April Snyder | 8189504 | CANCELLED | 8189504 |

The `students` table models individual learners. Its primary key `id` (1 through 4 in the sample) identifies each student, while `student_name` (e.g. "Peter Mcdowell", "Sophia Meyer") and `contact_number` carry personal details. The column `class_code` is a foreign key into `student_classes.class_code`, establishing which classroom a student belongs to. The column `belongs_from_class_class_code` is a self-referencing foreign key back to `student_classes.class_code`, capturing the origin classroom from which a student was assigned—this allows tracking of transfers or reassignments. The `order_status` column (values `PENDING`, `ORDERED`, `COLLECTED`, `CANCELLED`) reflects the current procurement state of the student's material order.

**Table `student_orders`**

| student_order_id | order_date | total_amount | section_a | section_b | section_c | collection_status | student_id |
|---|---|---|---|---|---|---|---|
| 1 | 2023-02-27T13:15:00 | 112.11 | 18.45 | 21.70 | 21.70 | SCHEDULED | 1 |
| 2 | 2024-07-11T20:32:00 | 1,979 | 20.90 | 24.40 | 24.40 | PENDING | 2 |
| 3 | 2025-12-22T03:49:00 | 15,418 | 23.35 | 27.10 | 27.10 | COMPLETED | 3 |
| 4 | 2022-05-06T10:06:00 | 12,579 | 25.80 | 29.80 | 29.80 | FAILED | 4 |

`student_orders` records the procurement event for each student. Its primary key `student_order_id` (1 through 4) links to `students.id` via the foreign key `student_id`. The columns `order_date` (ISO 8601 timestamps like `2023-02-27T13:15:00`), `total_amount` (e.g. `112.11`, `1,979`, `15,418`), and the breakdown columns `section_a`, `section_b`, `section_c` capture the financial composition of the order. The `collection_status` column (values `SCHEDULED`, `PENDING`, `COMPLETED`, `FAILED`) tracks fulfillment. This table is the financial nucleus of the domain: every material purchase flows through an order row.

**Table `educational_materials`**

| material_code | title | publisher | unit_price | category | is_optional | required_quantity | course_code | student_order_id |
|---|---|---|---|---|---|---|---|---|
| 506000 | Compact Initiative | pilot-publishe-50 | 5,692 | TEXTBOOK | true | 9 | MATHS | 1 |
| artemyarulin | Legacy Model | extended-publishe-51 | 45,650 | WORKBOOK | false | 2 | CHINESE | 2 |
| 3158145 | Regional Cluster A | integrated-publishe-52 | 2,705 | EXERCISE_BOOK | true | 4 | MALAY | 3 |
| 10445634 | Seasonal Review | seasonal-publishe-53 | 211.07 | STATIONERY | false | 5 | TAMIL | 4 |

`educational_materials` catalogs the instructional resources available for procurement. Its primary key `material_code` (e.g. `506000`, `artemyarulin`, `3158145`, `10445634`) identifies each resource, while `title` (e.g. "Compact Initiative", "Legacy Model"), `publisher` (e.g. "pilot-publishe-50"), `unit_price` (e.g. `5,692`, `45,650`), and `category` (values `TEXTBOOK`, `WORKBOOK`, `EXERCISE_BOOK`, `STATIONERY`) describe the resource. The boolean `is_optional` and integer `required_quantity` (values 2 through 9) encode procurement rules. The column `course_code` is a foreign key into `academic_courses.course_code`, and `student_order_id` is a foreign key into `student_orders.student_order_id`, directly linking a material to both a curriculum offering and a specific student order.

The five base tables above form the entity backbone. Five junction tables then resolve the many-to-many relationships that the base schema cannot express in a single column.

**Table `courses_materials`**

| course_code | material_code |
|---|---|
| MATHS | 506000 |
| MATHS | artemyarulin |
| CHINESE | artemyarulin |
| CHINESE | 3158145 |
| MALAY | 3158145 |
| MALAY | 10445634 |
| TAMIL | 10445634 |
| TAMIL | 506000 |

`courses_materials` is the canonical many-to-many junction between `academic_courses` and `educational_materials`. Its composite key is the pair `(course_code, material_code)`, where `course_code` references `academic_courses.course_code` and `material_code` references `educational_materials.material_code`. In the sample data, `MATHS` is associated with materials `506000` and `artemyarulin`, while `CHINESE` links to `artemyarulin` and `3158145`. This table enables a course to offer multiple materials and a material to serve multiple courses without data duplication.

**Table `classes_students`**

| class_code | student_id |
|---|---|
| level-3 | 1 |
| level-3 | 2 |
| state_uk_27 | 2 |
| state_uk_27 | 3 |
| lu_tax_code_template_m17 | 3 |
| lu_tax_code_template_m17 | 4 |
| 8189504 | 4 |
| 8189504 | 1 |

`classes_students` resolves the many-to-many relationship between `student_classes` and `students`. Its composite key `(class_code, student_id)` references `student_classes.class_code` and `students.id`. While `students.class_code` already provides a direct foreign key, this junction table exists to support historical tracking, temporary assignments, or multi-class enrollments where a single student may be associated with multiple classes over time.

**Table `classes_materials`**

| class_code | material_code |
|---|---|
| level-3 | 506000 |
| level-3 | artemyarulin |
| state_uk_27 | artemyarulin |
| state_uk_27 | 3158145 |
| lu_tax_code_template_m17 | 3158145 |
| lu_tax_code_template_m17 | 10445634 |
| 8189504 | 10445634 |
| 8189504 | 506000 |

`classes_materials` links `student_classes` to `educational_materials` through the composite key `(class_code, material_code)`. This table captures the curriculum-material assignment at the classroom level, allowing a school to specify which materials are available to which classes independently of individual student orders.

**Table `students_orders`**

| student_id | student_order_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

`students_orders` is the junction between `students` and `student_orders`, with composite key `(student_id, student_order_id)`. While `student_orders.student_id` already provides a direct foreign key, this junction table supports scenarios where a student might have multiple orders (e.g., reorders, supplementary purchases) or where order history needs to be tracked independently of the current order state.

**Table `orders_materials`**

| student_order_id | material_code |
|---|---|
| 1 | 506000 |
| 1 | artemyarulin |
| 2 | artemyarulin |
| 2 | 3158145 |
| 3 | 3158145 |
| 3 | 10445634 |
| 4 | 10445634 |
| 4 | 506000 |

`orders_materials` resolves the many-to-many relationship between `student_orders` and `educational_materials`. Its composite key `(student_order_id, material_code)` references `student_orders.student_order_id` and `educational_materials.material_code`. This table allows a single order to contain multiple materials and a material to appear in multiple orders, decoupling the material catalog from the order ledger.

With the base tables and junction tables in place, the schema achieves third normal form: every non-key attribute depends on the full primary key, and no transitive dependencies remain. The ten views then materialize denormalized projections that answer specific analytical questions by joining the normalized tables back together.

**View `v_academic_course_educational_material_detail`**

```sql
CREATE VIEW v_academic_course_educational_material_detail AS
SELECT a.course_code, a.course_name, a.grade_level, b.material_code AS material_material_code, b.title AS material_title, b.publisher AS material_publisher
FROM academic_courses a
  JOIN courses_materials j ON j.course_code = a.course_code
  JOIN educational_materials b ON b.material_code = j.material_code;
```

| course_code | course_name | grade_level | material_material_code | material_title | material_publisher |
|---|---|---|---|---|---|
| MATHS | Legacy Protocol D | 29 | 506000 | Compact Initiative | pilot-publishe-50 |
| MATHS | Legacy Protocol D | 29 | artemyarulin | Legacy Model | extended-publishe-51 |
| CHINESE | Regional Programme | 33 | artemyarulin | Legacy Model | extended-publishe-51 |
| CHINESE | Regional Programme | 33 | 3158145 | Regional Cluster A | integrated-publishe-52 |
| MALAY | Seasonal Standard | 37 | 3158145 | Regional Cluster A | integrated-publishe-52 |
| MALAY | Seasonal Standard | 37 | 10445634 | Seasonal Review | seasonal-publishe-53 |
| TAMIL | Integrated Framework A | 41 | 10445634 | Seasonal Review | seasonal-publishe-53 |
| TAMIL | Integrated Framework A | 41 | 506000 | Compact Initiative | pilot-publishe-50 |

This view reconstructs the course-to-material relationship by joining `academic_courses` through `courses_materials` to `educational_materials`. It answers the question: "Which materials are associated with which courses, and what are their procurement details?" A row for `MATHS` paired with material `506000` ("Compact Initiative", category `TEXTBOOK`, unit price `5,692`) tells a curriculum administrator that this textbook is a designated resource for the MATHS course. The view surfaces `is_optional` and `required_quantity` alongside course metadata, enabling procurement planning at the course level.

**View `v_academic_course_student_class`**

```sql
CREATE VIEW v_academic_course_student_class AS
SELECT a.course_code, a.course_name, a.grade_level, a.is_mother_tongue, b.class_code AS class_class_code, b.grade_level AS class_grade_level, b.academic_year AS class_academic_year
FROM academic_courses a JOIN student_classes b ON a.class_code = b.class_code;
```

| course_code | course_name | grade_level | is_mother_tongue | class_class_code | class_grade_level | class_academic_year |
|---|---|---|---|---|---|---|
| MATHS | Legacy Protocol D | 29 | false | level-3 | 29 | 42 |
| CHINESE | Regional Programme | 33 | true | state_uk_27 | 33 | 51 |
| MALAY | Seasonal Standard | 37 | false | lu_tax_code_template_m17 | 37 | 60 |
| TAMIL | Integrated Framework A | 41 | true | 8189504 | 41 | 69 |

This view joins `academic_courses` to `student_classes` on `class_code`, answering: "Which classroom is each course assigned to, and what are its organizational details?" A row showing `MATHS` (course "Legacy Protocol D", grade level 29) mapped to class `level-3` (school "Seasonal Standard", academic year 42) lets an administrator see the full classroom context for a course offering. The view preserves both the course-level `grade_level` and the class-level `grade_level`, enabling comparison and validation of alignment.

**View `v_educational_material_academic_course`**

```sql
CREATE VIEW v_educational_material_academic_course AS
SELECT a.material_code, a.title, a.publisher, a.unit_price, b.course_code AS course_course_code, b.course_name AS course_course_name, b.grade_level AS course_grade_level
FROM educational_materials a JOIN academic_courses b ON a.course_code = b.course_code;
```

| material_code | title | publisher | unit_price | course_course_code | course_course_name | course_grade_level |
|---|---|---|---|---|---|---|
| 506000 | Compact Initiative | pilot-publishe-50 | 5,692 | MATHS | Legacy Protocol D | 29 |
| artemyarulin | Legacy Model | extended-publishe-51 | 45,650 | CHINESE | Regional Programme | 33 |
| 3158145 | Regional Cluster A | integrated-publishe-52 | 2,705 | MALAY | Seasonal Standard | 37 |
| 10445634 | Seasonal Review | seasonal-publishe-53 | 211.07 | TAMIL | Integrated Framework A | 41 |

This view reverses the perspective of `v_academic_course_educational_material_detail`, joining `educational_materials` to `academic_courses` through `courses_materials`. It answers: "For each material, which courses does it serve?" A row for material `506000` ("Compact Initiative") linked to course `MATHS` tells a publisher or procurement officer that this textbook is used in the MATHS curriculum. The view surfaces `course_name`, `is_mother_tongue`, and `is_compulsory` alongside material attributes, enabling cross-curricular material analysis.

**View `v_educational_material_student_order`**

```sql
CREATE VIEW v_educational_material_student_order AS
SELECT a.material_code, a.title, a.publisher, a.unit_price, b.student_order_id AS order_student_order_id, b.order_date AS order_order_date, b.total_amount AS order_total_amount
FROM educational_materials a JOIN student_orders b ON a.student_order_id = b.student_order_id;
```

| material_code | title | publisher | unit_price | order_student_order_id | order_order_date | order_total_amount |
|---|---|---|---|---|---|---|
| 506000 | Compact Initiative | pilot-publishe-50 | 5,692 | 1 | 2023-02-27T13:15:00 | 112.11 |
| artemyarulin | Legacy Model | extended-publishe-51 | 45,650 | 2 | 2024-07-11T20:32:00 | 1,979 |
| 3158145 | Regional Cluster A | integrated-publishe-52 | 2,705 | 3 | 2025-12-22T03:49:00 | 15,418 |
| 10445634 | Seasonal Review | seasonal-publishe-53 | 211.07 | 4 | 2022-05-06T10:06:00 | 12,579 |

This view joins `educational_materials` to `student_orders` through `orders_materials`, answering: "Which materials are included in which student orders, and what is the order's financial and fulfillment status?" A row for material `506000` ("Compact Initiative") linked to order `1` (date `2023-02-27T13:15:00`, total `112.11`, status `SCHEDULED`) tells a fulfillment coordinator that this material is part of a scheduled order. The view surfaces `collection_status` and `total_amount` alongside material pricing, enabling order-level cost rollups.

**View `v_student_class_student_detail`**

```sql
CREATE VIEW v_student_class_student_detail AS
SELECT a.class_code, a.grade_level, a.academic_year, b.id AS student_id, b.student_name AS student_student_name, b.contact_number AS student_contact_number
FROM student_classes a
  JOIN classes_students j ON j.class_code = a.class_code
  JOIN students b ON b.id = j.student_id;
```

| class_code | grade_level | academic_year | student_id | student_student_name | student_contact_number |
|---|---|---|---|---|---|
| level-3 | 29 | 42 | 1 | Distributed Standard | Peter Mcdowell |
| level-3 | 29 | 42 | 2 | Adaptive Framework D | Sophia Meyer |
| state_uk_27 | 33 | 51 | 2 | Adaptive Framework D | Sophia Meyer |
| state_uk_27 | 33 | 51 | 3 | Primary Protocol | Carol Gaines |
| lu_tax_code_template_m17 | 37 | 60 | 3 | Primary Protocol | Carol Gaines |
| lu_tax_code_template_m17 | 37 | 60 | 4 | Composite Programme | April Snyder |
| 8189504 | 41 | 69 | 4 | Composite Programme | April Snyder |
| 8189504 | 41 | 69 | 1 | Distributed Standard | Peter Mcdowell |

This view joins `student_classes` to `students` through `classes_students`, answering: "Which students are enrolled in which classes, and what is their current order status?" A row for class `level-3` (school "Seasonal Standard") paired with student `1` ("Distributed Standard", Peter Mcdowell, status `PENDING`) tells a classroom manager that Peter Mcdowell is enrolled in level-3 and has a pending material order. The view surfaces `order_status` and `belongs_from_class_class_code`, enabling tracking of student mobility and procurement state.

**View `v_student_class_educational_material_detail`**

```sql
CREATE VIEW v_student_class_educational_material_detail AS
SELECT a.class_code, a.grade_level, a.academic_year, b.material_code AS material_material_code, b.title AS material_title, b.publisher AS material_publisher
FROM student_classes a
  JOIN classes_materials j ON j.class_code = a.class_code
  JOIN educational_materials b ON b.material_code = j.material_code;
```

| class_code | grade_level | academic_year | material_material_code | material_title | material_publisher |
|---|---|---|---|---|---|
| level-3 | 29 | 42 | 506000 | Compact Initiative | pilot-publishe-50 |
| level-3 | 29 | 42 | artemyarulin | Legacy Model | extended-publishe-51 |
| state_uk_27 | 33 | 51 | artemyarulin | Legacy Model | extended-publishe-51 |
| state_uk_27 | 33 | 51 | 3158145 | Regional Cluster A | integrated-publishe-52 |
| lu_tax_code_template_m17 | 37 | 60 | 3158145 | Regional Cluster A | integrated-publishe-52 |
| lu_tax_code_template_m17 | 37 | 60 | 10445634 | Seasonal Review | seasonal-publishe-53 |
| 8189504 | 41 | 69 | 10445634 | Seasonal Review | seasonal-publishe-53 |
| 8189504 | 41 | 69 | 506000 | Compact Initiative | pilot-publishe-50 |

This view joins `student_classes` to `educational_materials` through `classes_materials`, answering: "Which materials are designated for which classes?" A row for class `level-3` paired with material `506000` ("Compact Initiative", category `TEXTBOOK`) tells a resource coordinator that this textbook is available to the level-3 classroom. The view surfaces `is_optional` and `required_quantity` alongside class metadata, enabling classroom-level resource planning.

**View `v_student_student_class`**

```sql
CREATE VIEW v_student_student_class AS
SELECT a.id, a.student_name, a.contact_number, a.class_code, b.class_code AS class_class_code, b.grade_level AS class_grade_level, b.academic_year AS class_academic_year
FROM students a JOIN student_classes b ON a.belongs_from_class_class_code = b.class_code;
```

| id | student_name | contact_number | class_code | class_class_code | class_grade_level | class_academic_year |
|---|---|---|---|---|---|---|
| 1 | Distributed Standard | Peter Mcdowell | level-3 | level-3 | 29 | 42 |
| 2 | Adaptive Framework D | Sophia Meyer | state_uk_27 | state_uk_27 | 33 | 51 |
| 3 | Primary Protocol | Carol Gaines | lu_tax_code_template_m17 | lu_tax_code_template_m17 | 37 | 60 |
| 4 | Composite Programme | April Snyder | 8189504 | 8189504 | 41 | 69 |

This view joins `students` to `student_classes` on `class_code`, answering: "For each student, what is their assigned class and its full context?" A row for student `1` ("Distributed Standard", Peter Mcdowell) mapped to class `level-3` (grade level 29, academic year 42, school "Seasonal Standard") gives a complete picture of the student's organizational placement. The view surfaces `order_status` and `belongs_from_class_class_code`, enabling a single-row lookup for student-class-assignment queries.

**View `v_student_student_order_detail`**

```sql
CREATE VIEW v_student_student_order_detail AS
SELECT a.id, a.student_name, a.contact_number, b.student_order_id AS order_student_order_id, b.order_date AS order_order_date, b.total_amount AS order_total_amount
FROM students a
  JOIN students_orders j ON j.student_id = a.id
  JOIN student_orders b ON b.student_order_id = j.student_order_id;
```

| id | student_name | contact_number | order_student_order_id | order_order_date | order_total_amount |
|---|---|---|---|---|---|
| 1 | Distributed Standard | Peter Mcdowell | 1 | 2023-02-27T13:15:00 | 112.11 |
| 1 | Distributed Standard | Peter Mcdowell | 2 | 2024-07-11T20:32:00 | 1,979 |
| 2 | Adaptive Framework D | Sophia Meyer | 2 | 2024-07-11T20:32:00 | 1,979 |
| 2 | Adaptive Framework D | Sophia Meyer | 3 | 2025-12-22T03:49:00 | 15,418 |
| 3 | Primary Protocol | Carol Gaines | 3 | 2025-12-22T03:49:00 | 15,418 |
| 3 | Primary Protocol | Carol Gaines | 4 | 2022-05-06T10:06:00 | 12,579 |
| 4 | Composite Programme | April Snyder | 4 | 2022-05-06T10:06:00 | 12,579 |
| 4 | Composite Programme | April Snyder | 1 | 2023-02-27T13:15:00 | 112.11 |

This view joins `students` to `student_orders` through `students_orders`, answering: "For each student, what are their order details and financial breakdown?" A row for student `1` ("Distributed Standard") linked to order `1` (date `2023-02-27T13:15:00`, total `112.11`, sections `18.45`/`21.70`/`21.70`, status `SCHEDULED`) tells a billing clerk the complete financial picture for that student's order. The view surfaces `section_a`, `section_b`, `section_c` alongside the student's name and order status, enabling detailed financial reconciliation.

**View `v_student_order_student`**

```sql
CREATE VIEW v_student_order_student AS
SELECT a.student_order_id, a.order_date, a.total_amount, a.section_a, b.id AS student_id, b.student_name AS student_student_name, b.contact_number AS student_contact_number
FROM student_orders a JOIN students b ON a.student_id = b.id;
```

| student_order_id | order_date | total_amount | section_a | student_id | student_student_name | student_contact_number |
|---|---|---|---|---|---|---|
| 1 | 2023-02-27T13:15:00 | 112.11 | 18.45 | 1 | Distributed Standard | Peter Mcdowell |
| 2 | 2024-07-11T20:32:00 | 1,979 | 20.90 | 2 | Adaptive Framework D | Sophia Meyer |
| 3 | 2025-12-22T03:49:00 | 15,418 | 23.35 | 3 | Primary Protocol | Carol Gaines |
| 4 | 2022-05-06T10:06:00 | 12,579 | 25.80 | 4 | Composite Programme | April Snyder |

This view reverses the perspective of `v_student_student_order_detail`, joining `student_orders` to `students` through `students_orders`. It answers: "For each order, which student placed it, and what is their enrollment context?" A row for order `1` (total `112.11`, collection status `SCHEDULED`) linked to student `1` ("Distributed Standard", Peter Mcdowell, class `level-3`) tells a fulfillment officer that the order belongs to Peter Mcdowell in class level-3. The view surfaces `class_code` and `order_status`, enabling order-level student lookup.

**View `v_student_order_educational_material_detail`**

```sql
CREATE VIEW v_student_order_educational_material_detail AS
SELECT a.student_order_id, a.order_date, a.total_amount, b.material_code AS material_material_code, b.title AS material_title, b.publisher AS material_publisher
FROM student_orders a
  JOIN orders_materials j ON j.student_order_id = a.student_order_id
  JOIN educational_materials b ON b.material_code = j.material_code;
```

| student_order_id | order_date | total_amount | material_material_code | material_title | material_publisher |
|---|---|---|---|---|---|
| 1 | 2023-02-27T13:15:00 | 112.11 | 506000 | Compact Initiative | pilot-publishe-50 |
| 1 | 2023-02-27T13:15:00 | 112.11 | artemyarulin | Legacy Model | extended-publishe-51 |
| 2 | 2024-07-11T20:32:00 | 1,979 | artemyarulin | Legacy Model | extended-publishe-51 |
| 2 | 2024-07-11T20:32:00 | 1,979 | 3158145 | Regional Cluster A | integrated-publishe-52 |
| 3 | 2025-12-22T03:49:00 | 15,418 | 3158145 | Regional Cluster A | integrated-publishe-52 |
| 3 | 2025-12-22T03:49:00 | 15,418 | 10445634 | Seasonal Review | seasonal-publishe-53 |
| 4 | 2022-05-06T10:06:00 | 12,579 | 10445634 | Seasonal Review | seasonal-publishe-53 |
| 4 | 2022-05-06T10:06:00 | 12,579 | 506000 | Compact Initiative | pilot-publishe-50 |

This view joins `student_orders` to `educational_materials` through `orders_materials`, answering: "For each order, which materials are included and what are their details?" A row for order `1` (total `112.11`, status `SCHEDULED`) linked to material `506000` ("Compact Initiative", publisher "pilot-publishe-50", price `5,692`, category `TEXTBOOK`) tells a procurement officer exactly which resources are part of that order. The view surfaces `is_optional`, `required_quantity`, and `course_code` alongside order financials, enabling order-level material auditing.

The schema design demonstrates a clean separation between entity storage and analytical projection. The five base tables store atomic facts in normalized form, the five junction tables resolve many-to-many associations without redundancy, and the ten views provide denormalized lenses that answer specific domain questions by joining the normalized tables back together. Each view corresponds to a natural analytical question—course-to-material mapping, classroom-to-student enrollment, order-to-material fulfillment—and reconstructs the answer from the underlying foreign-key relationships. The result is a schema that is both rigorously normalized for data integrity and practically accessible through well-named views that mirror the vocabulary of the educational domain.