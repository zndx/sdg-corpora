The social enterprise census domain captures a multi-dimensional portrait of organisations that blend commercial activity with social purpose. Each enterprise is characterised by its legal form, financial profile, operational geography, service domain, client sector, and the census period under which it was recorded. The relational schema models these dimensions through six base tables—`SocialEnterprise`, `GeographicRegion`, `ServiceDomain`, `ClientSector`, `CensusPeriod`, and `Country`—linked by foreign keys that propagate from the central enterprise entity outward to each dimension. A suite of ten views then materialises the joins that analysts need to answer questions about which enterprises operate in which regions, which countries contain which regions, and how census-period aggregates relate back to individual organisations.

## The Central Entity: SocialEnterprise

**Table `SocialEnterprise`**

| enterpriseId | legalForm | annualIncome | ageYears | isCharity | selfIdentifiesAsSocialEnterprise | headquartersLocation | primaryMarketType | regionId | domainId | sectorId | periodId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 9568454 | SCIO | 26.04 | 37 | false | false | composite-headquar-63 | Local Community | 1 | 100 | 1 | 8928510 |
| managing-resources | CIC | 19.97 | 48 | true | true | primary-headquar-64 | General Public | 2 | 101 | 2 | 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 |
| 974930 | Private Company | 20.14 | 59 | false | false | adaptive-headquar-65 | Public Sector | 3 | 102 | 3 | 3001009030020 |
| state_et_11 | Charity | 19.95 | 70 | true | true | distributed-headquar-66 | Mixed | 4 | 103 | 4 | 195350 |

The `SocialEnterprise` table sits at the centre of the schema. Its primary key, `enterpriseId`, is a heterogeneous identifier: some values are numeric strings such as `9568454` and `974930`, while others are UUID-like tokens such as `managing-resources` and `state_et_11`. The table stores eight intrinsic attributes. `legalForm` distinguishes between organisational types—`SCIO`, `CIC`, `Private Company`, and `Charity` appear in the sample rows. `annualIncome` is a decimal measure (values range from `19.95` to `26.04` in the excerpt). `ageYears` records the enterprise's age, spanning `37` to `70` years. Boolean flags `isCharity` and `selfIdentifiesAsSocialEnterprise` capture legal and self-declared status; the first two rows show a mismatch where `isCharity` is `true` but `selfIdentifiesAsSocialEnterprise` is `false`, and vice versa in the third row. `headquartersLocation` is a coded string such as `composite-headquar-63` or `primary-headquar-64`. `primaryMarketType` classifies the enterprise's market orientation as `Local Community`, `General Public`, `Public Sector`, or `Mixed`.

Four foreign-key columns anchor the enterprise to its dimensional context. `regionId` references `GeographicRegion.id`, `domainId` references `ServiceDomain.domainId`, `sectorId` references `ClientSector.id`, and `periodId` references `CensusPeriod.periodId`. Each enterprise row thus carries a single value for each dimension, establishing a one-to-one mapping between an enterprise and its geographic region, service domain, client sector, and census period.

## Geographic Dimension: GeographicRegion and Country

**Table `GeographicRegion`**

| id | regionCode | regionName | regionType | population | socialEnterpriseDensity | isRural | enterpriseId | countryId | createdAt |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | Urban Central Belt | 42 | 6.20 | false | 9568454 | 100 | 2025-01-01 00:14:00 |
| 2 | 6564391 | Adaptive Survey D | Highlands and Islands | 49 | 10.40 | true | managing-resources | 101 | 2025-02-06 03:14:00 |
| 3 | 778560 | Primary Corridor | Rural | 56 | 14.60 | false | 974930 | 102 | 2025-03-11 06:14:00 |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | Local Authority Area | 63 | 18.80 | true | state_et_11 | 103 | 2025-04-16 09:14:00 |

The `GeographicRegion` table describes the spatial context of enterprise operations. Its primary key `id` is a mix of short integers (`1`, `2`, `3`, `4`) and longer hex-encoded strings (`8667ec1da10c4a0293d91388b49bc77c`). The region is further characterised by `regionCode` (e.g. `1562837`), `regionName` (such as `Distributed Assessment` or `Adaptive Survey D`), and `regionType` (values include `Urban Central Belt`, `Highlands and Islands`, `Rural`, and `Local Authority Area`). Numeric attributes `population` (ranging from `42` to `63`) and `socialEnterpriseDensity` (from `6.20` to `18.80`) provide demographic context, while `isRural` is a boolean flag. The column `enterpriseId` is a foreign key back to `SocialEnterprise.enterpriseId`, creating a reverse link from region to the enterprise it describes. The column `countryId` is a foreign key to `Country.id`, establishing the hierarchy that regions belong to countries. A timestamp column `createdAt` (e.g. `2025-01-01 00:14:00`) records when the region record was created.

**Table `Country`**

| id | countryCode | countryName | totalPopulation | totalSocialEnterprises | regionId |
|---|---|---|---|---|---|
| 100 | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | Baseline Corridor D | 38 | 20 | 1 |
| 101 | lu_tax_code_template_m_I_2 | Distributed Series | 3041 | 58 | 2 |
| 102 | default_chart_a_account_57 | Adaptive Assessment | 25476 | 5 | 3 |
| 103 | 727045 | Primary Survey A | 20 | 23 | 4 |

The `Country` table sits at the top of the geographic hierarchy. Its primary key `id` is a numeric identifier (`100` through `103`). The columns `countryCode` (UUID-like strings such as `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0`), `countryName` (e.g. `Baseline Corridor D`, `Distributed Series`), `totalPopulation` (from `20` to `25476`), and `totalSocialEnterprises` (from `5` to `58`) provide aggregate national statistics. The foreign key `regionId` references `GeographicRegion.id`, meaning each country row points to the geographic region it contains. This is a one-to-many relationship in the opposite direction from the region-to-country link in `GeographicRegion.countryId`.

## Service and Client Dimensions: ServiceDomain and ClientSector

**Table `ServiceDomain`**

| domainId | domainCode | domainName | sectorShareOfIncome | isPrimaryProvider | enterpriseId |
|---|---|---|---|---|---|
| 100 | 4716398 | Regional Protocol | 0.18 | false | 9568454 |
| 101 | 605967 | Seasonal Programme D | 85.95 | true | managing-resources |
| 102 | 16375765 | Integrated Standard | 43.25 | false | 974930 |
| 103 | 0471948470 | Extended Framework | 8.71 | true | state_et_11 |

The `ServiceDomain` table captures the operational scope of each enterprise. Its primary key `domainId` is a numeric identifier (`100` through `103`). The columns `domainCode` (e.g. `4716398`), `domainName` (such as `Regional Protocol` or `Seasonal Programme D`), and `sectorShareOfIncome` (a decimal from `0.18` to `85.95`) describe the domain's characteristics. The boolean `isPrimaryProvider` indicates whether this domain is the enterprise's primary area of service. The foreign key `enterpriseId` links back to `SocialEnterprise`, mirroring the forward link from the enterprise table. In the sample data, `Seasonal Programme D` has a `sectorShareOfIncome` of `85.95` and is marked as the primary provider, while `Regional Protocol` contributes only `0.18` to income share.

**Table `ClientSector`**

| id | sectorCode | sectorName | isPublicSector | incomeShare | enterpriseId |
|---|---|---|---|---|---|
| 1 | 89434 | Peter Montgomery | true | 9.47 | 9568454 |
| 2 | 8843752 | Katie Williams | false | 8.71 | managing-resources |
| 3 | 3001009030220 | Norma Fisher | true | 0.02 | 974930 |
| 4 | 937714 | Peter Mcdowell | false | 13.49 | state_et_11 |

The `ClientSector` table records the client base of each enterprise. Its primary key `id` is numeric (`1` through `4`). The columns `sectorCode` (e.g. `89434`), `sectorName` (such as `Peter Montgomery` or `Katie Williams`), `isPublicSector` (a boolean), and `incomeShare` (from `0.02` to `13.49`) characterise the sector. The foreign key `enterpriseId` again links back to `SocialEnterprise`. The sector names in the sample data are personal names, suggesting these may represent named client organisations or constituencies rather than broad industry categories. The `incomeShare` column quantifies what proportion of the enterprise's income derives from this sector.

## Temporal Dimension: CensusPeriod

**Table `CensusPeriod`**

| periodId | startYear | endYear | isBaseline | totalEnterprises | growthRate | enterpriseId |
|---|---|---|---|---|---|---|
| 8928510 | 23 | 33 | true | 348 | 6.20 | 9568454 |
| 11a34e36-9bac-11eb-a8a2-19ed5c03f8d3 | 26 | 39 | false | 200 | 9.40 | managing-resources |
| 3001009030020 | 29 | 45 | true | 243 | 12.60 | 974930 |
| 195350 | 32 | 51 | false | 43 | 15.80 | state_et_11 |

The `CensusPeriod` table provides the temporal context for enterprise data. Its primary key `periodId` is heterogeneous: values include numeric strings (`8928510`, `195350`), UUID-like tokens (`11a34e36-9bac-11eb-a8a2-19ed5c03f8d3`), and longer numeric codes (`3001009030020`). The columns `startYear` and `endYear` define the period boundaries (e.g. `23` to `33`, `26` to `39`). The boolean `isBaseline` marks whether the period serves as a baseline for comparison. Aggregate columns `totalEnterprises` (from `43` to `348`) and `growthRate` (from `6.20` to `15.80`) provide census-level statistics. The foreign key `enterpriseId` links the period back to the enterprise it describes.

## View: social_enterprise_geographic_region_view

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

This view joins `SocialEnterprise` with `GeographicRegion` on the matching of `SocialEnterprise.regionId` to `GeographicRegion.id`. The result answers the question: *what geographic context does each enterprise operate in?* Reading the first row, enterprise `9568454` (a `SCIO` with `37` years of age) operates in the `Distributed Assessment` region (`regionType: Urban Central Belt`) with a population of `42` and a social enterprise density of `6.20`. The second row shows `managing-resources` (a `CIC`, `48` years old) in the `Adaptive Survey D` region (`Highlands and Islands`, `isRural: true`), where density is notably higher at `10.40`. The view reconstructs the enterprise-region fact by pulling together the enterprise's legal and financial attributes with the region's demographic and typological attributes in a single row.

## View: social_enterprise_service_domain_view

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

This view joins `SocialEnterprise` with `ServiceDomain` on `SocialEnterprise.domainId = ServiceDomain.domainId`. It answers: *in which service domain does each enterprise operate, and what is the domain's financial significance?* The first row pairs enterprise `9568454` with the `Regional Protocol` domain (`domainCode: 4716398`), which contributes `0.18` to sector income share and is not the primary provider. The second row links `managing-resources` to `Seasonal Programme D`, which commands `85.95` of income share and is flagged as the primary provider. This view is particularly useful for identifying enterprises whose service domains dominate their income profile versus those with more diversified or marginal domain involvement.

## View: social_enterprise_client_sector_view

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

This view joins `SocialEnterprise` with `ClientSector` on `SocialEnterprise.sectorId = ClientSector.id`. It answers: *which client sector serves each enterprise, and what share of income does that sector represent?* The first row shows enterprise `9568454` serving the `Peter Montgomery` sector (`sectorCode: 89434`), which is a public-sector client contributing `9.47` percent of income. The third row links `974930` (a `Private Company`, `59` years old) to the `Norma Fisher` sector, a public-sector client with a negligible income share of `0.02`. The view enables analysts to assess the public-versus-private composition of enterprise client bases and the relative financial importance of each sector.

## View: social_enterprise_census_period_view

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

This view joins `SocialEnterprise` with `CensusPeriod` on `SocialEnterprise.periodId = CensusPeriod.periodId`. It answers: *under which census period was each enterprise recorded, and what are the period-level aggregates?* The first row shows enterprise `9568454` recorded in period `8928510` (years `23`–`33`), which is a baseline period containing `348` total enterprises with a growth rate of `6.20`. The second row links `managing-resources` to period `11a34e36-9bac-11eb-a8a2-19ed5c03f8d3` (years `26`–`39`), a non-baseline period with `200` enterprises and a higher growth rate of `9.40`. This view allows enterprises to be compared against the census-period context in which they were measured.

## View: geographic_region_social_enterprise_view

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

This view joins `GeographicRegion` with `SocialEnterprise` on `GeographicRegion.enterpriseId = SocialEnterprise.enterpriseId`. It inverts the perspective of the enterprise-to-region view, answering: *which enterprise is associated with each geographic region?* The first row shows region `1` (`Distributed Assessment`, `Urban Central Belt`) linked to enterprise `9568454` (a `SCIO` with `annualIncome: 26.04`). The fourth row links region `4` (`Composite Series`, `Local Authority Area`, `isRural: true`) to enterprise `state_et_11` (a `Charity`, `70` years old, `annualIncome: 19.95`). This view is useful for geographic analysts who start from a region and want to discover the enterprises operating within it.

## View: geographic_region_country_view

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

This view joins `GeographicRegion` with `Country` on `GeographicRegion.countryId = Country.id`. It answers: *which country does each geographic region belong to?* The first row shows region `1` (`Distributed Assessment`) belonging to country `100` (`Baseline Corridor D`, `totalPopulation: 38`, `totalSocialEnterprises: 20`). The third row links region `3` (`Primary Corridor`) to country `102` (`Adaptive Assessment`, `totalPopulation: 25476`, `totalSocialEnterprises: 5`). This view materialises the country-region hierarchy, enabling analysts to aggregate regional statistics up to the country level or to filter regions by their parent country.

## View: service_domain_social_enterprise_view

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

This view joins `ServiceDomain` with `SocialEnterprise` on `ServiceDomain.enterpriseId = SocialEnterprise.enterpriseId`. It answers: *which enterprise operates in each service domain?* The first row shows domain `100` (`Regional Protocol`, `sectorShareOfIncome: 0.18`, `isPrimaryProvider: false`) linked to enterprise `9568454` (a `SCIO`, `37` years old). The fourth row links domain `103` (`Extended Framework`, `sectorShareOfIncome: 8.71`, `isPrimaryProvider: true`) to enterprise `state_et_11` (a `Charity`, `70` years old). This view is the domain-centric counterpart to the enterprise-centric `social_enterprise_service_domain_view`, useful when starting from a domain and wanting to discover the enterprises that serve it.

## View: client_sector_social_enterprise_view

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

This view joins `ClientSector` with `SocialEnterprise` on `ClientSector.enterpriseId = SocialEnterprise.enterpriseId`. It answers: *which enterprise serves each client sector?* The first row shows sector `1` (`Peter Montgomery`, `isPublicSector: true`, `incomeShare: 9.47`) linked to enterprise `9568454` (a `SCIO` with `annualIncome: 26.04`). The fourth row links sector `4` (`Peter Mcdowell`, `isPublicSector: false`, `incomeShare: 13.49`) to enterprise `state_et_11` (a `Charity`, `70` years old). This view enables sector analysts to trace client sectors back to the enterprises they serve.

## View: census_period_social_enterprise_view

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

This view joins `CensusPeriod` with `SocialEnterprise` on `CensusPeriod.enterpriseId = SocialEnterprise.enterpriseId`. It answers: *which enterprise was recorded in each census period?* The first row shows period `8928510` (years `23`–`33`, `isBaseline: true`, `totalEnterprises: 348`, `growthRate: 6.20`) linked to enterprise `9568454` (a `SCIO`, `37` years old). The fourth row links period `195350` (years `32`–`51`, `isBaseline: false`, `totalEnterprises: 43`, `growthRate: 15.80`) to enterprise `state_et_11` (a `Charity`, `70` years old). This view is useful for temporal analysts who want to examine the enterprises that fall within a given census period.

## View: country_geographic_region_view

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

This view joins `Country` with `GeographicRegion` on `Country.regionId = GeographicRegion.id`. It answers: *which geographic regions are contained within each country?* The first row shows country `100` (`Baseline Corridor D`, `totalPopulation: 38`, `totalSocialEnterprises: 20`) containing region `1` (`Distributed Assessment`, `Urban Central Belt`, `population: 42`, `socialEnterpriseDensity: 6.20`). The second row links country `101` (`Distributed Series`, `totalPopulation: 3041`, `totalSocialEnterprises: 58`) to region `2` (`Adaptive Survey D`, `Highlands and Islands`, `population: 49`, `socialEnterpriseDensity: 10.40`). This view materialises the country-to-region relationship from the country side, enabling analysts to list all regions within a country and compare regional characteristics across countries.

## Synthesis

The schema models the social enterprise census domain as a star-like structure with `SocialEnterprise` at the centre, radiating foreign keys to four dimension tables (`GeographicRegion`, `ServiceDomain`, `ClientSector`, `CensusPeriod`), while `GeographicRegion` itself links upward to `Country`. Each base table stores a single row per entity, with the enterprise table carrying the composite foreign keys that bind an enterprise to exactly one value in each dimension. The ten views materialise the join paths that analysts need: four enterprise-centric views (enterprise joined to each dimension), four dimension-centric views (each dimension joined back to enterprise), and two geographic hierarchy views (region-to-country and country-to-region). Together, the tables and views provide a normalised foundation that can be queried from any angle—enterprise, region, domain, sector, period, or country—while preserving the integrity of the underlying domain model through explicit foreign-key relationships.