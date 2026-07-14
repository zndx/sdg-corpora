# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Internet of Things Device
- **genus**: `cco:ont00000995`
- **definition**: A physical electronic device capable of network connectivity and automated function, such as a USB charger.
- **attributes**: deviceIdentifier, deviceName, deviceModel, firmwareVersion, manufacturingDate, isCertified, certificationBody
- **relations**: manufacturedBy→Manufacturer, distributedBy→DistributionChannel, soldIn→MarketRegion

## Manufacturing Entity
- **genus**: `bfo:0000015`
- **definition**: An organization or facility responsible for the physical production and assembly of IoT devices.
- **attributes**: manufacturerId, companyName, countryOfOperation, contractStatus, certificationLevel, contactEmail
- **relations**: produces→IoTDevice, suppliesTo→DistributionChannel

## Distribution Channel
- **genus**: `cco:ont00000995`
- **definition**: A commercial pathway or intermediary through which IoT devices are moved from manufacturers to end-users.
- **attributes**: channelId, channelName, regionServed, contractStartDate, contractEndDate, isNegotiating
- **relations**: distributes→IoTDevice, serves→MarketRegion

## Market Region
- **genus**: `bfo:0000002`
- **definition**: A geographic area defined by political or economic boundaries where IoT devices are targeted for sale.
- **attributes**: regionId, regionName, householdCount, housingStartsRate, marketMaturity, isTargetMarket
- **relations**: contains→DistributionChannel, targets→IoTDevice

## Safety Certification
- **genus**: `cco:ont00000958`
- **definition**: A formal record or document attesting that a device or component meets specific safety standards.
- **attributes**: certificationId, standardCode, issuingAuthority, issueDate, expiryDate, status, scopeDescription
- **relations**: appliesTo→IoTDevice, issuedBy→Manufacturer

## Intellectual Property Asset
- **genus**: `cco:ont00000958`
- **definition**: A non-physical creation of the mind, such as a trademark, e-commerce website, or design, owned by a company.
- **attributes**: assetId, assetName, assetType, valuationAmount, currencyCode, registrationDate, isLicensed
- **relations**: usedIn→IoTDevice, ownedBy→Manufacturer
