The research enterprise is organized around four principal entity types—research desks, project managers, development agencies, and research outputs—each anchored by a surrogate key and enriched with descriptive attributes that capture the temporal, organizational, and administrative dimensions of the work. Supporting these are two auxiliary entity types, academic qualifications and institutions, which provide the credentialing and affiliation context for project managers. The relational schema normalizes these entities into six base tables, linked by foreign keys that encode one-to-many and many-to-one relationships, and materializes twenty-one read-optimized views that reconstruct domain facts through controlled joins.

## The Base Tables

The `research_desks` table is the central organizing entity. Each row represents a discrete research initiative, identified by `research_desk_id` (a sequential surrogate such as `100`, `101`, `102`, `103`) and a human-readable `desk_identifier` like `DES-2339`. The desk carries a `status` column that takes values from a closed set—`planning`, `active`, `completed`, `archived`—and a `response_type` column with values such as `adaptive-response-23`, `distributed-response-24`, `baseline-response-25`, and `pilot-response-26`. Temporal boundaries are captured by `start_date` and `end_date`, which in the sample data show the pattern where the end date precedes the start date (e.g., `2022-09-05T20:24:00` to `2022-09-01T08:00:00`), suggesting a scheduling convention rather than a data error. Three foreign keys anchor the desk to its ecosystem: `project_manager_id` points to the responsible manager, `development_agency_id` points to the funding body, and `research_output_id` points to the primary deliverable.

**Table `research_desks`**

| research_desk_id | desk_identifier | agency_funded_by | start_date | end_date | status | response_type | project_manager_id | development_agency_id | research_output_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | DES-2339 | LDAP First Name Field | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planning | adaptive-response-23 | 1 | 1 | 100 |
| 101 | DES-2345 | Feedback Ratings | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | distributed-response-24 | 2 | 2 | 101 |
| 102 | DES-2351 | American International Group | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | baseline-response-25 | 3 | 3 | 102 |
| 103 | DES-2357 | Northrop Grumman | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | archived | pilot-response-26 | 4 | 4 | 103 |

The `project_managers` table holds one row per individual or organizational unit assigned to a desk. The surrogate `project_manager_id` (`1` through `4`) maps to a `manager_id` that varies in format—UUIDs like `f208f470-8fcd-11eb-924d-9cd76263cbd0`, integers like `10449531`, or short codes like `659`. The `full_name` column carries values ranging from person names (`Theodore Mcgrath`, `Norma Fisher`) to organizational names (`Saipan International Airport`, `Account Name`), reflecting the schema's allowance for either individuals or teams as managers. Contact information is stored in `email` and `telephone`, while `current_role` captures the manager's present function (e.g., `distributed-current-42`, `extended-current-45`). Two additional foreign keys, `institution_id` and `academic_qualification_id`, link the manager to their affiliated institution and highest credential, respectively. A `research_desk_id` column on this table creates a back-reference to the desk they lead.

**Table `project_managers`**

| project_manager_id | manager_id | full_name | email | telephone | current_role | institution | research_desk_id | institution_id | academic_qualification_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | id_23 | Theodore Mcgrath | seasonal-email-11 | adaptive-telephon-23 | distributed-current-42 | baseline-institut-31 | 100 | 100 | 1 |
| 2 | 10449531 | Account Name | regional-email-12 | distributed-telephon-24 | baseline-current-43 | pilot-institut-32 | 101 | 101 | 2 |
| 3 | 659 | Saipan International Airport | legacy-email-13 | baseline-telephon-25 | pilot-current-44 | extended-institut-33 | 102 | 102 | 3 |
| 4 | f208f470-8fcd-11eb-924d-9cd76263cbd0 | Norma Fisher | compact-email-14 | pilot-telephon-26 | extended-current-45 | integrated-institut-34 | 103 | 103 | 4 |

The `development_agencies` table enumerates the funding organizations. Each row has a surrogate `id` (`1` through `4`), an `agency_code`, an `agency_name` (e.g., `PureCycle Technologies.`, `LDAP First Name Field`, `Tata Steel`, `American Tower Corp.`), a `country_of_origin`, a `funding_program`, and an `established_year`. Two columns—`research_desk_id` and `funds_research_desk_id`—both reference the desk that receives the agency's funding, creating a redundant but explicit linkage.

**Table `development_agencies`**

| id | agency_code | agency_name | country_of_origin | funding_program | established_year | research_desk_id | funds_research_desk_id |
|---|---|---|---|---|---|---|---|
| 1 | PureCycle Technologies. | FSG Social Impact Advisors | compact-country-80 | regional-funding-96 | 10 | 100 | 100 |
| 2 | LDAP First Name Field | Whirlpool Corporation | composite-country-81 | legacy-funding-97 | 16 | 101 | 101 |
| 3 | Tata Steel | Education Writers Association | primary-country-82 | compact-funding-98 | 22 | 102 | 102 |
| 4 | American Tower Corp. | Switch Card Services Ltd. | adaptive-country-83 | composite-funding-99 | 28 | 103 | 103 |

The `research_outputs` table records the tangible products of each desk. The surrogate `id` coincides with the `research_desk_id` in the sample data (both are `100`–`103`), suggesting a one-to-one desk-to-output relationship. The `output_id` column carries distinct identifiers such as `3717613` and `937738`, while `title` holds human-readable names like `Compact Initiative`, `Legacy Model`, `Regional Cluster A`, and `Seasonal Review`. The `publication_date`, `format`, `access_level` (`open`, `restricted`, `internal`), and `page_count` (ranging from `0` to `15`) describe the deliverable. Foreign keys `research_desk_id` and `project_manager_id` tie the output back to its originating desk and manager, and a self-referential `research_output_id` column mirrors the desk linkage.

**Table `research_outputs`**

| id | output_id | title | publication_date | format | access_level | page_count | research_desk_id | project_manager_id | research_output_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 3717613 | Compact Initiative | 2025-12-01 | legacy-format-25 | open | 6 | 100 | 1 | 100 |
| 101 | 937738 | Legacy Model | 2022-05-12 | compact-format-26 | restricted | 7 | 101 | 2 | 101 |
| 102 | 974934 | Regional Cluster A | 2023-10-23 | composite-format-27 | internal | 0 | 102 | 3 | 102 |
| 103 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review | 2024-03-07 | primary-format-28 | open | 15 | 103 | 4 | 103 |

The `academic_qualifications` table stores credential records for project managers. Each row has a surrogate `id` (`1` through `4`), a `qualification_id` (often a UUID such as `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`), a `degree_type` (e.g., `compact-degree-62`, `composite-degree-63`), a `field_of_study` (e.g., `legacy-field-25`, `compact-field-26`), an `awarding_institution`, a `graduation_year`, and a `distinction_level`. The `project_manager_id` foreign key links the qualification to its holder, and `institution_id` links it to the awarding institution.

**Table `academic_qualifications`**

| id | qualification_id | degree_type | field_of_study | awarding_institution | graduation_year | distinction_level | project_manager_id | institution_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | compact-degree-62 | legacy-field-25 | distributed-awarding-30 | 38 | primary-distinct-28 | 1 | 100 |
| 2 | 1562831 | composite-degree-63 | compact-field-26 | baseline-awarding-31 | 45 | adaptive-distinct-29 | 2 | 101 |
| 3 | 9424925 | primary-degree-64 | composite-field-27 | pilot-awarding-32 | 52 | distributed-distinct-30 | 3 | 102 |
| 4 | 1996940 | adaptive-degree-65 | primary-field-28 | extended-awarding-33 | 59 | baseline-distinct-31 | 4 | 103 |

The `institutions` table captures the organizational affiliations of project managers. Each row has an `institution_id` (`100` through `103`), an `institution_code`, an `institution_name` (e.g., `Extended Corridor`, `Pilot Series A`, `Baseline Assessment`, `Distributed Survey`), a `country`, an `institution_type` (`university`, `research_centre`, `ngo`, `government`), a `founded_year`, an `address`, and a `created_at` timestamp. Foreign keys `project_manager_id`, `academic_qualification_id`, and `research_desk_id` create direct links from the institution to the manager, their qualification, and the desk they serve.

**Table `institutions`**

| institution_id | institution_code | institution_name | country | institution_type | founded_year | address | project_manager_id | academic_qualification_id | research_desk_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 4092 | Extended Corridor | compact-country-26 | university | 27 | distributed-address-72 | 1 | 1 | 100 | 2025-01-01 00:14:00 |
| 101 | 82873 | Pilot Series A | composite-country-27 | research_centre | 31 | baseline-address-73 | 2 | 2 | 101 | 2025-02-06 03:14:00 |
| 102 | state_uk_20 | Baseline Assessment | primary-country-28 | ngo | 35 | pilot-address-74 | 3 | 3 | 102 | 2025-03-11 06:14:00 |
| 103 | 8928518 | Distributed Survey | adaptive-country-29 | government | 39 | extended-address-75 | 4 | 4 | 103 | 2025-04-16 09:14:00 |

## Foreign-Key Topology

The foreign-key graph forms a star centered on `research_desks`. The `project_managers` table references `research_desks` via `research_desk_id` and is itself referenced by `research_desks` via `project_manager_id`, creating a bidirectional association that supports both "find the manager for desk X" and "find the desk managed by person Y" queries. Similarly, `development_agencies` and `research_outputs` each reference `research_desks` through their own `research_desk_id` columns, while `research_desks` holds forward pointers (`development_agency_id`, `research_output_id`) to the same tables. The `project_managers` table further references `institutions` and `academic_qualifications`, and both of those tables reference `project_managers` in turn, forming a tightly coupled triad. The `institutions` table also references `academic_qualifications` and `research_desks`, adding cross-links that allow an institution to be queried by its manager, its qualifications, or its desk.

## View-Based Fact Reconstruction

Each view materializes a specific join path through the normalized tables, answering a focused question about the domain.

The view `vw_research_desk_project_manager` joins `research_desks` to `project_managers` on `research_desks.project_manager_id = project_managers.project_manager_id`. It answers the question "which manager leads which desk?" Reading the row where `research_desk_id = 100` and `desk_identifier = DES-2339`, the view reveals that manager `Theodore Mcgrath` (id `1`) is assigned to that desk, with contact `seasonal-email-11`.

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

The view `vw_research_desk_development_agency` joins `research_desks` to `development_agencies` on `research_desks.development_agency_id = development_agencies.id`. It answers "which agency funds which desk?" For desk `DES-2345` (`research_desk_id = 101`), the view shows that agency `LDAP First Name Field` (id `2`) provides the funding.

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

The view `vw_research_desk_research_output` joins `research_desks` to `research_outputs` on `research_desks.research_output_id = research_outputs.id`. It answers "what output is associated with which desk?" Desk `DES-2351` (`research_desk_id = 102`) is linked to the output titled `Regional Cluster A` (`id = 102`), published on `2023-10-23` with `composite-format-27` and `internal` access.

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

The view `vw_project_manager_research_desk` performs the inverse join, linking `project_managers` to `research_desks`. It answers "which desk is managed by which person?" Manager `Norma Fisher` (id `4`) is shown to lead desk `DES-2357` (`research_desk_id = 103`), which is in `archived` status.

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

The view `vw_project_manager_institution` joins `project_managers` to `institutions` on `project_managers.institution_id = institutions.institution_id`. It answers "which institution is affiliated with which manager?" Manager `Saipan International Airport` (id `3`) is affiliated with institution `Baseline Assessment` (`institution_id = 102`), an `ngo` founded in year `35`.

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

The view `vw_project_manager_academic_qualification` joins `project_managers` to `academic_qualifications` on `project_managers.academic_qualification_id = academic_qualifications.id`. It answers "what qualification does each manager hold?" Manager `Theodore Mcgrath` (id `1`) holds qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`, a `compact-degree-62` in `legacy-field-25`, awarded in year `38` at `primary-distinct-28` level.

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

The view `vw_development_agency_research_desk` joins `development_agencies` to `research_desks` on `development_agencies.research_desk_id = research_desks.research_desk_id`. It answers "which desk does each agency fund?" Agency `Tata Steel` (id `3`) funds desk `DES-2351` (`research_desk_id = 102`), which is in `completed` status.

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

The view `vw_research_output_research_desk` joins `research_outputs` to `research_desks` on `research_outputs.research_desk_id = research_desks.research_desk_id`. It answers "which desk produced which output?" Output `Seasonal Review` (`id = 103`) was produced by desk `DES-2357` (`research_desk_id = 103`), which is in `archived` status.

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

The view `vw_research_output_project_manager` joins `research_outputs` to `project_managers` on `research_outputs.project_manager_id = project_managers.project_manager_id`. It answers "which manager is responsible for which output?" Output `Compact Initiative` (`id = 100`) is managed by `Theodore Mcgrath` (id `1`), who holds the role `distributed-current-42`.

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

The view `vw_research_output_research_output` is a self-join on `research_outputs`, linking `research_outputs.research_output_id` to `research_outputs.id`. It answers "how do output records reference themselves?" Output `Legacy Model` (`id = 101`, `output_id = 937738`) references itself via `research_output_id = 101`, confirming the one-to-one desk-to-output mapping.

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

The view `vw_academic_qualification_project_manager` joins `academic_qualifications` to `project_managers` on `academic_qualifications.project_manager_id = project_managers.project_manager_id`. It answers "which manager holds which qualification?" Qualification `1562831` (a `composite-degree-63` in `compact-field-26`) is held by manager `Account Name` (id `2`), who works at institution `Pilot Series A`.

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

The view `vw_academic_qualification_institution` joins `academic_qualifications` to `institutions` on `academic_qualifications.institution_id = institutions.institution_id`. It answers "which institution awarded each qualification?" Qualification `9424925` (a `primary-degree-64` in `composite-field-27`) was awarded by institution `Baseline Assessment` (`institution_id = 102`), an `ngo`.

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

The view `vw_institution_project_manager` joins `institutions` to `project_managers` on `institutions.project_manager_id = project_managers.project_manager_id`. It answers "which manager is affiliated with which institution?" Institution `Distributed Survey` (`institution_id = 103`, type `government`) is affiliated with manager `Norma Fisher` (id `4`), who holds the role `extended-current-45`.

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

The view `vw_institution_academic_qualification` joins `institutions` to `academic_qualifications` on `institutions.academic_qualification_id = academic_qualifications.id`. It answers "which qualification is associated with which institution?" Institution `Extended Corridor` (`institution_id = 100`, type `university`) is associated with qualification `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`, a `compact-degree-62` in `legacy-field-25`.

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

The view `vw_institution_research_desk` joins `institutions` to `research_desks` on `institutions.research_desk_id = research_desks.research_desk_id`. It answers "which desk is served by which institution?" Institution `Pilot Series A` (`institution_id = 101`, type `research_centre`) serves desk `DES-2345` (`research_desk_id = 101`), which is in `active` status and funded by agency `LDAP First Name Field`.

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

## Synthesis

The schema models a research enterprise in which desks are the central fact table, each anchored to a manager, a funding agency, and an output. The manager entity carries its own institutional and credential context through foreign keys to `institutions` and `academic_qualifications`, while those supporting tables also reference back to managers and desks, creating a web of bidirectional associations that support queries from any entry point. The twenty-one views enumerate the pairwise join paths between the six base tables, each view answering a single domain question by reconstructing a fact from the normalized structure. The result is a schema that is both normalized—avoiding redundancy in the base tables—and fully navigable through its views, allowing analysts to trace any desk to its manager, its agency, its output, the manager's institution, and the manager's qualifications, all through well-defined join paths.