# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Apprenticeship Scheme
- **genus**: `cco:ont00000995`
- **definition**: A structured training program combining workplace experience with formal education, designed to develop specific occupational skills.
- **attributes**: schemeId, level, sector, durationMonths, status, frameworkId
- **relations**: hasFramework→TrainingFramework, targetsSector→EconomicSector, fundedBy→FundingInstrument

## Training Framework
- **genus**: `cco:ont00000958`
- **definition**: A standardized set of requirements and curricula defining the competencies and qualifications for a specific apprenticeship level.
- **attributes**: frameworkId, title, version, lastUpdated, competencyCount
- **relations**: definesLevel→ApprenticeshipScheme, mapsToQualification→Qualification

## Economic Sector
- **genus**: `bfo:0000040`
- **definition**: A distinct branch of the economy characterized by similar products, services, or production processes.
- **attributes**: sectorCode, sectorName, skillShortageLevel, apprenticeshipCapacity
- **relations**: hostsApprenticeships→ApprenticeshipScheme, experiencesShortage→SkillGap

## Apprenticeship Participant
- **genus**: `bfo:0000004`
- **definition**: An individual enrolled in an apprenticeship program, either as a new entrant or an existing employee reclassified.
- **attributes**: participantId, age, employmentStatus, gender, startDate, completionStatus
- **relations**: enrolledIn→ApprenticeshipScheme, employedBy→Employer, achievesQualification→Qualification

## Employer
- **genus**: `bfo:0000040`
- **definition**: An organization that hires individuals for apprenticeship programs and provides workplace training.
- **attributes**: employerId, name, sector, totalWorkforce, apprenticeCount, reclassificationRate
- **relations**: offersApprenticeships→ApprenticeshipScheme, hiresParticipants→ApprenticeshipParticipant, receivesFunding→FundingInstrument

## Funding Instrument
- **genus**: `cco:ont00000995`
- **definition**: A financial mechanism or policy tool used to subsidize or pay for apprenticeship training and related costs.
- **attributes**: instrumentId, type, amount, currency, eligibilityCriteria, effectiveDate
- **relations**: supportsApprenticeships→ApprenticeshipScheme, receivedBy→Employer, coversParticipant→ApprenticeshipParticipant

## Skill Gap
- **genus**: `bfo:0000015`
- **definition**: A discrepancy between the skills possessed by the workforce and the skills required by employers in a specific sector or occupation.
- **attributes**: gapId, sector, occupation, severity, estimatedShortage, reportedDate
- **relations**: affectsSector→EconomicSector, addressedByApprenticeships→ApprenticeshipScheme, linkedToQualification→Qualification

## Qualification
- **genus**: `cco:ont00000958`
- **definition**: A formal certification or credential awarded upon successful completion of an apprenticeship or educational program.
- **attributes**: qualificationId, title, level, issuingBody, credits, awardedDate
- **relations**: awardedTo→ApprenticeshipParticipant, definedByFramework→TrainingFramework, addressesSkillGap→SkillGap
