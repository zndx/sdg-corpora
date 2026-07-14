# The Architecture of Legal Proceedings

Legal proceedings form a structured ecosystem where cases, persons, statutes, outcomes, professional bodies, and supporting documents interlock to create a complete record of judicial activity. Each case enters the system with a unique identifier, a court assignment, and a jurisdictional boundary. The people involved—barristers, judges, defendants, prosecutors—carry qualifications and specializations that tie them to professional bodies. Statutes provide the legal framework, outcomes capture the resolution, and documents serve as the evidentiary and administrative backbone. Understanding how these entities relate requires examining both the individual records and the joined views that reveal their operational connections.

## Core Case Records

**Table `legal_cases`**

| legal_case_id | case_identifier | court_name | case_type | date_filed | status | jurisdiction | legal_person_id | has_prosecutor_legal_person_id | legal_outcome_id | legal_statute_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | CAS-2099 | Baseline Series D | Criminal | 2024-03-14T02:54:00 | Pending | regional-jurisdic-30 | 100 | 100 | 1 | 1 |
| 2 | CAS-2100 | Distributed Assessment | Civil | 2025-08-25T09:11:00 | Active | legacy-jurisdic-31 | 101 | 101 | 2 | 2 |
| 3 | CAS-2101 | Adaptive Survey | Family | 2022-01-09T16:28:00 | Closed | compact-jurisdic-32 | 102 | 102 | 3 | 3 |
| 4 | CAS-2102 | Primary Corridor A | Inquest | 2023-06-20T23:45:00 | Appealed | composite-jurisdic-33 | 103 | 103 | 4 | 4 |

The `legal_cases` table serves as the central ledger of judicial activity. Each row represents a distinct proceeding, identified by a case identifier such as CAS-2099 through CAS-2102. The case type field distinguishes between Criminal, Civil, Family, and Inquest proceedings, while the status field tracks the current stage—Pending, Active, Closed, or Appealed. Court names like Baseline Series D and Distributed Assessment assign each case to a specific tribunal. Jurisdictional labels such as regional-jurisdic-30 and legacy-jurisdic-31 define the geographic or institutional scope. Foreign keys link each case to a legal person, a prosecutor, an outcome, and a statute, establishing the foundational relationships that the views later expand upon.

## Legal Persons and Their Roles

**Table `legal_persons`**

| legal_person_id | full_name | role | qualification | bar_circuit | specialization | legal_case_id | professional_body_id |
|---|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | Barrister | legacy-qualific-37 | Western Circuit | Inquests | 1 | 1000 |
| 101 | Account Name | Judge | compact-qualific-38 | London Bar | Professional Discipline | 2 | 1001 |
| 102 | Saipan International Airport | Defendant | composite-qualific-39 | Western Circuit | Maritime Law | 3 | 1002 |
| 103 | Norma Fisher | Prosecutor | primary-qualific-40 | London Bar | Family Law | 4 | 1003 |

Legal persons encompass the individuals and entities participating in proceedings. The full_name column records names ranging from Theodore Mcgrath to Saipan International Airport, reflecting both human and organizational participants. The role column categorizes each person as a Barrister, Judge, Defendant, or Prosecutor. Qualifications such as legacy-qualific-37 and compact-qualific-38 denote the credentialing framework, while bar_circuit values like Western Circuit and London Bar indicate the professional circuit to which the person belongs. Specialization fields—Inquests, Professional Discipline, Maritime Law, Family Law—capture the area of legal expertise. Each legal person is linked to a case and a professional body, creating a bridge between individual practitioners and their regulatory organizations.

## Resolutions and Outcomes

**Table `legal_outcomes`**

| legal_outcome_id | outcome_type | date_issued | sentence_length | fine_amount | is_appealed | legal_case_id | legal_statute_id |
|---|---|---|---|---|---|---|---|
| 1 | Sentence | 2023-10-10T09:39:00 | 27 | 29.99 | false | 1 | 1 |
| 2 | Ruling | 2024-03-21T16:56:00 | 32 | 16.11 | true | 2 | 2 |
| 3 | Finding | 2025-08-05T23:13:00 | 37 | 32.21 | false | 3 | 3 |
| 4 | Dismissal | 2022-01-16T06:30:00 | 42 | 35.45 | true | 4 | 4 |

Legal outcomes document the resolution of proceedings. The outcome_type column records the nature of the decision: Sentence, Ruling, Finding, or Dismissal. The date_issued field marks when the decision was rendered, spanning from 2022-01-16 to 2025-08-05 in the sample data. Sentence_length and fine_amount quantify the penalties imposed, with values ranging from 27 to 42 for sentence length and from 16.11 to 35.45 for fines. The is_appealed flag indicates whether the decision is under review, with both true and false values present. Each outcome ties back to a specific case and statute, ensuring that every resolution is grounded in the applicable legal framework.

## Governing Statutes

**Table `legal_statutes`**

| id | statute_name | year_enacted | section_number | jurisdiction | status | legal_case_id | legal_statute_id |
|---|---|---|---|---|---|---|---|
| 1 | Composite Series | 41 | SEC-2472 | England and Wales | Active | 1 | 1 |
| 2 | Compact Assessment A | 44 | SEC-2477 | UK | Amended | 2 | 2 |
| 3 | Legacy Survey | 47 | SEC-2482 | England and Wales | Repealed | 3 | 3 |
| 4 | Regional Corridor | 50 | SEC-2487 | UK | Active | 4 | 4 |

Statutes provide the legislative foundation for legal proceedings. The statute_name column lists designations such as Composite Series, Compact Assessment A, Legacy Survey, and Regional Corridor. The year_enacted field records the legislative year, with values 41 through 50 in the sample. Section numbers like SEC-2472 and SEC-2477 identify specific provisions within each statute. Jurisdiction labels—England and Wales, UK—define the territorial applicability, while the status column tracks whether a statute is Active, Amended, or Repealed. Each statute links to a case and another statute reference, enabling cross-referencing between legislative provisions and their application in specific proceedings.

## Professional Regulatory Bodies

**Table `professional_bodies`**

| id | body_name | founding_year | membership_type | focus_area | legal_person_id | legal_document_id |
|---|---|---|---|---|---|---|
| 1000 | Regional Corridor | 43 | Full | Human Rights | 100 | 1 |
| 1001 | Seasonal Series D | 48 | Associate | Health and Safety | 101 | 2 |
| 1002 | Integrated Assessment | 53 | Student | Regulatory Law | 102 | 3 |
| 1003 | Extended Survey | 58 | Full | Human Rights | 103 | 4 |

Professional bodies regulate and support legal practitioners. The body_name column includes entries such as Regional Corridor, Seasonal Series D, Integrated Assessment, and Extended Survey. The founding_year field records the establishment year, ranging from 43 to 58. Membership_type distinguishes between Full, Associate, and Student categories, reflecting different levels of professional engagement. Focus_area values like Human Rights, Health and Safety, and Regulatory Law indicate the organization's primary area of interest. Each body is associated with a legal person and a legal document, creating a chain from practitioner to regulator to supporting documentation.

## Supporting Documentation

**Table `legal_documents`**

| legal_document_id | document_title | publication_date | publisher | document_type | co_author | legal_case_id | legal_statute_id | professional_body_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Compact Series | 2025-12-01T23:33:00 | pilot-publishe-50 | Article | Stephanie Collins | 1 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Legacy Assessment | 2022-05-12T06:50:00 | extended-publishe-51 | Report | Cindy Davis | 2 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Regional Survey A | 2023-10-23T13:07:00 | integrated-publishe-52 | Submission | Jay King | 3 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Seasonal Corridor | 2024-03-07T20:24:00 | seasonal-publishe-53 | Policy Paper | Rachel Smith | 4 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Legal documents serve as the administrative and evidentiary record. The document_title column includes Compact Series, Legacy Assessment, Regional Survey A, and Seasonal Corridor. Publication dates span from 2022-05-12 to 2025-12-01, while publishers such as pilot-publishe-50 and extended-publishe-51 identify the issuing organizations. Document types—Article, Report, Submission, Policy Paper—categorize the nature of the content. Co-authors like Stephanie Collins, Cindy Davis, Jay King, and Rachel Smith are recorded for collaborative works. Each document links to a case, a statute, and a professional body, and includes timestamps for creation and last update, providing a complete audit trail.

## Case-to-Person Relationships

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

The view `vw_legal_case_legal_person` joins cases with their associated legal persons, answering the question of who is involved in each proceeding. For example, the case CAS-2099 at Baseline Series D is linked to Theodore Mcgrath, a Barrister on the Western Circuit specializing in Inquests. Similarly, CAS-2101 at Adaptive Survey connects to Saipan International Airport in the role of Defendant, with a specialization in Maritime Law. This view clarifies the human and organizational actors behind each case identifier, revealing how roles and specializations map onto case types.

## Case-to-Outcome Relationships

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

The view `vw_legal_case_legal_outcome` connects cases with their resolutions, revealing how proceedings conclude. CAS-2099 received a Sentence outcome with a sentence length of 27 and a fine of 29.99, issued on 2023-10-10. CAS-2100 resulted in a Ruling with a sentence length of 32 and a fine of 16.11, and notably carries an is_appealed flag of true. CAS-2102 produced a Dismissal outcome, indicating the case was terminated without a penalty. This view enables practitioners to analyze the distribution of outcomes across case types and jurisdictions.

## Case-to-Statute Relationships

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

The view `vw_legal_case_legal_statute` links cases to the statutes under which they were brought. CAS-2099 is governed by Composite Series (section SEC-2472), an Active statute from England and Wales. CAS-2100 falls under Compact Assessment A (section SEC-2477), which is marked as Amended and applies to the UK jurisdiction. CAS-2101 references Legacy Survey (section SEC-2482), a Repealed statute from England and Wales. This view is essential for understanding which legislative provisions are currently in force and which have been superseded, particularly when reviewing historical cases.

## Person-to-Case Relationships

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

The view `vw_legal_person_legal_case` reverses the perspective, showing which cases each legal person participates in. Theodore Mcgrath (legal_person_id 100) is associated with case CAS-2099, while Norma Fisher (legal_person_id 103) appears in CAS-2101 as a Prosecutor specializing in Family Law. This bidirectional view supports workload analysis and conflict-of-interest checks by revealing the full case history of each practitioner.

## Person-to-Professional-Body Relationships

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

The view `vw_legal_person_professional_body` connects legal persons to their regulatory bodies. Theodore Mcgrath is affiliated with the body named Regional Corridor, which has Full membership status and focuses on Human Rights. Account Name (Judge) is linked to Seasonal Series D, an Associate-level body focused on Health and Safety. This view helps trace the regulatory oversight structure, showing how practitioners are grouped by professional body and specialization.

## Outcome-to-Case Relationships

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

The view `vw_legal_outcome_legal_case` provides a reverse lookup from outcomes to their originating cases. A Sentence outcome with a 27-unit sentence length and a 29.99 fine traces back to CAS-2099. A Dismissal outcome corresponds to CAS-2102. This view is useful for auditing decisions and ensuring that outcomes are correctly attributed to their proceedings.

## Outcome-to-Statute Relationships

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

The view `vw_legal_outcome_legal_statute` ties outcomes to the statutes that authorized them. The Sentence outcome (legal_outcome_id 1) is grounded in the statute Composite Series (id 1). The Ruling outcome (legal_outcome_id 2) derives from Compact Assessment A (id 2). This relationship ensures that every penalty or decision can be traced to its legislative basis, which is critical for appeals and compliance reviews.

## Statute-to-Case Relationships

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

The view `vw_legal_statute_legal_case` shows which cases invoke each statute. Composite Series (id 1) is applied in CAS-2099, while Compact Assessment A (id 2) governs CAS-2100. This view supports legislative impact analysis, revealing how frequently each statute is invoked and across which case types and jurisdictions.

## Statute-to-Statute Relationships

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

The view `vw_legal_statute_legal_statute` captures self-referential relationships within the statutes table, enabling cross-referencing between related legislative provisions. Each statute links to another statute through the legal_statute_id column, creating a network of related provisions. For instance, Composite Series (id 1) references itself, as does Compact Assessment A (id 2). This structure supports the tracking of amendments, repeals, and superseding provisions.

## Professional-Body-to-Person Relationships

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

The view `vw_professional_body_legal_person` reverses the practitioner-to-body relationship, showing which legal persons belong to each professional body. Regional Corridor (id 1000) includes Theodore Mcgrath, while Seasonal Series D (id 1001) includes Account Name. This view is valuable for regulatory reporting, membership audits, and identifying practitioners by their professional body affiliation.

## Professional-Body-to-Document Relationships

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

The view `vw_professional_body_legal_document` connects professional bodies to their supporting documents. Regional Corridor (id 1000) is associated with the document Compact Series, published on 2025-12-01 by pilot-publishe-50. Seasonal Series D (id 1001) links to Legacy Assessment, a Report published by extended-publishe-51. This view reveals the documentation ecosystem that supports each professional body, including the types of documents produced and their publication timelines.

## Document-to-Case Relationships

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

The view `vw_legal_document_legal_case` links documents to the cases they support. Compact Series (legal_document_id 1) is associated with CAS-2099, while Legacy Assessment (legal_document_id 2) supports CAS-2100. This view helps practitioners locate the evidentiary and administrative documents relevant to any given case, ensuring that all supporting materials are readily accessible.

## Document-to-Statute Relationships

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

The view `vw_legal_document_legal_statute` connects documents to the statutes they reference or interpret. Compact Series (legal_document_id 1) references statute Composite Series (id 1), and Legacy Assessment (legal_document_id 2) references Compact Assessment A (id 2). This relationship is essential for legal research, as it allows practitioners to trace the interpretive and analytical documents that accompany each legislative provision.

## Document-to-Professional-Body Relationships

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

The view `vw_legal_document_professional_body` ties documents to the professional bodies that produced or endorsed them. Compact Series (legal_document_id 1) is linked to Regional Corridor (id 1000), and Legacy Assessment (legal_document_id 2) connects to Seasonal Series D (id 1001). This view clarifies the provenance of documents, showing which regulatory organization is responsible for each publication and enabling accountability in the documentation chain.

## Synthesis

The legal domain is defined by a network of interdependent records that together form a complete picture of judicial activity. Cases anchor the system, linking to the persons who participate, the statutes that govern, the outcomes that resolve, the bodies that regulate, and the documents that support. Each view provides a different lens on this network, answering specific operational questions about who is involved, what statutes apply, how cases conclude, and which documents are relevant. The data values—case identifiers like CAS-2099, names like Theodore Mcgrath, outcomes like Sentence and Dismissal, statutes like Composite Series and Compact Assessment A—give concrete form to these relationships. Together, the tables and views create a coherent framework for tracking, analyzing, and understanding legal proceedings from filing through resolution.