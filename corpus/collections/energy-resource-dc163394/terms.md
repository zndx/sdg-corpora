# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Energy Resource
- **genus**: `cco:ont00000995`
- **definition**: A natural or engineered accumulation of energy-bearing matter or field that serves as a source for energy extraction.
- **attributes**: resourceIdentifier, resourceName, renewabilityStatus, exploitationRate, expectedReservesYears, shareInEnergyMix, classificationStandard
- **relations**: classifiedAs→EnergyClassification, subjectTo→EnergyExtraction, locatedIn→GeologicalFormation

## Energy Extraction
- **genus**: `bfo:0000015`
- **definition**: The industrial process of removing usable energy from a natural resource for conversion into power.
- **attributes**: extractionId, extractionDate, extractionMethod, extractionRate, sustainabilityStatus, capacityInstalled, capacityLimited
- **relations**: extractsFrom→EnergyResource, usesMechanism→HeatTransportMechanism, produces→EnergyOutput

## Heat Transport Mechanism
- **genus**: `bfo:0000015`
- **definition**: The physical process by which thermal energy moves within a geological system, determining recharge rates.
- **attributes**: mechanismId, mechanismType, transportSpeed, rechargeRate, timeScale
- **relations**: governs→EnergyResource, enables→EnergyExtraction

## Geological Formation
- **genus**: `bfo:0000040`
- **definition**: A distinct body of rock or fluid-bearing strata that constitutes the physical container for an energy resource.
- **attributes**: formationId, formationName, formationType, depth, temperature, locationRegion
- **relations**: contains→EnergyResource, exhibits→HeatTransportMechanism

## Energy Output
- **genus**: `cco:ont00000995`
- **definition**: The measurable quantity of energy produced or extracted from a resource during a specific period.
- **attributes**: outputId, outputDate, energyQuantity, unit, conversionType, sustainabilityLimit
- **relations**: derivedFrom→EnergyExtraction, supplies→EnergyResource
