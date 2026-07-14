## Corporate Governance and Shareholder Registry

Corporate governance structures require precise tracking of the relationships between companies, their shareholders, financial disclosures, and the regulatory bodies that oversee them. At the core of this ecosystem are the legal entities themselves—corporations that issue shares, file reports, and convene meetings—alongside the individuals and institutions that hold equity stakes. The governance framework connects these actors through a network of financial reports, general meetings, and director appointments, each carrying its own set of identifiers, dates, and compliance statuses. Understanding how these records interlock is essential for anyone auditing ownership, verifying disclosure timelines, or mapping regulatory jurisdiction across a portfolio of entities.

**Table `companies`**

| company_id | legal_name | registration_number | listing_status | fiscal_year | governance_code | director_id |
|---|---|---|---|---|---|---|
| Link Title | Adaptive Model | REG-2136 | listed | 17 | 04750f92-9bac-11eb-a8a2-19ed5c03f8d3 | 195339 |
| Interac Association | Primary Cluster | REG-2142 | unlisted | 20 | 3158137 | 9125611 |
| Stern Electronics | Composite Review D | REG-2148 | listed | 23 | 790488 | 2933481 |
| Navistar International | Compact Initiative | REG-2154 | unlisted | 26 | 674a3cd4-8fc5-11eb-924d-9cd76263cbd0 | 2087758 |

The companies table anchors the entire registry. Each row represents a legal entity with a unique `company_id` that serves as the primary key for all downstream relationships. The `legal_name` column holds the formal corporate designation—Adaptive Model, Primary Cluster, Composite Review D, Compact Initiative—while `registration_number` provides the government-issued identifier such as REG-2136 or REG-2142. The `listing_status` field distinguishes publicly traded entities from private ones; Link Title and Stern Electronics carry a listed status, whereas Interac Association and Navistar International are marked unlisted. The `fiscal_year` column records the reporting cycle length, ranging from 17 to 26 in the sample data, and `governance_code` stores a compliance framework reference, sometimes formatted as a UUID and sometimes as a numeric string. The `director_id` column links each company to its investor relations director, establishing the first bridge to the personnel layer of governance.

**Table `shareholders`**

| id | shareholder_id | name | type | registration_date | contact_email | share_count | company_id | general_meeting_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 605948 | Dana Nguyen | individual | 2023-06-19T17:27:00 | Christopher Wilson | 99298 | Link Title | 1 | 2025-01-01 00:14:00 |
| 2 | lu_tax_code_template_b_VB-EC-15 | Kimberly Myers | institutional | 2024-11-03T00:44:00 | Charles Larsen | 16954 | Interac Association | 2 | 2025-02-06 03:14:00 |
| 3 | 4447026 | Kimberly Myers | individual | 2025-04-14T07:01:00 | Mary Alvarez | 54 | Stern Electronics | 3 | 2025-03-11 06:14:00 |
| 4 | 2933460 | Guam International Airport | institutional | 2022-09-25T14:18:00 | April Snyder | 1122 | Navistar International | 4 | 2025-04-16 09:14:00 |

Shareholders occupy the other side of the equity equation. The `shareholders` table records both individual and institutional holders, distinguished by the `type` column values of individual or institutional. A shareholder such as Dana Nguyen (shareholder_id 605948) holds 99,298 shares in Link Title, registered on 2023-06-19, while Guam International Airport—an institutional entity—holds 1,122 shares in Navistar International, registered on 2022-09-25. The `share_count` column quantifies the equity position, and `contact_email` stores the communication address associated with the holding. Each shareholder row also carries a `company_id` reference, tying the holder directly to the issuing entity, and a `general_meeting_id` reference, linking the shareholder to the meetings at which they may vote or receive notices.

**Table `financial_reports`**

| id | report_id | report_type | issuance_date | fiscal_period | consolidation_status | publication_url | auditor_name | company_id | regulatory_authority_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | annual | 2022-01-17 | distributed-fiscal-66 | consolidated | https://twitter.com/EvaUNICEF/status/1383845464630456320 | Compact Initiative | Link Title | 1 |
| 1001 | 8189500 | semi-annual | 2023-06-01 | baseline-fiscal-67 | separate | https://bugs.launchpad.net/fuel/+bug/1621491 | Legacy Model | Interac Association | 2 |
| 1002 | L355 | quarterly | 2024-11-12 | pilot-fiscal-68 | consolidated | https://bugs.launchpad.net/kolla-ansible/+bug/1665005 | Regional Cluster A | Stern Electronics | 3 |
| 1003 | 5844272 | annual | 2025-04-23 | extended-fiscal-69 | separate | https://bugs.launchpad.net/fuel/+bug/1256271 | Seasonal Review | Navistar International | 4 |

Financial disclosures form the transparency backbone of corporate governance. The `financial_reports` table catalogs each filing with a `report_id` such as 1202-0008-S or L355, a `report_type` of annual, semi-annual, or quarterly, and an `issuance_date` marking when the document was released. The `fiscal_period` column identifies the reporting window—distributed-fiscal-66, baseline-fiscal-67, pilot-fiscal-68—while `consolidation_status` indicates whether the report covers a single entity (separate) or a group of entities (consolidated). The `publication_url` provides a direct link to the public document, and `auditor_name` records the auditing firm or individual responsible for the review. Each report is tied to a `company_id` and a `regulatory_authority_id`, anchoring the disclosure to both the issuing entity and the oversight body.

**Table `general_meetings`**

| id | meeting_id | meeting_date | meeting_type | quorum_met | agenda_items | minute_url | company_id | financial_report_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 20967529 | 2023-10-23T21:39:00 | annual | false | baseline-agenda-73 | https://www.nature.com/articles/nphoton.2014.51 | Link Title | 1000 |
| 2 | ChIJd13ymnZu5kcRXM7jx5boJBs | 2024-03-07T04:56:00 | extraordinary | true | pilot-agenda-74 | https://github.com/uber/ludwig | Interac Association | 1001 |
| 3 | gd_acc_763000 | 2025-08-18T11:13:00 | annual | false | extended-agenda-75 | https://www.nature.com/articles/nphys3634 | Stern Electronics | 1002 |
| 4 | 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 | 2022-01-02T18:30:00 | extraordinary | true | integrated-agenda-76 | https://leetcode.com/problems/course-schedule | Navistar International | 1003 |

General meetings are the procedural mechanism through which shareholders exercise their rights. The `general_meetings` table records each convening with a `meeting_id`—ranging from numeric identifiers like 20967529 to Google Place IDs like ChIJd13ymnZu5kcRXM7jx5boJBs—and a `meeting_date` specifying when the session occurred. The `meeting_type` column distinguishes annual general meetings from extraordinary ones, while `quorum_met` records whether the minimum attendance threshold was satisfied; in the sample data, meetings for Interac Association and Navistar International achieved quorum, whereas those for Link Title and Stern Electronics did not. The `agenda_items` column describes the topics under discussion, and `minute_url` points to the official record of proceedings. Each meeting is associated with a `company_id` and a `financial_report_id`, linking the procedural event to both the entity and the financial period it addresses.

**Table `regulatory_authorities`**

| id | authority_id | authority_name | jurisdiction | regulation_code | bulletin_name | financial_report_id | company_id |
|---|---|---|---|---|---|---|---|
| 1 | 974930 | Sean Green | regional-jurisdic-30 | 5917296 | Bobby Flores | 1000 | Link Title |
| 2 | 5917289 | Elizabeth Woods | legacy-jurisdic-31 | 82874 | Carol Gaines | 1001 | Interac Association |
| 3 | 8843762 | Kimberly Smith | compact-jurisdic-32 | 1336197 | Edward Duran | 1002 | Stern Electronics |
| 4 | 2087738 | Kimberly Smith | composite-jurisdic-33 | 57e54d62-8fcd-11eb-924d-9cd76263cbd0 | Jennifer Summers | 1003 | Navistar International |

Regulatory oversight ensures that disclosures meet statutory requirements. The `regulatory_authorities` table lists the bodies responsible for enforcement, each identified by an `authority_id` and an `authority_name` such as Sean Green or Elizabeth Woods. The `jurisdiction` column specifies the geographic or functional scope—regional-jurisdic-30, legacy-jurisdic-31—and `regulation_code` stores the applicable regulatory framework reference. The `bulletin_name` column records the official publication or notice associated with the authority. Each regulatory authority row is linked to a `financial_report_id` and a `company_id`, establishing the chain of oversight from regulator to report to issuer.

**Table `investor_relations_directors`**

| director_id | appointment_year | reporting_period | compliance_status | company_id | shareholder_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 195339 | 26 | extended-reportin-27 | compliant | Link Title | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 9125611 | 36 | integrated-reportin-28 | non-compliant | Interac Association | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 2933481 | 46 | seasonal-reportin-29 | compliant | Stern Electronics | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 2087758 | 56 | regional-reportin-30 | non-compliant | Navistar International | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Investor relations directors serve as the operational bridge between companies and their shareholders. The `investor_relations_directors` table records each appointment with a `director_id` that matches the `director_id` in the companies table, an `appointment_year` indicating when the director took office, and a `reporting_period` describing the cycle under which the director operates—extended-reportin-27, integrated-reportin-28, seasonal-reportin-29, regional-reportin-30. The `compliance_status` column tracks whether the director is meeting their obligations, with values of compliant or non-compliant appearing across the sample data. Each director record also carries a `company_id` and a `shareholder_id`, connecting the director to both the entity they serve and the shareholder they report to.

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

The companies_reports table formalizes the many-to-many relationship between companies and their financial reports. While a company may file multiple reports across fiscal periods, and a report may reference multiple entities through consolidation, this junction table captures each pairing explicitly. The `company_id` and `report_id` columns together form the composite key, ensuring that every filing is traceable to its issuer. This table enables queries that answer questions such as which companies filed annual reports in a given fiscal year, or which reports were issued by unlisted entities.

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

The companies_meetings table records the relationship between companies and the general meetings they convene. Each row links a `company_id` to a `meeting_id`, establishing which entity called the session. This table supports queries about meeting frequency per company, the types of meetings each entity holds, and whether quorum was achieved across a company's meeting history.

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

The meetings_shareholders table captures which shareholders attended or were entitled to attend each general meeting. By linking `meeting_id` to `shareholder_id`, this junction table enables queries about shareholder participation rates, the distribution of attendance across individual and institutional holders, and the relationship between share count and meeting attendance.

## Cross-Entity Relationships and Analytical Views

The power of the governance registry lies in its joined views, which synthesize data from multiple tables to answer specific operational questions. Each view combines base records into a single result set, allowing practitioners to trace relationships across the corporate ecosystem without manual cross-referencing.

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

This view joins the shareholders table with the companies table, producing a consolidated record for each shareholder-company pairing. The result answers the question: which shareholders hold equity in which companies, and what are the terms of those holdings? A row for Dana Nguyen in Link Title reveals a share count of 99,298, a registration date of 2023-06-19, and the company's listed status. An institutional row for Guam International Airport in Navistar International shows 1,122 shares and an unlisted company status. The view preserves the shareholder type, contact email, and the company's legal name and registration number, providing a complete snapshot of the equity relationship.

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

By joining shareholders with general_meetings, this view identifies which shareholders are associated with which meetings. The result answers: which shareholders are linked to which general meetings, and what are the meeting conditions? A row linking Kimberly Myers (shareholder_id lu_tax_code_template_b_VB-EC-15) to meeting ChIJd13ymnZu5kcRXM7jx5boJBs shows that the meeting was of type extraordinary, quorum was met, and the agenda item was pilot-agenda-74. Another row connects Dana Nguyen to meeting 20967529, an annual meeting where quorum was not met. The view preserves the shareholder's type and share count alongside the meeting's date, type, and quorum status.

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

This view joins companies with financial_reports, producing a detailed record for each company-report pairing. The result answers: which financial reports were filed by which companies, and what are the characteristics of those filings? A row for Link Title paired with report 1202-0008-S shows an annual report issued on 2022-01-17, covering fiscal period distributed-fiscal-66, with consolidated status and Compact Initiative as the auditor. A row for Stern Electronics paired with report L355 shows a quarterly report issued on 2024-11-12, with separate consolidation status and Regional Cluster A as the auditor. The view preserves the company's listing status and fiscal year alongside the report's type, issuance date, and publication URL.

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

This view joins companies with general_meetings, producing a consolidated record for each company-meeting pairing. The result answers: which general meetings were convened by which companies, and what were the meeting outcomes? A row for Link Title paired with meeting 20967529 shows an annual meeting on 2023-10-23 where quorum was not met, with agenda item baseline-agenda-73. A row for Interac Association paired with meeting ChIJd13ymnZu5kcRXM7jx5boJBs shows an extraordinary meeting on 2024-03-07 where quorum was met, with agenda item pilot-agenda-74. The view preserves the company's legal name and listing status alongside the meeting's type, date, and minute URL.

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

This view joins companies with investor_relations_directors, producing a record for each director-company pairing. The result answers: which investor relations directors are appointed to which companies, and what is their compliance standing? A row for Link Title paired with director 195339 shows an appointment year of 26, a reporting period of extended-reportin-27, and a compliant status. A row for Interac Association paired with director 9125611 shows an appointment year of 36, a reporting period of integrated-reportin-28, and a non-compliant status. The view preserves the company's legal name and listing status alongside the director's appointment details and compliance record.

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

This view joins financial_reports with companies, producing a consolidated record for each report-company pairing. The result answers: which companies issued which financial reports, and what are the report characteristics? A row for report 1202-0008-S paired with Link Title shows an annual report issued on 2022-01-17, with consolidated status and auditor Compact Initiative. A row for report 5844272 paired with Navistar International shows an annual report issued on 2025-04-23, with separate consolidation status and auditor Seasonal Review. The view preserves the report's type, fiscal period, and publication URL alongside the company's legal name and registration number.

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

This view joins financial_reports with regulatory_authorities, producing a record for each report-regulator pairing. The result answers: which regulatory authorities oversee which financial reports? A row for report 1202-0008-S paired with authority 974930 (Sean Green) shows jurisdiction regional-jurisdic-30 and regulation code 5917296. A row for report 8189500 paired with authority 5917289 (Elizabeth Woods) shows jurisdiction legacy-jurisdic-31 and regulation code 82874. The view preserves the report's type and issuance date alongside the authority's name, jurisdiction, and bulletin name.

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

This view joins general_meetings with companies, producing a consolidated record for each meeting-company pairing. The result answers: which companies convened which general meetings, and what were the meeting conditions? A row for meeting 20967529 paired with Link Title shows an annual meeting on 2023-10-23 with quorum not met and agenda item baseline-agenda-73. A row for meeting 922ad118-9bad-11eb-a8a2-19ed5c03f8d3 paired with Navistar International shows an extraordinary meeting on 2022-01-02 with quorum met and agenda item integrated-agenda-76. The view preserves the meeting's type, quorum status, and minute URL alongside the company's legal name and listing status.

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

This view joins general_meetings with shareholders, producing a record for each meeting-shareholder pairing. The result answers: which shareholders are associated with which general meetings, and what are the meeting and shareholder characteristics? A row linking meeting 20967529 to Dana Nguyen shows an annual meeting where quorum was not met, with the shareholder holding 99,298 shares. A row linking meeting ChIJd13ymnZu5kcRXM7jx5boJBs to Kimberly Myers (institutional) shows an extraordinary meeting where quorum was met, with the shareholder holding 16,954 shares. The view preserves the meeting's date, type, and agenda alongside the shareholder's type, registration date, and share count.

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

This view joins general_meetings with financial_reports, producing a record for each meeting-report pairing. The result answers: which financial reports are associated with which general meetings? A row linking meeting 20967529 to report 1202-0008-S shows an annual meeting addressing an annual report issued on 2022-01-17 with consolidated status. A row linking meeting ChIJd13ymnZu5kcRXM7jx5boJBs to report 8189500 shows an extraordinary meeting addressing a semi-annual report issued on 2023-06-01 with separate consolidation status. The view preserves the meeting's type and quorum status alongside the report's type, fiscal period, and auditor name.

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

This view joins regulatory_authorities with financial_reports, producing a consolidated record for each authority-report pairing. The result answers: which regulatory authorities oversee which financial reports, and what are the report details? A row for authority 974930 (Sean Green) paired with report 1202-0008-S shows jurisdiction regional-jurisdic-30, regulation code 5917296, and bulletin Bobby Flores. The report is an annual filing with consolidated status and auditor Compact Initiative. A row for authority 8843762 (Kimberly Smith) paired with report L355 shows jurisdiction compact-jurisdic-32, regulation code 1336197, and bulletin Edward Duran. The report is a quarterly filing with separate consolidation status and auditor Regional Cluster A.

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

This view joins regulatory_authorities with companies, producing a record for each authority-company pairing. The result answers: which regulatory authorities oversee which companies? A row for authority 974930 (Sean Green) paired with Link Title shows jurisdiction regional-jurisdic-30 and regulation code 5917296. The company is listed with fiscal year 17 and governance code 04750f92-9bac-11eb-a8a2-19ed5c03f8d3. A row for authority 2087738 (Kimberly Smith) paired with Navistar International shows jurisdiction composite-jurisdic-33 and regulation code 57e54d62-8fcd-11eb-924d-9cd76263cbd0. The company is unlisted with fiscal year 26 and governance code 674a3cd4-8fc5-11eb-924d-9cd76263cbd0.

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

This view joins investor_relations_directors with companies, producing a consolidated record for each director-company pairing. The result answers: which investor relations directors serve which companies, and what are their appointment and compliance details? A row for director 195339 serving Link Title shows appointment year 26, reporting period extended-reportin-27, and compliant status. The company is listed with legal name Adaptive Model and registration number REG-2136. A row for director 9125611 serving Interac Association shows appointment year 36, reporting period integrated-reportin-28, and non-compliant status. The company is unlisted with legal name Primary Cluster and registration number REG-2142.

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

This view joins investor_relations_directors with shareholders, producing a record for each director-shareholder pairing. The result answers: which investor relations directors report to which shareholders, and what are the director and shareholder characteristics? A row for director 195339 paired with shareholder 605948 (Dana Nguyen) shows the director's compliant status and extended-reportin-27 reporting period, alongside the shareholder's individual type, 99,298 share count, and registration date 2023-06-19. A row for director 9125611 paired with shareholder lu_tax_code_template_b_VB-EC-15 (Kimberly Myers, institutional) shows the director's non-compliant status and integrated-reportin-28 reporting period, alongside the shareholder's institutional type, 16,954 share count, and registration date 2024-11-03.

## Synthesis

The corporate governance registry presents a tightly interwoven ecosystem where companies, shareholders, financial reports, general meetings, regulatory authorities, and investor relations directors each occupy distinct but interconnected roles. The base tables capture the fundamental records—legal entities, equity holders, disclosure filings, procedural meetings, oversight bodies, and appointed directors—while the junction tables and analytical views synthesize these records into actionable relationships. Practitioners can trace a single company through its filings, its meetings, its directors, and its regulators, or follow a single shareholder through their holdings, their meeting participations, and the directors who serve them. The identifiers, dates, and compliance statuses embedded in each record provide the granularity needed for audit, verification, and strategic analysis across the full scope of corporate governance operations.