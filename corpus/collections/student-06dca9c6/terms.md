# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Student
- **genus**: `bfo:0000004`
- **definition**: A minor or young adult enrolled in grades 9-12 who is subject to interscholastic athletic eligibility rules.
- **attributes**: studentId, dateOfBirth, gradeLevel, age, currentAddress, dateEntered9thGrade, isEligible
- **relations**: residesWith→Residence, attended→School, participatedIn→AthleticHistory

## Residence
- **genus**: `bfo:0000004`
- **definition**: A physical location where a student resides, used to determine school district boundaries and athletic eligibility.
- **attributes**: address, dateMovedIn, durationMonths, schoolDistrict, isPrimaryResidence
- **relations**: hasStudent→Student, hasGuardian→Guardian

## Guardian
- **genus**: `bfo:0000004`
- **definition**: A parent or other person with whom a student has resided for at least six months, responsible for the student's residency status.
- **attributes**: fullName, relationship, telephone, isParent
- **relations**: residesAt→Residence, hasStudent→Student

## School
- **genus**: `bfo:0000004`
- **definition**: An educational institution, either public or private, where a student attends classes and participates in interscholastic athletics.
- **attributes**: schoolName, schoolType, district, hasOpenEnrollment
- **relations**: hasStudent→Student, hasAthleticHistory→AthleticHistory

## Athletic History
- **genus**: `cco:ont00000995`
- **definition**: A record of a student's participation in interscholastic sports, including season, year, sport, and level.
- **attributes**: season, year, sport, level, practicesCompleted, isEligible
- **relations**: hasStudent→Student, hasSchool→School

## Transfer Waiver
- **genus**: `cco:ont00000995`
- **definition**: A formal exemption from the standard one-year ineligibility period for a student transferring schools without a change in residence.
- **attributes**: waiverType, approvalDate, approvedBy, isOneTimeOnly
- **relations**: hasStudent→Student, hasSchool→School
