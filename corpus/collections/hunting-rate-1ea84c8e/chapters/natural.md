## The Hunting Operations Reference

Hunting operations require the careful orchestration of services, accommodations, licensing, and pricing structures across extended timeframes. A hunting package serves as the central organizing unit, bundling together the logistical elements that a client encounters: the services provided on the ground, the lodging arrangements, the regulatory permits required, and the financial terms governing the entire experience. This chapter documents the data structures that capture these operations, showing how each component relates to the others and how joined views surface the information practitioners need to manage bookings, verify compliance, and calculate costs.

**Table `HuntingRate`**

| id | rateId | rateType | dailyFee | currency | validFrom | validTo | packageId |
|---|---|---|---|---|---|---|---|
| 1000 | 3990179 | 1x1 | 17.12 | seasonal-currency-71 | 2025-12-17 | 2023-06-19 | 1000 |
| 1001 | 13195 | 2x1 | 17.41 | regional-currency-72 | 2022-05-01 | 2024-11-03 | 1001 |
| 1002 | 89419 | Observer | 30.51 | legacy-currency-73 | 2023-10-12 | 2025-04-14 | 1002 |
| 1003 | 6926379 | Secretary | 12.87 | compact-currency-74 | 2024-03-23 | 2022-09-25 | 1003 |

The HuntingRate table records the financial terms attached to individual packages. Each row captures a rate identifier, a rate type that distinguishes between formats such as 1x1, 2x1, Observer, and Secretary arrangements, and a daily fee expressed in a specific currency. Validity windows defined by validFrom and validTo dates ensure that pricing remains current. The packageId column anchors each rate to its parent package. For example, rate 3990179 of type 1x1 carries a daily fee of 17.12 in seasonal-currency-71 and was valid from 2025-12-17 through 2023-06-19 for package 1000. The rate 13195 of type 2x1 at 17.41 per day in regional-currency-72 applies to package 1001, while the Observer rate 89419 at 30.51 per day in legacy-currency-73 is tied to package 1002. The Secretary rate 6926379, the lowest at 12.87 per day in compact-currency-74, belongs to package 1003.

**Table `HuntingPackage`**

| packageId | packageName | totalPrice | currency | durationNights | durationDays | status | accommodationId |
|---|---|---|---|---|---|---|---|
| 1000 | Legacy Standard D | 43.48 | seasonal-currency-71 | 22 | 38 | available | 1 |
| 1001 | Regional Framework | 25.36 | regional-currency-72 | 32 | 49 | booked | 2 |
| 1002 | Seasonal Protocol | 16.11 | legacy-currency-73 | 42 | 60 | cancelled | 3 |
| 1003 | Integrated Programme A | 14.31 | compact-currency-74 | 52 | 71 | available | 4 |

A HuntingPackage represents the complete offering presented to a client. The packageId serves as the primary key, while packageName provides a human-readable label such as Legacy Standard D, Regional Framework, Seasonal Protocol, or Integrated Programme A. The totalPrice field captures the aggregate cost, and the currency field specifies the monetary unit. Duration is expressed in two dimensions: durationNights for the overnight stay and durationDays for the total span of the operation. The status field tracks the booking state, taking values such as available, booked, or cancelled. Each package references an accommodation through accommodationId. Package 1000, Legacy Standard D, carries a total price of 43.48, spans 22 nights and 38 days, is currently available, and is linked to accommodation 1. Package 1001, Regional Framework, costs 25.36, runs for 32 nights and 49 days, has a booked status, and connects to accommodation 2. Package 1002, Seasonal Protocol, is the least expensive at 16.11, extends over 42 nights and 60 days, carries a cancelled status, and references accommodation 3. Package 1003, Integrated Programme A, totals 14.31, covers 52 nights and 71 days, is available, and maps to accommodation 4.

**Table `HuntingService`**

| serviceId | serviceName | serviceType | unitPrice | unitType | quantity | packageId | licenseId |
|---|---|---|---|---|---|---|---|
| 1 | Distributed Initiative | Shooting | 5,692 | per_day | 9 | 1000 | 1 |
| 2 | Adaptive Model D | Transport | 45,650 | per_box | 8 | 1001 | 2 |
| 3 | Primary Cluster | Staffing | 2,705 | flat_fee | 0 | 1002 | 3 |
| 4 | Composite Review | Administrative | 211.07 | per_day | 12 | 1003 | 4 |

HuntingService captures the individual services delivered as part of a package. Each service has a serviceId, a descriptive name, and a serviceType that categorizes the nature of the work. The service types observed include Shooting, Transport, Staffing, and Administrative. Pricing is captured through unitPrice and unitType, where unitType can be per_day, per_box, or flat_fee. The quantity field indicates how many units are consumed. The packageId links the service to its parent package, and licenseId associates it with the required hunting license. Service 1, Distributed Initiative, is a Shooting service priced at 5,692 per day with a quantity of 9, attached to package 1000 and license 1. Service 2, Adaptive Model D, is a Transport service at 45,650 per box with quantity 8, linked to package 1001 and license 2. Service 3, Primary Cluster, is a Staffing service billed as a flat_fee of 2,705 with zero quantity, connected to package 1002 and license 3. Service 4, Composite Review, is an Administrative service at 211.07 per day with quantity 12, associated with package 1003 and license 4.

**Table `HuntingLicense`**

| id | licenseId | licenseType | issuingAuthority | feeAmount | issueDate | expiryDate | status |
|---|---|---|---|---|---|---|---|
| 1 | account_pymes_296 | regional-license-78 | extended-issuing-33 | 38.08 | 2023-02-01 | 2023-10-24 | pending |
| 2 | 1250199 | legacy-license-79 | integrated-issuing-34 | 18.47 | 2024-07-12 | 2024-03-08 | issued |
| 3 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | compact-license-80 | seasonal-issuing-35 | 38.08 | 2025-12-23 | 2025-08-19 | expired |
| 4 | 605958 | composite-license-81 | regional-issuing-36 | 26.25 | 2022-05-07 | 2022-01-03 | pending |

HuntingLicense records the regulatory permits required for operations. The id column is the primary key, while licenseId provides a secondary identifier that may take various formats, including alphanumeric strings and UUIDs. The licenseType field classifies the permit, with types such as regional-license-78, legacy-license-79, compact-license-80, and composite-license-81. The issuingAuthority identifies the regulatory body, feeAmount captures the permit cost, and issueDate and expiryDate define the validity period. The status field reflects the current state: pending, issued, or expired. License 1, identified as account_pymes_296, is a regional-license-78 issued by extended-issuing-33 for 38.08, valid from 2023-02-01 to 2023-10-24, with a pending status. License 2, 1250199, is a legacy-license-79 from integrated-issuing-34 at 18.47, issued 2024-07-12 and expiring 2024-03-08, with an issued status. License 3, ChIJm7V_gxFu5kcRAbqaOJHQUy0, is a compact-license-80 from seasonal-issuing-35 at 38.08, valid from 2025-12-23 to 2025-08-19, marked expired. License 4, 605958, is a composite-license-81 from regional-issuing-36 at 26.25, issued 2022-05-07 and expiring 2022-01-03, with a pending status.

**Table `TrophyFee`**

| id | feeId | scoringRange | surchargeAmount | currency | appliesToTrophy | serviceId |
|---|---|---|---|---|---|---|
| 1 | 10966225 | SCI_Bronze | 4.15 | seasonal-currency-71 | adaptive-applies-29 | 1 |
| 2 | c7474e2c-8fcc-11eb-924d-9cd76263cbd0 | SCI_Gold | 763.46 | regional-currency-72 | distributed-applies-30 | 2 |
| 3 | Penangguhan | SCI_Bronze | 8.17 | legacy-currency-73 | baseline-applies-31 | 3 |
| 4 | 11856350 | SCI_Gold | 0.02 | compact-currency-74 | pilot-applies-32 | 4 |

TrophyFee captures additional surcharges applied when a hunter's trophy meets specific scoring criteria. The id column is the primary key, and feeId provides a secondary identifier. The scoringRange field indicates the classification tier, with values such as SCI_Bronze and SCI_Gold. The surchargeAmount records the additional cost, and currency specifies the monetary unit. The appliesToTrophy field describes the trophy characteristic that triggers the surcharge, with values like adaptive-applies-29, distributed-applies-30, baseline-applies-31, and pilot-applies-32. The serviceId column links the surcharge to the relevant service. Trophy fee 10966225 applies to an SCI_Bronze scoring range with a surcharge of 4.15 in seasonal-currency-71 for adaptive-applies-29 trophies, attached to service 1. Fee c7474e2c-8fcc-11eb-924d-9cd76263cbd0 covers SCI_Gold trophies at 763.46 in regional-currency-72 for distributed-applies-30, linked to service 2. Fee Penangguhan addresses SCI_Bronze trophies at 8.17 in legacy-currency-73 for baseline-applies-31, connected to service 3. Fee 11856350 applies to SCI_Gold trophies at 0.02 in compact-currency-74 for pilot-applies-32, associated with service 4.

**Table `Accommodation`**

| id | accommodationId | accommodationType | location | nightsIncluded | mealPlan | packageId |
|---|---|---|---|---|---|---|
| 1 | 4277036 | Hotel | extended-location-99 | 16 | Full | 1000 |
| 2 | 5917290 | Lodge | integrated-location-100 | 26 | Half | 1001 |
| 3 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | Cabin | seasonal-location-101 | 36 | None | 1002 |
| 4 | 1186097 | Hotel | regional-location-102 | 46 | Full | 1003 |

Accommodation stores the lodging details associated with each package. The id column is the primary key, and accommodationId provides a secondary identifier. The accommodationType field classifies the lodging as Hotel, Lodge, or Cabin. The location field names the site, and nightsIncluded specifies how many nights are covered by the package. The mealPlan field indicates the dining arrangement, taking values such as Full, Half, or None. The packageId links the accommodation to its parent package. Accommodation 4277036 is a Hotel at extended-location-99, including 16 nights with a Full meal plan, for package 1000. Accommodation 5917290 is a Lodge at integrated-location-100, including 26 nights with a Half meal plan, for package 1001. Accommodation 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 is a Cabin at seasonal-location-101, including 36 nights with no meal plan, for package 1002. Accommodation 1186097 is a Hotel at regional-location-102, including 46 nights with a Full meal plan, for package 1003.

**Table `HuntingPackageHuntingService`**

| packageId | serviceId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The HuntingPackageHuntingService table serves as the junction record that explicitly links packages to their constituent services. This table ensures that the many-to-many relationship between packages and services is captured with precision, allowing a single service to appear across multiple packages and a single package to contain multiple services. Each row in this table represents one association, carrying the foreign keys that connect the two parent tables.

**Table `HuntingLicenseHuntingService`**

| licenseId | serviceId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The HuntingLicenseHuntingService table records the relationship between hunting licenses and the services that require them. This junction table ensures that the dependency between regulatory permits and operational services is explicitly tracked. Each row represents one license-service pairing, enabling the system to verify that every service has the appropriate authorization.

**View `hunting_rate_hunting_package_view`**

```sql
CREATE VIEW hunting_rate_hunting_package_view AS
SELECT a.id, a.rateId, a.rateType, a.dailyFee, b.packageId AS package_packageId, b.packageName AS package_packageName, b.totalPrice AS package_totalPrice
FROM HuntingRate a JOIN HuntingPackage b ON a.packageId = b.packageId;
```

| id | rateId | rateType | dailyFee | package_packageId | package_packageName | package_totalPrice |
|---|---|---|---|---|---|---|
| 1000 | 3990179 | 1x1 | 17.12 | 1000 | Legacy Standard D | 43.48 |
| 1001 | 13195 | 2x1 | 17.41 | 1001 | Regional Framework | 25.36 |
| 1002 | 89419 | Observer | 30.51 | 1002 | Seasonal Protocol | 16.11 |
| 1003 | 6926379 | Secretary | 12.87 | 1003 | Integrated Programme A | 14.31 |

The hunting_rate_hunting_package_view joins HuntingRate with HuntingPackage to present pricing alongside the package details it belongs to. This view answers the question of what a client pays for each component of a package. In the joined result, rate 3990179 appears alongside package 1000 (Legacy Standard D), showing a daily fee of 17.12 in seasonal-currency-71 for a package priced at 43.48 total. Rate 13195 pairs with package 1001 (Regional Framework), displaying a daily fee of 17.41 in regional-currency-72 against a total price of 25.36. Rate 89419 (Observer type) aligns with package 1002 (Seasonal Protocol), showing 30.51 per day in legacy-currency-73 against a total of 16.11. Rate 6926379 (Secretary type) joins with package 1003 (Integrated Programme A), presenting 12.87 per day in compact-currency-74 against a total of 14.31. This view allows operators to compare the per-day rate component against the overall package cost and identify which rate types command premium pricing.

**View `hunting_package_hunting_service_detail_view`**

```sql
CREATE VIEW hunting_package_hunting_service_detail_view AS
SELECT a.packageId, a.packageName, a.totalPrice, b.serviceId AS service_serviceId, b.serviceName AS service_serviceName, b.serviceType AS service_serviceType
FROM HuntingPackage a
  JOIN HuntingPackageHuntingService j ON j.packageId = a.packageId
  JOIN HuntingService b ON b.serviceId = j.serviceId;
```

| packageId | packageName | totalPrice | service_serviceId | service_serviceName | service_serviceType |
|---|---|---|---|---|---|
| 1000 | Legacy Standard D | 43.48 | 1 | Distributed Initiative | Shooting |
| 1000 | Legacy Standard D | 43.48 | 2 | Adaptive Model D | Transport |
| 1001 | Regional Framework | 25.36 | 2 | Adaptive Model D | Transport |
| 1001 | Regional Framework | 25.36 | 3 | Primary Cluster | Staffing |
| 1002 | Seasonal Protocol | 16.11 | 3 | Primary Cluster | Staffing |
| 1002 | Seasonal Protocol | 16.11 | 4 | Composite Review | Administrative |
| 1003 | Integrated Programme A | 14.31 | 4 | Composite Review | Administrative |
| 1003 | Integrated Programme A | 14.31 | 1 | Distributed Initiative | Shooting |

The hunting_package_hunting_service_detail_view combines HuntingPackage with HuntingService to reveal which services are included in each package and their cost structure. This view answers the question of what operational services a package delivers and at what unit cost. The joined result shows package 1000 (Legacy Standard D) containing service 1 (Distributed Initiative, a Shooting service at 5,692 per day with quantity 9). Package 1001 (Regional Framework) contains service 2 (Adaptive Model D, a Transport service at 45,650 per box with quantity 8). Package 1002 (Seasonal Protocol) contains service 3 (Primary Cluster, a Staffing service at 2,705 flat_fee with quantity 0). Package 1003 (Integrated Programme A) contains service 4 (Composite Review, an Administrative service at 211.07 per day with quantity 12). This view is essential for understanding the service composition of each package and for calculating the total service cost by multiplying unitPrice by quantity where applicable.

**View `hunting_package_accommodation_view`**

```sql
CREATE VIEW hunting_package_accommodation_view AS
SELECT a.packageId, a.packageName, a.totalPrice, a.currency, b.id AS accommodation_id, b.accommodationId AS accommodation_accommodationId, b.accommodationType AS accommodation_accommodationType
FROM HuntingPackage a JOIN Accommodation b ON a.accommodationId = b.id;
```

| packageId | packageName | totalPrice | currency | accommodation_id | accommodation_accommodationId | accommodation_accommodationType |
|---|---|---|---|---|---|---|
| 1000 | Legacy Standard D | 43.48 | seasonal-currency-71 | 1 | 4277036 | Hotel |
| 1001 | Regional Framework | 25.36 | regional-currency-72 | 2 | 5917290 | Lodge |
| 1002 | Seasonal Protocol | 16.11 | legacy-currency-73 | 3 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | Cabin |
| 1003 | Integrated Programme A | 14.31 | compact-currency-74 | 4 | 1186097 | Hotel |

The hunting_package_accommodation_view joins HuntingPackage with Accommodation to present the lodging arrangements that accompany each package. This view answers the question of where a client stays and what is included in the accommodation. The joined result shows package 1000 (Legacy Standard D) paired with accommodation 4277036, a Hotel at extended-location-99 with 16 nights included and a Full meal plan. Package 1001 (Regional Framework) pairs with accommodation 5917290, a Lodge at integrated-location-100 with 26 nights included and a Half meal plan. Package 1002 (Seasonal Protocol) pairs with accommodation 9229485c-9bad-11eb-a8a2-19ed5c03f8d3, a Cabin at seasonal-location-101 with 36 nights included and no meal plan. Package 1003 (Integrated Programme A) pairs with accommodation 1186097, a Hotel at regional-location-102 with 46 nights included and a Full meal plan. This view enables operators to verify that the accommodation details match the package duration and to communicate lodging expectations to clients.

**View `hunting_service_hunting_package_view`**

```sql
CREATE VIEW hunting_service_hunting_package_view AS
SELECT a.serviceId, a.serviceName, a.serviceType, a.unitPrice, b.packageId AS package_packageId, b.packageName AS package_packageName, b.totalPrice AS package_totalPrice
FROM HuntingService a JOIN HuntingPackage b ON a.packageId = b.packageId;
```

| serviceId | serviceName | serviceType | unitPrice | package_packageId | package_packageName | package_totalPrice |
|---|---|---|---|---|---|---|
| 1 | Distributed Initiative | Shooting | 5,692 | 1000 | Legacy Standard D | 43.48 |
| 2 | Adaptive Model D | Transport | 45,650 | 1001 | Regional Framework | 25.36 |
| 3 | Primary Cluster | Staffing | 2,705 | 1002 | Seasonal Protocol | 16.11 |
| 4 | Composite Review | Administrative | 211.07 | 1003 | Integrated Programme A | 14.31 |

The hunting_service_hunting_package_view joins HuntingService with HuntingPackage to present each service alongside its parent package details. This view answers the question of which package a service belongs to and provides the package context for service-level analysis. The joined result shows service 1 (Distributed Initiative, Shooting type at 5,692 per day) belonging to package 1000 (Legacy Standard D, available status, 43.48 total). Service 2 (Adaptive Model D, Transport type at 45,650 per box) belongs to package 1001 (Regional Framework, booked status, 25.36 total). Service 3 (Primary Cluster, Staffing type at 2,705 flat_fee) belongs to package 1002 (Seasonal Protocol, cancelled status, 16.11 total). Service 4 (Composite Review, Administrative type at 211.07 per day) belongs to package 1003 (Integrated Programme A, available status, 14.31 total). This view is particularly useful for service-level reporting and for understanding how service costs relate to overall package pricing.

**View `hunting_service_hunting_license_view`**

```sql
CREATE VIEW hunting_service_hunting_license_view AS
SELECT a.serviceId, a.serviceName, a.serviceType, a.unitPrice, b.id AS license_id, b.licenseId AS license_licenseId, b.licenseType AS license_licenseType
FROM HuntingService a JOIN HuntingLicense b ON a.licenseId = b.id;
```

| serviceId | serviceName | serviceType | unitPrice | license_id | license_licenseId | license_licenseType |
|---|---|---|---|---|---|---|
| 1 | Distributed Initiative | Shooting | 5,692 | 1 | account_pymes_296 | regional-license-78 |
| 2 | Adaptive Model D | Transport | 45,650 | 2 | 1250199 | legacy-license-79 |
| 3 | Primary Cluster | Staffing | 2,705 | 3 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | compact-license-80 |
| 4 | Composite Review | Administrative | 211.07 | 4 | 605958 | composite-license-81 |

The hunting_service_hunting_license_view joins HuntingService with HuntingLicense to reveal the regulatory authorization associated with each service. This view answers the question of which license authorizes a given service and provides the permit details needed for compliance verification. The joined result shows service 1 (Distributed Initiative) linked to license 1 (account_pymes_296, regional-license-78, issued by extended-issuing-33, fee 38.08, status pending). Service 2 (Adaptive Model D) links to license 2 (1250199, legacy-license-79, issued by integrated-issuing-34, fee 18.47, status issued). Service 3 (Primary Cluster) links to license 3 (ChIJm7V_gxFu5kcRAbqaOJHQUy0, compact-license-80, issued by seasonal-issuing-35, fee 38.08, status expired). Service 4 (Composite Review) links to license 4 (605958, composite-license-81, issued by regional-issuing-36, fee 26.25, status pending). This view is critical for compliance audits, as it surfaces any services operating under expired or pending licenses.

**View `hunting_license_hunting_service_detail_view`**

```sql
CREATE VIEW hunting_license_hunting_service_detail_view AS
SELECT a.id, a.licenseId, a.licenseType, b.serviceId AS service_serviceId, b.serviceName AS service_serviceName, b.serviceType AS service_serviceType
FROM HuntingLicense a
  JOIN HuntingLicenseHuntingService j ON j.licenseId = a.id
  JOIN HuntingService b ON b.serviceId = j.serviceId;
```

| id | licenseId | licenseType | service_serviceId | service_serviceName | service_serviceType |
|---|---|---|---|---|---|
| 1 | account_pymes_296 | regional-license-78 | 1 | Distributed Initiative | Shooting |
| 1 | account_pymes_296 | regional-license-78 | 2 | Adaptive Model D | Transport |
| 2 | 1250199 | legacy-license-79 | 2 | Adaptive Model D | Transport |
| 2 | 1250199 | legacy-license-79 | 3 | Primary Cluster | Staffing |
| 3 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | compact-license-80 | 3 | Primary Cluster | Staffing |
| 3 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | compact-license-80 | 4 | Composite Review | Administrative |
| 4 | 605958 | composite-license-81 | 4 | Composite Review | Administrative |
| 4 | 605958 | composite-license-81 | 1 | Distributed Initiative | Shooting |

The hunting_license_hunting_service_detail_view joins HuntingLicense with HuntingService to present each license alongside the services it authorizes. This view answers the question of which services are covered by a specific license and provides the service context for license management. The joined result shows license 1 (account_pymes_296, regional-license-78, pending status) authorizing service 1 (Distributed Initiative, Shooting type, 5,692 per day). License 2 (1250199, legacy-license-79, issued status) authorizes service 2 (Adaptive Model D, Transport type, 45,650 per box). License 3 (ChIJm7V_gxFu5kcRAbqaOJHQUy0, compact-license-80, expired status) authorizes service 3 (Primary Cluster, Staffing type, 2,705 flat_fee). License 4 (605958, composite-license-81, pending status) authorizes service 4 (Composite Review, Administrative type, 211.07 per day). This view supports license lifecycle management by showing the operational impact of each license's status.

**View `trophy_fee_hunting_service_view`**

```sql
CREATE VIEW trophy_fee_hunting_service_view AS
SELECT a.id, a.feeId, a.scoringRange, a.surchargeAmount, b.serviceId AS service_serviceId, b.serviceName AS service_serviceName, b.serviceType AS service_serviceType
FROM TrophyFee a JOIN HuntingService b ON a.serviceId = b.serviceId;
```

| id | feeId | scoringRange | surchargeAmount | service_serviceId | service_serviceName | service_serviceType |
|---|---|---|---|---|---|---|
| 1 | 10966225 | SCI_Bronze | 4.15 | 1 | Distributed Initiative | Shooting |
| 2 | c7474e2c-8fcc-11eb-924d-9cd76263cbd0 | SCI_Gold | 763.46 | 2 | Adaptive Model D | Transport |
| 3 | Penangguhan | SCI_Bronze | 8.17 | 3 | Primary Cluster | Staffing |
| 4 | 11856350 | SCI_Gold | 0.02 | 4 | Composite Review | Administrative |

The trophy_fee_hunting_service_view joins TrophyFee with HuntingService to present the surcharge structure applied to each service. This view answers the question of what additional costs apply when trophies meet specific scoring criteria. The joined result shows fee 10966225 (SCI_Bronze, surcharge 4.15 in seasonal-currency-71 for adaptive-applies-29 trophies) applied to service 1 (Distributed Initiative). Fee c7474e2c-8fcc-11eb-924d-9cd76263cbd0 (SCI_Gold, surcharge 763.46 in regional-currency-72 for distributed-applies-30 trophies) applies to service 2 (Adaptive Model D). Fee Penangguhan (SCI_Bronze, surcharge 8.17 in legacy-currency-73 for baseline-applies-31 trophies) applies to service 3 (Primary Cluster). Fee 11856350 (SCI_Gold, surcharge 0.02 in compact-currency-74 for pilot-applies-32 trophies) applies to service 4 (Composite Review). This view enables operators to communicate potential trophy surcharges to clients and to calculate total revenue including variable trophy fees.

**View `accommodation_hunting_package_view`**

```sql
CREATE VIEW accommodation_hunting_package_view AS
SELECT a.id, a.accommodationId, a.accommodationType, a.location, b.packageId AS package_packageId, b.packageName AS package_packageName, b.totalPrice AS package_totalPrice
FROM Accommodation a JOIN HuntingPackage b ON a.packageId = b.packageId;
```

| id | accommodationId | accommodationType | location | package_packageId | package_packageName | package_totalPrice |
|---|---|---|---|---|---|---|
| 1 | 4277036 | Hotel | extended-location-99 | 1000 | Legacy Standard D | 43.48 |
| 2 | 5917290 | Lodge | integrated-location-100 | 1001 | Regional Framework | 25.36 |
| 3 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | Cabin | seasonal-location-101 | 1002 | Seasonal Protocol | 16.11 |
| 4 | 1186097 | Hotel | regional-location-102 | 1003 | Integrated Programme A | 14.31 |

The accommodation_hunting_package_view joins Accommodation with HuntingPackage to present the lodging details alongside the package they serve. This view answers the question of what accommodation a package includes and provides the package context for lodging management. The joined result shows accommodation 4277036 (Hotel at extended-location-99, 16 nights, Full meal plan) serving package 1000 (Legacy Standard D, available, 43.48 total, 22 nights duration). Accommodation 5917290 (Lodge at integrated-location-100, 26 nights, Half meal plan) serves package 1001 (Regional Framework, booked, 25.36 total, 32 nights duration). Accommodation 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 (Cabin at seasonal-location-101, 36 nights, no meal plan) serves package 1002 (Seasonal Protocol, cancelled, 16.11 total, 42 nights duration). Accommodation 1186097 (Hotel at regional-location-102, 46 nights, Full meal plan) serves package 1003 (Integrated Programme A, available, 14.31 total, 52 nights duration). This view is essential for verifying that the nights included in accommodation align with the package duration and for managing lodging reservations.

The hunting operations data model captures a complete picture of how packages, services, accommodations, licenses, and pricing interrelate. Each base table stores the atomic facts of the operation, while the junction tables and views provide the joined perspectives that practitioners need for day-to-day management. The rate and package tables establish the financial framework, the service and license tables ensure operational compliance, the trophy fee table captures variable revenue, and the accommodation table grounds the experience in physical lodging. Together, these structures support the full lifecycle of a hunting operation from booking through completion, providing the data foundation for pricing decisions, compliance verification, and client communication.