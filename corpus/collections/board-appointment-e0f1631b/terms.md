# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Board Appointment
- **genus**: `bfo:0000015`
- **definition**: A formal appointment of an individual to a leadership role within a non-profit organization's governing board.
- **attributes**: appointmentId, appointmentDate, roleTitle, termStartDate, termEndDate, appointmentStatus
- **relations**: appointsPerson→Person, appointsToOrganization→NonProfitOrganization, succeedsPreviousAppointee→Person

## Non-Profit Organization
- **genus**: `bfo:0000040`
- **definition**: A legally recognized entity established to pursue social, educational, or charitable purposes without distributing profits to owners.
- **attributes**: organizationId, legalName, taxStatus, foundingDate, headquartersLocation, websiteUrl, contactPhoneNumber
- **relations**: hasBoardAppointment→BoardAppointment, hasAffiliate→NonProfitOrganization, receivesFundingFrom→FundingSource

## Person
- **genus**: `bfo:0000002`
- **definition**: A human being, including individuals serving in professional or leadership capacities.
- **attributes**: personId, firstName, lastName, professionalTitle, affiliatedOrganization, contactEmail, contactPhoneNumber
- **relations**: holdsBoardAppointment→BoardAppointment, employedBy→LawFirm, servesOnAffiliateCouncil→AffiliateCouncil

## Law Firm
- **genus**: `bfo:0000040`
- **definition**: A business entity providing legal services to clients, often specializing in specific practice areas.
- **attributes**: firmId, firmName, foundingYear, primaryPracticeAreas, officeLocations, legalEntityStatus
- **relations**: employsPartner→Person, providesLegalServicesTo→ClientEntity

## Funding Source
- **genus**: `bfo:0000040`
- **definition**: An entity or mechanism providing financial support to a non-profit organization.
- **attributes**: sourceId, sourceType, sourceName, contributionAmount, contributionDate, contributionStatus
- **relations**: fundsOrganization→NonProfitOrganization

## Affiliate Council
- **genus**: `bfo:0000040`
- **definition**: A governing or advisory body comprising representatives from multiple affiliate organizations within a larger network.
- **attributes**: councilId, councilName, networkParent, memberCount, scopeDescription
- **relations**: hasMemberRepresentative→Person, belongsToNetwork→NonProfitOrganization
