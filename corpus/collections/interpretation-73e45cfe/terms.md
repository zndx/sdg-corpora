# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Interpretation
- **genus**: `bfo:0000030`
- **definition**: A scholarly or theological perspective on the identity of the 'sons of God' in Genesis 6 and Job.
- **attributes**: interpretationId, interpretationName, primarySubject, isMainstream, isAuthorPreferred
- **relations**: discusses→BiblicalText, supports→TheologicalClaim, contradicts→Interpretation

## Biblical Text
- **genus**: `cco:ont00000958`
- **definition**: A specific passage or book within the Hebrew Bible/Old Testament, such as Genesis 6 or the Book of Job.
- **attributes**: textId, bookName, chapterNumber, verseRange, language, isHistoricNarrative
- **relations**: isInterpretedBy→Interpretation, contains→TheologicalClaim

## Theological Claim
- **genus**: `bfo:0000030`
- **definition**: A specific doctrinal or exegetical assertion derived from biblical texts, such as the identity of the 'sons of God' or the nature of the covenant.
- **attributes**: claimId, claimText, claimType, isCovenantal, isEschatological
- **relations**: isSupportedBy→BiblicalText, isContradictedBy→BiblicalText, isPartOf→Interpretation

## Covenant
- **genus**: `bfo:0000030`
- **definition**: A formal agreement or promise between God and humanity, such as the Adamic or Mosaic covenant, defining the relationship and expectations.
- **attributes**: covenantId, covenantName, isUnilateral, isBilateral, promises, requirements
- **relations**: involves→Humanity, establishes→TheologicalClaim, isReferencedIn→BiblicalText

## Humanity
- **genus**: `bfo:0000040`
- **definition**: The collective group of human beings, including specific lineages such as the seed of Seth, Cain, or Adam.
- **attributes**: humanityId, lineage, isGodly, isUngodly, isCovenantPeople
- **relations**: entersInto→Covenant, isSubjectTo→TheologicalClaim, intermarriesWith→Humanity
