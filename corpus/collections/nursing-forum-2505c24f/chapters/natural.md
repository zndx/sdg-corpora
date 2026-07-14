## The Architecture of Nursing Quality Improvement

Healthcare delivery in the United Kingdom rests on a network of organizations, professionals, and improvement initiatives that must be tracked, measured, and coordinated. At the centre of this ecosystem are nursing professionals, whose qualifications, roles, and affiliations determine how quality improvement work gets organized and executed. These professionals operate within health trusts—regional or national bodies rated by the Care Quality Commission—and participate in forums, workstreams, and educational programmes that shape clinical practice. The records below capture the full lifecycle of this domain: from the establishment of a nursing forum to the measurement of a clinical outcome, with every professional, institution, and trust linked through a web of relationships.

**Table `nursing_forums`**

| nursing_forum_id | forum_identifier | forum_name | established_date | status | jurisdiction | nursing_professional_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | FOR-2131 | Compact Model | 2024-03-27 | active | national | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | FOR-2132 | Legacy Cluster | 2025-08-11 | dissolved | regional | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | FOR-2133 | Regional Review A | 2022-01-22 | pending | local | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | FOR-2134 | Seasonal Initiative | 2023-06-06 | active | national | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Nursing forums serve as the primary organisational containers for improvement activity. Each forum carries a unique identifier—FOR-2131 through FOR-2134 in the current dataset—and a descriptive name such as Compact Model, Legacy Cluster, Regional Review A, or Seasonal Initiative. Forums are classified by jurisdiction, spanning national, regional, and local scopes, and by status, which may be active, dissolved, or pending. The Compact Model forum (FOR-2131), established on 2024-03-27, operates at the national level and holds active status, while the Legacy Cluster (FOR-2132), established later on 2025-08-11, has been dissolved at the regional level. These status transitions reflect the lifecycle of improvement initiatives: some persist, some conclude, and others await formal approval.

**Table `nursing_professionals`**

| id | professional_id | full_name | registration_number | primary_qualification | years_of_experience | current_role_title | has_fellowship | health_trust_id | nursing_forum_id | quality_workstream_id | educational_institution_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 5082965 | Theodore Mcgrath | REG-2136 | compact-primary-14 | 7 | Adaptive Cluster | true | 1 | 1000 | 1 | 1 |
| 2 | 2618560 | Account Name | REG-2142 | composite-primary-15 | 10 | Primary Review | false | 2 | 1001 | 2 | 2 |
| 3 | 3355767 | Saipan International Airport | REG-2148 | primary-primary-16 | 13 | Composite Initiative D | true | 3 | 1002 | 3 | 3 |
| 4 | 3355784 | Norma Fisher | REG-2154 | adaptive-primary-17 | 16 | Compact Model | false | 4 | 1003 | 4 | 4 |

Nursing professionals are the human agents through which quality improvement is enacted. Each professional record carries a registration number—REG-2136, REG-2142, REG-2148, REG-2154—and a primary qualification type, such as compact-primary-14 or composite-primary-15. The dataset includes professionals with varying levels of experience, from seven years for Theodore Mcgrath to sixteen years for Norma Fisher. Their current role titles—Adaptive Cluster, Primary Review, Composite Initiative D, Compact Model—mirror the naming conventions of the forums they participate in, suggesting a tight coupling between professional identity and organisational structure. The has_fellowship flag distinguishes fellows from non-fellows, with Theodore Mcgrath and Saipan International Airport holding fellowship status while Account Name and Norma Fisher do not.

**Table `quality_workstreams`**

| quality_workstream_id | workstream_id | workstream_title | start_date | target_metric | status | scope | nursing_forum_id | nursing_professional_id | clinical_outcome_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 10782179 | Primary Framework A | 2022-09-05T20:24:00 | integrated-target-82 | planning | infection_control | 1000 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 3001009030140 | Composite Protocol | 2023-02-16T03:41:00 | seasonal-target-83 | active | patient_dignity | 1001 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 8928521 | Compact Programme | 2024-07-27T10:58:00 | regional-target-84 | completed | leadership | 1002 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 6440 | Legacy Standard D | 2025-12-11T17:15:00 | legacy-target-85 | suspended | staff_engagement | 1003 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Quality workstreams represent the operational units of improvement, each defined by a title, a start date, a target metric, and a scope area. The Primary Framework A (workstream ID 10782179) began on 2022-09-05 with an integrated-target-82 metric and focuses on infection control. The Composite Protocol (3001009030140), launched in early 2023, targets patient dignity under a seasonal-target-83 metric and holds active status. The Compact Programme (8928521) completed its work on leadership development with a regional-target-84 metric, while the Legacy Standard D (6440) was suspended mid-cycle, focusing on staff engagement under a legacy-target-85 metric. Workstream statuses—planning, active, completed, suspended—provide a real-time snapshot of improvement activity across the system.

**Table `health_trusts`**

| health_trust_id | trust_id | trust_name | trust_type | region | cqc_rating | established_year | clinical_outcome_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Compact Framework | Foundation_Trust | distributed-region-12 | outstanding | 10 | 1000 | 2025-01-01 00:14:00 |
| 2 | 8387551 | Legacy Protocol | Specialist_Trust | baseline-region-13 | good | 16 | 1001 | 2025-02-06 03:14:00 |
| 3 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Regional Programme A | Acute_Trust | pilot-region-14 | requires_improvement | 22 | 1002 | 2025-03-11 06:14:00 |
| 4 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Standard | Foundation_Trust | extended-region-15 | inadequate | 28 | 1003 | 2025-04-16 09:14:00 |

Health trusts are the institutional anchors of the nursing ecosystem. The Compact Framework (trust ID 5f923cfa-8fcd-11eb-924d-9cd76263cbd0) is a Foundation_Trust operating in a distributed-region-12 area, rated outstanding by the CQC and established ten years ago. The Legacy Protocol (8387551), a Specialist_Trust in baseline-region-13, holds a good rating and was established sixteen years ago. The Regional Programme A (ChIJAaQOcwdu5kcRArYphCv0bl0), an Acute_Trust in pilot-region-14, carries a requires_improvement rating and has been in operation for twenty-two years. The Seasonal Standard (27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3), a Foundation_Trust in extended-region-15, holds an inadequate rating and was established twenty-eight years ago. Trust types and CQC ratings together define the institutional quality landscape.

**Table `clinical_outcomes`**

| clinical_outcome_id | outcome_id | outcome_type | measurement_value | unit_of_measure | measurement_date | trend | data_source | health_trust_id | quality_workstream_id | nursing_professional_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2618555 | infection_rate | 14.45 | percent | 2024-07-01 | improving | pilot-data-38 | 1 | 1 | 1 |
| 1001 | lu_tax_code_template_m46 | patient_satisfaction | 17.90 | count | 2025-12-12 | declining | extended-data-39 | 2 | 2 | 2 |
| 1002 | 168561 | mortality_rate | 21.35 | score | 2022-05-23 | stable | integrated-data-40 | 3 | 3 | 3 |
| 1003 | 1210-0007-M | quality_rating | 24.80 | percent | 2023-10-07 | improving | seasonal-data-41 | 4 | 4 | 4 |

Clinical outcomes capture the measurable results of healthcare delivery. The outcome with ID 2618555 tracks infection_rate at 14.45 percent, measured on 2024-07-01, with an improving trend and pilot-data-38 as its source. The outcome lu_tax_code_template_m46 records patient_satisfaction at 17.90 count, measured on 2025-12-12, showing a declining trend from extended-data-39. The outcome 168561 measures mortality_rate at 21.35 score, recorded on 2022-05-23 with a stable trend from integrated-data-40. The outcome 1210-0007-M captures quality_rating at 24.80 percent, measured on 2023-10-07, trending improving from seasonal-data-41. These outcomes, each tied to a specific health trust, workstream, and nursing professional, form the evidence base for quality assessment.

**Table `educational_institutions`**

| id | institution_id | institution_name | institution_type | location | accreditation_body |
|---|---|---|---|---|---|
| 1 | 9424913 | Extended Corridor | university | extended-location-99 | integrated-accredit-88 |
| 2 | 8189481 | Pilot Series A | hospital_school | integrated-location-100 | seasonal-accredit-89 |
| 3 | 1437604 | Baseline Assessment | training_academy | seasonal-location-101 | regional-accredit-90 |
| 4 | 884346 | Distributed Survey | university | regional-location-102 | legacy-accredit-91 |

Educational institutions provide the training infrastructure for nursing professionals. Extended Corridor (institution ID 9424913) is a university located in extended-location-99, accredited by integrated-accredit-88. Pilot Series A (8189481) operates as a hospital_school in integrated-location-100 under seasonal-accredit-89. Baseline Assessment (1437604) is a training_academy in seasonal-location-101, accredited by regional-accredit-90. Distributed Survey (884346) is another university, situated in regional-location-102 and accredited by legacy-accredit-91. The diversity of institution types—universities, hospital schools, training academies—reflects the varied pathways through which nursing professionals acquire their qualifications.

**Table `forums_professionals`**

| nursing_forum_id | nursing_professional_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The forums_professionals table establishes the direct participation links between nursing forums and individual professionals. A professional may belong to one or more forums, and a forum may encompass multiple professionals. This many-to-many relationship ensures that improvement initiatives are staffed by the right mix of experience and qualification. The presence of this junction table indicates that forum membership is not fixed at registration but can evolve as professionals move between initiatives.

**Table `forums_workstreams`**

| nursing_forum_id | quality_workstream_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The forums_workstreams table connects forums to quality workstreams, indicating which improvement initiatives are coordinated under which forum umbrella. A workstream may be managed by a single forum or span multiple forums, and a forum may oversee several workstreams simultaneously. This linkage ensures that strategic forum objectives are translated into operational workstream activities.

**Table `trusts_professionals`**

| health_trust_id | nursing_professional_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The trusts_professionals table links health trusts to the nursing professionals employed or affiliated with them. A trust may employ multiple professionals, and a professional may have affiliations spanning multiple trusts. This relationship is fundamental to understanding workforce distribution and accountability within the healthcare system.

**Table `institutions_professionals`**

| educational_institution_id | nursing_professional_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The institutions_professionals table records the educational affiliations of nursing professionals. A professional may have trained at one or more institutions, and an institution may have produced graduates who now practice across multiple trusts. This relationship connects educational history to current professional practice.

**View `nursing_forum_nursing_professional_detail_view`**

```sql
CREATE VIEW nursing_forum_nursing_professional_detail_view AS
SELECT a.nursing_forum_id, a.forum_identifier, a.forum_name, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM nursing_forums a
  JOIN forums_professionals j ON j.nursing_forum_id = a.nursing_forum_id
  JOIN nursing_professionals b ON b.id = j.nursing_professional_id;
```

| nursing_forum_id | forum_identifier | forum_name | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|
| 1000 | FOR-2131 | Compact Model | 1 | 5082965 | Theodore Mcgrath |
| 1000 | FOR-2131 | Compact Model | 2 | 2618560 | Account Name |
| 1001 | FOR-2132 | Legacy Cluster | 2 | 2618560 | Account Name |
| 1001 | FOR-2132 | Legacy Cluster | 3 | 3355767 | Saipan International Airport |
| 1002 | FOR-2133 | Regional Review A | 3 | 3355767 | Saipan International Airport |
| 1002 | FOR-2133 | Regional Review A | 4 | 3355784 | Norma Fisher |
| 1003 | FOR-2134 | Seasonal Initiative | 4 | 3355784 | Norma Fisher |
| 1003 | FOR-2134 | Seasonal Initiative | 1 | 5082965 | Theodore Mcgrath |

This view joins nursing forums with their associated professionals, answering the question: which professionals are active within each forum, and what are their qualifications? The Compact Model forum (FOR-2131) is linked to Theodore Mcgrath, a fellow with seven years of experience holding the compact-primary-14 qualification and serving in the Adaptive Cluster role. The Legacy Cluster forum (FOR-2132) is associated with Account Name, who has ten years of experience, holds the composite-primary-15 qualification, and serves in the Primary Review role without fellowship status. This view enables administrators to assess the experience and qualification mix within each forum.

**View `nursing_forum_nursing_professional_view`**

```sql
CREATE VIEW nursing_forum_nursing_professional_view AS
SELECT a.nursing_forum_id, a.forum_identifier, a.forum_name, a.established_date, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM nursing_forums a JOIN nursing_professionals b ON a.nursing_professional_id = b.id;
```

| nursing_forum_id | forum_identifier | forum_name | established_date | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 1000 | FOR-2131 | Compact Model | 2024-03-27 | 1 | 5082965 | Theodore Mcgrath |
| 1001 | FOR-2132 | Legacy Cluster | 2025-08-11 | 2 | 2618560 | Account Name |
| 1002 | FOR-2133 | Regional Review A | 2022-01-22 | 3 | 3355767 | Saipan International Airport |
| 1003 | FOR-2134 | Seasonal Initiative | 2023-06-06 | 4 | 3355784 | Norma Fisher |

A streamlined version of the forum-professional relationship, this view presents the core identifiers and names without the full professional detail. It is useful for quick reference when listing forum membership or generating roster reports. The Compact Model forum maps to Theodore Mcgrath, the Legacy Cluster to Account Name, Regional Review A to Saipan International Airport, and Seasonal Initiative to Norma Fisher.

**View `nursing_forum_quality_workstream_detail_view`**

```sql
CREATE VIEW nursing_forum_quality_workstream_detail_view AS
SELECT a.nursing_forum_id, a.forum_identifier, a.forum_name, b.quality_workstream_id AS workstream_quality_workstream_id, b.workstream_id AS workstream_workstream_id, b.workstream_title AS workstream_workstream_title
FROM nursing_forums a
  JOIN forums_workstreams j ON j.nursing_forum_id = a.nursing_forum_id
  JOIN quality_workstreams b ON b.quality_workstream_id = j.quality_workstream_id;
```

| nursing_forum_id | forum_identifier | forum_name | workstream_quality_workstream_id | workstream_workstream_id | workstream_workstream_title |
|---|---|---|---|---|---|
| 1000 | FOR-2131 | Compact Model | 1 | 10782179 | Primary Framework A |
| 1000 | FOR-2131 | Compact Model | 2 | 3001009030140 | Composite Protocol |
| 1001 | FOR-2132 | Legacy Cluster | 2 | 3001009030140 | Composite Protocol |
| 1001 | FOR-2132 | Legacy Cluster | 3 | 8928521 | Compact Programme |
| 1002 | FOR-2133 | Regional Review A | 3 | 8928521 | Compact Programme |
| 1002 | FOR-2133 | Regional Review A | 4 | 6440 | Legacy Standard D |
| 1003 | FOR-2134 | Seasonal Initiative | 4 | 6440 | Legacy Standard D |
| 1003 | FOR-2134 | Seasonal Initiative | 1 | 10782179 | Primary Framework A |

This view connects nursing forums to their quality workstreams, revealing which improvement initiatives fall under each forum's purview. The Compact Model forum (FOR-2131) oversees the Primary Framework A workstream, which targets infection control with an integrated-target-82 metric and is currently in the planning phase. The Legacy Cluster forum (FOR-2132) manages the Composite Protocol workstream, focused on patient dignity with a seasonal-target-83 metric and active status. This view supports strategic oversight by showing the alignment between forum jurisdiction and workstream scope.

**View `nursing_professional_health_trust_view`**

```sql
CREATE VIEW nursing_professional_health_trust_view AS
SELECT a.id, a.professional_id, a.full_name, a.registration_number, b.health_trust_id AS trust_health_trust_id, b.trust_id AS trust_trust_id, b.trust_name AS trust_trust_name
FROM nursing_professionals a JOIN health_trusts b ON a.health_trust_id = b.health_trust_id;
```

| id | professional_id | full_name | registration_number | trust_health_trust_id | trust_trust_id | trust_trust_name |
|---|---|---|---|---|---|---|
| 1 | 5082965 | Theodore Mcgrath | REG-2136 | 1 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Compact Framework |
| 2 | 2618560 | Account Name | REG-2142 | 2 | 8387551 | Legacy Protocol |
| 3 | 3355767 | Saipan International Airport | REG-2148 | 3 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Regional Programme A |
| 4 | 3355784 | Norma Fisher | REG-2154 | 4 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Standard |

This view maps nursing professionals to their affiliated health trusts, answering the question: which trust does each professional belong to, and what is that trust's quality rating? Theodore Mcgrath is affiliated with the Compact Framework trust, a Foundation_Trust rated outstanding. Account Name belongs to the Legacy Protocol trust, a Specialist_Trust rated good. Saipan International Airport is with the Regional Programme A trust, an Acute_Trust rated requires_improvement. Norma Fisher is affiliated with the Seasonal Standard trust, a Foundation_Trust rated inadequate. This view is essential for understanding the institutional context in which professionals practice.

**View `nursing_professional_nursing_forum_view`**

```sql
CREATE VIEW nursing_professional_nursing_forum_view AS
SELECT a.id, a.professional_id, a.full_name, a.registration_number, b.nursing_forum_id AS forum_nursing_forum_id, b.forum_identifier AS forum_forum_identifier, b.forum_name AS forum_forum_name
FROM nursing_professionals a JOIN nursing_forums b ON a.nursing_forum_id = b.nursing_forum_id;
```

| id | professional_id | full_name | registration_number | forum_nursing_forum_id | forum_forum_identifier | forum_forum_name |
|---|---|---|---|---|---|---|
| 1 | 5082965 | Theodore Mcgrath | REG-2136 | 1000 | FOR-2131 | Compact Model |
| 2 | 2618560 | Account Name | REG-2142 | 1001 | FOR-2132 | Legacy Cluster |
| 3 | 3355767 | Saipan International Airport | REG-2148 | 1002 | FOR-2133 | Regional Review A |
| 4 | 3355784 | Norma Fisher | REG-2154 | 1003 | FOR-2134 | Seasonal Initiative |

This view presents the forum affiliation of each nursing professional, providing a clear mapping from individual to organisational container. Theodore Mcgrath participates in the Compact Model forum (FOR-2131), Account Name in the Legacy Cluster (FOR-2132), Saipan International Airport in Regional Review A (FOR-2133), and Norma Fisher in the Seasonal Initiative (FOR-2134). Each professional is linked to exactly one forum in the current dataset, though the underlying junction table supports multiple affiliations.

**View `nursing_professional_quality_workstream_view`**

```sql
CREATE VIEW nursing_professional_quality_workstream_view AS
SELECT a.id, a.professional_id, a.full_name, a.registration_number, b.quality_workstream_id AS workstream_quality_workstream_id, b.workstream_id AS workstream_workstream_id, b.workstream_title AS workstream_workstream_title
FROM nursing_professionals a JOIN quality_workstreams b ON a.quality_workstream_id = b.quality_workstream_id;
```

| id | professional_id | full_name | registration_number | workstream_quality_workstream_id | workstream_workstream_id | workstream_workstream_title |
|---|---|---|---|---|---|---|
| 1 | 5082965 | Theodore Mcgrath | REG-2136 | 1 | 10782179 | Primary Framework A |
| 2 | 2618560 | Account Name | REG-2142 | 2 | 3001009030140 | Composite Protocol |
| 3 | 3355767 | Saipan International Airport | REG-2148 | 3 | 8928521 | Compact Programme |
| 4 | 3355784 | Norma Fisher | REG-2154 | 4 | 6440 | Legacy Standard D |

This view links nursing professionals to the quality workstreams they are associated with, answering the question: which improvement initiative is each professional driving? Theodore Mcgrath is associated with the Primary Framework A workstream, focused on infection control. Account Name is linked to the Composite Protocol, targeting patient dignity. Saipan International Airport participates in the Compact Programme, which addresses leadership development. Norma Fisher is connected to the Legacy Standard D workstream, focusing on staff engagement. This view supports workload and responsibility tracking across the improvement portfolio.

**View `nursing_professional_educational_institution_view`**

```sql
CREATE VIEW nursing_professional_educational_institution_view AS
SELECT a.id, a.professional_id, a.full_name, a.registration_number, b.id AS institution_id, b.institution_id AS institution_institution_id, b.institution_name AS institution_institution_name
FROM nursing_professionals a JOIN educational_institutions b ON a.educational_institution_id = b.id;
```

| id | professional_id | full_name | registration_number | institution_id | institution_institution_id | institution_institution_name |
|---|---|---|---|---|---|---|
| 1 | 5082965 | Theodore Mcgrath | REG-2136 | 1 | 9424913 | Extended Corridor |
| 2 | 2618560 | Account Name | REG-2142 | 2 | 8189481 | Pilot Series A |
| 3 | 3355767 | Saipan International Airport | REG-2148 | 3 | 1437604 | Baseline Assessment |
| 4 | 3355784 | Norma Fisher | REG-2154 | 4 | 884346 | Distributed Survey |

This view connects nursing professionals to their educational institutions, revealing the training background of each practitioner. Theodore Mcgrath trained at Extended Corridor, a university in extended-location-99. Account Name was educated at Pilot Series A, a hospital_school in integrated-location-100. Saipan International Airport graduated from Baseline Assessment, a training_academy in seasonal-location-101. Norma Fisher attended Distributed Survey, a university in regional-location-102. This view is valuable for auditing educational pathways and ensuring alignment between training and current practice requirements.

**View `quality_workstream_nursing_forum_view`**

```sql
CREATE VIEW quality_workstream_nursing_forum_view AS
SELECT a.quality_workstream_id, a.workstream_id, a.workstream_title, a.start_date, b.nursing_forum_id AS forum_nursing_forum_id, b.forum_identifier AS forum_forum_identifier, b.forum_name AS forum_forum_name
FROM quality_workstreams a JOIN nursing_forums b ON a.nursing_forum_id = b.nursing_forum_id;
```

| quality_workstream_id | workstream_id | workstream_title | start_date | forum_nursing_forum_id | forum_forum_identifier | forum_forum_name |
|---|---|---|---|---|---|---|
| 1 | 10782179 | Primary Framework A | 2022-09-05T20:24:00 | 1000 | FOR-2131 | Compact Model |
| 2 | 3001009030140 | Composite Protocol | 2023-02-16T03:41:00 | 1001 | FOR-2132 | Legacy Cluster |
| 3 | 8928521 | Compact Programme | 2024-07-27T10:58:00 | 1002 | FOR-2133 | Regional Review A |
| 4 | 6440 | Legacy Standard D | 2025-12-11T17:15:00 | 1003 | FOR-2134 | Seasonal Initiative |

This view presents the reverse mapping from quality workstreams to their parent forums, answering the question: which forum governs each workstream? The Primary Framework A workstream is governed by the Compact Model forum (FOR-2131). The Composite Protocol falls under the Legacy Cluster forum (FOR-2132). The Compact Programme is managed by Regional Review A (FOR-2133). The Legacy Standard D is overseen by the Seasonal Initiative forum (FOR-2134). This view supports governance audits and ensures that workstream activities align with forum objectives.

**View `quality_workstream_nursing_professional_view`**

```sql
CREATE VIEW quality_workstream_nursing_professional_view AS
SELECT a.quality_workstream_id, a.workstream_id, a.workstream_title, a.start_date, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM quality_workstreams a JOIN nursing_professionals b ON a.nursing_professional_id = b.id;
```

| quality_workstream_id | workstream_id | workstream_title | start_date | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 1 | 10782179 | Primary Framework A | 2022-09-05T20:24:00 | 1 | 5082965 | Theodore Mcgrath |
| 2 | 3001009030140 | Composite Protocol | 2023-02-16T03:41:00 | 2 | 2618560 | Account Name |
| 3 | 8928521 | Compact Programme | 2024-07-27T10:58:00 | 3 | 3355767 | Saipan International Airport |
| 4 | 6440 | Legacy Standard D | 2025-12-11T17:15:00 | 4 | 3355784 | Norma Fisher |

This view links quality workstreams to the nursing professionals responsible for them, answering the question: which professional is driving each improvement initiative? The Primary Framework A workstream is led by Theodore Mcgrath, who holds the compact-primary-14 qualification and has seven years of experience. The Composite Protocol is driven by Account Name, with the composite-primary-15 qualification and ten years of experience. The Compact Programme is managed by Saipan International Airport, holding the primary-primary-16 qualification and thirteen years of experience. The Legacy Standard D is overseen by Norma Fisher, with the adaptive-primary-17 qualification and sixteen years of experience. This view supports accountability tracking and resource allocation.

**View `quality_workstream_clinical_outcome_view`**

```sql
CREATE VIEW quality_workstream_clinical_outcome_view AS
SELECT a.quality_workstream_id, a.workstream_id, a.workstream_title, a.start_date, b.clinical_outcome_id AS outcome_clinical_outcome_id, b.outcome_id AS outcome_outcome_id, b.outcome_type AS outcome_outcome_type
FROM quality_workstreams a JOIN clinical_outcomes b ON a.clinical_outcome_id = b.clinical_outcome_id;
```

| quality_workstream_id | workstream_id | workstream_title | start_date | outcome_clinical_outcome_id | outcome_outcome_id | outcome_outcome_type |
|---|---|---|---|---|---|---|
| 1 | 10782179 | Primary Framework A | 2022-09-05T20:24:00 | 1000 | 2618555 | infection_rate |
| 2 | 3001009030140 | Composite Protocol | 2023-02-16T03:41:00 | 1001 | lu_tax_code_template_m46 | patient_satisfaction |
| 3 | 8928521 | Compact Programme | 2024-07-27T10:58:00 | 1002 | 168561 | mortality_rate |
| 4 | 6440 | Legacy Standard D | 2025-12-11T17:15:00 | 1003 | 1210-0007-M | quality_rating |

This view connects quality workstreams to the clinical outcomes they are designed to influence, answering the question: which outcome metric is each workstream targeting? The Primary Framework A workstream is associated with the infection_rate outcome (ID 2618555), measured at 14.45 percent with an improving trend. The Composite Protocol targets the patient_satisfaction outcome (ID lu_tax_code_template_m46), recorded at 17.90 count with a declining trend. The Compact Programme is linked to the mortality_rate outcome (ID 168561), measured at 21.35 score with a stable trend. The Legacy Standard D is associated with the quality_rating outcome (ID 1210-0007-M), recorded at 24.80 percent with an improving trend. This view is critical for evaluating whether workstream activities are producing the intended outcome improvements.

**View `health_trust_nursing_professional_detail_view`**

```sql
CREATE VIEW health_trust_nursing_professional_detail_view AS
SELECT a.health_trust_id, a.trust_id, a.trust_name, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM health_trusts a
  JOIN trusts_professionals j ON j.health_trust_id = a.health_trust_id
  JOIN nursing_professionals b ON b.id = j.nursing_professional_id;
```

| health_trust_id | trust_id | trust_name | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|
| 1 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Compact Framework | 1 | 5082965 | Theodore Mcgrath |
| 1 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Compact Framework | 2 | 2618560 | Account Name |
| 2 | 8387551 | Legacy Protocol | 2 | 2618560 | Account Name |
| 2 | 8387551 | Legacy Protocol | 3 | 3355767 | Saipan International Airport |
| 3 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Regional Programme A | 3 | 3355767 | Saipan International Airport |
| 3 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Regional Programme A | 4 | 3355784 | Norma Fisher |
| 4 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Standard | 4 | 3355784 | Norma Fisher |
| 4 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Standard | 1 | 5082965 | Theodore Mcgrath |

This view joins health trusts with their affiliated professionals, providing a detailed roster of practitioners within each trust. The Compact Framework trust (5f923cfa-8fcd-11eb-924d-9cd76263cbd0) employs Theodore Mcgrath, a fellow with seven years of experience in the Adaptive Cluster role. The Legacy Protocol trust (8387551) employs Account Name, who has ten years of experience and serves in the Primary Review role without fellowship. The Regional Programme A trust (ChIJAaQOcwdu5kcRArYphCv0bl0) employs Saipan International Airport, a fellow with thirteen years of experience in the Composite Initiative D role. The Seasonal Standard trust (27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3) employs Norma Fisher, who has sixteen years of experience and serves in the Compact Model role. This view supports workforce planning and trust-level reporting.

**View `health_trust_clinical_outcome_view`**

```sql
CREATE VIEW health_trust_clinical_outcome_view AS
SELECT a.health_trust_id, a.trust_id, a.trust_name, a.trust_type, b.clinical_outcome_id AS outcome_clinical_outcome_id, b.outcome_id AS outcome_outcome_id, b.outcome_type AS outcome_outcome_type
FROM health_trusts a JOIN clinical_outcomes b ON a.clinical_outcome_id = b.clinical_outcome_id;
```

| health_trust_id | trust_id | trust_name | trust_type | outcome_clinical_outcome_id | outcome_outcome_id | outcome_outcome_type |
|---|---|---|---|---|---|---|
| 1 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Compact Framework | Foundation_Trust | 1000 | 2618555 | infection_rate |
| 2 | 8387551 | Legacy Protocol | Specialist_Trust | 1001 | lu_tax_code_template_m46 | patient_satisfaction |
| 3 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Regional Programme A | Acute_Trust | 1002 | 168561 | mortality_rate |
| 4 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Standard | Foundation_Trust | 1003 | 1210-0007-M | quality_rating |

This view links health trusts to the clinical outcomes they are responsible for, answering the question: which outcomes is each trust tracking, and what are their current values? The Compact Framework trust is associated with the infection_rate outcome (14.45 percent, improving trend). The Legacy Protocol trust tracks patient_satisfaction (17.90 count, declining trend). The Regional Programme A trust monitors mortality_rate (21.35 score, stable trend). The Seasonal Standard trust measures quality_rating (24.80 percent, improving trend). This view enables trust-level performance benchmarking and regulatory reporting.

**View `clinical_outcome_health_trust_view`**

```sql
CREATE VIEW clinical_outcome_health_trust_view AS
SELECT a.clinical_outcome_id, a.outcome_id, a.outcome_type, a.measurement_value, b.health_trust_id AS trust_health_trust_id, b.trust_id AS trust_trust_id, b.trust_name AS trust_trust_name
FROM clinical_outcomes a JOIN health_trusts b ON a.health_trust_id = b.health_trust_id;
```

| clinical_outcome_id | outcome_id | outcome_type | measurement_value | trust_health_trust_id | trust_trust_id | trust_trust_name |
|---|---|---|---|---|---|---|
| 1000 | 2618555 | infection_rate | 14.45 | 1 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Compact Framework |
| 1001 | lu_tax_code_template_m46 | patient_satisfaction | 17.90 | 2 | 8387551 | Legacy Protocol |
| 1002 | 168561 | mortality_rate | 21.35 | 3 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Regional Programme A |
| 1003 | 1210-0007-M | quality_rating | 24.80 | 4 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | Seasonal Standard |

The reverse mapping from clinical outcomes to health trusts, this view answers the question: which trust is responsible for each outcome measurement? The infection_rate outcome (2618555) is reported by the Compact Framework trust. The patient_satisfaction outcome (lu_tax_code_template_m46) is reported by the Legacy Protocol trust. The mortality_rate outcome (168561) is reported by the Regional Programme A trust. The quality_rating outcome (1210-0007-M) is reported by the Seasonal Standard trust. This view supports data provenance tracking and outcome ownership verification.

**View `clinical_outcome_quality_workstream_view`**

```sql
CREATE VIEW clinical_outcome_quality_workstream_view AS
SELECT a.clinical_outcome_id, a.outcome_id, a.outcome_type, a.measurement_value, b.quality_workstream_id AS workstream_quality_workstream_id, b.workstream_id AS workstream_workstream_id, b.workstream_title AS workstream_workstream_title
FROM clinical_outcomes a JOIN quality_workstreams b ON a.quality_workstream_id = b.quality_workstream_id;
```

| clinical_outcome_id | outcome_id | outcome_type | measurement_value | workstream_quality_workstream_id | workstream_workstream_id | workstream_workstream_title |
|---|---|---|---|---|---|---|
| 1000 | 2618555 | infection_rate | 14.45 | 1 | 10782179 | Primary Framework A |
| 1001 | lu_tax_code_template_m46 | patient_satisfaction | 17.90 | 2 | 3001009030140 | Composite Protocol |
| 1002 | 168561 | mortality_rate | 21.35 | 3 | 8928521 | Compact Programme |
| 1003 | 1210-0007-M | quality_rating | 24.80 | 4 | 6440 | Legacy Standard D |

This view connects clinical outcomes to the quality workstreams designed to influence them, answering the question: which improvement initiative is each outcome tied to? The infection_rate outcome is linked to the Primary Framework A workstream, which targets infection control. The patient_satisfaction outcome is associated with the Composite Protocol workstream, focused on patient dignity. The mortality_rate outcome is connected to the Compact Programme workstream, addressing leadership development. The quality_rating outcome is tied to the Legacy Standard D workstream, targeting staff engagement. This view supports the evaluation of workstream effectiveness by comparing planned scope against measured outcomes.

**View `clinical_outcome_nursing_professional_view`**

```sql
CREATE VIEW clinical_outcome_nursing_professional_view AS
SELECT a.clinical_outcome_id, a.outcome_id, a.outcome_type, a.measurement_value, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM clinical_outcomes a JOIN nursing_professionals b ON a.nursing_professional_id = b.id;
```

| clinical_outcome_id | outcome_id | outcome_type | measurement_value | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|---|
| 1000 | 2618555 | infection_rate | 14.45 | 1 | 5082965 | Theodore Mcgrath |
| 1001 | lu_tax_code_template_m46 | patient_satisfaction | 17.90 | 2 | 2618560 | Account Name |
| 1002 | 168561 | mortality_rate | 21.35 | 3 | 3355767 | Saipan International Airport |
| 1003 | 1210-0007-M | quality_rating | 24.80 | 4 | 3355784 | Norma Fisher |

This view links clinical outcomes to the nursing professionals responsible for them, answering the question: which professional is accountable for each outcome? The infection_rate outcome (2618555) is owned by Theodore Mcgrath, a fellow with seven years of experience. The patient_satisfaction outcome (lu_tax_code_template_m46) is owned by Account Name, with ten years of experience and no fellowship. The mortality_rate outcome (168561) is owned by Saipan International Airport, a fellow with thirteen years of experience. The quality_rating outcome (1210-0007-M) is owned by Norma Fisher, with sixteen years of experience and no fellowship. This view establishes clear lines of accountability for outcome measurement and improvement.

**View `educational_institution_nursing_professional_detail_view`**

```sql
CREATE VIEW educational_institution_nursing_professional_detail_view AS
SELECT a.id, a.institution_id, a.institution_name, b.id AS professional_id, b.professional_id AS professional_professional_id, b.full_name AS professional_full_name
FROM educational_institutions a
  JOIN institutions_professionals j ON j.educational_institution_id = a.id
  JOIN nursing_professionals b ON b.id = j.nursing_professional_id;
```

| id | institution_id | institution_name | professional_id | professional_professional_id | professional_full_name |
|---|---|---|---|---|---|
| 1 | 9424913 | Extended Corridor | 1 | 5082965 | Theodore Mcgrath |
| 1 | 9424913 | Extended Corridor | 2 | 2618560 | Account Name |
| 2 | 8189481 | Pilot Series A | 2 | 2618560 | Account Name |
| 2 | 8189481 | Pilot Series A | 3 | 3355767 | Saipan International Airport |
| 3 | 1437604 | Baseline Assessment | 3 | 3355767 | Saipan International Airport |
| 3 | 1437604 | Baseline Assessment | 4 | 3355784 | Norma Fisher |
| 4 | 884346 | Distributed Survey | 4 | 3355784 | Norma Fisher |
| 4 | 884346 | Distributed Survey | 1 | 5082965 | Theodore Mcgrath |

This view joins educational institutions with their alumni who are now practising nursing professionals, answering the question: which professionals trained at which institution, and what are their current qualifications and roles? Extended Corridor university produced Theodore Mcgrath, who now holds the compact-primary-14 qualification and serves in the Adaptive Cluster role with seven years of experience. Pilot Series A hospital_school educated Account Name, who holds the composite-primary-15 qualification and serves in the Primary Review role with ten years of experience. Baseline Assessment training_academy graduated Saipan International Airport, who holds the primary-primary-16 qualification and serves in the Composite Initiative D role with thirteen years of experience. Distributed Survey university educated Norma Fisher, who holds the adaptive-primary-17 qualification and serves in the Compact Model role with sixteen years of experience. This view supports educational programme evaluation and workforce pipeline analysis.

## Synthesis

The nursing quality improvement domain is defined by a dense network of relationships between professionals, organisations, and improvement initiatives. Nursing forums provide the organisational containers, quality workstreams deliver the operational focus, health trusts anchor the institutional context, clinical outcomes supply the evidence, and educational institutions form the training foundation. Nursing professionals sit at the intersection of all these elements, carrying qualifications, affiliations, and responsibilities that span the entire ecosystem. The views presented above each answer a specific operational question—mapping professionals to forums, workstreams to outcomes, trusts to ratings—enabling administrators, regulators, and improvement leaders to navigate this complexity with clarity. Every record, from the registration number REG-2136 to the CQC rating outstanding, contributes to a coherent picture of how nursing quality improvement is structured, executed, and measured across the healthcare system.