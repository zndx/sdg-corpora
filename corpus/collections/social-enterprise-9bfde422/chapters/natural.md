## Mapping the Social Enterprise Ecosystem

Social enterprises operate at the intersection of commercial activity and public mission, and understanding their landscape requires tracking them across multiple dimensions: where they are located, what services they deliver, who funds them, and how the broader environment evolves over time. The records below capture a snapshot of four such organizations, each documented through a set of interlocking tables that together describe their legal standing, geographic context, service focus, client composition, and the census periods under which they are measured.

**Table `SocialEnterprise`**

| enterpriseId | legalForm | annualIncome | ageYears | isCharity | selfIdentifiesAsSocialEnterprise | headquartersLocation | primaryMarketType | regionId | domainId | sectorId | periodId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 9568454 | SCIO | 26.04 | 37 | false | false | composite-headquar-63 | Local Community | 1 | 100 | 1 | 8928510 |
| managing-resources | CIC | 19.97 | 48 | true | true | primary-headquar-64 | General Public | 2 | 101 | 2 | 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 |
| 974930 | Private Company | 20.14 | 59 | false | false | adaptive-headquar-65 | Public Sector | 3 | 102 | 3 | 3001009030020 |
| state_et_11 | Charity | 19.95 | 70 | true | true | distributed-headquar-66 | Mixed | 4 | 103 | 4 | 195350 |

The SocialEnterprise table is the central registry. Each row identifies an organization by a unique enterprise identifier and records its legal form, annual income (in millions), age in years, charitable status, and whether the organization self-identifies as a social enterprise. The headquarters location is stored as a composite key referencing a geographic anchor, while the region, domain, sector, and period columns link the enterprise to its contextual records. For example, enterprise 9568454 is structured as an SCIO, reports an annual income of 26.04 million, has operated for 37 years, and does not self-identify as a social enterprise despite its headquarters in the composite-headquar-63 zone. By contrast, the entity keyed as managing-resources is a Community Interest Company, aged 48 years, formally recognized as a charity, and affirmatively self-identifying as a social enterprise.

**Table `GeographicRegion`**

| id | regionCode | regionName | regionType | population | socialEnterpriseDensity | isRural | enterpriseId | countryId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | Urban Central Belt | 42 | 6.20 | false | 9568454 | 100 | 2025-01-01 00:14:00 |
| 2 | 6564391 | Adaptive Survey D | Highlands and Islands | 49 | 10.40 | true | managing-resources | 101 | 2025-02-06 03:14:00 |
| 3 | 778560 | Primary Corridor | Rural | 56 | 14.60 | false | 974930 | 102 | 2025-03-11 06:14:00 |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | Local Authority Area | 63 | 18.80 | true | state_et_11 | 103 | 2025-04-16 09:14:00 |

Geographic context is captured in the GeographicRegion table, which assigns each enterprise a region record containing a region code, a human-readable name, a region type, population figures, a social enterprise density metric, a rural/urban flag, and a reference to the country to which the region belongs. Region 1, labeled Distributed Assessment and classified as an Urban Central Belt, covers a population of 42 and records a social enterprise density of 6.20. Region 2, Adaptive Survey D, falls within the Highlands and Islands, is marked as rural, and shows a higher density of 10.40. Region 4, Composite Series, is a Local Authority Area with a density of 18.80 and a population of 63.

**Table `ServiceDomain`**

| domainId | domainCode | domainName | sectorShareOfIncome | isPrimaryProvider | enterpriseId |
|---|---|---|---|---|---|
| 100 | 4716398 | Regional Protocol | 0.18 | false | 9568454 |
| 101 | 605967 | Seasonal Programme D | 85.95 | true | managing-resources |
| 102 | 16375765 | Integrated Standard | 43.25 | false | 974930 |
| 103 | 0471948470 | Extended Framework | 8.71 | true | state_et_11 |

Service delivery is organized through the ServiceDomain table, which links each enterprise to a domain of operation. The domain record carries a domain code, a descriptive name, the share of income attributable to that sector, a flag indicating whether the enterprise is the primary provider in that domain, and a reference back to the enterprise. Domain 101, Seasonal Programme D, accounts for 85.95 percent of managing-resources's income and is flagged as the primary provider. Domain 103, Extended Framework, similarly serves as the primary provider for state_et_11, though its income share is modest at 8.71 percent.

**Table `ClientSector`**

| id | sectorCode | sectorName | isPublicSector | incomeShare | enterpriseId |
|---|---|---|---|---|---|
| 1 | 89434 | Peter Montgomery | true | 9.47 | 9568454 |
| 2 | 8843752 | Katie Williams | false | 8.71 | managing-resources |
| 3 | 3001009030220 | Norma Fisher | true | 0.02 | 974930 |
| 4 | 937714 | Peter Mcdowell | false | 13.49 | state_et_11 |

The ClientSector table describes the composition of each enterprise's revenue by client type. Each sector record includes a sector code, a sector name (which in this dataset corresponds to individual names), a flag indicating whether the sector is public, the income share derived from that sector, and the enterprise to which it belongs. For enterprise 9568454, the Peter Montgomery sector represents 9.47 percent of income and is classified as public sector. For state_et_11, the Peter Mcdowell sector contributes 13.49 percent and is private.

**Table `CensusPeriod`**

| periodId | startYear | endYear | isBaseline | totalEnterprises | growthRate | enterpriseId |
|---|---|---|---|---|---|---|
| 8928510 | 23 | 33 | true | 348 | 6.20 | 9568454 |
| 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 | 26 | 39 | false | 200 | 9.40 | managing-resources |
| 3001009030020 | 29 | 45 | true | 243 | 12.60 | 974930 |
| 195350 | 32 | 51 | false | 43 | 15.80 | state_et_11 |

Temporal measurement is handled by the CensusPeriod table, which defines the observation windows under which enterprises are counted and compared. Each period record specifies a start year, an end year, whether the period serves as a baseline, the total number of enterprises observed, the growth rate, and the enterprise being measured. Period 8928510 spans years 23 through 33, is designated as a baseline, covers 348 enterprises, and records a growth rate of 6.20 percent. Period 195350, covering years 32 through 51, is not a baseline and shows a growth rate of 15.80 percent across 43 enterprises.

**Table `Country`**

| id | countryCode | countryName | totalPopulation | totalSocialEnterprises | regionId |
|---|---|---|---|---|---|
| 100 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D | 38 | 20 | 1 |
| 101 | lu_tax_code_template_m_I_2 | Distributed Series | 3041 | 58 | 2 |
| 102 | default_chart_a_account_57 | Adaptive Assessment | 25476 | 5 | 3 |
| 103 | 727045 | Primary Survey A | 20 | 23 | 4 |

At the highest geographic level, the Country table aggregates data for each nation. It stores a country code, a country name, total population, the total count of social enterprises within the country, and a reference to the region. Country 100, Baseline Corridor D, has a population of 38 and hosts 20 social enterprises. Country 102, Adaptive Assessment, is the most populous at 25,476 residents but contains only 5 social enterprises.

The views synthesize these base tables into analytical lenses, each answering a specific operational question.

**View `social_enterprise_geographic_region_view`**

```sql
CREATE VIEW social_enterprise_geographic_region_view AS
SELECT a.enterpriseId, a.legalForm, a.annualIncome, a.ageYears, b.id AS region_id, b.regionCode AS region_regionCode, b.regionName AS region_regionName
FROM SocialEnterprise a JOIN GeographicRegion b ON a.regionId = b.id;
```

| enterpriseId | legalForm | annualIncome | ageYears | region_id | region_regionCode | region_regionName |
|---|---|---|---|---|---|---|
| 9568454 | SCIO | 26.04 | 37 | 1 | 1562837 | Distributed Assessment |
| managing-resources | CIC | 19.97 | 48 | 2 | 6564391 | Adaptive Survey D |
| 974930 | Private Company | 20.14 | 59 | 3 | 778560 | Primary Corridor |
| state_et_11 | Charity | 19.95 | 70 | 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series |

The social_enterprise_geographic_region_view joins the enterprise registry with its geographic region record, producing a single row per enterprise that combines legal and demographic attributes. This view answers the question: what is the profile of each social enterprise when viewed alongside its regional context? The first row shows enterprise 9568454 (SCIO, income 26.04, age 37) situated in region 1, the Distributed Assessment area with a population of 42 and a density of 6.20. The second row pairs managing-resources (CIC, income 19.97, age 48) with region 2, the Adaptive Survey D area in the Highlands and Islands, which is rural and has a density of 10.40.

**View `social_enterprise_service_domain_view`**

```sql
CREATE VIEW social_enterprise_service_domain_view AS
SELECT a.enterpriseId, a.legalForm, a.annualIncome, a.ageYears, b.domainId AS domain_domainId, b.domainCode AS domain_domainCode, b.domainName AS domain_domainName
FROM SocialEnterprise a JOIN ServiceDomain b ON a.domainId = b.domainId;
```

| enterpriseId | legalForm | annualIncome | ageYears | domain_domainId | domain_domainCode | domain_domainName |
|---|---|---|---|---|---|---|
| 9568454 | SCIO | 26.04 | 37 | 100 | 4716398 | Regional Protocol |
| managing-resources | CIC | 19.97 | 48 | 101 | 605967 | Seasonal Programme D |
| 974930 | Private Company | 20.14 | 59 | 102 | 16375765 | Integrated Standard |
| state_et_11 | Charity | 19.95 | 70 | 103 | 0471948470 | Extended Framework |

The social_enterprise_service_domain_view links each enterprise to its service domain, revealing the operational focus and revenue composition of each organization. This view answers: what services does each enterprise deliver, and how significant is that service line to its income? The row for managing-resources shows domain 101, Seasonal Programme D, which accounts for 85.95 percent of its income and is marked as the primary provider. The row for state_et_11 shows domain 103, Extended Framework, which is also the primary provider but contributes only 8.71 percent of income, suggesting a more diversified portfolio.

**View `social_enterprise_client_sector_view`**

```sql
CREATE VIEW social_enterprise_client_sector_view AS
SELECT a.enterpriseId, a.legalForm, a.annualIncome, a.ageYears, b.id AS sector_id, b.sectorCode AS sector_sectorCode, b.sectorName AS sector_sectorName
FROM SocialEnterprise a JOIN ClientSector b ON a.sectorId = b.id;
```

| enterpriseId | legalForm | annualIncome | ageYears | sector_id | sector_sectorCode | sector_sectorName |
|---|---|---|---|---|---|---|
| 9568454 | SCIO | 26.04 | 37 | 1 | 89434 | Peter Montgomery |
| managing-resources | CIC | 19.97 | 48 | 2 | 8843752 | Katie Williams |
| 974930 | Private Company | 20.14 | 59 | 3 | 3001009030220 | Norma Fisher |
| state_et_11 | Charity | 19.95 | 70 | 4 | 937714 | Peter Mcdowell |

The social_enterprise_client_sector_view connects enterprises to their client sectors, clarifying the revenue sources behind each organization. This view answers: who funds each enterprise, and what proportion of income comes from public versus private clients? The row for 9568454 indicates that the Peter Montgomery sector, classified as public, contributes 9.47 percent of income. The row for managing-resources shows the Katie Williams sector as private, contributing 8.71 percent. The row for 974930 reveals that the Norma Fisher sector is public but contributes a negligible 0.02 percent of income.

**View `social_enterprise_census_period_view`**

```sql
CREATE VIEW social_enterprise_census_period_view AS
SELECT a.enterpriseId, a.legalForm, a.annualIncome, a.ageYears, b.periodId AS period_periodId, b.startYear AS period_startYear, b.endYear AS period_endYear
FROM SocialEnterprise a JOIN CensusPeriod b ON a.periodId = b.periodId;
```

| enterpriseId | legalForm | annualIncome | ageYears | period_periodId | period_startYear | period_endYear |
|---|---|---|---|---|---|---|
| 9568454 | SCIO | 26.04 | 37 | 8928510 | 23 | 33 |
| managing-resources | CIC | 19.97 | 48 | 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 | 26 | 39 |
| 974930 | Private Company | 20.14 | 59 | 3001009030020 | 29 | 45 |
| state_et_11 | Charity | 19.95 | 70 | 195350 | 32 | 51 |

The social_enterprise_census_period_view ties each enterprise to its measurement period, enabling temporal comparison across the landscape. This view answers: under which census window is each enterprise observed, and what are the aggregate conditions of that period? The row for 9568454 places it in period 8928510 (years 23–33, baseline, 348 enterprises, 6.20 percent growth). The row for state_et_11 places it in period 195350 (years 32–51, non-baseline, 43 enterprises, 15.80 percent growth), a period with notably higher growth but far fewer enterprises tracked.

**View `geographic_region_social_enterprise_view`**

```sql
CREATE VIEW geographic_region_social_enterprise_view AS
SELECT a.id, a.regionCode, a.regionName, a.regionType, b.enterpriseId AS enterprise_enterpriseId, b.legalForm AS enterprise_legalForm, b.annualIncome AS enterprise_annualIncome
FROM GeographicRegion a JOIN SocialEnterprise b ON a.enterpriseId = b.enterpriseId;
```

| id | regionCode | regionName | regionType | enterprise_enterpriseId | enterprise_legalForm | enterprise_annualIncome |
|---|---|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | Urban Central Belt | 9568454 | SCIO | 26.04 |
| 2 | 6564391 | Adaptive Survey D | Highlands and Islands | managing-resources | CIC | 19.97 |
| 3 | 778560 | Primary Corridor | Rural | 974930 | Private Company | 20.14 |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | Local Authority Area | state_et_11 | Charity | 19.95 |

The geographic_region_social_enterprise_view inverts the perspective, starting from the region and listing the enterprises operating within it. This view answers: which enterprises are present in each geographic area? The first row shows region 1 (Distributed Assessment, Urban Central Belt, population 42, density 6.20) containing enterprise 9568454. The second row shows region 2 (Adaptive Survey D, Highlands and Islands, population 49, density 10.40, rural) containing managing-resources.

**View `geographic_region_country_view`**

```sql
CREATE VIEW geographic_region_country_view AS
SELECT a.id, a.regionCode, a.regionName, a.regionType, b.id AS country_id, b.countryCode AS country_countryCode, b.countryName AS country_countryName
FROM GeographicRegion a JOIN Country b ON a.countryId = b.id;
```

| id | regionCode | regionName | regionType | country_id | country_countryCode | country_countryName |
|---|---|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | Urban Central Belt | 100 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D |
| 2 | 6564391 | Adaptive Survey D | Highlands and Islands | 101 | lu_tax_code_template_m_I_2 | Distributed Series |
| 3 | 778560 | Primary Corridor | Rural | 102 | default_chart_a_account_57 | Adaptive Assessment |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | Local Authority Area | 103 | 727045 | Primary Survey A |

The geographic_region_country_view joins region records with their parent country, providing a hierarchical geographic view. This view answers: which country does each region belong to, and what are the country-level aggregates? The first row links region 1 to country 100 (Baseline Corridor D, population 38, 20 social enterprises). The second row links region 2 to country 101 (Distributed Series, population 3,041, 58 social enterprises), illustrating how a single country can encompass a much larger population and enterprise count than any individual region.

**View `service_domain_social_enterprise_view`**

```sql
CREATE VIEW service_domain_social_enterprise_view AS
SELECT a.domainId, a.domainCode, a.domainName, a.sectorShareOfIncome, b.enterpriseId AS enterprise_enterpriseId, b.legalForm AS enterprise_legalForm, b.annualIncome AS enterprise_annualIncome
FROM ServiceDomain a JOIN SocialEnterprise b ON a.enterpriseId = b.enterpriseId;
```

| domainId | domainCode | domainName | sectorShareOfIncome | enterprise_enterpriseId | enterprise_legalForm | enterprise_annualIncome |
|---|---|---|---|---|---|---|
| 100 | 4716398 | Regional Protocol | 0.18 | 9568454 | SCIO | 26.04 |
| 101 | 605967 | Seasonal Programme D | 85.95 | managing-resources | CIC | 19.97 |
| 102 | 16375765 | Integrated Standard | 43.25 | 974930 | Private Company | 20.14 |
| 103 | 0471948470 | Extended Framework | 8.71 | state_et_11 | Charity | 19.95 |

The service_domain_social_enterprise_view starts from the service domain and lists the enterprises operating within it. This view answers: which enterprises are active in each service domain? The row for domain 101 (Seasonal Programme D, income share 85.95, primary provider) shows managing-resources as the associated enterprise. The row for domain 100 (Regional Protocol, income share 0.18, not primary) shows enterprise 9568454.

**View `client_sector_social_enterprise_view`**

```sql
CREATE VIEW client_sector_social_enterprise_view AS
SELECT a.id, a.sectorCode, a.sectorName, a.isPublicSector, b.enterpriseId AS enterprise_enterpriseId, b.legalForm AS enterprise_legalForm, b.annualIncome AS enterprise_annualIncome
FROM ClientSector a JOIN SocialEnterprise b ON a.enterpriseId = b.enterpriseId;
```

| id | sectorCode | sectorName | isPublicSector | enterprise_enterpriseId | enterprise_legalForm | enterprise_annualIncome |
|---|---|---|---|---|---|---|
| 1 | 89434 | Peter Montgomery | true | 9568454 | SCIO | 26.04 |
| 2 | 8843752 | Katie Williams | false | managing-resources | CIC | 19.97 |
| 3 | 3001009030220 | Norma Fisher | true | 974930 | Private Company | 20.14 |
| 4 | 937714 | Peter Mcdowell | false | state_et_11 | Charity | 19.95 |

The client_sector_social_enterprise_view starts from the client sector and lists the enterprises drawing revenue from it. This view answers: which enterprises rely on each client sector? The row for sector 1 (Peter Montgomery, public, 9.47 percent share) shows enterprise 9568454. The row for sector 4 (Peter Mcdowell, private, 13.49 percent share) shows state_et_11.

**View `census_period_social_enterprise_view`**

```sql
CREATE VIEW census_period_social_enterprise_view AS
SELECT a.periodId, a.startYear, a.endYear, a.isBaseline, b.enterpriseId AS enterprise_enterpriseId, b.legalForm AS enterprise_legalForm, b.annualIncome AS enterprise_annualIncome
FROM CensusPeriod a JOIN SocialEnterprise b ON a.enterpriseId = b.enterpriseId;
```

| periodId | startYear | endYear | isBaseline | enterprise_enterpriseId | enterprise_legalForm | enterprise_annualIncome |
|---|---|---|---|---|---|---|
| 8928510 | 23 | 33 | true | 9568454 | SCIO | 26.04 |
| 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 | 26 | 39 | false | managing-resources | CIC | 19.97 |
| 3001009030020 | 29 | 45 | true | 974930 | Private Company | 20.14 |
| 195350 | 32 | 51 | false | state_et_11 | Charity | 19.95 |

The census_period_social_enterprise_view starts from the census period and lists the enterprises measured within it. This view answers: which enterprises fall under each observation window? The row for period 8928510 (years 23–33, baseline, 348 enterprises, 6.20 percent growth) shows enterprise 9568454. The row for period 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 (years 26–39, non-baseline, 200 enterprises, 9.40 percent growth) shows managing-resources.

**View `country_geographic_region_view`**

```sql
CREATE VIEW country_geographic_region_view AS
SELECT a.id, a.countryCode, a.countryName, a.totalPopulation, b.id AS region_id, b.regionCode AS region_regionCode, b.regionName AS region_regionName
FROM Country a JOIN GeographicRegion b ON a.regionId = b.id;
```

| id | countryCode | countryName | totalPopulation | region_id | region_regionCode | region_regionName |
|---|---|---|---|---|---|---|
| 100 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D | 38 | 1 | 1562837 | Distributed Assessment |
| 101 | lu_tax_code_template_m_I_2 | Distributed Series | 3041 | 2 | 6564391 | Adaptive Survey D |
| 102 | default_chart_a_account_57 | Adaptive Assessment | 25476 | 3 | 778560 | Primary Corridor |
| 103 | 727045 | Primary Survey A | 20 | 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series |

The country_geographic_region_view joins country records with their constituent regions, completing the geographic hierarchy. This view answers: which regions belong to each country, and how do regional characteristics compare within a nation? The first row links country 100 (Baseline Corridor D, population 38, 20 enterprises) to region 1 (Distributed Assessment, population 42, density 6.20). The second row links country 101 (Distributed Series, population 3,041, 58 enterprises) to region 2 (Adaptive Survey D, population 49, density 10.40, rural).

Together, these tables and views form a coherent framework for describing, comparing, and analyzing social enterprises across their legal, geographic, operational, financial, and temporal dimensions. Each base table captures a distinct facet of the enterprise ecosystem, and each view stitches those facets together to answer a specific analytical question. The data supports both granular investigation of individual organizations and broader assessment of trends across regions, sectors, and time periods.