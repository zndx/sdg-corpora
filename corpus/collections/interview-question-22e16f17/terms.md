# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Interview Question
- **genus**: `cco:ont00000995`
- **definition**: A specific query posed by an interviewer to assess a candidate's qualifications, competencies, or fit for a role.
- **attributes**: questionId, questionText, category, isPanelQuestion, isBehavioral, priorityLevel
- **relations**: assessesCompetencyOf→JobRole, usedInInterviewFor→HiringProcess, hasExampleAnswer→CandidateResponse

## Job Role
- **genus**: `bfo:0000023`
- **definition**: A specific position or title within an organization that defines responsibilities and required skills.
- **attributes**: roleCode, roleTitle, department, level, isLeadershipRole, requiredSkills
- **relations**: hasInterviewQuestions→InterviewQuestion, requiresCompetencies→Competency, isPartOfOrganization→Organization

## Hiring Process
- **genus**: `bfo:0000015`
- **definition**: The structured activity or workflow through which an organization evaluates and selects candidates for a job role.
- **attributes**: processId, startDate, endDate, status, interviewFormat, totalCandidates
- **relations**: evaluatesCandidatesFor→JobRole, usesInterviewQuestions→InterviewQuestion, involvesInterviewers→Interviewer

## Candidate Response
- **genus**: `cco:ont00000995`
- **definition**: A recorded answer or behavioral example provided by a job candidate in response to an interview question.
- **attributes**: responseId, responseText, usesSTARMethod, competencyDemonstrated, ratingScore, submittedAt
- **relations**: answersQuestion→InterviewQuestion, providedByCandidate→Candidate, evaluatedInProcess→HiringProcess

## Competency
- **genus**: `bfo:0000015`
- **definition**: A measurable pattern of knowledge, skills, abilities, behaviors, and other characteristics that contribute to job performance.
- **attributes**: competencyId, competencyName, category, proficiencyLevel, assessmentCriteria
- **relations**: assessedByQuestions→InterviewQuestion, requiredForRole→JobRole, demonstratedByResponses→CandidateResponse

## Interviewer
- **genus**: `bfo:0000023`
- **definition**: An individual who conducts interviews to evaluate candidates for a specific job role.
- **attributes**: interviewerId, interviewerName, department, role, yearsExperience
- **relations**: conductsInterviewsFor→HiringProcess, evaluatesCandidatesFor→JobRole, asksQuestions→InterviewQuestion
