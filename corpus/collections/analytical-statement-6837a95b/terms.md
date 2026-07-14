# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Analytical Statement
- **genus**: `bfo:0000015`
- **definition**: A statement whose predicate concept is contained within the subject concept, such that its truth is established by conceptual analysis alone without reference to experience.
- **attributes**: statementText, subjectConcept, predicateConcept, isContradictory, isExplicative
- **relations**: hasSubjectConcept→Concept, hasPredicateConcept→Concept

## Synthetic A Priori Judgement
- **genus**: `bfo:0000015`
- **definition**: A judgement that is ampliative (the predicate adds information not contained in the subject) yet necessary and universal, independent of empirical experience, such as mathematical truths.
- **attributes**: judgementText, isNecessary, isUniversal, isAmpliative, requiresIntuition, proofMethod
- **relations**: hasSubjectConcept→Concept, hasPredicateConcept→Concept, constructedFrom→Concept

## Empirical Judgement
- **genus**: `bfo:0000015`
- **definition**: A judgement that goes beyond mere conceptual analysis by relying on perception, intuition, or experience, such as observing a specific event.
- **attributes**: judgementText, isParticular, isContingent, requiresPerception, observationContext
- **relations**: hasSubjectConcept→Concept, hasPredicateConcept→Concept

## Concept
- **genus**: `bfo:0000015`
- **definition**: An abstract mental representation or term that serves as the subject or predicate of a judgement, which may be contained within or constructible from other concepts.
- **attributes**: conceptName, isIncoherent, isConstructible, domain
- **relations**: contains→Concept, isConstructedFrom→Concept

## Intuition
- **genus**: `bfo:0000015`
- **definition**: A sensible or perceptual act that amplifies concepts, particularly in mathematics, allowing for the construction of concepts and the justification of synthetic a priori judgements.
- **attributes**: intuitionType, isSensible, isPossible, amplifiesConcept
- **relations**: amplifies→Concept, justifies→SyntheticAPrioriJudgement

## Mathematical Statement
- **genus**: `bfo:0000015`
- **definition**: A specific type of synthetic a priori judgement involving numerical or geometric concepts that requires construction or intuition for its justification.
- **attributes**: statementText, isNecessary, isUniversal, requiresConstruction, proofMethod
- **relations**: hasSubjectConcept→Concept, hasPredicateConcept→Concept, constructedFrom→Concept
