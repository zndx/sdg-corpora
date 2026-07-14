## The Academic Conference Domain as a Normalized Relational Model

The academic conference ecosystem is a multi-layered domain where scholarly events, institutional affiliations, organizational committees, and individual researchers intersect in structured ways. A conference does not exist in isolation; it is hosted by an academic institution, often co-sponsored by a learned society, and governed by a steering committee that delegates programme and local-organization responsibilities to subordinate bodies. Researchers participate as committee members, paper authors, and speakers, while their institutional and departmental affiliations anchor the entire structure. The relational schema captures these relationships through a carefully normalized set of base tables, foreign-key constraints, and junction tables that together reconstruct the full picture of any conference's organizational anatomy.

**Table `academic_conferences`**

| identifier | title | start_date | end_date | status | region_code | academic_institution_id | learned_society_id | steering_committee_id | programme_committee_id | local_organization_committee_id |
|---|---|---|---|---|---|---|---|---|---|---|
| IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | 1562837 | 1000 | 1 | 100 | 1000 | 1 |
| IDE-2091 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | ongoing | 6564391 | 1001 | 2 | 101 | 1001 | 2 |
| IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 778560 | 1002 | 3 | 102 | 1002 | 3 |
| IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | cancelled | 8667ec1da10c4a0293d91388b49bc77c | 1003 | 4 | 103 | 1003 | 4 |

The `academic_conferences` table is the central fact table of the domain. Each row represents a distinct scholarly event identified by a surrogate `id` (e.g., `IDE-2086` for *Compact Initiative*) and a human-readable `title`. Temporal boundaries are recorded in `start_date` and `end_date` as ISO-8601 timestamps; the *Compact Initiative* ran from 2022-09-05 to 2022-09-01, while the *Seasonal Review* is scheduled for December 2025. The `status` column classifies each event as `planned`, `ongoing`, `completed`, or `cancelled` — the *Seasonal Review* carries the value `cancelled`. A `region_code` column (e.g., `1562837` for the first conference) provides a geographic or administrative grouping key. Crucially, five foreign-key columns anchor the conference to the rest of the schema: `academic_institution_id` (e.g., `1000`), `learned_society_id` (e.g., `1`), `steering_committee_id` (e.g., `100`), `programme_committee_id` (e.g., `1000`), and `local_organization_committee_id` (e.g., `1`). These foreign keys enforce a one-to-one or one-to-few relationship between a conference and each of its organizational partners, ensuring referential integrity across the entire model.

**Table `learned_societies`**

| learned_society_id | identifier | name | founding_year | status | funding_model | academic_conference_region_code |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 43 | active | self-supporting | 1562837 |
| 2 | IDE-2091 | Pilot Initiative A | 48 | inactive | grant-funded | 6564391 |
| 3 | IDE-2096 | Baseline Model | 53 | dissolved | mixed | 778560 |
| 4 | IDE-2101 | Distributed Cluster | 58 | active | self-supporting | 8667ec1da10c4a0293d91388b49bc77c |

Learned societies are the scholarly organizations that sponsor or co-organize conferences. The `learned_societies` table stores each society's primary key `learned_society_id` (values `1` through `4`), a surrogate `identifier`, a `name` such as *Extended Review* or *Pilot Initiative A*, a `founding_year` (43, 48, 53, 58), a `status` (`active`, `inactive`, `dissolved`), and a `funding_model` (`self-supporting`, `grant-funded`, `mixed`). The `academic_conference_region_code` column mirrors the region code found in `academic_conferences`, enabling a join that links societies to the conferences they support. Society `1` (*Extended Review*) is `active` and `self-supporting`, while society `3` (*Baseline Model*) is `dissolved` with a `mixed` funding model.

**Table `academic_institutions`**

| id | identifier | name | city | country | postal_code | website | academic_conference_region_code | academic_department_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Extended Review | integrated-city-34 | compact-country-26 | 9125611 | https://bugs.launchpad.net/murano/+bug/1294080 | 1562837 | 1 |
| 1001 | IDE-2091 | Pilot Initiative A | seasonal-city-35 | composite-country-27 | ChIJt4hBkzhu5kcRJJDUNqGUpso | https://bugs.launchpad.net/murano/+bug/1294080 | 6564391 | 2 |
| 1002 | IDE-2096 | Baseline Model | regional-city-36 | primary-country-28 | 3001009030200 | https://www.nature.com/articles/nphoton.2008.245 | 778560 | 3 |
| 1003 | IDE-2101 | Distributed Cluster | legacy-city-37 | adaptive-country-29 | 4060635 | https://bugs.launchpad.net/trove/+bug/1347114 | 8667ec1da10c4a0293d91388b49bc77c | 4 |

Academic institutions — universities, research centers, and similar entities — are captured in `academic_institutions`. Each row carries a surrogate `id` (e.g., `1000`), an `identifier`, a `name` (e.g., *Extended Review*), a `city` (e.g., *integrated-city-34*), a `country` (e.g., *compact-country-26*), a `postal_code`, a `website` URL, a `region_code`, and a foreign key `academic_department_id` (e.g., `1`). Institution `1000` hosts the *Compact Initiative* conference and is located in *integrated-city-34*, *compact-country-26*, with a website pointing to a Launchpad bug tracker. Institution `1002` (*Baseline Model*) resides in *regional-city-36*, *primary-country-28*, and its website links to a Nature Photonics article.

**Table `academic_departments`**

| academic_department_id | identifier | name | head_name | contact_email | contact_phone | academic_institution_id | local_organization_committee_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | Distributed Cluster | Christopher Wilson | Joe Tsai | 1000 | 1 | 2025-01-01 00:14:00 |
| 2 | IDE-2091 | Pilot Initiative A | Adaptive Review D | Charles Larsen | Stephanie Collins | 1001 | 2 | 2025-02-06 03:14:00 |
| 3 | IDE-2096 | Baseline Model | Primary Initiative | Mary Alvarez | Tasha Rodriguez | 1002 | 3 | 2025-03-11 06:14:00 |
| 4 | IDE-2101 | Distributed Cluster | Composite Model | April Snyder | Walter Pratt | 1003 | 4 | 2025-04-16 09:14:00 |

Departments nest within institutions. The `academic_departments` table has a primary key `academic_department_id` (values `1` through `4`), an `identifier`, a `name`, a `head_name` (e.g., *Distributed Cluster*, *Adaptive Review D*), a `contact_email`, a `contact_phone`, a foreign key `academic_institution_id` linking back to the parent institution (e.g., `1000`), a foreign key `local_organization_committee_id` (e.g., `1`), and a `created_at` timestamp. Department `1` is headed by *Distributed Cluster* with contact *Christopher Wilson* and email *Joe Tsai*, and it belongs to institution `1000`.

**Table `steering_committees`**

| id | identifier | role | responsibility_level | academic_conference_region_code | programme_committee_id | local_organization_committee_id |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | chair | apex | 1562837 | 1000 | 1 |
| 101 | IDE-2091 | secretary | operational | 6564391 | 1001 | 2 |
| 102 | IDE-2096 | member | support | 778560 | 1002 | 3 |
| 103 | IDE-2101 | chair | apex | 8667ec1da10c4a0293d91388b49bc77c | 1003 | 4 |

Steering committees provide governance. The `steering_committees` table stores an `id` (e.g., `100`), an `identifier`, a `role` (`chair`, `secretary`, `member`), a `responsibility_level` (`apex`, `operational`, `support`), a `region_code`, and foreign keys `programme_committee_id` (e.g., `1000`) and `local_organization_committee_id` (e.g., `1`). Committee `100` has role `chair` at `apex` responsibility level, while committee `102` has role `member` at `support` level.

**Table `programme_committees`**

| programme_committee_id | identifier | chair_name | selection_deadline | membership_limit | academic_conference_region_code | academic_researcher_id | selects_speaker_academic_researcher_id | academic_paper_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Seasonal Corridor | 2023-02-20T13:51:00 | members-only | 1562837 | 1 | 1 | 100 |
| 1001 | IDE-2091 | Integrated Series | 2024-07-04T20:08:00 | open | 6564391 | 2 | 2 | 101 |
| 1002 | IDE-2096 | Extended Assessment D | 2025-12-15T03:25:00 | restricted | 778560 | 3 | 3 | 102 |
| 1003 | IDE-2101 | Pilot Survey | 2022-05-26T10:42:00 | members-only | 8667ec1da10c4a0293d91388b49bc77c | 4 | 4 | 103 |

Programme committees manage the academic content of conferences. The `programme_committees` table includes a `programme_committee_id` (e.g., `1000`), an `identifier`, a `chair_name` (e.g., *Seasonal Corridor*), a `selection_deadline`, a `membership_limit` (`members-only`, `open`, `restricted`), a `region_code`, and foreign keys `academic_researcher_id` (e.g., `1`), `selects_speaker_academic_researcher_id` (e.g., `1`), and `academic_paper_id` (e.g., `100`). Committee `1000` is chaired by *Seasonal Corridor* with a `members-only` membership limit and a selection deadline of 2023-02-20.

**Table `local_organization_committees`**

| id | identifier | convenor_name | task_category | academic_conference_region_code | academic_institution_id |
|---|---|---|---|---|---|
| 1 | IDE-2086 | Legacy Protocol D | logistics | 1562837 | 1000 |
| 2 | IDE-2091 | Regional Programme | venue | 6564391 | 1001 |
| 3 | IDE-2096 | Seasonal Standard | registration | 778560 | 1002 |
| 4 | IDE-2101 | Integrated Framework A | hospitality | 8667ec1da10c4a0293d91388b49bc77c | 1003 |

Local organization committees handle logistics and venue coordination. The table stores committee identifiers, names, roles, and foreign keys linking to conferences, institutions, and departments. Committee `1` is associated with conference `IDE-2086` and institution `1000`.

**Table `academic_researchers`**

| id | identifier | full_name | affiliation | email | role | is_fellow | academic_institution_id | steering_committee_id | programme_committee_id | local_organization_committee_id | academic_lecture_id | academic_paper_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Theodore Mcgrath | baseline-affiliat-55 | seasonal-email-11 | plenary-speaker | false | 1000 | 100 | 1000 | 1 | 100 | 100 |
| 2 | IDE-2091 | Account Name | pilot-affiliat-56 | regional-email-12 | invited-speaker | true | 1001 | 101 | 1001 | 2 | 101 | 101 |
| 3 | IDE-2096 | Saipan International Airport | extended-affiliat-57 | legacy-email-13 | contributed-author | false | 1002 | 102 | 1002 | 3 | 102 | 102 |
| 4 | IDE-2101 | Norma Fisher | integrated-affiliat-58 | compact-email-14 | committee-member | true | 1003 | 103 | 1003 | 4 | 103 | 103 |

Academic researchers are the individual scholars in the domain. The table stores researcher identifiers, names, contact information, and foreign keys to their home institutions and departments. Researcher `1` is affiliated with institution `1000`.

**Table `academic_lectures`**

| id | identifier | title | lecture_type | named_after | scheduled_date | venue_room | academic_conference_region_code | academic_researcher_id | academic_institution_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | IDE-2086 | Compact Initiative | plenary | primary-named-64 | 2024-11-27T22:18:00 | seasonal-venue-23 | 1562837 | 1 | 1000 |
| 101 | IDE-2091 | Legacy Model | invited | adaptive-named-65 | 2025-04-11T05:35:00 | regional-venue-24 | 6564391 | 2 | 1001 |
| 102 | IDE-2096 | Regional Cluster A | contributed | distributed-named-66 | 2022-09-22T12:52:00 | legacy-venue-25 | 778560 | 3 | 1002 |
| 103 | IDE-2101 | Seasonal Review | named-lecture | baseline-named-67 | 2023-02-06T19:09:00 | compact-venue-26 | 8667ec1da10c4a0293d91388b49bc77c | 4 | 1003 |

Academic lectures represent presentations given at conferences. The table stores lecture identifiers, titles, dates, and foreign keys linking lectures to conferences, researchers, and institutions.

**Table `academic_papers`**

| id | identifier | title | submission_date | status | is_contributed | author_membership_required | academic_conference_region_code | programme_committee_id |
|---|---|---|---|---|---|---|---|---|
| 100 | IDE-2086 | Compact Initiative | 2025-04-24T03:57:00 | submitted | false | Susan Levy | 1562837 | 1000 |
| 101 | IDE-2091 | Legacy Model | 2022-09-08T10:14:00 | under-review | true | Jeff Benjamin | 6564391 | 1001 |
| 102 | IDE-2096 | Regional Cluster A | 2023-02-19T17:31:00 | accepted | false | Theodore Mcgrath | 778560 | 1002 |
| 103 | IDE-2101 | Seasonal Review | 2024-07-03T00:48:00 | rejected | true | Kimberly Maynard | 8667ec1da10c4a0293d91388b49bc77c | 1003 |

Academic papers are the scholarly publications associated with conferences. The table stores paper identifiers, titles, publication dates, and foreign keys linking papers to conferences, researchers, and committees.

**Table `committees_researchers`**

| steering_committee_id | academic_researcher_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `committees_researchers` junction table resolves the many-to-many relationship between committees and researchers. A researcher may serve on multiple committees, and a committee comprises multiple researchers. Each row links a committee `id` to a researcher `id`, effectively materializing the membership of every steering, programme, and local organization committee.

**Table `papers_researchers`**

| academic_paper_id | academic_researcher_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `papers_researchers` junction table resolves the many-to-many relationship between papers and researchers. A paper may have multiple authors, and a researcher may author multiple papers. Each row links a paper `id` to a researcher `id`, capturing the authorship of every academic publication.

### Reconstructing Domain Facts Through Views

The normalized schema above is not the end of the story. Analysts and applications rarely query raw junction tables and foreign keys directly; instead, they consume pre-joined views that reconstruct domain facts in a single, readable result set. Each view answers a specific question by joining two or more base tables along their foreign-key relationships.

**View `academic_conference_academic_institution_view`**

```sql
CREATE VIEW academic_conference_academic_institution_view AS
SELECT a.identifier, a.title, a.start_date, a.end_date, b.id AS institution_id, b.identifier AS institution_identifier, b.name AS institution_name
FROM academic_conferences a JOIN academic_institutions b ON a.academic_institution_id = b.id;
```

| identifier | title | start_date | end_date | institution_id | institution_identifier | institution_name |
|---|---|---|---|---|---|---|
| IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | IDE-2086 | Extended Review |
| IDE-2091 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | IDE-2091 | Pilot Initiative A |
| IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | IDE-2096 | Baseline Model |
| IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | IDE-2101 | Distributed Cluster |

This view joins `academic_conferences` to `academic_institutions` on `academic_institution_id`, answering the question: *Which institution hosts which conference?* A row with conference `IDE-2086` (*Compact Initiative*) and institution `1000` (*Extended Review*, *integrated-city-34*) tells us that the conference was hosted at that institution.

**View `academic_conference_learned_society_view`**

```sql
CREATE VIEW academic_conference_learned_society_view AS
SELECT a.identifier, a.title, a.start_date, a.end_date, b.learned_society_id AS society_learned_society_id, b.identifier AS society_identifier, b.name AS society_name
FROM academic_conferences a JOIN learned_societies b ON a.learned_society_id = b.learned_society_id;
```

| identifier | title | start_date | end_date | society_learned_society_id | society_identifier | society_name |
|---|---|---|---|---|---|---|
| IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | IDE-2086 | Extended Review |
| IDE-2091 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | IDE-2091 | Pilot Initiative A |
| IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | IDE-2096 | Baseline Model |
| IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | IDE-2101 | Distributed Cluster |

By joining `academic_conferences` to `learned_societies` on `learned_society_id`, this view reveals which learned society sponsors each conference. Conference `IDE-2086` is sponsored by society `1` (*Extended Review*), an `active`, `self-supporting` organization.

**View `academic_conference_steering_committee_view`**

```sql
CREATE VIEW academic_conference_steering_committee_view AS
SELECT a.identifier, a.title, a.start_date, a.end_date, b.id AS committee_id, b.identifier AS committee_identifier, b.role AS committee_role
FROM academic_conferences a JOIN steering_committees b ON a.steering_committee_id = b.id;
```

| identifier | title | start_date | end_date | committee_id | committee_identifier | committee_role |
|---|---|---|---|---|---|---|
| IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 100 | IDE-2086 | chair |
| IDE-2091 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 101 | IDE-2091 | secretary |
| IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 102 | IDE-2096 | member |
| IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 103 | IDE-2101 | chair |

This view links conferences to their governing steering committees via `steering_committee_id`. Conference `IDE-2086` is governed by committee `100`, whose `role` is `chair` and `responsibility_level` is `apex`.

**View `academic_conference_programme_committee_view`**

```sql
CREATE VIEW academic_conference_programme_committee_view AS
SELECT a.identifier, a.title, a.start_date, a.end_date, b.programme_committee_id AS committee_programme_committee_id, b.identifier AS committee_identifier, b.chair_name AS committee_chair_name
FROM academic_conferences a JOIN programme_committees b ON a.programme_committee_id = b.programme_committee_id;
```

| identifier | title | start_date | end_date | committee_programme_committee_id | committee_identifier | committee_chair_name |
|---|---|---|---|---|---|---|
| IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | IDE-2086 | Seasonal Corridor |
| IDE-2091 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | IDE-2091 | Integrated Series |
| IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | IDE-2096 | Extended Assessment D |
| IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | IDE-2101 | Pilot Survey |

Joining on `programme_committee_id`, this view shows which programme committee manages the academic content of each conference. Conference `IDE-2086` is managed by committee `1000`, chaired by *Seasonal Corridor* with a `members-only` membership limit.

**View `academic_conference_local_organization_committee_view`**

```sql
CREATE VIEW academic_conference_local_organization_committee_view AS
SELECT a.identifier, a.title, a.start_date, a.end_date, b.id AS committee_id, b.identifier AS committee_identifier, b.convenor_name AS committee_convenor_name
FROM academic_conferences a JOIN local_organization_committees b ON a.local_organization_committee_id = b.id;
```

| identifier | title | start_date | end_date | committee_id | committee_identifier | committee_convenor_name |
|---|---|---|---|---|---|---|
| IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | IDE-2086 | Legacy Protocol D |
| IDE-2091 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | IDE-2091 | Regional Programme |
| IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | IDE-2096 | Seasonal Standard |
| IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | IDE-2101 | Integrated Framework A |

This view connects conferences to their local organization committees via `local_organization_committee_id`. Conference `IDE-2086` uses committee `1` for logistics.

**View `learned_society_academic_conference_view`**

```sql
CREATE VIEW learned_society_academic_conference_view AS
SELECT a.learned_society_id, a.identifier, a.name, a.founding_year, b.identifier AS conference_identifier, b.title AS conference_title, b.start_date AS conference_start_date
FROM learned_societies a JOIN academic_conferences b ON a.academic_conference_region_code = b.region_code;
```

| learned_society_id | identifier | name | founding_year | conference_identifier | conference_title | conference_start_date |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 43 | IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 |
| 2 | IDE-2091 | Pilot Initiative A | 48 | IDE-2091 | Legacy Model | 2023-02-16T03:41:00 |
| 3 | IDE-2096 | Baseline Model | 53 | IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 |
| 4 | IDE-2101 | Distributed Cluster | 58 | IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 |

The inverse of the sponsorship view, this reconstruction starts from the learned society and enumerates the conferences it supports. Society `1` (*Extended Review*) is linked to conference `IDE-2086`.

**View `academic_institution_academic_conference_view`**

```sql
CREATE VIEW academic_institution_academic_conference_view AS
SELECT a.id, a.identifier, a.name, a.city, b.identifier AS conference_identifier, b.title AS conference_title, b.start_date AS conference_start_date
FROM academic_institutions a JOIN academic_conferences b ON a.academic_conference_region_code = b.region_code;
```

| id | identifier | name | city | conference_identifier | conference_title | conference_start_date |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Extended Review | integrated-city-34 | IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 |
| 1001 | IDE-2091 | Pilot Initiative A | seasonal-city-35 | IDE-2091 | Legacy Model | 2023-02-16T03:41:00 |
| 1002 | IDE-2096 | Baseline Model | regional-city-36 | IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 |
| 1003 | IDE-2101 | Distributed Cluster | legacy-city-37 | IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 |

Starting from the institution, this view lists the conferences hosted at each one. Institution `1000` (*Extended Review*, *integrated-city-34*) hosts conference `IDE-2086`.

**View `academic_institution_academic_department_view`**

```sql
CREATE VIEW academic_institution_academic_department_view AS
SELECT a.id, a.identifier, a.name, a.city, b.academic_department_id AS department_academic_department_id, b.identifier AS department_identifier, b.name AS department_name
FROM academic_institutions a JOIN academic_departments b ON a.academic_department_id = b.academic_department_id;
```

| id | identifier | name | city | department_academic_department_id | department_identifier | department_name |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Extended Review | integrated-city-34 | 1 | IDE-2086 | Extended Review |
| 1001 | IDE-2091 | Pilot Initiative A | seasonal-city-35 | 2 | IDE-2091 | Pilot Initiative A |
| 1002 | IDE-2096 | Baseline Model | regional-city-36 | 3 | IDE-2096 | Baseline Model |
| 1003 | IDE-2101 | Distributed Cluster | legacy-city-37 | 4 | IDE-2101 | Distributed Cluster |

This view joins institutions to their subordinate departments via `academic_department_id`. Institution `1000` contains department `1` (*Extended Review*), headed by *Distributed Cluster*.

**View `academic_department_academic_institution_view`**

```sql
CREATE VIEW academic_department_academic_institution_view AS
SELECT a.academic_department_id, a.identifier, a.name, a.head_name, b.id AS institution_id, b.identifier AS institution_identifier, b.name AS institution_name
FROM academic_departments a JOIN academic_institutions b ON a.academic_institution_id = b.id;
```

| academic_department_id | identifier | name | head_name | institution_id | institution_identifier | institution_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | Distributed Cluster | 1000 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Pilot Initiative A | Adaptive Review D | 1001 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Baseline Model | Primary Initiative | 1002 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Distributed Cluster | Composite Model | 1003 | IDE-2101 | Distributed Cluster |

The inverse of the department-institution view, this reconstruction starts from the department and reveals its parent institution. Department `1` belongs to institution `1000`.

**View `academic_department_local_organization_committee_view`**

```sql
CREATE VIEW academic_department_local_organization_committee_view AS
SELECT a.academic_department_id, a.identifier, a.name, a.head_name, b.id AS committee_id, b.identifier AS committee_identifier, b.convenor_name AS committee_convenor_name
FROM academic_departments a JOIN local_organization_committees b ON a.local_organization_committee_id = b.id;
```

| academic_department_id | identifier | name | head_name | committee_id | committee_identifier | committee_convenor_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | Distributed Cluster | 1 | IDE-2086 | Legacy Protocol D |
| 2 | IDE-2091 | Pilot Initiative A | Adaptive Review D | 2 | IDE-2091 | Regional Programme |
| 3 | IDE-2096 | Baseline Model | Primary Initiative | 3 | IDE-2096 | Seasonal Standard |
| 4 | IDE-2101 | Distributed Cluster | Composite Model | 4 | IDE-2101 | Integrated Framework A |

Departments are linked to local organization committees via `local_organization_committee_id`. Department `1` is associated with committee `1`.

**View `steering_committee_academic_conference_view`**

```sql
CREATE VIEW steering_committee_academic_conference_view AS
SELECT a.id, a.identifier, a.role, a.responsibility_level, b.identifier AS conference_identifier, b.title AS conference_title, b.start_date AS conference_start_date
FROM steering_committees a JOIN academic_conferences b ON a.academic_conference_region_code = b.region_code;
```

| id | identifier | role | responsibility_level | conference_identifier | conference_title | conference_start_date |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | chair | apex | IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 |
| 101 | IDE-2091 | secretary | operational | IDE-2091 | Legacy Model | 2023-02-16T03:41:00 |
| 102 | IDE-2096 | member | support | IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 |
| 103 | IDE-2101 | chair | apex | IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 |

Starting from the steering committee, this view shows which conference it governs. Committee `100` governs conference `IDE-2086`.

**View `steering_committee_academic_researcher_detail_view`**

```sql
CREATE VIEW steering_committee_academic_researcher_detail_view AS
SELECT a.id, a.identifier, a.role, b.id AS researcher_id, b.identifier AS researcher_identifier, b.full_name AS researcher_full_name
FROM steering_committees a
  JOIN committees_researchers j ON j.steering_committee_id = a.id
  JOIN academic_researchers b ON b.id = j.academic_researcher_id;
```

| id | identifier | role | researcher_id | researcher_identifier | researcher_full_name |
|---|---|---|---|---|---|
| 100 | IDE-2086 | chair | 1 | IDE-2086 | Theodore Mcgrath |
| 100 | IDE-2086 | chair | 2 | IDE-2091 | Account Name |
| 101 | IDE-2091 | secretary | 2 | IDE-2091 | Account Name |
| 101 | IDE-2091 | secretary | 3 | IDE-2096 | Saipan International Airport |
| 102 | IDE-2096 | member | 3 | IDE-2096 | Saipan International Airport |
| 102 | IDE-2096 | member | 4 | IDE-2101 | Norma Fisher |
| 103 | IDE-2101 | chair | 4 | IDE-2101 | Norma Fisher |
| 103 | IDE-2101 | chair | 1 | IDE-2086 | Theodore Mcgrath |

This view joins `steering_committees` to `academic_researchers` through the `committees_researchers` junction table, answering: *Which researchers serve on which steering committee?* Committee `100` includes researcher `1`.

**View `steering_committee_programme_committee_view`**

```sql
CREATE VIEW steering_committee_programme_committee_view AS
SELECT a.id, a.identifier, a.role, a.responsibility_level, b.programme_committee_id AS committee_programme_committee_id, b.identifier AS committee_identifier, b.chair_name AS committee_chair_name
FROM steering_committees a JOIN programme_committees b ON a.programme_committee_id = b.programme_committee_id;
```

| id | identifier | role | responsibility_level | committee_programme_committee_id | committee_identifier | committee_chair_name |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | chair | apex | 1000 | IDE-2086 | Seasonal Corridor |
| 101 | IDE-2091 | secretary | operational | 1001 | IDE-2091 | Integrated Series |
| 102 | IDE-2096 | member | support | 1002 | IDE-2096 | Extended Assessment D |
| 103 | IDE-2101 | chair | apex | 1003 | IDE-2101 | Pilot Survey |

Steering committees are linked to programme committees via `programme_committee_id` in the steering committees table. Committee `100` oversees programme committee `1000`.

**View `steering_committee_local_organization_committee_view`**

```sql
CREATE VIEW steering_committee_local_organization_committee_view AS
SELECT a.id, a.identifier, a.role, a.responsibility_level, b.id AS committee_id, b.identifier AS committee_identifier, b.convenor_name AS committee_convenor_name
FROM steering_committees a JOIN local_organization_committees b ON a.local_organization_committee_id = b.id;
```

| id | identifier | role | responsibility_level | committee_id | committee_identifier | committee_convenor_name |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | chair | apex | 1 | IDE-2086 | Legacy Protocol D |
| 101 | IDE-2091 | secretary | operational | 2 | IDE-2091 | Regional Programme |
| 102 | IDE-2096 | member | support | 3 | IDE-2096 | Seasonal Standard |
| 103 | IDE-2101 | chair | apex | 4 | IDE-2101 | Integrated Framework A |

This view connects steering committees to local organization committees via `local_organization_committee_id`. Committee `100` is associated with local committee `1`.

**View `programme_committee_academic_conference_view`**

```sql
CREATE VIEW programme_committee_academic_conference_view AS
SELECT a.programme_committee_id, a.identifier, a.chair_name, a.selection_deadline, b.identifier AS conference_identifier, b.title AS conference_title, b.start_date AS conference_start_date
FROM programme_committees a JOIN academic_conferences b ON a.academic_conference_region_code = b.region_code;
```

| programme_committee_id | identifier | chair_name | selection_deadline | conference_identifier | conference_title | conference_start_date |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Seasonal Corridor | 2023-02-20T13:51:00 | IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 |
| 1001 | IDE-2091 | Integrated Series | 2024-07-04T20:08:00 | IDE-2091 | Legacy Model | 2023-02-16T03:41:00 |
| 1002 | IDE-2096 | Extended Assessment D | 2025-12-15T03:25:00 | IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 |
| 1003 | IDE-2101 | Pilot Survey | 2022-05-26T10:42:00 | IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 |

Starting from the programme committee, this view reveals which conference it serves. Programme committee `1000` serves conference `IDE-2086`.

**View `programme_committee_academic_researcher_view`**

```sql
CREATE VIEW programme_committee_academic_researcher_view AS
SELECT a.programme_committee_id, a.identifier, a.chair_name, a.selection_deadline, b.id AS researcher_id, b.identifier AS researcher_identifier, b.full_name AS researcher_full_name
FROM programme_committees a JOIN academic_researchers b ON a.academic_researcher_id = b.id;
```

| programme_committee_id | identifier | chair_name | selection_deadline | researcher_id | researcher_identifier | researcher_full_name |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Seasonal Corridor | 2023-02-20T13:51:00 | 1 | IDE-2086 | Theodore Mcgrath |
| 1001 | IDE-2091 | Integrated Series | 2024-07-04T20:08:00 | 2 | IDE-2091 | Account Name |
| 1002 | IDE-2096 | Extended Assessment D | 2025-12-15T03:25:00 | 3 | IDE-2096 | Saipan International Airport |
| 1003 | IDE-2101 | Pilot Survey | 2022-05-26T10:42:00 | 4 | IDE-2101 | Norma Fisher |

This view joins programme committees to researchers via `academic_researcher_id`. Programme committee `1000` is associated with researcher `1`.

**View `programme_committee_academic_paper_view`**

```sql
CREATE VIEW programme_committee_academic_paper_view AS
SELECT a.programme_committee_id, a.identifier, a.chair_name, a.selection_deadline, b.id AS paper_id, b.identifier AS paper_identifier, b.title AS paper_title
FROM programme_committees a JOIN academic_papers b ON a.academic_paper_id = b.id;
```

| programme_committee_id | identifier | chair_name | selection_deadline | paper_id | paper_identifier | paper_title |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Seasonal Corridor | 2023-02-20T13:51:00 | 100 | IDE-2086 | Compact Initiative |
| 1001 | IDE-2091 | Integrated Series | 2024-07-04T20:08:00 | 101 | IDE-2091 | Legacy Model |
| 1002 | IDE-2096 | Extended Assessment D | 2025-12-15T03:25:00 | 102 | IDE-2096 | Regional Cluster A |
| 1003 | IDE-2101 | Pilot Survey | 2022-05-26T10:42:00 | 103 | IDE-2101 | Seasonal Review |

Programme committees are linked to papers via `academic_paper_id`. Committee `1000` is associated with paper `100`.

**View `local_organization_committee_academic_conference_view`**

```sql
CREATE VIEW local_organization_committee_academic_conference_view AS
SELECT a.id, a.identifier, a.convenor_name, a.task_category, b.identifier AS conference_identifier, b.title AS conference_title, b.start_date AS conference_start_date
FROM local_organization_committees a JOIN academic_conferences b ON a.academic_conference_region_code = b.region_code;
```

| id | identifier | convenor_name | task_category | conference_identifier | conference_title | conference_start_date |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Legacy Protocol D | logistics | IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 |
| 2 | IDE-2091 | Regional Programme | venue | IDE-2091 | Legacy Model | 2023-02-16T03:41:00 |
| 3 | IDE-2096 | Seasonal Standard | registration | IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 |
| 4 | IDE-2101 | Integrated Framework A | hospitality | IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 |

Starting from the local organization committee, this view shows which conference it supports. Committee `1` supports conference `IDE-2086`.

**View `local_organization_committee_academic_researcher_detail_view`**

```sql
CREATE VIEW local_organization_committee_academic_researcher_detail_view AS
SELECT a.id, a.identifier, a.convenor_name, b.id AS researcher_id, b.identifier AS researcher_identifier, b.full_name AS researcher_full_name
FROM local_organization_committees a
  JOIN committees_researchers j ON j.local_organization_committee_id = a.id
  JOIN academic_researchers b ON b.id = j.academic_researcher_id;
```

| id | identifier | convenor_name | researcher_id | researcher_identifier | researcher_full_name |
|---|---|---|---|---|---|
| 1 | IDE-2086 | Legacy Protocol D | 1 | IDE-2086 | Theodore Mcgrath |
| 1 | IDE-2086 | Legacy Protocol D | 2 | IDE-2091 | Account Name |
| 2 | IDE-2091 | Regional Programme | 2 | IDE-2091 | Account Name |
| 2 | IDE-2091 | Regional Programme | 3 | IDE-2096 | Saipan International Airport |
| 3 | IDE-2096 | Seasonal Standard | 3 | IDE-2096 | Saipan International Airport |
| 3 | IDE-2096 | Seasonal Standard | 4 | IDE-2101 | Norma Fisher |
| 4 | IDE-2101 | Integrated Framework A | 4 | IDE-2101 | Norma Fisher |
| 4 | IDE-2101 | Integrated Framework A | 1 | IDE-2086 | Theodore Mcgrath |

This view joins local organization committees to researchers through the `committees_researchers` junction table. Committee `1` includes researcher `1`.

**View `local_organization_committee_academic_institution_view`**

```sql
CREATE VIEW local_organization_committee_academic_institution_view AS
SELECT a.id, a.identifier, a.convenor_name, a.task_category, b.id AS institution_id, b.identifier AS institution_identifier, b.name AS institution_name
FROM local_organization_committees a JOIN academic_institutions b ON a.academic_institution_id = b.id;
```

| id | identifier | convenor_name | task_category | institution_id | institution_identifier | institution_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Legacy Protocol D | logistics | 1000 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Regional Programme | venue | 1001 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Seasonal Standard | registration | 1002 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Integrated Framework A | hospitality | 1003 | IDE-2101 | Distributed Cluster |

Local organization committees are linked to institutions via the department chain. Committee `1` is associated with institution `1000`.

**View `academic_researcher_academic_institution_view`**

```sql
CREATE VIEW academic_researcher_academic_institution_view AS
SELECT a.id, a.identifier, a.full_name, a.affiliation, b.id AS institution_id, b.identifier AS institution_identifier, b.name AS institution_name
FROM academic_researchers a JOIN academic_institutions b ON a.academic_institution_id = b.id;
```

| id | identifier | full_name | affiliation | institution_id | institution_identifier | institution_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Theodore Mcgrath | baseline-affiliat-55 | 1000 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Account Name | pilot-affiliat-56 | 1001 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Saipan International Airport | extended-affiliat-57 | 1002 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Norma Fisher | integrated-affiliat-58 | 1003 | IDE-2101 | Distributed Cluster |

This view joins researchers to their home institutions. Researcher `1` is affiliated with institution `1000`.

**View `academic_researcher_steering_committee_view`**

```sql
CREATE VIEW academic_researcher_steering_committee_view AS
SELECT a.id, a.identifier, a.full_name, a.affiliation, b.id AS committee_id, b.identifier AS committee_identifier, b.role AS committee_role
FROM academic_researchers a JOIN steering_committees b ON a.steering_committee_id = b.id;
```

| id | identifier | full_name | affiliation | committee_id | committee_identifier | committee_role |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Theodore Mcgrath | baseline-affiliat-55 | 100 | IDE-2086 | chair |
| 2 | IDE-2091 | Account Name | pilot-affiliat-56 | 101 | IDE-2091 | secretary |
| 3 | IDE-2096 | Saipan International Airport | extended-affiliat-57 | 102 | IDE-2096 | member |
| 4 | IDE-2101 | Norma Fisher | integrated-affiliat-58 | 103 | IDE-2101 | chair |

Through the `committees_researchers` junction, this view reveals which steering committees a researcher serves on. Researcher `1` serves on committee `100`.

**View `academic_researcher_programme_committee_view`**

```sql
CREATE VIEW academic_researcher_programme_committee_view AS
SELECT a.id, a.identifier, a.full_name, a.affiliation, b.programme_committee_id AS committee_programme_committee_id, b.identifier AS committee_identifier, b.chair_name AS committee_chair_name
FROM academic_researchers a JOIN programme_committees b ON a.programme_committee_id = b.programme_committee_id;
```

| id | identifier | full_name | affiliation | committee_programme_committee_id | committee_identifier | committee_chair_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Theodore Mcgrath | baseline-affiliat-55 | 1000 | IDE-2086 | Seasonal Corridor |
| 2 | IDE-2091 | Account Name | pilot-affiliat-56 | 1001 | IDE-2091 | Integrated Series |
| 3 | IDE-2096 | Saipan International Airport | extended-affiliat-57 | 1002 | IDE-2096 | Extended Assessment D |
| 4 | IDE-2101 | Norma Fisher | integrated-affiliat-58 | 1003 | IDE-2101 | Pilot Survey |

This view links researchers to programme committees via the `committees_researchers` junction. Researcher `1` serves on programme committee `1000`.

**View `academic_researcher_local_organization_committee_view`**

```sql
CREATE VIEW academic_researcher_local_organization_committee_view AS
SELECT a.id, a.identifier, a.full_name, a.affiliation, b.id AS committee_id, b.identifier AS committee_identifier, b.convenor_name AS committee_convenor_name
FROM academic_researchers a JOIN local_organization_committees b ON a.local_organization_committee_id = b.id;
```

| id | identifier | full_name | affiliation | committee_id | committee_identifier | committee_convenor_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Theodore Mcgrath | baseline-affiliat-55 | 1 | IDE-2086 | Legacy Protocol D |
| 2 | IDE-2091 | Account Name | pilot-affiliat-56 | 2 | IDE-2091 | Regional Programme |
| 3 | IDE-2096 | Saipan International Airport | extended-affiliat-57 | 3 | IDE-2096 | Seasonal Standard |
| 4 | IDE-2101 | Norma Fisher | integrated-affiliat-58 | 4 | IDE-2101 | Integrated Framework A |

Through the `committees_researchers` junction, this view shows which local organization committees a researcher participates in. Researcher `1` serves on committee `1`.

**View `academic_researcher_academic_lecture_view`**

```sql
CREATE VIEW academic_researcher_academic_lecture_view AS
SELECT a.id, a.identifier, a.full_name, a.affiliation, b.id AS lecture_id, b.identifier AS lecture_identifier, b.title AS lecture_title
FROM academic_researchers a JOIN academic_lectures b ON a.academic_lecture_id = b.id;
```

| id | identifier | full_name | affiliation | lecture_id | lecture_identifier | lecture_title |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Theodore Mcgrath | baseline-affiliat-55 | 100 | IDE-2086 | Compact Initiative |
| 2 | IDE-2091 | Account Name | pilot-affiliat-56 | 101 | IDE-2091 | Legacy Model |
| 3 | IDE-2096 | Saipan International Airport | extended-affiliat-57 | 102 | IDE-2096 | Regional Cluster A |
| 4 | IDE-2101 | Norma Fisher | integrated-affiliat-58 | 103 | IDE-2101 | Seasonal Review |

This view joins researchers to the lectures they have given. Researcher `1` has delivered lecture `100`.

**View `academic_researcher_academic_paper_view`**

```sql
CREATE VIEW academic_researcher_academic_paper_view AS
SELECT a.id, a.identifier, a.full_name, a.affiliation, b.id AS paper_id, b.identifier AS paper_identifier, b.title AS paper_title
FROM academic_researchers a JOIN academic_papers b ON a.academic_paper_id = b.id;
```

| id | identifier | full_name | affiliation | paper_id | paper_identifier | paper_title |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Theodore Mcgrath | baseline-affiliat-55 | 100 | IDE-2086 | Compact Initiative |
| 2 | IDE-2091 | Account Name | pilot-affiliat-56 | 101 | IDE-2091 | Legacy Model |
| 3 | IDE-2096 | Saipan International Airport | extended-affiliat-57 | 102 | IDE-2096 | Regional Cluster A |
| 4 | IDE-2101 | Norma Fisher | integrated-affiliat-58 | 103 | IDE-2101 | Seasonal Review |

Through the `papers_researchers` junction, this view reveals which papers a researcher has authored. Researcher `1` has authored paper `100`.

**View `academic_lecture_academic_conference_view`**

```sql
CREATE VIEW academic_lecture_academic_conference_view AS
SELECT a.id, a.identifier, a.title, a.lecture_type, b.identifier AS conference_identifier, b.title AS conference_title, b.start_date AS conference_start_date
FROM academic_lectures a JOIN academic_conferences b ON a.academic_conference_region_code = b.region_code;
```

| id | identifier | title | lecture_type | conference_identifier | conference_title | conference_start_date |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | Compact Initiative | plenary | IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 |
| 101 | IDE-2091 | Legacy Model | invited | IDE-2091 | Legacy Model | 2023-02-16T03:41:00 |
| 102 | IDE-2096 | Regional Cluster A | contributed | IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 |
| 103 | IDE-2101 | Seasonal Review | named-lecture | IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 |

Starting from a lecture, this view shows which conference it was presented at. Lecture `100` was presented at conference `IDE-2086`.

**View `academic_lecture_academic_researcher_view`**

```sql
CREATE VIEW academic_lecture_academic_researcher_view AS
SELECT a.id, a.identifier, a.title, a.lecture_type, b.id AS researcher_id, b.identifier AS researcher_identifier, b.full_name AS researcher_full_name
FROM academic_lectures a JOIN academic_researchers b ON a.academic_researcher_id = b.id;
```

| id | identifier | title | lecture_type | researcher_id | researcher_identifier | researcher_full_name |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | Compact Initiative | plenary | 1 | IDE-2086 | Theodore Mcgrath |
| 101 | IDE-2091 | Legacy Model | invited | 2 | IDE-2091 | Account Name |
| 102 | IDE-2096 | Regional Cluster A | contributed | 3 | IDE-2096 | Saipan International Airport |
| 103 | IDE-2101 | Seasonal Review | named-lecture | 4 | IDE-2101 | Norma Fisher |

This view links lectures to their presenters. Lecture `100` was presented by researcher `1`.

**View `academic_lecture_academic_institution_view`**

```sql
CREATE VIEW academic_lecture_academic_institution_view AS
SELECT a.id, a.identifier, a.title, a.lecture_type, b.id AS institution_id, b.identifier AS institution_identifier, b.name AS institution_name
FROM academic_lectures a JOIN academic_institutions b ON a.academic_institution_id = b.id;
```

| id | identifier | title | lecture_type | institution_id | institution_identifier | institution_name |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | Compact Initiative | plenary | 1000 | IDE-2086 | Extended Review |
| 101 | IDE-2091 | Legacy Model | invited | 1001 | IDE-2091 | Pilot Initiative A |
| 102 | IDE-2096 | Regional Cluster A | contributed | 1002 | IDE-2096 | Baseline Model |
| 103 | IDE-2101 | Seasonal Review | named-lecture | 1003 | IDE-2101 | Distributed Cluster |

By joining through the researcher's institution, this view shows which institution a lecturer represents. Researcher `1` represents institution `1000`.

**View `academic_paper_academic_conference_view`**

```sql
CREATE VIEW academic_paper_academic_conference_view AS
SELECT a.id, a.identifier, a.title, a.submission_date, b.identifier AS conference_identifier, b.title AS conference_title, b.start_date AS conference_start_date
FROM academic_papers a JOIN academic_conferences b ON a.academic_conference_region_code = b.region_code;
```

| id | identifier | title | submission_date | conference_identifier | conference_title | conference_start_date |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | Compact Initiative | 2025-04-24T03:57:00 | IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 |
| 101 | IDE-2091 | Legacy Model | 2022-09-08T10:14:00 | IDE-2091 | Legacy Model | 2023-02-16T03:41:00 |
| 102 | IDE-2096 | Regional Cluster A | 2023-02-19T17:31:00 | IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 |
| 103 | IDE-2101 | Seasonal Review | 2024-07-03T00:48:00 | IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 |

Starting from a paper, this view reveals which conference it is associated with. Paper `100` is associated with conference `IDE-2086`.

**View `academic_paper_academic_researcher_detail_view`**

```sql
CREATE VIEW academic_paper_academic_researcher_detail_view AS
SELECT a.id, a.identifier, a.title, b.id AS researcher_id, b.identifier AS researcher_identifier, b.full_name AS researcher_full_name
FROM academic_papers a
  JOIN papers_researchers j ON j.academic_paper_id = a.id
  JOIN academic_researchers b ON b.id = j.academic_researcher_id;
```

| id | identifier | title | researcher_id | researcher_identifier | researcher_full_name |
|---|---|---|---|---|---|
| 100 | IDE-2086 | Compact Initiative | 1 | IDE-2086 | Theodore Mcgrath |
| 100 | IDE-2086 | Compact Initiative | 2 | IDE-2091 | Account Name |
| 101 | IDE-2091 | Legacy Model | 2 | IDE-2091 | Account Name |
| 101 | IDE-2091 | Legacy Model | 3 | IDE-2096 | Saipan International Airport |
| 102 | IDE-2096 | Regional Cluster A | 3 | IDE-2096 | Saipan International Airport |
| 102 | IDE-2096 | Regional Cluster A | 4 | IDE-2101 | Norma Fisher |
| 103 | IDE-2101 | Seasonal Review | 4 | IDE-2101 | Norma Fisher |
| 103 | IDE-2101 | Seasonal Review | 1 | IDE-2086 | Theodore Mcgrath |

Through the `papers_researchers` junction, this view shows which researchers authored a given paper. Paper `100` was authored by researcher `1`.

**View `academic_paper_programme_committee_view`**

```sql
CREATE VIEW academic_paper_programme_committee_view AS
SELECT a.id, a.identifier, a.title, a.submission_date, b.programme_committee_id AS committee_programme_committee_id, b.identifier AS committee_identifier, b.chair_name AS committee_chair_name
FROM academic_papers a JOIN programme_committees b ON a.programme_committee_id = b.programme_committee_id;
```

| id | identifier | title | submission_date | committee_programme_committee_id | committee_identifier | committee_chair_name |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | Compact Initiative | 2025-04-24T03:57:00 | 1000 | IDE-2086 | Seasonal Corridor |
| 101 | IDE-2091 | Legacy Model | 2022-09-08T10:14:00 | 1001 | IDE-2091 | Integrated Series |
| 102 | IDE-2096 | Regional Cluster A | 2023-02-19T17:31:00 | 1002 | IDE-2096 | Extended Assessment D |
| 103 | IDE-2101 | Seasonal Review | 2024-07-03T00:48:00 | 1003 | IDE-2101 | Pilot Survey |

This view links papers to the programme committees that reviewed or selected them. Paper `100` was reviewed by programme committee `1000`.

### Synthesis

The academic conference domain is modelled as a star-like schema with `academic_conferences` at its center, surrounded by dimension tables for institutions, learned societies, committees, researchers, lectures, and papers. Foreign keys enforce a hierarchy: conferences reference institutions and committees; departments nest within institutions; committees contain researchers through the `committees_researchers` junction; and papers are authored by researchers through `papers_researchers`. The thirty-two views each perform a specific join — or a join through a junction table — to reconstruct a single domain fact from this normalized structure. A query for "which institution hosts conference `IDE-2086`?" is answered by `academic_conference_academic_institution_view`, which joins `academic_conferences` to `academic_institutions` on `academic_institution_id = 1000`. A query for "which researchers serve on steering committee `100`?" is answered by `steering_committee_academic_researcher_detail_view`, which traverses `steering_committees` → `committees_researchers` → `academic_researchers`. The schema is designed so that every analytical question about the conference ecosystem maps to exactly one view, and every view maps to a deterministic set of joins over the base tables. This separation of concerns — normalized storage for write integrity, denormalized views for read convenience — is the hallmark of a well-engineered relational model.