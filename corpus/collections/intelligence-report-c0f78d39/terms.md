# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Intelligence Report
- **genus**: `cco:ont00000995`
- **definition**: A structured record of analyzed information regarding threats, suspicious behavior, or criminal activity, maintained and disseminated to law enforcement personnel.
- **attributes**: reportIdentifier, reportDate, classificationLevel, threatCategory, status, complianceStandard
- **relations**: storedIn→IntelligenceRepository, analyzedBy→IntelligenceAnalyst, concernsSubject→SubjectOfInterest, disseminatedTo→PartnerAgency

## Intelligence Repository
- **genus**: `bfo:0000040`
- **definition**: The physical or digital facility, such as the Delaware Valley Intelligence Center, that serves as the central storage and processing hub for intelligence data and personnel.
- **attributes**: facilityIdentifier, facilityName, locationCity, locationState, operationalStatus, jurisdictionCoverage
- **relations**: housesUnit→IntelligenceUnit, storesReport→IntelligenceReport, employsPersonnel→IntelligenceAnalyst

## Intelligence Unit
- **genus**: `bfo:0000004`
- **definition**: A specialized organizational entity, such as the DVIC Unit, responsible for the collection, analysis, and dissemination of intelligence within a specific jurisdiction or partnership.
- **attributes**: unitCode, unitName, parentOrganization, missionScope, establishmentDate
- **relations**: operatesIn→IntelligenceRepository, employsAnalyst→IntelligenceAnalyst, coordinatesWith→PartnerAgency, producesReport→IntelligenceReport

## Intelligence Analyst
- **genus**: `bfo:0000004`
- **definition**: A law enforcement personnel or partner agency representative assigned to collect, review, analyze, and disseminate intelligence information.
- **attributes**: analystBadgeNumber, analystName, agencyAffiliation, clearanceLevel, assignmentDate, status
- **relations**: assignedToUnit→IntelligenceUnit, basedAt→IntelligenceRepository, analyzesReport→IntelligenceReport, representsAgency→PartnerAgency

## Partner Agency
- **genus**: `bfo:0000004`
- **definition**: A governmental, non-governmental, or private sector entity that collaborates with the DVIC Unit for intelligence sharing, analysis, and public safety.
- **attributes**: agencyIdentifier, agencyName, agencyType, jurisdictionRegion, contactEmail
- **relations**: collaboratesWithUnit→IntelligenceUnit, receivesReport→IntelligenceReport, employsAnalyst→IntelligenceAnalyst, sharesDataWith→PartnerAgency

## Subject of Interest
- **genus**: `bfo:0000002`
- **definition**: An individual, group, or entity that is the target of intelligence collection and analysis due to suspected involvement in criminal activity, threats, or hazards.
- **attributes**: subjectIdentifier, subjectName, subjectType, riskLevel, lastKnownLocation, associatedThreats
- **relations**: monitoredBy→IntelligenceUnit, documentedInReport→IntelligenceReport, linkedToActivity→SuspiciousActivityReport

## Suspicious Activity Report
- **genus**: `cco:ont00000995`
- **definition**: A specific type of intelligence record documenting observed suspicious behavior or activity that may lead to a criminal act, subject to strict privacy and compliance review.
- **attributes**: sarIdentifier, reportDate, activityType, reviewStatus, privacyComplianceCheck, reviewingAnalystID
- **relations**: managedByUnit→IntelligenceUnit, concernsSubject→SubjectOfInterest, derivedFromObservation→IntelligenceReport, disseminatedTo→PartnerAgency
