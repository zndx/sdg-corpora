Based on the provided schema and data, here is the chapter:

```markdown
# Ontology-Grounded Relational Modelling: Judgement, Concept, and Statement

The domain under examination concerns the formal classification and interrelation of epistemic artefacts—statements, judgements, intuitions, and concepts—within a structured knowledge architecture. At its core, the model distinguishes three families of propositional content (analytical statements, synthetic a priori judgements, and empirical judgements), each annotated with domain-specific boolean flags and linked to a shared concept lattice. A fourth entity, `Intuition`, serves as a bridge between propositional content and the underlying conceptual infrastructure, while `MathematicalStatement` occupies a parallel track to the synthetic a priori family. The relational schema materialises this ontology through a combination of entity tables, junction tables for many-to-many relationships, and materialised views that reconstruct domain facts from the normalised grain.

**Table `AnalyticalStatement`**

| id | statementText | subjectConcept | predicateConcept | isContradictory | isExplicative | conceptId | hasPredicateConceptConceptId |
|---|---|---|---|---|---|---|---|
| 1 | regional-statemen-60 | regional-subject-48 | compact-predicat-68 | false | true | 1 | 1 |
| 2 | legacy-statemen-61 | legacy-subject-49 | composite-predicat-69 | true | false | 2 | 2 |
| 3 | compact-statemen-62 | compact-subject-50 | primary-predicat-70 | false | true | 3 | 3 |
| 4 | composite-statemen-63 | composite-subject-51 | adaptive-predicat-71 | true | false | 4 | 4 |

The `AnalyticalStatement` table captures propositions whose predicate is contained within the subject by virtue of meaning alone. Each row carries a `statementText` (e.g. `regional-statemen-60`), a `subjectConcept` and `predicateConcept` pair (such as `regional-subject-48` and `compact-predicat-68`), and two boolean attributes: `isContradictory` and `isExplicative`. The row with `id = 1` is non-contradictory and explicative, whereas `id = 2` (`legacy-statemen-61`) is contradictory and non-explicative. The `conceptId` column anchors the statement to a row in the `Concept` table, and `hasPredicateConceptConceptId` points to the predicate concept's own entry in that same table. This dual-reference pattern—subject and predicate each resolved through the `Concept` table—ensures that concept identity is maintained in a single source of truth.

**Table `SyntheticAPrioriJudgement`**

| id | judgementText | isNecessary | isUniversal | isAmpliative | requiresIntuition | proofMethod | conceptId | hasPredicateConceptConceptId |
|---|---|---|---|---|---|---|---|---|
| 1 | baseline-judgemen-73 | true | true | true | true | primary-proof-16 | 1 | 1 |
| 2 | pilot-judgemen-74 | false | false | false | false | adaptive-proof-17 | 2 | 2 |
| 3 | extended-judgemen-75 | true | true | true | true | distributed-proof-18 | 3 | 3 |
| 4 | integrated-judgemen-76 | false | false | false | false | baseline-proof-19 | 4 | 4 |

The `SyntheticAPrioriJudgement` table encodes judgements that extend knowledge beyond the subject concept yet claim necessity and universal validity. Its columns mirror the analytical family but introduce modal attributes: `isNecessary`, `isUniversal`, `isAmpliative`, and `requiresIntuition`, along with a `proofMethod` string. Row `id = 1` (`baseline-judgemen-73`) asserts all three modalities as true and requires intuition, with `primary-proof-16` as its proof method. By contrast, `id = 2` (`pilot-judgemen-74`) negates every modality and uses `adaptive-proof-17`. The `conceptId` and `hasPredicateConceptConceptId` columns again reference the `Concept` table, maintaining referential integrity with the shared concept lattice.

**Table `EmpiricalJudgement`**

| id | judgementText | isParticular | isContingent | requiresPerception | observationContext | conceptId | hasPredicateConceptConceptId |
|---|---|---|---|---|---|---|---|
| 100 | baseline-judgemen-73 | true | false | true | legacy-observat-49 | 1 | 1 |
| 101 | pilot-judgemen-74 | false | true | false | compact-observat-50 | 2 | 2 |
| 102 | extended-judgemen-75 | true | false | true | composite-observat-51 | 3 | 3 |
| 103 | integrated-judgemen-76 | false | true | false | primary-observat-52 | 4 | 4 |

Empirical judgements form the third propositional family. They are characterised by contingency and particularity rather than necessity and universality. The `EmpiricalJudgement` table includes `isParticular`, `isContingent`, and `requiresPerception` as boolean flags, plus an `observationContext` column that records the situational frame of the judgement. Row `id = 100` (`baseline-judgemen-73`) is particular, non-contingent, and perception-requiring, situated in `legacy-observat-49`. Row `id = 101` (`pilot-judgemen-74`) flips the particularity and contingency flags and moves to `compact-observat-50`. As with the other propositional tables, `conceptId` and `hasPredicateConceptConceptId` provide foreign-key links to `Concept`.

**Table `Concept`**

| conceptId | conceptName | isIncoherent | isConstructible | domain | containsConceptId | createdAt |
|---|---|---|---|---|---|---|
| 1 | Pilot Cluster | true | false | adaptive-domain-65 | 1 | 2025-01-01 00:14:00 |
| 2 | Baseline Review | false | true | distributed-domain-66 | 2 | 2025-02-06 03:14:00 |
| 3 | Distributed Initiative A | true | false | baseline-domain-67 | 3 | 2025-03-11 06:14:00 |
| 4 | Adaptive Model | false | true | pilot-domain-68 | 4 | 2025-04-16 09:14:00 |

The `Concept` table is the central entity of the schema. Each row represents a conceptual unit identified by `conceptId`, named via `conceptName` (e.g. `Pilot Cluster`, `Baseline Review`, `Distributed Initiative A`, `Adaptive Model`), and annotated with `isIncoherent` and `isConstructible` booleans. The `domain` column assigns each concept to a named domain such as `adaptive-domain-65` or `distributed-domain-66`. The `containsConceptId` column enables a self-referential hierarchy: concept 1 contains concept 1, concept 2 contains concept 2, and so on, forming a reflexive containment structure. The `createdAt` timestamp records when the concept was introduced into the ontology.

**Table `Intuition`**

| id | intuitionType | isSensible | isPossible | amplifiesConcept | conceptId | judgementId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|
| 1 | baseline-intuitio-91 | false | true | adaptive-amplifie-83 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | pilot-intuitio-92 | true | false | distributed-amplifie-84 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | extended-intuitio-93 | false | true | baseline-amplifie-85 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | integrated-intuitio-94 | true | false | pilot-amplifie-86 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `Intuition` table models the faculty that, in the synthetic a priori family, is declared as a requirement. Each intuition has an `intuitionType` (e.g. `baseline-intuitio-91`), boolean flags `isSensible` and `isPossible`, an `amplifiesConcept` column naming the concept it amplifies, and a `judgementId` that links it to a specific `SyntheticAPrioriJudgement` row. Row `id = 1` is non-sensible but possible, amplifies `adaptive-amplifie-83`, and is associated with judgement `id = 1`. The `conceptId` column again ties the intuition to the `Concept` table, while `createdAt` and `updatedAt` timestamps track its lifecycle.

**Table `MathematicalStatement`**

| id | statementText | isNecessary | isUniversal | requiresConstruction | proofMethod | conceptId | hasPredicateConceptConceptId |
|---|---|---|---|---|---|---|---|
| 100 | regional-statemen-60 | true | true | false | primary-proof-16 | 1 | 1 |
| 101 | legacy-statemen-61 | false | false | true | adaptive-proof-17 | 2 | 2 |
| 102 | compact-statemen-62 | true | true | false | distributed-proof-18 | 3 | 3 |
| 103 | composite-statemen-63 | false | false | true | baseline-proof-19 | 4 | 4 |

The `MathematicalStatement` table parallels the synthetic a priori family but is specialised for mathematical propositions. It carries `isNecessary`, `isUniversal`, and `requiresConstruction` flags, a `proofMethod` column, and the standard `conceptId` / `hasPredicateConceptConceptId` references. Row `id = 100` (`regional-statemen-60`) is necessary and universal but does not require construction, using `primary-proof-16`. Row `id = 101` (`legacy-statemen-61`) is neither necessary nor universal and does require construction, with `adaptive-proof-17`.

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

The `SyntheticAPrioriJudgementConcept` table is a junction table that resolves the many-to-many relationship between synthetic a priori judgements and concepts. It exists alongside the direct `conceptId` foreign key in `SyntheticAPrioriJudgement`, providing an explicit relational edge for cases where a single judgement participates in multiple conceptual relationships. The row with `id = 1` links judgement `id = 1` to concept `id = 1`.

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

The `ConceptConcept` table is a junction table for the self-referential concept lattice. It captures explicit pairwise relationships between concepts beyond the reflexive `containsConceptId` column in the `Concept` table itself. Row `id = 1` connects concept 1 to concept 1, row `id = 2` connects concept 2 to concept 2, and so forth, mirroring the containment structure.

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

The `MathematicalStatementConcept` table is the junction table for mathematical statements and concepts, analogous to `SyntheticAPrioriJudgementConcept`. Row `id = 1` links mathematical statement `id = 100` to concept `id = 1`.

## Views: Reconstructing Domain Facts

The materialised views in this schema serve as denormalised projections that answer specific domain questions by joining the normalised base tables. Each view corresponds to a particular relational pattern that recurs in the ontology.

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

The `analytical_statement_concept_view` joins `AnalyticalStatement` with `Concept` on `conceptId`, producing a single-row-per-statement projection that includes the statement text, its boolean annotations, and the resolved concept name. Reading row `id = 1`, the view yields `regional-statemen-60` alongside the concept `Pilot Cluster`, with `isContradictory = false` and `isExplicative = true`. This view answers the question: "What concept does this analytical statement belong to, and what are its logical properties?"

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

The `synthetic_a_priori_judgement_concept_view` performs the same join pattern for `SyntheticAPrioriJudgement`, attaching the concept name to each judgement row. Row `id = 1` produces `baseline-judgemen-73` with concept `Pilot Cluster`, `isNecessary = true`, `isUniversal = true`, `isAmpliative = true`, and `requiresIntuition = true`. The view answers: "Which concept grounds this synthetic a priori judgement, and what are its modal attributes?"

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

The `synthetic_a_priori_judgement_concept_detail_view` extends the basic join by also incorporating the predicate concept reference (`hasPredicateConceptConceptId`), yielding both the subject concept and the predicate concept in a single row. Row `id = 1` shows `baseline-judgemen-73` with subject concept `Pilot Cluster` and predicate concept `Pilot Cluster` (since `hasPredicateConceptConceptId = 1` matches `conceptId = 1`). This view answers: "What is the full conceptual scope of this judgement, including both subject and predicate?"

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

The `empirical_judgement_concept_view` joins `EmpiricalJudgement` with `Concept`, attaching the concept name and the `observationContext` to each empirical judgement. Row `id = 100` yields `baseline-judgemen-73` with concept `Pilot Cluster`, `isParticular = true`, `isContingent = false`, `requiresPerception = true`, and `observationContext = legacy-observat-49`. The view answers: "Under what observational context was this empirical judgement made, and which concept does it belong to?"

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

The `concept_concept_view` joins `ConceptConcept` with the `Concept` table on both ends, producing a row for each explicit concept-to-concept relationship with the names of both the source and target concepts. Row `id = 1` shows concept `Pilot Cluster` related to concept `Pilot Cluster`. This view answers: "Which concepts are explicitly related to which other concepts in the lattice?"

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

The `concept_concept_detail_view` enriches the basic concept-to-concept join by including the boolean annotations (`isIncoherent`, `isConstructible`) and domain assignment for both the source and target concepts. Row `id = 1` shows `Pilot Cluster` (incoherent, non-constructible, in `adaptive-domain-65`) related to itself. This view answers: "What are the full properties of both concepts involved in each explicit relationship?"

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

The `intuition_concept_view` joins `Intuition` with `Concept` on `conceptId`, attaching the concept name to each intuition row. Row `id = 1` yields `baseline-intuitio-91` with concept `Pilot Cluster`, `isSensible = false`, `isPossible = true`, and `amplifiesConcept = adaptive-amplifie-83`. The view answers: "Which concept does this intuition belong to, and what is its amplification target?"

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

The `intuition_synthetic_a_priori_judgement_view` joins `Intuition` with `SyntheticAPrioriJudgement` on `judgementId`, producing a row that pairs each intuition with its parent judgement. Row `id = 1` shows `baseline-intuitio-91` paired with `baseline-judgemen-73`, where the judgement has `isNecessary = true` and `requiresIntuition = true`. This view answers: "Which synthetic a priori judgement does this intuition support, and does that judgement actually require intuition?"

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

The `mathematical_statement_concept_view` joins `MathematicalStatement` with `Concept` on `conceptId`, attaching the concept name to each mathematical statement. Row `id = 100` yields `regional-statemen-60` with concept `Pilot Cluster`, `isNecessary = true`, `isUniversal = true`, and `requiresConstruction = false`. The view answers: "Which concept grounds this mathematical statement, and what are its modal properties?"

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

The `mathematical_statement_concept_detail_view` extends the basic join by also resolving the predicate concept (`hasPredicateConceptConceptId`), yielding both subject and predicate concept names. Row `id = 100` shows `regional-statemen-60` with subject concept `Pilot Cluster` and predicate concept `Pilot Cluster`. This view answers: "What is the full conceptual scope of this mathematical statement?"

## Synthesis

The schema models a domain of epistemic artefacts through a clean separation of concerns: propositional content (analytical statements, synthetic a priori judgements, empirical judgements, mathematical statements) is stored in parallel entity tables that share a common foreign-key pattern to the `Concept` table, while `Intuition` occupies a specialised role linking back to the synthetic a priori family. Junction tables (`SyntheticAPrioriJudgementConcept`, `ConceptConcept`, `MathematicalStatementConcept`) provide explicit many-to-many edges that the direct foreign keys alone cannot express. The materialised views reconstruct the domain facts that analysts actually care about—conceptual grounding of statements, concept-to-concept relationships, and intuition-judgement pairings—by performing the joins that the normalised schema requires. Every view name encodes its join pattern: the source table, the target table, and whether the join is basic or detailed (including the predicate concept). The result is a schema that is both faithful to the ontology and practical for querying.
```