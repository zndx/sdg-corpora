# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Person with Albinism
- **genus**: `bfo:0000040`
- **definition**: A human individual who has albinism, characterized by low vision and reduced skin pigmentation.
- **attributes**: personId, name, dateOfBirth, visionLevel, skinSensitivity, currentLocation, enrolledInProgram
- **relations**: enrolledIn→EducationProgram, experiencesStigmaFrom→SocialStigma, requiresAccommodation→EnvironmentalAccommodation

## Inclusive Education Program
- **genus**: `bfo:0000040`
- **definition**: A structured educational initiative designed to integrate persons with albinism into mainstream schooling while providing necessary support.
- **attributes**: programId, programName, startDate, endDate, status, targetDemographic, fundingSource
- **relations**: deliversTo→PersonWithAlbinism, operatesIn→MainstreamSchool, providesAccommodation→EnvironmentalAccommodation

## Mainstream Educational Institution
- **genus**: `bfo:0000040`
- **definition**: A standard educational facility that integrates students with albinism into general education without segregation.
- **attributes**: schoolId, schoolName, location, academicStandard, enrollmentCapacity, hasInclusivePolicy, lastInspectionDate
- **relations**: hostsStudents→PersonWithAlbinism, implementsAccommodation→EnvironmentalAccommodation, reducesStigmaFor→SocialStigma

## Environmental Accommodation
- **genus**: `bfo:0000040`
- **definition**: Physical or procedural adjustments made to support persons with albinism, such as lighting control or seating arrangements.
- **attributes**: accommodationId, accommodationType, implementationDate, effectivenessRating, status, description
- **relations**: providedAt→MainstreamSchool, benefits→PersonWithAlbinism, supports→EducationProgram

## Social Stigma Against Albinism
- **genus**: `bfo:0000040`
- **definition**: Negative social attitudes, discrimination, and isolation experienced by persons with albinism due to misconceptions and myths.
- **attributes**: stigmaId, stigmaType, severityLevel, location, dateReported, source
- **relations**: affects→PersonWithAlbinism, mitigatedBy→MainstreamSchool, counteredBy→EducationProgram
