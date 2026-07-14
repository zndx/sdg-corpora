# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Household
- **genus**: `bfo:0000040`
- **definition**: A residential dwelling unit occupied by one or more persons for domestic purposes.
- **attributes**: householdId, address, occupancyStatus, constructionYear, floorArea
- **relations**: hasMeter→ElectricityMeter, hasAppliance→EnergyAppliance, hasProgram→HomeEnergyReductionProgram

## Electricity Meter
- **genus**: `cco:ont00000995`
- **definition**: A physical device installed at a household to measure cumulative electrical energy consumption in kilowatt-hours.
- **attributes**: meterId, installationDate, meterType, currentReading, lastCalibrationDate
- **relations**: measures→EnergyConsumptionEvent, serves→Household

## Energy Consumption Event
- **genus**: `bfo:0000015`
- **definition**: A discrete measurement instance recording the quantity of electrical energy consumed over a specific time interval by a metered household.
- **attributes**: eventTimestamp, consumptionKwh, intervalDuration, measurementQuality, tariffBand
- **relations**: recordedBy→ElectricityMeter, occursAt→Household, associatedWith→EnergyTariff

## Energy Tariff
- **genus**: `cco:ont00000958`
- **definition**: A structured pricing schedule published by an electricity provider that defines the rates, charges, and conditions applied to household energy consumption.
- **attributes**: tariffCode, providerName, baseCharge, ratePerKwh, effectiveDate, expirationDate
- **relations**: appliesTo→EnergyConsumptionEvent, issuedBy→ElectricityProvider

## Energy Appliance
- **genus**: `cco:ont00000995`
- **definition**: A physical electrical device installed in a household that consumes energy to perform a specific function.
- **attributes**: applianceId, applianceType, ratedPowerWatts, energyStarRating, purchaseDate, operationalStatus
- **relations**: locatedIn→Household, consumesEnergyIn→EnergyConsumptionEvent

## Home Energy Reduction Program
- **genus**: `bfo:0000015`
- **definition**: A structured intervention plan implemented by a professional service to identify, analyze, and reduce household electricity consumption and costs.
- **attributes**: programId, startDate, endDate, programStatus, targetSavingsPercent
- **relations**: targets→Household, implementedBy→EnergyConsultant, analyzes→EnergyConsumptionEvent

## Energy Consultant
- **genus**: `bfo:0000023`
- **definition**: A professional role held by an individual or business entity providing independent advice and services for household electricity reduction.
- **attributes**: consultantId, businessName, certificationLevel, contactEmail
- **relations**: implements→HomeEnergyReductionProgram, advisesOn→EnergyAppliance
