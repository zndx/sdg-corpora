## Ontology-Grounded Schema Design for Cognitive Training Research

The domain under examination models the lifecycle of cognitive training interventions as conducted by research institutions. At its core, the domain tracks how structured programs target specific cognitive capacities, how those capacities are assessed over time, and how neuroplasticity events provide biological grounding for observed outcomes. The ontology distinguishes five principal entity types — programs, capacities, assessments, institutions, and neuroplasticity events — and materializes their relationships through a combination of direct foreign keys and junction tables that enforce many-to-many cardinality. The resulting schema supports a family of eleven analytical views, each reconstructing a domain fact by joining normalized tables along the paths defined by the ontology.

**Table `cognitive_training_programs`**

| id | program_identifier | program_name | target_capacity | delivery_mode | target_population | evidence_level | launch_date | research_institution_id | cognitive_assessment_administrator_i_d |
|---|---|---|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | memory | online | healthyAging | preliminary | 2022-05-17T16:36:00 | 1 | ADM-2616 |
| 2 | PRO-2205 | Pilot Initiative A | processingSpeed | offline | corporateWellness | peerReviewed | 2023-10-01T23:53:00 | 2 | ADM-2622 |
| 3 | PRO-2212 | Baseline Model | decisionMaking | hybrid | clinicalCognitiveImpairment | clinicalTrial | 2024-03-12T06:10:00 | 3 | ADM-2628 |
| 4 | PRO-2219 | Distributed Cluster | multitasking | online | generalPerformance | preliminary | 2025-08-23T13:27:00 | 4 | ADM-2634 |

The `cognitive_training_programs` table anchors the program entity. Each row represents a distinct intervention, identified by a surrogate `id` and a human-readable `program_identifier` such as `PRO-2198` for the *Extended Review* program. The `program_name` column carries the display label, while `target_capacity` constrains the program to a single cognitive domain — values like `memory`, `processingSpeed`, `decisionMaking`, and `multitasking` appear across the four sample rows. The `delivery_mode` column distinguishes `online`, `offline`, and `hybrid` modalities, and `target_population` captures the intended cohort, ranging from `healthyAging` to `corporateWellness`, `clinicalCognitiveImpairment`, and `generalPerformance`. The `evidence_level` column encodes the maturity of the program's evidence base with values `preliminary`, `peerReviewed`, and `clinicalTrial`. Temporal grounding is provided by `launch_date`, and two foreign keys link the program to the wider ontology: `research_institution_id` references `research_institutions`, and `cognitive_assessment_administrator_i_d` references the administrator who oversees assessment administration.

**Table `cognitive_capacities`**

| cognitive_capacity_id | capacity_identifier | capacity_name | domain | baseline_score | improvement_threshold | assessment_method | cognitive_training_program_id |
|---|---|---|---|---|---|---|---|
| 1 | CAP-2248 | Adaptive Model | executive | 14.45 | 21.95 | distributed-assessme-18 | 1 |
| 2 | CAP-2253 | Primary Cluster | memory | 17.90 | 25.90 | baseline-assessme-19 | 2 |
| 3 | CAP-2258 | Composite Review D | perceptual | 21.35 | 29.85 | pilot-assessme-20 | 3 |
| 4 | CAP-2263 | Compact Initiative | attentional | 24.80 | 33.80 | extended-assessme-21 | 4 |

The `cognitive_capacities` table models the cognitive domains that programs aim to improve. Each capacity carries a `cognitive_capacity_id` surrogate key, a `capacity_identifier` such as `CAP-2248`, and a `capacity_name` like *Adaptive Model*. The `domain` column classifies the capacity into one of four cognitive families — `executive`, `memory`, `perceptual`, and `attentional` — which aligns with the `target_capacity` values in the programs table. Quantitative benchmarks are stored as `baseline_score` and `improvement_threshold`; for instance, the *Adaptive Model* capacity has a baseline of `14.45` and an improvement threshold of `21.95`, implying that a score gain of approximately 7.5 points would constitute meaningful progress. The `assessment_method` column records the instrument used, with values such as `distributed-assessme-18` and `baseline-assessme-19`. A direct foreign key `cognitive_training_program_id` links each capacity to the program that targets it, establishing a one-to-many relationship from programs to capacities.

**Table `cognitive_assessments`**

| assessment_identifier | assessment_name | administration_date | administrator_i_d | participant_i_d | score | status | cognitive_capacity_id | research_institution_id |
|---|---|---|---|---|---|---|---|---|
| ASS-2505 | Adaptive Series | 2022-01-20T00:48:00 | ADM-2616 | PAR-2485 | 9.20 | pending | 1 | 1 |
| ASS-2510 | Primary Assessment | 2023-06-04T07:05:00 | ADM-2622 | PAR-2490 | 13.40 | completed | 2 | 2 |
| ASS-2515 | Composite Survey D | 2024-11-15T14:22:00 | ADM-2628 | PAR-2495 | 17.60 | failed | 3 | 3 |
| ASS-2520 | Compact Corridor | 2025-04-26T21:39:00 | ADM-2634 | PAR-2500 | 21.80 | pending | 4 | 4 |

Assessments record the measurement events through which cognitive change is quantified. The `assessment_identifier` (e.g., `ASS-2505`) and `assessment_name` (e.g., *Adaptive Series*) provide human-readable identification, while `administration_date` timestamps the measurement. The `administrator_i_d` column (e.g., `ADM-2616`) identifies the person who administered the test, and `participant_i_d` (e.g., `PAR-2485`) identifies the subject. The `score` column stores the numeric result — values range from `9.20` to `21.80` across the sample — and `status` captures the outcome state with values `pending`, `completed`, and `failed`. Two foreign keys anchor the assessment to the ontology: `cognitive_capacity_id` links to the capacity being measured, and `research_institution_id` links to the institution that conducted the assessment.

**Table `research_institutions`**

| research_institution_id | institution_i_d | institution_name | location | founding_year | specialization | status |
|---|---|---|---|---|---|---|
| 1 | INS-2530 | Extended Corridor | extended-location-99 | 43 | neuroscience | active |
| 2 | INS-2531 | Pilot Series A | integrated-location-100 | 48 | cognitiveTraining | inactive |
| 3 | INS-2532 | Baseline Assessment | seasonal-location-101 | 53 | clinicalPsychology | active |
| 4 | INS-2533 | Distributed Survey | regional-location-102 | 58 | neuroscience | inactive |

The `research_institutions` table serves as the reference entity for organizations conducting the research. Each row is identified by `research_institution_id` and `institution_i_d` (e.g., `INS-2530`), with `institution_name` providing the display label — *Extended Corridor*, *Pilot Series A*, *Baseline Assessment*, and *Distributed Survey* appear in the sample data. The `location` column stores a descriptive location string, `founding_year` records the institution's age (values `43` through `58`), `specialization` captures the domain focus with values `neuroscience`, `cognitiveTraining`, and `clinicalPsychology`, and `status` indicates operational state as `active` or `inactive`. This table is referenced by foreign keys in `cognitive_training_programs`, `cognitive_assessments`, `neuroplasticity_events`, and the junction tables `institutions_programs` and `institutions_assessments`.

**Table `neuroplasticity_events`**

| event_i_d | event_date | brain_region | trigger_type | intensity | outcome | cognitive_capacity_id | research_institution_id |
|---|---|---|---|---|---|---|---|
| EVE-2327 | 2025-04-15T15:21:00 | frontalLobe | cognitiveTraining | 7.20 | enhanced | 1 | 1 |
| EVE-2333 | 2022-09-26T22:38:00 | hippocampus | aging | 9.40 | declined | 2 | 2 |
| EVE-2339 | 2023-02-10T05:55:00 | prefrontalCortex | stress | 11.60 | stable | 3 | 3 |
| EVE-2345 | 2024-07-21T12:12:00 | frontalLobe | learning | 13.80 | enhanced | 4 | 4 |

Neuroplasticity events provide the biological layer of the ontology, recording observable changes in brain structure or function. Each event carries an `event_i_d` (e.g., `EVE-2327`), an `event_date`, and a `brain_region` such as `frontalLobe`, `hippocampus`, or `prefrontalCortex`. The `trigger_type` column identifies the stimulus — values include `cognitiveTraining`, `aging`, `stress`, and `learning` — while `intensity` stores a numeric magnitude (ranging from `7.20` to `13.80`). The `outcome` column records the observed effect with values `enhanced`, `declined`, and `stable`. Two foreign keys link each event to the cognitive domain it pertains to (`cognitive_capacity_id`) and the institution responsible (`research_institution_id`).

The remaining base tables are junction tables that resolve many-to-many relationships which cannot be expressed through direct foreign keys alone.

**Table `programs_capacities`**

| cognitive_training_program_id | cognitive_capacity_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `programs_capacities` junction table resolves the many-to-many relationship between `cognitive_training_programs` and `cognitive_capacities`. While the `cognitive_capacities` table contains a direct foreign key `cognitive_training_program_id` that establishes a one-to-many link from programs to their primary target capacity, the junction table allows a single program to be associated with multiple capacities and a single capacity to be targeted by multiple programs. The sample data shows that program `1` (Extended Review) is linked to capacities `1` and `2`, program `2` (Pilot Initiative A) to capacities `2` and `3`, and so on, forming a chain of cross-references that reflects the multidimensional nature of cognitive training.

**Table `capacities_assessments`**

| cognitive_capacity_id | cognitive_assessment_administrator_i_d |
|---|---|
| 1 | ADM-2616 |
| 1 | ADM-2622 |
| 2 | ADM-2622 |
| 2 | ADM-2628 |
| 3 | ADM-2628 |
| 3 | ADM-2634 |
| 4 | ADM-2634 |
| 4 | ADM-2616 |

The `capacities_assessments` junction table resolves the many-to-many relationship between `cognitive_capacities` and `cognitive_assessments`. This allows a single capacity to be measured by multiple assessments and a single assessment to evaluate multiple capacities. The table's structure mirrors that of `programs_capacities`, with two foreign key columns referencing the respective parent tables.

**Table `institutions_programs`**

| research_institution_id | cognitive_training_program_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `institutions_programs` junction table resolves the many-to-many relationship between `research_institutions` and `cognitive_training_programs`. Although `cognitive_training_programs` contains a direct foreign key `research_institution_id`, this junction table enables collaborative programs spanning multiple institutions and programs operated by multiple institutions over time.

**Table `institutions_assessments`**

| research_institution_id | cognitive_assessment_administrator_i_d |
|---|---|
| 1 | ADM-2616 |
| 1 | ADM-2622 |
| 2 | ADM-2622 |
| 2 | ADM-2628 |
| 3 | ADM-2628 |
| 3 | ADM-2634 |
| 4 | ADM-2634 |
| 4 | ADM-2616 |

The `institutions_assessments` junction table resolves the many-to-many relationship between `research_institutions` and `cognitive_assessments`. Like the other junction tables, it provides additional cardinality flexibility beyond the direct foreign key present in `cognitive_assessments`.

With the base schema established, the eleven views materialize domain facts by joining these tables along the ontology's relationship paths. Each view answers a specific analytical question by denormalizing the normalized structure.

**View `cognitive_training_program_cognitive_capacity_detail_view`**

```sql
CREATE VIEW cognitive_training_program_cognitive_capacity_detail_view AS
SELECT a.id, a.program_identifier, a.program_name, b.cognitive_capacity_id AS capacity_cognitive_capacity_id, b.capacity_identifier AS capacity_capacity_identifier, b.capacity_name AS capacity_capacity_name
FROM cognitive_training_programs a
  JOIN programs_capacities j ON j.cognitive_training_program_id = a.id
  JOIN cognitive_capacities b ON b.cognitive_capacity_id = j.cognitive_capacity_id;
```

| id | program_identifier | program_name | capacity_cognitive_capacity_id | capacity_capacity_identifier | capacity_capacity_name |
|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 1 | CAP-2248 | Adaptive Model |
| 1 | PRO-2198 | Extended Review | 2 | CAP-2253 | Primary Cluster |
| 2 | PRO-2205 | Pilot Initiative A | 2 | CAP-2253 | Primary Cluster |
| 2 | PRO-2205 | Pilot Initiative A | 3 | CAP-2258 | Composite Review D |
| 3 | PRO-2212 | Baseline Model | 3 | CAP-2258 | Composite Review D |
| 3 | PRO-2212 | Baseline Model | 4 | CAP-2263 | Compact Initiative |
| 4 | PRO-2219 | Distributed Cluster | 4 | CAP-2263 | Compact Initiative |
| 4 | PRO-2219 | Distributed Cluster | 1 | CAP-2248 | Adaptive Model |

This view reconstructs the program-to-capacity relationship by joining `cognitive_training_programs` with `cognitive_capacities` through the `programs_capacities` junction table. It answers the question: *Which cognitive capacities does each program target, and what are their baseline and threshold values?* The row for program `PRO-2198` (Extended Review) joined with capacity `CAP-2248` (Adaptive Model) reveals that this program targets an executive-domain capacity with a baseline score of `14.45` and an improvement threshold of `21.95`. The view makes explicit the quantitative targets that each program is designed to achieve.

**View `cognitive_training_program_research_institution_view`**

```sql
CREATE VIEW cognitive_training_program_research_institution_view AS
SELECT a.id, a.program_identifier, a.program_name, a.target_capacity, b.research_institution_id AS institution_research_institution_id, b.institution_i_d AS institution_institution_i_d, b.institution_name AS institution_institution_name
FROM cognitive_training_programs a JOIN research_institutions b ON a.research_institution_id = b.research_institution_id;
```

| id | program_identifier | program_name | target_capacity | institution_research_institution_id | institution_institution_i_d | institution_institution_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | memory | 1 | INS-2530 | Extended Corridor |
| 2 | PRO-2205 | Pilot Initiative A | processingSpeed | 2 | INS-2531 | Pilot Series A |
| 3 | PRO-2212 | Baseline Model | decisionMaking | 3 | INS-2532 | Baseline Assessment |
| 4 | PRO-2219 | Distributed Cluster | multitasking | 4 | INS-2533 | Distributed Survey |

This view joins `cognitive_training_programs` with `research_institutions` to answer: *Which institution sponsors or operates each cognitive training program?* The row pairing program `PRO-2205` (Pilot Initiative A) with institution `INS-2531` (Pilot Series A) demonstrates the institutional sponsorship relationship. The view surfaces the `specialization` and `status` columns from the institutions table, allowing analysts to filter programs by institutional focus — for example, identifying all programs run by institutions specializing in `neuroscience`.

**View `cognitive_training_program_cognitive_assessment_view`**

```sql
CREATE VIEW cognitive_training_program_cognitive_assessment_view AS
SELECT a.id, a.program_identifier, a.program_name, a.target_capacity, b.assessment_identifier AS assessment_assessment_identifier, b.assessment_name AS assessment_assessment_name, b.administration_date AS assessment_administration_date
FROM cognitive_training_programs a JOIN cognitive_assessments b ON a.cognitive_assessment_administrator_i_d = b.administrator_i_d;
```

| id | program_identifier | program_name | target_capacity | assessment_assessment_identifier | assessment_assessment_name | assessment_administration_date |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | memory | ASS-2505 | Adaptive Series | 2022-01-20T00:48:00 |
| 2 | PRO-2205 | Pilot Initiative A | processingSpeed | ASS-2510 | Primary Assessment | 2023-06-04T07:05:00 |
| 3 | PRO-2212 | Baseline Model | decisionMaking | ASS-2515 | Composite Survey D | 2024-11-15T14:22:00 |
| 4 | PRO-2219 | Distributed Cluster | multitasking | ASS-2520 | Compact Corridor | 2025-04-26T21:39:00 |

This view joins `cognitive_training_programs` with `cognitive_assessments` through the `programs_capacities` and `capacities_assessments` junction tables, answering: *Which assessments are associated with each program via the capacities they target?* The row for program `PRO-2198` joined with assessment `ASS-2505` (Adaptive Series) shows that this assessment, with a score of `9.20` and status `pending`, is linked to the program through the shared capacity `CAP-2248`. The view enables program-level evaluation of assessment outcomes.

**View `cognitive_capacity_cognitive_assessment_detail_view`**

```sql
CREATE VIEW cognitive_capacity_cognitive_assessment_detail_view AS
SELECT a.cognitive_capacity_id, a.capacity_identifier, a.capacity_name, b.assessment_identifier AS assessment_assessment_identifier, b.assessment_name AS assessment_assessment_name, b.administration_date AS assessment_administration_date
FROM cognitive_capacities a
  JOIN capacities_assessments j ON j.cognitive_capacity_id = a.cognitive_capacity_id
  JOIN cognitive_assessments b ON b.administrator_i_d = j.cognitive_assessment_administrator_i_d;
```

| cognitive_capacity_id | capacity_identifier | capacity_name | assessment_assessment_identifier | assessment_assessment_name | assessment_administration_date |
|---|---|---|---|---|---|
| 1 | CAP-2248 | Adaptive Model | ASS-2505 | Adaptive Series | 2022-01-20T00:48:00 |
| 1 | CAP-2248 | Adaptive Model | ASS-2510 | Primary Assessment | 2023-06-04T07:05:00 |
| 2 | CAP-2253 | Primary Cluster | ASS-2510 | Primary Assessment | 2023-06-04T07:05:00 |
| 2 | CAP-2253 | Primary Cluster | ASS-2515 | Composite Survey D | 2024-11-15T14:22:00 |
| 3 | CAP-2258 | Composite Review D | ASS-2515 | Composite Survey D | 2024-11-15T14:22:00 |
| 3 | CAP-2258 | Composite Review D | ASS-2520 | Compact Corridor | 2025-04-26T21:39:00 |
| 4 | CAP-2263 | Compact Initiative | ASS-2520 | Compact Corridor | 2025-04-26T21:39:00 |
| 4 | CAP-2263 | Compact Initiative | ASS-2505 | Adaptive Series | 2022-01-20T00:48:00 |

This view joins `cognitive_capacities` with `cognitive_assessments` through the `capacities_assessments` junction table, answering: *For each capacity, what are the assessment results and their current status?* The row pairing capacity `CAP-2253` (Primary Cluster) with assessment `ASS-2510` (Primary Assessment) reveals a score of `13.40` and a `completed` status. By comparing the assessment score against the capacity's `improvement_threshold` of `25.90`, analysts can determine whether the target has been met.

**View `cognitive_capacity_cognitive_training_program_view`**

```sql
CREATE VIEW cognitive_capacity_cognitive_training_program_view AS
SELECT a.cognitive_capacity_id, a.capacity_identifier, a.capacity_name, a.domain, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM cognitive_capacities a JOIN cognitive_training_programs b ON a.cognitive_training_program_id = b.id;
```

| cognitive_capacity_id | capacity_identifier | capacity_name | domain | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1 | CAP-2248 | Adaptive Model | executive | 1 | PRO-2198 | Extended Review |
| 2 | CAP-2253 | Primary Cluster | memory | 2 | PRO-2205 | Pilot Initiative A |
| 3 | CAP-2258 | Composite Review D | perceptual | 3 | PRO-2212 | Baseline Model |
| 4 | CAP-2263 | Compact Initiative | attentional | 4 | PRO-2219 | Distributed Cluster |

This view joins `cognitive_capacities` with `cognitive_training_programs` through the `programs_capacities` junction table, answering: *Which programs target each cognitive capacity, and what are their delivery modes and evidence levels?* The row for capacity `CAP-2258` (Composite Review D) joined with program `PRO-2212` (Baseline Model) shows a `hybrid` delivery mode and `clinicalTrial` evidence level. This view supports capacity-centric analysis, allowing researchers to compare the programs designed to improve the same cognitive domain.

**View `cognitive_assessment_cognitive_capacity_view`**

```sql
CREATE VIEW cognitive_assessment_cognitive_capacity_view AS
SELECT a.assessment_identifier, a.assessment_name, a.administration_date, a.administrator_i_d, b.cognitive_capacity_id AS capacity_cognitive_capacity_id, b.capacity_identifier AS capacity_capacity_identifier, b.capacity_name AS capacity_capacity_name
FROM cognitive_assessments a JOIN cognitive_capacities b ON a.cognitive_capacity_id = b.cognitive_capacity_id;
```

| assessment_identifier | assessment_name | administration_date | administrator_i_d | capacity_cognitive_capacity_id | capacity_capacity_identifier | capacity_capacity_name |
|---|---|---|---|---|---|---|
| ASS-2505 | Adaptive Series | 2022-01-20T00:48:00 | ADM-2616 | 1 | CAP-2248 | Adaptive Model |
| ASS-2510 | Primary Assessment | 2023-06-04T07:05:00 | ADM-2622 | 2 | CAP-2253 | Primary Cluster |
| ASS-2515 | Composite Survey D | 2024-11-15T14:22:00 | ADM-2628 | 3 | CAP-2258 | Composite Review D |
| ASS-2520 | Compact Corridor | 2025-04-26T21:39:00 | ADM-2634 | 4 | CAP-2263 | Compact Initiative |

This view joins `cognitive_assessments` with `cognitive_capacities` through the `capacities_assessments` junction table, answering: *For each assessment, which capacity does it measure and what is the capacity's domain classification?* The row pairing assessment `ASS-2515` (Composite Survey D) with capacity `CAP-2258` (Composite Review D) reveals that this assessment targets a `perceptual`-domain capacity. The view enables assessment-centric queries about the cognitive domains being evaluated.

**View `cognitive_assessment_research_institution_view`**

```sql
CREATE VIEW cognitive_assessment_research_institution_view AS
SELECT a.assessment_identifier, a.assessment_name, a.administration_date, a.administrator_i_d, b.research_institution_id AS institution_research_institution_id, b.institution_i_d AS institution_institution_i_d, b.institution_name AS institution_institution_name
FROM cognitive_assessments a JOIN research_institutions b ON a.research_institution_id = b.research_institution_id;
```

| assessment_identifier | assessment_name | administration_date | administrator_i_d | institution_research_institution_id | institution_institution_i_d | institution_institution_name |
|---|---|---|---|---|---|---|
| ASS-2505 | Adaptive Series | 2022-01-20T00:48:00 | ADM-2616 | 1 | INS-2530 | Extended Corridor |
| ASS-2510 | Primary Assessment | 2023-06-04T07:05:00 | ADM-2622 | 2 | INS-2531 | Pilot Series A |
| ASS-2515 | Composite Survey D | 2024-11-15T14:22:00 | ADM-2628 | 3 | INS-2532 | Baseline Assessment |
| ASS-2520 | Compact Corridor | 2025-04-26T21:39:00 | ADM-2634 | 4 | INS-2533 | Distributed Survey |

This view joins `cognitive_assessments` with `research_institutions` through the `institutions_assessments` junction table, answering: *Which institution conducted each assessment?* The row for assessment `ASS-2520` (Compact Corridor) joined with institution `INS-2533` (Distributed Survey) shows that this assessment was conducted by an institution with `neuroscience` specialization that is currently `inactive`. The view supports institutional accountability and provenance tracking.

**View `research_institution_cognitive_training_program_detail_view`**

```sql
CREATE VIEW research_institution_cognitive_training_program_detail_view AS
SELECT a.research_institution_id, a.institution_i_d, a.institution_name, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM research_institutions a
  JOIN institutions_programs j ON j.research_institution_id = a.research_institution_id
  JOIN cognitive_training_programs b ON b.id = j.cognitive_training_program_id;
```

| research_institution_id | institution_i_d | institution_name | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|
| 1 | INS-2530 | Extended Corridor | 1 | PRO-2198 | Extended Review |
| 1 | INS-2530 | Extended Corridor | 2 | PRO-2205 | Pilot Initiative A |
| 2 | INS-2531 | Pilot Series A | 2 | PRO-2205 | Pilot Initiative A |
| 2 | INS-2531 | Pilot Series A | 3 | PRO-2212 | Baseline Model |
| 3 | INS-2532 | Baseline Assessment | 3 | PRO-2212 | Baseline Model |
| 3 | INS-2532 | Baseline Assessment | 4 | PRO-2219 | Distributed Cluster |
| 4 | INS-2533 | Distributed Survey | 4 | PRO-2219 | Distributed Cluster |
| 4 | INS-2533 | Distributed Survey | 1 | PRO-2198 | Extended Review |

This view joins `research_institutions` with `cognitive_training_programs` through the `institutions_programs` junction table, answering: *Which programs are associated with each research institution, and what are their target populations and evidence levels?* The row pairing institution `INS-2532` (Baseline Assessment) with program `PRO-2212` (Baseline Model) reveals a `clinicalCognitiveImpairment` target population and `clinicalTrial` evidence level. This view supports institutional portfolio analysis.

**View `research_institution_cognitive_assessment_detail_view`**

```sql
CREATE VIEW research_institution_cognitive_assessment_detail_view AS
SELECT a.research_institution_id, a.institution_i_d, a.institution_name, b.assessment_identifier AS assessment_assessment_identifier, b.assessment_name AS assessment_assessment_name, b.administration_date AS assessment_administration_date
FROM research_institutions a
  JOIN institutions_assessments j ON j.research_institution_id = a.research_institution_id
  JOIN cognitive_assessments b ON b.administrator_i_d = j.cognitive_assessment_administrator_i_d;
```

| research_institution_id | institution_i_d | institution_name | assessment_assessment_identifier | assessment_assessment_name | assessment_administration_date |
|---|---|---|---|---|---|
| 1 | INS-2530 | Extended Corridor | ASS-2505 | Adaptive Series | 2022-01-20T00:48:00 |
| 1 | INS-2530 | Extended Corridor | ASS-2510 | Primary Assessment | 2023-06-04T07:05:00 |
| 2 | INS-2531 | Pilot Series A | ASS-2510 | Primary Assessment | 2023-06-04T07:05:00 |
| 2 | INS-2531 | Pilot Series A | ASS-2515 | Composite Survey D | 2024-11-15T14:22:00 |
| 3 | INS-2532 | Baseline Assessment | ASS-2515 | Composite Survey D | 2024-11-15T14:22:00 |
| 3 | INS-2532 | Baseline Assessment | ASS-2520 | Compact Corridor | 2025-04-26T21:39:00 |
| 4 | INS-2533 | Distributed Survey | ASS-2520 | Compact Corridor | 2025-04-26T21:39:00 |
| 4 | INS-2533 | Distributed Survey | ASS-2505 | Adaptive Series | 2022-01-20T00:48:00 |

This view joins `research_institutions` with `cognitive_assessments` through the `institutions_assessments` junction table, answering: *Which assessments has each institution conducted, and what are their scores and statuses?* The row for institution `INS-2530` (Extended Corridor) joined with assessment `ASS-2505` (Adaptive Series) shows a `pending` status and a score of `9.20`. The view enables institution-level performance monitoring.

**View `neuroplasticity_event_cognitive_capacity_view`**

```sql
CREATE VIEW neuroplasticity_event_cognitive_capacity_view AS
SELECT a.event_i_d, a.event_date, a.brain_region, a.trigger_type, b.cognitive_capacity_id AS capacity_cognitive_capacity_id, b.capacity_identifier AS capacity_capacity_identifier, b.capacity_name AS capacity_capacity_name
FROM neuroplasticity_events a JOIN cognitive_capacities b ON a.cognitive_capacity_id = b.cognitive_capacity_id;
```

| event_i_d | event_date | brain_region | trigger_type | capacity_cognitive_capacity_id | capacity_capacity_identifier | capacity_capacity_name |
|---|---|---|---|---|---|---|
| EVE-2327 | 2025-04-15T15:21:00 | frontalLobe | cognitiveTraining | 1 | CAP-2248 | Adaptive Model |
| EVE-2333 | 2022-09-26T22:38:00 | hippocampus | aging | 2 | CAP-2253 | Primary Cluster |
| EVE-2339 | 2023-02-10T05:55:00 | prefrontalCortex | stress | 3 | CAP-2258 | Composite Review D |
| EVE-2345 | 2024-07-21T12:12:00 | frontalLobe | learning | 4 | CAP-2263 | Compact Initiative |

This view joins `neuroplasticity_events` with `cognitive_capacities`, answering: *For each neuroplasticity event, which cognitive capacity is affected and what is the observed outcome?* The row for event `EVE-2327` (triggered by `cognitiveTraining` in the `frontalLobe` with intensity `7.20`) joined with capacity `CAP-2248` (Adaptive Model) shows an `enhanced` outcome. This view bridges the biological and cognitive layers of the ontology, allowing researchers to correlate brain-level changes with specific cognitive domains.

**View `neuroplasticity_event_research_institution_view`**

```sql
CREATE VIEW neuroplasticity_event_research_institution_view AS
SELECT a.event_i_d, a.event_date, a.brain_region, a.trigger_type, b.research_institution_id AS institution_research_institution_id, b.institution_i_d AS institution_institution_i_d, b.institution_name AS institution_institution_name
FROM neuroplasticity_events a JOIN research_institutions b ON a.research_institution_id = b.research_institution_id;
```

| event_i_d | event_date | brain_region | trigger_type | institution_research_institution_id | institution_institution_i_d | institution_institution_name |
|---|---|---|---|---|---|---|
| EVE-2327 | 2025-04-15T15:21:00 | frontalLobe | cognitiveTraining | 1 | INS-2530 | Extended Corridor |
| EVE-2333 | 2022-09-26T22:38:00 | hippocampus | aging | 2 | INS-2531 | Pilot Series A |
| EVE-2339 | 2023-02-10T05:55:00 | prefrontalCortex | stress | 3 | INS-2532 | Baseline Assessment |
| EVE-2345 | 2024-07-21T12:12:00 | frontalLobe | learning | 4 | INS-2533 | Distributed Survey |

This view joins `neuroplasticity_events` with `research_institutions`, answering: *Which institution is associated with each neuroplasticity event, and what is the event's brain region and outcome?* The row for event `EVE-2333` (triggered by `aging` in the `hippocampus` with intensity `9.40`) joined with institution `INS-2531` (Pilot Series A) shows a `declined` outcome. This view supports institutional tracking of biological research outcomes.

The schema design reflects a deliberate balance between normalization and analytical accessibility. The five base tables capture the core ontology entities with their attributes, while the four junction tables resolve many-to-many relationships that the direct foreign keys in the entity tables cannot express. The eleven views materialize the most common analytical queries by joining along the ontology's relationship paths, denormalizing the schema just enough to answer domain-specific questions without requiring ad-hoc SQL from end users. This architecture ensures that the relational model remains faithful to the underlying ontology while providing efficient access patterns for the research workflows that the domain supports.