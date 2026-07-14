# Capacity Assessment and Best Interest Determination Framework

The governance of personal autonomy for individuals whose decision-making capacity may be impaired rests on a structured sequence of evaluations, determinations, and interventions. At its core, the framework tracks four interlocking domains: the individuals whose capacity is under review, the specific decisions they are asked to make, the formal assessments of their capacity to make those decisions, and the best interest determinations that guide action when capacity is lacking. Interventions translate these determinations into concrete measures—medical treatments, financial transactions, residential placements, or care plans—while legal representatives provide the authorized voice for those who cannot speak for themselves. The records below capture every stage of this process, from initial assessment through final intervention, ensuring that each decision is traceable, auditable, and grounded in documented evidence.

## The Individuals Registry

The foundation of the framework is the registry of individuals whose capacity is subject to evaluation. Each person is assigned a unique identifier and carries demographic and legal metadata that contextualizes their situation.

**Table `individuals`**

| individual_id | individual_identifier | date_of_birth | legal_status | primary_language | communication_needs | legal_representative_id |
|---|---|---|---|---|---|---|
| 1 | IND-2258 | 2025-04-02 | adult | primary-primary-10 | integrated-communic-16 | 1 |
| 2 | IND-2262 | 2022-09-13 | minor | adaptive-primary-11 | seasonal-communic-17 | 2 |
| 3 | IND-2266 | 2023-02-24 | vulnerable | distributed-primary-12 | regional-communic-18 | 3 |
| 4 | IND-2270 | 2024-07-08 | adult | baseline-primary-13 | legacy-communic-19 | 4 |

Individual IND-2258, born 2025-04-02, holds adult legal status with primary-primary-10 as their primary language and integrated-communic-16 as their communication need profile. Their legal representative is REP-2553. Individual IND-2262, classified as a minor born 2022-09-13, uses adaptive-primary-11 and seasonal-communic-17, represented by REP-2557. Individual IND-2266 carries vulnerable legal status, born 2023-02-24, with distributed-primary-12 and regional-communic-18, represented by REP-2561. Individual IND-2270, an adult born 2024-07-08, uses baseline-primary-13 and legacy-communic-19, represented by REP-2565. The legal_status field distinguishes between adults, minors, and vulnerable persons, each carrying different procedural requirements. The communication_needs field captures the modality through which the individual best receives information, a factor that directly influences how assessments are conducted.

## Decision Contexts

Every capacity assessment and best interest determination is anchored to a specific decision context—a defined situation in which a choice must be made. The decision_contexts table records the category, urgency, risk, and description of each context.

**Table `decision_contexts`**

| decision_context_id | context_identifier | decision_category | urgency_level | risk_level | description | capacity_assessment_id | best_interest_determination_id |
|---|---|---|---|---|---|---|---|
| 1000 | CON-2525 | medical | emergency | high | Extended Survey | 1 | 1 |
| 1001 | CON-2526 | financial | urgent | medium | Pilot Corridor A | 2 | 2 |
| 1002 | CON-2527 | residential | routine | low | Baseline Series | 3 | 3 |
| 1003 | CON-2528 | social | planned | negligible | Distributed Assessment | 4 | 4 |

Context CON-2525 (decision_context_id 1000) involves a medical decision classified as emergency-level with high risk, described as "Extended Survey." Context CON-2526 (1001) covers a financial decision marked urgent with medium risk, described as "Pilot Corridor A." Context CON-2527 (1002) addresses a residential decision at routine urgency and low risk, described as "Baseline Series." Context CON-2528 (1003) pertains to a social decision that is planned with negligible risk, described as "Distributed Assessment." The decision_category field—medical, financial, residential, or social—determines which regulatory standards apply. The urgency_level and risk_level fields together establish the procedural tempo: emergency/high-risk contexts demand rapid assessment, while planned/negligible-risk contexts allow for deliberative evaluation.

## Capacity Assessments

The capacity assessment is the formal evaluation of whether an individual can understand, retain, and weigh information relevant to a specific decision. Each assessment is dated, assigned an identifier, and records the assessor's role, the decision topic, the outcome, and whether support was provided to facilitate the individual's decision-making.

**Table `capacity_assessments`**

| id | assessment_identifier | assessment_date | decision_topic | assessor_role | outcome | support_provided | individual_id | decision_context_id | best_interest_determination_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ASS-2505 | 2022-05-10T04:24:00 | pilot-decision-20 | clinician | hasCapacity | false | 1 | 1000 | 1 |
| 2 | ASS-2510 | 2023-10-21T11:41:00 | extended-decision-21 | socialWorker | lacksCapacity | true | 2 | 1001 | 2 |
| 3 | ASS-2515 | 2024-03-05T18:58:00 | integrated-decision-22 | legalAdvocate | fluctuatingCapacity | false | 3 | 1002 | 3 |
| 4 | ASS-2520 | 2025-08-16T01:15:00 | seasonal-decision-23 | guardian | hasCapacity | true | 4 | 1003 | 4 |

Assessment ASS-2505 (id 1) was conducted on 2022-05-10 by a clinician regarding pilot-decision-20. The outcome was hasCapacity, and no support was provided (support_provided is false). This assessment is linked to individual_id 1, decision_context_id 1000, and best_interest_determination_id 1. Assessment ASS-2510 (id 2), dated 2023-10-21, was performed by a socialWorker on extended-decision-21 for individual_id 2 in context 1001. The outcome was lacksCapacity, and support was provided (true). Assessment ASS-2515 (id 3), dated 2024-03-05, was conducted by a legalAdvocate on integrated-decision-22 for individual_id 3 in context 1002. The outcome was fluctuatingCapacity, and no support was provided. Assessment ASS-2520 (id 4), dated 2025-08-16, was performed by a guardian on seasonal-decision-23 for individual_id 4 in context 1003. The outcome was hasCapacity, and support was provided. The assessor_role field identifies the professional discipline of the evaluator—clinician, socialWorker, legalAdvocate, or guardian—reflecting the multidisciplinary nature of capacity evaluations. The outcome field captures one of three states: hasCapacity, lacksCapacity, or fluctuatingCapacity, with the latter indicating that capacity varies over time or across domains.

## Best Interest Determinations

When capacity is lacking or fluctuating, a best interest determination guides the course of action. These determinations record the date, the least restrictive option considered, the participants consulted, the outcome description, and a scheduled review date.

**Table `best_interest_determinations`**

| id | determination_identifier | determination_date | least_restrictive_option | consultation_participants | outcome_description | review_date | individual_id | decision_context_id | legal_representative_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | DET-2083 | 2022-09-06T08:36:00 | true | legacy-consulta-67 | Legacy Assessment D | 2024-11-03T22:54:00 | 1 | 1000 | 1 |
| 2 | DET-2085 | 2023-02-17T15:53:00 | false | compact-consulta-68 | Regional Survey | 2025-04-14T05:11:00 | 2 | 1001 | 2 |
| 3 | DET-2087 | 2024-07-01T22:10:00 | true | composite-consulta-69 | Seasonal Corridor | 2022-09-25T12:28:00 | 3 | 1002 | 3 |
| 4 | DET-2089 | 2025-12-12T05:27:00 | false | primary-consulta-70 | Integrated Series A | 2023-02-09T19:45:00 | 4 | 1003 | 4 |

Determination DET-2083 (id 1) was made on 2022-09-06, identified the least_restrictive_option as true, consulted legacy-consulta-67, and produced the outcome description "Legacy Assessment D." Its review_date is 2024-11-03. It is linked to individual_id 1, decision_context_id 1000, and legal_representative_id 1. Determination DET-2085 (id 2), dated 2023-02-17, set least_restrictive_option to false, consulted compact-consulta-68, and produced "Regional Survey." Its review_date is 2025-04-14, linked to individual_id 2, context 1001, and representative 2. Determination DET-2087 (id 3), dated 2024-07-01, set least_restrictive_option to true, consulted composite-consulta-69, and produced "Seasonal Corridor." Its review_date is 2022-09-25, linked to individual_id 3, context 1002, and representative 3. Determination DET-2089 (id 4), dated 2025-12-12, set least_restrictive_option to false, consulted primary-consulta-70, and produced "Integrated Series A." Its review_date is 2023-02-09, linked to individual_id 4, context 1003, and representative 4. The least_restrictive_option boolean encodes whether the chosen course preserves the maximum possible autonomy. The consultation_participants field lists the parties whose input was sought, and the review_date establishes when the determination must be re-evaluated.

## Interventions

Interventions are the actionable measures that flow from best interest determinations. Each intervention records its type, temporal boundaries, restrictiveness level, and operational status.

**Table `interventions`**

| id | intervention_identifier | intervention_type | start_date | end_date | restrictiveness_level | status | individual_id | best_interest_determination_id | decision_context_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | INT-2732 | medicalTreatment | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | minimal | planned | 1 | 1 | 1000 |
| 2 | INT-2733 | financialTransaction | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | moderate | active | 2 | 2 | 1001 |
| 3 | INT-2734 | placement | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | high | completed | 3 | 3 | 1002 |
| 4 | INT-2735 | carePlan | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | maximum | discontinued | 4 | 4 | 1003 |

Intervention INT-2732 (id 1) is of type medicalTreatment, starting 2022-09-05 and ending 2022-09-01, with minimal restrictiveness_level and planned status. It is linked to individual_id 1, best_interest_determination_id 1, and decision_context_id 1000. Intervention INT-2733 (id 2) is of type financialTransaction, starting 2023-02-16 and ending 2023-02-12, with moderate restrictiveness_level and active status, linked to individual_id 2, determination 2, and context 1001. Intervention INT-2734 (id 3) is of type placement, starting 2024-07-27 and ending 2024-07-23, with high restrictiveness_level and completed status, linked to individual_id 3, determination 3, and context 1002. Intervention INT-2735 (id 4) is of type carePlan, starting 2025-12-11 and ending 2025-12-07, with maximum restrictiveness_level and discontinued status, linked to individual_id 4, determination 4, and context 1003. The intervention_type field categorizes the nature of the measure—medicalTreatment, financialTransaction, placement, or carePlan. The restrictiveness_level ranges from minimal to maximum, providing a standardized scale for comparing the impact of different interventions. The status field tracks the operational state: planned, active, completed, or discontinued.

## Legal Representatives

Legal representatives are the authorized individuals who act on behalf of the persons under assessment. Each representative is identified, classified by their relationship to the individual, and assigned a scope of authority.

**Table `legal_representatives`**

| legal_representative_id | representative_identifier | relationship_type | authorization_date | scope_of_authority | contact_information | individual_id |
|---|---|---|---|---|---|---|
| 1 | REP-2553 | parent | 2022-05-19T16:24:00 | healthcare | Bobby Flores | 1 |
| 2 | REP-2557 | spouse | 2023-10-03T23:41:00 | financial | Stephanie Lawrence | 2 |
| 3 | REP-2561 | sibling | 2024-03-14T06:58:00 | personalWelfare | Robert Watts | 3 |
| 4 | REP-2565 | guardian | 2025-08-25T13:15:00 | all | Helen Keller | 4 |

Representative REP-2553 (id 1) has a parent relationship_type, was authorized on 2022-05-19, holds healthcare scope_of_authority, and has contact information "Bobby Flores." They are linked to individual_id 1. Representative REP-2557 (id 2) has a spouse relationship_type, was authorized on 2023-10-03, holds financial scope_of_authority, and has contact information "Stephanie Lawrence." They are linked to individual_id 2. Representative REP-2561 (id 3) has a sibling relationship_type, was authorized on 2024-03-14, holds personalWelfare scope_of_authority, and has contact information "Robert Watts." They are linked to individual_id 3. Representative REP-2565 (id 4) has a guardian relationship_type, was authorized on 2025-08-25, holds all scope_of_authority, and has contact information "Helen Keller." They are linked to individual_id 4. The relationship_type field captures the familial or legal bond between representative and individual. The scope_of_authority field defines the domain within which the representative may act—healthcare, financial, personalWelfare, or all—ensuring that authority is neither over- nor under-extended.

## Relational Records

The framework includes junction tables that explicitly record the many-to-many relationships between core entities. These records make the connections between individuals, assessments, determinations, contexts, interventions, and representatives auditable and queryable.

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

The individuals_assessments table links individuals to their capacity assessments, capturing the direct relationship between a person and the evaluation of their capacity. The individuals_determinations table links individuals to best interest determinations, establishing which determinations apply to which persons. The contexts_interventions table links decision contexts to interventions, showing which measures were taken in response to which decision situations. The determinations_interventions table links best interest determinations to interventions, tracing the causal chain from determination to action. The representatives_determinations table links legal representatives to best interest determinations, recording which representative was involved in which determination. The representatives_interventions table links legal representatives to interventions, documenting which representative oversaw or authorized which measures.

## View-Based Perspectives

The framework provides a set of pre-joined views that present the data from different analytical angles. Each view answers a specific operational question by combining records from multiple tables.

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

This view answers the question: "What capacity assessment was performed for each individual, and what was the outcome?" It joins capacity_assessments with individuals, producing rows that pair assessment identifiers with individual identifiers, dates of birth, legal status, and primary language. For example, a row would show ASS-2505 alongside IND-2258, revealing that the clinician-assessed individual with adult status was found to have capacity for pilot-decision-20.

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

This view answers: "Which decision context triggered each capacity assessment, and what were the risk and urgency parameters?" It joins capacity_assessments with decision_contexts, pairing assessment identifiers with context identifiers, decision categories, urgency levels, and risk levels. A representative row would show ASS-2510 alongside CON-2526, indicating that the socialWorker's assessment of lacksCapacity occurred in a financial, urgent, medium-risk context.

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

This view answers: "How does each capacity assessment relate to its corresponding best interest determination?" It joins capacity_assessments with best_interest_determinations, pairing assessment identifiers with determination identifiers, determination dates, least restrictive options, and outcome descriptions. A row would show ASS-2515 alongside DET-2087, revealing that the legalAdvocate's assessment of fluctuatingCapacity preceded a determination that selected the least restrictive option and produced the outcome "Seasonal Corridor."

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

This view answers: "What is the complete profile of an individual alongside their capacity assessment?" It joins individuals with capacity_assessments, producing rows that include the individual's identifier, date of birth, legal status, primary language, communication needs, and the full assessment record including assessment date, decision topic, assessor role, outcome, and support provided. A representative row would show IND-2262 alongside ASS-2510, revealing that the minor with adaptive-primary-11 and seasonal-communic-17 was assessed by a socialWorker who found lacksCapacity and provided support.

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

This view answers: "What is the complete profile of an individual alongside their best interest determination?" It joins individuals with best_interest_determinations, producing rows that include the individual's identifier, date of birth, legal status, primary language, communication needs, and the full determination record including determination date, least restrictive option, consultation participants, outcome description, and review date. A representative row would show IND-2266 alongside DET-2087, revealing that the vulnerable individual with distributed-primary-12 and regional-communic-18 was subject to a determination that selected the least restrictive option and consulted composite-consulta-69.

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

This view answers: "Which legal representative is assigned to each individual, and what is their scope of authority?" It joins individuals with legal_representatives, producing rows that include the individual's identifier, date of birth, legal status, primary language, communication needs, and the representative's identifier, relationship type, authorization date, scope of authority, and contact information. A representative row would show IND-2270 alongside REP-2565, revealing that the adult with baseline-primary-13 and legacy-communic-19 is represented by Helen Keller, a guardian authorized with all scope of authority since 2025-08-25.

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

This view answers: "For each decision context, what capacity assessment was conducted and what was its outcome?" It joins decision_contexts with capacity_assessments, producing rows that include the context identifier, decision category, urgency level, risk level, description, and the full assessment record. A representative row would show CON-2528 alongside ASS-2520, revealing that the planned, negligible-risk social decision context led to a guardian-conducted assessment finding hasCapacity with support provided.

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

This view answers: "For each decision context, what best interest determination was made and what were its parameters?" It joins decision_contexts with best_interest_determinations, producing rows that include the context identifier, decision category, urgency level, risk level, description, and the full determination record. A representative row would show CON-2527 alongside DET-2087, revealing that the routine, low-risk residential context was associated with a determination that selected the least restrictive option and produced "Seasonal Corridor."

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

This view answers: "For each decision context, what intervention was implemented and what are its operational parameters?" It joins decision_contexts with interventions, producing rows that include the context identifier, decision category, urgency level, risk level, description, and the full intervention record including type, start and end dates, restrictiveness level, and status. A representative row would show CON-2526 alongside INT-2733, revealing that the urgent, medium-risk financial context was associated with an active financialTransaction intervention of moderate restrictiveness.

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

This view answers: "For each best interest determination, what is the profile of the individual it concerns?" It joins best_interest_determinations with individuals, producing rows that include the determination identifier, determination date, least restrictive option, consultation participants, outcome description, review date, and the individual's identifier, date of birth, legal status, primary language, and communication needs. A representative row would show DET-2083 alongside IND-2258, revealing that the determination with least_restrictive_option true and outcome "Legacy Assessment D" concerns an adult individual born 2025-04-02.

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

This view answers: "For each best interest determination, what decision context does it address?" It joins best_interest_determinations with decision_contexts, producing rows that include the determination identifier, determination date, least restrictive option, consultation participants, outcome description, review date, and the context identifier, decision category, urgency level, risk level, and description. A representative row would show DET-2085 alongside CON-2526, revealing that the determination with least_restrictive_option false and outcome "Regional Survey" addresses a financial, urgent, medium-risk context.

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

This view answers: "For each best interest determination, what intervention was implemented as a result?" It joins best_interest_determinations with interventions, producing rows that include the determination identifier, determination date, least restrictive option, consultation participants, outcome description, review date, and the full intervention record. A representative row would show DET-2087 alongside INT-2734, revealing that the determination selecting the least restrictive option with outcome "Seasonal Corridor" was followed by a placement intervention of high restrictiveness that has been completed.

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

This view answers: "For each best interest determination, which legal representative was involved?" It joins best_interest_determinations with legal_representatives, producing rows that include the determination identifier, determination date, least restrictive option, consultation participants, outcome description, review date, and the representative's identifier, relationship type, authorization date, scope of authority, and contact information. A representative row would show DET-2089 alongside REP-2565, revealing that the determination with outcome "Integrated Series A" involved Helen Keller, a guardian with all scope of authority.

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

This view answers: "For each intervention, what is the profile of the individual it affects?" It joins interventions with individuals, producing rows that include the intervention identifier, intervention type, start and end dates, restrictiveness level, status, and the individual's identifier, date of birth, legal status, primary language, and communication needs. A representative row would show INT-2732 alongside IND-2258, revealing that the medicalTreatment intervention of minimal restrictiveness and planned status affects an adult individual with primary-primary-10 language.

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

This view answers: "For each intervention, what best interest determination authorized it?" It joins interventions with best_interest_determinations, producing rows that include the intervention identifier, intervention type, start and end dates, restrictiveness level, status, and the full determination record. A representative row would show INT-2735 alongside DET-2089, revealing that the carePlan intervention of maximum restrictiveness and discontinued status was authorized by the determination with outcome "Integrated Series A" and least_restrictive_option false.

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

This view answers: "For each intervention, what decision context does it address?" It joins interventions with decision_contexts, producing rows that include the intervention identifier, intervention type, start and end dates, restrictiveness level, status, and the full context record. A representative row would show INT-2734 alongside CON-2527, revealing that the placement intervention of high restrictiveness and completed status addresses a routine, low-risk residential context.

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

This view answers: "For each legal representative, what is the profile of the individual they represent?" It joins legal_representatives with individuals, producing rows that include the representative's identifier, relationship type, authorization date, scope of authority, contact information, and the individual's identifier, date of birth, legal status, primary language, and communication needs. A representative row would show REP-2557 alongside IND-2262, revealing that Stephanie Lawrence, a spouse with financial scope of authority, represents a minor with adaptive-primary-11 language.

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

This view answers: "For each legal representative, what best interest determinations were they involved in?" It joins legal_representatives with best_interest_determinations, producing rows that include the representative's identifier, relationship type, authorization date, scope of authority, contact information, and the full determination record. A representative row would show REP-2561 alongside DET-2087, revealing that Robert Watts, a sibling with personalWelfare scope of authority, was involved in the determination with outcome "Seasonal Corridor" and least_restrictive_option true.

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

This view answers: "For each legal representative, what interventions were they associated with?" It joins legal_representatives with interventions, producing rows that include the representative's identifier, relationship type, authorization date, scope of authority, contact information, and the full intervention record. A representative row would show REP-2553 alongside INT-2732, revealing that Bobby Flores, a parent with healthcare scope of authority, was associated with the medicalTreatment intervention of minimal restrictiveness and planned status.

## Synthesis

The capacity assessment and best interest determination framework operates as an integrated system of evaluation, authorization, and action. Individuals enter the system with identifiable characteristics—legal status, language, communication needs—that shape how assessments are conducted. Decision contexts provide the situational anchor, specifying the category, urgency, and risk of each decision. Capacity assessments, performed by qualified assessors from multiple disciplines, determine whether an individual can make the decision themselves or requires a best interest determination. When capacity is lacking or fluctuating, best interest determinations guide the selection of interventions, which are the concrete measures—medical, financial, residential, or care-plan—that affect the individual's life. Legal representatives provide authorized oversight, their scope of authority bounded by their relationship to the individual and the nature of the decision. The junction tables and pre-joined views ensure that every relationship is explicit, traceable, and queryable, supporting both operational clarity and regulatory accountability.