## Ontology-Grounded Relational Modelling of the Decision-Assessment Domain

The decision-assessment domain captures the lifecycle of capacity evaluations and best-interest determinations for persons who may require support in making decisions. At its core, the model revolves around four principal entity types: the `persons` table stores the individuals under assessment, the `professionals` table stores the clinicians, social workers, guardians, and advocates who conduct evaluations, the `decision_assessments` table records each assessment event, and the `best_interest_determinations` table records the formal outcomes. These entities are linked through a network of foreign keys and junction tables that enforce the many-to-many relationships inherent in the domain — a single person may undergo multiple assessments, a single assessment may involve multiple professionals and topics, and a single professional may participate in many determinations. The relational schema materializes this ontology by decomposing the conceptual graph into normalized tables, with each column representing an attribute and each foreign key representing a referential constraint.

**Table `decision_assessments`**

| id | assessment_id | assessment_date | decision_topic | assessor_id | capacity_status | support_provided | person_id | topic_id | professional_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | pilot-decision-20 | 5f901eb6-8fcd-11eb-924d-9cd76263cbd0 | capable | none | George Bernard Shaw | lu_tax_code_template_b_VB-IC-Tab | 100 |
| 2 | 19508914 | 2023-10-21T11:41:00 | extended-decision-21 | 4060646 | incapable | informational | Maria Rodriguez | 8387534 | 101 |
| 3 | 506000 | 2024-03-05T18:58:00 | integrated-decision-22 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | uncertain | communication_aid | Sarah Villanueva | 2933463 | 102 |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | seasonal-decision-23 | 2933475 | capable | advocacy | Susan Wagner | 2839516 | 103 |

The `decision_assessments` table is the central fact table of the model. Each row represents a discrete assessment event identified by a surrogate `id` (values `1` through `4` in the sample data) and an `assessment_id` that carries a business identifier such as `template_ivacode_pagata_20det40ind` or `19508914`. The `assessment_date` column records the timestamp of the evaluation, for example `2022-05-10T04:24:00`. The `decision_topic` column stores a human-readable label like `pilot-decision-20` or `extended-decision-21`. The cardinality-bounded relationships are expressed through three foreign keys: `assessor_id` references the `professionals` table, `person_id` references the `persons` table, and `topic_id` references the `decision_topics` table. The `capacity_status` column is a categorical attribute with values such as `capable`, `incapable`, and `uncertain`, while `support_provided` captures the type of support rendered, ranging from `none` and `informational` to `communication_aid` and `advocacy`. The `professional_id` column provides a second link to the `professionals` table, indicating the professional associated with the assessment. This dual linkage — through both `assessor_id` and `professional_id` — reflects the domain distinction between the primary assessor and the broader professional team.

**Table `persons`**

| person_id | legal_name | date_of_birth | jurisdiction | vulnerable_status | best_interest_determination_id |
|---|---|---|---|---|---|
| George Bernard Shaw | Jorge Sullivan | 2025-04-02 | regional-jurisdic-30 | false | 1000 |
| Maria Rodriguez | Walter Pratt | 2022-09-13 | legacy-jurisdic-31 | true | 1001 |
| Sarah Villanueva | Home Medix Oxygen | 2023-02-24 | compact-jurisdic-32 | false | 1002 |
| Susan Wagner | Hector Garcia | 2024-07-08 | composite-jurisdic-33 | true | 1003 |

The `persons` table stores the individuals who are the subjects of assessments and determinations. Each row is keyed by `legal_name`, which serves as the natural identifier — in the sample data, names include `George Bernard Shaw`, `Maria Rodriguez`, `Sarah Villanueva`, and `Susan Wagner`. The `date_of_birth` column records the person's birth date, such as `2025-04-02`. The `jurisdiction` column indicates the governing legal regime, with values like `regional-jurisdic-30` and `legacy-jurisdic-31`. The `vulnerable_status` column is a boolean flag; `Maria Rodriguez` and `Susan Wagner` are marked `true`, while `George Bernard Shaw` and `Sarah Villanueva` are marked `false`. The `best_interest_determination_id` column is a foreign key pointing to the `best_interest_determinations` table, establishing a one-to-one or one-to-many relationship between a person and their determination records. In the sample data, `George Bernard Shaw` links to determination `1000`, `Maria Rodriguez` to `1001`, and so on.

**Table `decision_topics`**

| topic_id | category_code | urgency_level | description | best_interest_determination_id | created_at | updated_at |
|---|---|---|---|---|---|---|
| lu_tax_code_template_b_VB-IC-Tab | medical | 36 | Extended Survey | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 8387534 | financial | 42 | Pilot Corridor A | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 2933463 | residential | 48 | Baseline Series | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 2839516 | legal | 54 | Distributed Assessment | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `decision_topics` table catalogs the categories of decisions under evaluation. Each row is identified by `topic_id`, which in the sample data takes values such as `lu_tax_code_template_b_VB-IC-Tab`, `8387534`, `2933463`, and `2839516`. The `category_code` column classifies the topic into domains like `medical`, `financial`, `residential`, and `legal`. The `urgency_level` column is a numeric attribute, with sample values of `36`, `42`, `48`, and `54`. The `description` column provides a free-text label, for instance `Extended Survey`, `Pilot Corridor A`, `Baseline Series`, and `Distributed Assessment`. The `best_interest_determination_id` column is a foreign key to the `best_interest_determinations` table, linking each topic to the determination in which it was considered. The `created_at` and `updated_at` columns record the lifecycle timestamps of the topic record.

**Table `best_interest_determinations`**

| id | determination_id | decision_date | chosen_option | restrictiveness_level | justification_text | status | person_id | topic_id | decision_assessment_id | professional_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 611493 | 2023-10-27T21:27:00 | compact-chosen-62 | minimal | compact-justific-92 | draft | George Bernard Shaw | lu_tax_code_template_b_VB-IC-Tab | 1 | 100 |
| 1001 | ChIJe0zpU4Bt5kcRC2Er6yFuxzs | 2024-03-11T04:44:00 | composite-chosen-63 | moderate | composite-justific-93 | finalized | Maria Rodriguez | 8387534 | 2 | 101 |
| 1002 | IVC4Iind | 2025-08-22T11:01:00 | primary-chosen-64 | high | primary-justific-94 | reviewed | Sarah Villanueva | 2933463 | 3 | 102 |
| 1003 | 22028620 | 2022-01-06T18:18:00 | adaptive-chosen-65 | minimal | adaptive-justific-95 | draft | Susan Wagner | 2839516 | 4 | 103 |

The `best_interest_determinations` table records the formal outcomes of the assessment process. Each row is identified by a surrogate `id` (`1000` through `1003` in the sample) and carries a `determination_id` business identifier such as `611493` or `ChIJe0zpU4Bt5kcRC2Er6yFuxzs`. The `decision_date` column records when the determination was made, for example `2023-10-27T21:27:00`. The `chosen_option` column captures the selected course of action, with values like `compact-chosen-62`, `composite-chosen-63`, `primary-chosen-64`, and `adaptive-chosen-65`. The `restrictiveness_level` column is categorical, taking values `minimal`, `moderate`, and `high`. The `justification_text` column stores the rationale, such as `compact-justific-92` or `composite-justific-93`. The `status` column tracks the workflow state with values `draft`, `finalized`, and `reviewed`. Four foreign keys anchor this table to the rest of the schema: `person_id` links to `persons`, `topic_id` links to `decision_topics`, `decision_assessment_id` links to `decision_assessments`, and `professional_id` links to `professionals`. This multi-faceted linkage ensures that every determination is traceable to the person assessed, the topic evaluated, the assessment event that produced it, and the professional who authored it.

**Table `professionals`**

| id | professional_id | full_name | license_number | role_type | jurisdiction |
|---|---|---|---|---|---|
| 100 | 5082965 | Theodore Mcgrath | LIC-2589 | clinician | regional-jurisdic-30 |
| 101 | 2618560 | Account Name | LIC-2596 | social_worker | legacy-jurisdic-31 |
| 102 | 3355767 | Saipan International Airport | LIC-2603 | guardian | compact-jurisdic-32 |
| 103 | 3355784 | Norma Fisher | LIC-2610 | advocate | composite-jurisdic-33 |

The `professionals` table stores the individuals and organizations who conduct assessments and determinations. Each row is keyed by a surrogate `id` (`100` through `103`) and carries a `professional_id` business identifier such as `5082965` or `2618560`. The `full_name` column records the professional's name, which in the sample data includes both individual names like `Theodore Mcgrath` and `Norma Fisher` and organizational names like `Account Name` and `Saipan International Airport`. The `license_number` column stores the professional's credential, for example `LIC-2589` and `LIC-2610`. The `role_type` column classifies the professional's function, with values `clinician`, `social_worker`, `guardian`, and `advocate`. The `jurisdiction` column indicates the legal jurisdiction in which the professional is authorized to practice, matching the jurisdiction values in the `persons` table.

The domain's many-to-many relationships are materialized through four junction tables. The `persons_assessments` table resolves the relationship between persons and assessments, allowing a single person to be associated with multiple assessments and a single assessment to involve multiple persons. In the sample data, `George Bernard Shaw` appears in assessments `1` and `2`, `Maria Rodriguez` in assessments `2` and `3`, `Sarah Villanueva` in assessments `3` and `4`, and `Susan Wagner` in assessments `4` and `1`. This cross-referencing pattern ensures that the normalized schema can represent complex participation scenarios without data duplication.

**Table `persons_assessments`**

| person_id | decision_assessment_id |
|---|---|
| George Bernard Shaw | 1 |
| George Bernard Shaw | 2 |
| Maria Rodriguez | 2 |
| Maria Rodriguez | 3 |
| Sarah Villanueva | 3 |
| Sarah Villanueva | 4 |
| Susan Wagner | 4 |
| Susan Wagner | 1 |

The `topics_assessments` table resolves the many-to-many relationship between decision topics and assessments, enabling a topic to be evaluated across multiple assessment events and an assessment to address multiple topics. Although the sample data does not show explicit rows for this table, its structural role is symmetric to `persons_assessments`: each row contains a `topic_id` and a `decision_assessment_id` pair.

**Table `topics_assessments`**

| topic_id | decision_assessment_id |
|---|---|
| lu_tax_code_template_b_VB-IC-Tab | 1 |
| lu_tax_code_template_b_VB-IC-Tab | 2 |
| 8387534 | 2 |
| 8387534 | 3 |
| 2933463 | 3 |
| 2933463 | 4 |
| 2839516 | 4 |
| 2839516 | 1 |

The `professionals_assessments` table resolves the many-to-many relationship between professionals and assessments, allowing a professional to participate in multiple assessments and an assessment to involve multiple professionals. Like `topics_assessments`, its rows consist of a `professional_id` and a `decision_assessment_id` pair, providing the bridge between the `professionals` and `decision_assessments` tables.

**Table `professionals_assessments`**

| professional_id | decision_assessment_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `professionals_determinations` table resolves the many-to-many relationship between professionals and best-interest determinations, enabling a professional to be associated with multiple determinations and a determination to involve multiple professionals. Its rows contain a `professional_id` and a `best_interest_determination_id` pair, linking the `professionals` table to the `best_interest_determinations` table.

**Table `professionals_determinations`**

| professional_id | best_interest_determination_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

With the base tables and junction tables established, the view layer reconstructs domain facts by joining the normalized tables back into denormalized projections. Each view answers a specific analytical question by assembling the relevant attributes from multiple tables into a single result set.

**View `decision_assessment_person_view`**

```sql
CREATE VIEW decision_assessment_person_view AS
SELECT a.id, a.assessment_id, a.assessment_date, a.decision_topic, b.person_id AS person_person_id, b.legal_name AS person_legal_name, b.date_of_birth AS person_date_of_birth
FROM decision_assessments a JOIN persons b ON a.person_id = b.person_id;
```

| id | assessment_id | assessment_date | decision_topic | person_person_id | person_legal_name | person_date_of_birth |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | pilot-decision-20 | George Bernard Shaw | Jorge Sullivan | 2025-04-02 |
| 2 | 19508914 | 2023-10-21T11:41:00 | extended-decision-21 | Maria Rodriguez | Walter Pratt | 2022-09-13 |
| 3 | 506000 | 2024-03-05T18:58:00 | integrated-decision-22 | Sarah Villanueva | Home Medix Oxygen | 2023-02-24 |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | seasonal-decision-23 | Susan Wagner | Hector Garcia | 2024-07-08 |

The `decision_assessment_person_view` joins `decision_assessments` with `persons` on the `person_id` column, producing a row that pairs each assessment with the legal name, date of birth, jurisdiction, and vulnerable status of the person being assessed. For example, assessment `1` (with `assessment_id` `template_ivacode_pagata_20det40ind`) is joined with `George Bernard Shaw`, revealing that this capable person resides in `regional-jurisdic-30` and is not flagged as vulnerable. Assessment `2` (with `assessment_id` `19508914`) is joined with `Maria Rodriguez`, showing an incapable person in `legacy-jurisdic-31` who is flagged as vulnerable. This view answers the question: "What are the demographic and vulnerability characteristics of the persons undergoing each assessment?"

**View `decision_assessment_decision_topic_view`**

```sql
CREATE VIEW decision_assessment_decision_topic_view AS
SELECT a.id, a.assessment_id, a.assessment_date, a.decision_topic, b.topic_id AS topic_topic_id, b.category_code AS topic_category_code, b.urgency_level AS topic_urgency_level
FROM decision_assessments a JOIN decision_topics b ON a.topic_id = b.topic_id;
```

| id | assessment_id | assessment_date | decision_topic | topic_topic_id | topic_category_code | topic_urgency_level |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | pilot-decision-20 | lu_tax_code_template_b_VB-IC-Tab | medical | 36 |
| 2 | 19508914 | 2023-10-21T11:41:00 | extended-decision-21 | 8387534 | financial | 42 |
| 3 | 506000 | 2024-03-05T18:58:00 | integrated-decision-22 | 2933463 | residential | 48 |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | seasonal-decision-23 | 2839516 | legal | 54 |

The `decision_assessment_decision_topic_view` joins `decision_assessments` with `decision_topics` on the `topic_id` column, pairing each assessment with the category code, urgency level, and description of the topic under evaluation. Assessment `1` is linked to topic `lu_tax_code_template_b_VB-IC-Tab`, a `medical` category topic with urgency level `36` described as `Extended Survey`. Assessment `2` is linked to topic `8387534`, a `financial` category topic with urgency level `42` described as `Pilot Corridor A`. This view answers: "Which decision topics, with what categories and urgency levels, are being assessed in each evaluation event?"

**View `decision_assessment_professional_view`**

```sql
CREATE VIEW decision_assessment_professional_view AS
SELECT a.id, a.assessment_id, a.assessment_date, a.decision_topic, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM decision_assessments a JOIN professionals b ON a.professional_id = b.id;
```

| id | assessment_id | assessment_date | decision_topic | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | pilot-decision-20 | 100 | 5082965 | Theodore Mcgrath |
| 2 | 19508914 | 2023-10-21T11:41:00 | extended-decision-21 | 101 | 2618560 | Account Name |
| 3 | 506000 | 2024-03-05T18:58:00 | integrated-decision-22 | 102 | 3355767 | Saipan International Airport |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | seasonal-decision-23 | 103 | 3355784 | Norma Fisher |

The `decision_assessment_professional_view` joins `decision_assessments` with `professionals` on the `professional_id` column, producing a row that pairs each assessment with the full name, license number, role type, and jurisdiction of the associated professional. Assessment `1` is linked to professional `100` (`Theodore Mcgrath`, a `clinician` with license `LIC-2589` in `regional-jurisdic-30`). Assessment `2` is linked to professional `101` (`Account Name`, a `social_worker` with license `LIC-2596` in `legacy-jurisdic-31`). This view answers: "Which professionals, with what roles and credentials, are associated with each assessment?"

**View `person_decision_assessment_detail_view`**

```sql
CREATE VIEW person_decision_assessment_detail_view AS
SELECT a.person_id, a.legal_name, a.date_of_birth, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM persons a
  JOIN persons_assessments j ON j.person_id = a.person_id
  JOIN decision_assessments b ON b.id = j.decision_assessment_id;
```

| person_id | legal_name | date_of_birth | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|
| George Bernard Shaw | Jorge Sullivan | 2025-04-02 | 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| George Bernard Shaw | Jorge Sullivan | 2025-04-02 | 2 | 19508914 | 2023-10-21T11:41:00 |
| Maria Rodriguez | Walter Pratt | 2022-09-13 | 2 | 19508914 | 2023-10-21T11:41:00 |
| Maria Rodriguez | Walter Pratt | 2022-09-13 | 3 | 506000 | 2024-03-05T18:58:00 |
| Sarah Villanueva | Home Medix Oxygen | 2023-02-24 | 3 | 506000 | 2024-03-05T18:58:00 |
| Sarah Villanueva | Home Medix Oxygen | 2023-02-24 | 4 | 1204-0009-M | 2025-08-16T01:15:00 |
| Susan Wagner | Hector Garcia | 2024-07-08 | 4 | 1204-0009-M | 2025-08-16T01:15:00 |
| Susan Wagner | Hector Garcia | 2024-07-08 | 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |

The `person_decision_assessment_detail_view` joins `persons` with `decision_assessments` on the `person_id` column, producing a row that lists each person alongside all assessments they have undergone. For `George Bernard Shaw`, the view yields two rows: one for assessment `1` (with `assessment_id` `template_ivacode_pagata_20det40ind`, capacity status `capable`, and support `none`) and one for assessment `2` (with `assessment_id` `19508914`, capacity status `incapable`, and support `informational`). For `Maria Rodriguez`, the view yields assessments `2` and `3`. This view answers: "What is the complete assessment history for each person?"

**View `person_best_interest_determination_view`**

```sql
CREATE VIEW person_best_interest_determination_view AS
SELECT a.person_id, a.legal_name, a.date_of_birth, a.jurisdiction, b.id AS determination_id, b.determination_id AS determination_determination_id, b.decision_date AS determination_decision_date
FROM persons a JOIN best_interest_determinations b ON a.best_interest_determination_id = b.id;
```

| person_id | legal_name | date_of_birth | jurisdiction | determination_id | determination_determination_id | determination_decision_date |
|---|---|---|---|---|---|---|
| George Bernard Shaw | Jorge Sullivan | 2025-04-02 | regional-jurisdic-30 | 1000 | 611493 | 2023-10-27T21:27:00 |
| Maria Rodriguez | Walter Pratt | 2022-09-13 | legacy-jurisdic-31 | 1001 | ChIJe0zpU4Bt5kcRC2Er6yFuxzs | 2024-03-11T04:44:00 |
| Sarah Villanueva | Home Medix Oxygen | 2023-02-24 | compact-jurisdic-32 | 1002 | IVC4Iind | 2025-08-22T11:01:00 |
| Susan Wagner | Hector Garcia | 2024-07-08 | composite-jurisdic-33 | 1003 | 22028620 | 2022-01-06T18:18:00 |

The `person_best_interest_determination_view` joins `persons` with `best_interest_determinations` on the `person_id` column, producing a row that pairs each person with their determination records. `George Bernard Shaw` is linked to determination `1000` (with `determination_id` `611493`, chosen option `compact-chosen-62`, restrictiveness level `minimal`, status `draft`). `Maria Rodriguez` is linked to determination `1001` (with `determination_id` `ChIJe0zpU4Bt5kcRC2Er6yFuxzs`, chosen option `composite-chosen-63`, restrictiveness level `moderate`, status `finalized`). This view answers: "What best-interest determinations have been made for each person, and what are their outcomes and statuses?"

**View `decision_topic_decision_assessment_detail_view`**

```sql
CREATE VIEW decision_topic_decision_assessment_detail_view AS
SELECT a.topic_id, a.category_code, a.urgency_level, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM decision_topics a
  JOIN topics_assessments j ON j.topic_id = a.topic_id
  JOIN decision_assessments b ON b.id = j.decision_assessment_id;
```

| topic_id | category_code | urgency_level | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|
| lu_tax_code_template_b_VB-IC-Tab | medical | 36 | 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| lu_tax_code_template_b_VB-IC-Tab | medical | 36 | 2 | 19508914 | 2023-10-21T11:41:00 |
| 8387534 | financial | 42 | 2 | 19508914 | 2023-10-21T11:41:00 |
| 8387534 | financial | 42 | 3 | 506000 | 2024-03-05T18:58:00 |
| 2933463 | residential | 48 | 3 | 506000 | 2024-03-05T18:58:00 |
| 2933463 | residential | 48 | 4 | 1204-0009-M | 2025-08-16T01:15:00 |
| 2839516 | legal | 54 | 4 | 1204-0009-M | 2025-08-16T01:15:00 |
| 2839516 | legal | 54 | 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |

The `decision_topic_decision_assessment_detail_view` joins `decision_topics` with `decision_assessments` on the `topic_id` column, producing a row that lists each topic alongside all assessments in which it was evaluated. Topic `lu_tax_code_template_b_VB-IC-Tab` (a `medical` topic described as `Extended Survey`) is linked to assessment `1`. Topic `8387534` (a `financial` topic described as `Pilot Corridor A`) is linked to assessment `2`. This view answers: "Which assessments have addressed each decision topic?"

**View `decision_topic_best_interest_determination_view`**

```sql
CREATE VIEW decision_topic_best_interest_determination_view AS
SELECT a.topic_id, a.category_code, a.urgency_level, a.description, b.id AS determination_id, b.determination_id AS determination_determination_id, b.decision_date AS determination_decision_date
FROM decision_topics a JOIN best_interest_determinations b ON a.best_interest_determination_id = b.id;
```

| topic_id | category_code | urgency_level | description | determination_id | determination_determination_id | determination_decision_date |
|---|---|---|---|---|---|---|
| lu_tax_code_template_b_VB-IC-Tab | medical | 36 | Extended Survey | 1000 | 611493 | 2023-10-27T21:27:00 |
| 8387534 | financial | 42 | Pilot Corridor A | 1001 | ChIJe0zpU4Bt5kcRC2Er6yFuxzs | 2024-03-11T04:44:00 |
| 2933463 | residential | 48 | Baseline Series | 1002 | IVC4Iind | 2025-08-22T11:01:00 |
| 2839516 | legal | 54 | Distributed Assessment | 1003 | 22028620 | 2022-01-06T18:18:00 |

The `decision_topic_best_interest_determination_view` joins `decision_topics` with `best_interest_determinations` on the `topic_id` column, producing a row that pairs each topic with the determinations in which it was considered. Topic `lu_tax_code_template_b_VB-IC-Tab` is linked to determination `1000` (chosen option `compact-chosen-62`, status `draft`). Topic `8387534` is linked to determination `1001` (chosen option `composite-chosen-63`, status `finalized`). This view answers: "In which determinations was each decision topic evaluated, and what were the outcomes?"

**View `best_interest_determination_person_view`**

```sql
CREATE VIEW best_interest_determination_person_view AS
SELECT a.id, a.determination_id, a.decision_date, a.chosen_option, b.person_id AS person_person_id, b.legal_name AS person_legal_name, b.date_of_birth AS person_date_of_birth
FROM best_interest_determinations a JOIN persons b ON a.person_id = b.person_id;
```

| id | determination_id | decision_date | chosen_option | person_person_id | person_legal_name | person_date_of_birth |
|---|---|---|---|---|---|---|
| 1000 | 611493 | 2023-10-27T21:27:00 | compact-chosen-62 | George Bernard Shaw | Jorge Sullivan | 2025-04-02 |
| 1001 | ChIJe0zpU4Bt5kcRC2Er6yFuxzs | 2024-03-11T04:44:00 | composite-chosen-63 | Maria Rodriguez | Walter Pratt | 2022-09-13 |
| 1002 | IVC4Iind | 2025-08-22T11:01:00 | primary-chosen-64 | Sarah Villanueva | Home Medix Oxygen | 2023-02-24 |
| 1003 | 22028620 | 2022-01-06T18:18:00 | adaptive-chosen-65 | Susan Wagner | Hector Garcia | 2024-07-08 |

The `best_interest_determination_person_view` joins `best_interest_determinations` with `persons` on the `person_id` column, producing a row that pairs each determination with the legal name, date of birth, jurisdiction, and vulnerable status of the person it concerns. Determination `1000` is linked to `George Bernard Shaw` (DOB `2025-04-02`, jurisdiction `regional-jurisdic-30`, vulnerable `false`). Determination `1001` is linked to `Maria Rodriguez` (DOB `2022-09-13`, jurisdiction `legacy-jurisdic-31`, vulnerable `true`). This view answers: "For each determination, who is the person concerned and what are their demographic characteristics?"

**View `best_interest_determination_decision_topic_view`**

```sql
CREATE VIEW best_interest_determination_decision_topic_view AS
SELECT a.id, a.determination_id, a.decision_date, a.chosen_option, b.topic_id AS topic_topic_id, b.category_code AS topic_category_code, b.urgency_level AS topic_urgency_level
FROM best_interest_determinations a JOIN decision_topics b ON a.topic_id = b.topic_id;
```

| id | determination_id | decision_date | chosen_option | topic_topic_id | topic_category_code | topic_urgency_level |
|---|---|---|---|---|---|---|
| 1000 | 611493 | 2023-10-27T21:27:00 | compact-chosen-62 | lu_tax_code_template_b_VB-IC-Tab | medical | 36 |
| 1001 | ChIJe0zpU4Bt5kcRC2Er6yFuxzs | 2024-03-11T04:44:00 | composite-chosen-63 | 8387534 | financial | 42 |
| 1002 | IVC4Iind | 2025-08-22T11:01:00 | primary-chosen-64 | 2933463 | residential | 48 |
| 1003 | 22028620 | 2022-01-06T18:18:00 | adaptive-chosen-65 | 2839516 | legal | 54 |

The `best_interest_determination_decision_topic_view` joins `best_interest_determinations` with `decision_topics` on the `topic_id` column, producing a row that pairs each determination with the category code, urgency level, and description of the topic it addressed. Determination `1000` is linked to topic `lu_tax_code_template_b_VB-IC-Tab` (`medical`, urgency `36`, `Extended Survey`). Determination `1001` is linked to topic `8387534` (`financial`, urgency `42`, `Pilot Corridor A`). This view answers: "Which decision topics were evaluated in each determination, and what are their properties?"

**View `best_interest_determination_decision_assessment_view`**

```sql
CREATE VIEW best_interest_determination_decision_assessment_view AS
SELECT a.id, a.determination_id, a.decision_date, a.chosen_option, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM best_interest_determinations a JOIN decision_assessments b ON a.decision_assessment_id = b.id;
```

| id | determination_id | decision_date | chosen_option | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 1000 | 611493 | 2023-10-27T21:27:00 | compact-chosen-62 | 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 1001 | ChIJe0zpU4Bt5kcRC2Er6yFuxzs | 2024-03-11T04:44:00 | composite-chosen-63 | 2 | 19508914 | 2023-10-21T11:41:00 |
| 1002 | IVC4Iind | 2025-08-22T11:01:00 | primary-chosen-64 | 3 | 506000 | 2024-03-05T18:58:00 |
| 1003 | 22028620 | 2022-01-06T18:18:00 | adaptive-chosen-65 | 4 | 1204-0009-M | 2025-08-16T01:15:00 |

The `best_interest_determination_decision_assessment_view` joins `best_interest_determinations` with `decision_assessments` on the `decision_assessment_id` column, producing a row that pairs each determination with the assessment event that produced it. Determination `1000` is linked to assessment `1` (assessment date `2022-05-10T04:24:00`, capacity status `capable`, support `none`). Determination `1001` is linked to assessment `2` (assessment date `2023-10-21T11:41:00`, capacity status `incapable`, support `informational`). This view answers: "Which assessment event led to each determination, and what were the assessment conditions?"

**View `best_interest_determination_professional_view`**

```sql
CREATE VIEW best_interest_determination_professional_view AS
SELECT a.id, a.determination_id, a.decision_date, a.chosen_option, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM best_interest_determinations a JOIN professionals b ON a.professional_id = b.id;
```

| id | determination_id | decision_date | chosen_option | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 1000 | 611493 | 2023-10-27T21:27:00 | compact-chosen-62 | 100 | 5082965 | Theodore Mcgrath |
| 1001 | ChIJe0zpU4Bt5kcRC2Er6yFuxzs | 2024-03-11T04:44:00 | composite-chosen-63 | 101 | 2618560 | Account Name |
| 1002 | IVC4Iind | 2025-08-22T11:01:00 | primary-chosen-64 | 102 | 3355767 | Saipan International Airport |
| 1003 | 22028620 | 2022-01-06T18:18:00 | adaptive-chosen-65 | 103 | 3355784 | Norma Fisher |

The `best_interest_determination_professional_view` joins `best_interest_determinations` with `professionals` on the `professional_id` column, producing a row that pairs each determination with the full name, license number, role type, and jurisdiction of the professional who authored it. Determination `1000` is linked to professional `100` (`Theodore Mcgrath`, `clinician`, `LIC-2589`). Determination `1001` is linked to professional `101` (`Account Name`, `social_worker`, `LIC-2596`). This view answers: "Which professional is responsible for each determination, and what are their credentials?"

**View `professional_decision_assessment_detail_view`**

```sql
CREATE VIEW professional_decision_assessment_detail_view AS
SELECT a.id, a.professional_id, a.full_name, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM professionals a
  JOIN professionals_assessments j ON j.professional_id = a.id
  JOIN decision_assessments b ON b.id = j.decision_assessment_id;
```

| id | professional_id | full_name | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|
| 100 | 5082965 | Theodore Mcgrath | 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 100 | 5082965 | Theodore Mcgrath | 2 | 19508914 | 2023-10-21T11:41:00 |
| 101 | 2618560 | Account Name | 2 | 19508914 | 2023-10-21T11:41:00 |
| 101 | 2618560 | Account Name | 3 | 506000 | 2024-03-05T18:58:00 |
| 102 | 3355767 | Saipan International Airport | 3 | 506000 | 2024-03-05T18:58:00 |
| 102 | 3355767 | Saipan International Airport | 4 | 1204-0009-M | 2025-08-16T01:15:00 |
| 103 | 3355784 | Norma Fisher | 4 | 1204-0009-M | 2025-08-16T01:15:00 |
| 103 | 3355784 | Norma Fisher | 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |

The `professional_decision_assessment_detail_view` joins `professionals` with `decision_assessments` on the `professional_id` column, producing a row that lists each professional alongside all assessments they are associated with. Professional `100` (`Theodore Mcgrath`, `clinician`) is linked to assessment `1` (assessment date `2022-05-10T04:24:00`, capacity status `capable`). Professional `101` (`Account Name`, `social_worker`) is linked to assessment `2` (assessment date `2023-10-21T11:41:00`, capacity status `incapable`). This view answers: "What is the complete assessment portfolio for each professional?"

**View `professional_best_interest_determination_detail_view`**

```sql
CREATE VIEW professional_best_interest_determination_detail_view AS
SELECT a.id, a.professional_id, a.full_name, b.id AS determination_id, b.determination_id AS determination_determination_id, b.decision_date AS determination_decision_date
FROM professionals a
  JOIN professionals_determinations j ON j.professional_id = a.id
  JOIN best_interest_determinations b ON b.id = j.best_interest_determination_id;
```

| id | professional_id | full_name | determination_id | determination_determination_id | determination_decision_date |
|---|---|---|---|---|---|
| 100 | 5082965 | Theodore Mcgrath | 1000 | 611493 | 2023-10-27T21:27:00 |
| 100 | 5082965 | Theodore Mcgrath | 1001 | ChIJe0zpU4Bt5kcRC2Er6yFuxzs | 2024-03-11T04:44:00 |
| 101 | 2618560 | Account Name | 1001 | ChIJe0zpU4Bt5kcRC2Er6yFuxzs | 2024-03-11T04:44:00 |
| 101 | 2618560 | Account Name | 1002 | IVC4Iind | 2025-08-22T11:01:00 |
| 102 | 3355767 | Saipan International Airport | 1002 | IVC4Iind | 2025-08-22T11:01:00 |
| 102 | 3355767 | Saipan International Airport | 1003 | 22028620 | 2022-01-06T18:18:00 |
| 103 | 3355784 | Norma Fisher | 1003 | 22028620 | 2022-01-06T18:18:00 |
| 103 | 3355784 | Norma Fisher | 1000 | 611493 | 2023-10-27T21:27:00 |

The `professional_best_interest_determination_detail_view` joins `professionals` with `best_interest_determinations` on the `professional_id` column, producing a row that lists each professional alongside all determinations they have authored. Professional `100` (`Theodore Mcgrath`, `clinician`) is linked to determination `1000` (chosen option `compact-chosen-62`, restrictiveness level `minimal`, status `draft`). Professional `101` (`Account Name`, `social_worker`) is linked to determination `1001` (chosen option `composite-chosen-63`, restrictiveness level `moderate`, status `finalized`). This view answers: "What is the complete determination portfolio for each professional?"

The relational schema presented here materializes the decision-assessment ontology through a disciplined decomposition into base tables, junction tables, and denormalized views. The base tables — `decision_assessments`, `persons`, `decision_topics`, `best_interest_determinations`, and `professionals` — capture the core entity types and their attributes, with foreign keys encoding the referential relationships. The junction tables — `persons_assessments`, `topics_assessments`, `professionals_assessments`, and `professionals_determinations` — resolve the many-to-many relationships that arise when entities participate in multiple instances of other entity types. The views — of which there are twelve — reconstruct domain facts by joining the normalized tables back into projections that answer specific analytical questions. Each view is a lens through which the normalized data can be interpreted: the `decision_assessment_person_view` reveals the demographic context of assessments, the `person_best_interest_determination_view` traces determination outcomes back to individuals, and the `professional_best_interest_determination_detail_view` aggregates a professional's contribution across the determination lifecycle. Together, the tables and views form a coherent model that supports both transactional integrity and analytical querying, grounded in the conceptual structure of the decision-assessment domain.