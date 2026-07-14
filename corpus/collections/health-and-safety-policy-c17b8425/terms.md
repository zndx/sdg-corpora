# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Health and Safety Policy
- **genus**: `cco:ont00000958`
- **definition**: A formal organizational document establishing standards, responsibilities, and procedures for maintaining a safe and healthy workplace environment.
- **attributes**: policyIdentifier, effectiveDate, issuingAuthority, complianceStandard, policyStatus
- **relations**: governs→WorkplaceActivity, mandates→SafetyProcedure

## Workplace Activity
- **genus**: `bfo:0000015`
- **definition**: Any operational task, process, or routine performed within the library's facilities by employees, contractors, or management.
- **attributes**: activityCode, locationZone, riskLevel, scheduledDate, status
- **relations**: conductedBy→Worker, occursIn→FacilityZone, subjectTo→HealthAndSafetyPolicy

## Worker
- **genus**: `bfo:0000002`
- **definition**: An individual employed by, contracted to, or managing the Aurora Public Library, including employees, supervisors, and contractors.
- **attributes**: workerId, role, department, safetyTrainingStatus, certificationExpiry
- **relations**: assignedTo→WorkplaceActivity, reportsTo→Worker, subjectTo→HarassmentPolicy

## Safety Incident
- **genus**: `bfo:0000015`
- **definition**: An event involving unsafe conditions, harassment, or violence that occurred in the workplace, requiring investigation or reporting.
- **attributes**: incidentId, incidentType, severityLevel, reportedDate, investigationStatus
- **relations**: reportedBy→Worker, occurredIn→FacilityZone, investigatedBy→Worker, categorizedAs→IncidentCategory

## Facility Zone
- **genus**: `bfo:0000004`
- **definition**: A distinct physical area or department within the library premises where specific health and safety protocols apply.
- **attributes**: zoneCode, zoneName, occupancyLimit, hazardRating, lastInspectionDate
- **relations**: contains→SafetyIncident, hostedActivity→WorkplaceActivity

## Workplace Harassment Policy
- **genus**: `cco:ont00000958`
- **definition**: A formal organizational document defining prohibited conduct, reporting mechanisms, and investigation procedures for workplace harassment.
- **attributes**: policyIdentifier, effectiveDate, issuingAuthority, complianceStandard, policyStatus
- **relations**: governs→Worker, mandates→SafetyIncident

## Workplace Violence Policy
- **genus**: `cco:ont00000958`
- **definition**: A formal organizational document establishing protocols for preventing, reporting, and responding to physical violence and threats in the workplace.
- **attributes**: policyIdentifier, effectiveDate, issuingAuthority, complianceStandard, policyStatus
- **relations**: governs→Worker, mandates→SafetyIncident
