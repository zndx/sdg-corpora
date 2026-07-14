# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Vector Species
- **genus**: `cco:ont00000995`
- **definition**: A biological species identified as a primary transmitter of a pathogen within a specific geographic region.
- **attributes**: speciesCode, commonName, isPrimaryVector, breedingPreference, isUrbanAdapted
- **relations**: transmitsPathogen→Pathogen, observedIn→SurveillanceSite

## Pathogen
- **genus**: `cco:ont00000995`
- **definition**: A viral agent responsible for causing a specific disease outbreak within a defined population.
- **attributes**: pathogenCode, diseaseName, severityLevel, isEndemic, circulatingStrain
- **relations**: causesDiseaseIn→HumanPopulation, transmittedBy→VectorSpecies

## Surveillance Site
- **genus**: `bfo:0000015`
- **definition**: A specific geographic location or administrative district where entomological or clinical surveillance data is collected.
- **attributes**: siteCode, districtName, regionType, isEndemicZone, latitude, longitude
- **relations**: containsVectorPopulation→VectorSpecies, recordsClinicalCases→ClinicalCase, partOfCountry→AdministrativeRegion

## Clinical Case
- **genus**: `cco:ont00000995`
- **definition**: A recorded instance of a patient presenting with specific symptoms and diagnosed with a particular disease at a healthcare facility.
- **attributes**: caseID, diagnosisDate, symptomProfile, diseaseForm, patientAge, outcome
- **relations**: occurredAt→HealthcareFacility, infectionSource→Pathogen, reportedFrom→SurveillanceSite

## Healthcare Facility
- **genus**: `cco:ont00000995`
- **definition**: A medical institution where patients are admitted, diagnosed, and treated for infectious diseases.
- **attributes**: facilityCode, facilityName, facilityType, cityLocation, hasReferralCapacity
- **relations**: locatedIn→SurveillanceSite, treatsPathogen→Pathogen, receivesReferrals→HealthcareFacility

## Administrative Region
- **genus**: `bfo:0000015`
- **definition**: A defined geographic and political boundary, such as a district or country, used for organizing public health data.
- **attributes**: regionCode, regionName, regionLevel, borderingCountry, climateZone
- **relations**: containsSurveillanceSites→SurveillanceSite, governedBy→HealthAuthority

## Health Authority
- **genus**: `cco:ont00000995`
- **definition**: An organizational body responsible for public health oversight, policy implementation, and disease control within a region.
- **attributes**: authorityCode, authorityName, authorityType, isRegulatory, fundingSource
- **relations**: overseesRegion→AdministrativeRegion, fundsResearch→ResearchProject

## Research Project
- **genus**: `bfo:0000015`
- **definition**: A structured scientific investigation aimed at assessing environmental conditions, vector densities, and disease prevalence.
- **attributes**: projectCode, startDate, endDate, primaryObjective, isCompleted, methodologyType
- **relations**: conductedIn→AdministrativeRegion, fundedBy→HealthAuthority, producesDataFor→Pathogen
