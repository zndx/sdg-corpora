## Modelling Capacity, Best Interest, and Intervention in a Relational Schema

The domain under examination concerns the governance of decision-making capacity for individuals who may lack the ability to make autonomous choices about their medical, financial, residential, or social welfare. A capacity assessment determines whether a person can decide for themselves; a best interest determination identifies the least restrictive alternative when capacity is absent; and an intervention records the concrete action taken in response. These three decision artefacts—assessments, determinations, and interventions—are anchored to individuals, contextualised by decision contexts, and overseen by legal representatives. The relational schema captures this structure through six base tables, six junction tables that resolve many-to-many relationships, and twenty views that materialise domain facts as flat, queryable surfaces.

### Base Entities and Their Attributes

The `individuals` table is the central person entity. Each row carries an `individual_id` surrogate key, a human-readable `individual_identifier` such as `IND-2258`, a `date_of_birth`, a `legal_status` drawn from the set {`adult`, `minor`, `vulnerable`}, a `primary_language` like `primary-primary-10`, `communication_needs` such as `integrated-communic-16`, and a foreign key `legal_representative_id` pointing to the `legal_representatives` table. The four individuals in the dataset span the full legal-status spectrum: `IND-2258` is an adult, `IND-2262` a minor, `IND-2266` classified as vulnerable, and `IND-2270` an adult again.

**Table `individuals`**

| individual_id | individual_identifier | date_of_birth | legal_status | primary_language | communication_needs | legal_representative_id |
|---|---|---|---|---|---|---|
| 1 | IND-2258 | 2025-04-02 | adult | primary-primary-10 | integrated-communic-16 | 1 |
| 2 | IND-2262 | 2022-09-13 | minor | adaptive-primary-11 | seasonal-communic-17 | 2 |
| 3 | IND-2266 | 2023-02-24 | vulnerable | distributed-primary-12 | regional-communic-18 | 3 |
| 4 | IND-2270 | 2024-07-08 | adult | baseline-primary-13 | legacy-communic-19 | 4 |

The `legal_representatives` table stores the persons authorised to act on behalf of an individual. Its primary key is `legal_representative_id`, complemented by `representative_identifier` (e.g. `REP-2553`), `relationship_type` (parent, spouse, sibling, guardian), `authorization_date`, `scope_of_authority` (healthcare, financial, personalWelfare, all), and `contact_information` (Bobby Flores, Stephanie Lawrence, Robert Watts, Helen Keller). Each representative is linked to exactly one individual via `individual_id`, forming a one-to-many relationship: one individual may have one or more representatives, but each representative row belongs to a single individual.

**Table `legal_representatives`**

| legal_representative_id | representative_identifier | relationship_type | authorization_date | scope_of_authority | contact_information | individual_id |
|---|---|---|---|---|---|---|
| 1 | REP-2553 | parent | 2022-05-19T16:24:00 | healthcare | Bobby Flores | 1 |
| 2 | REP-2557 | spouse | 2023-10-03T23:41:00 | financial | Stephanie Lawrence | 2 |
| 3 | REP-2561 | sibling | 2024-03-14T06:58:00 | personalWelfare | Robert Watts | 3 |
| 4 | REP-2565 | guardian | 2025-08-25T13:15:00 | all | Helen Keller | 4 |

The `decision_contexts` table captures the situational backdrop against which a decision is made. Its surrogate key is `decision_context_id`, with `context_identifier` (e.g. `CON-2525`), `decision_category` (medical, financial, residential, social), `urgency_level` (emergency, urgent, routine, planned), `risk_level` (high, medium, low, negligible), and a free-text `description` (Extended Survey, Pilot Corridor A, Baseline Series, Distributed Assessment). Each context references a single capacity assessment and a single best interest determination through `capacity_assessment_id` and `best_interest_determination_id`, respectively, anchoring the context to both decision artefacts.

**Table `decision_contexts`**

| decision_context_id | context_identifier | decision_category | urgency_level | risk_level | description | capacity_assessment_id | best_interest_determination_id |
|---|---|---|---|---|---|---|---|
| 1000 | CON-2525 | medical | emergency | high | Extended Survey | 1 | 1 |
| 1001 | CON-2526 | financial | urgent | medium | Pilot Corridor A | 2 | 2 |
| 1002 | CON-2527 | residential | routine | low | Baseline Series | 3 | 3 |
| 1003 | CON-2528 | social | planned | negligible | Distributed Assessment | 4 | 4 |

The `capacity_assessments` table records the clinical or professional evaluation of an individual's capacity at a point in time. Its primary key is `id`, with `assessment_identifier` (e.g. `ASS-2505`), `assessment_date`, `decision_topic` (pilot-decision-20, extended-decision-21, integrated-decision-22, seasonal-decision-23), `assessor_role` (clinician, socialWorker, legalAdvocate, guardian), `outcome` (hasCapacity, lacksCapacity, fluctuatingCapacity), `support_provided` (a boolean), and foreign keys `individual_id`, `decision_context_id`, and `best_interest_determination_id`. The outcome column is cardinality-bounded to three discrete values, and the boolean `support_provided` indicates whether auxiliary support was offered during the assessment.

**Table `capacity_assessments`**

| id | assessment_identifier | assessment_date | decision_topic | assessor_role | outcome | support_provided | individual_id | decision_context_id | best_interest_determination_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ASS-2505 | 2022-05-10T04:24:00 | pilot-decision-20 | clinician | hasCapacity | false | 1 | 1000 | 1 |
| 2 | ASS-2510 | 2023-10-21T11:41:00 | extended-decision-21 | socialWorker | lacksCapacity | true | 2 | 1001 | 2 |
| 3 | ASS-2515 | 2024-03-05T18:58:00 | integrated-decision-22 | legalAdvocate | fluctuatingCapacity | false | 3 | 1002 | 3 |
| 4 | ASS-2520 | 2025-08-16T01:15:00 | seasonal-decision-23 | guardian | hasCapacity | true | 4 | 1003 | 4 |

The `best_interest_determinations` table documents the formal determination of what course of action serves the individual's best interests when capacity is lacking. Its primary key is `id`, with `determination_identifier` (e.g. `DET-2083`), `determination_date`, `least_restrictive_option` (a boolean), `consultation_participants` (legacy-consulta-67, compact-consulta-68, composite-consulta-69, primary-consulta-70), `outcome_description` (Legacy Assessment D, Regional Survey, Seasonal Corridor, Integrated Series A), `review_date`, and foreign keys `individual_id`, `decision_context_id`, and `legal_representative_id`. The `least_restrictive_option` flag is a critical domain concept: it records whether the chosen intervention imposes the minimum necessary restriction on the individual's autonomy.

**Table `best_interest_determinations`**

| id | determination_identifier | determination_date | least_restrictive_option | consultation_participants | outcome_description | review_date | individual_id | decision_context_id | legal_representative_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | DET-2083 | 2022-09-06T08:36:00 | true | legacy-consulta-67 | Legacy Assessment D | 2024-11-03T22:54:00 | 1 | 1000 | 1 |
| 2 | DET-2085 | 2023-02-17T15:53:00 | false | compact-consulta-68 | Regional Survey | 2025-04-14T05:11:00 | 2 | 1001 | 2 |
| 3 | DET-2087 | 2024-07-01T22:10:00 | true | composite-consulta-69 | Seasonal Corridor | 2022-09-25T12:28:00 | 3 | 1002 | 3 |
| 4 | DET-2089 | 2025-12-12T05:27:00 | false | primary-consulta-70 | Integrated Series A | 2023-02-09T19:45:00 | 4 | 1003 | 4 |

The `interventions` table records the concrete actions taken—medical treatment, financial transactions, placements, or care plans. Its primary key is `id`, with `intervention_identifier` (e.g. `INT-2732`), `intervention_type` (medicalTreatment, financialTransaction, placement, carePlan), `start_date`, `end_date`, `restrictiveness_level` (minimal, moderate, high, maximum), `status` (planned, active, completed, discontinued), and foreign keys `individual_id`, `best_interest_determination_id`, and `decision_context_id`. The `restrictiveness_level` is a cardinality-bounded ordinal attribute that maps directly to the degree of autonomy restriction, while `status` tracks the lifecycle of the intervention.

**Table `interventions`**

| id | intervention_identifier | intervention_type | start_date | end_date | restrictiveness_level | status | individual_id | best_interest_determination_id | decision_context_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | INT-2732 | medicalTreatment | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | minimal | planned | 1 | 1 | 1000 |
| 2 | INT-2733 | financialTransaction | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | moderate | active | 2 | 2 | 1001 |
| 3 | INT-2734 | placement | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | high | completed | 3 | 3 | 1002 |
| 4 | INT-2735 | carePlan | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | maximum | discontinued | 4 | 4 | 1003 |

### Junction Tables and Many-to-Many Relationships

The six junction tables resolve relationships that cannot be expressed as simple foreign keys on the base tables. In the capacity assessment domain, an individual may participate in multiple assessments over time, and a single assessment may involve multiple individuals (e.g. in family or group decision contexts). The `individuals_assessments` junction table captures this many-to-many relationship with composite keys `individual_id` and `assessment_id`.

**Table `individuals_assessments`**

| individual_id | capacity_assessment_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Similarly, an individual may be subject to multiple best interest determinations across different decision contexts or over time, and a determination may involve multiple individuals. The `individuals_determinations` junction table resolves this relationship with `individual_id` and `determination_id`.

**Table `individuals_determinations`**

| individual_id | best_interest_determination_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Decision contexts and interventions share a many-to-many relationship: a single context may spawn multiple interventions, and an intervention may span multiple contexts. The `contexts_interventions` junction table captures this with `decision_context_id` and `intervention_id`.

**Table `contexts_interventions`**

| decision_context_id | intervention_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

Best interest determinations and interventions are similarly related through `determinations_interventions`, with `determination_id` and `intervention_id` forming the composite key. A determination may authorise multiple interventions, and an intervention may be justified by multiple determinations.

**Table `determinations_interventions`**

| best_interest_determination_id | intervention_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Legal representatives and best interest determinations are linked through `representatives_determinations`, with `legal_representative_id` and `determination_id`. A representative may participate in multiple determinations, and a determination may involve multiple representatives (e.g. co-guardians).

**Table `representatives_determinations`**

| legal_representative_id | best_interest_determination_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

Finally, legal representatives and interventions are connected through `representatives_interventions`, with `legal_representative_id` and `intervention_id`. This allows tracking which representative authorised or oversaw each intervention, independent of the determination that justified it.

**Table `representatives_interventions`**

| legal_representative_id | intervention_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

### Views as Reconstructed Domain Facts

The twenty views materialise the normalised schema into flat, queryable surfaces. Each view joins the relevant base and junction tables to answer a specific domain question.

The `capacity_assessment_individual_view` joins `capacity_assessments` with `individuals` to answer: "What capacity assessment was performed on which individual, and what are the individual's demographic details?" A row from this view might show `ASS-2505` assessed `IND-2258`, an adult born on 2025-04-02, with outcome `hasCapacity` and assessor role `clinician`.

**View `capacity_assessment_individual_view`**

```sql
CREATE VIEW capacity_assessment_individual_view AS
SELECT a.id, a.assessment_identifier, a.assessment_date, a.decision_topic, b.individual_id AS individual_individual_id, b.individual_identifier AS individual_individual_identifier, b.date_of_birth AS individual_date_of_birth
FROM capacity_assessments a JOIN individuals b ON a.individual_id = b.individual_id;
```

| id | assessment_identifier | assessment_date | decision_topic | individual_individual_id | individual_individual_identifier | individual_date_of_birth |
|---|---|---|---|---|---|---|
| 1 | ASS-2505 | 2022-05-10T04:24:00 | pilot-decision-20 | 1 | IND-2258 | 2025-04-02 |
| 2 | ASS-2510 | 2023-10-21T11:41:00 | extended-decision-21 | 2 | IND-2262 | 2022-09-13 |
| 3 | ASS-2515 | 2024-03-05T18:58:00 | integrated-decision-22 | 3 | IND-2266 | 2023-02-24 |
| 4 | ASS-2520 | 2025-08-16T01:15:00 | seasonal-decision-23 | 4 | IND-2270 | 2024-07-08 |

The `capacity_assessment_decision_context_view` joins `capacity_assessments` with `decision_contexts` to answer: "In which decision context was a capacity assessment performed, and what are the context's urgency and risk characteristics?" A row might show `ASS-2505` assessed within context `CON-2525`, a medical decision with emergency urgency and high risk, described as "Extended Survey".

**View `capacity_assessment_decision_context_view`**

```sql
CREATE VIEW capacity_assessment_decision_context_view AS
SELECT a.id, a.assessment_identifier, a.assessment_date, a.decision_topic, b.decision_context_id AS context_decision_context_id, b.context_identifier AS context_context_identifier, b.decision_category AS context_decision_category
FROM capacity_assessments a JOIN decision_contexts b ON a.decision_context_id = b.decision_context_id;
```

| id | assessment_identifier | assessment_date | decision_topic | context_decision_context_id | context_context_identifier | context_decision_category |
|---|---|---|---|---|---|---|
| 1 | ASS-2505 | 2022-05-10T04:24:00 | pilot-decision-20 | 1000 | CON-2525 | medical |
| 2 | ASS-2510 | 2023-10-21T11:41:00 | extended-decision-21 | 1001 | CON-2526 | financial |
| 3 | ASS-2515 | 2024-03-05T18:58:00 | integrated-decision-22 | 1002 | CON-2527 | residential |
| 4 | ASS-2520 | 2025-08-16T01:15:00 | seasonal-decision-23 | 1003 | CON-2528 | social |

The `capacity_assessment_best_interest_determination_view` joins `capacity_assessments` with `best_interest_determinations` to answer: "Which best interest determination is associated with a given capacity assessment?" A row might show `ASS-2505` linked to `DET-2083`, a determination with outcome description "Legacy Assessment D" and least restrictive option set to true.

**View `capacity_assessment_best_interest_determination_view`**

```sql
CREATE VIEW capacity_assessment_best_interest_determination_view AS
SELECT a.id, a.assessment_identifier, a.assessment_date, a.decision_topic, b.id AS determination_id, b.determination_identifier AS determination_determination_identifier, b.determination_date AS determination_determination_date
FROM capacity_assessments a JOIN best_interest_determinations b ON a.best_interest_determination_id = b.id;
```

| id | assessment_identifier | assessment_date | decision_topic | determination_id | determination_determination_identifier | determination_determination_date |
|---|---|---|---|---|---|---|
| 1 | ASS-2505 | 2022-05-10T04:24:00 | pilot-decision-20 | 1 | DET-2083 | 2022-09-06T08:36:00 |
| 2 | ASS-2510 | 2023-10-21T11:41:00 | extended-decision-21 | 2 | DET-2085 | 2023-02-17T15:53:00 |
| 3 | ASS-2515 | 2024-03-05T18:58:00 | integrated-decision-22 | 3 | DET-2087 | 2024-07-01T22:10:00 |
| 4 | ASS-2520 | 2025-08-16T01:15:00 | seasonal-decision-23 | 4 | DET-2089 | 2025-12-12T05:27:00 |

The `individual_capacity_assessment_detail_view` joins `individuals` with `capacity_assessments` to answer: "What is the full profile of an individual including all their capacity assessments?" A row might show `IND-2258` (adult, primary language `primary-primary-10`, communication needs `integrated-communic-16`) with assessment `ASS-2505` dated 2022-05-10, outcome `hasCapacity`, and support provided as false.

**View `individual_capacity_assessment_detail_view`**

```sql
CREATE VIEW individual_capacity_assessment_detail_view AS
SELECT a.individual_id, a.individual_identifier, a.date_of_birth, b.id AS assessment_id, b.assessment_identifier AS assessment_assessment_identifier, b.assessment_date AS assessment_assessment_date
FROM individuals a
  JOIN individuals_assessments j ON j.individual_id = a.individual_id
  JOIN capacity_assessments b ON b.id = j.capacity_assessment_id;
```

| individual_id | individual_identifier | date_of_birth | assessment_id | assessment_assessment_identifier | assessment_assessment_date |
|---|---|---|---|---|---|
| 1 | IND-2258 | 2025-04-02 | 1 | ASS-2505 | 2022-05-10T04:24:00 |
| 1 | IND-2258 | 2025-04-02 | 2 | ASS-2510 | 2023-10-21T11:41:00 |
| 2 | IND-2262 | 2022-09-13 | 2 | ASS-2510 | 2023-10-21T11:41:00 |
| 2 | IND-2262 | 2022-09-13 | 3 | ASS-2515 | 2024-03-05T18:58:00 |
| 3 | IND-2266 | 2023-02-24 | 3 | ASS-2515 | 2024-03-05T18:58:00 |
| 3 | IND-2266 | 2023-02-24 | 4 | ASS-2520 | 2025-08-16T01:15:00 |
| 4 | IND-2270 | 2024-07-08 | 4 | ASS-2520 | 2025-08-16T01:15:00 |
| 4 | IND-2270 | 2024-07-08 | 1 | ASS-2505 | 2022-05-10T04:24:00 |

The `individual_best_interest_determination_detail_view` joins `individuals` with `best_interest_determinations` to answer: "What best interest determinations apply to a given individual, and what are the individual's details?" A row might show `IND-2258` with determination `DET-2083` dated 2022-09-06, least restrictive option true, consultation participants `legacy-consulta-67`, and outcome description "Legacy Assessment D".

**View `individual_best_interest_determination_detail_view`**

```sql
CREATE VIEW individual_best_interest_determination_detail_view AS
SELECT a.individual_id, a.individual_identifier, a.date_of_birth, b.id AS determination_id, b.determination_identifier AS determination_determination_identifier, b.determination_date AS determination_determination_date
FROM individuals a
  JOIN individuals_determinations j ON j.individual_id = a.individual_id
  JOIN best_interest_determinations b ON b.id = j.best_interest_determination_id;
```

| individual_id | individual_identifier | date_of_birth | determination_id | determination_determination_identifier | determination_determination_date |
|---|---|---|---|---|---|
| 1 | IND-2258 | 2025-04-02 | 1 | DET-2083 | 2022-09-06T08:36:00 |
| 1 | IND-2258 | 2025-04-02 | 2 | DET-2085 | 2023-02-17T15:53:00 |
| 2 | IND-2262 | 2022-09-13 | 2 | DET-2085 | 2023-02-17T15:53:00 |
| 2 | IND-2262 | 2022-09-13 | 3 | DET-2087 | 2024-07-01T22:10:00 |
| 3 | IND-2266 | 2023-02-24 | 3 | DET-2087 | 2024-07-01T22:10:00 |
| 3 | IND-2266 | 2023-02-24 | 4 | DET-2089 | 2025-12-12T05:27:00 |
| 4 | IND-2270 | 2024-07-08 | 4 | DET-2089 | 2025-12-12T05:27:00 |
| 4 | IND-2270 | 2024-07-08 | 1 | DET-2083 | 2022-09-06T08:36:00 |

The `individual_legal_representative_view` joins `individuals` with `legal_representatives` to answer: "Which legal representative is authorised for a given individual, and what is the scope of their authority?" A row might show `IND-2258` represented by `REP-2553` (Bobby Flores), relationship type `parent`, scope `healthcare`, authorised on 2022-05-19.

**View `individual_legal_representative_view`**

```sql
CREATE VIEW individual_legal_representative_view AS
SELECT a.individual_id, a.individual_identifier, a.date_of_birth, a.legal_status, b.legal_representative_id AS representative_legal_representative_id, b.representative_identifier AS representative_representative_identifier, b.relationship_type AS representative_relationship_type
FROM individuals a JOIN legal_representatives b ON a.legal_representative_id = b.legal_representative_id;
```

| individual_id | individual_identifier | date_of_birth | legal_status | representative_legal_representative_id | representative_representative_identifier | representative_relationship_type |
|---|---|---|---|---|---|---|
| 1 | IND-2258 | 2025-04-02 | adult | 1 | REP-2553 | parent |
| 2 | IND-2262 | 2022-09-13 | minor | 2 | REP-2557 | spouse |
| 3 | IND-2266 | 2023-02-24 | vulnerable | 3 | REP-2561 | sibling |
| 4 | IND-2270 | 2024-07-08 | adult | 4 | REP-2565 | guardian |

The `decision_context_capacity_assessment_view` joins `decision_contexts` with `capacity_assessments` to answer: "Which capacity assessments were conducted within a given decision context?" A row might show context `CON-2525` (medical, emergency, high risk) with assessment `ASS-2505` by assessor role `clinician`, outcome `hasCapacity`.

**View `decision_context_capacity_assessment_view`**

```sql
CREATE VIEW decision_context_capacity_assessment_view AS
SELECT a.decision_context_id, a.context_identifier, a.decision_category, a.urgency_level, b.id AS assessment_id, b.assessment_identifier AS assessment_assessment_identifier, b.assessment_date AS assessment_assessment_date
FROM decision_contexts a JOIN capacity_assessments b ON a.capacity_assessment_id = b.id;
```

| decision_context_id | context_identifier | decision_category | urgency_level | assessment_id | assessment_assessment_identifier | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 1000 | CON-2525 | medical | emergency | 1 | ASS-2505 | 2022-05-10T04:24:00 |
| 1001 | CON-2526 | financial | urgent | 2 | ASS-2510 | 2023-10-21T11:41:00 |
| 1002 | CON-2527 | residential | routine | 3 | ASS-2515 | 2024-03-05T18:58:00 |
| 1003 | CON-2528 | social | planned | 4 | ASS-2520 | 2025-08-16T01:15:00 |

The `decision_context_best_interest_determination_view` joins `decision_contexts` with `best_interest_determinations` to answer: "Which best interest determinations were made within a given decision context?" A row might show context `CON-2525` with determination `DET-2083`, least restrictive option true, outcome description "Legacy Assessment D", and review date 2024-11-03.

**View `decision_context_best_interest_determination_view`**

```sql
CREATE VIEW decision_context_best_interest_determination_view AS
SELECT a.decision_context_id, a.context_identifier, a.decision_category, a.urgency_level, b.id AS determination_id, b.determination_identifier AS determination_determination_identifier, b.determination_date AS determination_determination_date
FROM decision_contexts a JOIN best_interest_determinations b ON a.best_interest_determination_id = b.id;
```

| decision_context_id | context_identifier | decision_category | urgency_level | determination_id | determination_determination_identifier | determination_determination_date |
|---|---|---|---|---|---|---|
| 1000 | CON-2525 | medical | emergency | 1 | DET-2083 | 2022-09-06T08:36:00 |
| 1001 | CON-2526 | financial | urgent | 2 | DET-2085 | 2023-02-17T15:53:00 |
| 1002 | CON-2527 | residential | routine | 3 | DET-2087 | 2024-07-01T22:10:00 |
| 1003 | CON-2528 | social | planned | 4 | DET-2089 | 2025-12-12T05:27:00 |

The `decision_context_intervention_detail_view` joins `decision_contexts` with `interventions` to answer: "Which interventions were carried out within a given decision context?" A row might show context `CON-2525` with intervention `INT-2732` (medicalTreatment), restrictiveness level `minimal`, status `planned`, running from 2022-09-05 to 2022-09-01.

**View `decision_context_intervention_detail_view`**

```sql
CREATE VIEW decision_context_intervention_detail_view AS
SELECT a.decision_context_id, a.context_identifier, a.decision_category, b.id AS intervention_id, b.intervention_identifier AS intervention_intervention_identifier, b.intervention_type AS intervention_intervention_type
FROM decision_contexts a
  JOIN contexts_interventions j ON j.decision_context_id = a.decision_context_id
  JOIN interventions b ON b.id = j.intervention_id;
```

| decision_context_id | context_identifier | decision_category | intervention_id | intervention_intervention_identifier | intervention_intervention_type |
|---|---|---|---|---|---|
| 1000 | CON-2525 | medical | 1 | INT-2732 | medicalTreatment |
| 1000 | CON-2525 | medical | 2 | INT-2733 | financialTransaction |
| 1001 | CON-2526 | financial | 2 | INT-2733 | financialTransaction |
| 1001 | CON-2526 | financial | 3 | INT-2734 | placement |
| 1002 | CON-2527 | residential | 3 | INT-2734 | placement |
| 1002 | CON-2527 | residential | 4 | INT-2735 | carePlan |
| 1003 | CON-2528 | social | 4 | INT-2735 | carePlan |
| 1003 | CON-2528 | social | 1 | INT-2732 | medicalTreatment |

The `best_interest_determination_individual_view` joins `best_interest_determinations` with `individuals` to answer: "Which individual is the subject of a given best interest determination?" A row might show determination `DET-2083` for individual `IND-2258`, an adult with legal status `adult`, primary language `primary-primary-10`, and communication needs `integrated-communic-16`.

**View `best_interest_determination_individual_view`**

```sql
CREATE VIEW best_interest_determination_individual_view AS
SELECT a.id, a.determination_identifier, a.determination_date, a.least_restrictive_option, b.individual_id AS individual_individual_id, b.individual_identifier AS individual_individual_identifier, b.date_of_birth AS individual_date_of_birth
FROM best_interest_determinations a JOIN individuals b ON a.individual_id = b.individual_id;
```

| id | determination_identifier | determination_date | least_restrictive_option | individual_individual_id | individual_individual_identifier | individual_date_of_birth |
|---|---|---|---|---|---|---|
| 1 | DET-2083 | 2022-09-06T08:36:00 | true | 1 | IND-2258 | 2025-04-02 |
| 2 | DET-2085 | 2023-02-17T15:53:00 | false | 2 | IND-2262 | 2022-09-13 |
| 3 | DET-2087 | 2024-07-01T22:10:00 | true | 3 | IND-2266 | 2023-02-24 |
| 4 | DET-2089 | 2025-12-12T05:27:00 | false | 4 | IND-2270 | 2024-07-08 |

The `best_interest_determination_decision_context_view` joins `best_interest_determinations` with `decision_contexts` to answer: "In which decision context was a best interest determination made?" A row might show determination `DET-2083` within context `CON-2525`, a medical decision with emergency urgency, high risk, and description "Extended Survey".

**View `best_interest_determination_decision_context_view`**

```sql
CREATE VIEW best_interest_determination_decision_context_view AS
SELECT a.id, a.determination_identifier, a.determination_date, a.least_restrictive_option, b.decision_context_id AS context_decision_context_id, b.context_identifier AS context_context_identifier, b.decision_category AS context_decision_category
FROM best_interest_determinations a JOIN decision_contexts b ON a.decision_context_id = b.decision_context_id;
```

| id | determination_identifier | determination_date | least_restrictive_option | context_decision_context_id | context_context_identifier | context_decision_category |
|---|---|---|---|---|---|---|
| 1 | DET-2083 | 2022-09-06T08:36:00 | true | 1000 | CON-2525 | medical |
| 2 | DET-2085 | 2023-02-17T15:53:00 | false | 1001 | CON-2526 | financial |
| 3 | DET-2087 | 2024-07-01T22:10:00 | true | 1002 | CON-2527 | residential |
| 4 | DET-2089 | 2025-12-12T05:27:00 | false | 1003 | CON-2528 | social |

The `best_interest_determination_intervention_detail_view` joins `best_interest_determinations` with `interventions` to answer: "Which interventions are justified by a given best interest determination?" A row might show determination `DET-2083` with intervention `INT-2732` (medicalTreatment), restrictiveness level `minimal`, status `planned`, and intervention type `medicalTreatment`.

**View `best_interest_determination_intervention_detail_view`**

```sql
CREATE VIEW best_interest_determination_intervention_detail_view AS
SELECT a.id, a.determination_identifier, a.determination_date, b.id AS intervention_id, b.intervention_identifier AS intervention_intervention_identifier, b.intervention_type AS intervention_intervention_type
FROM best_interest_determinations a
  JOIN determinations_interventions j ON j.best_interest_determination_id = a.id
  JOIN interventions b ON b.id = j.intervention_id;
```

| id | determination_identifier | determination_date | intervention_id | intervention_intervention_identifier | intervention_intervention_type |
|---|---|---|---|---|---|
| 1 | DET-2083 | 2022-09-06T08:36:00 | 1 | INT-2732 | medicalTreatment |
| 1 | DET-2083 | 2022-09-06T08:36:00 | 2 | INT-2733 | financialTransaction |
| 2 | DET-2085 | 2023-02-17T15:53:00 | 2 | INT-2733 | financialTransaction |
| 2 | DET-2085 | 2023-02-17T15:53:00 | 3 | INT-2734 | placement |
| 3 | DET-2087 | 2024-07-01T22:10:00 | 3 | INT-2734 | placement |
| 3 | DET-2087 | 2024-07-01T22:10:00 | 4 | INT-2735 | carePlan |
| 4 | DET-2089 | 2025-12-12T05:27:00 | 4 | INT-2735 | carePlan |
| 4 | DET-2089 | 2025-12-12T05:27:00 | 1 | INT-2732 | medicalTreatment |

The `best_interest_determination_legal_representative_view` joins `best_interest_determinations` with `legal_representatives` to answer: "Which legal representative is associated with a given best interest determination?" A row might show determination `DET-2083` with representative `REP-2553` (Bobby Flores), relationship type `parent`, scope `healthcare`, and contact information "Bobby Flores".

**View `best_interest_determination_legal_representative_view`**

```sql
CREATE VIEW best_interest_determination_legal_representative_view AS
SELECT a.id, a.determination_identifier, a.determination_date, a.least_restrictive_option, b.legal_representative_id AS representative_legal_representative_id, b.representative_identifier AS representative_representative_identifier, b.relationship_type AS representative_relationship_type
FROM best_interest_determinations a JOIN legal_representatives b ON a.legal_representative_id = b.legal_representative_id;
```

| id | determination_identifier | determination_date | least_restrictive_option | representative_legal_representative_id | representative_representative_identifier | representative_relationship_type |
|---|---|---|---|---|---|---|
| 1 | DET-2083 | 2022-09-06T08:36:00 | true | 1 | REP-2553 | parent |
| 2 | DET-2085 | 2023-02-17T15:53:00 | false | 2 | REP-2557 | spouse |
| 3 | DET-2087 | 2024-07-01T22:10:00 | true | 3 | REP-2561 | sibling |
| 4 | DET-2089 | 2025-12-12T05:27:00 | false | 4 | REP-2565 | guardian |

The `intervention_individual_view` joins `interventions` with `individuals` to answer: "Which individual is the subject of a given intervention?" A row might show intervention `INT-2732` (medicalTreatment) for individual `IND-2258`, an adult with legal status `adult`, primary language `primary-primary-10`, and communication needs `integrated-communic-16`.

**View `intervention_individual_view`**

```sql
CREATE VIEW intervention_individual_view AS
SELECT a.id, a.intervention_identifier, a.intervention_type, a.start_date, b.individual_id AS individual_individual_id, b.individual_identifier AS individual_individual_identifier, b.date_of_birth AS individual_date_of_birth
FROM interventions a JOIN individuals b ON a.individual_id = b.individual_id;
```

| id | intervention_identifier | intervention_type | start_date | individual_individual_id | individual_individual_identifier | individual_date_of_birth |
|---|---|---|---|---|---|---|
| 1 | INT-2732 | medicalTreatment | 2022-09-05T20:24:00 | 1 | IND-2258 | 2025-04-02 |
| 2 | INT-2733 | financialTransaction | 2023-02-16T03:41:00 | 2 | IND-2262 | 2022-09-13 |
| 3 | INT-2734 | placement | 2024-07-27T10:58:00 | 3 | IND-2266 | 2023-02-24 |
| 4 | INT-2735 | carePlan | 2025-12-11T17:15:00 | 4 | IND-2270 | 2024-07-08 |

The `intervention_best_interest_determination_view` joins `interventions` with `best_interest_determinations` to answer: "Which best interest determination justifies a given intervention?" A row might show intervention `INT-2732` justified by determination `DET-2083`, with least restrictive option true, outcome description "Legacy Assessment D", and review date 2024-11-03.

**View `intervention_best_interest_determination_view`**

```sql
CREATE VIEW intervention_best_interest_determination_view AS
SELECT a.id, a.intervention_identifier, a.intervention_type, a.start_date, b.id AS determination_id, b.determination_identifier AS determination_determination_identifier, b.determination_date AS determination_determination_date
FROM interventions a JOIN best_interest_determinations b ON a.best_interest_determination_id = b.id;
```

| id | intervention_identifier | intervention_type | start_date | determination_id | determination_determination_identifier | determination_determination_date |
|---|---|---|---|---|---|---|
| 1 | INT-2732 | medicalTreatment | 2022-09-05T20:24:00 | 1 | DET-2083 | 2022-09-06T08:36:00 |
| 2 | INT-2733 | financialTransaction | 2023-02-16T03:41:00 | 2 | DET-2085 | 2023-02-17T15:53:00 |
| 3 | INT-2734 | placement | 2024-07-27T10:58:00 | 3 | DET-2087 | 2024-07-01T22:10:00 |
| 4 | INT-2735 | carePlan | 2025-12-11T17:15:00 | 4 | DET-2089 | 2025-12-12T05:27:00 |

The `intervention_decision_context_view` joins `interventions` with `decision_contexts` to answer: "In which decision context was an intervention carried out?" A row might show intervention `INT-2732` (medicalTreatment, minimal restrictiveness, planned status) within context `CON-2525`, a medical decision with emergency urgency and high risk.

**View `intervention_decision_context_view`**

```sql
CREATE VIEW intervention_decision_context_view AS
SELECT a.id, a.intervention_identifier, a.intervention_type, a.start_date, b.decision_context_id AS context_decision_context_id, b.context_identifier AS context_context_identifier, b.decision_category AS context_decision_category
FROM interventions a JOIN decision_contexts b ON a.decision_context_id = b.decision_context_id;
```

| id | intervention_identifier | intervention_type | start_date | context_decision_context_id | context_context_identifier | context_decision_category |
|---|---|---|---|---|---|---|
| 1 | INT-2732 | medicalTreatment | 2022-09-05T20:24:00 | 1000 | CON-2525 | medical |
| 2 | INT-2733 | financialTransaction | 2023-02-16T03:41:00 | 1001 | CON-2526 | financial |
| 3 | INT-2734 | placement | 2024-07-27T10:58:00 | 1002 | CON-2527 | residential |
| 4 | INT-2735 | carePlan | 2025-12-11T17:15:00 | 1003 | CON-2528 | social |

The `legal_representative_individual_view` joins `legal_representatives` with `individuals` to answer: "Which individual is represented by a given legal representative?" A row might show representative `REP-2553` (Bobby Flores, parent, scope `healthcare`) for individual `IND-2258`, an adult born 2025-04-02 with primary language `primary-primary-10`.

**View `legal_representative_individual_view`**

```sql
CREATE VIEW legal_representative_individual_view AS
SELECT a.legal_representative_id, a.representative_identifier, a.relationship_type, a.authorization_date, b.individual_id AS individual_individual_id, b.individual_identifier AS individual_individual_identifier, b.date_of_birth AS individual_date_of_birth
FROM legal_representatives a JOIN individuals b ON a.individual_id = b.individual_id;
```

| legal_representative_id | representative_identifier | relationship_type | authorization_date | individual_individual_id | individual_individual_identifier | individual_date_of_birth |
|---|---|---|---|---|---|---|
| 1 | REP-2553 | parent | 2022-05-19T16:24:00 | 1 | IND-2258 | 2025-04-02 |
| 2 | REP-2557 | spouse | 2023-10-03T23:41:00 | 2 | IND-2262 | 2022-09-13 |
| 3 | REP-2561 | sibling | 2024-03-14T06:58:00 | 3 | IND-2266 | 2023-02-24 |
| 4 | REP-2565 | guardian | 2025-08-25T13:15:00 | 4 | IND-2270 | 2024-07-08 |

The `legal_representative_best_interest_determination_detail_view` joins `legal_representatives` with `best_interest_determinations` to answer: "Which best interest determinations involve a given legal representative?" A row might show representative `REP-2553` (Bobby Flores, parent, scope `healthcare`) with determination `DET-2083`, least restrictive option true, outcome description "Legacy Assessment D", and review date 2024-11-03.

**View `legal_representative_best_interest_determination_detail_view`**

```sql
CREATE VIEW legal_representative_best_interest_determination_detail_view AS
SELECT a.legal_representative_id, a.representative_identifier, a.relationship_type, b.id AS determination_id, b.determination_identifier AS determination_determination_identifier, b.determination_date AS determination_determination_date
FROM legal_representatives a
  JOIN representatives_determinations j ON j.legal_representative_id = a.legal_representative_id
  JOIN best_interest_determinations b ON b.id = j.best_interest_determination_id;
```

| legal_representative_id | representative_identifier | relationship_type | determination_id | determination_determination_identifier | determination_determination_date |
|---|---|---|---|---|---|
| 1 | REP-2553 | parent | 1 | DET-2083 | 2022-09-06T08:36:00 |
| 1 | REP-2553 | parent | 2 | DET-2085 | 2023-02-17T15:53:00 |
| 2 | REP-2557 | spouse | 2 | DET-2085 | 2023-02-17T15:53:00 |
| 2 | REP-2557 | spouse | 3 | DET-2087 | 2024-07-01T22:10:00 |
| 3 | REP-2561 | sibling | 3 | DET-2087 | 2024-07-01T22:10:00 |
| 3 | REP-2561 | sibling | 4 | DET-2089 | 2025-12-12T05:27:00 |
| 4 | REP-2565 | guardian | 4 | DET-2089 | 2025-12-12T05:27:00 |
| 4 | REP-2565 | guardian | 1 | DET-2083 | 2022-09-06T08:36:00 |

The `legal_representative_intervention_detail_view` joins `legal_representatives` with `interventions` to answer: "Which interventions were overseen by a given legal representative?" A row might show representative `REP-2553` (Bobby Flores, parent, scope `healthcare`) with intervention `INT-2732` (medicalTreatment), restrictiveness level `minimal`, status `planned`, running from 2022-09-05 to 2022-09-01.

**View `legal_representative_intervention_detail_view`**

```sql
CREATE VIEW legal_representative_intervention_detail_view AS
SELECT a.legal_representative_id, a.representative_identifier, a.relationship_type, b.id AS intervention_id, b.intervention_identifier AS intervention_intervention_identifier, b.intervention_type AS intervention_intervention_type
FROM legal_representatives a
  JOIN representatives_interventions j ON j.legal_representative_id = a.legal_representative_id
  JOIN interventions b ON b.id = j.intervention_id;
```

| legal_representative_id | representative_identifier | relationship_type | intervention_id | intervention_intervention_identifier | intervention_intervention_type |
|---|---|---|---|---|---|
| 1 | REP-2553 | parent | 1 | INT-2732 | medicalTreatment |
| 1 | REP-2553 | parent | 2 | INT-2733 | financialTransaction |
| 2 | REP-2557 | spouse | 2 | INT-2733 | financialTransaction |
| 2 | REP-2557 | spouse | 3 | INT-2734 | placement |
| 3 | REP-2561 | sibling | 3 | INT-2734 | placement |
| 3 | REP-2561 | sibling | 4 | INT-2735 | carePlan |
| 4 | REP-2565 | guardian | 4 | INT-2735 | carePlan |
| 4 | REP-2565 | guardian | 1 | INT-2732 | medicalTreatment |

### Synthesis

The schema models the capacity governance domain as a network of six base entities connected through twelve foreign-key relationships on the base tables and six junction tables resolving many-to-many relationships. The cardinality-bounded attributes—`outcome` in `capacity_assessments` (three values), `legal_status` in `individuals` (three values), `decision_category` in `decision_contexts` (four values), `urgency_level` (four values), `risk_level` (four values), `least_restrictive_option` in `best_interest_determinations` (boolean), `intervention_type` in `interventions` (four values), `restrictiveness_level` (four values), and `status` (four values)—encode the domain's discrete ontological distinctions as constrained columns. The twenty views materialise every pairwise and triadic combination of the core entities, ensuring that any domain question—whether about an individual's assessments, a context's interventions, or a representative's determinations—can be answered through a single flat table scan without manual join construction. This design separates the normalised storage of facts from the denormalised presentation of domain narratives, allowing the relational layer to serve both audit integrity and analytical clarity.