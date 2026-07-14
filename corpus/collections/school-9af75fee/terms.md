# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Educational Institution
- **genus**: `bfo:0000040`
- **definition**: A physical or virtual educational institution targeted for internet connectivity and device provision.
- **attributes**: schoolId, name, countryCode, latitude, longitude, enrollmentCount, connectivityStatus
- **relations**: hasDevice→EducationalDevice, locatedIn→Country, servedBy→ConnectivityProvider

## Educational Device
- **genus**: `cco:ont00000995`
- **definition**: A physical computing device (e.g., tablet, computer) procured and distributed to schools for educational use.
- **attributes**: deviceId, deviceType, manufacturer, modelNumber, procurementCost, specificationScore, status
- **relations**: assignedTo→School, suppliedBy→Supplier

## Connectivity Provider
- **genus**: `bfo:0000040`
- **definition**: An organization or entity providing internet connectivity services to schools.
- **attributes**: providerId, name, serviceType, maxBandwidth, dataAllowance, contractStartDate, contractEndDate
- **relations**: providesConnectivityTo→School, operatesIn→Country

## Country
- **genus**: `bfo:0000004`
- **definition**: A sovereign state or territory where schools are located and connectivity initiatives are implemented.
- **attributes**: countryCode, name, region, gdpPerCapita, internetPenetration, schoolConnectivityRate
- **relations**: contains→School, hasProvider→ConnectivityProvider

## Device Supplier
- **genus**: `bfo:0000040`
- **definition**: An entity or organization supplying educational devices to schools or governments.
- **attributes**: supplierId, name, countryOfOrigin, certificationLevel, marketShare, contactEmail
- **relations**: suppliesDevicesTo→School, suppliesTo→Country
