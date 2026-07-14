In educational assessment systems, the lifecycle of a test item — from its conceptual origin through source material grounding, marking scheme assignment, and answer-key specification — demands a normalized data model that preserves every traceable relationship while supporting efficient retrieval. The schema presented here captures that lifecycle across six base tables and ten materialized views. Each base table isolates a single concern: the assessment item itself, the source material it draws from, the marking scheme that governs its evaluation, the conceptual knowledge it tests, the answer keys that define correct responses, and the scoring rules that operationalize partial credit. The views then reassemble these concerns into domain-level facts by joining the appropriate tables on their foreign keys.

**Table `assessment_items`**

| id | item_identifier | section_designation | question_number | sub_question_index | allocated_marks | item_type | status | source_material_id | marking_scheme_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2045 | A | 9 | 23 | 4.95 | Objective | Draft | 1 | 1 |
| 2 | ITE-2050 | B | 15 | 29 | 8.90 | Subjective | Finalized | 2 | 2 |
| 3 | ITE-2055 | A | 21 | 35 | 12.85 | Objective | Published | 3 | 3 |
| 4 | ITE-2060 | B | 27 | 41 | 16.80 | Subjective | Draft | 4 | 4 |

The `assessment_items` table is the central entity of the schema. Every row represents a single test question, identified by a surrogate primary key `id` and a human-readable `item_identifier` such as `ITE-2045` or `ITE-2060`. The `section_designation` column (values like `A` and `B`) groups items into exam sections, while `question_number` and `sub_question_index` provide hierarchical positioning — for instance, item `ITE-2055` sits at question 21, sub-question 35. The `allocated_marks` column stores the maximum score a student can earn, ranging from 4.95 for `ITE-2045` to 16.80 for `ITE-2060`. The `item_type` distinguishes between `Objective` and `Subjective` questions, and `status` tracks the item's workflow state (`Draft`, `Finalized`, `Published`). Two foreign keys anchor this table to the rest of the schema: `source_material_id` references `source_materials.id`, and `marking_scheme_id` references `marking_schemes.marking_scheme_id`. These relationships are cardinality-bounded — each assessment item references exactly one source material and one marking scheme — which is why they materialize as simple integer columns rather than junction tables.

**Table `source_materials`**

| id | title | publisher | unit_number | chapter_number | page_reference | material_type | assessment_item_id |
|---|---|---|---|---|---|---|---|
| 1 | Compact Initiative | pilot-publishe-50 | UNI-2100 | CHA-2318 | 17 | NCERT | 1 |
| 2 | Legacy Model | extended-publishe-51 | UNI-2104 | CHA-2324 | 26 | Facilitator Handbook | 2 |
| 3 | Regional Cluster A | integrated-publishe-52 | UNI-2108 | CHA-2330 | 35 | CBSE Study Material | 3 |
| 4 | Seasonal Review | seasonal-publishe-53 | UNI-2112 | CHA-2336 | 44 | NCERT | 4 |

The `source_materials` table captures the educational resources from which assessment items are derived. Each row carries a surrogate `id`, a `title` (e.g., `Compact Initiative`, `Legacy Model`), and a `publisher` string such as `pilot-publishe-50` or `seasonal-publishe-53`. The `unit_number` and `chapter_number` columns (values like `UNI-2100` and `CHA-2318`) encode the curricular location of the material, while `page_reference` gives the exact page. The `material_type` column classifies the resource as `NCERT`, `Facilitator Handbook`, or `CBSE Study Material`. The foreign key `assessment_item_id` points back to `assessment_items.id`, establishing a one-to-one correspondence in the sample data: source material `id = 1` (titled `Compact Initiative`) is linked to assessment item `ITE-2045`, and source material `id = 4` (`Seasonal Review`) is linked to `ITE-2060`. In a production system this relationship could be one-to-many, but the current schema supports the one-to-one cardinality observed in the data.

**Table `marking_schemes`**

| marking_scheme_id | scheme_identifier | academic_session | subject_code | total_marks | duration_minutes | version | assessment_item_id |
|---|---|---|---|---|---|---|---|
| 1 | SCH-2216 | composite-academic-99 | de_AT | 7 | 35 | seasonal-version-71 | 1 |
| 2 | SCH-2217 | primary-academic-100 | template_impcode_pagata_art15 | 45 | 38 | regional-version-72 | 2 |
| 3 | SCH-2218 | adaptive-academic-101 | lu_tax_code_template_m_I | 9 | 41 | legacy-version-73 | 3 |
| 4 | SCH-2219 | distributed-academic-102 | 990e161e10664c5885182d95dc07e606 | 16 | 44 | compact-version-74 | 4 |

The `marking_schemes` table defines the evaluation framework applied to each assessment item. Its primary key is `marking_scheme_id`, and each row includes a `scheme_identifier` (e.g., `SCH-2216`, `SCH-2219`), an `academic_session` such as `composite-academic-99`, and a `subject_code` that varies widely in format — from the language code `de_AT` to the opaque identifier `990e161e10664c5885182d95dc07e606`. The `total_marks` column specifies the maximum score for the assessment (values of 7, 45, 9, and 16 in the sample), while `duration_minutes` records the allotted time (35, 38, 41, and 44 minutes respectively). The `version` column (e.g., `seasonal-version-71`, `compact-version-74`) supports iterative refinement of the marking scheme. The foreign key `assessment_item_id` links each marking scheme to exactly one assessment item, completing the bidirectional relationship initiated by `assessment_items.marking_scheme_id`.

**Table `concepts`**

| concept_id | concept_name | domain_category | definition_text | complexity_level | assessment_item_id | source_material_id |
|---|---|---|---|---|---|---|
| 1 | Pilot Cluster | AI | primary-definiti-70 | Basic | 1 | 1 |
| 2 | Baseline Review | Employability | adaptive-definiti-71 | Intermediate | 2 | 2 |
| 3 | Distributed Initiative A | Data Science | distributed-definiti-72 | Advanced | 3 | 3 |
| 4 | Adaptive Model | AI | baseline-definiti-73 | Basic | 4 | 4 |

The `concepts` table models the domain knowledge that each assessment item tests. Its primary key is `concept_id`, and each row contains a `concept_name` (e.g., `Pilot Cluster`, `Distributed Initiative A`), a `domain_category` such as `AI` or `Employability`, and a `definition_text` (e.g., `primary-definiti-70`, `distributed-definiti-72`). The `complexity_level` column classifies the concept as `Basic`, `Intermediate`, or `Advanced`. Two foreign keys connect this table to the rest of the schema: `assessment_item_id` references `assessment_items.id`, and `source_material_id` references `source_materials.id`. In the sample data, concept `id = 1` (`Pilot Cluster`, domain `AI`, complexity `Basic`) is linked to both assessment item `ITE-2045` and source material `Compact Initiative`, illustrating how a single concept can serve as the intellectual bridge between a question and its source.

**Table `answer_keys`**

| id | key_identifier | response_text | is_correct | alternative_accepted | format_type | assessment_item_id | concept_id |
|---|---|---|---|---|---|---|---|
| 1 | KEY-2124 | adaptive-response-47 | false | true | Single Choice | 1 | 1 |
| 2 | KEY-2127 | distributed-response-48 | true | false | Multiple Choice | 2 | 2 |
| 3 | KEY-2130 | baseline-response-49 | false | true | Short Answer | 3 | 3 |
| 4 | KEY-2133 | pilot-response-50 | true | false | Long Answer | 4 | 4 |

The `answer_keys` table stores the expected responses for each assessment item. Its primary key is `id`, and each row includes a `key_identifier` (e.g., `KEY-2124`, `KEY-2133`), the `response_text` (e.g., `adaptive-response-47`, `pilot-response-50`), and a boolean `is_correct` flag indicating whether the response is the correct answer. The `alternative_accepted` column (values `true` or `false`) signals whether other responses are also acceptable. The `format_type` column classifies the answer format as `Single Choice`, `Multiple Choice`, `Short Answer`, or `Long Answer`. Two foreign keys anchor this table: `assessment_item_id` references `assessment_items.id`, and `concept_id` references `concepts.concept_id`. For example, answer key `KEY-2127` (response `distributed-response-48`, marked correct, format `Multiple Choice`) is linked to assessment item `ITE-2050` and concept `Baseline Review`, demonstrating how the answer key ties a specific response to both the question and the underlying concept.

**Table `scoring_rules`**

| id | rule_identifier | required_points | points_awarded | condition_type | penalty_applied | assessment_item_id | answer_key_id |
|---|---|---|---|---|---|---|---|
| 1 | RUL-2144 | 36 | 15.20 | Keyword Match | true | 1 | 1 |
| 2 | RUL-2151 | 39 | 18.40 | Concept Explanation | false | 2 | 2 |
| 3 | RUL-2158 | 42 | 21.60 | List Items | true | 3 | 3 |
| 4 | RUL-2165 | 45 | 24.80 | Justification | false | 4 | 4 |

The `scoring_rules` table operationalizes partial-credit evaluation by defining how answer keys are scored. Its primary key is `id`, and each row carries a `rule_identifier` (e.g., `RUL-2144`, `RUL-2165`), the `required_points` (e.g., 36, 39, 42, 45) that a response must meet, and the `points_awarded` (e.g., 15.20, 18.40, 21.60, 24.80) that the student receives upon meeting the condition. The `condition_type` column specifies the matching criterion — `Keyword Match`, `Concept Explanation`, `List Items`, or `Justification` — while `penalty_applied` (boolean `true` or `false`) indicates whether a penalty is deducted for incorrect responses. Two foreign keys connect this table: `assessment_item_id` references `assessment_items.id`, and `answer_key_id` references `answer_keys.id`. For instance, scoring rule `RUL-2151` (required 39 points, awards 18.40, condition `Concept Explanation`, no penalty) is linked to assessment item `ITE-2050` and answer key `KEY-2127`, showing how the scoring rule refines the evaluation of a specific answer.

The foreign-key topology of the schema forms a directed acyclic graph rooted at `assessment_items`. The `source_materials` and `marking_schemes` tables each hold a single foreign key pointing to `assessment_items`, creating one-to-one or one-to-many relationships that are materialized as integer columns. The `concepts` table holds two foreign keys — one to `assessment_items` and one to `source_materials` — making it a junction-like entity that bridges the assessment and source domains. The `answer_keys` table similarly holds two foreign keys, linking to both `assessment_items` and `concepts`. Finally, `scoring_rules` holds two foreign keys, connecting to `answer_keys` and `assessment_items`. This structure ensures that every fact in the domain can be reconstructed by joining the appropriate tables along their foreign-key edges.

**View `v_assessment_item_source_material`**

```sql
CREATE VIEW v_assessment_item_source_material AS
SELECT a.id, a.item_identifier, a.section_designation, a.question_number, b.id AS material_id, b.title AS material_title, b.publisher AS material_publisher
FROM assessment_items a JOIN source_materials b ON a.source_material_id = b.id;
```

| id | item_identifier | section_designation | question_number | material_id | material_title | material_publisher |
|---|---|---|---|---|---|---|
| 1 | ITE-2045 | A | 9 | 1 | Compact Initiative | pilot-publishe-50 |
| 2 | ITE-2050 | B | 15 | 2 | Legacy Model | extended-publishe-51 |
| 3 | ITE-2055 | A | 21 | 3 | Regional Cluster A | integrated-publishe-52 |
| 4 | ITE-2060 | B | 27 | 4 | Seasonal Review | seasonal-publishe-53 |

The view `v_assessment_item_source_material` joins `assessment_items` to `source_materials` on `assessment_items.source_material_id = source_materials.id`, answering the question: "Which source material grounds each assessment item?" The joined result surfaces columns from both tables side by side. For example, the row for `ITE-2045` (section `A`, question 9, 4.95 marks, `Objective`, `Draft`) is paired with source material `Compact Initiative` (publisher `pilot-publishe-50`, unit `UNI-2100`, chapter `CHA-2318`, page 17, type `NCERT`). This view is the most direct projection of the assessment-to-source relationship and is useful for curriculum alignment audits.

**View `v_assessment_item_marking_scheme`**

```sql
CREATE VIEW v_assessment_item_marking_scheme AS
SELECT a.id, a.item_identifier, a.section_designation, a.question_number, b.marking_scheme_id AS scheme_marking_scheme_id, b.scheme_identifier AS scheme_scheme_identifier, b.academic_session AS scheme_academic_session
FROM assessment_items a JOIN marking_schemes b ON a.marking_scheme_id = b.marking_scheme_id;
```

| id | item_identifier | section_designation | question_number | scheme_marking_scheme_id | scheme_scheme_identifier | scheme_academic_session |
|---|---|---|---|---|---|---|
| 1 | ITE-2045 | A | 9 | 1 | SCH-2216 | composite-academic-99 |
| 2 | ITE-2050 | B | 15 | 2 | SCH-2217 | primary-academic-100 |
| 3 | ITE-2055 | A | 21 | 3 | SCH-2218 | adaptive-academic-101 |
| 4 | ITE-2060 | B | 27 | 4 | SCH-2219 | distributed-academic-102 |

The view `v_assessment_item_marking_scheme` joins `assessment_items` to `marking_schemes` on `assessment_items.marking_scheme_id = marking_schemes.marking_scheme_id`, answering: "What evaluation framework governs each assessment item?" The row for `ITE-2050` (section `B`, question 15, 8.90 marks, `Subjective`, `Finalized`) appears alongside marking scheme `SCH-2217` (session `primary-academic-100`, subject `template_impcode_pagata_art15`, total marks 45, duration 38 minutes, version `regional-version-72`). This view enables comparison of marking schemes across items and is essential for ensuring that allocated marks are consistent with the total marks defined in the scheme.

**View `v_source_material_assessment_item`**

```sql
CREATE VIEW v_source_material_assessment_item AS
SELECT a.id, a.title, a.publisher, a.unit_number, b.id AS item_id, b.item_identifier AS item_item_identifier, b.section_designation AS item_section_designation
FROM source_materials a JOIN assessment_items b ON a.assessment_item_id = b.id;
```

| id | title | publisher | unit_number | item_id | item_item_identifier | item_section_designation |
|---|---|---|---|---|---|---|
| 1 | Compact Initiative | pilot-publishe-50 | UNI-2100 | 1 | ITE-2045 | A |
| 2 | Legacy Model | extended-publishe-51 | UNI-2104 | 2 | ITE-2050 | B |
| 3 | Regional Cluster A | integrated-publishe-52 | UNI-2108 | 3 | ITE-2055 | A |
| 4 | Seasonal Review | seasonal-publishe-53 | UNI-2112 | 4 | ITE-2060 | B |

The view `v_source_material_assessment_item` performs the same join as `v_assessment_item_source_material` but presents the result from the source material's perspective: "Which assessment items draw from each source material?" The row for source material `Regional Cluster A` (publisher `integrated-publishe-52`, unit `UNI-2108`, chapter `CHA-2330`, page 35, type `CBSE Study Material`) is paired with assessment item `ITE-2055` (section `A`, question 21, 12.85 marks, `Objective`, `Published`). This orientation is useful for source-centric queries, such as identifying all items that reference a particular textbook chapter.

**View `v_marking_scheme_assessment_item`**

```sql
CREATE VIEW v_marking_scheme_assessment_item AS
SELECT a.marking_scheme_id, a.scheme_identifier, a.academic_session, a.subject_code, b.id AS item_id, b.item_identifier AS item_item_identifier, b.section_designation AS item_section_designation
FROM marking_schemes a JOIN assessment_items b ON a.assessment_item_id = b.id;
```

| marking_scheme_id | scheme_identifier | academic_session | subject_code | item_id | item_item_identifier | item_section_designation |
|---|---|---|---|---|---|---|
| 1 | SCH-2216 | composite-academic-99 | de_AT | 1 | ITE-2045 | A |
| 2 | SCH-2217 | primary-academic-100 | template_impcode_pagata_art15 | 2 | ITE-2050 | B |
| 3 | SCH-2218 | adaptive-academic-101 | lu_tax_code_template_m_I | 3 | ITE-2055 | A |
| 4 | SCH-2219 | distributed-academic-102 | 990e161e10664c5885182d95dc07e606 | 4 | ITE-2060 | B |

The view `v_marking_scheme_assessment_item` presents the marking-scheme-to-assessment relationship from the scheme's perspective: "Which assessment items are evaluated under each marking scheme?" The row for marking scheme `SCH-2218` (session `adaptive-academic-101`, subject `lu_tax_code_template_m_I`, total marks 9, duration 41 minutes, version `legacy-version-73`) is paired with assessment item `ITE-2055` (section `A`, question 21, 12.85 marks, `Objective`, `Published`). Note that the allocated marks (12.85) exceed the total marks defined in the scheme (9), which may indicate a data anomaly or a multi-part item structure where the scheme's total marks apply to a subset of the item.

**View `v_concept_assessment_item`**

```sql
CREATE VIEW v_concept_assessment_item AS
SELECT a.concept_id, a.concept_name, a.domain_category, a.definition_text, b.id AS item_id, b.item_identifier AS item_item_identifier, b.section_designation AS item_section_designation
FROM concepts a JOIN assessment_items b ON a.assessment_item_id = b.id;
```

| concept_id | concept_name | domain_category | definition_text | item_id | item_item_identifier | item_section_designation |
|---|---|---|---|---|---|---|
| 1 | Pilot Cluster | AI | primary-definiti-70 | 1 | ITE-2045 | A |
| 2 | Baseline Review | Employability | adaptive-definiti-71 | 2 | ITE-2050 | B |
| 3 | Distributed Initiative A | Data Science | distributed-definiti-72 | 3 | ITE-2055 | A |
| 4 | Adaptive Model | AI | baseline-definiti-73 | 4 | ITE-2060 | B |

The view `v_concept_assessment_item` joins `concepts` to `assessment_items` on `concepts.assessment_item_id = assessment_items.id`, answering: "What domain concepts does each assessment item test?" The row for concept `Distributed Initiative A` (domain `Data Science`, definition `distributed-definiti-72`, complexity `Advanced`) is paired with assessment item `ITE-2055` (section `A`, question 21, 12.85 marks, `Objective`, `Published`). This view supports concept coverage analysis, allowing curriculum designers to verify that advanced concepts are appropriately distributed across items and that complexity levels align with item difficulty.

**View `v_concept_source_material`**

```sql
CREATE VIEW v_concept_source_material AS
SELECT a.concept_id, a.concept_name, a.domain_category, a.definition_text, b.id AS material_id, b.title AS material_title, b.publisher AS material_publisher
FROM concepts a JOIN source_materials b ON a.source_material_id = b.id;
```

| concept_id | concept_name | domain_category | definition_text | material_id | material_title | material_publisher |
|---|---|---|---|---|---|---|
| 1 | Pilot Cluster | AI | primary-definiti-70 | 1 | Compact Initiative | pilot-publishe-50 |
| 2 | Baseline Review | Employability | adaptive-definiti-71 | 2 | Legacy Model | extended-publishe-51 |
| 3 | Distributed Initiative A | Data Science | distributed-definiti-72 | 3 | Regional Cluster A | integrated-publishe-52 |
| 4 | Adaptive Model | AI | baseline-definiti-73 | 4 | Seasonal Review | seasonal-publishe-53 |

The view `v_concept_source_material` joins `concepts` to `source_materials` on `concepts.source_material_id = source_materials.id`, answering: "From which source material does each concept originate?" The row for concept `Baseline Review` (domain `Employability`, definition `adaptive-definiti-71`, complexity `Intermediate`) is paired with source material `Legacy Model` (publisher `extended-publishe-51`, unit `UNI-2104`, chapter `CHA-2324`, page 26, type `Facilitator Handbook`). This view is valuable for tracing the provenance of concepts back to their educational resources and for auditing whether concepts are consistently sourced from authoritative materials.

**View `v_answer_key_assessment_item`**

```sql
CREATE VIEW v_answer_key_assessment_item AS
SELECT a.id, a.key_identifier, a.response_text, a.is_correct, b.id AS item_id, b.item_identifier AS item_item_identifier, b.section_designation AS item_section_designation
FROM answer_keys a JOIN assessment_items b ON a.assessment_item_id = b.id;
```

| id | key_identifier | response_text | is_correct | item_id | item_item_identifier | item_section_designation |
|---|---|---|---|---|---|---|
| 1 | KEY-2124 | adaptive-response-47 | false | 1 | ITE-2045 | A |
| 2 | KEY-2127 | distributed-response-48 | true | 2 | ITE-2050 | B |
| 3 | KEY-2130 | baseline-response-49 | false | 3 | ITE-2055 | A |
| 4 | KEY-2133 | pilot-response-50 | true | 4 | ITE-2060 | B |

The view `v_answer_key_assessment_item` joins `answer_keys` to `assessment_items` on `answer_keys.assessment_item_id = assessment_items.id`, answering: "What are the expected responses for each assessment item?" The row for answer key `KEY-2130` (response `baseline-response-49`, not correct, alternative accepted, format `Short Answer`) is paired with assessment item `ITE-2055` (section `A`, question 21, 12.85 marks, `Objective`, `Published`). This view is critical for answer-key validation, enabling reviewers to verify that the format type matches the item type and that the correctness flags are consistent with the item's evaluation criteria.

**View `v_answer_key_concept`**

```sql
CREATE VIEW v_answer_key_concept AS
SELECT a.id, a.key_identifier, a.response_text, a.is_correct, b.concept_id AS concept_concept_id, b.concept_name AS concept_concept_name, b.domain_category AS concept_domain_category
FROM answer_keys a JOIN concepts b ON a.concept_id = b.concept_id;
```

| id | key_identifier | response_text | is_correct | concept_concept_id | concept_concept_name | concept_domain_category |
|---|---|---|---|---|---|---|
| 1 | KEY-2124 | adaptive-response-47 | false | 1 | Pilot Cluster | AI |
| 2 | KEY-2127 | distributed-response-48 | true | 2 | Baseline Review | Employability |
| 3 | KEY-2130 | baseline-response-49 | false | 3 | Distributed Initiative A | Data Science |
| 4 | KEY-2133 | pilot-response-50 | true | 4 | Adaptive Model | AI |

The view `v_answer_key_concept` joins `answer_keys` to `concepts` on `answer_keys.concept_id = concepts.concept_id`, answering: "Which concept does each answer key address?" The row for answer key `KEY-2133` (response `pilot-response-50`, correct, no alternative accepted, format `Long Answer`) is paired with concept `Adaptive Model` (domain `AI`, definition `baseline-definiti-73`, complexity `Basic`). This view reveals whether the complexity of the answer format (e.g., `Long Answer`) is appropriate for the complexity level of the underlying concept (e.g., `Basic`), supporting quality assurance of the assessment design.

**View `v_scoring_rule_assessment_item`**

```sql
CREATE VIEW v_scoring_rule_assessment_item AS
SELECT a.id, a.rule_identifier, a.required_points, a.points_awarded, b.id AS item_id, b.item_identifier AS item_item_identifier, b.section_designation AS item_section_designation
FROM scoring_rules a JOIN assessment_items b ON a.assessment_item_id = b.id;
```

| id | rule_identifier | required_points | points_awarded | item_id | item_item_identifier | item_section_designation |
|---|---|---|---|---|---|---|
| 1 | RUL-2144 | 36 | 15.20 | 1 | ITE-2045 | A |
| 2 | RUL-2151 | 39 | 18.40 | 2 | ITE-2050 | B |
| 3 | RUL-2158 | 42 | 21.60 | 3 | ITE-2055 | A |
| 4 | RUL-2165 | 45 | 24.80 | 4 | ITE-2060 | B |

The view `v_scoring_rule_assessment_item` joins `scoring_rules` to `assessment_items` on `scoring_rules.assessment_item_id = assessment_items.id`, answering: "What scoring rules apply to each assessment item?" The row for scoring rule `RUL-2158` (required 42 points, awards 21.60, condition `List Items`, penalty applied) is paired with assessment item `ITE-2055` (section `A`, question 21, 12.85 marks, `Objective`, `Published`). This view supports scoring policy audits, allowing evaluators to verify that the points awarded are proportional to the allocated marks and that the condition type matches the expected response format.

**View `v_scoring_rule_answer_key`**

```sql
CREATE VIEW v_scoring_rule_answer_key AS
SELECT a.id, a.rule_identifier, a.required_points, a.points_awarded, b.id AS key_id, b.key_identifier AS key_key_identifier, b.response_text AS key_response_text
FROM scoring_rules a JOIN answer_keys b ON a.answer_key_id = b.id;
```

| id | rule_identifier | required_points | points_awarded | key_id | key_key_identifier | key_response_text |
|---|---|---|---|---|---|---|
| 1 | RUL-2144 | 36 | 15.20 | 1 | KEY-2124 | adaptive-response-47 |
| 2 | RUL-2151 | 39 | 18.40 | 2 | KEY-2127 | distributed-response-48 |
| 3 | RUL-2158 | 42 | 21.60 | 3 | KEY-2130 | baseline-response-49 |
| 4 | RUL-2165 | 45 | 24.80 | 4 | KEY-2133 | pilot-response-50 |

The view `v_scoring_rule_answer_key` joins `scoring_rules` to `answer_keys` on `scoring_rules.answer_key_id = answer_keys.id`, answering: "How is each answer key scored?" The row for scoring rule `RUL-2165` (required 45 points, awards 24.80, condition `Justification`, no penalty) is paired with answer key `KEY-2133` (response `pilot-response-50`, correct, no alternative accepted, format `Long Answer`). This view is the most granular, connecting the evaluation logic directly to the expected response. It enables fine-grained quality checks, such as verifying that a `Justification` condition is paired with a `Long Answer` format and that the points awarded (24.80) are consistent with the answer key's correctness status.

The schema as a whole embodies a layered normalization strategy. The base tables isolate distinct concerns — item metadata, source provenance, evaluation framework, conceptual content, response specification, and scoring logic — each with its own primary key and a minimal set of foreign keys. The views then materialize domain-level facts by joining these tables along their foreign-key edges, producing denormalized result sets that answer specific analytical questions. For instance, reconstructing the full story of assessment item `ITE-2050` requires joining `assessment_items` to `source_materials` (via `v_assessment_item_source_material`), to `marking_schemes` (via `v_assessment_item_marking_scheme`), to `concepts` (via `v_concept_assessment_item`), to `answer_keys` (via `v_answer_key_assessment_item`), and ultimately to `scoring_rules` (via `v_scoring_rule_assessment_item` and `v_scoring_rule_answer_key`). Each view isolates a single join path, making the schema both modular and composable: any subset of these views can be queried independently, and their results can be further joined at the application layer to reconstruct the complete assessment narrative.