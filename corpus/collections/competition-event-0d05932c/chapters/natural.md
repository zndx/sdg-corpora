## Competition Management and Assessment Architecture

Skills competitions require a structured framework for tracking participants, evaluating performance, and managing the logistics of each event. The system records every dimension of this process: the events themselves, the competitors who enter them, the assessments that measure their abilities, the tools they use, and the score sheets that formalize results. Each entity carries its own lifecycle, and the relationships between them form a coherent picture of how a competition operates from registration through final scoring. The following sections describe the data model that supports this workflow, drawing on concrete records to illustrate how the pieces fit together in practice.

**Table `competition_events`**

| competition_event_id | event_id | event_title | event_year | event_status | registration_deadline | total_score_weight |
|---|---|---|---|---|---|---|
| 1 | 2002007020060 | Legacy Standard D | 35 | scheduled | 2023-02-05T13:15:00 | 0.0010595424921752 |
| 2 | 168535 | Regional Framework | 45 | ongoing | 2024-07-16T20:32:00 | 0.0030724112684334 |
| 3 | ab8e1d18-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Protocol | 55 | completed | 2025-12-27T03:49:00 | 0.01999998 |
| 4 | 1186089 | Integrated Programme A | 65 | cancelled | 2022-05-11T10:06:00 | 0.6000001 |

Competition events serve as the primary organizational container for all activity. Each event carries a unique identifier, a human-readable title, and a year designation that helps distinguish iterations across time. The status field tracks where an event sits in its lifecycle: event 1, "Legacy Standard D," is marked as scheduled with a registration deadline of 2023-02-05, while event 2, "Regional Framework," is currently ongoing. Event 3, "Seasonal Protocol," has completed its run, and event 4, "Integrated Programme A," was cancelled before proceeding. The `total_score_weight` column assigns a proportional weight to each event's contribution in aggregate scoring calculations, ranging from a negligible 0.0010595424921752 for the first event to a dominant 0.6000001 for the fourth. These weights ensure that higher-stakes events exert the appropriate influence on overall standings.

**Table `competitors`**

| competitor_id | first_name | last_name | apprentice_level | registration_status | contact_email | contact_phone | competition_event_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Stephanie Collins | Paul Allen | first-year | registered | Christopher Wilson | Joe Tsai | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Janice Johnston | Heather Beasley | second-year | qualified | Charles Larsen | Stephanie Collins | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Upal Saha | Audrey Taylor | third-year | disqualified | Mary Alvarez | Tasha Rodriguez | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Katherine Snyder | Susan Wagner | journeyman | completed | April Snyder | Walter Pratt | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Competitors are the individuals who register for and participate in events. The record captures their full name, apprentice level, and registration status, along with contact information for communication. Stephanie Collins (registered as competitor 1) is a first-year apprentice whose registration status is "registered," while Janice Johnston (competitor 2) is a second-year apprentice marked as "qualified." Upal Saha (competitor 3) is a third-year apprentice with a "disqualified" status, and Katherine Snyder (competitor 4) is a journeyman whose status reads "completed." Each competitor is linked to a specific competition event through the `competition_event_id` column, anchoring them to the event they are participating in. The `created_at` and `updated_at` timestamps provide an audit trail of when each record was first entered and last modified.

**Table `assessments`**

| assessment_id | assessment_type | duration_minutes | score_weight_percentage | max_score | assessment_status | competition_event_id |
|---|---|---|---|---|---|---|
| 1 | written | 35 | 17.70 | 7.70 | pending | 1 |
| 2 | practical | 38 | 22.40 | 9.40 | in-progress | 2 |
| 3 | written | 41 | 27.10 | 11.10 | graded | 3 |
| 4 | practical | 44 | 31.80 | 12.80 | archived | 4 |

Assessments define the evaluation methods applied within each competition event. They come in two types: written and practical. Assessment 1 is a written test lasting 35 minutes with a score weight of 17.70 percent and a maximum score of 7.70 points; it is currently in "pending" status. Assessment 2 is a practical evaluation lasting 38 minutes, weighted at 22.40 percent with a maximum of 9.40 points, and is "in-progress." Assessment 3 is another written test, this one lasting 41 minutes, weighted at 27.10 percent with a maximum of 11.10 points, and has been "graded." Assessment 4 is a practical evaluation lasting 44 minutes, weighted at 31.80 percent with a maximum of 12.80 points, and is "archived." Each assessment is tied to a competition event, ensuring that evaluations are scoped to the correct event.

**Table `tools`**

| tool_id | tool_name | tool_category | brand_reference | specification | tool_status | assessment_id |
|---|---|---|---|---|---|---|
| comi | Composite Model | provided | Interac Association | compact-specific-86 | available | 1 |
| 195360 | Compact Cluster A | required | Assicurazioni Generali | composite-specific-87 | inspected | 2 |
| 3355763 | Legacy Review | prohibited | Link Title | primary-specific-88 | used | 3 |
| 8387539 | Regional Initiative | provided | Tattooed Chef Inc. | adaptive-specific-89 | missing | 4 |

Tools represent the equipment and materials used during assessments. Each tool record includes a name, category, brand reference, specification, and current status. Tool "comi" (Composite Model) is categorized as "provided" by the Interac Association, has the specification "compact-specific-86," and is currently "available." Tool 195360 (Compact Cluster A) is a "required" item from Assicurazioni Generali with specification "composite-specific-87," status "inspected." Tool 3355763 (Legacy Review) is a "prohibited" item from Link Title with specification "primary-specific-88," status "used." Tool 8387539 (Regional Initiative) is a "provided" item from Tattooed Chef Inc. with specification "adaptive-specific-89," status "missing." Every tool is associated with an assessment, linking the equipment to the evaluation it supports.

**Table `score_sheets`**

| score_sheet_id | score_sheet_version | total_max_points | safety_scope_included | is_sample | last_updated | assessment_id | competition_event_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | regional-score-36 | 21.45 | false | true | 2023-06-17T17:27:00 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | legacy-score-37 | 24.90 | true | false | 2024-11-01T00:44:00 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | compact-score-38 | 28.35 | false | true | 2025-04-12T07:01:00 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | composite-score-39 | 31.80 | true | false | 2022-09-23T14:18:00 | 4 | 4 | 2025-04-16 09:14:00 |

Score sheets formalize the scoring structure for assessments and events. Each sheet has a version identifier, a total maximum point value, and flags indicating whether safety scope is included and whether the sheet is a sample. Sheet 1 (version "regional-score-36") has a total of 21.45 maximum points, excludes safety scope, is marked as a sample, and was last updated on 2023-06-17. Sheet 2 (version "legacy-score-37") totals 24.90 points, includes safety scope, is not a sample, and was last updated on 2024-11-01. Sheet 3 (version "compact-score-38") totals 28.35 points, excludes safety scope, is a sample, and was last updated on 2025-04-12. Sheet 4 (version "composite-score-39") totals 31.80 points, includes safety scope, is not a sample, and was last updated on 2022-09-23. Each score sheet is linked to both an assessment and a competition event, creating a three-way connection between scoring structure, evaluation method, and event context.

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

The `events_competitors` table establishes which competitors are enrolled in which competition events. This many-to-many relationship allows a single competitor to participate in multiple events and a single event to host multiple competitors. The data shows competitor 1 enrolled in events 1 and 4, competitor 2 in events 1 and 2, competitor 3 in events 2 and 3, and competitor 4 in events 3 and 4. This cross-enrollment pattern reflects how competitors typically progress through a series of events rather than participating in just one.

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

The `events_assessments` table links assessments to the competition events they belong to. This ensures that every evaluation is scoped to the correct event context. The relationship guarantees that when retrieving all assessments for a given event, the system returns only those assessments that are officially part of that event's program.

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

The `events_sheets` table connects score sheets to competition events. This relationship ensures that score sheets are associated with the correct event, allowing the system to retrieve all scoring documents relevant to a particular competition.

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

The `competitors_sheets` table records which competitors are associated with which score sheets. This relationship enables the system to track which competitors have been assigned or reviewed specific score sheets, supporting audit and verification workflows.

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

The `competitors_tools` table links competitors to the tools they use or are assigned. This relationship supports equipment tracking, ensuring that each competitor's tool usage is documented and can be audited against assessment requirements.

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

The `assessments_competitors` table records which competitors participate in which assessments. This relationship is fundamental to the scoring pipeline: it connects the evaluation method to the individual being evaluated, enabling the system to track which competitor completed which assessment and when.

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

The `assessments_sheets` table links assessments to score sheets. This relationship ensures that each assessment has an associated scoring structure, allowing the system to map raw assessment results to the correct scoring framework.

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

The `tools_competitors` table records the relationship between tools and competitors. This supports equipment accountability, ensuring that each tool's usage can be traced back to the competitor who used it during an assessment.

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

The `sheets_competitors` table links score sheets to competitors. This relationship enables the tracking of which competitors have been evaluated using which score sheet versions, supporting version control and audit trails for scoring accuracy.

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

The view `v_competition_event_competitor_detail` joins competition events with competitors to produce a detailed record of each competitor's participation in each event. This view answers the question: "Who is competing in which event, and what are the event's key parameters?" For example, the view would show competitor 1 (Stephanie Collins, first-year apprentice) participating in event 1 (Legacy Standard D, status scheduled), providing a complete picture of the participant's context within the event.

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

The view `v_competition_event_assessment_detail` joins competition events with assessments to produce a detailed record of each assessment within each event. This view answers: "What assessments are part of this event, and what are their parameters?" For instance, it would show event 1 (Legacy Standard D) containing assessment 1 (written, 35 minutes, 17.70 percent weight, pending status), giving event organizers a clear view of the evaluation schedule.

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

The view `v_competition_event_score_sheet_detail` joins competition events with score sheets to produce a detailed record of each score sheet within each event. This view answers: "What scoring structures are available for this event?" For example, it would show event 1 (Legacy Standard D) with score sheet 1 (version regional-score-36, 21.45 maximum points, safety scope excluded, sample flag set), providing a complete view of the scoring framework.

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

The view `v_competitor_competition_event` joins competitors with competition events to produce a detailed record of each competitor's event participation. This view answers: "Which events is this competitor enrolled in, and what are the event details?" For instance, it would show competitor 1 (Stephanie Collins) enrolled in event 1 (Legacy Standard D, year 35, scheduled status) and event 4 (Integrated Programme A, year 65, cancelled status), giving a complete picture of the competitor's event history.

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

The view `v_competitor_score_sheet_detail` joins competitors with score sheets to produce a detailed record of each score sheet associated with a competitor. This view answers: "Which score sheets have been used to evaluate this competitor?" For example, it would show competitor 1 (Stephanie Collins) associated with score sheet 1 (version regional-score-36, 21.45 maximum points), providing a clear link between the competitor and their scoring documentation.

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

The view `v_competitor_tool_detail` joins competitors with tools to produce a detailed record of each tool associated with a competitor. This view answers: "Which tools has this competitor used or been assigned?" For instance, it would show competitor 1 (Stephanie Collins) associated with tool "comi" (Composite Model, provided by Interac Association, status available), supporting equipment accountability.

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

The view `v_assessment_competition_event` joins assessments with competition events to produce a detailed record of each assessment within its event context. This view answers: "Which event does this assessment belong to, and what are the event's parameters?" For example, it would show assessment 1 (written, 35 minutes, pending) belonging to event 1 (Legacy Standard D, year 35, scheduled), providing a complete view of the assessment's event context.

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

The view `v_assessment_competitor_detail` joins assessments with competitors to produce a detailed record of each competitor's participation in each assessment. This view answers: "Which competitors completed which assessments?" For instance, it would show competitor 1 (Stephanie Collins) participating in assessment 1 (written, 35 minutes, 17.70 percent weight), providing a clear link between the participant and the evaluation they underwent.

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

The view `v_assessment_score_sheet_detail` joins assessments with score sheets to produce a detailed record of each score sheet associated with an assessment. This view answers: "Which score sheet is used for this assessment?" For example, it would show assessment 1 (written, 35 minutes) associated with score sheet 1 (version regional-score-36, 21.45 maximum points), providing a clear link between the evaluation method and its scoring framework.

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

The view `v_tool_competitor_detail` joins tools with competitors to produce a detailed record of each competitor's tool usage. This view answers: "Which competitor used which tool, and what are the tool's specifications?" For instance, it would show competitor 1 (Stephanie Collins) using tool "comi" (Composite Model, provided by Interac Association, specification compact-specific-86, status available), supporting equipment tracking and accountability.

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

The view `v_tool_assessment` joins tools with assessments to produce a detailed record of each tool within its assessment context. This view answers: "Which assessment uses this tool, and what are the assessment's parameters?" For example, it would show tool "comi" (Composite Model, available) associated with assessment 1 (written, 35 minutes, 17.70 percent weight, pending), providing a complete view of the tool's evaluation context.

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

The view `v_score_sheet_assessment` joins score sheets with assessments to produce a detailed record of each score sheet within its assessment context. This view answers: "Which assessment does this score sheet support, and what are the assessment's parameters?" For instance, it would show score sheet 1 (version regional-score-36, 21.45 maximum points) supporting assessment 1 (written, 35 minutes, 17.70 percent weight), providing a clear link between the scoring structure and the evaluation it supports.

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

The view `v_score_sheet_competitor_detail` joins score sheets with competitors to produce a detailed record of each competitor's association with each score sheet. This view answers: "Which competitor was evaluated using which score sheet?" For example, it would show competitor 1 (Stephanie Collins) associated with score sheet 1 (version regional-score-36, 21.45 maximum points, sample flag set), providing a clear link between the participant and their scoring documentation.

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

The view `v_score_sheet_competition_event` joins score sheets with competition events to produce a detailed record of each score sheet within its event context. This view answers: "Which event does this score sheet belong to, and what are the event's parameters?" For instance, it would show score sheet 1 (version regional-score-36, 21.45 maximum points) belonging to event 1 (Legacy Standard D, year 35, scheduled status), providing a complete view of the score sheet's event context.

## Synthesis

The competition management system organizes its data around five core entities—events, competitors, assessments, tools, and score sheets—each carrying its own set of attributes and lifecycle states. The relationship tables between them form a dense network of associations: competitors enroll in events, assessments are scoped to events, tools are assigned to assessments, and score sheets provide the scoring framework for both assessments and events. The detail views synthesize these relationships into readable records that answer specific operational questions—who is in which event, which assessment supports which score sheet, which tool was used by which competitor—enabling administrators to track every dimension of the competition from registration through final scoring. Together, these tables and views form a coherent data model that supports the full lifecycle of a skills competition.