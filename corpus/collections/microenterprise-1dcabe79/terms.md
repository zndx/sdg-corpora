# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Microenterprise
- **genus**: `bfo:0000040`
- **definition**: A small-scale industrial or commercial business entity operating within the Loom sub-sector that is the target of the RECP project interventions.
- **attributes**: identifier, legalName, clusterLocation, sectorType, registrationDate, isDemonstrationSite
- **relations**: participatesIn→ProjectActivity, adopts→RECPPractice

## Resource-Efficient Cleaner Production Practice
- **genus**: `bfo:0000040`
- **definition**: A specific climate-resilient, resource-efficient, or circular economy intervention adopted by microenterprises to improve green growth.
- **attributes**: practiceCode, practiceName, category, resourceEfficiencyGain, climateResilienceScore, adoptionStatus
- **relations**: implementedBy→Microenterprise, describedIn→TrainingMaterial

## Project Activity
- **genus**: `bfo:0000015`
- **definition**: A scheduled intervention, event, or process executed under the SMART sub-project to promote RECP practices among microenterprises.
- **attributes**: activityID, activityType, startDate, endDate, status, location
- **relations**: targets→Microenterprise, executedBy→ProjectStaff, reportsTo→ProgressReport
