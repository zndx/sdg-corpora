# Educational Assessment and Curriculum Architecture

Educational institutions require rigorous systems for organizing learning content, mapping conceptual knowledge to measurable outcomes, and assembling examination instruments from curated source materials. This chapter documents the architecture of a curriculum management and assessment assembly system, where subjects contain curriculum units, units encapsulate concepts, concepts inform assessment items, and examination papers aggregate those items into coherent instruments. The system tracks source materials—textbooks, handbooks, and guides—along with their page-level content, linking each page to specific concepts and each assessment item to its originating material. Every entity carries a stable identifier, and relationships are expressed through explicit foreign-key columns and junction tables that enable flexible many-to-many associations. The following sections describe the base records, the associative tables, and the analytical views that synthesize the data for curriculum planning and examination design.

**Table `subjects`**

| subject_id | subject_code | name | class_level | department | credits | examination_paper_id |
|---|---|---|---|---|---|---|
| 1000 | de_AT | Extended Review | adaptive-class-83 | adaptive-departme-89 | 28 | 1 |
| 1001 | template_impcode_pagata_art15 | Pilot Initiative A | distributed-class-84 | distributed-departme-90 | 33 | 2 |
| 1002 | lu_tax_code_template_m_I | Baseline Model | baseline-class-85 | baseline-departme-91 | 38 | 3 |
| 1003 | 990e161e10664c5885182d95dc07e606 | Distributed Cluster | pilot-class-86 | pilot-departme-92 | 43 | 4 |

Subjects form the top-level organizational container for all curriculum content. Each subject record carries a `subject_id` that serves as the primary key, along with a `subject_code` and `class_level` that describe the academic context. The `academic_session` field anchors the subject to a particular term or year, while `max_time_minutes`, `total_marks`, `total_questions`, and `required_answers` define the examination parameters for that subject. For example, subject `1000` (code `de_AT`, class level `adaptive-class-83`) is configured for a `composite-academic-99` session with a maximum of 14 minutes, 7 total marks, 12 questions, and 21 required answers, published on 2025-12-01. Subject `1001` (code `template_impcode_pagata_art15`, class level `distributed-class-84`) operates under a `primary-academic-100` session with 23 minutes, 45 marks, 19 questions, and 28 required answers. The `publication_date` column records when the subject configuration was finalized.

**Table `curriculum_units`**

| id | unit_id | title | unit_number | duration_hours | learning_outcomes | subject_id |
|---|---|---|---|---|---|---|
| 1 | 39800614 | Compact Initiative | 30 | 3.70 | extended-learning-69 | 1000 |
| 2 | 611523 | Legacy Model | 40 | 7.40 | integrated-learning-70 | 1001 |
| 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Cluster A | 50 | 11.10 | seasonal-learning-71 | 1002 |
| 4 | account_pymes_1040 | Seasonal Review | 60 | 14.80 | regional-learning-72 | 1003 |

Curriculum units represent discrete instructional segments within a subject. Each unit has a `unit_id`, a `title`, a `unit_number` for sequencing, a `duration_hours` value indicating the instructional time allocated, and `learning_outcomes` that describe what students should achieve. The `subject_id` column links the unit back to its parent subject. Unit `39800614` (title "Compact Initiative", unit number 30) requires 3.70 hours and targets `extended-learning-69` outcomes within subject `1000`. Unit `611523` (title "Legacy Model", unit number 40) requires 7.40 hours and targets `integrated-learning-70` outcomes within subject `1001`. The duration values scale across the curriculum, with unit `account_pymes_1040` (title "Seasonal Review", unit number 60) requiring 14.80 hours for `regional-learning-72` outcomes in subject `1003`.

**Table `concepts`**

| id | concept_id | name | category | difficulty_level | description | curriculum_unit_id | assessment_item_id |
|---|---|---|---|---|---|---|---|
| 1 | 884350 | Extended Review | SKILL | BASIC | Extended Survey | 1 | 1 |
| 2 | 392497 | Pilot Initiative A | KNOWLEDGE | INTERMEDIATE | Pilot Corridor A | 2 | 2 |
| 3 | 2106713 | Baseline Model | TECHNIQUE | ADVANCED | Baseline Series | 3 | 3 |
| 4 | 4463648 | Distributed Cluster | SKILL | BASIC | Distributed Assessment | 4 | 4 |

Concepts are the atomic units of knowledge that curriculum units teach and assessment items evaluate. Each concept carries a `concept_id`, a `name`, a `category` (such as SKILL, KNOWLEDGE, or TECHNIQUE), a `difficulty_level` (BASIC, INTERMEDIATE, or ADVANCED), and a `description`. The `curriculum_unit_id` column ties the concept to the unit that teaches it, while `assessment_item_id` links it to the item that tests it. Concept `884350` (name "Extended Review", category SKILL, difficulty BASIC) is taught in unit 1 and assessed by item 1. Concept `392497` (name "Pilot Initiative A", category KNOWLEDGE, difficulty INTERMEDIATE) belongs to unit 2 and item 2. Concept `2106713` (name "Baseline Model", category TECHNIQUE, difficulty ADVANCED) is associated with unit 3 and item 3. Concept `4463648` (name "Distributed Cluster", category SKILL, difficulty BASIC) connects unit 4 and item 4.

**Table `source_materials`**

| id | material_id | title | publisher | edition | isbn | publication_year | format |
|---|---|---|---|---|---|---|---|
| 1 | 2839521 | Compact Initiative | pilot-publishe-50 | baseline-edition-91 | 2618568 | 25 | TEXTBOOK |
| 2 | 937739 | Legacy Model | extended-publishe-51 | pilot-edition-92 | 4277024 | 33 | HANDBOOK |
| 3 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | integrated-publishe-52 | extended-edition-93 | 1208-0004-M | 41 | GUIDE |
| 4 | 7021001070070 | Seasonal Review | seasonal-publishe-53 | integrated-edition-94 | 3717612 | 49 | TEXTBOOK |

Source materials are the published resources from which content is drawn for both instruction and assessment. Each material has a `material_id`, a `title`, a `publisher`, an `edition`, an `isbn`, a `publication_year`, and a `format` (TEXTBOOK, HANDBOOK, or GUIDE). Material `2839521` (title "Compact Initiative", publisher `pilot-publishe-50`, edition `baseline-edition-91`, ISBN `2618568`, year 25) is a TEXTBOOK. Material `937739` (title "Legacy Model", publisher `extended-publishe-51`, edition `pilot-edition-92`, ISBN `4277024`, year 33) is a HANDBOOK. Material `27cf9038-9bad-11eb-a8a2-19ed5c03f8d3` (title "Regional Cluster A", publisher `integrated-publishe-52`, edition `extended-edition-93`, ISBN `1208-0004-M`, year 41) is a GUIDE. Material `7021001070070` (title "Seasonal Review", publisher `seasonal-publishe-53`, edition `integrated-edition-94`, ISBN `3717612`, year 49) is a TEXTBOOK.

**Table `source_pages`**

| page_id | page_number | unit_number | chapter_number | content_snippet | source_material_id | concept_id |
|---|---|---|---|---|---|---|
| 32825 | 48 | 30 | 49 | legacy-content-79 | 1 | 1 |
| 69438 | 59 | 40 | 60 | compact-content-80 | 2 | 2 |
| 739 | 70 | 50 | 71 | composite-content-81 | 3 | 3 |
| gd_acc_221000 | 81 | 60 | 82 | primary-content-82 | 4 | 4 |

Source pages represent individual pages within source materials, each annotated with a `page_number`, a `unit_number`, a `chapter_number`, a `content_snippet` describing the page's content, and foreign keys to the `source_material_id` and `concept_id`. Page `32825` (page number 48, unit 30, chapter 49, snippet "legacy-content-79") belongs to material 1 and concept 1. Page `69438` (page number 59, unit 40, chapter 60, snippet "compact-content-80") belongs to material 2 and concept 2. Page `739` (page number 70, unit 50, chapter 71, snippet "composite-content-81") belongs to material 3 and concept 3. Page `gd_acc_221000` (page number 81, unit 60, chapter 82, snippet "primary-content-82") belongs to material 4 and concept 4.

**Table `assessment_items`**

| id | item_id | section_designation | question_number | sub_question_label | marks_allotted | question_type | status | examination_paper_id | source_material_id | concept_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2792 | SECTION_A | 9 | Extended Corridor | 5.20 | OBJECTIVE | DRAFT | 1 | 1 | 1 |
| 2 | ITE-2795 | SECTION_B | 15 | Pilot Series A | 7.40 | SUBJECTIVE | APPROVED | 2 | 2 | 2 |
| 3 | ITE-2798 | SECTION_A | 21 | Baseline Assessment | 9.60 | OBJECTIVE | ARCHIVED | 3 | 3 | 3 |
| 4 | ITE-2801 | SECTION_B | 27 | Distributed Survey | 11.80 | SUBJECTIVE | DRAFT | 4 | 4 | 4 |

Assessment items are the individual questions or tasks that compose examination papers. Each item has an `item_id`, a `section_designation` (such as SECTION_A or SECTION_B), a `question_number`, an optional `sub_question_label`, a `marks_allotted` value, a `question_type` (OBJECTIVE or SUBJECTIVE), and a `status` (DRAFT, APPROVED, or ARCHIVED). The `examination_paper_id`, `source_material_id`, and `concept_id` columns link each item to its parent paper, its source material, and the concept it evaluates. Item `ITE-2792` (section SECTION_A, question 9, sub-question "Extended Corridor", 5.20 marks, type OBJECTIVE, status DRAFT) belongs to paper 1, material 1, and concept 1. Item `ITE-2795` (section SECTION_B, question 15, sub-question "Pilot Series A", 7.40 marks, type SUBJECTIVE, status APPROVED) belongs to paper 2, material 2, and concept 2. Item `ITE-2798` (section SECTION_A, question 21, sub-question "Baseline Assessment", 9.60 marks, type OBJECTIVE, status ARCHIVED) belongs to paper 3, material 3, and concept 3. Item `ITE-2801` (section SECTION_B, question 27, sub-question "Distributed Survey", 11.80 marks, type SUBJECTIVE, status DRAFT) belongs to paper 4, material 4, and concept 4.

**Table `examination_papers`**

| id | paper_id | subject_code | class_level | academic_session | max_time_minutes | total_marks | total_questions | required_answers | publication_date | subject_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2087750 | de_AT | adaptive-class-83 | composite-academic-99 | 14 | 7 | 12 | 21 | 2025-12-01T23:33:00 | 1000 |
| 2 | 3158138 | template_impcode_pagata_art15 | distributed-class-84 | primary-academic-100 | 23 | 45 | 19 | 28 | 2022-05-12T06:50:00 | 1001 |
| 3 | 5844268 | lu_tax_code_template_m_I | baseline-class-85 | adaptive-academic-101 | 32 | 9 | 11 | 35 | 2023-10-23T13:07:00 | 1002 |
| 4 | 13734000 | 990e161e10664c5885182d95dc07e606 | pilot-class-86 | distributed-academic-102 | 41 | 16 | 61 | 42 | 2024-03-07T20:24:00 | 1003 |

Examination papers are the assembled instruments that students complete. Each paper has a `paper_id`, a `subject_code`, a `class_level`, an `academic_session`, a `max_time_minutes`, a `total_marks`, a `total_questions` count, a `required_answers` count, a `publication_date`, and a `subject_id` linking it to its parent subject. Paper `2087750` (subject code `de_AT`, class level `adaptive-class-83`, session `composite-academic-99`, 14 minutes, 7 marks, 12 questions, 21 required answers, published 2025-12-01) belongs to subject `1000`. Paper `3158138` (subject code `template_impcode_pagata_art15`, class level `distributed-class-84`, session `primary-academic-100`, 23 minutes, 45 marks, 19 questions, 28 required answers, published 2022-05-12) belongs to subject `1001`. Paper `5844268` (subject code `lu_tax_code_template_m_I`, class level `baseline-class-85`, session `adaptive-academic-101`, 32 minutes, 9 marks, 11 questions, 35 required answers, published 2023-10-23) belongs to subject `1002`. Paper `13734000` (subject code `990e161e10664c5885182d95dc07e606`, class level `pilot-class-86`, session `distributed-academic-102`, 41 minutes, 16 marks, 61 questions, 42 required answers, published 2024-03-07) belongs to subject `1003`.

The system uses junction tables to manage many-to-many relationships that cannot be expressed through simple foreign keys. The `papers_items` table links examination papers to assessment items, allowing a single paper to contain multiple items and a single item to appear in multiple papers. The `materials_pages` table links source materials to their pages, supporting the annotation of individual pages with conceptual metadata. The `units_concepts` table links curriculum units to concepts, enabling a unit to teach multiple concepts and a concept to be taught across multiple units. The `subjects_units` table links subjects to curriculum units, establishing the hierarchical structure of the curriculum.

**Table `papers_items`**

| examination_paper_id | assessment_item_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `papers_items` junction table records which assessment items belong to which examination papers. Each row connects a `paper_id` to an `item_id`, and may include additional metadata such as ordering or weighting. This table enables the flexible assembly of examination papers from a pool of approved items, supporting the reuse of items across multiple papers and the dynamic composition of assessments.

**Table `materials_pages`**

| source_material_id | page_id |
|---|---|
| 1 | 32825 |
| 1 | 69438 |
| 2 | 69438 |
| 2 | 739 |
| 3 | 739 |
| 3 | gd_acc_221000 |
| 4 | gd_acc_221000 |
| 4 | 32825 |

The `materials_pages` junction table records which source pages belong to which source materials. Each row connects a `material_id` to a `page_id`, establishing the page-to-material relationship that underpins content retrieval. This table supports the annotation of individual pages with conceptual tags and enables the tracing of assessment items back to their source content.

**Table `units_concepts`**

| curriculum_unit_id | concept_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `units_concepts` junction table records which concepts are taught within which curriculum units. Each row connects a `unit_id` to a `concept_id`, allowing units to encompass multiple concepts and concepts to be distributed across multiple units. This table is essential for curriculum mapping, as it defines the conceptual scope of each instructional segment.

**Table `subjects_units`**

| subject_id | curriculum_unit_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `subjects_units` junction table records which curriculum units belong to which subjects. Each row connects a `subject_id` to a `unit_id`, establishing the hierarchical structure of the curriculum. This table enables the aggregation of unit-level data (such as total duration or total learning outcomes) at the subject level.

The system provides a set of analytical views that join base tables and junction tables to answer specific questions about the curriculum and assessment architecture. These views synthesize the relational data into flat, queryable result sets that support curriculum planning, item analysis, and source material management.

**View `vw_assessment_item_examination_paper`**

```sql
CREATE VIEW vw_assessment_item_examination_paper AS
SELECT a.id, a.item_id, a.section_designation, a.question_number, b.id AS paper_id, b.paper_id AS paper_paper_id, b.subject_code AS paper_subject_code
FROM assessment_items a JOIN examination_papers b ON a.examination_paper_id = b.id;
```

| id | item_id | section_designation | question_number | paper_id | paper_paper_id | paper_subject_code |
|---|---|---|---|---|---|---|
| 1 | ITE-2792 | SECTION_A | 9 | 1 | 2087750 | de_AT |
| 2 | ITE-2795 | SECTION_B | 15 | 2 | 3158138 | template_impcode_pagata_art15 |
| 3 | ITE-2798 | SECTION_A | 21 | 3 | 5844268 | lu_tax_code_template_m_I |
| 4 | ITE-2801 | SECTION_B | 27 | 4 | 13734000 | 990e161e10664c5885182d95dc07e606 |

This view joins assessment items to their parent examination papers, answering the question: "Which examination paper does each assessment item belong to?" The result set includes the item's `item_id`, `section_designation`, `question_number`, `marks_allotted`, `question_type`, and `status`, along with the paper's `paper_id`, `subject_code`, `class_level`, `academic_session`, `max_time_minutes`, `total_marks`, `total_questions`, and `required_answers`. Reading row 1 as evidence: item `ITE-2792` (SECTION_A, question 9, 5.20 marks, OBJECTIVE, DRAFT) belongs to paper `2087750` (subject code `de_AT`, class level `adaptive-class-83`, session `composite-academic-99`, 14 minutes, 7 marks, 12 questions, 21 required answers). Reading row 2: item `ITE-2795` (SECTION_B, question 15, 7.40 marks, SUBJECTIVE, APPROVED) belongs to paper `3158138` (subject code `template_impcode_pagata_art15`, class level `distributed-class-84`, session `primary-academic-100`, 23 minutes, 45 marks, 19 questions, 28 required answers).

**View `vw_assessment_item_source_material`**

```sql
CREATE VIEW vw_assessment_item_source_material AS
SELECT a.id, a.item_id, a.section_designation, a.question_number, b.id AS material_id, b.material_id AS material_material_id, b.title AS material_title
FROM assessment_items a JOIN source_materials b ON a.source_material_id = b.id;
```

| id | item_id | section_designation | question_number | material_id | material_material_id | material_title |
|---|---|---|---|---|---|---|
| 1 | ITE-2792 | SECTION_A | 9 | 1 | 2839521 | Compact Initiative |
| 2 | ITE-2795 | SECTION_B | 15 | 2 | 937739 | Legacy Model |
| 3 | ITE-2798 | SECTION_A | 21 | 3 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A |
| 4 | ITE-2801 | SECTION_B | 27 | 4 | 7021001070070 | Seasonal Review |

This view joins assessment items to their source materials, answering the question: "Which source material does each assessment item draw from?" The result set includes the item's identifying columns alongside the material's `material_id`, `title`, `publisher`, `edition`, `isbn`, `publication_year`, and `format`. Reading row 1: item `ITE-2792` draws from material `2839521` (title "Compact Initiative", publisher `pilot-publishe-50`, edition `baseline-edition-91`, ISBN `2618568`, year 25, format TEXTBOOK). Reading row 2: item `ITE-2795` draws from material `937739` (title "Legacy Model", publisher `extended-publishe-51`, edition `pilot-edition-92`, ISBN `4277024`, year 33, format HANDBOOK).

**View `vw_assessment_item_concept`**

```sql
CREATE VIEW vw_assessment_item_concept AS
SELECT a.id, a.item_id, a.section_designation, a.question_number, b.id AS concept_id, b.concept_id AS concept_concept_id, b.name AS concept_name
FROM assessment_items a JOIN concepts b ON a.concept_id = b.id;
```

| id | item_id | section_designation | question_number | concept_id | concept_concept_id | concept_name |
|---|---|---|---|---|---|---|
| 1 | ITE-2792 | SECTION_A | 9 | 1 | 884350 | Extended Review |
| 2 | ITE-2795 | SECTION_B | 15 | 2 | 392497 | Pilot Initiative A |
| 3 | ITE-2798 | SECTION_A | 21 | 3 | 2106713 | Baseline Model |
| 4 | ITE-2801 | SECTION_B | 27 | 4 | 4463648 | Distributed Cluster |

This view joins assessment items to the concepts they evaluate, answering the question: "Which concept does each assessment item test?" The result set includes the item's columns alongside the concept's `concept_id`, `name`, `category`, `difficulty_level`, and `description`. Reading row 1: item `ITE-2792` tests concept `884350` (name "Extended Review", category SKILL, difficulty BASIC, description "Extended Survey"). Reading row 2: item `ITE-2795` tests concept `392497` (name "Pilot Initiative A", category KNOWLEDGE, difficulty INTERMEDIATE, description "Pilot Corridor A").

**View `vw_examination_paper_assessment_item_detail`**

```sql
CREATE VIEW vw_examination_paper_assessment_item_detail AS
SELECT a.id, a.paper_id, a.subject_code, b.id AS item_id, b.item_id AS item_item_id, b.section_designation AS item_section_designation
FROM examination_papers a
  JOIN papers_items j ON j.examination_paper_id = a.id
  JOIN assessment_items b ON b.id = j.assessment_item_id;
```

| id | paper_id | subject_code | item_id | item_item_id | item_section_designation |
|---|---|---|---|---|---|
| 1 | 2087750 | de_AT | 1 | ITE-2792 | SECTION_A |
| 1 | 2087750 | de_AT | 2 | ITE-2795 | SECTION_B |
| 2 | 3158138 | template_impcode_pagata_art15 | 2 | ITE-2795 | SECTION_B |
| 2 | 3158138 | template_impcode_pagata_art15 | 3 | ITE-2798 | SECTION_A |
| 3 | 5844268 | lu_tax_code_template_m_I | 3 | ITE-2798 | SECTION_A |
| 3 | 5844268 | lu_tax_code_template_m_I | 4 | ITE-2801 | SECTION_B |
| 4 | 13734000 | 990e161e10664c5885182d95dc07e606 | 4 | ITE-2801 | SECTION_B |
| 4 | 13734000 | 990e161e10664c5885182d95dc07e606 | 1 | ITE-2792 | SECTION_A |

This view joins examination papers to their constituent assessment items, answering the question: "What items compose each examination paper?" The result set includes the paper's identifying columns alongside each item's `item_id`, `section_designation`, `question_number`, `sub_question_label`, `marks_allotted`, `question_type`, and `status`. Reading row 1: paper `2087750` (subject code `de_AT`, class level `adaptive-class-83`, session `composite-academic-99`, 14 minutes, 7 marks, 12 questions, 21 required answers) contains item `ITE-2792` (SECTION_A, question 9, sub-question "Extended Corridor", 5.20 marks, OBJECTIVE, DRAFT). Reading row 2: paper `3158138` (subject code `template_impcode_pagata_art15`, class level `distributed-class-84`, session `primary-academic-100`, 23 minutes, 45 marks, 19 questions, 28 required answers) contains item `ITE-2795` (SECTION_B, question 15, sub-question "Pilot Series A", 7.40 marks, SUBJECTIVE, APPROVED).

**View `vw_examination_paper_subject`**

```sql
CREATE VIEW vw_examination_paper_subject AS
SELECT a.id, a.paper_id, a.subject_code, a.class_level, b.subject_id AS subject_subject_id, b.subject_code AS subject_subject_code, b.name AS subject_name
FROM examination_papers a JOIN subjects b ON a.subject_id = b.subject_id;
```

| id | paper_id | subject_code | class_level | subject_subject_id | subject_subject_code | subject_name |
|---|---|---|---|---|---|---|
| 1 | 2087750 | de_AT | adaptive-class-83 | 1000 | de_AT | Extended Review |
| 2 | 3158138 | template_impcode_pagata_art15 | distributed-class-84 | 1001 | template_impcode_pagata_art15 | Pilot Initiative A |
| 3 | 5844268 | lu_tax_code_template_m_I | baseline-class-85 | 1002 | lu_tax_code_template_m_I | Baseline Model |
| 4 | 13734000 | 990e161e10664c5885182d95dc07e606 | pilot-class-86 | 1003 | 990e161e10664c5885182d95dc07e606 | Distributed Cluster |

This view joins examination papers to their parent subjects, answering the question: "Which subject does each examination paper assess?" The result set includes the paper's identifying columns alongside the subject's `subject_id`, `subject_code`, `class_level`, and `academic_session`. Reading row 1: paper `2087750` (subject code `de_AT`, class level `adaptive-class-83`, session `composite-academic-99`, 14 minutes, 7 marks, 12 questions, 21 required answers) belongs to subject `1000`. Reading row 2: paper `3158138` (subject code `template_impcode_pagata_art15`, class level `distributed-class-84`, session `primary-academic-100`, 23 minutes, 45 marks, 19 questions, 28 required answers) belongs to subject `1001`.

**View `vw_source_material_source_page_detail`**

```sql
CREATE VIEW vw_source_material_source_page_detail AS
SELECT a.id, a.material_id, a.title, b.page_id AS page_page_id, b.page_number AS page_page_number, b.unit_number AS page_unit_number
FROM source_materials a
  JOIN materials_pages j ON j.source_material_id = a.id
  JOIN source_pages b ON b.page_id = j.page_id;
```

| id | material_id | title | page_page_id | page_page_number | page_unit_number |
|---|---|---|---|---|---|
| 1 | 2839521 | Compact Initiative | 32825 | 48 | 30 |
| 1 | 2839521 | Compact Initiative | 69438 | 59 | 40 |
| 2 | 937739 | Legacy Model | 69438 | 59 | 40 |
| 2 | 937739 | Legacy Model | 739 | 70 | 50 |
| 3 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | 739 | 70 | 50 |
| 3 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | gd_acc_221000 | 81 | 60 |
| 4 | 7021001070070 | Seasonal Review | gd_acc_221000 | 81 | 60 |
| 4 | 7021001070070 | Seasonal Review | 32825 | 48 | 30 |

This view joins source materials to their annotated pages, answering the question: "Which pages belong to each source material, and what concepts do they cover?" The result set includes the material's identifying columns alongside each page's `page_id`, `page_number`, `unit_number`, `chapter_number`, `content_snippet`, and `concept_id`. Reading row 1: material `2839521` (title "Compact Initiative", publisher `pilot-publishe-50`, edition `baseline-edition-91`, ISBN `2618568`, year 25, format TEXTBOOK) contains page `32825` (page number 48, unit 30, chapter 49, snippet "legacy-content-79", concept 1). Reading row 2: material `937739` (title "Legacy Model", publisher `extended-publishe-51`, edition `pilot-edition-92`, ISBN `4277024`, year 33, format HANDBOOK) contains page `69438` (page number 59, unit 40, chapter 60, snippet "compact-content-80", concept 2).

**View `vw_source_page_source_material`**

```sql
CREATE VIEW vw_source_page_source_material AS
SELECT a.page_id, a.page_number, a.unit_number, a.chapter_number, b.id AS material_id, b.material_id AS material_material_id, b.title AS material_title
FROM source_pages a JOIN source_materials b ON a.source_material_id = b.id;
```

| page_id | page_number | unit_number | chapter_number | material_id | material_material_id | material_title |
|---|---|---|---|---|---|---|
| 32825 | 48 | 30 | 49 | 1 | 2839521 | Compact Initiative |
| 69438 | 59 | 40 | 60 | 2 | 937739 | Legacy Model |
| 739 | 70 | 50 | 71 | 3 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A |
| gd_acc_221000 | 81 | 60 | 82 | 4 | 7021001070070 | Seasonal Review |

This view joins source pages to their parent materials, answering the question: "Which source material does each page belong to?" The result set includes the page's identifying columns alongside the material's `material_id`, `title`, `publisher`, `edition`, `isbn`, `publication_year`, and `format`. Reading row 1: page `32825` (page number 48, unit 30, chapter 49, snippet "legacy-content-79", concept 1) belongs to material `2839521` (title "Compact Initiative", publisher `pilot-publishe-50`, edition `baseline-edition-91`, ISBN `2618568`, year 25, format TEXTBOOK). Reading row 2: page `69438` (page number 59, unit 40, chapter 60, snippet "compact-content-80", concept 2) belongs to material `937739` (title "Legacy Model", publisher `extended-publishe-51`, edition `pilot-edition-92`, ISBN `4277024`, year 33, format HANDBOOK).

**View `vw_source_page_concept`**

```sql
CREATE VIEW vw_source_page_concept AS
SELECT a.page_id, a.page_number, a.unit_number, a.chapter_number, b.id AS concept_id, b.concept_id AS concept_concept_id, b.name AS concept_name
FROM source_pages a JOIN concepts b ON a.concept_id = b.id;
```

| page_id | page_number | unit_number | chapter_number | concept_id | concept_concept_id | concept_name |
|---|---|---|---|---|---|---|
| 32825 | 48 | 30 | 49 | 1 | 884350 | Extended Review |
| 69438 | 59 | 40 | 60 | 2 | 392497 | Pilot Initiative A |
| 739 | 70 | 50 | 71 | 3 | 2106713 | Baseline Model |
| gd_acc_221000 | 81 | 60 | 82 | 4 | 4463648 | Distributed Cluster |

This view joins source pages to the concepts they annotate, answering the question: "Which concept does each source page cover?" The result set includes the page's identifying columns alongside the concept's `concept_id`, `name`, `category`, `difficulty_level`, and `description`. Reading row 1: page `32825` (page number 48, unit 30, chapter 49, snippet "legacy-content-79", material `2839521`) covers concept `884350` (name "Extended Review", category SKILL, difficulty BASIC, description "Extended Survey"). Reading row 2: page `69438` (page number 59, unit 40, chapter 60, snippet "compact-content-80", material `937739`) covers concept `392497` (name "Pilot Initiative A", category KNOWLEDGE, difficulty INTERMEDIATE, description "Pilot Corridor A").

**View `vw_concept_curriculum_unit`**

```sql
CREATE VIEW vw_concept_curriculum_unit AS
SELECT a.id, a.concept_id, a.name, a.category, b.id AS unit_id, b.unit_id AS unit_unit_id, b.title AS unit_title
FROM concepts a JOIN curriculum_units b ON a.curriculum_unit_id = b.id;
```

| id | concept_id | name | category | unit_id | unit_unit_id | unit_title |
|---|---|---|---|---|---|---|
| 1 | 884350 | Extended Review | SKILL | 1 | 39800614 | Compact Initiative |
| 2 | 392497 | Pilot Initiative A | KNOWLEDGE | 2 | 611523 | Legacy Model |
| 3 | 2106713 | Baseline Model | TECHNIQUE | 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Cluster A |
| 4 | 4463648 | Distributed Cluster | SKILL | 4 | account_pymes_1040 | Seasonal Review |

This view joins concepts to the curriculum units that teach them, answering the question: "Which curriculum unit teaches each concept?" The result set includes the concept's identifying columns alongside the unit's `unit_id`, `title`, `unit_number`, `duration_hours`, `learning_outcomes`, and `subject_id`. Reading row 1: concept `884350` (name "Extended Review", category SKILL, difficulty BASIC, description "Extended Survey") is taught in unit `39800614` (title "Compact Initiative", unit number 30, duration 3.70 hours, outcomes `extended-learning-69`, subject `1000`). Reading row 2: concept `392497` (name "Pilot Initiative A", category KNOWLEDGE, difficulty INTERMEDIATE, description "Pilot Corridor A") is taught in unit `611523` (title "Legacy Model", unit number 40, duration 7.40 hours, outcomes `integrated-learning-70`, subject `1001`).

**View `vw_concept_assessment_item`**

```sql
CREATE VIEW vw_concept_assessment_item AS
SELECT a.id, a.concept_id, a.name, a.category, b.id AS item_id, b.item_id AS item_item_id, b.section_designation AS item_section_designation
FROM concepts a JOIN assessment_items b ON a.assessment_item_id = b.id;
```

| id | concept_id | name | category | item_id | item_item_id | item_section_designation |
|---|---|---|---|---|---|---|
| 1 | 884350 | Extended Review | SKILL | 1 | ITE-2792 | SECTION_A |
| 2 | 392497 | Pilot Initiative A | KNOWLEDGE | 2 | ITE-2795 | SECTION_B |
| 3 | 2106713 | Baseline Model | TECHNIQUE | 3 | ITE-2798 | SECTION_A |
| 4 | 4463648 | Distributed Cluster | SKILL | 4 | ITE-2801 | SECTION_B |

This view joins concepts to the assessment items that evaluate them, answering the question: "Which assessment item tests each concept?" The result set includes the concept's identifying columns alongside the item's `item_id`, `section_designation`, `question_number`, `sub_question_label`, `marks_allotted`, `question_type`, and `status`. Reading row 1: concept `884350` (name "Extended Review", category SKILL, difficulty BASIC, description "Extended Survey") is tested by item `ITE-2792` (SECTION_A, question 9, sub-question "Extended Corridor", 5.20 marks, OBJECTIVE, DRAFT). Reading row 2: concept `392497` (name "Pilot Initiative A", category KNOWLEDGE, difficulty INTERMEDIATE, description "Pilot Corridor A") is tested by item `ITE-2795` (SECTION_B, question 15, sub-question "Pilot Series A", 7.40 marks, SUBJECTIVE, APPROVED).

**View `vw_curriculum_unit_concept_detail`**

```sql
CREATE VIEW vw_curriculum_unit_concept_detail AS
SELECT a.id, a.unit_id, a.title, b.id AS concept_id, b.concept_id AS concept_concept_id, b.name AS concept_name
FROM curriculum_units a
  JOIN units_concepts j ON j.curriculum_unit_id = a.id
  JOIN concepts b ON b.id = j.concept_id;
```

| id | unit_id | title | concept_id | concept_concept_id | concept_name |
|---|---|---|---|---|---|
| 1 | 39800614 | Compact Initiative | 1 | 884350 | Extended Review |
| 1 | 39800614 | Compact Initiative | 2 | 392497 | Pilot Initiative A |
| 2 | 611523 | Legacy Model | 2 | 392497 | Pilot Initiative A |
| 2 | 611523 | Legacy Model | 3 | 2106713 | Baseline Model |
| 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Cluster A | 3 | 2106713 | Baseline Model |
| 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Cluster A | 4 | 4463648 | Distributed Cluster |
| 4 | account_pymes_1040 | Seasonal Review | 4 | 4463648 | Distributed Cluster |
| 4 | account_pymes_1040 | Seasonal Review | 1 | 884350 | Extended Review |

This view joins curriculum units to their constituent concepts, answering the question: "What concepts does each curriculum unit teach?" The result set includes the unit's identifying columns alongside each concept's `concept_id`, `name`, `category`, `difficulty_level`, and `description`. Reading row 1: unit `39800614` (title "Compact Initiative", unit number 30, duration 3.70 hours, outcomes `extended-learning-69`, subject `1000`) teaches concept `884350` (name "Extended Review", category SKILL, difficulty BASIC, description "Extended Survey"). Reading row 2: unit `611523` (title "Legacy Model", unit number 40, duration 7.40 hours, outcomes `integrated-learning-70`, subject `1001`) teaches concept `392497` (name "Pilot Initiative A", category KNOWLEDGE, difficulty INTERMEDIATE, description "Pilot Corridor A").

**View `vw_curriculum_unit_subject`**

```sql
CREATE VIEW vw_curriculum_unit_subject AS
SELECT a.id, a.unit_id, a.title, a.unit_number, b.subject_id AS subject_subject_id, b.subject_code AS subject_subject_code, b.name AS subject_name
FROM curriculum_units a JOIN subjects b ON a.subject_id = b.subject_id;
```

| id | unit_id | title | unit_number | subject_subject_id | subject_subject_code | subject_name |
|---|---|---|---|---|---|---|
| 1 | 39800614 | Compact Initiative | 30 | 1000 | de_AT | Extended Review |
| 2 | 611523 | Legacy Model | 40 | 1001 | template_impcode_pagata_art15 | Pilot Initiative A |
| 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Cluster A | 50 | 1002 | lu_tax_code_template_m_I | Baseline Model |
| 4 | account_pymes_1040 | Seasonal Review | 60 | 1003 | 990e161e10664c5885182d95dc07e606 | Distributed Cluster |

This view joins curriculum units to their parent subjects, answering the question: "Which subject does each curriculum unit belong to?" The result set includes the unit's identifying columns alongside the subject's `subject_id`, `subject_code`, `class_level`, and `academic_session`. Reading row 1: unit `39800614` (title "Compact Initiative", unit number 30, duration 3.70 hours, outcomes `extended-learning-69`) belongs to subject `1000` (subject code `de_AT`, class level `adaptive-class-83`, session `composite-academic-99`). Reading row 2: unit `611523` (title "Legacy Model", unit number 40, duration 7.40 hours, outcomes `integrated-learning-70`) belongs to subject `1001` (subject code `template_impcode_pagata_art15`, class level `distributed-class-84`, session `primary-academic-100`).

**View `vw_subject_curriculum_unit_detail`**

```sql
CREATE VIEW vw_subject_curriculum_unit_detail AS
SELECT a.subject_id, a.subject_code, a.name, b.id AS unit_id, b.unit_id AS unit_unit_id, b.title AS unit_title
FROM subjects a
  JOIN subjects_units j ON j.subject_id = a.subject_id
  JOIN curriculum_units b ON b.id = j.curriculum_unit_id;
```

| subject_id | subject_code | name | unit_id | unit_unit_id | unit_title |
|---|---|---|---|---|---|
| 1000 | de_AT | Extended Review | 1 | 39800614 | Compact Initiative |
| 1000 | de_AT | Extended Review | 2 | 611523 | Legacy Model |
| 1001 | template_impcode_pagata_art15 | Pilot Initiative A | 2 | 611523 | Legacy Model |
| 1001 | template_impcode_pagata_art15 | Pilot Initiative A | 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Cluster A |
| 1002 | lu_tax_code_template_m_I | Baseline Model | 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Cluster A |
| 1002 | lu_tax_code_template_m_I | Baseline Model | 4 | account_pymes_1040 | Seasonal Review |
| 1003 | 990e161e10664c5885182d95dc07e606 | Distributed Cluster | 4 | account_pymes_1040 | Seasonal Review |
| 1003 | 990e161e10664c5885182d95dc07e606 | Distributed Cluster | 1 | 39800614 | Compact Initiative |

This view joins subjects to their constituent curriculum units, answering the question: "What curriculum units does each subject contain?" The result set includes the subject's identifying columns alongside each unit's `unit_id`, `title`, `unit_number`, `duration_hours`, and `learning_outcomes`. Reading row 1: subject `1000` (subject code `de_AT`, class level `adaptive-class-83`, session `composite-academic-99`) contains unit `39800614` (title "Compact Initiative", unit number 30, duration 3.70 hours, outcomes `extended-learning-69`). Reading row 2: subject `1001` (subject code `template_impcode_pagata_art15`, class level `distributed-class-84`, session `primary-academic-100`) contains unit `611523` (title "Legacy Model", unit number 40, duration 7.40 hours, outcomes `integrated-learning-70`).

**View `vw_subject_examination_paper`**

```sql
CREATE VIEW vw_subject_examination_paper AS
SELECT a.subject_id, a.subject_code, a.name, a.class_level, b.id AS paper_id, b.paper_id AS paper_paper_id, b.subject_code AS paper_subject_code
FROM subjects a JOIN examination_papers b ON a.examination_paper_id = b.id;
```

| subject_id | subject_code | name | class_level | paper_id | paper_paper_id | paper_subject_code |
|---|---|---|---|---|---|---|
| 1000 | de_AT | Extended Review | adaptive-class-83 | 1 | 2087750 | de_AT |
| 1001 | template_impcode_pagata_art15 | Pilot Initiative A | distributed-class-84 | 2 | 3158138 | template_impcode_pagata_art15 |
| 1002 | lu_tax_code_template_m_I | Baseline Model | baseline-class-85 | 3 | 5844268 | lu_tax_code_template_m_I |
| 1003 | 990e161e10664c5885182d95dc07e606 | Distributed Cluster | pilot-class-86 | 4 | 13734000 | 990e161e10664c5885182d95dc07e606 |

This view joins subjects to their examination papers, answering the question: "Which examination papers does each subject have?" The result set includes the subject's identifying columns alongside each paper's `paper_id`, `subject_code`, `class_level`, `academic_session`, `max_time_minutes`, `total_marks`, `total_questions`, `required_answers`, and `publication_date`. Reading row 1: subject `1000` (subject code `de_AT`, class level `adaptive-class-83`, session `composite-academic-99`) has paper `2087750` (subject code `de_AT`, class level `adaptive-class-83`, session `composite-academic-99`, 14 minutes, 7 marks, 12 questions, 21 required answers, published 2025-12-01). Reading row 2: subject `1001` (subject code `template_impcode_pagata_art15`, class level `distributed-class-84`, session `primary-academic-100`) has paper `3158138` (subject code `template_impcode_pagata_art15`, class level `distributed-class-84`, session `primary-academic-100`, 23 minutes, 45 marks, 19 questions, 28 required answers, published 2022-05-12).

The educational assessment and curriculum architecture described here provides a comprehensive framework for organizing instructional content, mapping conceptual knowledge to measurable outcomes, and assembling examination instruments from curated source materials. The hierarchical structure—subjects containing curriculum units, units teaching concepts, concepts informing assessment items, and items composing examination papers—enables precise curriculum planning and assessment design. The source material tracking system, with its page-level annotations and concept tagging, supports traceability from assessment items back to their published origins. The junction tables and analytical views together provide the flexibility and insight needed for curriculum administrators, assessment designers, and instructional planners to manage complex educational programs with rigor and clarity.