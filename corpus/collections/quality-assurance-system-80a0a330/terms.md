# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Quality Assurance System
- **genus**: `bfo:0000015`
- **definition**: A coordinated set of procedures, standards, and activities implemented to ensure and improve the quality of higher education institutions and programs within the East African Community region.
- **attributes**: systemId, name, startDate, status, region, frameworkVersion
- **relations**: developedBy→InstitutionalReform, supports→RegionalQualificationsFramework, monitoredBy→QualityAssuranceOffice

## Institutional Reform Process
- **genus**: `bfo:0000015`
- **definition**: A strategic reform process undertaken by the Inter-University Council for East Africa to reposition itself and address its expanded mandate within the East African Community framework.
- **attributes**: reformId, initiationDate, ratificationDate, legalBasis, status, mandateScope
- **relations**: initiatedBy→InterUniversityCouncil, resultedIn→QualityAssuranceSystem, alignedWith→EACFramework

## Regional Qualifications Framework
- **genus**: `cco:ont00000995`
- **definition**: A harmonized framework articulating the structure of education and training systems, qualification levels, credit systems, and recognition of prior learning to facilitate mutual recognition of qualifications across the East African Community.
- **attributes**: frameworkId, name, version, status, totalLevels, creditSystemType
- **relations**: developedBy→InterUniversityCouncil, supports→QualityAssuranceSystem, articulates→ProgrammeLearningOutcome

## Regional Quality Assurance Office
- **genus**: `bfo:0000015`
- **definition**: A dedicated office established at the IUCEA Secretariat to manage, coordinate, and oversee the implementation of the regional quality assurance system for higher education institutions.
- **attributes**: officeId, officeName, establishmentDate, location, status, staffCount
- **relations**: locatedAt→IUCEASecretariat, manages→QualityAssuranceSystem, conducts→CapacityBuildingTraining

## Capacity Building Training Program
- **genus**: `bfo:0000015`
- **definition**: Training programs provided to staff in universities and national higher education commissions/councils to build their capacity for implementing the regional quality assurance system.
- **attributes**: trainingId, title, startDate, endDate, targetAudience, status, participantsCount
- **relations**: organizedBy→QualityAssuranceOffice, deliveredTo→NationalCommission, covers→QualityAssuranceSystem

## National Higher Education Commission
- **genus**: `cco:ont00000995`
- **definition**: A national body responsible for higher education regulation and quality assurance within a specific Partner State of the East African Community, participating in the regional harmonization process.
- **attributes**: commissionId, name, country, establishmentDate, status, jurisdictionLevel
- **relations**: participatesIn→QualityAssuranceSystem, receivesTraining→CapacityBuildingTraining, collaboratesWith→University

## Higher Education Institution
- **genus**: `cco:ont00000995`
- **definition**: A higher education institution located within the East African Community region that is subject to the regional quality assurance system and participates in the harmonization of higher education.
- **attributes**: universityId, name, country, establishmentDate, status, accreditationStatus
- **relations**: subjectTo→QualityAssuranceSystem, locatedIn→NationalCommission, staffAttends→CapacityBuildingTraining
