# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Animal Control Patrol
- **genus**: `bfo:0000015`
- **definition**: A scheduled or ad-hoc patrol activity conducted by an Animal Services Officer to monitor an assigned geographic area for animal-related incidents, complaints, and violations.
- **attributes**: patrolId, assignedArea, startTime, endTime, patrolType, weatherConditions, officerBadgeNumber
- **relations**: conductedBy→AnimalServicesOfficer, covers→GeographicZone, generates→IncidentReport

## Animal Services Officer
- **genus**: `bfo:0000015`
- **definition**: A law enforcement role performed by an individual responsible for enforcing animal control ordinances, apprehending animals, issuing citations, and providing public education and assistance.
- **attributes**: officerId, fullName, badgeNumber, certificationStatus, driverLicenseStatus, drugTestStatus, criminalHistoryStatus
- **relations**: enforces→AnimalControlOrdinance, issues→Citation, apprehends→Animal, worksFor→AnimalServicesDivision

## Animal
- **genus**: `bfo:0000004`
- **definition**: A living organism under the jurisdiction of the Animal Services department, including pets, strays, wildlife, and animals involved in bite reports or disputes.
- **attributes**: animalId, species, breed, age, weight, healthStatus, temperament, impoundStatus
- **relations**: belongs_to→Owner, involved_in→IncidentReport, subject_to→AdoptionAssessment, carries→Disease

## Incident Report
- **genus**: `cco:ont00000995`
- **definition**: A formal record documenting a specific animal-related event, such as a bite, complaint, stray sighting, or nuisance violation, including investigation details and outcomes.
- **attributes**: reportId, incidentType, reportedDate, location, severity, resolutionStatus, citizenComplaintId
- **relations**: investigated_by→AnimalServicesOfficer, involves→Animal, occurs_in→GeographicZone, leads_to→Citation

## Citation
- **genus**: `cco:ont00000995`
- **definition**: A formal legal document issued by an Animal Services Officer to a pet owner for violating animal control ordinances, including license violations or nuisance complaints.
- **attributes**: citationId, issueDate, violationCode, fineAmount, courtDate, paymentStatus, officerNotes
- **relations**: issued_to→Owner, issued_by→AnimalServicesOfficer, related_to→IncidentReport, cites→AnimalControlOrdinance

## Adoption Assessment
- **genus**: `bfo:0000015`
- **definition**: A structured evaluation process conducted by an Animal Services Officer to determine an animal's temperament, health, and general adoptability for placement in a permanent home.
- **attributes**: assessmentId, assessmentDate, temperamentScore, healthScore, adoptabilityRating, specialNeeds, assessorId
- **relations**: assesses→Animal, conducted_by→AnimalServicesOfficer, results_in→AdoptionRecord

## Adoption Record
- **genus**: `cco:ont00000995`
- **definition**: A formal record documenting the transfer of an animal from the shelter or impound facility to a permanent home, including adopter details and post-adoption follow-up.
- **attributes**: adoptionId, adoptionDate, adopterName, adopterContact, adoptionFee, followUpRequired, followUpStatus
- **relations**: records→Animal, transferred_to→Adopter, based_on→AdoptionAssessment
