## Assessment Architecture and Evaluation Workflows

Educational assessment systems require precise coordination between learning materials, grading frameworks, and scoring logic. At the core of such a system lies the assessment item—the atomic unit of evaluation. Each item carries an identifier, a section designation, a question number, and a sub-question index that together establish its position within a larger examination structure. Items are classified by type, such as Objective or Subjective, and progress through a lifecycle of statuses including Draft, Finalized, and Published. The allocated marks for each item determine its weight in the overall evaluation. Consider the item `ITE-2045` in section `A`, question `9`, sub-question `23`, which carries `4.95` allocated marks and is currently in Draft status. By contrast, `ITE-2055` in the same section but at question `21`, sub-question `35`, has been Published and carries `12.85` marks, reflecting its greater complexity and importance within the assessment.

**Table `assessment_items`**

| id | item_identifier | section_designation | question_number | sub_question_index | allocated_marks | item_type | status | source_material_id | marking_scheme_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2045 | A | 9 | 23 | 4.95 | Objective | Draft | 1 | 1 |
| 2 | ITE-2050 | B | 15 | 29 | 8.90 | Subjective | Finalized | 2 | 2 |
| 3 | ITE-2055 | A | 21 | 35 | 12.85 | Objective | Published | 3 | 3 |
| 4 | ITE-2060 | B | 27 | 41 | 16.80 | Subjective | Draft | 4 | 4 |

Every assessment item does not exist in isolation. It draws upon source materials that provide the conceptual foundation for the questions posed. These materials span a range of types, from NCERT textbooks to CBSE Study Materials and Facilitator Handbooks, each published by distinct entities and organized within units and chapters. The material `Compact Initiative`, published by `pilot-publishe-50`, belongs to unit `UNI-2100` and chapter `CHA-2318`, with a page reference at `17`. Another material, `Legacy Model` from `extended-publishe-51`, resides in unit `UNI-2104` and chapter `CHA-2324` at page `26`, and is classified as a Facilitator Handbook. The diversity of material types and their granular organization by unit, chapter, and page enables precise traceability between an assessment question and the reference from which it derives.

**Table `source_materials`**

| id | title | publisher | unit_number | chapter_number | page_reference | material_type | assessment_item_id |
|---|---|---|---|---|---|---|---|
| 1 | Compact Initiative | pilot-publishe-50 | UNI-2100 | CHA-2318 | 17 | NCERT | 1 |
| 2 | Legacy Model | extended-publishe-51 | UNI-2104 | CHA-2324 | 26 | Facilitator Handbook | 2 |
| 3 | Regional Cluster A | integrated-publishe-52 | UNI-2108 | CHA-2330 | 35 | CBSE Study Material | 3 |
| 4 | Seasonal Review | seasonal-publishe-53 | UNI-2112 | CHA-2336 | 44 | NCERT | 4 |

The grading of assessment items is governed by marking schemes, which define the parameters within which evaluators operate. Each scheme carries a unique identifier, is associated with an academic session and a subject code, and specifies the total marks available, the duration in minutes, and a version label that tracks revisions. The scheme `SCH-2216` operates under the session `composite-academic-99` for subject code `de_AT`, allocates `7` total marks, allows `35` minutes, and is labeled `seasonal-version-71`. Another scheme, `SCH-2218`, linked to session `adaptive-academic-101` and subject code `lu_tax_code_template_m_I`, permits `9` total marks over `41` minutes under the designation `legacy-version-73`. These schemes establish the temporal and quantitative boundaries within which each assessment item is evaluated.

**Table `marking_schemes`**

| marking_scheme_id | scheme_identifier | academic_session | subject_code | total_marks | duration_minutes | version | assessment_item_id |
|---|---|---|---|---|---|---|---|
| 1 | SCH-2216 | composite-academic-99 | de_AT | 7 | 35 | seasonal-version-71 | 1 |
| 2 | SCH-2217 | primary-academic-100 | template_impcode_pagata_art15 | 45 | 38 | regional-version-72 | 2 |
| 3 | SCH-2218 | adaptive-academic-101 | lu_tax_code_template_m_I | 9 | 41 | legacy-version-73 | 3 |
| 4 | SCH-2219 | distributed-academic-102 | 990e161e10664c5885182d95dc07e606 | 16 | 44 | compact-version-74 | 4 |

Assessment items are anchored to specific learning concepts, each of which belongs to a domain category and carries a definition and a complexity level. Concepts such as `Pilot Cluster` fall within the `AI` domain and are classified at the `Basic` complexity level, with a definition text of `primary-definiti-70`. The concept `Distributed Initiative A` belongs to `Data Science`, is rated `Advanced`, and carries the definition `distributed-definiti-72`. The concept `Baseline Review` sits in the `Employability` domain at `Intermediate` complexity with definition `adaptive-definiti-71`. These concepts serve as the intellectual building blocks that assessment items test, and their complexity levels inform the allocation of marks and the design of scoring rules.

**Table `concepts`**

| concept_id | concept_name | domain_category | definition_text | complexity_level | assessment_item_id | source_material_id |
|---|---|---|---|---|---|---|
| 1 | Pilot Cluster | AI | primary-definiti-70 | Basic | 1 | 1 |
| 2 | Baseline Review | Employability | adaptive-definiti-71 | Intermediate | 2 | 2 |
| 3 | Distributed Initiative A | Data Science | distributed-definiti-72 | Advanced | 3 | 3 |
| 4 | Adaptive Model | AI | baseline-definiti-73 | Basic | 4 | 4 |

For each assessment item, answer keys provide the expected responses, indicating correctness, whether alternative answers are accepted, and the format type of the response. The answer key `KEY-2124` contains the response `adaptive-response-47`, is marked as incorrect (`false`), accepts alternatives (`true`), and uses the `Single Choice` format. In contrast, `KEY-2127` holds `distributed-response-48`, is marked correct (`true`), does not accept alternatives (`false`), and employs the `Multiple Choice` format. The answer key `KEY-2133` carries `pilot-response-50`, is correct, rejects alternatives, and uses the `Long Answer` format. These keys establish the ground truth against which student responses are measured, with the format type reflecting the cognitive demand of the item.

**Table `answer_keys`**

| id | key_identifier | response_text | is_correct | alternative_accepted | format_type | assessment_item_id | concept_id |
|---|---|---|---|---|---|---|---|
| 1 | KEY-2124 | adaptive-response-47 | false | true | Single Choice | 1 | 1 |
| 2 | KEY-2127 | distributed-response-48 | true | false | Multiple Choice | 2 | 2 |
| 3 | KEY-2130 | baseline-response-49 | false | true | Short Answer | 3 | 3 |
| 4 | KEY-2133 | pilot-response-50 | true | false | Long Answer | 4 | 4 |

Scoring rules translate answer keys into quantitative evaluations by specifying the conditions under which points are awarded or penalized. Each rule carries a required points threshold, the actual points awarded, a condition type such as Keyword Match or Concept Explanation, and a flag indicating whether a penalty is applied. Rule `RUL-2144` requires `36` points, awards `15.20` points, operates under a `Keyword Match` condition, and applies a penalty (`true`). Rule `RUL-2151` requires `39` points, awards `18.40` points, uses `Concept Explanation` as its condition, and does not apply a penalty (`false`). The scoring rule `RUL-2165` demands `45` points, awards `24.80`, relies on `Justification` as its condition, and similarly has no penalty. These rules operationalize the marking scheme by defining the precise criteria for partial and full credit.

**Table `scoring_rules`**

| id | rule_identifier | required_points | points_awarded | condition_type | penalty_applied | assessment_item_id | answer_key_id |
|---|---|---|---|---|---|---|---|
| 1 | RUL-2144 | 36 | 15.20 | Keyword Match | true | 1 | 1 |
| 2 | RUL-2151 | 39 | 18.40 | Concept Explanation | false | 2 | 2 |
| 3 | RUL-2158 | 42 | 21.60 | List Items | true | 3 | 3 |
| 4 | RUL-2165 | 45 | 24.80 | Justification | false | 4 | 4 |

### Assessment-to-Material Relationships

The view `v_assessment_item_source_material` joins assessment items with their corresponding source materials, answering the question of which reference material supports each item. This join reveals the direct lineage between a question and the textbook or study guide from which it originates. The item `ITE-2045` is linked to the source material `Compact Initiative` (type `NCERT`, unit `UNI-2100`, chapter `CHA-2318`, page `17`), establishing that this objective item draws from a foundational NCERT resource. Meanwhile, `ITE-2050` connects to `Legacy Model`, a Facilitator Handbook from unit `UNI-2104` and chapter `CHA-2324` at page `26`, suggesting that this subjective item requires a more interpretive engagement with facilitator guidance rather than a direct textbook reference. The view thus provides a material provenance map, enabling curriculum designers to verify that each item is adequately grounded in approved learning resources.

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

### Assessment-to-Marking-Scheme Relationships

The view `v_assessment_item_marking_scheme` associates each assessment item with its governing marking scheme, answering the question of which grading framework applies to a given item. This relationship is critical for ensuring that the allocated marks and item type are consistent with the scheme's total marks and duration. The item `ITE-2045` falls under marking scheme `SCH-2216`, which allocates `7` total marks over `35` minutes for subject code `de_AT` in the `composite-academic-99` session. The item `ITE-2050` is governed by scheme `SCH-2217`, which permits `45` total marks over `38` minutes under the subject code `template_impcode_pagata_art15` and session `primary-academic-100`. The view enables auditors to verify that the allocated marks for each item (e.g., `4.95` for `ITE-2045` and `8.90` for `ITE-2050`) are proportionate to the scheme's overall structure and that no item exceeds its scheme's total marks.

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

### Material-to-Assessment Relationships

The view `v_source_material_assessment_item` inverts the perspective, answering the question of which assessment items derive from a given source material. This reverse lookup is essential for material authors and curriculum reviewers who need to understand the assessment footprint of each resource. The material `Compact Initiative` (NCERT, page `17`) supports the assessment item `ITE-2045`, an Objective item in section `A` with `4.95` allocated marks. The material `Regional Cluster A` (CBSE Study Material, page `35`) supports `ITE-2055`, an Objective item in section `A` carrying `12.85` marks and in Published status. By aggregating items per material, this view reveals which resources are heavily leveraged in the assessment and which may be underutilized, informing decisions about resource development and revision priorities.

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

### Marking-Scheme-to-Assessment Relationships

The view `v_marking_scheme_assessment_item` provides the inverse of the marking-scheme association, answering which items are evaluated under each scheme. This perspective is valuable for examiners and quality assurance teams who need to understand the composition of each marking scheme. Scheme `SCH-2216` (session `composite-academic-99`, subject `de_AT`, `7` total marks, `35` minutes) governs the item `ITE-2045`, which carries `4.95` allocated marks and is in Draft status. Scheme `SCH-2219` (session `distributed-academic-102`, subject code `990e161e10664c5885182d95dc07e606`, `16` total marks, `44` minutes) governs `ITE-2060`, a Subjective item in section `B` with `16.80` allocated marks, also in Draft status. The view ensures that the distribution of items across schemes is balanced and that no single scheme is overloaded with items that exceed its total marks allocation.

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

### Concept-to-Assessment Relationships

The view `v_concept_assessment_item` links assessment items to the concepts they test, answering the question of which learning objectives each item measures. This relationship is fundamental for alignment analysis, ensuring that the assessment covers the intended domain categories and complexity levels. The item `ITE-2045` tests the concept `Pilot Cluster`, which belongs to the `AI` domain at `Basic` complexity. The item `ITE-2055` tests `Distributed Initiative A`, a `Data Science` concept at `Advanced` complexity, and is associated with the source material `Regional Cluster A` (CBSE Study Material, page `35`). The item `ITE-2060` assesses `Adaptive Model`, another `AI` concept at `Basic` complexity, sourced from `Seasonal Review`. By mapping items to concepts, the view enables curriculum planners to verify that the assessment spans the required domain categories and that complexity levels are appropriately distributed across the item set.

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

### Concept-to-Material Relationships

The view `v_concept_source_material` connects concepts to their source materials, answering the question of which reference resources define or introduce each concept. This relationship is critical for ensuring that concepts are taught and assessed using consistent materials. The concept `Pilot Cluster` (domain `AI`, complexity `Basic`) is sourced from `Compact Initiative` (NCERT, unit `UNI-2100`, chapter `CHA-2318`, page `17`). The concept `Baseline Review` (domain `Employability`, complexity `Intermediate`) is sourced from `Legacy Model` (Facilitator Handbook, unit `UNI-2104`, chapter `CHA-2324`, page `26`). The concept `Distributed Initiative A` (domain `Data Science`, complexity `Advanced`) is sourced from `Regional Cluster A` (CBSE Study Material, unit `UNI-2108`, chapter `CHA-2330`, page `35`). This view supports content audits by revealing whether concepts are adequately covered by the available materials and whether any concept relies on an outdated or deprecated resource.

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

### Answer-Key-to-Assessment Relationships

The view `v_answer_key_assessment_item` associates answer keys with their corresponding assessment items, answering the question of which responses are expected for each item. This relationship is essential for examiners who need to verify that answer keys are complete and correctly formatted. The item `ITE-2045` has the answer key `KEY-2124`, containing the response `adaptive-response-47`, marked as incorrect (`false`), accepting alternatives (`true`), and formatted as `Single Choice`. The item `ITE-2050` has the answer key `KEY-2127`, containing `distributed-response-48`, marked as correct (`true`), not accepting alternatives (`false`), and formatted as `Multiple Choice`. The item `ITE-2060` has the answer key `KEY-2133`, containing `pilot-response-50`, marked as correct, not accepting alternatives, and formatted as `Long Answer`. The view ensures that every assessment item has a corresponding answer key and that the format types align with the item types—Objective items typically use Single or Multiple Choice formats, while Subjective items use Short or Long Answer formats.

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

### Answer-Key-to-Concept Relationships

The view `v_answer_key_concept` links answer keys to the concepts they evaluate, answering the question of which concept each response tests. This relationship is vital for ensuring that answer keys are conceptually aligned with the intended learning objectives. The answer key `KEY-2124` (response `adaptive-response-47`, format `Single Choice`) tests the concept `Pilot Cluster` (domain `AI`, complexity `Basic`). The answer key `KEY-2127` (response `distributed-response-48`, format `Multiple Choice`) tests `Baseline Review` (domain `Employability`, complexity `Intermediate`). The answer key `KEY-2133` (response `pilot-response-50`, format `Long Answer`) tests `Adaptive Model` (domain `AI`, complexity `Basic`). This view enables quality checks to confirm that the cognitive demand of the answer format matches the complexity level of the concept—for instance, a `Long Answer` format is appropriate for testing a concept, while a `Single Choice` format may be better suited for basic recall.

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

### Scoring-Rule-to-Assessment Relationships

The view `v_scoring_rule_assessment_item` connects scoring rules to their corresponding assessment items, answering the question of which scoring criteria apply to each item. This relationship is crucial for transparency in grading and for ensuring that scoring rules are comprehensive. The item `ITE-2045` is governed by scoring rule `RUL-2144`, which requires `36` points, awards `15.20` points, uses `Keyword Match` as its condition type, and applies a penalty (`true`). The item `ITE-2055` is governed by `RUL-2158`, which requires `42` points, awards `21.60` points, uses `List Items` as its condition, and applies a penalty (`true`). The item `ITE-2060` is governed by `RUL-2165`, which requires `45` points, awards `24.80` points, uses `Justification` as its condition, and does not apply a penalty (`false`). The view ensures that every assessment item has at least one scoring rule and that the condition types are appropriate for the item type—Keyword Match and List Items are well-suited for Objective items, while Concept Explanation and Justification are more appropriate for Subjective items.

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

### Scoring-Rule-to-Answer-Key Relationships

The view `v_scoring_rule_answer_key` links scoring rules to their corresponding answer keys, answering the question of which scoring criteria evaluate each expected response. This relationship is the final link in the evaluation chain, connecting the ground truth (the answer key) to the quantitative judgment (the scoring rule). The answer key `KEY-2124` (response `adaptive-response-47`, format `Single Choice`) is evaluated by scoring rule `RUL-2144` (condition `Keyword Match`, points awarded `15.20`, penalty applied `true`). The answer key `KEY-2127` (response `distributed-response-48`, format `Multiple Choice`) is evaluated by `RUL-2151` (condition `Concept Explanation`, points awarded `18.40`, penalty applied `false`). The answer key `KEY-2133` (response `pilot-response-50`, format `Long Answer`) is evaluated by `RUL-2165` (condition `Justification`, points awarded `24.80`, penalty applied `false`). This view completes the traceability chain from concept through answer key to scoring rule, enabling end-to-end validation of the assessment design and ensuring that every response is evaluated against a clearly defined and documented criterion.

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

### Synthesis

The assessment ecosystem described here operates as an integrated network of interdependent records. Assessment items serve as the central nodes, each linked to a source material that provides its intellectual foundation, a marking scheme that defines its grading parameters, a concept that specifies the learning objective it tests, an answer key that establishes the expected response, and a scoring rule that translates that response into a quantitative evaluation. The views collectively enable multiple perspectives on this network: forward lookups from items to their supporting resources, reverse lookups from materials and schemes to the items they govern, and cross-cutting views that connect concepts, answer keys, and scoring rules. This architecture supports rigorous quality assurance, curriculum alignment, and transparent grading, ensuring that every assessment item is traceable from its conceptual origin through to its final scored outcome.