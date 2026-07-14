# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Chemical Management Expert
- **genus**: `bfo:0000023`
- **definition**: A role held by a chemist responsible for overseeing chemical safety, permitting, and inspection activities within a national environmental authority.
- **attributes**: expertIdentifier, fullName, degree, specialization, startDate, currentStatus
- **relations**: worksFor→EnvironmentalAuthority, coordinates→InternationalNetwork, specializesIn→ChemicalSafetyDomain

## Environmental Authority
- **genus**: `bfo:0000015`
- **definition**: A government organization or ministry responsible for environmental policy enforcement, permitting, and inspection activities.
- **attributes**: authorityCode, authorityName, countryCode, establishedDate, competenceLevel, isCompetentAuthority
- **relations**: employs→ChemicalManagementExpert, enforces→EnvironmentalRegulation, oversees→PermittingActivity

## International Environmental Network
- **genus**: `bfo:0000015`
- **definition**: A collaborative network of environmental enforcement agencies across multiple jurisdictions, such as IMPEL.
- **attributes**: networkCode, networkName, foundingDate, memberCount, scope, isActive
- **relations**: hasCoordinator→ChemicalManagementExpert, coordinatesWith→EnvironmentalAuthority

## Environmental Regulation
- **genus**: `bfo:00000995`
- **definition**: A formal legal instrument or policy document governing environmental protection, chemical safety, or waste management.
- **attributes**: regulationId, regulationTitle, issuingBody, effectiveDate, jurisdiction, status
- **relations**: isEnforcedBy→EnvironmentalAuthority, governs→ChemicalActivity

## Chemical Activity
- **genus**: `bfo:0000015`
- **definition**: A process or operation involving the handling, storage, transport, or disposal of chemicals, subject to regulatory oversight.
- **attributes**: activityId, activityType, startDate, endDate, status, riskLevel
- **relations**: isSupervisedBy→ChemicalManagementExpert, isRegulatedBy→EnvironmentalRegulation, occursAt→Facility

## Chemical Facility
- **genus**: `bfo:0000023`
- **definition**: A physical location or site where chemicals are stored, processed, or disposed of, subject to environmental permitting.
- **attributes**: facilityId, facilityName, address, permitNumber, operationalStatus, lastInspectionDate
- **relations**: hosts→ChemicalActivity, isPermittedBy→EnvironmentalAuthority
