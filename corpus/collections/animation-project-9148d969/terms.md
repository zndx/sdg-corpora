# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Animation Project
- **genus**: `bfo:0000040`
- **definition**: A made thing representing a digital animation composition, including its assets, rigging, and timeline data.
- **attributes**: projectIdentifier, projectTitle, creationDate, totalFrames, renderResolution, isRigged, hasGreenScreen
- **relations**: createdWith→SoftwareTool, containsAsset→DigitalAsset, usesSoundtrack→AudioTrack, exportedAs→VideoFile

## Digital Asset
- **genus**: `bfo:0000040`
- **definition**: A made thing representing a 3D model, texture, or environment component used within an animation project.
- **attributes**: assetIdentifier, assetName, assetType, polygonCount, isRigged, sourceOrigin
- **relations**: partOfProject→AnimationProject, hasRigging→RiggingSystem, usesTexture→TextureMap

## Rigging System
- **genus**: `bfo:0000040`
- **definition**: A made thing representing the skeletal structure and control hierarchy used to animate a digital character.
- **attributes**: rigIdentifier, rigType, jointCount, hasControls, isConstrained
- **relations**: animatesAsset→DigitalAsset, usesControl→AnimationControl

## Animation Control
- **genus**: `bfo:0000040`
- **definition**: A made thing representing a specific handle, joint, or constraint used to manipulate a character's rig.
- **attributes**: controlIdentifier, controlName, controlType, isConstrained
- **relations**: partOfRig→RiggingSystem, affectsAsset→DigitalAsset

## Audio Track
- **genus**: `bfo:0000040`
- **definition**: A made thing representing a sound composition or loop used to accompany an animation project.
- **attributes**: trackIdentifier, trackTitle, fileFormat, isOriginal, durationSeconds
- **relations**: accompaniesProject→AnimationProject, createdWith→SoftwareTool

## Software Tool
- **genus**: `bfo:0000040`
- **definition**: A made thing representing a digital application used to create, edit, or render animation assets.
- **attributes**: toolIdentifier, toolName, toolCategory, version
- **relations**: usedInProject→AnimationProject, usedForAudio→AudioTrack

## Video File
- **genus**: `bfo:0000040`
- **definition**: A made thing representing a rendered video output of an animation project.
- **attributes**: fileIdentifier, fileName, fileFormat, resolution, hasLighting
- **relations**: rendersProject→AnimationProject, exportedWith→SoftwareTool
