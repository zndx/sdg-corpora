# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Executive Director
- **genus**: `bfo:0000023`
- **definition**: The senior operating officer role responsible for overseeing administration, operations, facility integrity, fundraising, and strategic planning at the Capitol Civic Centre.
- **attributes**: employeeId, reportingTo, positionType, salaryMin, salaryMax, degreeLevel, yearsExperience, isExempt
- **relations**: manages→Organization, represents→Foundation, supervises→StaffMember, oversees→Facility

## Capitol Civic Centre
- **genus**: `bfo:0000040`
- **definition**: The nonprofit organization operating the Capitol Civic Centre venue and managing its programs, finances, and operations.
- **attributes**: legalName, foundedYear, annualRevenue, employeeCount, volunteerCount, location, isNonprofit
- **relations**: employs→StaffMember, manages→Facility, executes→Program, receivesFundingFrom→Donor

## Capitol Civic Centre Complex
- **genus**: `bfo:0000040`
- **definition**: A conjoined five-building historic complex aged 100-135 years, including venue safety, upkeep, and preventive maintenance.
- **attributes**: buildingCount, ageMin, ageMax, safetyStatus, lastInspectionDate, maintenanceSchedule, isHistoric
- **relations**: locatedIn→Organization, hosts→Event, maintainedBy→StaffMember

## Performance Event
- **genus**: `bfo:0000015`
- **definition**: A booked performance, show, educational program, or other event presented by the organization annually.
- **attributes**: eventId, eventName, eventDate, eventType, isRentalShow, attendeeCount, revenueGenerated
- **relations**: hostedAt→Facility, organizedBy→Organization, bookedBy→StaffMember, partOf→Program

## Annual Program
- **genus**: `bfo:0000015`
- **definition**: A curated selection of approximately 12-15 events, shows, educational, and other programs booked by the organization each year.
- **attributes**: programId, programName, year, eventCount, budget, status
- **relations**: contains→Event, managedBy→ExecutiveDirector, fundedBy→Donor

## Staff Member
- **genus**: `bfo:0000023`
- **definition**: An employee (full-time or part-time) working under the supervision of the Executive Director.
- **attributes**: staffId, fullName, employmentType, department, hireDate, salary, isSupervisor
- **relations**: worksFor→Organization, supervisedBy→ExecutiveDirector, assignedTo→Facility, manages→Event

## Donor
- **genus**: `bfo:0000040`
- **definition**: An individual or entity providing financial support through grants, sponsorships, memberships, or annual appeals.
- **attributes**: donorId, donorName, donorType, totalContributed, lastDonationDate, isMajorDonor
- **relations**: funds→Organization, supports→Program, contactedBy→StaffMember
