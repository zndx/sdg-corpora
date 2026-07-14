## The Architecture of Curriculum Delivery and Student Assessment

Educational institutions manage learning through a structured hierarchy of topics, subtopics, and assessment items, each tracked against individual student performance. The data model captures this ecosystem as a series of interconnected records: curriculum topics define broad subject areas, subtopics decompose those areas into teachable units, and assessment items measure mastery within each unit. Students enroll in topics, receive subtopic assignments, and generate responses to assessment items that are scored and timestamped for longitudinal analysis. This chapter documents the entities, their relationships, and the analytical views that synthesize them into actionable insight.

**Table `CurriculumTopic`**

| id | topicId | topicName | bfoGenus | complexityLevel | isCore | requiresPrerequisiteTopicId |
|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_b_VB-IC-Tab | Regional Model | legacy-bfo-43 | 37 | false | 1000 |
| 1001 | 8387534 | Seasonal Cluster D | compact-bfo-44 | 45 | true | 1001 |
| 1002 | 2933463 | Integrated Review | composite-bfo-45 | 53 | false | 1002 |
| 1003 | 2839516 | Extended Initiative | primary-bfo-46 | 61 | true | 1003 |

Curriculum topics form the top level of the instructional hierarchy. Each topic carries a unique `topicId` string—such as `lu_tax_code_template_b_VB-IC-Tab` for the "Regional Model" topic or `8387534` for "Seasonal Cluster D"—alongside a `topicName` that describes its scope. The `bfoGenus` column classifies the topic's structural lineage, with values like `legacy-bfo-43`, `compact-bfo-44`, `composite-bfo-45`, and `primary-bfo-46` indicating distinct generational families. The `complexityLevel` field assigns a numeric difficulty score ranging from 37 to 61 across the four topics, while `isCore` marks whether the topic is mandatory; "Seasonal Cluster D" and "Extended Initiative" are flagged as core, whereas "Regional Model" and "Integrated Review" are optional. The `requiresPrerequisiteTopicId` column references another topic, creating a prerequisite graph—in the current dataset each topic references itself, suggesting a self-contained structure awaiting further decomposition.

**Table `CurriculumSubtopic`**

| id | subtopicId | subtopicName | bfoGenus | isAbstract | difficultyRating | topicId |
|---|---|---|---|---|---|---|
| 1 | 5082972 | Primary Review A | legacy-bfo-43 | false | 5.70 | 1000 |
| 2 | 121 | Composite Initiative | compact-bfo-44 | true | 10.40 | 1001 |
| 3 | 8843744 | Compact Model | composite-bfo-45 | false | 15.10 | 1002 |
| 4 | 103181 | Legacy Cluster D | primary-bfo-46 | true | 19.80 | 1003 |

Beneath each topic sit curriculum subtopics, which narrow the instructional focus. The subtopic table links to its parent via `topicId`, so subtopic "Primary Review A" (id 1) belongs to topic 1000, while "Composite Initiative" (id 2) belongs to topic 1001. Subtopics carry their own `subtopicId` identifiers—`5082972`, `121`, `8843744`, and `103181`—and a `subtopicName` for human readability. The `bfoGenus` field mirrors the topic-level classification, and `isAbstract` distinguishes conceptual subtopics from concrete ones; "Composite Initiative" and "Legacy Cluster D" are marked abstract. The `difficultyRating` provides a finer-grained measure than the topic-level `complexityLevel`, spanning from 5.70 for "Primary Review A" to 19.80 for "Legacy Cluster D."

**Table `CurriculumTopicCurriculumSubtopic`**

| topicId | subtopicId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The many-to-many relationship between topics and subtopics is materialized in the join table `CurriculumTopicCurriculumSubtopic`. This table explicitly enumerates which subtopics belong to which topics. Topic 1000 ("Regional Model") contains subtopics 1 and 2; topic 1001 ("Seasonal Cluster D") contains subtopics 2 and 3; topic 1002 ("Integrated Review") contains subtopics 3 and 4; and topic 1003 ("Extended Initiative") contains subtopics 4 and 1. The cross-linking pattern—where subtopic 2 appears under both topics 1000 and 1001, and subtopic 4 appears under both 1002 and 1003—indicates that subtopics can be shared across multiple parent topics, enabling curriculum reuse and interdisciplinary coverage.

**Table `AssessmentItem`**

| itemId | itemText | itemType | maxScore | timeLimitSeconds | isPublic | subtopicId |
|---|---|---|---|---|---|---|
| 100 | baseline-item-31 | multiple_choice | 29 | 31 | false | 1 |
| 101 | pilot-item-32 | short_answer | 32 | 35 | true | 2 |
| 102 | extended-item-33 | calculation | 35 | 39 | false | 3 |
| 103 | integrated-item-34 | proof | 38 | 43 | true | 4 |

Assessment items operationalize the subtopics by providing measurable questions. Each item has a unique `itemId` (100 through 103), an `itemText` identifier such as `baseline-item-31` or `pilot-item-32`, and an `itemType` that specifies the response format: `multiple_choice`, `short_answer`, `calculation`, or `proof`. The `maxScore` field defines the maximum points achievable, ranging from 29 for the baseline item to 38 for the integrated proof item, while `timeLimitSeconds` constrains how long a student has to respond—31 seconds for the multiple-choice item up to 43 seconds for the proof item. The `isPublic` flag indicates whether the item is visible to all students; items 101 and 103 are public, while 100 and 102 are restricted. Each item is assigned to a subtopic via `subtopicId`, so item 100 belongs to subtopic 1, item 101 to subtopic 2, and so on.

**Table `Student`**

| studentId | studentName | enrollmentYear | isActive | learningProfile |
|---|---|---|---|---|
| 100 | Distributed Standard | 12 | true | pilot-learning-62 |
| 101 | Adaptive Framework D | 16 | false | extended-learning-63 |
| 102 | Primary Protocol | 20 | true | integrated-learning-64 |
| 103 | Composite Programme | 24 | false | seasonal-learning-65 |

Students are the learners who engage with the curriculum. The `Student` table records each learner's `studentId` (100 through 103), `studentName` such as "Distributed Standard" or "Adaptive Framework D," and `enrollmentYear`, which ranges from 12 to 24. The `isActive` flag indicates current enrollment status; "Distributed Standard" and "Primary Protocol" are active, while "Adaptive Framework D" and "Composite Programme" are inactive. The `learningProfile` field categorizes each student's instructional approach—`pilot-learning-62`, `extended-learning-63`, `integrated-learning-64`, and `seasonal-learning-65`—providing a basis for personalized curriculum delivery.

**Table `StudentResponse`**

| id | responseId | responseValue | isCorrect | scoreEarned | responseTimestamp | attemptNumber | itemId | studentId |
|---|---|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | baseline-response-31 | false | 13.95 | 2025-08-03T19:21:00 | 21 | 100 | 100 |
| 2 | 9736917 | pilot-response-32 | true | 17.90 | 2022-01-14T02:38:00 | 30 | 101 | 101 |
| 3 | 8189493 | extended-response-33 | false | 21.85 | 2023-06-25T09:55:00 | 39 | 102 | 102 |
| 4 | Invoice | integrated-response-34 | true | 25.80 | 2024-11-09T16:12:00 | 48 | 103 | 103 |

Student responses capture the moment of assessment. Each response has a unique `id` and a `responseId` string such as `ChIJr7cItPtt5kcRM6ry7ecIYgw` or `9736917`. The `responseValue` field holds the actual answer text—`baseline-response-31`, `pilot-response-32`, `extended-response-33`, and `integrated-response-34`—while `isCorrect` records whether the answer was evaluated as correct. The `scoreEarned` field quantifies performance numerically, ranging from 13.95 to 25.80 points. The `responseTimestamp` provides an ISO 8601 datetime for temporal analysis, and `attemptNumber` tracks how many times a student has tried the same item, with values from 21 to 48 in the current data. Each response is linked to its `itemId` and `studentId`, creating the critical bridge between learner and assessment.

**Table `CurriculumSubtopicAssessmentItem`**

| subtopicId | itemId |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The relationship between subtopics and assessment items is materialized in the join table `CurriculumSubtopicAssessmentItem`. This table explicitly enumerates which assessment items belong to which subtopics, ensuring that every item can be traced back to its instructional context. In the current dataset, each subtopic maps to exactly one assessment item, forming a one-to-one correspondence: subtopic 1 maps to item 100, subtopic 2 to item 101, subtopic 3 to item 102, and subtopic 4 to item 103. This structure supports future expansion where a single subtopic might host multiple assessment items of varying types and difficulties.

**Table `AssessmentItemStudentResponse`**

| itemId | responseId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The relationship between assessment items and student responses is materialized in the join table `AssessmentItemStudentResponse`. This table explicitly enumerates which student responses correspond to which assessment items, enabling traceability from a specific answer back to the question that prompted it. In the current dataset, each assessment item maps to exactly one student response, forming a one-to-one correspondence: item 100 maps to response id 1, item 101 to response id 2, item 102 to response id 3, and item 103 to response id 4. This structure supports future expansion where a single item might accumulate multiple responses from different students or multiple attempts by the same student.

**Table `StudentStudentResponse`**

| studentId | responseId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The relationship between students and their responses is materialized in the join table `StudentStudentResponse`. This table explicitly enumerates which student responses belong to which students, enabling traceability from a specific answer back to the learner who produced it. In the current dataset, each student maps to exactly one response: student 100 to response id 1, student 101 to response id 2, student 102 to response id 3, and student 103 to response id 4. This structure supports future expansion where a single student might accumulate multiple responses across different items and attempts.

**Table `StudentCurriculumTopic`**

| studentId | topicId |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

Student enrollment in curriculum topics is tracked through the join table `StudentCurriculumTopic`. This table explicitly enumerates which students are assigned to which topics, forming the enrollment graph that determines what curriculum each learner encounters. The current dataset establishes a direct one-to-one mapping: student 100 is enrolled in topic 1000, student 101 in topic 1001, student 102 in topic 1002, and student 103 in topic 1003. This structure supports future expansion where students might be enrolled in multiple topics simultaneously or topics might have multiple students.

### Curriculum Topic and Subtopic Relationships

The view `vw_curriculum_topic_curriculum_subtopic_detail` answers the question of which subtopics belong to which topics, joining the topic and subtopic tables through the relationship table. Reading the first row: topic 1000 ("Regional Model") contains subtopic 1 ("Primary Review A"), a concrete subtopic with a difficulty rating of 5.70. The second row shows the same topic 1000 also contains subtopic 2 ("Composite Initiative"), an abstract subtopic with a higher difficulty rating of 10.40. This view enables curriculum designers to see the full decomposition of each topic into its constituent subtopics.

The view `vw_curriculum_topic_curriculum_topic` provides a self-referential join on the topic table, revealing the prerequisite structure within the curriculum. Each row pairs a topic with its prerequisite topic; in the current data, every topic references itself, producing rows such as topic 1000 paired with prerequisite topic 1000. This view is useful for validating the integrity of the prerequisite graph and for detecting cycles or orphaned references.

The view `vw_curriculum_subtopic_curriculum_topic` joins subtopics to their parent topics, answering which topic each subtopic belongs to. The first row shows subtopic 1 ("Primary Review A") belongs to topic 1000 ("Regional Model"), a legacy-genus topic with complexity level 37. The second row shows subtopic 2 ("Composite Initiative") belongs to topic 1001 ("Seasonal Cluster D"), a compact-genus topic with complexity level 45 and core status. This view supports navigation from the granular subtopic level up to the broader topic context.

### Assessment Item and Subtopic Relationships

The view `vw_curriculum_subtopic_assessment_item_detail` joins subtopics to their assessment items, answering which items measure mastery within each subtopic. The first row shows subtopic 1 ("Primary Review A") is assessed by item 100, a multiple-choice question with a maximum score of 29 and a 31-second time limit. The second row shows subtopic 2 ("Composite Initiative") is assessed by item 101, a short-answer question with a maximum score of 32 and a 35-second time limit. This view is essential for curriculum designers who need to verify that every subtopic has an associated assessment and that the assessment format matches the subtopic's learning objectives.

The view `vw_assessment_item_curriculum_subtopic` provides the reverse perspective, joining assessment items back to their parent subtopics. The first row shows item 100 ("baseline-item-31") belongs to subtopic 1 ("Primary Review A"), which itself belongs to topic 1000 ("Regional Model"). The second row shows item 101 ("pilot-item-32") belongs to subtopic 2 ("Composite Initiative"), which belongs to topic 1001 ("Seasonal Cluster D"). This view supports drill-down analysis from an assessment item through its subtopic to its parent topic.

### Student Response and Assessment Relationships

The view `vw_assessment_item_student_response_detail` joins assessment items to student responses, answering which students answered which items and how they performed. The first row shows item 100 ("baseline-item-31") received response id 1 from student 100, with a response value of `baseline-response-31`, an incorrect evaluation, and a score of 13.95 earned on attempt 21. The second row shows item 101 ("pilot-item-32") received response id 2 from student 101, with a response value of `pilot-response-32`, a correct evaluation, and a score of 17.90 earned on attempt 30. This view is critical for performance analysis, enabling comparison of scores across items and identification of patterns in student performance.

The view `vw_student_response_assessment_item` provides the reverse perspective, joining student responses back to their parent assessment items. The first row shows response id 1 (`baseline-response-31`) was submitted for item 100, a multiple-choice question with a maximum score of 29. The second row shows response id 2 (`pilot-response-32`) was submitted for item 101, a short-answer question with a maximum score of 32. This view supports item-level analysis by aggregating all responses for a given item.

### Student and Response Relationships

The view `vw_student_response_student` joins student responses to their parent students, answering which student produced each response. The first row shows response id 1 was produced by student 100 ("Distributed Standard"), an active learner enrolled in year 12 with a pilot learning profile. The second row shows response id 2 was produced by student 101 ("Adaptive Framework D"), an inactive learner enrolled in year 16 with an extended learning profile. This view enables demographic and profile-based analysis of response patterns.

The view `vw_student_student_response_detail` provides a comprehensive join of students to their responses, combining student metadata with response details. The first row shows student 100 ("Distributed Standard") submitted response id 1 (`baseline-response-31`) for item 100, scoring 13.95 on attempt 21. The second row shows student 101 ("Adaptive Framework D") submitted response id 2 (`pilot-response-32`) for item 101, scoring 17.90 on attempt 30. This view is the primary analytical tool for correlating student characteristics with assessment performance.

### Student and Curriculum Topic Relationships

The view `vw_student_curriculum_topic_detail` joins students to their enrolled topics, answering which students are assigned to which curriculum topics. The first row shows student 100 ("Distributed Standard") is enrolled in topic 1000 ("Regional Model"), a legacy-genus topic with complexity level 37 that is not core. The second row shows student 101 ("Adaptive Framework D") is enrolled in topic 1001 ("Seasonal Cluster D"), a compact-genus topic with complexity level 45 that is core. This view supports enrollment analysis, enabling comparison of student performance across different topic types and complexity levels.

### Synthesis

The curriculum management system captures a complete learning lifecycle: topics define the instructional scope, subtopics decompose that scope into teachable units, assessment items measure mastery within each unit, and student responses record individual performance. The join tables materialize the many-to-many relationships that enable flexible curriculum design—subtopics shared across topics, students enrolled in multiple topics, and items grouped under subtopics. The analytical views synthesize these relationships into actionable perspectives, from topic-to-subtopic decomposition to student-to-response performance tracking. Together, these records form a coherent framework for curriculum delivery, assessment, and learner analytics.

## Data appendix

**View `vw_curriculum_topic_curriculum_subtopic_detail`**

```sql
CREATE VIEW vw_curriculum_topic_curriculum_subtopic_detail AS
SELECT a.id, a.topicId, a.topicName, b.id AS subtopic_id, b.subtopicId AS subtopic_subtopicId, b.subtopicName AS subtopic_subtopicName
FROM CurriculumTopic a
  JOIN CurriculumTopicCurriculumSubtopic j ON j.topicId = a.id
  JOIN CurriculumSubtopic b ON b.id = j.subtopicId;
```

| id | topicId | topicName | subtopic_id | subtopic_subtopicId | subtopic_subtopicName |
|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_b_VB-IC-Tab | Regional Model | 1 | 5082972 | Primary Review A |
| 1000 | lu_tax_code_template_b_VB-IC-Tab | Regional Model | 2 | 121 | Composite Initiative |
| 1001 | 8387534 | Seasonal Cluster D | 2 | 121 | Composite Initiative |
| 1001 | 8387534 | Seasonal Cluster D | 3 | 8843744 | Compact Model |
| 1002 | 2933463 | Integrated Review | 3 | 8843744 | Compact Model |
| 1002 | 2933463 | Integrated Review | 4 | 103181 | Legacy Cluster D |
| 1003 | 2839516 | Extended Initiative | 4 | 103181 | Legacy Cluster D |
| 1003 | 2839516 | Extended Initiative | 1 | 5082972 | Primary Review A |

**View `vw_curriculum_topic_curriculum_topic`**

```sql
CREATE VIEW vw_curriculum_topic_curriculum_topic AS
SELECT a.id, a.topicId, a.topicName, a.bfoGenus, b.id AS topic_id, b.topicId AS topic_topicId, b.topicName AS topic_topicName
FROM CurriculumTopic a JOIN CurriculumTopic b ON a.requiresPrerequisiteTopicId = b.id;
```

| id | topicId | topicName | bfoGenus | topic_id | topic_topicId | topic_topicName |
|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_b_VB-IC-Tab | Regional Model | legacy-bfo-43 | 1000 | lu_tax_code_template_b_VB-IC-Tab | Regional Model |
| 1001 | 8387534 | Seasonal Cluster D | compact-bfo-44 | 1001 | 8387534 | Seasonal Cluster D |
| 1002 | 2933463 | Integrated Review | composite-bfo-45 | 1002 | 2933463 | Integrated Review |
| 1003 | 2839516 | Extended Initiative | primary-bfo-46 | 1003 | 2839516 | Extended Initiative |

**View `vw_curriculum_subtopic_curriculum_topic`**

```sql
CREATE VIEW vw_curriculum_subtopic_curriculum_topic AS
SELECT a.id, a.subtopicId, a.subtopicName, a.bfoGenus, b.id AS topic_id, b.topicId AS topic_topicId, b.topicName AS topic_topicName
FROM CurriculumSubtopic a JOIN CurriculumTopic b ON a.topicId = b.id;
```

| id | subtopicId | subtopicName | bfoGenus | topic_id | topic_topicId | topic_topicName |
|---|---|---|---|---|---|---|
| 1 | 5082972 | Primary Review A | legacy-bfo-43 | 1000 | lu_tax_code_template_b_VB-IC-Tab | Regional Model |
| 2 | 121 | Composite Initiative | compact-bfo-44 | 1001 | 8387534 | Seasonal Cluster D |
| 3 | 8843744 | Compact Model | composite-bfo-45 | 1002 | 2933463 | Integrated Review |
| 4 | 103181 | Legacy Cluster D | primary-bfo-46 | 1003 | 2839516 | Extended Initiative |

**View `vw_curriculum_subtopic_assessment_item_detail`**

```sql
CREATE VIEW vw_curriculum_subtopic_assessment_item_detail AS
SELECT a.id, a.subtopicId, a.subtopicName, b.itemId AS item_itemId, b.itemText AS item_itemText, b.itemType AS item_itemType
FROM CurriculumSubtopic a
  JOIN CurriculumSubtopicAssessmentItem j ON j.subtopicId = a.id
  JOIN AssessmentItem b ON b.itemId = j.itemId;
```

| id | subtopicId | subtopicName | item_itemId | item_itemText | item_itemType |
|---|---|---|---|---|---|
| 1 | 5082972 | Primary Review A | 100 | baseline-item-31 | multiple_choice |
| 1 | 5082972 | Primary Review A | 101 | pilot-item-32 | short_answer |
| 2 | 121 | Composite Initiative | 101 | pilot-item-32 | short_answer |
| 2 | 121 | Composite Initiative | 102 | extended-item-33 | calculation |
| 3 | 8843744 | Compact Model | 102 | extended-item-33 | calculation |
| 3 | 8843744 | Compact Model | 103 | integrated-item-34 | proof |
| 4 | 103181 | Legacy Cluster D | 103 | integrated-item-34 | proof |
| 4 | 103181 | Legacy Cluster D | 100 | baseline-item-31 | multiple_choice |

**View `vw_assessment_item_curriculum_subtopic`**

```sql
CREATE VIEW vw_assessment_item_curriculum_subtopic AS
SELECT a.itemId, a.itemText, a.itemType, a.maxScore, b.id AS subtopic_id, b.subtopicId AS subtopic_subtopicId, b.subtopicName AS subtopic_subtopicName
FROM AssessmentItem a JOIN CurriculumSubtopic b ON a.subtopicId = b.id;
```

| itemId | itemText | itemType | maxScore | subtopic_id | subtopic_subtopicId | subtopic_subtopicName |
|---|---|---|---|---|---|---|
| 100 | baseline-item-31 | multiple_choice | 29 | 1 | 5082972 | Primary Review A |
| 101 | pilot-item-32 | short_answer | 32 | 2 | 121 | Composite Initiative |
| 102 | extended-item-33 | calculation | 35 | 3 | 8843744 | Compact Model |
| 103 | integrated-item-34 | proof | 38 | 4 | 103181 | Legacy Cluster D |

**View `vw_assessment_item_student_response_detail`**

```sql
CREATE VIEW vw_assessment_item_student_response_detail AS
SELECT a.itemId, a.itemText, a.itemType, b.id AS response_id, b.responseId AS response_responseId, b.responseValue AS response_responseValue
FROM AssessmentItem a
  JOIN AssessmentItemStudentResponse j ON j.itemId = a.itemId
  JOIN StudentResponse b ON b.id = j.responseId;
```

| itemId | itemText | itemType | response_id | response_responseId | response_responseValue |
|---|---|---|---|---|---|
| 100 | baseline-item-31 | multiple_choice | 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | baseline-response-31 |
| 100 | baseline-item-31 | multiple_choice | 2 | 9736917 | pilot-response-32 |
| 101 | pilot-item-32 | short_answer | 2 | 9736917 | pilot-response-32 |
| 101 | pilot-item-32 | short_answer | 3 | 8189493 | extended-response-33 |
| 102 | extended-item-33 | calculation | 3 | 8189493 | extended-response-33 |
| 102 | extended-item-33 | calculation | 4 | Invoice | integrated-response-34 |
| 103 | integrated-item-34 | proof | 4 | Invoice | integrated-response-34 |
| 103 | integrated-item-34 | proof | 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | baseline-response-31 |

**View `vw_student_response_assessment_item`**

```sql
CREATE VIEW vw_student_response_assessment_item AS
SELECT a.id, a.responseId, a.responseValue, a.isCorrect, b.itemId AS item_itemId, b.itemText AS item_itemText, b.itemType AS item_itemType
FROM StudentResponse a JOIN AssessmentItem b ON a.itemId = b.itemId;
```

| id | responseId | responseValue | isCorrect | item_itemId | item_itemText | item_itemType |
|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | baseline-response-31 | false | 100 | baseline-item-31 | multiple_choice |
| 2 | 9736917 | pilot-response-32 | true | 101 | pilot-item-32 | short_answer |
| 3 | 8189493 | extended-response-33 | false | 102 | extended-item-33 | calculation |
| 4 | Invoice | integrated-response-34 | true | 103 | integrated-item-34 | proof |

**View `vw_student_response_student`**

```sql
CREATE VIEW vw_student_response_student AS
SELECT a.id, a.responseId, a.responseValue, a.isCorrect, b.studentId AS student_studentId, b.studentName AS student_studentName, b.enrollmentYear AS student_enrollmentYear
FROM StudentResponse a JOIN Student b ON a.studentId = b.studentId;
```

| id | responseId | responseValue | isCorrect | student_studentId | student_studentName | student_enrollmentYear |
|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | baseline-response-31 | false | 100 | Distributed Standard | 12 |
| 2 | 9736917 | pilot-response-32 | true | 101 | Adaptive Framework D | 16 |
| 3 | 8189493 | extended-response-33 | false | 102 | Primary Protocol | 20 |
| 4 | Invoice | integrated-response-34 | true | 103 | Composite Programme | 24 |

**View `vw_student_student_response_detail`**

```sql
CREATE VIEW vw_student_student_response_detail AS
SELECT a.studentId, a.studentName, a.enrollmentYear, b.id AS response_id, b.responseId AS response_responseId, b.responseValue AS response_responseValue
FROM Student a
  JOIN StudentStudentResponse j ON j.studentId = a.studentId
  JOIN StudentResponse b ON b.id = j.responseId;
```

| studentId | studentName | enrollmentYear | response_id | response_responseId | response_responseValue |
|---|---|---|---|---|---|
| 100 | Distributed Standard | 12 | 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | baseline-response-31 |
| 100 | Distributed Standard | 12 | 2 | 9736917 | pilot-response-32 |
| 101 | Adaptive Framework D | 16 | 2 | 9736917 | pilot-response-32 |
| 101 | Adaptive Framework D | 16 | 3 | 8189493 | extended-response-33 |
| 102 | Primary Protocol | 20 | 3 | 8189493 | extended-response-33 |
| 102 | Primary Protocol | 20 | 4 | Invoice | integrated-response-34 |
| 103 | Composite Programme | 24 | 4 | Invoice | integrated-response-34 |
| 103 | Composite Programme | 24 | 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | baseline-response-31 |

**View `vw_student_curriculum_topic_detail`**

```sql
CREATE VIEW vw_student_curriculum_topic_detail AS
SELECT a.studentId, a.studentName, a.enrollmentYear, b.id AS topic_id, b.topicId AS topic_topicId, b.topicName AS topic_topicName
FROM Student a
  JOIN StudentCurriculumTopic j ON j.studentId = a.studentId
  JOIN CurriculumTopic b ON b.id = j.topicId;
```

| studentId | studentName | enrollmentYear | topic_id | topic_topicId | topic_topicName |
|---|---|---|---|---|---|
| 100 | Distributed Standard | 12 | 1000 | lu_tax_code_template_b_VB-IC-Tab | Regional Model |
| 100 | Distributed Standard | 12 | 1001 | 8387534 | Seasonal Cluster D |
| 101 | Adaptive Framework D | 16 | 1001 | 8387534 | Seasonal Cluster D |
| 101 | Adaptive Framework D | 16 | 1002 | 2933463 | Integrated Review |
| 102 | Primary Protocol | 20 | 1002 | 2933463 | Integrated Review |
| 102 | Primary Protocol | 20 | 1003 | 2839516 | Extended Initiative |
| 103 | Composite Programme | 24 | 1003 | 2839516 | Extended Initiative |
| 103 | Composite Programme | 24 | 1000 | lu_tax_code_template_b_VB-IC-Tab | Regional Model |
