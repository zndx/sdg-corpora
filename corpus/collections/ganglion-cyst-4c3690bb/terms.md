# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Ganglion Cyst
- **genus**: `cco:ont00000995`
- **definition**: A benign, thin-walled, pseudocyst containing clear gelatinous fluid, typically originating from connective tissue such as joint capsules or tendon sheaths in the foot and ankle.
- **attributes**: cystId, diameterCm, isMultilocular, cystLocation, cystType, containsMucinousFluid, hasSynovialLining
- **relations**: locatedIn→AnatomicalRegion, originatesFrom→ConnectiveTissue, causesCompressionOf→NerveFascicle, diagnosedBy→ImagingStudy

## Anatomical Region
- **genus**: `bfo:0000015`
- **definition**: A specific anatomical location within the foot and ankle where ganglion cysts are found, such as the dorsum of the foot, ankle, or tarsal sinus.
- **attributes**: regionId, regionName, isSubchondral, isNearJoint, isNearTendonSheath
- **relations**: contains→GanglionCyst, contains→NerveFascicle

## Connective Tissue
- **genus**: `cco:ont00000995`
- **definition**: The structural tissue from which ganglion cysts originate, including joint capsules, tendon sheaths, and periosteum.
- **attributes**: tissueId, tissueType, isDegenerated, hasCollagenSheets
- **relations**: originates→GanglionCyst

## Nerve Fascicle
- **genus**: `bfo:0000015`
- **definition**: A bundle of nerve fibers that can be compressed by ganglion cysts, leading to symptoms such as pain, paresthesias, weakness, and muscle atrophy.
- **attributes**: nerveId, nerveName, isCompressed, hasParesthesia, hasWeakness, hasAtrophy
- **relations**: compressedBy→GanglionCyst

## Imaging Study
- **genus**: `bfo:0000015`
- **definition**: A diagnostic procedure using ultrasound or Magnetic Resonance Imaging to visualize and characterize ganglion cysts in the foot and ankle.
- **attributes**: studyId, studyDate, modality, isDiagnostic, findingsDescription
- **relations**: diagnoses→GanglionCyst

## Pathological Specimen
- **genus**: `cco:ont00000995`
- **definition**: A tissue sample from a ganglion cyst examined macroscopically and microscopically to confirm diagnosis and characterize its structure.
- **attributes**: specimenId, collectionDate, isMultilobulated, hasMucinousFluid, hasSynovialEpithelium, hasFibroConnectiveTissue
- **relations**: derivedFrom→GanglionCyst, examinedBy→PathologicalAnalysis

## Pathological Analysis
- **genus**: `bfo:0000015`
- **definition**: The microscopic and macroscopic examination of a pathological specimen to identify the presence of proteinaceous material, dense fibro-connective tissue, and the absence of synovial epithelium.
- **attributes**: analysisId, analysisDate, stainingMethod, hasCollagenSheets, hasFibroblasts, hasMesenchymalCells, hasNecrosis, hasInflammatoryChanges
- **relations**: analyzes→PathologicalSpecimen
