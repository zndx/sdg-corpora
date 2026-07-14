# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Clinical Study
- **genus**: `bfo:0000015`
- **definition**: A pragmatic clinical study designed to compare healthcare options in real-world practice settings to determine which works best for different kinds of patients.
- **attributes**: studyId, title, status, startDate, endDate, fundingAgency, primaryObjective
- **relations**: investigatedBy→Researcher, fundedBy→FundingAward, focusesOnCondition→MedicalCondition, comparesInterventions→Intervention, measuresOutcomes→ClinicalOutcome

## Researcher
- **genus**: `bfo:0000015`
- **definition**: A clinician, patient, or stakeholder partner involved in the design, conduct, or analysis of a pragmatic clinical study.
- **attributes**: researcherId, fullName, role, affiliation, credentials
- **relations**: leadsStudy→ClinicalStudy, collaboratesWith→Researcher

## Funding Award
- **genus**: `cco:ont00000995`
- **definition**: A formal grant or award issued by PCORI to fund a specific pragmatic clinical study.
- **attributes**: awardId, awardDate, totalAmount, durationMonths, status
- **relations**: fundsStudy→ClinicalStudy, issuedBy→FundingAgency

## Funding Agency
- **genus**: `bfo:0000015`
- **definition**: An organization responsible for providing financial support for clinical research, such as PCORI.
- **attributes**: agencyId, agencyName, website
- **relations**: issuesAwards→FundingAward

## Medical Condition
- **genus**: `bfo:0000015`
- **definition**: A disease, disorder, or health state that is the focus of a clinical study, such as cancer or cardiovascular disease.
- **attributes**: conditionId, conditionName, category
- **relations**: studiedIn→ClinicalStudy

## Intervention
- **genus**: `bfo:0000015`
- **definition**: A healthcare option, treatment, or care approach being evaluated in a clinical study, such as a drug, surgery, or screening method.
- **attributes**: interventionId, interventionName, type, dosage
- **relations**: comparedInStudy→ClinicalStudy

## Clinical Outcome
- **genus**: `bfo:0000015`
- **definition**: A measurable health effect or result tracked in a clinical study, such as symptom reduction, complication rate, or functional ability.
- **attributes**: outcomeId, outcomeName, measurementType, unit
- **relations**: measuredInStudy→ClinicalStudy
