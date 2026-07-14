## Research Programme Governance and Delivery

The architecture of modern research delivery rests on the disciplined coordination of people, institutions, funding bodies, and published outputs. Within this ecosystem, a research desk functions as the operational nucleus—a bounded initiative with a defined lifecycle, a responsible manager, a funding source, and a set of deliverables. The records captured across the domain tables describe how these elements interlock: desks are staffed by project managers drawn from academic and governmental institutions; those managers hold formal qualifications; development agencies provide the financial backing; and research outputs materialise as the tangible results of the work. Understanding the relationships among these entities is essential for programme auditors, resource planners, and anyone tasked with tracing accountability from funding through to publication.

**Table `research_desks`**

| research_desk_id | desk_identifier | agency_funded_by | start_date | end_date | status | response_type | project_manager_id | development_agency_id | research_output_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | DES-2339 | LDAP First Name Field | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planning | adaptive-response-23 | 1 | 1 | 100 |
| 101 | DES-2345 | Feedback Ratings | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | distributed-response-24 | 2 | 2 | 101 |
| 102 | DES-2351 | American International Group | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | baseline-response-25 | 3 | 3 | 102 |
| 103 | DES-2357 | Northrop Grumman | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | archived | pilot-response-26 | 4 | 4 | 103 |

A research desk is the primary unit of programme organisation. Each desk carries a unique identifier—DES-2339, DES-2345, DES-2351, DES-2357—and is characterised by a status that reflects its current phase: planning, active, completed, or archived. The desk at DES-2339, for instance, sits in the planning stage with an adaptive-response-23 classification, while DES-2345 is actively running under a distributed-response-24 designation. The temporal boundaries of each desk are recorded through start and end dates; DES-2351, for example, commenced on 2024-07-27 and concluded on 2024-07-23, marking it as completed. The desk records also carry foreign-key pointers to the project manager assigned, the development agency providing funding, and the research output produced, establishing the desk as the central join point across the entire dataset.

**Table `project_managers`**

| project_manager_id | manager_id | full_name | email | telephone | current_role | institution | research_desk_id | institution_id | academic_qualification_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | seasonal-email-11 | adaptive-telephon-23 | distributed-current-42 | baseline-institut-31 | 100 | 100 | 1 |
| 2 | 10449531 | Account Name | regional-email-12 | distributed-telephon-24 | baseline-current-43 | pilot-institut-32 | 101 | 101 | 2 |
| 3 | 659 | Saipan International Airport | legacy-email-13 | baseline-telephon-25 | pilot-current-44 | extended-institut-33 | 102 | 102 | 3 |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-email-14 | pilot-telephon-26 | extended-current-45 | integrated-institut-34 | 103 | 103 | 4 |

Project managers are the individuals—or, in some records, the organisational entities—charged with steering research desks. The manager table stores a full name, contact details, and a current role classification. Theodore Mcgrath (manager_id 1) holds the distributed-current-42 role and is linked to research desk 100, while Norma Fisher (manager_id 4) carries the extended-current-45 role and oversees desk 103. The manager records also reference an institution and an academic qualification, anchoring each manager within the broader academic and institutional fabric of the programme. The manager_id column serves as the bridge to the research desks, meaning that every desk can be traced back to the person responsible for its execution.

**Table `development_agencies`**

| id | agency_code | agency_name | country_of_origin | funding_program | established_year | research_desk_id | funds_research_desk_id |
|---|---|---|---|---|---|---|---|
| 1 | PureCycle Technologies. | FSG Social Impact Advisors | compact-country-80 | regional-funding-96 | 10 | 100 | 100 |
| 2 | LDAP First Name Field | Whirlpool Corporation | composite-country-81 | legacy-funding-97 | 16 | 101 | 101 |
| 3 | Tata Steel | Education Writers Association | primary-country-82 | compact-funding-98 | 22 | 102 | 102 |
| 4 | American Tower Corp. | Switch Card Services Ltd. | adaptive-country-83 | composite-funding-99 | 28 | 103 | 103 |

Development agencies supply the financial resources that enable research desks to operate. The agency table records an agency code, a name, a country of origin, and a funding programme classification. PureCycle Technologies. (agency code 1) operates under the compact-country-80 designation and funds research desk 100, while American Tower Corp. (agency code 4) originates from adaptive-country-83 and supports desk 103. The established_year field provides a sense of institutional maturity, ranging from 10 years for the first agency to 28 years for the fourth. Each agency record includes a research_desk_id and a funds_research_desk_id, both pointing to the desk it finances, which creates a direct financial linkage between the funding body and the operational unit.

**Table `research_outputs`**

| id | output_id | title | publication_date | format | access_level | page_count | research_desk_id | project_manager_id | research_output_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 3717613 | Compact Initiative | 2025-12-01 | legacy-format-25 | open | 6 | 100 | 1 | 100 |
| 101 | 937738 | Legacy Model | 2022-05-12 | compact-format-26 | restricted | 7 | 101 | 2 | 101 |
| 102 | 974934 | Regional Cluster A | 2023-10-23 | composite-format-27 | internal | 0 | 102 | 3 | 102 |
| 103 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2024-03-07 | primary-format-28 | open | 15 | 103 | 4 | 103 |

Research outputs represent the published or produced results of desk activities. Each output carries a title—Compact Initiative, Legacy Model, Regional Cluster A, Seasonal Review—a publication date, a format classification, and an access level. The output Compact Initiative (id 100) was published on 2025-12-01 in legacy-format-25 with open access and spans six pages, whereas Legacy Model (id 101) appeared on 2022-05-12 in compact-format-26 under restricted access with seven pages. The access_level field distinguishes between open, restricted, and internal distributions, which is critical for compliance and dissemination planning. The output records reference both a research desk and a project manager, closing the loop from planning through execution to publication.

**Table `academic_qualifications`**

| id | qualification_id | degree_type | field_of_study | awarding_institution | graduation_year | distinction_level | project_manager_id | institution_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | compact-degree-62 | legacy-field-25 | distributed-awarding-30 | 38 | primary-distinct-28 | 1 | 100 |
| 2 | 1562831 | composite-degree-63 | compact-field-26 | baseline-awarding-31 | 45 | adaptive-distinct-29 | 2 | 101 |
| 3 | 9424925 | primary-degree-64 | composite-field-27 | pilot-awarding-32 | 52 | distributed-distinct-30 | 3 | 102 |
| 4 | 1996940 | adaptive-degree-65 | primary-field-28 | extended-awarding-33 | 59 | baseline-distinct-31 | 4 | 103 |

Academic qualifications document the formal credentials of project managers. Each qualification record specifies a degree type, a field of study, the awarding institution, the graduation year, and a distinction level. Manager 1 holds a compact-degree-62 in legacy-field-25, awarded by distributed-awarding-30 in year 38 with a primary-distinct-28 distinction. Manager 4 possesses an adaptive-degree-65 in primary-field-28 from extended-awarding-33, graduated in year 59 with a baseline-distinct-31 distinction. The graduation_year values increase across the dataset (38, 45, 52, 59), suggesting a progression of seniority or experience among the managers. The project_manager_id column links each qualification to its holder, and the institution_id ties the awarding body to the institutions table.

**Table `institutions`**

| institution_id | institution_code | institution_name | country | institution_type | founded_year | address | project_manager_id | academic_qualification_id | research_desk_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 4092 | Extended Corridor | compact-country-26 | university | 27 | distributed-address-72 | 1 | 1 | 100 | 2025-01-01 00:14:00 |
| 101 | 82873 | Pilot Series A | composite-country-27 | research_centre | 31 | baseline-address-73 | 2 | 2 | 101 | 2025-02-06 03:14:00 |
| 102 | state_uk_20 | Baseline Assessment | primary-country-28 | ngo | 35 | pilot-address-74 | 3 | 3 | 102 | 2025-03-11 06:14:00 |
| 103 | 8928518 | Distributed Survey | adaptive-country-29 | government | 39 | extended-address-75 | 4 | 4 | 103 | 2025-04-16 09:14:00 |

Institutions are the organisations—universities, research centres, NGOs, government bodies—where project managers are based and from which qualifications are awarded. The institutions table records an institution code, name, country, type, founding year, and address. Extended Corridor (institution_id 100) is a university founded in year 27, located at distributed-address-72, and is associated with project manager 1. Pilot Series A (institution_id 101) is a research centre established in year 31, linked to manager 2. The institution_type field categorises each organisation as university, research_centre, ngo, or government, which is relevant for understanding the diversity of the programme's institutional base. The created_at timestamp records when the institution record was entered into the system, ranging from 2025-01-01 to 2025-04-16.

### Research Desk and Project Manager Alignment

**View `vw_research_desk_project_manager`**

```sql
CREATE VIEW vw_research_desk_project_manager AS
SELECT a.research_desk_id, a.desk_identifier, a.agency_funded_by, a.start_date, b.project_manager_id AS manager_project_manager_id, b.manager_id AS manager_manager_id, b.full_name AS manager_full_name
FROM research_desks a JOIN project_managers b ON a.project_manager_id = b.project_manager_id;
```

| research_desk_id | desk_identifier | agency_funded_by | start_date | manager_project_manager_id | manager_manager_id | manager_full_name |
|---|---|---|---|---|---|---|
| 100 | DES-2339 | LDAP First Name Field | 2022-09-05T20:24:00 | 1 | id_23 | Theodore Mcgrath |
| 101 | DES-2345 | Feedback Ratings | 2023-02-16T03:41:00 | 2 | 10449531 | Account Name |
| 102 | DES-2351 | American International Group | 2024-07-27T10:58:00 | 3 | 659 | Saipan International Airport |
| 103 | DES-2357 | Northrop Grumman | 2025-12-11T17:15:00 | 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |

This view answers the question of which project manager is responsible for each research desk, combining the desk's operational metadata with the manager's personal and contact details. The joined result for desk DES-2339 (id 100) shows manager Theodore Mcgrath (manager_id 1) in the distributed-current-42 role, confirming that the planning-phase desk is assigned to a manager whose current role classification aligns with the desk's adaptive-response-23 type. Similarly, desk DES-2357 (id 103) is managed by Norma Fisher (manager_id 4) in the extended-current-45 role, and the desk itself is archived, suggesting the manager has completed their assignment. The view enables programme coordinators to verify staffing coverage and to cross-reference desk status with manager role classifications.

### Research Desk and Development Agency Funding

**View `vw_research_desk_development_agency`**

```sql
CREATE VIEW vw_research_desk_development_agency AS
SELECT a.research_desk_id, a.desk_identifier, a.agency_funded_by, a.start_date, b.id AS agency_id, b.agency_code AS agency_agency_code, b.agency_name AS agency_agency_name
FROM research_desks a JOIN development_agencies b ON a.development_agency_id = b.id;
```

| research_desk_id | desk_identifier | agency_funded_by | start_date | agency_id | agency_agency_code | agency_agency_name |
|---|---|---|---|---|---|---|
| 100 | DES-2339 | LDAP First Name Field | 2022-09-05T20:24:00 | 1 | PureCycle Technologies. | FSG Social Impact Advisors |
| 101 | DES-2345 | Feedback Ratings | 2023-02-16T03:41:00 | 2 | LDAP First Name Field | Whirlpool Corporation |
| 102 | DES-2351 | American International Group | 2024-07-27T10:58:00 | 3 | Tata Steel | Education Writers Association |
| 103 | DES-2357 | Northrop Grumman | 2025-12-11T17:15:00 | 4 | American Tower Corp. | Switch Card Services Ltd. |

This view reveals the financial relationship between research desks and their funding agencies. For desk DES-2345 (id 101), the funding agency is recorded as LDAP First Name Field, originating from composite-country-81 under the legacy-funding-97 programme. The desk is in active status with a distributed-response-24 classification, indicating that the legacy-funding-97 programme is currently supporting an active research initiative. Desk DES-2351 (id 102), which is completed, was funded by Tata Steel from primary-country-82 under the compact-funding-98 programme. The view allows auditors to trace each desk's funding lineage and to assess whether completed or archived desks were appropriately resourced.

### Research Desk and Research Output Delivery

**View `vw_research_desk_research_output`**

```sql
CREATE VIEW vw_research_desk_research_output AS
SELECT a.research_desk_id, a.desk_identifier, a.agency_funded_by, a.start_date, b.id AS output_id, b.output_id AS output_output_id, b.title AS output_title
FROM research_desks a JOIN research_outputs b ON a.research_output_id = b.id;
```

| research_desk_id | desk_identifier | agency_funded_by | start_date | output_id | output_output_id | output_title |
|---|---|---|---|---|---|---|
| 100 | DES-2339 | LDAP First Name Field | 2022-09-05T20:24:00 | 100 | 3717613 | Compact Initiative |
| 101 | DES-2345 | Feedback Ratings | 2023-02-16T03:41:00 | 101 | 937738 | Legacy Model |
| 102 | DES-2351 | American International Group | 2024-07-27T10:58:00 | 102 | 974934 | Regional Cluster A |
| 103 | DES-2357 | Northrop Grumman | 2025-12-11T17:15:00 | 103 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review |

This view connects each research desk to its corresponding research output, enabling verification that every desk has a deliverable and that the output's metadata aligns with the desk's lifecycle. Desk DES-2339 (id 100) produced the output Compact Initiative (id 100), published on 2025-12-01 with open access and six pages. The desk is in planning status, which suggests the output was produced ahead of or during the desk's operational window. Desk DES-2357 (id 103), now archived, produced Seasonal Review (id 103), published on 2024-03-07 with open access and fifteen pages. The page count and access level in the output provide a measure of the desk's scholarly contribution, while the publication_date can be compared against the desk's start and end dates to assess delivery timeliness.

### Project Manager and Research Desk Assignment

**View `vw_project_manager_research_desk`**

```sql
CREATE VIEW vw_project_manager_research_desk AS
SELECT a.project_manager_id, a.manager_id, a.full_name, a.email, b.research_desk_id AS desk_research_desk_id, b.desk_identifier AS desk_desk_identifier, b.agency_funded_by AS desk_agency_funded_by
FROM project_managers a JOIN research_desks b ON a.research_desk_id = b.research_desk_id;
```

| project_manager_id | manager_id | full_name | email | desk_research_desk_id | desk_desk_identifier | desk_agency_funded_by |
|---|---|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | seasonal-email-11 | 100 | DES-2339 | LDAP First Name Field |
| 2 | 10449531 | Account Name | regional-email-12 | 101 | DES-2345 | Feedback Ratings |
| 3 | 659 | Saipan International Airport | legacy-email-13 | 102 | DES-2351 | American International Group |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-email-14 | 103 | DES-2357 | Northrop Grumman |

This view inverts the perspective from the desk to the manager, showing which research desk each project manager oversees. Theodore Mcgrath (manager_id 1) is assigned to research desk 100 (DES-2339), which is in planning status and funded by PureCycle Technologies. under the compact-country-80 designation. Norma Fisher (manager_id 4) manages desk 103 (DES-2357), which is archived and funded by American Tower Corp. from adaptive-country-83. The view is useful for workload analysis: each manager in the dataset is assigned to exactly one desk, suggesting a one-to-one staffing model. The desk's status and the manager's current_role can be compared to identify potential mismatches, such as a manager in an extended-current-45 role overseeing an archived desk.

### Project Manager and Institutional Affiliation

**View `vw_project_manager_institution`**

```sql
CREATE VIEW vw_project_manager_institution AS
SELECT a.project_manager_id, a.manager_id, a.full_name, a.email, b.institution_id AS institution_institution_id, b.institution_code AS institution_institution_code, b.institution_name AS institution_institution_name
FROM project_managers a JOIN institutions b ON a.institution_id = b.institution_id;
```

| project_manager_id | manager_id | full_name | email | institution_institution_id | institution_institution_code | institution_institution_name |
|---|---|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | seasonal-email-11 | 100 | 4092 | Extended Corridor |
| 2 | 10449531 | Account Name | regional-email-12 | 101 | 82873 | Pilot Series A |
| 3 | 659 | Saipan International Airport | legacy-email-13 | 102 | state_uk_20 | Baseline Assessment |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-email-14 | 103 | 8928518 | Distributed Survey |

This view links project managers to their home institutions, providing a clear picture of the institutional distribution of managerial talent. Theodore Mcgrath (manager_id 1) is affiliated with institution 100 (Extended Corridor), a university founded in year 27. Norma Fisher (manager_id 4) is based at institution 103 (Distributed Survey), a government organisation established in year 39. The institution_type field reveals that the programme draws managers from a diverse set of organisational forms: university, research_centre, ngo, and government. This diversity is significant for programme governance, as it implies that managerial practices and accountability structures may vary across institutional types.

### Project Manager and Academic Qualification

**View `vw_project_manager_academic_qualification`**

```sql
CREATE VIEW vw_project_manager_academic_qualification AS
SELECT a.project_manager_id, a.manager_id, a.full_name, a.email, b.id AS qualification_id, b.qualification_id AS qualification_qualification_id, b.degree_type AS qualification_degree_type
FROM project_managers a JOIN academic_qualifications b ON a.academic_qualification_id = b.id;
```

| project_manager_id | manager_id | full_name | email | qualification_id | qualification_qualification_id | qualification_degree_type |
|---|---|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | seasonal-email-11 | 1 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | compact-degree-62 |
| 2 | 10449531 | Account Name | regional-email-12 | 2 | 1562831 | composite-degree-63 |
| 3 | 659 | Saipan International Airport | legacy-email-13 | 3 | 9424925 | primary-degree-64 |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-email-14 | 4 | 1996940 | adaptive-degree-65 |

This view maps each project manager to their formal academic credential, enabling verification of qualification requirements and the assessment of the programme's intellectual capital. Manager Theodore Mcgrath (manager_id 1) holds a compact-degree-62 in legacy-field-25, awarded by distributed-awarding-30 in year 38 with a primary-distinct-28 distinction. Manager Norma Fisher (manager_id 4) holds an adaptive-degree-65 in primary-field-28 from extended-awarding-33, graduated in year 59 with a baseline-distinct-31 distinction. The graduation_year progression (38 through 59) and the variation in distinction levels (primary-distinct-28 through baseline-distinct-31) suggest that the programme accommodates managers at different career stages. The field_of_study values indicate a range of specialisations across the managerial team.

### Development Agency and Research Desk Funding

**View `vw_development_agency_research_desk`**

```sql
CREATE VIEW vw_development_agency_research_desk AS
SELECT a.id, a.agency_code, a.agency_name, a.country_of_origin, b.research_desk_id AS desk_research_desk_id, b.desk_identifier AS desk_desk_identifier, b.agency_funded_by AS desk_agency_funded_by
FROM development_agencies a JOIN research_desks b ON a.research_desk_id = b.research_desk_id;
```

| id | agency_code | agency_name | country_of_origin | desk_research_desk_id | desk_desk_identifier | desk_agency_funded_by |
|---|---|---|---|---|---|---|
| 1 | PureCycle Technologies. | FSG Social Impact Advisors | compact-country-80 | 100 | DES-2339 | LDAP First Name Field |
| 2 | LDAP First Name Field | Whirlpool Corporation | composite-country-81 | 101 | DES-2345 | Feedback Ratings |
| 3 | Tata Steel | Education Writers Association | primary-country-82 | 102 | DES-2351 | American International Group |
| 4 | American Tower Corp. | Switch Card Services Ltd. | adaptive-country-83 | 103 | DES-2357 | Northrop Grumman |

This view presents the funding relationship from the agency's perspective, showing which research desk each development agency supports. PureCycle Technologies. (agency id 1) funds research desk 100 (DES-2339), which is in planning status with an adaptive-response-23 classification. American Tower Corp. (agency id 4) funds research desk 103 (DES-2357), which is archived. The agency's funding_programme—compact-funding-98 for Tata Steel, composite-funding-99 for American Tower Corp.—provides context for the type of financial support provided. The established_year of the agency (ranging from 10 to 28) can be compared with the desk's start_date to assess whether newer or more established agencies are associated with different desk statuses or response types.

### Research Output and Research Desk Attribution

**View `vw_research_output_research_desk`**

```sql
CREATE VIEW vw_research_output_research_desk AS
SELECT a.id, a.output_id, a.title, a.publication_date, b.research_desk_id AS desk_research_desk_id, b.desk_identifier AS desk_desk_identifier, b.agency_funded_by AS desk_agency_funded_by
FROM research_outputs a JOIN research_desks b ON a.research_desk_id = b.research_desk_id;
```

| id | output_id | title | publication_date | desk_research_desk_id | desk_desk_identifier | desk_agency_funded_by |
|---|---|---|---|---|---|---|
| 100 | 3717613 | Compact Initiative | 2025-12-01 | 100 | DES-2339 | LDAP First Name Field |
| 101 | 937738 | Legacy Model | 2022-05-12 | 101 | DES-2345 | Feedback Ratings |
| 102 | 974934 | Regional Cluster A | 2023-10-23 | 102 | DES-2351 | American International Group |
| 103 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2024-03-07 | 103 | DES-2357 | Northrop Grumman |

This view traces each research output back to the desk that produced it, confirming the desk-to-output linkage and enabling quality assessment. The output Compact Initiative (id 100) is attributed to research desk 100 (DES-2339), published on 2025-12-01 in legacy-format-25 with open access and six pages. The output Seasonal Review (id 103) is attributed to desk 103 (DES-2357), published on 2024-03-07 in primary-format-28 with open access and fifteen pages. The format classification and page count vary across outputs, reflecting the diversity of deliverable types. The access_level field—open, restricted, or internal—indicates the dissemination strategy for each output, which may be influenced by the desk's response_type or the funding agency's requirements.

### Research Output and Project Manager Attribution

**View `vw_research_output_project_manager`**

```sql
CREATE VIEW vw_research_output_project_manager AS
SELECT a.id, a.output_id, a.title, a.publication_date, b.project_manager_id AS manager_project_manager_id, b.manager_id AS manager_manager_id, b.full_name AS manager_full_name
FROM research_outputs a JOIN project_managers b ON a.project_manager_id = b.project_manager_id;
```

| id | output_id | title | publication_date | manager_project_manager_id | manager_manager_id | manager_full_name |
|---|---|---|---|---|---|---|
| 100 | 3717613 | Compact Initiative | 2025-12-01 | 1 | id_23 | Theodore Mcgrath |
| 101 | 937738 | Legacy Model | 2022-05-12 | 2 | 10449531 | Account Name |
| 102 | 974934 | Regional Cluster A | 2023-10-23 | 3 | 659 | Saipan International Airport |
| 103 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2024-03-07 | 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |

This view connects research outputs to the project managers responsible for their production, closing the accountability chain from output to individual. The output Compact Initiative (id 100) was produced under the stewardship of project manager 1 (Theodore Mcgrath), who holds the distributed-current-42 role. The output Seasonal Review (id 103) was produced by project manager 4 (Norma Fisher), who holds the extended-current-45 role. The manager's current_role classification can be compared with the output's format and access_level to identify patterns—for example, whether managers in certain role classifications tend to produce outputs with specific access restrictions. This view is particularly valuable for performance evaluation and for attributing scholarly contributions to individual managers.

### Research Output Self-Reference

**View `vw_research_output_research_output`**

```sql
CREATE VIEW vw_research_output_research_output AS
SELECT a.id, a.output_id, a.title, a.publication_date, b.id AS output_id, b.output_id AS output_output_id, b.title AS output_title
FROM research_outputs a JOIN research_outputs b ON a.research_output_id = b.id;
```

| id | output_id | title | publication_date | output_id | output_output_id | output_title |
|---|---|---|---|---|---|---|
| 100 | 3717613 | Compact Initiative | 2025-12-01 | 100 | 3717613 | Compact Initiative |
| 101 | 937738 | Legacy Model | 2022-05-12 | 101 | 937738 | Legacy Model |
| 102 | 974934 | Regional Cluster A | 2023-10-23 | 102 | 974934 | Regional Cluster A |
| 103 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2024-03-07 | 103 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review |

This self-referential view on the research outputs table provides a mechanism for comparing output records against one another, enabling analysis of output characteristics across the programme. The output Compact Initiative (id 100) has a page count of 6 and open access, while Legacy Model (id 101) has 7 pages and restricted access. Regional Cluster A (id 102) has 0 pages and internal access, suggesting it may be a preliminary or metadata-only deliverable. Seasonal Review (id 103) has 15 pages and open access, making it the most substantial output in the dataset. The publication dates range from 2022-05-12 to 2025-12-01, spanning nearly four years, which indicates a sustained publication programme. The format classifications (legacy-format-25 through primary-format-28) suggest multiple publication channels or standards in use.

### Academic Qualification and Project Manager Linkage

**View `vw_academic_qualification_project_manager`**

```sql
CREATE VIEW vw_academic_qualification_project_manager AS
SELECT a.id, a.qualification_id, a.degree_type, a.field_of_study, b.project_manager_id AS manager_project_manager_id, b.manager_id AS manager_manager_id, b.full_name AS manager_full_name
FROM academic_qualifications a JOIN project_managers b ON a.project_manager_id = b.project_manager_id;
```

| id | qualification_id | degree_type | field_of_study | manager_project_manager_id | manager_manager_id | manager_full_name |
|---|---|---|---|---|---|---|
| 1 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | compact-degree-62 | legacy-field-25 | 1 | id_23 | Theodore Mcgrath |
| 2 | 1562831 | composite-degree-63 | compact-field-26 | 2 | 10449531 | Account Name |
| 3 | 9424925 | primary-degree-64 | composite-field-27 | 3 | 659 | Saipan International Airport |
| 4 | 1996940 | adaptive-degree-65 | primary-field-28 | 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |

This view presents the academic credentials of each project manager in a consolidated format, making it straightforward to verify qualification requirements and to assess the educational background of the managerial team. Manager Theodore Mcgrath (manager_id 1) holds a compact-degree-62 in legacy-field-25, awarded by distributed-awarding-30 in year 38 with a primary-distinct-28 distinction. Manager Norma Fisher (manager_id 4) holds an adaptive-degree-65 in primary-field-28, awarded by extended-awarding-33 in year 59 with a baseline-distinct-31 distinction. The degree_type and field_of_study values vary across managers, indicating a multidisciplinary team. The distinction_level field provides a measure of academic achievement, with levels ranging from primary-distinct-28 to baseline-distinct-31.

### Academic Qualification and Awarding Institution

**View `vw_academic_qualification_institution`**

```sql
CREATE VIEW vw_academic_qualification_institution AS
SELECT a.id, a.qualification_id, a.degree_type, a.field_of_study, b.institution_id AS institution_institution_id, b.institution_code AS institution_institution_code, b.institution_name AS institution_institution_name
FROM academic_qualifications a JOIN institutions b ON a.institution_id = b.institution_id;
```

| id | qualification_id | degree_type | field_of_study | institution_institution_id | institution_institution_code | institution_institution_name |
|---|---|---|---|---|---|---|
| 1 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | compact-degree-62 | legacy-field-25 | 100 | 4092 | Extended Corridor |
| 2 | 1562831 | composite-degree-63 | compact-field-26 | 101 | 82873 | Pilot Series A |
| 3 | 9424925 | primary-degree-64 | composite-field-27 | 102 | state_uk_20 | Baseline Assessment |
| 4 | 1996940 | adaptive-degree-65 | primary-field-28 | 103 | 8928518 | Distributed Survey |

This view links academic qualifications to the institutions that awarded them, revealing the provenance of managerial credentials. The compact-degree-62 held by manager 1 was awarded by distributed-awarding-30, while the adaptive-degree-65 held by manager 4 was awarded by extended-awarding-33. The awarding_institution values (distributed-awarding-30 through extended-awarding-33) correspond to the institution records, allowing cross-referencing with institution_type and country information. This view is useful for assessing the geographic and institutional diversity of the programme's educational base, and for verifying that qualifications were awarded by recognised institutions.

### Institution and Project Manager Affiliation

**View `vw_institution_project_manager`**

```sql
CREATE VIEW vw_institution_project_manager AS
SELECT a.institution_id, a.institution_code, a.institution_name, a.country, b.project_manager_id AS manager_project_manager_id, b.manager_id AS manager_manager_id, b.full_name AS manager_full_name
FROM institutions a JOIN project_managers b ON a.project_manager_id = b.project_manager_id;
```

| institution_id | institution_code | institution_name | country | manager_project_manager_id | manager_manager_id | manager_full_name |
|---|---|---|---|---|---|---|
| 100 | 4092 | Extended Corridor | compact-country-26 | 1 | id_23 | Theodore Mcgrath |
| 101 | 82873 | Pilot Series A | composite-country-27 | 2 | 10449531 | Account Name |
| 102 | state_uk_20 | Baseline Assessment | primary-country-28 | 3 | 659 | Saipan International Airport |
| 103 | 8928518 | Distributed Survey | adaptive-country-29 | 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher |

This view presents the institutional affiliations of project managers, showing which organisation each manager is based at and what type of institution it is. Manager Theodore Mcgrath (manager_id 1) is affiliated with Extended Corridor (institution_id 100), a university founded in year 27. Manager Norma Fisher (manager_id 4) is based at Distributed Survey (institution_id 103), a government organisation founded in year 39. The institution_type field—university, research_centre, ngo, government—provides a clear categorisation of the programme's institutional base. The founded_year values (27 through 39) suggest a mix of established and newer institutions. The address field (distributed-address-72 through extended-address-75) provides location information that may be relevant for geographic analysis of the programme's reach.

### Institution and Academic Qualification Provenance

**View `vw_institution_academic_qualification`**

```sql
CREATE VIEW vw_institution_academic_qualification AS
SELECT a.institution_id, a.institution_code, a.institution_name, a.country, b.id AS qualification_id, b.qualification_id AS qualification_qualification_id, b.degree_type AS qualification_degree_type
FROM institutions a JOIN academic_qualifications b ON a.academic_qualification_id = b.id;
```

| institution_id | institution_code | institution_name | country | qualification_id | qualification_qualification_id | qualification_degree_type |
|---|---|---|---|---|---|---|
| 100 | 4092 | Extended Corridor | compact-country-26 | 1 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | compact-degree-62 |
| 101 | 82873 | Pilot Series A | composite-country-27 | 2 | 1562831 | composite-degree-63 |
| 102 | state_uk_20 | Baseline Assessment | primary-country-28 | 3 | 9424925 | primary-degree-64 |
| 103 | 8928518 | Distributed Survey | adaptive-country-29 | 4 | 1996940 | adaptive-degree-65 |

This view connects institutions to the academic qualifications they have awarded, enabling analysis of the educational output of each institution. Institution 100 (Extended Corridor) is associated with qualification id 1, a compact-degree-62 in legacy-field-25 awarded in year 38 with a primary-distinct-28 distinction. Institution 103 (Distributed Survey) is associated with qualification id 4, an adaptive-degree-65 in primary-field-28 awarded in year 59 with a baseline-distinct-31 distinction. The graduation_year values (38 through 59) and distinction levels (primary-distinct-28 through baseline-distinct-31) vary across institutions, suggesting differences in academic rigour or programme focus. This view is valuable for institutional benchmarking and for understanding the educational ecosystem that supports the research programme.

### Institution and Research Desk Association

**View `vw_institution_research_desk`**

```sql
CREATE VIEW vw_institution_research_desk AS
SELECT a.institution_id, a.institution_code, a.institution_name, a.country, b.research_desk_id AS desk_research_desk_id, b.desk_identifier AS desk_desk_identifier, b.agency_funded_by AS desk_agency_funded_by
FROM institutions a JOIN research_desks b ON a.research_desk_id = b.research_desk_id;
```

| institution_id | institution_code | institution_name | country | desk_research_desk_id | desk_desk_identifier | desk_agency_funded_by |
|---|---|---|---|---|---|---|
| 100 | 4092 | Extended Corridor | compact-country-26 | 100 | DES-2339 | LDAP First Name Field |
| 101 | 82873 | Pilot Series A | composite-country-27 | 101 | DES-2345 | Feedback Ratings |
| 102 | state_uk_20 | Baseline Assessment | primary-country-28 | 102 | DES-2351 | American International Group |
| 103 | 8928518 | Distributed Survey | adaptive-country-29 | 103 | DES-2357 | Northrop Grumman |

This view links institutions to the research desks they support, either through their affiliated managers or through direct institutional sponsorship. Institution 100 (Extended Corridor) is associated with research desk 100 (DES-2339), which is in planning status and managed by Theodore Mcgrath. Institution 103 (Distributed Survey) is associated with research desk 103 (DES-2357), which is archived and managed by Norma Fisher. The desk's status (planning, active, completed, archived) and the institution's type (university, research_centre, ngo, government) can be cross-analysed to identify patterns in institutional engagement. For example, university-based desks may have different lifecycle characteristics than government-based desks. The created_at timestamp on the institution record provides a reference point for when the institutional association was established.

### Synthesis

The six base tables and their fifteen joined views form a coherent record of research programme governance. Research desks serve as the operational anchor, each linked to a project manager, a funding agency, and a research output. Project managers are grounded in institutions and qualified through academic credentials, creating a chain of accountability that runs from funding through management to publication. The views make these relationships explicit and queryable, enabling programme coordinators to verify staffing, trace funding, assess output quality, and evaluate institutional diversity. The data as a whole describes a structured, multi-institutional research enterprise in which every desk, manager, agency, and output can be traced to its origin and its consequences.