# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Clinical Trial
- **genus**: `bfo:0000015`
- **definition**: A structured research study designed to evaluate the safety and efficacy of medical interventions in human participants.
- **attributes**: trialIdentifier, title, startDate, endDate, status, phase, primaryOutcome, sampleSize
- **relations**: hasIntervention→Intervention, hasControl→ControlGroup, measuredBy→OutcomeMeasure, conductedAt→ClinicalSite

## Intervention
- **genus**: `bfo:0000015`
- **definition**: A medical treatment, procedure, or exposure administered to participants in a clinical trial to assess its effects.
- **attributes**: interventionId, name, dosage, unit, frequency, route
- **relations**: assignedTo→ParticipantGroup, evaluatedIn→ClinicalTrial

## Control Group
- **genus**: `bfo:00000995`
- **definition**: A group of participants in a clinical trial who do not receive the experimental intervention, serving as a baseline for comparison.
- **attributes**: controlGroupId, type, size
- **relations**: partOf→ClinicalTrial, receives→ControlIntervention

## Control Intervention
- **genus**: `bfo:0000015`
- **definition**: The treatment or procedure given to the control group in a clinical trial, such as a placebo or standard care.
- **attributes**: controlInterventionId, name, dosage, unit
- **relations**: administeredTo→ControlGroup

## Outcome Measure
- **genus**: `bfo:0000015`
- **definition**: A specific metric or endpoint used to evaluate the effectiveness of an intervention in a clinical trial.
- **attributes**: measureId, name, type, unit, collectionMethod
- **relations**: usedIn→ClinicalTrial, measuredFor→ParticipantGroup

## Clinical Site
- **genus**: `bfo:0000015`
- **definition**: A physical location where clinical trial activities, such as participant recruitment and data collection, are conducted.
- **attributes**: siteId, name, address, city, state, country, principalInvestigator
- **relations**: hosts→ClinicalTrial, collectsDataFor→OutcomeMeasure
