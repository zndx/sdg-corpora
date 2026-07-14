# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Social Enterprise
- **genus**: `cco:ont00000995`
- **definition**: An organization trading for the common good, addressing social needs, strengthening communities, improving people's life chances, and protecting the environment, operating consistent with the Voluntary Code of Practice for Social Enterprise in Scotland.
- **attributes**: enterpriseId, legalForm, annualIncome, ageYears, isCharity, selfIdentifiesAsSocialEnterprise, headquartersLocation, primaryMarketType
- **relations**: operatesIn→GeographicRegion, providesServiceTo→ServiceDomain, receivesIncomeFrom→ClientSector, formedIn→CensusPeriod

## Geographic Region
- **genus**: `bfo:0000002`
- **definition**: A spatial area in Scotland where social enterprises are headquartered or operate, including urban central belt, Highlands and Islands, rural areas, and specific local authority areas.
- **attributes**: regionCode, regionName, regionType, population, socialEnterpriseDensity, isRural
- **relations**: containsSocialEnterprises→SocialEnterprise, isPartOf→Country

## Service Domain
- **genus**: `bfo:0000015`
- **definition**: A sector or field in which social enterprises operate, such as Housing, Health & Social Care, Community Centres & Halls, or Theatre.
- **attributes**: domainCode, domainName, sectorShareOfIncome, isPrimaryProvider
- **relations**: servedBySocialEnterprises→SocialEnterprise

## Client Sector
- **genus**: `bfo:0000002`
- **definition**: The type of entity that purchases services or goods from social enterprises, such as the general public or public sector bodies.
- **attributes**: sectorCode, sectorName, isPublicSector, incomeShare
- **relations**: purchasesFromSocialEnterprises→SocialEnterprise

## Census Period
- **genus**: `bfo:0000015`
- **definition**: A biennial time interval during which the Social Enterprise Census is conducted to track the scale, characteristics, and contribution of Scotland's social enterprise sector.
- **attributes**: periodId, startYear, endYear, isBaseline, totalEnterprises, growthRate
- **relations**: coversSocialEnterprises→SocialEnterprise

## Country
- **genus**: `bfo:0000002`
- **definition**: The sovereign state of Scotland, the geographic scope of the Social Enterprise Census.
- **attributes**: countryCode, countryName, totalPopulation, totalSocialEnterprises
- **relations**: containsGeographicRegions→GeographicRegion
