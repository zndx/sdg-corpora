# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Surveillance Camera
- **genus**: `cco:ont00000995`
- **definition**: A physical device installed in school buildings, grounds, or buses to record video for safety and security purposes.
- **attributes**: cameraId, location, installationDate, isActive, coverageArea, resolution
- **relations**: monitors→SchoolZone, records→VideoSurveillanceEvent

## School Zone
- **genus**: `bfo:0000004`
- **definition**: A physical area within or associated with a public school, such as a classroom, locker room, bus, or athletic field, subject to specific privacy and security expectations.
- **attributes**: zoneId, zoneType, privacyLevel, isIndoor, capacity
- **relations**: contains→SurveillanceCamera, hosts→StudentSearchEvent

## Student Search Event
- **genus**: `bfo:0000015`
- **definition**: An activity conducted by school officials to inspect a student or their belongings to maintain safety and discipline, subject to Fourth Amendment reasonableness standards.
- **attributes**: searchId, timestamp, initiatedBy, reasonablenessInception, reasonablenessScope, intrusivenessLevel, outcome
- **relations**: targets→Student, occursIn→SchoolZone, authorizedBy→SchoolPolicy

## Student
- **genus**: `bfo:0000004`
- **definition**: An individual enrolled in a public school, possessing a reasonable expectation of privacy that is limited by the school's custodial responsibilities.
- **attributes**: studentId, age, sex, gradeLevel, enrollmentStatus
- **relations**: subjectOf→StudentSearchEvent, attends→SchoolZone

## School Policy
- **genus**: `cco:ont00000958`
- **definition**: A formal document or designator established by a local school board to govern security measures, search procedures, and student privacy expectations.
- **attributes**: policyId, title, effectiveDate, lastReviewed, approvalStatus, jurisdiction
- **relations**: governs→StudentSearchEvent, permits→SurveillanceCamera, amends→SchoolPolicy
