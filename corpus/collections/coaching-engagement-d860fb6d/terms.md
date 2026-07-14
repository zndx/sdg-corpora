# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## A structured coaching engagement between a coach and a client
- **genus**: `bfo:0000015`
- **definition**: A structured coaching engagement between a coach and a client, involving sessions and outcomes.
- **attributes**: engagementId, startDate, endDate, status, sessionCount, coachingGoal
- **relations**: conductedBy→Coach, servedClient→Client, focusedOnTopic→CoachingTopic

## A professional providing coaching services
- **genus**: `bfo:0000015`
- **definition**: A professional providing coaching services, often with specific qualifications and experience.
- **attributes**: coachId, fullName, qualifications, yearsExperience, specialization, contactEmail, contactPhone
- **relations**: holdsMembership→ProfessionalMembership, deliversEngagement→CoachingEngagement

## An individual receiving coaching services
- **genus**: `bfo:00000995`
- **definition**: An individual receiving coaching services, often with specific professional or personal goals.
- **attributes**: clientId, fullName, occupation, industry, coachingNeeds, clientSince
- **relations**: receivesEngagement→CoachingEngagement

## A specific area or subject of coaching focus
- **genus**: `bfo:0000015`
- **definition**: A specific area or subject of coaching focus, such as work/life balance or stress management.
- **attributes**: topicId, topicName, description, category
- **relations**: coveredInEngagement→CoachingEngagement

## A professional organization or certification held by a coach
- **genus**: `bfo:0000023`
- **definition**: A professional organization or certification held by a coach, indicating their qualifications and standing.
- **attributes**: membershipId, organizationName, certificationLevel, issueDate, expiryDate
- **relations**: heldByCoach→Coach

## Feedback provided by a client about their coaching experience
- **genus**: `bfo:0000015`
- **definition**: Feedback provided by a client about their coaching experience, often including testimonials and ratings.
- **attributes**: feedbackId, feedbackDate, rating, testimonial, sentiment
- **relations**: providedByClient→Client, relatedToEngagement→CoachingEngagement
