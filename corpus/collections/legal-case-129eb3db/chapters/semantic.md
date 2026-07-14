The legal domain under examination captures the lifecycle of judicial proceedings, the actors who populate them, the statutory frameworks that govern them, and the documentary artifacts that record them. At its core, a legal case is a discrete event: it is filed in a named court, assigned a type such as Criminal or Civil, and tracked through statuses like Pending, Active, Closed, or Appealed. Each case is anchored to a legal person—a barrister, judge, defendant, or prosecutor—whose professional identity is further qualified by a bar circuit, a specialization, and an affiliation with a professional body. The outcome of a case is itself a first-class entity, carrying an outcome type (Sentence, Ruling, Finding, Dismissal), a date of issuance, and sentencing details including a sentence length and a fine amount. Statutes provide the legal authority behind each outcome, and legal documents—articles, reports, submissions, and policy papers—serve as the evidentiary and administrative record. The relational schema that materializes this domain normalizes every concept into its own table, uses foreign keys to bind them into coherent case narratives, and exposes the reconstructed facts through a family of views.

## The Base Tables

The schema begins with six base tables that encode the domain's core entity types. Each table is identified by a surrogate primary key and enriched with descriptive attributes that capture the legal reality the row represents.

**Table `legal_cases`**

| legal_case_id | case_identifier | court_name | case_type | date_filed | status | jurisdiction | legal_person_id | has_prosecutor_legal_person_id | legal_outcome_id | legal_statute_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | CAS-2099 | Baseline Series D | Criminal | 2024-03-14T02:54:00 | Pending | regional-jurisdic-30 | 100 | 100 | 1 | 1 |
| 2 | CAS-2100 | Distributed Assessment | Civil | 2025-08-25T09:11:00 | Active | legacy-jurisdic-31 | 101 | 101 | 2 | 2 |
| 3 | CAS-2101 | Adaptive Survey | Family | 2022-01-09T16:28:00 | Closed | compact-jurisdic-32 | 102 | 102 | 3 | 3 |
| 4 | CAS-2102 | Primary Corridor A | Inquest | 2023-06-20T23:45:00 | Appealed | composite-jurisdic-33 | 103 | 103 | 4 | 4 |

The `legal_cases` table is the central fact table of the domain. Its primary key, `legal_case_id`, is a sequential integer (1 through 4 in the sample data), while the business-facing `case_identifier` column carries human-readable codes such as `CAS-2099` and `CAS-2100`. The `court_name` column distinguishes venues like "Baseline Series D" and "Distributed Assessment," and `case_type` classifies the matter as Criminal, Civil, Family, or Inquest. The `date_filed` column stores an ISO-8601 timestamp (e.g., `2024-03-14T02:54:00`), `status` tracks the procedural posture, and `jurisdiction` identifies the governing legal territory with values such as `regional-jurisdic-30` and `legacy-jurisdic-31`. Crucially, `legal_cases` carries four foreign keys that bind it to the rest of the schema: `legal_person_id` references the primary legal person involved in the case, `has_prosecutor_legal_person_id` references the prosecutor (which may be the same person, as in row 1 where both are `100`), `legal_outcome_id` points to the outcome record, and `legal_statute_id` points to the governing statute.

**Table `legal_persons`**

| legal_person_id | full_name | role | qualification | bar_circuit | specialization | legal_case_id | professional_body_id |
|---|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | Barrister | legacy-qualific-37 | Western Circuit | Inquests | 1 | 1000 |
| 101 | Account Name | Judge | compact-qualific-38 | London Bar | Professional Discipline | 2 | 1001 |
| 102 | Saipan International Airport | Defendant | composite-qualific-39 | Western Circuit | Maritime Law | 3 | 1002 |
| 103 | Norma Fisher | Prosecutor | primary-qualific-40 | London Bar | Family Law | 4 | 1003 |

Legal persons—whether individuals or organizations—are stored in `legal_persons`. The primary key `legal_person_id` is a four-digit integer (100–103 in the sample), and `full_name` carries the entity's name, ranging from "Theodore Mcgrath" to the fictional "Saipan International Airport." The `role` column distinguishes the person's function in the case (Barrister, Judge, Defendant, Prosecutor), while `qualification` stores a code such as `legacy-qualific-37`. The `bar_circuit` column identifies the professional circuit (Western Circuit or London Bar), and `specialization` captures the area of law (Inquests, Professional Discipline, Maritime Law, Family Law). Two foreign keys anchor the person to the broader schema: `legal_case_id` links the person to the case they are associated with, and `professional_body_id` links them to their regulatory body.

**Table `legal_outcomes`**

| legal_outcome_id | outcome_type | date_issued | sentence_length | fine_amount | is_appealed | legal_case_id | legal_statute_id |
|---|---|---|---|---|---|---|---|
| 1 | Sentence | 2023-10-10T09:39:00 | 27 | 29.99 | false | 1 | 1 |
| 2 | Ruling | 2024-03-21T16:56:00 | 32 | 16.11 | true | 2 | 2 |
| 3 | Finding | 2025-08-05T23:13:00 | 37 | 32.21 | false | 3 | 3 |
| 4 | Dismissal | 2022-01-16T06:30:00 | 42 | 35.45 | true | 4 | 4 |

Outcomes are first-class entities in `legal_outcomes`. The primary key `legal_outcome_id` is a sequential integer, and `outcome_type` records the nature of the disposition—Sentence, Ruling, Finding, or Dismissal. The `date_issued` column stores when the outcome was rendered, while `sentence_length` and `fine_amount` capture the quantitative sanctions (e.g., a sentence length of `27` and a fine of `29.99` in row 1). The boolean `is_appealed` flag indicates whether the outcome is under appeal. Two foreign keys bind the outcome to its context: `legal_case_id` identifies the case to which the outcome belongs, and `legal_statute_id` identifies the statute under which the outcome was issued.

**Table `legal_statutes`**

| id | statute_name | year_enacted | section_number | jurisdiction | status | legal_case_id | legal_statute_id |
|---|---|---|---|---|---|---|---|
| 1 | Composite Series | 41 | SEC-2472 | England and Wales | Active | 1 | 1 |
| 2 | Compact Assessment A | 44 | SEC-2477 | UK | Amended | 2 | 2 |
| 3 | Legacy Survey | 47 | SEC-2482 | England and Wales | Repealed | 3 | 3 |
| 4 | Regional Corridor | 50 | SEC-2487 | UK | Active | 4 | 4 |

Statutes are stored in `legal_statutes`, whose primary key is `id`. The `statute_name` column carries names such as "Composite Series" and "Compact Assessment A," while `year_enacted` stores the year of enactment (41, 44, 47, 50 in the sample). The `section_number` column provides a section identifier (e.g., `SEC-2472`), `jurisdiction` identifies the applicable territory (England and Wales or UK), and `status` records whether the statute is Active, Amended, or Repealed. The table carries two foreign keys: `legal_case_id` links the statute to a case, and `legal_statute_id` creates a self-referencing relationship, enabling statutes to reference other statutes (as in row 1, where `legal_statute_id` is `1`, pointing to the same row).

**Table `professional_bodies`**

| id | body_name | founding_year | membership_type | focus_area | legal_person_id | legal_document_id |
|---|---|---|---|---|---|---|
| 1000 | Regional Corridor | 43 | Full | Human Rights | 100 | 1 |
| 1001 | Seasonal Series D | 48 | Associate | Health and Safety | 101 | 2 |
| 1002 | Integrated Assessment | 53 | Student | Regulatory Law | 102 | 3 |
| 1003 | Extended Survey | 58 | Full | Human Rights | 103 | 4 |

Professional bodies are regulatory organizations stored in `professional_bodies`. The primary key `id` is a four-digit integer (1000–1003), and `body_name` carries names such as "Regional Corridor" and "Seasonal Series D." The `founding_year` column stores the year the body was established, `membership_type` classifies the type of membership (Full, Associate, Student), and `focus_area` identifies the regulatory domain (Human Rights, Health and Safety, Regulatory Law). Two foreign keys bind the body to the schema: `legal_person_id` links the body to the person it regulates, and `legal_document_id` links it to a document.

**Table `legal_documents`**

| legal_document_id | document_title | publication_date | publisher | document_type | co_author | legal_case_id | legal_statute_id | professional_body_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Compact Series | 2025-12-01T23:33:00 | pilot-publishe-50 | Article | Stephanie Collins | 1 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Legacy Assessment | 2022-05-12T06:50:00 | extended-publishe-51 | Report | Cindy Davis | 2 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Regional Survey A | 2023-10-23T13:07:00 | integrated-publishe-52 | Submission | Jay King | 3 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Seasonal Corridor | 2024-03-07T20:24:00 | seasonal-publishe-53 | Policy Paper | Rachel Smith | 4 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Legal documents are the documentary artifacts of the domain, stored in `legal_documents`. The primary key `legal_document_id` is a sequential integer, and `document_title` carries titles such as "Compact Series" and "Legacy Assessment." The `publication_date` column stores when the document was published, `publisher` identifies the publishing entity (e.g., `pilot-publishe-50`), and `document_type` classifies the document as Article, Report, Submission, or Policy Paper. The `co_author` column names a co-author (Stephanie Collins, Cindy Davis, Jay King, Rachel Smith). Three foreign keys bind the document to the schema: `legal_case_id` links it to a case, `legal_statute_id` links it to a statute, and `professional_body_id` links it to a professional body. The `created_at` and `updated_at` columns provide audit timestamps.

## The Foreign-Key Topology

The foreign-key relationships form a directed graph that reconstructs domain facts when traversed. The `legal_cases` table sits at the center: its `legal_person_id` and `has_prosecutor_legal_person_id` columns reference `legal_persons.legal_person_id`, its `legal_outcome_id` references `legal_outcomes.legal_outcome_id`, and its `legal_statute_id` references `legal_statutes.id`. The `legal_persons` table, in turn, references `legal_cases.legal_case_id` (creating a bidirectional link) and `professional_bodies.id`. The `legal_outcomes` table references both `legal_cases.legal_case_id` and `legal_statutes.id`. The `legal_statutes` table references `legal_cases.legal_case_id` and itself via `legal_statute_id`. The `professional_bodies` table references `legal_persons.legal_person_id` and `legal_documents.legal_document_id`. Finally, `legal_documents` references `legal_cases.legal_case_id`, `legal_statutes.id`, and `professional_bodies.id`. This topology ensures that every entity is reachable from every other through at most two hops, and that the views materialize these traversals as flat, queryable results.

## The Views

Each view in the schema is a join that reconstructs a domain fact from the normalized tables. The views come in pairs: one oriented around the "from" side of a relationship and one oriented around the "to" side, enabling bidirectional navigation.

**View `vw_legal_case_legal_person`**

```sql
CREATE VIEW vw_legal_case_legal_person AS
SELECT a.legal_case_id, a.case_identifier, a.court_name, a.case_type, b.legal_person_id AS person_legal_person_id, b.full_name AS person_full_name, b.role AS person_role
FROM legal_cases a JOIN legal_persons b ON a.legal_person_id = b.legal_person_id;
```

| legal_case_id | case_identifier | court_name | case_type | person_legal_person_id | person_full_name | person_role |
|---|---|---|---|---|---|---|
| 1 | CAS-2099 | Baseline Series D | Criminal | 100 | Theodore Mcgrath | Barrister |
| 2 | CAS-2100 | Distributed Assessment | Civil | 101 | Account Name | Judge |
| 3 | CAS-2101 | Adaptive Survey | Family | 102 | Saipan International Airport | Defendant |
| 4 | CAS-2102 | Primary Corridor A | Inquest | 103 | Norma Fisher | Prosecutor |

The view `vw_legal_case_legal_person` joins `legal_cases` to `legal_persons` on `legal_cases.legal_person_id = legal_persons.legal_person_id`, answering the question: "Which legal person is associated with each case?" Reading row 1, the case `CAS-2099` in the "Baseline Series D" court is associated with Theodore Mcgrath, a Barrister on the Western Circuit specializing in Inquests. Row 4 shows that case `CAS-2102` in the "Primary Corridor A" court is associated with Norma Fisher, a Prosecutor on the London Bar specializing in Family Law.

**View `vw_legal_case_legal_outcome`**

```sql
CREATE VIEW vw_legal_case_legal_outcome AS
SELECT a.legal_case_id, a.case_identifier, a.court_name, a.case_type, b.legal_outcome_id AS outcome_legal_outcome_id, b.outcome_type AS outcome_outcome_type, b.date_issued AS outcome_date_issued
FROM legal_cases a JOIN legal_outcomes b ON a.legal_outcome_id = b.legal_outcome_id;
```

| legal_case_id | case_identifier | court_name | case_type | outcome_legal_outcome_id | outcome_outcome_type | outcome_date_issued |
|---|---|---|---|---|---|---|
| 1 | CAS-2099 | Baseline Series D | Criminal | 1 | Sentence | 2023-10-10T09:39:00 |
| 2 | CAS-2100 | Distributed Assessment | Civil | 2 | Ruling | 2024-03-21T16:56:00 |
| 3 | CAS-2101 | Adaptive Survey | Family | 3 | Finding | 2025-08-05T23:13:00 |
| 4 | CAS-2102 | Primary Corridor A | Inquest | 4 | Dismissal | 2022-01-16T06:30:00 |

The view `vw_legal_case_legal_outcome` joins `legal_cases` to `legal_outcomes` on `legal_cases.legal_outcome_id = legal_outcomes.legal_outcome_id`, answering: "What outcome was rendered in each case?" Row 1 shows that case `CAS-2099` resulted in a Sentence issued on `2023-10-10T09:39:00` with a sentence length of `27` and a fine of `29.99`, not appealed. Row 2 shows that case `CAS-2100` resulted in a Ruling issued on `2024-03-21T16:56:00` with a sentence length of `32` and a fine of `16.11`, which is appealed.

**View `vw_legal_case_legal_statute`**

```sql
CREATE VIEW vw_legal_case_legal_statute AS
SELECT a.legal_case_id, a.case_identifier, a.court_name, a.case_type, b.id AS statute_id, b.statute_name AS statute_statute_name, b.year_enacted AS statute_year_enacted
FROM legal_cases a JOIN legal_statutes b ON a.legal_statute_id = b.id;
```

| legal_case_id | case_identifier | court_name | case_type | statute_id | statute_statute_name | statute_year_enacted |
|---|---|---|---|---|---|---|
| 1 | CAS-2099 | Baseline Series D | Criminal | 1 | Composite Series | 41 |
| 2 | CAS-2100 | Distributed Assessment | Civil | 2 | Compact Assessment A | 44 |
| 3 | CAS-2101 | Adaptive Survey | Family | 3 | Legacy Survey | 47 |
| 4 | CAS-2102 | Primary Corridor A | Inquest | 4 | Regional Corridor | 50 |

The view `vw_legal_case_legal_statute` joins `legal_cases` to `legal_statutes` on `legal_cases.legal_statute_id = legal_statutes.id`, answering: "Which statute governs each case?" Row 1 shows that case `CAS-2099` is governed by the "Composite Series" statute (section `SEC-2472`, enacted in year 41, Active status in England and Wales). Row 3 shows that case `CAS-2101` is governed by the "Legacy Survey" statute (section `SEC-2482`, enacted in year 47, Repealed status in England and Wales).

**View `vw_legal_person_legal_case`**

```sql
CREATE VIEW vw_legal_person_legal_case AS
SELECT a.legal_person_id, a.full_name, a.role, a.qualification, b.legal_case_id AS case_legal_case_id, b.case_identifier AS case_case_identifier, b.court_name AS case_court_name
FROM legal_persons a JOIN legal_cases b ON a.legal_case_id = b.legal_case_id;
```

| legal_person_id | full_name | role | qualification | case_legal_case_id | case_case_identifier | case_court_name |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | Barrister | legacy-qualific-37 | 1 | CAS-2099 | Baseline Series D |
| 101 | Account Name | Judge | compact-qualific-38 | 2 | CAS-2100 | Distributed Assessment |
| 102 | Saipan International Airport | Defendant | composite-qualific-39 | 3 | CAS-2101 | Adaptive Survey |
| 103 | Norma Fisher | Prosecutor | primary-qualific-40 | 4 | CAS-2102 | Primary Corridor A |

The view `vw_legal_person_legal_case` joins `legal_persons` to `legal_cases` on `legal_persons.legal_case_id = legal_cases.legal_case_id`, answering: "Which case is each legal person associated with?" Row 1 shows that Theodore Mcgrath (Barrister, Western Circuit, Inquests) is associated with case `CAS-2099` in the "Baseline Series D" court. Row 3 shows that Saipan International Airport (Defendant, Western Circuit, Maritime Law) is associated with case `CAS-2101` in the "Adaptive Survey" court.

**View `vw_legal_person_professional_body`**

```sql
CREATE VIEW vw_legal_person_professional_body AS
SELECT a.legal_person_id, a.full_name, a.role, a.qualification, b.id AS body_id, b.body_name AS body_body_name, b.founding_year AS body_founding_year
FROM legal_persons a JOIN professional_bodies b ON a.professional_body_id = b.id;
```

| legal_person_id | full_name | role | qualification | body_id | body_body_name | body_founding_year |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | Barrister | legacy-qualific-37 | 1000 | Regional Corridor | 43 |
| 101 | Account Name | Judge | compact-qualific-38 | 1001 | Seasonal Series D | 48 |
| 102 | Saipan International Airport | Defendant | composite-qualific-39 | 1002 | Integrated Assessment | 53 |
| 103 | Norma Fisher | Prosecutor | primary-qualific-40 | 1003 | Extended Survey | 58 |

The view `vw_legal_person_professional_body` joins `legal_persons` to `professional_bodies` on `legal_persons.professional_body_id = professional_bodies.id`, answering: "Which professional body regulates each legal person?" Row 1 shows that Theodore Mcgrath is regulated by the "Regional Corridor" body (founded in year 43, Full membership, Human Rights focus). Row 2 shows that Account Name (Judge) is regulated by "Seasonal Series D" (founded in year 48, Associate membership, Health and Safety focus).

**View `vw_legal_outcome_legal_case`**

```sql
CREATE VIEW vw_legal_outcome_legal_case AS
SELECT a.legal_outcome_id, a.outcome_type, a.date_issued, a.sentence_length, b.legal_case_id AS case_legal_case_id, b.case_identifier AS case_case_identifier, b.court_name AS case_court_name
FROM legal_outcomes a JOIN legal_cases b ON a.legal_case_id = b.legal_case_id;
```

| legal_outcome_id | outcome_type | date_issued | sentence_length | case_legal_case_id | case_case_identifier | case_court_name |
|---|---|---|---|---|---|---|
| 1 | Sentence | 2023-10-10T09:39:00 | 27 | 1 | CAS-2099 | Baseline Series D |
| 2 | Ruling | 2024-03-21T16:56:00 | 32 | 2 | CAS-2100 | Distributed Assessment |
| 3 | Finding | 2025-08-05T23:13:00 | 37 | 3 | CAS-2101 | Adaptive Survey |
| 4 | Dismissal | 2022-01-16T06:30:00 | 42 | 4 | CAS-2102 | Primary Corridor A |

The view `vw_legal_outcome_legal_case` joins `legal_outcomes` to `legal_cases` on `legal_outcomes.legal_case_id = legal_cases.legal_case_id`, answering: "Which case produced each outcome?" Row 1 shows that outcome `1` (Sentence) was produced by case `CAS-2099` in the "Baseline Series D" court. Row 4 shows that outcome `4` (Dismissal) was produced by case `CAS-2102` in the "Primary Corridor A" court.

**View `vw_legal_outcome_legal_statute`**

```sql
CREATE VIEW vw_legal_outcome_legal_statute AS
SELECT a.legal_outcome_id, a.outcome_type, a.date_issued, a.sentence_length, b.id AS statute_id, b.statute_name AS statute_statute_name, b.year_enacted AS statute_year_enacted
FROM legal_outcomes a JOIN legal_statutes b ON a.legal_statute_id = b.id;
```

| legal_outcome_id | outcome_type | date_issued | sentence_length | statute_id | statute_statute_name | statute_year_enacted |
|---|---|---|---|---|---|---|
| 1 | Sentence | 2023-10-10T09:39:00 | 27 | 1 | Composite Series | 41 |
| 2 | Ruling | 2024-03-21T16:56:00 | 32 | 2 | Compact Assessment A | 44 |
| 3 | Finding | 2025-08-05T23:13:00 | 37 | 3 | Legacy Survey | 47 |
| 4 | Dismissal | 2022-01-16T06:30:00 | 42 | 4 | Regional Corridor | 50 |

The view `vw_legal_outcome_legal_statute` joins `legal_outcomes` to `legal_statutes` on `legal_outcomes.legal_statute_id = legal_statutes.id`, answering: "Under which statute was each outcome issued?" Row 1 shows that outcome `1` (Sentence) was issued under the "Composite Series" statute (section `SEC-2472`). Row 3 shows that outcome `3` (Finding) was issued under the "Legacy Survey" statute (section `SEC-2482`).

**View `vw_legal_statute_legal_case`**

```sql
CREATE VIEW vw_legal_statute_legal_case AS
SELECT a.id, a.statute_name, a.year_enacted, a.section_number, b.legal_case_id AS case_legal_case_id, b.case_identifier AS case_case_identifier, b.court_name AS case_court_name
FROM legal_statutes a JOIN legal_cases b ON a.legal_case_id = b.legal_case_id;
```

| id | statute_name | year_enacted | section_number | case_legal_case_id | case_case_identifier | case_court_name |
|---|---|---|---|---|---|---|
| 1 | Composite Series | 41 | SEC-2472 | 1 | CAS-2099 | Baseline Series D |
| 2 | Compact Assessment A | 44 | SEC-2477 | 2 | CAS-2100 | Distributed Assessment |
| 3 | Legacy Survey | 47 | SEC-2482 | 3 | CAS-2101 | Adaptive Survey |
| 4 | Regional Corridor | 50 | SEC-2487 | 4 | CAS-2102 | Primary Corridor A |

The view `vw_legal_statute_legal_case` joins `legal_statutes` to `legal_cases` on `legal_statutes.legal_case_id = legal_cases.legal_case_id`, answering: "Which case is each statute associated with?" Row 1 shows that the "Composite Series" statute is associated with case `CAS-2099` in the "Baseline Series D" court. Row 4 shows that the "Regional Corridor" statute is associated with case `CAS-2102` in the "Primary Corridor A" court.

**View `vw_legal_statute_legal_statute`**

```sql
CREATE VIEW vw_legal_statute_legal_statute AS
SELECT a.id, a.statute_name, a.year_enacted, a.section_number, b.id AS statute_id, b.statute_name AS statute_statute_name, b.year_enacted AS statute_year_enacted
FROM legal_statutes a JOIN legal_statutes b ON a.legal_statute_id = b.id;
```

| id | statute_name | year_enacted | section_number | statute_id | statute_statute_name | statute_year_enacted |
|---|---|---|---|---|---|---|
| 1 | Composite Series | 41 | SEC-2472 | 1 | Composite Series | 41 |
| 2 | Compact Assessment A | 44 | SEC-2477 | 2 | Compact Assessment A | 44 |
| 3 | Legacy Survey | 47 | SEC-2482 | 3 | Legacy Survey | 47 |
| 4 | Regional Corridor | 50 | SEC-2487 | 4 | Regional Corridor | 50 |

The view `vw_legal_statute_legal_statute` performs a self-join on `legal_statutes` using the `legal_statute_id` foreign key, answering: "Which statute references which other statute?" In the sample data, each row references itself (row 1 references statute `1`, row 2 references statute `2`, etc.), indicating that the self-referencing column is used to create a reflexive link. This pattern supports future extensions where a statute might reference a predecessor or a related provision.

**View `vw_professional_body_legal_person`**

```sql
CREATE VIEW vw_professional_body_legal_person AS
SELECT a.id, a.body_name, a.founding_year, a.membership_type, b.legal_person_id AS person_legal_person_id, b.full_name AS person_full_name, b.role AS person_role
FROM professional_bodies a JOIN legal_persons b ON a.legal_person_id = b.legal_person_id;
```

| id | body_name | founding_year | membership_type | person_legal_person_id | person_full_name | person_role |
|---|---|---|---|---|---|---|
| 1000 | Regional Corridor | 43 | Full | 100 | Theodore Mcgrath | Barrister |
| 1001 | Seasonal Series D | 48 | Associate | 101 | Account Name | Judge |
| 1002 | Integrated Assessment | 53 | Student | 102 | Saipan International Airport | Defendant |
| 1003 | Extended Survey | 58 | Full | 103 | Norma Fisher | Prosecutor |

The view `vw_professional_body_legal_person` joins `professional_bodies` to `legal_persons` on `professional_bodies.legal_person_id = legal_persons.legal_person_id`, answering: "Which legal person is regulated by each professional body?" Row 1 shows that the "Regional Corridor" body regulates Theodore Mcgrath (Barrister, Inquests). Row 4 shows that the "Extended Survey" body regulates Norma Fisher (Prosecutor, Family Law).

**View `vw_professional_body_legal_document`**

```sql
CREATE VIEW vw_professional_body_legal_document AS
SELECT a.id, a.body_name, a.founding_year, a.membership_type, b.legal_document_id AS document_legal_document_id, b.document_title AS document_document_title, b.publication_date AS document_publication_date
FROM professional_bodies a JOIN legal_documents b ON a.legal_document_id = b.legal_document_id;
```

| id | body_name | founding_year | membership_type | document_legal_document_id | document_document_title | document_publication_date |
|---|---|---|---|---|---|---|
| 1000 | Regional Corridor | 43 | Full | 1 | Compact Series | 2025-12-01T23:33:00 |
| 1001 | Seasonal Series D | 48 | Associate | 2 | Legacy Assessment | 2022-05-12T06:50:00 |
| 1002 | Integrated Assessment | 53 | Student | 3 | Regional Survey A | 2023-10-23T13:07:00 |
| 1003 | Extended Survey | 58 | Full | 4 | Seasonal Corridor | 2024-03-07T20:24:00 |

The view `vw_professional_body_legal_document` joins `professional_bodies` to `legal_documents` on `professional_bodies.legal_document_id = legal_documents.legal_document_id`, answering: "Which document is associated with each professional body?" Row 1 shows that the "Regional Corridor" body is associated with the document "Compact Series" (an Article published on `2025-12-01T23:33:00` by `pilot-publishe-50`, co-authored by Stephanie Collins). Row 3 shows that the "Integrated Assessment" body is associated with "Regional Survey A" (a Submission published on `2023-10-23T13:07:00` by `integrated-publishe-52`, co-authored by Jay King).

**View `vw_legal_document_legal_case`**

```sql
CREATE VIEW vw_legal_document_legal_case AS
SELECT a.legal_document_id, a.document_title, a.publication_date, a.publisher, b.legal_case_id AS case_legal_case_id, b.case_identifier AS case_case_identifier, b.court_name AS case_court_name
FROM legal_documents a JOIN legal_cases b ON a.legal_case_id = b.legal_case_id;
```

| legal_document_id | document_title | publication_date | publisher | case_legal_case_id | case_case_identifier | case_court_name |
|---|---|---|---|---|---|---|
| 1 | Compact Series | 2025-12-01T23:33:00 | pilot-publishe-50 | 1 | CAS-2099 | Baseline Series D |
| 2 | Legacy Assessment | 2022-05-12T06:50:00 | extended-publishe-51 | 2 | CAS-2100 | Distributed Assessment |
| 3 | Regional Survey A | 2023-10-23T13:07:00 | integrated-publishe-52 | 3 | CAS-2101 | Adaptive Survey |
| 4 | Seasonal Corridor | 2024-03-07T20:24:00 | seasonal-publishe-53 | 4 | CAS-2102 | Primary Corridor A |

The view `vw_legal_document_legal_case` joins `legal_documents` to `legal_cases` on `legal_documents.legal_case_id = legal_cases.legal_case_id`, answering: "Which case is each document associated with?" Row 1 shows that the document "Compact Series" is associated with case `CAS-2099` in the "Baseline Series D" court. Row 4 shows that the document "Seasonal Corridor" is associated with case `CAS-2102` in the "Primary Corridor A" court.

**View `vw_legal_document_legal_statute`**

```sql
CREATE VIEW vw_legal_document_legal_statute AS
SELECT a.legal_document_id, a.document_title, a.publication_date, a.publisher, b.id AS statute_id, b.statute_name AS statute_statute_name, b.year_enacted AS statute_year_enacted
FROM legal_documents a JOIN legal_statutes b ON a.legal_statute_id = b.id;
```

| legal_document_id | document_title | publication_date | publisher | statute_id | statute_statute_name | statute_year_enacted |
|---|---|---|---|---|---|---|
| 1 | Compact Series | 2025-12-01T23:33:00 | pilot-publishe-50 | 1 | Composite Series | 41 |
| 2 | Legacy Assessment | 2022-05-12T06:50:00 | extended-publishe-51 | 2 | Compact Assessment A | 44 |
| 3 | Regional Survey A | 2023-10-23T13:07:00 | integrated-publishe-52 | 3 | Legacy Survey | 47 |
| 4 | Seasonal Corridor | 2024-03-07T20:24:00 | seasonal-publishe-53 | 4 | Regional Corridor | 50 |

The view `vw_legal_document_legal_statute` joins `legal_documents` to `legal_statutes` on `legal_documents.legal_statute_id = legal_statutes.id`, answering: "Which statute does each document reference?" Row 1 shows that the document "Compact Series" references the "Composite Series" statute (section `SEC-2472`). Row 2 shows that the document "Legacy Assessment" references the "Compact Assessment A" statute (section `SEC-2477`).

**View `vw_legal_document_professional_body`**

```sql
CREATE VIEW vw_legal_document_professional_body AS
SELECT a.legal_document_id, a.document_title, a.publication_date, a.publisher, b.id AS body_id, b.body_name AS body_body_name, b.founding_year AS body_founding_year
FROM legal_documents a JOIN professional_bodies b ON a.professional_body_id = b.id;
```

| legal_document_id | document_title | publication_date | publisher | body_id | body_body_name | body_founding_year |
|---|---|---|---|---|---|---|
| 1 | Compact Series | 2025-12-01T23:33:00 | pilot-publishe-50 | 1000 | Regional Corridor | 43 |
| 2 | Legacy Assessment | 2022-05-12T06:50:00 | extended-publishe-51 | 1001 | Seasonal Series D | 48 |
| 3 | Regional Survey A | 2023-10-23T13:07:00 | integrated-publishe-52 | 1002 | Integrated Assessment | 53 |
| 4 | Seasonal Corridor | 2024-03-07T20:24:00 | seasonal-publishe-53 | 1003 | Extended Survey | 58 |

The view `vw_legal_document_professional_body` joins `legal_documents` to `professional_bodies` on `legal_documents.professional_body_id = professional_bodies.id`, answering: "Which professional body is associated with each document?" Row 1 shows that the document "Compact Series" is associated with the "Regional Corridor" body (Full membership, Human Rights focus). Row 3 shows that the document "Regional Survey A" is associated with the "Integrated Assessment" body (Student membership, Regulatory Law focus).

## Closing Synthesis

The schema models the legal domain as a network of six base tables whose foreign keys encode the relationships between cases, persons, outcomes, statutes, professional bodies, and documents. Each entity type is normalized into its own table with a surrogate primary key and descriptive attributes. The foreign keys—`legal_cases.legal_person_id`, `legal_cases.has_prosecutor_legal_person_id`, `legal_cases.legal_outcome_id`, `legal_cases.legal_statute_id`, `legal_persons.legal_case_id`, `legal_persons.professional_body_id`, `legal_outcomes.legal_case_id`, `legal_outcomes.legal_statute_id`, `legal_statutes.legal_case_id`, `legal_statutes.legal_statute_id`, `professional_bodies.legal_person_id`, `professional_bodies.legal_document_id`, and the three foreign keys in `legal_documents`—form a directed graph that ensures every entity is reachable from every other through at most two hops. The views materialize the traversals of this graph as flat, queryable results, each answering a specific domain question by joining two tables and presenting the combined attributes in a single row. The result is a schema that is both normalized—avoiding redundancy and update anomalies—and fully navigable through the view layer, enabling analysts to reconstruct any domain fact from the underlying tables.