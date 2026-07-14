# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Role Concept
- **genus**: `bfo:0000040`
- **definition**: A theoretical construct representing the concept of 'role' as understood through various perspectives such as symbolic interactionism, psychology, and organizational theory.
- **attributes**: conceptId, originLanguage, theoreticalPerspective, definitionText, relatedConcepts
- **relations**: influences→RoleEnactment, influences→RolePerception

## Role Enactment
- **genus**: `bfo:0000015`
- **definition**: The process by which community learning disability nurses (CLDNs) carry out their roles in meeting the healthcare needs of people with learning disabilities.
- **attributes**: enactmentId, qualityOfEnactment, influencingFactors, interAgencyBoundaries, roleConflictPresent
- **relations**: influencedBy→RoleConcept, performedBy→CLDN, affects→HealthcareDelivery

## Role Perception
- **genus**: `bfo:0000015`
- **definition**: The way in which community learning disability nurses (CLDNs) understand and interpret their roles based on interactions and expectations.
- **attributes**: perceptionId, clarityLevel, influencingFactors, publicHealthRoles, reflexivePractice
- **relations**: influencedBy→RoleConcept, perceivedBy→CLDN, affects→RoleEnactment

## Community Learning Disability Nurse
- **genus**: `bfo:0000002`
- **definition**: A healthcare professional specializing in providing care to individuals with learning disabilities in community settings.
- **attributes**: nurseId, specialization, yearsOfExperience, interAgencyCollaboration, roleClarity
- **relations**: enacts→RoleEnactment, perceives→RolePerception, collaboratesWith→InterAgencyBoundary

## Healthcare Delivery
- **genus**: `bfo:0000015`
- **definition**: The process of providing healthcare services to individuals with learning disabilities, influenced by the clarity and enactment of roles by community learning disability nurses.
- **attributes**: deliveryId, serviceType, complexityLevel, patientNeeds, effectiveness
- **relations**: providedBy→CLDN, influencedBy→RoleEnactment, serves→Patient

## Inter-Agency Boundary
- **genus**: `bfo:0000040`
- **definition**: The boundaries between different agencies involved in the care of individuals with learning disabilities, which can influence role enactment and clarity.
- **attributes**: boundaryId, agencyType, tensionLevel, encroachmentPresent, impactOnRole
- **relations**: crossedBy→CLDN, influences→RoleEnactment, affects→RolePerception
