# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Application Document
- **genus**: `bfo:0000040`
- **definition**: A physical or digital document containing the application materials, comments, and certificates to be submitted.
- **attributes**: documentId, fileName, fileSizeBytes, pageCount, creationDate, format
- **relations**: contains→ApplicationPage, generatedBy→ScanningProcess

## Application Page
- **genus**: `bfo:0000040`
- **definition**: A single page within the application document, containing specific content such as a form, comment sheet, or certificate.
- **attributes**: pageNumber, contentType, imageResolution, isColor, orientation
- **relations**: partOf→ApplicationDocument, capturedBy→ScanningProcess

## Scanning Process
- **genus**: `bfo:0000015`
- **definition**: The activity of capturing physical documents using a mobile device or scanner to create digital representations.
- **attributes**: processId, startDate, endDate, deviceType, appUsed, status
- **relations**: produced→ApplicationDocument, captured→ApplicationPage, usedDevice→MobileDevice

## Mobile Device
- **genus**: `bfo:0000040`
- **definition**: A handheld computing device used to capture images of documents, such as an iPhone or Android phone.
- **attributes**: deviceId, manufacturer, model, osVersion, cameraResolution
- **relations**: usedIn→ScanningProcess

## Export Process
- **genus**: `bfo:0000015`
- **definition**: The activity of converting scanned images or documents into a final PDF format and transferring them to a computer.
- **attributes**: exportId, exportDate, method, targetFileSizeMB, status
- **relations**: transforms→ApplicationDocument, usesMethod→ExportMethod

## Export Method
- **genus**: `bfo:0000040`
- **definition**: A specific technique or tool used to transfer or convert documents, such as AirDrop, Email, or word-processing software.
- **attributes**: methodId, methodName, supportsCompression, maxFileSizeGB
- **relations**: usedIn→ExportProcess
