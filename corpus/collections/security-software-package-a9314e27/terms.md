# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Security Software Package
- **genus**: `cco:ont00000995`
- **definition**: A commercial software application designed to extract and process personal data from official identification documents for registration and authentication workflows.
- **attributes**: SoftwareIdentifier, ProductName, RetailPrice, SupportedOperatingSystem, CurrencyCode, CompatibilityStatus
- **relations**: runsOn→HardwareScannerDevice, uses→OpticalCharacterRecognitionEngine, supportsDocumentType→OfficialIdentificationDocument

## Hardware Scanner Device
- **genus**: `bfo:0000015`
- **definition**: A physical peripheral device that captures optical data from physical documents and converts it into digital signals for processing.
- **attributes**: DeviceModelName, CameraResolutionMegapixels, MaximumScanningSize, PowerSourceType, InterfaceType, RetailPrice, CurrencyCode, HasExternalButton, HasBarcodeScanner
- **relations**: runsSoftwarePackage→SecuritySoftwarePackage, capturesDocument→OfficialIdentificationDocument

## Official Identification Document
- **genus**: `cco:ont00000995`
- **definition**: A government-issued physical or digital credential containing biographical data and machine-readable zones used for identity verification.
- **attributes**: DocumentType, IssuingCountryCode, DocumentNumber, MRZLine1, MRZLine2, MRZRecognitionStatus, ExtractionTimestamp
- **relations**: providesDataTo→ExtractedPersonalDataRecord, isScannedBy→HardwareScannerDevice

## Extracted Personal Data Record
- **genus**: `cco:ont00000995`
- **definition**: A structured digital representation of biographical information extracted from an official identification document via OCR and MRZ processing.
- **attributes**: RecordIdentifier, ExtractionMethod, SourceLanguageCode, OutputFormat, DataArchiveStatus, ExtractionTimestamp
- **relations**: derivedFrom→OfficialIdentificationDocument, processedBy→OpticalCharacterRecognitionEngine

## Optical Character Recognition Engine
- **genus**: `bfo:0000015`
- **definition**: A computational process or software module that recognizes and converts printed text in various languages from image data into machine-readable text.
- **attributes**: EngineVersion, SupportedLanguageCount, RecognitionAccuracy, ProcessingSpeed, AwardStatus
- **relations**: processesDocument→OfficialIdentificationDocument, generatesRecord→ExtractedPersonalDataRecord
