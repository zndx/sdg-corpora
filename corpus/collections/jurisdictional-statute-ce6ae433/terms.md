# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Jurisdictional Statute
- **genus**: `cco:ont00000958`
- **definition**: A legislative enactment or regulatory instrument that governs the oil and gas industry within a specific jurisdiction.
- **attributes**: statuteIdentifier, enactmentDate, jurisdictionName, status, subjectMatter
- **relations**: governs→ExtractionWell, amends→JurisdictionalStatute

## Extraction Well
- **genus**: `cco:ont00000995`
- **definition**: A physical borehole or facility constructed for the purpose of extracting oil, gas, or mineral resources from the subsurface.
- **attributes**: wellIdentifier, completionDate, wellType, depthMeters, operatorName, status
- **relations**: locatedIn→LandParcel, operatedBy→ExtractionWell, produces→ResourceExtractionEvent

## Land Parcel
- **genus**: `bfo:0000015`
- **definition**: A defined geographic area of land, often with specific legal boundaries, used for resource extraction or surface rights management.
- **attributes**: parcelIdentifier, countyName, stateName, totalAreaAcres, zoningClassification, surfaceOwnerName
- **relations**: contains→ExtractionWell, subjectTo→LeaseAgreement, locatedIn→JurisdictionalStatute

## Resource Extraction Event
- **genus**: `bfo:0000015`
- **definition**: A discrete measurement or activity recording the volume, pressure, or quality of oil or gas extracted from a well at a specific time.
- **attributes**: eventIdentifier, measurementDateTime, volumeBarrels, volumeThousandCubicFeet, pressurePSI, fluidType
- **relations**: measuredAt→ExtractionWell, recordsExtractionFrom→LandParcel, compliesWith→JurisdictionalStatute

## Lease Agreement
- **genus**: `cco:ont00000958`
- **definition**: A legal contract granting rights to explore and extract oil or gas from a specific land parcel in exchange for royalties or bonuses.
- **attributes**: leaseIdentifier, effectiveDate, expirationDate, royaltyPercentage, bonusPaymentAmount, lessorName, lesseeName
- **relations**: covers→LandParcel, authorizes→ExtractionWell, governedBy→JurisdictionalStatute
