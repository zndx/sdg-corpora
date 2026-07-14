# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Small Group Discussion Session
- **genus**: `bfo:0000015`
- **definition**: A facilitated group discussion event focused on relational and spiritual development topics.
- **attributes**: sessionId, sessionDate, facilitatorName, topicTheme, discussionFormat, attendanceCount
- **relations**: focusesOn→RelationalConcept, includesQuestion→DiscussionQuestion

## Relational Concept or Theme
- **genus**: `cco:ont00000995`
- **definition**: A defined abstract concept or theme related to interpersonal relationships, self-care, or spiritual practice.
- **attributes**: conceptId, conceptName, conceptCategory, description, scriptureReference
- **relations**: discussedIn→SmallGroupSession, categorizes→SelfCareDomain

## Small Group Discussion Question
- **genus**: `cco:ont00000995`
- **definition**: A specific prompt or inquiry posed to participants during a small group session to facilitate reflection.
- **attributes**: questionId, questionText, questionNumber, requiresPersonalReflection, referencesScripture
- **relations**: belongs_to_session→SmallGroupSession, targets_concept→RelationalConcept

## Financial Support Record
- **genus**: `cco:ont00000958`
- **definition**: A record of financial support needs and contributions for a specific period or initiative.
- **attributes**: recordId, recordDate, amountNeeded, amountGiven, fundingGap, supportStatus
- **relations**: supports_initiative→MarriagePrayerFocus

## Marriage Prayer Focus
- **genus**: `bfo:0000015`
- **definition**: A specific spiritual intention or prayer focus directed towards strengthening marriages and relationships.
- **attributes**: focusId, focusMonth, primaryIntention, targetGroup, communityGoal
- **relations**: has_support_record→FinancialSupportRecord, promotes→GrowGroupCommunity

## Grow Group Community
- **genus**: `cco:ont00000995`
- **definition**: A structured relational environment or community group designed to encourage and equip participants.
- **attributes**: groupId, groupName, groupType, durationWeeks, costPerCouple, startDate, registrationStatus
- **relations**: serves→MarriagePrayerFocus, hosts_session→SmallGroupSession
