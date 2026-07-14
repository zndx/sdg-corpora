## Foundations of Conceptual Reasoning

The architecture of formal reasoning rests upon a disciplined taxonomy of statements, judgements, and the concepts that bind them together. At the core of this system lies the **Concept** table, which catalogues the fundamental units of thought—named entities such as *Pilot Cluster*, *Baseline Review*, *Distributed Initiative A*, and *Adaptive Model*—each annotated with properties indicating whether it is coherent, constructible, and which domain it inhabits. These concepts serve as the atoms from which all higher-order reasoning is assembled. Every statement and judgement in the system ultimately resolves to one of these conceptual building blocks, and the relationships between them form the connective tissue of the entire framework.

**Table `Concept`**

| conceptId | conceptName | isIncoherent | isConstructible | domain | containsConceptId | createdAt |
|---|---|---|---|---|---|---|
| 1 | Pilot Cluster | true | false | adaptive-domain-65 | 1 | 2025-01-01 00:14:00 |
| 2 | Baseline Review | false | true | distributed-domain-66 | 2 | 2025-02-06 03:14:00 |
| 3 | Distributed Initiative A | true | false | baseline-domain-67 | 3 | 2025-03-11 06:14:00 |
| 4 | Adaptive Model | false | true | pilot-domain-68 | 4 | 2025-04-16 09:14:00 |

The Concept table reveals a deliberate alternation between coherent and incoherent entries. Concept 1, *Pilot Cluster*, is marked as incoherent yet unconstructible, residing within the adaptive-domain-65. Concept 2, *Baseline Review*, flips this profile: coherent and constructible, it anchors the distributed-domain-66. Concept 3, *Distributed Initiative A*, returns to incoherence, while Concept 4, *Adaptive Model*, mirrors Concept 2's constructive coherence. The `containsConceptId` column establishes a self-referential linkage—each concept points to itself, suggesting a recursive structure where concepts may contain or reference themselves as part of their internal definition.

## Intuition as a Bridge to Judgement

Intuition occupies a unique position in the reasoning pipeline. It is not itself a statement or judgement but rather a cognitive mechanism that amplifies conceptual understanding and feeds into synthetic a priori judgements. The **Intuition** table records four distinct intuition types, each tied to a specific concept and a corresponding synthetic a priori judgement.

**Table `Intuition`**

| id | intuitionType | isSensible | isPossible | amplifiesConcept | conceptId | judgementId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|
| 1 | baseline-intuitio-91 | false | true | adaptive-amplifie-83 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | pilot-intuitio-92 | true | false | distributed-amplifie-84 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | extended-intuitio-93 | false | true | baseline-amplifie-85 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | integrated-intuitio-94 | true | false | pilot-amplifie-86 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Intuition 1, labeled *baseline-intuitio-91*, is classified as non-sensible but possible, amplifying the adaptive-amplifie-83 mechanism. It connects concept 1 (*Pilot Cluster*) to judgement 1, establishing the first bridge from raw intuition to formalised judgement. Intuition 2 (*pilot-intuitio-92*) reverses the sensible/possible polarity—it is sensible but not possible—and links concept 2 (*Baseline Review*) to judgement 2. The pattern continues with intuition 3 (*extended-intuitio-93*) returning to non-sensible/possible, and intuition 4 (*integrated-intuitio-94*) settling on sensible/not possible. The `updatedAt` timestamps trail `createdAt` by exactly seven days across all entries, suggesting a review or validation cycle that follows the initial recording of each intuition.

## Analytical Statements: Explication and Contradiction

Analytical statements derive their truth from the meanings of their constituent concepts alone. The **AnalyticalStatement** table records four such statements, each decomposed into a subject concept, a predicate concept, and metadata flags indicating whether the statement is contradictory or explicative.

**Table `AnalyticalStatement`**

| id | statementText | subjectConcept | predicateConcept | isContradictory | isExplicative | conceptId | hasPredicateConceptConceptId |
|---|---|---|---|---|---|---|---|
| 1 | regional-statemen-60 | regional-subject-48 | compact-predicat-68 | false | true | 1 | 1 |
| 2 | legacy-statemen-61 | legacy-subject-49 | composite-predicat-69 | true | false | 2 | 2 |
| 3 | compact-statemen-62 | compact-subject-50 | primary-predicat-70 | false | true | 3 | 3 |
| 4 | composite-statemen-63 | composite-subject-51 | adaptive-predicat-71 | true | false | 4 | 4 |

Statement 1 (*regional-statemen-60*) pairs the subject *regional-subject-48* with the predicate *compact-predicat-68*. It is neither contradictory nor explicative, and it resolves to concept 1. Statement 2 (*legacy-statemen-61*) is explicitly contradictory—its subject *legacy-subject-49* and predicate *composite-predicat-69* cannot coherently coexist—and it is not explicative, mapping to concept 2. Statement 3 (*compact-statemen-62*) returns to non-contradictory, explicative status, linking *compact-subject-50* to *primary-predicat-70* under concept 3. Statement 4 (*composite-statemen-63*) mirrors statement 2's contradictory, non-explicative profile, connecting *composite-subject-51* to *adaptive-predicat-71* under concept 4. The `hasPredicateConceptConceptId` column mirrors the `conceptId` in every row, reinforcing the tight coupling between a statement's conceptual home and its predicate's conceptual origin.

## Synthetic A Priori Judgements: Necessity and Universality

Synthetic a priori judgements extend beyond the mere analysis of concepts. They are ampliative—they add new information—while simultaneously being necessary and universal in scope. The **SyntheticAPrioriJudgement** table captures this dual nature through a set of boolean flags and a reference to the proof method that grounds the judgement.

**Table `SyntheticAPrioriJudgement`**

| id | judgementText | isNecessary | isUniversal | isAmpliative | requiresIntuition | proofMethod | conceptId | hasPredicateConceptConceptId |
|---|---|---|---|---|---|---|---|---|
| 1 | baseline-judgemen-73 | true | true | true | true | primary-proof-16 | 1 | 1 |
| 2 | pilot-judgemen-74 | false | false | false | false | adaptive-proof-17 | 2 | 2 |
| 3 | extended-judgemen-75 | true | true | true | true | distributed-proof-18 | 3 | 3 |
| 4 | integrated-judgemen-76 | false | false | false | false | baseline-proof-19 | 4 | 4 |

Judgement 1 (*baseline-judgemen-73*) is necessary, universal, ampliative, and requires intuition. Its proof method is *primary-proof-16*, and it is anchored to concept 1. Judgement 2 (*pilot-judgemen-74*) inverts every flag: it is neither necessary nor universal, not ampliative, and does not require intuition, relying instead on *adaptive-proof-17* for concept 2. Judgement 3 (*extended-judgemen-75*) returns to the full-positive profile—necessary, universal, ampliative, intuition-requiring—with *distributed-proof-18* supporting concept 3. Judgement 4 (*integrated-judgemen-76*) mirrors judgement 2's negative profile, using *baseline-proof-19* for concept 4. The alternating pattern across the four judgements suggests a systematic exploration of the space of synthetic a priori possibility, with judgements 1 and 3 representing the ideal case and judgements 2 and 4 representing its negation.

## Empirical Judgements: Particularity and Contingency

Where synthetic a priori judgements claim universality, empirical judgements are grounded in particular observation and contingency. The **EmpiricalJudgement** table records four such judgements, each annotated with whether it is particular or contingent, whether it requires perception, and the observational context in which it was formed.

**Table `EmpiricalJudgement`**

| id | judgementText | isParticular | isContingent | requiresPerception | observationContext | conceptId | hasPredicateConceptConceptId |
|---|---|---|---|---|---|---|---|
| 100 | baseline-judgemen-73 | true | false | true | legacy-observat-49 | 1 | 1 |
| 101 | pilot-judgemen-74 | false | true | false | compact-observat-50 | 2 | 2 |
| 102 | extended-judgemen-75 | true | false | true | composite-observat-51 | 3 | 3 |
| 103 | integrated-judgemen-76 | false | true | false | primary-observat-52 | 4 | 4 |

Empirical judgement 100 (*baseline-judgemen-73*) is particular but not contingent, requires perception, and was observed in the legacy-observat-49 context, linking to concept 1. Empirical judgement 101 (*pilot-judgemen-74*) is not particular but is contingent, does not require perception, and originates from compact-observat-50, tied to concept 2. Empirical judgement 102 (*extended-judgemen-75*) returns to particular and non-contingent, requiring perception, observed in composite-observat-51, and connected to concept 3. Empirical judgement 103 (*integrated-judgemen-76*) mirrors judgement 101's profile—non-particular, contingent, perception-independent—emerging from primary-observat-52 and concept 4. The `observationContext` column provides the situational grounding for each judgement, distinguishing empirical knowledge from its a priori counterparts.

## Mathematical Statements: Construction and Universality

Mathematical statements occupy a middle ground between analytical and synthetic judgements. They are necessary and universal like synthetic a priori judgements, but they also carry a `requiresConstruction` flag that distinguishes them from purely conceptual analysis. The **MathematicalStatement** table records four such statements.

**Table `MathematicalStatement`**

| id | statementText | isNecessary | isUniversal | requiresConstruction | proofMethod | conceptId | hasPredicateConceptConceptId |
|---|---|---|---|---|---|---|---|
| 100 | regional-statemen-60 | true | true | false | primary-proof-16 | 1 | 1 |
| 101 | legacy-statemen-61 | false | false | true | adaptive-proof-17 | 2 | 2 |
| 102 | compact-statemen-62 | true | true | false | distributed-proof-18 | 3 | 3 |
| 103 | composite-statemen-63 | false | false | true | baseline-proof-19 | 4 | 4 |

Statement 100 (*regional-statemen-60*) is necessary and universal, does not require construction, and uses *primary-proof-16*, linking to concept 1. Statement 101 (*legacy-statemen-61*) is neither necessary nor universal and does require construction, relying on *adaptive-proof-17* for concept 2. Statement 102 (*compact-statemen-62*) returns to the necessary/universal, non-constructive profile with *distributed-proof-18* and concept 3. Statement 103 (*composite-statemen-63*) mirrors statement 101's contingent, constructive nature with *baseline-proof-19* and concept 4. The proof methods used here overlap with those in the synthetic a priori judgement table, suggesting a shared infrastructure of justification across different types of formal reasoning.

## Relational Tables: Connecting Judgements and Concepts

The system includes three relational tables that explicitly encode the connections between judgements, statements, and concepts. These tables serve as the join infrastructure that enables the analytical views described later in this chapter.

**Table `SyntheticAPrioriJudgementConcept`**

| judgementId | conceptId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `ConceptConcept`**

| conceptId | isConstructedFromConceptId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `MathematicalStatementConcept`**

| statementId | conceptId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

Each of these tables maps a judgement or statement identifier to a concept identifier, establishing the foreign-key relationships that allow the system to answer questions about which concepts underpin which judgements, which concepts relate to which other concepts, and which concepts ground which mathematical statements. The `hasPredicateConceptConceptId` column present across the base tables provides an additional layer of predicate-level linkage, ensuring that not only the subject but also the predicate of any statement or judgement can be traced back to its conceptual origin.

## Analytical Views: Joined Perspectives on the Data

The views in this system transform the flat relational structure into analytical lenses that answer specific questions about the relationships between statements, judgements, and concepts. Each view performs a join that brings together columns from multiple tables, enabling practitioners to reason about the data at a higher level of abstraction.

**View `analytical_statement_concept_view`**

```sql
CREATE VIEW analytical_statement_concept_view AS
SELECT a.id, a.statementText, a.subjectConcept, a.predicateConcept, b.conceptId AS concept_conceptId, b.conceptName AS concept_conceptName, b.isIncoherent AS concept_isIncoherent
FROM AnalyticalStatement a JOIN Concept b ON a.conceptId = b.conceptId;
```

| id | statementText | subjectConcept | predicateConcept | concept_conceptId | concept_conceptName | concept_isIncoherent |
|---|---|---|---|---|---|---|
| 1 | regional-statemen-60 | regional-subject-48 | compact-predicat-68 | 1 | Pilot Cluster | true |
| 2 | legacy-statemen-61 | legacy-subject-49 | composite-predicat-69 | 2 | Baseline Review | false |
| 3 | compact-statemen-62 | compact-subject-50 | primary-predicat-70 | 3 | Distributed Initiative A | true |
| 4 | composite-statemen-63 | composite-subject-51 | adaptive-predicat-71 | 4 | Adaptive Model | false |

The analytical statement concept view answers the question: "What concepts underpin each analytical statement, and how do their subject and predicate components relate?" Reading row 1, we see that *regional-statemen-60* draws on concept 1 (*Pilot Cluster*), with the subject *regional-subject-48* and predicate *compact-predicat-68* both traceable to the same conceptual home. Row 2 reveals that *legacy-statemen-61*, being contradictory, still maps cleanly to concept 2 (*Baseline Review*), demonstrating that even incoherent statements have a conceptual anchor.

**View `synthetic_a_priori_judgement_concept_view`**

```sql
CREATE VIEW synthetic_a_priori_judgement_concept_view AS
SELECT a.id, a.judgementText, a.isNecessary, a.isUniversal, b.conceptId AS concept_conceptId, b.conceptName AS concept_conceptName, b.isIncoherent AS concept_isIncoherent
FROM SyntheticAPrioriJudgement a JOIN Concept b ON a.conceptId = b.conceptId;
```

| id | judgementText | isNecessary | isUniversal | concept_conceptId | concept_conceptName | concept_isIncoherent |
|---|---|---|---|---|---|---|
| 1 | baseline-judgemen-73 | true | true | 1 | Pilot Cluster | true |
| 2 | pilot-judgemen-74 | false | false | 2 | Baseline Review | false |
| 3 | extended-judgemen-75 | true | true | 3 | Distributed Initiative A | true |
| 4 | integrated-judgemen-76 | false | false | 4 | Adaptive Model | false |

This view addresses: "Which synthetic a priori judgements are necessary and universal, and what proof methods support them?" Row 1 shows that *baseline-judgemen-73* is fully positive across all flags and relies on *primary-proof-16*. Row 3 shows that *extended-judgemen-75* mirrors this profile with *distributed-proof-18*, confirming that judgements 1 and 3 form a coherent pair of ideal synthetic a priori judgements within the system.

**View `synthetic_a_priori_judgement_concept_detail_view`**

```sql
CREATE VIEW synthetic_a_priori_judgement_concept_detail_view AS
SELECT a.id, a.judgementText, a.isNecessary, b.conceptId AS concept_conceptId, b.conceptName AS concept_conceptName, b.isIncoherent AS concept_isIncoherent
FROM SyntheticAPrioriJudgement a
  JOIN SyntheticAPrioriJudgementConcept j ON j.judgementId = a.id
  JOIN Concept b ON b.conceptId = j.conceptId;
```

| id | judgementText | isNecessary | concept_conceptId | concept_conceptName | concept_isIncoherent |
|---|---|---|---|---|---|
| 1 | baseline-judgemen-73 | true | 1 | Pilot Cluster | true |
| 1 | baseline-judgemen-73 | true | 2 | Baseline Review | false |
| 2 | pilot-judgemen-74 | false | 2 | Baseline Review | false |
| 2 | pilot-judgemen-74 | false | 3 | Distributed Initiative A | true |
| 3 | extended-judgemen-75 | true | 3 | Distributed Initiative A | true |
| 3 | extended-judgemen-75 | true | 4 | Adaptive Model | false |
| 4 | integrated-judgemen-76 | false | 4 | Adaptive Model | false |
| 4 | integrated-judgemen-76 | false | 1 | Pilot Cluster | true |

The detail view enriches the basic synthetic a priori judgement view by adding additional conceptual context. Row 1 presents *baseline-judgemen-73* alongside its full conceptual profile, including the intuition that grounds it (intuition 1, *baseline-intuitio-91*) and the amplification mechanism (adaptive-amplifie-83). This level of detail is essential for practitioners who need to trace a judgement back through its intuition to its conceptual foundation.

**View `empirical_judgement_concept_view`**

```sql
CREATE VIEW empirical_judgement_concept_view AS
SELECT a.id, a.judgementText, a.isParticular, a.isContingent, b.conceptId AS concept_conceptId, b.conceptName AS concept_conceptName, b.isIncoherent AS concept_isIncoherent
FROM EmpiricalJudgement a JOIN Concept b ON a.conceptId = b.conceptId;
```

| id | judgementText | isParticular | isContingent | concept_conceptId | concept_conceptName | concept_isIncoherent |
|---|---|---|---|---|---|---|
| 100 | baseline-judgemen-73 | true | false | 1 | Pilot Cluster | true |
| 101 | pilot-judgemen-74 | false | true | 2 | Baseline Review | false |
| 102 | extended-judgemen-75 | true | false | 3 | Distributed Initiative A | true |
| 103 | integrated-judgemen-76 | false | true | 4 | Adaptive Model | false |

This view answers: "What observational contexts produced each empirical judgement, and how do they relate to their underlying concepts?" Row 1 shows that *baseline-judgemen-73* emerged from legacy-observat-49 and is particular but not contingent, while row 2 shows that *pilot-judgemen-74* came from compact-observat-50 and is contingent but not particular. The view makes it straightforward to compare empirical judgements across different observational contexts.

**View `concept_concept_view`**

```sql
CREATE VIEW concept_concept_view AS
SELECT a.conceptId, a.conceptName, a.isIncoherent, a.isConstructible, b.conceptId AS concept_conceptId, b.conceptName AS concept_conceptName, b.isIncoherent AS concept_isIncoherent
FROM Concept a JOIN Concept b ON a.containsConceptId = b.conceptId;
```

| conceptId | conceptName | isIncoherent | isConstructible | concept_conceptId | concept_conceptName | concept_isIncoherent |
|---|---|---|---|---|---|---|
| 1 | Pilot Cluster | true | false | 1 | Pilot Cluster | true |
| 2 | Baseline Review | false | true | 2 | Baseline Review | false |
| 3 | Distributed Initiative A | true | false | 3 | Distributed Initiative A | true |
| 4 | Adaptive Model | false | true | 4 | Adaptive Model | false |

The concept concept view answers: "How do concepts relate to one another within the system?" This view surfaces the self-referential structure visible in the Concept table, where each concept's `containsConceptId` points to itself, and it also reveals any cross-concept relationships that may exist through the ConceptConcept relational table. Row 1 shows concept 1 (*Pilot Cluster*) in relation to itself, while row 2 shows the same pattern for concept 2 (*Baseline Review*).

**View `concept_concept_detail_view`**

```sql
CREATE VIEW concept_concept_detail_view AS
SELECT a.conceptId, a.conceptName, a.isIncoherent, b.conceptId AS concept_conceptId, b.conceptName AS concept_conceptName, b.isIncoherent AS concept_isIncoherent
FROM Concept a
  JOIN ConceptConcept j ON j.conceptId = a.conceptId
  JOIN Concept b ON b.conceptId = j.isConstructedFromConceptId;
```

| conceptId | conceptName | isIncoherent | concept_conceptId | concept_conceptName | concept_isIncoherent |
|---|---|---|---|---|---|
| 1 | Pilot Cluster | true | 1 | Pilot Cluster | true |
| 1 | Pilot Cluster | true | 2 | Baseline Review | false |
| 2 | Baseline Review | false | 2 | Baseline Review | false |
| 2 | Baseline Review | false | 3 | Distributed Initiative A | true |
| 3 | Distributed Initiative A | true | 3 | Distributed Initiative A | true |
| 3 | Distributed Initiative A | true | 4 | Adaptive Model | false |
| 4 | Adaptive Model | false | 4 | Adaptive Model | false |
| 4 | Adaptive Model | false | 1 | Pilot Cluster | true |

The detail view for concept-concept relationships adds additional metadata that helps practitioners understand the nature of each relationship. This view is particularly useful when auditing the conceptual graph for cycles, redundancies, or missing links.

**View `intuition_concept_view`**

```sql
CREATE VIEW intuition_concept_view AS
SELECT a.id, a.intuitionType, a.isSensible, a.isPossible, b.conceptId AS concept_conceptId, b.conceptName AS concept_conceptName, b.isIncoherent AS concept_isIncoherent
FROM Intuition a JOIN Concept b ON a.conceptId = b.conceptId;
```

| id | intuitionType | isSensible | isPossible | concept_conceptId | concept_conceptName | concept_isIncoherent |
|---|---|---|---|---|---|---|
| 1 | baseline-intuitio-91 | false | true | 1 | Pilot Cluster | true |
| 2 | pilot-intuitio-92 | true | false | 2 | Baseline Review | false |
| 3 | extended-intuitio-93 | false | true | 3 | Distributed Initiative A | true |
| 4 | integrated-intuitio-94 | true | false | 4 | Adaptive Model | false |

This view answers: "Which concepts are supported by which intuitions, and what are the properties of those intuitions?" Row 1 shows that concept 1 (*Pilot Cluster*) is supported by intuition 1 (*baseline-intuitio-91*), which is non-sensible but possible and amplifies the adaptive-amplifie-83 mechanism. Row 2 shows that concept 2 (*Baseline Review*) is supported by intuition 2 (*pilot-intuitio-92*), which is sensible but not possible. The view makes the intuition-concept pairing explicit and accessible.

**View `intuition_synthetic_a_priori_judgement_view`**

```sql
CREATE VIEW intuition_synthetic_a_priori_judgement_view AS
SELECT a.id, a.intuitionType, a.isSensible, a.isPossible, b.id AS judgement_id, b.judgementText AS judgement_judgementText, b.isNecessary AS judgement_isNecessary
FROM Intuition a JOIN SyntheticAPrioriJudgement b ON a.judgementId = b.id;
```

| id | intuitionType | isSensible | isPossible | judgement_id | judgement_judgementText | judgement_isNecessary |
|---|---|---|---|---|---|---|
| 1 | baseline-intuitio-91 | false | true | 1 | baseline-judgemen-73 | true |
| 2 | pilot-intuitio-92 | true | false | 2 | pilot-judgemen-74 | false |
| 3 | extended-intuitio-93 | false | true | 3 | extended-judgemen-75 | true |
| 4 | integrated-intuitio-94 | true | false | 4 | integrated-judgemen-76 | false |

This view bridges the gap between intuition and synthetic a priori judgement, answering: "Which intuitions feed into which synthetic a priori judgements?" Row 1 shows that intuition 1 (*baseline-intuitio-91*) feeds into judgement 1 (*baseline-judgemen-73*), while row 2 shows that intuition 2 (*pilot-intuitio-92*) feeds into judgement 2 (*pilot-judgemen-74*). This view is essential for understanding the cognitive pipeline that transforms raw intuition into formalised judgement.

**View `mathematical_statement_concept_view`**

```sql
CREATE VIEW mathematical_statement_concept_view AS
SELECT a.id, a.statementText, a.isNecessary, a.isUniversal, b.conceptId AS concept_conceptId, b.conceptName AS concept_conceptName, b.isIncoherent AS concept_isIncoherent
FROM MathematicalStatement a JOIN Concept b ON a.conceptId = b.conceptId;
```

| id | statementText | isNecessary | isUniversal | concept_conceptId | concept_conceptName | concept_isIncoherent |
|---|---|---|---|---|---|---|
| 100 | regional-statemen-60 | true | true | 1 | Pilot Cluster | true |
| 101 | legacy-statemen-61 | false | false | 2 | Baseline Review | false |
| 102 | compact-statemen-62 | true | true | 3 | Distributed Initiative A | true |
| 103 | composite-statemen-63 | false | false | 4 | Adaptive Model | false |

This view answers: "Which concepts ground each mathematical statement, and do they require construction?" Row 1 shows that statement 100 (*regional-statemen-60*) is grounded in concept 1 and does not require construction, while row 2 shows that statement 101 (*legacy-statemen-61*) is grounded in concept 2 and does require construction. The view makes the construction requirement immediately visible alongside the conceptual grounding.

**View `mathematical_statement_concept_detail_view`**

```sql
CREATE VIEW mathematical_statement_concept_detail_view AS
SELECT a.id, a.statementText, a.isNecessary, b.conceptId AS concept_conceptId, b.conceptName AS concept_conceptName, b.isIncoherent AS concept_isIncoherent
FROM MathematicalStatement a
  JOIN MathematicalStatementConcept j ON j.statementId = a.id
  JOIN Concept b ON b.conceptId = j.conceptId;
```

| id | statementText | isNecessary | concept_conceptId | concept_conceptName | concept_isIncoherent |
|---|---|---|---|---|---|
| 100 | regional-statemen-60 | true | 1 | Pilot Cluster | true |
| 100 | regional-statemen-60 | true | 2 | Baseline Review | false |
| 101 | legacy-statemen-61 | false | 2 | Baseline Review | false |
| 101 | legacy-statemen-61 | false | 3 | Distributed Initiative A | true |
| 102 | compact-statemen-62 | true | 3 | Distributed Initiative A | true |
| 102 | compact-statemen-62 | true | 4 | Adaptive Model | false |
| 103 | composite-statemen-63 | false | 4 | Adaptive Model | false |
| 103 | composite-statemen-63 | false | 1 | Pilot Cluster | true |

The detail view for mathematical statements adds proof method information and additional conceptual context, enabling practitioners to trace a mathematical statement from its proof method through its conceptual grounding to its predicate concept. Row 1 shows statement 100 using *primary-proof-16* and concept 1, while row 3 shows statement 102 using *distributed-proof-18* and concept 3, confirming the overlap in proof methods between mathematical and synthetic a priori reasoning.

## Synthesis

The system presented here forms a coherent architecture for formal reasoning. Concepts serve as the foundational atoms, each annotated with properties that determine their role in the broader system. Intuitions bridge the gap between raw conceptual understanding and formalised synthetic a priori judgements, while empirical judgements provide a parallel track grounded in observation and perception. Analytical statements and mathematical statements occupy their own niches, with the former deriving truth from conceptual analysis alone and the latter requiring construction in addition to necessity and universality. The relational tables and analytical views tie all of these elements together, enabling practitioners to navigate the space of statements, judgements, and concepts with precision. The alternating patterns visible across the data—between necessary and contingent, sensible and non-sensible, particular and universal—suggest a systematic exploration of the logical space, with each entry serving as a deliberate point in a broader conceptual map.