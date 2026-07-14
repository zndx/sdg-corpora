## Compliance Review Ecosystem

The compliance review ecosystem coordinates case review protocols across system domains, government agencies, expert reviewers, and academic institutions, with legal cases serving as the binding events that trigger and anchor each review cycle. Every protocol carries a versioned identifier, a status reflecting its lifecycle stage, and foreign references to the system domain it governs, the expert reviewer assigned, and the legal case that initiated it. System domains, in turn, declare their responsible agency, assessment criteria, and jurisdictional boundaries, while government agencies define their jurisdiction level and service type. Expert reviewers bring academic titles, specializations, and years of experience, and are linked to academic institutions that provide the organizational home for their assessments. Legal cases record court filings, case types, and statuses, and tie back to both the government agency with oversight and the protocol under which the review proceeds. Together these records form a structured, queryable ecosystem for tracking compliance reviews from initiation through resolution.

**Table `case_review_protocols`**

| id | protocol_identifier | protocol_name | version_number | review_date | status | scope_description | reviewer_name | system_domain_id | expert_reviewer_id | legal_case_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | PRO-2717 | Baseline Initiative D | VER-2245 | 2024-11-03T22:54:00 | draft | Integrated Model A | Baseline Initiative D | 1 | 1 | 100 | 2025-01-01 00:14:00 |
| 2 | PRO-2719 | Distributed Model | VER-2249 | 2025-04-14T05:11:00 | under_review | Extended Cluster | Distributed Model | 2 | 2 | 101 | 2025-02-06 03:14:00 |
| 3 | PRO-2721 | Adaptive Cluster | VER-2253 | 2022-09-25T12:28:00 | approved | Pilot Review | Adaptive Cluster | 3 | 3 | 102 | 2025-03-11 06:14:00 |
| 4 | PRO-2723 | Primary Review A | VER-2257 | 2023-02-09T19:45:00 | rejected | Baseline Initiative D | Primary Review A | 4 | 4 | 103 | 2025-04-16 09:14:00 |

Each case review protocol functions as the central scheduling and tracking record for a compliance review. The `protocol_identifier` column (e.g., `PRO-2717`, `PRO-2719`) provides a stable, human-readable key, while `protocol_name` (such as "Baseline Initiative D" or "Distributed Model") gives the review a descriptive label. The `version_number` column (e.g., `VER-2245`) tracks revisions to the protocol itself. The `review_date` records when the protocol was last reviewed, and `status` captures its current lifecycle stage—values observed include `draft`, `under_review`, `approved`, and `rejected`. The `scope_description` field (e.g., "Integrated Model A", "Extended Cluster") summarizes the operational scope of the review. The `reviewer_name` column mirrors the protocol name in the sample data, serving as a secondary label. Crucially, each protocol carries three foreign references: `system_domain_id` links it to the domain under review, `expert_reviewer_id` assigns the responsible reviewer, and `legal_case_id` ties the protocol to the triggering legal case. The `created_at` timestamp records when the protocol record was first established.

**Table `system_domains`**

| id | domain_identifier | domain_name | responsible_agency | assessment_criteria | is_within_jurisdiction | case_review_protocol_id | government_agency_id |
|---|---|---|---|---|---|---|---|
| 1 | DOM-2183 | Regional Protocol | General Telephone & Electronics | extended-assessme-63 | true | 1 | 100 |
| 2 | DOM-2187 | Seasonal Programme D | New Mexico Business Roundtable for Educational Excellence | integrated-assessme-64 | false | 2 | 101 |
| 3 | DOM-2191 | Integrated Standard | Senseonics Holdings Inc. | seasonal-assessme-65 | true | 3 | 102 |
| 4 | DOM-2195 | Extended Framework | National University of Singapore | regional-assessme-66 | false | 4 | 103 |

System domains represent the operational territories subject to compliance review. Each domain has a `domain_identifier` (e.g., `DOM-2183`, `DOM-2187`) and a `domain_name` such as "Regional Protocol" or "Seasonal Programme D". The `responsible_agency` column names the organization accountable for the domain—examples include "General Telephone & Electronics" and "New Mexico Business Roundtable for Educational Excellence". The `assessment_criteria` field (e.g., `extended-assessme-63`, `integrated-assessme-64`) encodes the evaluation framework applied to the domain. The boolean `is_within_jurisdiction` flag indicates whether the domain falls under the reviewing agency's authority. Each domain references a `case_review_protocol_id` and a `government_agency_id`, establishing its position within the broader review structure.

**Table `government_agencies`**

| government_agency_id | agency_identifier | agency_name | jurisdiction_level | service_type | established_date | system_domain_id | legal_case_id |
|---|---|---|---|---|---|---|---|
| 100 | Hinduja Group | FSG Social Impact Advisors | federal | composite-service-81 | 2024-03-27 | 1 | 100 |
| 101 | Arcimoto Inc. | Whirlpool Corporation | state | primary-service-82 | 2025-08-11 | 2 | 101 |
| 102 | McDonnell Douglas | Education Writers Association | local | adaptive-service-83 | 2022-01-22 | 3 | 102 |
| 103 | Sa Proton World International N.V. | Switch Card Services Ltd. | tribal | distributed-service-84 | 2023-06-06 | 4 | 103 |

Government agencies are the regulatory bodies that exercise oversight across system domains and legal cases. The `government_agency_id` (100–103) serves as the primary key, while `agency_identifier` provides a secondary code such as "Hinduja Group" or "Arcimoto Inc.". The `agency_name` column (e.g., "FSG Social Impact Advisors", "Whirlpool Corporation") gives the formal organizational name. The `jurisdiction_level` field classifies the agency's authority as `federal`, `state`, `local`, or `tribal`. The `service_type` column (e.g., `composite-service-81`, `primary-service-82`) describes the nature of the agency's regulatory service. The `established_date` records when the agency was founded. Each agency references a `system_domain_id` and a `legal_case_id`, anchoring it to both an operational domain and a legal proceeding.

**Table `expert_reviewers`**

| id | reviewer_identifier | reviewer_name | academic_title | institution | years_experience | specialization | review_date | case_review_protocol_id | academic_institution_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | REV-2660 | Baseline Initiative D | Pilot Review | baseline-institut-31 | 16 | legacy-speciali-13 | 2024-11-03T22:54:00 | 1 | 1 |
| 2 | REV-2662 | Distributed Model | Baseline Initiative | pilot-institut-32 | 22 | compact-speciali-14 | 2025-04-14T05:11:00 | 2 | 2 |
| 3 | REV-2664 | Adaptive Cluster | Distributed Model A | extended-institut-33 | 28 | composite-speciali-15 | 2022-09-25T12:28:00 | 3 | 3 |
| 4 | REV-2666 | Primary Review A | Adaptive Cluster | integrated-institut-34 | 34 | primary-speciali-16 | 2023-02-09T19:45:00 | 4 | 4 |

Expert reviewers are the individuals or entities responsible for conducting compliance assessments. The `reviewer_identifier` (e.g., `REV-2660`, `REV-2662`) provides a stable code, while `reviewer_name` (e.g., "Baseline Initiative D", "Distributed Model") gives the reviewer a descriptive label. The `academic_title` field (e.g., "Pilot Review", "Baseline Initiative") denotes the reviewer's formal academic designation. The `institution` column names the reviewer's primary organization, and `years_experience` records their tenure (values range from 16 to 34 years in the sample data). The `specialization` field (e.g., `legacy-speciali-13`, `compact-speciali-14`) captures the reviewer's area of expertise. The `review_date` records when the reviewer last conducted an assessment. Each reviewer references a `case_review_protocol_id` and an `academic_institution_id`, linking them to both the protocol they are reviewing and the institution that employs them.

**Table `academic_institutions`**

| academic_institution_id | institution_identifier | institution_name | location | department_name | college_name | expert_reviewer_id |
|---|---|---|---|---|---|---|
| 1 | INS-2717 | Extended Corridor | extended-location-99 | Baseline Framework D | Integrated Cluster A | 1 |
| 2 | INS-2718 | Pilot Series A | integrated-location-100 | Distributed Protocol | Extended Review | 2 |
| 3 | INS-2719 | Baseline Assessment | seasonal-location-101 | Adaptive Programme | Pilot Initiative | 3 |
| 4 | INS-2720 | Distributed Survey | regional-location-102 | Primary Standard A | Baseline Model D | 4 |

Academic institutions provide the organizational infrastructure supporting expert reviewers. The `academic_institution_id` (1–4) is the primary key, and `institution_identifier` (e.g., `INS-2717`, `INS-2718`) provides a secondary code. The `institution_name` column (e.g., "Extended Corridor", "Pilot Series A") gives the institution its name. The `location` field (e.g., `extended-location-99`, `integrated-location-100`) records the institution's geographic or administrative location. The `department_name` (e.g., "Baseline Framework D", "Distributed Protocol") and `college_name` (e.g., "Integrated Cluster A", "Extended Review") describe the institutional subdivisions. Each institution references an `expert_reviewer_id`, establishing the employment or affiliation relationship.

**Table `legal_cases`**

| id | case_number | court_name | filing_date | case_type | status | government_agency_id | case_review_protocol_id |
|---|---|---|---|---|---|---|---|
| 100 | CAS-2649 | Baseline Series D | 2023-02-09 | adaptive-case-95 | active | 100 | 1 |
| 101 | CAS-2654 | Distributed Assessment | 2024-07-20 | distributed-case-96 | closed | 101 | 2 |
| 102 | CAS-2659 | Adaptive Survey | 2025-12-04 | baseline-case-97 | pending | 102 | 3 |
| 103 | CAS-2664 | Primary Corridor A | 2022-05-15 | pilot-case-98 | active | 103 | 4 |

Legal cases are the triggering events that initiate compliance review protocols. The `case_number` (e.g., `CAS-2649`, `CAS-2654`) serves as the primary identifier, while `court_name` (e.g., "Baseline Series D", "Distributed Assessment") names the court or tribunal. The `filing_date` records when the case was filed, and `case_type` (e.g., `adaptive-case-95`, `distributed-case-96`) classifies the nature of the legal proceeding. The `status` field captures the case's current state—observed values include `active`, `closed`, and `pending`. Each legal case references a `government_agency_id` and a `case_review_protocol_id`, establishing the regulatory body with oversight and the protocol governing the review.

## Cross-Reference Views

The compliance review ecosystem is navigated through a set of joined views that answer specific operational questions by combining records from multiple tables. Each view exposes a particular relationship, allowing practitioners to trace how protocols, domains, agencies, reviewers, institutions, and legal cases interconnect.

**View `vw_case_review_protocol_system_domain`**

```sql
CREATE VIEW vw_case_review_protocol_system_domain AS
SELECT a.id, a.protocol_identifier, a.protocol_name, a.version_number, b.id AS domain_id, b.domain_identifier AS domain_domain_identifier, b.domain_name AS domain_domain_name
FROM case_review_protocols a JOIN system_domains b ON a.system_domain_id = b.id;
```

| id | protocol_identifier | protocol_name | version_number | domain_id | domain_domain_identifier | domain_domain_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2717 | Baseline Initiative D | VER-2245 | 1 | DOM-2183 | Regional Protocol |
| 2 | PRO-2719 | Distributed Model | VER-2249 | 2 | DOM-2187 | Seasonal Programme D |
| 3 | PRO-2721 | Adaptive Cluster | VER-2253 | 3 | DOM-2191 | Integrated Standard |
| 4 | PRO-2723 | Primary Review A | VER-2257 | 4 | DOM-2195 | Extended Framework |

This view answers the question: "Which system domain is associated with each case review protocol?" By joining `case_review_protocols` with `system_domains`, it reveals the operational territory each protocol governs. For example, protocol `PRO-2717` (Baseline Initiative D) is linked to system domain `DOM-2183` (Regional Protocol), which is assessed under the `extended-assessme-63` criteria and falls within the reviewing agency's jurisdiction. Protocol `PRO-2719` (Distributed Model) maps to domain `DOM-2187` (Seasonal Programme D), assessed under `integrated-assessme-64` and marked as outside the agency's jurisdiction.

**View `vw_case_review_protocol_expert_reviewer`**

```sql
CREATE VIEW vw_case_review_protocol_expert_reviewer AS
SELECT a.id, a.protocol_identifier, a.protocol_name, a.version_number, b.id AS reviewer_id, b.reviewer_identifier AS reviewer_reviewer_identifier, b.reviewer_name AS reviewer_reviewer_name
FROM case_review_protocols a JOIN expert_reviewers b ON a.expert_reviewer_id = b.id;
```

| id | protocol_identifier | protocol_name | version_number | reviewer_id | reviewer_reviewer_identifier | reviewer_reviewer_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2717 | Baseline Initiative D | VER-2245 | 1 | REV-2660 | Baseline Initiative D |
| 2 | PRO-2719 | Distributed Model | VER-2249 | 2 | REV-2662 | Distributed Model |
| 3 | PRO-2721 | Adaptive Cluster | VER-2253 | 3 | REV-2664 | Adaptive Cluster |
| 4 | PRO-2723 | Primary Review A | VER-2257 | 4 | REV-2666 | Primary Review A |

This view answers: "Which expert reviewer is assigned to each case review protocol?" The join between `case_review_protocols` and `expert_reviewers` exposes the human element of the review process. Protocol `PRO-2717` is assigned to reviewer `REV-2660` (Baseline Initiative D), who holds the academic title "Pilot Review", has 16 years of experience, and specializes in `legacy-speciali-13`. Protocol `PRO-2723` (Primary Review A) is assigned to reviewer `REV-2666` (Primary Review A), who has 34 years of experience and specializes in `primary-speciali-16`.

**View `vw_case_review_protocol_legal_case`**

```sql
CREATE VIEW vw_case_review_protocol_legal_case AS
SELECT a.id, a.protocol_identifier, a.protocol_name, a.version_number, b.id AS case_id, b.case_number AS case_case_number, b.court_name AS case_court_name
FROM case_review_protocols a JOIN legal_cases b ON a.legal_case_id = b.id;
```

| id | protocol_identifier | protocol_name | version_number | case_id | case_case_number | case_court_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2717 | Baseline Initiative D | VER-2245 | 100 | CAS-2649 | Baseline Series D |
| 2 | PRO-2719 | Distributed Model | VER-2249 | 101 | CAS-2654 | Distributed Assessment |
| 3 | PRO-2721 | Adaptive Cluster | VER-2253 | 102 | CAS-2659 | Adaptive Survey |
| 4 | PRO-2723 | Primary Review A | VER-2257 | 103 | CAS-2664 | Primary Corridor A |

This view answers: "Which legal case initiated each case review protocol?" The join between `case_review_protocols` and `legal_cases` traces the legal origin of each review. Protocol `PRO-2717` is tied to legal case `CAS-2649` (Baseline Series D), filed on 2023-02-09 under case type `adaptive-case-95` and currently marked `active`. Protocol `PRO-2721` (Adaptive Cluster) is linked to case `CAS-2659` (Adaptive Survey), filed on 2025-12-04 with case type `baseline-case-97` and status `pending`.

**View `vw_system_domain_case_review_protocol`**

```sql
CREATE VIEW vw_system_domain_case_review_protocol AS
SELECT a.id, a.domain_identifier, a.domain_name, a.responsible_agency, b.id AS protocol_id, b.protocol_identifier AS protocol_protocol_identifier, b.protocol_name AS protocol_protocol_name
FROM system_domains a JOIN case_review_protocols b ON a.case_review_protocol_id = b.id;
```

| id | domain_identifier | domain_name | responsible_agency | protocol_id | protocol_protocol_identifier | protocol_protocol_name |
|---|---|---|---|---|---|---|
| 1 | DOM-2183 | Regional Protocol | General Telephone & Electronics | 1 | PRO-2717 | Baseline Initiative D |
| 2 | DOM-2187 | Seasonal Programme D | New Mexico Business Roundtable for Educational Excellence | 2 | PRO-2719 | Distributed Model |
| 3 | DOM-2191 | Integrated Standard | Senseonics Holdings Inc. | 3 | PRO-2721 | Adaptive Cluster |
| 4 | DOM-2195 | Extended Framework | National University of Singapore | 4 | PRO-2723 | Primary Review A |

This view answers the inverse question: "Which case review protocols are associated with each system domain?" By joining `system_domains` with `case_review_protocols`, it reveals the protocols that govern a given domain. Domain `DOM-2183` (Regional Protocol), responsible to "General Telephone & Electronics", is governed by protocol `PRO-2717` (Baseline Initiative D), which is currently in `draft` status. Domain `DOM-2195` (Extended Framework), responsible to "National University of Singapore", is governed by protocol `PRO-2723` (Primary Review A), which has been `rejected`.

**View `vw_system_domain_government_agency`**

```sql
CREATE VIEW vw_system_domain_government_agency AS
SELECT a.id, a.domain_identifier, a.domain_name, a.responsible_agency, b.government_agency_id AS agency_government_agency_id, b.agency_identifier AS agency_agency_identifier, b.agency_name AS agency_agency_name
FROM system_domains a JOIN government_agencies b ON a.government_agency_id = b.government_agency_id;
```

| id | domain_identifier | domain_name | responsible_agency | agency_government_agency_id | agency_agency_identifier | agency_agency_name |
|---|---|---|---|---|---|---|
| 1 | DOM-2183 | Regional Protocol | General Telephone & Electronics | 100 | Hinduja Group | FSG Social Impact Advisors |
| 2 | DOM-2187 | Seasonal Programme D | New Mexico Business Roundtable for Educational Excellence | 101 | Arcimoto Inc. | Whirlpool Corporation |
| 3 | DOM-2191 | Integrated Standard | Senseonics Holdings Inc. | 102 | McDonnell Douglas | Education Writers Association |
| 4 | DOM-2195 | Extended Framework | National University of Singapore | 103 | Sa Proton World International N.V. | Switch Card Services Ltd. |

This view answers: "Which government agency oversees each system domain?" The join between `system_domains` and `government_agencies` maps domains to their regulatory bodies. Domain `DOM-2183` (Regional Protocol) is overseen by government agency `100` (Hinduja Group / FSG Social Impact Advisors), a federal-level agency providing `composite-service-81` and established on 2024-03-27. Domain `DOM-2195` (Extended Framework) is overseen by agency `103` (Sa Proton World International N.V. / Switch Card Services Ltd.), a tribal-level agency providing `distributed-service-84`.

**View `vw_government_agency_system_domain`**

```sql
CREATE VIEW vw_government_agency_system_domain AS
SELECT a.government_agency_id, a.agency_identifier, a.agency_name, a.jurisdiction_level, b.id AS domain_id, b.domain_identifier AS domain_domain_identifier, b.domain_name AS domain_domain_name
FROM government_agencies a JOIN system_domains b ON a.system_domain_id = b.id;
```

| government_agency_id | agency_identifier | agency_name | jurisdiction_level | domain_id | domain_domain_identifier | domain_domain_name |
|---|---|---|---|---|---|---|
| 100 | Hinduja Group | FSG Social Impact Advisors | federal | 1 | DOM-2183 | Regional Protocol |
| 101 | Arcimoto Inc. | Whirlpool Corporation | state | 2 | DOM-2187 | Seasonal Programme D |
| 102 | McDonnell Douglas | Education Writers Association | local | 3 | DOM-2191 | Integrated Standard |
| 103 | Sa Proton World International N.V. | Switch Card Services Ltd. | tribal | 4 | DOM-2195 | Extended Framework |

This view answers the inverse: "Which system domains are overseen by each government agency?" The join between `government_agencies` and `system_domains` reveals the operational reach of each agency. Agency `100` (Hinduja Group) oversees domain `DOM-2183` (Regional Protocol), which is assessed under `extended-assessme-63` and is within jurisdiction. Agency `102` (McDonnell Douglas) oversees domain `DOM-2191` (Integrated Standard), assessed under `seasonal-assessme-65` and within jurisdiction.

**View `vw_government_agency_legal_case`**

```sql
CREATE VIEW vw_government_agency_legal_case AS
SELECT a.government_agency_id, a.agency_identifier, a.agency_name, a.jurisdiction_level, b.id AS case_id, b.case_number AS case_case_number, b.court_name AS case_court_name
FROM government_agencies a JOIN legal_cases b ON a.legal_case_id = b.id;
```

| government_agency_id | agency_identifier | agency_name | jurisdiction_level | case_id | case_case_number | case_court_name |
|---|---|---|---|---|---|---|
| 100 | Hinduja Group | FSG Social Impact Advisors | federal | 100 | CAS-2649 | Baseline Series D |
| 101 | Arcimoto Inc. | Whirlpool Corporation | state | 101 | CAS-2654 | Distributed Assessment |
| 102 | McDonnell Douglas | Education Writers Association | local | 102 | CAS-2659 | Adaptive Survey |
| 103 | Sa Proton World International N.V. | Switch Card Services Ltd. | tribal | 103 | CAS-2664 | Primary Corridor A |

This view answers: "Which legal cases fall under the oversight of each government agency?" The join between `government_agencies` and `legal_cases` connects regulatory bodies to the legal proceedings they supervise. Agency `100` (Hinduja Group) oversees legal case `CAS-2649` (Baseline Series D), an `active` case of type `adaptive-case-95`. Agency `101` (Arcimoto Inc.) oversees case `CAS-2654` (Distributed Assessment), a `closed` case of type `distributed-case-96`.

**View `vw_expert_reviewer_case_review_protocol`**

```sql
CREATE VIEW vw_expert_reviewer_case_review_protocol AS
SELECT a.id, a.reviewer_identifier, a.reviewer_name, a.academic_title, b.id AS protocol_id, b.protocol_identifier AS protocol_protocol_identifier, b.protocol_name AS protocol_protocol_name
FROM expert_reviewers a JOIN case_review_protocols b ON a.case_review_protocol_id = b.id;
```

| id | reviewer_identifier | reviewer_name | academic_title | protocol_id | protocol_protocol_identifier | protocol_protocol_name |
|---|---|---|---|---|---|---|
| 1 | REV-2660 | Baseline Initiative D | Pilot Review | 1 | PRO-2717 | Baseline Initiative D |
| 2 | REV-2662 | Distributed Model | Baseline Initiative | 2 | PRO-2719 | Distributed Model |
| 3 | REV-2664 | Adaptive Cluster | Distributed Model A | 3 | PRO-2721 | Adaptive Cluster |
| 4 | REV-2666 | Primary Review A | Adaptive Cluster | 4 | PRO-2723 | Primary Review A |

This view answers: "Which case review protocols is each expert reviewer assigned to?" The join between `expert_reviewers` and `case_review_protocols` exposes the reviewer's workload. Reviewer `REV-2660` (Baseline Initiative D), with 16 years of experience and specialization in `legacy-speciali-13`, is assigned to protocol `PRO-2717` (Baseline Initiative D), which is in `draft` status. Reviewer `REV-2664` (Adaptive Cluster), with 28 years of experience and specialization in `composite-speciali-15`, is assigned to protocol `PRO-2721` (Adaptive Cluster), which has been `approved`.

**View `vw_expert_reviewer_academic_institution`**

```sql
CREATE VIEW vw_expert_reviewer_academic_institution AS
SELECT a.id, a.reviewer_identifier, a.reviewer_name, a.academic_title, b.academic_institution_id AS institution_academic_institution_id, b.institution_identifier AS institution_institution_identifier, b.institution_name AS institution_institution_name
FROM expert_reviewers a JOIN academic_institutions b ON a.academic_institution_id = b.academic_institution_id;
```

| id | reviewer_identifier | reviewer_name | academic_title | institution_academic_institution_id | institution_institution_identifier | institution_institution_name |
|---|---|---|---|---|---|---|
| 1 | REV-2660 | Baseline Initiative D | Pilot Review | 1 | INS-2717 | Extended Corridor |
| 2 | REV-2662 | Distributed Model | Baseline Initiative | 2 | INS-2718 | Pilot Series A |
| 3 | REV-2664 | Adaptive Cluster | Distributed Model A | 3 | INS-2719 | Baseline Assessment |
| 4 | REV-2666 | Primary Review A | Adaptive Cluster | 4 | INS-2720 | Distributed Survey |

This view answers: "Which academic institution is each expert reviewer affiliated with?" The join between `expert_reviewers` and `academic_institutions` reveals the institutional home of each reviewer. Reviewer `REV-2660` is affiliated with institution `INS-2717` (Extended Corridor), located at `extended-location-99`, within the "Baseline Framework D" department and "Integrated Cluster A" college. Reviewer `REV-2666` is affiliated with institution `INS-2720` (Distributed Survey), located at `regional-location-102`, within the "Primary Standard A" department and "Baseline Model D" college.

**View `vw_academic_institution_expert_reviewer`**

```sql
CREATE VIEW vw_academic_institution_expert_reviewer AS
SELECT a.academic_institution_id, a.institution_identifier, a.institution_name, a.location, b.id AS reviewer_id, b.reviewer_identifier AS reviewer_reviewer_identifier, b.reviewer_name AS reviewer_reviewer_name
FROM academic_institutions a JOIN expert_reviewers b ON a.expert_reviewer_id = b.id;
```

| academic_institution_id | institution_identifier | institution_name | location | reviewer_id | reviewer_reviewer_identifier | reviewer_reviewer_name |
|---|---|---|---|---|---|---|
| 1 | INS-2717 | Extended Corridor | extended-location-99 | 1 | REV-2660 | Baseline Initiative D |
| 2 | INS-2718 | Pilot Series A | integrated-location-100 | 2 | REV-2662 | Distributed Model |
| 3 | INS-2719 | Baseline Assessment | seasonal-location-101 | 3 | REV-2664 | Adaptive Cluster |
| 4 | INS-2720 | Distributed Survey | regional-location-102 | 4 | REV-2666 | Primary Review A |

This view answers the inverse: "Which expert reviewers are affiliated with each academic institution?" The join between `academic_institutions` and `expert_reviewers` maps institutions to their reviewers. Institution `INS-2717` (Extended Corridor) is home to reviewer `REV-2660` (Baseline Initiative D), who holds the academic title "Pilot Review" and has 16 years of experience. Institution `INS-2719` (Baseline Assessment) is home to reviewer `REV-2664` (Adaptive Cluster), who holds the academic title "Distributed Model A" and has 28 years of experience.

**View `vw_legal_case_government_agency`**

```sql
CREATE VIEW vw_legal_case_government_agency AS
SELECT a.id, a.case_number, a.court_name, a.filing_date, b.government_agency_id AS agency_government_agency_id, b.agency_identifier AS agency_agency_identifier, b.agency_name AS agency_agency_name
FROM legal_cases a JOIN government_agencies b ON a.government_agency_id = b.government_agency_id;
```

| id | case_number | court_name | filing_date | agency_government_agency_id | agency_agency_identifier | agency_agency_name |
|---|---|---|---|---|---|---|
| 100 | CAS-2649 | Baseline Series D | 2023-02-09 | 100 | Hinduja Group | FSG Social Impact Advisors |
| 101 | CAS-2654 | Distributed Assessment | 2024-07-20 | 101 | Arcimoto Inc. | Whirlpool Corporation |
| 102 | CAS-2659 | Adaptive Survey | 2025-12-04 | 102 | McDonnell Douglas | Education Writers Association |
| 103 | CAS-2664 | Primary Corridor A | 2022-05-15 | 103 | Sa Proton World International N.V. | Switch Card Services Ltd. |

This view answers: "Which government agency oversees each legal case?" The join between `legal_cases` and `government_agencies` connects legal proceedings to their regulatory bodies. Case `CAS-2649` (Baseline Series D), an `active` adaptive case, is overseen by agency `100` (Hinduja Group / FSG Social Impact Advisors), a federal agency established on 2024-03-27. Case `CAS-2659` (Adaptive Survey), a `pending` baseline case, is overseen by agency `102` (McDonnell Douglas / Education Writers Association), a local agency established on 2022-01-22.

**View `vw_legal_case_case_review_protocol`**

```sql
CREATE VIEW vw_legal_case_case_review_protocol AS
SELECT a.id, a.case_number, a.court_name, a.filing_date, b.id AS protocol_id, b.protocol_identifier AS protocol_protocol_identifier, b.protocol_name AS protocol_protocol_name
FROM legal_cases a JOIN case_review_protocols b ON a.case_review_protocol_id = b.id;
```

| id | case_number | court_name | filing_date | protocol_id | protocol_protocol_identifier | protocol_protocol_name |
|---|---|---|---|---|---|---|
| 100 | CAS-2649 | Baseline Series D | 2023-02-09 | 1 | PRO-2717 | Baseline Initiative D |
| 101 | CAS-2654 | Distributed Assessment | 2024-07-20 | 2 | PRO-2719 | Distributed Model |
| 102 | CAS-2659 | Adaptive Survey | 2025-12-04 | 3 | PRO-2721 | Adaptive Cluster |
| 103 | CAS-2664 | Primary Corridor A | 2022-05-15 | 4 | PRO-2723 | Primary Review A |

This view answers: "Which case review protocol governs each legal case?" The join between `legal_cases` and `case_review_protocols` traces the procedural framework applied to each legal proceeding. Case `CAS-2649` (Baseline Series D) is governed by protocol `PRO-2717` (Baseline Initiative D), version `VER-2245`, currently in `draft` status with scope "Integrated Model A". Case `CAS-2664` (Primary Corridor A), an `active` pilot case, is governed by protocol `PRO-2723` (Primary Review A), version `VER-2257`, which has been `rejected`.

## Synthesis

The compliance review ecosystem is a tightly interwoven structure where legal cases trigger protocols, protocols govern system domains, government agencies provide oversight, expert reviewers conduct assessments, and academic institutions house the reviewers. Each table captures a distinct facet of this process, and each view reveals a specific relationship that practitioners need to navigate the system. The foreign keys—`system_domain_id` on protocols, `expert_reviewer_id` on protocols, `legal_case_id` on protocols, `case_review_protocol_id` on domains, `government_agency_id` on domains, and so on—form a web of references that can be traversed through the provided views. Understanding these relationships allows practitioners to answer operational questions ranging from "Which reviewer is handling my protocol?" to "Which legal cases fall under this agency's jurisdiction?" to "What is the status of the protocol governing this domain?" The data, as structured, supports comprehensive tracking and reporting across the entire compliance review lifecycle.