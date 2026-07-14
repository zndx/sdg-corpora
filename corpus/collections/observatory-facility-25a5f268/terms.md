# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Observatory Facility
- **genus**: `bfo:0000040`
- **definition**: A physical site or complex housing astronomical instruments and supporting infrastructure, including land parcels and buildings.
- **attributes**: facilityId, facilityName, location, landAreaAcres, landOwnershipType, operationalStatus, establishedDate
- **relations**: hostsInstrument→Telescope, locatedInJurisdiction→Country, managedBy→ManagingOrganization

## Telescope
- **genus**: `bfo:0000040`
- **definition**: A ground-based optical or infrared astronomical instrument used for observation, characterized by aperture size and operational parameters.
- **attributes**: telescopeId, telescopeName, apertureMeters, telescopeClass, primaryInstrument, observationMode, communityAccessPercentage, fundingConsortium
- **relations**: sitedAt→ObservatoryFacility, dedicatedToSurvey→AstronomicalSurvey, operatedBy→ManagingOrganization

## Astronomical Survey
- **genus**: `bfo:0000015`
- **definition**: A systematic observational campaign targeting specific astrophysical phenomena, with defined duration and resource allocation.
- **attributes**: surveyId, surveyName, startDate, endDate, nightsAllocatedPerYear, primaryObjective, status
- **relations**: usesTelescope→Telescope, fundedBy→FundingAgency

## Managing Organization
- **genus**: `bfo:0000004`
- **definition**: An entity responsible for the operation, management, and oversight of an observatory facility under cooperative agreement.
- **attributes**: orgId, orgName, orgType, agreementStartDate, agreementEndDate, oversightLevel, conflictOfInterestDisclosure
- **relations**: managesFacility→ObservatoryFacility, awardedBy→FundingAgency, leasesLandFrom→LandOwner

## Funding Agency
- **genus**: `bfo:0000004`
- **definition**: A governmental or institutional body providing financial support and oversight for astronomical research facilities.
- **attributes**: agencyId, agencyName, agencyType, division, programCode, oversightResponsibility
- **relations**: awardsAgreementTo→ManagingOrganization, sponsorsFacility→ObservatoryFacility

## Land Owner
- **genus**: `bfo:0000004`
- **definition**: An entity holding legal title or lease rights to land parcels used for astronomical facilities.
- **attributes**: ownerId, ownerName, ownerType, landAreaAcres, leaseRatePerYear, leasePurposeRestriction
- **relations**: leasesTo→ManagingOrganization, ownsParcelAt→ObservatoryFacility
