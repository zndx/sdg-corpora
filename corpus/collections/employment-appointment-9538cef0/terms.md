# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Employment Appointment
- **genus**: `cco:ont00000995`
- **definition**: A formal record of an individual's appointment to a municipal position for a specified term.
- **attributes**: appointmentId, positionTitle, appointeeName, termStartDate, termEndDate, nominationDate, approvalStatus, reappointmentCount
- **relations**: nominatedBy→MunicipalOfficial, approvedBy→MunicipalCouncil, heldBy→MunicipalEmployee

## Municipal Employee
- **genus**: `bfo:0000015`
- **definition**: An individual performing duties for a municipal government entity.
- **attributes**: employeeId, fullName, department, jobTitle, yearsOfService, employmentStatus, hireDate
- **relations**: worksFor→MunicipalEntity, supervisedBy→MunicipalOfficial, reportsTo→MunicipalOfficial

## Municipal Official
- **genus**: `bfo:0000023`
- **definition**: An individual holding a formal elected or appointed position within a municipal government.
- **attributes**: officialId, fullName, officeTitle, termStartDate, termEndDate, partyAffiliation, contactEmail
- **relations**: represents→MunicipalEntity, votesOn→MunicipalAppointment, instructs→MunicipalEmployee

## Municipal Council
- **genus**: `bfo:0000015`
- **definition**: A legislative body responsible for governing a municipal entity and making policy decisions.
- **attributes**: councilId, municipalityName, meetingDate, quorumPresent, sessionType, agendaItemsCount
- **relations**: governs→MunicipalEntity, approves→MunicipalAppointment, votesOn→MunicipalPolicy

## Payroll Record
- **genus**: `cco:ont00000995`
- **definition**: A financial document detailing compensation, overtime, and deductions for municipal employees.
- **attributes**: recordId, payPeriodStart, payPeriodEnd, employeeId, baseSalary, overtimeHours, overtimeRate, totalGrossPay, complianceStatus
- **relations**: generatedBy→MunicipalEmployee, auditedBy→MunicipalEmployee, relatedTo→MunicipalPolicy

## FLSA Compliance Issue
- **genus**: `bfo:0000015`
- **definition**: A specific instance of non-compliance or potential violation of the Fair Labor Standards Act within a municipal payroll context.
- **attributes**: issueId, issueDescription, discoveryDate, resolutionDate, affectedDepartment, violationType, severityLevel
- **relations**: identifiedBy→MunicipalEmployee, addressedBy→MunicipalOfficial, affects→PayrollRecord
