# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Bowler
- **genus**: `bfo:0000040`
- **definition**: A human participant registered to bowl in a tournament, identified by a unique book ID and tracked by their verified and declared scoring averages.
- **attributes**: bookId, fullName, declaredAverage, verifiedAverage, residentialAddress
- **relations**: participatedIn→Tournament, subjectOf→DisqualificationLetter

## Tournament
- **genus**: `bfo:0000040`
- **definition**: A scheduled competitive bowling event governed by specific rule sets, characterized by its name, location, and administrative management.
- **attributes**: tournamentName, location, managerName, managerAddress
- **relations**: enforcesRule→TournamentRule, awardsPrizeTo→Prize, manages→Bowler

## Tournament Rule
- **genus**: `bfo:0000031`
- **definition**: A normative standard or regulation governing participant conduct and scoring, identified by a specific code and description.
- **attributes**: ruleCode, ruleDescription, issuingBody
- **relations**: violatedBy→Bowler, governs→Tournament

## Disqualification Letter
- **genus**: `cco:ont00000958`
- **definition**: An official administrative document issued to a participant notifying them of their disqualification from prize consideration due to rule violations.
- **attributes**: issueDate, appealDeadlineDays, appealAddress, appealFax, appealEmail, status
- **relations**: issuedTo→Bowler, referencesRule→TournamentRule, issuedBy→Tournament

## Prize
- **genus**: `bfo:0000002`
- **definition**: A reward or award distributed to participants based on their performance, which may be contingent on adherence to tournament rules.
- **attributes**: prizeType, prizeValue, eligibilityStatus
- **relations**: awardedTo→Bowler, partOf→Tournament

## Appeal
- **genus**: `bfo:0000015`
- **definition**: A formal written request submitted by a disqualified participant to a governing body to contest a disqualification decision.
- **attributes**: submissionDate, postmarkDate, isWritten, outcome
- **relations**: challenges→DisqualificationLetter, submittedBy→Bowler, receivedBy→Tournament
