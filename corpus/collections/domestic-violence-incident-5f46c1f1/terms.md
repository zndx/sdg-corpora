# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Domestic Violence Incident
- **genus**: `bfo:0000015`
- **definition**: A specific event of domestic violence involving an offender and a victim, documented through police reports and legal proceedings.
- **attributes**: incidentId, reportDate, severityLevel, location, offenderId, victimId, policeReportNumber, lethalityScore
- **relations**: documentedBy→PoliceReport, involvesVictim→Victim, involvesOffender→Offender

## Police Report
- **genus**: `cco:ont00000958`
- **definition**: An official document created by law enforcement detailing the circumstances of a domestic violence incident.
- **attributes**: reportId, officerId, reportDate, incidentId, status, narrative, evidenceCollected
- **relations**: recordsIncident→DomesticViolenceIncident, filedBy→LawEnforcementOfficer

## Victim
- **genus**: `bfo:0000002`
- **definition**: An individual who has been subjected to domestic violence and is receiving support from the YWCA.
- **attributes**: victimId, fullName, dateOfBirth, contactNumber, safetyPlanStatus, crisisCallCount, referralStatus
- **relations**: experiencedIncident→DomesticViolenceIncident, assignedAdvocate→LegalAdvocate

## Offender
- **genus**: `bfo:0000002`
- **definition**: An individual who has committed an act of domestic violence against a victim.
- **attributes**: offenderId, fullName, dateOfBirth, criminalHistory, accountabilityStatus
- **relations**: committedIncident→DomesticViolenceIncident

## Legal Advocate
- **genus**: `bfo:0000015`
- **definition**: A professional role within the YWCA providing legal support, crisis intervention, and advocacy for domestic violence survivors.
- **attributes**: advocateId, fullName, educationLevel, onCallRotation, supervisorId, caseLoad
- **relations**: supportsVictim→Victim, liaisesWithProsecutor→Prosecutor, filesProtectionOrder→ProtectionOrder

## Protection Order
- **genus**: `cco:ont00000958`
- **definition**: A legal document issued by a court to protect a victim from further domestic violence by an offender.
- **attributes**: orderId, issueDate, expirationDate, orderType, courtCaseNumber, status
- **relations**: protectsVictim→Victim, restrictsOffender→Offender, filedByAdvocate→LegalAdvocate

## Prosecutor
- **genus**: `bfo:0000015`
- **definition**: A legal professional representing the state in criminal cases involving domestic violence.
- **attributes**: prosecutorId, fullName, caseLoad, courtAssignment
- **relations**: handlesCase→DomesticViolenceIncident, collaboratesWithAdvocate→LegalAdvocate
