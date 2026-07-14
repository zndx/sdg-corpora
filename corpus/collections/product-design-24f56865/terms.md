# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Product Design
- **genus**: `cco:ont00000995`
- **definition**: A designed artifact representing a conceptual or physical product, such as a digital camera or industrial object.
- **attributes**: designIdentifier, designName, designStatus, creationDate, designerRole, renderingComplexity
- **relations**: createdBy→Designer, usesSoftware→SoftwareTool, participatedIn→DesignCompetition, hasRender→PhotorealisticRender

## Designer
- **genus**: `bfo:0000023`
- **definition**: A person or entity responsible for the conceptualization and development of product designs.
- **attributes**: designerId, designerName, employmentStatus, careerStartYear, primarySkill, contactEmail
- **relations**: created→ProductDesign, employedBy→DesignFirm, wonAwardIn→DesignCompetition

## Software Tool
- **genus**: `cco:ont00000995`
- **definition**: A digital application used for creating, modifying, or rendering 3D models and designs.
- **attributes**: softwareId, softwareName, softwareVersion, developerName, interfaceType, learningCurve
- **relations**: usedBy→Designer, generates→ProductDesign, supportsFormat→DataFormat

## Design Competition
- **genus**: `bfo:0000015`
- **definition**: A formal event where designers submit works for evaluation and potential awards.
- **attributes**: competitionId, competitionName, competitionYear, organizerName, evaluationCriteria, grandPrizeAwarded
- **relations**: evaluated→ProductDesign, organizedBy→DesignFirm, awardedTo→Designer

## Photorealistic Render
- **genus**: `cco:ont00000995`
- **definition**: A high-fidelity digital image or visualization of a product design, simulating real-world lighting and materials.
- **attributes**: renderId, renderDate, lightingSetup, resolution, renderTimeHours, fileSizeMB
- **relations**: depicts→ProductDesign, generatedBy→SoftwareTool, submittedTo→DesignCompetition

## Design Firm
- **genus**: `bfo:0000023`
- **definition**: An organization or business entity specializing in industrial or product design services.
- **attributes**: firmId, firmName, foundingYear, headquartersLocation, firmType, activeStatus
- **relations**: employed→Designer, organized→DesignCompetition, mergedWith→DesignFirm
