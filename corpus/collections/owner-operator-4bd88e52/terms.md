# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Owner or Operator
- **genus**: `cco:ont00000995`
- **definition**: A natural person or legal entity (corporation, LLC, LLP) that owns or controls the management of a livestock facility.
- **attributes**: legalName, contactPerson, streetAddress, city, state, zipCode, phone, emailAddress, entityType
- **relations**: certifies→PermitApplication, ownsOrOperates→Facility

## Livestock Facility
- **genus**: `bfo:0000040`
- **definition**: A physical site containing animal confinement buildings, manure storage, or treatment facilities where animals are housed or confined.
- **attributes**: facilityName, streetAddress, city, state, zipCode, county, township, section, contactPhone, contactEmail
- **relations**: locatedIn→Watershed, hasOwnerOperator→OwnerOperator, hasAnimalConfinementBuilding→AnimalConfinementBuilding, hasAnimalCapacity→AnimalCapacity

## Watershed of Record
- **genus**: `bfo:0000040`
- **definition**: A hydrological drainage area identified by the EPA Watershed Information Network that contains the facility.
- **attributes**: watershedName, epaAddressCode
- **relations**: contains→Facility

## Animal Confinement Building
- **genus**: `bfo:0000040`
- **definition**: A structure or lot where animals are or will be housed or confined as part of the facility.
- **attributes**: buildingIdentifier, buildingType, constructionStatus
- **relations**: partOf→Facility, hasAnimalCapacity→AnimalCapacity

## Animal Capacity
- **genus**: `bfo:0000023`
- **definition**: The design capacity or actual number of animals housed in a confinement building or facility, defining its regulatory classification.
- **attributes**: animalType, capacityCount, facilityClassification
- **relations**: appliesTo→AnimalConfinementBuilding, defines→Facility

## Permit Application
- **genus**: `cco:ont00000995`
- **definition**: A formal submission to the regulatory authority requesting a Permit to Install, Permit to Operate, or NPDES authorization.
- **attributes**: applicationId, applicationDate, permitType, reasonCode, feeAmount, preparedBy, preparedByCompany, preparedByPhone, preparedByEmail
- **relations**: submittedBy→OwnerOperator, forFacility→Facility, preparedByProfessionalEngineer→OwnerOperator, requires→OtherPermit

## Other Permit or License
- **genus**: `cco:ont00000995`
- **definition**: A separate regulatory authorization, license, or certification required for the facility or application.
- **attributes**: permitName, issuingAuthority, permitNumber, status
- **relations**: linkedTo→PermitApplication
