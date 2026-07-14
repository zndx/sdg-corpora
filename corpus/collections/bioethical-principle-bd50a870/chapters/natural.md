## Foundations of Clinical Bioethics Governance

Healthcare institutions operate within a dense web of ethical obligations, regulatory constraints, and professional responsibilities. At the core of this ecosystem are four bioethical principles that guide decision-making across clinical contexts: AUTONOMY, BENEFICENCE, NON_MALEFICENCE, and JUSTICE. Each principle carries a code, a descriptive name, and a flag indicating whether it serves as a foundational pillar for institutional ethics frameworks. The principle BENEFICENCE, coded as Pilot Cluster A, is marked as foundational, as is JUSTICE, coded as Distributed Initiative. These two principles anchor the ethical architecture, while AUTONOMY (Extended Model) and NON_MALEFICENCE (Baseline Review) operate as supporting pillars. The descriptions associated with each principle—ranging from Extended Survey to Distributed Assessment—reflect the institutional language used to categorize and communicate ethical standards across departments.

**Table `bioethical_principles`**

| bioethical_principle_id | principle_code | principle_name | is_foundational | description |
|---|---|---|---|---|
| 1 | AUTONOMY | Extended Model | false | Extended Survey |
| 2 | BENEFICENCE | Pilot Cluster A | true | Pilot Corridor A |
| 3 | NON_MALEFICENCE | Baseline Review | false | Baseline Series |
| 4 | JUSTICE | Distributed Initiative | true | Distributed Assessment |

The operationalization of these principles occurs through ethical decisions recorded in clinical settings. Each decision carries a unique identifier such as DEC-2011 or DEC-2017, a timestamp, and a status that traces its lifecycle through the institutional review process. The statuses PROPOSED, EVALUATED, IMPLEMENTED, and REJECTED represent distinct stages in the decision pipeline. Decision DEC-2011, recorded on 2023-10-27, remains in the PROPOSED state within a seasonal-clinical-89 context. By contrast, DEC-2015 achieved IMPLEMENTED status on 2025-08-22, having progressed through evaluation within the legacy-clinical-91 environment. Some decisions carry the is_controversial flag, signaling that they have generated substantive debate within the institution. DEC-2013 and DEC-2017 are both marked as controversial, with the former evaluated in regional-clinical-90 and the latter rejected in compact-clinical-92.

**Table `ethical_decisions`**

| id | decision_identifier | decision_date | decision_status | clinical_context | is_controversial | bioethical_topic_id | medical_professional_id |
|---|---|---|---|---|---|---|---|
| 1 | DEC-2011 | 2023-10-27T21:27:00 | PROPOSED | seasonal-clinical-89 | false | 1 | 1000 |
| 2 | DEC-2013 | 2024-03-11T04:44:00 | EVALUATED | regional-clinical-90 | true | 2 | 1001 |
| 3 | DEC-2015 | 2025-08-22T11:01:00 | IMPLEMENTED | legacy-clinical-91 | false | 3 | 1002 |
| 4 | DEC-2017 | 2022-01-06T18:18:00 | REJECTED | compact-clinical-92 | true | 4 | 1003 |

Each ethical decision is associated with a specific bioethical topic and assigned to a medical professional responsible for its oversight. The bioethical topics themselves carry codes such as 0471948470 and 19744285, along with names like Regional Model and Seasonal Cluster D. Topics are classified by their regulatory status—LEGAL, ILLEGAL, UNREGULATED, or DEBATABLE—and flagged for controversy. Topic 19744285 (Seasonal Cluster D) is both controversial and classified as ILLEGAL, while Keterangan (topic 3) operates in an UNREGULATED space without controversy. The course_id and ethical_decision_id fields on the bioethical_topics table establish direct links between educational content and the decisions those topics inform.

**Table `bioethical_topics`**

| bioethical_topic_id | topic_code | topic_name | is_controversial | regulatory_status | course_id | ethical_decision_id |
|---|---|---|---|---|---|---|
| 1 | 0471948470 | Regional Model | false | LEGAL | 1 | 1 |
| 2 | 19744285 | Seasonal Cluster D | true | ILLEGAL | 2 | 2 |
| 3 | Keterangan | Integrated Review | false | UNREGULATED | 3 | 3 |
| 4 | 7021001070040 | Extended Initiative | true | DEBATABLE | 4 | 4 |

Medical professionals form the human backbone of this governance structure. Each professional is identified by a unique number such as PRO-2325 or PRO-2340, carries a full name, and holds a medical license number like MED-2242 or MED-2254. Employment status ranges across FULL_TIME, PART_TIME, and CONTRACT arrangements, while specialties—coded as extended-specialt-21, integrated-specialt-22, and similar identifiers—denote areas of clinical focus. Professional Theodore Mcgrath (PRO-2325) holds a FULL_TIME position in extended-specialt-21 and is linked to ethical decision DEC-2011. Account Name (PRO-2330) works PART_TIME in integrated-specialt-22 and oversees DEC-2013. Saipan International Airport (PRO-2335), a CONTRACT specialist in seasonal-specialt-23, is assigned to DEC-2015, while Norma Fisher (PRO-2340), a FULL_TIME regional-specialt-24 professional, manages DEC-2017.

**Table `medical_professionals`**

| medical_professional_id | professional_i_d | full_name | medical_license_number | employment_status | specialty | ethical_decision_id | course_id |
|---|---|---|---|---|---|---|---|
| 1000 | PRO-2325 | Theodore Mcgrath | MED-2242 | FULL_TIME | extended-specialt-21 | 1 | 1 |
| 1001 | PRO-2330 | Account Name | MED-2246 | PART_TIME | integrated-specialt-22 | 2 | 2 |
| 1002 | PRO-2335 | Saipan International Airport | MED-2250 | CONTRACT | seasonal-specialt-23 | 3 | 3 |
| 1003 | PRO-2340 | Norma Fisher | MED-2254 | FULL_TIME | regional-specialt-24 | 4 | 4 |

Continuing education and professional development are tracked through courses that medical professionals attend. Each course has a code such as 10238263 or 4463667, a title like Baseline Series D or Distributed Assessment, and a defined schedule with start and end timestamps. The duration of courses varies significantly, from 3.70 hours for Baseline Series D to 14.80 hours for Primary Corridor A. Location identifiers such as extended-location-99 and integrated-location-100 specify where training occurs. Course 10238263 (Baseline Series D) runs from 2025-04-07 to 2022-01-14 and is associated with medical professional Theodore Mcgrath (PRO-2325). Course 4463667 (Distributed Assessment) spans from 2022-09-18 to 2023-06-25 and is linked to Account Name (PRO-2330).

**Table `courses`**

| id | course_code | course_title | schedule_start | schedule_end | location | duration_hours | medical_professional_id |
|---|---|---|---|---|---|---|---|
| 1 | 10238263 | Baseline Series D | 2025-04-07T03:45:00 | 2022-01-14T00:48:00 | extended-location-99 | 3.70 | 1000 |
| 2 | 4463667 | Distributed Assessment | 2022-09-18T10:02:00 | 2023-06-25T07:05:00 | integrated-location-100 | 7.40 | 1001 |
| 3 | 24077793 | Adaptive Survey | 2023-02-02T17:19:00 | 2024-11-09T14:22:00 | seasonal-location-101 | 11.10 | 1002 |
| 4 | 1204-0009-L | Primary Corridor A | 2024-07-13T00:36:00 | 2025-04-20T21:39:00 | regional-location-102 | 14.80 | 1003 |

The relationship between bioethical principles and ethical decisions is mediated through a junction table that records which principles inform which decisions. This mapping is not one-to-one; a single decision may draw on multiple principles, and a single principle may underpin multiple decisions. Principle AUTONOMY (id 1) informs both DEC-2011 and DEC-2013. Principle BENEFICENCE (id 2) applies to DEC-2013 and DEC-2015. Principle NON_MALEFICENCE (id 3) covers DEC-2015 and DEC-2017. Principle JUSTICE (id 4) supports DEC-2017 and DEC-2011. This creates a cross-cutting structure where each decision is grounded in at least two principles, ensuring that no single ethical framework dominates a decision in isolation.

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

A parallel junction table, decisions_principles, records the same relationships from the decision side, providing a symmetric view of the principle-decision mapping. This redundancy supports queries that originate from either direction—starting from a principle and finding all decisions it informs, or starting from a decision and identifying all principles that justify it. The eight rows in this table mirror the eight rows in principles_decisions, confirming that the relationship is consistently recorded regardless of query direction.

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

The connection between courses and bioethical topics is captured in the courses_topics junction table. This table enables the tracking of which educational content addresses which ethical topics, supporting compliance reporting and curriculum design. A course may cover multiple topics, and a topic may be addressed across multiple courses, creating a matrix of educational coverage that institutions can audit and update as regulations evolve.

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

The view v_bioethical_principle_ethical_decision_detail synthesizes the principle-decision relationship with descriptive metadata, answering the question of which bioethical principles underpin each ethical decision and how those principles are characterized. For instance, the view reveals that DEC-2011 is supported by AUTONOMY (Extended Model, non-foundational) and JUSTICE (Distributed Initiative, foundational), demonstrating how a single decision draws on both a supporting and a foundational principle. DEC-2013 is grounded in AUTONOMY and BENEFICENCE (Pilot Cluster A, foundational), showing how the controversial decision in regional-clinical-90 is justified by a foundational principle alongside a non-foundational one.

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

The complementary view v_ethical_decision_bioethical_principle_detail presents the same relationship from the decision's perspective, listing each decision alongside the principles that inform it. This orientation is useful for auditors reviewing a specific decision and needing to verify that adequate ethical grounding exists. DEC-2015, for example, appears with both BENEFICENCE and NON_MALEFICENCE, confirming that the implemented decision in legacy-clinical-91 is supported by two distinct ethical pillars. DEC-2017, the rejected controversial decision in compact-clinical-92, is linked to NON_MALEFICENCE and JUSTICE, suggesting that the rejection may have been driven by concerns about harm prevention and equitable treatment.

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

The view v_ethical_decision_bioethical_topic connects ethical decisions to their associated bioethical topics, answering which topics are relevant to each decision. DEC-2011 is linked to topic 0471948470 (Regional Model, non-controversial, LEGAL), indicating that the proposed decision operates within a well-established regulatory framework. DEC-2013, the controversial evaluated decision, is associated with topic 19744285 (Seasonal Cluster D, controversial, ILLEGAL), suggesting that the controversy stems partly from the topic's illegal regulatory status. DEC-2015 connects to topic Keterangan (Integrated Review, non-controversial, UNREGULATED), while DEC-2017 links to topic 7021001070040 (Extended Initiative, controversial, DEBATABLE).

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

The view v_ethical_decision_medical_professional maps each ethical decision to the medical professional responsible for it, providing accountability and traceability. DEC-2011 is overseen by Theodore Mcgrath (PRO-2325), a FULL_TIME extended-specialt-21 professional. DEC-2013 falls under Account Name (PRO-2330), a PART_TIME integrated-specialt-22 professional. DEC-2015 is managed by Saipan International Airport (PRO-2335), a CONTRACT seasonal-specialt-23 professional. DEC-2017 is assigned to Norma Fisher (PRO-2340), a FULL_TIME regional-specialt-24 professional. This view enables institutions to assess workload distribution, verify that controversial decisions are assigned to appropriately experienced professionals, and track which professionals are handling decisions at different lifecycle stages.

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

The view v_bioethical_topic_course links bioethical topics to the courses that address them, answering which educational programs cover which topics. This relationship is critical for ensuring that training curricula remain aligned with current ethical priorities and regulatory requirements. A topic with ILLEGAL status, for instance, should be prominently featured in relevant courses to ensure professionals understand the boundaries they must navigate.

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

The view v_bioethical_topic_ethical_decision presents the reverse of v_ethical_decision_bioethical_topic, starting from the topic and identifying which decisions reference it. This orientation is useful for topic owners who need to understand how their subject area is being applied across the institution's decision-making landscape. Topic 0471948470 (Regional Model) is referenced by DEC-2011, while topic 19744285 (Seasonal Cluster D) is referenced by DEC-2013. Topic Keterangan (Integrated Review) appears in DEC-2015, and topic 7021001070040 (Extended Initiative) appears in DEC-2017.

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

The view v_medical_professional_ethical_decision connects medical professionals to the decisions they oversee, providing a comprehensive profile of each professional's decision-making responsibilities. Theodore Mcgrath (PRO-2325) is linked to DEC-2011, a PROPOSED decision in the seasonal-clinical-89 context. Account Name (PRO-2330) oversees DEC-2013, an EVALUATED controversial decision. Saipan International Airport (PRO-2335) manages DEC-2015, an IMPLEMENTED decision. Norma Fisher (PRO-2340) is responsible for DEC-2017, a REJECTED controversial decision. This view supports performance reviews, workload balancing, and the identification of professionals who may need additional training or support.

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

The view v_medical_professional_course maps medical professionals to the courses they have completed or are enrolled in, answering which professionals have received training in which programs. Theodore Mcgrath (PRO-2325) is associated with course 10238263 (Baseline Series D), a 3.70-hour course at extended-location-99. Account Name (PRO-2330) is linked to course 4463667 (Distributed Assessment), a 7.40-hour course at integrated-location-100. Saipan International Airport (PRO-2335) is associated with course 24077793 (Adaptive Survey), an 11.10-hour course at seasonal-location-101. Norma Fisher (PRO-2340) is linked to course 1204-0009-L (Primary Corridor A), a 14.80-hour course at regional-location-102. This view enables institutions to verify that professionals have completed required training and to identify gaps in professional development.

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

The view v_course_bioethical_topic_detail combines course information with the bioethical topics they cover, answering which topics are addressed in each course and providing the full context of the educational content. This view is essential for curriculum auditors who need to verify that courses adequately cover the topics required by current regulations and institutional policies.

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

The view v_course_medical_professional links courses to the medical professionals who have completed them, providing a comprehensive training history for each professional and a participant roster for each course. This bidirectional relationship supports both individual professional development tracking and institutional compliance reporting, ensuring that every medical professional can demonstrate completion of required ethical training and that every course can report on its audience composition.

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

## Synthesis

The bioethical governance ecosystem described by these records forms an interconnected system where principles inform decisions, decisions are overseen by professionals, professionals complete courses, and courses cover topics that feed back into the decision-making process. The four foundational principles—AUTONOMY, BENEFICENCE, NON_MALEFICENCE, and JUSTICE—provide the ethical scaffolding, while the junction tables ensure that every decision is grounded in multiple principles rather than a single framework. The professional lifecycle, from course completion to decision oversight, creates a continuous loop of education, application, and accountability. Controversial decisions like DEC-2013 and DEC-2017, linked to topics with ILLEGAL and DEBATABLE regulatory statuses, highlight the tension between institutional ethics and external regulatory constraints. The views derived from these tables enable institutions to navigate this complexity, providing targeted lenses through which to examine the relationships between principles, decisions, topics, professionals, and courses.