## Domain Modeling and Relational Materialization

The academic conference ecosystem is a multi-layered domain where scholarly events, institutional affiliations, governance structures, and research outputs intersect. At its core, the model captures four principal entity types—conferences, institutions, steering committees, and researchers—alongside two supporting entities, sessions and presentations, that bridge the organizational and scholarly layers. The relational schema normalizes these entities into nine base tables, connected by foreign keys and junction tables that enforce cardinality-bounded relationships. Views then materialize the most common analytical joins, each reconstructing a coherent domain fact from the normalized grain.

### Conference and Institutional Anchors

The `academic_conferences` table serves as the primary temporal and geographic anchor for the domain. Each row represents a distinct scholarly event identified by a surrogate `id` (e.g., `1000`), a human-readable `identifier` such as `IDE-2086`, and a `title` like *Compact Initiative*. Temporal scope is captured through `start_date` and `end_date` columns, while `location_city` and `location_country` record the venue geography. A `status` column constrains the lifecycle state to one of four values—`planned`, `ongoing`, `completed`, or `cancelled`—as seen in the row for *Seasonal Review* (`IDE-2101`), which carries the `cancelled` status. Two foreign keys, `academic_institution_id` and `steering_committee_id`, bind each conference to its hosting institution and its governing committee respectively.

**Table `academic_conferences`**

| id | identifier | title | start_date | end_date | location_city | location_country | status | academic_institution_id | steering_committee_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | seasonal-location-23 | adaptive-location-47 | planned | 100 | 1 |
| 1001 | IDE-2091 | Legacy Model | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | regional-location-24 | distributed-location-48 | ongoing | 101 | 2 |
| 1002 | IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | legacy-location-25 | baseline-location-49 | completed | 102 | 3 |
| 1003 | IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | compact-location-26 | pilot-location-50 | cancelled | 103 | 4 |

The `academic_institutions` table models the hosting organizations. Each row carries an `id` (e.g., `100`), an `institution_name` such as *Extended Corridor*, a `department_name` like *Baseline Framework D*, and location metadata including `city`, `postal_code`, and `country`. Contact information is stored in `telephone` and `website_url`, with the latter containing URLs such as `https://github.com/chiphuyen/lazynlp`. The table also holds foreign keys `academic_conference_id` and `academic_researcher_id`, which link the institution to a specific conference and to a primary researcher, respectively.

**Table `academic_institutions`**

| id | institution_name | department_name | city | postal_code | country | telephone | website_url | academic_conference_id | academic_researcher_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Extended Corridor | Baseline Framework D | integrated-city-34 | 9125611 | compact-country-26 | adaptive-telephon-23 | https://github.com/chiphuyen/lazynlp | 1000 | 100 |
| 101 | Pilot Series A | Distributed Protocol | seasonal-city-35 | ChIJt4hBkzhu5kcRJJDUNqGUpso | composite-country-27 | distributed-telephon-24 | https://bugs.launchpad.net/ironic/+bug/1346406 | 1001 | 101 |
| 102 | Baseline Assessment | Adaptive Programme | regional-city-36 | 3001009030200 | primary-country-28 | baseline-telephon-25 | http://en.wikipedia.org/wiki/Hyla_femoralis | 1002 | 102 |
| 103 | Distributed Survey | Primary Standard A | legacy-city-37 | 4060635 | adaptive-country-29 | pilot-telephon-26 | https://www.nature.com/articles/nphoton.2014.41 | 1003 | 103 |

### Governance: Steering Committees

Governance is captured in the `steering_committees` table, where each row identifies a committee by `steering_committee_id` (e.g., `1`), a `committee_name` such as *Composite Cluster*, a `role` (e.g., `Chair`), and a `responsibility_level` constrained to `apex`, `executive`, or `operational`. The foreign key `academic_conference_id` binds each committee to its parent conference. The data shows a clear pattern: committee `1` (*Composite Cluster*, role `Chair`, level `apex`) governs conference `1000`, while committee `2` (*Compact Review A*, role `Secretary`, level `executive`) governs conference `1001`.

**Table `steering_committees`**

| steering_committee_id | committee_name | role | responsibility_level | academic_conference_id |
|---|---|---|---|---|
| 1 | Composite Cluster | Chair | apex | 1000 |
| 2 | Compact Review A | Secretary | executive | 1001 |
| 3 | Legacy Initiative | Member | operational | 1002 |
| 4 | Regional Model | Chair | apex | 1003 |

### Researchers and Their Affiliations

The `academic_researchers` table models individual scholars. Each row carries an `id` (e.g., `100`), a `full_name` such as *Theodore Mcgrath*, an `affiliation`, and an `email_address`. The `role_at_event` column constrains the researcher's participation type to one of `PlenarySpeaker`, `InvitedSpeaker`, `CommitteeMember`, or `Attendee`. A boolean `is_fellow` flag distinguishes fellows from non-fellows. Three foreign keys—`academic_session_id`, `academic_institution_id`, and `steering_committee_id`—bind each researcher to a session, an institution, and a committee, creating a rich web of affiliations.

**Table `academic_researchers`**

| id | full_name | affiliation | email_address | role_at_event | is_fellow | academic_session_id | academic_institution_id | steering_committee_id |
|---|---|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | baseline-affiliat-55 | primary-email-70 | PlenarySpeaker | false | 1 | 100 | 1 |
| 101 | Account Name | pilot-affiliat-56 | adaptive-email-71 | InvitedSpeaker | true | 2 | 101 | 2 |
| 102 | Saipan International Airport | extended-affiliat-57 | distributed-email-72 | CommitteeMember | false | 3 | 102 | 3 |
| 103 | Norma Fisher | integrated-affiliat-58 | baseline-email-73 | Attendee | true | 4 | 103 | 4 |

### Sessions and Presentations

Academic sessions are the temporal sub-units of conferences. The `academic_sessions` table stores each session's `id` (e.g., `1`), `session_title` (*Seasonal Review*), `session_type` (constrained to `Plenary`, `Invited`, `Contributed`, or `Panel`), `scheduled_date`, `venue_room`, and `status` (`scheduled`, `completed`, or `cancelled`). The foreign key `academic_conference_id` links each session to its parent conference, while `created_at` and `updated_at` provide audit timestamps.

**Table `academic_sessions`**

| id | session_title | session_type | scheduled_date | venue_room | status | academic_conference_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1 | Seasonal Review | Plenary | 2024-11-27T22:18:00 | seasonal-venue-23 | scheduled | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Integrated Initiative | Invited | 2025-04-11T05:35:00 | regional-venue-24 | completed | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Extended Model D | Contributed | 2022-09-22T12:52:00 | legacy-venue-25 | cancelled | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Pilot Cluster | Panel | 2023-02-06T19:09:00 | compact-venue-26 | scheduled | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Research presentations are the scholarly outputs within sessions. The `research_presentations` table captures each presentation's `id`, `presentation_title` (e.g., *Baseline Model D*), `submission_status` (`submitted`, `accepted`, `rejected`, or `withdrawn`), `presentation_type` (e.g., `PlenaryLecture`, `InvitedTalk`, `ContributedPaper`), and `abstract_text`. Foreign keys `academic_researcher_id` and `academic_session_id` bind each presentation to its author and its host session.

**Table `research_presentations`**

| id | presentation_title | submission_status | presentation_type | abstract_text | academic_researcher_id | academic_session_id |
|---|---|---|---|---|---|---|
| 1 | Baseline Model D | submitted | PlenaryLecture | integrated-abstract-70 | 100 | 1 |
| 2 | Distributed Cluster | accepted | InvitedTalk | seasonal-abstract-71 | 101 | 2 |
| 3 | Adaptive Review | rejected | ContributedPaper | regional-abstract-72 | 102 | 3 |
| 4 | Primary Initiative A | withdrawn | PlenaryLecture | legacy-abstract-73 | 103 | 4 |

### Junction Tables for Many-to-Many Relationships

The schema employs three junction tables to resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `conferences_sessions` table links conferences to their constituent sessions, enabling a single conference to host multiple sessions and a session to be associated with multiple conferences in cross-conference scenarios.

**Table `conferences_sessions`**

| academic_conference_id | academic_session_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `committees_researchers` table resolves the many-to-many relationship between steering committees and researchers, allowing a researcher to serve on multiple committees and a committee to comprise multiple members.

**Table `committees_researchers`**

| steering_committee_id | academic_researcher_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `sessions_researchers` table links sessions to researchers, capturing the assignment of speakers, panelists, and attendees to specific sessions.

**Table `sessions_researchers`**

| academic_session_id | academic_researcher_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

### Analytical Views: Reconstructing Domain Facts

Each view materializes a specific analytical perspective by joining the normalized tables. The following sections interpret what question each view answers and illustrate with concrete rows.

#### Conference–Institution and Conference–Committee Perspectives

The view `v_academic_conference_academic_institution` joins `academic_conferences` with `academic_institutions` to answer which institution hosts which conference. A row from this view reveals that conference `1000` (*Compact Initiative*, `planned`) is hosted by institution `100` (*Extended Corridor*, located in `integrated-city-34`).

**View `v_academic_conference_academic_institution`**

```sql
CREATE VIEW v_academic_conference_academic_institution AS
SELECT a.id, a.identifier, a.title, a.start_date, b.id AS institution_id, b.institution_name AS institution_institution_name, b.department_name AS institution_department_name
FROM academic_conferences a JOIN academic_institutions b ON a.academic_institution_id = b.id;
```

| id | identifier | title | start_date | institution_id | institution_institution_name | institution_department_name |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 | 100 | Extended Corridor | Baseline Framework D |
| 1001 | IDE-2091 | Legacy Model | 2023-02-16T03:41:00 | 101 | Pilot Series A | Distributed Protocol |
| 1002 | IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 | 102 | Baseline Assessment | Adaptive Programme |
| 1003 | IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 | 103 | Distributed Survey | Primary Standard A |

The view `v_academic_conference_steering_committee` joins conferences with their steering committees, answering which committee governs which event. For conference `1000` (*Compact Initiative*), the view shows steering committee `1` (*Composite Cluster*, role `Chair`, level `apex`).

**View `v_academic_conference_steering_committee`**

```sql
CREATE VIEW v_academic_conference_steering_committee AS
SELECT a.id, a.identifier, a.title, a.start_date, b.steering_committee_id AS committee_steering_committee_id, b.committee_name AS committee_committee_name, b.role AS committee_role
FROM academic_conferences a JOIN steering_committees b ON a.steering_committee_id = b.steering_committee_id;
```

| id | identifier | title | start_date | committee_steering_committee_id | committee_committee_name | committee_role |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Compact Initiative | 2022-09-05T20:24:00 | 1 | Composite Cluster | Chair |
| 1001 | IDE-2091 | Legacy Model | 2023-02-16T03:41:00 | 2 | Compact Review A | Secretary |
| 1002 | IDE-2096 | Regional Cluster A | 2024-07-27T10:58:00 | 3 | Legacy Initiative | Member |
| 1003 | IDE-2101 | Seasonal Review | 2025-12-11T17:15:00 | 4 | Regional Model | Chair |

The view `v_academic_conference_academic_session_detail` joins conferences with their sessions, answering which sessions belong to which conference. Conference `1000` (*Compact Initiative*) hosts session `1` (*Seasonal Review*, type `Plenary`, scheduled for `2024-11-27T22:18:00` in `seasonal-venue-23`).

**View `v_academic_conference_academic_session_detail`**

```sql
CREATE VIEW v_academic_conference_academic_session_detail AS
SELECT a.id, a.identifier, a.title, b.id AS session_id, b.session_title AS session_session_title, b.session_type AS session_session_type
FROM academic_conferences a
  JOIN conferences_sessions j ON j.academic_conference_id = a.id
  JOIN academic_sessions b ON b.id = j.academic_session_id;
```

| id | identifier | title | session_id | session_session_title | session_session_type |
|---|---|---|---|---|---|
| 1000 | IDE-2086 | Compact Initiative | 1 | Seasonal Review | Plenary |
| 1000 | IDE-2086 | Compact Initiative | 2 | Integrated Initiative | Invited |
| 1001 | IDE-2091 | Legacy Model | 2 | Integrated Initiative | Invited |
| 1001 | IDE-2091 | Legacy Model | 3 | Extended Model D | Contributed |
| 1002 | IDE-2096 | Regional Cluster A | 3 | Extended Model D | Contributed |
| 1002 | IDE-2096 | Regional Cluster A | 4 | Pilot Cluster | Panel |
| 1003 | IDE-2101 | Seasonal Review | 4 | Pilot Cluster | Panel |
| 1003 | IDE-2101 | Seasonal Review | 1 | Seasonal Review | Plenary |

#### Institution-Centric Views

The view `v_academic_institution_academic_conference` inverts the perspective, answering which conferences are associated with a given institution. Institution `100` (*Extended Corridor*) is linked to conference `1000` (*Compact Initiative*).

**View `v_academic_institution_academic_conference`**

```sql
CREATE VIEW v_academic_institution_academic_conference AS
SELECT a.id, a.institution_name, a.department_name, a.city, b.id AS conference_id, b.identifier AS conference_identifier, b.title AS conference_title
FROM academic_institutions a JOIN academic_conferences b ON a.academic_conference_id = b.id;
```

| id | institution_name | department_name | city | conference_id | conference_identifier | conference_title |
|---|---|---|---|---|---|---|
| 100 | Extended Corridor | Baseline Framework D | integrated-city-34 | 1000 | IDE-2086 | Compact Initiative |
| 101 | Pilot Series A | Distributed Protocol | seasonal-city-35 | 1001 | IDE-2091 | Legacy Model |
| 102 | Baseline Assessment | Adaptive Programme | regional-city-36 | 1002 | IDE-2096 | Regional Cluster A |
| 103 | Distributed Survey | Primary Standard A | legacy-city-37 | 1003 | IDE-2101 | Seasonal Review |

The view `v_academic_institution_academic_researcher` joins institutions with their affiliated researchers, answering which researcher is associated with which institution. Institution `100` (*Extended Corridor*) is linked to researcher `100` (*Theodore Mcgrath*, role `PlenarySpeaker`, fellow status `false`).

**View `v_academic_institution_academic_researcher`**

```sql
CREATE VIEW v_academic_institution_academic_researcher AS
SELECT a.id, a.institution_name, a.department_name, a.city, b.id AS researcher_id, b.full_name AS researcher_full_name, b.affiliation AS researcher_affiliation
FROM academic_institutions a JOIN academic_researchers b ON a.academic_researcher_id = b.id;
```

| id | institution_name | department_name | city | researcher_id | researcher_full_name | researcher_affiliation |
|---|---|---|---|---|---|---|
| 100 | Extended Corridor | Baseline Framework D | integrated-city-34 | 100 | Theodore Mcgrath | baseline-affiliat-55 |
| 101 | Pilot Series A | Distributed Protocol | seasonal-city-35 | 101 | Account Name | pilot-affiliat-56 |
| 102 | Baseline Assessment | Adaptive Programme | regional-city-36 | 102 | Saipan International Airport | extended-affiliat-57 |
| 103 | Distributed Survey | Primary Standard A | legacy-city-37 | 103 | Norma Fisher | integrated-affiliat-58 |

#### Steering Committee Perspectives

The view `v_steering_committee_academic_conference` answers which conferences are governed by a given steering committee. Committee `1` (*Composite Cluster*, role `Chair`) governs conference `1000` (*Compact Initiative*).

**View `v_steering_committee_academic_conference`**

```sql
CREATE VIEW v_steering_committee_academic_conference AS
SELECT a.steering_committee_id, a.committee_name, a.role, a.responsibility_level, b.id AS conference_id, b.identifier AS conference_identifier, b.title AS conference_title
FROM steering_committees a JOIN academic_conferences b ON a.academic_conference_id = b.id;
```

| steering_committee_id | committee_name | role | responsibility_level | conference_id | conference_identifier | conference_title |
|---|---|---|---|---|---|---|
| 1 | Composite Cluster | Chair | apex | 1000 | IDE-2086 | Compact Initiative |
| 2 | Compact Review A | Secretary | executive | 1001 | IDE-2091 | Legacy Model |
| 3 | Legacy Initiative | Member | operational | 1002 | IDE-2096 | Regional Cluster A |
| 4 | Regional Model | Chair | apex | 1003 | IDE-2101 | Seasonal Review |

The view `v_steering_committee_academic_researcher_detail` joins committees with their member researchers, answering which researchers serve on which committee. Committee `1` (*Composite Cluster*) includes researcher `100` (*Theodore Mcgrath*, role `PlenarySpeaker`).

**View `v_steering_committee_academic_researcher_detail`**

```sql
CREATE VIEW v_steering_committee_academic_researcher_detail AS
SELECT a.steering_committee_id, a.committee_name, a.role, b.id AS researcher_id, b.full_name AS researcher_full_name, b.affiliation AS researcher_affiliation
FROM steering_committees a
  JOIN committees_researchers j ON j.steering_committee_id = a.steering_committee_id
  JOIN academic_researchers b ON b.id = j.academic_researcher_id;
```

| steering_committee_id | committee_name | role | researcher_id | researcher_full_name | researcher_affiliation |
|---|---|---|---|---|---|
| 1 | Composite Cluster | Chair | 100 | Theodore Mcgrath | baseline-affiliat-55 |
| 1 | Composite Cluster | Chair | 101 | Account Name | pilot-affiliat-56 |
| 2 | Compact Review A | Secretary | 101 | Account Name | pilot-affiliat-56 |
| 2 | Compact Review A | Secretary | 102 | Saipan International Airport | extended-affiliat-57 |
| 3 | Legacy Initiative | Member | 102 | Saipan International Airport | extended-affiliat-57 |
| 3 | Legacy Initiative | Member | 103 | Norma Fisher | integrated-affiliat-58 |
| 4 | Regional Model | Chair | 103 | Norma Fisher | integrated-affiliat-58 |
| 4 | Regional Model | Chair | 100 | Theodore Mcgrath | baseline-affiliat-55 |

#### Researcher-Centric Views

The view `v_academic_researcher_academic_session` joins researchers with their assigned sessions, answering which sessions a researcher participates in. Researcher `100` (*Theodore Mcgrath*) is assigned to session `1` (*Seasonal Review*, type `Plenary`).

**View `v_academic_researcher_academic_session`**

```sql
CREATE VIEW v_academic_researcher_academic_session AS
SELECT a.id, a.full_name, a.affiliation, a.email_address, b.id AS session_id, b.session_title AS session_session_title, b.session_type AS session_session_type
FROM academic_researchers a JOIN academic_sessions b ON a.academic_session_id = b.id;
```

| id | full_name | affiliation | email_address | session_id | session_session_title | session_session_type |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | baseline-affiliat-55 | primary-email-70 | 1 | Seasonal Review | Plenary |
| 101 | Account Name | pilot-affiliat-56 | adaptive-email-71 | 2 | Integrated Initiative | Invited |
| 102 | Saipan International Airport | extended-affiliat-57 | distributed-email-72 | 3 | Extended Model D | Contributed |
| 103 | Norma Fisher | integrated-affiliat-58 | baseline-email-73 | 4 | Pilot Cluster | Panel |

The view `v_academic_researcher_academic_institution` joins researchers with their affiliated institutions, answering which institution a researcher belongs to. Researcher `100` (*Theodore Mcgrath*) is affiliated with institution `100` (*Extended Corridor*).

**View `v_academic_researcher_academic_institution`**

```sql
CREATE VIEW v_academic_researcher_academic_institution AS
SELECT a.id, a.full_name, a.affiliation, a.email_address, b.id AS institution_id, b.institution_name AS institution_institution_name, b.department_name AS institution_department_name
FROM academic_researchers a JOIN academic_institutions b ON a.academic_institution_id = b.id;
```

| id | full_name | affiliation | email_address | institution_id | institution_institution_name | institution_department_name |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | baseline-affiliat-55 | primary-email-70 | 100 | Extended Corridor | Baseline Framework D |
| 101 | Account Name | pilot-affiliat-56 | adaptive-email-71 | 101 | Pilot Series A | Distributed Protocol |
| 102 | Saipan International Airport | extended-affiliat-57 | distributed-email-72 | 102 | Baseline Assessment | Adaptive Programme |
| 103 | Norma Fisher | integrated-affiliat-58 | baseline-email-73 | 103 | Distributed Survey | Primary Standard A |

The view `v_academic_researcher_steering_committee` joins researchers with the committees they serve on, answering which committee a researcher belongs to. Researcher `100` (*Theodore Mcgrath*) serves on committee `1` (*Composite Cluster*).

**View `v_academic_researcher_steering_committee`**

```sql
CREATE VIEW v_academic_researcher_steering_committee AS
SELECT a.id, a.full_name, a.affiliation, a.email_address, b.steering_committee_id AS committee_steering_committee_id, b.committee_name AS committee_committee_name, b.role AS committee_role
FROM academic_researchers a JOIN steering_committees b ON a.steering_committee_id = b.steering_committee_id;
```

| id | full_name | affiliation | email_address | committee_steering_committee_id | committee_committee_name | committee_role |
|---|---|---|---|---|---|---|
| 100 | Theodore Mcgrath | baseline-affiliat-55 | primary-email-70 | 1 | Composite Cluster | Chair |
| 101 | Account Name | pilot-affiliat-56 | adaptive-email-71 | 2 | Compact Review A | Secretary |
| 102 | Saipan International Airport | extended-affiliat-57 | distributed-email-72 | 3 | Legacy Initiative | Member |
| 103 | Norma Fisher | integrated-affiliat-58 | baseline-email-73 | 4 | Regional Model | Chair |

#### Session-Centric Views

The view `v_academic_session_academic_conference` joins sessions with their parent conferences, answering which conference a session belongs to. Session `1` (*Seasonal Review*, type `Plenary`) belongs to conference `1000` (*Compact Initiative*).

**View `v_academic_session_academic_conference`**

```sql
CREATE VIEW v_academic_session_academic_conference AS
SELECT a.id, a.session_title, a.session_type, a.scheduled_date, b.id AS conference_id, b.identifier AS conference_identifier, b.title AS conference_title
FROM academic_sessions a JOIN academic_conferences b ON a.academic_conference_id = b.id;
```

| id | session_title | session_type | scheduled_date | conference_id | conference_identifier | conference_title |
|---|---|---|---|---|---|---|
| 1 | Seasonal Review | Plenary | 2024-11-27T22:18:00 | 1000 | IDE-2086 | Compact Initiative |
| 2 | Integrated Initiative | Invited | 2025-04-11T05:35:00 | 1001 | IDE-2091 | Legacy Model |
| 3 | Extended Model D | Contributed | 2022-09-22T12:52:00 | 1002 | IDE-2096 | Regional Cluster A |
| 4 | Pilot Cluster | Panel | 2023-02-06T19:09:00 | 1003 | IDE-2101 | Seasonal Review |

The view `v_academic_session_academic_researcher_detail` joins sessions with their participating researchers, answering which researchers are assigned to a session. Session `1` (*Seasonal Review*) includes researcher `100` (*Theodore Mcgrath*).

**View `v_academic_session_academic_researcher_detail`**

```sql
CREATE VIEW v_academic_session_academic_researcher_detail AS
SELECT a.id, a.session_title, a.session_type, b.id AS researcher_id, b.full_name AS researcher_full_name, b.affiliation AS researcher_affiliation
FROM academic_sessions a
  JOIN sessions_researchers j ON j.academic_session_id = a.id
  JOIN academic_researchers b ON b.id = j.academic_researcher_id;
```

| id | session_title | session_type | researcher_id | researcher_full_name | researcher_affiliation |
|---|---|---|---|---|---|
| 1 | Seasonal Review | Plenary | 100 | Theodore Mcgrath | baseline-affiliat-55 |
| 1 | Seasonal Review | Plenary | 101 | Account Name | pilot-affiliat-56 |
| 2 | Integrated Initiative | Invited | 101 | Account Name | pilot-affiliat-56 |
| 2 | Integrated Initiative | Invited | 102 | Saipan International Airport | extended-affiliat-57 |
| 3 | Extended Model D | Contributed | 102 | Saipan International Airport | extended-affiliat-57 |
| 3 | Extended Model D | Contributed | 103 | Norma Fisher | integrated-affiliat-58 |
| 4 | Pilot Cluster | Panel | 103 | Norma Fisher | integrated-affiliat-58 |
| 4 | Pilot Cluster | Panel | 100 | Theodore Mcgrath | baseline-affiliat-55 |

#### Presentation-Centric Views

The view `v_research_presentation_academic_researcher` joins presentations with their authors, answering which researcher authored which presentation. Presentation `1` (*Baseline Model D*, status `submitted`, type `PlenaryLecture`) is authored by researcher `100` (*Theodore Mcgrath*).

**View `v_research_presentation_academic_researcher`**

```sql
CREATE VIEW v_research_presentation_academic_researcher AS
SELECT a.id, a.presentation_title, a.submission_status, a.presentation_type, b.id AS researcher_id, b.full_name AS researcher_full_name, b.affiliation AS researcher_affiliation
FROM research_presentations a JOIN academic_researchers b ON a.academic_researcher_id = b.id;
```

| id | presentation_title | submission_status | presentation_type | researcher_id | researcher_full_name | researcher_affiliation |
|---|---|---|---|---|---|---|
| 1 | Baseline Model D | submitted | PlenaryLecture | 100 | Theodore Mcgrath | baseline-affiliat-55 |
| 2 | Distributed Cluster | accepted | InvitedTalk | 101 | Account Name | pilot-affiliat-56 |
| 3 | Adaptive Review | rejected | ContributedPaper | 102 | Saipan International Airport | extended-affiliat-57 |
| 4 | Primary Initiative A | withdrawn | PlenaryLecture | 103 | Norma Fisher | integrated-affiliat-58 |

The view `v_research_presentation_academic_session` joins presentations with their host sessions, answering which session a presentation belongs to. Presentation `1` (*Baseline Model D*) is presented in session `1` (*Seasonal Review*).

**View `v_research_presentation_academic_session`**

```sql
CREATE VIEW v_research_presentation_academic_session AS
SELECT a.id, a.presentation_title, a.submission_status, a.presentation_type, b.id AS session_id, b.session_title AS session_session_title, b.session_type AS session_session_type
FROM research_presentations a JOIN academic_sessions b ON a.academic_session_id = b.id;
```

| id | presentation_title | submission_status | presentation_type | session_id | session_session_title | session_session_type |
|---|---|---|---|---|---|---|
| 1 | Baseline Model D | submitted | PlenaryLecture | 1 | Seasonal Review | Plenary |
| 2 | Distributed Cluster | accepted | InvitedTalk | 2 | Integrated Initiative | Invited |
| 3 | Adaptive Review | rejected | ContributedPaper | 3 | Extended Model D | Contributed |
| 4 | Primary Initiative A | withdrawn | PlenaryLecture | 4 | Pilot Cluster | Panel |

### Synthesis

The schema models the academic conference domain as a network of interlocking entities, each normalized to its own table with surrogate keys and foreign keys that encode cardinality-bounded relationships. Conferences anchor the model temporally and geographically; institutions provide organizational context; steering committees encode governance; researchers represent the scholarly actors; sessions structure the event program; and presentations capture the research outputs. Three junction tables—`conferences_sessions`, `committees_researchers`, and `sessions_researchers`—resolve the many-to-many relationships that the base foreign keys cannot express. The fourteen views materialize the most common analytical joins, each reconstructing a coherent domain fact from the normalized grain. Together, the tables and views provide a complete, queryable representation of the academic conference ecosystem, from the highest-level conference lifecycle down to the individual presentation abstract.