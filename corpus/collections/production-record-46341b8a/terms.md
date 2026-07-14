# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Production Record
- **genus**: `cco:ont00000995`
- **definition**: A quantitative record of hydrocarbon extraction volume from a specific field or region over a defined period.
- **attributes**: recordId, volume, unit, startDate, endDate, source
- **relations**: measuredBy→SurveyReport, originatesFrom→GeographicRegion

## Survey Report
- **genus**: `cco:ont00000958`
- **definition**: A formal document or dataset aggregating production statistics from multiple entities for a specific reporting period.
- **attributes**: reportId, publisher, publicationDate, reportType, periodCovered
- **relations**: containsRecord→ProductionRecord

## Price Forecast
- **genus**: `cco:ont00000995`
- **definition**: A projected monetary value for a specific commodity at a future date, issued by an institutional body.
- **attributes**: forecastId, targetPrice, currency, year, commodity, issuingBody
- **relations**: issuedBy→Institution, appliesTo→Commodity

## Institution
- **genus**: `bfo:0000040`
- **definition**: An organized body or entity capable of issuing forecasts, conducting surveys, or regulating markets.
- **attributes**: institutionId, name, type, headquarters
- **relations**: issuesForecast→PriceForecast

## Commodity
- **genus**: `bfo:0000040`
- **definition**: A raw material or primary agricultural product that can be bought and sold, such as crude oil or natural gas.
- **attributes**: commodityId, name, type, unitOfMeasure
- **relations**: isSubjectOf→PriceForecast

## Trade Transaction
- **genus**: `bfo:0000015`
- **definition**: An economic activity involving the exchange of hydrocarbon resources between a supplier and a buyer.
- **attributes**: transactionId, volume, unit, date, direction, status
- **relations**: involvesExporter→GeographicRegion, involvesImporter→GeographicRegion, transfers→Commodity

## Geographic Region
- **genus**: `bfo:0000040`
- **definition**: A defined spatial area, such as a country, basin, or bay, associated with resource extraction or trade.
- **attributes**: regionId, name, type, coordinates, politicalAffiliation
- **relations**: isExporterIn→TradeTransaction, isImporterIn→TradeTransaction, containsField→ProductionRecord

## Asset Divestment
- **genus**: `bfo:0000015`
- **definition**: The process of selling or transferring ownership of physical or operational assets, such as land or production rights.
- **attributes**: divestmentId, totalValue, currency, startDate, endDate, status
- **relations**: initiatedBy→Company, transferredTo→Company, involvesAsset→LandParcel

## Company
- **genus**: `bfo:0000040`
- **definition**: A commercial enterprise engaged in the exploration, production, or trading of hydrocarbons.
- **attributes**: companyId, name, type, headquarters, ownershipStructure
- **relations**: initiatesDivestment→AssetDivestment, receivesDivestment→AssetDivestment

## Land Parcel
- **genus**: `bfo:0000040`
- **definition**: A specific tract of land with defined boundaries and acreage, subject to ownership or leasing.
- **attributes**: parcelId, acreage, location, developmentStatus, areaName
- **relations**: isSoldIn→AssetDivestment
