## The Educational Technology Ecosystem: From Ontology to Relational Schema

The domain under examination models the intersection of student populations, educational resources, authentication infrastructures, and learning platforms within a school technology ecosystem. At its core, the ontology distinguishes between five principal entity types—students, instructional resources, authentication methods, learning management systems, and resource specializations (curriculum, test preparation, and intervention programs)—alongside the associative relationships that bind them. The relational schema materializes this ontology through a combination of normalized base tables, junction tables that capture many-to-many associations, and materialized views that reconstruct domain facts for analytical consumption. Understanding the schema requires tracing how each conceptual entity becomes a table, how cardinality constraints shape column design, and how joins across the normalized structure recover the original semantic relationships.

**Table `students`**

| id | student_id | first_name | last_name | grade_level | school_name | is_eligible_for_prodigy |
|---|---|---|---|---|---|---|
| 100 | 392507 | Stephanie Collins | Paul Allen | 29 | Seasonal Standard | false |
| 101 | 25388256 | Janice Johnston | Heather Beasley | 33 | Integrated Framework | true |
| 102 | id_16 | Upal Saha | Audrey Taylor | 37 | Extended Protocol D | false |
| 103 | gd_taxc_2211 | Katherine Snyder | Susan Wagner | 41 | Pilot Programme | true |

The `students` table anchors the entire schema as the primary actor entity. Each row represents a unique student, identified by a surrogate primary key `id` (an auto-incrementing integer such as `100` or `101`) and a business-level `student_id` (a string identifier like `392507` or `25388256`). The remaining columns capture demographic and eligibility attributes: `first_name` and `last_name` store the student's name (e.g., `Stephanie Collins` or `Janice Johnston`), `grade_level` holds a numeric value (ranging from `29` to `41` in the sample), `school_name` records the institution (such as `Seasonal Standard` or `Integrated Framework`), and `is_eligible_for_prodigy` is a boolean flag indicating eligibility for the Prodigy platform. This table is the left-hand side of most join operations in the view layer, serving as the reference point from which resource access, authentication method usage, and platform enrollment are queried.

**Table `instructional_resources`**

| instructional_resource_id | resource_id | resource_name | category | requires_additional_login | access_method | grade_range | authentication_method_id |
|---|---|---|---|---|---|---|---|
| 100 | 1167 | Adaptive Corridor | LMS | true | Clever | legacy-grade-79 | 1000 |
| 101 | 2106708 | Primary Series | Curriculum | false | Direct | compact-grade-80 | 1001 |
| 102 | 4180945 | Composite Assessment D | TestPrep | true | App | composite-grade-81 | 1002 |
| 103 | 10238270 | Compact Survey | Intervention | false | Clever | primary-grade-82 | 1003 |

Instructional resources form the second major entity cluster. The `instructional_resources` table stores general-purpose educational materials, each identified by `instructional_resource_id` (a surrogate key like `100` or `101`) and a business `resource_id` (such as `1167` or `2106708`). The `resource_name` column carries human-readable labels like `Adaptive Corridor` or `Primary Series`, while `category` classifies the resource into one of four domains: `LMS`, `Curriculum`, `TestPrep`, or `Intervention`. Boolean and categorical attributes `requires_additional_login` and `access_method` (with values like `Clever`, `Direct`, or `App`) capture access constraints, and `grade_range` specifies the applicable grade band (e.g., `legacy-grade-79` or `compact-grade-80`). Crucially, the foreign key `authentication_method_id` links each resource to its required authentication mechanism, establishing a many-to-one relationship with the `authentication_methods` table.

**Table `authentication_methods`**

| id | auth_method_id | method_name | is_default | requires_app_installation | created_at | updated_at |
|---|---|---|---|---|---|---|
| 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | AD | true | false | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | state_uk_25 | Clever | false | true | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Prodigy | true | false | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 505989 | AD | false | true | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `authentication_methods` table defines the identity providers and single sign-on mechanisms available across the ecosystem. Each row is identified by a surrogate `id` (e.g., `1000` or `1001`) and a business `auth_method_id` (a UUID such as `98a0473a-8fcd-11eb-924d-9cd76263cbd0` or a string like `state_uk_25`). The `method_name` column stores the provider label (`AD`, `Clever`, or `Prodigy`), `is_default` indicates whether the method is the institution's default, and `requires_app_installation` is a boolean flag. Timestamp columns `created_at` and `updated_at` record the lifecycle of each method (e.g., `2025-01-01 00:14:00` through `2025-01-02 00:41:00`). This table is referenced by multiple other tables—`instructional_resources`, `learning_management_systems`, `curriculum_resources`, and `test_preparation_resources`—making it a central hub in the schema's foreign-key graph.

**Table `learning_management_systems`**

| learning_management_system_id | lms_id | lms_name | supports_assignment_creation | access_via_clever | authentication_method_id |
|---|---|---|---|---|---|
| 1 | 1562842 | Compact Initiative | false | true | 1000 |
| 2 | 4793487 | Legacy Model | true | false | 1001 |
| 3 | 209229 | Regional Cluster A | false | true | 1002 |
| 4 | 8387540 | Seasonal Review | true | false | 1003 |

Learning management systems represent the platform layer of the ontology. The `learning_management_systems` table contains one row per LMS instance, identified by `learning_management_system_id` (a small integer like `1` through `4`) and a business `lms_id` (such as `1562842` or `4793487`). The `lms_name` column carries platform names like `Compact Initiative` or `Legacy Model`, while `supports_assignment_creation` and `access_via_clever` are boolean flags describing platform capabilities. The foreign key `authentication_method_id` ties each LMS to its authentication provider, mirroring the pattern seen in the resource tables. In the sample data, `Compact Initiative` (id `1`) uses authentication method `1000` and supports Clever access, whereas `Legacy Model` (id `2`) uses method `1001` and does not support Clever.

**Table `curriculum_resources`**

| curriculum_id | curriculum_name | subject_area | requires_additional_login | authentication_method_id |
|---|---|---|---|---|
| 605967 | Pearson EasyBridge | Science | true | 1000 |
| 4277022 | ThinkCentral | Reading | false | 1001 |
| 120 | Pearson EasyBridge | Science | true | 1002 |
| 4716397 | ThinkCentral | Reading | false | 1003 |

Curriculum resources specialize the general resource concept into the curriculum domain. The `curriculum_resources` table uses `curriculum_id` as its surrogate primary key (values like `605967` or `4277022`) and stores `curriculum_name` (e.g., `Pearson EasyBridge` or `ThinkCentral`), `subject_area` (such as `Science` or `Reading`), and `requires_additional_login` as a boolean. The foreign key `authentication_method_id` links each curriculum to its authentication provider. The sample data shows `Pearson EasyBridge` in `Science` requiring additional login under authentication method `1000`, while `ThinkCentral` in `Reading` does not require additional login under method `1001`.

**Table `test_preparation_resources`**

| test_preparation_resource_id | test_prep_id | test_prep_name | requires_app_installation | authentication_method_id | created_at | updated_at |
|---|---|---|---|---|---|---|
| 1000 | 0d593f52-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Model D | false | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 2002007020240 | Distributed Cluster | true | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Review | false | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 1437577 | Primary Initiative A | true | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Test preparation resources form another specialization, captured in the `test_preparation_resources` table. Each row is identified by `test_preparation_resource_id` (e.g., `1000` through `1003`) and a business `test_prep_id` (a UUID like `0d593f52-9bac-11eb-a8a2-19ed5c03f8d3` or a numeric string like `2002007020240`). The `test_prep_name` column stores labels such as `Baseline Model D` or `Distributed Cluster`. The boolean `requires_app_installation` and foreign key `authentication_method_id` mirror the pattern from other resource tables, while `created_at` and `updated_at` timestamps track the resource's lifecycle. In the sample, `Baseline Model D` does not require app installation and uses authentication method `1000`, whereas `Distributed Cluster` requires app installation and uses method `1001`.

**Table `intervention_programs`**

| id | intervention_id | intervention_name | subject_area | grade_range | requires_app_installation | authentication_method_id |
|---|---|---|---|---|---|---|
| 1 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Lexia Core5 | Reading | legacy-grade-79 | false | 1000 |
| 2 | L408 | Lexia PowerUp | Math | compact-grade-80 | true | 1001 |
| 3 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | MobyMax | Reading | composite-grade-81 | false | 1002 |
| 4 | 2618554 | Lexia Core5 | Math | primary-grade-82 | true | 1003 |

Intervention programs represent the final resource specialization, stored in the `intervention_programs` table. While the sample data does not display explicit rows, the table follows the same structural pattern as the other resource tables, with a surrogate primary key, a business identifier, a name column, and an `authentication_method_id` foreign key linking each program to its authentication mechanism. This table completes the resource hierarchy, where instructional resources serve as the general type and curriculum, test preparation, and intervention resources are domain-specific specializations.

The associative relationships between these entity types are materialized through a set of junction tables, each capturing a many-to-many or one-to-many association that cannot be expressed through a single foreign key. The `students_resources` table links students to the instructional resources they access, using composite foreign keys that reference `students.id` and `instructional_resources.instructional_resource_id`. Similarly, `students_methods` connects students to authentication methods, with foreign keys pointing to `students.id` and `authentication_methods.id`. The `resources_students` table provides an alternative or complementary association between resources and students, while `methods_students` offers a parallel link between authentication methods and students. The `methods_resources` table captures the relationship between authentication methods and resources, and `systems_students` links learning management systems to students. Finally, `programs_students` associates intervention programs with students. These junction tables collectively encode the complex web of student-resource-method-system interactions that define the operational reality of the educational technology ecosystem.

**View `student_instructional_resource_detail_view`**

```sql
CREATE VIEW student_instructional_resource_detail_view AS
SELECT a.id, a.student_id, a.first_name, b.instructional_resource_id AS resource_instructional_resource_id, b.resource_id AS resource_resource_id, b.resource_name AS resource_resource_name
FROM students a
  JOIN students_resources j ON j.student_id = a.id
  JOIN instructional_resources b ON b.instructional_resource_id = j.instructional_resource_id;
```

| id | student_id | first_name | resource_instructional_resource_id | resource_resource_id | resource_resource_name |
|---|---|---|---|---|---|
| 100 | 392507 | Stephanie Collins | 100 | 1167 | Adaptive Corridor |
| 100 | 392507 | Stephanie Collins | 101 | 2106708 | Primary Series |
| 101 | 25388256 | Janice Johnston | 101 | 2106708 | Primary Series |
| 101 | 25388256 | Janice Johnston | 102 | 4180945 | Composite Assessment D |
| 102 | id_16 | Upal Saha | 102 | 4180945 | Composite Assessment D |
| 102 | id_16 | Upal Saha | 103 | 10238270 | Compact Survey |
| 103 | gd_taxc_2211 | Katherine Snyder | 103 | 10238270 | Compact Survey |
| 103 | gd_taxc_2211 | Katherine Snyder | 100 | 1167 | Adaptive Corridor |

The `student_instructional_resource_detail_view` reconstructs the fact of a student's access to an instructional resource by joining `students` with `instructional_resources`. This view answers the question: "Which students are associated with which instructional resources, and what are the resource's access characteristics?" Reading the sample data, a row might show student `Stephanie Collins` (id `100`, student_id `392507`) from `Seasonal Standard` school accessing the resource `Adaptive Corridor` (category `LMS`, access method `Clever`), with the resource requiring additional login. Another row could pair student `Janice Johnston` (id `101`, student_id `25388256`) with `Primary Series` (category `Curriculum`, access method `Direct`), which does not require additional login. The view's join effectively denormalizes the student-resource relationship, embedding resource metadata directly alongside student demographics for reporting.

**View `student_authentication_method_detail_view`**

```sql
CREATE VIEW student_authentication_method_detail_view AS
SELECT a.id, a.student_id, a.first_name, b.id AS method_id, b.auth_method_id AS method_auth_method_id, b.method_name AS method_method_name
FROM students a
  JOIN students_methods j ON j.student_id = a.id
  JOIN authentication_methods b ON b.id = j.authentication_method_id;
```

| id | student_id | first_name | method_id | method_auth_method_id | method_method_name |
|---|---|---|---|---|---|
| 100 | 392507 | Stephanie Collins | 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | AD |
| 100 | 392507 | Stephanie Collins | 1001 | state_uk_25 | Clever |
| 101 | 25388256 | Janice Johnston | 1001 | state_uk_25 | Clever |
| 101 | 25388256 | Janice Johnston | 1002 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Prodigy |
| 102 | id_16 | Upal Saha | 1002 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Prodigy |
| 102 | id_16 | Upal Saha | 1003 | 505989 | AD |
| 103 | gd_taxc_2211 | Katherine Snyder | 1003 | 505989 | AD |
| 103 | gd_taxc_2211 | Katherine Snyder | 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | AD |

The `student_authentication_method_detail_view` joins `students` with `authentication_methods` to answer: "Which authentication methods are associated with each student, and what are the method's properties?" A representative row might pair student `Upal Saha` (id `102`, student_id `id_16`) from `Extended Protocol D` school with the `AD` authentication method (id `1000`, `auth_method_id` `98a0473a-8fcd-11eb-924d-9cd76263cbd0`), which is marked as the default and does not require app installation. Another row could show student `Katherine Snyder` (id `103`, student_id `gd_taxc_2211`) from `Pilot Programme` school associated with the `Clever` method (id `1001`, `auth_method_id` `state_uk_25`), which is not the default but does require app installation. This view enables administrators to audit which students use which authentication mechanisms and whether those mechanisms impose installation requirements.

**View `instructional_resource_student_detail_view`**

```sql
CREATE VIEW instructional_resource_student_detail_view AS
SELECT a.instructional_resource_id, a.resource_id, a.resource_name, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM instructional_resources a
  JOIN resources_students j ON j.instructional_resource_id = a.instructional_resource_id
  JOIN students b ON b.id = j.student_id;
```

| instructional_resource_id | resource_id | resource_name | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|
| 100 | 1167 | Adaptive Corridor | 100 | 392507 | Stephanie Collins |
| 100 | 1167 | Adaptive Corridor | 101 | 25388256 | Janice Johnston |
| 101 | 2106708 | Primary Series | 101 | 25388256 | Janice Johnston |
| 101 | 2106708 | Primary Series | 102 | id_16 | Upal Saha |
| 102 | 4180945 | Composite Assessment D | 102 | id_16 | Upal Saha |
| 102 | 4180945 | Composite Assessment D | 103 | gd_taxc_2211 | Katherine Snyder |
| 103 | 10238270 | Compact Survey | 103 | gd_taxc_2211 | Katherine Snyder |
| 103 | 10238270 | Compact Survey | 100 | 392507 | Stephanie Collins |

The `instructional_resource_student_detail_view` inverts the perspective of the first view, joining `instructional_resources` with `students` to answer: "Which students are associated with each instructional resource?" A row might show the resource `Adaptive Corridor` (id `100`, category `LMS`, access method `Clever`) being accessed by student `Stephanie Collins` (id `100`, grade level `29`, school `Seasonal Standard`). Another row could pair `Primary Series` (id `101`, category `Curriculum`, access method `Direct`) with student `Janice Johnston` (id `101`, grade level `33`, school `Integrated Framework`). This view is useful for resource administrators who need to understand the student population using a particular resource.

**View `instructional_resource_authentication_method_view`**

```sql
CREATE VIEW instructional_resource_authentication_method_view AS
SELECT a.instructional_resource_id, a.resource_id, a.resource_name, a.category, b.id AS method_id, b.auth_method_id AS method_auth_method_id, b.method_name AS method_method_name
FROM instructional_resources a JOIN authentication_methods b ON a.authentication_method_id = b.id;
```

| instructional_resource_id | resource_id | resource_name | category | method_id | method_auth_method_id | method_method_name |
|---|---|---|---|---|---|---|
| 100 | 1167 | Adaptive Corridor | LMS | 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | AD |
| 101 | 2106708 | Primary Series | Curriculum | 1001 | state_uk_25 | Clever |
| 102 | 4180945 | Composite Assessment D | TestPrep | 1002 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Prodigy |
| 103 | 10238270 | Compact Survey | Intervention | 1003 | 505989 | AD |

The `instructional_resource_authentication_method_view` joins `instructional_resources` with `authentication_methods` to answer: "Which authentication method is required by each instructional resource, and what are the method's characteristics?" A sample row might show `Adaptive Corridor` (id `100`, category `LMS`) requiring the `AD` authentication method (id `1000`, `method_name` `AD`, `is_default` true, `requires_app_installation` false). Another row could pair `Primary Series` (id `101`, category `Curriculum`) with the `Clever` method (id `1001`, `method_name` `Clever`, `is_default` false, `requires_app_installation` true). This view supports infrastructure planning by revealing the authentication method distribution across the resource catalog.

**View `authentication_method_student_detail_view`**

```sql
CREATE VIEW authentication_method_student_detail_view AS
SELECT a.id, a.auth_method_id, a.method_name, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM authentication_methods a
  JOIN methods_students j ON j.authentication_method_id = a.id
  JOIN students b ON b.id = j.student_id;
```

| id | auth_method_id | method_name | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|
| 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | AD | 100 | 392507 | Stephanie Collins |
| 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | AD | 101 | 25388256 | Janice Johnston |
| 1001 | state_uk_25 | Clever | 101 | 25388256 | Janice Johnston |
| 1001 | state_uk_25 | Clever | 102 | id_16 | Upal Saha |
| 1002 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Prodigy | 102 | id_16 | Upal Saha |
| 1002 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Prodigy | 103 | gd_taxc_2211 | Katherine Snyder |
| 1003 | 505989 | AD | 103 | gd_taxc_2211 | Katherine Snyder |
| 1003 | 505989 | AD | 100 | 392507 | Stephanie Collins |

The `authentication_method_student_detail_view` joins `authentication_methods` with `students` to answer: "Which students are associated with each authentication method?" A row might show the `AD` method (id `1000`, `method_name` `AD`, `is_default` true) being used by student `Stephanie Collins` (id `100`, first name `Stephanie`, last name `Collins`, grade level `29`, school `Seasonal Standard`). Another row could pair the `Clever` method (id `1001`, `method_name` `Clever`, `is_default` false) with student `Janice Johnston` (id `101`, first name `Janice`, last name `Beasley`, grade level `33`, school `Integrated Framework`). This view enables authentication method administrators to understand their user base.

**View `authentication_method_instructional_resource_detail_view`**

```sql
CREATE VIEW authentication_method_instructional_resource_detail_view AS
SELECT a.id, a.auth_method_id, a.method_name, b.instructional_resource_id AS resource_instructional_resource_id, b.resource_id AS resource_resource_id, b.resource_name AS resource_resource_name
FROM authentication_methods a
  JOIN methods_resources j ON j.authentication_method_id = a.id
  JOIN instructional_resources b ON b.instructional_resource_id = j.instructional_resource_id;
```

| id | auth_method_id | method_name | resource_instructional_resource_id | resource_resource_id | resource_resource_name |
|---|---|---|---|---|---|
| 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | AD | 100 | 1167 | Adaptive Corridor |
| 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | AD | 101 | 2106708 | Primary Series |
| 1001 | state_uk_25 | Clever | 101 | 2106708 | Primary Series |
| 1001 | state_uk_25 | Clever | 102 | 4180945 | Composite Assessment D |
| 1002 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Prodigy | 102 | 4180945 | Composite Assessment D |
| 1002 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Prodigy | 103 | 10238270 | Compact Survey |
| 1003 | 505989 | AD | 103 | 10238270 | Compact Survey |
| 1003 | 505989 | AD | 100 | 1167 | Adaptive Corridor |

The `authentication_method_instructional_resource_detail_view` joins `authentication_methods` with `instructional_resources` to answer: "Which instructional resources require each authentication method?" A sample row might show the `AD` method (id `1000`, `method_name` `AD`, `is_default` true) being required by the resource `Adaptive Corridor` (id `100`, resource name `Adaptive Corridor`, category `LMS`, access method `Clever`). Another row could pair the `Clever` method (id `1001`, `method_name` `Clever`, `is_default` false) with `Primary Series` (id `101`, resource name `Primary Series`, category `Curriculum`, access method `Direct`). This view supports resource-authentication alignment analysis.

**View `learning_management_system_student_detail_view`**

```sql
CREATE VIEW learning_management_system_student_detail_view AS
SELECT a.learning_management_system_id, a.lms_id, a.lms_name, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM learning_management_systems a
  JOIN systems_students j ON j.learning_management_system_id = a.learning_management_system_id
  JOIN students b ON b.id = j.student_id;
```

| learning_management_system_id | lms_id | lms_name | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|
| 1 | 1562842 | Compact Initiative | 100 | 392507 | Stephanie Collins |
| 1 | 1562842 | Compact Initiative | 101 | 25388256 | Janice Johnston |
| 2 | 4793487 | Legacy Model | 101 | 25388256 | Janice Johnston |
| 2 | 4793487 | Legacy Model | 102 | id_16 | Upal Saha |
| 3 | 209229 | Regional Cluster A | 102 | id_16 | Upal Saha |
| 3 | 209229 | Regional Cluster A | 103 | gd_taxc_2211 | Katherine Snyder |
| 4 | 8387540 | Seasonal Review | 103 | gd_taxc_2211 | Katherine Snyder |
| 4 | 8387540 | Seasonal Review | 100 | 392507 | Stephanie Collins |

The `learning_management_system_student_detail_view` joins `learning_management_systems` with `students` to answer: "Which students are associated with each learning management system?" A row might show the `Compact Initiative` LMS (id `1`, lms_id `1562842`, supports assignment creation `false`, access via Clever `true`) being used by student `Stephanie Collins` (id `100`, grade level `29`, school `Seasonal Standard`). Another row could pair the `Legacy Model` LMS (id `2`, lms_id `4793487`, supports assignment creation `true`, access via Clever `false`) with student `Janice Johnston` (id `101`, grade level `33`, school `Integrated Framework`). This view helps platform administrators understand their student adoption.

**View `learning_management_system_authentication_method_view`**

```sql
CREATE VIEW learning_management_system_authentication_method_view AS
SELECT a.learning_management_system_id, a.lms_id, a.lms_name, a.supports_assignment_creation, b.id AS method_id, b.auth_method_id AS method_auth_method_id, b.method_name AS method_method_name
FROM learning_management_systems a JOIN authentication_methods b ON a.authentication_method_id = b.id;
```

| learning_management_system_id | lms_id | lms_name | supports_assignment_creation | method_id | method_auth_method_id | method_method_name |
|---|---|---|---|---|---|---|
| 1 | 1562842 | Compact Initiative | false | 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | AD |
| 2 | 4793487 | Legacy Model | true | 1001 | state_uk_25 | Clever |
| 3 | 209229 | Regional Cluster A | false | 1002 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Prodigy |
| 4 | 8387540 | Seasonal Review | true | 1003 | 505989 | AD |

The `learning_management_system_authentication_method_view` joins `learning_management_systems` with `authentication_methods` to answer: "Which authentication method does each learning management system use?" A sample row might show the `Compact Initiative` LMS (id `1`, lms_name `Compact Initiative`, supports assignment creation `false`) using the `AD` authentication method (id `1000`, method_name `AD`, is_default `true`, requires_app_installation `false`). Another row could pair the `Legacy Model` LMS (id `2`, lms_name `Legacy Model`, supports assignment creation `true`) with the `Clever` method (id `1001`, method_name `Clever`, is_default `false`, requires_app_installation `true`). This view is essential for understanding the authentication infrastructure of each platform.

**View `curriculum_resource_student_detail_view`**

```sql
CREATE VIEW curriculum_resource_student_detail_view AS
SELECT a.curriculum_id, a.curriculum_name, a.subject_area, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM curriculum_resources a
  JOIN resources_students j ON j.curriculum_resource_curriculum_id = a.curriculum_id
  JOIN students b ON b.id = j.student_id;
```

| curriculum_id | curriculum_name | subject_area | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|
| 605967 | Pearson EasyBridge | Science | 100 | 392507 | Stephanie Collins |
| 605967 | Pearson EasyBridge | Science | 101 | 25388256 | Janice Johnston |
| 4277022 | ThinkCentral | Reading | 101 | 25388256 | Janice Johnston |
| 4277022 | ThinkCentral | Reading | 102 | id_16 | Upal Saha |
| 120 | Pearson EasyBridge | Science | 102 | id_16 | Upal Saha |
| 120 | Pearson EasyBridge | Science | 103 | gd_taxc_2211 | Katherine Snyder |
| 4716397 | ThinkCentral | Reading | 103 | gd_taxc_2211 | Katherine Snyder |
| 4716397 | ThinkCentral | Reading | 100 | 392507 | Stephanie Collins |

The `curriculum_resource_student_detail_view` joins `curriculum_resources` with `students` to answer: "Which students are associated with each curriculum resource?" A row might show the `Pearson EasyBridge` curriculum (curriculum_id `605967`, subject_area `Science`, requires_additional_login `true`) being accessed by student `Stephanie Collins` (id `100`, grade level `29`, school `Seasonal Standard`). Another row could pair `ThinkCentral` (curriculum_id `4277022`, subject_area `Reading`, requires_additional_login `false`) with student `Janice Johnston` (id `101`, grade level `33`, school `Integrated Framework`). This view supports curriculum adoption analysis.

**View `curriculum_resource_authentication_method_view`**

```sql
CREATE VIEW curriculum_resource_authentication_method_view AS
SELECT a.curriculum_id, a.curriculum_name, a.subject_area, a.requires_additional_login, b.id AS method_id, b.auth_method_id AS method_auth_method_id, b.method_name AS method_method_name
FROM curriculum_resources a JOIN authentication_methods b ON a.authentication_method_id = b.id;
```

| curriculum_id | curriculum_name | subject_area | requires_additional_login | method_id | method_auth_method_id | method_method_name |
|---|---|---|---|---|---|---|
| 605967 | Pearson EasyBridge | Science | true | 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | AD |
| 4277022 | ThinkCentral | Reading | false | 1001 | state_uk_25 | Clever |
| 120 | Pearson EasyBridge | Science | true | 1002 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Prodigy |
| 4716397 | ThinkCentral | Reading | false | 1003 | 505989 | AD |

The `curriculum_resource_authentication_method_view` joins `curriculum_resources` with `authentication_methods` to answer: "Which authentication method is required by each curriculum resource?" A sample row might show `Pearson EasyBridge` (curriculum_id `605967`, subject_area `Science`, requires_additional_login `true`) requiring the `AD` method (id `1000`, method_name `AD`, is_default `true`). Another row could pair `ThinkCentral` (curriculum_id `4277022`, subject_area `Reading`, requires_additional_login `false`) with the `Clever` method (id `1001`, method_name `Clever`, is_default `false`). This view helps curriculum administrators understand their authentication dependencies.

**View `test_preparation_resource_student_detail_view`**

```sql
CREATE VIEW test_preparation_resource_student_detail_view AS
SELECT a.test_preparation_resource_id, a.test_prep_id, a.test_prep_name, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM test_preparation_resources a
  JOIN resources_students j ON j.test_preparation_resource_id = a.test_preparation_resource_id
  JOIN students b ON b.id = j.student_id;
```

| test_preparation_resource_id | test_prep_id | test_prep_name | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|
| 1000 | 0d593f52-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Model D | 100 | 392507 | Stephanie Collins |
| 1000 | 0d593f52-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Model D | 101 | 25388256 | Janice Johnston |
| 1001 | 2002007020240 | Distributed Cluster | 101 | 25388256 | Janice Johnston |
| 1001 | 2002007020240 | Distributed Cluster | 102 | id_16 | Upal Saha |
| 1002 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Review | 102 | id_16 | Upal Saha |
| 1002 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Review | 103 | gd_taxc_2211 | Katherine Snyder |
| 1003 | 1437577 | Primary Initiative A | 103 | gd_taxc_2211 | Katherine Snyder |
| 1003 | 1437577 | Primary Initiative A | 100 | 392507 | Stephanie Collins |

The `test_preparation_resource_student_detail_view` joins `test_preparation_resources` with `students` to answer: "Which students are associated with each test preparation resource?" A row might show `Baseline Model D` (test_prep_id `0d593f52-9bac-11eb-a8a2-19ed5c03f8d3`, requires_app_installation `false`) being used by student `Stephanie Collins` (id `100`, grade level `29`, school `Seasonal Standard`). Another row could pair `Distributed Cluster` (test_prep_id `2002007020240`, requires_app_installation `true`) with student `Janice Johnston` (id `101`, grade level `33`, school `Integrated Framework`). This view supports test prep adoption tracking.

**View `test_preparation_resource_authentication_method_view`**

```sql
CREATE VIEW test_preparation_resource_authentication_method_view AS
SELECT a.test_preparation_resource_id, a.test_prep_id, a.test_prep_name, a.requires_app_installation, b.id AS method_id, b.auth_method_id AS method_auth_method_id, b.method_name AS method_method_name
FROM test_preparation_resources a JOIN authentication_methods b ON a.authentication_method_id = b.id;
```

| test_preparation_resource_id | test_prep_id | test_prep_name | requires_app_installation | method_id | method_auth_method_id | method_method_name |
|---|---|---|---|---|---|---|
| 1000 | 0d593f52-9bac-11eb-a8a2-19ed5c03f8d3 | Baseline Model D | false | 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | AD |
| 1001 | 2002007020240 | Distributed Cluster | true | 1001 | state_uk_25 | Clever |
| 1002 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | Adaptive Review | false | 1002 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Prodigy |
| 1003 | 1437577 | Primary Initiative A | true | 1003 | 505989 | AD |

The `test_preparation_resource_authentication_method_view` joins `test_preparation_resources` with `authentication_methods` to answer: "Which authentication method is required by each test preparation resource?" A sample row might show `Baseline Model D` (test_prep_id `0d593f52-9bac-11eb-a8a2-19ed5c03f8d3`, requires_app_installation `false`) requiring the `AD` method (id `1000`, method_name `AD`, is_default `true`). Another row could pair `Distributed Cluster` (test_prep_id `2002007020240`, requires_app_installation `true`) with the `Clever` method (id `1001`, method_name `Clever`, is_default `false`). This view helps test prep administrators understand their authentication requirements.

**View `intervention_program_student_detail_view`**

```sql
CREATE VIEW intervention_program_student_detail_view AS
SELECT a.id, a.intervention_id, a.intervention_name, b.id AS student_id, b.student_id AS student_student_id, b.first_name AS student_first_name
FROM intervention_programs a
  JOIN programs_students j ON j.intervention_program_id = a.id
  JOIN students b ON b.id = j.student_id;
```

| id | intervention_id | intervention_name | student_id | student_student_id | student_first_name |
|---|---|---|---|---|---|
| 1 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Lexia Core5 | 100 | 392507 | Stephanie Collins |
| 1 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Lexia Core5 | 101 | 25388256 | Janice Johnston |
| 2 | L408 | Lexia PowerUp | 101 | 25388256 | Janice Johnston |
| 2 | L408 | Lexia PowerUp | 102 | id_16 | Upal Saha |
| 3 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | MobyMax | 102 | id_16 | Upal Saha |
| 3 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | MobyMax | 103 | gd_taxc_2211 | Katherine Snyder |
| 4 | 2618554 | Lexia Core5 | 103 | gd_taxc_2211 | Katherine Snyder |
| 4 | 2618554 | Lexia Core5 | 100 | 392507 | Stephanie Collins |

The `intervention_program_student_detail_view` joins `intervention_programs` with `students` to answer: "Which students are enrolled in each intervention program?" While the sample data for intervention programs is not displayed, the view follows the same pattern: it reconstructs the student-program enrollment fact by joining the program table with the students table, embedding student demographic columns alongside program metadata. This view supports intervention program monitoring and reporting.

**View `intervention_program_authentication_method_view`**

```sql
CREATE VIEW intervention_program_authentication_method_view AS
SELECT a.id, a.intervention_id, a.intervention_name, a.subject_area, b.id AS method_id, b.auth_method_id AS method_auth_method_id, b.method_name AS method_method_name
FROM intervention_programs a JOIN authentication_methods b ON a.authentication_method_id = b.id;
```

| id | intervention_id | intervention_name | subject_area | method_id | method_auth_method_id | method_method_name |
|---|---|---|---|---|---|---|
| 1 | d64c33f2-8fc1-11eb-924d-9cd76263cbd0 | Lexia Core5 | Reading | 1000 | 98a0473a-8fcd-11eb-924d-9cd76263cbd0 | AD |
| 2 | L408 | Lexia PowerUp | Math | 1001 | state_uk_25 | Clever |
| 3 | eff2857c-8fcb-11eb-924d-9cd76263cbd0 | MobyMax | Reading | 1002 | 34039f3e-9bad-11eb-a8a2-19ed5c03f8d3 | Prodigy |
| 4 | 2618554 | Lexia Core5 | Math | 1003 | 505989 | AD |

The `intervention_program_authentication_method_view` joins `intervention_programs` with `authentication_methods` to answer: "Which authentication method is required by each intervention program?" Following the established pattern, this view links program records to their authentication method records, enabling administrators to audit the authentication infrastructure across intervention offerings.

The schema design reflects a deliberate trade-off between normalization and query convenience. The base tables are normalized to eliminate redundancy: student information lives in `students`, resource metadata in `instructional_resources`, `curriculum_resources`, `test_preparation_resources`, and `intervention_programs`, and authentication method definitions in `authentication_methods`. Junction tables (`students_resources`, `students_methods`, `resources_students`, `methods_students`, `methods_resources`, `systems_students`, `programs_students`) capture the many-to-many relationships without duplicating entity data. The views then denormalize this structure on demand, joining the appropriate tables to reconstruct domain facts for specific analytical questions. This architecture supports both data integrity (through normalization) and analytical accessibility (through materialized views), embodying a classic relational design pattern adapted to the educational technology domain. The consistent use of `authentication_method_id` as a foreign key across multiple resource tables creates a hub-and-spoke topology centered on `authentication_methods`, while the junction tables create a mesh of student-resource associations that can be queried through the various detail views depending on which entity serves as the analytical starting point.

## Data appendix

**Table `students_resources`**

| student_id | instructional_resource_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

**Table `students_methods`**

| student_id | authentication_method_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

**Table `resources_students`**

| instructional_resource_id | student_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

**Table `methods_students`**

| authentication_method_id | student_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

**Table `methods_resources`**

| authentication_method_id | instructional_resource_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

**Table `systems_students`**

| learning_management_system_id | student_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `programs_students`**

| intervention_program_id | student_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |
