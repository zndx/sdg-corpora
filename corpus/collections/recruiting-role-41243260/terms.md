# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Recruiting Role
- **genus**: `bfo:0000015`
- **definition**: A professional position within an organization that is currently open for recruitment or has recently been filled, defined by specific responsibilities and required qualifications.
- **attributes**: jobTitle, jobPostingId, department, location, postingDate, status
- **relations**: recruitedBy→Recruiter, postedBy→Organization, requiresSkill→ProfessionalSkill

## Recruiter
- **genus**: `bfo:0000015`
- **definition**: A professional responsible for identifying, attracting, and screening candidates for open positions within an organization.
- **attributes**: recruiterId, specialization, employmentStatus, lastContactDate, connectionStatus
- **relations**: employs→Organization, manages→RecruitingRole

## Candidate Profile
- **genus**: `cco:ont00000995`
- **definition**: A structured record representing a job seeker's professional history, skills, and qualifications, typically maintained as a resume or CV.
- **attributes**: profileId, headline, currentRole, industry, lastUpdated, isVerified
- **relations**: targetsRole→RecruitingRole, possessesSkill→ProfessionalSkill, submittedTo→RecruitingRole

## Organization
- **genus**: `bfo:0000004`
- **definition**: A structured social entity, such as a corporation or firm, that employs recruiters and posts job openings.
- **attributes**: orgId, legalName, industrySector, headquartersLocation, globalPresence, foundedYear
- **relations**: employs→Recruiter, posts→RecruitingRole, hasNewsEvent→CorporateNews

## Professional Skill
- **genus**: `bfo:0000016`
- **definition**: A specific capability, expertise, or qualification required for or possessed by a candidate in a professional context.
- **attributes**: skillId, skillName, proficiencyLevel, category, certificationRequired
- **relations**: requiredBy→RecruitingRole, possessedBy→CandidateProfile

## Corporate News
- **genus**: `cco:ont00000995`
- **definition**: A record of recent developments, investments, or strategic changes within an organization that may influence candidate motivation.
- **attributes**: newsId, headline, eventType, publicationDate, sourceUrl, impactLevel
- **relations**: pertainsTo→Organization, citedBy→CandidateProfile
