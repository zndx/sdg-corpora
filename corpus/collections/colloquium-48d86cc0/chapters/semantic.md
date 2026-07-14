The academic colloquium ecosystem is a structured domain in which scholarly talks are organized into recurring series, hosted at physical venues, delivered by affiliated speakers, and accompanied by abstract documents. Every colloquium is a first-class event with a unique identifier, a title, a scheduled date and time window, a status, and a registration flag. The relational model captures this ecosystem by normalizing entities into base tables, linking them through foreign keys, and materializing denormalized views that answer the analytical questions domain users actually ask.

## Base Tables and Entity Types

The model contains ten base tables. Seven are entity tables—`colloquiums`, `speakers`, `venues`, `serieses`, `abstracts`, `departments`, and `institutions`—supplemented by `degrees` as a lookup entity, and two junction tables, `serieses_colloquiums` and `institutions_departments`, that resolve many-to-many relationships.

**Table `colloquiums`**

| id | identifier | title | scheduled_date | start_time | end_time | status | registration_required | speaker_id | venue_room_number | series_id | abstract_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Compact Initiative | 2024-11-27T22:18:00 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | scheduled | false | 1 | ROO-2106 | 1 | 1 |
| 2 | IDE-2091 | Legacy Model | 2025-04-11T05:35:00 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | completed | true | 2 | ROO-2113 | 2 | 2 |
| 3 | IDE-2096 | Regional Cluster A | 2022-09-22T12:52:00 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | cancelled | false | 3 | ROO-2120 | 3 | 3 |
| 4 | IDE-2101 | Seasonal Review | 2023-02-06T19:09:00 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | scheduled | true | 4 | ROO-2127 | 4 | 4 |

The `colloquiums` table is the central event entity. Its surrogate primary key `id` is an integer, while the business identifier `identifier` carries values such as `IDE-2086`. The `title` column stores human-readable names like *Compact Initiative* and *Legacy Model*. Temporal attributes include `scheduled_date`, `start_time`, and `end_time`, all stored as ISO-8601 timestamps. The `status` column is an enum with values `scheduled`, `completed`, and `cancelled`; the boolean `registration_required` gates access. Four foreign keys anchor the colloquium to its supporting entities: `speaker_id` references `speakers(speaker_id)`, `venue_room_number` references `venues(room_number)`, `series_id` references `serieses(series_id)`, and `abstract_id` references `abstracts(abstract_id)`.

**Table `speakers`**

| speaker_id | identifier | full_name | highest_degree | degree_granting_institution | department | affiliation | colloquium_id | institution_id |
|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Theodore Mcgrath | legacy-highest-85 | composite-degree-15 | adaptive-departme-89 | baseline-affiliat-55 | 1 | 1 |
| 2 | IDE-2091 | Account Name | compact-highest-86 | primary-degree-16 | distributed-departme-90 | pilot-affiliat-56 | 2 | 2 |
| 3 | IDE-2096 | Saipan International Airport | composite-highest-87 | adaptive-degree-17 | baseline-departme-91 | extended-affiliat-57 | 3 | 3 |
| 4 | IDE-2101 | Norma Fisher | primary-highest-88 | distributed-degree-18 | pilot-departme-92 | integrated-affiliat-58 | 4 | 4 |

The `speakers` table models individual presenters. Its primary key `speaker_id` is an integer, and the business identifier `identifier` again uses the `IDE-` prefix. The `full_name` column holds values such as *Theodore Mcgrath* and *Norma Fisher*. The columns `highest_degree`, `degree_granting_institution`, `department`, and `affiliation` are denormalized attributes that store the speaker's credential snapshot at the time of the colloquium. The foreign key `institution_id` points to `institutions(institution_id)`, and `colloquium_id` creates a back-reference to `colloquiums(id)`, enabling the speaker-centric views.

**Table `venues`**

| identifier | building_name | room_number | floor | capacity | location_type | colloquium_id |
|---|---|---|---|---|---|---|
| IDE-2086 | Compact Initiative | ROO-2106 | 11 | 32 | lecture_hall | 1 |
| IDE-2091 | Legacy Model | ROO-2113 | 19 | 41 | conference_room | 2 |
| IDE-2096 | Regional Cluster A | ROO-2120 | 27 | 50 | auditorium | 3 |
| IDE-2101 | Seasonal Review | ROO-2127 | 35 | 59 | lecture_hall | 4 |

Venues are physical locations where colloquiums take place. The primary key is `identifier` (a string such as `IDE-2086`), and the `room_number` column—values like `ROO-2106` and `ROO-2127`—serves as the natural key referenced by `colloquiums.venue_room_number`. Additional attributes include `building_name` (e.g., *Compact Initiative*), `floor` (an integer such as 11 or 35), `capacity` (ranging from 32 to 59 in the sample), and `location_type` (an enum with values `lecture_hall`, `conference_room`, and `auditorium`). The foreign key `colloquium_id` links the venue row to its hosting colloquium.

**Table `serieses`**

| series_id | identifier | name | academic_term | organizing_department | frequency | department_id |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | compact-academic-44 | pilot-organizi-80 | weekly | 1000 |
| 2 | IDE-2091 | Pilot Initiative A | composite-academic-45 | extended-organizi-81 | biweekly | 1001 |
| 3 | IDE-2096 | Baseline Model | primary-academic-46 | integrated-organizi-82 | monthly | 1002 |
| 4 | IDE-2101 | Distributed Cluster | adaptive-academic-47 | seasonal-organizi-83 | irregular | 1003 |

A `serieses` table represents recurring academic programs. Its surrogate key `series_id` is an integer, and the business identifier `identifier` follows the `IDE-` convention. The `name` column stores series titles such as *Extended Review* and *Pilot Initiative A*. The `academic_term` column carries values like `compact-academic-44`, while `frequency` is an enum with values `weekly`, `biweekly`, `monthly`, and `irregular`. The `organizing_department` column is a denormalized string snapshot. The foreign key `department_id` references `departments(department_id)`, tying each series to its home department.

**Table `abstracts`**

| abstract_id | identifier | url | word_count | language | last_modified | access_level | colloquium_id | speaker_id |
|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | https://www.nature.com/articles/nphoton.2017.123 | 25 | composite-language-45 | 2022-05-05T04:36:00 | public | 1 | 1 |
| 2 | IDE-2091 | http://www.mdpi.com/2073-445X/8/3/43/pdf | 425 | primary-language-46 | 2023-10-16T11:53:00 | restricted | 2 | 2 |
| 3 | IDE-2096 | https://www.deshaw.com/recruit/UnivListing.html | 15 | adaptive-language-47 | 2024-03-27T18:10:00 | private | 3 | 3 |
| 4 | IDE-2101 | https://www.nature.com/articles/nphoton.2015.276 | 40 | distributed-language-48 | 2025-08-11T01:27:00 | public | 4 | 4 |

The `abstracts` table stores pre-publication summaries. Its surrogate key `abstract_id` is an integer, and the business identifier `identifier` uses the `IDE-` prefix. The `url` column holds full URLs such as `https://www.nature.com/articles/nphoton.2017.123`. The `word_count` column is an integer (25, 425, 15, 40 in the sample), `language` is a denormalized code like `composite-language-45`, and `last_modified` is a timestamp. The `access_level` enum takes values `public`, `restricted`, and `private`. Two foreign keys anchor the abstract: `colloquium_id` references `colloquiums(id)` and `speaker_id` references `speakers(speaker_id)`.

**Table `departments`**

| department_id | identifier | name | code | parent_institution | established_date | series_id | institution_id |
|---|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | Extended Review | lu_tax_code_template_m_I_4 | seasonal-parent-53 | 2024-03-27 | 1 | 1 |
| 1001 | IDE-2091 | Pilot Initiative A | 2986219 | regional-parent-54 | 2025-08-11 | 2 | 2 |
| 1002 | IDE-2096 | Baseline Model | 8928520 | legacy-parent-55 | 2022-01-22 | 3 | 3 |
| 1003 | IDE-2101 | Distributed Cluster | 195369 | compact-parent-56 | 2023-06-06 | 4 | 4 |

Departments are organizational units within institutions. The surrogate primary key `department_id` is an integer (1000–1003 in the sample), and the business identifier `identifier` uses the `IDE-` prefix. The `name` column stores department titles such as *Extended Review* and *Distributed Cluster*. The `code` column holds alphanumeric codes like `lu_tax_code_template_m_I_4`. The `parent_institution` column is a denormalized string, and `established_date` is a date value. Two foreign keys exist: `series_id` references `serieses(series_id)` and `institution_id` references `institutions(institution_id)`.

**Table `institutions`**

| institution_id | identifier | name | type | location | founded_date | degree_id |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | university | extended-location-99 | 2024-03-15 | 1 |
| 2 | IDE-2091 | Pilot Initiative A | college | integrated-location-100 | 2025-08-26 | 2 |
| 3 | IDE-2096 | Baseline Model | institute | seasonal-location-101 | 2022-01-10 | 3 |
| 4 | IDE-2101 | Distributed Cluster | university | regional-location-102 | 2023-06-21 | 4 |

Institutions are the parent organizations of departments. The table uses a surrogate primary key `institution_id` and a business identifier `identifier`. Additional columns capture the institution's name, code, and metadata. The `institutions_departments` junction table (described below) resolves the many-to-many relationship between institutions and departments.

**Table `degrees`**

| degree_id | identifier | name | level | field | issuing_institution | institution_id | speaker_id |
|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | bachelors | primary-field-58 | distributed-issuing-96 | 1 | 1 |
| 2 | IDE-2091 | Pilot Initiative A | masters | adaptive-field-59 | baseline-issuing-97 | 2 | 2 |
| 3 | IDE-2096 | Baseline Model | doctorate | distributed-field-60 | pilot-issuing-98 | 3 | 3 |
| 4 | IDE-2101 | Distributed Cluster | postdoctoral | baseline-field-61 | extended-issuing-99 | 4 | 4 |

The `degrees` table is a lookup entity cataloguing academic credentials. It stores degree identifiers, names, and the `institution_id` of the granting body. Speakers reference their highest degree through the `highest_degree` column in `speakers`, which is a denormalized snapshot rather than a foreign key, keeping the speaker table lightweight.

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

The `serieses_colloquiums` junction table resolves the many-to-many relationship between `serieses` and `colloquiums`. It contains at least two columns: `series_id` referencing `serieses(series_id)` and `colloquium_id` referencing `colloquiums(id)`. This table allows a single colloquium to belong to multiple series and a series to span multiple colloquium instances.

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

The `institutions_departments` junction table resolves the many-to-many relationship between `institutions` and `departments`. It contains `institution_id` referencing `institutions(institution_id)` and `department_id` referencing `departments(department_id)`. This enables a department to be associated with multiple institutions and an institution to host multiple departments.

## Foreign-Key Topology

The foreign-key graph forms a hub-and-spoke pattern centered on `colloquiums`. The `colloquiums` table holds four outbound foreign keys—`speaker_id → speakers`, `venue_room_number → venues`, `series_id → serieses`, and `abstract_id → abstracts`—making it the central fact table. Each of those four entity tables, in turn, holds one or more inbound references: `speakers.colloquium_id` points back to `colloquiums`, `venues.colloquium_id` points back to `colloquiums`, and `abstracts.colloquium_id` points back to `colloquiums`, creating bidirectional navigability. The `abstracts` table also holds `speaker_id → speakers`, creating a second cross-reference between abstracts and speakers.

The `serieses → departments` link flows through `serieses.department_id`, while `departments` itself holds `institution_id → institutions` and `series_id → serieses`, forming a triangle of organizational relationships. The junction tables `serieses_colloquiums` and `institutions_departments` sit outside this triangle, providing additional many-to-many bridges.

## Views: Denormalized Facts

Views materialize the normalized schema into question-oriented result sets. Each view joins two or more base tables and presents a flat row that represents a domain fact.

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

The view `v_colloquium_speaker` joins `colloquiums` with `speakers` on `colloquiums.speaker_id = speakers.speaker_id`. It answers the question: *Who presented which colloquium?* A row from the view might show colloquium `IDE-2086` (*Compact Initiative*) delivered by *Theodore Mcgrath*, or colloquium `IDE-2101` (*Seasonal Review*) delivered by *Norma Fisher*. The join reconstructs the speaker assignment that is stored as a single foreign key in `colloquiums`.

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

The view `v_colloquium_venue` joins `colloquiums` with `venues` on `colloquiums.venue_room_number = venues.room_number`. It answers: *Where was each colloquium held?* A row might pair colloquium `IDE-2086` with venue room `ROO-2106` in building *Compact Initiative*, or colloquium `IDE-2096` with room `ROO-2120` in the *Regional Cluster A* building. The join materializes the venue assignment stored as a single FK in `colloquiums`.

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

The view `v_colloquium_series` joins `colloquiums` with `serieses` on `colloquiums.series_id = serieses.series_id`. It answers: *Which series does each colloquium belong to?* A row might show colloquium `IDE-2086` belonging to the *Extended Review* series, or colloquium `IDE-2091` belonging to *Pilot Initiative A*. The join reconstructs the series membership stored as a single FK in `colloquiums`.

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

The view `v_colloquium_abstract` joins `colloquiums` with `abstracts` on `colloquiums.abstract_id = abstracts.abstract_id`. It answers: *What abstract accompanies each colloquium?* A row might pair colloquium `IDE-2086` with abstract `IDE-2086` (URL `https://www.nature.com/articles/nphoton.2017.123`, word count 25, access level `public`), or colloquium `IDE-2091` with abstract `IDE-2091` (URL `http://www.mdpi.com/2073-445X/8/3/43/pdf`, word count 425, access level `restricted`). The join reconstructs the abstract linkage stored as a single FK in `colloquiums`.

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

The view `v_speaker_colloquium` joins `speakers` with `colloquiums` on `speakers.speaker_id = colloquiums.speaker_id`. It answers the inverse question: *Which colloquiums did each speaker present?* A row might show *Theodore Mcgrath* presenting colloquium `IDE-2086` (*Compact Initiative*), or *Norma Fisher* presenting colloquium `IDE-2101` (*Seasonal Review*). This view leverages the bidirectional FK between the two tables.

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

The view `v_speaker_institution` joins `speakers` with `institutions` on `speakers.institution_id = institutions.institution_id`. It answers: *Which institution is each speaker affiliated with?* A row might pair speaker `IDE-2086` (*Theodore Mcgrath*) with institution 1, or speaker `IDE-2101` (*Norma Fisher*) with institution 4. The join materializes the institutional affiliation stored as a FK in `speakers`.

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

The view `v_venue_colloquium` joins `venues` with `colloquiums` on `venues.colloquium_id = colloquiums.id`. It answers the inverse: *Which colloquium is hosted at each venue?* A row might show venue `ROO-2106` (building *Compact Initiative*, capacity 32, type `lecture_hall`) hosting colloquium `IDE-2086`. The join reconstructs the venue-to-colloquium assignment stored as a FK in `venues`.

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

The view `v_series_colloquium_detail` joins `serieses` with `colloquiums` on `serieses.series_id = colloquiums.series_id`. It answers: *What colloquiums belong to each series, with full colloquium details?* A row might show the *Extended Review* series (frequency `weekly`) hosting colloquium `IDE-2086` (*Compact Initiative*, status `scheduled`), or the *Pilot Initiative A* series (frequency `biweekly`) hosting colloquium `IDE-2091` (*Legacy Model*, status `completed`). The join materializes the series-colloquium membership stored as a FK in `colloquiums`.

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

The view `v_series_department` joins `serieses` with `departments` on `serieses.department_id = departments.department_id`. It answers: *Which department organizes each series?* A row might pair the *Extended Review* series with department 1000 (*Extended Review*, code `lu_tax_code_template_m_I_4`), or the *Pilot Initiative A* series with department 1001 (*Pilot Initiative A*, code `2986219`). The join reconstructs the department assignment stored as a FK in `serieses`.

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

The view `v_abstract_colloquium` joins `abstracts` with `colloquiums` on `abstracts.colloquium_id = colloquiums.id`. It answers the inverse: *Which colloquium does each abstract accompany?* A row might show abstract `IDE-2086` (URL `https://www.nature.com/articles/nphoton.2017.123`, word count 25, access level `public`) accompanying colloquium `IDE-2086` (*Compact Initiative*). The join reconstructs the abstract-to-colloquium linkage stored as a FK in `abstracts`.

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

The view `v_abstract_speaker` joins `abstracts` with `speakers` on `abstracts.speaker_id = speakers.speaker_id`. It answers: *Which speaker authored each abstract?* A row might pair abstract `IDE-2086` with speaker `IDE-2086` (*Theodore Mcgrath*), or abstract `IDE-2101` with speaker `IDE-2101` (*Norma Fisher*). The join reconstructs the authorship linkage stored as a FK in `abstracts`.

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

The view `v_department_series` joins `departments` with `serieses` on `departments.department_id = serieses.department_id`. It answers the inverse: *Which series does each department organize?* A row might show department 1000 (*Extended Review*, established `2024-03-27`) organizing the *Extended Review* series (frequency `weekly`), or department 1001 (*Pilot Initiative A*, established `2025-08-11`) organizing the *Pilot Initiative A* series (frequency `biweekly`). The join reconstructs the department-to-series assignment stored as a FK in `serieses`.

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

The view `v_department_institution` joins `departments` with `institutions` on `departments.institution_id = institutions.institution_id`. It answers: *Which institution does each department belong to?* A row might pair department 1000 (*Extended Review*) with institution 1, or department 1003 (*Distributed Cluster*) with institution 4. The join materializes the institutional affiliation stored as a FK in `departments`.

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

The view `v_institution_department_detail` joins `institutions` with `departments` on `institutions.institution_id = departments.institution_id`. It answers the inverse: *Which departments belong to each institution?* A row might show institution 1 hosting department 1000 (*Extended Review*, code `lu_tax_code_template_m_I_4`, established `2024-03-27`), or institution 4 hosting department 1003 (*Distributed Cluster*, code `195369`, established `2023-06-06`). The join reconstructs the institutional-to-department relationship stored as a FK in `departments`.

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

The view `v_institution_degree` joins `institutions` with `degrees` on `institutions.institution_id = degrees.degree_granting_institution_id` (or the equivalent FK column). It answers: *Which degrees are granted by each institution?* A row might pair institution 1 with a degree such as `legacy-highest-85`, or institution 4 with `primary-highest-88`. The join materializes the institution-degree relationship, linking the organizational entity to the credential lookup.

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

The view `v_degree_institution` joins `degrees` with `institutions` on `degrees.degree_granting_institution_id = institutions.institution_id`. It answers the inverse: *Which institution granted each degree?* A row might show degree `legacy-highest-85` granted by institution 1, or degree `primary-highest-88` granted by institution 4. The join reconstructs the granting relationship stored as a FK in `degrees`.

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

The view `v_degree_speaker` joins `degrees` with `speakers` on `degrees.degree_id = speakers.highest_degree` (or the equivalent FK column). It answers: *Which speakers hold each degree?* A row might pair degree `legacy-highest-85` with speaker `IDE-2086` (*Theodore Mcgrath*), or degree `primary-highest-88` with speaker `IDE-2101` (*Norma Fisher*). The join reconstructs the credential-to-speaker relationship, connecting the lookup entity to the person entity.

## Closing Synthesis

The colloquium domain model follows a clean star-schema pattern: `colloquiums` is the central fact table with four foreign keys radiating outward to `speakers`, `venues`, `serieses`, and `abstracts`. Each of those entity tables holds one or more foreign keys that either point back to `colloquiums` (creating bidirectional navigability) or point to organizational entities (`institutions`, `departments`). The two junction tables, `serieses_colloquiums` and `institutions_departments`, resolve many-to-many relationships that the star schema cannot express directly. The twenty-one views materialize every pairwise join between related tables, producing flat result sets that answer the specific analytical questions domain users ask—*who presented where*, *which series hosts which colloquium*, *which department organizes which series*, and so on. Every view's join condition maps directly to a foreign key in the base tables, ensuring that the denormalized output is a lossless reconstruction of the normalized schema.