# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## University Support System
- **genus**: `cco:ont00000995`
- **definition**: A structured institutional program or resource designed to facilitate student entrepreneurial activities.
- **attributes**: systemId, systemName, systemType, startDate, endDate, status, budget, accessibilityScore
- **relations**: providesTo→StudentLedBusinessInitiative, deliveredBy→UniversityDepartment

## Student-Led Business Initiative
- **genus**: `bfo:0000015`
- **definition**: A business venture or entrepreneurial project initiated and managed by a university student.
- **attributes**: initiativeId, initiativeName, status, foundedDate, sector, revenue, employeeCount, successRating
- **relations**: supportedBy→UniversitySupportSystem, managedBy→StudentEntrepreneur, operatesIn→GeographicJurisdiction

## Student Entrepreneur
- **genus**: `bfo:0000004`
- **definition**: A university student who actively engages in entrepreneurial activities and manages business initiatives.
- **attributes**: studentId, fullName, major, enrollmentStatus, demographicGroup, contactEmail, satisfactionScore
- **relations**: manages→StudentLedBusinessInitiative, enrolledAt→UniversityDepartment, receivesMentorshipFrom→Mentor

## Mentor
- **genus**: `bfo:0000004`
- **definition**: An experienced entrepreneur or industry professional who provides guidance and advice to student entrepreneurs.
- **attributes**: mentorId, fullName, expertiseArea, yearsOfExperience, affiliation, rating, availabilityStatus, contactInfo
- **relations**: guides→StudentEntrepreneur, affiliatedWith→UniversityDepartment

## University Department
- **genus**: `bfo:0000040`
- **definition**: An administrative or academic unit within a university responsible for delivering support systems and education.
- **attributes**: departmentId, departmentName, departmentCode, headOfDepartment, location, establishedDate, operationalStatus, budgetAllocation
- **relations**: delivers→UniversitySupportSystem, employs→Mentor, hosts→StudentEntrepreneur

## Geographic Jurisdiction
- **genus**: `bfo:0000002`
- **definition**: A defined geographical area or administrative region where business initiatives operate or are supported.
- **attributes**: jurisdictionId, jurisdictionName, jurisdictionType, population, gdp, entrepreneurshipIndex, governmentPolicies, lastUpdated
- **relations**: hosts→StudentLedBusinessInitiative
