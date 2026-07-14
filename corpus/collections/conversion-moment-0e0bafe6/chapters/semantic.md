The domain under examination is a theological data model that captures the interplay between spiritual transformation events, the practitioners who facilitate them, the scriptural texts that ground them, the biblical figures who exemplify them, and the spiritual conditions they address. At its core, the model treats a conversion moment as the central event—a timestamped encounter with an impact description and a response action—around which all other entities orbit. Each conversion moment is associated with a divine physician, a scriptural reference, a biblical character, and a spiritual need, forming a tightly coupled star schema where the foreign keys in every table point back to the event. The following sections walk through the base tables, their columns and cardinality-bounded relationships, and then the materialized views that reconstruct domain facts from the normalized tables.

**Table `conversion_moments`**

| id | moment_id | encounter_date | impact_description | response_action | is_dramatic | physician_id | reference_id |
|---|---|---|---|---|---|---|---|
| 100 | d9774674-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-16T09:51:00 | Regional Series | primary-response-46 | false | 5006449 | 2986245 |
| 101 | ChIJATGfojhu5kcR-WS-zZ5HX98 | 2024-03-27T16:08:00 | Seasonal Assessment D | adaptive-response-47 | true | 338540 | 4277024 |
| 102 | 4277015 | 2025-08-11T23:25:00 | Integrated Survey | distributed-response-48 | false | default_chart_a_tax_5 | 195366 |
| 103 | 605957 | 2022-01-22T06:42:00 | Extended Corridor | baseline-response-49 | true | 103195 | gd_acc_260002 |

The `conversion_moments` table is the anchor of the entire model. Its primary key `id` is a surrogate integer (values such as `100`, `101`, `102`, `103`), while the `moment_id` column carries a UUID or external identifier—`d9774674-9bac-11eb-a8a2-19ed5c03f8d3` for the first row, `ChIJATGfojhu5kcR-WS-zZ5HX98` for the second—enabling cross-system correlation. The `encounter_date` column stores an ISO-8601 timestamp (`2023-10-16T09:51:00`, `2024-03-27T16:08:00`), and `impact_description` holds a short free-text label such as `Regional Series` or `Seasonal Assessment D`. The `response_action` column is a categorical field (`primary-response-46`, `adaptive-response-47`, `distributed-response-48`, `baseline-response-49`) that classifies the type of response elicited by the encounter. A boolean `is_dramatic` flag distinguishes high-impact events (`true` for rows `101` and `103`) from routine ones. Two foreign keys, `physician_id` and `reference_id`, bind each conversion moment to a row in `divine_physicians` and `scriptural_references` respectively. The `physician_id` values (`5006449`, `338540`, `default_chart_a_tax_5`, `103195`) and `reference_id` values (`2986245`, `4277024`, `195366`, `gd_acc_260002`) are the join keys that propagate the event outward to the other four base tables.

**Table `scriptural_references`**

| reference_id | book_name | chapter_number | verse_start | verse_end | text_excerpt | biblical_character_id | conversion_moment_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 2986245 | Compact Corridor | 49 | 35 | 21 | adaptive-text-71 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 4277024 | Legacy Series | 60 | 38 | 30 | distributed-text-72 | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 195366 | Regional Assessment A | 71 | 41 | 39 | baseline-text-73 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| gd_acc_260002 | Seasonal Survey | 82 | 44 | 48 | pilot-text-74 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `scriptural_references` table stores the textual anchors of conversion events. Its primary key `reference_id` is a string—`2986245`, `4277024`, `195366`, `gd_acc_260002`—that doubles as a foreign key into `conversion_moments.reference_id`. The columns `book_name` (`Compact Corridor`, `Legacy Series`, `Regional Assessment A`, `Seasonal Survey`), `chapter_number` (`49`, `60`, `71`, `82`), `verse_start` (`35`, `38`, `41`, `44`), and `verse_end` (`21`, `30`, `39`, `48`) define a precise citation within a book. The `text_excerpt` column carries a short passage label (`adaptive-text-71`, `distributed-text-72`, `baseline-text-73`, `pilot-text-74`). Two additional foreign keys, `biblical_character_id` and `conversion_moment_id`, link the reference to a biblical character and the originating conversion moment. The `created_at` and `updated_at` timestamps (`2025-01-01 00:14:00` through `2025-04-23 15:41:00`) provide an audit trail. The cardinality here is one-to-one with conversion moments: each reference is tied to exactly one event, and each event has exactly one reference.

**Table `biblical_characters`**

| biblical_character_id | character_id | name | role | is_disciple | occupation | physician_id | reference_id |
|---|---|---|---|---|---|---|---|
| 1 | 7021001070170 | Extended Review | pilot-role-20 | true | legacy-occupati-37 | 5006449 | 2986245 |
| 2 | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Pilot Initiative A | extended-role-21 | false | compact-occupati-38 | 338540 | 4277024 |
| 3 | 4793488 | Baseline Model | integrated-role-22 | true | composite-occupati-39 | default_chart_a_tax_5 | 195366 |
| 4 | id_31 | Distributed Cluster | seasonal-role-23 | false | primary-occupati-40 | 103195 | gd_acc_260002 |

The `biblical_characters` table models the human (or semi-divine) agents who appear in scriptural narratives. Its surrogate primary key `biblical_character_id` (`1`, `2`, `3`, `4`) is an integer, while the `character_id` column carries a secondary identifier (`7021001070170`, `a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0`, `4793488`, `id_31`). The `name` column holds descriptive labels (`Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`), and `role` is a categorical field (`pilot-role-20`, `extended-role-21`, `integrated-role-22`, `seasonal-role-23`). The boolean `is_disciple` flag (`true` for characters `1` and `3`, `false` for `2` and `4`) distinguishes disciples from other figures. The `occupation` column (`legacy-occupati-37`, `compact-occupati-38`, `composite-occupati-39`, `primary-occupati-40`) records the character's trade or function. Two foreign keys, `physician_id` and `reference_id`, link each character to a divine physician and a scriptural reference, creating a bidirectional bridge between the physician and reference tables through the character entity.

**Table `divine_physicians`**

| physician_id | title | heals_spiritual_sickness | calls_all_men | conversion_moment_id | biblical_character_id |
|---|---|---|---|---|---|
| 5006449 | Compact Initiative | false | true | 100 | 1 |
| 338540 | Legacy Model | true | false | 101 | 2 |
| default_chart_a_tax_5 | Regional Cluster A | false | true | 102 | 3 |
| 103195 | Seasonal Review | true | false | 103 | 4 |

The `divine_physicians` table represents the practitioners who facilitate spiritual healing. Its primary key `physician_id` (`5006449`, `338540`, `default_chart_a_tax_5`, `103195`) is a string that also appears as a foreign key in `conversion_moments`, `biblical_characters`, and `spiritual_needs`. The `title` column (`Compact Initiative`, `Legacy Model`, `Regional Cluster A`, `Seasonal Review`) provides a human-readable name. Two boolean columns, `heals_spiritual_sickness` and `calls_all_men`, capture theological attributes: `heals_spiritual_sickness` is `true` for physicians `338540` and `103195` but `false` for `5006449` and `default_chart_a_tax_5`; `calls_all_men` is `true` for `5006449` and `default_chart_a_tax_5` but `false` for the other two. Two foreign keys, `conversion_moment_id` and `biblical_character_id`, bind each physician to a conversion event and a biblical character, completing the cycle of relationships that radiate from the central event.

**Table `spiritual_needs`**

| need_id | need_type | severity_level | is_addressed_by_physician | requires_conversion | physician_id | conversion_moment_id |
|---|---|---|---|---|---|---|
| 10966213 | pilot-need-62 | 29 | false | false | 5006449 | 100 |
| 619 | extended-need-63 | 40 | true | true | 338540 | 101 |
| 92841674-9bad-11eb-a8a2-19ed5c03f8d3 | integrated-need-64 | 51 | false | false | default_chart_a_tax_5 | 102 |
| 15426389 | seasonal-need-65 | 62 | true | true | 103195 | 103 |

The `spiritual_needs` table captures the conditions that conversion moments and divine physicians address. Its primary key `need_id` is a string (`10966213`, `619`, `92841674-9bad-11eb-a8a2-19ed5c03f8d3`, `15426389`), and `need_type` is a categorical field (`pilot-need-62`, `extended-need-63`, `integrated-need-64`, `seasonal-need-65`). The `severity_level` column stores an integer (`29`, `40`, `51`, `62`), with higher values indicating greater severity. Two boolean flags, `is_addressed_by_physician` and `requires_conversion`, are both `true` for needs `619` and `15426389` but `false` for `10966213` and `92841674-9bad-11eb-a8a2-19ed5c03f8d3`. The foreign keys `physician_id` and `conversion_moment_id` link each need to a divine physician and a conversion moment, mirroring the relationship structure found in the other tables and reinforcing the star-schema topology.

With the base tables established, the model materializes a set of denormalized views that join pairs of tables to answer specific domain questions. Each view reconstructs a fact that would otherwise require an explicit join query.

**View `v_conversion_moment_divine_physician`**

```sql
CREATE VIEW v_conversion_moment_divine_physician AS
SELECT a.id, a.moment_id, a.encounter_date, a.impact_description, b.physician_id AS physician_physician_id, b.title AS physician_title, b.heals_spiritual_sickness AS physician_heals_spiritual_sickness
FROM conversion_moments a JOIN divine_physicians b ON a.physician_id = b.physician_id;
```

| id | moment_id | encounter_date | impact_description | physician_physician_id | physician_title | physician_heals_spiritual_sickness |
|---|---|---|---|---|---|---|
| 100 | d9774674-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-16T09:51:00 | Regional Series | 5006449 | Compact Initiative | false |
| 101 | ChIJATGfojhu5kcR-WS-zZ5HX98 | 2024-03-27T16:08:00 | Seasonal Assessment D | 338540 | Legacy Model | true |
| 102 | 4277015 | 2025-08-11T23:25:00 | Integrated Survey | default_chart_a_tax_5 | Regional Cluster A | false |
| 103 | 605957 | 2022-01-22T06:42:00 | Extended Corridor | 103195 | Seasonal Review | true |

The view `v_conversion_moment_divine_physician` joins `conversion_moments` to `divine_physicians` on `physician_id`, producing a flat row that pairs each conversion event with the physician who facilitated it. The view selects `id`, `moment_id`, `encounter_date`, and `impact_description` from the conversion moment side, and `physician_id`, `title`, and `heals_spiritual_sickness` from the physician side, aliasing the physician columns with the `physician_` prefix to avoid ambiguity. Reading the first row: conversion moment `100` (`d9774674-9bac-11eb-a8a2-19ed5c03f8d3`, encountered on `2023-10-16T09:51:00`, described as `Regional Series`) is linked to physician `5006449` (`Compact Initiative`, who does not `heals_spiritual_sickness`). The second row pairs moment `101` (`Seasonal Assessment D`, `2024-03-27T16:08:00`) with physician `338540` (`Legacy Model`, who does heal spiritual sickness). This view answers the question: "Which physician was associated with each conversion moment, and what are that physician's healing attributes?"

**View `v_conversion_moment_scriptural_reference`**

```sql
CREATE VIEW v_conversion_moment_scriptural_reference AS
SELECT a.id, a.moment_id, a.encounter_date, a.impact_description, b.reference_id AS reference_reference_id, b.book_name AS reference_book_name, b.chapter_number AS reference_chapter_number
FROM conversion_moments a JOIN scriptural_references b ON a.reference_id = b.reference_id;
```

| id | moment_id | encounter_date | impact_description | reference_reference_id | reference_book_name | reference_chapter_number |
|---|---|---|---|---|---|---|
| 100 | d9774674-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-16T09:51:00 | Regional Series | 2986245 | Compact Corridor | 49 |
| 101 | ChIJATGfojhu5kcR-WS-zZ5HX98 | 2024-03-27T16:08:00 | Seasonal Assessment D | 4277024 | Legacy Series | 60 |
| 102 | 4277015 | 2025-08-11T23:25:00 | Integrated Survey | 195366 | Regional Assessment A | 71 |
| 103 | 605957 | 2022-01-22T06:42:00 | Extended Corridor | gd_acc_260002 | Seasonal Survey | 82 |

This view joins `conversion_moments` to `scriptural_references` on `reference_id`, producing a flat row that pairs each conversion event with its grounding scriptural text. The join reconstructs the fact that a particular moment was anchored in a specific book, chapter, and verse range. For example, moment `100` (`Regional Series`) is paired with reference `2986245` from book `Compact Corridor`, chapter `49`, verses `35` through `21`, with excerpt `adaptive-text-71`. The view answers: "What scriptural passage underlies each conversion moment?"

**View `v_scriptural_reference_biblical_character`**

```sql
CREATE VIEW v_scriptural_reference_biblical_character AS
SELECT a.reference_id, a.book_name, a.chapter_number, a.verse_start, b.biblical_character_id AS character_biblical_character_id, b.character_id AS character_character_id, b.name AS character_name
FROM scriptural_references a JOIN biblical_characters b ON a.biblical_character_id = b.biblical_character_id;
```

| reference_id | book_name | chapter_number | verse_start | character_biblical_character_id | character_character_id | character_name |
|---|---|---|---|---|---|---|
| 2986245 | Compact Corridor | 49 | 35 | 1 | 7021001070170 | Extended Review |
| 4277024 | Legacy Series | 60 | 38 | 2 | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Pilot Initiative A |
| 195366 | Regional Assessment A | 71 | 41 | 3 | 4793488 | Baseline Model |
| gd_acc_260002 | Seasonal Survey | 82 | 44 | 4 | id_31 | Distributed Cluster |

The view `v_scriptural_reference_biblical_character` joins `scriptural_references` to `biblical_characters` on `biblical_character_id`, producing a row that pairs each scriptural reference with the biblical character it invokes. Reference `2986245` (`Compact Corridor`, chapter `49`) is linked to character `1` (`Extended Review`, a disciple with occupation `legacy-occupati-37`). Reference `4277024` (`Legacy Series`, chapter `60`) is linked to character `2` (`Pilot Initiative A`, not a disciple, occupation `compact-occupati-38`). This view answers: "Which biblical character is associated with each scriptural reference?"

**View `v_scriptural_reference_conversion_moment`**

```sql
CREATE VIEW v_scriptural_reference_conversion_moment AS
SELECT a.reference_id, a.book_name, a.chapter_number, a.verse_start, b.id AS moment_id, b.moment_id AS moment_moment_id, b.encounter_date AS moment_encounter_date
FROM scriptural_references a JOIN conversion_moments b ON a.conversion_moment_id = b.id;
```

| reference_id | book_name | chapter_number | verse_start | moment_id | moment_moment_id | moment_encounter_date |
|---|---|---|---|---|---|---|
| 2986245 | Compact Corridor | 49 | 35 | 100 | d9774674-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-16T09:51:00 |
| 4277024 | Legacy Series | 60 | 38 | 101 | ChIJATGfojhu5kcR-WS-zZ5HX98 | 2024-03-27T16:08:00 |
| 195366 | Regional Assessment A | 71 | 41 | 102 | 4277015 | 2025-08-11T23:25:00 |
| gd_acc_260002 | Seasonal Survey | 82 | 44 | 103 | 605957 | 2022-01-22T06:42:00 |

This view joins `scriptural_references` to `conversion_moments` on `conversion_moment_id`, producing a row that pairs each scriptural reference with the conversion moment it grounds. Reference `2986245` is linked to moment `100` (`Regional Series`, `2023-10-16T09:51:00`), and reference `4277024` is linked to moment `101` (`Seasonal Assessment D`, `2024-03-27T16:08:00`). The view answers the inverse of `v_conversion_moment_scriptural_reference`: "Which conversion moment does each scriptural reference support?"

**View `v_biblical_character_divine_physician`**

```sql
CREATE VIEW v_biblical_character_divine_physician AS
SELECT a.biblical_character_id, a.character_id, a.name, a.role, b.physician_id AS physician_physician_id, b.title AS physician_title, b.heals_spiritual_sickness AS physician_heals_spiritual_sickness
FROM biblical_characters a JOIN divine_physicians b ON a.physician_id = b.physician_id;
```

| biblical_character_id | character_id | name | role | physician_physician_id | physician_title | physician_heals_spiritual_sickness |
|---|---|---|---|---|---|---|
| 1 | 7021001070170 | Extended Review | pilot-role-20 | 5006449 | Compact Initiative | false |
| 2 | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Pilot Initiative A | extended-role-21 | 338540 | Legacy Model | true |
| 3 | 4793488 | Baseline Model | integrated-role-22 | default_chart_a_tax_5 | Regional Cluster A | false |
| 4 | id_31 | Distributed Cluster | seasonal-role-23 | 103195 | Seasonal Review | true |

The view `v_biblical_character_divine_physician` joins `biblical_characters` to `divine_physicians` on `physician_id`, producing a row that pairs each biblical character with the physician who is associated with them. Character `1` (`Extended Review`, a disciple) is linked to physician `5006449` (`Compact Initiative`, who does not heal spiritual sickness). Character `2` (`Pilot Initiative A`, not a disciple) is linked to physician `338540` (`Legacy Model`, who does heal spiritual sickness). This view answers: "Which divine physician is associated with each biblical character?"

**View `v_biblical_character_scriptural_reference`**

```sql
CREATE VIEW v_biblical_character_scriptural_reference AS
SELECT a.biblical_character_id, a.character_id, a.name, a.role, b.reference_id AS reference_reference_id, b.book_name AS reference_book_name, b.chapter_number AS reference_chapter_number
FROM biblical_characters a JOIN scriptural_references b ON a.reference_id = b.reference_id;
```

| biblical_character_id | character_id | name | role | reference_reference_id | reference_book_name | reference_chapter_number |
|---|---|---|---|---|---|---|
| 1 | 7021001070170 | Extended Review | pilot-role-20 | 2986245 | Compact Corridor | 49 |
| 2 | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Pilot Initiative A | extended-role-21 | 4277024 | Legacy Series | 60 |
| 3 | 4793488 | Baseline Model | integrated-role-22 | 195366 | Regional Assessment A | 71 |
| 4 | id_31 | Distributed Cluster | seasonal-role-23 | gd_acc_260002 | Seasonal Survey | 82 |

This view joins `biblical_characters` to `scriptural_references` on `reference_id`, producing a row that pairs each biblical character with the scriptural reference they appear in. Character `1` (`Extended Review`) is linked to reference `2986245` (`Compact Corridor`, chapter `49`), and character `2` (`Pilot Initiative A`) is linked to reference `4277024` (`Legacy Series`, chapter `60`). The view answers: "Which scriptural reference is associated with each biblical character?"

**View `v_divine_physician_conversion_moment`**

```sql
CREATE VIEW v_divine_physician_conversion_moment AS
SELECT a.physician_id, a.title, a.heals_spiritual_sickness, a.calls_all_men, b.id AS moment_id, b.moment_id AS moment_moment_id, b.encounter_date AS moment_encounter_date
FROM divine_physicians a JOIN conversion_moments b ON a.conversion_moment_id = b.id;
```

| physician_id | title | heals_spiritual_sickness | calls_all_men | moment_id | moment_moment_id | moment_encounter_date |
|---|---|---|---|---|---|---|
| 5006449 | Compact Initiative | false | true | 100 | d9774674-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-16T09:51:00 |
| 338540 | Legacy Model | true | false | 101 | ChIJATGfojhu5kcR-WS-zZ5HX98 | 2024-03-27T16:08:00 |
| default_chart_a_tax_5 | Regional Cluster A | false | true | 102 | 4277015 | 2025-08-11T23:25:00 |
| 103195 | Seasonal Review | true | false | 103 | 605957 | 2022-01-22T06:42:00 |

The view `v_divine_physician_conversion_moment` joins `divine_physicians` to `conversion_moments` on `conversion_moment_id`, producing a row that pairs each physician with the conversion moment they facilitated. Physician `5006449` (`Compact Initiative`) is linked to moment `100` (`Regional Series`, `2023-10-16T09:51:00`), and physician `338540` (`Legacy Model`) is linked to moment `101` (`Seasonal Assessment D`, `2024-03-27T16:08:00`). This view answers the inverse of `v_conversion_moment_divine_physician`: "Which conversion moment is associated with each divine physician?"

**View `v_divine_physician_biblical_character`**

```sql
CREATE VIEW v_divine_physician_biblical_character AS
SELECT a.physician_id, a.title, a.heals_spiritual_sickness, a.calls_all_men, b.biblical_character_id AS character_biblical_character_id, b.character_id AS character_character_id, b.name AS character_name
FROM divine_physicians a JOIN biblical_characters b ON a.biblical_character_id = b.biblical_character_id;
```

| physician_id | title | heals_spiritual_sickness | calls_all_men | character_biblical_character_id | character_character_id | character_name |
|---|---|---|---|---|---|---|
| 5006449 | Compact Initiative | false | true | 1 | 7021001070170 | Extended Review |
| 338540 | Legacy Model | true | false | 2 | a0f8eb4e-8fcd-11eb-924d-9cd76263cbd0 | Pilot Initiative A |
| default_chart_a_tax_5 | Regional Cluster A | false | true | 3 | 4793488 | Baseline Model |
| 103195 | Seasonal Review | true | false | 4 | id_31 | Distributed Cluster |

This view joins `divine_physicians` to `biblical_characters` on `biblical_character_id`, producing a row that pairs each physician with the biblical character they are associated with. Physician `5006449` (`Compact Initiative`) is linked to character `1` (`Extended Review`, a disciple), and physician `338540` (`Legacy Model`) is linked to character `2` (`Pilot Initiative A`, not a disciple). The view answers: "Which biblical character is associated with each divine physician?"

**View `v_spiritual_need_divine_physician`**

```sql
CREATE VIEW v_spiritual_need_divine_physician AS
SELECT a.need_id, a.need_type, a.severity_level, a.is_addressed_by_physician, b.physician_id AS physician_physician_id, b.title AS physician_title, b.heals_spiritual_sickness AS physician_heals_spiritual_sickness
FROM spiritual_needs a JOIN divine_physicians b ON a.physician_id = b.physician_id;
```

| need_id | need_type | severity_level | is_addressed_by_physician | physician_physician_id | physician_title | physician_heals_spiritual_sickness |
|---|---|---|---|---|---|---|
| 10966213 | pilot-need-62 | 29 | false | 5006449 | Compact Initiative | false |
| 619 | extended-need-63 | 40 | true | 338540 | Legacy Model | true |
| 92841674-9bad-11eb-a8a2-19ed5c03f8d3 | integrated-need-64 | 51 | false | default_chart_a_tax_5 | Regional Cluster A | false |
| 15426389 | seasonal-need-65 | 62 | true | 103195 | Seasonal Review | true |

The view `v_spiritual_need_divine_physician` joins `spiritual_needs` to `divine_physicians` on `physician_id`, producing a row that pairs each spiritual need with the physician who addresses it. Need `10966213` (`pilot-need-62`, severity `29`, not addressed by physician) is linked to physician `5006449` (`Compact Initiative`). Need `619` (`extended-need-63`, severity `40`, addressed by physician) is linked to physician `338540` (`Legacy Model`). This view answers: "Which divine physician is associated with each spiritual need?"

**View `v_spiritual_need_conversion_moment`**

```sql
CREATE VIEW v_spiritual_need_conversion_moment AS
SELECT a.need_id, a.need_type, a.severity_level, a.is_addressed_by_physician, b.id AS moment_id, b.moment_id AS moment_moment_id, b.encounter_date AS moment_encounter_date
FROM spiritual_needs a JOIN conversion_moments b ON a.conversion_moment_id = b.id;
```

| need_id | need_type | severity_level | is_addressed_by_physician | moment_id | moment_moment_id | moment_encounter_date |
|---|---|---|---|---|---|---|
| 10966213 | pilot-need-62 | 29 | false | 100 | d9774674-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-16T09:51:00 |
| 619 | extended-need-63 | 40 | true | 101 | ChIJATGfojhu5kcR-WS-zZ5HX98 | 2024-03-27T16:08:00 |
| 92841674-9bad-11eb-a8a2-19ed5c03f8d3 | integrated-need-64 | 51 | false | 102 | 4277015 | 2025-08-11T23:25:00 |
| 15426389 | seasonal-need-65 | 62 | true | 103 | 605957 | 2022-01-22T06:42:00 |

This view joins `spiritual_needs` to `conversion_moments` on `conversion_moment_id`, producing a row that pairs each spiritual need with the conversion moment it relates to. Need `10966213` (`pilot-need-62`, severity `29`) is linked to moment `100` (`Regional Series`, `2023-10-16T09:51:00`), and need `619` (`extended-need-63`, severity `40`) is linked to moment `101` (`Seasonal Assessment D`, `2024-03-27T16:08:00`). The view answers: "Which conversion moment is associated with each spiritual need?"

The schema as a whole forms a tightly coupled star topology centered on `conversion_moments`. Every other base table carries a foreign key to `conversion_moments` (either directly via `physician_id` or `reference_id` or `conversion_moment_id`), and the cross-links between `divine_physicians`, `biblical_characters`, and `scriptural_references` create a web of bidirectional relationships that can be traversed through any of the twelve materialized views. The views themselves are simple two-table joins that eliminate the need for runtime join logic: each view answers a single, well-scoped question by denormalizing exactly two entities. The result is a schema that is both normalized at the base-table level—avoiding redundancy in physician titles, character names, and scriptural citations—and fully materialized at the view level for efficient read patterns. All organizations, people, and products referenced in the data are fictional.