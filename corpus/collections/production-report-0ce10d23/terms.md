# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Production Report
- **genus**: `cco:ont00000995`
- **definition**: A quantitative record of hydrocarbon extraction volumes over a specified period, typically aggregated by organization or region.
- **attributes**: reportId, reportDate, organizationName, regionName, volumeBpd, unitOfMeasure, dataSource
- **relations**: coversRegion→GeographicRegion, coversOrganization→CorporateEntity

## Geographic Region
- **genus**: `bfo:0000002`
- **definition**: A spatially extended entity representing a specific area of land or water relevant to resource extraction or trade.
- **attributes**: regionId, regionName, countryCode, latitude, longitude, regionType

## Corporate Entity
- **genus**: `bfo:0000040`
- **definition**: A legally recognized organization engaged in the exploration, production, or trade of hydrocarbons.
- **attributes**: entityId, entityName, headquartersLocation, entityType, marketCap

## Price Forecast
- **genus**: `cco:ont00000995`
- **definition**: A projected monetary value for a commodity at a future date, issued by an analytical institution.
- **attributes**: forecastId, issueDate, targetYear, priceValue, currencyCode, forecastSource, commodityName
- **relations**: issuedBy→CorporateEntity

## Trade Shipment
- **genus**: `bfo:0000015`
- **definition**: The physical movement of hydrocarbon commodities from a source region to a destination market.
- **attributes**: shipmentId, shipmentDate, volumeTonnes, commodityType, originCountry, destinationCountry
- **relations**: originatesIn→GeographicRegion, destinedFor→GeographicRegion

## Rig Count
- **genus**: `cco:ont00000995`
- **definition**: A statistical count of active drilling rigs operating within a specific geographic area at a given time.
- **attributes**: countId, countDate, activeRigCount, regionName, dataProvider
- **relations**: locatedIn→GeographicRegion
