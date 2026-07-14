## Corporate Governance and Shareholder Relations: A Normalized Relational Model

The domain under examination captures the interlocking relationships among corporate entities, their shareholders, financial disclosures, governance meetings, regulatory oversight, and investor relations directors. At its core, the model answers questions such as: which shareholders hold stakes in which companies, what financial reports has a company filed, which regulatory authority oversees those filings, and how general meetings connect participants to outcomes. The relational schema achieves this through six base entity tables, three junction tables for many-to-many associations, and twelve materialized views that materialize common analytical joins.

**Table `companies`**

| company_id | legal_name | registration_number | listing_status | fiscal_year | governance_code | director_id |
|---|---|---|---|---|---|---|
| Link Title | Adaptive Model | REG-2136 | listed | 17 | 04750f92-9bac-11eb-a8a2-19ed5c03f8d3 | 195339 |
| Interac Association | Primary Cluster | REG-2142 | unlisted | 20 | 3158137 | 9125611 |
| Stern Electronics | Composite Review D | REG-2148 | listed | 23 | 790488 | 2933481 |
| Navistar International | Compact Initiative | REG-2154 | unlisted | 26 | 674a3cd4-8fc5-11eb-924d-9cd76263cbd0 | 2087758 |

The `companies` table anchors the entire schema. Each row represents a corporate entity identified by `company_id`, a natural key such as `Link Title`, `Interac Association`, `Stern Electronics`, or `Navistar International`. The column `legal_name` carries the formal designation — `Adaptive Model`, `Primary Cluster`, `Composite Review D`, `Compact Initiative` — while `registration_number` (e.g., `REG-2136`) and `listing_status` (`listed` or `unlisted`) provide regulatory identifiers. The integer `fiscal_year` (values 17, 20, 23, 26) and the UUID `governance_code` (e.g., `04750f92-9bac-11eb-a8a2-19ed5c03f8d3`) capture fiscal and governance metadata. The `director_id` column (e.g., `195339`, `9125611`) forms a foreign key into the `investor_relations_directors` table, establishing a one-to-one or one-to-few linkage between a company and its investor relations director.

**Table `shareholders`**

| id | shareholder_id | name | type | registration_date | contact_email | share_count | company_id | general_meeting_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 605948 | Dana Nguyen | individual | 2023-06-19T17:27:00 | Christopher Wilson | 99298 | Link Title | 1 | 2025-01-01 00:14:00 |
| 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Myers | institutional | 2024-11-03T00:44:00 | Charles Larsen | 16954 | Interac Association | 2 | 2025-02-06 03:14:00 |
| 3 | 4447026 | Kimberly Myers | individual | 2025-04-14T07:01:00 | Mary Alvarez | 54 | Stern Electronics | 3 | 2025-03-11 06:14:00 |
| 4 | 2933460 | Guam International Airport | institutional | 2022-09-25T14:18:00 | April Snyder | 1122 | Navistar International | 4 | 2025-04-16 09:14:00 |

The `shareholders` table records the individuals and institutions that hold equity. Its surrogate primary key `id` (1, 2, 3, 4) is paired with a business-level `shareholder_id` — numeric identifiers like `605948` or template-style codes such as `lu_tax_code_template_b_VB-EC-15`. The `name` column carries the shareholder's designation (`Dana Nguyen`, `Kimberly Myers`, `Guam International Airport`), while `type` distinguishes `individual` from `institutional` holders. The `registration_date` (e.g., `2023-06-19T17:27:00`) and `contact_email` (e.g., `Christopher Wilson`) provide administrative metadata. The integer `share_count` (99298, 16954, 54, 1122) quantifies the holding. Critically, `shareholders` carries two foreign keys: `company_id` references `companies.company_id`, and `general_meeting_id` references `general_meetings.id`, thereby embedding direct many-to-one associations between a shareholder, the company in which it invests, and the general meeting it attends.

**Table `financial_reports`**

| id | report_id | report_type | issuance_date | fiscal_period | consolidation_status | publication_url | auditor_name | company_id | regulatory_authority_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | annual | 2022-01-17 | distributed-fiscal-66 | consolidated | https://twitter.com/EvaUNICEF/status/1383845464630456320 | Compact Initiative | Link Title | 1 |
| 1001 | 8189500 | semi-annual | 2023-06-01 | baseline-fiscal-67 | separate | https://bugs.launchpad.net/fuel/+bug/1621491 | Legacy Model | Interac Association | 2 |
| 1002 | L355 | quarterly | 2024-11-12 | pilot-fiscal-68 | consolidated | https://bugs.launchpad.net/kolla-ansible/+bug/1665005 | Regional Cluster A | Stern Electronics | 3 |
| 1003 | 5844272 | annual | 2025-04-23 | extended-fiscal-69 | separate | https://bugs.launchpad.net/fuel/+bug/1256271 | Seasonal Review | Navistar International | 4 |

Financial disclosures are captured in `financial_reports`. The surrogate `id` (1000–1003) is complemented by a business `report_id` such as `1202-0008-S` or `L355`. The `report_type` column enumerates `annual`, `semi-annual`, and `quarterly` filings. The `issuance_date` (e.g., `2022-01-17`) and `fiscal_period` (e.g., `distributed-fiscal-66`) describe temporal scope, while `consolidation_status` (`consolidated` or `separate`) indicates accounting methodology. The `publication_url` (e.g., `https://twitter.com/EvaUNICEF/status/1383845464630456320`) and `auditor_name` (e.g., `Compact Initiative`, `Legacy Model`) provide provenance. Two foreign keys anchor the report to its corporate and regulatory context: `company_id` references `companies.company_id`, and `regulatory_authority_id` references `regulatory_authorities.id`.

**Table `general_meetings`**

| id | meeting_id | meeting_date | meeting_type | quorum_met | agenda_items | minute_url | company_id | financial_report_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | annual | false | baseline-agenda-73 | https://www.nature.com/articles/nphoton.2014.51 | Link Title | 1000 |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | extraordinary | true | pilot-agenda-74 | https://github.com/uber/ludwig | Interac Association | 1001 |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | annual | false | extended-agenda-75 | https://www.nature.com/articles/nphys3634 | Stern Electronics | 1002 |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | extraordinary | true | integrated-agenda-76 | https://leetcode.com/problems/course-schedule | Navistar International | 1003 |

The `general_meetings` table records corporate governance assemblies. Its surrogate `id` (1–4) pairs with a business `meeting_id` such as `20967529`, the Google Place ID `ChIJd13ymnZu5kcRXM7jx5boJBs`, or a UUID `922ad118-9bad-11eb-a8a2-19ed5c03f8d3`. The `meeting_date` (e.g., `2023-10-23T21:39:00`) and `meeting_type` (`annual` or `extraordinary`) describe the event. The boolean `quorum_met` (true/false) and `agenda_items` (e.g., `baseline-agenda-73`) capture governance outcomes. The `minute_url` (e.g., `https://www.nature.com/articles/nphoton.2014.51`) stores the official record. Foreign keys `company_id` and `financial_report_id` link each meeting to its host company and the financial report under discussion.

**Table `regulatory_authorities`**

| id | authority_id | authority_name | jurisdiction | regulation_code | bulletin_name | financial_report_id | company_id |
|---|---|---|---|---|---|---|---|
| 1 | 974930 | Sean Green | regional-jurisdic-30 | 5917296 | Bobby Flores | 1000 | Link Title |
| 2 | 5917289 | Elizabeth Woods | legacy-jurisdic-31 | 82874 | Carol Gaines | 1001 | Interac Association |
| 3 | 8843762 | Kimberly Smith | compact-jurisdic-32 | 1336197 | Edward Duran | 1002 | Stern Electronics |
| 4 | 2087738 | Kimberly Smith | composite-jurisdic-33 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | Jennifer Summers | 1003 | Navistar International |

Regulatory oversight is modeled in `regulatory_authorities`. The surrogate `id` (1–4) is paired with `authority_id` (e.g., `974930`, `5917289`), `authority_name` (e.g., `Sean Green`, `Elizabeth Woods`), `jurisdiction` (e.g., `regional-jurisdic-30`), `regulation_code` (e.g., `5917296`), and `bulletin_name` (e.g., `Bobby Flores`). The columns `financial_report_id` and `company_id` serve as foreign keys, establishing that each regulatory authority is associated with a specific financial report and a specific company.

**Table `investor_relations_directors`**

| director_id | appointment_year | reporting_period | compliance_status | company_id | shareholder_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 195339 | 26 | extended-reportin-27 | compliant | Link Title | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 9125611 | 36 | integrated-reportin-28 | non-compliant | Interac Association | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 2933481 | 46 | seasonal-reportin-29 | compliant | Stern Electronics | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 2087758 | 56 | regional-reportin-30 | non-compliant | Navistar International | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `investor_relations_directors` table captures the governance personnel who liaise between companies and shareholders. The primary key `director_id` (e.g., `195339`, `9125611`) is complemented by `appointment_year` (26, 36, 46, 56), `reporting_period` (e.g., `extended-reportin-27`), and `compliance_status` (`compliant` or `non-compliant`). The foreign keys `company_id` and `shareholder_id` link each director to the company they serve and the shareholder they report to. Timestamps `created_at` and `updated_at` (e.g., `2025-01-01 00:14:00`) provide audit trails.

The schema employs three junction tables to resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `companies_reports` junction table links companies to their financial reports, enabling a single company to publish multiple reports and a report to be cross-referenced across entities. The `companies_meetings` junction table associates companies with general meetings, supporting the pattern where a company convenes multiple meetings and a meeting type may be relevant to multiple companies. The `meetings_shareholders` junction table connects shareholders to general meetings, allowing a shareholder to attend multiple meetings and a meeting to have multiple attendees. These junction tables each contain at least two foreign key columns referencing the participating base tables, and their composite primary keys enforce referential integrity.

The twelve views materialize common analytical joins, each answering a specific domain question by denormalizing the normalized schema.

**View `v_shareholder_company`**

```sql
CREATE VIEW v_shareholder_company AS
SELECT a.id, a.shareholder_id, a.name, a.type, b.company_id AS company_company_id, b.legal_name AS company_legal_name, b.registration_number AS company_registration_number
FROM shareholders a JOIN companies b ON a.company_id = b.company_id;
```

| id | shareholder_id | name | type | company_company_id | company_legal_name | company_registration_number |
|---|---|---|---|---|---|---|
| 1 | 605948 | Dana Nguyen | individual | Link Title | Adaptive Model | REG-2136 |
| 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Myers | institutional | Interac Association | Primary Cluster | REG-2142 |
| 3 | 4447026 | Kimberly Myers | individual | Stern Electronics | Composite Review D | REG-2148 |
| 4 | 2933460 | Guam International Airport | institutional | Navistar International | Compact Initiative | REG-2154 |

The view `v_shareholder_company` joins `shareholders` to `companies` on `shareholders.company_id = companies.company_id`. It answers the question: "Which company does a given shareholder hold shares in?" A row for shareholder `Dana Nguyen` (id 1) reveals the company `Link Title` with legal name `Adaptive Model`, while shareholder `Guam International Airport` (id 4) is linked to `Navistar International` with legal name `Compact Initiative`. The view surfaces `share_count` alongside `listing_status`, enabling analysts to assess portfolio concentration by listing tier.

**View `v_shareholder_general_meeting`**

```sql
CREATE VIEW v_shareholder_general_meeting AS
SELECT a.id, a.shareholder_id, a.name, a.type, b.id AS meeting_id, b.meeting_id AS meeting_meeting_id, b.meeting_date AS meeting_meeting_date
FROM shareholders a JOIN general_meetings b ON a.general_meeting_id = b.id;
```

| id | shareholder_id | name | type | meeting_id | meeting_meeting_id | meeting_meeting_date |
|---|---|---|---|---|---|---|
| 1 | 605948 | Dana Nguyen | individual | 1 | 20967529 | 2023-10-23T21:39:00 |
| 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Myers | institutional | 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 |
| 3 | 4447026 | Kimberly Myers | individual | 3 | gd_acc_763000 | 2025-08-18T11:13:00 |
| 4 | 2933460 | Guam International Airport | institutional | 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 |

The view `v_shareholder_general_meeting` joins `shareholders` to `general_meetings` on `shareholders.general_meeting_id = general_meetings.id`. It answers: "Which general meeting did a shareholder attend?" Shareholder `Kimberly Myers` (id 2) attended meeting `ChIJd13ymnZu5kcRXM7jx5boJBs` of type `extraordinary` at `Interac Association`, where `quorum_met` is `true`. This view is essential for tracking attendance patterns and quorum compliance.

**View `v_company_financial_report_detail`**

```sql
CREATE VIEW v_company_financial_report_detail AS
SELECT a.company_id, a.legal_name, a.registration_number, b.id AS report_id, b.report_id AS report_report_id, b.report_type AS report_report_type
FROM companies a
  JOIN companies_reports j ON j.company_id = a.company_id
  JOIN financial_reports b ON b.id = j.financial_report_id;
```

| company_id | legal_name | registration_number | report_id | report_report_id | report_report_type |
|---|---|---|---|---|---|
| Link Title | Adaptive Model | REG-2136 | 1000 | 1202-0008-S | annual |
| Link Title | Adaptive Model | REG-2136 | 1001 | 8189500 | semi-annual |
| Interac Association | Primary Cluster | REG-2142 | 1001 | 8189500 | semi-annual |
| Interac Association | Primary Cluster | REG-2142 | 1002 | L355 | quarterly |
| Stern Electronics | Composite Review D | REG-2148 | 1002 | L355 | quarterly |
| Stern Electronics | Composite Review D | REG-2148 | 1003 | 5844272 | annual |
| Navistar International | Compact Initiative | REG-2154 | 1003 | 5844272 | annual |
| Navistar International | Compact Initiative | REG-2154 | 1000 | 1202-0008-S | annual |

The view `v_company_financial_report_detail` joins `companies` to `financial_reports` on `companies.company_id = financial_reports.company_id`. It answers: "What financial reports has a company filed?" Company `Link Title` (legal name `Adaptive Model`) has filed report `1202-0008-S` of type `annual` with consolidation status `consolidated`, audited by `Compact Initiative`. Company `Stern Electronics` (legal name `Composite Review D`) has filed report `L355` of type `quarterly` with status `consolidated`, audited by `Regional Cluster A`. This view is the primary lens for corporate disclosure analysis.

**View `v_company_general_meeting_detail`**

```sql
CREATE VIEW v_company_general_meeting_detail AS
SELECT a.company_id, a.legal_name, a.registration_number, b.id AS meeting_id, b.meeting_id AS meeting_meeting_id, b.meeting_date AS meeting_meeting_date
FROM companies a
  JOIN companies_meetings j ON j.company_id = a.company_id
  JOIN general_meetings b ON b.id = j.general_meeting_id;
```

| company_id | legal_name | registration_number | meeting_id | meeting_meeting_id | meeting_meeting_date |
|---|---|---|---|---|---|
| Link Title | Adaptive Model | REG-2136 | 1 | 20967529 | 2023-10-23T21:39:00 |
| Link Title | Adaptive Model | REG-2136 | 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 |
| Interac Association | Primary Cluster | REG-2142 | 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 |
| Interac Association | Primary Cluster | REG-2142 | 3 | gd_acc_763000 | 2025-08-18T11:13:00 |
| Stern Electronics | Composite Review D | REG-2148 | 3 | gd_acc_763000 | 2025-08-18T11:13:00 |
| Stern Electronics | Composite Review D | REG-2148 | 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 |
| Navistar International | Compact Initiative | REG-2154 | 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 |
| Navistar International | Compact Initiative | REG-2154 | 1 | 20967529 | 2023-10-23T21:39:00 |

The view `v_company_general_meeting_detail` joins `companies` to `general_meetings` on `companies.company_id = general_meetings.company_id`. It answers: "Which general meetings has a company convened?" `Link Title` convened meeting `20967529` of type `annual` on `2023-10-23T21:39:00` with `quorum_met = false`. `Interac Association` convened meeting `ChIJd13ymnZu5kcRXM7jx5boJBs` of type `extraordinary` on `2024-03-07T04:56:00` with `quorum_met = true`. The view enables governance compliance audits by surfacing quorum outcomes per company.

**View `v_company_investor_relations_director`**

```sql
CREATE VIEW v_company_investor_relations_director AS
SELECT a.company_id, a.legal_name, a.registration_number, a.listing_status, b.director_id AS director_director_id, b.appointment_year AS director_appointment_year, b.reporting_period AS director_reporting_period
FROM companies a JOIN investor_relations_directors b ON a.director_id = b.director_id;
```

| company_id | legal_name | registration_number | listing_status | director_director_id | director_appointment_year | director_reporting_period |
|---|---|---|---|---|---|---|
| Link Title | Adaptive Model | REG-2136 | listed | 195339 | 26 | extended-reportin-27 |
| Interac Association | Primary Cluster | REG-2142 | unlisted | 9125611 | 36 | integrated-reportin-28 |
| Stern Electronics | Composite Review D | REG-2148 | listed | 2933481 | 46 | seasonal-reportin-29 |
| Navistar International | Compact Initiative | REG-2154 | unlisted | 2087758 | 56 | regional-reportin-30 |

The view `v_company_investor_relations_director` joins `companies` to `investor_relations_directors` on `companies.company_id = investor_relations_directors.company_id`. It answers: "Which investor relations director is assigned to a company?" `Link Title` has director `195339` with `compliance_status = compliant` and `appointment_year = 26`. `Interac Association` has director `9125611` with `compliance_status = non-compliant` and `appointment_year = 36`. This view supports regulatory compliance monitoring by surfacing director status alongside corporate identity.

**View `v_financial_report_company`**

```sql
CREATE VIEW v_financial_report_company AS
SELECT a.id, a.report_id, a.report_type, a.issuance_date, b.company_id AS company_company_id, b.legal_name AS company_legal_name, b.registration_number AS company_registration_number
FROM financial_reports a JOIN companies b ON a.company_id = b.company_id;
```

| id | report_id | report_type | issuance_date | company_company_id | company_legal_name | company_registration_number |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | annual | 2022-01-17 | Link Title | Adaptive Model | REG-2136 |
| 1001 | 8189500 | semi-annual | 2023-06-01 | Interac Association | Primary Cluster | REG-2142 |
| 1002 | L355 | quarterly | 2024-11-12 | Stern Electronics | Composite Review D | REG-2148 |
| 1003 | 5844272 | annual | 2025-04-23 | Navistar International | Compact Initiative | REG-2154 |

The view `v_financial_report_company` joins `financial_reports` to `companies` on `financial_reports.company_id = companies.company_id`. It answers: "Which company published a given financial report?" Report `1202-0008-S` (type `annual`, issued `2022-01-17`) was published by `Link Title` (legal name `Adaptive Model`). Report `L355` (type `quarterly`, issued `2024-11-12`) was published by `Stern Electronics` (legal name `Composite Review D`). This view is the inverse of `v_company_financial_report_detail` and is useful when starting from a report identifier and needing to resolve the publishing entity.

**View `v_financial_report_regulatory_authority`**

```sql
CREATE VIEW v_financial_report_regulatory_authority AS
SELECT a.id, a.report_id, a.report_type, a.issuance_date, b.id AS authority_id, b.authority_id AS authority_authority_id, b.authority_name AS authority_authority_name
FROM financial_reports a JOIN regulatory_authorities b ON a.regulatory_authority_id = b.id;
```

| id | report_id | report_type | issuance_date | authority_id | authority_authority_id | authority_authority_name |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | annual | 2022-01-17 | 1 | 974930 | Sean Green |
| 1001 | 8189500 | semi-annual | 2023-06-01 | 2 | 5917289 | Elizabeth Woods |
| 1002 | L355 | quarterly | 2024-11-12 | 3 | 8843762 | Kimberly Smith |
| 1003 | 5844272 | annual | 2025-04-23 | 4 | 2087738 | Kimberly Smith |

The view `v_financial_report_regulatory_authority` joins `financial_reports` to `regulatory_authorities` on `financial_reports.regulatory_authority_id = regulatory_authorities.id`. It answers: "Which regulatory authority oversees a given financial report?" Report `1202-0008-S` is overseen by authority `974930` (name `Sean Green`, jurisdiction `regional-jurisdic-30`). Report `8189500` is overseen by authority `5917289` (name `Elizabeth Woods`, jurisdiction `legacy-jurisdic-31`). This view is critical for regulatory traceability and audit workflows.

**View `v_general_meeting_company`**

```sql
CREATE VIEW v_general_meeting_company AS
SELECT a.id, a.meeting_id, a.meeting_date, a.meeting_type, b.company_id AS company_company_id, b.legal_name AS company_legal_name, b.registration_number AS company_registration_number
FROM general_meetings a JOIN companies b ON a.company_id = b.company_id;
```

| id | meeting_id | meeting_date | meeting_type | company_company_id | company_legal_name | company_registration_number |
|---|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | annual | Link Title | Adaptive Model | REG-2136 |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | extraordinary | Interac Association | Primary Cluster | REG-2142 |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | annual | Stern Electronics | Composite Review D | REG-2148 |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | extraordinary | Navistar International | Compact Initiative | REG-2154 |

The view `v_general_meeting_company` joins `general_meetings` to `companies` on `general_meetings.company_id = companies.company_id`. It answers: "Which company convened a given general meeting?" Meeting `20967529` (type `annual`, date `2023-10-23T21:39:00`) was convened by `Link Title` (legal name `Adaptive Model`). Meeting `gd_acc_763000` (type `annual`, date `2025-08-18T11:13:00`) was convened by `Stern Electronics` (legal name `Composite Review D`). This view supports calendar-based governance analysis.

**View `v_general_meeting_shareholder_detail`**

```sql
CREATE VIEW v_general_meeting_shareholder_detail AS
SELECT a.id, a.meeting_id, a.meeting_date, b.id AS shareholder_id, b.shareholder_id AS shareholder_shareholder_id, b.name AS shareholder_name
FROM general_meetings a
  JOIN meetings_shareholders j ON j.general_meeting_id = a.id
  JOIN shareholders b ON b.id = j.shareholder_id;
```

| id | meeting_id | meeting_date | shareholder_id | shareholder_shareholder_id | shareholder_name |
|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | 1 | 605948 | Dana Nguyen |
| 1 | 20967529 | 2023-10-23T21:39:00 | 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Myers |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Myers |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | 3 | 4447026 | Kimberly Myers |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | 3 | 4447026 | Kimberly Myers |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | 4 | 2933460 | Guam International Airport |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | 4 | 2933460 | Guam International Airport |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | 1 | 605948 | Dana Nguyen |

The view `v_general_meeting_shareholder_detail` joins `general_meetings` to `shareholders` on `general_meetings.id = shareholders.general_meeting_id`. It answers: "Which shareholders attended a given general meeting?" Meeting `20967529` at `Link Title` was attended by shareholder `Dana Nguyen` (type `individual`, share count 99298). Meeting `ChIJd13ymnZu5kcRXM7jx5boJBs` at `Interac Association` was attended by shareholder `Kimberly Myers` (type `institutional`, share count 16954). This view enables attendance and voting-power analysis.

**View `v_general_meeting_financial_report`**

```sql
CREATE VIEW v_general_meeting_financial_report AS
SELECT a.id, a.meeting_id, a.meeting_date, a.meeting_type, b.id AS report_id, b.report_id AS report_report_id, b.report_type AS report_report_type
FROM general_meetings a JOIN financial_reports b ON a.financial_report_id = b.id;
```

| id | meeting_id | meeting_date | meeting_type | report_id | report_report_id | report_report_type |
|---|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | annual | 1000 | 1202-0008-S | annual |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | extraordinary | 1001 | 8189500 | semi-annual |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | annual | 1002 | L355 | quarterly |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | extraordinary | 1003 | 5844272 | annual |

The view `v_general_meeting_financial_report` joins `general_meetings` to `financial_reports` on `general_meetings.financial_report_id = financial_reports.id`. It answers: "Which financial report was discussed at a given general meeting?" Meeting `20967529` at `Link Title` discussed report `1202-0008-S` (type `annual`, fiscal period `distributed-fiscal-66`). Meeting `ChIJd13ymnZu5kcRXM7jx5boJBs` at `Interac Association` discussed report `8189500` (type `semi-annual`, fiscal period `baseline-fiscal-67`). This view is essential for understanding the relationship between governance events and the financial disclosures they address.

**View `v_regulatory_authority_financial_report`**

```sql
CREATE VIEW v_regulatory_authority_financial_report AS
SELECT a.id, a.authority_id, a.authority_name, a.jurisdiction, b.id AS report_id, b.report_id AS report_report_id, b.report_type AS report_report_type
FROM regulatory_authorities a JOIN financial_reports b ON a.financial_report_id = b.id;
```

| id | authority_id | authority_name | jurisdiction | report_id | report_report_id | report_report_type |
|---|---|---|---|---|---|---|
| 1 | 974930 | Sean Green | regional-jurisdic-30 | 1000 | 1202-0008-S | annual |
| 2 | 5917289 | Elizabeth Woods | legacy-jurisdic-31 | 1001 | 8189500 | semi-annual |
| 3 | 8843762 | Kimberly Smith | compact-jurisdic-32 | 1002 | L355 | quarterly |
| 4 | 2087738 | Kimberly Smith | composite-jurisdic-33 | 1003 | 5844272 | annual |

The view `v_regulatory_authority_financial_report` joins `regulatory_authorities` to `financial_reports` on `regulatory_authorities.id = financial_reports.regulatory_authority_id`. It answers: "Which financial reports are overseen by a given regulatory authority?" Authority `974930` (name `Sean Green`, jurisdiction `regional-jurisdic-30`) oversees report `1202-0008-S` (type `annual`, issued `2022-01-17`). Authority `5917289` (name `Elizabeth Woods`, jurisdiction `legacy-jurisdic-31`) oversees report `8189500` (type `semi-annual`, issued `2023-06-01`). This view supports regulatory portfolio management.

**View `v_regulatory_authority_company`**

```sql
CREATE VIEW v_regulatory_authority_company AS
SELECT a.id, a.authority_id, a.authority_name, a.jurisdiction, b.company_id AS company_company_id, b.legal_name AS company_legal_name, b.registration_number AS company_registration_number
FROM regulatory_authorities a JOIN companies b ON a.company_id = b.company_id;
```

| id | authority_id | authority_name | jurisdiction | company_company_id | company_legal_name | company_registration_number |
|---|---|---|---|---|---|---|
| 1 | 974930 | Sean Green | regional-jurisdic-30 | Link Title | Adaptive Model | REG-2136 |
| 2 | 5917289 | Elizabeth Woods | legacy-jurisdic-31 | Interac Association | Primary Cluster | REG-2142 |
| 3 | 8843762 | Kimberly Smith | compact-jurisdic-32 | Stern Electronics | Composite Review D | REG-2148 |
| 4 | 2087738 | Kimberly Smith | composite-jurisdic-33 | Navistar International | Compact Initiative | REG-2154 |

The view `v_regulatory_authority_company` joins `regulatory_authorities` to `companies` on `regulatory_authorities.company_id = companies.company_id`. It answers: "Which companies are regulated by a given authority?" Authority `974930` (name `Sean Green`) regulates company `Link Title` (legal name `Adaptive Model`, registration `REG-2136`, status `listed`). Authority `5917289` (name `Elizabeth Woods`) regulates company `Interac Association` (legal name `Primary Cluster`, registration `REG-2142`, status `unlisted`). This view provides a regulatory jurisdiction map.

**View `v_investor_relations_director_company`**

```sql
CREATE VIEW v_investor_relations_director_company AS
SELECT a.director_id, a.appointment_year, a.reporting_period, a.compliance_status, b.company_id AS company_company_id, b.legal_name AS company_legal_name, b.registration_number AS company_registration_number
FROM investor_relations_directors a JOIN companies b ON a.company_id = b.company_id;
```

| director_id | appointment_year | reporting_period | compliance_status | company_company_id | company_legal_name | company_registration_number |
|---|---|---|---|---|---|---|
| 195339 | 26 | extended-reportin-27 | compliant | Link Title | Adaptive Model | REG-2136 |
| 9125611 | 36 | integrated-reportin-28 | non-compliant | Interac Association | Primary Cluster | REG-2142 |
| 2933481 | 46 | seasonal-reportin-29 | compliant | Stern Electronics | Composite Review D | REG-2148 |
| 2087758 | 56 | regional-reportin-30 | non-compliant | Navistar International | Compact Initiative | REG-2154 |

The view `v_investor_relations_director_company` joins `investor_relations_directors` to `companies` on `investor_relations_directors.company_id = companies.company_id`. It answers: "Which company is served by a given investor relations director?" Director `195339` serves `Link Title` (legal name `Adaptive Model`) with `compliance_status = compliant`. Director `9125611` serves `Interac Association` (legal name `Primary Cluster`) with `compliance_status = non-compliant`. This view supports director workload and compliance analysis.

**View `v_investor_relations_director_shareholder`**

```sql
CREATE VIEW v_investor_relations_director_shareholder AS
SELECT a.director_id, a.appointment_year, a.reporting_period, a.compliance_status, b.id AS shareholder_id, b.shareholder_id AS shareholder_shareholder_id, b.name AS shareholder_name
FROM investor_relations_directors a JOIN shareholders b ON a.shareholder_id = b.id;
```

| director_id | appointment_year | reporting_period | compliance_status | shareholder_id | shareholder_shareholder_id | shareholder_name |
|---|---|---|---|---|---|---|
| 195339 | 26 | extended-reportin-27 | compliant | 1 | 605948 | Dana Nguyen |
| 9125611 | 36 | integrated-reportin-28 | non-compliant | 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Myers |
| 2933481 | 46 | seasonal-reportin-29 | compliant | 3 | 4447026 | Kimberly Myers |
| 2087758 | 56 | regional-reportin-30 | non-compliant | 4 | 2933460 | Guam International Airport |

The view `v_investor_relations_director_shareholder` joins `investor_relations_directors` to `shareholders` on `investor_relations_directors.shareholder_id = shareholders.id`. It answers: "Which shareholder does a given investor relations director report to?" Director `195339` reports to shareholder `Dana Nguyen` (id 1, type `individual`). Director `9125611` reports to shareholder `Kimberly Myers` (id 2, type `institutional`). This view reveals the reporting chain between governance personnel and equity holders.

The schema's design reflects a deliberate trade-off between normalization and query convenience. The six base tables enforce first normal form with atomic columns and surrogate or natural primary keys, while the three junction tables resolve many-to-many relationships that would otherwise require denormalized repeating groups. The twelve views materialize the most common analytical joins, each reconstructing a domain fact — a shareholder's company affiliation, a meeting's financial report context, a director's compliance status — from the normalized tables. This layered approach ensures data integrity at the base level while providing efficient access patterns for governance analysis, regulatory compliance tracking, and shareholder portfolio review.

## Data appendix

**Table `companies_reports`**

| company_id | financial_report_id |
|---|---|
| Link Title | 1000 |
| Link Title | 1001 |
| Interac Association | 1001 |
| Interac Association | 1002 |
| Stern Electronics | 1002 |
| Stern Electronics | 1003 |
| Navistar International | 1003 |
| Navistar International | 1000 |

**Table `companies_meetings`**

| company_id | general_meeting_id |
|---|---|
| Link Title | 1 |
| Link Title | 2 |
| Interac Association | 2 |
| Interac Association | 3 |
| Stern Electronics | 3 |
| Stern Electronics | 4 |
| Navistar International | 4 |
| Navistar International | 1 |

**Table `meetings_shareholders`**

| general_meeting_id | shareholder_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |
