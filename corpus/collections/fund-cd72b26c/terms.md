# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Investment Fund
- **genus**: `cco:ont00000995`
- **definition**: A pooled investment vehicle structured to generate risk-adjusted returns relative to a composite benchmark while donating fees to charity.
- **attributes**: fundIdentifier, fundName, inceptionDate, fundClass, totalAssetsUnderManagement, managementFeeRate, performanceFeeRate, charitableDonationStatus
- **relations**: holdsUnderlyingFund→UnderlyingFund, tracksBenchmark→BenchmarkIndex, reportsPerformance→PerformanceReport, donatesToCharity→CharitableCause

## Underlying Investment Fund
- **genus**: `cco:ont00000995`
- **definition**: A specialist investment fund managed by external managers that holds the actual assets and is held by the parent fund of funds.
- **attributes**: underlyingFundIdentifier, underlyingFundName, managementFeeWaived, performanceFeeWaived, investmentStrategy, geographicFocus, assetClass, managerName
- **relations**: heldByFund→Fund, investsInAssets→Asset, measuredByBenchmark→BenchmarkIndex, reportsPerformance→PerformanceReport

## Composite Benchmark Index
- **genus**: `cco:ont00000995`
- **definition**: A statistical measure of market performance used as a standard for evaluating the success of the investment fund.
- **attributes**: indexName, indexTicker, indexType, currency, rebalancingFrequency, weightingScheme, numberOfComponents, isHedged
- **relations**: tracksAsset→Asset, usedByFund→Fund, usedByUnderlyingFund→UnderlyingFund

## Performance Report
- **genus**: `cco:ont00000995`
- **definition**: A recorded statistical summary of investment returns, volatility, and risk metrics over specific time periods.
- **attributes**: reportDate, periodStart, periodEnd, trailingReturn, benchmarkReturn, standardDeviation, sharpeRatio, alpha, beta, reportType
- **relations**: reportsForFund→Fund, reportsForUnderlyingFund→UnderlyingFund, comparedToBenchmark→BenchmarkIndex, generatedByManager→FundManager

## Financial Asset
- **genus**: `bfo:0000040`
- **definition**: A financial instrument or security held within the investment portfolio that generates returns.
- **attributes**: assetIdentifier, assetName, assetType, marketCap, sector, countryOfIncorporation, currencyDenomination, isEquity, isFixedIncome
- **relations**: heldInUnderlyingFund→UnderlyingFund, constitutesBenchmark→BenchmarkIndex, tradedOnExchange→Exchange, belongsSector→Sector

## Investment Fund Manager
- **genus**: `bfo:0000040`
- **definition**: An entity or individual responsible for managing the investment strategy and operations of an underlying fund.
- **attributes**: managerIdentifier, managerName, regulatoryLicense, managementFeeWaived, performanceFeeWaived, headquartersCountry, totalAUM, yearsInOperation
- **relations**: managesUnderlyingFund→UnderlyingFund, generatesPerformanceReport→PerformanceReport, selectsAssets→Asset, conductsMeetings→CorporateMeeting

## Charitable Cause
- **genus**: `bfo:0000040`
- **definition**: A non-profit organization or specific cause that receives financial donations from the fund's management and performance fees.
- **attributes**: causeIdentifier, causeName, causeCategory, totalDonationsReceived, donationFrequency, nextDonationDate, taxExemptStatus, geographicFocus
- **relations**: receivesDonationsFromFund→Fund, receivesDonationsFromUnderlyingFund→UnderlyingFund, supportsCommunity→Community

## Corporate Engagement Meeting
- **genus**: `bfo:0000015`
- **definition**: A scheduled interaction between fund managers and company management, boards, or industry experts to gather investment insights.
- **attributes**: meetingIdentifier, meetingDate, meetingType, participantsCount, meetingOutcome, isConfidential, meetingDurationMinutes, location
- **relations**: organizedByManager→FundManager, involvesCompany→Asset, attendedByBoardMember→CorporateBoard, attendedByIndustryExpert→IndustryExpert
