The academic colloquium system captures the full lifecycle of scholarly presentations, from institutional sponsorship through abstract submission to the physical logistics of venue assignment. Each colloquium represents a discrete event anchored by a speaker, a location, and a series affiliation, while the surrounding tables record the organizational context—departments, institutions, degrees, and the cross-references that bind them. The records below illustrate how a single colloquium, identified as IDE-2086 and titled "Compact Initiative," connects a speaker, a room, an abstract, and a recurring series into a coherent operational picture.

## Colloquiums

The colloquiums table is the central event ledger. Each row records a scheduled presentation with a unique identifier, a title, a scheduled date, start and end times, a status, and flags for registration requirements. The foreign keys `speaker_id`, `venue_room_number`, `series_id`, and `abstract_id` point to the supporting entities that give the event its substance.

**Table `colloquiums`**

| id | identifier | title | scheduled_date | start_time | end_time | status | registration_required | speaker_id | venue_room_number | series_id | abstract_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Compact Initiative | 2024-11-27T22:18:00 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | scheduled | false | 1 | ROO-2106 | 1 | 1 |
| 2 | IDE-2091 | Legacy Model | 2025-04-11T05:35:00 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | completed | true | 2 | ROO-2113 | 2 | 2 |
| 3 | IDE-2096 | Regional Cluster A | 2022-09-22T12:52:00 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | cancelled | false | 3 | ROO-2120 | 3 | 3 |
| 4 | IDE-2101 | Seasonal Review | 2023-02-06T19:09:00 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | scheduled | true | 4 | ROO-2127 | 4 | 4 |

Consider the first row: colloquium IDE-2086, "Compact Initiative," is scheduled for 2024-11-27 at 22:18, with a start time of 2024-03-27T14:42 and an end time of 2023-02-26T13:27. Its status is `scheduled`, registration is not required, and it is linked to speaker 1, venue room ROO-2106, series 1, and abstract 1. The second row, IDE-2091 "Legacy Model," has a `completed` status and requires registration, illustrating how the system tracks both upcoming and past events. The third row, IDE-2096 "Regional Cluster A," carries a `cancelled` status, showing that the system retains historical records of events that did not occur.

## Speakers

The speakers table stores the biographical and professional details of presenters. Each speaker has an identifier, a full name, their highest degree, the institution that granted that degree, their department, an affiliation code, and a colloquium_id linking them to their presentation.

**Table `speakers`**

| speaker_id | identifier | full_name | highest_degree | degree_granting_institution | department | affiliation | colloquium_id | institution_id |
|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Theodore Mcgrath | legacy-highest-85 | composite-degree-15 | adaptive-departme-89 | baseline-affiliat-55 | 1 | 1 |
| 2 | IDE-2091 | Account Name | compact-highest-86 | primary-degree-16 | distributed-departme-90 | pilot-affiliat-56 | 2 | 2 |
| 3 | IDE-2096 | Saipan International Airport | composite-highest-87 | adaptive-degree-17 | baseline-departme-91 | extended-affiliat-57 | 3 | 3 |
| 4 | IDE-2101 | Norma Fisher | primary-highest-88 | distributed-degree-18 | pilot-departme-92 | integrated-affiliat-58 | 4 | 4 |

Speaker 1, Theodore Mcgrath, holds a degree coded as `legacy-highest-85` from an institution identified as `composite-degree-15`, works within `adaptive-departme-89`, and carries the affiliation `baseline-affiliat-55`. Speaker 4, Norma Fisher, holds `primary-highest-88` from `distributed-degree-18`, is associated with `pilot-departme-92`, and uses `integrated-affiliat-58` as her affiliation code. The colloquium_id field ties each speaker directly to the event they present at, creating a one-to-one linkage in this dataset.

## Venues

Venues capture the physical or virtual location where each colloquium takes place. The table records a building name, room number, floor, seating capacity, location type, and a colloquium_id for the event hosted there.

**Table `venues`**

| identifier | building_name | room_number | floor | capacity | location_type | colloquium_id |
|---|---|---|---|---|---|---|
| IDE-2086 | Compact Initiative | ROO-2106 | 11 | 32 | lecture_hall | 1 |
| IDE-2091 | Legacy Model | ROO-2113 | 19 | 41 | conference_room | 2 |
| IDE-2096 | Regional Cluster A | ROO-2120 | 27 | 50 | auditorium | 3 |
| IDE-2101 | Seasonal Review | ROO-2127 | 35 | 59 | lecture_hall | 4 |

The venue for colloquium 1 is Compact Initiative, room ROO-2106, on floor 11, with a capacity of 32 seats, classified as a `lecture_hall`. The venue for colloquium 3, Regional Cluster A, is room ROO-2120 on floor 27, an `auditorium` with a capacity of 50. Colloquium 2's venue, room ROO-2113, is a `conference_room` on floor 19 with 41 seats. The location_type field distinguishes between lecture halls, conference rooms, and auditoria, which is useful for capacity planning and equipment requirements.

## Serieses

The serieses table defines recurring academic programs under which colloquiums are organized. Each series has an identifier, a name, an academic term, an organizing department, a frequency, and a department_id.

**Table `serieses`**

| series_id | identifier | name | academic_term | organizing_department | frequency | department_id |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | compact-academic-44 | pilot-organizi-80 | weekly | 1000 |
| 2 | IDE-2091 | Pilot Initiative A | composite-academic-45 | extended-organizi-81 | biweekly | 1001 |
| 3 | IDE-2096 | Baseline Model | primary-academic-46 | integrated-organizi-82 | monthly | 1002 |
| 4 | IDE-2101 | Distributed Cluster | adaptive-academic-47 | seasonal-organizi-83 | irregular | 1003 |

Series 1, named "Extended Review," operates under the academic term `compact-academic-44`, is organized by `pilot-organizi-80`, and occurs on a `weekly` frequency. Series 2, "Pilot Initiative A," runs under `composite-academic-45`, is organized by `extended-organizi-81`, and follows a `biweekly` schedule. Series 4, "Distributed Cluster," uses `adaptive-academic-47` as its academic term, is organized by `seasonal-organizi-83`, and has an `irregular` frequency. The department_id field links each series to its sponsoring department.

## Abstracts

Abstracts store the scholarly summaries associated with each colloquium. Fields include an identifier, a URL, word count, language, last-modified timestamp, access level, and foreign keys to the colloquium and speaker.

**Table `abstracts`**

| abstract_id | identifier | url | word_count | language | last_modified | access_level | colloquium_id | speaker_id |
|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | https://www.nature.com/articles/nphoton.2017.123 | 25 | composite-language-45 | 2022-05-05T04:36:00 | public | 1 | 1 |
| 2 | IDE-2091 | http://www.mdpi.com/2073-445X/8/3/43/pdf | 425 | primary-language-46 | 2023-10-16T11:53:00 | restricted | 2 | 2 |
| 3 | IDE-2096 | https://www.deshaw.com/recruit/UnivListing.html | 15 | adaptive-language-47 | 2024-03-27T18:10:00 | private | 3 | 3 |
| 4 | IDE-2101 | https://www.nature.com/articles/nphoton.2015.276 | 40 | distributed-language-48 | 2025-08-11T01:27:00 | public | 4 | 4 |

Abstract 1, linked to colloquium 1 and speaker 1, has a URL at nature.com, contains 25 words, uses `composite-language-45`, was last modified on 2022-05-05, and has a `public` access level. Abstract 2, for colloquium 2 and speaker 2, is 425 words long, uses `primary-language-46`, was last modified on 2023-10-16, and is marked `restricted`. Abstract 3 is only 15 words, uses `adaptive-language-47`, and is set to `private` access. The access_level field controls who can view the abstract, ranging from public to private.

## Departments

Departments represent the academic units that sponsor and organize colloquiums and series. Each department has an identifier, name, code, parent institution, established date, and links to a series and an institution.

**Table `departments`**

| department_id | identifier | name | code | parent_institution | established_date | series_id | institution_id |
|---|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Extended Review | lu_tax_code_template_m_I_4 | seasonal-parent-53 | 2024-03-27 | 1 | 1 |
| 1001 | IDE-2091 | Pilot Initiative A | 2986219 | regional-parent-54 | 2025-08-11 | 2 | 2 |
| 1002 | IDE-2096 | Baseline Model | 8928520 | legacy-parent-55 | 2022-01-22 | 3 | 3 |
| 1003 | IDE-2101 | Distributed Cluster | 195369 | compact-parent-56 | 2023-06-06 | 4 | 4 |

Department 1000, named "Extended Review," carries the code `lu_tax_code_template_m_I_4`, has `seasonal-parent-53` as its parent institution, was established on 2024-03-27, and is linked to series 1 and institution 1. Department 1001, "Pilot Initiative A," has code `2986219`, parent `regional-parent-54`, was established on 2025-08-11, and connects to series 2 and institution 2. The code field appears to store institutional or tax classification codes, while the parent_institution field provides an additional organizational hierarchy.

## Institutions

Institutions are the overarching organizations that contain departments and grant degrees. They provide the institutional context for all academic activity recorded in the system.

**Table `institutions`**

| institution_id | identifier | name | type | location | founded_date | degree_id |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | university | extended-location-99 | 2024-03-15 | 1 |
| 2 | IDE-2091 | Pilot Initiative A | college | integrated-location-100 | 2025-08-26 | 2 |
| 3 | IDE-2096 | Baseline Model | institute | seasonal-location-101 | 2022-01-10 | 3 |
| 4 | IDE-2101 | Distributed Cluster | university | regional-location-102 | 2023-06-21 | 4 |

Institution 1 is the parent of department 1000 and grants degrees used by speaker 1. Institution 2 sponsors department 1001 and is associated with speaker 2. Institution 3 contains department 1002 and relates to speaker 3. Institution 4 is the parent of department 1003 and connects to speaker 4. The institution table anchors the organizational hierarchy, with departments nested within institutions and degrees issued by them.

## Degrees

Degrees record the academic qualifications held by speakers, including the degree type, the granting institution, and the field of study.

**Table `degrees`**

| degree_id | identifier | name | level | field | issuing_institution | institution_id | speaker_id |
|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | bachelors | primary-field-58 | distributed-issuing-96 | 1 | 1 |
| 2 | IDE-2091 | Pilot Initiative A | masters | adaptive-field-59 | baseline-issuing-97 | 2 | 2 |
| 3 | IDE-2096 | Baseline Model | doctorate | distributed-field-60 | pilot-issuing-98 | 3 | 3 |
| 4 | IDE-2101 | Distributed Cluster | postdoctoral | baseline-field-61 | extended-issuing-99 | 4 | 4 |

Degree records include identifiers, degree types, fields of study, and the institution that granted each degree. The degree_granting_institution field links back to the institutions table, creating a chain from speaker through degree to institution. The field_of_study and award_date fields provide additional context about the academic background of each presenter.

## Series-to-Colloquium Assignments

The serieses_colloquiums table explicitly links series to colloquiums, allowing a colloquium to be associated with one or more series. This many-to-many relationship is captured through foreign keys to both serieses and colloquiums.

**Table `serieses_colloquiums`**

| series_id | colloquium_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Each row in this table records a pairing of a series_id and a colloquium_id, with an optional assignment_date indicating when the association was made. This table enables colloquiums to be classified under multiple series, supporting flexible academic programming where a single event may belong to more than one recurring program.

## Institutional-Department Relationships

The institutions_departments table formalizes the relationship between institutions and their constituent departments. While the departments table already carries a parent_institution reference, this junction table provides an explicit, auditable record of the association.

**Table `institutions_departments`**

| institution_id | department_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

Each row links an institution_id to a department_id, with a start_date marking when the department became part of the institution. This structure supports historical tracking of organizational changes, such as departments moving between institutions or new departments being established within existing institutions.

## View: v_colloquium_speaker

This view joins colloquiums with speakers to answer the question: who is presenting at each colloquium, and what are the details of that presentation? It combines the colloquium's identifier, title, scheduled date, and status with the speaker's full name, highest degree, department, and affiliation.



The first row shows colloquium IDE-2086 "Compact Initiative" presented by Theodore Mcgrath, who holds degree `legacy-highest-85` and is affiliated with `baseline-affiliat-55`. The second row pairs colloquium IDE-2091 "Legacy Model" with Account Name, who holds `compact-highest-86` and uses `pilot-affiliat-56`. This view is essential for program coordinators who need to see the speaker lineup alongside event details.

## View: v_colloquium_venue

This view answers: where is each colloquium being held, and what are the logistical details of that location? It joins colloquiums with venues to produce a combined record of event and location.



The first row shows colloquium IDE-2086 "Compact Initiative" taking place in room ROO-2106, located in the Compact Initiative building on floor 11, with a capacity of 32 and classified as a lecture_hall. The third row shows colloquium IDE-2096 "Regional Cluster A" in room ROO-2120, an auditorium on floor 27 with a capacity of 50. This view supports facility management and attendee navigation.

## View: v_colloquium_series

This view links colloquiums to their parent series, answering: which recurring program does each colloquium belong to? It combines colloquium details with series name, academic term, organizing department, and frequency.



The first row shows colloquium IDE-2086 "Compact Initiative" belonging to the "Extended Review" series, which operates under `compact-academic-44` with a weekly frequency. The fourth row shows colloquium IDE-2101 "Seasonal Review" as part of the "Distributed Cluster" series, which has an irregular frequency. This view helps identify which colloquiums are part of which recurring programs.

## View: v_colloquium_abstract

This view joins colloquiums with their associated abstracts, answering: what scholarly summary accompanies each presentation? It combines event details with the abstract's URL, word count, language, last-modified timestamp, and access level.



The first row pairs colloquium IDE-2086 with abstract 1, which has a URL at nature.com, is 25 words long, uses `composite-language-45`, and is publicly accessible. The second row shows colloquium IDE-2091 with abstract 2, a 425-word document in `primary-language-46` with restricted access. This view is useful for reviewing the scholarly content associated with each event.

## View: v_speaker_colloquium

This view reverses the perspective of v_colloquium_speaker, answering: at which colloquium is each speaker presenting, and what are the event details? It starts from the speaker and joins to the colloquium.



The first row shows speaker Theodore Mcgrath presenting at colloquium IDE-2086 "Compact Initiative," which is scheduled for 2024-11-27 with a status of `scheduled`. The fourth row shows speaker Norma Fisher presenting at colloquium IDE-2101 "Seasonal Review," which has a status of `scheduled`. This view is useful for speakers who need to see their upcoming engagements.

## View: v_speaker_institution

This view connects speakers to their institutional context by joining through degrees and institutions, answering: which institution is associated with each speaker's academic background? It combines speaker details with degree information and the granting institution.



The first row shows Theodore Mcgrath with degree `legacy-highest-85` from institution 1. The fourth row shows Norma Fisher with degree `primary-highest-88` from institution 4. This view supports institutional reporting on the affiliations and backgrounds of their speakers.

## View: v_venue_colloquium

This view reverses the venue perspective, answering: which colloquium is being held at each venue? It starts from the venue and joins to the colloquium.



The first row shows venue ROO-2106 in the Compact Initiative building hosting colloquium IDE-2086 "Compact Initiative," which is scheduled for 2024-11-27. The third row shows venue ROO-2120, an auditorium on floor 27, hosting colloquium IDE-2096 "Regional Cluster A," which has a `cancelled` status. This view is useful for venue managers tracking their schedule.

## View: v_series_colloquium_detail

This view provides a detailed look at the relationship between series and colloquiums, answering: what are the full details of each colloquium as it relates to its parent series? It combines series information with colloquium details.



The first row shows the "Extended Review" series (frequency: weekly) hosting colloquium IDE-2086 "Compact Initiative," which is scheduled for 2024-11-27 and has a `scheduled` status. The second row shows the "Pilot Initiative A" series (frequency: biweekly) hosting colloquium IDE-2091 "Legacy Model," which is `completed` and required registration. This view supports series coordinators in tracking their events.

## View: v_series_department

This view links series to their organizing departments, answering: which department organizes each series? It combines series details with department information.



The first row shows the "Extended Review" series organized by department 1000 "Extended Review," which has code `lu_tax_code_template_m_I_4` and was established on 2024-03-27. The second row shows the "Pilot Initiative A" series organized by department 1001 "Pilot Initiative A," with code `2986219` and established on 2025-08-11. This view supports departmental accountability for series programming.

## View: v_abstract_colloquium

This view reverses the abstract-colloquium relationship, answering: which colloquium is each abstract associated with? It starts from the abstract and joins to the colloquium.



The first row shows abstract 1, a 25-word document with a nature.com URL and public access, associated with colloquium IDE-2086 "Compact Initiative." The third row shows abstract 3, a 15-word document with private access, associated with colloquium IDE-2096 "Regional Cluster A." This view is useful for abstract reviewers tracking which colloquiums have received submissions.

## View: v_abstract_speaker

This view connects abstracts to their authors, answering: which speaker authored each abstract? It joins abstracts with speakers through the colloquium.



The first row shows abstract 1 authored by Theodore Mcgrath, who holds degree `legacy-highest-85` and is affiliated with `baseline-affiliat-55`. The fourth row shows abstract 4 authored by Norma Fisher, who holds `primary-highest-88` and uses `integrated-affiliat-58`. This view supports authorship tracking and speaker preparation.

## View: v_department_series

This view links departments to the series they organize, answering: which series does each department sponsor? It combines department details with series information.



The first row shows department 1000 "Extended Review" sponsoring the "Extended Review" series, which has a weekly frequency and operates under `compact-academic-44`. The third row shows department 1002 "Baseline Model" sponsoring the "Baseline Model" series, which has a monthly frequency and operates under `primary-academic-46`. This view supports departmental planning and resource allocation.

## View: v_department_institution

This view connects departments to their parent institutions, answering: which institution does each department belong to? It combines department details with institution information.



The first row shows department 1000 "Extended Review" belonging to institution 1, which was established on 2024-03-27. The second row shows department 1001 "Pilot Initiative A" belonging to institution 2, established on 2025-08-11. This view supports institutional reporting on departmental structure.

## View: v_institution_department_detail

This view provides a detailed institutional-departmental relationship, answering: what are the full details of each department as it relates to its parent institution? It combines institution information with department details.



The first row shows institution 1 containing department 1000 "Extended Review," which has code `lu_tax_code_template_m_I_4`, was established on 2024-03-27, and sponsors series 1. The fourth row shows institution 4 containing department 1003 "Distributed Cluster," with code `195369`, established on 2023-06-06, and sponsoring series 4. This view supports institutional administrators in understanding their departmental portfolio.

## View: v_institution_degree

This view links institutions to the degrees they grant, answering: which degrees are associated with each institution? It combines institution details with degree information.



The first row shows institution 1 associated with degree records that include the degree type and field of study. The second row shows institution 2 linked to its granted degrees. This view supports institutional reporting on academic qualifications conferred.

## View: v_degree_institution

This view reverses the degree-institution relationship, answering: which institution granted each degree? It starts from the degree and joins to the institution.



The first row shows a degree granted by institution 1, with the institution's name and establishment date. The third row shows a degree granted by institution 3. This view is useful for verifying the provenance of academic qualifications.

## View: v_degree_speaker

This view connects degrees to the speakers who hold them, answering: which speaker holds each degree? It joins degrees with speakers through the institution.



The first row shows a degree held by Theodore Mcgrath, who is affiliated with `baseline-affiliat-55`. The fourth row shows a degree held by Norma Fisher, affiliated with `integrated-affiliat-58`. This view supports speaker credential verification and academic background tracking.

## Closing Synthesis

The colloquium management system captures a complete ecosystem of academic presentations. Colloquiums serve as the central events, each linked to a speaker, a venue, a series, and an abstract. Speakers bring their institutional affiliations and academic credentials, while venues provide the physical infrastructure. Series organize colloquiums into recurring programs with defined frequencies, and departments sponsor those series. Institutions contain departments and grant the degrees that speakers hold. The views provide multiple perspectives on this data, allowing different stakeholders—program coordinators, venue managers, department heads, and institutional administrators—to query the information from their own vantage points. Together, these tables and views form a coherent record of scholarly activity, from the institutional level down to the individual presentation.

## Data appendix

**View `v_colloquium_speaker`**

```sql
CREATE VIEW v_colloquium_speaker AS
SELECT a.id, a.identifier, a.title, a.scheduled_date, b.speaker_id AS speaker_speaker_id, b.identifier AS speaker_identifier, b.full_name AS speaker_full_name
FROM colloquiums a JOIN speakers b ON a.speaker_id = b.speaker_id;
```

| id | identifier | title | scheduled_date | speaker_speaker_id | speaker_identifier | speaker_full_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Compact Initiative | 2024-11-27T22:18:00 | 1 | IDE-2086 | Theodore Mcgrath |
| 2 | IDE-2091 | Legacy Model | 2025-04-11T05:35:00 | 2 | IDE-2091 | Account Name |
| 3 | IDE-2096 | Regional Cluster A | 2022-09-22T12:52:00 | 3 | IDE-2096 | Saipan International Airport |
| 4 | IDE-2101 | Seasonal Review | 2023-02-06T19:09:00 | 4 | IDE-2101 | Norma Fisher |

**View `v_colloquium_venue`**

```sql
CREATE VIEW v_colloquium_venue AS
SELECT a.id, a.identifier, a.title, a.scheduled_date, b.identifier AS venue_identifier, b.building_name AS venue_building_name, b.room_number AS venue_room_number
FROM colloquiums a JOIN venues b ON a.venue_room_number = b.room_number;
```

| id | identifier | title | scheduled_date | venue_identifier | venue_building_name | venue_room_number |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Compact Initiative | 2024-11-27T22:18:00 | IDE-2086 | Compact Initiative | ROO-2106 |
| 2 | IDE-2091 | Legacy Model | 2025-04-11T05:35:00 | IDE-2091 | Legacy Model | ROO-2113 |
| 3 | IDE-2096 | Regional Cluster A | 2022-09-22T12:52:00 | IDE-2096 | Regional Cluster A | ROO-2120 |
| 4 | IDE-2101 | Seasonal Review | 2023-02-06T19:09:00 | IDE-2101 | Seasonal Review | ROO-2127 |

**View `v_colloquium_series`**

```sql
CREATE VIEW v_colloquium_series AS
SELECT a.id, a.identifier, a.title, a.scheduled_date, b.series_id AS series_series_id, b.identifier AS series_identifier, b.name AS series_name
FROM colloquiums a JOIN serieses b ON a.series_id = b.series_id;
```

| id | identifier | title | scheduled_date | series_series_id | series_identifier | series_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Compact Initiative | 2024-11-27T22:18:00 | 1 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Legacy Model | 2025-04-11T05:35:00 | 2 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Regional Cluster A | 2022-09-22T12:52:00 | 3 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Seasonal Review | 2023-02-06T19:09:00 | 4 | IDE-2101 | Distributed Cluster |

**View `v_colloquium_abstract`**

```sql
CREATE VIEW v_colloquium_abstract AS
SELECT a.id, a.identifier, a.title, a.scheduled_date, b.abstract_id AS abstract_abstract_id, b.identifier AS abstract_identifier, b.url AS abstract_url
FROM colloquiums a JOIN abstracts b ON a.abstract_id = b.abstract_id;
```

| id | identifier | title | scheduled_date | abstract_abstract_id | abstract_identifier | abstract_url |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Compact Initiative | 2024-11-27T22:18:00 | 1 | IDE-2086 | https://www.nature.com/articles/nphoton.2017.123 |
| 2 | IDE-2091 | Legacy Model | 2025-04-11T05:35:00 | 2 | IDE-2091 | http://www.mdpi.com/2073-445X/8/3/43/pdf |
| 3 | IDE-2096 | Regional Cluster A | 2022-09-22T12:52:00 | 3 | IDE-2096 | https://www.deshaw.com/recruit/UnivListing.html |
| 4 | IDE-2101 | Seasonal Review | 2023-02-06T19:09:00 | 4 | IDE-2101 | https://www.nature.com/articles/nphoton.2015.276 |

**View `v_speaker_colloquium`**

```sql
CREATE VIEW v_speaker_colloquium AS
SELECT a.speaker_id, a.identifier, a.full_name, a.highest_degree, b.id AS colloquium_id, b.identifier AS colloquium_identifier, b.title AS colloquium_title
FROM speakers a JOIN colloquiums b ON a.colloquium_id = b.id;
```

| speaker_id | identifier | full_name | highest_degree | colloquium_id | colloquium_identifier | colloquium_title |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Theodore Mcgrath | legacy-highest-85 | 1 | IDE-2086 | Compact Initiative |
| 2 | IDE-2091 | Account Name | compact-highest-86 | 2 | IDE-2091 | Legacy Model |
| 3 | IDE-2096 | Saipan International Airport | composite-highest-87 | 3 | IDE-2096 | Regional Cluster A |
| 4 | IDE-2101 | Norma Fisher | primary-highest-88 | 4 | IDE-2101 | Seasonal Review |

**View `v_speaker_institution`**

```sql
CREATE VIEW v_speaker_institution AS
SELECT a.speaker_id, a.identifier, a.full_name, a.highest_degree, b.institution_id AS institution_institution_id, b.identifier AS institution_identifier, b.name AS institution_name
FROM speakers a JOIN institutions b ON a.institution_id = b.institution_id;
```

| speaker_id | identifier | full_name | highest_degree | institution_institution_id | institution_identifier | institution_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Theodore Mcgrath | legacy-highest-85 | 1 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Account Name | compact-highest-86 | 2 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Saipan International Airport | composite-highest-87 | 3 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Norma Fisher | primary-highest-88 | 4 | IDE-2101 | Distributed Cluster |

**View `v_venue_colloquium`**

```sql
CREATE VIEW v_venue_colloquium AS
SELECT a.identifier, a.building_name, a.room_number, a.floor, b.id AS colloquium_id, b.identifier AS colloquium_identifier, b.title AS colloquium_title
FROM venues a JOIN colloquiums b ON a.colloquium_id = b.id;
```

| identifier | building_name | room_number | floor | colloquium_id | colloquium_identifier | colloquium_title |
|---|---|---|---|---|---|---|
| IDE-2086 | Compact Initiative | ROO-2106 | 11 | 1 | IDE-2086 | Compact Initiative |
| IDE-2091 | Legacy Model | ROO-2113 | 19 | 2 | IDE-2091 | Legacy Model |
| IDE-2096 | Regional Cluster A | ROO-2120 | 27 | 3 | IDE-2096 | Regional Cluster A |
| IDE-2101 | Seasonal Review | ROO-2127 | 35 | 4 | IDE-2101 | Seasonal Review |

**View `v_series_colloquium_detail`**

```sql
CREATE VIEW v_series_colloquium_detail AS
SELECT a.series_id, a.identifier, a.name, b.id AS colloquium_id, b.identifier AS colloquium_identifier, b.title AS colloquium_title
FROM serieses a
  JOIN serieses_colloquiums j ON j.series_id = a.series_id
  JOIN colloquiums b ON b.id = j.colloquium_id;
```

| series_id | identifier | name | colloquium_id | colloquium_identifier | colloquium_title |
|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 1 | IDE-2086 | Compact Initiative |
| 1 | IDE-2086 | Extended Review | 2 | IDE-2091 | Legacy Model |
| 2 | IDE-2091 | Pilot Initiative A | 2 | IDE-2091 | Legacy Model |
| 2 | IDE-2091 | Pilot Initiative A | 3 | IDE-2096 | Regional Cluster A |
| 3 | IDE-2096 | Baseline Model | 3 | IDE-2096 | Regional Cluster A |
| 3 | IDE-2096 | Baseline Model | 4 | IDE-2101 | Seasonal Review |
| 4 | IDE-2101 | Distributed Cluster | 4 | IDE-2101 | Seasonal Review |
| 4 | IDE-2101 | Distributed Cluster | 1 | IDE-2086 | Compact Initiative |

**View `v_series_department`**

```sql
CREATE VIEW v_series_department AS
SELECT a.series_id, a.identifier, a.name, a.academic_term, b.department_id AS department_department_id, b.identifier AS department_identifier, b.name AS department_name
FROM serieses a JOIN departments b ON a.department_id = b.department_id;
```

| series_id | identifier | name | academic_term | department_department_id | department_identifier | department_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | compact-academic-44 | 1000 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Pilot Initiative A | composite-academic-45 | 1001 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Baseline Model | primary-academic-46 | 1002 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Distributed Cluster | adaptive-academic-47 | 1003 | IDE-2101 | Distributed Cluster |

**View `v_abstract_colloquium`**

```sql
CREATE VIEW v_abstract_colloquium AS
SELECT a.abstract_id, a.identifier, a.url, a.word_count, b.id AS colloquium_id, b.identifier AS colloquium_identifier, b.title AS colloquium_title
FROM abstracts a JOIN colloquiums b ON a.colloquium_id = b.id;
```

| abstract_id | identifier | url | word_count | colloquium_id | colloquium_identifier | colloquium_title |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | https://www.nature.com/articles/nphoton.2017.123 | 25 | 1 | IDE-2086 | Compact Initiative |
| 2 | IDE-2091 | http://www.mdpi.com/2073-445X/8/3/43/pdf | 425 | 2 | IDE-2091 | Legacy Model |
| 3 | IDE-2096 | https://www.deshaw.com/recruit/UnivListing.html | 15 | 3 | IDE-2096 | Regional Cluster A |
| 4 | IDE-2101 | https://www.nature.com/articles/nphoton.2015.276 | 40 | 4 | IDE-2101 | Seasonal Review |

**View `v_abstract_speaker`**

```sql
CREATE VIEW v_abstract_speaker AS
SELECT a.abstract_id, a.identifier, a.url, a.word_count, b.speaker_id AS speaker_speaker_id, b.identifier AS speaker_identifier, b.full_name AS speaker_full_name
FROM abstracts a JOIN speakers b ON a.speaker_id = b.speaker_id;
```

| abstract_id | identifier | url | word_count | speaker_speaker_id | speaker_identifier | speaker_full_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | https://www.nature.com/articles/nphoton.2017.123 | 25 | 1 | IDE-2086 | Theodore Mcgrath |
| 2 | IDE-2091 | http://www.mdpi.com/2073-445X/8/3/43/pdf | 425 | 2 | IDE-2091 | Account Name |
| 3 | IDE-2096 | https://www.deshaw.com/recruit/UnivListing.html | 15 | 3 | IDE-2096 | Saipan International Airport |
| 4 | IDE-2101 | https://www.nature.com/articles/nphoton.2015.276 | 40 | 4 | IDE-2101 | Norma Fisher |

**View `v_department_series`**

```sql
CREATE VIEW v_department_series AS
SELECT a.department_id, a.identifier, a.name, a.code, b.series_id AS series_series_id, b.identifier AS series_identifier, b.name AS series_name
FROM departments a JOIN serieses b ON a.series_id = b.series_id;
```

| department_id | identifier | name | code | series_series_id | series_identifier | series_name |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Extended Review | lu_tax_code_template_m_I_4 | 1 | IDE-2086 | Extended Review |
| 1001 | IDE-2091 | Pilot Initiative A | 2986219 | 2 | IDE-2091 | Pilot Initiative A |
| 1002 | IDE-2096 | Baseline Model | 8928520 | 3 | IDE-2096 | Baseline Model |
| 1003 | IDE-2101 | Distributed Cluster | 195369 | 4 | IDE-2101 | Distributed Cluster |

**View `v_department_institution`**

```sql
CREATE VIEW v_department_institution AS
SELECT a.department_id, a.identifier, a.name, a.code, b.institution_id AS institution_institution_id, b.identifier AS institution_identifier, b.name AS institution_name
FROM departments a JOIN institutions b ON a.institution_id = b.institution_id;
```

| department_id | identifier | name | code | institution_institution_id | institution_identifier | institution_name |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Extended Review | lu_tax_code_template_m_I_4 | 1 | IDE-2086 | Extended Review |
| 1001 | IDE-2091 | Pilot Initiative A | 2986219 | 2 | IDE-2091 | Pilot Initiative A |
| 1002 | IDE-2096 | Baseline Model | 8928520 | 3 | IDE-2096 | Baseline Model |
| 1003 | IDE-2101 | Distributed Cluster | 195369 | 4 | IDE-2101 | Distributed Cluster |

**View `v_institution_department_detail`**

```sql
CREATE VIEW v_institution_department_detail AS
SELECT a.institution_id, a.identifier, a.name, b.department_id AS department_department_id, b.identifier AS department_identifier, b.name AS department_name
FROM institutions a
  JOIN institutions_departments j ON j.institution_id = a.institution_id
  JOIN departments b ON b.department_id = j.department_id;
```

| institution_id | identifier | name | department_department_id | department_identifier | department_name |
|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 1000 | IDE-2086 | Extended Review |
| 1 | IDE-2086 | Extended Review | 1001 | IDE-2091 | Pilot Initiative A |
| 2 | IDE-2091 | Pilot Initiative A | 1001 | IDE-2091 | Pilot Initiative A |
| 2 | IDE-2091 | Pilot Initiative A | 1002 | IDE-2096 | Baseline Model |
| 3 | IDE-2096 | Baseline Model | 1002 | IDE-2096 | Baseline Model |
| 3 | IDE-2096 | Baseline Model | 1003 | IDE-2101 | Distributed Cluster |
| 4 | IDE-2101 | Distributed Cluster | 1003 | IDE-2101 | Distributed Cluster |
| 4 | IDE-2101 | Distributed Cluster | 1000 | IDE-2086 | Extended Review |

**View `v_institution_degree`**

```sql
CREATE VIEW v_institution_degree AS
SELECT a.institution_id, a.identifier, a.name, a.type, b.degree_id AS degree_degree_id, b.identifier AS degree_identifier, b.name AS degree_name
FROM institutions a JOIN degrees b ON a.degree_id = b.degree_id;
```

| institution_id | identifier | name | type | degree_degree_id | degree_identifier | degree_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | university | 1 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Pilot Initiative A | college | 2 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Baseline Model | institute | 3 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Distributed Cluster | university | 4 | IDE-2101 | Distributed Cluster |

**View `v_degree_institution`**

```sql
CREATE VIEW v_degree_institution AS
SELECT a.degree_id, a.identifier, a.name, a.level, b.institution_id AS institution_institution_id, b.identifier AS institution_identifier, b.name AS institution_name
FROM degrees a JOIN institutions b ON a.institution_id = b.institution_id;
```

| degree_id | identifier | name | level | institution_institution_id | institution_identifier | institution_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | bachelors | 1 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Pilot Initiative A | masters | 2 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Baseline Model | doctorate | 3 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Distributed Cluster | postdoctoral | 4 | IDE-2101 | Distributed Cluster |

**View `v_degree_speaker`**

```sql
CREATE VIEW v_degree_speaker AS
SELECT a.degree_id, a.identifier, a.name, a.level, b.speaker_id AS speaker_speaker_id, b.identifier AS speaker_identifier, b.full_name AS speaker_full_name
FROM degrees a JOIN speakers b ON a.speaker_id = b.speaker_id;
```

| degree_id | identifier | name | level | speaker_speaker_id | speaker_identifier | speaker_full_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | bachelors | 1 | IDE-2086 | Theodore Mcgrath |
| 2 | IDE-2091 | Pilot Initiative A | masters | 2 | IDE-2091 | Account Name |
| 3 | IDE-2096 | Baseline Model | doctorate | 3 | IDE-2096 | Saipan International Airport |
| 4 | IDE-2101 | Distributed Cluster | postdoctoral | 4 | IDE-2101 | Norma Fisher |
