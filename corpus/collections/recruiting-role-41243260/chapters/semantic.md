## The Recruiting Domain as a Normalized Relational Model

The recruiting ecosystem described here captures the full lifecycle of talent acquisition: organizations post roles, recruiters manage those postings, candidates submit profiles, and skills bridge the gap between candidate qualifications and role requirements. Corporate news rounds out the picture by anchoring organizational events to the same universe of candidates and recruiters. Every fact in this domain is decomposed into atomic tables, linked by foreign keys, and reassembled through materialized views that answer concrete business questions. The following sections walk through the entity types, their attributes, the junction tables that resolve many-to-many relationships, and the views that reconstruct domain facts from the normalized schema.

**Table `recruiting_roles`**

| job_title | job_posting_id | department | location | posting_date | status | recruiter_id | organization_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| Primary Initiative A | 1336172 | adaptive-departme-89 | extended-location-99 | 2022-09-13 | open | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| Composite Model | 7119767 | distributed-departme-90 | integrated-location-100 | 2023-02-24 | closed | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| Compact Cluster | 20183941 | baseline-departme-91 | seasonal-location-101 | 2024-07-08 | on_hold | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| Legacy Review D | 15392839 | pilot-departme-92 | regional-location-102 | 2025-12-19 | filled | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `recruiting_roles` table is the central fact table of the recruiting pipeline. Each row represents a single job posting, identified by a composite key of `job_title` and `job_posting_id`. The `job_posting_id` column serves as the primary numeric identifier—values such as `1336172`, `7119767`, `20183941`, and `15392839`—and is referenced by downstream tables to link candidates and skills to specific postings. The `department` column (e.g., `adaptive-departme-89`, `distributed-departme-90`) and `location` column (e.g., `extended-location-99`, `integrated-location-100`) provide organizational and geographic context. The `posting_date` records when the role went live, while `status` constrains the lifecycle to four states: `open`, `closed`, `on_hold`, and `filled`. The `recruiter_id` and `organization_id` columns are foreign keys that bind each role to a specific recruiter and to the organization that owns the posting. Audit timestamps `created_at` and `updated_at` round out the row, with values like `2025-01-01 00:14:00` and `2025-01-02 00:41:00` showing the typical one-day delta between creation and first update.

**Table `recruiters`**

| recruiter_id | specialization | employment_status | last_contact_date | connection_status | organization_id |
|---|---|---|---|---|---|
| 1 | legacy-speciali-13 | internal | 2024-03-23T02:54:00 | pending | 1 |
| 2 | compact-speciali-14 | external_agency | 2025-08-07T09:11:00 | connected | 2 |
| 3 | composite-speciali-15 | internal | 2022-01-18T16:28:00 | ignored | 3 |
| 4 | primary-speciali-16 | external_agency | 2023-06-02T23:45:00 | pending | 4 |

The `recruiters` table models the people who manage job postings. Each recruiter is identified by `recruiter_id`, which is a foreign key into `recruiting_roles.recruiter_id`. The `specialization` column (e.g., `legacy-speciali-13`, `compact-speciali-14`) captures the recruiter's domain focus, while `employment_status` distinguishes between `internal` and `external_agency` recruiters. The `last_contact_date` column (e.g., `2024-03-23T02:54:00`) tracks the most recent interaction, and `connection_status` records the relationship state as `pending`, `connected`, or `ignored`. The `organization_id` column binds each recruiter to their employing organization, establishing a one-to-many relationship: one organization employs many recruiters.

**Table `candidate_profiles`**

| candidate_profile_id | profile_id | headline | current_role | industry | last_updated | is_verified | recruiting_role_job_posting_id | submitted_to_recruiting_role_job_posting_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | seasonal-headline-41 | distributed-current-42 | composite-industry-99 | 2023-06-17T17:27:00 | true | 1336172 | 1336172 |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | regional-headline-42 | baseline-current-43 | primary-industry-100 | 2024-11-01T00:44:00 | false | 7119767 | 7119767 |
| 3 | 10207150 | legacy-headline-43 | pilot-current-44 | adaptive-industry-101 | 2025-04-12T07:01:00 | true | 20183941 | 20183941 |
| 4 | 611506 | compact-headline-44 | extended-current-45 | distributed-industry-102 | 2022-09-23T14:18:00 | false | 15392839 | 15392839 |

Candidate profiles represent applicants in the system. The `candidate_profile_id` column serves as the primary key, while `profile_id` holds a UUID-style identifier (e.g., `72623baa-9bad-11eb-a8a2-19ed5c03f8d3`) that may correspond to an external identity provider. The `headline` column (e.g., `seasonal-headline-41`, `regional-headline-42`) provides a short professional summary, and `current_role` (e.g., `distributed-current-42`) describes the candidate's present position. The `industry` column (e.g., `composite-industry-99`) captures the candidate's sector. The boolean `is_verified` flag indicates whether the profile has been vetted. Critically, `recruiting_role_job_posting_id` and `submitted_to_recruiting_role_job_posting_id` are foreign keys into `recruiting_roles.job_posting_id`, linking each candidate to the specific job posting they applied to. In the sample data, both columns hold the same value (e.g., `1336172`), indicating a direct one-to-one application mapping.

**Table `organizations`**

| id | org_id | legal_name | industry_sector | headquarters_location | global_presence | founded_year | news_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 790471 | Adaptive Model | seasonal-industry-35 | composite-headquar-63 | false | 27 | 9424940 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 1717 | Primary Cluster | regional-industry-36 | primary-headquar-64 | true | 31 | 1152671 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 69437 | Composite Review D | legacy-industry-37 | adaptive-headquar-65 | false | 35 | 0000000000000 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | m16 | Compact Initiative | compact-industry-38 | distributed-headquar-66 | true | 39 | 69426 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `organizations` table is the root entity for the organizational hierarchy. Each row is identified by a surrogate `id` and a business `org_id` (e.g., `790471`, `1717`, `69437`, `m16`). The `legal_name` column holds the organization's registered name—`Adaptive Model`, `Primary Cluster`, `Composite Review D`, `Compact Initiative`—while `industry_sector` (e.g., `seasonal-industry-35`) classifies the business domain. The `headquarters_location` column (e.g., `composite-headquar-63`) and `global_presence` boolean indicate geographic scope. The `founded_year` column stores the year of establishment (values `27`, `31`, `35`, `39` in the sample). The `news_id` column is a foreign key into `corporate_newses`, linking the organization to its most recent corporate news item. Audit columns `created_at` and `updated_at` mirror the pattern seen in other tables.

**Table `professional_skills`**

| id | skill_id | skill_name | proficiency_level | category | certification_required | recruiting_role_job_posting_id | candidate_profile_id |
|---|---|---|---|---|---|---|---|
| 1 | 4463650 | Regional Cluster | beginner | compact-category-92 | true | 1336172 | 1 |
| 2 | L224 | Seasonal Review D | intermediate | composite-category-93 | false | 7119767 | 2 |
| 3 | 3001009030260 | Integrated Initiative | advanced | primary-category-94 | true | 20183941 | 3 |
| 4 | template_impcode_pagata_art15 | Extended Model | expert | adaptive-category-95 | false | 15392839 | 4 |

The `professional_skills` table captures the intersection of candidate qualifications and role requirements. Each row is identified by `id` and carries a `skill_id` (e.g., `4463650`, `L224`, `3001009030260`, `template_impcode_pagata_art15`) that uniquely identifies the skill. The `skill_name` column (e.g., `Regional Cluster`, `Seasonal Review D`) provides a human-readable label, while `proficiency_level` constrains the candidate's self-reported or assessed level to `beginner`, `intermediate`, `advanced`, or `expert`. The `category` column (e.g., `compact-category-92`) groups skills into taxonomic buckets, and `certification_required` is a boolean indicating whether formal certification is mandatory for the role. The `recruiting_role_job_posting_id` and `candidate_profile_id` columns are foreign keys that bind each skill entry to a specific job posting and a specific candidate, respectively.

**Table `corporate_newses`**

| news_id | headline | event_type | publication_date | source_url | impact_level | organization_id | candidate_profile_id |
|---|---|---|---|---|---|---|---|
| 9424940 | seasonal-headline-41 | investment | 2025-12-01 | https://bugs.launchpad.net/keystone/+bug/1432191 | low | 1 | 1 |
| 1152671 | regional-headline-42 | expansion | 2022-05-12 | https://ecocyc.org/gene?orgid=ECOLI&id=EG10355 | medium | 2 | 2 |
| 0000000000000 | legacy-headline-43 | acquisition | 2023-10-23 | https://bugs.launchpad.net/neutron/+bug/1184696 | high | 3 | 3 |
| 69426 | compact-headline-44 | leadership_change | 2024-03-07 | http://twitter.com/gagnonsheila/status/475411638917791744 | low | 4 | 4 |

The `corporate_newses` table records organizational events. Each news item is identified by `news_id`, which is referenced by `organizations.news_id`. The `headline` column (e.g., `seasonal-headline-41`, `regional-headline-42`) summarizes the event, while `event_type` classifies it as `investment`, `expansion`, `acquisition`, or `leadership_change`. The `publication_date` (e.g., `2025-12-01`) and `source_url` (e.g., `https://bugs.launchpad.net/keystone/+bug/1432191`) provide temporal and provenance context. The `impact_level` column constrains the significance to `low`, `medium`, or `high`. The `organization_id` and `candidate_profile_id` columns are foreign keys that link the news item to its originating organization and, optionally, to a candidate profile that may have been affected by or contributed to the event.

The base tables above capture the core entities. However, several many-to-many relationships require junction tables to resolve.

**Table `roles_skills`**

| recruiting_role_job_posting_id | professional_skill_id |
|---|---|
| 1336172 | 1 |
| 1336172 | 2 |
| 7119767 | 2 |
| 7119767 | 3 |
| 20183941 | 3 |
| 20183941 | 4 |
| 15392839 | 4 |
| 15392839 | 1 |

The `roles_skills` junction table resolves the many-to-many relationship between `recruiting_roles` and `professional_skills`. Each row links a `job_posting_id` from `recruiting_roles` to a `skill_id` from `professional_skills`, indicating that a particular skill is required for a particular role. This table enables a single role to specify multiple required skills and a single skill to be required across multiple roles.

**Table `recruiters_roles`**

| recruiter_id | recruiting_role_job_posting_id |
|---|---|
| 1 | 1336172 |
| 1 | 7119767 |
| 2 | 7119767 |
| 2 | 20183941 |
| 3 | 20183941 |
| 3 | 15392839 |
| 4 | 15392839 |
| 4 | 1336172 |

The `recruiters_roles` junction table resolves the many-to-many relationship between `recruiters` and `recruiting_roles`. While `recruiting_roles.recruiter_id` already provides a direct link from role to recruiter, this junction table allows a recruiter to be associated with multiple roles and a role to be managed by multiple recruiters, supporting team-based recruiting operations.

**Table `profiles_skills`**

| candidate_profile_id | professional_skill_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `profiles_skills` junction table resolves the many-to-many relationship between `candidate_profiles` and `professional_skills`. Each row links a `candidate_profile_id` to a `skill_id`, recording that a candidate possesses a particular skill. This is distinct from `professional_skills`, which ties skills to specific roles; `profiles_skills` records the candidate's skill inventory independently of any particular job posting.

**Table `organizations_recruiters`**

| organization_id | recruiter_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `organizations_recruiters` junction table resolves the many-to-many relationship between `organizations` and `recruiters`. While `recruiters.organization_id` already provides a direct link, this junction table supports scenarios where a recruiter may be associated with multiple organizations (e.g., agency recruiters serving multiple clients) and an organization may employ recruiters from multiple agencies.

**Table `organizations_roles`**

| organization_id | recruiting_role_job_posting_id |
|---|---|
| 1 | 1336172 |
| 1 | 7119767 |
| 2 | 7119767 |
| 2 | 20183941 |
| 3 | 20183941 |
| 3 | 15392839 |
| 4 | 15392839 |
| 4 | 1336172 |

The `organizations_roles` junction table resolves the many-to-many relationship between `organizations` and `recruiting_roles`. While `recruiting_roles.organization_id` already provides a direct link, this junction table supports roles that span multiple organizations (e.g., joint ventures, shared positions) and organizations that post roles through multiple channels.

With the base tables and junction tables in place, the materialized views reconstruct domain facts by joining the normalized tables. Each view answers a specific business question.

**View `v_recruiting_role_recruiter`**

```sql
CREATE VIEW v_recruiting_role_recruiter AS
SELECT a.job_title, a.job_posting_id, a.department, a.location, b.recruiter_id AS recruiter_recruiter_id, b.specialization AS recruiter_specialization, b.employment_status AS recruiter_employment_status
FROM recruiting_roles a JOIN recruiters b ON a.recruiter_id = b.recruiter_id;
```

| job_title | job_posting_id | department | location | recruiter_recruiter_id | recruiter_specialization | recruiter_employment_status |
|---|---|---|---|---|---|---|
| Primary Initiative A | 1336172 | adaptive-departme-89 | extended-location-99 | 1 | legacy-speciali-13 | internal |
| Composite Model | 7119767 | distributed-departme-90 | integrated-location-100 | 2 | compact-speciali-14 | external_agency |
| Compact Cluster | 20183941 | baseline-departme-91 | seasonal-location-101 | 3 | composite-speciali-15 | internal |
| Legacy Review D | 15392839 | pilot-departme-92 | regional-location-102 | 4 | primary-speciali-16 | external_agency |

The view `v_recruiting_role_recruiter` joins `recruiting_roles` to `recruiters` on `recruiter_id`, answering the question: "Which recruiter is managing which job posting?" For the row with `job_title` = `Primary Initiative A` and `job_posting_id` = `1336172`, the view reveals that recruiter `1` (specialization `legacy-speciali-13`, status `internal`) is responsible for this posting. The second row shows that `Composite Model` (posting `7119767`) is managed by recruiter `2` (specialization `compact-speciali-14`, status `external_agency`). This view is essential for workload analysis and recruiter performance tracking.

**View `v_recruiting_role_organization`**

```sql
CREATE VIEW v_recruiting_role_organization AS
SELECT a.job_title, a.job_posting_id, a.department, a.location, b.id AS organization_id, b.org_id AS organization_org_id, b.legal_name AS organization_legal_name
FROM recruiting_roles a JOIN organizations b ON a.organization_id = b.id;
```

| job_title | job_posting_id | department | location | organization_id | organization_org_id | organization_legal_name |
|---|---|---|---|---|---|---|
| Primary Initiative A | 1336172 | adaptive-departme-89 | extended-location-99 | 1 | 790471 | Adaptive Model |
| Composite Model | 7119767 | distributed-departme-90 | integrated-location-100 | 2 | 1717 | Primary Cluster |
| Compact Cluster | 20183941 | baseline-departme-91 | seasonal-location-101 | 3 | 69437 | Composite Review D |
| Legacy Review D | 15392839 | pilot-departme-92 | regional-location-102 | 4 | m16 | Compact Initiative |

The view `v_recruiting_role_organization` joins `recruiting_roles` to `organizations` on `organization_id`, answering: "Which organization owns which job posting?" The first row shows that `Adaptive Model` (org `790471`) posted `Primary Initiative A` (posting `1336172`) in department `adaptive-departme-89`. The second row reveals that `Primary Cluster` (org `1717`) posted `Composite Model` (posting `7119767`) in department `distributed-departme-90`. This view supports organizational hiring volume analysis and budget allocation.

**View `v_recruiting_role_professional_skill_detail`**

```sql
CREATE VIEW v_recruiting_role_professional_skill_detail AS
SELECT a.job_title, a.job_posting_id, a.department, b.id AS skill_id, b.skill_id AS skill_skill_id, b.skill_name AS skill_skill_name
FROM recruiting_roles a
  JOIN roles_skills j ON j.recruiting_role_job_posting_id = a.job_posting_id
  JOIN professional_skills b ON b.id = j.professional_skill_id;
```

| job_title | job_posting_id | department | skill_id | skill_skill_id | skill_skill_name |
|---|---|---|---|---|---|
| Primary Initiative A | 1336172 | adaptive-departme-89 | 1 | 4463650 | Regional Cluster |
| Primary Initiative A | 1336172 | adaptive-departme-89 | 2 | L224 | Seasonal Review D |
| Composite Model | 7119767 | distributed-departme-90 | 2 | L224 | Seasonal Review D |
| Composite Model | 7119767 | distributed-departme-90 | 3 | 3001009030260 | Integrated Initiative |
| Compact Cluster | 20183941 | baseline-departme-91 | 3 | 3001009030260 | Integrated Initiative |
| Compact Cluster | 20183941 | baseline-departme-91 | 4 | template_impcode_pagata_art15 | Extended Model |
| Legacy Review D | 15392839 | pilot-departme-92 | 4 | template_impcode_pagata_art15 | Extended Model |
| Legacy Review D | 15392839 | pilot-departme-92 | 1 | 4463650 | Regional Cluster |

The view `v_recruiting_role_professional_skill_detail` joins `recruiting_roles` to `professional_skills` on `job_posting_id`, answering: "What skills are required for each job posting?" The first row shows that posting `1336172` (`Primary Initiative A`) requires the skill `Regional Cluster` (skill_id `4463650`) at `beginner` proficiency level, with certification required. The second row reveals that posting `7119767` (`Composite Model`) requires `Seasonal Review D` (skill_id `L224`) at `intermediate` level, without certification. This view is critical for skills-gap analysis and job description validation.

**View `v_recruiter_organization`**

```sql
CREATE VIEW v_recruiter_organization AS
SELECT a.recruiter_id, a.specialization, a.employment_status, a.last_contact_date, b.id AS organization_id, b.org_id AS organization_org_id, b.legal_name AS organization_legal_name
FROM recruiters a JOIN organizations b ON a.organization_id = b.id;
```

| recruiter_id | specialization | employment_status | last_contact_date | organization_id | organization_org_id | organization_legal_name |
|---|---|---|---|---|---|---|
| 1 | legacy-speciali-13 | internal | 2024-03-23T02:54:00 | 1 | 790471 | Adaptive Model |
| 2 | compact-speciali-14 | external_agency | 2025-08-07T09:11:00 | 2 | 1717 | Primary Cluster |
| 3 | composite-speciali-15 | internal | 2022-01-18T16:28:00 | 3 | 69437 | Composite Review D |
| 4 | primary-speciali-16 | external_agency | 2023-06-02T23:45:00 | 4 | m16 | Compact Initiative |

The view `v_recruiter_organization` joins `recruiters` to `organizations` on `organization_id`, answering: "Which organization employs which recruiter?" The first row shows that recruiter `1` (specialization `legacy-speciali-13`, employment status `internal`) is employed by organization `1` (`Adaptive Model`). The second row reveals that recruiter `2` (specialization `compact-speciali-14`, employment status `external_agency`) is employed by organization `2` (`Primary Cluster`). This view supports headcount reporting and agency-versus-internal recruiter cost analysis.

**View `v_recruiter_recruiting_role_detail`**

```sql
CREATE VIEW v_recruiter_recruiting_role_detail AS
SELECT a.recruiter_id, a.specialization, a.employment_status, b.job_title AS role_job_title, b.job_posting_id AS role_job_posting_id, b.department AS role_department
FROM recruiters a
  JOIN recruiters_roles j ON j.recruiter_id = a.recruiter_id
  JOIN recruiting_roles b ON b.job_posting_id = j.recruiting_role_job_posting_id;
```

| recruiter_id | specialization | employment_status | role_job_title | role_job_posting_id | role_department |
|---|---|---|---|---|---|
| 1 | legacy-speciali-13 | internal | Primary Initiative A | 1336172 | adaptive-departme-89 |
| 1 | legacy-speciali-13 | internal | Composite Model | 7119767 | distributed-departme-90 |
| 2 | compact-speciali-14 | external_agency | Composite Model | 7119767 | distributed-departme-90 |
| 2 | compact-speciali-14 | external_agency | Compact Cluster | 20183941 | baseline-departme-91 |
| 3 | composite-speciali-15 | internal | Compact Cluster | 20183941 | baseline-departme-91 |
| 3 | composite-speciali-15 | internal | Legacy Review D | 15392839 | pilot-departme-92 |
| 4 | primary-speciali-16 | external_agency | Legacy Review D | 15392839 | pilot-departme-92 |
| 4 | primary-speciali-16 | external_agency | Primary Initiative A | 1336172 | adaptive-departme-89 |

The view `v_recruiter_recruiting_role_detail` joins `recruiters` to `recruiting_roles` on `recruiter_id`, answering: "Which roles is each recruiter currently managing?" The first row shows that recruiter `1` (specialization `legacy-speciali-13`) is managing `Primary Initiative A` (posting `1336172`), which has status `open` and was posted on `2022-09-13`. The second row reveals that recruiter `2` (specialization `compact-speciali-14`) is managing `Composite Model` (posting `7119767`), which has status `closed` and was posted on `2023-02-24`. This view is essential for workload balancing and recruiter capacity planning.

**View `v_candidate_profile_recruiting_role`**

```sql
CREATE VIEW v_candidate_profile_recruiting_role AS
SELECT a.candidate_profile_id, a.profile_id, a.headline, a.current_role, b.job_title AS role_job_title, b.job_posting_id AS role_job_posting_id, b.department AS role_department
FROM candidate_profiles a JOIN recruiting_roles b ON a.recruiting_role_job_posting_id = b.job_posting_id;
```

| candidate_profile_id | profile_id | headline | current_role | role_job_title | role_job_posting_id | role_department |
|---|---|---|---|---|---|---|
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | seasonal-headline-41 | distributed-current-42 | Primary Initiative A | 1336172 | adaptive-departme-89 |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | regional-headline-42 | baseline-current-43 | Composite Model | 7119767 | distributed-departme-90 |
| 3 | 10207150 | legacy-headline-43 | pilot-current-44 | Compact Cluster | 20183941 | baseline-departme-91 |
| 4 | 611506 | compact-headline-44 | extended-current-45 | Legacy Review D | 15392839 | pilot-departme-92 |

The view `v_candidate_profile_recruiting_role` joins `candidate_profiles` to `recruiting_roles` on `job_posting_id`, answering: "Which candidate applied to which job posting?" The first row shows that candidate with UUID `72623baa-9bad-11eb-a8a2-19ed5c03f8d3` (headline `seasonal-headline-41`, industry `composite-industry-99`) applied to posting `1336172` (`Primary Initiative A`). The second row reveals that candidate `d9d925ce-8fcc-11eb-924d-9cd76263cbd0` (headline `regional-headline-42`, industry `primary-industry-100`) applied to posting `7119767` (`Composite Model`). This view supports application funnel analysis and candidate-source tracking.

**View `v_candidate_profile_professional_skill_detail`**

```sql
CREATE VIEW v_candidate_profile_professional_skill_detail AS
SELECT a.candidate_profile_id, a.profile_id, a.headline, b.id AS skill_id, b.skill_id AS skill_skill_id, b.skill_name AS skill_skill_name
FROM candidate_profiles a
  JOIN profiles_skills j ON j.candidate_profile_id = a.candidate_profile_id
  JOIN professional_skills b ON b.id = j.professional_skill_id;
```

| candidate_profile_id | profile_id | headline | skill_id | skill_skill_id | skill_skill_name |
|---|---|---|---|---|---|
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | seasonal-headline-41 | 1 | 4463650 | Regional Cluster |
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | seasonal-headline-41 | 2 | L224 | Seasonal Review D |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | regional-headline-42 | 2 | L224 | Seasonal Review D |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | regional-headline-42 | 3 | 3001009030260 | Integrated Initiative |
| 3 | 10207150 | legacy-headline-43 | 3 | 3001009030260 | Integrated Initiative |
| 3 | 10207150 | legacy-headline-43 | 4 | template_impcode_pagata_art15 | Extended Model |
| 4 | 611506 | compact-headline-44 | 4 | template_impcode_pagata_art15 | Extended Model |
| 4 | 611506 | compact-headline-44 | 1 | 4463650 | Regional Cluster |

The view `v_candidate_profile_professional_skill_detail` joins `candidate_profiles` to `professional_skills` on `candidate_profile_id`, answering: "What skills does each candidate possess?" The first row shows that candidate `1` (UUID `72623baa-9bad-11eb-a8a2-19ed5c03f8d3`) has the skill `Regional Cluster` (skill_id `4463650`) at `beginner` proficiency level, with certification required. The second row reveals that candidate `2` (UUID `d9d925ce-8fcc-11eb-924d-9cd76263cbd0`) has the skill `Seasonal Review D` (skill_id `L224`) at `intermediate` level, without certification. This view is fundamental for candidate-skill matching and talent pool analysis.

**View `v_organization_recruiter_detail`**

```sql
CREATE VIEW v_organization_recruiter_detail AS
SELECT a.id, a.org_id, a.legal_name, b.recruiter_id AS recruiter_recruiter_id, b.specialization AS recruiter_specialization, b.employment_status AS recruiter_employment_status
FROM organizations a
  JOIN organizations_recruiters j ON j.organization_id = a.id
  JOIN recruiters b ON b.recruiter_id = j.recruiter_id;
```

| id | org_id | legal_name | recruiter_recruiter_id | recruiter_specialization | recruiter_employment_status |
|---|---|---|---|---|---|
| 1 | 790471 | Adaptive Model | 1 | legacy-speciali-13 | internal |
| 1 | 790471 | Adaptive Model | 2 | compact-speciali-14 | external_agency |
| 2 | 1717 | Primary Cluster | 2 | compact-speciali-14 | external_agency |
| 2 | 1717 | Primary Cluster | 3 | composite-speciali-15 | internal |
| 3 | 69437 | Composite Review D | 3 | composite-speciali-15 | internal |
| 3 | 69437 | Composite Review D | 4 | primary-speciali-16 | external_agency |
| 4 | m16 | Compact Initiative | 4 | primary-speciali-16 | external_agency |
| 4 | m16 | Compact Initiative | 1 | legacy-speciali-13 | internal |

The view `v_organization_recruiter_detail` joins `organizations` to `recruiters` on `organization_id`, answering: "Which recruiters work for which organization, and what is their status?" The first row shows that organization `1` (`Adaptive Model`, founded year `27`, headquarters `composite-headquar-63`) employs recruiter `1` (specialization `legacy-speciali-13`, employment status `internal`, connection status `pending`). The second row reveals that organization `2` (`Primary Cluster`, founded year `31`, headquarters `primary-headquar-64`) employs recruiter `2` (specialization `compact-speciali-14`, employment status `external_agency`, connection status `connected`). This view supports organizational staffing reports and agency utilization metrics.

**View `v_organization_recruiting_role_detail`**

```sql
CREATE VIEW v_organization_recruiting_role_detail AS
SELECT a.id, a.org_id, a.legal_name, b.job_title AS role_job_title, b.job_posting_id AS role_job_posting_id, b.department AS role_department
FROM organizations a
  JOIN organizations_roles j ON j.organization_id = a.id
  JOIN recruiting_roles b ON b.job_posting_id = j.recruiting_role_job_posting_id;
```

| id | org_id | legal_name | role_job_title | role_job_posting_id | role_department |
|---|---|---|---|---|---|
| 1 | 790471 | Adaptive Model | Primary Initiative A | 1336172 | adaptive-departme-89 |
| 1 | 790471 | Adaptive Model | Composite Model | 7119767 | distributed-departme-90 |
| 2 | 1717 | Primary Cluster | Composite Model | 7119767 | distributed-departme-90 |
| 2 | 1717 | Primary Cluster | Compact Cluster | 20183941 | baseline-departme-91 |
| 3 | 69437 | Composite Review D | Compact Cluster | 20183941 | baseline-departme-91 |
| 3 | 69437 | Composite Review D | Legacy Review D | 15392839 | pilot-departme-92 |
| 4 | m16 | Compact Initiative | Legacy Review D | 15392839 | pilot-departme-92 |
| 4 | m16 | Compact Initiative | Primary Initiative A | 1336172 | adaptive-departme-89 |

The view `v_organization_recruiting_role_detail` joins `organizations` to `recruiting_roles` on `organization_id`, answering: "Which job postings does each organization have, and what is their status?" The first row shows that organization `1` (`Adaptive Model`) has posting `1336172` (`Primary Initiative A`) in department `adaptive-departme-89`, location `extended-location-99`, with status `open`. The second row reveals that organization `2` (`Primary Cluster`) has posting `7119767` (`Composite Model`) in department `distributed-departme-90`, location `integrated-location-100`, with status `closed`. This view is essential for organizational hiring pipeline dashboards.

**View `v_organization_corporate_news`**

```sql
CREATE VIEW v_organization_corporate_news AS
SELECT a.id, a.org_id, a.legal_name, a.industry_sector, b.news_id AS news_news_id, b.headline AS news_headline, b.event_type AS news_event_type
FROM organizations a JOIN corporate_newses b ON a.news_id = b.news_id;
```

| id | org_id | legal_name | industry_sector | news_news_id | news_headline | news_event_type |
|---|---|---|---|---|---|---|
| 1 | 790471 | Adaptive Model | seasonal-industry-35 | 9424940 | seasonal-headline-41 | investment |
| 2 | 1717 | Primary Cluster | regional-industry-36 | 1152671 | regional-headline-42 | expansion |
| 3 | 69437 | Composite Review D | legacy-industry-37 | 0000000000000 | legacy-headline-43 | acquisition |
| 4 | m16 | Compact Initiative | compact-industry-38 | 69426 | compact-headline-44 | leadership_change |

The view `v_organization_corporate_news` joins `organizations` to `corporate_newses` on `organization_id`, answering: "What corporate events are associated with each organization?" The first row shows that organization `1` (`Adaptive Model`) has news item `9424940` with headline `seasonal-headline-41`, event type `investment`, published on `2025-12-01`, with impact level `low`. The second row reveals that organization `2` (`Primary Cluster`) has news item `1152671` with headline `regional-headline-42`, event type `expansion`, published on `2022-05-12`, with impact level `medium`. This view supports organizational reputation monitoring and stakeholder communications.

**View `v_professional_skill_recruiting_role`**

```sql
CREATE VIEW v_professional_skill_recruiting_role AS
SELECT a.id, a.skill_id, a.skill_name, a.proficiency_level, b.job_title AS role_job_title, b.job_posting_id AS role_job_posting_id, b.department AS role_department
FROM professional_skills a JOIN recruiting_roles b ON a.recruiting_role_job_posting_id = b.job_posting_id;
```

| id | skill_id | skill_name | proficiency_level | role_job_title | role_job_posting_id | role_department |
|---|---|---|---|---|---|---|
| 1 | 4463650 | Regional Cluster | beginner | Primary Initiative A | 1336172 | adaptive-departme-89 |
| 2 | L224 | Seasonal Review D | intermediate | Composite Model | 7119767 | distributed-departme-90 |
| 3 | 3001009030260 | Integrated Initiative | advanced | Compact Cluster | 20183941 | baseline-departme-91 |
| 4 | template_impcode_pagata_art15 | Extended Model | expert | Legacy Review D | 15392839 | pilot-departme-92 |

The view `v_professional_skill_recruiting_role` joins `professional_skills` to `recruiting_roles` on `job_posting_id`, answering: "Which job postings require which skills?" The first row shows that skill `Regional Cluster` (skill_id `4463650`, category `compact-category-92`) is required for posting `1336172` (`Primary Initiative A`). The second row reveals that skill `Seasonal Review D` (skill_id `L224`, category `composite-category-93`) is required for posting `7119767` (`Composite Model`). This view is critical for skills-demand analysis and curriculum development.

**View `v_professional_skill_candidate_profile`**

```sql
CREATE VIEW v_professional_skill_candidate_profile AS
SELECT a.id, a.skill_id, a.skill_name, a.proficiency_level, b.candidate_profile_id AS profile_candidate_profile_id, b.profile_id AS profile_profile_id, b.headline AS profile_headline
FROM professional_skills a JOIN candidate_profiles b ON a.candidate_profile_id = b.candidate_profile_id;
```

| id | skill_id | skill_name | proficiency_level | profile_candidate_profile_id | profile_profile_id | profile_headline |
|---|---|---|---|---|---|---|
| 1 | 4463650 | Regional Cluster | beginner | 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | seasonal-headline-41 |
| 2 | L224 | Seasonal Review D | intermediate | 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | regional-headline-42 |
| 3 | 3001009030260 | Integrated Initiative | advanced | 3 | 10207150 | legacy-headline-43 |
| 4 | template_impcode_pagata_art15 | Extended Model | expert | 4 | 611506 | compact-headline-44 |

The view `v_professional_skill_candidate_profile` joins `professional_skills` to `candidate_profiles` on `candidate_profile_id`, answering: "Which candidates possess which skills?" The first row shows that candidate `1` (UUID `72623baa-9bad-11eb-a8a2-19ed5c03f8d3`, headline `seasonal-headline-41`) possesses the skill `Regional Cluster` (skill_id `4463650`) at `beginner` proficiency. The second row reveals that candidate `2` (UUID `d9d925ce-8fcc-11eb-924d-9cd76263cbd0`, headline `regional-headline-42`) possesses the skill `Seasonal Review D` (skill_id `L224`) at `intermediate` proficiency. This view powers candidate recommendation engines and skills-based matching.

**View `v_corporate_news_organization`**

```sql
CREATE VIEW v_corporate_news_organization AS
SELECT a.news_id, a.headline, a.event_type, a.publication_date, b.id AS organization_id, b.org_id AS organization_org_id, b.legal_name AS organization_legal_name
FROM corporate_newses a JOIN organizations b ON a.organization_id = b.id;
```

| news_id | headline | event_type | publication_date | organization_id | organization_org_id | organization_legal_name |
|---|---|---|---|---|---|---|
| 9424940 | seasonal-headline-41 | investment | 2025-12-01 | 1 | 790471 | Adaptive Model |
| 1152671 | regional-headline-42 | expansion | 2022-05-12 | 2 | 1717 | Primary Cluster |
| 0000000000000 | legacy-headline-43 | acquisition | 2023-10-23 | 3 | 69437 | Composite Review D |
| 69426 | compact-headline-44 | leadership_change | 2024-03-07 | 4 | m16 | Compact Initiative |

The view `v_corporate_news_organization` joins `corporate_newses` to `organizations` on `organization_id`, answering: "Which organization is associated with each corporate news item?" The first row shows that news item `9424940` (headline `seasonal-headline-41`, event type `investment`, impact `low`) is associated with organization `1` (`Adaptive Model`, org_id `790471`). The second row reveals that news item `1152671` (headline `regional-headline-42`, event type `expansion`, impact `medium`) is associated with organization `2` (`Primary Cluster`, org_id `1717`). This view supports news attribution and organizational event timelines.

**View `v_corporate_news_candidate_profile`**

```sql
CREATE VIEW v_corporate_news_candidate_profile AS
SELECT a.news_id, a.headline, a.event_type, a.publication_date, b.candidate_profile_id AS profile_candidate_profile_id, b.profile_id AS profile_profile_id, b.headline AS profile_headline
FROM corporate_newses a JOIN candidate_profiles b ON a.candidate_profile_id = b.candidate_profile_id;
```

| news_id | headline | event_type | publication_date | profile_candidate_profile_id | profile_profile_id | profile_headline |
|---|---|---|---|---|---|---|
| 9424940 | seasonal-headline-41 | investment | 2025-12-01 | 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | seasonal-headline-41 |
| 1152671 | regional-headline-42 | expansion | 2022-05-12 | 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | regional-headline-42 |
| 0000000000000 | legacy-headline-43 | acquisition | 2023-10-23 | 3 | 10207150 | legacy-headline-43 |
| 69426 | compact-headline-44 | leadership_change | 2024-03-07 | 4 | 611506 | compact-headline-44 |

The view `v_corporate_news_candidate_profile` joins `corporate_newses` to `candidate_profiles` on `candidate_profile_id`, answering: "Which candidates are linked to which corporate news events?" The first row shows that candidate `1` (UUID `72623baa-9bad-11eb-a8a2-19ed5c03f8d3`, industry `composite-industry-99`) is linked to news item `9424940` (headline `seasonal-headline-41`, event type `investment`). The second row reveals that candidate `2` (UUID `d9d925ce-8fcc-11eb-924d-9cd76263cbd0`, industry `primary-industry-100`) is linked to news item `1152671` (headline `regional-headline-42`, event type `expansion`). This view supports candidate engagement tracking and news-driven application analysis.

The normalized schema presented here decomposes the recruiting domain into six core entity tables and five junction tables, each capturing a distinct concept with atomic attributes and explicit foreign-key relationships. The materialized views then reassemble these fragments into business-ready fact tables: recruiter-role assignments, organizational hiring pipelines, candidate-skill inventories, and corporate news attribution. Every view is a deterministic join over the base tables, ensuring that the denormalized output is always consistent with the underlying normalized state. This architecture supports both operational queries (e.g., "what skills does candidate X have?") and analytical dashboards (e.g., "how many open roles does organization Y have?") while maintaining data integrity through referential constraints. The result is a schema that is both faithful to the domain ontology and optimized for the analytical workloads that recruiting organizations depend on.