# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Shareholder
- **genus**: `cco:ont00000995`
- **definition**: A natural or legal person holding equity securities in the Industrial Holding Bulgaria PLC.
- **attributes**: shareholderId, name, type, registrationDate, contactEmail, shareCount
- **relations**: holdsSecuritiesIn→Company, participatedInMeeting→GeneralMeeting

## Company
- **genus**: `cco:ont00000995`
- **definition**: The Industrial Holding Bulgaria PLC, a public limited company subject to capital markets regulation.
- **attributes**: companyId, legalName, registrationNumber, listingStatus, fiscalYear, governanceCode
- **relations**: filesReport→FinancialReport, holdsMeeting→GeneralMeeting, employsDirector→InvestorRelationsDirector

## Financial Report
- **genus**: `cco:ont00000995`
- **definition**: A statutory document presenting the financial position and management activities of the company for a specific period.
- **attributes**: reportId, reportType, issuanceDate, fiscalPeriod, consolidationStatus, publicationUrl, auditorName
- **relations**: filedBy→Company, auditedBy→RegisteredAuditor, disclosedTo→RegulatoryAuthority

## General Meeting of Shareholders
- **genus**: `bfo:0000015`
- **definition**: A formal assembly of shareholders convened to vote on corporate governance matters and approve financial statements.
- **attributes**: meetingId, meetingDate, meetingType, quorumMet, agendaItems, minuteUrl
- **relations**: convenedBy→Company, attendedBy→Shareholder, approvesReport→FinancialReport

## Regulatory Authority
- **genus**: `cco:ont00000995`
- **definition**: A public body or stock exchange responsible for overseeing capital market compliance and disclosure.
- **attributes**: authorityId, authorityName, jurisdiction, regulationCode, bulletinName
- **relations**: receivesReport→FinancialReport, oversees→Company

## Investor Relations Director
- **genus**: `bfo:0000023`
- **definition**: A role played by an individual responsible for managing communication between the company and its investors.
- **attributes**: directorId, appointmentYear, reportingPeriod, complianceStatus
- **relations**: servesIn→Company, managesCommunication→Shareholder
