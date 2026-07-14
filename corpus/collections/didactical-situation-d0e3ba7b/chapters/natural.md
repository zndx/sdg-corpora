## The Architecture of Didactical Situations

Educational practice unfolds through structured interactions between learners, instructors, and the materials that mediate their engagement with mathematical content. A didactical situation captures one such interaction: a bounded episode in which a mathematical concept is introduced, practiced, or assessed, supported by specific instruments and situated within institutional constraints. The records in this domain describe the full ecology of such situations—the concepts themselves, the people involved, the tools deployed, the governing institutions, and the measurable outcomes that result. Understanding this ecology requires examining each component in isolation and then tracing the relationships that bind them together.

**Table `didactical_situations`**

| situation_id | title | period_start | period_end | status | description | didactic_instrument_id |
|---|---|---|---|---|---|---|
| ChIJe0zpU4Bt5kcR4t9EwgzhF0U | Compact Initiative | 2023-10-27T21:27:00 | 2022-01-24T00:12:00 | proposed | Extended Survey | 100 |
| 209223 | Legacy Model | 2024-03-11T04:44:00 | 2023-06-08T07:29:00 | implemented | Pilot Corridor A | 101 |
| 974928 | Regional Cluster A | 2025-08-22T11:01:00 | 2024-11-19T14:46:00 | evaluated | Baseline Series | 102 |
| gd_acc_160001 | Seasonal Review | 2022-01-06T18:18:00 | 2025-04-03T21:03:00 | archived | Distributed Assessment | 103 |

A didactical situation is the central organizing unit. Each record carries a unique identifier, a descriptive title, and a temporal window defined by a start and end timestamp. The status field tracks the lifecycle stage of the situation, ranging from `proposed` through `implemented` and `evaluated` to `archived`. The Compact Initiative (identifier `ChIJe0zpU4Bt5kcR4t9EwgzhF0U`) holds the status `proposed` and is described as an Extended Survey, while the Legacy Model (`209223`) has progressed to `implemented` and is characterized as a Pilot Corridor A. The Regional Cluster A (`974928`) reached the `evaluated` stage as a Baseline Series, and the Seasonal Review (`gd_acc_160001`) is `archived` under the label Distributed Assessment. Every situation is linked to a didactic instrument through the `didactic_instrument_id` column, establishing the material foundation for the episode.

**Table `mathematical_concepts`**

| id | concept_id | name | domain | complexity_level | prerequisite_concept_id | is_abstract | mathematical_concept_id |
|---|---|---|---|---|---|---|---|
| 1 | 884350 | Extended Review | algebra | 37 | 778560 | false | 1 |
| 2 | 392497 | Pilot Initiative A | geometry | 45 | 505992 | true | 2 |
| 3 | 2106713 | Baseline Model | calculus | 53 | account_pymes_132 | false | 3 |
| 4 | 4463648 | Distributed Cluster | number_theory | 61 | 32806 | true | 4 |

At the heart of each situation lies a mathematical concept. The `mathematical_concepts` table records concepts with an internal `id`, a `concept_id` for external reference, a human-readable `name`, and a `domain` classification such as algebra, geometry, calculus, or number_theory. The `complexity_level` field assigns a numeric value indicating the conceptual difficulty, while `prerequisite_concept_id` points to a preceding concept that must be understood first. The `is_abstract` flag distinguishes concrete from abstract content. For example, the concept named Extended Review (concept_id `884350`) belongs to the algebra domain, carries a complexity level of 37, lists 778560 as its prerequisite, and is marked as non-abstract. By contrast, Distributed Cluster (concept_id `4463648`) sits in number_theory with a complexity level of 61, has 32806 as its prerequisite, and is classified as abstract. The mathematical_concept_id column provides a secondary linkage back to the situation context.

**Table `educational_actors`**

| actor_id | role | institution | years_of_experience | demographic_group | situation_id |
|---|---|---|---|---|---|
| 9125629 | teacher | baseline-institut-31 | 7 | extended-demograp-69 | ChIJe0zpU4Bt5kcR4t9EwgzhF0U |
| 611506 | student | pilot-institut-32 | 10 | integrated-demograp-70 | 209223 |
| 611522 | teacher | extended-institut-33 | 13 | seasonal-demograp-71 | 974928 |
| 1205-0002-M | student | integrated-institut-34 | 16 | regional-demograp-72 | gd_acc_160001 |

Educational actors are the human participants in a didactical situation. Each actor record specifies a `role`—either `teacher` or `student`—along with the `institution` they belong to, their `years_of_experience`, and a `demographic_group` classification. The actor with identifier `9125629` serves as a teacher at baseline-institut-31, has seven years of experience, and belongs to the extended-demograp-69 demographic group; this actor is associated with the Compact Initiative situation. The student `611506` at pilot-institut-32 brings ten years of experience and is categorized under integrated-demograp-70, participating in the Legacy Model situation. Teacher `611522` at extended-institut-33 has thirteen years of experience and falls within seasonal-demograp-71, linked to Regional Cluster A. Finally, student `1205-0002-M` at integrated-institut-34, with sixteen years of experience and regional-demograp-72 classification, is connected to the Seasonal Review situation.

**Table `didactic_instruments`**

| id | instrument_id | title | type | publication_year | author_name | is_digital | situation_id |
|---|---|---|---|---|---|---|---|
| 100 | 6926365 | Compact Initiative | textbook | 25 | Sarah Villanueva | false | ChIJe0zpU4Bt5kcR4t9EwgzhF0U |
| 101 | account_pymes_691 | Legacy Model | software | 33 | Terry Pratchett | true | 209223 |
| 102 | 726063 | Regional Cluster A | manipulative | 41 | Nicole Smith | false | 974928 |
| 103 | 23256422 | Seasonal Review | worksheet | 49 | Collin Lopez | true | gd_acc_160001 |

Didactic instruments are the materials and tools that mediate learning. The `didactic_instruments` table records each instrument with an internal `id`, an `instrument_id`, a `title`, a `type` (such as textbook, software, manipulative, or worksheet), a `publication_year`, an `author_name`, and a boolean `is_digital` flag. The instrument tied to the Compact Initiative situation is titled Compact Initiative itself, classified as a textbook, published in year 25, authored by Sarah Villanueva, and is not digital. The instrument for the Legacy Model situation, titled Legacy Model, is a software tool published in year 33, authored by Terry Pratchett, and is digital. The instrument for Regional Cluster A, titled Regional Cluster A, is a manipulative published in year 41 by Nicole Smith, and is non-digital. The instrument for the Seasonal Review, titled Seasonal Review, is a worksheet published in year 49, authored by Collin Lopez, and is digital.

**Table `didactic_institutions`**

| didactic_institution_id | institution_id | name | jurisdiction | founding_year | type | situation_id |
|---|---|---|---|---|---|---|
| 100 | 9424913 | Extended Review | regional-jurisdic-30 | 43 | school | ChIJe0zpU4Bt5kcR4t9EwgzhF0U |
| 101 | 8189481 | Pilot Initiative A | legacy-jurisdic-31 | 48 | ministry | 209223 |
| 102 | 1437604 | Baseline Model | compact-jurisdic-32 | 53 | university | 974928 |
| 103 | 884346 | Distributed Cluster | composite-jurisdic-33 | 58 | research_institute | gd_acc_160001 |

Didactic institutions define the organizational and jurisdictional context in which situations occur. The `didactic_institutions` table includes a `didactic_institution_id`, an `institution_id`, a `name`, a `jurisdiction` classification, a `founding_year`, a `type` (school, ministry, university, or research_institute), and a `situation_id` linking the institution to a specific situation. The institution associated with the Compact Initiative is named Extended Review, operates under regional-jurisdic-30, was founded in year 43, and is of type school. The institution for the Legacy Model is Pilot Initiative A, under legacy-jurisdic-31, founded in year 48, and classified as a ministry. The institution for Regional Cluster A is the Baseline Model, under compact-jurisdic-32, founded in year 53, and a university. The institution for the Seasonal Review is the Distributed Cluster, under composite-jurisdic-33, founded in year 58, and a research_institute.

**Table `learning_outcomes`**

| id | outcome_id | assessment_score | mastery_level | date_assessed | is_achieved | situation_id | mathematical_concept_id | actor_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2618555 | 11.20 | novice | 2023-10-24 | true | ChIJe0zpU4Bt5kcR4t9EwgzhF0U | 1 | 9125629 |
| 2 | lu_tax_code_template_m46 | 14.40 | competent | 2024-03-08 | false | 209223 | 2 | 611506 |
| 3 | 168561 | 17.60 | expert | 2025-08-19 | true | 974928 | 3 | 611522 |
| 4 | 1210-0007-M | 20.80 | novice | 2022-01-03 | false | gd_acc_160001 | 4 | 1205-0002-M |

Learning outcomes capture the measurable results of a didactical situation. The `learning_outcomes` table records an internal `id`, an `outcome_id`, an `assessment_score` on a numeric scale, a `mastery_level` (novice, competent, or expert), a `date_assessed`, a boolean `is_achieved` flag, and foreign keys linking to the `situation_id`, `mathematical_concept_id`, and `actor_id`. The outcome for the Compact Initiative situation, associated with mathematical concept 1 and actor `9125629`, has an assessment score of 11.20, a mastery level of novice, was assessed on 2023-10-24, and is marked as achieved. The outcome for the Legacy Model situation, linked to concept 2 and actor `611506`, scores 14.40 at the competent level, was assessed on 2024-03-08, and is not achieved. The outcome for Regional Cluster A, tied to concept 3 and actor `611522`, reaches a score of 17.60 at the expert level, assessed on 2025-08-19, and is achieved. The outcome for the Seasonal Review, connected to concept 4 and actor `1205-0002-M`, scores 20.80 at the novice level, was assessed on 2022-01-03, and is not achieved.

The relational structure of the domain extends beyond these core tables through a set of association tables that capture many-to-many relationships. The `situations_concepts` table links didactical situations to the mathematical concepts they address, while `situations_actors` records which educational actors participate in which situations. The `concepts_situations` table provides a complementary perspective, mapping mathematical concepts to the situations in which they appear. The `instruments_concepts` table associates didactic instruments with the mathematical concepts they support, and `institutions_actors` connects educational actors to the didactic institutions they belong to. Together, these tables form a network of relationships that allows any entity to be traced through its connections to all others.

**Table `situations_concepts`**

| situation_id | mathematical_concept_id |
|---|---|
| ChIJe0zpU4Bt5kcR4t9EwgzhF0U | 1 |
| ChIJe0zpU4Bt5kcR4t9EwgzhF0U | 2 |
| 209223 | 2 |
| 209223 | 3 |
| 974928 | 3 |
| 974928 | 4 |
| gd_acc_160001 | 4 |
| gd_acc_160001 | 1 |

**Table `situations_actors`**

| situation_id | actor_id |
|---|---|
| ChIJe0zpU4Bt5kcR4t9EwgzhF0U | 9125629 |
| ChIJe0zpU4Bt5kcR4t9EwgzhF0U | 611506 |
| 209223 | 611506 |
| 209223 | 611522 |
| 974928 | 611522 |
| 974928 | 1205-0002-M |
| gd_acc_160001 | 1205-0002-M |
| gd_acc_160001 | 9125629 |

**Table `concepts_situations`**

| mathematical_concept_id | situation_id |
|---|---|
| 1 | ChIJe0zpU4Bt5kcR4t9EwgzhF0U |
| 1 | 209223 |
| 2 | 209223 |
| 2 | 974928 |
| 3 | 974928 |
| 3 | gd_acc_160001 |
| 4 | gd_acc_160001 |
| 4 | ChIJe0zpU4Bt5kcR4t9EwgzhF0U |

**Table `instruments_concepts`**

| didactic_instrument_id | mathematical_concept_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `institutions_actors`**

| didactic_institution_id | actor_id |
|---|---|
| 100 | 9125629 |
| 100 | 611506 |
| 101 | 611506 |
| 101 | 611522 |
| 102 | 611522 |
| 102 | 1205-0002-M |
| 103 | 1205-0002-M |
| 103 | 9125629 |

The detail views synthesize these relationships into readable records that answer specific analytical questions. Each view joins the base tables to produce a comprehensive snapshot of a particular aspect of the didactical ecology.

**View `didactical_situation_mathematical_concept_detail_view`**

```sql
CREATE VIEW didactical_situation_mathematical_concept_detail_view AS
SELECT a.situation_id, a.title, a.period_start, b.id AS concept_id, b.concept_id AS concept_concept_id, b.name AS concept_name
FROM didactical_situations a
  JOIN situations_concepts j ON j.situation_id = a.situation_id
  JOIN mathematical_concepts b ON b.id = j.mathematical_concept_id;
```

| situation_id | title | period_start | concept_id | concept_concept_id | concept_name |
|---|---|---|---|---|---|
| ChIJe0zpU4Bt5kcR4t9EwgzhF0U | Compact Initiative | 2023-10-27T21:27:00 | 1 | 884350 | Extended Review |
| ChIJe0zpU4Bt5kcR4t9EwgzhF0U | Compact Initiative | 2023-10-27T21:27:00 | 2 | 392497 | Pilot Initiative A |
| 209223 | Legacy Model | 2024-03-11T04:44:00 | 2 | 392497 | Pilot Initiative A |
| 209223 | Legacy Model | 2024-03-11T04:44:00 | 3 | 2106713 | Baseline Model |
| 974928 | Regional Cluster A | 2025-08-22T11:01:00 | 3 | 2106713 | Baseline Model |
| 974928 | Regional Cluster A | 2025-08-22T11:01:00 | 4 | 4463648 | Distributed Cluster |
| gd_acc_160001 | Seasonal Review | 2022-01-06T18:18:00 | 4 | 4463648 | Distributed Cluster |
| gd_acc_160001 | Seasonal Review | 2022-01-06T18:18:00 | 1 | 884350 | Extended Review |

This view answers the question of which mathematical concepts are addressed within each didactical situation. It joins the situation record with its associated concept, revealing the domain, complexity, and abstractness of the content being taught. For the Compact Initiative situation, the view would show the Extended Review concept from algebra with a complexity level of 37 and a non-abstract classification, providing a clear picture of the intellectual demands placed on participants.

**View `didactical_situation_educational_actor_detail_view`**

```sql
CREATE VIEW didactical_situation_educational_actor_detail_view AS
SELECT a.situation_id, a.title, a.period_start, b.actor_id AS actor_actor_id, b.role AS actor_role, b.institution AS actor_institution
FROM didactical_situations a
  JOIN situations_actors j ON j.situation_id = a.situation_id
  JOIN educational_actors b ON b.actor_id = j.actor_id;
```

| situation_id | title | period_start | actor_actor_id | actor_role | actor_institution |
|---|---|---|---|---|---|
| ChIJe0zpU4Bt5kcR4t9EwgzhF0U | Compact Initiative | 2023-10-27T21:27:00 | 9125629 | teacher | baseline-institut-31 |
| ChIJe0zpU4Bt5kcR4t9EwgzhF0U | Compact Initiative | 2023-10-27T21:27:00 | 611506 | student | pilot-institut-32 |
| 209223 | Legacy Model | 2024-03-11T04:44:00 | 611506 | student | pilot-institut-32 |
| 209223 | Legacy Model | 2024-03-11T04:44:00 | 611522 | teacher | extended-institut-33 |
| 974928 | Regional Cluster A | 2025-08-22T11:01:00 | 611522 | teacher | extended-institut-33 |
| 974928 | Regional Cluster A | 2025-08-22T11:01:00 | 1205-0002-M | student | integrated-institut-34 |
| gd_acc_160001 | Seasonal Review | 2022-01-06T18:18:00 | 1205-0002-M | student | integrated-institut-34 |
| gd_acc_160001 | Seasonal Review | 2022-01-06T18:18:00 | 9125629 | teacher | baseline-institut-31 |

This view reveals the human dimension of each situation by joining the situation with its participating actors. It surfaces the role, institution, experience level, and demographic grouping of each participant. In the case of the Compact Initiative, the view would display the teacher `9125629` from baseline-institut-31 with seven years of experience, allowing administrators to assess whether the right personnel are assigned to each situation.

**View `didactical_situation_didactic_instrument_view`**

```sql
CREATE VIEW didactical_situation_didactic_instrument_view AS
SELECT a.situation_id, a.title, a.period_start, a.period_end, b.id AS instrument_id, b.instrument_id AS instrument_instrument_id, b.title AS instrument_title
FROM didactical_situations a JOIN didactic_instruments b ON a.didactic_instrument_id = b.id;
```

| situation_id | title | period_start | period_end | instrument_id | instrument_instrument_id | instrument_title |
|---|---|---|---|---|---|---|
| ChIJe0zpU4Bt5kcR4t9EwgzhF0U | Compact Initiative | 2023-10-27T21:27:00 | 2022-01-24T00:12:00 | 100 | 6926365 | Compact Initiative |
| 209223 | Legacy Model | 2024-03-11T04:44:00 | 2023-06-08T07:29:00 | 101 | account_pymes_691 | Legacy Model |
| 974928 | Regional Cluster A | 2025-08-22T11:01:00 | 2024-11-19T14:46:00 | 102 | 726063 | Regional Cluster A |
| gd_acc_160001 | Seasonal Review | 2022-01-06T18:18:00 | 2025-04-03T21:03:00 | 103 | 23256422 | Seasonal Review |

This view connects each situation to its supporting didactic instrument, presenting the instrument's title, type, publication year, author, and digital status alongside the situation's own metadata. For the Legacy Model situation, the view would surface the software instrument authored by Terry Pratchett, published in year 33, enabling a quick assessment of whether the material format aligns with the situation's pedagogical goals.

**View `mathematical_concept_didactical_situation_detail_view`**

```sql
CREATE VIEW mathematical_concept_didactical_situation_detail_view AS
SELECT a.id, a.concept_id, a.name, b.situation_id AS situation_situation_id, b.title AS situation_title, b.period_start AS situation_period_start
FROM mathematical_concepts a
  JOIN concepts_situations j ON j.mathematical_concept_id = a.id
  JOIN didactical_situations b ON b.situation_id = j.situation_id;
```

| id | concept_id | name | situation_situation_id | situation_title | situation_period_start |
|---|---|---|---|---|---|
| 1 | 884350 | Extended Review | ChIJe0zpU4Bt5kcR4t9EwgzhF0U | Compact Initiative | 2023-10-27T21:27:00 |
| 1 | 884350 | Extended Review | 209223 | Legacy Model | 2024-03-11T04:44:00 |
| 2 | 392497 | Pilot Initiative A | 209223 | Legacy Model | 2024-03-11T04:44:00 |
| 2 | 392497 | Pilot Initiative A | 974928 | Regional Cluster A | 2025-08-22T11:01:00 |
| 3 | 2106713 | Baseline Model | 974928 | Regional Cluster A | 2025-08-22T11:01:00 |
| 3 | 2106713 | Baseline Model | gd_acc_160001 | Seasonal Review | 2022-01-06T18:18:00 |
| 4 | 4463648 | Distributed Cluster | gd_acc_160001 | Seasonal Review | 2022-01-06T18:18:00 |
| 4 | 4463648 | Distributed Cluster | ChIJe0zpU4Bt5kcR4t9EwgzhF0U | Compact Initiative | 2023-10-27T21:27:00 |

Reversing the perspective, this view answers which situations employ a given mathematical concept. It joins the concept record with all situations that reference it, showing the titles, periods, and statuses of those situations. This is particularly useful for tracing how a concept such as Distributed Cluster from number_theory appears across multiple educational episodes.

**View `mathematical_concept_mathematical_concept_view`**

```sql
CREATE VIEW mathematical_concept_mathematical_concept_view AS
SELECT a.id, a.concept_id, a.name, a.domain, b.id AS concept_id, b.concept_id AS concept_concept_id, b.name AS concept_name
FROM mathematical_concepts a JOIN mathematical_concepts b ON a.mathematical_concept_id = b.id;
```

| id | concept_id | name | domain | concept_id | concept_concept_id | concept_name |
|---|---|---|---|---|---|---|
| 1 | 884350 | Extended Review | algebra | 1 | 884350 | Extended Review |
| 2 | 392497 | Pilot Initiative A | geometry | 2 | 392497 | Pilot Initiative A |
| 3 | 2106713 | Baseline Model | calculus | 3 | 2106713 | Baseline Model |
| 4 | 4463648 | Distributed Cluster | number_theory | 4 | 4463648 | Distributed Cluster |

This view provides a self-referential analysis of mathematical concepts, joining concept records to reveal prerequisite relationships and domain groupings. It allows practitioners to see how concepts like Extended Review in algebra depend on prerequisite concept 778560, and how complexity levels cascade across the curriculum.

**View `educational_actor_didactical_situation_view`**

```sql
CREATE VIEW educational_actor_didactical_situation_view AS
SELECT a.actor_id, a.role, a.institution, a.years_of_experience, b.situation_id AS situation_situation_id, b.title AS situation_title, b.period_start AS situation_period_start
FROM educational_actors a JOIN didactical_situations b ON a.situation_id = b.situation_id;
```

| actor_id | role | institution | years_of_experience | situation_situation_id | situation_title | situation_period_start |
|---|---|---|---|---|---|---|
| 9125629 | teacher | baseline-institut-31 | 7 | ChIJe0zpU4Bt5kcR4t9EwgzhF0U | Compact Initiative | 2023-10-27T21:27:00 |
| 611506 | student | pilot-institut-32 | 10 | 209223 | Legacy Model | 2024-03-11T04:44:00 |
| 611522 | teacher | extended-institut-33 | 13 | 974928 | Regional Cluster A | 2025-08-22T11:01:00 |
| 1205-0002-M | student | integrated-institut-34 | 16 | gd_acc_160001 | Seasonal Review | 2022-01-06T18:18:00 |

This view presents each educational actor alongside the situations in which they participate, surfacing the situation title, period, and status. For teacher `611522` at extended-institut-33, the view would show their involvement in the Regional Cluster A situation, providing a complete picture of their professional engagement.

**View `didactic_instrument_mathematical_concept_detail_view`**

```sql
CREATE VIEW didactic_instrument_mathematical_concept_detail_view AS
SELECT a.id, a.instrument_id, a.title, b.id AS concept_id, b.concept_id AS concept_concept_id, b.name AS concept_name
FROM didactic_instruments a
  JOIN instruments_concepts j ON j.didactic_instrument_id = a.id
  JOIN mathematical_concepts b ON b.id = j.mathematical_concept_id;
```

| id | instrument_id | title | concept_id | concept_concept_id | concept_name |
|---|---|---|---|---|---|
| 100 | 6926365 | Compact Initiative | 1 | 884350 | Extended Review |
| 100 | 6926365 | Compact Initiative | 2 | 392497 | Pilot Initiative A |
| 101 | account_pymes_691 | Legacy Model | 2 | 392497 | Pilot Initiative A |
| 101 | account_pymes_691 | Legacy Model | 3 | 2106713 | Baseline Model |
| 102 | 726063 | Regional Cluster A | 3 | 2106713 | Baseline Model |
| 102 | 726063 | Regional Cluster A | 4 | 4463648 | Distributed Cluster |
| 103 | 23256422 | Seasonal Review | 4 | 4463648 | Distributed Cluster |
| 103 | 23256422 | Seasonal Review | 1 | 884350 | Extended Review |

This view links didactic instruments to the mathematical concepts they support, revealing the conceptual content each material tool is designed to teach. For the textbook instrument Compact Initiative, the view would show its association with the Extended Review concept in algebra, helping curriculum designers verify that materials are properly aligned with content objectives.

**View `didactic_instrument_didactical_situation_view`**

```sql
CREATE VIEW didactic_instrument_didactical_situation_view AS
SELECT a.id, a.instrument_id, a.title, a.type, b.situation_id AS situation_situation_id, b.title AS situation_title, b.period_start AS situation_period_start
FROM didactic_instruments a JOIN didactical_situations b ON a.situation_id = b.situation_id;
```

| id | instrument_id | title | type | situation_situation_id | situation_title | situation_period_start |
|---|---|---|---|---|---|---|
| 100 | 6926365 | Compact Initiative | textbook | ChIJe0zpU4Bt5kcR4t9EwgzhF0U | Compact Initiative | 2023-10-27T21:27:00 |
| 101 | account_pymes_691 | Legacy Model | software | 209223 | Legacy Model | 2024-03-11T04:44:00 |
| 102 | 726063 | Regional Cluster A | manipulative | 974928 | Regional Cluster A | 2025-08-22T11:01:00 |
| 103 | 23256422 | Seasonal Review | worksheet | gd_acc_160001 | Seasonal Review | 2022-01-06T18:18:00 |

This view presents each didactic instrument alongside the situations that use it, showing the situation title, period, and status. For the software instrument Legacy Model, the view would display its connection to the Legacy Model situation, allowing reviewers to assess whether the instrument's type and format are appropriate for the situation's phase.

**View `didactic_institution_didactical_situation_view`**

```sql
CREATE VIEW didactic_institution_didactical_situation_view AS
SELECT a.didactic_institution_id, a.institution_id, a.name, a.jurisdiction, b.situation_id AS situation_situation_id, b.title AS situation_title, b.period_start AS situation_period_start
FROM didactic_institutions a JOIN didactical_situations b ON a.situation_id = b.situation_id;
```

| didactic_institution_id | institution_id | name | jurisdiction | situation_situation_id | situation_title | situation_period_start |
|---|---|---|---|---|---|---|
| 100 | 9424913 | Extended Review | regional-jurisdic-30 | ChIJe0zpU4Bt5kcR4t9EwgzhF0U | Compact Initiative | 2023-10-27T21:27:00 |
| 101 | 8189481 | Pilot Initiative A | legacy-jurisdic-31 | 209223 | Legacy Model | 2024-03-11T04:44:00 |
| 102 | 1437604 | Baseline Model | compact-jurisdic-32 | 974928 | Regional Cluster A | 2025-08-22T11:01:00 |
| 103 | 884346 | Distributed Cluster | composite-jurisdic-33 | gd_acc_160001 | Seasonal Review | 2022-01-06T18:18:00 |

This view connects didactic institutions to the situations they govern, presenting the institution's name, jurisdiction, founding year, and type alongside the situation's metadata. For the institution Extended Review (a school under regional-jurisdic-30), the view would show its association with the Compact Initiative situation, clarifying the organizational context in which the situation operates.

**View `didactic_institution_educational_actor_detail_view`**

```sql
CREATE VIEW didactic_institution_educational_actor_detail_view AS
SELECT a.didactic_institution_id, a.institution_id, a.name, b.actor_id AS actor_actor_id, b.role AS actor_role, b.institution AS actor_institution
FROM didactic_institutions a
  JOIN institutions_actors j ON j.didactic_institution_id = a.didactic_institution_id
  JOIN educational_actors b ON b.actor_id = j.actor_id;
```

| didactic_institution_id | institution_id | name | actor_actor_id | actor_role | actor_institution |
|---|---|---|---|---|---|
| 100 | 9424913 | Extended Review | 9125629 | teacher | baseline-institut-31 |
| 100 | 9424913 | Extended Review | 611506 | student | pilot-institut-32 |
| 101 | 8189481 | Pilot Initiative A | 611506 | student | pilot-institut-32 |
| 101 | 8189481 | Pilot Initiative A | 611522 | teacher | extended-institut-33 |
| 102 | 1437604 | Baseline Model | 611522 | teacher | extended-institut-33 |
| 102 | 1437604 | Baseline Model | 1205-0002-M | student | integrated-institut-34 |
| 103 | 884346 | Distributed Cluster | 1205-0002-M | student | integrated-institut-34 |
| 103 | 884346 | Distributed Cluster | 9125629 | teacher | baseline-institut-31 |

This view reveals the relationship between institutions and their actors by joining institution records with the educational actors they employ. For the institution Pilot Initiative A (a ministry under legacy-jurisdic-31), the view would surface the student `611506` from pilot-institut-32, providing a clear mapping of personnel to organizational structure.

**View `learning_outcome_didactical_situation_view`**

```sql
CREATE VIEW learning_outcome_didactical_situation_view AS
SELECT a.id, a.outcome_id, a.assessment_score, a.mastery_level, b.situation_id AS situation_situation_id, b.title AS situation_title, b.period_start AS situation_period_start
FROM learning_outcomes a JOIN didactical_situations b ON a.situation_id = b.situation_id;
```

| id | outcome_id | assessment_score | mastery_level | situation_situation_id | situation_title | situation_period_start |
|---|---|---|---|---|---|---|
| 1 | 2618555 | 11.20 | novice | ChIJe0zpU4Bt5kcR4t9EwgzhF0U | Compact Initiative | 2023-10-27T21:27:00 |
| 2 | lu_tax_code_template_m46 | 14.40 | competent | 209223 | Legacy Model | 2024-03-11T04:44:00 |
| 3 | 168561 | 17.60 | expert | 974928 | Regional Cluster A | 2025-08-22T11:01:00 |
| 4 | 1210-0007-M | 20.80 | novice | gd_acc_160001 | Seasonal Review | 2022-01-06T18:18:00 |

This view presents each learning outcome alongside its associated didactical situation, showing the situation title, period, and status alongside the outcome's assessment score, mastery level, and achievement status. For the outcome linked to the Compact Initiative situation, the view would display the novice-level score of 11.20 and the achieved flag, giving a complete picture of performance within that context.

**View `learning_outcome_mathematical_concept_view`**

```sql
CREATE VIEW learning_outcome_mathematical_concept_view AS
SELECT a.id, a.outcome_id, a.assessment_score, a.mastery_level, b.id AS concept_id, b.concept_id AS concept_concept_id, b.name AS concept_name
FROM learning_outcomes a JOIN mathematical_concepts b ON a.mathematical_concept_id = b.id;
```

| id | outcome_id | assessment_score | mastery_level | concept_id | concept_concept_id | concept_name |
|---|---|---|---|---|---|---|
| 1 | 2618555 | 11.20 | novice | 1 | 884350 | Extended Review |
| 2 | lu_tax_code_template_m46 | 14.40 | competent | 2 | 392497 | Pilot Initiative A |
| 3 | 168561 | 17.60 | expert | 3 | 2106713 | Baseline Model |
| 4 | 1210-0007-M | 20.80 | novice | 4 | 4463648 | Distributed Cluster |

This view connects learning outcomes to the mathematical concepts they assess, revealing which concepts have been mastered and which have not. For the outcome tied to mathematical concept 2 (Pilot Initiative A in geometry), the view would show the competent-level score of 14.40 and the not-achieved flag, highlighting a gap between the concept's complexity and the actor's demonstrated mastery.

**View `learning_outcome_educational_actor_view`**

```sql
CREATE VIEW learning_outcome_educational_actor_view AS
SELECT a.id, a.outcome_id, a.assessment_score, a.mastery_level, b.actor_id AS actor_actor_id, b.role AS actor_role, b.institution AS actor_institution
FROM learning_outcomes a JOIN educational_actors b ON a.actor_id = b.actor_id;
```

| id | outcome_id | assessment_score | mastery_level | actor_actor_id | actor_role | actor_institution |
|---|---|---|---|---|---|---|
| 1 | 2618555 | 11.20 | novice | 9125629 | teacher | baseline-institut-31 |
| 2 | lu_tax_code_template_m46 | 14.40 | competent | 611506 | student | pilot-institut-32 |
| 3 | 168561 | 17.60 | expert | 611522 | teacher | extended-institut-33 |
| 4 | 1210-0007-M | 20.80 | novice | 1205-0002-M | student | integrated-institut-34 |

This view presents each learning outcome alongside the educational actor who achieved it, showing the actor's role, institution, and experience level alongside the outcome's score and mastery classification. For the outcome associated with teacher `611522`, the view would display the expert-level score of 17.60 and the achieved flag, confirming that this experienced instructor successfully met the demands of the Regional Cluster A situation.

The didactical situation framework provides a comprehensive model for understanding how mathematical education is structured, delivered, and evaluated. By recording the interconnections between situations, concepts, actors, instruments, institutions, and outcomes, the system enables practitioners to trace the full chain of educational causality—from the institutional context and material tools through to the measurable results achieved by participants. The detail views serve as analytical lenses, each one isolating a particular relationship and presenting it in a form that supports decision-making, curriculum alignment, and quality assurance. Together, these records form a coherent picture of educational practice that is both detailed enough for operational use and structured enough for systematic analysis.