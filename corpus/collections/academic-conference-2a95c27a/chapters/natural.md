## The Architecture of Academic Conferences

Academic conferences serve as the primary mechanism through which scholarly communities convene, exchange findings, and coordinate their intellectual labor. Each conference is a complex organizational entity, anchored by an institution, guided by committees, and populated by researchers who contribute papers and lectures. The records below capture the full lifecycle of such events—from planning through completion or cancellation—along with the people, departments, and societies that sustain them.

**Table `academic_conferences`**

| identifier | title | start_date | end_date | status | region_code | academic_institution_id | learned_society_id | steering_committee_id | programme_committee_id | local_organization_committee_id |
|---|---|---|---|---|---|---|---|---|---|---|
| IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | 1562837 | 1000 | 1 | 100 | 1000 | 1 |
| IDE-2091 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | ongoing | 6564391 | 1001 | 2 | 101 | 1001 | 2 |
| IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 778560 | 1002 | 3 | 102 | 1002 | 3 |
| IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | cancelled | 8667ec1da10c4a0293d91388b49bc77c | 1003 | 4 | 103 | 1003 | 4 |

The `academic_conferences` table is the central ledger of all organized events. Each row identifies a conference by a stable identifier such as `IDE-2086` (titled "Compact Initiative") and records its temporal bounds via `start_date` and `end_date`. The `status` column tracks the current phase of the event, with values like `planned`, `ongoing`, `completed`, and `cancelled` appearing across the dataset. The `region_code` column provides a geographic or administrative tag; for example, conference `IDE-2086` carries the region code `1562837`, while `IDE-2101` ("Seasonal Review") is associated with the longer identifier `8667ec1da10c4a0293d91388b49bc77c`. Foreign keys link each conference to its sponsoring `academic_institution_id`, its affiliated `learned_society_id`, and the three committee structures—`steering_committee_id`, `programme_committee_id`, and `local_organization_committee_id`—that govern its execution.

**Table `learned_societies`**

| learned_society_id | identifier | name | founding_year | status | funding_model | academic_conference_region_code |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 43 | active | self-supporting | 1562837 |
| 2 | IDE-2091 | Pilot Initiative A | 48 | inactive | grant-funded | 6564391 |
| 3 | IDE-2096 | Baseline Model | 53 | dissolved | mixed | 778560 |
| 4 | IDE-2101 | Distributed Cluster | 58 | active | self-supporting | 8667ec1da10c4a0293d91388b49bc77c |

Learned societies function as the broader scholarly bodies that sponsor or endorse conferences. The `learned_societies` table records each society's `learned_society_id`, a human-readable `name` such as "Extended Review" or "Pilot Initiative A," and its `founding_year`—ranging from 43 to 58 in the current data. The `status` field distinguishes between `active`, `inactive`, and `dissolved` societies, while `funding_model` describes whether a society is `self-supporting`, `grant-funded`, or operating on a `mixed` basis. Each society is linked to a conference region via `academic_conference_region_code`, enabling cross-referencing with the conference records.

**Table `academic_institutions`**

| id | identifier | name | city | country | postal_code | website | academic_conference_region_code | academic_department_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Extended Review | integrated-city-34 | compact-country-26 | 9125611 | https://bugs.launchpad.net/murano/+bug/1294080 | 1562837 | 1 |
| 1001 | IDE-2091 | Pilot Initiative A | seasonal-city-35 | composite-country-27 | ChIJt4hBkzhu5kcRJJDUNqGUpso | https://bugs.launchpad.net/murano/+bug/1294080 | 6564391 | 2 |
| 1002 | IDE-2096 | Baseline Model | regional-city-36 | primary-country-28 | 3001009030200 | https://www.nature.com/articles/nphoton.2008.245 | 778560 | 3 |
| 1003 | IDE-2101 | Distributed Cluster | legacy-city-37 | adaptive-country-29 | 4060635 | https://bugs.launchpad.net/trove/+bug/1347114 | 8667ec1da10c4a0293d91388b49bc77c | 4 |

Academic institutions provide the physical and administrative home for conferences and the researchers who attend them. The `academic_institutions` table stores each institution's `id` (e.g., `1000`, `1001`), its `name`, and its location details including `city`, `country`, and `postal_code`. The `website` column holds institutional URLs, such as `https://www.nature.com/articles/nphoton.2008.245` for institution `1002` ("Baseline Model"). The `academic_conference_region_code` column again ties institutions to their regional identifiers, and `academic_department_id` links each institution to its parent department.

**Table `academic_departments`**

| academic_department_id | identifier | name | head_name | contact_email | contact_phone | academic_institution_id | local_organization_committee_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | Distributed Cluster | Christopher Wilson | Joe Tsai | 1000 | 1 | 2025-01-01 00:14:00 |
| 2 | IDE-2091 | Pilot Initiative A | Adaptive Review D | Charles Larsen | Stephanie Collins | 1001 | 2 | 2025-02-06 03:14:00 |
| 3 | IDE-2096 | Baseline Model | Primary Initiative | Mary Alvarez | Tasha Rodriguez | 1002 | 3 | 2025-03-11 06:14:00 |
| 4 | IDE-2101 | Distributed Cluster | Composite Model | April Snyder | Walter Pratt | 1003 | 4 | 2025-04-16 09:14:00 |

Departments sit between institutions and the operational committees that organize conferences. The `academic_departments` table records each department's `academic_department_id`, `name`, and the `head_name` responsible for it—such as "Distributed Cluster" headed by Christopher Wilson in department `1`. Contact information is captured in `contact_email` and `contact_phone`, while `academic_institution_id` points back to the parent institution. The `local_organization_committee_id` column creates a direct link to the local organizing body, and `created_at` timestamps the department's establishment.

**Table `steering_committees`**

| id | identifier | role | responsibility_level | academic_conference_region_code | programme_committee_id | local_organization_committee_id |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | chair | apex | 1562837 | 1000 | 1 |
| 101 | IDE-2091 | secretary | operational | 6564391 | 1001 | 2 |
| 102 | IDE-2096 | member | support | 778560 | 1002 | 3 |
| 103 | IDE-2101 | chair | apex | 8667ec1da10c4a0293d91388b49bc77c | 1003 | 4 |

Steering committees provide the highest level of governance for a conference. The `steering_committees` table records each committee's `id` (e.g., `100`, `101`), the `role` of its lead member (`chair`, `secretary`, or `member`), and the `responsibility_level` (`apex`, `operational`, or `support`). Committee `100` for conference `IDE-2086` has a `chair` at the `apex` level, while committee `102` for `IDE-2096` lists a `member` at the `support` level. Each steering committee references its `programme_committee_id` and `local_organization_committee_id`, establishing the chain of command.

**Table `programme_committees`**

| programme_committee_id | identifier | chair_name | selection_deadline | membership_limit | academic_conference_region_code | academic_researcher_id | selects_speaker_academic_researcher_id | academic_paper_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Seasonal Corridor | 2023-02-20T13:51:00 | members-only | 1562837 | 1 | 1 | 100 |
| 1001 | IDE-2091 | Integrated Series | 2024-07-04T20:08:00 | open | 6564391 | 2 | 2 | 101 |
| 1002 | IDE-2096 | Extended Assessment D | 2025-12-15T03:25:00 | restricted | 778560 | 3 | 3 | 102 |
| 1003 | IDE-2101 | Pilot Survey | 2022-05-26T10:42:00 | members-only | 8667ec1da10c4a0293d91388b49bc77c | 4 | 4 | 103 |

Programme committees manage the academic content of a conference—selecting papers, scheduling lectures, and setting deadlines. The `programme_committees` table stores each committee's `programme_committee_id`, the `chair_name` (e.g., "Seasonal Corridor" for committee `1000`), and the `selection_deadline` by which submissions must arrive. The `membership_limit` field indicates whether participation is `members-only`, `open`, or `restricted`. Each programme committee is associated with an `academic_researcher_id` and a `selects_speaker_academic_researcher_id`, creating a direct link to the researchers who shape the programme. The `academic_paper_id` column ties the committee to specific papers under its purview.

**Table `local_organization_committees`**

| id | identifier | convenor_name | task_category | academic_conference_region_code | academic_institution_id |
|---|---|---|---|---|---|
| 1 | IDE-2086 | Legacy Protocol D | logistics | 1562837 | 1000 |
| 2 | IDE-2091 | Regional Programme | venue | 6564391 | 1001 |
| 3 | IDE-2096 | Seasonal Standard | registration | 778560 | 1002 |
| 4 | IDE-2101 | Integrated Framework A | hospitality | 8667ec1da10c4a0293d91388b49bc77c | 1003 |

Local organization committees handle the logistics of hosting a conference—venue coordination, registration, and on-site management. These committees are referenced by the `local_organization_committee_id` fields in conferences, departments, and steering committees, forming the operational backbone of each event.

**Table `academic_researchers`**

| id | identifier | full_name | affiliation | email | role | is_fellow | academic_institution_id | steering_committee_id | programme_committee_id | local_organization_committee_id | academic_lecture_id | academic_paper_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Theodore Mcgrath | baseline-affiliat-55 | seasonal-email-11 | plenary-speaker | false | 1000 | 100 | 1000 | 1 | 100 | 100 |
| 2 | IDE-2091 | Account Name | pilot-affiliat-56 | regional-email-12 | invited-speaker | true | 1001 | 101 | 1001 | 2 | 101 | 101 |
| 3 | IDE-2096 | Saipan International Airport | extended-affiliat-57 | legacy-email-13 | contributed-author | false | 1002 | 102 | 1002 | 3 | 102 | 102 |
| 4 | IDE-2101 | Norma Fisher | integrated-affiliat-58 | compact-email-14 | committee-member | true | 1003 | 103 | 1003 | 4 | 103 | 103 |

Academic researchers are the individuals who contribute to conferences through papers, lectures, and committee service. The `academic_researchers` table captures each researcher's identity and affiliations. Researchers are linked to programme committees via `academic_researcher_id`, and they appear in the `selects_speaker_academic_researcher_id` column of programme committees, indicating their role in speaker selection.

**Table `academic_lectures`**

| id | identifier | title | lecture_type | named_after | scheduled_date | venue_room | academic_conference_region_code | academic_researcher_id | academic_institution_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | IDE-2086 | Compact Initiative | plenary | primary-named-64 | 2024-11-27T22:18:00 | seasonal-venue-23 | 1562837 | 1 | 1000 |
| 101 | IDE-2091 | Legacy Model | invited | adaptive-named-65 | 2025-04-11T05:35:00 | regional-venue-24 | 6564391 | 2 | 1001 |
| 102 | IDE-2096 | Regional Cluster A | contributed | distributed-named-66 | 2022-09-22T12:52:00 | legacy-venue-25 | 778560 | 3 | 1002 |
| 103 | IDE-2101 | Seasonal Review | named-lecture | baseline-named-67 | 2023-02-06T19:09:00 | compact-venue-26 | 8667ec1da10c4a0293d91388b49bc77c | 4 | 1003 |

Academic lectures represent the oral presentations delivered at conferences. Each lecture is tied to a specific conference and a presenting researcher, forming the visible output of the academic programme.

**Table `academic_papers`**

| id | identifier | title | submission_date | status | is_contributed | author_membership_required | academic_conference_region_code | programme_committee_id |
|---|---|---|---|---|---|---|---|---|
| 100 | IDE-2086 | Compact Initiative | 2025-04-24T03:57:00 | submitted | false | Susan Levy | 1562837 | 1000 |
| 101 | IDE-2091 | Legacy Model | 2022-09-08T10:14:00 | under-review | true | Jeff Benjamin | 6564391 | 1001 |
| 102 | IDE-2096 | Regional Cluster A | 2023-02-19T17:31:00 | accepted | false | Theodore Mcgrath | 778560 | 1002 |
| 103 | IDE-2101 | Seasonal Review | 2024-07-03T00:48:00 | rejected | true | Kimberly Maynard | 8667ec1da10c4a0293d91388b49bc77c | 1003 |

Academic papers are the written contributions reviewed and accepted by programme committees. Papers are linked to both the conferences where they appear and the researchers who authored them.

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

The `committees_researchers` table records the many-to-many relationship between researchers and committees. A single researcher may serve on multiple committees across different conferences, and each committee draws its membership from a pool of researchers.

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

The `papers_researchers` table captures the authorship relationship between papers and researchers. A paper may have multiple authors, and a researcher may contribute to multiple papers across different conferences.

### Conference-Institution Relationships

The `academic_conference_academic_institution_view` answers the question: which institution hosts which conference? This join connects `academic_conferences` with `academic_institutions` through the `academic_institution_id` foreign key. For conference `IDE-2086` ("Compact Initiative"), the view reveals that institution `1000` ("Extended Review") in `integrated-city-34` is the host. Similarly, conference `IDE-2096` ("Regional Cluster A") is associated with institution `1002` ("Baseline Model") located in `regional-city-36`. This view is essential for understanding the institutional footprint of each event.

The `academic_conference_learned_society_view` links conferences to their sponsoring learned societies. Conference `IDE-2086` is sponsored by learned society `1` ("Extended Review"), founded in year 43 and currently `active` with a `self-supporting` funding model. Conference `IDE-2091` ("Legacy Model") is associated with society `2` ("Pilot Initiative A"), which is `inactive` and `grant-funded`. This relationship clarifies the scholarly endorsement behind each event.

The `academic_conference_steering_committee_view` reveals the governance structure of each conference. Conference `IDE-2086` is governed by steering committee `100`, whose chair operates at the `apex` responsibility level. Conference `IDE-2101` ("Seasonal Review"), despite being `cancelled`, still has steering committee `103` assigned with a `chair` at the `apex` level. This view is critical for auditing the chain of authority.

The `academic_conference_programme_committee_view` connects conferences to the committees that shape their academic content. Conference `IDE-2086` is linked to programme committee `1000`, chaired by "Seasonal Corridor" with a `selection_deadline` of `2023-02-20T13:51:00` and a `members-only` membership limit. Conference `IDE-2091` uses programme committee `1001`, chaired by "Integrated Series," with an `open` membership policy and a deadline of `2024-07-04T20:08:00`.

The `academic_conference_local_organization_committee_view` ties conferences to their local organizing bodies. Conference `IDE-2086` is managed by local organization committee `1`, while conference `IDE-2101` uses committee `4`. This relationship ensures that logistical responsibilities are clearly assigned.

### Society and Institution Perspectives

The `learned_society_academic_conference_view` inverts the sponsorship relationship, answering: which conferences does each learned society support? Learned society `1` ("Extended Review") sponsors conference `IDE-2086`, while society `4` ("Distributed Cluster") supports conference `IDE-2101`. This perspective is useful for societies tracking their portfolio of events.

The `academic_institution_academic_conference_view` shows which conferences each institution hosts. Institution `1000` ("Extended Review") hosts conference `IDE-2086`, and institution `1003` ("Distributed Cluster") hosts conference `IDE-2101`. This view helps institutions assess their event portfolio.

The `academic_institution_academic_department_view` links institutions to their constituent departments. Institution `1000` contains department `1` ("Extended Review"), headed by Christopher Wilson with contact email `Joe Tsai`. Institution `1002` ("Baseline Model") contains department `3` ("Baseline Model"), headed by Mary Alvarez. This relationship is fundamental to understanding the organizational hierarchy.

The `academic_department_academic_institution_view` inverts the department-institution relationship, showing which institution each department belongs to. Department `1` ("Extended Review") belongs to institution `1000`, and department `4` ("Distributed Cluster") belongs to institution `1003`.

The `academic_department_local_organization_committee_view` connects departments to the local organizing committees they support. Department `1` is linked to local organization committee `1`, and department `4` to committee `4`. This relationship ensures that departmental resources are allocated to the correct events.

### Committee-Centric Views

The `steering_committee_academic_conference_view` reveals which conference each steering committee governs. Steering committee `100` governs conference `IDE-2086`, and committee `103` governs conference `IDE-2101`. This view is essential for understanding governance coverage.

The `steering_committee_academic_researcher_detail_view` links steering committee members to their full researcher profiles. This join provides the personnel detail needed to understand who is responsible for conference governance.

The `steering_committee_programme_committee_view` connects steering committees to the programme committees they oversee. Steering committee `100` oversees programme committee `1000`, and committee `101` oversees committee `1001`. This relationship establishes the academic oversight chain.

The `steering_committee_local_organization_committee_view` links steering committees to the local organizing committees they supervise. Steering committee `100` supervises local organization committee `1`, and committee `103` supervises committee `4`. This ensures that logistical operations align with governance decisions.

The `programme_committee_academic_conference_view` shows which conference each programme committee serves. Programme committee `1000` serves conference `IDE-2086`, and committee `1003` serves conference `IDE-2101`. This view clarifies the academic scope of each committee.

The `programme_committee_academic_researcher_view` connects programme committees to the researchers who serve on them. Programme committee `1000` includes researcher `1`, and committee `1001` includes researcher `2`. This relationship is central to understanding committee composition.

The `programme_committee_academic_paper_view` links programme committees to the papers they review. Programme committee `1000` reviews paper `100`, and committee `1003` reviews paper `103`. This view is essential for tracking the peer-review pipeline.

The `local_organization_committee_academic_conference_view` shows which conference each local organization committee manages. Local organization committee `1` manages conference `IDE-2086`, and committee `4` manages conference `IDE-2101`.

The `local_organization_committee_academic_researcher_detail_view` provides the personnel detail for researchers assigned to local organization committees, enabling logistical coordination.

The `local_organization_committee_academic_institution_view` links local organization committees to their host institutions. Local organization committee `1` is associated with institution `1000`, and committee `4` with institution `1003`. This ensures that institutional resources support the correct events.

### Researcher-Centric Views

The `academic_researcher_academic_institution_view` connects researchers to their home institutions. This view answers which institution employs or affiliates with each researcher, providing the institutional context for their contributions.

The `academic_researcher_steering_committee_view` shows which steering committees each researcher serves on. Researchers may hold positions on multiple committees across different conferences, and this view captures that breadth of service.

The `academic_researcher_programme_committee_view` links researchers to the programme committees they participate in. This relationship is central to understanding who shapes the academic content of conferences.

The `academic_researcher_local_organization_committee_view` connects researchers to the local organization committees they support. This view captures the logistical contributions of researchers beyond their academic roles.

The `academic_researcher_academic_lecture_view` links researchers to the lectures they deliver. Each lecture represents a researcher's oral presentation at a conference, forming the visible output of their participation.

The `academic_researcher_academic_paper_view` connects researchers to the papers they author. This view captures the written contributions that form the core of academic exchange.

### Lecture and Paper Perspectives

The `academic_lecture_academic_conference_view` shows which conference each lecture belongs to. Lectures are tied to specific events, and this view enables tracking of the presentation schedule.

The `academic_lecture_academic_researcher_view` links lectures to their presenting researchers. This relationship identifies who delivered each presentation.

The `academic_lecture_academic_institution_view` connects lectures to the institutions of the presenting researchers. This view provides the institutional context for each presentation.

The `academic_paper_academic_conference_view` shows which conference each paper was presented at. Papers are tied to specific events, and this view enables tracking of the publication record.

The `academic_paper_academic_researcher_detail_view` links papers to their authoring researchers with full detail. This view is essential for understanding authorship patterns and collaboration networks.

The `academic_paper_programme_committee_view` connects papers to the programme committees that reviewed them. This relationship completes the peer-review chain, showing which committee was responsible for evaluating each paper.

### Synthesis

The academic conference ecosystem is a tightly interwoven network of institutions, societies, committees, researchers, and scholarly outputs. Conferences serve as the central organizing events, each anchored by an institution and guided by three layers of committee governance: steering, programme, and local organization. Learned societies provide broader scholarly endorsement, while departments supply the administrative infrastructure. Researchers participate in multiple capacities—as committee members, paper authors, and lecture presenters—creating a rich matrix of professional relationships. The views described above enable practitioners to navigate this complexity from any angle: by conference, by institution, by committee, or by researcher. Together, these records form a comprehensive picture of how academic communities coordinate their intellectual work.

## Data appendix

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
