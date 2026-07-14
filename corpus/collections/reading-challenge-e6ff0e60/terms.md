# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Reading Challenge
- **genus**: `bfo:0000015`
- **definition**: A structured reading activity where participants select and complete books from a categorized list to earn awards.
- **attributes**: challengeId, startDate, endDate, institutionName, yearGroup, status
- **relations**: hasParticipant→ReadingParticipant, hasAwardTier→AwardTier

## Reading Participant
- **genus**: `bfo:0000015`
- **definition**: An individual student enrolled in a specific reading challenge who records their reading progress.
- **attributes**: participantId, fullName, yearGroup, enrollmentDate, status
- **relations**: participatesIn→ReadingChallenge, recordsReading→ReadingRecord

## Reading Record
- **genus**: `cco:ont00000995`
- **definition**: A documented entry capturing the details of a single book read by a participant, including metadata and completion date.
- **attributes**: recordId, bookTitle, authorName, completionDate, category, pageCount, coverColor, isRecommended, recommendedBy
- **relations**: recordedBy→ReadingParticipant, fulfillsCategory→ReadingCategory, referencesBook→Book

## Book
- **genus**: `cco:ont00000995`
- **definition**: A published literary work with identifiable metadata such as title, author, and physical characteristics.
- **attributes**: bookId, title, authorName, pageCount, genre, coverColor, hasAward, isPoetry, isNonFiction, isWordless
- **relations**: citedIn→ReadingRecord, matchesCategory→ReadingCategory

## Reading Category
- **genus**: `bfo:0000023`
- **definition**: A thematic or descriptive constraint applied to book selection within a reading challenge.
- **attributes**: categoryId, categoryName, description, isRequired, yearGroup
- **relations**: appliesToChallenge→ReadingChallenge, constrainsBook→Book

## Award Tier
- **genus**: `bfo:0000023`
- **definition**: A recognition level granted to participants upon completing a specified number of reading records.
- **attributes**: awardId, awardName, requiredCount, ceremonyDate, status
- **relations**: grantedForChallenge→ReadingChallenge, earnedBy→ReadingParticipant
