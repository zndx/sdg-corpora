```bash
write_file(
    path="/tmp/harness_semantic_0hfyreiy/chapter.md",
    content="## Ontology-Grounded Relational Modelling of a Curriculum–Assessment Ecosystem\n\nThe domain under examination is a curriculum–assessment ecosystem in which structured learning topics are decomposed into subtopics, each subtopic hosts assessment items, and students produce responses to those items. The data model is ontology-grounded: every entity type carries a `bfoGenus` column that anchors the class in a Basic Formal Ontology hierarchy, and every relationship is materialised as a foreign key or a junction table so that the normalised schema faithfully mirrors the conceptual structure. The following sections walk through the base tables, the junction tables that resolve many-to-many relationships, and the views that reconstruct domain facts from the normalised tables.\n\n### Base Tables and Their Ontological Anchors\n\nThe curriculum hierarchy begins with the `CurriculumTopic` table, which stores the top-level learning units. Each row carries a surrogate `id`, a business-level `topicId`, a human-readable `topicName`, an ontology anchor in `bfoGenus`, a numeric `complexityLevel`, a boolean `isCore` flag, and a self-referencing `requiresPrerequisiteTopicId` that encodes prerequisite ordering within the topic layer.\n\n\n\nThe `bfoGenus` column distinguishes four ontology classes across the four rows: `legacy-bfo-43`, `compact-bfo-44`, `composite-bfo-45`, and `primary-bfo-46`. The `complexityLevel` values range from 37 to 61, and the `isCore` flag is `true` for rows with `topicName` values such as *Seasonal Cluster D* and *Extended Initiative*, while *Regional Model* and *Integrated Review* are marked `false`. The self-referencing `requiresPrerequisiteTopicId` currently points to the same `id` in every row, indicating that the prerequisite graph is not yet populated with cross-topic edges.\n\nBeneath topics sit the `CurriculumSubtopic` table, which stores the finer-grained learning units. Each subtopic has a surrogate `id`, a business `subtopicId`, a `subtopicName`, a `bfoGenus` column, a boolean `isAbstract` flag, a numeric `difficultyRating`, and a foreign key `topicId` that links the subtopic to its parent topic.\n\n\n\nThe `bfoGenus` values in this table mirror those in `CurriculumTopic` — `legacy-bfo-43`, `compact-bfo-44`, `composite-bfo-45`, and `primary-bfo-46` — confirming that subtopics inherit the same ontology partitioning. The `difficultyRating` column spans from 5.70 (*Primary Review A*) to 19.80 (*Legacy Cluster D*), and the `isAbstract` flag is `true` for *Composite Initiative* and *Legacy Cluster D*. The `topicId` foreign key distributes the four subtopics across the four topics: subtopic 1 belongs to topic 1000, subtopic 2 to both topics 1000 and 1001, subtopic 3 to both topics 1001 and 1002, and subtopic 4 to both topics 1002 and 1003.\n\nAssessment items are stored in the `AssessmentItem` table. Each row carries a surrogate `itemId`, the actual question text in `itemText`, an `itemType` enum (such as `multiple_choice`, `short_answer`, `calculation`, or `proof`), a `maxScore`, a `timeLimitSeconds`, a boolean `isPublic` flag, and a foreign key `subtopicId` linking the item to its parent subtopic.\n\n\n\nThe four items illustrate the full range of `itemType` values: item 100 is a `multiple_choice` question with `maxScore` 29 and `timeLimitSeconds` 31, item 101 is a `short_answer` with `maxScore` 32 and `timeLimitSeconds` 35, item 102 is a `calculation` with `maxScore` 35 and `timeLimitSeconds` 39, and item 103 is a `proof` with `maxScore` 38 and `timeLimitSeconds` 43. The `isPublic` flag is `true` for items 101 and 103. Each item is assigned to exactly one subtopic via the `subtopicId` foreign key, creating a one-to-many relationship from subtopic to assessment item.\n\nStudent records live in the `Student` table, which stores a surrogate `studentId`, a `studentName`, an `enrollmentYear`, an `isActive` boolean, and a `learningProfile` string.\n\n\n\nThe four students — *Distributed Standard*, *Adaptive Framework D*, *Primary Protocol*, and *Composite Programme* — have `enrollmentYear` values of 12, 16, 20, and 24 respectively. The `isActive` flag is `true` for *Distributed Standard* and *Primary Protocol*, and `false` for *Adaptive Framework D* and *Composite Programme*. The `learningProfile` column carries descriptive strings such as `pilot-learning-62` and `seasonal-learning-65`.\n\nStudent responses are captured in the `StudentResponse` table. Each row has a surrogate `id`, a business `responseId`, the actual `responseValue` text, an `isCorrect` boolean, a numeric `scoreEarned`, a `responseTimestamp`, an `attemptNumber`, and two foreign keys: `itemId` linking the response to the assessment item, and `studentId` linking it to the student.\n\n\n\nThe four response rows demonstrate the schema in action. Response 1 (business `responseId` `ChIJr7cItPtt5kcRM6ry7ecIYgw`) was submitted by student 100 for item 100, was marked `isCorrect` as `false`, earned a `scoreEarned` of 13.95, and occurred at `2025-08-03T19:21:00` on attempt 21. Response 2 (business `responseId` `9736917`) was submitted by student 101 for item 101, was marked `isCorrect` as `true`, earned 17.90, and occurred at `2022-01-14T02:38:00` on attempt 30. Response 3 (business `responseId` `8189493`) was submitted by student 102 for item 102, was marked `isCorrect` as `false`, earned 21.85, and occurred at `2023-06-25T09:55:00` on attempt 39. Response 4 (business `responseId` `Invoice`) was submitted by student 103 for item 103, was marked `isCorrect` as `true`, earned 25.80, and occurred at `2024-11-09T16:12:00` on attempt 48.\n\n### Junction Tables and Many-to-Many Relationships\n\nThe relationship between `CurriculumTopic` and `CurriculumSubtopic` is many-to-many: a topic can contain multiple subtopics, and a subtopic can belong to multiple topics. This relationship is materialised in the `CurriculumTopicCurriculumSubtopic` junction table, which stores pairs of `topicId` and `subtopicId`.\n\n\n\nThe eight rows encode the following edges: topic 1000 contains subtopics 1 and 2; topic 1001 contains subtopics 2 and 3; topic 1002 contains subtopics 3 and 4; and topic 1003 contains subtopics 4 and 1. This creates a cyclic dependency graph where each topic shares subtopics with its neighbours.\n\nThe relationship between `CurriculumSubtopic` and `AssessmentItem` is one-to-many, but it is also materialised as a junction table `CurriculumSubtopicAssessmentItem` to maintain a uniform pattern across the schema. Each row stores a `subtopicId` and an `itemId`.\n\n\n\nThe four rows link subtopic 1 to item 100, subtopic 2 to item 101, subtopic 3 to item 102, and subtopic 4 to item 103, confirming the one-to-many mapping.\n\nThe relationship between `AssessmentItem` and `StudentResponse` is one-to-many, materialised in the `AssessmentItemStudentResponse` junction table. Each row stores an `itemId` and a `responseId`.\n\n\n\nThe four rows link item 100 to response 1, item 101 to response 2, item 102 to response 3, and item 103 to response 4.\n\nThe relationship between `Student` and `StudentResponse` is one-to-many, materialised in the `StudentStudentResponse` junction table. Each row stores a `studentId` and a `responseId`.\n\n\n\nThe four rows link student 100 to response 1, student 101 to response 2, student 102 to response 3, and student 103 to response 4.\n\nFinally, the relationship between `Student` and `CurriculumTopic` is many-to-many, materialised in the `StudentCurriculumTopic` junction table. Each row stores a `studentId` and a `topicId`.\n\n\n\nThe four rows link student 100 to topic 1000, student 101 to topic 1001, student 102 to topic 1002, and student 103 to topic 1003.\n\n### Views: Reconstructing Domain Facts\n\nThe views in this schema join the normalised tables to answer specific analytical questions. Each view is described below with its join logic and representative rows.\n\nThe view `vw_curriculum_topic_curriculum_subtopic_detail` joins `CurriculumTopic` to `CurriculumSubtopic` through the `CurriculumTopicCurriculumSubtopic` junction table, producing a flat view of topic–subtopic membership.\n\n\n\nThis view answers the question \"which subtopics belong to which topics?\" Reading the first two rows: topic 1000 (*Regional Model*) contains subtopic 1 (*Primary Review A*) and subtopic 2 (*Composite Initiative*). The `bfoGenus` values from both tables are present, allowing an analyst to verify that the ontology partitioning is consistent across the topic–subtopic boundary.\n\nThe view `vw_curriculum_topic_curriculum_topic` joins `CurriculumTopic` to itself through the `requiresPrerequisiteTopicId` self-reference, producing a view of topic–prerequisite relationships.\n\n\n\nThis view answers the question \"which topic requires which prerequisite topic?\" Since every row currently has `requiresPrerequisiteTopicId` equal to its own `id`, all four rows show a self-loop: topic 1000 (*Regional Model*) requires topic 1000, topic 1001 (*Seasonal Cluster D*) requires topic 1001, and so on. When the prerequisite graph is populated with cross-topic edges, this view will reveal the actual dependency structure.\n\nThe view `vw_curriculum_subtopic_curriculum_topic` joins `CurriculumSubtopic` to `CurriculumTopic` through the `CurriculumTopicCurriculumSubtopic` junction table, producing a subtopic-to-topic mapping.\n\n\n\nThis view answers the question \"which topics contain a given subtopic?\" Reading the first two rows: subtopic 1 (*Primary Review A*) belongs to topic 1000 (*Regional Model*), and subtopic 2 (*Composite Initiative*) belongs to both topic 1000 (*Regional Model*) and topic 1001 (*Seasonal Cluster D*). The `difficultyRating` from the subtopic and the `complexityLevel` from the topic are both present, enabling cross-level analysis.\n\nThe view `vw_curriculum_subtopic_assessment_item_detail` joins `CurriculumSubtopic` to `AssessmentItem` through the `CurriculumSubtopicAssessmentItem` junction table, producing a subtopic-to-item mapping.\n\n\n\nThis view answers the question \"which assessment items belong to which subtopics?\" Reading the first two rows: subtopic 1 (*Primary Review A*) contains item 100 (`baseline-item-31`, type `multiple_choice`, `maxScore` 29), and subtopic 2 (*Composite Initiative*) contains item 101 (`pilot-item-32`, type `short_answer`, `maxScore` 32). The `isAbstract` flag from the subtopic and the `isPublic` flag from the item are both present.\n\nThe view `vw_assessment_item_curriculum_subtopic` joins `AssessmentItem` to `CurriculumSubtopic` through the `CurriculumSubtopicAssessmentItem` junction table, producing an item-to-subtopic mapping.\n\n\n\nThis view answers the question \"which subtopic does a given assessment item belong to?\" Reading the first two rows: item 100 (`baseline-item-31`) belongs to subtopic 1 (*Primary Review A*), and item 101 (`pilot-item-32`) belongs to subtopic 2 (*Composite Initiative*). The `itemType` and `maxScore` from the item are paired with the `difficultyRating` from the subtopic.\n\nThe view `vw_assessment_item_student_response_detail` joins `AssessmentItem` to `StudentResponse` through the `AssessmentItemStudentResponse` junction table, producing an item-to-response mapping.\n\n\n\nThis view answers the question \"which student responses were submitted for a given assessment item?\" Reading the first two rows: item 100 (`baseline-item-31`) has response 1 (`ChIJr7cItPtt5kcRM6ry7ecIYgw`, `isCorrect` = `false`, `scoreEarned` = 13.95), and item 101 (`pilot-item-32`) has response 2 (`9736917`, `isCorrect` = `true`, `scoreEarned` = 17.90). The `itemType` from the item and the `attemptNumber` from the response are both present.\n\nThe view `vw_student_response_assessment_item` joins `StudentResponse` to `AssessmentItem` through the `AssessmentItemStudentResponse` junction table, producing a response-to-item mapping.\n\n\n\nThis view answers the question \"which assessment item was a given student response submitted for?\" Reading the first two rows: response 1 (`ChIJr7cItPtt5kcRM6ry7ecIYgw`) was submitted for item 100 (`baseline-item-31`, type `multiple_choice`), and response 2 (`9736917`) was submitted for item 101 (`pilot-item-32`, type `short_answer`). The `scoreEarned` and `isCorrect` from the response are paired with the `maxScore` from the item.\n\nThe view `vw_student_response_student` joins `StudentResponse` to `Student` through the `StudentStudentResponse` junction table, producing a response-to-student mapping.\n\n\n\nThis view answers the question \"which student submitted a given response?\" Reading the first two rows: response 1 (`ChIJr7cItPtt5kcRM6ry7ecIYgw`) was submitted by student 100 (*Distributed Standard*, `enrollmentYear` 12, `isActive` = `true`), and response 2 (`9736917`) was submitted by student 101 (*Adaptive Framework D*, `enrollmentYear` 16, `isActive` = `false`). The `learningProfile` from the student and the `responseTimestamp` from the response are both present.\n\nThe view `vw_student_student_response_detail` joins `Student` to `StudentResponse` through the `StudentStudentResponse` junction table, producing a student-to-response mapping.\n\n\n\nThis view answers the question \"which responses were submitted by a given student?\" Reading the first two rows: student 100 (*Distributed Standard*) submitted response 1 (`ChIJr7cItPtt5kcRM6ry7ecIYgw`, `isCorrect` = `false`, `scoreEarned` = 13.95), and student 101 (*Adaptive Framework D*) submitted response 2 (`9736917`, `isCorrect` = `true`, `scoreEarned` = 17.90). The `learningProfile` from the student and the `attemptNumber` from the response are both present.\n\nThe view `vw_student_curriculum_topic_detail` joins `Student` to `CurriculumTopic` through the `StudentCurriculumTopic` junction table, producing a student-to-topic mapping.\n\n\n\nThis view answers the question \"which curriculum topics is a given student enrolled in?\" Reading the first two rows: student 100 (*Distributed Standard*) is enrolled in topic 1000 (*Regional Model*, `bfoGenus` = `legacy-bfo-43`, `complexityLevel` 37), and student 101 (*Adaptive Framework D*) is enrolled in topic 1001 (*Seasonal Cluster D*, `bfoGenus` = `compact-bfo-44`, `complexityLevel` 45). The `enrollmentYear` and `isActive` from the student are paired with the `isCore` flag from the topic.\n\n### Synthesis\n\nThe schema implements a clean separation between the curriculum hierarchy (topics and subtopics), the assessment layer (items), and the learner layer (students and responses). The `bfoGenus` column appears in both `CurriculumTopic` and `CurriculumSubtopic`, anchoring the curriculum ontology in a formal upper ontology and enabling ontology-aware queries. The junction tables (`CurriculumTopicCurriculumSubtopic`, `CurriculumSubtopicAssessmentItem`, `AssessmentItemStudentResponse`, `StudentStudentResponse`, `StudentCurriculumTopic`) materialise every many-to-many relationship as a first-class entity, ensuring that the schema can be extended with relationship attributes without structural changes. The views reconstruct the domain facts that analysts need — topic–subtopic membership, item–subtopic assignment, response–item linkage, response–student linkage, and student–topic enrollment — by joining the normalised tables. Each view preserves the ontology columns (`bfoGenus`, `isAbstract`, `isCore`) alongside the operational columns (`difficultyRating`, `maxScore`, `scoreEarned`, `isCorrect`), allowing queries to reason about both the conceptual structure and the operational data in a single pass."
)
```

## Data appendix

**Table `CurriculumTopic`**

| id | topicId | topicName | bfoGenus | complexityLevel | isCore | requiresPrerequisiteTopicId |
|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_b_VB-IC-Tab | Regional Model | legacy-bfo-43 | 37 | false | 1000 |
| 1001 | 8387534 | Seasonal Cluster D | compact-bfo-44 | 45 | true | 1001 |
| 1002 | 2933463 | Integrated Review | composite-bfo-45 | 53 | false | 1002 |
| 1003 | 2839516 | Extended Initiative | primary-bfo-46 | 61 | true | 1003 |

**Table `CurriculumSubtopic`**

| id | subtopicId | subtopicName | bfoGenus | isAbstract | difficultyRating | topicId |
|---|---|---|---|---|---|---|
| 1 | 5082972 | Primary Review A | legacy-bfo-43 | false | 5.70 | 1000 |
| 2 | 121 | Composite Initiative | compact-bfo-44 | true | 10.40 | 1001 |
| 3 | 8843744 | Compact Model | composite-bfo-45 | false | 15.10 | 1002 |
| 4 | 103181 | Legacy Cluster D | primary-bfo-46 | true | 19.80 | 1003 |

**Table `AssessmentItem`**

| itemId | itemText | itemType | maxScore | timeLimitSeconds | isPublic | subtopicId |
|---|---|---|---|---|---|---|
| 100 | baseline-item-31 | multiple_choice | 29 | 31 | false | 1 |
| 101 | pilot-item-32 | short_answer | 32 | 35 | true | 2 |
| 102 | extended-item-33 | calculation | 35 | 39 | false | 3 |
| 103 | integrated-item-34 | proof | 38 | 43 | true | 4 |

**Table `StudentResponse`**

| id | responseId | responseValue | isCorrect | scoreEarned | responseTimestamp | attemptNumber | itemId | studentId |
|---|---|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | baseline-response-31 | false | 13.95 | 2025-08-03T19:21:00 | 21 | 100 | 100 |
| 2 | 9736917 | pilot-response-32 | true | 17.90 | 2022-01-14T02:38:00 | 30 | 101 | 101 |
| 3 | 8189493 | extended-response-33 | false | 21.85 | 2023-06-25T09:55:00 | 39 | 102 | 102 |
| 4 | Invoice | integrated-response-34 | true | 25.80 | 2024-11-09T16:12:00 | 48 | 103 | 103 |

**Table `Student`**

| studentId | studentName | enrollmentYear | isActive | learningProfile |
|---|---|---|---|---|
| 100 | Distributed Standard | 12 | true | pilot-learning-62 |
| 101 | Adaptive Framework D | 16 | false | extended-learning-63 |
| 102 | Primary Protocol | 20 | true | integrated-learning-64 |
| 103 | Composite Programme | 24 | false | seasonal-learning-65 |

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
