# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Provider Change Request
- **genus**: `cco:ont00000995`
- **definition**: A formal administrative record submitted by a client to request a change in their assigned behavioral health service provider or clinic.
- **attributes**: requestId, clientMhNumber, clientName, guardianName, contactPhone, requestDate, reasonForChange, status
- **relations**: submittedBy→Client, reviewedBy→Manager, targetsProviderType→ProviderRole, targetsProviderInstance→Provider

## Client
- **genus**: `bfo:0000004`
- **definition**: An individual receiving or eligible for behavioral health and recovery services within the county system.
- **attributes**: clientId, mhNumber, fullName, isMinor, primaryContactPhone, assignedClinic
- **relations**: hasRequest→ProviderChangeRequest, assignedToClinic→Clinic

## Manager
- **genus**: `bfo:0000004`
- **definition**: A staff member, such as a Unit Chief or Supervisor, responsible for reviewing and adjudicating provider change requests.
- **attributes**: managerId, printedName, signature, reviewDate, decisionText, notificationDate
- **relations**: reviewsRequest→ProviderChangeRequest, worksAtClinic→Clinic

## Provider Role
- **genus**: `bfo:0000023`
- **definition**: A functional role within the behavioral health system that a client may request to change, such as Psychiatrist or Case Manager.
- **attributes**: roleCode, roleName, isClinical
- **relations**: requestedInChange→ProviderChangeRequest

## Provider
- **genus**: `bfo:0000004`
- **definition**: A specific individual or entity providing behavioral health services, such as a named psychiatrist or clinic.
- **attributes**: providerId, providerName, providerType
- **relations**: isRequestedChange→ProviderChangeRequest, affiliatedWithClinic→Clinic

## Clinic
- **genus**: `bfo:0000004`
- **definition**: A physical or administrative location where behavioral health services are delivered and managed.
- **attributes**: clinicCode, clinicName, locationCode
- **relations**: employsManager→Manager, hostsProvider→Provider, servesClient→Client
