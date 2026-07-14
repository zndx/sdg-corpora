The educational assessment ecosystem described here captures the full lifecycle of examination construction — from curriculum design through source material selection, concept mapping, and item assembly — and stores every artifact in a normalized relational schema. At its core, the domain revolves around seven base entities: `assessment_items` (individual test questions), `examination_papers` (assembled test documents), `source_materials` (textbooks, handbooks, and guides), `source_pages` (page-level excerpts from those materials), `concepts` (the knowledge units being assessed), `curriculum_units` (structured learning modules), and `subjects` (the academic disciplines that organize everything). These entities are linked through four junction tables — `papers_items`, `materials_pages`, `units_concepts`, and `subjects_units` — which resolve many-to-many relationships into foreign-key pairs. The resulting schema supports fourteen materialized views that reassemble the normalized facts into domain-meaningful joins, each answering a specific analytical question about the assessment pipeline.

## Base Entities and Their Attributes

The `assessment_items` table is the atomic unit of examination content. Each row represents a single question, identified by a surrogate `id` and a human-readable `item_id` such as `ITE-2792`. The question is classified by `question_type` (either `OBJECTIVE` or `SUBJECTIVE`), assigned to a `section_designation` like `SECTION_A` or `SECTION_B`, and numbered within that section via `question_number` and optionally a `sub_question_label` such as `Extended Corridor`. The `marks_allotted` column (e.g., `5.20`, `7.40`) records the point value, while `status` tracks the lifecycle stage — `DRAFT`, `APPROVED`, or `ARCHIVED`. Three foreign keys anchor each item to its context: `examination_paper_id` links the item to the paper it belongs to, `source_material_id` traces it back to the reference material, and `concept_id` ties it to the underlying knowledge unit.

**Table `assessment_items`**

| id | item_id | section_designation | question_number | sub_question_label | marks_allotted | question_type | status | examination_paper_id | source_material_id | concept_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | ITE-2792 | SECTION_A | 9 | Extended Corridor | 5.20 | OBJECTIVE | DRAFT | 1 | 1 | 1 |
| 2 | ITE-2795 | SECTION_B | 15 | Pilot Series A | 7.40 | SUBJECTIVE | APPROVED | 2 | 2 | 2 |
| 3 | ITE-2798 | SECTION_A | 21 | Baseline Assessment | 9.60 | OBJECTIVE | ARCHIVED | 3 | 3 | 3 |
| 4 | ITE-2801 | SECTION_B | 27 | Distributed Survey | 11.80 | SUBJECTIVE | DRAFT | 4 | 4 | 4 |

The `examination_papers` table stores the assembled test documents. Each paper carries a `paper_id` (e.g., `2087750`, `3158138`), a `subject_code` that identifies the discipline, and a `class_level` such as `adaptive-class-83` or `distributed-class-84`. The `academic_session` field (e.g., `composite-academic-99`, `primary-academic-100`) groups papers into academic terms. Administrative metadata includes `max_time_minutes` (ranging from `14` to `41` in the sample), `total_marks` (from `7` to `45`), `total_questions` (from `11` to `61`), and `required_answers` (from `21` to `42`). The `publication_date` column records when the paper was released, and the `subject_id` foreign key connects the paper to its parent `subjects` record.

**Table `examination_papers`**

| id | paper_id | subject_code | class_level | academic_session | max_time_minutes | total_marks | total_questions | required_answers | publication_date | subject_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 2087750 | de_AT | adaptive-class-83 | composite-academic-99 | 14 | 7 | 12 | 21 | 2025-12-01T23:33:00 | 1000 |
| 2 | 3158138 | template_impcode_pagata_art15 | distributed-class-84 | primary-academic-100 | 23 | 45 | 19 | 28 | 2022-05-12T06:50:00 | 1001 |
| 3 | 5844268 | lu_tax_code_template_m_I | baseline-class-85 | adaptive-academic-101 | 32 | 9 | 11 | 35 | 2023-10-23T13:07:00 | 1002 |
| 4 | 13734000 | 990e161e10664c5885182d95dc07e606 | pilot-class-86 | distributed-academic-102 | 41 | 16 | 61 | 42 | 2024-03-07T20:24:00 | 1003 |

Source materials — the reference texts from which assessment items are drawn — are stored in `source_materials`. Each row has a `material_id` (e.g., `2839521`, `937739`), a `title` such as `Compact Initiative` or `Legacy Model`, and a `publisher` name like `pilot-publishe-50`. The `edition` field (e.g., `baseline-edition-91`), `isbn` (e.g., `2618568`, `1208-0004-M`), and `publication_year` (ranging from `25` to `49`) provide bibliographic detail, while `format` classifies the material as `TEXTBOOK`, `HANDBOOK`, or `GUIDE`.

**Table `source_materials`**

| id | material_id | title | publisher | edition | isbn | publication_year | format |
|---|---|---|---|---|---|---|---|
| 1 | 2839521 | Compact Initiative | pilot-publishe-50 | baseline-edition-91 | 2618568 | 25 | TEXTBOOK |
| 2 | 937739 | Legacy Model | extended-publishe-51 | pilot-edition-92 | 4277024 | 33 | HANDBOOK |
| 3 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Cluster A | integrated-publishe-52 | extended-edition-93 | 1208-0004-M | 41 | GUIDE |
| 4 | 7021001070070 | Seasonal Review | seasonal-publishe-53 | integrated-edition-94 | 3717612 | 49 | TEXTBOOK |

The `source_pages` table captures page-level excerpts from source materials. Each row is identified by a `page_id` (e.g., `32825`, `gd_acc_221000`) and carries a `page_number` (from `48` to `81`), a `unit_number` (from `30` to `60`), and a `chapter_number` (from `49` to `82`). The `content_snippet` column holds a brief text excerpt such as `legacy-content-79` or `primary-content-82`. Two foreign keys link each page to its parent `source_material_id` and to a `concept_id`, establishing the conceptual provenance of the excerpt.

**Table `source_pages`**

| page_id | page_number | unit_number | chapter_number | content_snippet | source_material_id | concept_id |
|---|---|---|---|---|---|---|
| 32825 | 48 | 30 | 49 | legacy-content-79 | 1 | 1 |
| 69438 | 59 | 40 | 60 | compact-content-80 | 2 | 2 |
| 739 | 70 | 50 | 71 | composite-content-81 | 3 | 3 |
| gd_acc_221000 | 81 | 60 | 82 | primary-content-82 | 4 | 4 |

The `concepts` table is the knowledge-layer of the schema. Each concept has a `concept_id` (e.g., `884350`, `392497`), a `name` such as `Extended Review` or `Pilot Initiative A`, and a `category` (`SKILL`, `KNOWLEDGE`, or `TECHNIQUE`). The `difficulty_level` ranges from `BASIC` to `INTERMEDIATE` to `ADVANCED`, and the `description` provides a human-readable summary (e.g., `Extended Survey`, `Pilot Corridor A`). Two foreign keys anchor the concept: `curriculum_unit_id` links it to the learning module it belongs to, and `assessment_item_id` links it to the test item that assesses it.

**Table `concepts`**

| id | concept_id | name | category | difficulty_level | description | curriculum_unit_id | assessment_item_id |
|---|---|---|---|---|---|---|---|
| 1 | 884350 | Extended Review | SKILL | BASIC | Extended Survey | 1 | 1 |
| 2 | 392497 | Pilot Initiative A | KNOWLEDGE | INTERMEDIATE | Pilot Corridor A | 2 | 2 |
| 3 | 2106713 | Baseline Model | TECHNIQUE | ADVANCED | Baseline Series | 3 | 3 |
| 4 | 4463648 | Distributed Cluster | SKILL | BASIC | Distributed Assessment | 4 | 4 |

Curriculum units represent structured learning modules. Each unit has a `unit_id` (e.g., `39800614`, `611523`), a `title` such as `Compact Initiative` or `Legacy Model`, a `unit_number` (from `30` to `60`), and a `duration_hours` (from `3.70` to `14.80`). The `learning_outcomes` column (e.g., `extended-learning-69`, `regional-learning-72`) describes what students should achieve, and the `subject_id` foreign key connects the unit to its parent discipline.

**Table `curriculum_units`**

| id | unit_id | title | unit_number | duration_hours | learning_outcomes | subject_id |
|---|---|---|---|---|---|---|
| 1 | 39800614 | Compact Initiative | 30 | 3.70 | extended-learning-69 | 1000 |
| 2 | 611523 | Legacy Model | 40 | 7.40 | integrated-learning-70 | 1001 |
| 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | Regional Cluster A | 50 | 11.10 | seasonal-learning-71 | 1002 |
| 4 | account_pymes_1040 | Seasonal Review | 60 | 14.80 | regional-learning-72 | 1003 |

The `subjects` table sits at the top of the organizational hierarchy. Each subject is identified by a `subject_id` (e.g., `1000`, `1001`, `1002`, `1003`) and carries a `subject_code` that appears on examination papers. The subject organizes both curriculum units and examination papers through foreign-key relationships, serving as the primary axis of academic classification.

**Table `subjects`**

| subject_id | subject_code | name | class_level | department | credits | examination_paper_id |
|---|---|---|---|---|---|---|
| 1000 | de_AT | Extended Review | adaptive-class-83 | adaptive-departme-89 | 28 | 1 |
| 1001 | template_impcode_pagata_art15 | Pilot Initiative A | distributed-class-84 | distributed-departme-90 | 33 | 2 |
| 1002 | lu_tax_code_template_m_I | Baseline Model | baseline-class-85 | baseline-departme-91 | 38 | 3 |
| 1003 | 990e161e10664c5885182d95dc07e606 | Distributed Cluster | pilot-class-86 | pilot-departme-92 | 43 | 4 |

## Junction Tables and Many-to-Many Relationships

Four junction tables resolve the many-to-many relationships that the base entities cannot express through simple foreign keys. The `papers_items` table links `examination_papers` to `assessment_items`, allowing a single paper to contain many items and an item to potentially appear in multiple papers. The `materials_pages` table connects `source_materials` to `source_pages`, enabling a single textbook to span many pages and a page excerpt to be referenced by multiple materials. The `units_concepts` table links `curriculum_units` to `concepts`, supporting the pedagogical reality that a single learning module covers multiple concepts and a concept may be taught across multiple units. Finally, the `subjects_units` table connects `subjects` to `curriculum_units`, allowing a discipline to encompass many learning modules.

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

## Materialized Views and Domain Joins

The fourteen views in this schema materialize the most common analytical joins, each answering a specific question about the assessment ecosystem by reassembling normalized facts into domain-meaningful rows.

The `vw_assessment_item_examination_paper` view joins `assessment_items` to `examination_papers`, answering the question: "Which examination paper does this assessment item belong to?" A row with `item_id` `ITE-2792` joined to `paper_id` `2087750` tells us that the `Extended Corridor` question (worth `5.20` marks, in `SECTION_A`) is part of the paper published on `2025-12-01T23:33:00` with a maximum time of `14` minutes.

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

The `vw_assessment_item_source_material` view links `assessment_items` to `source_materials`, answering: "Which reference material informed this assessment item?" The row for `ITE-2795` (the `Pilot Series A` question, worth `7.40` marks) traces back to the source material `Legacy Model` (a `HANDBOOK` published with ISBN `4277024`), showing the provenance chain from question to reference.

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

The `vw_assessment_item_concept` view joins `assessment_items` to `concepts`, answering: "What knowledge unit does this item assess?" The `ITE-2798` item (`Baseline Assessment`, `OBJECTIVE` type, `9.60` marks) maps to the concept `Baseline Model` (category `TECHNIQUE`, difficulty `ADVANCED`), confirming that advanced technique questions are classified as objective items.

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

The `vw_examination_paper_assessment_item_detail` view inverts the relationship, joining `examination_papers` to `assessment_items` to answer: "What items compose this examination paper?" A row showing `paper_id` `3158138` (the `template_impcode_pagata_art15` paper, with `45` total marks and `19` total questions) linked to `item_id` `ITE-2795` tells us that the `Pilot Series A` question is one of the nineteen items in that paper.

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

The `vw_examination_paper_subject` view joins `examination_papers` to `subjects`, answering: "Which subject does this examination paper belong to?" The paper `5844268` (code `lu_tax_code_template_m_I`, `baseline-class-85`, `32` minutes, `9` total marks) is associated with subject `1002`, placing it within that discipline's assessment portfolio.

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

The `vw_source_material_source_page_detail` view joins `source_materials` to `source_pages`, answering: "Which pages from this material are referenced?" The material `2839521` (`Compact Initiative`, `TEXTBOOK` format) is linked to page `32825` (page number `48`, unit `30`, chapter `49`, snippet `legacy-content-79`), showing the specific page excerpt used as source material.

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

The `vw_source_page_source_material` view inverts the relationship, joining `source_pages` to `source_materials` to answer: "Which material does this page excerpt come from?" Page `gd_acc_221000` (page number `81`, unit `60`, chapter `82`, snippet `primary-content-82`) traces back to material `7021001070070` (`Seasonal Review`, `TEXTBOOK` format, ISBN `3717612`), establishing the material provenance of the excerpt.

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

The `vw_source_page_concept` view joins `source_pages` to `concepts`, answering: "What concept does this page excerpt support?" Page `69438` (page number `59`, unit `40`, chapter `60`, snippet `compact-content-80`) is linked to concept `392497` (`Pilot Initiative A`, category `KNOWLEDGE`, difficulty `INTERMEDIATE`), showing that intermediate-level knowledge concepts are supported by compact content excerpts.

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

The `vw_concept_curriculum_unit` view joins `concepts` to `curriculum_units`, answering: "Which learning module teaches this concept?" Concept `884350` (`Extended Review`, `SKILL` category, `BASIC` difficulty) is linked to curriculum unit `39800614` (`Compact Initiative`, unit number `30`, duration `3.70` hours), indicating that basic skill concepts are covered in shorter-duration modules.

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

The `vw_concept_assessment_item` view joins `concepts` to `assessment_items`, answering: "Which item assesses this concept?" Concept `4463648` (`Distributed Cluster`, `SKILL` category, `BASIC` difficulty) maps to assessment item `ITE-2801` (`Distributed Survey`, `SUBJECTIVE` type, `11.80` marks, `SECTION_B`), showing that basic skill concepts are assessed through subjective questions in Section B.

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

The `vw_curriculum_unit_concept_detail` view joins `curriculum_units` to `concepts`, answering: "What concepts are covered in this curriculum unit?" Unit `611523` (`Legacy Model`, unit number `40`, duration `7.40` hours, learning outcome `integrated-learning-70`) is linked to concept `392497` (`Pilot Initiative A`, `KNOWLEDGE` category, `INTERMEDIATE` difficulty), showing that intermediate knowledge concepts are taught in medium-duration units.

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

The `vw_curriculum_unit_subject` view joins `curriculum_units` to `subjects`, answering: "Which subject organizes this curriculum unit?" Unit `57dbb53c-8fcc-11eb-924d-9cd76263cbd0` (`Regional Cluster A`, unit number `50`, duration `11.10` hours, learning outcome `seasonal-learning-71`) belongs to subject `1002`, placing it within that discipline's curriculum structure.

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

The `vw_subject_curriculum_unit_detail` view joins `subjects` to `curriculum_units`, answering: "What units does this subject encompass?" Subject `1000` is linked to unit `39800614` (`Compact Initiative`, unit number `30`, duration `3.70` hours), showing that the discipline includes a short-duration introductory module.

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

The `vw_subject_examination_paper` view joins `subjects` to `examination_papers`, answering: "Which papers does this subject administer?" Subject `1003` is linked to paper `13734000` (code `990e161e10664c5885182d95dc07e606`, `pilot-class-86`, `41` minutes, `16` total marks, `61` total questions), showing that the discipline administers a high-volume, time-intensive examination.

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

## Synthesis

This schema models the educational assessment domain as a network of seven base entities connected through four junction tables, with fourteen materialized views providing ready-made analytical lenses. The normalization strategy separates concerns cleanly: `assessment_items` holds question-level detail, `examination_papers` holds document-level metadata, `source_materials` and `source_pages` capture bibliographic provenance, `concepts` encode the knowledge layer, `curriculum_units` structure the pedagogy, and `subjects` provide the organizational axis. The junction tables (`papers_items`, `materials_pages`, `units_concepts`, `subjects_units`) resolve the many-to-many relationships that arise when items span papers, pages span materials, concepts span units, and units span subjects. Each view reassembles these normalized pieces into a domain-meaningful fact — whether tracing an item back to its source material, mapping a concept to its curriculum home, or listing the papers administered by a subject. The concrete values in the data — from `ITE-2792` to `2087750`, from `Compact Initiative` to `Extended Review` — populate this structure with real assessment artifacts, making the schema both analytically useful and pedagogically grounded.