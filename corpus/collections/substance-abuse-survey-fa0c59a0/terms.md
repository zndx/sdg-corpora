# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Substance Abuse Survey
- **genus**: `cco:ont00000995`
- **definition**: A structured data collection instrument and resulting dataset used to quantify the prevalence of substance abuse forms and the availability of treatment resources across Indiana counties.
- **attributes**: surveyId, conductedDate, responseRate, totalCountiesResponded, dataFormat, status
- **relations**: measuredBy→SubstanceAbuseForm, conductedBy→CommissioningAgency, coversJurisdiction→CountyJurisdiction

## Substance Abuse Form
- **genus**: `cco:ont00000995`
- **definition**: A specific category of psychoactive substance or drug identified as a target of abuse within the population, quantified by prevalence rates in survey data.
- **attributes**: formCode, formName, prevalenceRate, riskCategory, isControlledSubstance
- **relations**: recordedIn→SubstanceAbuseSurvey, treatedAt→TreatmentFacility

## Treatment Facility
- **genus**: `cco:ont00000995`
- **definition**: A physical or organizational entity providing outpatient, inpatient, or opioid-specific medical treatment and prevention services for substance use disorders.
- **attributes**: facilityId, facilityName, facilityType, countyLocation, capacity, acceptsMedicaid
- **relations**: locatedIn→CountyJurisdiction, treatsSubstance→SubstanceAbuseForm, fundedBy→FundingSource

## Funding Source
- **genus**: `cco:ont00000995`
- **definition**: A financial instrument, grant, or revenue stream (such as fines, fees, or legislative appropriations) allocated to support substance abuse prevention, treatment, or coordination councils.
- **attributes**: fundingId, sourceName, totalAmount, currency, fiscalYear, allocationType
- **relations**: supports→TreatmentFacility, supports→CoordinatingCouncil, administeredBy→CommissioningAgency

## Local Coordinating Council
- **genus**: `cco:ont00000995`
- **definition**: A local community body responsible for coordinating substance abuse prevention and treatment resources, often funded by community fines and fees, and eligible for state grants.
- **attributes**: councilId, councilName, countyServed, hasFundingAvailable, utilizationRate, establishedDate
- **relations**: locatedIn→CountyJurisdiction, receivesFundingFrom→FundingSource, coordinatesWith→TreatmentFacility

## Referral Event
- **genus**: `bfo:0000015`
- **definition**: A process activity wherein an individual is directed from a source system (such as criminal justice) to a treatment facility for substance abuse intervention and care.
- **attributes**: referralId, referralDate, monthlyVolume, sourceSystem, outcomeStatus, recidivismRate
- **relations**: initiatedBy→CommissioningAgency, directedTo→TreatmentFacility, involvesPatient→PatientDemographic

## Patient Demographic
- **genus**: `cco:ont00000995`
- **definition**: A statistical record or profile describing the population characteristics of individuals seeking or receiving substance abuse treatment, including race, gender, and insurance status.
- **attributes**: demographicId, primaryRace, primaryGender, hasHealthInsurance, isVeteran, isPregnant, accessToCare
- **relations**: receivesTreatmentAt→TreatmentFacility, subjectOf→ReferralEvent, coveredBy→FundingSource
