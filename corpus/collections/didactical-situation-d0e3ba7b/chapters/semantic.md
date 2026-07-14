## Ontology-Grounded Relational Modelling in Didactical Situations

The didactical situations domain captures the interplay between educational initiatives, mathematical content, human actors, and institutional frameworks. At its core, a `didactical_situation` represents a bounded educational endeavour—such as the `Compact Initiative` or the `Seasonal Review`—with a defined temporal span, a lifecycle `status` like `proposed` or `archived`, and a free-text `description`. Each situation is anchored to a `didactic_instrument` via the foreign key `didactic_instrument_id`, establishing a mandatory association between an educational context and the tool that mediates it. The situation table also carries a surrogate `situation_id` that serves as the primary key and the central hub for all downstream joins.

**Table `didactical_situations`**

| situation_id | title | period_start | period_end | status | description | didactic_instrument_id |
|---|---|---|---|---|---|---|
| ChIJe0zpU4Bt5kcR4t9EwgzhF0U | Compact Initiative | 2023-10-27T21:27:00 | 2022-01-24T00:12:00 | proposed | Extended Survey | 100 |
| 209223 | Legacy Model | 2024-03-11T04:44:00 | 2023-06-08T07:29:00 | implemented | Pilot Corridor A | 101 |
| 974928 | Regional Cluster A | 2025-08-22T11:01:00 | 2024-11-19T14:46:00 | evaluated | Baseline Series | 102 |
| gd_acc_160001 | Seasonal Review | 2022-01-06T18:18:00 | 2025-04-03T21:03:00 | archived | Distributed Assessment | 103 |

The `situation_id` values range from opaque identifiers like `ChIJe0zpU4Bt5kcR4t9EwgzhF0U` to short numeric codes such as `209223` and `974928`, and even alphanumeric strings like `gd_acc_160001`. This heterogeneity in identifier style is preserved throughout the schema: every foreign key that references a situation carries the same identifier format, ensuring referential integrity without imposing a rigid naming convention on the domain.

Mathematical concepts form the content layer of the ontology. The `mathematical_concepts` table stores each concept with a rich set of attributes: a `name` (e.g., `Extended Review`, `Pilot Initiative A`, `Baseline Model`), a `domain` classification spanning `algebra`, `geometry`, `calculus`, and `number_theory`, a `complexity_level` that scales from 37 to 61 in the sample data, and a boolean `is_abstract` flag. The table also supports a self-referencing prerequisite relationship through `prerequisite_concept_id`, allowing concepts to be ordered in a dependency graph. The `mathematical_concept_id` column provides a secondary identifier that is used in the learning outcomes and in several views.

**Table `mathematical_concepts`**

| id | concept_id | name | domain | complexity_level | prerequisite_concept_id | is_abstract | mathematical_concept_id |
|---|---|---|---|---|---|---|---|
| 1 | 884350 | Extended Review | algebra | 37 | 778560 | false | 1 |
| 2 | 392497 | Pilot Initiative A | geometry | 45 | 505992 | true | 2 |
| 3 | 2106713 | Baseline Model | calculus | 53 | account_pymes_132 | false | 3 |
| 4 | 4463648 | Distributed Cluster | number_theory | 61 | 32806 | true | 4 |

Educational actors—teachers and students—are modelled in the `educational_actors` table. Each actor carries a `role` (`teacher` or `student`), an `institution` reference (e.g., `baseline-institut-31`, `pilot-institut-32`), a `years_of_experience` metric, and a `demographic_group` classification. The actor's `actor_id` is the primary key, and the `situation_id` foreign key binds the actor to a specific didactical situation, indicating participation. The actor identifiers themselves are diverse: `9125629` and `611506` are plain integers, while `1205-0002-M` follows a structured alphanumeric pattern.

**Table `educational_actors`**

| actor_id | role | institution | years_of_experience | demographic_group | situation_id |
|---|---|---|---|---|---|
| 9125629 | teacher | baseline-institut-31 | 7 | extended-demograp-69 | ChIJe0zpU4Bt5kcR4t9EwgzhF0U |
| 611506 | student | pilot-institut-32 | 10 | integrated-demograp-70 | 209223 |
| 611522 | teacher | extended-institut-33 | 13 | seasonal-demograp-71 | 974928 |
| 1205-0002-M | student | integrated-institut-34 | 16 | regional-demograp-72 | gd_acc_160001 |

Didactic instruments represent the tools and materials deployed within situations. The `didactic_instruments` table records each instrument's `title` (which may coincide with a situation title, as with `Compact Initiative` appearing in both tables), a `type` drawn from `textbook`, `software`, `manipulative`, and `worksheet`, a `publication_year`, an `author_name` such as `Sarah Villanueva` or `Terry Pratchett`, and an `is_digital` flag. The `id` column is the primary key, while `instrument_id` serves as a secondary identifier. The `situation_id` foreign key creates a direct link from instrument to situation.

**Table `didactic_instruments`**

| id | instrument_id | title | type | publication_year | author_name | is_digital | situation_id |
|---|---|---|---|---|---|---|---|
| 100 | 6926365 | Compact Initiative | textbook | 25 | Sarah Villanueva | false | ChIJe0zpU4Bt5kcR4t9EwgzhF0U |
| 101 | account_pymes_691 | Legacy Model | software | 33 | Terry Pratchett | true | 209223 |
| 102 | 726063 | Regional Cluster A | manipulative | 41 | Nicole Smith | false | 974928 |
| 103 | 23256422 | Seasonal Review | worksheet | 49 | Collin Lopez | true | gd_acc_160001 |

Didactic institutions capture the organizational and jurisdictional context in which situations unfold. The `didactic_institutions` table stores an `institution_id`, a `name` (e.g., `Extended Review`, `Pilot Initiative A`), a `jurisdiction` code such as `regional-jurisdic-30`, a `founding_year`, a `type` (`school`, `ministry`, `university`, `research_institute`), and a `situation_id` foreign key. The primary key is `didactic_institution_id`.

**Table `didactic_institutions`**

| didactic_institution_id | institution_id | name | jurisdiction | founding_year | type | situation_id |
|---|---|---|---|---|---|---|
| 100 | 9424913 | Extended Review | regional-jurisdic-30 | 43 | school | ChIJe0zpU4Bt5kcR4t9EwgzhF0U |
| 101 | 8189481 | Pilot Initiative A | legacy-jurisdic-31 | 48 | ministry | 209223 |
| 102 | 1437604 | Baseline Model | compact-jurisdic-32 | 53 | university | 974928 |
| 103 | 884346 | Distributed Cluster | composite-jurisdic-33 | 58 | research_institute | gd_acc_160001 |

Learning outcomes constitute the assessment layer. The `learning_outcomes` table is the most highly connected table in the schema: each row records an `outcome_id`, an `assessment_score` (ranging from 11.20 to 20.80), a `mastery_level` (`novice`, `competent`, `expert`), a `date_assessed`, a boolean `is_achieved`, and three foreign keys—`situation_id`, `mathematical_concept_id`, and `actor_id`—that jointly identify the situation, the concept being assessed, and the actor whose performance is being recorded.

**Table `learning_outcomes`**

| id | outcome_id | assessment_score | mastery_level | date_assessed | is_achieved | situation_id | mathematical_concept_id | actor_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2618555 | 11.20 | novice | 2023-10-24 | true | ChIJe0zpU4Bt5kcR4t9EwgzhF0U | 1 | 9125629 |
| 2 | lu_tax_code_template_m46 | 14.40 | competent | 2024-03-08 | false | 209223 | 2 | 611506 |
| 3 | 168561 | 17.60 | expert | 2025-08-19 | true | 974928 | 3 | 611522 |
| 4 | 1210-0007-M | 20.80 | novice | 2022-01-03 | false | gd_acc_160001 | 4 | 1205-0002-M |

### Junction Tables and Many-to-Many Relationships

The ontology's many-to-many relationships are materialized through explicit junction tables. The `situations_concepts` table links didactical situations to mathematical concepts, enabling a single situation to encompass multiple concepts and a single concept to appear across multiple situations. Similarly, `situations_actors` provides the situation-to-actor association, though the `educational_actors` table also carries a `situation_id` foreign key directly, suggesting a dual-path modelling choice where the junction table may capture additional relationship metadata beyond the simple foreign key.

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

The `concepts_situations` table appears to be a mirror or alternative orientation of the same relationship, providing a concept-centric view of the situation-concept association. This redundancy may serve query optimisation or reflect a bidirectional navigation requirement in the ontology.

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

The `instruments_concepts` junction table connects didactic instruments to mathematical concepts, allowing instruments to be classified by the concepts they support. The `institutions_actors` table links didactic institutions to educational actors, capturing the organizational affiliation of each actor beyond the `institution` string column in the actors table.

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

### View-Based Reconstitution of Domain Facts

The relational schema is designed so that normalized tables can be reassembled through views into coherent domain facts. Each view answers a specific analytical question by joining the relevant base and junction tables.

The `didactical_situation_mathematical_concept_detail_view` reconstructs the relationship between a didactical situation and its associated mathematical concepts. It joins `didactical_situations` with `mathematical_concepts` through the `situations_concepts` junction table, producing rows that pair a situation title like `Regional Cluster A` with concept names like `Baseline Model`. This view answers the question: "Which mathematical concepts are taught within each didactical situation?"

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

The `didactical_situation_educational_actor_detail_view` joins `didactical_situations` with `educational_actors` to reveal which actors participate in which situations. A row from this view might show the `Compact Initiative` paired with a `teacher` from `baseline-institut-31` who has 7 years of experience. This view answers: "Who is involved in each didactical situation?"

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

The `didactical_situation_didactic_instrument_view` links situations to their instruments via the `didactic_instruments.situation_id` foreign key. Since each situation has exactly one instrument in the current data (e.g., `Compact Initiative` linked to instrument `6926365` of type `textbook`), this view presents a one-to-one mapping. It answers: "What instrument mediates each didactical situation?"

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

The `mathematical_concept_didactical_situation_detail_view` inverts the perspective, starting from a mathematical concept and listing the situations in which it appears. A row might pair `Extended Review` (a concept in `algebra`) with the `Compact Initiative` situation. This view answers: "In which situations is each mathematical concept deployed?"

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

The `mathematical_concept_mathematical_concept_view` is a self-referential view that likely exposes the prerequisite structure of concepts. By joining `mathematical_concepts` to itself on `prerequisite_concept_id`, it produces rows that show a concept alongside its prerequisite. For instance, a concept with `complexity_level` 45 might list a prerequisite concept with `complexity_level` 37, illustrating the ascending difficulty progression.

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

The `educational_actor_didactical_situation_view` presents the actor-centric counterpart to the situation-centric actor view. It joins `educational_actors` with `didactical_situations`, producing rows such as a `student` from `pilot-institut-32` with 10 years of experience participating in the `Legacy Model` situation. This view answers: "What situations does each educational actor engage with?"

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

The `didactic_instrument_mathematical_concept_detail_view` connects instruments to concepts through the `instruments_concepts` junction table. A row might show the `Legacy Model` instrument (type `software`, authored by `Terry Pratchett`) associated with the concept `Pilot Initiative A` in the `geometry` domain. This view answers: "Which mathematical concepts does each didactic instrument support?"

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

The `didactic_instrument_didactical_situation_view` is a straightforward join between `didactic_instruments` and `didactical_situations` on the `situation_id` column. It produces rows such as the `Seasonal Review` instrument (type `worksheet`, authored by `Collin Lopez`) linked to the `Seasonal Review` situation. This view answers: "Which situation does each instrument serve?"

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

The `didactic_institution_didactical_situation_view` joins `didactic_institutions` with `didactical_situations` on `situation_id`. A representative row pairs the `Extended Review` institution (type `school`, jurisdiction `regional-jurisdic-30`) with the `Compact Initiative` situation. This view answers: "Which institution governs each didactical situation?"

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

The `didactic_institution_educational_actor_detail_view` links institutions to actors through the `institutions_actors` junction table. A row might show the `Pilot Initiative A` institution (type `ministry`) associated with a `student` from `pilot-institut-32`. This view answers: "Which actors are affiliated with each didactic institution?"

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

The `learning_outcome_didactical_situation_view` joins `learning_outcomes` with `didactical_situations` on `situation_id`. It produces rows such as an outcome with `assessment_score` 11.20 and `mastery_level` `novice` linked to the `Compact Initiative` situation. This view answers: "What learning outcomes have been recorded for each didactical situation?"

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

The `learning_outcome_mathematical_concept_view` joins `learning_outcomes` with `mathematical_concepts` on `mathematical_concept_id`. A row might show an outcome with `assessment_score` 14.40 and `mastery_level` `competent` linked to the concept `Pilot Initiative A` in the `geometry` domain. This view answers: "What learning outcomes have been recorded for each mathematical concept?"

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

The `learning_outcome_educational_actor_view` joins `learning_outcomes` with `educational_actors` on `actor_id`. It produces rows such as an outcome with `assessment_score` 17.60 and `mastery_level` `expert` linked to a `teacher` from `extended-institut-33` with 13 years of experience. This view answers: "What learning outcomes has each educational actor achieved?"

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

### Synthesis

The relational schema for the didactical situations domain is a carefully normalised structure that separates concerns into six base tables—situations, concepts, actors, instruments, institutions, and learning outcomes—connected by five junction tables that materialize many-to-many relationships. The primary key of `didactical_situations` serves as the central hub, with foreign keys in `didactic_instruments`, `didactic_institutions`, `educational_actors`, and `learning_outcomes` all pointing back to it. The `learning_outcomes` table is the most connected entity, carrying foreign keys to situations, concepts, and actors simultaneously, which makes it the natural pivot for assessment analytics.

The thirteen views reconstitute domain facts by joining these normalized tables along their foreign key relationships. Each view answers a specific analytical question by presenting a particular pair of entities in a single flat result set. The views fall into three categories: situation-centric views that start from `didactical_situations` and join to concepts, actors, or instruments; entity-centric views that start from other base tables and join back to situations; and outcome-centric views that start from `learning_outcomes` and join to the entities being assessed. This design ensures that the normalized schema supports both granular data management and high-level analytical queries without requiring the consumer to manually construct joins.

## Data appendix

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
