The chapter has been written to `/tmp/harness_semantic__s5u9axx/chapter_7_ontology_to_schema.md` (1,813 words). All 28 payload blocks are present — 14 `` markers and 14 `` markers — each placed on its own line where the block belongs.

**Structure summary:**

- **Opening paragraph** frames the domain scenario (competition assessment lifecycle)
- **`## The Five Base Entities`** — teaches each of the five base tables (`competition_events`, `competitors`, `assessments`, `tools`, `score_sheets`) with their columns, data types, cardinality, and foreign keys, quoting representative values throughout
- **`## Junction Tables and Many-to-Many Relationships`** — explains all nine junction tables (`events_competitors`, `events_assessments`, `events_sheets`, `competitors_sheets`, `competitors_tools`, `assessments_competitors`, `assessments_sheets`, `tools_competitors`, `sheets_competitors`) and how they resolve many-to-many associations
- **`## View-Based Reassembly of Domain Facts`** — interprets all fourteen views, explaining what question each join answers and reading 2–3 concrete rows as evidence
- **`## Synthesis`** — closing paragraph summarising the architecture

## Data appendix

**Table `competition_events`**

| competition_event_id | event_id | event_title | event_year | event_status | registration_deadline | total_score_weight |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | Legacy Standard D | 35 | scheduled | 2023-02-05T13:15:00 | 0.0010595424921752 |
| 2 | 168535 | Regional Framework | 45 | ongoing | 2024-07-16T20:32:00 | 0.0030724112684334 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Protocol | 55 | completed | 2025-12-27T03:49:00 | 0.01999998 |
| 4 | 1186089 | Integrated Programme A | 65 | cancelled | 2022-05-11T10:06:00 | 0.6000001 |

**Table `competitors`**

| competitor_id | first_name | last_name | apprentice_level | registration_status | contact_email | contact_phone | competition_event_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | first-year | registered | Christopher Wilson | Joe Tsai | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Janice Johnston | Heather Beasley | second-year | qualified | Charles Larsen | Stephanie Collins | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Upal Saha | Audrey Taylor | third-year | disqualified | Mary Alvarez | Tasha Rodriguez | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Katherine Snyder | Susan Wagner | journeyman | completed | April Snyder | Walter Pratt | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**Table `assessments`**

| assessment_id | assessment_type | duration_minutes | score_weight_percentage | max_score | assessment_status | competition_event_id |
|---|---|---|---|---|---|---|
| 1 | written | 35 | 17.70 | 7.70 | pending | 1 |
| 2 | practical | 38 | 22.40 | 9.40 | in-progress | 2 |
| 3 | written | 41 | 27.10 | 11.10 | graded | 3 |
| 4 | practical | 44 | 31.80 | 12.80 | archived | 4 |

**Table `tools`**

| tool_id | tool_name | tool_category | brand_reference | specification | tool_status | assessment_id |
|---|---|---|---|---|---|---|
| comi | Composite Model | provided | Interac Association | compact-specific-86 | available | 1 |
| 195360 | Compact Cluster A | required | Assicurazioni Generali | composite-specific-87 | inspected | 2 |
| 3355763 | Legacy Review | prohibited | Link Title | primary-specific-88 | used | 3 |
| 8387539 | Regional Initiative | provided | Tattooed Chef Inc. | adaptive-specific-89 | missing | 4 |

**Table `score_sheets`**

| score_sheet_id | score_sheet_version | total_max_points | safety_scope_included | is_sample | last_updated | assessment_id | competition_event_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | regional-score-36 | 21.45 | false | true | 2023-06-17T17:27:00 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | legacy-score-37 | 24.90 | true | false | 2024-11-01T00:44:00 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | compact-score-38 | 28.35 | false | true | 2025-04-12T07:01:00 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | composite-score-39 | 31.80 | true | false | 2022-09-23T14:18:00 | 4 | 4 | 2025-04-16 09:14:00 |

**Table `events_competitors`**

| competition_event_id | competitor_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `events_assessments`**

| competition_event_id | assessment_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `events_sheets`**

| competition_event_id | score_sheet_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `competitors_sheets`**

| competitor_id | score_sheet_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `competitors_tools`**

| competitor_id | tool_id |
|---|---|
| 1 | comi |
| 1 | 195360 |
| 2 | 195360 |
| 2 | 3355763 |
| 3 | 3355763 |
| 3 | 8387539 |
| 4 | 8387539 |
| 4 | comi |

**Table `assessments_competitors`**

| assessment_id | competitor_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `assessments_sheets`**

| assessment_id | score_sheet_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `tools_competitors`**

| tool_id | competitor_id |
|---|---|
| comi | 1 |
| comi | 2 |
| 195360 | 2 |
| 195360 | 3 |
| 3355763 | 3 |
| 3355763 | 4 |
| 8387539 | 4 |
| 8387539 | 1 |

**Table `sheets_competitors`**

| score_sheet_id | competitor_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**View `v_competition_event_competitor_detail`**

```sql
CREATE VIEW v_competition_event_competitor_detail AS
SELECT a.competition_event_id, a.event_id, a.event_title, b.competitor_id AS competitor_competitor_id, b.first_name AS competitor_first_name, b.last_name AS competitor_last_name
FROM competition_events a
  JOIN events_competitors j ON j.competition_event_id = a.competition_event_id
  JOIN competitors b ON b.competitor_id = j.competitor_id;
```

| competition_event_id | event_id | event_title | competitor_competitor_id | competitor_first_name | competitor_last_name |
|---|---|---|---|---|---|
| 1 | 2002007020060 | Legacy Standard D | 1 | Stephanie Collins | Paul Allen |
| 1 | 2002007020060 | Legacy Standard D | 2 | Janice Johnston | Heather Beasley |
| 2 | 168535 | Regional Framework | 2 | Janice Johnston | Heather Beasley |
| 2 | 168535 | Regional Framework | 3 | Upal Saha | Audrey Taylor |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Protocol | 3 | Upal Saha | Audrey Taylor |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Protocol | 4 | Katherine Snyder | Susan Wagner |
| 4 | 1186089 | Integrated Programme A | 4 | Katherine Snyder | Susan Wagner |
| 4 | 1186089 | Integrated Programme A | 1 | Stephanie Collins | Paul Allen |

**View `v_competition_event_assessment_detail`**

```sql
CREATE VIEW v_competition_event_assessment_detail AS
SELECT a.competition_event_id, a.event_id, a.event_title, b.assessment_id AS assessment_assessment_id, b.assessment_type AS assessment_assessment_type, b.duration_minutes AS assessment_duration_minutes
FROM competition_events a
  JOIN events_assessments j ON j.competition_event_id = a.competition_event_id
  JOIN assessments b ON b.assessment_id = j.assessment_id;
```

| competition_event_id | event_id | event_title | assessment_assessment_id | assessment_assessment_type | assessment_duration_minutes |
|---|---|---|---|---|---|
| 1 | 2002007020060 | Legacy Standard D | 1 | written | 35 |
| 1 | 2002007020060 | Legacy Standard D | 2 | practical | 38 |
| 2 | 168535 | Regional Framework | 2 | practical | 38 |
| 2 | 168535 | Regional Framework | 3 | written | 41 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Protocol | 3 | written | 41 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Protocol | 4 | practical | 44 |
| 4 | 1186089 | Integrated Programme A | 4 | practical | 44 |
| 4 | 1186089 | Integrated Programme A | 1 | written | 35 |

**View `v_competition_event_score_sheet_detail`**

```sql
CREATE VIEW v_competition_event_score_sheet_detail AS
SELECT a.competition_event_id, a.event_id, a.event_title, b.score_sheet_id AS sheet_score_sheet_id, b.score_sheet_version AS sheet_score_sheet_version, b.total_max_points AS sheet_total_max_points
FROM competition_events a
  JOIN events_sheets j ON j.competition_event_id = a.competition_event_id
  JOIN score_sheets b ON b.score_sheet_id = j.score_sheet_id;
```

| competition_event_id | event_id | event_title | sheet_score_sheet_id | sheet_score_sheet_version | sheet_total_max_points |
|---|---|---|---|---|---|
| 1 | 2002007020060 | Legacy Standard D | 1 | regional-score-36 | 21.45 |
| 1 | 2002007020060 | Legacy Standard D | 2 | legacy-score-37 | 24.90 |
| 2 | 168535 | Regional Framework | 2 | legacy-score-37 | 24.90 |
| 2 | 168535 | Regional Framework | 3 | compact-score-38 | 28.35 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Protocol | 3 | compact-score-38 | 28.35 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Protocol | 4 | composite-score-39 | 31.80 |
| 4 | 1186089 | Integrated Programme A | 4 | composite-score-39 | 31.80 |
| 4 | 1186089 | Integrated Programme A | 1 | regional-score-36 | 21.45 |

**View `v_competitor_competition_event`**

```sql
CREATE VIEW v_competitor_competition_event AS
SELECT a.competitor_id, a.first_name, a.last_name, a.apprentice_level, b.competition_event_id AS event_competition_event_id, b.event_id AS event_event_id, b.event_title AS event_event_title
FROM competitors a JOIN competition_events b ON a.competition_event_id = b.competition_event_id;
```

| competitor_id | first_name | last_name | apprentice_level | event_competition_event_id | event_event_id | event_event_title |
|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | first-year | 1 | 2002007020060 | Legacy Standard D |
| 2 | Janice Johnston | Heather Beasley | second-year | 2 | 168535 | Regional Framework |
| 3 | Upal Saha | Audrey Taylor | third-year | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Protocol |
| 4 | Katherine Snyder | Susan Wagner | journeyman | 4 | 1186089 | Integrated Programme A |

**View `v_competitor_score_sheet_detail`**

```sql
CREATE VIEW v_competitor_score_sheet_detail AS
SELECT a.competitor_id, a.first_name, a.last_name, b.score_sheet_id AS sheet_score_sheet_id, b.score_sheet_version AS sheet_score_sheet_version, b.total_max_points AS sheet_total_max_points
FROM competitors a
  JOIN competitors_sheets j ON j.competitor_id = a.competitor_id
  JOIN score_sheets b ON b.score_sheet_id = j.score_sheet_id;
```

| competitor_id | first_name | last_name | sheet_score_sheet_id | sheet_score_sheet_version | sheet_total_max_points |
|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | 1 | regional-score-36 | 21.45 |
| 1 | Stephanie Collins | Paul Allen | 2 | legacy-score-37 | 24.90 |
| 2 | Janice Johnston | Heather Beasley | 2 | legacy-score-37 | 24.90 |
| 2 | Janice Johnston | Heather Beasley | 3 | compact-score-38 | 28.35 |
| 3 | Upal Saha | Audrey Taylor | 3 | compact-score-38 | 28.35 |
| 3 | Upal Saha | Audrey Taylor | 4 | composite-score-39 | 31.80 |
| 4 | Katherine Snyder | Susan Wagner | 4 | composite-score-39 | 31.80 |
| 4 | Katherine Snyder | Susan Wagner | 1 | regional-score-36 | 21.45 |

**View `v_competitor_tool_detail`**

```sql
CREATE VIEW v_competitor_tool_detail AS
SELECT a.competitor_id, a.first_name, a.last_name, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name, b.tool_category AS tool_tool_category
FROM competitors a
  JOIN competitors_tools j ON j.competitor_id = a.competitor_id
  JOIN tools b ON b.tool_id = j.tool_id;
```

| competitor_id | first_name | last_name | tool_tool_id | tool_tool_name | tool_tool_category |
|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | comi | Composite Model | provided |
| 1 | Stephanie Collins | Paul Allen | 195360 | Compact Cluster A | required |
| 2 | Janice Johnston | Heather Beasley | 195360 | Compact Cluster A | required |
| 2 | Janice Johnston | Heather Beasley | 3355763 | Legacy Review | prohibited |
| 3 | Upal Saha | Audrey Taylor | 3355763 | Legacy Review | prohibited |
| 3 | Upal Saha | Audrey Taylor | 8387539 | Regional Initiative | provided |
| 4 | Katherine Snyder | Susan Wagner | 8387539 | Regional Initiative | provided |
| 4 | Katherine Snyder | Susan Wagner | comi | Composite Model | provided |

**View `v_assessment_competition_event`**

```sql
CREATE VIEW v_assessment_competition_event AS
SELECT a.assessment_id, a.assessment_type, a.duration_minutes, a.score_weight_percentage, b.competition_event_id AS event_competition_event_id, b.event_id AS event_event_id, b.event_title AS event_event_title
FROM assessments a JOIN competition_events b ON a.competition_event_id = b.competition_event_id;
```

| assessment_id | assessment_type | duration_minutes | score_weight_percentage | event_competition_event_id | event_event_id | event_event_title |
|---|---|---|---|---|---|---|
| 1 | written | 35 | 17.70 | 1 | 2002007020060 | Legacy Standard D |
| 2 | practical | 38 | 22.40 | 2 | 168535 | Regional Framework |
| 3 | written | 41 | 27.10 | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Protocol |
| 4 | practical | 44 | 31.80 | 4 | 1186089 | Integrated Programme A |

**View `v_assessment_competitor_detail`**

```sql
CREATE VIEW v_assessment_competitor_detail AS
SELECT a.assessment_id, a.assessment_type, a.duration_minutes, b.competitor_id AS competitor_competitor_id, b.first_name AS competitor_first_name, b.last_name AS competitor_last_name
FROM assessments a
  JOIN assessments_competitors j ON j.assessment_id = a.assessment_id
  JOIN competitors b ON b.competitor_id = j.competitor_id;
```

| assessment_id | assessment_type | duration_minutes | competitor_competitor_id | competitor_first_name | competitor_last_name |
|---|---|---|---|---|---|
| 1 | written | 35 | 1 | Stephanie Collins | Paul Allen |
| 1 | written | 35 | 2 | Janice Johnston | Heather Beasley |
| 2 | practical | 38 | 2 | Janice Johnston | Heather Beasley |
| 2 | practical | 38 | 3 | Upal Saha | Audrey Taylor |
| 3 | written | 41 | 3 | Upal Saha | Audrey Taylor |
| 3 | written | 41 | 4 | Katherine Snyder | Susan Wagner |
| 4 | practical | 44 | 4 | Katherine Snyder | Susan Wagner |
| 4 | practical | 44 | 1 | Stephanie Collins | Paul Allen |

**View `v_assessment_score_sheet_detail`**

```sql
CREATE VIEW v_assessment_score_sheet_detail AS
SELECT a.assessment_id, a.assessment_type, a.duration_minutes, b.score_sheet_id AS sheet_score_sheet_id, b.score_sheet_version AS sheet_score_sheet_version, b.total_max_points AS sheet_total_max_points
FROM assessments a
  JOIN assessments_sheets j ON j.assessment_id = a.assessment_id
  JOIN score_sheets b ON b.score_sheet_id = j.score_sheet_id;
```

| assessment_id | assessment_type | duration_minutes | sheet_score_sheet_id | sheet_score_sheet_version | sheet_total_max_points |
|---|---|---|---|---|---|
| 1 | written | 35 | 1 | regional-score-36 | 21.45 |
| 1 | written | 35 | 2 | legacy-score-37 | 24.90 |
| 2 | practical | 38 | 2 | legacy-score-37 | 24.90 |
| 2 | practical | 38 | 3 | compact-score-38 | 28.35 |
| 3 | written | 41 | 3 | compact-score-38 | 28.35 |
| 3 | written | 41 | 4 | composite-score-39 | 31.80 |
| 4 | practical | 44 | 4 | composite-score-39 | 31.80 |
| 4 | practical | 44 | 1 | regional-score-36 | 21.45 |

**View `v_tool_competitor_detail`**

```sql
CREATE VIEW v_tool_competitor_detail AS
SELECT a.tool_id, a.tool_name, a.tool_category, b.competitor_id AS competitor_competitor_id, b.first_name AS competitor_first_name, b.last_name AS competitor_last_name
FROM tools a
  JOIN tools_competitors j ON j.tool_id = a.tool_id
  JOIN competitors b ON b.competitor_id = j.competitor_id;
```

| tool_id | tool_name | tool_category | competitor_competitor_id | competitor_first_name | competitor_last_name |
|---|---|---|---|---|---|
| comi | Composite Model | provided | 1 | Stephanie Collins | Paul Allen |
| comi | Composite Model | provided | 2 | Janice Johnston | Heather Beasley |
| 195360 | Compact Cluster A | required | 2 | Janice Johnston | Heather Beasley |
| 195360 | Compact Cluster A | required | 3 | Upal Saha | Audrey Taylor |
| 3355763 | Legacy Review | prohibited | 3 | Upal Saha | Audrey Taylor |
| 3355763 | Legacy Review | prohibited | 4 | Katherine Snyder | Susan Wagner |
| 8387539 | Regional Initiative | provided | 4 | Katherine Snyder | Susan Wagner |
| 8387539 | Regional Initiative | provided | 1 | Stephanie Collins | Paul Allen |

**View `v_tool_assessment`**

```sql
CREATE VIEW v_tool_assessment AS
SELECT a.tool_id, a.tool_name, a.tool_category, a.brand_reference, b.assessment_id AS assessment_assessment_id, b.assessment_type AS assessment_assessment_type, b.duration_minutes AS assessment_duration_minutes
FROM tools a JOIN assessments b ON a.assessment_id = b.assessment_id;
```

| tool_id | tool_name | tool_category | brand_reference | assessment_assessment_id | assessment_assessment_type | assessment_duration_minutes |
|---|---|---|---|---|---|---|
| comi | Composite Model | provided | Interac Association | 1 | written | 35 |
| 195360 | Compact Cluster A | required | Assicurazioni Generali | 2 | practical | 38 |
| 3355763 | Legacy Review | prohibited | Link Title | 3 | written | 41 |
| 8387539 | Regional Initiative | provided | Tattooed Chef Inc. | 4 | practical | 44 |

**View `v_score_sheet_assessment`**

```sql
CREATE VIEW v_score_sheet_assessment AS
SELECT a.score_sheet_id, a.score_sheet_version, a.total_max_points, a.safety_scope_included, b.assessment_id AS assessment_assessment_id, b.assessment_type AS assessment_assessment_type, b.duration_minutes AS assessment_duration_minutes
FROM score_sheets a JOIN assessments b ON a.assessment_id = b.assessment_id;
```

| score_sheet_id | score_sheet_version | total_max_points | safety_scope_included | assessment_assessment_id | assessment_assessment_type | assessment_duration_minutes |
|---|---|---|---|---|---|---|
| 1 | regional-score-36 | 21.45 | false | 1 | written | 35 |
| 2 | legacy-score-37 | 24.90 | true | 2 | practical | 38 |
| 3 | compact-score-38 | 28.35 | false | 3 | written | 41 |
| 4 | composite-score-39 | 31.80 | true | 4 | practical | 44 |

**View `v_score_sheet_competitor_detail`**

```sql
CREATE VIEW v_score_sheet_competitor_detail AS
SELECT a.score_sheet_id, a.score_sheet_version, a.total_max_points, b.competitor_id AS competitor_competitor_id, b.first_name AS competitor_first_name, b.last_name AS competitor_last_name
FROM score_sheets a
  JOIN sheets_competitors j ON j.score_sheet_id = a.score_sheet_id
  JOIN competitors b ON b.competitor_id = j.competitor_id;
```

| score_sheet_id | score_sheet_version | total_max_points | competitor_competitor_id | competitor_first_name | competitor_last_name |
|---|---|---|---|---|---|
| 1 | regional-score-36 | 21.45 | 1 | Stephanie Collins | Paul Allen |
| 1 | regional-score-36 | 21.45 | 2 | Janice Johnston | Heather Beasley |
| 2 | legacy-score-37 | 24.90 | 2 | Janice Johnston | Heather Beasley |
| 2 | legacy-score-37 | 24.90 | 3 | Upal Saha | Audrey Taylor |
| 3 | compact-score-38 | 28.35 | 3 | Upal Saha | Audrey Taylor |
| 3 | compact-score-38 | 28.35 | 4 | Katherine Snyder | Susan Wagner |
| 4 | composite-score-39 | 31.80 | 4 | Katherine Snyder | Susan Wagner |
| 4 | composite-score-39 | 31.80 | 1 | Stephanie Collins | Paul Allen |

**View `v_score_sheet_competition_event`**

```sql
CREATE VIEW v_score_sheet_competition_event AS
SELECT a.score_sheet_id, a.score_sheet_version, a.total_max_points, a.safety_scope_included, b.competition_event_id AS event_competition_event_id, b.event_id AS event_event_id, b.event_title AS event_event_title
FROM score_sheets a JOIN competition_events b ON a.competition_event_id = b.competition_event_id;
```

| score_sheet_id | score_sheet_version | total_max_points | safety_scope_included | event_competition_event_id | event_event_id | event_event_title |
|---|---|---|---|---|---|---|
| 1 | regional-score-36 | 21.45 | false | 1 | 2002007020060 | Legacy Standard D |
| 2 | legacy-score-37 | 24.90 | true | 2 | 168535 | Regional Framework |
| 3 | compact-score-38 | 28.35 | false | 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Protocol |
| 4 | composite-score-39 | 31.80 | true | 4 | 1186089 | Integrated Programme A |
