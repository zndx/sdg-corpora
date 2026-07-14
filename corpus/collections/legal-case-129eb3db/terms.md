# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Legal Case
- **genus**: `bfo:0000040`
- **definition**: A specific legal proceeding or dispute involving parties, charges, and outcomes.
- **attributes**: caseIdentifier, courtName, caseType, dateFiled, status, jurisdiction
- **relations**: hasDefendant→LegalPerson, hasProsecutor→LegalPerson, hasOutcome→LegalOutcome, isRelatedTo→LegalStatute

## Legal Person
- **genus**: `bfo:0000002`
- **definition**: A natural or legal entity involved in legal proceedings, including barristers, judges, and parties.
- **attributes**: fullName, role, qualification, barCircuit, specialization
- **relations**: represents→LegalCase, sitsAs→JudicialRole, isMemberOf→ProfessionalBody

## Legal Outcome
- **genus**: `bfo:0000040`
- **definition**: The result or disposition of a legal case, including sentences, rulings, or findings.
- **attributes**: outcomeType, dateIssued, sentenceLength, fineAmount, isAppealed
- **relations**: resultsFrom→LegalCase, appliesTo→LegalStatute

## Legal Statute
- **genus**: `bfo:0000040`
- **definition**: A written law or regulation enacted by a legislative body, such as an Act of Parliament.
- **attributes**: statuteName, yearEnacted, sectionNumber, jurisdiction, status
- **relations**: governs→LegalCase, isAmendedBy→LegalStatute

## Professional Body
- **genus**: `bfo:0000040`
- **definition**: An organization representing legal professionals, such as associations or societies.
- **attributes**: bodyName, foundingYear, membershipType, focusArea
- **relations**: hasMember→LegalPerson, publishesGuidance→LegalDocument

## Legal Document
- **genus**: `bfo:0000040`
- **definition**: A formal written record, such as a publication, report, or submission, related to legal matters.
- **attributes**: documentTitle, publicationDate, publisher, documentType, coAuthor
- **relations**: discusses→LegalCase, isRelatedTo→LegalStatute, isPublishedBy→ProfessionalBody
