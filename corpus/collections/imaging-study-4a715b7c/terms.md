# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Imaging Study
- **genus**: `cco:ont00000995`
- **definition**: A recorded medical imaging examination performed on a patient using a specific modality.
- **attributes**: studyIdentifier, modality, studyDate, bodyRegion, status, contrastUsed
- **relations**: performedAt→HospitalCampus, interpretedBy→Radiologist, usesSoftware→PostProcessingSoftware

## Radiologist
- **genus**: `bfo:0000023`
- **definition**: A medical doctor who specializes in interpreting medical images and performing imaging-related procedures.
- **attributes**: physicianIdentifier, fullName, certificationBody, specialization, employmentStatus, bilingual
- **relations**: worksAt→HospitalCampus, interprets→ImagingStudy, performsProcedure→ThoracicProcedure

## Hospital Campus
- **genus**: `bfo:0000040`
- **definition**: A physical location or facility within a hospital system where medical services are delivered.
- **attributes**: campusCode, campusName, bedCapacity, traumaLevel, location
- **relations**: hostsImagingStudy→ImagingStudy, employsRadiologist→Radiologist, providesProcedure→ThoracicProcedure

## Thoracic Procedure
- **genus**: `bfo:0000015`
- **definition**: A medical intervention performed on the thoracic region, such as a biopsy or chest tube insertion.
- **attributes**: procedureCode, procedureName, procedureDate, invasivenessLevel, status
- **relations**: performedBy→Radiologist, conductedAt→HospitalCampus, relatedToStudy→ImagingStudy

## Post-Processing Software
- **genus**: `cco:ont00000995`
- **definition**: Specialized software tools used for analyzing and processing medical imaging data.
- **attributes**: softwareName, version, vendor, licenseStatus
- **relations**: usedForStudy→ImagingStudy
