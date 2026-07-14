# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Legal Case
- **genus**: `bfo:0000040`
- **definition**: A specific legal proceeding or dispute involving parties, evidence, and a judicial outcome.
- **attributes**: caseIdentifier, courtName, caseType, yearFiled, status, judgmentDate, citation
- **relations**: hasDefendant→LegalPerson, hasProsecutor→LegalPerson, hasJudge→LegalPerson, hasOutcome→Judgment

## Legal Person
- **genus**: `bfo:0000004`
- **definition**: A natural or legal person involved in legal proceedings, including barristers, judges, and parties.
- **attributes**: personId, fullName, role, jurisdiction, qualificationYear, specialization
- **relations**: represents→LegalCase, judges→LegalCase, isMemberOf→ProfessionalBody

## Judgment
- **genus**: `bfo:0000040`
- **definition**: The formal decision or ruling issued by a court or tribunal in a legal case.
- **attributes**: judgmentId, rulingType, sentenceLength, fineAmount, legalReasoning, appealStatus
- **relations**: issuedIn→LegalCase, appliesTo→LegalStatute

## Legal Statute
- **genus**: `bfo:0000040`
- **definition**: A written law or regulation enacted by a legislative body, such as an Act of Parliament.
- **attributes**: statuteId, title, enactmentYear, jurisdiction, sectionNumber, status
- **relations**: amends→LegalStatute, isAmendedBy→LegalStatute

## Professional Body
- **genus**: `bfo:0000040`
- **definition**: An organization that regulates or represents professionals in a specific field, such as law.
- **attributes**: bodyId, name, foundingYear, jurisdiction, membershipType
- **relations**: hasMember→LegalPerson

## Legal Publication
- **genus**: `bfo:0000040`
- **definition**: A written work, such as an article or book, discussing legal topics, cases, or practices.
- **attributes**: pubId, title, publicationDate, publisher, journalName, topic
- **relations**: authoredBy→LegalPerson, cites→LegalCase
