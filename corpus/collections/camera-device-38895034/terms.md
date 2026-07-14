# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## A physical digital single-lens reflex or mirrorless camera unit used for imaging
- **genus**: `cco:ont00000995`
- **definition**: A physical digital single-lens reflex or mirrorless camera unit used for imaging
- **attributes**: deviceIdentifier, manufacturer, modelNumber, sensorType, megapixels, lensMountType, isMirrorless
- **relations**: configuredWith→CameraLens, configuredWith→MemoryCard, configuredWith→TripodMount

## An interchangeable optical lens assembly attached to a camera body
- **genus**: `cco:ont00000995`
- **definition**: An interchangeable optical lens assembly attached to a camera body
- **attributes**: lensIdentifier, manufacturer, modelNumber, focalLength, maxAperture, mountCompatibility, isPrime
- **relations**: attachedTo→CameraDevice

## A removable solid-state storage medium for digital image data
- **genus**: `cco:ont00000995`
- **definition**: A removable solid-state storage medium for digital image data
- **attributes**: cardIdentifier, manufacturer, modelNumber, storageCapacity, writeSpeed, fileSystemFormat, isFormatted
- **relations**: insertedIn→CameraDevice

## A single photographic exposure event recording light onto a sensor
- **genus**: `bfo:0000015`
- **definition**: A single photographic exposure event recording light onto a sensor
- **attributes**: captureIdentifier, timestamp, shutterSpeed, apertureValue, isoSetting, exposureMode, whiteBalance, meteringMode, focusMode, fileFormat
- **relations**: recordedBy→CameraDevice, storedOn→MemoryCard, capturedSubject→CelestialObject

## A natural astronomical body or feature in the night sky
- **genus**: `bfo:0000004`
- **definition**: A natural astronomical body or feature in the night sky
- **attributes**: objectIdentifier, commonName, catalogDesignation, objectType, constellation, rightAscension, declination, apparentMagnitude
- **relations**: capturedIn→ImageCapture

## The interdependent relationship between shutter speed, aperture, and ISO in photography
- **genus**: `bfo:0000015`
- **definition**: The interdependent relationship between shutter speed, aperture, and ISO in photography
- **attributes**: triangleIdentifier, shutterSpeed, apertureValue, isoSetting, exposureValue, isBalanced
- **relations**: defines→ImageCapture
