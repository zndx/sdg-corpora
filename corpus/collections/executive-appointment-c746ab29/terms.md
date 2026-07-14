# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Executive Appointment
- **genus**: `bfo:0000015`
- **definition**: A temporal role assignment event where an individual assumes a specific executive position within an organization.
- **attributes**: appointmentDate, startDate, endDate, appointmentStatus, appointmentIdentifier
- **relations**: heldBy→ExecutivePerson, heldAt→CorporateEntity, occupiesRole→ExecutiveRole

## Executive Person
- **genus**: `bfo:0000040`
- **definition**: A human individual who holds or has held executive leadership positions within corporate entities.
- **attributes**: personIdentifier, fullName, professionalTitle, certificationStatus, certificationBody
- **relations**: holdsAppointment→ExecutiveAppointment, affiliatedWith→CorporateEntity

## Corporate Entity
- **genus**: `bfo:0000040`
- **definition**: A legally recognized business organization or subsidiary engaged in commercial operations.
- **attributes**: entityIdentifier, legalName, jurisdiction, marketSegment, entityStatus
- **relations**: employsExecutive→ExecutivePerson, hasSubsidiary→CorporateEntity, operatesInRegion→GeographicRegion

## Executive Role
- **genus**: `bfo:0000023`
- **definition**: A specific leadership position or title within a corporate hierarchy that carries defined responsibilities.
- **attributes**: roleTitle, roleLevel, department, roleStatus
- **relations**: assignedToAppointment→ExecutiveAppointment, belongsToEntity→CorporateEntity

## Geographic Region
- **genus**: `bfo:0000002`
- **definition**: A defined territorial area or market jurisdiction where corporate operations are conducted.
- **attributes**: regionCode, regionName, regionType, regionStatus
- **relations**: containsOperations→CorporateEntity
