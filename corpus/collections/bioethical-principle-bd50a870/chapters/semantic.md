## Ontology-Grounded Relational Modelling in Bioethics

The bioethics domain under study captures the interplay between normative principles, clinical decision-making, professional practice, and educational infrastructure. At its core, the model distinguishes between abstract ethical concepts—principles and topics—and their concrete instantiation in clinical decisions made by medical professionals within structured training environments. The relational schema materialises this ontology through five base entity tables, two junction tables that resolve many-to-many associations, and ten derived views that reconstruct domain facts by joining normalised tables. Each view answers a specific analytical question, reassembling the normalised fragments into a coherent narrative about who made which decision, under what ethical framework, and within what educational context.

### Entity Tables and Their Attributes

The foundation of the schema consists of five entity tables, each representing a distinct concept class from the bioethics ontology. The `bioethical_principles` table encodes the normative axioms that guide clinical reasoning.

**Table `bioethical_principles`**

| bioethical_principle_id | principle_code | principle_name | is_foundational | description |
|---|---|---|---|---|
| 1 | AUTONOMY | Extended Model | false | Extended Survey |
| 2 | BENEFICENCE | Pilot Cluster A | true | Pilot Corridor A |
| 3 | NON_MALEFICENCE | Baseline Review | false | Baseline Series |
| 4 | JUSTICE | Distributed Initiative | true | Distributed Assessment |

Four principles are recorded, each identified by a surrogate `bioethical_principle_id` and a machine-readable `principle_code`. The principle named `Extended Model` carries the code `AUTONOMY` and is flagged as non-foundational (`is_foundational = false`), whereas `Pilot Cluster A` (code `BENEFICENCE`) is marked foundational. The `description` column carries free-text annotations such as `Extended Survey` and `Pilot Corridor A`, which serve as human-readable summaries rather than formal definitions. The `principle_code` column provides the canonical identifier used in downstream junction tables.

Clinical decisions are captured in the `ethical_decisions` table, which records discrete events where ethical reasoning was applied.

**Table `ethical_decisions`**

| id | decision_identifier | decision_date | decision_status | clinical_context | is_controversial | bioethical_topic_id | medical_professional_id |
|---|---|---|---|---|---|---|---|
| 1 | DEC-2011 | 2023-10-27T21:27:00 | PROPOSED | seasonal-clinical-89 | false | 1 | 1000 |
| 2 | DEC-2013 | 2024-03-11T04:44:00 | EVALUATED | regional-clinical-90 | true | 2 | 1001 |
| 3 | DEC-2015 | 2025-08-22T11:01:00 | IMPLEMENTED | legacy-clinical-91 | false | 3 | 1002 |
| 4 | DEC-2017 | 2022-01-06T18:18:00 | REJECTED | compact-clinical-92 | true | 4 | 1003 |

Each decision carries a human-readable `decision_identifier` (e.g., `DEC-2011`, `DEC-2013`), an ISO-8601 `decision_date`, and a lifecycle `decision_status` ranging from `PROPOSED` through `EVALUATED` to `IMPLEMENTED` and `REJECTED`. The `clinical_context` column stores contextual tags such as `seasonal-clinical-89` and `regional-clinical-90`, while `is_controversial` flags decisions that attracted ethical debate—`DEC-2013` and `DEC-2017` are both marked `true`. The decision is linked to a `bioethical_topic_id` and a `medical_professional_id`, establishing the foreign-key relationships that anchor the decision to its topical domain and its author.

The `bioethical_topics` table enumerates the subject-matter categories under which ethical decisions are classified.

**Table `bioethical_topics`**

| bioethical_topic_id | topic_code | topic_name | is_controversial | regulatory_status | course_id | ethical_decision_id |
|---|---|---|---|---|---|---|
| 1 | 0471948470 | Regional Model | false | LEGAL | 1 | 1 |
| 2 | 19744285 | Seasonal Cluster D | true | ILLEGAL | 2 | 2 |
| 3 | Keterangan | Integrated Review | false | UNREGULATED | 3 | 3 |
| 4 | 7021001070040 | Extended Initiative | true | DEBATABLE | 4 | 4 |

Topics are identified by `bioethical_topic_id` and carry a `topic_code` (e.g., `0471948470`, `19744285`) and a `topic_name` such as `Regional Model` or `Seasonal Cluster D`. The `is_controversial` column mirrors the decision-level flag at the topic level, and `regulatory_status` records the legal standing as `LEGAL`, `ILLEGAL`, `UNREGULATED`, or `DEBATABLE`. Each topic is associated with a `course_id` and an `ethical_decision_id`, embedding the topic within both an educational and a decision-making context.

Medical professionals are the human actors in this domain.

**Table `medical_professionals`**

| medical_professional_id | professional_i_d | full_name | medical_license_number | employment_status | specialty | ethical_decision_id | course_id |
|---|---|---|---|---|---|---|---|
| 1000 | PRO-2325 | Theodore Mcgrath | MED-2242 | FULL_TIME | extended-specialt-21 | 1 | 1 |
| 1001 | PRO-2330 | Account Name | MED-2246 | PART_TIME | integrated-specialt-22 | 2 | 2 |
| 1002 | PRO-2335 | Saipan International Airport | MED-2250 | CONTRACT | seasonal-specialt-23 | 3 | 3 |
| 1003 | PRO-2340 | Norma Fisher | MED-2254 | FULL_TIME | regional-specialt-24 | 4 | 4 |

Each professional is identified by a surrogate `medical_professional_id` and a human-readable `professional_i_d` such as `PRO-2325`. The `full_name` column stores names like `Theodore Mcgrath` and `Norma Fisher`, while `medical_license_number` (e.g., `MED-2242`) provides the regulatory identifier. The `employment_status` column distinguishes `FULL_TIME`, `PART_TIME`, and `CONTRACT` arrangements, and `specialty` records the clinical focus area. The foreign keys `ethical_decision_id` and `course_id` link each professional to their decision output and their training course.

Courses represent the educational infrastructure through which professionals are trained.

**Table `courses`**

| id | course_code | course_title | schedule_start | schedule_end | location | duration_hours | medical_professional_id |
|---|---|---|---|---|---|---|---|
| 1 | 10238263 | Baseline Series D | 2025-04-07T03:45:00 | 2022-01-14T00:48:00 | extended-location-99 | 3.70 | 1000 |
| 2 | 4463667 | Distributed Assessment | 2022-09-18T10:02:00 | 2023-06-25T07:05:00 | integrated-location-100 | 7.40 | 1001 |
| 3 | 24077793 | Adaptive Survey | 2023-02-02T17:19:00 | 2024-11-09T14:22:00 | seasonal-location-101 | 11.10 | 1002 |
| 4 | 1204-0009-L | Primary Corridor A | 2024-07-13T00:36:00 | 2025-04-20T21:39:00 | regional-location-102 | 14.80 | 1003 |

Each course is identified by `id` and carries a `course_code` (e.g., `10238263`, `4463667`) and a `course_title` such as `Baseline Series D` and `Primary Corridor A`. The `schedule_start` and `schedule_end` columns store ISO-8601 timestamps that define the course window, while `location` records the venue (e.g., `extended-location-99`). The `duration_hours` column quantifies the course length, ranging from `3.70` hours for `Baseline Series D` to `14.80` hours for `Primary Corridor A`. The `medical_professional_id` foreign key links each course to the professional who delivered or completed it.

### Junction Tables and Many-to-Many Relationships

The ontology contains two many-to-many relationships that cannot be expressed through simple foreign keys. The first is the association between bioethical principles and ethical decisions: a single principle can inform multiple decisions, and a single decision can be grounded in multiple principles. This relationship is materialised in the `principles_decisions` junction table.

**Table `principles_decisions`**

| bioethical_principle_id | ethical_decision_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The table contains eight rows that pair `bioethical_principle_id` values with `ethical_decision_id` values. For instance, principle `1` (`AUTONOMY`) is associated with decisions `1` and `2`, while principle `4` (`JUSTICE`) is linked to decisions `4` and `1`. This bidirectional mapping allows the schema to express that decision `DEC-2011` was informed by both the principle of `AUTONOMY` (principle 1) and the principle of `JUSTICE` (principle 4), while decision `DEC-2013` drew upon `BENEFICENCE` (principle 2) in addition to `AUTONOMY`.

The second junction table, `decisions_principles`, provides the inverse orientation of the same relationship.

**Table `decisions_principles`**

| ethical_decision_id | bioethical_principle_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

While the column order is reversed relative to `principles_decisions`, the semantic content is identical: each row pairs an `ethical_decision_id` with a `bioethical_principle_id`. The presence of both orientations supports different query patterns—one optimised for retrieving all decisions under a given principle, the other for retrieving all principles invoked by a given decision—without requiring the database engine to perform a join to determine the relationship direction.

The third many-to-many relationship exists between courses and bioethical topics.

**Table `courses_topics`**

| course_id | bioethical_topic_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

This junction table links `course_id` values to `bioethical_topic_id` values, enabling a course to cover multiple topics and a topic to be taught across multiple courses. The specific row contents are not enumerated in the reference data, but the structural role is clear: it resolves the course-topic association that the `bioethical_topics` table's `course_id` foreign key alone cannot express when the relationship is truly many-to-many.

### Views: Reconstructing Domain Facts

Views in this schema serve as denormalised projections that reassemble normalised tables into analytically useful forms. Each view answers a specific question about the bioethics domain by joining the appropriate entity and junction tables.

The view `v_bioethical_principle_ethical_decision_detail` reconstructs the principle-to-decision relationship with full attribute expansion.

**View `v_bioethical_principle_ethical_decision_detail`**

```sql
CREATE VIEW v_bioethical_principle_ethical_decision_detail AS
SELECT a.bioethical_principle_id, a.principle_code, a.principle_name, b.id AS decision_id, b.decision_identifier AS decision_decision_identifier, b.decision_date AS decision_decision_date
FROM bioethical_principles a
  JOIN principles_decisions j ON j.bioethical_principle_id = a.bioethical_principle_id
  JOIN ethical_decisions b ON b.id = j.ethical_decision_id;
```

| bioethical_principle_id | principle_code | principle_name | decision_id | decision_decision_identifier | decision_decision_date |
|---|---|---|---|---|---|
| 1 | AUTONOMY | Extended Model | 1 | DEC-2011 | 2023-10-27T21:27:00 |
| 1 | AUTONOMY | Extended Model | 2 | DEC-2013 | 2024-03-11T04:44:00 |
| 2 | BENEFICENCE | Pilot Cluster A | 2 | DEC-2013 | 2024-03-11T04:44:00 |
| 2 | BENEFICENCE | Pilot Cluster A | 3 | DEC-2015 | 2025-08-22T11:01:00 |
| 3 | NON_MALEFICENCE | Baseline Review | 3 | DEC-2015 | 2025-08-22T11:01:00 |
| 3 | NON_MALEFICENCE | Baseline Review | 4 | DEC-2017 | 2022-01-06T18:18:00 |
| 4 | JUSTICE | Distributed Initiative | 4 | DEC-2017 | 2022-01-06T18:18:00 |
| 4 | JUSTICE | Distributed Initiative | 1 | DEC-2011 | 2023-10-27T21:27:00 |

This view joins `bioethical_principles` to `ethical_decisions` through the `principles_decisions` junction, producing rows that pair principle attributes (such as `principle_code = AUTONOMY` and `principle_name = Extended Model`) with decision attributes (such as `decision_identifier = DEC-2011` and `decision_status = PROPOSED`). A row in this view tells us that the principle of `AUTONOMY` informed the decision `DEC-2011`, which was in `PROPOSED` status and occurred in the `seasonal-clinical-89` context. Another row reveals that `JUSTICE` (principle 4) also informed `DEC-2011`, demonstrating that a single decision can rest on multiple ethical foundations.

The inverse view, `v_ethical_decision_bioethical_principle_detail`, presents the same relationship from the decision's perspective.

**View `v_ethical_decision_bioethical_principle_detail`**

```sql
CREATE VIEW v_ethical_decision_bioethical_principle_detail AS
SELECT a.id, a.decision_identifier, a.decision_date, b.bioethical_principle_id AS principle_bioethical_principle_id, b.principle_code AS principle_principle_code, b.principle_name AS principle_principle_name
FROM ethical_decisions a
  JOIN decisions_principles j ON j.ethical_decision_id = a.id
  JOIN bioethical_principles b ON b.bioethical_principle_id = j.bioethical_principle_id;
```

| id | decision_identifier | decision_date | principle_bioethical_principle_id | principle_principle_code | principle_principle_name |
|---|---|---|---|---|---|
| 1 | DEC-2011 | 2023-10-27T21:27:00 | 1 | AUTONOMY | Extended Model |
| 1 | DEC-2011 | 2023-10-27T21:27:00 | 2 | BENEFICENCE | Pilot Cluster A |
| 2 | DEC-2013 | 2024-03-11T04:44:00 | 2 | BENEFICENCE | Pilot Cluster A |
| 2 | DEC-2013 | 2024-03-11T04:44:00 | 3 | NON_MALEFICENCE | Baseline Review |
| 3 | DEC-2015 | 2025-08-22T11:01:00 | 3 | NON_MALEFICENCE | Baseline Review |
| 3 | DEC-2015 | 2025-08-22T11:01:00 | 4 | JUSTICE | Distributed Initiative |
| 4 | DEC-2017 | 2022-01-06T18:18:00 | 4 | JUSTICE | Distributed Initiative |
| 4 | DEC-2017 | 2022-01-06T18:18:00 | 1 | AUTONOMY | Extended Model |

Here, each row begins with a decision identifier and status, followed by the principles that underpin it. For decision `DEC-2013` (status `EVALUATED`, context `regional-clinical-90`, marked `is_controversial = true`), the view produces rows showing that it was grounded in both `AUTONOMY` and `BENEFICENCE`. This orientation is useful for auditors who start from a decision and need to enumerate its ethical justifications.

The view `v_ethical_decision_bioethical_topic` links decisions to their topical classifications.

**View `v_ethical_decision_bioethical_topic`**

```sql
CREATE VIEW v_ethical_decision_bioethical_topic AS
SELECT a.id, a.decision_identifier, a.decision_date, a.decision_status, b.bioethical_topic_id AS topic_bioethical_topic_id, b.topic_code AS topic_topic_code, b.topic_name AS topic_topic_name
FROM ethical_decisions a JOIN bioethical_topics b ON a.bioethical_topic_id = b.bioethical_topic_id;
```

| id | decision_identifier | decision_date | decision_status | topic_bioethical_topic_id | topic_topic_code | topic_topic_name |
|---|---|---|---|---|---|---|
| 1 | DEC-2011 | 2023-10-27T21:27:00 | PROPOSED | 1 | 0471948470 | Regional Model |
| 2 | DEC-2013 | 2024-03-11T04:44:00 | EVALUATED | 2 | 19744285 | Seasonal Cluster D |
| 3 | DEC-2015 | 2025-08-22T11:01:00 | IMPLEMENTED | 3 | Keterangan | Integrated Review |
| 4 | DEC-2017 | 2022-01-06T18:18:00 | REJECTED | 4 | 7021001070040 | Extended Initiative |

This view joins `ethical_decisions` to `bioethical_topics` via the `ethical_decision_id` foreign key. A row reveals that decision `DEC-2011` is classified under topic `0471948470` (`Regional Model`), which carries `regulatory_status = LEGAL` and `is_controversial = false`. Another row shows that `DEC-2013` falls under topic `19744285` (`Seasonal Cluster D`), which is itself marked `is_controversial = true` and has `regulatory_status = ILLEGAL`. The view thus enables queries about the regulatory landscape surrounding specific decisions.

The view `v_ethical_decision_medical_professional` connects decisions to their authors.

**View `v_ethical_decision_medical_professional`**

```sql
CREATE VIEW v_ethical_decision_medical_professional AS
SELECT a.id, a.decision_identifier, a.decision_date, a.decision_status, b.medical_professional_id AS professional_medical_professional_id, b.professional_i_d AS professional_professional_i_d, b.full_name AS professional_full_name
FROM ethical_decisions a JOIN medical_professionals b ON a.medical_professional_id = b.medical_professional_id;
```

| id | decision_identifier | decision_date | decision_status | professional_medical_professional_id | professional_professional_i_d | professional_full_name |
|---|---|---|---|---|---|---|
| 1 | DEC-2011 | 2023-10-27T21:27:00 | PROPOSED | 1000 | PRO-2325 | Theodore Mcgrath |
| 2 | DEC-2013 | 2024-03-11T04:44:00 | EVALUATED | 1001 | PRO-2330 | Account Name |
| 3 | DEC-2015 | 2025-08-22T11:01:00 | IMPLEMENTED | 1002 | PRO-2335 | Saipan International Airport |
| 4 | DEC-2017 | 2022-01-06T18:18:00 | REJECTED | 1003 | PRO-2340 | Norma Fisher |

By joining `ethical_decisions` to `medical_professionals`, this view answers the question of who made which decision. A row shows that `Theodore Mcgrath` (professional ID `PRO-2325`, license `MED-2242`, employment status `FULL_TIME`) authored decision `DEC-2011`. Another row reveals that `Account Name` (professional ID `PRO-2330`, license `MED-2246`, employment status `PART_TIME`) authored `DEC-2013`, a controversial decision in the `regional-clinical-90` context. The view supports workforce analytics, such as identifying which professionals are associated with controversial decisions.

The view `v_bioethical_topic_course` links topics to their educational contexts.

**View `v_bioethical_topic_course`**

```sql
CREATE VIEW v_bioethical_topic_course AS
SELECT a.bioethical_topic_id, a.topic_code, a.topic_name, a.is_controversial, b.id AS course_id, b.course_code AS course_course_code, b.course_title AS course_course_title
FROM bioethical_topics a JOIN courses b ON a.course_id = b.id;
```

| bioethical_topic_id | topic_code | topic_name | is_controversial | course_id | course_course_code | course_course_title |
|---|---|---|---|---|---|---|
| 1 | 0471948470 | Regional Model | false | 1 | 10238263 | Baseline Series D |
| 2 | 19744285 | Seasonal Cluster D | true | 2 | 4463667 | Distributed Assessment |
| 3 | Keterangan | Integrated Review | false | 3 | 24077793 | Adaptive Survey |
| 4 | 7021001070040 | Extended Initiative | true | 4 | 1204-0009-L | Primary Corridor A |

This view joins `bioethical_topics` to `courses`, revealing which topics are taught in which courses. A row shows that topic `0471948470` (`Regional Model`) is associated with course `10238263` (`Baseline Series D`), which has a duration of `3.70` hours and runs from `2025-04-07T03:45:00` to `2022-01-14T00:48:00` at `extended-location-99`. The temporal inversion in the schedule dates is a data artifact, but the structural relationship is clear: each topic is anchored to a specific course.

The view `v_bioethical_topic_ethical_decision` provides the topic-to-decision linkage from the topic's perspective.

**View `v_bioethical_topic_ethical_decision`**

```sql
CREATE VIEW v_bioethical_topic_ethical_decision AS
SELECT a.bioethical_topic_id, a.topic_code, a.topic_name, a.is_controversial, b.id AS decision_id, b.decision_identifier AS decision_decision_identifier, b.decision_date AS decision_decision_date
FROM bioethical_topics a JOIN ethical_decisions b ON a.ethical_decision_id = b.id;
```

| bioethical_topic_id | topic_code | topic_name | is_controversial | decision_id | decision_decision_identifier | decision_decision_date |
|---|---|---|---|---|---|---|
| 1 | 0471948470 | Regional Model | false | 1 | DEC-2011 | 2023-10-27T21:27:00 |
| 2 | 19744285 | Seasonal Cluster D | true | 2 | DEC-2013 | 2024-03-11T04:44:00 |
| 3 | Keterangan | Integrated Review | false | 3 | DEC-2015 | 2025-08-22T11:01:00 |
| 4 | 7021001070040 | Extended Initiative | true | 4 | DEC-2017 | 2022-01-06T18:18:00 |

Each row begins with a topic identifier and name, followed by the decisions that fall under that topic. For topic `0471948470` (`Regional Model`), the view shows it is associated with decision `DEC-2011` (status `PROPOSED`, context `seasonal-clinical-89`). For topic `19744285` (`Seasonal Cluster D`), the view links it to decision `DEC-2013` (status `EVALUATED`, context `regional-clinical-90`, `is_controversial = true`). This orientation is useful for topic-level analysis, such as determining which topics are associated with controversial decisions.

The view `v_medical_professional_ethical_decision` presents the professional-to-decision relationship from the professional's perspective.

**View `v_medical_professional_ethical_decision`**

```sql
CREATE VIEW v_medical_professional_ethical_decision AS
SELECT a.medical_professional_id, a.professional_i_d, a.full_name, a.medical_license_number, b.id AS decision_id, b.decision_identifier AS decision_decision_identifier, b.decision_date AS decision_decision_date
FROM medical_professionals a JOIN ethical_decisions b ON a.ethical_decision_id = b.id;
```

| medical_professional_id | professional_i_d | full_name | medical_license_number | decision_id | decision_decision_identifier | decision_decision_date |
|---|---|---|---|---|---|---|
| 1000 | PRO-2325 | Theodore Mcgrath | MED-2242 | 1 | DEC-2011 | 2023-10-27T21:27:00 |
| 1001 | PRO-2330 | Account Name | MED-2246 | 2 | DEC-2013 | 2024-03-11T04:44:00 |
| 1002 | PRO-2335 | Saipan International Airport | MED-2250 | 3 | DEC-2015 | 2025-08-22T11:01:00 |
| 1003 | PRO-2340 | Norma Fisher | MED-2254 | 4 | DEC-2017 | 2022-01-06T18:18:00 |

A row shows that `Theodore Mcgrath` (specialty `extended-specialt-21`) is associated with decision `DEC-2011` (status `PROPOSED`, context `seasonal-clinical-89`). Another row reveals that `Saipan International Airport` (specialty `seasonal-specialt-23`, employment status `CONTRACT`) is associated with decision `DEC-2015` (status `IMPLEMENTED`, context `legacy-clinical-91`). The view supports professional portfolio analysis, such as identifying which professionals have decisions in different lifecycle statuses.

The view `v_medical_professional_course` links professionals to their training courses.

**View `v_medical_professional_course`**

```sql
CREATE VIEW v_medical_professional_course AS
SELECT a.medical_professional_id, a.professional_i_d, a.full_name, a.medical_license_number, b.id AS course_id, b.course_code AS course_course_code, b.course_title AS course_course_title
FROM medical_professionals a JOIN courses b ON a.course_id = b.id;
```

| medical_professional_id | professional_i_d | full_name | medical_license_number | course_id | course_course_code | course_course_title |
|---|---|---|---|---|---|---|
| 1000 | PRO-2325 | Theodore Mcgrath | MED-2242 | 1 | 10238263 | Baseline Series D |
| 1001 | PRO-2330 | Account Name | MED-2246 | 2 | 4463667 | Distributed Assessment |
| 1002 | PRO-2335 | Saipan International Airport | MED-2250 | 3 | 24077793 | Adaptive Survey |
| 1003 | PRO-2340 | Norma Fisher | MED-2254 | 4 | 1204-0009-L | Primary Corridor A |

This view joins `medical_professionals` to `courses`, revealing which professionals are associated with which courses. A row shows that `Theodore Mcgrath` (professional ID `PRO-2325`) is linked to course `10238263` (`Baseline Series D`), which has a duration of `3.70` hours. Another row shows that `Account Name` (professional ID `PRO-2330`) is linked to course `4463667` (`Distributed Assessment`), which runs for `7.40` hours. The view supports training compliance analysis.

The view `v_course_bioethical_topic_detail` provides the course-to-topic linkage with full attribute expansion.

**View `v_course_bioethical_topic_detail`**

```sql
CREATE VIEW v_course_bioethical_topic_detail AS
SELECT a.id, a.course_code, a.course_title, b.bioethical_topic_id AS topic_bioethical_topic_id, b.topic_code AS topic_topic_code, b.topic_name AS topic_topic_name
FROM courses a
  JOIN courses_topics j ON j.course_id = a.id
  JOIN bioethical_topics b ON b.bioethical_topic_id = j.bioethical_topic_id;
```

| id | course_code | course_title | topic_bioethical_topic_id | topic_topic_code | topic_topic_name |
|---|---|---|---|---|---|
| 1 | 10238263 | Baseline Series D | 1 | 0471948470 | Regional Model |
| 1 | 10238263 | Baseline Series D | 2 | 19744285 | Seasonal Cluster D |
| 2 | 4463667 | Distributed Assessment | 2 | 19744285 | Seasonal Cluster D |
| 2 | 4463667 | Distributed Assessment | 3 | Keterangan | Integrated Review |
| 3 | 24077793 | Adaptive Survey | 3 | Keterangan | Integrated Review |
| 3 | 24077793 | Adaptive Survey | 4 | 7021001070040 | Extended Initiative |
| 4 | 1204-0009-L | Primary Corridor A | 4 | 7021001070040 | Extended Initiative |
| 4 | 1204-0009-L | Primary Corridor A | 1 | 0471948470 | Regional Model |

This view joins `courses` to `bioethical_topics`, producing rows that pair course attributes with topic attributes. A row shows that course `10238263` (`Baseline Series D`, duration `3.70` hours, location `extended-location-99`) covers topic `0471948470` (`Regional Model`, `regulatory_status = LEGAL`). Another row reveals that course `4463667` (`Distributed Assessment`, duration `7.40` hours, location `integrated-location-100`) covers topic `19744285` (`Seasonal Cluster D`, `is_controversial = true`, `regulatory_status = ILLEGAL`). The view enables curriculum analysis, such as identifying which courses cover controversial or illegal topics.

The view `v_course_medical_professional` links courses to the professionals associated with them.

**View `v_course_medical_professional`**

```sql
CREATE VIEW v_course_medical_professional AS
SELECT a.id, a.course_code, a.course_title, a.schedule_start, b.medical_professional_id AS professional_medical_professional_id, b.professional_i_d AS professional_professional_i_d, b.full_name AS professional_full_name
FROM courses a JOIN medical_professionals b ON a.medical_professional_id = b.medical_professional_id;
```

| id | course_code | course_title | schedule_start | professional_medical_professional_id | professional_professional_i_d | professional_full_name |
|---|---|---|---|---|---|---|
| 1 | 10238263 | Baseline Series D | 2025-04-07T03:45:00 | 1000 | PRO-2325 | Theodore Mcgrath |
| 2 | 4463667 | Distributed Assessment | 2022-09-18T10:02:00 | 1001 | PRO-2330 | Account Name |
| 3 | 24077793 | Adaptive Survey | 2023-02-02T17:19:00 | 1002 | PRO-2335 | Saipan International Airport |
| 4 | 1204-0009-L | Primary Corridor A | 2024-07-13T00:36:00 | 1003 | PRO-2340 | Norma Fisher |

This view joins `courses` to `medical_professionals`, producing rows that pair course attributes with professional attributes. A row shows that course `10238263` (`Baseline Series D`) is associated with `Theodore Mcgrath` (professional ID `PRO-2325`, license `MED-2242`, specialty `extended-specialt-21`). Another row reveals that course `4463667` (`Distributed Assessment`) is associated with `Account Name` (professional ID `PRO-2330`, license `MED-2246`, specialty `integrated-specialt-22`). The view supports institutional reporting on course-professional assignments.

### Closing Synthesis

The schema models the bioethics domain through a clear separation of concerns: entity tables capture the atomic concepts (principles, decisions, topics, professionals, courses), junction tables resolve the many-to-many relationships between principles and decisions and between courses and topics, and views reconstruct domain facts by joining these normalised fragments. Each view answers a specific analytical question—what principles informed a decision, who authored a decision, which topics are taught in which courses—by reassembling the foreign-key-linked tables into a denormalised projection. The record identifiers (`DEC-2011`, `PRO-2325`, `MED-2242`) and attribute values (`AUTONOMY`, `PROPOSED`, `LEGAL`, `3.70` hours) that appear in the data are not arbitrary; they are the material instantiation of the ontology, and the views make them queryable in the context of the relationships that give them meaning.