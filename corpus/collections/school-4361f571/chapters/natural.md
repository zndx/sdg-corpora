## The Architecture of Educational Enrolment

Educational institutions operate as complex networks where children, families, and schools intersect through formal enrolment processes. Each enrolment represents a binding relationship between a child and an institution, mediated by parental guardianship and governed by application timelines, year-group classifications, and admission statuses. The data model described here captures every dimension of this ecosystem: the schools themselves, the children seeking placement, the parents or guardians responsible for applications, and the enrolments that formally connect them. Understanding how these entities relate requires examining both the foundational tables that store raw records and the views that synthesize joined results for operational reporting.

**Table `schools`**

| id | legal_name | street_address | postal_code | telephone | email | website |
|---|---|---|---|---|---|---|
| 100 | Adaptive Model | composite-street-15 | 9125611 | adaptive-telephon-23 | seasonal-email-11 | https://bugs.launchpad.net/murano/+bug/1294080 |
| 101 | Primary Cluster | primary-street-16 | ChIJt4hBkzhu5kcRJJDUNqGUpso | distributed-telephon-24 | regional-email-12 | https://bugs.launchpad.net/murano/+bug/1294080 |
| 102 | Composite Review D | adaptive-street-17 | 3001009030200 | baseline-telephon-25 | legacy-email-13 | https://www.nature.com/articles/nphoton.2008.245 |
| 103 | Compact Initiative | distributed-street-18 | 4060635 | pilot-telephon-26 | compact-email-14 | https://bugs.launchpad.net/trove/+bug/1347114 |

The schools table serves as the institutional anchor of the enrolment ecosystem. Each school is identified by a numeric `id` and carries a `legal_name` that distinguishes it in official correspondence. Contact and location data are captured through `street_address`, `postal_code`, `telephone`, `email`, and `website` columns. Consider school 100, "Adaptive Model," located at composite-street-15 with postal code 9125611; its telephone is listed as adaptive-telephon-23 and its email as seasonal-email-11. School 101, "Primary Cluster," occupies primary-street-16 and carries the postal code ChIJt4hBkzhu5kcRJJDUNqGUpso — a geocoded identifier rather than a traditional postal format. School 102, "Composite Review D," uses postal code 3001009030200 and links to a Nature Photonics article at its website, while school 103, "Compact Initiative," resides at distributed-street-18 with postal code 4060635. These four schools form the complete institutional universe in the current dataset, each with distinct contact patterns and address formats.

**Table `enrolments`**

| enrolment_id | application_date | year_group | status | child_id | school_id |
|---|---|---|---|---|---|
| 100 | 2022-05-16T16:24:00 | seasonal-year-35 | pending | 1 | 100 |
| 101 | 2023-10-27T23:41:00 | regional-year-36 | offered | 2 | 101 |
| 102 | 2024-03-11T06:58:00 | legacy-year-37 | accepted | 3 | 102 |
| 103 | 2025-08-22T13:15:00 | compact-year-38 | refused | 4 | 103 |

Enrolments represent the formal application and admission records that link children to schools. The `enrolment_id` column uniquely identifies each enrolment, while `application_date` records when the application was submitted. The `year_group` column classifies the child's expected academic level — seasonal-year-35, regional-year-36, legacy-year-37, and compact-year-38 appear across the four records. The `status` column tracks the admission outcome: pending, offered, accepted, or refused. Each enrolment references a `child_id` and a `school_id`, establishing the core child-to-school relationship. Enrolment 100, submitted on 2022-05-16 for child 1 at school 100, remains in pending status. Enrolment 101, dated 2023-10-27 for child 2 at school 101, has been offered. Enrolment 102, from 2024-03-11 for child 3 at school 102, has been accepted. Enrolment 103, the most recent at 2025-08-22 for child 4 at school 103, has been refused. The temporal spread of application dates — spanning from 2022 through 2025 — illustrates a rolling admissions cycle.

**Table `childs`**

| id | full_legal_name | date_of_birth | gender | permanent_address | permanent_postal_code | enrolment_id | child_id |
|---|---|---|---|---|---|---|---|
| 1 | Integrated Framework A | 2025-04-02 | male | integrated-permanen-28 | gd_acc_221000 | 100 | 1 |
| 2 | Extended Protocol | 2022-09-13 | female | seasonal-permanen-29 | info | 101 | 2 |
| 3 | Pilot Programme | 2023-02-24 | male | regional-permanen-30 | 5935 | 102 | 3 |
| 4 | Baseline Standard D | 2024-07-08 | female | legacy-permanen-31 | 727049 | 103 | 4 |

The childs table stores personal and demographic information for each child in the system. The `id` column provides a unique identifier, while `full_legal_name` carries the child's complete legal name. Date of birth is recorded in `date_of_birth`, and `gender` captures the child's gender classification. The `permanent_address` and `permanent_postal_code` fields store the child's fixed residential location. Notably, the table includes both an `enrolment_id` and a `child_id` column, suggesting a denormalized or redundant linkage to the enrolment record. Child 1, named "Integrated Framework A," was born on 2025-04-02, is male, and resides at integrated-permanen-28 with postal code gd_acc_221000. Child 2, "Extended Protocol," is female, born 2022-09-13, with permanent address seasonal-permanen-29 and postal code info. Child 3, "Pilot Programme," is male, born 2023-02-24, living at regional-permanen-30 with postal code 5935. Child 4, "Baseline Standard D," is female, born 2024-07-08, at legacy-permanen-31 with postal code 727049. Each child is associated with a specific enrolment through the `enrolment_id` column, creating a direct one-to-one mapping in this dataset.

**Table `parents`**

| id | full_legal_name | relationship_to_child | home_telephone | mobile_telephone | work_telephone | email_address | residential_address | residential_postal_code | child_id | enrolment_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Integrated Framework A | mother | extended-home-93 | regional-mobile-78 | seasonal-work-23 | primary-email-70 | compact-resident-62 | 2618581 | 1 | 100 |
| 1001 | Extended Protocol | father | integrated-home-94 | legacy-mobile-79 | regional-work-24 | adaptive-email-71 | composite-resident-63 | 611519 | 2 | 101 |
| 1002 | Pilot Programme | mother | seasonal-home-95 | compact-mobile-80 | legacy-work-25 | distributed-email-72 | primary-resident-64 | 330 | 3 | 102 |
| 1003 | Baseline Standard D | father | regional-home-96 | composite-mobile-81 | compact-work-26 | baseline-email-73 | adaptive-resident-65 | 790474 | 4 | 103 |

Parents are recorded with comprehensive contact and relationship data. The `id` column uniquely identifies each parent record, while `full_legal_name` stores their legal name. The `relationship_to_child` column specifies whether the parent is a mother or father. Contact information spans three telephone types — `home_telephone`, `mobile_telephone`, and `work_telephone` — alongside `email_address` and residential details (`residential_address` and `residential_postal_code`). The table also includes `child_id` and `enrolment_id` columns, linking each parent to a specific child and enrolment. Parent 1000, "Integrated Framework A," is the mother of child 1 and enrolment 100, reachable at extended-home-93 (home), regional-mobile-78 (mobile), seasonal-work-23 (work), and primary-email-70, residing at compact-resident-62 with postal code 2618581. Parent 1001, "Extended Protocol," is the father of child 2 and enrolment 101, with contact details integrated-home-94, legacy-mobile-79, regional-work-24, adaptive-email-71, and residential address composite-resident-63, postal code 611519. Parent 1002, "Pilot Programme," is the mother of child 3 and enrolment 102, reachable at seasonal-home-95, compact-mobile-80, legacy-work-25, distributed-email-72, living at primary-resident-64, postal code 330. Parent 1003, "Baseline Standard D," is the father of child 4 and enrolment 103, with contact numbers regional-home-96, composite-mobile-81, compact-work-26, email baseline-email-73, and residential address adaptive-resident-65, postal code 790474.

**Table `schools_enrolments`**

| school_id | enrolment_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

The schools_enrolments junction table establishes the many-to-many relationship between schools and enrolments. Each row pairs a `school_id` with an `enrolment_id`, indicating that a particular enrolment is associated with a particular school. In this dataset, the relationship is not strictly one-to-one: school 100 is linked to both enrolments 100 and 101; school 101 is linked to enrolments 101 and 102; school 102 is linked to enrolments 102 and 103; and school 103 is linked to enrolments 103 and 100. This cross-linking pattern suggests that schools may process or track multiple enrolments beyond the single primary enrolment recorded in the enrolments table, or that the junction table captures historical or secondary associations. The eight rows in this table — two per school — form a complete bipartite coverage across the four schools and four enrolments.

**Table `enrolments_parents`**

| enrolment_id | parent_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The enrolments_parents junction table connects enrolments to parents in a many-to-many relationship. Each row pairs an `enrolment_id` with a `parent_id`, indicating which parents are associated with which enrolments. Enrolment 100 is linked to parents 1000 and 1001; enrolment 101 to parents 1001 and 1002; enrolment 102 to parents 1002 and 1003; and enrolment 103 to parents 1003 and 1000. This pattern reveals that parents can be associated with multiple enrolments and that each enrolment may have multiple parent contacts. The cyclic nature of the associations — parent 1000 appears with enrolments 100 and 103, parent 1001 with 100 and 101, and so on — suggests a structured assignment of parental responsibilities across the enrolment pipeline.

**Table `childs_parents`**

| child_id | parent_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The childs_parents junction table records the direct relationships between children and their parents. While the parents table already includes `child_id` and `enrolment_id` columns, this dedicated junction table provides a normalized many-to-many linkage, allowing for the possibility that a child may have multiple parents recorded and that a parent may be associated with multiple children. The existence of this table alongside the denormalized columns in the parents table reflects a design that supports both simple one-to-one relationships and more complex multi-parent or multi-child scenarios.

The views in this system synthesize the base tables into operational reports that answer specific questions about the enrolment process. Each view joins multiple tables to present a unified perspective on a particular aspect of the ecosystem.

**View `vw_school_enrolment_detail`**

```sql
CREATE VIEW vw_school_enrolment_detail AS
SELECT a.id, a.legal_name, a.street_address, b.enrolment_id AS enrolment_enrolment_id, b.application_date AS enrolment_application_date, b.year_group AS enrolment_year_group
FROM schools a
  JOIN schools_enrolments j ON j.school_id = a.id
  JOIN enrolments b ON b.enrolment_id = j.enrolment_id;
```

| id | legal_name | street_address | enrolment_enrolment_id | enrolment_application_date | enrolment_year_group |
|---|---|---|---|---|---|
| 100 | Adaptive Model | composite-street-15 | 100 | 2022-05-16T16:24:00 | seasonal-year-35 |
| 100 | Adaptive Model | composite-street-15 | 101 | 2023-10-27T23:41:00 | regional-year-36 |
| 101 | Primary Cluster | primary-street-16 | 101 | 2023-10-27T23:41:00 | regional-year-36 |
| 101 | Primary Cluster | primary-street-16 | 102 | 2024-03-11T06:58:00 | legacy-year-37 |
| 102 | Composite Review D | adaptive-street-17 | 102 | 2024-03-11T06:58:00 | legacy-year-37 |
| 102 | Composite Review D | adaptive-street-17 | 103 | 2025-08-22T13:15:00 | compact-year-38 |
| 103 | Compact Initiative | distributed-street-18 | 103 | 2025-08-22T13:15:00 | compact-year-38 |
| 103 | Compact Initiative | distributed-street-18 | 100 | 2022-05-16T16:24:00 | seasonal-year-35 |

The vw_school_enrolment_detail view joins the schools table with the schools_enrolments junction table and the enrolments table to produce a comprehensive record of each school's enrolment associations. This view answers the question: "Which enrolments is each school tracking, and what are the details of those enrolments?" A row from this view might show school 100 (Adaptive Model) linked to enrolment 100, displaying the application date of 2022-05-16, the year group seasonal-year-35, and the status pending. The same school would also appear in a second row linked to enrolment 101, with application date 2023-10-27, year group regional-year-36, and status offered. This view is essential for school administrators who need to see all enrolments associated with their institution in a single consolidated report.

**View `vw_enrolment_child`**

```sql
CREATE VIEW vw_enrolment_child AS
SELECT a.enrolment_id, a.application_date, a.year_group, a.status, b.id AS child_id, b.full_legal_name AS child_full_legal_name, b.date_of_birth AS child_date_of_birth
FROM enrolments a JOIN childs b ON a.child_id = b.id;
```

| enrolment_id | application_date | year_group | status | child_id | child_full_legal_name | child_date_of_birth |
|---|---|---|---|---|---|---|
| 100 | 2022-05-16T16:24:00 | seasonal-year-35 | pending | 1 | Integrated Framework A | 2025-04-02 |
| 101 | 2023-10-27T23:41:00 | regional-year-36 | offered | 2 | Extended Protocol | 2022-09-13 |
| 102 | 2024-03-11T06:58:00 | legacy-year-37 | accepted | 3 | Pilot Programme | 2023-02-24 |
| 103 | 2025-08-22T13:15:00 | compact-year-38 | refused | 4 | Baseline Standard D | 2024-07-08 |

The vw_enrolment_child view joins the enrolments table with the childs table to present each enrolment alongside the corresponding child's personal information. This view answers: "Which child is associated with each enrolment, and what are their demographic details?" A representative row would show enrolment 100 (status: pending, year group: seasonal-year-35) linked to child 1, "Integrated Framework A," who is male, born 2025-04-02, and resides at integrated-permanen-28 with postal code gd_acc_221000. Another row would show enrolment 103 (status: refused, year group: compact-year-38) linked to child 4, "Baseline Standard D," who is female, born 2024-07-08, and lives at legacy-permanen-31 with postal code 727049. This view is particularly useful for admissions officers who need to review child demographics alongside enrolment outcomes.

**View `vw_enrolment_school`**

```sql
CREATE VIEW vw_enrolment_school AS
SELECT a.enrolment_id, a.application_date, a.year_group, a.status, b.id AS school_id, b.legal_name AS school_legal_name, b.street_address AS school_street_address
FROM enrolments a JOIN schools b ON a.school_id = b.id;
```

| enrolment_id | application_date | year_group | status | school_id | school_legal_name | school_street_address |
|---|---|---|---|---|---|---|
| 100 | 2022-05-16T16:24:00 | seasonal-year-35 | pending | 100 | Adaptive Model | composite-street-15 |
| 101 | 2023-10-27T23:41:00 | regional-year-36 | offered | 101 | Primary Cluster | primary-street-16 |
| 102 | 2024-03-11T06:58:00 | legacy-year-37 | accepted | 102 | Composite Review D | adaptive-street-17 |
| 103 | 2025-08-22T13:15:00 | compact-year-38 | refused | 103 | Compact Initiative | distributed-street-18 |

The vw_enrolment_school view joins the enrolments table with the schools_enrolments junction table and the schools table to present each enrolment alongside its associated school's details. This view answers: "Which school is each enrolment associated with, and what are the school's contact details?" A row from this view might display enrolment 101 (status: offered, application date: 2023-10-27) linked to school 101, "Primary Cluster," located at primary-street-16 with postal code ChIJt4hBkzhu5kcRJJDUNqGUpso, telephone distributed-telephon-24, and email regional-email-12. Another row could show enrolment 102 (status: accepted, application date: 2024-03-11) linked to school 102, "Composite Review D," at adaptive-street-17, postal code 3001009030200, telephone baseline-telephon-25, and email legacy-email-13. This view supports communication workflows where staff need to contact schools regarding specific enrolments.

**View `vw_enrolment_parent_detail`**

```sql
CREATE VIEW vw_enrolment_parent_detail AS
SELECT a.enrolment_id, a.application_date, a.year_group, b.id AS parent_id, b.full_legal_name AS parent_full_legal_name, b.relationship_to_child AS parent_relationship_to_child
FROM enrolments a
  JOIN enrolments_parents j ON j.enrolment_id = a.enrolment_id
  JOIN parents b ON b.id = j.parent_id;
```

| enrolment_id | application_date | year_group | parent_id | parent_full_legal_name | parent_relationship_to_child |
|---|---|---|---|---|---|
| 100 | 2022-05-16T16:24:00 | seasonal-year-35 | 1000 | Integrated Framework A | mother |
| 100 | 2022-05-16T16:24:00 | seasonal-year-35 | 1001 | Extended Protocol | father |
| 101 | 2023-10-27T23:41:00 | regional-year-36 | 1001 | Extended Protocol | father |
| 101 | 2023-10-27T23:41:00 | regional-year-36 | 1002 | Pilot Programme | mother |
| 102 | 2024-03-11T06:58:00 | legacy-year-37 | 1002 | Pilot Programme | mother |
| 102 | 2024-03-11T06:58:00 | legacy-year-37 | 1003 | Baseline Standard D | father |
| 103 | 2025-08-22T13:15:00 | compact-year-38 | 1003 | Baseline Standard D | father |
| 103 | 2025-08-22T13:15:00 | compact-year-38 | 1000 | Integrated Framework A | mother |

The vw_enrolment_parent_detail view joins the enrolments table with the enrolments_parents junction table and the parents table to present each enrolment alongside its associated parent's contact and relationship information. This view answers: "Which parents are associated with each enrolment, and how can they be contacted?" A representative row would show enrolment 100 (status: pending, year group: seasonal-year-35) linked to parent 1000, "Integrated Framework A," who is the mother, reachable at extended-home-93 (home), regional-mobile-78 (mobile), seasonal-work-23 (work), and primary-email-70, residing at compact-resident-62 with postal code 2618581. Another row might show enrolment 103 (status: refused, year group: compact-year-38) linked to parent 1003, "Baseline Standard D," who is the father, with contact numbers regional-home-96, composite-mobile-81, compact-work-26, email baseline-email-73, and residential address adaptive-resident-65, postal code 790474. This view is critical for parent communication and notification workflows.

**View `vw_child_enrolment`**

```sql
CREATE VIEW vw_child_enrolment AS
SELECT a.id, a.full_legal_name, a.date_of_birth, a.gender, b.enrolment_id AS enrolment_enrolment_id, b.application_date AS enrolment_application_date, b.year_group AS enrolment_year_group
FROM childs a JOIN enrolments b ON a.enrolment_id = b.enrolment_id;
```

| id | full_legal_name | date_of_birth | gender | enrolment_enrolment_id | enrolment_application_date | enrolment_year_group |
|---|---|---|---|---|---|---|
| 1 | Integrated Framework A | 2025-04-02 | male | 100 | 2022-05-16T16:24:00 | seasonal-year-35 |
| 2 | Extended Protocol | 2022-09-13 | female | 101 | 2023-10-27T23:41:00 | regional-year-36 |
| 3 | Pilot Programme | 2023-02-24 | male | 102 | 2024-03-11T06:58:00 | legacy-year-37 |
| 4 | Baseline Standard D | 2024-07-08 | female | 103 | 2025-08-22T13:15:00 | compact-year-38 |

The vw_child_enrolment view joins the childs table with the enrolments table to present each child alongside their enrolment details. This view answers: "What is the enrolment status and school association for each child?" A row from this view would show child 2, "Extended Protocol," female, born 2022-09-13, at permanent address seasonal-permanen-29 with postal code info, linked to enrolment 101, which has status offered, year group regional-year-36, application date 2023-10-27, and is associated with school 101. Another row would show child 3, "Pilot Programme," male, born 2023-02-24, at regional-permanen-30 with postal code 5935, linked to enrolment 102, which has status accepted, year group legacy-year-37, application date 2024-03-11, and is associated with school 102. This view provides a child-centric perspective on the enrolment pipeline.

**View `vw_child_parent_detail`**

```sql
CREATE VIEW vw_child_parent_detail AS
SELECT a.id, a.full_legal_name, a.date_of_birth, b.id AS parent_id, b.full_legal_name AS parent_full_legal_name, b.relationship_to_child AS parent_relationship_to_child
FROM childs a
  JOIN childs_parents j ON j.child_id = a.id
  JOIN parents b ON b.id = j.parent_id;
```

| id | full_legal_name | date_of_birth | parent_id | parent_full_legal_name | parent_relationship_to_child |
|---|---|---|---|---|---|
| 1 | Integrated Framework A | 2025-04-02 | 1000 | Integrated Framework A | mother |
| 1 | Integrated Framework A | 2025-04-02 | 1001 | Extended Protocol | father |
| 2 | Extended Protocol | 2022-09-13 | 1001 | Extended Protocol | father |
| 2 | Extended Protocol | 2022-09-13 | 1002 | Pilot Programme | mother |
| 3 | Pilot Programme | 2023-02-24 | 1002 | Pilot Programme | mother |
| 3 | Pilot Programme | 2023-02-24 | 1003 | Baseline Standard D | father |
| 4 | Baseline Standard D | 2024-07-08 | 1003 | Baseline Standard D | father |
| 4 | Baseline Standard D | 2024-07-08 | 1000 | Integrated Framework A | mother |

The vw_child_parent_detail view joins the childs table with the childs_parents junction table and the parents table to present each child alongside their parent's contact and relationship information. This view answers: "Who are the parents of each child, and how can they be reached?" A representative row would show child 1, "Integrated Framework A," male, born 2025-04-02, at permanent address integrated-permanen-28 with postal code gd_acc_221000, linked to parent 1000, "Integrated Framework A," who is the mother, with home telephone extended-home-93, mobile telephone regional-mobile-78, work telephone seasonal-work-23, email primary-email-70, and residential address compact-resident-62, postal code 2618581. Another row would show child 4, "Baseline Standard D," female, born 2024-07-08, at legacy-permanen-31 with postal code 727049, linked to parent 1003, "Baseline Standard D," who is the father, with home telephone regional-home-96, mobile telephone composite-mobile-81, work telephone compact-work-26, email baseline-email-73, and residential address adaptive-resident-65, postal code 790474. This view supports family communication and guardianship verification.

**View `vw_child_child`**

```sql
CREATE VIEW vw_child_child AS
SELECT a.id, a.full_legal_name, a.date_of_birth, a.gender, b.id AS child_id, b.full_legal_name AS child_full_legal_name, b.date_of_birth AS child_date_of_birth
FROM childs a JOIN childs b ON a.child_id = b.id;
```

| id | full_legal_name | date_of_birth | gender | child_id | child_full_legal_name | child_date_of_birth |
|---|---|---|---|---|---|---|
| 1 | Integrated Framework A | 2025-04-02 | male | 1 | Integrated Framework A | 2025-04-02 |
| 2 | Extended Protocol | 2022-09-13 | female | 2 | Extended Protocol | 2022-09-13 |
| 3 | Pilot Programme | 2023-02-24 | male | 3 | Pilot Programme | 2023-02-24 |
| 4 | Baseline Standard D | 2024-07-08 | female | 4 | Baseline Standard D | 2024-07-08 |

The vw_child_child view presents a self-referential or enriched view of the childs table, potentially including additional computed columns or self-joins that provide a comprehensive profile of each child. This view answers: "What is the complete profile of each child, including any derived or computed attributes?" Each row would contain the child's full legal name, date of birth, gender, permanent address, and postal code, potentially augmented with computed fields such as age calculations or address normalization. The four children — "Integrated Framework A," "Extended Protocol," "Pilot Programme," and "Baseline Standard D" — would each appear as a complete record with all their demographic and contact information consolidated.

**View `vw_parent_child`**

```sql
CREATE VIEW vw_parent_child AS
SELECT a.id, a.full_legal_name, a.relationship_to_child, a.home_telephone, b.id AS child_id, b.full_legal_name AS child_full_legal_name, b.date_of_birth AS child_date_of_birth
FROM parents a JOIN childs b ON a.child_id = b.id;
```

| id | full_legal_name | relationship_to_child | home_telephone | child_id | child_full_legal_name | child_date_of_birth |
|---|---|---|---|---|---|---|
| 1000 | Integrated Framework A | mother | extended-home-93 | 1 | Integrated Framework A | 2025-04-02 |
| 1001 | Extended Protocol | father | integrated-home-94 | 2 | Extended Protocol | 2022-09-13 |
| 1002 | Pilot Programme | mother | seasonal-home-95 | 3 | Pilot Programme | 2023-02-24 |
| 1003 | Baseline Standard D | father | regional-home-96 | 4 | Baseline Standard D | 2024-07-08 |

The vw_parent_child view joins the parents table with the childs_parents junction table and the childs table to present each parent alongside their child's information. This view answers: "Which child is associated with each parent, and what are the child's details?" A row from this view would show parent 1001, "Extended Protocol," father, with home telephone integrated-home-94, mobile telephone legacy-mobile-79, work telephone regional-work-24, email adaptive-email-71, residing at composite-resident-63 with postal code 611519, linked to child 2, "Extended Protocol," female, born 2022-09-13, at permanent address seasonal-permanen-29 with postal code info. Another row would show parent 1002, "Pilot Programme," mother, with home telephone seasonal-home-95, mobile telephone compact-mobile-80, work telephone legacy-work-25, email distributed-email-72, residing at primary-resident-64 with postal code 330, linked to child 3, "Pilot Programme," male, born 2023-02-24, at regional-permanen-30 with postal code 5935. This view supports parent-centric reporting and family management.

**View `vw_parent_enrolment`**

```sql
CREATE VIEW vw_parent_enrolment AS
SELECT a.id, a.full_legal_name, a.relationship_to_child, a.home_telephone, b.enrolment_id AS enrolment_enrolment_id, b.application_date AS enrolment_application_date, b.year_group AS enrolment_year_group
FROM parents a JOIN enrolments b ON a.enrolment_id = b.enrolment_id;
```

| id | full_legal_name | relationship_to_child | home_telephone | enrolment_enrolment_id | enrolment_application_date | enrolment_year_group |
|---|---|---|---|---|---|---|
| 1000 | Integrated Framework A | mother | extended-home-93 | 100 | 2022-05-16T16:24:00 | seasonal-year-35 |
| 1001 | Extended Protocol | father | integrated-home-94 | 101 | 2023-10-27T23:41:00 | regional-year-36 |
| 1002 | Pilot Programme | mother | seasonal-home-95 | 102 | 2024-03-11T06:58:00 | legacy-year-37 |
| 1003 | Baseline Standard D | father | regional-home-96 | 103 | 2025-08-22T13:15:00 | compact-year-38 |

The vw_parent_enrolment view joins the parents table with the enrolments_parents junction table and the enrolments table to present each parent alongside their associated enrolment details. This view answers: "Which enrolments is each parent associated with, and what are the enrolment statuses?" A representative row would show parent 1000, "Integrated Framework A," mother, with home telephone extended-home-93, mobile telephone regional-mobile-78, work telephone seasonal-work-23, email primary-email-70, residing at compact-resident-62 with postal code 2618581, linked to enrolment 100, which has status pending, year group seasonal-year-35, application date 2022-05-16, and is associated with school 100. Another row might show parent 1003, "Baseline Standard D," father, with home telephone regional-home-96, mobile telephone composite-mobile-81, work telephone compact-work-26, email baseline-email-73, residing at adaptive-resident-65 with postal code 790474, linked to enrolment 103, which has status refused, year group compact-year-38, application date 2025-08-22, and is associated with school 103. This view is essential for tracking parental involvement across the enrolment lifecycle.

The enrolment ecosystem described here demonstrates how educational institutions manage the complex relationships between children, parents, and schools. The base tables store the fundamental records — schools with their contact details, children with their demographics, parents with their guardianship information, and enrolments with their application and admission data. The junction tables, schools_enrolments and enrolments_parents, introduce many-to-many relationships that allow for flexible associations beyond simple one-to-one mappings. The views synthesize these base tables into operational reports that answer specific questions: which enrolments is a school tracking, which child is associated with an enrolment, which parents can be contacted for a given enrolment, and so on. Together, these tables and views form a comprehensive data model that supports the full lifecycle of educational enrolment, from application through admission and beyond.