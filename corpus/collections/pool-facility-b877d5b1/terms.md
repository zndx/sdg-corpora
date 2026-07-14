# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Municipal Swimming Pool Facility
- **genus**: `bfo:0000040`
- **definition**: A physical structure and associated land parcel designated for public aquatic recreation and maintenance.
- **attributes**: facilityId, facilityName, municipality, state, isOutdoor, operatingSeason, lastInspectionDate, healthDepartmentComplianceStatus
- **relations**: hasStaff→PoolStaffMember, undergoesMaintenance→MaintenanceActivity, hostsEvents→AquaticEvent

## Municipal Pool Staff Member
- **genus**: `bfo:0000002`
- **definition**: A person employed to supervise, maintain, or operate a municipal swimming pool facility.
- **attributes**: staffId, fullName, positionTitle, employmentStatus, hireDate, terminationDate, supervisorId, certifications
- **relations**: supervises→PoolStaffMember, assignedToFacility→PoolFacility, holdsCertification→SafetyCertification

## Aquatic Safety Certification
- **genus**: `bfo:0000040`
- **definition**: A formal credential or license verifying competence in water safety, rescue, and first aid.
- **attributes**: certId, certType, issuingBody, issueDate, expirationDate, isCurrent
- **relations**: heldBy→PoolStaffMember, requiredFor→PoolStaffMember

## Pool Maintenance and Safety Process
- **genus**: `bfo:0000015`
- **definition**: A process involving the monitoring, cleaning, and chemical treatment of pool water and equipment to ensure safety and compliance.
- **attributes**: activityId, activityType, scheduledDate, completedDate, performedBy, healthStandardCompliance, notes
- **relations**: performedAt→PoolFacility, performedBy→PoolStaffMember, usesEquipment→PoolEquipment

## Aquatic Facility Equipment
- **genus**: `bfo:0000040`
- **definition**: Physical apparatus used for pool filtration, chemical treatment, lifeguarding, and general facility operation.
- **attributes**: equipmentId, equipmentName, equipmentType, installationDate, lastMaintenanceDate, operationalStatus, weightKg
- **relations**: locatedAt→PoolFacility, servicedBy→PoolStaffMember, usedInActivity→MaintenanceActivity

## Public Aquatic Event or Session
- **genus**: `bfo:0000015`
- **definition**: A scheduled time period for public use, lessons, or special events at the municipal pool.
- **attributes**: eventId, eventName, eventType, startDate, endDate, capacity, registrationFee, isCancelled
- **relations**: heldAt→PoolFacility, staffedBy→PoolStaffMember, requiresMaintenance→MaintenanceActivity
