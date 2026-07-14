# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Farmland Parcel
- **genus**: `bfo:0000040`
- **definition**: A specific tract of agricultural land identified by its geographic boundaries and ownership status.
- **attributes**: parcelId, acreage, zoningDistrict, soilQualityIndex, purchaseDate, currentMarketValue
- **relations**: heldBy→InstitutionalInvestor, locatedIn→GeographicRegion, managedBy→FarmManagementEntity

## Institutional Investor
- **genus**: `bfo:0000040`
- **definition**: A financial entity such as a pension fund, hedge fund, or insurance company that acquires farmland as an investment asset.
- **attributes**: investorId, investorName, investorType, totalAgriculturalAssets, headquartersLocation, registrationDate
- **relations**: acquires→FarmlandParcel, subsidyOf→ParentCorporation

## Parent Corporation
- **genus**: `bfo:0000040`
- **definition**: The ultimate corporate entity that owns or controls an institutional investor or agricultural investment group.
- **attributes**: corpId, corpName, countryOfOrigin, industrySector, foundingYear, isPubliclyTraded
- **relations**: owns→InstitutionalInvestor

## Agricultural Lease
- **genus**: `bfo:0000040`
- **definition**: A legal agreement granting temporary use rights to farmland in exchange for periodic payments.
- **attributes**: leaseId, startDate, endDate, annualRent, leaseStatus, cropType
- **relations**: covers→FarmlandParcel, grantedTo→InstitutionalInvestor, issuedBy→LandOwner

## Land Owner
- **genus**: `bfo:0000040`
- **definition**: An individual or entity that holds legal title to agricultural land and may lease or sell it.
- **attributes**: ownerId, ownerName, ownerType, totalLandHeld, retirementStatus, lastSalePrice
- **relations**: owns→FarmlandParcel, leasesTo→InstitutionalInvestor

## Geographic Region
- **genus**: `bfo:0000040`
- **definition**: A defined geographic area, such as a state or county, where agricultural land transactions occur.
- **attributes**: regionId, regionName, regionType, totalAgriculturalAcreage, averageLandPrice, dominantCrops
- **relations**: contains→FarmlandParcel
