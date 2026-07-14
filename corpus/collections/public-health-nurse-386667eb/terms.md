# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Public Health Nurse
- **genus**: `bfo:0000040`
- **definition**: A person who provides public health nursing services to support safe school reopening and COVID-19 response.
- **attributes**: nurseId, fullName, licenseNumber, contactPhone, email, status
- **relations**: assignedTo→School, supports→SchoolBoard

## School
- **genus**: `bfo:0000040`
- **definition**: An educational institution participating in the public health nurse support program for COVID-19 response.
- **attributes**: schoolId, schoolName, address, boardId, riskLevel, ipacCompliant, lastAssessmentDate
- **relations**: assignedNurse→PublicHealthNurse, partOf→SchoolBoard, hasOutbreak→Outbreak

## School Board
- **genus**: `bfo:0000040`
- **definition**: A local education authority overseeing schools in a jurisdiction, coordinating with public health services.
- **attributes**: boardId, boardName, jurisdiction, contactEmail, contactPhone, programManagerName, programManagerPhone
- **relations**: employs→PublicHealthNurse, oversees→School

## Outbreak
- **genus**: `bfo:0000015`
- **definition**: A localized event of multiple COVID-19 cases within a school community requiring rapid-response support.
- **attributes**: outbreakId, startDate, endDate, caseCount, status, location
- **relations**: occursAt→School, managedBy→PublicHealthNurse

## Infection Prevention and Control Measure
- **genus**: `bfo:0000015`
- **definition**: A specific protocol or modification implemented in a school to prevent the spread of infectious diseases.
- **attributes**: measureId, measureName, description, implementationDate, complianceStatus, lastReviewedDate
- **relations**: implementedAt→School, assessedBy→PublicHealthNurse
