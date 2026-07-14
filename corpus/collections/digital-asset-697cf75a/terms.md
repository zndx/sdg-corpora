# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Digital Asset
- **genus**: `cco:ont00000995`
- **definition**: A digital file or media object created or processed by the student, such as a 3D model, animation, or audio track.
- **attributes**: assetIdentifier, assetTitle, creationDate, fileFormat, durationSeconds, frameCount, status
- **relations**: createdWith→SoftwareTool, partOf→Project, exportedTo→DigitalAsset

## Project
- **genus**: `bfo:0000015`
- **definition**: A structured creative undertaking or independent study activity involving the production of digital media.
- **attributes**: projectId, projectTitle, startDate, endDate, projectType, description
- **relations**: produces→DigitalAsset, uses→SoftwareTool, references→ExternalResource

## Software Tool
- **genus**: `cco:ont00000995`
- **definition**: A digital application or software suite used to create, edit, or render media assets.
- **attributes**: toolId, toolName, version, toolCategory, vendor
- **relations**: usedIn→Project, generates→DigitalAsset

## External Resource
- **genus**: `cco:ont00000995`
- **definition**: An external media file, reference, or asset imported into the project, such as textures, sounds, or pre-rigged models.
- **attributes**: resourceId, resourceTitle, sourceUrl, resourceType, license
- **relations**: referencedBy→Project, usedIn→DigitalAsset

## Animation Sequence
- **genus**: `bfo:0000015`
- **definition**: A specific motion or movement sequence applied to a character or object within a project timeline.
- **attributes**: sequenceId, sequenceName, durationSeconds, frameCount, animationType, keyframeCount
- **relations**: partOf→Project, appliedTo→DigitalAsset, usesRig→DigitalAsset
