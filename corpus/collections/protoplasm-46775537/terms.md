# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Biological Protoplasm
- **genus**: `cco:ont00000995`
- **definition**: The living substance of a cell that exhibits irritability and retains engram patterns from past stimuli.
- **attributes**: protoplasmId, originDate, irritabilityLevel, engramCount, nuclearIntelligence, protoplasmType
- **relations**: contains→Cell, exhibits→Irritability, retains→Engram

## Biological Cell
- **genus**: `cco:ont00000995`
- **definition**: The fundamental structural and functional unit of life, capable of division and containing protoplasm.
- **attributes**: cellId, divisionStage, nucleusPresent, cellType, creationDate
- **relations**: derivedFrom→Protoplasm, dividesInto→Cell, contains→Nucleus

## Cell Nucleus
- **genus**: `cco:ont00000995`
- **definition**: The central organelle of a cell containing genetic material and intelligence.
- **attributes**: nucleusId, intelligenceLevel, chromosomeCount, divisionState
- **relations**: partOf→Cell, dividesInto→Nucleus

## Memory Engram
- **genus**: `cco:ont00000995`
- **definition**: A persistent trace of a past stimulus and the protoplasm's reaction to it, forming the basis of memory.
- **attributes**: engramId, stimulusEnergy, reactionPattern, retentionDate, disorderAssociation
- **relations**: retainedBy→Protoplasm, causedBy→Stimulus, contributesTo→MentalDisorder

## Environmental Stimulus
- **genus**: `bfo:0000015`
- **definition**: An external energy or event that provokes a response from protoplasm.
- **attributes**: stimulusId, energyLevel, stimulusType, timestamp, source
- **relations**: affects→Protoplasm, triggers→Engram

## Psychological Disorder
- **genus**: `bfo:0000015`
- **definition**: A condition arising from accumulated engram patterns that disrupt normal mental functioning.
- **attributes**: disorderId, disorderName, severity, onsetDate, treatmentStatus
- **relations**: causedBy→Engram, affects→Human

## Human Individual
- **genus**: `bfo:0000004`
- **definition**: A living human being derived from ancestral protoplasm and shaped by early stimuli.
- **attributes**: humanId, birthDate, geneticLineage, earlyStimulusExposure, collectiveUnconsciousAccess
- **relations**: derivedFrom→Protoplasm, experiences→Stimulus, carries→Engram
