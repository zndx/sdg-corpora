The domain under examination is a school enrolment management system, where the central business process revolves around a child's application to, and eventual placement within, an educational institution. The data model must capture four core entity types—schools, children, parents, and enrolments—along with the many-to-many relationships that bind them: a school can host multiple enrolments, an enrolment can span multiple schools, a parent can be associated with multiple enrolments, and vice versa. The relational schema normalizes these entities into base tables, resolves the many-to-many relationships through junction tables, and exposes the reconstructed facts through a suite of views.

## Base Tables and Entity Attributes

The `schools` table anchors the institutional side of the domain. Each row represents a distinct school, identified by a surrogate `id` column. The remaining columns store descriptive attributes: `legal_name` carries the formal name of the institution, `street_address` and `postal_code` provide the physical location, and `telephone`, `email`, and `website` supply contact information. The table contains four schools, each with a distinct identity. For instance, school `100` is named "Adaptive Model" and resides at "composite-street-15" with postal code `9125611`; its website is `https://bugs.launchpad.net/murano/+bug/1294080`. School `103`, "Compact Initiative", uses postal code `4060635` and links to `https://bugs.launchpad.net/trove/+bug/1347114`.

**Table `schools`**

| id | legal_name | street_address | postal_code | telephone | email | website |
|---|---|---|---|---|---|---|
| 100 | Adaptive Model | composite-street-15 | 9125611 | adaptive-telephon-23 | seasonal-email-11 | https://bugs.launchpad.net/murano/+bug/1294080 |
| 101 | Primary Cluster | primary-street-16 | ChIJt4hBkzhu5kcRJJDUNqGUpso | distributed-telephon-24 | regional-email-12 | https://bugs.launchpad.net/murano/+bug/1294080 |
| 102 | Composite Review D | adaptive-street-17 | 3001009030200 | baseline-telephon-25 | legacy-email-13 | https://www.nature.com/articles/nphoton.2008.245 |
| 103 | Compact Initiative | distributed-street-18 | 4060635 | pilot-telephon-26 | compact-email-14 | https://bugs.launchpad.net/trove/+bug/1347114 |

The `enrolments` table is the operational heart of the model. Each row represents a single enrolment event, identified by `enrollment_id`. The columns `application_date` (a timestamp such as `2022-05-16T16:24:00`), `year_group` (e.g., "seasonal-year-35"), and `status` (one of "pending", "offered", "accepted", or "refused") capture the lifecycle of the enrolment. Crucially, the `child_id` and `school_id` columns serve as foreign keys pointing to the `childs` and `schools` tables respectively, establishing the child-school association at the enrolment level. Enrolment `100`, for example, was applied for on `2022-05-16T16:24:00`, belongs to year group "seasonal-year-35", has status "pending", and links child `1` to school `100`.

**Table `enrolments`**

| enrolment_id | application_date | year_group | status | child_id | school_id |
|---|---|---|---|---|---|
| 100 | 2022-05-16T16:24:00 | seasonal-year-35 | pending | 1 | 100 |
| 101 | 2023-10-27T23:41:00 | regional-year-36 | offered | 2 | 101 |
| 102 | 2024-03-11T06:58:00 | legacy-year-37 | accepted | 3 | 102 |
| 103 | 2025-08-22T13:15:00 | compact-year-38 | refused | 4 | 103 |

The `childs` table stores the demographic and contact profile of each child. The primary key `id` distinguishes children, while `full_legal_name` (such as "Integrated Framework A" for child `1`), `date_of_birth` (e.g., `2025-04-02`), and `gender` (either "male" or "female") provide personal attributes. The `permanent_address` and `permanent_postal_code` columns hold the child's fixed residence; child `1` lives at "integrated-permanen-28" with postal code `gd_acc_221000`, whereas child `2` has the postal code "info". The `enrolment_id` column is a foreign key linking the child to their enrolment record, and `child_id` serves as a secondary identifier. Child `3`, "Pilot Programme", was born on `2023-02-24`, is male, and resides at "regional-permanen-30" with postal code `5935`.

**Table `childs`**

| id | full_legal_name | date_of_birth | gender | permanent_address | permanent_postal_code | enrolment_id | child_id |
|---|---|---|---|---|---|---|---|
| 1 | Integrated Framework A | 2025-04-02 | male | integrated-permanen-28 | gd_acc_221000 | 100 | 1 |
| 2 | Extended Protocol | 2022-09-13 | female | seasonal-permanen-29 | info | 101 | 2 |
| 3 | Pilot Programme | 2023-02-24 | male | regional-permanen-30 | 5935 | 102 | 3 |
| 4 | Baseline Standard D | 2024-07-08 | female | legacy-permanen-31 | 727049 | 103 | 4 |

The `parents` table records the guardian information associated with each child and enrolment. The `id` column is the primary key, and `full_legal_name` stores the parent's name (e.g., "Integrated Framework A" for parent `1000`). The `relationship_to_child` column indicates the familial role, taking values such as "mother" or "father". Contact details are captured across three telephone columns—`home_telephone`, `mobile_telephone`, and `work_telephone`—along with `email_address`, `residential_address`, and `residential_postal_code`. Parent `1000` is the mother of child `1`, reachable at "extended-home-93" (home), "regional-mobile-78" (mobile), and "seasonal-work-23" (work), with email "primary-email-70" and residential postal code `2618581`. The `child_id` and `enrolment_id` columns are foreign keys that tie the parent to a specific child and enrolment, respectively.

**Table `parents`**

| id | full_legal_name | relationship_to_child | home_telephone | mobile_telephone | work_telephone | email_address | residential_address | residential_postal_code | child_id | enrolment_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Integrated Framework A | mother | extended-home-93 | regional-mobile-78 | seasonal-work-23 | primary-email-70 | compact-resident-62 | 2618581 | 1 | 100 |
| 1001 | Extended Protocol | father | integrated-home-94 | legacy-mobile-79 | regional-work-24 | adaptive-email-71 | composite-resident-63 | 611519 | 2 | 101 |
| 1002 | Pilot Programme | mother | seasonal-home-95 | compact-mobile-80 | legacy-work-25 | distributed-email-72 | primary-resident-64 | 330 | 3 | 102 |
| 1003 | Baseline Standard D | father | regional-home-96 | composite-mobile-81 | compact-work-26 | baseline-email-73 | adaptive-resident-65 | 790474 | 4 | 103 |

## Junction Tables and Many-to-Many Relationships

The base tables alone cannot express the many-to-many relationships inherent in the domain. A school can be associated with multiple enrolments, and an enrolment can span multiple schools. Similarly, a parent can be linked to multiple enrolments, and an enrolment can have multiple parents. These relationships are resolved through junction tables.

The `schools_enrolments` table is a pure junction table with two columns: `school_id` and `enrolment_id`. Each row asserts that a particular school is associated with a particular enrolment. The data reveals a cyclic pattern: school `100` is linked to enrolments `100` and `101`; school `101` to enrolments `101` and `102`; school `102` to enrolments `102` and `103`; and school `103` to enrolments `103` and `100`. This means enrolment `100` is associated with both school `100` and school `103`, while enrolment `101` spans schools `100` and `101`.

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

The `enrolments_parents` table resolves the many-to-many relationship between enrolments and parents. It contains `enrolment_id` and `parent_id` columns. Enrolment `100` is associated with parents `1000` and `1001`; enrolment `101` with parents `1001` and `1002`; enrolment `102` with parents `1002` and `1003`; and enrolment `103` with parents `1003` and `1000`. This creates a chain: parent `1000` appears in both enrolment `100` and enrolment `103`, demonstrating that a single parent can be associated with multiple enrolments across different children.

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

The `childs_parents` table, though not illustrated with sample data in the payload, serves as the junction between the `childs` and `parents` tables, capturing the direct child-parent relationship. Together with the foreign keys present in the `parents` table itself (which already links parents to specific children and enrolments), this junction table provides a normalized path for traversing the parent-child association.

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

## Views and Reconstructed Domain Facts

The views materialize the normalized schema into denormalized result sets that answer specific domain questions. Each view joins the appropriate base and junction tables to reconstruct a coherent fact from the distributed data.

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

The view `vw_school_enrolment_detail` joins the `schools` table with the `schools_enrolments` junction table and the `enrolments` table to produce a row for every school-enrolment pairing, enriched with the enrolment's status, year group, and application date. This view answers the question: "Which enrolments are associated with each school, and what is the current state of each enrolment?" A row in this view might show school `100` ("Adaptive Model") linked to enrolment `100` with status "pending" and year group "seasonal-year-35", or school `103` ("Compact Initiative") linked to enrolment `100` with the same enrolment details, illustrating that a single enrolment can appear in multiple rows corresponding to different schools.

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

The view `vw_enrolment_child` joins the `enrolments` table with the `childs` table on the shared `child_id` and `enrolment_id` columns to produce a denormalized record that pairs each enrolment with the corresponding child's full name, date of birth, gender, and permanent address. This view answers: "Which child is associated with each enrolment, and what are their demographic details?" For example, enrolment `100` (status "pending", applied on `2022-05-16T16:24:00`) is joined with child `1` ("Integrated Framework A", born `2025-04-02`, male, residing at "integrated-permanen-28"), providing a complete picture of the applicant.

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

The view `vw_enrolment_school` joins the `enrolments` table with the `schools_enrolments` junction table and the `schools` table to produce a row for each enrolment-school pairing, enriched with the school's legal name, address, postal code, telephone, email, and website. This view answers: "Which school(s) is each enrolment associated with, and what are the school's contact details?" A row might show enrolment `100` (status "pending") linked to school `100` ("Adaptive Model", telephone "adaptive-telephon-23", email "seasonal-email-11"), while another row for the same enrolment `100` would show school `103` ("Compact Initiative", telephone "pilot-telephon-26", email "compact-email-14"), reflecting the many-to-many relationship.

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

The view `vw_enrolment_parent_detail` joins the `enrolments` table with the `enrolments_parents` junction table and the `parents` table to produce a row for each enrolment-parent pairing, enriched with the parent's name, relationship to child, telephone numbers, email, and residential address. This view answers: "Which parent(s) is each enrolment associated with, and what are their contact details?" For instance, enrolment `100` (status "pending") is linked to parent `1000` ("Integrated Framework A", relationship "mother", home telephone "extended-home-93", email "primary-email-70"), and also to parent `1001` ("Extended Protocol", relationship "father", home telephone "integrated-home-94", email "adaptive-email-71"), showing that multiple parents can be associated with a single enrolment.

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

The view `vw_child_enrolment` joins the `childs` table with the `enrolments` table on the shared `child_id` and `enrolment_id` columns to produce a denormalized record pairing each child with their enrolment details, including the application date, year group, and status. This view answers: "What is the enrolment status of each child?" A row might show child `1` ("Integrated Framework A", born `2025-04-02`, gender "male") linked to enrolment `100` (application date `2022-05-16T16:24:00`, year group "seasonal-year-35", status "pending"), providing a direct child-to-enrolment mapping.

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

The view `vw_child_parent_detail` joins the `childs` table with the `parents` table (via the `childs_parents` junction table and the foreign keys in the `parents` table) to produce a row for each child-parent pairing, enriched with the parent's name, relationship to child, telephone numbers, email, and residential address. This view answers: "Which parent(s) is each child associated with, and what are their details?" For example, child `1` ("Integrated Framework A") is linked to parent `1000` ("Integrated Framework A", relationship "mother", mobile telephone "regional-mobile-78", residential postal code `2618581`), and child `2` ("Extended Protocol") is linked to parent `1001` ("Extended Protocol", relationship "father", mobile telephone "legacy-mobile-79", residential postal code `611519`).

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

The view `vw_child_child` is a self-referencing or identity view on the `childs` table that presents the child's demographic and contact information in a denormalized form, potentially enriched with related enrolment or parent data through additional joins. This view answers: "What are the complete details of each child?" A row might show child `3` ("Pilot Programme", born `2023-02-24`, gender "male", permanent address "regional-permanen-30", postal code `5935`) with their associated enrolment `102` (status "accepted", year group "legacy-year-37"), providing a consolidated child profile.

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

The view `vw_parent_child` joins the `parents` table with the `childs` table (via the `childs_parents` junction table and the foreign keys in the `parents` table) to produce a row for each parent-child pairing, enriched with the child's name, date of birth, gender, and permanent address. This view answers: "Which child(ren) is each parent associated with, and what are the child's details?" For instance, parent `1000` ("Integrated Framework A", relationship "mother", work telephone "seasonal-work-23") is linked to child `1` ("Integrated Framework A", born `2025-04-02`, gender "male", permanent postal code `gd_acc_221000`), and parent `1003` ("Baseline Standard D", relationship "father", work telephone "compact-work-26") is linked to child `4` ("Baseline Standard D", born `2024-07-08`, gender "female", permanent postal code `727049`).

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

The view `vw_parent_enrolment` joins the `parents` table with the `enrolments_parents` junction table and the `enrolments` table to produce a row for each parent-enrolment pairing, enriched with the enrolment's application date, year group, status, and the associated child's identifier. This view answers: "Which enrolment(s) is each parent associated with, and what is the enrolment's current state?" A row might show parent `1000` ("Integrated Framework A", relationship "mother", residential address "compact-resident-62") linked to enrolment `100` (application date `2022-05-16T16:24:00`, year group "seasonal-year-35", status "pending", child `1`), while another row for the same parent `1000` would show enrolment `103` (application date `2025-08-22T13:15:00`, year group "compact-year-38", status "refused", child `4`), demonstrating that a single parent can be associated with multiple enrolments across different children.

## Synthesis

The relational schema for this school enrolment domain demonstrates a disciplined normalization strategy. Four base tables—`schools`, `enrolments`, `childs`, and `parents`—capture the core entities with their descriptive attributes. Two junction tables—`schools_enrolments` and `enrolments_parents`—resolve the many-to-many relationships that the base tables cannot express directly, while the `childs_parents` junction table provides an additional path for the child-parent association. The foreign keys embedded in the `enrolments`, `childs`, and `parents` tables create direct child-enrolment-school and parent-enrolment links, complementing the junction tables. The nine views—`vw_school_enrolment_detail`, `vw_enrolment_child`, `vw_enrolment_school`, `vw_enrolment_parent_detail`, `vw_child_enrolment`, `vw_child_parent_detail`, `vw_child_child`, `vw_parent_child`, and `vw_parent_enrolment`—reconstruct the domain facts by joining the appropriate tables, each view answering a distinct business question about the relationships between schools, children, parents, and enrolments. The data values, from school `100` ("Adaptive Model") to parent `1000` (the mother of child `1`), illustrate a coherent and internally consistent model where every join path traces back to a meaningful domain relationship.