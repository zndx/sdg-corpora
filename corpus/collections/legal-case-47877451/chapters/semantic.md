The legal domain under examination captures the full lifecycle of judicial proceedings: cases are filed, persons assume defined roles within them, judgments are rendered citing statutory authority, professional bodies regulate the practitioners involved, and scholarly publications document the intersections of people and cases. The relational schema normalises these concepts into seven base tables and fourteen derived views, each view materialising a specific domain fact by joining the normalised pieces back together. Understanding the model requires tracing how entity types, their attributes, and their cardinality-bounded relationships become columns, foreign keys, and junction tables — and how the views reconstruct the original domain narrative.

## The base tables and their entity types

The schema centres on six entity tables and one junction table. The `legal_cases` table stores the case-level facts. Its primary key `id` is an integer surrogate; the business identifier `case_identifier` carries values such as `CAS-2099` and `CAS-2103`. The case is further described by `court_name` (e.g. `Baseline Series D`, `Distributed Assessment`), `case_type` (one of `Criminal`, `Civil`, `Family`, `Inquest`), `year_filed` (an integer ranging from 9 to 36 in the sample), `status` (`Pending`, `Active`, `Closed`, `Appealed`), `judgment_date` (an `xsd:date` such as `2022-09-26`), and `citation` (a string like `legacy-citation-79`). A foreign key column `judgment_id` links each case to exactly one row in the `judgments` table, enforcing a one-to-one relationship between a case and its judgment.

**Table `legal_cases`**

| id | case_identifier | court_name | case_type | year_filed | status | judgment_date | citation | judgment_id |
|---|---|---|---|---|---|---|---|---|
| 100 | CAS-2099 | Baseline Series D | Criminal | 9 | Pending | 2022-09-26 | legacy-citation-79 | 1 |
| 101 | CAS-2100 | Distributed Assessment | Civil | 18 | Active | 2023-02-10 | compact-citation-80 | 2 |
| 102 | CAS-2101 | Adaptive Survey | Family | 27 | Closed | 2024-07-21 | composite-citation-81 | 3 |
| 103 | CAS-2102 | Primary Corridor A | Inquest | 36 | Appealed | 2025-12-05 | primary-citation-82 | 4 |

The `judgments` table holds the outcome of each case. Its surrogate primary key `id` is an integer, while the business identifier `judgment_id` carries values such as `9568457` and `ChIJt4hBkzhu5kcRJJDUNqGUpso`. The columns `ruling_type` (`Guilty`, `Not Guilty`, `Dismissed`, `Sentenced`), `sentence_length` (a decimal, e.g. `0.56`), `fine_amount` (a decimal, e.g. `29.99`), `legal_reasoning` (a string such as `seasonal-legal-71`), and `appeal_status` (`None`, `Pending`, `Granted`, `Denied`) capture the substantive outcome. Two foreign keys anchor the judgment: `legal_case_id` references `legal_cases.id`, and `legal_statute_id` references `legal_statutes.id`, thereby binding the judgment to both the originating case and the statutory provision it applies.

**Table `judgments`**

| id | judgment_id | ruling_type | sentence_length | fine_amount | legal_reasoning | appeal_status | legal_case_id | legal_statute_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9568457 | Guilty | 0.56 | 29.99 | seasonal-legal-71 | None | 100 | 1 |
| 2 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Not Guilty | 0.58 | 16.11 | regional-legal-72 | Pending | 101 | 2 |
| 3 | 9736893 | Dismissed | 0.6000001 | 32.21 | legacy-legal-73 | Granted | 102 | 3 |
| 4 | 8189480 | Sentenced | 0.6 | 35.45 | compact-legal-74 | Denied | 103 | 4 |

The `legal_statutes` table models legislative provisions. Its surrogate key `id` is an integer; the business identifier `statute_id` carries values such as `3744010` and `10238287`. The columns `title` (`Compact Initiative`, `Legacy Model`, `Regional Cluster A`, `Seasonal Review`), `enactment_year` (integers 27–42), `jurisdiction` (e.g. `regional-jurisdic-30`), `section_number` (e.g. `SEC-2472`), and `status` (`Active`, `Amended`, `Repealed`) describe the statute. The table contains two self-referencing foreign keys: `legal_statute_id` (which in the sample mirrors the surrogate key and can serve as a version or lineage pointer) and `is_amended_by_legal_statute_id`, which points to another row in `legal_statutes` to express amendment relationships. This self-FK enables a statute to reference the statute that amended it, forming a chain of legislative evolution.

**Table `legal_statutes`**

| id | statute_id | title | enactment_year | jurisdiction | section_number | status | legal_statute_id | is_amended_by_legal_statute_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 3744010 | Compact Initiative | 27 | regional-jurisdic-30 | SEC-2472 | Active | 1 | 1 |
| 2 | 10238287 | Legacy Model | 32 | legacy-jurisdic-31 | SEC-2477 | Amended | 2 | 2 |
| 3 | 6926373 | Regional Cluster A | 37 | compact-jurisdic-32 | SEC-2482 | Repealed | 3 | 3 |
| 4 | 4364 | Seasonal Review | 42 | composite-jurisdic-33 | SEC-2487 | Active | 4 | 4 |

The `legal_persons` table stores individuals and their roles in the legal process. Its surrogate primary key is `legal_person_id`; the business identifier `person_id` carries values such as `George Bernard Shaw` and `Maria Rodriguez`. The column `full_name` holds display names like `Theodore Mcgrath` and `Account Name`. The `role` column enumerates the person's function (`Barrister`, `Judge`, `Defendant`, `Prosecutor`). The `jurisdiction` column (e.g. `regional-jurisdic-30`) and `qualification_year` (integers 7–16) describe professional standing, while `specialization` (e.g. `legacy-speciali-13`) captures the area of expertise. Three foreign keys are present: `legal_case_id` and `judges_legal_case_id` both reference `legal_cases.id`, allowing a person to be associated with a case in a general capacity and, separately, to be designated as the presiding judge; `professional_body_id` references `professional_bodies.id`, linking the person to their regulatory body.

**Table `legal_persons`**

| legal_person_id | person_id | full_name | role | jurisdiction | qualification_year | specialization | legal_case_id | judges_legal_case_id | professional_body_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Theodore Mcgrath | Barrister | regional-jurisdic-30 | 7 | legacy-speciali-13 | 100 | 100 | 100 |
| 2 | Maria Rodriguez | Account Name | Judge | legacy-jurisdic-31 | 10 | compact-speciali-14 | 101 | 101 | 101 |
| 3 | Sarah Villanueva | Saipan International Airport | Defendant | compact-jurisdic-32 | 13 | composite-speciali-15 | 102 | 102 | 102 |
| 4 | Susan Wagner | Norma Fisher | Prosecutor | composite-jurisdic-33 | 16 | primary-speciali-16 | 103 | 103 | 103 |

The `professional_bodies` table models the regulatory organisations. Its surrogate key `id` is an integer; the business identifier `body_id` carries values such as `6564383` and `168556`. The columns `name` (`Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`), `founding_year` (integers 43–58), `jurisdiction` (e.g. `regional-jurisdic-30`), and `membership_type` (`Full`, `Associate`, `Honorary`) describe the body. The foreign key `legal_person_id` references `legal_persons.legal_person_id`, establishing a one-to-many relationship: each professional body is associated with one legal person in this schema, while a legal person can belong to one body. Timestamps `created_at` and `updated_at` (e.g. `2025-01-01 00:14:00`) record the lifecycle of the body record.

**Table `professional_bodies`**

| id | body_id | name | founding_year | jurisdiction | membership_type | legal_person_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 100 | 6564383 | Extended Review | 43 | regional-jurisdic-30 | Full | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 168556 | Pilot Initiative A | 48 | legacy-jurisdic-31 | Associate | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | strategic | Baseline Model | 53 | compact-jurisdic-32 | Honorary | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 195361 | Distributed Cluster | 58 | composite-jurisdic-33 | Full | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `legal_publications` table captures scholarly and professional publications. Its surrogate key `id` is an integer; the business identifier `pub_id` carries UUIDs such as `3e9db04c-8fcd-11eb-924d-9cd76263cbd0` and `5082977`. The columns `title` (`Compact Initiative`, `Legacy Model`, `Regional Cluster A`, `Seasonal Review`), `publication_date` (e.g. `2025-12-01`), `publisher` (e.g. `pilot-publishe-50`), `journal_name` (`Extended Standard`, `Pilot Framework A`), and `topic` (`distributed-topic-60`) describe the publication. Two foreign keys anchor the publication: `legal_person_id` references `legal_persons.legal_person_id`, and `legal_case_id` references `legal_cases.id`, allowing a publication to be attributed to a person and to be about a specific case.

**Table `legal_publications`**

| id | pub_id | title | publication_date | publisher | journal_name | topic | legal_person_id | legal_case_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 3e9db04c-8fcd-11eb-924d-9cd76263cbd0 | Compact Initiative | 2025-12-01 | pilot-publishe-50 | Extended Standard | distributed-topic-60 | 1 | 100 |
| 2 | 5082977 | Legacy Model | 2022-05-12 | extended-publishe-51 | Pilot Framework A | baseline-topic-61 | 2 | 101 |
| 3 | 884359 | Regional Cluster A | 2023-10-23 | integrated-publishe-52 | Baseline Protocol | pilot-topic-62 | 3 | 102 |
| 4 | 727047 | Seasonal Review | 2024-03-07 | seasonal-publishe-53 | Distributed Programme | extended-topic-63 | 4 | 103 |

The junction table `cases_persons` resolves the many-to-many relationship between `legal_cases` and `legal_persons`. In a fully normalised design this table would contain at least two foreign key columns — one referencing `legal_cases.id` and one referencing `legal_persons.legal_person_id` — enabling any case to involve multiple persons and any person to participate in multiple cases. The existence of this table is confirmed by the views that join through it, and by the fact that `legal_persons` already carries `legal_case_id` and `judges_legal_case_id` as direct foreign keys, suggesting that the junction table provides an additional, possibly more flexible, association layer for cases that involve persons in capacities not covered by the direct columns.

**Table `cases_persons`**

| legal_case_id | legal_person_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

## How the views reconstruct domain facts

Each view is a named join that answers a specific question by pulling together columns from two or more base tables. The views fall into three categories: case-centric, person-centric, judgment-centric, and statute-centric.

The view `legal_case_legal_person_detail_view` answers the question: *which persons are associated with which cases, and what are their details?* It joins `legal_cases` with `legal_persons` — either directly through the `legal_case_id` foreign key in `legal_persons`, or through the `cases_persons` junction table — and produces a denormalised row that contains both case attributes (e.g. `CAS-2099`, `Baseline Series D`, `Criminal`) and person attributes (e.g. `Theodore Mcgrath`, `Barrister`, `regional-jurisdic-30`). Reading the first row of this view, one sees that case `CAS-2099` in the `Baseline Series D` court, of type `Criminal` filed in year 9 with status `Pending`, is associated with person `Theodore Mcgrath` who holds the role of `Barrister` in jurisdiction `regional-jurisdic-30`. This view is the primary interface for case-person queries.

**View `legal_case_legal_person_detail_view`**

```sql
CREATE VIEW legal_case_legal_person_detail_view AS
SELECT a.id, a.case_identifier, a.court_name, b.legal_person_id AS person_legal_person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM legal_cases a
  JOIN cases_persons j ON j.legal_case_id = a.id
  JOIN legal_persons b ON b.legal_person_id = j.legal_person_id;
```

| id | case_identifier | court_name | person_legal_person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|
| 100 | CAS-2099 | Baseline Series D | 1 | George Bernard Shaw | Theodore Mcgrath |
| 100 | CAS-2099 | Baseline Series D | 2 | Maria Rodriguez | Account Name |
| 101 | CAS-2100 | Distributed Assessment | 2 | Maria Rodriguez | Account Name |
| 101 | CAS-2100 | Distributed Assessment | 3 | Sarah Villanueva | Saipan International Airport |
| 102 | CAS-2101 | Adaptive Survey | 3 | Sarah Villanueva | Saipan International Airport |
| 102 | CAS-2101 | Adaptive Survey | 4 | Susan Wagner | Norma Fisher |
| 103 | CAS-2102 | Primary Corridor A | 4 | Susan Wagner | Norma Fisher |
| 103 | CAS-2102 | Primary Corridor A | 1 | George Bernard Shaw | Theodore Mcgrath |

The view `legal_case_judgment_view` answers: *what judgment was rendered for each case?* It joins `legal_cases` with `judgments` on `legal_cases.judgment_id = judgments.id` (or equivalently on `legal_cases.id = judgments.legal_case_id`). The resulting row for case `CAS-2099` shows `ruling_type = Guilty`, `sentence_length = 0.56`, `fine_amount = 29.99`, `legal_reasoning = seasonal-legal-71`, and `appeal_status = None`. The second row, for case `CAS-2100`, shows `ruling_type = Not Guilty` with `appeal_status = Pending`. This view collapses the case-judgment one-to-one relationship into a single row, making it trivial to query case outcomes.

**View `legal_case_judgment_view`**

```sql
CREATE VIEW legal_case_judgment_view AS
SELECT a.id, a.case_identifier, a.court_name, a.case_type, b.id AS judgment_id, b.judgment_id AS judgment_judgment_id, b.ruling_type AS judgment_ruling_type
FROM legal_cases a JOIN judgments b ON a.judgment_id = b.id;
```

| id | case_identifier | court_name | case_type | judgment_id | judgment_judgment_id | judgment_ruling_type |
|---|---|---|---|---|---|---|
| 100 | CAS-2099 | Baseline Series D | Criminal | 1 | 9568457 | Guilty |
| 101 | CAS-2100 | Distributed Assessment | Civil | 2 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Not Guilty |
| 102 | CAS-2101 | Adaptive Survey | Family | 3 | 9736893 | Dismissed |
| 103 | CAS-2102 | Primary Corridor A | Inquest | 4 | 8189480 | Sentenced |

The view `legal_person_legal_case_view` is the inverse of the case-person view: it answers *which cases is a given person involved in?* It joins `legal_persons` with `legal_cases` through the `legal_case_id` foreign key (and potentially the `cases_persons` junction). The first row shows person `George Bernard Shaw` (full name `Theodore Mcgrath`, role `Barrister`) associated with case `CAS-2099` in court `Baseline Series D`. The third row shows person `Sarah Villanueva` (full name `Saipan International Airport`, role `Defendant`) associated with case `CAS-2101` in court `Adaptive Survey`. This view is useful for person-centric queries, such as listing all cases a barrister has participated in.

**View `legal_person_legal_case_view`**

```sql
CREATE VIEW legal_person_legal_case_view AS
SELECT a.legal_person_id, a.person_id, a.full_name, a.role, b.id AS case_id, b.case_identifier AS case_case_identifier, b.court_name AS case_court_name
FROM legal_persons a JOIN legal_cases b ON a.legal_case_id = b.id;
```

| legal_person_id | person_id | full_name | role | case_id | case_case_identifier | case_court_name |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Theodore Mcgrath | Barrister | 100 | CAS-2099 | Baseline Series D |
| 2 | Maria Rodriguez | Account Name | Judge | 101 | CAS-2100 | Distributed Assessment |
| 3 | Sarah Villanueva | Saipan International Airport | Defendant | 102 | CAS-2101 | Adaptive Survey |
| 4 | Susan Wagner | Norma Fisher | Prosecutor | 103 | CAS-2102 | Primary Corridor A |

The view `legal_person_professional_body_view` answers: *which professional body does a legal person belong to?* It joins `legal_persons` with `professional_bodies` on `legal_persons.professional_body_id = professional_bodies.id`. The first row shows person `George Bernard Shaw` (role `Barrister`) belonging to body `Extended Review` (body_id `6564383`), founded in year 43, with membership type `Full`. The third row shows person `Sarah Villanueva` (role `Defendant`) belonging to body `Baseline Model` (body_id `strategic`), founded in year 53, with membership type `Honorary`. This view materialises the person-to-body relationship as a flat record.

**View `legal_person_professional_body_view`**

```sql
CREATE VIEW legal_person_professional_body_view AS
SELECT a.legal_person_id, a.person_id, a.full_name, a.role, b.id AS body_id, b.body_id AS body_body_id, b.name AS body_name
FROM legal_persons a JOIN professional_bodies b ON a.professional_body_id = b.id;
```

| legal_person_id | person_id | full_name | role | body_id | body_body_id | body_name |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Theodore Mcgrath | Barrister | 100 | 6564383 | Extended Review |
| 2 | Maria Rodriguez | Account Name | Judge | 101 | 168556 | Pilot Initiative A |
| 3 | Sarah Villanueva | Saipan International Airport | Defendant | 102 | strategic | Baseline Model |
| 4 | Susan Wagner | Norma Fisher | Prosecutor | 103 | 195361 | Distributed Cluster |

The view `judgment_legal_case_view` answers: *for each judgment, which case does it belong to?* It joins `judgments` with `legal_cases` on `judgments.legal_case_id = legal_cases.id`. The first row shows judgment `9568457` with `ruling_type = Guilty` belonging to case `CAS-2099` in court `Baseline Series D`. The second row shows judgment `ChIJt4hBkzhu5kcRJJDUNqGUpso` with `ruling_type = Not Guilty` belonging to case `CAS-2100` in court `Distributed Assessment`. This view is the judgment-centric counterpart to `legal_case_judgment_view`, useful when queries originate from the judgment side.

**View `judgment_legal_case_view`**

```sql
CREATE VIEW judgment_legal_case_view AS
SELECT a.id, a.judgment_id, a.ruling_type, a.sentence_length, b.id AS case_id, b.case_identifier AS case_case_identifier, b.court_name AS case_court_name
FROM judgments a JOIN legal_cases b ON a.legal_case_id = b.id;
```

| id | judgment_id | ruling_type | sentence_length | case_id | case_case_identifier | case_court_name |
|---|---|---|---|---|---|---|
| 1 | 9568457 | Guilty | 0.56 | 100 | CAS-2099 | Baseline Series D |
| 2 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Not Guilty | 0.58 | 101 | CAS-2100 | Distributed Assessment |
| 3 | 9736893 | Dismissed | 0.6000001 | 102 | CAS-2101 | Adaptive Survey |
| 4 | 8189480 | Sentenced | 0.6 | 103 | CAS-2102 | Primary Corridor A |

The view `judgment_legal_statute_view` answers: *which statute does a judgment apply?* It joins `judgments` with `legal_statutes` on `judgments.legal_statute_id = legal_statutes.id`. The first row shows judgment `9568457` (ruling `Guilty`) applying statute `3744010` titled `Compact Initiative`, enacted in year 27, section `SEC-2472`, with status `Active`. The third row shows judgment `9736893` (ruling `Dismissed`) applying statute `6926373` titled `Regional Cluster A`, enacted in year 37, section `SEC-2482`, with status `Repealed`. This view is critical for statutory analysis, enabling queries such as "which judgments cite a repealed statute?"

**View `judgment_legal_statute_view`**

```sql
CREATE VIEW judgment_legal_statute_view AS
SELECT a.id, a.judgment_id, a.ruling_type, a.sentence_length, b.id AS statute_id, b.statute_id AS statute_statute_id, b.title AS statute_title
FROM judgments a JOIN legal_statutes b ON a.legal_statute_id = b.id;
```

| id | judgment_id | ruling_type | sentence_length | statute_id | statute_statute_id | statute_title |
|---|---|---|---|---|---|---|
| 1 | 9568457 | Guilty | 0.56 | 1 | 3744010 | Compact Initiative |
| 2 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Not Guilty | 0.58 | 2 | 10238287 | Legacy Model |
| 3 | 9736893 | Dismissed | 0.6000001 | 3 | 6926373 | Regional Cluster A |
| 4 | 8189480 | Sentenced | 0.6 | 4 | 4364 | Seasonal Review |

The view `legal_statute_legal_statute_view` answers: *which statute amends which other statute?* It performs a self-join on `legal_statutes` using the `is_amended_by_legal_statute_id` foreign key. In the sample data, each statute's `is_amended_by_legal_statute_id` mirrors its own `id`, indicating that the sample does not exercise the amendment chain — but the view structure is in place to support it. If statute 2 had `is_amended_by_legal_statute_id = 1`, the view would produce a row linking `Legacy Model` (statute 2) to `Compact Initiative` (statute 1), showing that the former was amended by the latter. This view materialises the legislative evolution graph.

**View `legal_statute_legal_statute_view`**

```sql
CREATE VIEW legal_statute_legal_statute_view AS
SELECT a.id, a.statute_id, a.title, a.enactment_year, b.id AS statute_id, b.statute_id AS statute_statute_id, b.title AS statute_title
FROM legal_statutes a JOIN legal_statutes b ON a.legal_statute_id = b.id;
```

| id | statute_id | title | enactment_year | statute_id | statute_statute_id | statute_title |
|---|---|---|---|---|---|---|
| 1 | 3744010 | Compact Initiative | 27 | 1 | 3744010 | Compact Initiative |
| 2 | 10238287 | Legacy Model | 32 | 2 | 10238287 | Legacy Model |
| 3 | 6926373 | Regional Cluster A | 37 | 3 | 6926373 | Regional Cluster A |
| 4 | 4364 | Seasonal Review | 42 | 4 | 4364 | Seasonal Review |

The view `professional_body_legal_person_view` is the inverse of `legal_person_professional_body_view`: it answers *which persons belong to a given professional body?* It joins `professional_bodies` with `legal_persons` on `professional_bodies.id = legal_persons.professional_body_id`. The first row shows body `Extended Review` (body_id `6564383`, membership type `Full`) with person `George Bernard Shaw` (role `Barrister`). The fourth row shows body `Distributed Cluster` (body_id `195361`, membership type `Full`) with person `Susan Wagner` (role `Prosecutor`). This view is useful for body-centric queries, such as listing all members of a regulatory organisation.

**View `professional_body_legal_person_view`**

```sql
CREATE VIEW professional_body_legal_person_view AS
SELECT a.id, a.body_id, a.name, a.founding_year, b.legal_person_id AS person_legal_person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM professional_bodies a JOIN legal_persons b ON a.legal_person_id = b.legal_person_id;
```

| id | body_id | name | founding_year | person_legal_person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|---|
| 100 | 6564383 | Extended Review | 43 | 1 | George Bernard Shaw | Theodore Mcgrath |
| 101 | 168556 | Pilot Initiative A | 48 | 2 | Maria Rodriguez | Account Name |
| 102 | strategic | Baseline Model | 53 | 3 | Sarah Villanueva | Saipan International Airport |
| 103 | 195361 | Distributed Cluster | 58 | 4 | Susan Wagner | Norma Fisher |

The view `legal_publication_legal_person_view` answers: *which publications has a given person authored or contributed to?* It joins `legal_publications` with `legal_persons` on `legal_publications.legal_person_id = legal_persons.legal_person_id`. The first row shows publication `3e9db04c-8fcd-11eb-924d-9cd76263cbd0` titled `Compact Initiative`, published on `2025-12-01` in journal `Extended Standard` by publisher `pilot-publishe-50`, attributed to person `George Bernard Shaw` (role `Barrister`). The second row shows publication `5082977` titled `Legacy Model`, published on `2022-05-12` in journal `Pilot Framework A`, attributed to person `Maria Rodriguez` (role `Judge`). This view supports authorship queries and publication tracking.

**View `legal_publication_legal_person_view`**

```sql
CREATE VIEW legal_publication_legal_person_view AS
SELECT a.id, a.pub_id, a.title, a.publication_date, b.legal_person_id AS person_legal_person_id, b.person_id AS person_person_id, b.full_name AS person_full_name
FROM legal_publications a JOIN legal_persons b ON a.legal_person_id = b.legal_person_id;
```

| id | pub_id | title | publication_date | person_legal_person_id | person_person_id | person_full_name |
|---|---|---|---|---|---|---|
| 1 | 3e9db04c-8fcd-11eb-924d-9cd76263cbd0 | Compact Initiative | 2025-12-01 | 1 | George Bernard Shaw | Theodore Mcgrath |
| 2 | 5082977 | Legacy Model | 2022-05-12 | 2 | Maria Rodriguez | Account Name |
| 3 | 884359 | Regional Cluster A | 2023-10-23 | 3 | Sarah Villanueva | Saipan International Airport |
| 4 | 727047 | Seasonal Review | 2024-03-07 | 4 | Susan Wagner | Norma Fisher |

The view `legal_publication_legal_case_view` answers: *which publications are about a given case?* It joins `legal_publications` with `legal_cases` on `legal_publications.legal_case_id = legal_cases.id`. The first row shows publication `3e9db04c-8fcd-11eb-924d-9cd76263cbd0` (topic `distributed-topic-60`) about case `CAS-2099` in court `Baseline Series D`, of type `Criminal`. The fourth row shows publication `727047` (topic `extended-topic-63`) about case `CAS-2102` in court `Primary Corridor A`, of type `Inquest`. This view enables queries such as "which cases have been the subject of published analysis?"

**View `legal_publication_legal_case_view`**

```sql
CREATE VIEW legal_publication_legal_case_view AS
SELECT a.id, a.pub_id, a.title, a.publication_date, b.id AS case_id, b.case_identifier AS case_case_identifier, b.court_name AS case_court_name
FROM legal_publications a JOIN legal_cases b ON a.legal_case_id = b.id;
```

| id | pub_id | title | publication_date | case_id | case_case_identifier | case_court_name |
|---|---|---|---|---|---|---|
| 1 | 3e9db04c-8fcd-11eb-924d-9cd76263cbd0 | Compact Initiative | 2025-12-01 | 100 | CAS-2099 | Baseline Series D |
| 2 | 5082977 | Legacy Model | 2022-05-12 | 101 | CAS-2100 | Distributed Assessment |
| 3 | 884359 | Regional Cluster A | 2023-10-23 | 102 | CAS-2101 | Adaptive Survey |
| 4 | 727047 | Seasonal Review | 2024-03-07 | 103 | CAS-2102 | Primary Corridor A |

## Synthesis

The schema models the legal domain as a set of six entity tables connected by foreign keys and one junction table, with fourteen views that materialise the most common analytical queries. The entity tables capture cases, judgments, statutes, persons, professional bodies, and publications — each with a surrogate primary key and a business identifier. Foreign keys enforce the cardinality-bounded relationships: a case has exactly one judgment, a judgment applies exactly one statute, a person belongs to one professional body, and a publication is attributed to one person and about one case. The junction table `cases_persons` provides the flexibility for many-to-many case-person associations that the direct foreign keys in `legal_persons` do not fully cover. The views reconstruct these relationships into denormalised rows, each answering a specific question — which persons are in which cases, which judgment belongs to which case, which statute a judgment cites, which body a person belongs to, and which publications are about which cases. The self-referencing foreign key in `legal_statutes` and its corresponding view provide the scaffolding for legislative evolution tracking, even if the sample data does not yet exercise it. Together, the base tables and views form a complete, queryable model of the legal domain.