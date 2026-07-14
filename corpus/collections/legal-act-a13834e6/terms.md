# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Legal Act
- **genus**: `bfo:0000040`
- **definition**: A formal legislative instrument such as a Council Regulation or Directive that establishes or modifies the legal basis and operational framework of the European Monetary Cooperation Fund.
- **attributes**: actIdentifier, actTitle, issuingBody, effectiveDate, legalStatus
- **relations**: governs→FundOperation, cites→LegalAct

## Fund Operation
- **genus**: `bfo:0000015`
- **definition**: A specific administrative or financial activity carried out by the European Monetary Cooperation Fund, such as currency intervention monitoring, short-term financing administration, or ECU creation and remuneration.
- **attributes**: operationCode, operationType, startDate, endDate, status
- **relations**: governedBy→LegalAct, conductedBy→Agent, affects→Currency, involves→MemberState

## Agent
- **genus**: `bfo:0000023`
- **definition**: An institutional role held by the Bank for International Settlements (BIS) to carry out the operational tasks of the European Monetary Cooperation Fund under the direction of the Board of Governors.
- **attributes**: agentIdentifier, agentName, appointmentDate, terminationDate, agentType
- **relations**: appointedBy→BoardOfGovernors, performs→FundOperation, locatedIn→ArchiveLocation

## Board of Governors
- **genus**: `bfo:0000015`
- **definition**: The governing body of the European Monetary Cooperation Fund, composed of central bank governors from EEC member states, responsible for overseeing fund activities and appointing the Agent.
- **attributes**: boardIdentifier, meetingDate, meetingLocation, attendanceStatus, decisionOutcome
- **relations**: appoints→Agent, oversees→FundOperation, attends→BoardMeeting

## Board Meeting
- **genus**: `bfo:0000015`
- **definition**: A formal gathering of the Board of Governors to discuss fund policies, review operations, and make decisions regarding the European Monetary Cooperation Fund's activities.
- **attributes**: meetingIdentifier, meetingDate, agendaItem, minutesStatus, confidentialityLevel
- **relations**: convenedBy→BoardOfGovernors, records→Document, discusses→FundOperation

## Document
- **genus**: `cco:ont00000958`
- **definition**: A textual record, report, notification, or legal instrument created or held by the European Monetary Cooperation Fund, including minutes, directives, and operational reports.
- **attributes**: documentIdentifier, documentTitle, creationDate, language, accessStatus
- **relations**: createdBy→Agent, relatedTo→FundOperation, storedIn→ArchiveLocation, references→LegalAct

## Archive Location
- **genus**: `bfo:0000002`
- **definition**: A physical or institutional repository where documents and records of the European Monetary Cooperation Fund are stored, such as the Bank for International Settlements in Basel or the ECB Archives in Frankfurt.
- **attributes**: locationIdentifier, locationName, city, country, accessPolicy
- **relations**: holds→Document, transferredTo→ArchiveLocation
