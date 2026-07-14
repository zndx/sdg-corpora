# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Juvenile in Custody
- **genus**: `bfo:0000040`
- **definition**: A minor subject to the jurisdiction of the Riverside County Probation Department and residing in a juvenile facility.
- **attributes**: youthIdentifier, dateOfBirth, currentStatus, jurisdictionCode
- **relations**: hasHealthSummary→HealthCareSummary, isSubjectOf→TransferEvent, isSubjectOf→ReleaseEvent

## Juvenile Health Care Summary
- **genus**: `cco:ont00000995`
- **definition**: A compiled documentation of a youth's health record, including summaries and relevant medical data, prepared for transfer or release.
- **attributes**: summaryIdentifier, creationDate, formatCode, hasRecords, confidentialityStatus
- **relations**: documents→Youth, isForwardedTo→HealthcareFacility, requiresAuthorizationFrom→Authorization

## Juvenile Transfer
- **genus**: `bfo:0000015`
- **definition**: The administrative and physical movement of a youth from one juvenile facility to another jurisdiction.
- **attributes**: transferIdentifier, transferDate, originFacilityCode, destinationFacilityCode, hasCommunicableDisease
- **relations**: involvesYouth→Youth, triggersSummaryTransfer→HealthCareSummary, notifiesFacility→HealthcareFacility

## Juvenile Release
- **genus**: `bfo:0000015`
- **definition**: The process of a youth being discharged from custody into the community, triggering the transmission of health records to community providers.
- **attributes**: releaseIdentifier, releaseDate, releaseType, authorizationObtained
- **relations**: involvesYouth→Youth, triggersRecordTransmission→HealthCareSummary, transmitsToProvider→HealthcareFacility

## Receiving Health Care Facility
- **genus**: `bfo:0000002`
- **definition**: A physical or organizational entity, such as a juvenile facility or community clinic, that receives health care summaries and records.
- **attributes**: facilityCode, facilityName, facilityType, jurisdictionCode
- **relations**: receivesSummary→HealthCareSummary, isOriginOf→TransferEvent, isDestinationOf→TransferEvent

## Health Record Release Authorization
- **genus**: `cco:ont00000995`
- **definition**: A formal written permission obtained from a youth or their legal guardian permitting the transfer or release of confidential health records.
- **attributes**: authorizationIdentifier, issueDate, grantorType, isCourtOrdered, status
- **relations**: pertainsToYouth→Youth, enablesTransfer→TransferEvent, enablesRelease→ReleaseEvent
