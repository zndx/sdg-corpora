## Capacity Assessment and Best Interest Determination

The domain of capacity assessment and best interest determination governs how organizations evaluate an individual's ability to make decisions and, when necessary, establish formal determinations that protect their welfare. At the core of this domain are structured records that link persons under assessment with the professionals who evaluate them, the topics on which decisions are made, and the outcomes that result. Each assessment captures a point-in-time judgment about whether a person can exercise autonomy, what level of support they require, and which decision category is at stake. These records do not exist in isolation; they form a network of relationships that trace how a person moves through the assessment lifecycle, how professionals engage with specific topics, and how best interest determinations crystallize from the evidence gathered.

**Table `decision_assessments`**

| id | assessment_id | assessment_date | decision_topic | assessor_id | capacity_status | support_provided | person_id | topic_id | professional_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | pilot-decision-20 | 5f901eb6-8fcd-11eb-924d-9cd76263cbd0 | capable | none | George Bernard Shaw | lu_tax_code_template_b_VB-IC-Tab | 100 |
| 2 | 19508914 | 2023-10-21T11:41:00 | extended-decision-21 | 4060646 | incapable | informational | Maria Rodriguez | 8387534 | 101 |
| 3 | 506000 | 2024-03-05T18:58:00 | integrated-decision-22 | eff24a44-8fcb-11eb-924d-9cd76263cbd0 | uncertain | communication_aid | Sarah Villanueva | 2933463 | 102 |
| 4 | 1204-0009-M | 2025-08-16T01:15:00 | seasonal-decision-23 | 2933475 | capable | advocacy | Susan Wagner | 2839516 | 103 |

A decision assessment is the primary unit of evaluation. Each row records an assessment identifier, the date it was conducted, the decision topic under review, the capacity status assigned by the assessor, the type of support provided, and the foreign keys linking the assessment to the person, the topic, and the professional. Consider the first assessment in the dataset: the record with identifier `template_ivacode_pagata_20det40ind` was completed on 2022-05-10 for George Bernard Shaw regarding the topic `pilot-decision-20`. The assessor determined that Shaw was `capable` and that no support was required. By contrast, the second assessment, recorded under identifier `19508914` on 2023-10-21, concerns Maria Rodriguez and the topic `extended-decision-21`. Here the capacity status is `incapable`, and the support provided is classified as `informational`. The third assessment, `506000`, covers Sarah Villanueva on 2024-03-05 with a capacity status of `uncertain` and support delivered via `communication_aid`. The fourth, `1204-0009-M`, pertains to Susan Wagner on 2025-08-16, where the capacity status is `capable` and the support type is `advocacy`. These four assessments illustrate the spectrum of capacity statuses—`capable`, `incapable`, and `uncertain`—and the range of support modalities, from `none` to `informational`, `communication_aid`, and `advocacy`.

**Table `persons`**

| person_id | legal_name | date_of_birth | jurisdiction | vulnerable_status | best_interest_determination_id |
|---|---|---|---|---|---|
| George Bernard Shaw | Jorge Sullivan | 2025-04-02 | regional-jurisdic-30 | false | 1000 |
| Maria Rodriguez | Walter Pratt | 2022-09-13 | legacy-jurisdic-31 | true | 1001 |
| Sarah Villanueva | Home Medix Oxygen | 2023-02-24 | compact-jurisdic-32 | false | 1002 |
| Susan Wagner | Hector Garcia | 2024-07-08 | composite-jurisdic-33 | true | 1003 |

The persons table stores the identity and jurisdictional context of each individual under assessment. Four persons appear in the dataset: George Bernard Shaw, Maria Rodriguez, Sarah Villanueva, and Susan Wagner. Each record carries a legal name, a date of birth, a jurisdiction code, a flag indicating vulnerable status, and a reference to a best interest determination. Shaw's record shows a vulnerable status of `false` and is associated with determination `1000`. Rodriguez's record carries a vulnerable status of `true` and links to determination `1001`. Villanueva's record has a vulnerable status of `false` with determination `1002`, while Wagner's record shows a vulnerable status of `true` with determination `1003`. The jurisdiction codes—`regional-jurisdic-30`, `legacy-jurisdic-31`, `compact-jurisdic-32`, and `composite-jurisdic-33`—indicate the regulatory or geographic framework under which each person's assessment falls.

**Table `decision_topics`**

| topic_id | category_code | urgency_level | description | best_interest_determination_id | created_at | updated_at |
|---|---|---|---|---|---|---|
| lu_tax_code_template_b_VB-IC-Tab | medical | 36 | Extended Survey | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 8387534 | financial | 42 | Pilot Corridor A | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 2933463 | residential | 48 | Baseline Series | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 2839516 | legal | 54 | Distributed Assessment | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Decision topics define the categories and characteristics of the decisions being evaluated. Each topic carries a category code such as `medical`, `financial`, `residential`, or `legal`, an urgency level expressed as a numeric value, a descriptive label, and references to the best interest determination and the assessment that addresses it. The first topic, `lu_tax_code_template_b_VB-IC-Tab`, falls under the `medical` category with an urgency level of `36` and is described as "Extended Survey." The second topic, `8387534`, is classified as `financial` with urgency level `42` and labeled "Pilot Corridor A." The third, `2933463`, is `residential` with urgency level `48` and description "Baseline Series." The fourth, `2839516`, is `legal` with urgency level `54` and description "Distributed Assessment." The urgency levels increase across the four records, ranging from 36 to 54, suggesting a graduated scale where higher values correspond to greater urgency.

**Table `best_interest_determinations`**

| id | determination_id | decision_date | chosen_option | restrictiveness_level | justification_text | status | person_id | topic_id | decision_assessment_id | professional_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 611493 | 2023-10-27T21:27:00 | compact-chosen-62 | minimal | compact-justific-92 | draft | George Bernard Shaw | lu_tax_code_template_b_VB-IC-Tab | 1 | 100 |
| 1001 | ChIJe0zpU4Bt5kcRC2Er6yFuxzs | 2024-03-11T04:44:00 | composite-chosen-63 | moderate | composite-justific-93 | finalized | Maria Rodriguez | 8387534 | 2 | 101 |
| 1002 | IVC4Iind | 2025-08-22T11:01:00 | primary-chosen-64 | high | primary-justific-94 | reviewed | Sarah Villanueva | 2933463 | 3 | 102 |
| 1003 | 22028620 | 2022-01-06T18:18:00 | adaptive-chosen-65 | minimal | adaptive-justific-95 | draft | Susan Wagner | 2839516 | 4 | 103 |

Best interest determinations represent the formal outcomes of the assessment process. Each determination records a determination identifier, the date it was issued, the chosen option, the restrictiveness level, a justification text, and a status indicating its current state. The first determination, `1000`, was issued on 2023-10-27 with the chosen option `compact-chosen-62`, a restrictiveness level of `minimal`, and a justification of `compact-justific-92`. Its status is `draft`. The second determination, `1001`, was issued on 2024-03-11 with the chosen option `composite-chosen-63`, a restrictiveness level of `moderate`, and justification `composite-justific-93`. Its status is `finalized`. The third, `1002`, dates to 2025-08-22, selects `primary-chosen-64`, carries a restrictiveness level of `high`, and bears justification `primary-justific-94`; its status is `reviewed`. The fourth, `1003`, was issued on 2022-01-06 with the chosen option `adaptive-chosen-65`, a restrictiveness level of `minimal`, and justification `adaptive-justific-95`; its status is `draft`. The restrictiveness levels span `minimal`, `moderate`, and `high`, while the statuses cycle through `draft`, `finalized`, and `reviewed`.

**Table `professionals`**

| id | professional_id | full_name | license_number | role_type | jurisdiction |
|---|---|---|---|---|---|
| 100 | 5082965 | Theodore Mcgrath | LIC-2589 | clinician | regional-jurisdic-30 |
| 101 | 2618560 | Account Name | LIC-2596 | social_worker | legacy-jurisdic-31 |
| 102 | 3355767 | Saipan International Airport | LIC-2603 | guardian | compact-jurisdic-32 |
| 103 | 3355784 | Norma Fisher | LIC-2610 | advocate | composite-jurisdic-33 |

Professionals are the individuals or entities who conduct assessments and participate in determinations. The professionals table stores their identifiers, full names, license numbers, role types, and jurisdictions. Four professionals appear: Theodore Mcgrath (license `LIC-2589`, role `clinician`, jurisdiction `regional-jurisdic-30`), Account Name (license `LIC-2596`, role `social_worker`, jurisdiction `legacy-jurisdic-31`), Saipan International Airport (license `LIC-2603`, role `guardian`, jurisdiction `compact-jurisdic-32`), and Norma Fisher (license `LIC-2610`, role `advocate`, jurisdiction `composite-jurisdic-33`). The role types—`clinician`, `social_worker`, `guardian`, and `advocate`—reflect the diverse professional functions within the assessment and determination process.

The relational structure of the domain extends beyond these five core tables through a set of junction tables that capture many-to-many relationships. The persons-assessments table links persons to the assessments they have undergone. In the data, George Bernard Shaw appears in two assessments (IDs 1 and 2), Maria Rodriguez in two assessments (IDs 2 and 3), Sarah Villanueva in two assessments (IDs 3 and 4), and Susan Wagner in two assessments (IDs 4 and 1). This pattern indicates that each person has been subject to multiple assessments across different topics or time periods.

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

The topics-assessments and professionals-assessments tables serve analogous linking functions for decision topics and professionals, respectively. These junction tables ensure that a single assessment can be associated with multiple topics and multiple professionals, and conversely that a topic or professional can appear across multiple assessments.

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

The professionals-determinations table links professionals to the best interest determinations they have contributed to or overseen. This relationship ensures traceability from the determination back to the professional responsible.

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

The views in this domain synthesize the base tables into readable, joined results that answer specific operational questions. Each view combines data from multiple tables to present a unified record for analysis or reporting.

The decision assessment person view joins the decision assessments table with the persons table, answering the question: "Which person was assessed in each assessment, and what was the outcome?" The first row of this view shows George Bernard Shaw assessed under `template_ivacode_pagata_20det40ind` on 2022-05-10, with a capacity status of `capable` and no support provided. The second row shows Maria Rodriguez assessed under `19508914` on 2023-10-21, with a capacity status of `incapable` and `informational` support. This view makes it straightforward to audit which persons have been assessed and what their capacity statuses were.

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

The decision assessment decision topic view joins assessments with topics, answering: "What decision topic was evaluated in each assessment?" The first row pairs assessment `template_ivacode_pagata_20det40ind` with topic `lu_tax_code_template_b_VB-IC-Tab`, a medical-category topic with urgency level 36. The second row pairs assessment `19508914` with topic `8387534`, a financial-category topic with urgency level 42. This view supports analysis of how urgency levels correlate with capacity outcomes across different decision categories.

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

The decision assessment professional view joins assessments with professionals, answering: "Which professional conducted each assessment?" The first row shows Theodore Mcgrath, a clinician, associated with assessment `template_ivacode_pagata_20det40ind`. The second row shows Account Name, a social worker, associated with assessment `19508914`. The third row links Saipan International Airport, a guardian, to assessment `506000`. The fourth row links Norma Fisher, an advocate, to assessment `1204-0009-M`. This view enables accountability tracking by mapping each assessment to the professional who performed it.

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

The person decision assessment detail view provides a comprehensive record of all assessments conducted on a given person, combining person identity, assessment details, and topic information. For George Bernard Shaw, this view would show two assessments: the first under `template_ivacode_pagata_20det40ind` with capacity status `capable`, and the second under `19508914` with capacity status `incapable`. This longitudinal view is essential for tracking changes in a person's assessed capacity over time.

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

The person best interest determination view links persons to their corresponding best interest determinations, answering: "What determination has been made for each person?" The first row shows George Bernard Shaw linked to determination `1000`, with chosen option `compact-chosen-62`, restrictiveness level `minimal`, and status `draft`. The second row shows Maria Rodriguez linked to determination `1001`, with chosen option `composite-chosen-63`, restrictiveness level `moderate`, and status `finalized`. This view supports oversight by presenting each person alongside the formal determination that governs their case.

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

The decision topic decision assessment detail view joins topics with assessments, providing a topic-centric view of all assessments conducted under that topic. For the medical-category topic `lu_tax_code_template_b_VB-IC-Tab`, this view would show assessment `template_ivacode_pagata_20det40ind` with capacity status `capable`. For the financial-category topic `8387534`, it would show assessment `19508914` with capacity status `incapable`. This view is useful for analyzing how different decision categories yield different capacity outcomes.

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

The decision topic best interest determination view joins topics with determinations, answering: "Which best interest determination addresses each decision topic?" The first row links topic `lu_tax_code_template_b_VB-IC-Tab` to determination `1000`, with chosen option `compact-chosen-62` and restrictiveness level `minimal`. The second row links topic `8387534` to determination `1001`, with chosen option `composite-chosen-63` and restrictiveness level `moderate`. This view supports topic-level oversight by showing the determination outcome for each decision category.

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

The best interest determination person view joins determinations with persons, providing a determination-centric view of the individuals affected. The first row shows determination `1000` affecting George Bernard Shaw, with chosen option `compact-chosen-62` and status `draft`. The second row shows determination `1001` affecting Maria Rodriguez, with chosen option `composite-chosen-63` and status `finalized`. This view is particularly useful for auditors reviewing which persons are subject to determinations at various stages of completion.

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

The best interest determination decision topic view joins determinations with topics, answering: "What decision topic does each determination address?" The first row links determination `1000` to topic `lu_tax_code_template_b_VB-IC-Tab`, a medical-category topic with urgency level 36. The second row links determination `1001` to topic `8387534`, a financial-category topic with urgency level 42. This view supports analysis of how restrictiveness levels vary across decision categories.

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

The best interest determination decision assessment view joins determinations with assessments, answering: "Which assessment informed each determination?" The first row links determination `1000` to assessment `1`, with capacity status `capable` and support type `none`. The second row links determination `1001` to assessment `2`, with capacity status `incapable` and support type `informational`. This view is critical for tracing the evidentiary basis of each determination back to the underlying assessment.

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

The best interest determination professional view joins determinations with professionals, answering: "Which professional is associated with each determination?" The first row links determination `1000` to professional Theodore Mcgrath (clinician). The second row links determination `1001` to professional Account Name (social worker). The third row links determination `1002` to Saipan International Airport (guardian). The fourth row links determination `1003` to Norma Fisher (advocate). This view ensures that each determination can be traced to the professional responsible for its formulation.

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

The professional decision assessment detail view provides a professional-centric view of all assessments they have conducted. For Theodore Mcgrath, this view would show assessment `template_ivacode_pagata_20det40ind` for George Bernard Shaw, with capacity status `capable`. For Account Name, it would show assessment `19508914` for Maria Rodriguez, with capacity status `incapable`. This view supports workload analysis and quality review by grouping assessments by the professional who performed them.

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

The professional best interest determination detail view provides a professional-centric view of all determinations they have overseen. For Theodore Mcgrath, this view would show determination `1000` with chosen option `compact-chosen-62` and status `draft`. For Account Name, it would show determination `1001` with chosen option `composite-chosen-63` and status `finalized`. This view enables professional accountability by linking each determination to the professional who contributed to it.

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

The capacity assessment and best interest determination domain operates as an integrated system of records that connect persons, professionals, topics, assessments, and determinations into a coherent evidentiary chain. Each assessment captures a moment of judgment about a person's capacity in a specific decision context, supported by the professional who conducted it and the topic that defines the decision category. These assessments feed into best interest determinations, which formalize the chosen option, the restrictiveness level, and the justification for the outcome. The junction tables ensure that the many-to-many relationships between persons, topics, and professionals are accurately represented, while the views provide the joined perspectives needed for operational oversight, audit, and analysis. Together, these records form the backbone of a system designed to protect vulnerable individuals while maintaining transparency and accountability at every stage of the assessment and determination process.